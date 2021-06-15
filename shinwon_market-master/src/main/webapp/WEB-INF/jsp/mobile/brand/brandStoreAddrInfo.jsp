<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display marmot"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>매장안내</span></h3>
		    <a href="javascript:;" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- warp -->

				<div class="tab-b"><!-- tab-b -->
				    <ul class="tab">
				        <li class="active"><a href="javascript:;"><span>매장안내</span></a></li>
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandStoreOpenMarmot.do"><span>매장개설문의</span></a></li>
				    </ul>
				</div><!-- // tab-b -->
				<div class="gap">
					<div class="grid section-board section-shop-list mt15"><!-- section-shop-list -->
					    <div class="col-1-1 row">
					        <p class="reset name">
					            <span class="primary">
					                <span class="icon map"><em>위치</em></span><c:out value="${commandMap.searchStoreNm }"/> | <c:out value="${commandMap.searchStoreTel }"/>
					            </span>
					        </p>
					        <p class="reset address">
					            <span class="info"><c:out value="${commandMap.searchStoreAddr }"/></span>
					        </p>
					    </div>
					</div><!-- // section-shop-list -->
	
					<ul class="list list-a mt20"><!-- list -->
					    <li>매장지도 API는 주소기반이므로 실제 위치와 상이할 수 도 있습니다.</li>
					</ul><!-- // list -->
	
					<div class="section-map" id="map" style="width:100%;height:350px;"><!-- section-map -->

				</div><!-- // section-map -->
				</div>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
		</div><!-- // container -->

	</div><!-- // contents -->
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=${commandMap.apiKey }&libraries=services"></script>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

	$(function()
	{
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = 
        {
            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
	    	
    	// 지도를 생성합니다    
    	var map = new daum.maps.Map(mapContainer, mapOption); 
    	
    	// 주소-좌표 변환 객체를 생성합니다
    	var geocoder = new daum.maps.services.Geocoder();
	    	
    	// 주소로 좌표를 검색합니다
    	geocoder.addr2coord('${commandMap.searchStoreAddr}', function(status, result) 
    	{
    	    // 정상적으로 검색이 완료됐으면 
    	     if (status === daum.maps.services.Status.OK) 
    	     {
    	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

    	        // 결과값으로 받은 위치를 마커로 표시합니다
    	        var marker = new daum.maps.Marker(
    	        {
    	            map: map,
    	            position: coords
    	        });

		    	        // 인포윈도우로 장소에 대한 설명을 표시합니다
//		    	         var infowindow = new daum.maps.InfoWindow({
//		    	             content: '<div style="padding:5px;">우리회사</div>'
//		    	         });
//		    	         infowindow.open(map, marker);
		    	        
    	        map.setCenter(coords);
    	    };
    	});
	});
</script>

</body>
</html>