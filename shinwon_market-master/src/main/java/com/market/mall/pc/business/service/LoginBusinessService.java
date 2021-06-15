package com.market.mall.pc.business.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.mall.model.Business;

/**
 * 
 * @PackageName: com.market.mall.pc.business.service
 * @FileName : LoginBusinessService.java
 * @Date : 2016. 2. 5.
 * @프로그램 설명 : 프론트 > 사용자 로그인을 처리하는 Service Interface
 * @author : DEV_LEEKWANGWOON
 */
public interface LoginBusinessService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : loginManagerProc
	 * 2. ClassName  : LoginBusinessService.java
	 * 3. Comment    : 비지니스 로그인
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param business
	 * @param response
	 * @return
	 * @throws Exception
	 */
    public Business loginManagerProc (HttpServletRequest request, Business business,HttpServletResponse response) throws Exception;		
    
    
    /**
     * 
     * <pre>
     * 1. MethodName : selectBusinessInfo
     * 2. ClassName  : LoginBusinessService.java
     * 3. Comment    : 프론트 > 입점신청 > 정보수정
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 11.
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String,Object> selectBusinessInfo (Map<String,Object> commandMap) throws Exception;    
	
	
	/**
	 * <pre>
	 * 1. MethodName : updateBusinessInfo
	 * 2. ClassName  : LoginBusinessService.java
	 * 3. Comment    : 프론트 > 입점신청 > 정보수정 처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 11.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> updateBusinessInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteBusinessInfo
	* 2. ClassName  : LoginBusinessService.java
	* 3. Comment    : 프론트 > 입점신청 > 입점업체 탈퇴
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 5. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> deleteBusinessInfo (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;	
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectCheckBusinessInfoCount
	 * 2. ClassName  : LoginBusinessService.java
	 * 3. Comment    : 프론트 > 입점신청 > 비밀번호 찾기 정보 조회
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 18.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectCheckBusinessInfoCount (Map<String,Object> commandMap) throws Exception;	
    
    /**
     * <pre>
     * 1. MethodName : updateBusinessTempPw
     * 2. ClassName  : LoginBusinessService.java
     * 3. Comment    : 프론트 > 입점신청 > 임시비밀번호 전송
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 18.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBusinessTempPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;    
}
