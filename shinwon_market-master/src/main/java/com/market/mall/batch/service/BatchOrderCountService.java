package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchOrderCountService.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 상품 판매갯수 업데이트 Service Class
 * @author 이미정
 */
public interface BatchOrderCountService {


    /**
     * <pre>
     * 1. MethodName : updateOrderCount
     * 2. ClassName  : BatchOrderCountService.java
     * 3. Comment    : 관리자 > 상품 판매갯수 업데이트
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> updateOrderCount(Map<String, Object> commandMap) throws Exception ;
}
