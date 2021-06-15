package com.market.mall.am.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;

import com.epasscni.util.AesCrypto;
import com.epasscni.util.DbCryptoUtil;
import com.epasscni.util.StringHash;
import com.epasscni.util.StringUtil;
import com.market.mall.am.manager.service.LoginManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.manager.service.impl
 * @FileName : LoginManagerServiceImpl.java
 * @Date : 2014. 3. 21.
 * @프로그램 설명 : 관리자 로그인을 처리하는 Service Implement Class
 * @author jangsin
 */
@Service("loginManagerService")
public class LoginManagerServiceImpl implements LoginManagerService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired private
    StringHash stringHash;
    
    /**
    * <pre>
    * 1. MethodName : loginProc
    * 2. ClassName  : LoginManagerServiceImpl.java
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
    @SuppressWarnings("unchecked")
    public Admin loginProc (Admin admin, HttpServletRequest request, HttpServletResponse response) throws Exception{
        Admin returnAdmin = new Admin();
        
        Map<String, Object> userInfo = null;
        //BASE64Decoder decoder = new BASE64Decoder();
        
        String loginId = StringUtil.getString(admin.getADM_MST_ID(), "");
        String loginPw = StringUtil.getString(admin.getADM_MST_PWD(),"");
        
        // 비밀번호 디코딩
        //String loginPw = new String(decoder.decodeBuffer(admin.getADM_MST_PWD()));
        
        if("".equals(loginId)){
            returnAdmin.setLoginStateCode(Code.LOGIN_ID_INVALID);
        }else if("".equals(loginPw)){
            returnAdmin.setLoginStateCode(Code.LOGIN_PW_INVALID);
        }else{
            // cookie setup
            String authinfo = admin.getADM_MST_ID();
            authinfo += "|" + admin.getADM_MST_PWD();
            authinfo += "|" + request.getRemoteAddr();
            
            authinfo = AesCrypto.encrypt(authinfo);
            
            Cookie authinfo_cookie = new Cookie("authinfo", authinfo);
            authinfo_cookie.setPath("/");
            response.addCookie(authinfo_cookie);
            
            // 관리자 정보 조회
            userInfo = (Map<String, Object>) defaultDAO.select("LoginManager.selectLoginManagerInfo", admin);
            
            if (userInfo == null) { // 관리자 정보 없음
                returnAdmin.setLoginStateCode(Code.LOGIN_ID_NULL);
                returnAdmin.setADM_MST_LOGIN_YN("N");
              }
         // DB에 암호화되어 있는경우, 암호화를 해서 DB에 직접 등록한 경우에만 허용
              else if (loginPw.equals(StringUtil.getString(userInfo.get("ADM_MST_PWD"), "")))
              {
//                loginPw = DbCryptoUtil.dbencrypt("table", "hash64", loginPw);
//                String dbLoginPw = new String(decoder.decodeBuffer(StringUtil.getString(userInfo.get("ADM_MST_PWD"), "")));
//                dbLoginPw = DbCryptoUtil.dbencrypt("table", "hash64", dbLoginPw);
            	
            	  // 관리자 아이디 사용 유무
                String useYn = StringUtil.getString(userInfo.get("ADM_MST_STATE"), "N");

                if (useYn.equals("Y"))// 사용중인 아이디
                {
                	//scm은 입점업체만 로그인할 수 있도록 추가.
                  String serverName = request.getServerName().toString();

                //scm에서 접속한 경우에만 체크
                  if (serverName.indexOf("scm") >= 0) {
                    int aut_mst_idx = StringUtil.getInt(userInfo.get("AUT_MST_IDX"));//권한 idx
                    if (30 != aut_mst_idx) {
                      returnAdmin.setLoginStateCode(Code.LOGIN_SITE_NOT_ACCESS);
                      returnAdmin.setADM_MST_ID(loginId);
                      returnAdmin.setADM_MST_LOGIN_YN("N");

                      return returnAdmin;
                    }

                  }
               // 로그인한 사용자 레벨을 사용자 정보에 저장하고 비밀번호를 삭제한다.
                  userInfo.put("roleAdmin", Admin.ROLEADMIN.administrator);
                  userInfo.remove("ADM_MST_PWD");

                  // 관리자 정보를 세션에 저장한다.
                  SessionsAdmin.setSessionAdmin(request, userInfo);

                  // 관리자 메뉴 리스트
                  Map<String, Object> paramMap = new HashMap<String, Object>();
                  paramMap.put("ADM_AUT_MST_IDX", userInfo.get("AUT_MST_IDX"));
                  List menuList = this.defaultDAO.selectList("MenuManager.selectAdminMenuList", paramMap);
               // 관리자 메뉴를 세션에 저장한다.
                  SessionsAdmin.setSessionAdminMenuList(request, menuList);
                  // 로그인한 사용자 아이디, 초기메뉴, 레벨, 로그인 유무를 저장한다.
                  returnAdmin.setADM_MST_ID(loginId);
                  returnAdmin.setRoleAdmin(Admin.ROLEADMIN.administrator);
                  returnAdmin.setLoginStateCode(Code.LOGIN_SUCCESS);
                  returnAdmin.setADM_MST_LOGIN_YN("Y");
                }
                else {// 사용이 중지된 아이디
                  returnAdmin.setLoginStateCode(Code.LOGIN_STOP_LOGIN);
                  returnAdmin.setADM_MST_ID(loginId);
                  returnAdmin.setADM_MST_LOGIN_YN("N");
                }
              } else {
                returnAdmin.setLoginStateCode(Code.LOGIN_PW_INCORRECT);
                returnAdmin.setADM_MST_ID(loginId);
                returnAdmin.setADM_MST_LOGIN_YN("N");
              
            }
        }
        return returnAdmin;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertLoginManagerHistroy
    * 2. ClassName  : LoginManagerServiceImpl.java
    * 3. Comment    : 관리자 로그인 이력을 남긴다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 21.
    * </pre>
    *
    * @param request
    * @param admin
    * @return
    * @throws Exception
    */
    public int insertLoginManagerHistroy (HttpServletRequest request, Admin admin) throws Exception{
        Map<String, Object> commandMap = new HashMap<String, Object>();
        
        commandMap.put("ADM_ADM_MST_ID", admin.getADM_MST_ID());
        commandMap.put("ADM_MST_LOGIN_YN", admin.getADM_MST_LOGIN_YN());
        commandMap.put("ADM_MST_REG_IP", request.getRemoteAddr());
        return defaultDAO.insert("LoginManager.insertLoginManagerHistroy", commandMap);
    }
}
