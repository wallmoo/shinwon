<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.market.mall.model.Code" %><!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="회사 소개, 직영지점 안내 및 채용 정보 등 제공">
<meta name="title" content="MarketPlant ">
<title>MarketPlant </title>
<link rel="stylesheet" type="text/css" href="<c:out value="${cdnDomain}" />/pc/css/info.css">
<style type="text/css">
<!--
#header .upper .wrap .logo {width: 200px;height: 100px;background-image: url('<c:out value="${cdnDomain}"/><c:out value="${logoUrl}" />');}
-->
</style>
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
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 -->
<!--[if lt IE 9]>
<script type="text/javascript" src="../nas/cdn/pc/js/html5.js"></script>
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript" src="../nas/cdn/pc/js/IE8.js"></script>
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="../nas/cdn/pc/js/IE7.js"></script>
<![endif]-->
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/jquery.bxslider.min.js"></script><!-- slider js-->
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/info_com.js"></script><!-- 공통 js -->
