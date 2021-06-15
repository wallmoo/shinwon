package com.market.mall.am.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.EstimateManagementService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.service.impl
 * @FileName : EstimateManagementServiceImpl.java
 * @Date : 2015. 10. 20.
 * @프로그램 설명 : 견적관리를 처리하는 Service Implement Class
 * @author DEV_KIMMINHO    
 */
@Service("estimateManagementService")
public class EstimateManagementServiceImpl implements EstimateManagementService {
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name = "velocityEngine") 	protected VelocityEngine velocityEngine;
	
	@Resource protected Sms sms;
	
	//메일 발송시 필요한 서비스 시작
	@Resource
	protected Mail mail;
	
	
	/**
	* <pre>
	* 1. MethodName : selectEstimateManagementListCount
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적관련 목록 갯수
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectEstimateManagementListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("EstimateManagement.selectEstimateManagementListCount", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : selectEstimateManagementList
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적관리 목록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEstimateManagementList (Map<String, Object> commandMap) throws Exception
    {
    	
        return defaultDAO.selectList("EstimateManagement.selectEstimateManagementList", commandMap);
    }
	
	/**
	* <pre>
	* 1. MethodName : insertEstimateManagement
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : MD직접 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public int insertEstimateManagement(Map<String, Object> commandMap) throws Exception 
	{
		int result = 0;
		
		//견적코드 가져오기
		String ESM_MST_CD = defaultDAO.selectStr("EstimateManagement.selectEstimateManagementMasterCd", commandMap);
		
		commandMap.put("ESM_MST_CD", ESM_MST_CD);
		
    	result = defaultDAO.insert("EstimateManagement.insertEstimateManagement", commandMap);
    	
    	String [] arrESM_PRD_WSH_PRICE = (String[]) commandMap.get("arrESM_PRD_WSH_PRICE");
    	String [] arrESM_PRD_ESM_PRICE = (String[]) commandMap.get("arrESM_PRD_ESM_PRICE");
    	String [] arrOPT_DTL_IDX = (String[]) commandMap.get("arrOPT_DTL_IDX");
    	String [] arrEMS_PRD_CNT = (String[]) commandMap.get("arrEMS_PRD_CNT");
    	String [] arrADD_PRD_MST_CD = (String[]) commandMap.get("arrADD_PRD_MST_CD");
    	String [] arrPRD_OPT_EST_YN = (String[]) commandMap.get("arrPRD_OPT_EST_YN");
    	
    	//견적 상품 마스터 등록
    	//필수 옵션이 있으면 해당 필수 옵션이 마스터가 된다. 없다면 마스터는 기본 상품
    	
    	if(arrADD_PRD_MST_CD != null){
    		for(int j = 0; j < arrADD_PRD_MST_CD.length; j++){
    			if(arrPRD_OPT_EST_YN[j].equals("Y")){//필수 옵션 등록
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_PCH_IDX", -1);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		commandMap.put("ESM_PRD_UP_IDX", 0);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		commandMap.put("ESM_PRD_UP_IDX", commandMap.get("ESM_PRD_IDX"));
	        		
    			}else if(!arrPRD_OPT_EST_YN[j].equals("Y") && StringUtil.getInt(arrOPT_DTL_IDX[j]) == 0){//일반상품이 마스터(선택옵션이 없을 때)
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_PCH_IDX", -1);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", 0);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		commandMap.put("ESM_PRD_UP_IDX", 0);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		commandMap.put("ESM_PRD_UP_IDX", commandMap.get("ESM_PRD_IDX"));
	        		
    			}else if(!arrPRD_OPT_EST_YN[j].equals("Y") && StringUtil.getInt(arrOPT_DTL_IDX[j]) > 0){//선택옵션
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_PCH_IDX", -1);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
					commandMap.put("ESM_PRD_UP_IDX", commandMap.get("ESM_PRD_IDX"));
					result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
					
    			}else{
					commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_PCH_IDX", -1);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		commandMap.put("ESM_PRD_UP_IDX", commandMap.get("ESM_PRD_IDX"));
				}
    			
    		}
    	}
    	//바로견적을 위해 다시 등록
    	commandMap.put("ESM_PCH_MST_IDX", commandMap.get("ESM_MST_IDX"));
		commandMap.put("ESM_PCH_MST_CD", commandMap.get("ESM_MST_CD"));
    	result = defaultDAO.insert("EstimateManagement.insertEstimatePurchase", commandMap);
    	commandMap.put("ESM_PRD_PCH_IDX", commandMap.get("ESM_PCH_IDX"));
    	int ESM_PRD_UP_IDX = 0;
    	if(arrADD_PRD_MST_CD != null){
    		for(int j = 0; j < arrADD_PRD_MST_CD.length; j++){
    			if(arrPRD_OPT_EST_YN[j].equals("Y")){//필수 옵션 등록
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		commandMap.put("ESM_PRD_UP_IDX", 0);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		ESM_PRD_UP_IDX = StringUtil.getInt(commandMap.get("ESM_PRD_IDX"));
	        		
    			}else if(!arrPRD_OPT_EST_YN[j].equals("Y") && StringUtil.getInt(arrOPT_DTL_IDX[j]) == 0){//일반상품이 마스터(선택옵션이 없을 때)
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", 0);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		commandMap.put("ESM_PRD_UP_IDX", 0);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		ESM_PRD_UP_IDX = StringUtil.getInt(commandMap.get("ESM_PRD_IDX"));
	        		
    			}else if(!arrPRD_OPT_EST_YN[j].equals("Y") && StringUtil.getInt(arrOPT_DTL_IDX[j]) > 0){//선택옵션
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
					commandMap.put("ESM_PRD_UP_IDX", ESM_PRD_UP_IDX);
					result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
					
    			}else{
					commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		ESM_PRD_UP_IDX = StringUtil.getInt(commandMap.get("ESM_PRD_IDX"));
				}
    			
    		}
    	}
    	
    	/* MD견적 등록 시 회원 메일 전송 */
    	Map<String, Object> estimateInfo = defaultDAO.select("EstimateManagement.selectestimateManagementInfo",commandMap);
    	//-- 메일본문 정리
    	// 메일 contents 맵
		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
		String body = "";
		String MAIL_CODE = "";
		
		mailContentsMap.put("estimateInfo", estimateInfo);//견적정보
		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM"))));			// 수신자 이름
		mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
		mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
		mailContentsMap.put("number", new NumberTool());
		
		MAIL_CODE = "15";
		// 연관 상품 리스트 
    	commandMap.put("ESM_MST_CD", estimateInfo.get("ESM_MST_CD"));
    	List<Map<String, Object>> productList = defaultDAO.selectList("EstimateManagement.selectEstimateProductList",commandMap);
    	
    	mailContentsMap.put("productList", productList);//견적정보
    	mailContentsMap.put("productListCnt", productList.size());//견적정보
    	
    	//MD견적상품 마스터내용 가져오기
    	List<Map<String, Object>> mdPchList = defaultDAO.selectList("EstimateManagement.selectEstimateMdPchList",commandMap);
    	
    	List<Map<String, Object>> mdPorductList = new ArrayList<Map<String,Object>>();
    	mdPorductList = defaultDAO.selectList("EstimateManagement.selectEstimateMdProductList",commandMap);
    	
    	mailContentsMap.put("mdPchList", mdPchList);//견적정보
    	mailContentsMap.put("mdPorductList", mdPorductList);//견적정보
		
		
		body = VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
		body += VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, "/MAIL-ESTIMATE-FIRST-SEND.vm", "utf-8", mailContentsMap);
		body += VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
		
		//메일 발송용 맵
		Map<String, Object> mailMap = new HashMap<String, Object>();
		
		mailMap.put("MAIL_CODE", MAIL_CODE);	// 이메일 코드
		mailMap.put("MEMBER_EMAIL", StringUtil.getString(estimateInfo.get("ESM_MST_MAIL")) );		// 수신자 이메일
		//mailMap.put("MEMBER_EMAIL", "kmh0703@epasscni.com" );		// 수신자 이메일
		//mailMap.put("MEMBER_EMAIL", "everafterk@epasscni.com" );		// TODO 수신자 이메일
		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM"))));			// 수신자 이름
		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM")))  + "님 견적신청에 대한 답변이 등록되었습니다. ");	// 메일 제목
		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
		
		this.mail.mailSend(mailMap);
    	
    	return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectestimateManagementInfo
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적 상세 및 견적 상품
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectestimateManagementInfo (Map<String, Object> commandMap) throws Exception
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	// 견적관리 상세 정보 
    	Map<String, Object> estimateInfo = defaultDAO.select("EstimateManagement.selectestimateManagementInfo",commandMap);
    	
    	// 연관 상품 리스트 
    	commandMap.put("ESM_MST_CD", estimateInfo.get("ESM_MST_CD"));
    	List<Map<String, Object>> productList = defaultDAO.selectList("EstimateManagement.selectEstimateProductList",commandMap);
    	
    	//문의사항 가져오기
    	String[] arrCMN_COM_IDX = StringUtil.split(StringUtil.getString(estimateInfo.get("ESM_MST_QST_TYPE")),"|");
    	commandMap.put("arrCMN_COM_IDX", arrCMN_COM_IDX);
    	String estimateQstNm = defaultDAO.selectStr("EstimateManagement.selectestimateManagementQstNm",commandMap);
    	
    	//MD견적상품 마스터내용 가져오기
    	List<Map<String, Object>> mdPchList = defaultDAO.selectList("EstimateManagement.selectEstimateMdPchList",commandMap);
    	
    	List<Map<String, Object>> mdPorductList = new ArrayList<Map<String,Object>>();
    	
    	/*if(mdPchList.size() > 0){
    		//MD견적상품 내역 가져오기
    		for(int i = 0; i < mdPchList.size(); i++){
    			System.out.println("========mdPchList========="+mdPchList.get(i).get("EMS_PCH_IDX")+"===============<br>");
    			commandMap.put("EMS_PCH_IDX", mdPchList.get(i).get("EMS_PCH_IDX"));
    			mdPorductList = defaultDAO.selectList("EstimateManagement.selectEstimateMdProductList",commandMap);
    			
    		}
    	}*/
    	mdPorductList = defaultDAO.selectList("EstimateManagement.selectEstimateMdProductList",commandMap);
    	
    	// return 
    	resultMap.put("estimateInfo", estimateInfo);
    	resultMap.put("mdPchList", mdPchList);
    	resultMap.put("mdPorductList", mdPorductList);
    	resultMap.put("productList", productList);
    	resultMap.put("estimateQstNm", estimateQstNm);
    	resultMap.put("commandMap", commandMap);
    	
        return resultMap;
    }
	
	/**
	* <pre>
	* 1. MethodName : insertEstimatePurchase
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 상품에 대한 구매여부 및 상품견적 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public int insertEstimatePurchase(Map<String, Object> commandMap) throws Exception 
	{
		int result = 0;
		
		//견적상품 사용마스터 등록
		commandMap.put("ESM_PCH_MST_IDX", commandMap.get("ESM_MST_IDX"));
		commandMap.put("ESM_PCH_MST_CD", commandMap.get("ESM_MST_CD"));
		result = defaultDAO.insert("EstimateManagement.insertEstimatePurchase", commandMap);
    	
    	String [] arrESM_PRD_WSH_PRICE = (String[]) commandMap.get("arrESM_PRD_WSH_PRICE");
    	String [] arrESM_PRD_ESM_PRICE = (String[]) commandMap.get("arrESM_PRD_ESM_PRICE");
    	String [] arrOPT_DTL_IDX = (String[]) commandMap.get("arrOPT_DTL_IDX");
    	String [] arrEMS_PRD_CNT = (String[]) commandMap.get("arrEMS_PRD_CNT");
    	String [] arrADD_PRD_MST_CD = (String[]) commandMap.get("arrADD_PRD_MST_CD");
    	String [] arrPRD_OPT_EST_YN = (String[]) commandMap.get("arrPRD_OPT_EST_YN");
    	
    	commandMap.put("ESM_PRD_PCH_IDX", commandMap.get("ESM_PCH_IDX"));
    	int ESM_PRD_UP_IDX = 0;
    	//견적 상품 마스터 등록
    	//필수 옵션이 있으면 해당 필수 옵션이 마스터가 된다. 없다면 마스터는 기본 상품
    	if(arrADD_PRD_MST_CD != null){
    		for(int j = 0; j < arrADD_PRD_MST_CD.length; j++){
    			if(arrPRD_OPT_EST_YN[j].equals("Y")){//필수 옵션 등록
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		commandMap.put("ESM_PRD_UP_IDX", 0);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		ESM_PRD_UP_IDX = StringUtil.getInt(commandMap.get("ESM_PRD_IDX"));
	        		
    			}else if(!arrPRD_OPT_EST_YN[j].equals("Y") && StringUtil.getInt(arrOPT_DTL_IDX[j]) == 0){//일반상품이 마스터(선택옵션이 없을 때)
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", 0);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		commandMap.put("ESM_PRD_UP_IDX", 0);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		ESM_PRD_UP_IDX = StringUtil.getInt(commandMap.get("ESM_PRD_IDX"));
	        		
    			}else if(!arrPRD_OPT_EST_YN[j].equals("Y") && StringUtil.getInt(arrOPT_DTL_IDX[j]) > 0){//선택옵션
    				commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
					commandMap.put("ESM_PRD_UP_IDX", ESM_PRD_UP_IDX);
					result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
					
    			}else{
					commandMap.put("PRD_MST_CD", arrADD_PRD_MST_CD[j]);
	            	commandMap.put("ESM_PRD_WSH_PRICE", arrESM_PRD_WSH_PRICE[j]);
	            	commandMap.put("ESM_PRD_ESM_PRICE", arrESM_PRD_ESM_PRICE[j]);
	            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
	        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
	        		commandMap.put("OPT_DTL_IDX", arrOPT_DTL_IDX[j]);
	        		commandMap.put("ESM_PRD_CNT", arrEMS_PRD_CNT[j]);
	        		result =  defaultDAO.insert("EstimateManagement.insertEstimateProduct", commandMap);
	        		ESM_PRD_UP_IDX = StringUtil.getInt(commandMap.get("ESM_PRD_IDX"));
				}
    			
    		}
    	}
    	
    	/* sms발송을 위한 내역 조회 */
    	// 견적관리 상세 정보 
    	Map<String, Object> estimateInfo = defaultDAO.select("EstimateManagement.selectestimateManagementInfo",commandMap);
    	
    	if(StringUtil.getString(estimateInfo.get("ESM_MST_SMS_SEND_YN")).equals("Y")){//sms수신여부 동의면
    		Map<String, Object> smsMap = new HashMap<String, Object>();
			
			smsMap.put("TR_PHONE", StringUtil.getString(estimateInfo.get("ESM_MST_HP1"),"") + StringUtil.getString(estimateInfo.get("ESM_MST_HP2"),"") + StringUtil.getString(estimateInfo.get("ESM_MST_HP3"),""));  
			smsMap.put("TR_NAME", StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM"),""));  		

			//문자 내용
	    	StringBuffer sb = new StringBuffer();
	        sb.append(StringUtil.getString(propertiesService.getString("app.name")+" ","")+StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM"),"")+"님, 신청하신 견적서에 대한 답변이 등록되었습니다.");
			smsMap.put("TR_MSG", sb.toString());
			
			smsMap = this.sms.sendLongMessage(smsMap);
    	}
    	
    	/* MD견적 등록 시 회원 메일 전송 */
    	Map<String, Object> estimateChkInfo = defaultDAO.select("EstimateManagement.selectEstimateMdProductCount",commandMap);
    	
    	//-- 메일본문 정리
    	// 메일 contents 맵
		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
		String body = "";
		String MAIL_CODE = "";
		
		mailContentsMap.put("estimateInfo", estimateInfo);//견적정보
		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM"))));			// 수신자 이름
		mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
		mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
		mailContentsMap.put("number", new NumberTool());
		
		if(StringUtil.getInt(estimateChkInfo.get("TOT_CNT"),0) < 2){
			MAIL_CODE = "15";
			// 연관 상품 리스트 
	    	commandMap.put("ESM_MST_CD", estimateInfo.get("ESM_MST_CD"));
	    	List<Map<String, Object>> productList = defaultDAO.selectList("EstimateManagement.selectEstimateProductList",commandMap);
	    	
	    	mailContentsMap.put("productList", productList);//견적정보
	    	mailContentsMap.put("productListCnt", productList.size());//견적정보
	    	
	    	//MD견적상품 마스터내용 가져오기
	    	List<Map<String, Object>> mdPchList = defaultDAO.selectList("EstimateManagement.selectEstimateMdPchList",commandMap);
	    	
	    	List<Map<String, Object>> mdPorductList = new ArrayList<Map<String,Object>>();
	    	mdPorductList = defaultDAO.selectList("EstimateManagement.selectEstimateMdProductList",commandMap);
	    	
	    	mailContentsMap.put("mdPchList", mdPchList);//견적정보
	    	mailContentsMap.put("mdPorductList", mdPorductList);//견적정보
			
			
			body = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
			body += VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine, "/MAIL-ESTIMATE-FIRST-SEND.vm", "utf-8", mailContentsMap);
			body += VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
		}else{
			MAIL_CODE = "16";
			commandMap.put("ESM_PRD_PCH_IDX", estimateChkInfo.get("ESM_PRD_PCH_IDX"));
			//MD견적상품 마스터내용 가져오기
	    	List<Map<String, Object>> mdPchList = defaultDAO.selectList("EstimateManagement.selectEstimateMdPchList",commandMap);
	    	
	    	List<Map<String, Object>> mdPorductList = new ArrayList<Map<String,Object>>();
	    	mdPorductList = defaultDAO.selectList("EstimateManagement.selectEstimateMdProductListReSend",commandMap);
	    	
	    	mailContentsMap.put("mdPchList", mdPchList);//견적정보
	    	mailContentsMap.put("mdPorductList", mdPorductList);//견적정보
			
			body = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
			body += VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine, "/MAIL-ESTIMATE-AGAIN-SEND.vm", "utf-8", mailContentsMap);
			body += VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
		}
		//메일 발송용 맵
		Map<String, Object> mailMap = new HashMap<String, Object>();
		
		mailMap.put("MAIL_CODE", MAIL_CODE);	// 이메일 코드
		mailMap.put("MEMBER_EMAIL", StringUtil.getString(estimateInfo.get("ESM_MST_MAIL")) );		// 수신자 이메일
		//mailMap.put("MEMBER_EMAIL", "kmh0703@epasscni.com" );		// 수신자 이메일
		//mailMap.put("MEMBER_EMAIL", "everafterk@epasscni.com" );		// TODO 수신자 이메일
		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM"))));			// 수신자 이름
		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(estimateInfo.get("ESM_MST_MEM_NM")))  + "님 견적신청에 대한 답변이 등록되었습니다. ");	// 메일 제목
		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
		
		this.mail.mailSend(mailMap);
    	
    	
    	return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateEstimatePurchase
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적승인수정
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateEstimatePurchase(Map<String, Object> commandMap) throws Exception 
	{
		int result = 0;
		
		result = defaultDAO.update("EstimateManagement.updateEstimatePurchase", commandMap);
    	
    	return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateEstimatePurchase
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적에 대한 사용유무 수정
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateEstimateManagement(Map<String, Object> commandMap) throws Exception 
	{
		int result = 0;
		
		result = defaultDAO.update("EstimateManagement.updateEstimateManagement", commandMap);
    	
    	return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : insertEstimateManagementRepAjax
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적관리 댓글등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertEstimateManagementRepAjax(Map<String, Object> commandMap) throws Exception 
	{
		int result = 0;
		
    	result = defaultDAO.insert("EstimateManagement.insertEstimateManagementRepAjax", commandMap);
    	
    	return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : estimateManagementRepListAjax
	* 2. ClassName : EstimateManagementServiceImpl.java
	* 3. Comment : 견적관리 댓글 리스트 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> estimateManagementRepListAjax (Map<String, Object> commandMap) throws Exception
    {
    	
        return defaultDAO.selectList("EstimateManagement.estimateManagementRepListAjax", commandMap);
    }

}
