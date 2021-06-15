<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/JsBarcode.all.min.js"></script><!-- barcode js-->
</head>

<body class="page-mypage"><!-- page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">
		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
		<%-- 각 화면 본문 시작 --%>
		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	 	<!-- #container S -->
	    <article id="container" class="container" data-role="content">
	        <!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>교환권</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="coupon-exchange"><!-- coupon-exchange -->
	            <div class="title">
	                <div class="holder">
	                    <h3>
	                        <span>Get It Now</span>
	                        <strong>겟잇나우 교환권</strong>
	                        <i class="icon"><!-- icon --></i>
	                    </h3>
	                </div>
	            </div>
	
	            <div class="core text-center">
	                <p class="shop">
	                    <strong class="warning"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/>  </strong>
	                </p>
	                <p class="tel">
	                    전화번호 : <a href="tel:<c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>"><c:out value="${getItNowShopInfo.SHP_MST_TEL }"/></a>
	                </p>
	                <p class="code-number">
	                    <span><c:out value="${getItNowShopInfo.ORD_GET_TIK }"/></span>
	                </p>
	                <p class="barcode">
	                    <img id="barcode"/>
	                </p>
	
	                <script>
	                    $("#barcode").JsBarcode("<c:out value="${getItNowShopInfo.ORD_GET_TIK }"/>", {
	                        format:"CODE128C",
	                        displayValue: false,
	                        width: 1.5,
	                        height: 60
	                    });
	                </script>
	            </div>
	
	            <div id="map" class="map mt30"></div>
	            <script>
	            	var latitude = Number(<c:out value="${getItNowShopInfo.SHP_MST_LTTD}"/>);
		      	 	var longitude = Number(<c:out value="${getItNowShopInfo.SHP_MST_LGTD}"/>);
		         	var etLand = {lat: latitude, lng: longitude};
	
	                function initMap() {
	                  var map = new google.maps.Map(document.getElementById('map'), {
	                    zoom: 16,
	                    center: etLand
	                  });
	
	                  var beachMarker = new google.maps.Marker({
	                    position: etLand,
	                    map: map
	                  });   
	                }
	            </script>
	            <script async defer src="https://maps.googleapis.com/maps/api/js?signed_in=true&callback=initMap"></script>
	
	        </div><!-- // coupon-exchange -->
	            
	    </article>
		<!--// #container E -->
		
		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
	</section>
	<!--// #wrap E -->

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

$(function(){
	
});

</script>
</body>
</html>    