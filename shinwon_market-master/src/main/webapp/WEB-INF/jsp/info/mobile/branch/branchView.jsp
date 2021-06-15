<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>지점안내</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder branch-detail mt30"><!-- branch-detail -->
            <h3><strong class="core"><c:out value="${row.SHP_MST_NM}" /></strong>&nbsp;<c:out value="${row.SHP_MST_TYPE_NM}" /> </h3>

            <table class="table-a table-row" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
            <caption>지점장, 주소, 위치정보, 대표전화, 팩스번호, 주차장시설, 블로그, 영업 시간안내, 대중 교통안내로 구성된 매장 정보 테이블입니다.</caption>
            <colgroup>
                <col style="width: 80px;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th socpe="row">지점장</th>
                    <td><c:out value="${row.SHP_MST_MNG_NM}" /></td>
                </tr>
                <tr>
                    <th socpe="row">주소</th>
                    <td>
                        <p>
                            <span class="semantic">지번주소</span>
                            <c:out value="${row.SHP_MST_JBN_ADR1}" /> <c:out value="${row.SHP_MST_JBN_ADR2}" />
                        </p>
                        <p>
                            <span class="semantic">도로명 주소</span>
                            <c:out value="${row.SHP_MST_DRO_ADR1}" /> <c:out value="${row.SHP_MST_DRO_ADR2}" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <th scope="row">위치정보</th>
                    <td><c:out value="${row.SHP_MST_PST}" /></td>
                </tr>
                <tr>
                    <th socpe="row">대표전화</th>
                    <td><a href="tel:<c:out value="${row.SHP_MST_TEL}" />"><strong><c:out value="${row.SHP_MST_TEL}" /></strong></a></td>
                </tr>
                <tr>
                    <th socpe="row">팩스번호</th>
                    <td><c:out value="${row.SHP_MST_FAX}" /></td>
                </tr>
                <tr>
                    <th socpe="row">주차장시설</th>
                    <td><c:out value="${row.SHP_MST_PRK}" /></td>
                </tr>
                <tr>
                    <th socpe="row">블로그</th>
                    <td>
                        <a href="http://<c:out value="${row.SHP_MST_URL}" />" target="_blank" title="새 창 열림"><c:out value="${row.SHP_MST_URL}" /></a>
                    </td>
                </tr>
                <tr>
                    <th scope="row">영업<br />시간안내</th>
                    <td>
                        <p>평일 <c:if test="${row.SHP_MST_WEK_DAY_GBN eq 'H'}"> <c:out value="${row.SHP_MST_WEK_DAY_ST_HH}" />:<c:out value="${row.SHP_MST_WEK_DAY_ST_MM}" /> ~ <c:out value="${row.SHP_MST_WEK_DAY_ED_HH}" />:<c:out value="${row.SHP_MST_WEK_DAY_ED_MM}" /> </c:if>  
                    <c:if test="${row.SHP_MST_WEK_DAY_GBN eq 'T'}"><c:out value="${row.SHP_MST_WEK_DAY_TXT}" /></c:if></p>
                        <p>주말 <c:if test="${row.SHP_MST_WEK_END_GBN eq 'H'}"> <c:out value="${row.SHP_MST_WEK_END_ST_HH}" />:<c:out value="${row.SHP_MST_WEK_END_ST_MM}" /> ~ <c:out value="${row.SHP_MST_WEK_END_ED_HH}" />:<c:out value="${row.SHP_MST_WEK_END_ED_MM}" /> </c:if>
                    <c:if test="${row.SHP_MST_WEK_END_GBN eq 'T'}"><c:out value="${row.SHP_MST_WEK_END_TXT}" /></c:if></p>
                    </td>
                </tr>
                <tr>
                    <th scope="row">대중<br />교통안내</th>
                    <td>
                        ${row.SHP_MST_MAS_TRS}
                    </td>
                </tr>
            </tbody>
            </table><!-- // table-a -->

            <h4 class="large16">지도정보</h4>

            <div id="map" class="map"></div>
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
            <c:if test="${not empty fileList}">
	            <h4 class="large16">지점사진</h4>
	
	            <ul id="slider"><!-- #slider -->
	            	<c:forEach var="fileRow" items="${fileList }" varStatus="i">
	                <li><a href="javascript:;"><img src="<c:out value="${cdnDomain}" /><c:out value="${fileRow.CMM_FLE_ATT_PATH}" /><c:out value="${fileRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${fileRow.CMM_FLE_ALT_TXT}" />" /></a></li>
	               </c:forEach>
	                
	            </ul><!-- // #slider -->
            </c:if>
        </div><!-- branch-detail -->

        <div class="section-button"><!-- section-button -->
        	<a href="javascript:void(0)" class="_pg_link back button primary"><span>이전</span></a>
            <!--  <a href="<c:out value="${mobileBrandDomain}"/>/info/mobile/branch/branchList.do" class="button primary"><span>이전</span></a>-->
        </div><!-- // section-button -->
    
	</article>
	<!--// #container E -->
<form name="fileForm" id="fileForm">
	<input type="hidden" name="CMM_FLE_IDX" value=""/>
    <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
    <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>
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