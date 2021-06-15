<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta id="viewport" name="viewport" content="initial-scale=1.0, width=device-width, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>쑈윈도 | 입점안내</title>
    <link rel='shortcut icon' href="/nas/cdn/PW/html/CC/images/favicon.ico" type="image/x-ico">
    <link rel="stylesheet" href="/nas/cdn/PW/html/CC/css/style.css">
    <script src="/nas/cdn/PW/html/CC/js/jquery-1.12.4.js"></script>
    <script src="/nas/cdn/PW/html/CC/js/webfont.js"></script>
    <script src="/nas/cdn/PW/html/CC/js/swiper.js"></script>
    <script src="/nas/cdn/PW/html/CC/js/ui_common.js"></script>
</head>
<body>
    <!-- wrap -->
    <div id="wrap" class="sub">
        <!-- header -->
        <div id="header">
            <h1 class="logo sub"><a href="/pc/business/businessMain.do"><img src="/nas/cdn/PW/html/CC/images/logo_sub.png" alt="쑈윈도"></a></h1>
            <div class="menu">
                <a href="<c:out value="${serverDomain }"/>/pc/business/standingPointCounselView.do">#입점문의</a>
                <a href="<c:out value="${serverDomain }"/>/pc/business/standingPointApplication.do">#입점신청</a>
                <a href="javascript:;" id="sampleDownload<c:out value="${commandMap.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${commandMap.CMM_FLE_SAVE_PATH }"/>"><c:out value="${commandMap.CMM_FLE_ORG_NM }"/>#제안서 다운로드</a>
            </div>
        </div>
        <!-- //header -->
	<!-- 파일 다운로드용 폼 -->
	<form name="fileForm" id="fileForm">
	     <input type="hidden" name="CMM_FLE_IDX" value=""/>
	     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	</form>          
        

<script>

    

	$(document).on("click", "#sampleDownload",  function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.text().trim());
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
	
</script>