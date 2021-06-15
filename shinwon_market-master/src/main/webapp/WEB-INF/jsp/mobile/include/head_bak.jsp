<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.market.mall.model.Code" %><!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="title" content="마켓플랜트">
<title>마켓플랜트</title>

<link rel="stylesheet" href="<c:out value="${cdnDomain}" />/mobile/css/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" href="<c:out value="${cdnDomain}" />/mobile/css/style.css"><!-- 공통 css-->

<script src="<c:out value="${cdnDomain}" />/mobile/js/jquery-1.11.1.min.js"></script>
<script src="<c:out value="${cdnDomain}" />/mobile/js/common.js"></script>
<script src="<c:out value="${cdnDomain}" />/mobile/js/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/jquery.bxslider.min.js"></script><!-- slider js-->
<script src="<c:out value="${cdnDomain}" />/mobile/js/jquery.lazyload.js"></script><!-- 이미지 로드 js -->
<script src="<c:out value="${cdnDomain}" />/mobile/js/com.js"></script><!-- 공통 js -->
<script src="<c:out value="${cdnDomain}" />/mobile/js/jquery.cookie.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/mobile/js/xtractor_cookie.js" charset="utf-8"></script>
<!-- script 추가 (3/25) -->
<%-- <script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/search/js/jquery.min.js"></script> --%>
<%-- <script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/search/js/jquery-ui.min.js"></script>--%>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/search/ark/js/beta.fix.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/search/ark/js/ark.js"></script> 
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/search/js/search.js"></script>
<script type="text/javascript">
//app 네이티브 연동을 위한 변수
var appType = false;
if(navigator.userAgent.indexOf("MobileApp") > -1 ){
	appType = true;
}
else{
	appType = false;
}
</script>