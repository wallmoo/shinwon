<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.market.mall.model.Code" %>
<!DOCTYPE html>
<!--[if lt IE 7]>               <html lang="ko" class="no-js oldie lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>                  <html lang="ko" class="no-js oldie lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>                  <html lang="ko" class="no-js oldie lt-ie9"> <![endif]-->
<!--[if IE 9]>                  <html lang="ko" class="no-js oldie ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->  <html lang="ko" class="no-js"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MarketPlant</title>
<meta name="author" content="EPASS C&amp;I">
<meta name="description" content="MarketPlant Admin">
<meta name="viewport" content="width=600px">
<link href="<c:out value="${serverDomain}" />/am/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="<c:out value="${serverDomain}" />/am/css/import.css">

<!--[if lte IE 7]><link rel="stylesheet" href="<c:out value="${domain}" />/am/css/font-awesome-ie7.min.css" /><![endif]-->
<script src="<c:out value="${serverDomain}" />/am/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<style>
#loginWrap { left: 0; min-height: 600px; overflow: hidden; position: absolute; top: 0; width: 100%; z-index: 0; }
#loginBG { position: absolute; top: 50%; left: 50%; background: #000; min-height: 1024px; }
#loginBG img { width: 2500px; }
#loginOverlay { position: absolute; left: 0; top: 0; right: 0; bottom: 0; background: url('<c:out value="${serverDomain}" />/am/img/login_overlay.png') left top repeat; }
#loginCore { position: absolute; left: 50%; top: 50%; margin-left: -270px; margin-top: -270px; width: 540px; height: 540px; }
#loginCore h1 { margin: 0 0 40px 0; padding: 0; text-align: center; }
#loginCore h2 { margin: 0; padding: 0 0 14px; color: #fff; }
#loginCore .field { float: left; width: 375px; padding-bottom: 21px; }
#loginCore p { margin: 0; padding: 0; }
#loginCore .field p { margin-bottom: 10px; }
#loginCore .field input.text { margin: 0 0 0 10px; padding: 0; width: 315px; border: solid 1px #fff; vertical-align: middle; font-size: 16px; line-height: 1; }
#loginCore .field i { font-size: 20px; vertical-align: middle; }
#loginCore .field .user-id,
#loginCore .field .user-password { padding: 10px; border-radius: 10px; background: #fff; }
#loginCore .field .save-id { padding-top: 10px; }
#loginCore label { color: #aaa; }
#loginCore .action { float: right; width: 155px; }
#loginCore .action .button { display: block; background-color: #ed1c24; text-align: center; }
#loginCore .action .button span { display: block; font-size: 24px; height: 87px; line-height: 87px; box-sizing: content-box; border-color: #980a10; }
#loginCore .action .button:hover { background-color: #ce060d; }
#loginCore .desc { clear: both; padding-top: 15px; border-top: solid 1px #ccc; }
#loginCore .desc p { margin: 10px 0; color: #999; line-height: 1.4; }
#loginCore .desc p a { color: #fff; }
#loginCore .desc p.copyright { margin-top: 15px; }
#loginCore .by { position: relative; }
#loginCore .by .inner { right: 0; top: 0; margin-bottom: 10px; color: #999; }
#loginCore .by .inner span{ color: #fff; }
#loginCore .company { vertical-align: middle; margin-right: 3px; }
</style>
</head>
<body class="login">

