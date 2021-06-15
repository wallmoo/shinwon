<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body class="page-login"><!-- body class, 중요 -->

<div class="bg css-bg-slideshow"><!-- background slideshow -->
    <div class="item"><span></span></div>
    <div class="item"><span></span></div>
    <div class="item"><span></span></div>
    <div class="item"><span></span></div>
    <div class="item"><span></span></div>
    <div class="item"><span></span></div>
</div><!-- // background slideshow -->

<div class="container">
    <div class="body">
        <div class="inner">
            <div class="logo">
                <img src="<c:out value="${cdnDomain}" /><c:out value="${adminLoginLogo}" />" alt="DingDong" />
            </div>
            <form id="frm" name="frm" method="post">
                <fieldset>
                    <legend>로그인 폼</legend>
                    <p>
                        <input type="text" name="ADM_MST_ID" id="ADM_MST_ID" placeholder="아이디" />
                    </p>
                    <p>
                        <input type="password" name="ADM_MST_PWD" id="ADM_MST_PWD" placeholder="비밀번호" maxlength="15"/>
                    </p>
                    <p>
                        <a href="javascript:goLogin();" class="button primary block"><span>로그인</span></a>
                    </p>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="foot">
        <div class="inner">
            <p>
                COPYRIGHT © MarketPlant All Rights Reserved.
            </p>
        </div>
    </div>
</div>
<script src="/am/js/common/jquery.validate.js"></script>
<script>
$(function(){
    
    $frm = $("#frm");
    
    // 폼체크
    $frm.validate({
        rules: {
            ADM_MST_ID:{required:true}, // 관리자 아이디
            ADM_MST_PWD:{required:true}, // 관리자 비밀번호
        },
        messages :{
            ADM_MST_ID:{required:"아이디를 입력해주시기 바랍니다." }, // 아이디
            ADM_MST_PWD : {required:"비밀번호를 입력해주시기 바랍니다."} // 비밀번호        
        }
    });
    
    // 아이디 엔터 이벤트 
    $("#ADM_MST_ID").on("keydown", function (e) {
        if(e.keyCode == 13){
            goLogin();
            return false;
        }
    });
    
    // 비밀번호 엔터 이벤트 
    $("#ADM_MST_PWD").on("keydown", function (e) {
        if(e.keyCode == 13){
            goLogin();  
            return false;
        }
    });
    
    goLogin = function(){
        if($frm.valid()){
            $frm.attr({"action":"/am/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
        }
    };
});
//-->
</script>
</body>
</html>