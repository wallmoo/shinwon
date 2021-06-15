package com.market.mall.mobile.theme.category.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.theme.category.service
 * @FileName : WeddingService.java
 * @Date : 2016. 1. 11.
 * @프로그램 설명 : 프론트 > 테마카테고리 > 웨딩 Service Interface
 * @author Lee
 */
public interface WeddingService {
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectWeddingMain
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인화면
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectWeddingMain(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : getGuide3DepList
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 웨딩가이드 3depth 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List getGuide3DepList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectWeddingContentsListCount
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 수
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectThemeGuideContentsListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectWeddingContentsList
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectThemeGuideContentsList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectWeddingContenInfo
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 웨딩 > 메인 > 컨테츠 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectWeddingContenInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectSingleKingMain
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 싱글킹 > 메인 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectSingleKingMain(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectWeddingDepList
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 2depth , 3depth 가져오기 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectWeddingDepList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectWeddingProductList
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 모바일 > 테마카테고리 > 웨딩 > 상세 별 관련 상품 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectWeddingProductList(Map<String, Object> commandMap)throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : qnaReqAjax
	 * 2. ClassName : WeddingService.java
	 * 3. Comment : 모바일 > 테마카테고리 > 매거진 > qna 등록 ajax 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String qnaReqAjax(Map<String, Object> commandMap) throws Exception;	

}
