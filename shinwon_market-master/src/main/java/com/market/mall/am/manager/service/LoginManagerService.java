package com.market.mall.am.manager.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.manager.service
 * @FileName : LoginManagerService.java
 * @Date : 2014. 3. 21.
 * @프로그램 설명 : 관리자 로그인을 처리하는 Service Interface
 * @author jangsin
 */
@Service
public interface LoginManagerService {

    /**
    * <pre>
    * 1. MethodName : loginProc
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 관리자 로그인을 처리한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 21.
    * </pre>
    *
    * @param admin
    * @param request
    * @return
    * @throws Exception
    */
    public Admin loginProc (Admin admin, HttpServletRequest request, HttpServletResponse response) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertLoginManagerHistroy
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 관리자 로그인 기록을 남긴다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 21.
    * </pre>
    * 
    * @param request
    * @param admin
    * @return
    * @throws Exception
    */
    public int insertLoginManagerHistroy (HttpServletRequest request, Admin admin) throws Exception;
	
}
