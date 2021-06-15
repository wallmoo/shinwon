package com.market.mall.am.batch.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.stereotype.Service;

import com.market.mall.am.batch.service.BatchOrderSendEndService;
import com.market.mall.am.order.service.OrderService;
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
@Service("batchOrderSendEndServiceOld")
public class BatchOrderSendEndServiceImpl implements BatchOrderSendEndService {
	
	 @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	 @Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	 @Resource(name="orderService") private OrderService orderService;
	 
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	    
	 private MockHttpServletRequest mockRequest;

	/**
	* <pre>
	* 1. MethodName : selectSendingOrder
	* 2. ClassName  : BatchOrderSendEndServiceImpl.java
	* 3. Comment    : 배치관리 > 배송중 주문목록 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 7. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSendingOrder(Map<String, Object> commandMap) throws Exception {
    	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND);//배송중 상품만

    	return defaultDAO.selectList("BatchOrderSendEnd.selectSendingOrder",commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : updateSendingOrder
	* 2. ClassName  : BatchOrderSendEndServiceImpl.java
	* 3. Comment    : 배치관리 > 배송중 처리
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 7. 9.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateSendingOrder(Map<String, Object> commandMap) throws Exception {
		commandMap.put("result", "F");

    	mockRequest = new MockHttpServletRequest();
		
		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND_END);
		commandMap.put("ORD_PRD_DSC", "배송 2주 후 자동 배송완료 처리");
		//orderService.updateManualOrderState(mockRequest, commandMap);
    	
    	commandMap.put("result", "S");
    	return commandMap;
	}

}
