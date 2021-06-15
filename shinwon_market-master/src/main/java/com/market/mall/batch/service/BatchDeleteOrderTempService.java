package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchCartProductService.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Class
 * @author 이미정
 */
public interface BatchDeleteOrderTempService {


    /**
     * <pre>
     * 1. MethodName : updateCartProduct
     * 2. ClassName  : BatchDeleteOrderTempService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> deleteOrderTemp(Map<String, Object> commandMap) throws Exception ;
}
