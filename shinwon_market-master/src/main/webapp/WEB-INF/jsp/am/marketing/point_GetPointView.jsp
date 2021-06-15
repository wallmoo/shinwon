<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${list }
<br>
<%-- occurName : ${occurName }
<br>
totalPoint : ${totalPoint }
<br>
totalCount : ${totalCount }
<br>
rank : ${rank }
<br>
occurDate : ${occurDate }
<br>
occurPoint : ${occurPoint }
<br>
 --%>
 
<c:forEach items="${list }" var="map">

</c:forEach> 
</body>
</html>