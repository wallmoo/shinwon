package com.market.mall.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.epasscni.util.StringUtil;
import com.market.mall.model.Business;
import com.market.mall.model.User;
import com.market.mall.model.Business.ROLEBUSINESS;
import com.market.mall.model.User.ROLEUSER;


/**
 * 
 * @PackageName: com.market.mall.common
 * @FileName : SessionsBusiness.java
 * @Date : 2016. 2. 4.
 * @프로그램 설명 : 사업자 세션을 처리하는 Class
 * @author : DEV_LEEKWANGWOON
 */
public class SessionsBusiness {

	
	/**
	 * 
	  * <pre>
	  * 1. MethodName : getSessionBusinessValue
	  * 2. ClassName  : SessionsBusiness.java
	  * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다.
	  * 4. 작성자       : DEV_LEEKWANGWOON
	  * 5. 작성일       : 2016. 2. 4.
	  * </pre>
	  * @param name
	  * @return
	 */
    public static String getSessionBusinessValue(String name)
    {
        return getSessionBusinessValue(((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest(), name);
    }

    /**
     * 
      * <pre>
      * 1. MethodName : getSessionBusinessValue
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @param name
      * @return
     */
    public static String getSessionBusinessValue(HttpServletRequest request, String name)
    {
        if (getSessionBusinessValue(request) == null)
            return "";
        else
        {
            try
            {
                return String.valueOf(getSessionBusinessValue(request).get(name));
            }
            catch (Exception e) {
                return "";
            }
        }
    }

    /**
     * 
      * <pre>
      * 1. MethodName : getSessionBusinessValue
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 세션정보 전체를 반환한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @return
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static Map<String, Object> getSessionBusinessValue(HttpServletRequest request)
    {
        try
        {
            return (Map)request.getSession().getAttribute("__MALL_BUSINESS_SESSION_INFO__");
        }
        catch (Exception e)
        {
            return null;
        }
    }
    
    /**
     * 
      * <pre>
      * 1. MethodName : setSessionBusiness
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 사업자 정보를 세션에 저장한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @param adminMap
     */
    public static void setSessionBusiness(HttpServletRequest request, Map<String, Object> businessMap){
        HttpSession session = request.getSession();
        Map<String, Object> sessionBusinessMap = new HashMap<String, Object>();
         
        System.out.println("--> VDR_LGN_BUSINESSID : " + StringUtil.getString(businessMap.get("VDR_LGN_BUSINESSID"), ""));
        sessionBusinessMap.put("ROLE_BUSINESS", businessMap.get("ROLE_BUSINESS"));
        if (StringUtil.getString(sessionBusinessMap.get("ROLE_BUSINESS")).equals("business"))
        {
            /************************회원정보************************/
        	sessionBusinessMap.put("VDR_LGN_IDX"		, StringUtil.getString(businessMap.get("VDR_LGN_IDX"), ""));
        	sessionBusinessMap.put("VDR_LGN_BUSINESSID"	, StringUtil.getString(businessMap.get("VDR_LGN_BUSINESSID"), ""));
        	sessionBusinessMap.put("VDR_LGN_CEO_NM"		, StringUtil.getString(businessMap.get("VDR_LGN_CEO_NM"), ""));
        	sessionBusinessMap.put("VDR_LGN_NM"			, StringUtil.getString(businessMap.get("VDR_LGN_NM"), ""));
        }
        session.setAttribute("__MALL_BUSINESS_SESSION_INFO__", sessionBusinessMap);

    }
    
    /**
     * 
      * <pre>
      * 1. MethodName : setSessionBusinessClear
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 세션을 삭제한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
     */
    public static void setSessionBusinessClear(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_BUSINESS_SESSION_INFO__", null);
    }

    /**
     * 
      * <pre>
      * 1. MethodName : getSessionBusinessMap
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 세션에 담긴 정보를 Map 형태로 반환한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @return
     */
    @SuppressWarnings("unchecked")
	public static Map<String, Object> getSessionBusinessMap(HttpServletRequest request){
        try {
            return (Map<String, Object>) request.getSession().getAttribute("__MALL_BUSINESS_SESSION_INFO__");
        } catch (Exception e)
        {
            return null;
        }

    }

    
    /**
     * 
      * <pre>
      * 1. MethodName : getSessionBusiness
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 사업자 세션 정보를 반환한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @return
     */
    public static Business getSessionBusiness(HttpServletRequest request){
        try {
            Map<String, Object> businessMap = null;
            if(isLoginBusiness(request)){
            	
            	/*userMap = getSessionUserMap(request);
                User user = new User();
                
                if(StringUtil.getString(userMap.get("ROLE_USER"), "").equals(ROLEUSER.user.toString()))
                {
                    user.setROLE_USER(ROLEUSER.user);
                    *//************************회원정보************************//*
                    user.setMEM_MST_MEM_ID				(StringUtil.getString(userMap.get("MEM_MST_MEM_ID"				)));
                    user.setMEM_MST_MEM_NM				(StringUtil.getString(userMap.get("MEM_MST_MEM_NM"				)));
                }*/
            	
            	
            	
            	businessMap = getSessionBusinessMap(request);
                Business business = new Business();
                if(StringUtil.getString(businessMap.get("ROLE_BUSINESS"), "").equals(ROLEBUSINESS.business.toString()))
                {
                	business.setROLE_BUSINESS(ROLEBUSINESS.business);
                	business.setVDR_LGN_IDX(StringUtil.getString(businessMap.get("VDR_LGN_IDX"), ""));
                	business.setVDR_LGN_BUSINESSID(StringUtil.getString(businessMap.get("VDR_LGN_BUSINESSID"), ""));
                    business.setVDR_LGN_CEO_NM(StringUtil.getString(businessMap.get("VDR_LGN_CEO_NM"), ""));
                    business.setVDR_LGN_NM(StringUtil.getString(businessMap.get("VDR_LGN_NM"), ""));
                    business.setSaveId(StringUtil.getString(businessMap.get("saveId"), "N"));
                }
                else
                {
                	business.setROLE_BUSINESS(ROLEBUSINESS.guest);
                }
                
                return business;
                
            } else {
                return new Business();
            }

        } catch (Exception e)
        {
            return new Business();
        }

    }

    /**
     * 
      * <pre>
      * 1. MethodName : getSessionRoleBusiness
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 사업자 LEVEL을 반환한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @return
     */
    public static ROLEBUSINESS getSessionRoleBusiness(HttpServletRequest request){
        if(isLoginBusiness(request)){
            Map<String, Object> map = getSessionBusinessMap(request);
            String mapRole = StringUtil.getString(map.get("roleBusiness"), "guest");
            if (mapRole.equals(ROLEBUSINESS.business.toString())){
                return ROLEBUSINESS.business;
            } else {
                return ROLEBUSINESS.guest;
            }
        } else {
            return ROLEBUSINESS.guest;
        }
    }

    /**
     * 
      * <pre>
      * 1. MethodName : isLoginBusiness
      * 2. ClassName  : SessionsBusiness.java
      * 3. Comment    : 로그인 유무를 반환한다.
      * 4. 작성자       : DEV_LEEKWANGWOON
      * 5. 작성일       : 2016. 2. 4.
      * </pre>
      * @param request
      * @return
     */
    public static boolean isLoginBusiness(HttpServletRequest request){
    	return getSessionBusinessMap(request) != null;
    }
    
}
