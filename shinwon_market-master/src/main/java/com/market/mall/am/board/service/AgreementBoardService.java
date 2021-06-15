package com.market.mall.am.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * @PackageName: com.market.mall.am.board.service
 * @FileName : AgreementBoardService.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 관리자 > 고객센터 > 이용약관관리 처리하는 interface
 * @author DEV_LEESANGWOOK
 */
public interface AgreementBoardService {
	

	/**
	 * <pre>
	 * 1. MethodName : selectAgreementList
	 * 2. ClassName  : AgreementBoardService.java
	 * 3. Comment    : 이용약관 리스트
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectAgreementList (Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectAgreementInfo
	 * 2. ClassName  : AgreementBoardService.java
	 * 3. Comment    : 이용약관 상세
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectAgreementInfo (Map<String, Object> commandMap) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. MethodName : insertAgreementBoard
	 * 2. ClassName  : AgreementBoardService.java
	 * 3. Comment    : 이용약관 등록 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertAgreementBoard(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : updateAgreementBoard
	 * 2. ClassName  : AgreementBoardService.java
	 * 3. Comment    : 이용약관 수정 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateAgreementBoard(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectAgreementBoardTypeCnt
	 * 2. ClassName  : AgreementBoardService.java
	 * 3. Comment    : 이용약관 등록, 수정시에 유형 중복 체크
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectAgreementBoardTypeCnt(Map<String, Object> commandMap) throws Exception;

}
