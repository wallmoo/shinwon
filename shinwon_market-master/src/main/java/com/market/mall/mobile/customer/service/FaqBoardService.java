package com.market.mall.mobile.customer.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.mobile.customer.service
 * @FileName : FaqBoardService.java
 * @Date : 2016. 2. 12.
 * @프로그램 설명 : 모바일 > 고객센터 > FAQ를 처리하는 Service Interface
 * @author khcho
 */
public interface FaqBoardService {
	/**
	* <pre>
	* 1. MethodName : selectFaqBoardListCount
	* 2. ClassName  : FaqBoardService.java
	* 3. Comment    : FAQ 개수
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectFaqBoardListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectFaqBoardList
	* 2. ClassName  : FaqBoardService.java
	* 3. Comment    : FAQ 목록
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectFaqBoardList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateFaqBoardReadCount
	* 2. ClassName  : FaqBoardService.java
	* 3. Comment    : FAQ 조회수 증가
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateFaqBoardReadCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectFaqCodeList
	* 2. ClassName : FaqBoardService.java
	* 3. Comment : FAQ 하위 카테고리
	* 4. 작성자 : Lee
	* 5. 작성일 : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectFaqCodeList (String faqCode) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectFaqCateNameInfo
	 * 2. ClassName : FaqBoardService.java
	 * 3. Comment : FAQ 상위 카테고리 이름
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param strCmnComIdx
	 * @return
	 * @throws Exception
	 */
	public String selectFaqCateNameInfo(String strCmnComIdx) throws Exception;
}
