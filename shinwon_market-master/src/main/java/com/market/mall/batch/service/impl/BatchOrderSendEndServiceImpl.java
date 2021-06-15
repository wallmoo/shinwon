package com.market.mall.batch.service.impl;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.batch.service.BatchOrderSendEndService;
import com.market.mall.batch.service.BatchOrderStateService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;



import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.am.batch.service.impl
 * @FileName : BatchOrderSendEndServiceImpl.java
 * @Date : 2015. 7. 8.
 * @프로그램 설명 : 관리자 > 자동배송완료를 처리하는 Service Implement Class
 * @author DEV_KANGHYUNKYU
 */
@Service("batchOrderSendEndService")
public class BatchOrderSendEndServiceImpl implements BatchOrderSendEndService {
	
	 @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	 @Resource(name="propertiesService") protected EgovPropertyService propertiesService;
     @Resource(name="batchOrderStateService") private BatchOrderStateService batchOrderStateService;
	 @Resource(name="orderService") private OrderService orderService;
	 
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : updateOrderState
	 * 2. ClassName  : BatchOrderSendEndServiceImpl.java
	 * 3. Comment    : 주문상태 변경
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 3. 10.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateOrderState( final Map<String, Object> commandMap) throws Exception
	{
		
    	commandMap.put("result", "F");		
		
    	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND); //배송중 상품만
    	List<Map<String, Object>> list =  defaultDAO.selectList("BatchOrderSendEndNew.selectSendingOrder",commandMap);    	
    	
    	
    	for( Map<String,Object>orderMap : list )
    	{
    		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND_END);	// 배송완료
    		commandMap.put("ORD_PRD_IDX", StringUtil.getString(orderMap.get("ORD_PRD_IDX")));	// 주문상품 IDX
    		commandMap.put("ORD_MST_CD",  StringUtil.getString(orderMap.get("ORD_MST_CD")));	// 주문번호	        		
    		batchOrderStateService.updateOrderState(commandMap);		    		
    	}    	
		
    	commandMap.put("result", "S");
    	return commandMap;    	
		
	}
	
	

}
