<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>MarketPlant SHOPPINGMALL</title>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/vendor/jquery-2.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/common.js" charset="utf-8"></script>
</head>
<body>
<script type="text/javascript">
	//var returnUrl = location.pathname + location.search;
	var returnUrl = location.href;
	returnUrl = encodeURIComponent(returnUrl);
	location.href = "/mobile/manager/login.do?url="+returnUrl;

	//alert("사용자 인증 정보를 획득할 수 없습니다.\n로그인 후 이용해 주십시오.");
	//goLogin("<c:out value="${mobileDomain}"/>", document.location.href);
	//document.location.href = "<c:out value="${mobileDomain }"/>/mobile/main/index.do";
</script>
</body>
</html>