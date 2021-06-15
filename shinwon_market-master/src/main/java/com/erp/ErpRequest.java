package com.erp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author 이찬희
 *
 */ 
public class ErpRequest {
	 
	private static Logger logger = LoggerFactory.getLogger(ErpRequest.class.getSimpleName());
	
	private static final int REQUEST_TIME_OUT = 1000*60;
	
	private static final String REQUEST_URL = "http://swerp.sw.co.kr/showwindow/omws/Showwindow.asmx";
	
	public static Document request(String requestBodyXmlString) {
	    
		if(requestBodyXmlString==null || requestBodyXmlString.isEmpty()) {return null;}
		
		try {
			Response response = Jsoup.connect(REQUEST_URL)
					.header("Content-Type", "text/xml; charset=utf-8")
					.method(Method.POST).requestBody(requestBodyXmlString)
					.timeout(REQUEST_TIME_OUT)
					.execute();
			if(response == null){
				return null;
			}
			
			return response.parse();
		} catch (IOException e) {
			return null;
		}
	}
	
	private static List<Map<String, Object>> parseList(Document document, String key){
		if(document == null || key == null || key.isEmpty()) { return null; }
		
		List<Map<String, Object>> rtList = new ArrayList<>();
		Elements elements = document.select(key);
		for(int index = 0; index < elements.size(); index++) {
			Element bodyElement = elements.get(index);
			Map<String,Object> map = new HashMap<String,Object>();
			Elements elementList = bodyElement.getAllElements();
			
			for(int elementIndex = 0; elementIndex<elementList.size(); elementIndex++) {
				Element item = elementList.get(elementIndex);
				map.put(item.tagName(), item.text());
			}
			
			rtList.add(map);
		}
		return rtList;
	}
	private static Map<String, Object> parseObject(Document document, String key){
		if(document == null || key == null || key.isEmpty()) { return null; }
		Elements elements = document.select(key);
		Element bodyElement = elements.get(0);
		Map<String, Object> map = new HashMap<String, Object>();
		Elements elementList = bodyElement.getAllElements();
		for(int elementIndex = 0; elementIndex<elementList.size(); elementIndex++) {
			Element item = elementList.get(elementIndex);
			map.put(item.tagName(), item.text());
		}
		return map;
	}
	public static Map<String, Object> elementToMap(Element element){
		if(element == null) {return null;}
		Map<String,Object> map = new HashMap<String,Object>();
		
		Elements elementList = element.getAllElements();
		for(int index = 0; index < elementList.size(); index++) {
			Element item = elementList.get(index);
			
			map.put(item.tagName(), item.text());
		}
		return map;
	}
	
	
	/****************** ERP INTERFACE FUNCTION  *************************/
	
	private static List<Map<String, Object>> requestList(String url, Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString(url,  params);
		
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		String result = url + "Result";
		return parseList(curDoc, result);
	}
	
	private static Map<String, Object> requestObject(String url, Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString(url,  params);
		
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		String result = url + "Result";
		return parseObject(curDoc, result);
	}
	
	public static List<Map<String,Object>> requestMaster(String styleNo){
		Map<String,Object> requestBodyMap = new HashMap<String, Object>();
		requestBodyMap.put("STYLE_NO", styleNo);	
		
		String xmlString = ErpXmlGenerator.getXmlString("ProductMaster",  requestBodyMap);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "ProductMaster");
		
