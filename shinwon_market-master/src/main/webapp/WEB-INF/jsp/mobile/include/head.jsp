<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.market.mall.model.Code" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>title</title>

<link rel="stylesheet" type="text/css" href="/nas/cdn/pc/css/style.css">
<script>
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());
</script>
<script type="text/javascript" src="/nas/cdn/pc/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 -->
<!--[if lt IE 9]>
<script type="text/javascript" src="/nas/cdn/pc/js/html5.js"></script>
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript" src="/nas/cdn/pc/js/IE8.js"></script>
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="/nas/cdn/pc/js/IE7.js"></script>
<![endif]-->
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.masonry.min.js"></script><!-- 리스트정렬 js -->
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.bxslider.min.js"></script><!-- slider js-->
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.flip.min.js"></script><!-- flip js -->
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/xtractor_cookie.js" charset="utf-8"></script>
<%-- <script type="text/javascript" src="/nas/cdn/pc/js/search/js/jquery.min.js"></script>--%>
<script type="text/javascript" src="/nas/cdn/pc/js/search/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/search/ark/js/beta.fix.js"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/search/ark/js/ark.js"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/placeholders.jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/com.js"></script><!-- 공통 js -->
<script type="text/javascript" src="/nas/cdn/pc/js/search/js/search.js"></script>
