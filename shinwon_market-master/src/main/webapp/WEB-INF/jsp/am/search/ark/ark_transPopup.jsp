<%@ page import="java.io.*,java.lang.*,java.net.*,java.util.*"%><%@ page contentType="text/html; charset=UTF-8" language="java" session="false" %><%request.setCharacterEncoding("UTF-8");%>
<%@ include file="/WEB-INF/jsp/am/search/common_zip/WNCollection.jsp" %>
<%
	int timeout = 1000;	// 1000분의 500초 : 0.5초이내에 응답이 없는 경우 연결 종료
	String query = request.getParameter("query");
	String convert = request.getParameter("convert");
	String target = request.getParameter("target");
	String charset = request.getParameter("charset");
	String datatype = request.getParameter("datatype");

	query = URLEncoder.encode(query, "UTF-8");
	
	String url = "http://" + MANAGER_IP + ":" + MANAGER_PORT + "/manager/WNRun.do";
	String param = "query=" + query + "&convert=" + convert + "&target=" + target + "&charset=" + charset + "&datatype=" + datatype;
	out.println(getHtmls(url, param, timeout)); //send url value
%><%!
	public String getHtmls(String receiverURL, String parameter, int timeout) {
		StringBuffer receiveMsg = new StringBuffer();
		HttpURLConnection uc = null;
		try {
			URL servletUrl = new URL(receiverURL);
			uc = (HttpURLConnection) servletUrl.openConnection();
			uc.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			uc.setRequestMethod("POST");
			uc.setDoOutput(true);
			uc.setDoInput(true);
			uc.setUseCaches(false);
			uc.setDefaultUseCaches(false);
			uc.setConnectTimeout(timeout);
			uc.setReadTimeout(timeout);
			DataOutputStream dos = new DataOutputStream (uc.getOutputStream());
			dos.write(parameter.getBytes());
			dos.flush();
			dos.close();
			
			int errorCode = 0;
			// -- Network error check
			//System.out.println("[URLConnection Response Code] " + uc.getResponseCode());
			if (uc.getResponseCode() == HttpURLConnection.HTTP_OK) {
				String currLine = "";
                // UTF-8. ..
                BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF-8"));
                while ((currLine = in.readLine()) != null) {
                	receiveMsg.append(currLine).append("\r\n");
                }
                in.close();
            } else {
                  errorCode = uc.getResponseCode();
                  return receiveMsg.toString();
             }
       } catch(Exception ex) {
            System.out.println(ex);
       } finally {
            uc.disconnect();
       }

       //System.out.println(receiveMsg.toString());
       return receiveMsg.toString();
	}
%>
