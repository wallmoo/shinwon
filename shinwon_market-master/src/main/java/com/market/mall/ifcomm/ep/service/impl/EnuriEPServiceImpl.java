/**
 * @PackageName: com.market.mall.ifcomm.ep.service.impl
 * @FileName : EnuriEPServiceImpl.java
 * @Date : 2015. 12. 22.
 * @프로그램 설명 : 에누리 EP 처리하는 Service implement Class
 * @author freelsj
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

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.ep.service.EnuriEPService;
import com.market.util.CategoryUtil;
import com.market.util.model.CategoryIndexName;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("enuriEPService")
public class EnuriEPServiceImpl implements EnuriEPService {

	private Logger logger = LoggerFactory.getLogger(EnuriEPServiceImpl.class);

	private String FILE_NAME_ALL = "enuri_all";
	private String FILE_NAME_UPDATE = "enuri_update";
	private String FILE_NAME_INSERT = "enuri_insert";
	private String FILE_NAME_DELETE = "enuri_delete";
	private String CHN_DTL_CD = "A073"; // 에누리
	private String PRD_CHN_DPT2 = "72"; // 에누리
	private boolean GZIP_FLAG = false;

	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "defaultDAO")
	private CommonDefaultDAO defaultDAO;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : makeAllProductEP
	 * 2. ClassName  : EnuriEPServiceImpl.java
	 * 3. Comment    : 전체 EP 파일 만들기 
	 * 4. 작성자       : freelsj
	 * 5. 작성일       : 2015. 12. 22.
	 * </pre>
	 */

	@SuppressWarnings("unchecked")
	public void makeEnuriAllProductEP() {

		logger.debug("--Enuri-makeAllProductEP Start--");

		OutputStreamWriter out = null;

		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();

			commandMap.put("CHN_DTL_CD", CHN_DTL_CD);
			commandMap.put("PRD_CHN_DPT2", PRD_CHN_DPT2);
			
			List<Map<String, Object>> productInfoList = defaultDAO.selectList(
					"EnginePage.selectProductAll", commandMap);

			out = getOutputStreamWriter(FILE_NAME_ALL, GZIP_FLAG);

			if (productInfoList == null || productInfoList.size() == 0) {
				logger.debug("--Enuri-productInfoList.size() = 0");
				logger.debug("--Enuri-makeAllProductEP End--");
				return;
			}

			logger.debug("--productInfoList.size()={}", productInfoList.size());

			StringBuffer headerSbf = new StringBuffer(
					"상품코드<|>상품명<|>가격<|>URL<|>배송<|>IMGURL<|>계산서<|>무이자<|>제조사<|>분류<|>가격2<|>요금제<|>가입비유무<|>유심비유무<|>채권료<|>위약금<|>홈쇼핑<|>카드할인가<|>쿠폰<|>모바일가격<|>차등배송비<|>설치비")
					.append("\r\n");
			out.write(headerSbf.toString());

			for (Map<String, Object> productInfo : productInfoList) {

				StringBuffer sbf = new StringBuffer();

				String mapid = (String) productInfo.get("MAPID");

				int price = ((BigDecimal) (productInfo.get("PRICE")))
						.intValue();

				sbf.append(mapid).append("<|>")
						.append("[삼성7카드]" + productInfo.get("PNAME"))
						.append("<|>").append(price);

				// TODO 채널구분?
				String pgurl = new StringBuffer(
						propertiesService.getString("front.domain"))
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).toString();
				sbf.append("<|>").append(pgurl);

				if ("0".equals(productInfo.get("DELIV"))) {
					sbf.append("<|>").append("무료배송");
				} else {
					sbf.append("<|>").append(productInfo.get("DELIV"));
				}

				sbf.append("<|>").append("http://")
						.append(propertiesService.getString("cdn.domain"))
						.append(productInfo.get("IGURL"));

				sbf.append("<|>").append("Y");// 계산서

				commandMap.put("PRD_CHN_PRC", price);
				List<String> pcardList = defaultDAO.selectList(
						"EnginePage.selectEnuriPcardList", commandMap);

				StringBuffer pcardSbf = new StringBuffer();

				if (pcardList != null && pcardList.size() > 0) {

					int pcardCnt = 0;

					for (String pcardString : pcardList) {

						if (pcardCnt > 0)
							pcardSbf.append(",");

						pcardSbf.append(pcardString);
						pcardCnt++;
					}
				}
				sbf.append("<|>").append(pcardSbf); // 무이자

				sbf.append("<|>");
				if (productInfo.get("maker") != null) {
					sbf.append(productInfo.get("MAKER"));
				}

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

				sbf.append("<|>");

				for (CategoryIndexName categoryIndexName : categoryIndexNameList) {

					if (level > 1) {
						sbf.append("_");
					}

					sbf.append(categoryIndexName.getName());

					level++;
				}
				
				//<|>가격2<|>요금제<|>가입비유무<|>유심비유무<|>채권료<|>위약금<|>홈쇼핑
				sbf.append("<|><|><|><|><|><|><|>");

				int temp7CardPrice = 0;

				if (price >= 1000000) {
					temp7CardPrice = 50000 + 20000;
				} else if (price >= 500000 && price < 1000000) {
					temp7CardPrice = (int) Math.round(price * 0.05)
							+ (int) Math.round(price * 0.02);
				} else {
					temp7CardPrice = (int) Math.round(price * 0.05);
				}

				sbf.append("<|>").append(price - temp7CardPrice);
				sbf.append("<|>"); // 쿠폰
				sbf.append("<|>").append(price);// 모바일가격

				//<|>차등배송비<|>설치비
				sbf.append("<|><|>");
				
				sbf.append("\r\n");

				out.write(sbf.toString());

			}// for-end productInfoList

			logger.debug("--Enuri-makeAllProductEP End--");

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
	 * 2. ClassName  : EnuriEPServiceImpl.java
	 * 3. Comment    : 요약EP 파일 만들기 
	 * 4. 작성자       : freelsj
	 * 5. 작성일       : 2015. 12. 28.
	 * </pre>
	 *
	 */
	@SuppressWarnings("unchecked")
	public void makeEnuriBriefProductEP() {

		logger.debug("--Enuri-makeSomeProductEP Start--");

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
			
			someTimeMap.put("ST_DATE", "20151217000000");
			someTimeMap.put("ED_DATE", "20151229140000");
			

			logger.debug("--some stdTime={}, {}", someTimeMap.get("ST_DATE"),
					someTimeMap.get("ED_DATE"));

			List<Map<String, Object>> productInfoList = defaultDAO.selectList(
					"EnginePage.selectProductSome", someTimeMap);

			updateOut = getOutputStreamWriter(FILE_NAME_UPDATE, GZIP_FLAG);
			insertOut = getOutputStreamWriter(FILE_NAME_INSERT, GZIP_FLAG);
			deleteOut = getOutputStreamWriter(FILE_NAME_DELETE, GZIP_FLAG);

			StringBuffer headerSbf = new StringBuffer(
					"상품코드<|>상품명<|>가격<|>URL<|>배송<|>IMGURL<|>계산서<|>무이자<|>제조사<|>분류<|>가격2<|>요금제<|>가입비유무<|>유심비유무<|>채권료<|>위약금<|>홈쇼핑<|>카드할인가<|>쿠폰<|>모바일가격<|>차등배송비<|>설치비")
					.append("\r\n");
			updateOut.write(headerSbf.toString());
			insertOut.write(headerSbf.toString());

			StringBuffer deleteHeaderSbf = new StringBuffer("상품코드<|>상품명<|>가격")
					.append("\r\n");
			deleteOut.write(deleteHeaderSbf.toString());

			if (productInfoList == null || productInfoList.size() == 0) {
				logger.debug("--Enuri-productInfoList.size() = 0");
				logger.debug("--Enuri-makeSomeProductEP End--");
				return;
			}

			logger.debug("--productInfoList.size()={}", productInfoList.size());

			for (Map<String, Object> productInfo : productInfoList) {

				StringBuffer sbf = new StringBuffer();

				String mapid = (String) productInfo.get("MAPID");

				int price = ((BigDecimal) (productInfo.get("PRICE")))
						.intValue();

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
						sbf.append(mapid).append("<|>").append("<|>")
								.append("\r\n");
						deleteOut.write(sbf.toString());
						continue;
					}
				}

				sbf.append(mapid).append("<|>")
						.append("[삼성7카드]" + productInfo.get("PNAME"))
						.append("<|>").append(price);

				// TODO 채널구분?
				String pgurl = new StringBuffer(
						propertiesService.getString("front.domain"))
						.append("/pc/product/product.do?prdMstCd=")
						.append(mapid).toString();
				sbf.append("<|>").append(pgurl);

				if ("0".equals(productInfo.get("DELIV"))) {
					sbf.append("<|>").append("무료배송");
				} else {
					sbf.append("<|>").append(productInfo.get("DELIV"));
				}

				sbf.append("<|>").append("http://")
						.append(propertiesService.getString("cdn.domain"))
						.append(productInfo.get("IGURL"));

				sbf.append("<|>").append("Y");// 계산서

				commandMap.put("PRD_CHN_PRC", price);
				List<String> pcardList = defaultDAO.selectList(
						"EnginePage.selectEnuriPcardList", commandMap);

				StringBuffer pcardSbf = new StringBuffer();

				if (pcardList != null && pcardList.size() > 0) {

					int pcardCnt = 0;

					for (String pcardString : pcardList) {

						if (pcardCnt > 0)
							pcardSbf.append(",");

						pcardSbf.append(pcardString);
						pcardCnt++;
					}
				}
				sbf.append("<|>").append(pcardSbf); // 무이자

				sbf.append("<|>");
				if (productInfo.get("maker") != null) {
					sbf.append(productInfo.get("MAKER"));
				}

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

				sbf.append("<|>");

				for (CategoryIndexName categoryIndexName : categoryIndexNameList) {

					if (level > 1) {
						sbf.append("_");
					}

					sbf.append(categoryIndexName.getName());

					level++;
				}

				//<|>가격2<|>요금제<|>가입비유무<|>유심비유무<|>채권료<|>위약금<|>홈쇼핑
				sbf.append("<|><|><|><|><|><|><|>");
				
				int temp7CardPrice = 0;

				if (price >= 1000000) {
					temp7CardPrice = 50000 + 20000;
				} else if (price >= 500000 && price < 1000000) {
					temp7CardPrice = (int) Math.round(price * 0.05)
							+ (int) Math.round(price * 0.02);
				} else {
					temp7CardPrice = (int) Math.round(price * 0.05);
				}

				sbf.append("<|>").append(price - temp7CardPrice);
				sbf.append("<|>"); // 쿠폰
				sbf.append("<|>").append(price);// 모바일가격
				
				//<|>차등배송비<|>설치비
				sbf.append("<|><|>");
				
				sbf.append("\r\n");

				if ("U".equals(classString)) {
					updateOut.write(sbf.toString());
				} else {
					insertOut.write(sbf.toString());
				}

			}// for-end productInfoList

			logger.debug("--Enuri-makeSomeProductEP End--");

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
