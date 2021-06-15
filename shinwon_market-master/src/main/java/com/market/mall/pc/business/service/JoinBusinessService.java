package com.market.mall.pc.business.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.mall.model.Business;

/**
 * @PackageName: com.market.mall.pc.member.service
 * @FileName : JoinMemberService.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 프론트 > 회원가입을 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface JoinBusinessService {
	
	
	

	/**
	 * <pre>
	 * 1. MethodName : selectCheckBusinessNoCount
	 * 2. ClassName  : JoinBusinessService.java
	 * 3. Comment    : 사업자등록번호 체크
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCheckBusinessNoCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertBusiness
	 * 2. ClassName  : JoinBusinessService.java
	 * 3. Comment    : 회원등록
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> insertBusiness (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	
}
