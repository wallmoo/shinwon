<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <script src="<c:out value="${cdnDomain}"/>/mobile/js/plugins.js"></script> --%>
<%-- <script src="<c:out value="${cdnDomain}"/>/mobile/js/plugins/min/owl.carousel-1.3.3.custom.min.js"></script> --%>
<%-- <script src="<c:out value="${cdnDomain}"/>/mobile/js/min/epass.base-0.3.min.js"></script> --%>
<%-- <script src="<c:out value="${cdnDomain}"/>/mobile/js/min/epass.pushr-0.1.min.js"></script> --%>
<script>
// $.params = ($.params !== undefined) ? $.params : [];
// $.domain = (typeof $.domain != 'undefined') ? $.domain : '../nas/cdn';

var cachebuster = Math.round(new Date().getTime() / 1000);

// document.write('<scr'+'ipt src="<c:out value="${cdnDomain}"/>/mobile/js/ui.js?cb='+ cachebuster +'"></scr' + 'ipt>');
document.write('<scr'+'ipt src="<c:out value="${cdnDomain}"/>/mobile/js/common.js?cb='+ cachebuster +'"></scr' + 'ipt>');
</script>
<%-- <script src="<c:out value="${cdnDomain}"/>/mobile/js/min/ui.min.js"></script> --%>
<%-- <script src="<c:out value="${cdnDomain}"/>/mobile/js/common.js"></script> --%>
<script src="<c:out value="${cdnDomain}"/>/mobile/js/jquery.validate.js"></script>
<script>

</script>