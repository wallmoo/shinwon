package com.market.mall.pc.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.member.service
 * @FileName : JoinMemberService.java
 * @Date : 2016. 8. 30.
 * @프로그램 설명 : 프론트 > 회원가입을 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface JoinMemberService {
	
    /**
     * <pre>
     * 1. MethodName : selectJoinCheck
     * 2. ClassName  : JoinMemberService.java
     * 3. Comment    : 설명추가부분 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String,Object> selectJoinCheck (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckIdCount
	 * 2. ClassName  : JoinMemberService.java
	 * 3. Comment    : 아이디 중복 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 29.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckIdCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertMember  
	* 2. ClassName  : JoinMemberService.java
	* 3. Comment    : 회원 등록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 29.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception 
	*/
	public Map<String,Object> insertMember (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
   /**
    * <pre>
    * 1. MethodName : selectCheckEmailCount
    * 2. ClassName  : JoinMemberService.java
    * 3. Comment    : 이메일 중복체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectCheckEmailCount (Map<String,Object> commandMap) throws Exception;
    
   /**
    * <pre>
    * 1. MethodName : selectCheckCertNoCount
    * 2. ClassName  : JoinMemberService.java
    * 3. Comment    : 인증번호 체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 30.
    * </pre> 
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCheckCertNoCount (Map<String,Object> commandMap) throws Exception;
	   
	/**
	 * <pre>
	 * 1. MethodName : insertSnsMember
	 * 2. ClassName  : JoinMemberService.java
	 * 3. Comment    : SNS 계정으로 회원 등록 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String,Object> insertSnsMember (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckSnsIdCount
	 * 2. ClassName  : JoinMemberService.java
	 * 3. Comment    : 설명추가부분 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception 
	 */
    public int selectCheckSnsIdCount (Map<String,Object> commandMap) throws Exception;	
	
	/**
	* <pre>
	* 1. MethodName : selectCheckBusinessNoCount
	* 2. ClassName  : JoinMemberService.java
	* 3. Comment    : 사업자등록번호 체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 30.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectCheckBusinessNoCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBusinessInfo
	* 2. ClassName  : JoinMemberService.java
	* 3. Comment    : 프론트 > 회원가입 > 기업회원 > 사업자등록번호에 대한 기업의 아이디 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 30.
	* </pre>
    * 
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectBusinessInfo (Map<String,Object> commandMap) throws Exception;
	public int selectCheckNicknameCount (Map<String,Object> commandMap) throws Exception;
	
}
