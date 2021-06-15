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
    <div id="wrap" >
    	<header id="header" class="headerTop">
	   		<div class="header_top cf type_03">
			    <div id="location">
			        <h2><button type="button" class="title_sub"><span>공지사항</span></button></h2>
			        <button type="button" class="btn_history_back" id="history_back">이전</button>
			        <div class="sub_menu_wrap">
			            <ul class="sub_menu_depth_01">
			                <li>
			                    <a href="<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do";>FAQ</a>
			                </li>
			                <li>
			                    <a href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardList.do";>공지사항</a>
			                </li>
			                <li>
			                	<a href="<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryForm.do";>1:1문의</a>
			                </li>
			                <li>
			                    <a href="<c:out value="${mobileDomain}" />/pc/business/businessMain.do" target='_blank'";>입점안내</a>
			                </li>
			        </div>
			        <div class="util_top cf">
			            <button type="button" class="btn_search_open">검색 열기</button>
			            <a href="#">장바구니<span>11</span></a>
			        </div>
			    </div>
			</div>
			
		</header>
		
        <!-- #header -->
        <%-- <%@ include file="/WEB-INF/jsp/mobile/include/header.jsp" %> --%>
        <!-- <header id="header" w3-include-html="/nas/cdn/MW/inc/header.html"></header> -->
        <!-- // #header -->
 <script>
 	$(document).ready(function () {
		$("#history_back").click(function () {
			history.back();
		});
	});
 </script>
        
        