<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    
<body class="page-popup"><!-- page-popup : 620x540 -->

<div id="skipNavigation">
    <a href="#contents">컨텐츠 바로가기</a>
</div>

<div id="popContainer"><!-- popContainer -->

    <h3 class="title">
        <span>상품코드 확인 방법</span>
        <a href="#!" class="close js-close"><span class="icon"><em>창 닫기</em></span></a>
    </h3>

    <div id="popWrapper"><!-- popWrapper -->

        <p class="info">상품코드는 상세정보 페이지 상단에서 상품코드를 복사(Ctrl+C) 하여 붙여넣기(Ctrl+V) 하시면 됩니다.</p>
        <p class="reset">
            <img src="<c:out value="${cdnDomain }"/>/pc/img/modal/product_code_check.png" alt="" />
        </p>        

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<script src="<c:out value="${cdnDomain}"/>/pc/js/plugins.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/epass.base-0.3.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.comboBoxr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.productSlidr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.toggleSlidr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.fxSlider-0.4.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.productViewr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/ui.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/ui.breadcrumb.js"></script>
<script>
$(function(){

});
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>