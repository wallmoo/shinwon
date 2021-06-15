<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<dl class="ui-content">
      <dt>
          <h2>매장위치확인 안내</h2>
          <a href="javascript:$.com.util.layPop('close', $('#shopInfo'), true)" class="btn_close"><span class="blind">팝업 닫기</span></a>
      </dt>
      <dd class="dd_con_d">

          <div class="text-center title">
              <p><strong class="xlarge"><c:out value="${getItNowShopInfo.SHP_MST_NM}"/></strong></p>
              <p class="mt10">매장위치 및 영업시간 안내</p>
          </div>

          <div id="map" class="map mt20"></div>
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

        <p class="mt20">
            <span class="large">매장안내</span>
        </p>

        <table class="table-b table-row mt10"><!-- table-b -->
            <caption>영업시간, 연락처, 대중교통로 구성된 매장안내 테이블입니다.</caption>
            <colgroup>
                <col style="width: 90px;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">영업시간</th>
                    <td>
                        <ul>
                            <li>
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
                            </li>
                            <li>
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
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row">연락처</th>
                    <td><c:out value="${getItNowShopInfo.SHP_MST_TEL }"/> (FAX : <c:out value="${getItNowShopInfo.SHP_MST_FAX }"/>)</td>
                </tr>
                <tr>
                    <th scope="row">대중교통</th>
                    <td><c:out value="${getItNowShopInfo.SHP_MST_MAS_TRS }" escapeXml="false"/></td>
                </tr>
            </tbody>
        </table><!-- // table-b -->
    </dd>
</dl>