<div id="loginWrap">

    <div id="loginBG">
        <img src="<c:out value="${serverDomain}" />/am/img/bg_login.png" />
    </div>

    <div id="loginOverlay"><!-- overlay --></div>

    <div id="loginCore">

        <h1><img src="<c:out value="${cdnDomain}" /><c:out value="${adminLoginLogo}" />" /></h1>

        <h2><span>PARTNER</span> ADMINISTRATOR LOGIN</h2>
        <div class="holder">
            <form id="frm" name="frm">
                <div class="field">
                    <p class="user-id">
                        <input type="text" id="ADM_MST_ID" name="ADM_MST_ID" class="text" placeholder="아이디" value="ew001" maxlength="15" />
                        <i class="icon-user"></i>
                    </p>
                    <p class="user-password">
                        <input type="password" id="ADM_MST_PWD" name="ADM_MST_PWD" class="text" placeholder="비밀번호" value="swtest123!" maxlength="15" />
                        <i class="icon-key"></i>
                    </p>
                    <p class="save-id">
                        <input type="checkbox" class="checkbox" name="saveId" id="saveId" value="Y"><label for="saveId"> 아이디 저장</label>
                    </p>
                </div>
                <div class="action">
                    <a class="button button-b" id="login" href="javascript:;"><span>LOGIN</span></a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.cookie.js" charset="utf-8"></script>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){

    // 폼체크
    $("#frm").validate({
        rules : {
            ADM_MST_ID : {required : true}, // 아이디
            ADM_MST_PWD : {required : true} // 비밀번호
        }, messages : {
            ADM_MST_ID : {required:"아이디를 입력해주시기 바랍니다."}, // 아이디
            ADM_MST_PWD : {required:"비밀번호를 입력해주시기 바랍니다."} // 비밀번호        
        }
    });
    

    // 쿠키에 저장된 관리자 아이디
    var cookieAdminId = $.cookie("cookieAdminId");
    
    if(cookieAdminId != null && cookieAdminId != ""){ // 쿠키가  존재 할경우
        $("#saveId").attr("checked", "checked");
        $("#ADM_MST_ID").val(cookieAdminId);
        $("#ADM_MST_PWD").focus();
    }else{ // 쿠키가 존재하지 않을경우
        $("#ADM_MST_ID").focus();
    }
    
    // 아이디 form 엔터 이벤트
    $(document).on("keydown", "#ADM_MST_ID", function (e){
        if(e.keyCode == 13){
            login();
            return false;
        }
    });
    
    // 비밀번호 form 엔터 이벤트
    $(document).on("keydown", "#ADM_MST_PWD", function (e) {
        if(e.keyCode == 13){
            login();
            return false;
        }
    });    
    
    // 로그인 버튼 클릭 이벤트
    $(document).on("click", "#login", function (){
        login();
    });
    
    //로그인
    function login(){
        var $frm = $("#frm"); 
        if($frm.valid()){
            //$("#ADM_MST_PWD").val(Base64.encode($("#PASSWD").val()));          
            $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
            return false;
        }
    };  

    <c:if test="${not empty commandMap.ID and not empty commandMap.PW }">
        // ID/PW를 파라메터로 받을시 자동로그인
        $("#ADM_MST_ID").val("<c:out value="${commandMap.ID}"/>");
        $("#ADM_MST_PWD").val("<c:out value="${commandMap.PW}"/>");
        setTimeout(function(){
            login();
        }, 500);
    </c:if>

    // 배경화면 이동 관련
    var x1, y1, x2, y2, bgWidth, bgHeight, mouse=false;
    var mgLB, mgL, mgTB, mgT, wWidth, wHeight, timer;
    var bgspan = $('#loginBG');

    function sizing(){
        wWidth = $(window).width();
        wHeight = $(window).height();       
        if(wWidth>wHeight*1.66) {bgWidth = wWidth;  bgHeight = bgWidth*.6}
        else {bgWidth = wHeight*1.66; bgHeight = wHeight;}

        $('#loginWrap').height(wHeight);
        mgLB = mgL = Number(- bgWidth * 0.55);
        mgTB = mgT = Number(- bgHeight * 0.55);
        bgspan.css({width: bgWidth*1.1, height:bgHeight*1.1, marginLeft: mgLB, marginTop: mgTB});
    }
    sizing();

    $(window).resize(function(){
        clearTimeout(timer);
        timer = setTimeout(sizing, 400);
    });

    $('#loginOverlay').on('mouseenter', function(e){
        mouse = true;
        x1 = x2 = e.pageX;
        y1 = y2 = e.pageY;
    }).on('mousemove', function(e){
        if(mouse){
            x1 = x2;
            y1 = y2;
            x2 = e.pageX;
            y2 = e.pageY;
            mgL -= (x2 - x1)*.05;
            mgT -= (y2 - y1)*.05;
            if(mgL < mgLB*2) mgL = mgLB*2;
            else if(mgL > mgLB*(-2)) mgL = mgLB * (-2);
            if(mgT < mgTB*2) mgT = mgTB*2;
            else if(mgT > mgTB*(-2)) mgT = mgTB * (-2);

            bgspan.stop().animate({
                marginLeft: mgL, 
                marginTop: mgT
            }, 0);
        }
    }).on('mouseleave', function(){ mouse=false;});

    $('body').trigger('mouseenter');
});
</script>
</body>
</html>