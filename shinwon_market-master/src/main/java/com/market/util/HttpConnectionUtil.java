package com.market.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import com.epasscni.util.StringUtil;

public class HttpConnectionUtil {

    public static String postRequest(String pURL, HashMap < String, String > pList, String charset) {
    	return request(pURL, pList, charset,"POST");
    }
    public static String getRequest(String pURL, HashMap < String, String > pList, String charset) {
    	return request(pURL, pList, charset,"GET");
    }
    public static String getRequestJson(String pURL, HashMap < String, String > pList, String charset) {
    	return request(pURL, pList, charset,"GET","application/json");
    }
    public static String request(String pURL,HashMap<String,String >pList,String charset,String method) {
    	return request(pURL, pList, charset,"GET",null);
    }
    public static String request(String pURL,HashMap<String,String >pList,String charset,String method,String contentType) {
    	String myResult = "";
        contentType=StringUtil.getString(contentType,  "application/x-www-form-urlencoded");
    	try {
            //   URL 설정하고 접속하기 
            URL url = new URL(pURL); // URL 설정 

            HttpURLConnection http = (HttpURLConnection) url.openConnection(); // 접속 
            http.setDefaultUseCaches(false);
            http.setDoInput(true); // 서버에서 읽기 모드 지정 
            http.setDoOutput(true); // 서버로 쓰기 모드 지정  
            http.setRequestMethod(method); // 전송 방식은 POST
            http.setRequestProperty("content-type",contentType);
            StringBuffer buffer = new StringBuffer();

            if (pList != null) {

                Set key = pList.keySet();

                for (Iterator iterator = key.iterator(); iterator.hasNext();) {
                    String keyName = (String) iterator.next();
                    String valueName = pList.get(keyName);
                    buffer.append(keyName).append("=").append(valueName);
                }
            }

            OutputStreamWriter outStream = new OutputStreamWriter(http.getOutputStream(), charset);
            PrintWriter writer = new PrintWriter(outStream);
            writer.write(buffer.toString());
            writer.flush();

            InputStreamReader tmp = new InputStreamReader(http.getInputStream(), charset);
            BufferedReader reader = new BufferedReader(tmp);
            StringBuilder builder = new StringBuilder();
            String str;
            while ((str = reader.readLine()) != null) {
                builder.append(str + "\n");
            }
            myResult = builder.toString();
            return myResult;

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    	return myResult;
    }

}