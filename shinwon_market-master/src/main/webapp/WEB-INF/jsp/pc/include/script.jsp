<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
<script src="/nas/cdn/pc/js/plugins.js"></script>
<script src="/nas/cdn/pc/js/epass.base-0.3.js"></script>
<script src="/nas/cdn/pc/js/min/epass.comboBoxr-0.1.min.js"></script>
<script src="/nas/cdn/pc/js/min/epass.productSlidr-0.1.min.js"></script>
<script src="/nas/cdn/pc/js/min/epass.toggleSlidr-0.1.min.js"></script>
<script src="/nas/cdn/pc/js/min/epass.fxSlider-0.4.min.js"></script>
<script src="/nas/cdn/pc/js/min/epass.productViewr-0.1.min.js"></script>
<script src="/nas/cdn/pc/js/ui.breadcrumb.js"></script>
<script src="/nas/cdn/pc/js/min/epass.datepickr-0.4.min.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/defer.js" ></script>
-->
<script>
$.domain = (typeof $.domain !== 'undefined') ? $.domain : '${cdnDomain}'; 

var cachebuster = Math.round(new Date().getTime() / 1000);

//document.write('<scr'+'ipt src="/nas/cdn/pc/js/ui.js?cb=' +cachebuster+'"></scr' + 'ipt>');
document.write('<scr'+'ipt src="/nas/cdn/pc/js/common.js?cb=' +cachebuster+'"></scr' + 'ipt>');
</script>
<script src="/nas/cdn/pc/js/jquery.validate.js"></script>
<!--  
<script src="<c:out value="${cdnDomain}" />/pc/js/webtoolkit.base64.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/makePCookie.js"></script>
-->
<script>
$(function(){
	
	// 패밀리 사이트 클릭 시
	$("#sel_familySite").on("change",function(){
		var selectFamilySite = $("#sel_familySite option:selected").val();
		
		window.open(selectFamilySite);
	});
});
</script>