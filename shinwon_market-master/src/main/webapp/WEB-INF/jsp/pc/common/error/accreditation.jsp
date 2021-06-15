<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<head><title>title</title></head>
</head>
<body>
<script type="text/javascript">
    alert("인증된 정보가 존재하지 않습니다.\n실명인증 후 다시 시도 해 주십시오.");
    document.location.href = "<c:out value="${frontDomain }"/>/pc/main/index.do";
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>