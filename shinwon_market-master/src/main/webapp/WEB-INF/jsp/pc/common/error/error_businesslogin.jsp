<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<head><title>title</title></head>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery-2.1.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
</head>
<body>
<script type="text/javascript">
    location.href = "${serverSslDomain}/pc/business/login.do";
    function isIE() { return ((navigator.appName == 'Microsoft Internet Explorer') || ((navigator.appName == 'Netscape') && (new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})").exec(navigator.userAgent) != null)));}
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>