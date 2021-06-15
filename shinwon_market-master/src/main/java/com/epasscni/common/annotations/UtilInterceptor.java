package com.epasscni.common.annotations;

import java.lang.reflect.Method;

public class UtilInterceptor {
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static Method getMethod(Class thisClass, String requestUri) throws SecurityException, NoSuchMethodException{
        Method thisMethod = null;
        String reqUrl = requestUri.substring(requestUri.lastIndexOf("/") + 1, requestUri.lastIndexOf("."));
        for(Method item : thisClass.getMethods()){
        	if((reqUrl).equals(item.getName())){
                thisMethod = thisClass.getMethod(item.getName(), item.getParameterTypes());
                break;        		
        	}
        }
        return thisMethod;
    }
}
