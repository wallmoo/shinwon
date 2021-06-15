package com.market.mall.am.batch.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.stereotype.Service;

import com.market.mall.am.batch.service.BatchCancelOrderService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.am.batch.service.impl
 * @FileName : BatchCancelOrderServiceImpl.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("batchCancelOrderServiceOld")
public class BatchCancelOrderServiceImpl implements BatchCancelOrderService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="orderService") private OrderService orderService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    private MockHttpServletRequest mockRequest;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectCancelOrder
     * 2. ClassName		: BatchCancelOrderServiceImpl.java
     * 3. Commnet		: 배치관리 > 입금만료 무통장 미입금건 주문목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 11:03:46
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCancelOrder(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("ORD_MST_PAY_TYPE", Code.PAY_DEPOSIT);
    	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_PAY_READY);

    	return defaultDAO.selectList("BatchCancelOrderOld.selectCancelOrder",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: updateCancelOrder
     * 2. ClassName		: BatchCancelOrderServiceImpl.java
     * 3. Commnet		: 배치관리 > 입금만료 무통장 미입금건 주문취소처리 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 11:02:41
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> updateCancelOrder( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");

    	mockRequest = new MockHttpServletRequest();
		
		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
		commandMap.put("SELECT_REASON", Code.EXPIRED_DEPOSIT_ORDER_CANCEL_CODE);//자동취소
		commandMap.put("ORD_PRD_DSC", "무통장 입금일 기간 만료 자동취소");//취소사유
		orderService.updateOrderState(commandMap, mockRequest);
    	
    	commandMap.put("result", "S");
    	return commandMap;
    }
    
}
