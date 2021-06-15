package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchBestIconService.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 베스트상품 아이콘 생성 Service Class
 * @author 이미정
 */
public interface BatchBestIconService {


    /**
     * <pre>
     * 1. MethodName : updateBestIcon
     * 2. ClassName  : BatchBestIconService.java
     * 3. Comment    : 관리자 > 베스트상품 아이콘 생성
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> updateBestIcon(Map<String, Object> commandMap) throws Exception ;
}
