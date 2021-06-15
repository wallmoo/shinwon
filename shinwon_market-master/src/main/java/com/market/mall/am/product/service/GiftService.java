package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : GiftService.java
 * @Date : 2015. 5. 3.
 * @프로그램 설명 : 관리자 > 상품관리 > 사은품관리를 처리하는 Service Interface
 * @author jesong
 */
public interface GiftService {

    
    /**
    * <pre>
    * 1. MethodName : selectGiftListCount
    * 2. ClassName  : GiftService.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 목록 갯수 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectGiftListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectGiftList
    * 2. ClassName  : GiftService.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 목록 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectGiftList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectGiftInfo
    * 2. ClassName  : GiftService.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 상세정보 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectGiftInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertGift
    * 2. ClassName  : GiftService.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 등록 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertGift (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateGift
    * 2. ClassName  : GiftService.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 수정 
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateGift (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanList
    * 2. ClassName : GiftService.java
    * 3. Comment : 기획전 목록 가져오기 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectPlanList (Map<String, Object> commandMap) throws Exception;
    
}
