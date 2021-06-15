package com.market.mall.ocb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.security.Security;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class OCBUrlCommonUtil {
	
	/**
	 * 전송할 데이터(암호화된)를 가지고 온다. 

	 * @return 결과 문자열
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws UnsupportedEncodingException 
	 */
	public String getEncData(Map<String, String> srchMap, Map<String, String> ocbMap, String encodeKey) throws SQLException, ClassNotFoundException, UnsupportedEncodingException{
		
		StringBuffer sb = new StringBuffer();
		
		String edtOcbRequestType = String.valueOf(srchMap.get("edtOcbRequestType"));                    //url종류
		String edtCustNm         = String.valueOf(srchMap.get("edtCustNm"));                            //고객명
		String edtAuthId         = String.valueOf(srchMap.get("edtAuthId"));                            //인증ID
		String edtAuthPwd        = String.valueOf(srchMap.get("edtAuthPwd"));                           //인증비밀번호
		
		HashMap<String,Object> requestEncMap = new HashMap<String, Object>();
		
		if("auth".equals(edtOcbRequestType)){
			requestEncMap.put("SubMallUserId",          "");						          			//제휴사 회원 ID
			requestEncMap.put("Amount",            "10");						            			//거래금액(Default : 10)
//			requestEncMap.put("UserName",          edtCustNm);						     				//구매자
			requestEncMap.put("UserName",          "");						     				//구매자
			requestEncMap.put("AuthId",            edtAuthId);						     				//인증ID
			requestEncMap.put("AuthPwd",           edtAuthPwd);						     				//인증 비밀번호
		}else if("approval".equals(edtOcbRequestType)){
			requestEncMap.put("SubMallUserId",          "");						          			//제휴사 회원 ID
			requestEncMap.put("Amount",            String.valueOf(ocbMap.get("AMOUNT")));				//거래금액
			requestEncMap.put("Point",             String.valueOf(ocbMap.get("POINT")));			    //사용/적립 포인트
			requestEncMap.put("UserName",          edtCustNm);						     				//구매자
//			requestEncMap.put("UserName",          "");						     				//구매자
			requestEncMap.put("AuthId",            edtAuthId);						     				//인증ID
			requestEncMap.put("AuthPwd",           edtAuthPwd);						     				//인증 비밀번호
			
		}else if("cancel".equals(edtOcbRequestType)){
			requestEncMap.put("Point",             String.valueOf(srchMap.get("POINT")));               //포인트
			requestEncMap.put("AuthId",            String.valueOf(srchMap.get("AUTHID")));              //인증ID
		}else if("inquiryResult".equals(edtOcbRequestType)){
		}else if("inquiryResultApp".equals(edtOcbRequestType)){
		}
		
		/** 파라미터 만들기 **/
		Set<String> set     = requestEncMap.keySet();
		Iterator<String> it = set.iterator();
		String key          = "";
		String value        = "";
		while(it.hasNext()){
			key   = it.next();
			value = String.valueOf(requestEncMap.get(key));
			sb.append(key.concat("=").concat(value).concat(";"));
		}
		/** 파라미터 만들기 **/
		
		SeedMain seed = new SeedMain();
		String seedEncryptContent = seed.seedEncryptECB(sb.toString(), encodeKey);									 //암호화
		String seedEncryptContentUTF8 = URLEncoder.encode(seedEncryptContent, "UTF-8");			         //암호화후 UTF-8인코딩
		
		return seedEncryptContentUTF8;
	}
	
	 /**
	  * 전송하는 부분
	  * @param p_con
	  * @throws IOException
	  */
	 public void send(HttpURLConnection con, byte[] p_writeMsg) throws IOException {
		 
		 /*
	     DataOutputStream dos = new DataOutputStream(con.getOutputStream());
	     dos.write(p_writeMsg);
	     dos.flush();
	     */
		 
		 OutputStream opstrm = con.getOutputStream();
		 try {
			 opstrm.write(p_writeMsg);
			 System.out.println("p_writeMsg"+p_writeMsg.toString());
			 opstrm.flush();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }finally{
			 opstrm.close();
		 }
	     
	 }

	 /**
	  * 수신하는 부분
	  * @param p_con
	  * @throws IOException
	  */
	 public String read(HttpURLConnection con) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	     String strData = null;
	     StringBuffer sb = new StringBuffer();
	     while ((strData = br.readLine()) != null) {
	         sb.append(strData);
	     }
	     return new String(sb.toString().getBytes());
	 }
	 
	 /**
	  * 공통통신세팅
	  * @param p_con
	  * @throws IOException
	  */
	 public void fnCommomUrlSetting() throws IOException {
	     System.setProperty("java.protocol.handler.pkgs","com.sun.net.ssl.internal.www.protocol");
		 com.sun.net.ssl.internal.ssl.Provider provider = new com.sun.net.ssl.internal.ssl.Provider();
		 Security.addProvider(provider);
		 
		//ssl인증통과
		HttpsURLConnection.setDefaultHostnameVerifier(new javax.net.ssl.HostnameVerifier(){ 
			public boolean verify(String hostname, javax.net.ssl.SSLSession sslSession) { 
//					if (hostname.equals("localhost")) { 
				return true; 
//					} 
//					return false; 
			} 
		});
			
	 }
	 
	 /**
	  * request세팅
	  * @param p_con
	  * @throws IOException
	  */
	 public HttpServletRequest fnRequestSetting(HttpServletRequest req) throws IOException {
		 req.setAttribute("REQUEST_TYPE", "POST");
		 req.setCharacterEncoding("UTF-8");
		 
	     return req;
	 }
	 
	 /**
	  * response 세팅
	  * @param p_con
	  * @throws IOException
	  */
	 public HttpServletResponse fnResponseSetting(HttpServletResponse res) throws IOException {
		 res.setCharacterEncoding("UTF-8");
		 res.setContentType("application/json; charset=UTF-8");
		 res.setContentType("text/html; charset=UTF-8");
		 res.setContentType("text/xml; charset=UTF-8");
		
		 return res;
	 }
	 
}
