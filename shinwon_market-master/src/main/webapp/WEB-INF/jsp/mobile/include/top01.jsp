<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta id="viewport" name="viewport" content="initial-scale=1.0, width=device-width, minimum-scale=1.0">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>쑈윈도 | 기획전</title>
    <link rel='shortcut icon' href="/nas/cdn/MW/images/common/ico/favicon.ico" type="image/x-ico">
    <link rel="stylesheet" href="/nas/cdn/MW/css/style.css">
    <script src="/nas/cdn/MW/js/jquery-1.12.4.js"></script>
    <script src="/nas/cdn/MW/js/jquery.easing.1.3.js"></script>
    <script src="/nas/cdn/MW/js/webfont.js"></script>
    <script src="/nas/cdn/MW/js/swiper.js"></script>
    <script src="/nas/cdn/MW/js/ui_common.js"></script>
    <script src="/nas/cdn/MW/js/jquery.dotdotdot.min.js"></script>
</head>
<body>
    <!-- #wrap -->
    <div id="wrap">
	<header id="header">    
    	<div class="header_top cf type_01">
		    <h1>
		        <a href="/mobile/main/index.do" id="logo">쑈윈도</a>
		    </h1>
		    <div class="util_top cf">
		        <button type="button" class="btn_search_open">검색 열기</button>
		        <a href="#">장바구니<span>11</span></a>
		    </div>
		</div>
</header>
        <!-- #header -->
        <%-- <%@ include file="/WEB-INF/jsp/mobile/include/header.jsp" %> --%>
        <!-- <header id="header" w3-include-html="/nas/cdn/MW/inc/header.html"></header> -->
        <!-- // #header -->
        
        <script>
				/* $(function(){
					if(window.location.href.indexOf(target)>=0){return;}
					if(changePasswordPeriod()){
						$("#frmExec").attr({"action":"<c:out value="${frontDomain}" />/mobile/manager/pwChangeForm.do", "target":"_self", "method":"post"}).submit();
					}
				})
				
				changePasswordPeriod = function(){
					
					if(passwordChangeDate == ""){return false;}
					
					var today = new Date()
					var parse = (function(){
						var str = passwordChangeDate;
						var year = str.substr(0, 4);
						var month = str.substr(4, 2);
						var day = str.substr(6, 2);
					
						return new Date(year, month-1, day);
					});
					
					var dateObj = parse();
					
					var betweenDay = parseInt((today.getTime() - dateObj.getTime()) / (1000*60*60*24));
					
					if(betweenDay >= 60){
						return true;
					}else{
						return false;
					};
				}	 */
			</script>
        
        