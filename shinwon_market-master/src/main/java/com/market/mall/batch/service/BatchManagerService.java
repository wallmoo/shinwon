package com.market.mall.batch.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchManagerService.java
 * @Date : 2014. 8. 5.
 * @프로그램 설명 : 관리자 > 배치작업 관리 를 처리하는 Service Class
 * @author 이미정
 */
public interface BatchManagerService {


    /**
     * <pre>
     * 1. MethodName : selectBatchListCount
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBatchListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectBatchList
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectBatchList(Map<String, Object> commandMap) throws Exception ;
    
    /**
     * <pre>
     * 1. MethodName : insertBatchInfo
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertBatchInfo(Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : updateBatchStdt
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBatchStdt(Map<String, Object> commandMap) throws Exception ;
    
    /**
     * <pre>
     * 1. MethodName : updateBatchEtdt
     * 2. ClassName  : BatchManagerService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 8. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBatchEtdt(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectBatchExcuteYn
     * 2. ClassName		: BatchManagerService.java
     * 3. Commnet		: 배치 스케쥴잡 실행여부 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 19. 오후 5:08:50
     * </pre>
     *
     * @return String
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectBatchExcuteYn(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectBatchExcuteYnList
     * 2. ClassName		: BatchManagerService.java
     * 3. Commnet		: 관리자 > 배치작업 > 배치 스케쥴잡 실행여부 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 19. 오후 6:36:47
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectBatchExcuteYnList(Map<String, Object> commandMap) throws Exception ;


    public int updateBatchExcuteYn(Map<String, Object> commandMap) throws Exception;
}
