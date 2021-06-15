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
import com.market.mall.batch.service.BatchOrderStateFixService;
import com.market.mall.batch.service.BatchOrderStateService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;



import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * 
    * @PackageName: com.market.mall.batch.service.impl
    * @FileName : BatchOrderStateFixServiceImpl.java
    * @Date : 2016. 1. 15.
    * @프로그램 설명 : 배송완료후 7일이 지난 리스트 가져오기
    * @author : DEV_LEEKWANGWOON
 */
@Service("batchOrderStateFixService")
public class BatchOrderStateFixServiceImpl implements BatchOrderStateFixService{

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    @Resource(name="batchOrderStateService") private BatchOrderStateService batchOrderStateService;	
	

    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * <pre>
	 * 1. MethodName : updateOrderStateEnd
	 * 2. ClassName  : BatchOrderStateFixServiceImpl.java
	 * 3. Comment    : 배송완료되고 7일이 지나면 구매확정 처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 3. 10.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public Map<String, Object> updateOrderStateEnd( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
    	
		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND_END);	// 배송완료 상품만
		List<Map<String, Object>> list =  defaultDAO.selectList("BatchOrderStateFix.selectOrderDeliveryFinishList",commandMap);    	

    	for( Map<String,Object>orderMap : list )
    	{
    		//System.out.println("ORD_PRD_IDX >>> "  + StringUtil.getString(orderMap.get("ORD_PRD_IDX"),""));
    		//System.out.println("ORD_MST_CD >>> "  + StringUtil.getString(orderMap.get("ORD_MST_CD")));
    		
    		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_FIX);	// 구매확정
    		commandMap.put("ORD_PRD_IDX", StringUtil.getString(orderMap.get("ORD_PRD_IDX")));	// 주문상품 IDX
    		commandMap.put("ORD_MST_CD",  StringUtil.getString(orderMap.get("ORD_MST_CD")));	// 주문번호

    		// 주문상태값 변경 및 마일리지&캐시백 적립 
    		this.batchOrderStateService.updateOrderState(commandMap);
    	}    	
    	
    	commandMap.put("result", "S");
    	return commandMap;    	
		
    }
	
}