		return curList;
	}	
	private static Document requestProductMaster2Core(String styleNo) {
		Map<String,Object> requestBodyMap = new HashMap<String, Object>();
		requestBodyMap.put("STYLE_NO", styleNo);	
		
		String xmlString = ErpXmlGenerator.getXmlString("ProductMaster2",  requestBodyMap);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		return curDoc;
		
	}
	private static List<Map<String,Object>> requestProductMaster2Parse(Document curDoc, String styleNo){
		List<Map<String, Object>> masterList = parseList(curDoc, "ProductMaster");
		List<Map<String, Object>> stockInfoList = parseList(curDoc, "stockInfo");
		List<String> styleNoList = new ArrayList<String>();
		List<String> seasonYearList = new ArrayList<String>();
		List<String> colorCodeList = new ArrayList<String>();
		List<String> sizeCodeList = new ArrayList<String>();
		List<String> colorationGbList = new ArrayList<String>();
		List<String> matrCodeList = new ArrayList<String>();
		
		for(int index = 0; index < masterList.size(); index++) {
			for(int stockInfoindex = 0; stockInfoindex < stockInfoList.size(); stockInfoindex++) {
				if(compare(masterList.get(index),	stockInfoList.get(stockInfoindex))) {
					masterList.get(index).put("STOCK_QTY", stockInfoList.get(stockInfoindex).get("STOCK_QTY"));
					styleNoList.add(styleNo);
					seasonYearList.add((String)masterList.get(index).get("SEASON_YEAR"));
					colorCodeList.add((String)masterList.get(index).get("COLOR_CODE"));
					sizeCodeList.add((String)masterList.get(index).get("SIZE_CODE"));
					colorationGbList.add((String)masterList.get(index).get("SEASON_YEAR"));
					matrCodeList.add((String)masterList.get(index).get("SEASON_YEAR"));
				}
			}
		}
		return masterList;
	}
	public static List<Map<String,Object>> requestProductMaster2Upload(String styleNo){
		Document curDoc = requestProductMaster2Core(styleNo);
		if(curDoc==null) {return null;}
		return requestProductMaster2Parse(curDoc,styleNo);
	}	
	
	public static Map<String,Object> requestProductMaster2WithDetail(String styleNo){
		Document curDoc = requestProductMaster2Core(styleNo);
		if(curDoc==null) {return null;}
		List<Map<String,Object>> masterList = requestProductMaster2Parse(curDoc,styleNo);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("masterList", masterList);
		result.put("detailList", parseList(curDoc, "ProductDetail"));
		return result;
	}
	
	public static Map<String, Object> requestProductMaster2(String styleNo){
		Map<String,Object> requestBodyMap = new HashMap<String, Object>();
		requestBodyMap.put("STYLE_NO", styleNo);	
		
		String xmlString = ErpXmlGenerator.getXmlString("ProductMaster2",  requestBodyMap);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GetPointView xmlString : "+ xmlString);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}

		List<Map<String, Object>> masterList = parseList(curDoc, "ProductMaster");
		List<Map<String, Object>> detailList = parseList(curDoc, "ProductDetail");
		List<Map<String, Object>> stockInfoList = parseList(curDoc, "stockInfo");
		
		Collections.reverse(masterList);
		Collections.reverse(detailList);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<String> styleNoList = new ArrayList<String>();
		List<String> seasonYearList = new ArrayList<String>();
		List<String> colorCodeList = new ArrayList<String>();
		List<String> sizeCodeList = new ArrayList<String>();
		List<String> colorationGbList = new ArrayList<String>();
		List<String> matrCodeList = new ArrayList<String>();
		Map<String, Object> updateData = new HashMap<String,Object>();
		
		String strColorationGb = "";  // 소재
		String strColorCode = "";     // 색상
		String strSizeCode = "";      // 치수
		String strProdNation = "";    // 원산지
		String strDeliDate = "";      // 제조년월일
		String prdMstSeason = "";     // 시즌
		
		for(int index = 0; index < masterList.size(); index++) {
			for(int stockInfoindex = 0; stockInfoindex < stockInfoList.size(); stockInfoindex++) {
				if(compare(masterList.get(index),	stockInfoList.get(stockInfoindex))) {
					masterList.get(index).put("STOCK_QTY", stockInfoList.get(stockInfoindex).get("STOCK_QTY"));
					
					if(index > 0)
					{
					    strColorationGb += " / ";
					}

                    int i = 0;
                    
					for(Map<String, Object> data : detailList) {
					    
					    if(masterList.get(index).get("STYLE_NO").equals(data.get("STYLE_NO"))
                        && masterList.get(index).get("SEASON_YEAR").equals(data.get("SEASON_YEAR"))
                        && masterList.get(index).get("COLOR_CODE").equals(data.get("COLOR_CODE")))
					    {
    					    styleNoList.add(styleNo);
    					    seasonYearList.add((String)masterList.get(index).get("SEASON_YEAR"));
    					    colorCodeList.add((String)masterList.get(index).get("COLOR_CODE"));
    					    sizeCodeList.add((String)masterList.get(index).get("SIZE_CODE"));
    					    colorationGbList.add((String)data.get("COLORATION_GB"));
    					    matrCodeList.add((String)data.get("MATR_CODE"));
					    }

	                    //색상
                        if(strColorCode.indexOf((String)masterList.get(index).get("COLOR_CODE")) < 0)
                        {
	                        if(index > 0)
	                        {
	                            strColorCode += ", ";
	                        }
	                        strColorCode += (String)masterList.get(index).get("COLOR_CODE");
                        }

                        //치수
                        if(strSizeCode.indexOf((String)masterList.get(index).get("SIZE_CODE")) < 0)
                        {
                            if(index > 0)
                            {
                                strSizeCode += ", ";
                            }
                            strSizeCode += (String)masterList.get(index).get("SIZE_CODE");
                        }

                        //원산지
                        System.out.println(masterList.get(index).get("PROD_NATION"));
                        if(strProdNation.indexOf((String)masterList.get(index).get("PROD_NATION")) < 0)
                        {
                            if(index > 0)
                            {
                                strProdNation += ", ";
                            }
                            strProdNation += (String)masterList.get(index).get("PROD_NATION");
                        }
	                    System.out.println(masterList.get(index).get("DELI_DATE"));
                        if(strDeliDate.indexOf((String)masterList.get(index).get("DELI_DATE")) < 0)
                        {
                            if(index > 0)
                            {
                                strDeliDate += ", ";
                            }
                            strDeliDate += (String)masterList.get(index).get("DELI_DATE");
                        }

                        //소재
					    if(i > 0)
					    {
					        strColorationGb += ", ";
					    }
					    
					    strColorationGb += "[" + (String)data.get("COLORATION_GB") + "] " + (String)data.get("MATR_NAME") + " " + (String)data.get("MIXRATE") + "%";
					    
					    ++i;
					}
					
					String season = StringUtils.upperCase((String) masterList.get(index).get("SEASON"));
					
					char ch[] = season.toCharArray();
					int ascii = ch[0];
					String postFix = "";
					int intSeasonYear = Integer.valueOf((String)masterList.get(index).get("SEASON_YEAR"));
					if(((intSeasonYear / 2019) & 1) != 0)
					{
    					if(ascii / 88 < 1)
    					{
    					        
    					    //A~W 일 경우
    					    if((ascii & 1) != 0)
    					    {
    					        postFix = "3008";
    					    }
    					    else
    					    {
    					        postFix = "3007";
    					    }
    					}
    					else
    					{
    					    if(ascii == 88)
    					    {
    					        postFix = "3008";
    					    }
    					    else
    					    {
    					        postFix = "3007";
    					    }
    					}
                    }
					else
					{
                        if(ascii / 88 < 1)
                        {
                                
                            //A~W 일 경우
                            if((ascii & 1) != 0)
                            {
                                postFix = "3007";
                            }
                            else
                            {
                                postFix = "3008";
                            }
                        }
                        else
                        {
                            if(ascii == 88)
                            {
                                postFix = "3007";
                            }
                            else
                            {
                                postFix = "3008";
                            }
                        }
					}

					//시즌
                    prdMstSeason = postFix;
				}
			}
        }
		
		String strProdName = (String)masterList.get(0).get("PROD_NAME");
		String strTagPrice = (String)masterList.get(0).get("TAG_PRICE");
		String strBrandEname = (String)masterList.get(0).get("BRAND_ENAME");
		if(StringUtils.equals(strBrandEname, "SIEG FAHRENHEIT"))
		{
		    strBrandEname = "FAHRENHEIT";
		}
		
		updateData.put("STYLE_NO", styleNo);
		updateData.put("COLORATION_GB", strColorationGb);
		updateData.put("COLOR_CODE", strColorCode);
		updateData.put("SIZE_CODE", strSizeCode);
		updateData.put("BRAND_ENAME", strBrandEname);
		updateData.put("PROD_NAME", strProdName);
		updateData.put("TAG_PRICE", strTagPrice);
		updateData.put("PROD_NATION", strProdNation);
		updateData.put("DELI_DATE", strDeliDate);
		updateData.put("PRD_MST_SEASON", prdMstSeason);

		resultMap.put("STYLE_NO", styleNoList);
		resultMap.put("SEASON_YEAR", seasonYearList);
		resultMap.put("COLOR_CODE", colorCodeList);
		resultMap.put("SIZE_CODE", sizeCodeList);
		resultMap.put("COLORATION_GB", colorationGbList);
		resultMap.put("MATR_CODE", matrCodeList);

		xmlString = ErpXmlGenerator.getXmlString("ProductMaster2Result", resultMap);
		curDoc = request(xmlString);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GetPointView curList : "+curDoc);
		
        if(curDoc == null) {
            return null;
        }
		
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        returnMap.put("masterList", masterList);
        returnMap.put("masterUpdateMap", updateData);
		returnMap.put("stockInfoList", stockInfoList);
		returnMap.put("detailList",detailList);
        
		return returnMap;
	}	
	
	private static boolean compare(Map<String,Object> product, Map<String, Object> stockInfo) {
		boolean result = product.get("STYLE_NO").equals(stockInfo.get("STYLE_NO"))
						&& product.get("SEASON_YEAR").equals(stockInfo.get("SEASON_YEAR"))
						&& product.get("COLOR_CODE").equals(stockInfo.get("COLOR_CODE"))
						&& product.get("SIZE_CODE").equals(stockInfo.get("SIZE_CODE"));
		return result;
	}
	
	public static List<Map<String,Object>> requestDetail(String styleNo){
		Map<String,Object> requestBodyMap = new HashMap<String, Object>();
		requestBodyMap.put("STYLE_NO", styleNo);	
		
		String xmlString = ErpXmlGenerator.getXmlString("ProductDetail",  requestBodyMap);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "ProductDetail");
		for(int index = 0; index < curList.size(); index++ ) {
			requestProductDetailResult(curList.get(index));
		}
		return curList;
	}	
	
	private static void requestProductDetailResult(Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString("ProductDetailResult",  params);
		request(xmlString);
	}	

    /**
     * O2O 자사 상품 재고 호출 API
     * 
     * 임시주문서 작성 또는 주문서 작성시 자사 상품의 재고수량을 ERP로부터 불러와 재고여부를 체크한다.
     * 
     * @author 이찬희
     * @param Map<String, Object> ("STYLE_NO", "SEASON_YEAR", "COLOR_CODE", "SIZE_CODE")
     * @return List<Map<String, Object>>
     */
	public static List<Map<String,Object>> requestStockInfo(Map<String, Object> params){
		
		String xmlString = ErpXmlGenerator.getXmlString("StockInfo",  params);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "STOCK");
		
		return curList;
	}
	
	public static Map<String,Object> requestIdDupInfo(Map<String, Object> params){
		
		String xmlString = ErpXmlGenerator.getXmlString("MemberIdCheck",  params);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		Map<String, Object> map = parseObject(curDoc, "MemberIdCheckResult");
		return map;
	}
	
	public static Map<String,Object> requestEmailDupInfo(Map<String, Object> params){
		
		String xmlString = ErpXmlGenerator.getXmlString("MemberEmailCheck",  params);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		Map<String, Object> curList = parseObject(curDoc, "MemberEmailCheckResult");
		
		return curList;
	}
	
	public static List<Map<String,Object>> requestJoinMember(Map<String, Object> params){
		
		String xmlString = ErpXmlGenerator.getXmlString("MemberJoin",  params);

		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "MemberJoin");
		
		return curList;
	}
	
	public static Map<String, Object> requestMemberPointCheck(Map<String, Object> params){
		//(9)회원 통합 포인트조회 : 입력값 : 쇼핑몰 아이디
		String xmlString = ErpXmlGenerator.getXmlString("MemberPointCheck",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}	
		Map<String, Object> result = parseObject(curDoc, "MemberPointCheckResult");
		return result;
	}
	public static List<Map<String,Object>> requestAnnualWelfarePoints(Map<String, Object> params){
		//(14) EmpPointLimit : 연도별 임직원 포인트 조회. 입력값 : 연도
		String xmlString = ErpXmlGenerator.getXmlString("EmpPointLimit",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "EmpPointLimit");
		
		return curList;
	}
	public static List<Map<String, Object>> requestAddtionalPoint(Map<String, Object> params){
		//(15)연도별 임직원 포인트 조회. 입력값 : 연도, 
		String xmlString = ErpXmlGenerator.getXmlString("UserAddEmpPointLimit",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "UserAddEmpPointLimit");
		return curList;
	}
	public static List<Map<String, Object>> requestGetPointView(Map<String, Object> params){
		//(21) 포인트 사용리스트. 입력값 : 쇼핑몰 ID, 시작일, 종료일, 시작범위, LIMIT(데이터 개수)
		String xmlString = ErpXmlGenerator.getXmlString("GetPointView",  params);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GetPointView xmlString : "+ xmlString);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "View");
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GetPointView curList : "+curList);
		return curList;
	}
	
	public static List<Map<String,Object>> requestOrder(Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString("Order",  params);
		System.out.println(xmlString);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "Order");
		return curList;
	}
	
	/**
	 * O2O 매장 정보 동기화 API
	 * 
	 * O2O매장 목록 화면에서 동기화 버튼을 누르면 ERP로부터 매장 정보를 가져와 DB에 저장한다.
	 * 
	 * @author 이찬희
	 * @return List<Map<String, Object>>
	 */
	public static List<Map<String, Object>> requestPartInfo(){
		String xmlString = ErpXmlGenerator.getXmlString("PartInfo",  null);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "PartInfo");
		
		
		return curList;
	}
	
	public static List<Map<String, Object>> requestO2OStockInfo(Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString("O2OStockInfo",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "STOCK");
		return curList;
	}
	
	public static List<Map<String, Object>> requestEmployeeName(Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString("GetEmpName",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "GetEmpNameResult");
		return curList;
	}

	public static List<Map<String, Object>> requestEmpRetireInfo(Map<String, Object> params){
		 String xmlString = ErpXmlGenerator.getXmlString("EmpRetireInfo",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "EmpRetireInfoResult");
		return curList;
	}

	public static List<Map<String, Object>> requestEmpRetireInfoResult(Map<String, Object> params){
		 String xmlString = ErpXmlGenerator.getXmlString("EmpRetireInfoResult",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "EmpRetireInfoResultResponse");
		return curList;
	}
	
    /**
     * O2O 자사 상품 품번별 색상별 사이즈별 전국 재고를 리턴 API
     * 
     * 임시주문서 작성 또는 주문서 작성시 자사 상품의 전국 재고수량을 ERP로부터 불러와 재고여부를 체크한다.
     * 
     * @author 이찬희
     * @param Map<String, Object> ("STYLE_NO", "SEASON_YEAR", "COLOR_CODE", "SIZE_CODE")
     * @return List<Map<String, Object>>
     */
	public static List<Map<String, Object>> requestAllStockInfo(Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString("AllStockInfo",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "STOCK");
		return curList;
	}
	
	public static List<Map<String, Object>> requestWithDraw(Map<String, Object> params){
		String xmlString = ErpXmlGenerator.getXmlString("MemberWithdraw",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "MemberWithdrawResponse");
		return curList;
	}


	
	public static List<Map<String, Object>> requestMemberModify(Map<String, Object> params){
		params.put("CRYPT_KEY", "Twins");
		String xmlString = ErpXmlGenerator.getXmlString("MemberModify",  params);
		Document curDoc = request(xmlString);
		if(curDoc == null) {
			return null;
		}
		List<Map<String, Object>> curList = parseList(curDoc, "MemberModifyResponse");
		return curList;
	}
	
	public static Map<String, Object> requestMemberSleep(Map<String, Object> params){
		return requestObject("MemberSleep", params);
	}
	
	public static List<Map<String, Object>> requestMemberSleep2(Map<String, Object> params){
		return requestList("MemberSleep2", params);
	}
	
	public static Map<String, Object> requestMemberSleepCancel(Map<String, Object> params){
		return requestObject("MemberSleepCancel", params);
	}
	
	public static Map<String, Object> requestMemberWithdraw(Map<String, Object> params){
		return requestObject("MemberWithdraw", params);
	}

    /**
     * O2O 수수료율 조회
     * 
     * 입점몰 전체의 수수료율을 조회해 온다.
     * 
     * 해당 method 호출 후 반드시 requestO2OFeeRateResult을 호출할 것
     * 
     * @author 이찬희
     * @param Map<String, Object> ("APPLY_YYMM")
     * 
     * @return List<Map<String, Object>>
     */
	public static List<Map<String, Object>> requestO2OFeeRate(Map<String, Object> params){

        String xmlString = ErpXmlGenerator.getXmlString("O2OFeeRate",  params);

        Document curDoc = request(xmlString);
        if(curDoc == null) {
            return null;
        }
        List<Map<String, Object>> curList = parseList(curDoc, "O2OFeeRate");
        
		return curList;
	}

    /**
     * O2O 수수료율 조회 후 호출한다. ##필수##
     * 
     * ERP로 수수료율 조회 결과를 리턴
     * 
     * requestO2OFeeRate 호출 후 반드시 requestO2OFeeRateResult을 호출할 것
     * 
     * @author 이찬희
     * @param Map<String, Object> ("PART_DIV", "PART_NO", "BRAND", "APPLY_YYMM")
     * @return List<Map<String, Object>>
     */
	public static void requestO2OFeeRateResult(Map<String, Object> params){
        String xmlString = ErpXmlGenerator.getXmlString("O2OFeeRateResult",  params);
        request(xmlString);
	}
}
