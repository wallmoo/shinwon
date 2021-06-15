<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>본사위치</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder info-map">
            <div id="map" class="map mt20"></div>
            <script>
                var marketPlant = {lat: 37.4768505, lng: 126.8789919};

                function initMap() {
                  var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 16,
                    center: marketPlant
                  });

                  var beachMarker = new google.maps.Marker({
                    position: marketPlant,
                    map: map
                  });   
                }
            </script>
            <script async defer src="https://maps.googleapis.com/maps/api/js?signed_in=true&callback=initMap"></script>
        </div>

        <div class="section-button text-left mt15"><!-- section-button -->
            <a href="http://map.naver.com/?dlevel=14&lat=37.5327779&lng=126.9595697&query=7ISc7Jq47Yq567OE7IucIOyaqeyCsOq1rCDssq3tjIzroZwgNzQ%3D&type=ADDRESS&tab=1&enc=b64" class="button small more" target="_blank" title="새 창 열림"><span>네이버 지도</span></a>
            <a href="http://dmaps.kr/yacn" class="button small more" target="_blank" title="새 창 열림"><span>다음 지도</span></a>
            <a href="https://goo.gl/maps/teWCi7v9Yxn" class="button small more" target="_blank" title="새 창 열림"><span>구글 지도</span></a>
        </div><!-- // section-button -->

        <div class="map-guide"><!-- map-guide -->
            <h3 class="blind">찾아오시는 길</h3>
            <ul>
                <li class="col bus">
                    <h4>버스</h4>
                    <i class="icon"><!-- icon --></i>
                    <ul>
                        <li><span class="label line-a">간선</span> 262, 503, 505</li>
                        <li><span class="label line-b">지선</span> 0015, 5012, 7016</li>
                    </ul>
                </li>
                <li class="col metro">
                    <h4>지하철</h4>
                    <i class="icon"><!-- icon --></i>
                    <ul>
                        <li class="nth-child-1">용산역 1번 출구 <span class="small">(전자상가방명 출구, 10분 소요)</span></li>
                        <li class="nth-child-2">신용산역 5번 출구 <span class="small">(전자상가방면 출구, 10분 소요)</span></li>
                        <li class="nth-child-3">효창공원역 3번 출구 <span class="small">(전자상가방면 출구, 15분 소요)</span></li>
                    </ul>
                </li>
            </ul>
        </div><!-- // map-guide -->
    
	</article>
	<!--// #container E -->


<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<script>
$(document).on("click", ".file-list-title", function () {
    var $fileForm = $("#fileForm");
    var $this = $(this);
    $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
    $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
    $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
    $fileForm.attr({"action":"<c:out value="${mobileBrandDomain}"/>/info/intro/introFileDownload.do", "target":"_self", "method":"post"}).submit();
});
</script>

</body>
</html>