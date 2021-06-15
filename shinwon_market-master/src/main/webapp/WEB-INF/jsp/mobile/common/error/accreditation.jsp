<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>MarketPlant SHOPPINGMALL</title>
</head>
<body>
<script type="text/javascript">
    alert("인증된 정보가 존재하지 않습니다.\n실명인증 후 다시 시도 해 주십시오.");
    //history.go(-1);
	//goLogin("<c:out value="${mobileDomain}"/>", document.location.href);
	document.location.href = "<c:out value="${mobileDomain }"/>/mobile/main/index.do";
</script>
</body>
</html>