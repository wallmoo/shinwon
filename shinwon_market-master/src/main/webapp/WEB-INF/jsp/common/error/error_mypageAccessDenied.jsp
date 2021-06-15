<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<head><title>MarketPlant</title></head>
</head>
<body>
<script>
    /* 뒤로가기 방지 */
    history.pushState(null, null, location.href);
    
    window.onpopstate = function(event) {
        window.history.forward();
    };
</script>
<script>
    alert("SNS 회원은 MyPage 이용이 불가능합니다.");
    
    location.href = "<c:out value="${serverDomain}" />/<c:out value="${exception.message}"/>/main/index.do";
</script>
</html>