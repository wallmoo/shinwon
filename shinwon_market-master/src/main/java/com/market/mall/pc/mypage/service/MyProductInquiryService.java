package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyProductInquiryService.java
 * @Date : 2016. 1. 27.
 * @프로그램 설명 : 프론트 > 마이페이지 > 상품Q&A를 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface MyProductInquiryService {

	/**
	* <pre>
	* 1. MethodName : selectMyProductInquiryListCount
	* 2. ClassName  : MyProductInquiryService.java
	* 3. Comment    : 프론트 > MY LAND > 상품Q&A 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyProductInquiryListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMyProductInquiryList
	* 2. ClassName  : MyProductInquiryService.java
	* 3. Comment    : 프론트 > MY LAND > 상품Q&A 목록 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectMyProductInquiryList (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMyProductInquiryRplCountMap
	* 2. ClassName  : MyProductInquiryService.java
	* 3. Comment    : 마이페이지 메인 > 상품Q&A > 미답변/답변 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectMyProductInquiryRplCountMap (Map<String,Object> commandMap) throws Exception;

	public int updateMyProductInquiry(Map<String, Object> commandMap);

	public Map<String, Object> selectMyQnaInfo(Map<String, Object> commandMap) throws Exception;

	public int deleteMyQna(Map<String, Object> commandMap) throws Exception;

	public int updateMyQna(Map<String, Object> commandMap) throws Exception;

	
	
}
