<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
<script src="<c:out value="${cdnDomain }"/>/mobile/js/jquery.lazyload.js"></script><!-- 이미지 로드 js -->
</head>

<body class="page-detail"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
	
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>매장위치 및 영업시간</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
			
			<!-- .shop_info S -->
			<section class="shop_info">
				<dl>
					<dt>
						<h3><c:out value="${StoreInfo.SHP_MST_NM }" /></h3>
						<h4>매장위치 및 영업시간 안내</h4>
					</dt>
					<dd class="map">
						<div id="map"></div>
					</dd>
					<dd class="tx_info">
						<strong class="ti">매장안내</strong>
						<table>
							<caption></caption>
							<colgroup>
							<col style="width:70px" />
							<col />
							</colgroup>
							<tbody>
								<tr>
									<th><strong>영업시간</strong></th>
									<td>
										<p>
											<c:choose>
												<c:when test="${StoreInfo.SHP_MST_WEK_DAY_GBN eq 'H' }">
													<span><em>평일 :</em> <c:out value="${StoreInfo.SHP_MST_WEK_DAY_ST_HH }" />:<c:out value="${StoreInfo.SHP_MST_WEK_DAY_ST_MM }" />~<c:out value="${StoreInfo.SHP_MST_WEK_DAY_ED_HH }" />:<c:out value="${StoreInfo.SHP_MST_WEK_DAY_ED_MM }" /></span>
												</c:when>
												<c:otherwise>
													<span>평일 :</em> <ui:replaceLineBreak content="${StoreInfo.SHP_MST_WEK_DAY_TXT }"/></span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${StoreInfo.SHP_MST_WEK_END_GBN eq 'H' }">
													<span><em>주말 :</em> <c:out value="${StoreInfo.SHP_MST_WEK_END_ST_HH }" />:<c:out value="${StoreInfo.SHP_MST_WEK_END_ST_MM }" />~<c:out value="${StoreInfo.SHP_MST_WEK_END_ED_HH }" />:<c:out value="${StoreInfo.SHP_MST_WEK_END_ED_MM }" /></span>
												</c:when>
												<c:otherwise>
													<span>주말 :</em> <ui:replaceLineBreak content="${StoreInfo.SHP_MST_WEK_END_TXT }"/></span>
												</c:otherwise>
											</c:choose>
										</p>
									</td>
								</tr>
								<tr>
									<th><strong>연락처</strong></th>
									<td>
										<span><c:out value="${StoreInfo.SHP_MST_TEL }" /></span>
									</td>
								</tr>
								<tr>
									<th><strong>대중교통</strong></th>
									<td>
										<span>
											<ui:replaceLineBreak content="${StoreInfo.SHP_MST_MAS_TRS }"/>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</section>
			<!--// .shop_info E -->
	
		</article>
		<!--// #container E -->
		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script type="text/javascript">
var	map, markers = [];
$.com.detail = $.com.detail || {
	resetMap : function(_xy){
		mapOpt = {
			zoom: 15,
			center: {lat: _xy.lat, lng: _xy.lng},//처음좌표
			mapTypeId: 'roadmap',
			scrollwheel: false
		},
		geocoder = new google.maps.Geocoder();
		map = new google.maps.Map($('#map')[0], mapOpt);

	},//resetMap : function(_xy){
	addMarker :	function (position, title){
		var marker = new google.maps.Marker({
			position: position,
			map: map,
			animation: google.maps.Animation.DROP,
			title: '마켓플랜트 '+title
		});
		map.setCenter(position);
		markers.push(marker);			
	}//addMarker :	function (position, title){
};

$(document).ready(function(){
	var _lat = Number("<c:out value="${StoreInfo.SHP_MST_LTTD }" />");
	var _lng = Number("<c:out value="${StoreInfo.SHP_MST_LGTD }" />");
	
	var _name = $('.shop_info h3').text(),//지점 이름
		_xy = {lat: _lat, lng: _lng};//여기에 좌표값 지정해주면 자동으로 지도위치 찍어줌
	$.com.detail.resetMap(_xy);
	$.com.detail.addMarker(_xy, _name);
});
</script>
</body>
</html>