package com.market.mall.batch.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.batch.service.BatchRestockRequestService;
import com.market.mall.common.kakao.service.BusinessKakaoTalkService;
import com.market.mall.common.mail.service.MailService;
import com.market.mall.dao.CommonDefaultDAO;

import egovframework.rte.fdl.property.EgovPropertyService;
/**
 * 
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchMemberGradeMonthService.java
 * @Date : 2020. 6. 24.
 * @프로그램 설명 : 재입고알림배치
 * @author : 정경수
 */
@Service("batchRestockRequestService")
public class BatchRestockRequestServiceImpl implements BatchRestockRequestService{
	@Resource(name="mailSendingService") 
	protected MailService mailService;
	
	@Resource(name="kakaoService")
	BusinessKakaoTalkService kakaoService;
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	/**
	 * <pre>
	 * 1. MethodName : updateRestockRequest
	 * 2. ClassName  : BatchRestockRequestService.java
	 * 3. Comment    : 재입고알림배치
	 * 4. 작성자       : 정경수
	 * 5. 작성일       : 2020. 6. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public Map<String, Object> updateRestockRequest(Map<String, Object> commandMap) throws Exception {
		/**
		 *  step 1. 알림회원 조회
         **/
    	List<Map<String, Object>> list =defaultDAO.selectList("batchRestockRequest.selectRestockRequestList", commandMap);
    	
		if (list.size()>0) {
	    	for(int i=0;i<list.size();i++) {
	    		
	    		
	    		/**
	    		 *  step 2. 알림상품 정보 조회
	             **/
	    		commandMap.put("PRD_MST_CD", list.get(i).get("PRD_MST_CD"));
	    		commandMap.put("MEM_RIP_CTG_IDX", list.get(i).get("MEM_RIP_CTG_IDX"));
	        	Map<String, Object> statMap =defaultDAO.selectWithException("batchRestockRequest.selectRestockRequestStat", commandMap);
	        	
	        	//판매가능 상품인경우 알림톡보낸다
	        	if (statMap.get("RST_STAT").equals("T")) {
	        		
	            	try {
	            		/**
	            		 *  step 3. 알림톡전송 
	                     **/
	                	//재입고알림톡
	                	Map<String, Object> result = new HashMap<String, Object>();
	                    Map<String, Object> testParam = new HashMap<String, Object>();
	                    testParam.put("LINK", propertiesService.getString("front.domain")+"/pc/product/productView.do?PRD_CTG_IDX="+list.get(i).get("MEM_RIP_CTG_IDX")+"&PRD_MST_CD="+list.get(i).get("PRD_MST_CD"));
	                    testParam.put("VDR_MST_NM", list.get(i).get("MEM_MST_MEM_NM"));
	                    testParam.put("PHONE", list.get(i).get("MEM_MST_HP"));
	                    testParam.put("CALLBACK", "021234567");
	                    
	                	kakaoService.sendSwd61(testParam);
					} catch (Exception e) {
						// TODO: handle exception
					} finally {
			    		commandMap.put("MEM_RIP_IDX", list.get(i).get("MEM_RIP_IDX"));
						defaultDAO.update("batchRestockRequest.updateRestockRequestStat", commandMap) ;
					}
	        	}
	        	
	    	}
			
		}
    	
    	commandMap.put("result", "S");
    	return commandMap;
	}

}
