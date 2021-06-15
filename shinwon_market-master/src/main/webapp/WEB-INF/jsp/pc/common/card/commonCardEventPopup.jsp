<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

<style type="text/css">
.searchPane {display:none;}
</style>

</head>
<body class="popup tooltip" data-size="450x520"><!-- page class : main, 팝업창 크기 -->

<h1 class="sr-only">LNS Mall Popup</h1>

<div id="popupContainer" class="popup-container"><!-- popup-container -->
    
    <h3 class="title">카드혜택안내</h3>
    <a class="stick-right" href="javascript:goPopupClose();">
        <span class="icon close2"></span>
    </a>

    <div class="wrap"><!-- padder -->

        <div class="border-top-thick border-bottom-thick"><!-- form -->
        	
        	<c:out value="${cardInfo.BRD_CAR_CONTENTS}" escapeXml="false"/>
        	
        </div><!-- // form -->

    </div><!-- // wrap -->

</div><!-- // popup-container -->

<script src="<c:out value="${cdnDomain}" />/pc/js/popup.js" charset="utf-8"></script>
<script>
//<![CDATA[
$(function() {
    // window.log('ok!');
});
//]]>
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>