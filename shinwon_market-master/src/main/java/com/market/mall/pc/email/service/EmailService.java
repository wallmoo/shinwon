package com.market.mall.pc.email.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.epasscni.util.StringUtil;
import com.market.mall.model.User;

/**
 * 
    * @PackageName: com.market.mall.pc.email.service
    * @FileName : EmailService.java
    * @Date : 2016. 1. 19.
    * @프로그램 설명 : PC Email 상세화면 관련 업무를 처리하는 Service Interface
    * @author : DEV_LEEKWANGWOON
 */
public interface EmailService {
	
	/**
	 * 
	    * <pre>
	    * 1. MethodName : selectMemberEmailInfo
	    * 2. ClassName  : EmailService.java
	    * 3. Comment    : Email 수신거부 회원검색
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 19.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	public Map<String, Object> selectMemberEmailInfo(Map<String, Object> commandMap) throws Exception;
	
	
	/**
	 * 
	    * <pre>
	    * 1. MethodName : updateMemberEmailYn
	    * 2. ClassName  : EmailService.java
	    * 3. Comment    : 회원이메일 수신거부 설정
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 19.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	public int updateMemberEmailYn (Map<String, Object> commandMap) throws Exception;	
	
    
}
