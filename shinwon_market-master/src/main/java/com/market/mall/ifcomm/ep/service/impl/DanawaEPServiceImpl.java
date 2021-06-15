/**
 * @PackageName: com.market.mall.ifcomm.ep.service.impl
 * @FileName : DanawaEPServiceImpl.java
 * @Date : 2016. 04. 11.
 * @프로그램 설명 : 다나와 EP 처리하는 Service implement Class
 * @author yong
 */

package com.market.mall.ifcomm.ep.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPOutputStream;

import javax.annotation.Resource;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.FileFtpUpload;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.ep.service.DanawaEPService;
import com.market.util.CategoryUtil;
import com.market.util.model.CategoryIndexName;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("danawaEPService")
//public class DanawaEPServiceImpl extends AbstractEPServiceImpl {
public class DanawaEPServiceImpl implements DanawaEPService {

	private Logger logger = LoggerFactory.getLogger(DanawaEPServiceImpl.class);

	private String FILE_NAME_ALL = "danawa_all";
	private String FILE_NAME_UPDATE = "danawa_update";
	private String FILE_NAME_INSERT = "danawa_insert";
	private String FILE_NAME_DELETE = "danawa_delete";
	private String CHN_DTL_CD = "A072"; // 다나와
	private String PRD_CHN_DPT2 = "72"; // 다나와
	private boolean GZIP_FLAG = false;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "defaultDAO")
	private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : makeAllProductEP
	 * 2. ClassName  : DanawaEPServiceImpl.java
	 * 3. Comment    : 다나와 EP 파일 만들기 
	 * 4. 작성자       : yong
	 * 5. 작성일       : 2016. 04. 11.
	 * </pre>
	 */

	@SuppressWarnings("unchecked")
	public void makeDanawaAllProductEP() {

		logger.debug("--Danawa-makeAllProductEP Start--");

		OutputStreamWriter out = null;

		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();

			commandMap.put("CHN_DTL_CD", CHN_DTL_CD);
			commandMap.put("PRD_CHN_DPT2", PRD_CHN_DPT2);
			
			List<Map<String, Object>> productInfoList = defaultDAO.selectList(
					"EnginePage.selectProductAll", commandMap);

			out = getOutputStreamWriter(FILE_NAME_ALL, GZIP_FLAG);

			if (productInfoList == null || productInfoList.size() == 0) {
				logger.debug("--Danawa-productInfoList.size() = 0");
				logger.debug("--Danawa-makeAllProductEP End--");
				return;
			}

			logger.debug("--productInfoList.size()={}", productInfoList.size());

			/*
			StringBuffer headerSbf = new StringBuffer(
					"상품ID^카테고리^상품명^제조사^이미지URL^상품URL^가격^적립금^할인쿠폰^무이자할부^사은품^모델명^추가정보^출시일^배송료^카드프로모션명^카드프로모션가^쿠폰다운로드필요여부^모바일상품가격^차등배송비여부^차등배송비내용^별도설치유무^재고유무")
					.append("\r\n");
					
			out.write(headerSbf.toString());
			*/
			
			
			StringBuffer headerSbf = new StringBuffer();
			

			for (Map<String, Object> productInfo : productInfoList) {

				StringBuffer sbf = new StringBuffer();

				String mapid = (String) productInfo.get("MAPID");

				int price = ((BigDecimal) (productInfo.get("PRICE")))
						.intValue();

				sbf.append(mapid);

				String categoryIndexNameString = (String) productInfo
						.get("CATEGORY");

				List<CategoryIndexName> categoryIndexNameList = null;
				
				// PC Category
				if (categoryIndexNameString != null
						|| !"".equals(categoryIndexNameString)) {
					categoryIndexNameList = CategoryUtil
							.getCategoryIndexNameList(categoryIndexNameString);
				} else { // Mobile Category
					commandMap.put("PRD_CTG_ENV", "M");
					categoryIndexNameList = defaultDAO.selectList(
							"ShoplinkerProduct.selectProductCategory",
							commandMap);
				}

				int level = 1;

				sbf.append("^");

				for (CategoryIndexName categoryIndexName : categoryIndexNameList) {

					if (level > 1) {
						sbf.append("|");
					}

					sbf.append(categoryIndexName.getName());

					level++;
				}	
				
				
				String pNmaePre = "";
				pNmaePre = "[";
				if(!"".equals(productInfo.get("BRAND"))){
					pNmaePre += productInfo.get("BRAND") + "/";
				}
				pNmaePre += productInfo.get("MODEL");
				pNmaePre += "]";			
				
				sbf.append("^").append(pNmaePre + productInfo.get("PNAME"));
				
				sbf.append("^");
				if (productInfo.get("maker") != null) {
					sbf.append(productInfo.get("MAKER"));
				}
				
				/*
				sbf.append("^").append("http://")
				.append(propertiesService.getString("cdn.domain"))
				.append(productInfo.get("IGURL"));
				 */
				
				sbf.append("^").append("http://")
				.append("bo.marketplanta.epasscni.com/nas/cdn/")
				.append(productInfo.get("IGURL"));
				
				// TODO 채널구분?
				/*
				String pgurl = new StringBuffer(
						propertiesService.getString("front.domain"))
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).toString();
				*/
				
				String pgurl = new StringBuffer(
						"http://pc.marketplanta.epasscni.com")
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).append("&chlCode=" + CHN_DTL_CD).toString();
				
				
				
				sbf.append("^").append(pgurl);
				
				sbf.append("^").append(price);

				int milgAmt = ((BigDecimal) (productInfo.get("MILGAMT")))
						.intValue();
				int addonMilgAmt = ((BigDecimal) (productInfo
						.get("ADDONMILGAMT"))).intValue();

				int point = milgAmt + addonMilgAmt;

				sbf.append("^").append(point);//적립금
				sbf.append("^"); //쿠폰

				commandMap.put("PRD_CHN_PRC", price);
				List<String> pcardList = defaultDAO.selectList(
						"EnginePage.selectEnuriPcardList", commandMap);

				StringBuffer pcardSbf = new StringBuffer();

				if (pcardList != null && pcardList.size() > 0) {

					int pcardCnt = 0;

					for (String pcardString : pcardList) {

						if (pcardCnt > 0)
							pcardSbf.append("/");

						pcardSbf.append(pcardString);
						pcardCnt++;
					}
				}
				sbf.append("^").append(pcardSbf); // 무이자할부
				sbf.append("^"); //사은품
				sbf.append("^").append(productInfo.get("MODEL"));
				
				sbf.append("^"); //추가정보
				sbf.append("^"); //출시일				
				
				sbf.append("^").append(productInfo.get("DELIV"));
				sbf.append("^").append("삼성7카드");
				
				int temp7CardPrice = 0;

				if (price >= 1000000) {
					temp7CardPrice = 50000 + 20000;
				} else if (price >= 500000 && price < 1000000) {
					temp7CardPrice = (int) Math.round(price * 0.05)
							+ (int) Math.round(price * 0.02);
				} else {
					temp7CardPrice = (int) Math.round(price * 0.05);
				}

				sbf.append("^").append(price - temp7CardPrice);

				//^쿠폰다운로드필요여부^모바일상품가격^차등배송비여부^차등배송비내용^별도설치유무
				sbf.append("^^^^^");
				sbf.append("^").append("Y");//재고유무
				
				sbf.append("\r\n");

				out.write(sbf.toString());

			}// for-end productInfoList
			
			logger.debug("--Danawa-makeAllProductEP End--");

		} catch (Exception e) {
			logger.error(ExceptionUtils.getStackTrace(e));
		} finally {
			try {
				if (out != null)
					out.close();
			} catch (Exception e) {
				logger.error(ExceptionUtils.getStackTrace(e));
			}
		}
	}
	

	/**
	 * <pre>
	 * 1. MethodName : makeSomeProductEP
	 * 2. ClassName  : DanawaEPServiceImpl.java
	 * 3. Comment    : 요약EP 파일 만들기 
	 * 4. 작성자       : freelsj
	 * 5. 작성일       : 2015. 12. 28.
	 * </pre>
	 *
	 */
	@SuppressWarnings("unchecked")
	public void makeDanawaBriefProductEP() {

		logger.debug("--Danawa-makeSomeProductEP Start--");

		OutputStreamWriter updateOut = null;
		OutputStreamWriter insertOut = null;
		OutputStreamWriter deleteOut = null;

		try {
			Map<String, Object> commandMap = new HashMap<String, Object>();
			commandMap.put("CHN_DTL_CD", CHN_DTL_CD);

			Map<String, Object> someTimeMap = defaultDAO.select(
					"EnginePage.selectSomeTime", commandMap);

			someTimeMap.put("CHN_DTL_CD", CHN_DTL_CD);
			someTimeMap.put("PRD_CHN_DPT2", PRD_CHN_DPT2);

			// test - TODO REMOVE
			/*
			someTimeMap.put("ST_DATE", "20151217000000");
			someTimeMap.put("ED_DATE", "20151229140000");
			*/
			
			logger.debug("--some stdTime={}, {}", someTimeMap.get("ST_DATE"),
					someTimeMap.get("ED_DATE"));

			List<Map<String, Object>> productInfoList = defaultDAO.selectList(
					"EnginePage.selectProductSome", someTimeMap);

			updateOut = getOutputStreamWriter(FILE_NAME_UPDATE, GZIP_FLAG);
			insertOut = getOutputStreamWriter(FILE_NAME_INSERT, GZIP_FLAG);
			deleteOut = getOutputStreamWriter(FILE_NAME_DELETE, GZIP_FLAG);

			
			/*
			StringBuffer headerSbf = new StringBuffer(
					"상품ID^카테고리^상품명^제조사^이미지URL^상품URL^가격^적립금^할인쿠폰^무이자할부^사은품^모델명^추가정보^출시일^배송료^카드프로모션명^카드프로모션가^쿠폰다운로드필요여부^모바일상품가격^차등배송비여부^차등배송비내용^별도설치유무^재고유무")
					.append("\r\n");
			*/
			
			StringBuffer headerSbf = new StringBuffer();
			
//			updateOut.write(headerSbf.toString());
//			insertOut.write(headerSbf.toString());

			/*
			StringBuffer deleteHeaderSbf = new StringBuffer("상품ID")
					.append("\r\n");
			deleteOut.write(deleteHeaderSbf.toString());
			*/
			
			StringBuffer deleteHeaderSbf = new StringBuffer();

			if (productInfoList == null || productInfoList.size() == 0) {
				logger.debug("--Danawa-productInfoList.size() = 0");
				logger.debug("--Danawa-makeSomeProductEP End--");
				return;
			}

			logger.debug("--productInfoList.size()={}", productInfoList.size());

			for (Map<String, Object> productInfo : productInfoList) {

				StringBuffer sbf = new StringBuffer();

				String mapid = (String) productInfo.get("MAPID");

				String insertYn = (String) productInfo.get("INSERT_YN");
				String deleteYn = (String) productInfo.get("DELETE_YN");

				String classString = "U";

				if ("Y".equals(insertYn)) {

					if ("Y".equals(deleteYn)) {
						continue;
					}
					classString = "I";
				} else {
					if ("Y".equals(deleteYn)) {
						sbf.append(mapid).append("\r\n");
						deleteOut.write(sbf.toString());
						continue;
					}
				}

				int price = ((BigDecimal) (productInfo.get("PRICE")))
						.intValue();

				sbf.append(mapid);

				String categoryIndexNameString = (String) productInfo
						.get("CATEGORY");

				List<CategoryIndexName> categoryIndexNameList = null;
				
				// PC Category
				if (categoryIndexNameString != null
						|| !"".equals(categoryIndexNameString)) {
					categoryIndexNameList = CategoryUtil
							.getCategoryIndexNameList(categoryIndexNameString);
				} else { // Mobile Category
					commandMap.put("PRD_CTG_ENV", "M");
					categoryIndexNameList = defaultDAO.selectList(
							"ShoplinkerProduct.selectProductCategory",
							commandMap);
				}

				int level = 1;

				sbf.append("^");

				for (CategoryIndexName categoryIndexName : categoryIndexNameList) {

					if (level > 1) {
						sbf.append("|");
					}

					sbf.append(categoryIndexName.getName());

					level++;
				}
				
				
				String pNmaePre = "";
				pNmaePre = "[";
				if(!"".equals(productInfo.get("BRAND"))){
					pNmaePre += productInfo.get("BRAND") + "/";
				}
				pNmaePre += productInfo.get("MODEL");
				pNmaePre += "]";	
				
				sbf.append("^").append(pNmaePre + productInfo.get("PNAME"));
				
				sbf.append("^");
				if (productInfo.get("maker") != null) {
					sbf.append(productInfo.get("MAKER"));
				}
				
				/*
				sbf.append("^").append("http://")
				.append(propertiesService.getString("cdn.domain"))
				.append(productInfo.get("IGURL"));
				 */
				
				sbf.append("^").append("http://")
				.append("bo.marketplanta.epasscni.com/nas/cdn/")
				.append(productInfo.get("IGURL"));
				
				
				// TODO 채널구분?
				/*
				String pgurl = new StringBuffer(
						propertiesService.getString("front.domain"))
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).toString();
				*/

				
				String pgurl = new StringBuffer(
						"http://pc.marketplanta.epasscni.com")
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).append("&chlCode=" + CHN_DTL_CD).toString();
				
				sbf.append("^").append(pgurl);
				
				sbf.append("^").append(price);

				int milgAmt = ((BigDecimal) (productInfo.get("MILGAMT")))
						.intValue();
				int addonMilgAmt = ((BigDecimal) (productInfo
						.get("ADDONMILGAMT"))).intValue();

				int point = milgAmt + addonMilgAmt;

				sbf.append("^").append(point);//적립금
				sbf.append("^"); //쿠폰

				commandMap.put("PRD_CHN_PRC", price);
				List<String> pcardList = defaultDAO.selectList(
						"EnginePage.selectEnuriPcardList", commandMap);

				StringBuffer pcardSbf = new StringBuffer();

				if (pcardList != null && pcardList.size() > 0) {

					int pcardCnt = 0;

					for (String pcardString : pcardList) {

						if (pcardCnt > 0)
							pcardSbf.append("/");

						pcardSbf.append(pcardString);
						pcardCnt++;
					}
				}
				sbf.append("^").append(pcardSbf); // 무이자할부
				sbf.append("^"); //사은품
				sbf.append("^").append(productInfo.get("MODEL"));
				
				sbf.append("^"); //추가정보
				sbf.append("^"); //출시일				
				
				sbf.append("^").append(productInfo.get("DELIV"));
				sbf.append("^").append("삼성7카드");
				
				int temp7CardPrice = 0;

				if (price >= 1000000) {
					temp7CardPrice = 50000 + 20000;
				} else if (price >= 500000 && price < 1000000) {
					temp7CardPrice = (int) Math.round(price * 0.05)
							+ (int) Math.round(price * 0.02);
				} else {
					temp7CardPrice = (int) Math.round(price * 0.05);
				}

				sbf.append("^").append(price - temp7CardPrice);

				//^쿠폰다운로드필요여부^모바일상품가격^차등배송비여부^차등배송비내용^별도설치유무
				sbf.append("^^^^^");
				sbf.append("^").append("Y");//재고유무
				
				sbf.append("\r\n");				
				
				if ("U".equals(classString)) {
					updateOut.write(sbf.toString());
				} else {
					insertOut.write(sbf.toString());
				}

			}// for-end productInfoList

			logger.debug("--Danawa-makeSomeProductEP End--");

		} catch (Exception e) {
			logger.error(ExceptionUtils.getStackTrace(e));
		} finally {

			try {
				if (updateOut != null)
					updateOut.close();
			} catch (Exception e) {
				logger.error(ExceptionUtils.getStackTrace(e));
			}

			try {
				if (insertOut != null)
					insertOut.close();
			} catch (Exception e) {
				logger.error(ExceptionUtils.getStackTrace(e));
			}

			try {
				if (deleteOut != null)
					deleteOut.close();
			} catch (Exception e) {
				logger.error(ExceptionUtils.getStackTrace(e));
			}
		}

	}
	
	public OutputStreamWriter getOutputStreamWriter(String fileName, boolean gzipFlag)
			throws IOException {
		
		// TODO replace with property
//		String baseDir = propertiesService.getString("file.ep.path");
		String baseDir = "";
		
//		baseDir = propertiesService.getString("file.ep.path");
		
		baseDir = "/home/jeus/jeus2/jeus6/nas/ep/danawa";
		
		fileName = fileName + (gzipFlag == true ? ".txt.gz" : ".txt");
		
		File outFile = null;
		OutputStreamWriter out = null;
		outFile = new File(baseDir, fileName);

		if (gzipFlag) {

			FileOutputStream fileStream = new FileOutputStream(outFile);
			GZIPOutputStream gzipStream = new GZIPOutputStream(fileStream);
			out = new OutputStreamWriter(gzipStream, Charset.forName("EUC-KR")
					.newEncoder());
		} else {
			out = new OutputStreamWriter(new FileOutputStream(outFile), Charset
					.forName("EUC-KR").newEncoder());
		}

		return out;
	}

}
