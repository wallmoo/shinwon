package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : FundingService.java
 * @Date : 2020. 6 10
 * @프로그램 설명 : 관리자 > 프로모션관리 > 펀딩를 처리하는 Service Class
 * @author hjkim
 */
public interface FundingService {

    /**
     * <pre>
     * 1. MethodName : selectFundingCount
     * 2. ClassName  : FundingService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 목록 갯수 
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6 10
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectFundingCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectFundingList
     * 2. ClassName  : FundingService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 목록 
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6 10
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectFundingList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectFundingInfo
     * 2. ClassName  : FundingService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 수정
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6 10
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectFundingInfo(Map<String, Object> commandMap) throws Exception;


   
    /**
     * <pre>
     * 1. MethodName : insertFunding
     * 2. ClassName  : FundingService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 등록 처리   
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6 10
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertFunding(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateFunding
     * 2. ClassName  : FundingService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 수정 처리   
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6 10
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFunding(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateFundingList
     * 2. ClassName  : FundingService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 펀딩 수정 처리   
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6 10
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFundingList(Map<String, Object> commandMap) throws Exception;
    

}
