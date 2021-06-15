<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<title>신원몰 | 공통 | 시스템 내부 오류 안내</title>
<link rel='shortcut icon' href="/nas/cdn/PWimages/ico/favicon.ico" type="image/x-ico">
<link rel="stylesheet" type="text/css" href="/nas/cdn/PW/css/style.css">
<script type="text/javascript" src="/nas/cdn/PW/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/nas/cdn/PW/js/ui.common.js"></script>
</head>
<body>
<div id="wrap">
	
	<div id="error">
		<h1 class="logo">SHINWONMALL</h1>
		<h2 class="tit">페이지를 찾을 수 없습니다.</h2>
		<p class="txt">
			죄송합니다! 요청하신 페이지를 찾을 수 없습니다.<br>
			동일한 문제가 지속적으로 발생할 경우 관리자에게 문의해주시기 바랍니다.
		</p>
		<div class="btn_wrap">
			<button class="btn_large ok">메인으로</button>
		</div>
	</div>

</div>
</body>
<script>
	$(function () {
		$(".btn_large.ok").on("click", function () {
			/* location.href = "<c:out value="${frontDomain}"/>/pc/main/index.do"; */
			history.back();
		});
		
	});
</script>
</html>
