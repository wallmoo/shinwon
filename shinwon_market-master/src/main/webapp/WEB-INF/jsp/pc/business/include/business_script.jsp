<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>

	$.domain = (typeof $.domain !== 'undefined') ? $.domain : '${cdnDomain}'; 
	var cachebuster = Math.round(new Date().getTime() / 1000);
	document.write('<scr'+'ipt src="<c:out value="${cdnDomain}"/>/pc/js/common.js?cb=' +cachebuster+'"></scr' + 'ipt>');
</script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/jquery.validate.js"></script>
