package com.market.mall.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.epasscni.util.StringUtil;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;


/**
 * @PackageName: com.market.mall.common
 * @FileName : SessionsAdmin.java
 * @Date : 2014. 4. 1.
 * @프로그램 설명 : 관리자 세션을 처리하는 Class
 * @author jangsin
 */
public class SessionsAdmin {

    /**
    * <pre>
    * 1. MethodName : getSessionAdminValue
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param name
    * @return
    */
    public static String getSessionAdminValue(String name){
        return getSessionAdminValue(((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest(), name);
    }

    /**
    * <pre>
    * 1. MethodName : getSessionAdminValue
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param name
    * @return
    */
    public static String getSessionAdminValue(HttpServletRequest request, String name){
        if (getSessionAdminValue(request) == null){
            return "";
        }else{
            try{
                return String.valueOf(getSessionAdminValue(request).get(name));
            }catch (Exception e) {
                return "";
            }
        }
    }

    /**
    * <pre>
    * 1. MethodName : getSessionAdminValue
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션정보 전체를 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @return
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static Map<String, Object> getSessionAdminValue(HttpServletRequest request){
        try{
            return (Map)request.getSession().getAttribute("__MALL_ADMIN_SESSION_INFO__");
        }
        catch (Exception e){
            return null;
        }
    }

    /**
    * <pre>
    * 1. MethodName : setSessionAdmin
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 관리자 정보를 세션에 저장한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param adminMap
    */
    public static void setSessionAdmin(HttpServletRequest request, Map<String, Object> adminMap){
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_ADMIN_SESSION_INFO__", adminMap);
    }

    /**
    * <pre>
    * 1. MethodName : setSessionAdminMenuList
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션에 메뉴 정보를 담는다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param menuList
    */
    public static void setSessionAdminMenuList(HttpServletRequest request, List<Map<String, Object>> menuList){
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_ADMIN_MENU_SESSION_LIST__", menuList);
    }

    /**
    * <pre>
    * 1. MethodName : setSessionAdminClear
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션을 삭제한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    */
    public static void setSessionAdminClear(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_ADMIN_SESSION_INFO__", null);
    }

    /**
    * <pre>
    * 1. MethodName : getSessionAdminMap
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션에 담긴 정보를 Map 형태로 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @return
    */
    @SuppressWarnings("unchecked")
	public static Map<String, Object> getSessionAdminMap(HttpServletRequest request){
        try {
            return (Map<String, Object>) request.getSession().getAttribute("__MALL_ADMIN_SESSION_INFO__");
        } catch (Exception e){
            return null;
        }

    }

    /**
    * <pre>
    * 1. MethodName : getSessionAdmin
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 관리자 세션 정보를 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @return
    */
    public static Admin getSessionAdmin(HttpServletRequest request){
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            if(isLoginAdmin(request)){
                map = getSessionAdminMap(request);
                Admin admin = new Admin();
                admin.setADM_MST_ID(StringUtil.getString(map.get("ADM_MST_ID"), ""));
                admin.setADM_MST_NM(StringUtil.getString(map.get("ADM_MST_NM"), ""));
                admin.setADM_MST_PWD(StringUtil.getString(map.get("ADM_MST_PWD"), ""));
                admin.setADM_MST_HP1(StringUtil.getInt(map.get("ADM_MST_HP1"), 0));
                admin.setADM_MST_HP2(StringUtil.getInt(map.get("ADM_MST_HP2"), 0));
                admin.setADM_MST_HP3(StringUtil.getString(map.get("ADM_MST_HP3"), ""));
                admin.setADM_MST_TEL1(StringUtil.getInt(map.get("ADM_MST_TEL1"), 0));
                admin.setADM_MST_TEL2(StringUtil.getInt(map.get("ADM_MST_TEL2"), 0));
                admin.setADM_MST_TEL3(StringUtil.getString(map.get("ADM_MST_TEL3"), ""));
                admin.setADM_MST_EMAIL_ID(StringUtil.getString(map.get("ADM_MST_EMAIL_ID"), ""));
                admin.setADM_MST_EMAIL_DOMAIN(StringUtil.getString(map.get("ADM_MST_EMAIL_DOMAIN"), ""));
                admin.setAUT_MST_IDX(StringUtil.getInt(map.get("AUT_MST_IDX"), 0));
                admin.setADM_MST_SUB_IDX(StringUtil.getInt(map.get("ADM_MST_SUB_IDX"), -1));
                admin.setSaveId(StringUtil.getString(map.get("saveId"), "N"));
                admin.setRequestUrl(StringUtil.getString(map.get("requestUrl"), ""));
                admin.setRoleAdmin((ROLEADMIN)map.get("roleAdmin"));
                admin.setADM_MST_ERP_NO(StringUtil.getString(map.get("ADM_MST_ERP_NO"),""));
                
                return admin;
                
            } else {
                return new Admin();
            }

        } catch (Exception e)
        {
            return new Admin();
        }

    }

    /**
    * <pre>
    * 1. MethodName : getSessionAdminMenuList
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 세션에 담긴 메뉴 목록을 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @return
    */
    @SuppressWarnings("unchecked")
	public static List<Map<String, Object>> getSessionAdminMenuList(HttpServletRequest request){
        try {
            return (List<Map<String, Object>>) request.getSession().getAttribute("__MALL_ADMIN_MENU_SESSION_LIST__");
        } catch (Exception e){
            return null;
        }

    }

    /**
    * <pre>
    * 1. MethodName : getSessionRoleAdmin
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 관리자 LEVEL을 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @return
    */
    public static ROLEADMIN getSessionRoleAdmin(HttpServletRequest request){
        if(isLoginAdmin(request)){
            Map<String, Object> map = getSessionAdminMap(request);
            String mapRole = StringUtil.getString(map.get("roleAdmin"), "guest");
            if (mapRole.equals(ROLEADMIN.administrator.toString())){
                return ROLEADMIN.administrator;
            } else {
                return ROLEADMIN.guest;
            }
        } else {
            return ROLEADMIN.guest;
        }
    }


    /**
    * <pre>
    * 1. MethodName : isLoginAdmin
    * 2. ClassName  : SessionsAdmin.java
    * 3. Comment    : 로그인 유무를 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @return
    */
    public static boolean isLoginAdmin(HttpServletRequest request){
        return getSessionAdminMap(request) != null;
    }
}
