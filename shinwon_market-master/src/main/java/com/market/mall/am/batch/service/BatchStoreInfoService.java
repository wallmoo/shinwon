package com.market.mall.am.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchStoreInfoService.java
 * @Date : 2014. 8. 6.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Class
 * @author 이미정
 */
public interface BatchStoreInfoService {


    /**
     * <pre>
     * 1. MethodName : updateStoreInfo
     * 2. ClassName  : BatchStoreInfoService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> updateStoreInfo(Map<String, Object> commandMap) throws Exception ;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: updateStoreLocation
	 * 2. ClassName		: BatchStoreInfoService.java
     * 3. Comment    	: 관리자 > 배치작업 > 매장 GPS 좌표값 셋팅
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 10. 13. 오전 9:45:30
	 * </pre>
	 *
	 * @return Map<String,Object>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateStoreLocation(Map<String, Object> commandMap) throws Exception ;
}
