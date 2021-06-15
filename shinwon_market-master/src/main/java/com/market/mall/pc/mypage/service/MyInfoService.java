package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyInfoService.java
 * @Date : 2016. 9. 1.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 정보를 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface MyInfoService {
	
    /**
     * <pre>
     * 1. MethodName : selectCheckPwCount
     * 2. ClassName  : MyInfoService.java
     * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 비밀번호체크
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public int selectCheckPwCount (Map<String,Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectMemberInfo
	 * 2. ClassName  : MyInfoService.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 회원상세정보 조회(일반회원,간편회원) 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectMemberInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : updateMyInfo
	 * 2. ClassName  : MyInfoService.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 수정 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> updateMyInfoWithoutErp (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	public Map<String,Object> updateMyInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckCtfEmailCount
	 * 2. ClassName  : MyInfoService.java
	 * 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 간편회원 > 이메일 중복체크 및 인증번호 발송 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 1.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectCheckCtfEmailCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteCtfEmail
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증번호 발송된 간편회원 > 이메일 변경 하지 않을 경우 > 인증번호 받은 이메일 삭제 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 9. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteCtfEmail (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCheckCtfNoCount
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증번호 발송된 간편회원 > 인증번호 체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 9. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectCheckCtfNoCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateMemEmail
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 인증완료된 간편회원 > 이메일 update
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 9. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMemEmail (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/** 
	* <pre>
	* 1. MethodName : selectCompMemberInfo
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 회원상세정보 조회(기업회원) 
	* 4. 작성자       : DEV_KIMYEONGJUN
	* 5. 작성일       : 2016. 9. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectCompMemberInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateMyCompInfo
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원정보수정 > 기업회원 > 수정 
	* 4. 작성자       : DEV_KIMYEONGJUN
	* 5. 작성일       : 2016. 9. 2.
	* </pre>
	*
	* @param request
	* @param commandMap  
	* @return
	* @throws Exception
	*/
	public Map<String,Object> updateMyCompInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
    * <pre>
    * 1. MethodName : updateMyPwd
    * 2. ClassName  : MyInfoService.java
    * 3. Comment    : 프론트 > 회원정보수정 > 비밀번호 수정
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 9. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMyPwd (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCheckOrderCount
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원탈퇴 > 현재 주문이 있는지 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectCheckOrderCount (Map<String,Object> commandMap) throws Exception;

	/**
	* <pre>
	* 1. MethodName : deleteMyInfo
	* 2. ClassName  : MyInfoService.java
	* 3. Comment    : 프론트 > 마이페이지 > 회원탈퇴
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> deleteMyInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

	public List<Map<String, Object>> selectMemberGrade(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	public List<Map<String,Object>> selectYesterdayLoginUser (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

	public void deleteMyInfoList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
};
