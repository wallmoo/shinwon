<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-about">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>지점안내</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
             <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <strong>지점안내</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <div id="lnb"><!-- #lnb -->
            <h2 class="reset">지점안내</h2>

            <div class="customer-center"><!-- customer-center -->
                <p class="reset tel">
                    마켓플랜트 직영점 고객센터
                    <strong class="large22"></strong>     
                </p>
                <ul class="reset">
                    <li>평일 <strong>09:30 ~ 18:30</strong></li>
                    <li>토/일/공휴일<strong>09:30 ~ 17:30</strong></li>
                </ul>
            </div><!-- // customer-center -->
        </div><!-- // #lnb -->

        <div id="contents"><!-- #contents -->

            <h3 class="title">지점안내</h3>
            
            <hr class="hr-a" />
			<div class="map_d map_view">
				<!-- .tel_time s -->
				<div class="tel_time">
					<p class="tx_tel">
						<span>마켓플랜트 직영점 고객센터</span>
						<strong></strong>
					</p>
					<p class="tx_time">
						<span>평일</span>
						<span>09:30 ~ 18:30</span>
					</p>
					<p class="tx_time">
						<span>토/일/공휴일</span>
						<span>09:30 ~ 17:30</span>
					</p>
				</div>
				<!--// .tel_time e -->
				<div class="con_d">
		            <h4 class="title-branch"><span class="core"><c:out value="${row.SHP_MST_NM}" /></span>&nbsp;&nbsp;<span class="large16"><c:out value="${row.SHP_MST_TYPE_NM}" /> </span></h4>
		
		            <table class="table-a table-row" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
		            <caption>지점장, 주소 및  위치정보, 대표전화, 팩스번호, 주차장시설, 블로그, 영업시간안내, 대중교통안내로 구성된 용산점 상세정보 테이블입니다.</caption>
		            <colgroup>
		                <col style="width: 150px;" />
		                <col style="width: 30%;" />
		                <col style="width: 150px;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th socpe="row">지점장</th>
		                    <td colspan="3"><c:out value="${row.SHP_MST_MNG_NM}" /></td>
		                </tr>
		                <tr>
		                    <th socpe="row">대표전화</th>
		                    <td><c:out value="${row.SHP_MST_TEL}" /></td>
		                    <th socpe="row">팩스번호</th>
		                    <td><c:out value="${row.SHP_MST_FAX}" /></td>
		                </tr>
		                <tr>
		                	<th socpe="row">영업시간안내</th>
		                    <td>평일 <c:if test="${row.SHP_MST_WEK_DAY_GBN eq 'H'}"> <c:out value="${row.SHP_MST_WEK_DAY_ST_HH}" />:<c:out value="${row.SHP_MST_WEK_DAY_ST_MM}" /> ~ <c:out value="${row.SHP_MST_WEK_DAY_ED_HH}" />:<c:out value="${row.SHP_MST_WEK_DAY_ED_MM}" /> </c:if>  
		                    <c:if test="${row.SHP_MST_WEK_DAY_GBN eq 'T'}"><c:out value="${row.SHP_MST_WEK_DAY_TXT}" /></c:if><br />
		                    	주말 <c:if test="${row.SHP_MST_WEK_END_GBN eq 'H'}"> <c:out value="${row.SHP_MST_WEK_END_ST_HH}" />:<c:out value="${row.SHP_MST_WEK_END_ST_MM}" /> ~ <c:out value="${row.SHP_MST_WEK_END_ED_HH}" />:<c:out value="${row.SHP_MST_WEK_END_ED_MM}" /> </c:if>
		                    <c:if test="${row.SHP_MST_WEK_END_GBN eq 'T'}"><c:out value="${row.SHP_MST_WEK_END_TXT}" /></c:if>
		                    </td>
		                    <th socpe="row">주차장시설</th>
		                    <td><c:out value="${row.SHP_MST_PRK}" /></td>
		                </tr>
		                <tr>
		                    <th socpe="row">블로그</th>
		                    <td colspan="3">
		                        <a href="http://<c:out value="${row.SHP_MST_URL}" />" target="_blank" title="새 창 열림"><c:out value="${row.SHP_MST_URL}" /></a>
		                    </td>
		                </tr>
		                <tr>
		                    <th socpe="row">주소 및  위치정보</th>
		                    <td colspan="3">
		                        <p class="reset">
		                            <span class="semantic">지번주소</span>
		                            <c:out value="${row.SHP_MST_JBN_ADR1}" /> <c:out value="${row.SHP_MST_JBN_ADR2}" />
		                        </p>
		                        <p class="reset">
		                            <span class="semantic">도로명 주소</span>
		                            <c:out value="${row.SHP_MST_DRO_ADR1}" /> <c:out value="${row.SHP_MST_DRO_ADR2}" />
		                        </p>
		                        <c:if test="${not empty row.SHP_MST_PST}">
			                        <p class="reset">
			                            (<c:out value="${row.SHP_MST_PST}" />)
			                        </p>
		                        </c:if>
		                    </td>
		                </tr>
		                
		                <tr>
		                    <th socpe="row">대중교통안내</th>
		                    <td colspan="3">
		                    	<ui:replaceLineBreak content="${row.SHP_MST_MAS_TRS}" />
		                    </td>
		                </tr>
		            </tbody>
		            </table><!-- // table-a -->
		
		            <h5 class="title"><strong>지도정보</strong></h5>
		
		            <div id="branchMap" class="map"></div>
		            <script>
		                var marketPlant = {lat: 37.4768505, lng: 126.8789919};
		
		                function initMap() {
		                  var map = new google.maps.Map(document.getElementById('branchMap'), {
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
		            
		            <c:if test="${1 eq 2 }">
		            <!-- 지점들이 관리 힘들거 같다는 이유로 삭제 2016.04.14 -->
		            <h5 class="title"><strong>지점사진</strong></h5>
					<c:if test="${not empty fileList}">
		            <div class="branch-photo"><!-- branch-photo -->
		                <ul class="tab">
		                	
		                	<c:forEach var="fileRow" items="${fileList }" varStatus="i">
		                    <li><img src="<c:out value="${cdnDomain}" /><c:out value="${fileRow.CMM_FLE_ATT_PATH}" /><c:out value="${fileRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${fileRow.CMM_FLE_ALT_TXT}" />" /></li>
		                    </c:forEach>
		                </ul>
		            </div><!-- // branch-photo -->
		            </c:if>
					</c:if>
		            <div class="section-button text-right"><!-- section-button -->
		                <a href="<c:out value="${brandDomain}"/>/info/branch/branchList.do" class="button warning"><span>목록</span></a>
		            </div><!-- // section-button -->
		            
		        </div><!--// .con_d e-->
			</div><!--// .map_d e -->
		            
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<form name="fileForm" id="fileForm">
	<input type="hidden" name="CMM_FLE_IDX" value=""/>
    <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
    <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>

<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script>
$(document).on("click", ".file-list-title", function () {
    var $fileForm = $("#fileForm");
    var $this = $(this);
    $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
    $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
    $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
    $fileForm.attr({"action":"<c:out value="${brandDomain}"/>/info/intro/introFileDownload.do", "target":"_self", "method":"post"}).submit();
});
</script>

</body>
</html>