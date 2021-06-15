<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
/******************************
 * 뒤로가기 제어
 ******************************/
if("<c:out value="${param.noHistoryBack}" />" == "Y"){
    history.pushState(null, null, location.href);
    
    window.onpopstate = function(event) {
        window.history.forward();
    };
}
/**
 * 전역 변수 설정
 * $.params 배열을 전역 변수로 사용합니다.
 * epass.base-0.3.js / ui.js 외 기타 모든 플러그인에서 사용됩니다.
 */
$.params = ($.params !== undefined) ? $.params : [];
$.params.domain = '/am';
$.params.domain = (typeof $.params.domain !== 'undefined') ? $.params.domain : '..';
$.params.STR = (typeof $.params.STR !== 'undefined') ? $.params.STR : []; // 문자열
$.params.nav = (typeof $.params.nav !== 'undefined') ? $.params.nav : [null, null];

// nav 활성화
var currUrl = location.href;
if(currUrl.indexOf('dashboardMain') >= 0){
    $.params.nav = [0];
}else{
    $.params.nav = [<c:out value="${navi1Depth}" />, <c:out value="${navi2Depth}" />, <c:out value="${navi3Depth}" />];
}

$.params.tree = <c:out value="${leftMenuList}" escapeXml="false" />;

</script>
<script src="/am/js/epass.base-0.3.js"></script>
<script src="/am/js/plugins.js"></script>
<script src="/am/js/plugins/jquery.menu-aim.js"></script>  
<script src="/am/js/plugins/nanobar.js"></script>
<script src="/am/js/plugins/alertify.custom-0.3.11.js"></script>
<script src="/am/js/plugins/Chart.bundle.js"></script>
<script src="/am/js/common/jquery.cookie.js"></script>
<script src="/am/js/epass.helper.notify-0.1.js"></script>
<script src="/am/js/epass.modalr-0.1.js"></script>
<!-- run -->  
<script src="/am/js/ui.nav.js"></script>
<script src="/am/js/ui.js"></script>
<script src="/am/js/admin.js"></script>   
<script src="/am/js/common.js"></script>
<script src="/am/js/common/jquery.validate.js"></script>
<!-- common -->