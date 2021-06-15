<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
<script>
/* 뒤로가기 방지 */
history.pushState(null, null, location.href);

window.onpopstate = function(event) {
    window.history.forward();
};
</script>
</head>
<body><!-- body class, 중요 -->
<form id="frm" name="frm" method="post">
</form>
<script>
$(function(){
    if(<c:out value="${admin.loginStateCode}" /> != 90){
        alert("아이디와 비밀번호 확인 후\n다시 로그인하시기 바랍니다.");
        $("#frm").attr("action", "/am/manager/login.do");
        $("#frm").submit();
    }else{
        $("#frm").attr("action", "/am/main/dashboardMain.do");
        $("#frm").submit();
    }
});
</script>
</body>
</html>