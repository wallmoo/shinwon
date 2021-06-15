package com.market.mall.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.epasscni.util.StringUtil;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;


public class SessionsUser {

    /**
    * <pre>
    * 1. MethodName : getSessionUserValue
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : Session 정보중 요청한 값을 반환한다.  
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param name
    * @return
    */
    public static String getSessionUserValue(String name)
    {
        return getSessionUserValue(((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest(), name);
    }

    /**
    * <pre>
    * 1. MethodName : getSessionUserValue
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : Session 정보중 요청한 값을 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    * @param name
    * @return
    */
    public static String getSessionUserValue(HttpServletRequest request, String name)
    {
        if (getSessionUserValue(request) == null)
        {
            return "";
        }
        else
        {
            try
            {
            	if( getSessionUserValue(request).get(name)==null) return "";
            	else
            		return getSessionUserValue(request).get(name).toString();
            }
            catch (Exception e) 
            {
                return "";
            }
        }
    }

    /**
    * <pre>
    * 1. MethodName : getSessionUserValue
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : Session 정보중 요청한 값을 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    * @return
    */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> getSessionUserValue(HttpServletRequest request)
    {
        try
        {
            return (Map<String, Object>)request.getSession().getAttribute("__MALL_USER_SESSION_INFO__");
        }
        catch (Exception e)
        {
            return new HashMap<String, Object>();
        }
    }

    /**
     * <pre>
     * 1. MethodName	: setSessionUser
     * 2. ClassName		: SessionsUser.java
     * 3. Comment    	: 회원정보를 Map형태로 Session에 담는다. 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 1. 오후 3:57:37
     * </pre>
     *
     * @return void
     * @param request
     * @param userMap
     */
    @SuppressWarnings("unchecked")
    public static void setSessionUser(HttpServletRequest request, Map<String, Object> userMap){
        HttpSession session = request.getSession();
        Map<String, Object> sessionUserMap = new HashMap<String, Object>();
       // Map<String, Object> crmLoginMap = (Map<String, Object>) userMap.get("crmLoginInfo");
       // Map<String, Object> crmMemberMap = (Map<String, Object>) userMap.get("crmMemberInfo");
        sessionUserMap.put("ROLE_USER", userMap.get("ROLE_USER"));
        
        if (StringUtil.getString(sessionUserMap.get("ROLE_USER")).equals("user"))  // SNS 간편로그인에서도 사용
        {   
            /**************************** 회원정보 ******************************/ 
            sessionUserMap.put("MEM_MST_MEM_ID", StringUtil.getString(userMap.get("MEM_MST_MEM_ID"), ""));
            sessionUserMap.put("MEM_MST_MEM_NM", StringUtil.getString(userMap.get("MEM_MST_MEM_NM"), "")); 
            sessionUserMap.put("MEM_MST_HP", StringUtil.getString(userMap.get("MEM_MST_HP"), ""));           
            sessionUserMap.put("MEM_MST_MAIL", StringUtil.getString(userMap.get("MEM_MST_MAIL"), ""));      
            sessionUserMap.put("MEM_MST_MEM_GRD", StringUtil.getString(userMap.get("MEM_MST_MEM_GRD"), ""));
            sessionUserMap.put("MEM_MST_MEM_GBN", StringUtil.getString(userMap.get("MEM_MST_MEM_GBN"), ""));
            sessionUserMap.put("MEM_MST_MEM_PW_CHG_DT", StringUtil.getString(userMap.get("MEM_MST_MEM_PW_CHG_DT"), ""));
        }
        // 비회원 주문조회
        else if (StringUtil.getString(sessionUserMap.get("ROLE_USER")).equals("order_guest"))
        {
            /************************ 비회원주문조회 정보 ***********************/
            sessionUserMap.put("ORD_MST_CD", StringUtil.getString(userMap.get("ORD_MST_CD"), ""));
            sessionUserMap.put("ORD_MST_ORD_NM", StringUtil.getString(userMap.get("ORD_MST_ORD_NM"), ""));
        }
        
       /* System.out.println("sessionUserMap====================="+sessionUserMap);*/

        session.setAttribute("__MALL_USER_SESSION_INFO__", sessionUserMap);
    }

    /**
    * <pre>
    * 1. MethodName : setSessionClear
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : 세션 정보를 초기화 한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    */
    public static void setSessionClear(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_USER_SESSION_INFO__", null);
        session.invalidate();
    }

    /**
    * <pre>
    * 1. MethodName : getSessionUserMap
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : Session에 담긴 정보를 Map형태로 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    * @return
    */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> getSessionUserMap(HttpServletRequest request){
        try 
        {
            return (Map<String, Object>) request.getSession().getAttribute("__MALL_USER_SESSION_INFO__");
        } 
        catch (Exception e)
        {
            return new HashMap<String, Object>();
        }
    }

    /**
    * <pre>
    * 1. MethodName : getSessionUser
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : Session에 담긴 사용자 정보를 반환한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    * @return
    */
    public static User getSessionUser(HttpServletRequest request)
    {
        try 
        {
            Map<String, Object> userMap = null;
            
            if(isLogin(request) || isNonLogin(request))
            {
                userMap = getSessionUserMap(request);
                User user = new User();
                
                if(StringUtil.getString(userMap.get("ROLE_USER"), "").equals(ROLEUSER.user.toString()))
                { 
                    user.setROLE_USER(ROLEUSER.user);
                    /************************회원정보************************/
                    user.setMEM_MST_MEM_ID				(StringUtil.getString(userMap.get("MEM_MST_MEM_ID"				)));
                    user.setMEM_MST_MEM_NM				(StringUtil.getString(userMap.get("MEM_MST_MEM_NM"				)));
                    user.setMEM_MST_HP			        (StringUtil.getString(userMap.get("MEM_MST_HP"			     	)));  // SNS 계정 로그인에서 사용
                    user.setMEM_MST_MAIL		        (StringUtil.getString(userMap.get("MEM_MST_MAIL"				)));  // SNS 계정 로그인에서 사용
                    user.setMEM_MST_MEM_GBN				(StringUtil.getString(userMap.get("MEM_MST_MEM_GBN"				)));
                    user.setMEM_MST_MEM_PW_CHG_DT		(StringUtil.getString(userMap.get("MEM_MST_MEM_PW_CHG_DT"				)));
                    
                }
                else if(StringUtil.getString(userMap.get("ROLE_USER"), "").equals(ROLEUSER.order_guest.toString()))
                {
                    user.setROLE_USER(ROLEUSER.order_guest);
                    /************************비회원정보***********************/
                    user.setORD_MST_CD(StringUtil.getString(userMap.get("ORD_MST_CD"), ""));
                    user.setORD_MST_ORD_NM(StringUtil.getString(userMap.get("ORD_MST_ORD_NM"), ""));
                }
                else
                {
                    user.setROLE_USER(ROLEUSER.guest);
                }

                return user;

            } 
            else 
            {
                return new User();
            }

        } 
        catch (Exception e)
        {
            return new User();
        }
    }

    /**
    * <pre>
    * 1. MethodName : setAccreditationInfo
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : 아이핀 / NICE 신용정보원 CHECK PLUS  개인정보를 Session에 담는다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param infoMap
    */
    public static void setAccreditationInfo (HttpServletRequest request, Map<String, Object> infoMap)
    {
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_ACCREDITATION_SESSION_INFO__", infoMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : getAccreditationInfo
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : 휴대폰 인증 ==================================아이핀 / NICE 신용정보원 CHECK PLUS  개인정보를 Map 형태로 반환한다.  
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @return
    */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> getAccreditationInfo(HttpServletRequest request)
    {
        try
        {
            return (Map<String, Object>) request.getSession().getAttribute("__MALL_ACCREDITATION_SESSION_INFO__");
        }
        catch (Exception e)
        {
            return new HashMap<String, Object>();
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : setAccreditationClear
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : 아이핀 / NICE 신용정보원 CHECK PLUS Session 정보를 초기화 한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 25.
    * </pre>
    *
    * @param request
    * @throws Exception
    */
    public static void setAccreditationClear (HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        session.setAttribute("__MALL_ACCREDITATION_SESSION_INFO__", null);
    }
    
    /**
    * <pre>
    * 1. MethodName : getSessionUserRole
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : 사용자의 구분값을 반환한다.
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    * @return
    */
    public static ROLEUSER getSessionUserRole(HttpServletRequest request){

        // 회원
        if(isLogin(request))
        {
            Map<String, Object> userMap = getSessionUserMap(request);
            String accessRole = StringUtil.getString(userMap.get("ROLE_USER"), "guest");
            
            if (accessRole.equals(ROLEUSER.user.toString()))
            {
                return ROLEUSER.user;
            } 
            else  if (accessRole.equals(ROLEUSER.order_guest.toString()))
            {
                return ROLEUSER.order_guest;
            } 
            else 
            {
                return ROLEUSER.guest;
            }
        }
        
        // 비회원 구매자
        else if(isNonLogin(request))
        {
            //비회원구매자
        	Map<String, Object> nonUserMap = getSessionUserMap(request);
            String accessRole = StringUtil.getString(nonUserMap.get("ROLE_USER"), "guest");
            
            if (accessRole.equals(ROLEUSER.order_guest.toString()))
            {
                return ROLEUSER.order_guest;
            } 
            else 
            {
                return ROLEUSER.guest;
            }
        } 
        else 
        {
            return ROLEUSER.guest;
        }
    }

    
    /**
    * <pre>
    * 1. MethodName : isLogin
    * 2. ClassName  : SessionsUser.java
    * 3. Comment    : 회원의 로그인을 체크한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 22.
    * </pre>
    *
    * @param request
    * @return
    */
    public static boolean isLogin(HttpServletRequest request){
    	boolean returnValue = false;
    	if(getSessionUserMap(request) != null)
    	{
    		String MEM_MST_MEM_ID = getSessionUserValue("MEM_MST_MEM_ID");
    		
    		if(	!"".equals(StringUtil.getString(MEM_MST_MEM_ID, ""))) 
    		{
    			returnValue = true;
    		}
    	}
        return returnValue;
    }
    
    /**
    	 * <pre>
    	 * 1. MethodName : isOrderAble
    	 * 2. ClassName  : SessionsUser.java
    	 * 3. Comment    : 주문 가능여부 체크 (로그인 or 비회원인증 여부)
    	 * 4. 작성자       : epasscni
    	 * 5. 작성일       : 2014. 5. 14.
    	 * </pre>
    	 *
    	 * @param request
    	 * @return
     */
    public static boolean isOrderAble(HttpServletRequest request){
    	boolean returnValue = false;
    	if(getSessionUserMap(request) != null)
    	{
    		String MEM_MST_MEM_ID = getSessionUserValue("MEM_MST_MEM_ID");
    		
    		if(!"".equals(StringUtil.getString(MEM_MST_MEM_ID, "")))
    		{
    			returnValue = true;
    		}
    	}
    	else
    	{
            Map<String, Object> sessionMap = getAccreditationInfo(request);	
            if(sessionMap != null)
            {
            	if(!"".equals(StringUtil.getString(sessionMap.get("di"), "")) && !"".equals(StringUtil.getString(sessionMap.get("name"), "")) && !"".equals(StringUtil.getString(sessionMap.get("birthdate"), "")) && !"".equals(StringUtil.getString(sessionMap.get("gender"), "")))
        		{
        			returnValue = true;
        		}
            }
    	}
        return returnValue;
    }

    /**
     * <pre>
     * 1. MethodName : isNonLogin
     * 2. ClassName  : SessionsUser.java
     * 3. Comment    : 비회원 구매자의 로그인을 체크한다. 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param request
     * @return
     */
    public static boolean isNonLogin(HttpServletRequest request)
    {
    	boolean returnValue = false;
    	
    	if(getSessionUserMap(request) != null)
    	{
    		String ORD_MST_CD = getSessionUserValue("ORD_MST_CD");
    		String ORD_MST_ORD_NM = getSessionUserValue("ORD_MST_ORD_NM");
    		
    		if(!"".equals(StringUtil.getString(ORD_MST_CD, "")) && !"".equals(StringUtil.getString(ORD_MST_ORD_NM, "")))
    		{
    			returnValue = true;
    		}
    	}
        return returnValue;
    }
}
