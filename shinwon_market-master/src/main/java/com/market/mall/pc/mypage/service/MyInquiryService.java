package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyInquiryService.java
 * @Date : 2014. 7. 14.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 문의내역을 처리하는 Service Interface
 * @author kanghk
 */
public interface MyInquiryService {
    /**
    * <pre>
    * 1. MethodName : selectMyInquiryListCount
    * 2. ClassName  : MyInquiryService.java
    * 3. Comment    : 문의내역 개수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyInquiryListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyInquiryRplCount
    * 2. ClassName : MyInquiryService.java
    * 3. Comment : 1:1문의 답변/미답변 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMyInquiryRplCount(Map<String, Object> commandMap) throws Exception;
    public Map<String, Object> selectMyPageCount(Map<String, Object> commandMap) throws Exception;  
    /**
    * <pre>
    * 1. MethodName : selectMyInquiryList
    * 2. ClassName  : MyInquiryService.java
    * 3. Comment    : 문의내역 리스트
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectMyInquiryList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertInquiry
    * 2. ClassName : MyInquiryService.java
    * 3. Comment : 1:1문의 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 19.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertInquiry (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyInquiryInfo
    * 2. ClassName : MyInquiryService.java
    * 3. Comment : 문의내역 상세보기
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 5. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectMyInquiryInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateInquiry
    * 2. ClassName : MyInquiryService.java
    * 3. Comment : 문의사항 수정
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 5. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateInquiry (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : deleteMyPageInquiry
    * 2. ClassName  : MyInquiryService.java
    * 3. Comment    : 문의내역 삭제
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteMyInquiry (Map<String, Object> commandMap) throws Exception;
}
