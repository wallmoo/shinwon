package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyProductCommentService.java
 * @Date : 2014. 7. 15.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 상품평을 처리하는 Service Interface
 * @author kanghk
 */
public interface MyProductCommentService {
	
	/**
	* <pre>
	* 1. MethodName : selectMyWritableProductCommentListCount
	* 2. ClassName  : MyProductCommentService.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 작성 가능한 상품후기 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyWritableProductCommentListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMyWritableProductCommentList
	* 2. ClassName  : MyProductCommentService.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 작성 가능한 상품후기 목록 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectMyWritableProductCommentList (Map<String,Object> commandMap) throws Exception;
	
    /**
    * <pre>
    * 1. MethodName : selectMyWrittenProductCommentListCount
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 작성한 상품후기 목록 갯수
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyWrittenProductCommentListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyWrittenProductCommentList
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 작성한 상품후기 목록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectMyWrittenProductCommentList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSimpleProductInfo
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 팝업 > 상품관련 간단한 정보 가져오기(상품이미지, 상품명)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectSimpleProductInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductCommentInfo
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 팝업 > 상품후기 상세정보 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectProductCommentInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertProductComment
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 팝업 > 등록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 6.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertProductComment (MultipartHttpServletRequest request , Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateProductComment
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 팝업 > 수정
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateProductComment (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBanWord
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 등록되어 있는 금칙어 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public String selectBanWord (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderCount
    * 2. ClassName  : MyProductCommentService.java
    * 3. Comment    : 본인 주문이 맞는지 체크
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOrderCount (Map<String,Object> commandMap) throws Exception;
    
}
