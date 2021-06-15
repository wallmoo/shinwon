package com.market.mall.am.customer.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.customer.service
 * @FileName : InquiryService.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 고객센터 > 1:1 문의를 처리하는 Service Interface
 * @author kanghk
 */
public interface InquiryService {

    /**
    * <pre>
    * 1. MethodName : selectInquiryListCount
    * 2. ClassName  : InquiryService.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1문의 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInquiryListCount (Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectInquiryList
    * 2. ClassName  : InquiryService.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1문의 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectInquiryList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectInquiryInfo
    * 2. ClassName  : InquiryService.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1문의 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectInquiryInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateInquiry
    * 2. ClassName  : InquiryService.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1문의 답변 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateInquiry (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertInquiry
    * 2. ClassName  : InquiryService.java
    * 3. Comment    : 관리자 > 고객센터 > 고객상담 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 01. 06.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertInquiry (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	public int selectInfoMemberVendorInquiryListCount(Map<String, Object> commandMap)throws Exception;

	public List<Map<String, Object>> selectInfoMemberVendorInquiryList(Map<String, Object> commandMap)throws Exception;

	public Map<String, Object> selectInfoMemberVendorInquiryDetail(Map<String, Object> commandMap)throws Exception;
	
}
