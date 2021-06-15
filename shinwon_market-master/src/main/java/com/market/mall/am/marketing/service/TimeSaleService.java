package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : TimeSaleService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 타임세일를 처리하는 Service Class
 * @author khcho
 */
public interface TimeSaleService {

    /**
     * <pre>
     * 1. MethodName : selectTimeSaleCount
     * 2. ClassName  : TimeSaleService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectTimeSaleCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectTimeSaleList
     * 2. ClassName  : TimeSaleService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectTimeSaleList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectTimeSaleInfo
     * 2. ClassName  : TimeSaleService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 수정
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * 5. 수정일       : 2020. 06. 09.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectTimeSaleInfo(Map<String, Object> commandMap) throws Exception;


   
    /**
     * <pre>
     * 1. MethodName : insertTimeSale
     * 2. ClassName  : TimeSaleService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 등록 처리   
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertTimeSale(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateTimeSale
     * 2. ClassName  : TimeSaleService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 타임세일 수정 처리   
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateTimeSale(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
 
    public int updateTimeSaleList(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectTimeSaleProductList(Map<String, Object> commandMap) throws Exception;
    
    public int selectSearchTimeSaleProductCount(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSearchTimeSaleProductList(Map<String, Object> commandMap) throws Exception;
    
}
