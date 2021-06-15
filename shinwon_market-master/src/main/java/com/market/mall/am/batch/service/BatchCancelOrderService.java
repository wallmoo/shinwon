package com.market.mall.am.batch.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchCancelOrderService.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Class
 * @author 이미정
 */
public interface BatchCancelOrderService {


    /**
     * 
     * <pre>
     * 1. MethodName	: selectCancelOrder
     * 2. ClassName		: BatchCancelOrderService.java
     * 3. Comment    	: 관리자 > 배치작업 - 입금만료 무통장 미입금건 주문취소 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 12. 15. 오후 11:00:58
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
	public List<Map<String, Object>> selectCancelOrder(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : modifyCancelOrder
     * 2. ClassName  : BatchCancelOrderService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> updateCancelOrder(Map<String, Object> commandMap) throws Exception ;
}
