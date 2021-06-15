/**
 * @PackageName: com.market.mall.ifcomm.ep.service.impl
 * @FileName : DaumEPServiceImpl.java
 * @Date : 2015. 12. 22.
 * @프로그램 설명 : Daum 쇼핑하우 EP 처리하는 Service implement Class
 * @author freelsj
 * 
 * yong 수정 - getOutputStreamWriter 공통 모듈화 필요
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
import com.epasscni.util.FileUpload;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.ep.service.DaumEPService;
import com.market.util.CategoryUtil;
import com.market.util.model.CategoryIndexName;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("daumEPService")
//public class DaumEPServiceImpl extends AbstractEPServiceImpl {
public class DaumEPServiceImpl implements DaumEPService {

	private Logger logger = LoggerFactory.getLogger(DaumEPServiceImpl.class);

	private String FILE_NAME_ALL = "daum_all";
	private String FILE_NAME_SOME = "daum_brief";
	private String CHN_DTL_CD = "A074"; //다음쇼핑하우
	private String PRD_CHN_DPT2 = "72"; //다음쇼핑하우
	private boolean GZIP_FLAG = false;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "defaultDAO")
	private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : makeAllProductEP
	 * 2. ClassName  : DaumEPServiceImpl.java
	 * 3. Comment    : 전체 EP 파일 만들기 
	 * 4. 작성자       : freelsj
	 * 5. 작성일       : 2015. 12. 22.
	 * </pre>
	 */

	@SuppressWarnings({ "unchecked", "static-access" })
	public void makeDaumAllProductEP() {

		logger.debug("--Daum-makeAllProductEP Start--");
		
//		EpCommon cpCom = new EpCommon();

		OutputStreamWriter out = null;

		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();

			commandMap.put("CHN_DTL_CD", CHN_DTL_CD);
			commandMap.put("PRD_CHN_DPT2", PRD_CHN_DPT2);
			
			List<Map<String, Object>> productInfoList = defaultDAO.selectList("EnginePage.selectProductAll", commandMap);
			
//			out = cpCom.getOutputStreamWriter(FILE_NAME_ALL, GZIP_FLAG);
			out = getOutputStreamWriter(FILE_NAME_ALL, GZIP_FLAG);
			
			if (productInfoList == null || productInfoList.size() == 0) {
				logger.debug("--Daum-productInfoList.size() = 0");
				logger.debug("--Daum-makeAllProductEP End--");
				return;
			}	
				
			logger.debug("--productInfoList.size()={}", productInfoList.size());

			StringBuffer toCntSbf = new StringBuffer("<<<tocnt>>>").append(
					productInfoList.size()).append("\n");
			out.write(toCntSbf.toString());

			for (Map<String, Object> productInfo : productInfoList) {

				StringBuffer sbf = new StringBuffer();

				String mapid = (String) productInfo.get("MAPID");

				int price = ((BigDecimal) (productInfo.get("PRICE")))
						.intValue();

				sbf.append("<<<begin>>>").append("\n").append("<<<mapid>>>")
						.append(mapid).append("\n").append("<<<price>>>")
						.append(price).append("\n").append("<<<pname>>>")
						.append(productInfo.get("PNAME")).append("\n");

				// TODO 채널구분?
				String pgurl = new StringBuffer(
						propertiesService.getString("front.domain"))
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).toString();
				sbf.append("<<<pgurl>>>").append(pgurl).append("\n");

				sbf.append("<<<igurl>>>").append("http://")
						.append(propertiesService.getString("cdn.domain"))
						.append(productInfo.get("IGURL")).append("\n");

				String categoryIndexNameString = (String) productInfo.get("CATEGORY");

				List<CategoryIndexName> categoryIndexNameList = null;

				// PC Category
				if (categoryIndexNameString != null || !"".equals(categoryIndexNameString)) {
					categoryIndexNameList = CategoryUtil.getCategoryIndexNameList(categoryIndexNameString);
				} else { // Mobile Category
					commandMap.put("PRD_CTG_ENV", "M");
					categoryIndexNameList = defaultDAO.selectList(
							"ShoplinkerProduct.selectProductCategory",
							commandMap);
				}

				int level = 1;

				for (CategoryIndexName categoryIndexName : categoryIndexNameList) {

						sbf.append("<<<cate" + level  + ">>>")
								.append(categoryIndexName.getName())
								.append("\n").append("<<<caid" + level  + ">>>")
								.append(categoryIndexName.getIndex())
								.append("\n");

					if (level > 4)
						break;
					else
						level++;
				}

				if (productInfo.get("model") != null) {
					sbf.append("<<<model>>>").append(productInfo.get("MODEL"))
							.append("\n");
				}

				if (productInfo.get("brand") != null) {
					sbf.append("<<<brand>>>").append(productInfo.get("BRAND"))
							.append("\n");
				}

				if (productInfo.get("maker") != null) {
					sbf.append("<<<maker>>>").append(productInfo.get("MAKER"))
							.append("\n");
				}

				commandMap.put("PRD_CHN_PRC", price);
				List<String> pcardList = defaultDAO.selectList(
						"EnginePage.selectPcardList", commandMap);

				if (pcardList != null && pcardList.size() > 0) {
					StringBuffer pcardSbf = new StringBuffer();

					int pcardCnt = 0;

					for (String pcardString : pcardList) {

						if (pcardCnt > 0)
							pcardSbf.append(".");

						pcardSbf.append(pcardString);

						pcardCnt++;

					}

					sbf.append("<<<pcard>>>").append(pcardSbf).append("\n");
				}

				int milgAmt = ((BigDecimal) (productInfo.get("MILGAMT")))
						.intValue();
				int addonMilgAmt = ((BigDecimal) (productInfo
						.get("ADDONMILGAMT"))).intValue();

				int point = milgAmt + addonMilgAmt;

				if (point > 0) {
					sbf.append("<<<point>>>").append(point).append("\n");
				}

				sbf.append("<<<deliv>>>").append(productInfo.get("DELIV"))
						.append("\n");

				if (productInfo.get("DELIVTERM") != null) {
					sbf.append("<<<delivterm>>>")
							.append(productInfo.get("DELIVTERM")).append("\n");
				}

				if (productInfo.get("EVENT") != null) {
					sbf.append("<<<event>>>").append(productInfo.get("EVENT"))
							.append("\n");
				}

				int temp7CardPrice = 0;

				if (price >= 1000000) {
					temp7CardPrice = 50000 + 20000;
				} else if (price >= 500000 && price < 1000000) {
					temp7CardPrice = (int) Math.round(price * 0.05)
							+ (int) Math.round(price * 0.02);
				} else {
					temp7CardPrice = (int) Math.round(price * 0.05);
				}

				sbf.append("<<<carddn>>>").append("삼성7카드").append("\n");
				sbf.append("<<<cardp>>>").append(price - temp7CardPrice).append("\n");
				
				sbf.append("<<<ftend>>>").append("\n");
				
				if(sbf != null){
					sbf.toString();
//					System.out.println("##### sbf : " + sbf.toString());
				}
				out.write(sbf.toString());
			}// for-end productInfoList

			logger.debug("--Daum-makeAllProductEP End--");

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
	 * 2. ClassName  : DaumEPServiceImpl.java
	 * 3. Comment    : 다음카카오 요약EP 파일 만들기 
	 * 4. 작성자       : yong
	 * 5. 작성일       : 2016. 14. 10.
	 * </pre>
	 *
	 */
	@SuppressWarnings("unchecked")
	public void makeDaumBriefProductEP() {

		logger.debug("--Daum-makeBriefProduct Start--");

		OutputStreamWriter out = null;
		
		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();

			commandMap.put("CHN_DTL_CD", CHN_DTL_CD);
			Map<String, Object> someTimeMap = defaultDAO.select(
					"EnginePage.selectSomeTime", commandMap);

			someTimeMap.put("CHN_DTL_CD", CHN_DTL_CD);
			someTimeMap.put("PRD_CHN_DPT2", PRD_CHN_DPT2);
			
			//test - TODO REMOVE
			
			someTimeMap.put("ST_DATE", "20151217000000");
			someTimeMap.put("ED_DATE", "20151229140000");
				

			logger.debug("--some stdTime={}, {}", someTimeMap.get("ST_DATE"),
					someTimeMap.get("ED_DATE"));

			List<Map<String, Object>> productInfoList = defaultDAO.selectList(
					"EnginePage.selectProductSome", someTimeMap);

			out = getOutputStreamWriter(FILE_NAME_SOME, GZIP_FLAG);

			if (productInfoList == null || productInfoList.size() == 0) {
				logger.debug("--Daum-productInfoList.size() = 0");
				logger.debug("--Daum-makeSomeProduct End--");
				return;
			}	

			logger.debug("--productInfoList.size()={}", productInfoList.size());

			for (Map<String, Object> productInfo : productInfoList) {

				StringBuffer sbf = new StringBuffer();

				String mapid = (String) productInfo.get("MAPID");

				String insertYn = (String) productInfo.get("INSERT_YN");
				String deleteYn = (String) productInfo.get("DELETE_YN");

				String utime = (String) productInfo.get("UTIME");

				String classString = "U";

				if ("Y".equals(insertYn)) {

					if ("Y".equals(deleteYn)) {
						continue;
					}
					classString = "I";
					utime = (String) productInfo.get("INSERT_TIME");
				} else {
					if ("Y".equals(deleteYn)) {

						sbf.append("<<<begin>>>").append("\n")
								.append("<<<mapid>>>").append(mapid)
								.append("\n").append("<<<class>>>").append("D")
								.append("\n").append("<<<utime>>>")
								.append(utime).append("\n")
								.append("<<<ftend>>>").append("\n");

						out.write(sbf.toString());
						continue;
					}
				}

				int price = ((BigDecimal) (productInfo.get("PRICE")))
						.intValue();

				sbf.append("<<<begin>>>").append("\n").append("<<<mapid>>>")
						.append(mapid).append("\n").append("<<<price>>>")
						.append(price).append("\n").append("<<<class>>>")
						.append(classString).append("\n").append("<<<utime>>>")
						.append(utime).append("\n").append("<<<pname>>>")
						.append(productInfo.get("PNAME")).append("\n");

				// TODO 채널구분?
				String pgurl = new StringBuffer(
						propertiesService.getString("front.domain"))
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).toString();
				sbf.append("<<<pgurl>>>").append(pgurl).append("\n");

				sbf.append("<<<igurl>>>").append("http://")
						.append(propertiesService.getString("cdn.domain"))
						.append(productInfo.get("IGURL")).append("\n");

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

				for (CategoryIndexName categoryIndexName : categoryIndexNameList) {

						sbf.append("<<<cate" + level  + ">>>")
								.append(categoryIndexName.getName())
								.append("\n").append("<<<caid" + level  + ">>>")
								.append(categoryIndexName.getIndex())
								.append("\n");

					if (level > 4)
						break;
					else
						level++;
				}

				if (productInfo.get("model") != null) {
					sbf.append("<<<model>>>").append(productInfo.get("MODEL"))
							.append("\n");
				}

				if (productInfo.get("brand") != null) {
					sbf.append("<<<brand>>>").append(productInfo.get("BRAND"))
							.append("\n");
				}

				if (productInfo.get("maker") != null) {
					sbf.append("<<<maker>>>").append(productInfo.get("MAKER"))
							.append("\n");
				}

				commandMap.put("PRD_CHN_PRC", price);
				List<String> pcardList = defaultDAO.selectList(
						"EnginePage.selectPcardList", commandMap);

				if (pcardList != null && pcardList.size() > 0) {
					StringBuffer pcardSbf = new StringBuffer();

					int pcardCnt = 0;

					for (String pcardString : pcardList) {

						if (pcardCnt > 0)
							pcardSbf.append(".");

						pcardSbf.append(pcardString);

						pcardCnt++;

					}

					sbf.append("<<<pcard>>>").append(pcardSbf).append("\n");
				}

				int milgAmt = ((BigDecimal) (productInfo.get("MILGAMT")))
						.intValue();
				int addonMilgAmt = ((BigDecimal) (productInfo
						.get("ADDONMILGAMT"))).intValue();

				int point = milgAmt + addonMilgAmt;

				if (point > 0) {
					sbf.append("<<<point>>>").append(point).append("\n");
				}

				sbf.append("<<<deliv>>>").append(productInfo.get("DELIV"))
						.append("\n");

				if (productInfo.get("DELIVTERM") != null) {
					sbf.append("<<<delivterm>>>")
							.append(productInfo.get("DELIVTERM")).append("\n");
				}

				if (productInfo.get("EVENT") != null) {
					sbf.append("<<<event>>>").append(productInfo.get("EVENT"))
							.append("\n");
				}

				int temp7CardPrice = 0;

				if (price >= 1000000) {
					temp7CardPrice = 50000 + 20000;
				} else if (price >= 500000 && price < 1000000) {
					temp7CardPrice = (int) Math.round(price * 0.05)
							+ (int) Math.round(price * 0.02);
				} else {
					temp7CardPrice = (int) Math.round(price * 0.05);
				}

				sbf.append("<<<carddn>>>").append("삼성7카드").append("\n");
				sbf.append("<<<cardp>>>").append(price - temp7CardPrice).append("\n");
				
				sbf.append("<<<ftend>>>").append("\n");
				
				out.write(sbf.toString());

			}// for-end productInfoList

			logger.debug("--Daum-makeSomeProduct End--");

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
	
	public OutputStreamWriter getOutputStreamWriter(String fileName, boolean gzipFlag)
			throws IOException {
		
		// TODO replace with property
		String baseDir = propertiesService.getString("file.ep.path");
		
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
