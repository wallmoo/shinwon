<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.market.mall.model.Code" %><!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
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
<%-- <script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/search/js/jquery.min.js"></script>
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
</head>

<body class="page-detail"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<!-- #container S -->
		<article id="container" class="container" data-role="content">
	
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>상품 상세 보기</h2>
	            <a href="javascript:history.back();" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
			
			<!-- .img_zoom_list S -->
			<dl class="img_zoom_list">
				<dt class="blind">[15년 LG전자/FQ250SC1W] 25평형 휘센 크라 확대 이미지</dt>
				<dd class="dd_img">
					<ui:replaceLineBreak content="${productInfo.PRD_MST_MB_DTL_DSC }"/>
				</dd>
				
			</dl>
			<!--// .img_zoom_list E -->
			
		</article>
		<!--// #container E -->
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">

</body>
</html>