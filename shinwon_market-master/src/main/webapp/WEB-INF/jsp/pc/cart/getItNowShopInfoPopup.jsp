<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">

  <h1 class="title-b">매장위치 안내</h1>

<div id="popContainer"><!-- popContainer -->

        <div id="popWrapper" class="shop-info"><!-- popWrapper -->
        
        	<div class="ac">
	            <h2><span><c:out value="${getItNowShopInfo.SHP_MST_NM}"/></span></h2>
	            <p class="address large16">
	                <span class="blind">지번주소</span><c:out value="${getItNowShopInfo.SHP_MST_JBN_ADR1}"/><c:out value="${getItNowShopInfo.SHP_MST_JBN_ADR2}"/>
	                <span class="blind">도로명주소</span>(<c:out value="${getItNowShopInfo.SHP_MST_DRO_ADR1}"/><c:out value="${getItNowShopInfo.SHP_MST_DRO_ADR2}"/>)
	            </p>
	        </div>
        
			<div id="map" class="map"></div>
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
	        
	        <h3 class="title">매장안내</h3>

	        <table class="table-a table-row"><!-- table-a -->
		        <caption>영업시간, 연락처, 대중교통으로 구성된 표</caption>
		        <colgroup>
		            <col style="width: 125px;" />
		            <col style="width: auto;" />
		        </colgroup>
		        <tbody>
		            <tr>
		                <th>영업시간</th>
		                <td>
		                	평일 -
				           	<c:choose>
				           		<c:when test="${getItNowShopInfo.SHP_MST_WEK_DAY_GBN eq 'H'}">
				           			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_MM }"/>
				           			~
				           			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_MM }"/>
				           		</c:when>
				           		<c:otherwise>
				           			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_TXT }"/>
				           		</c:otherwise>
				           	</c:choose>
				           	<br/>
				           	주말 -
				           	<c:choose>
				           		<c:when test="${getItNowShopInfo.SHP_MST_WEK_END_GBN eq 'H'}">
				           			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_MM }"/>
				           			~
				           			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_MM }"/>
				           		</c:when>
				           		<c:otherwise>
				           			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_TXT }"/>
				           		</c:otherwise>
				           	</c:choose>
		                </td>
		            </tr>
		            <tr>
		                <th>매장연락처</th>
		                <td><c:out value="${getItNowShopInfo.SHP_MST_TEL }"/> (FAX : <c:out value="${getItNowShopInfo.SHP_MST_FAX }"/>)</td>
		            </tr>
		            <tr>
		                <th>대중교통</th>
		                <td><c:out value="${getItNowShopInfo.SHP_MST_MAS_TRS }" escapeXml="false"/></td>
		            </tr>
		        </tbody>
	        </table><!-- // table-a -->

        </div><!-- // popWrapper -->
    
</div><!-- // popContainer -->

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

</body>
</html>