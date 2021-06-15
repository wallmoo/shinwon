<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-exhibit"><!-- page-display : 기획전 -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->

			<div class="exhi_ti">
				<dl class="loc">
					<dt class="blind">현제 카테고리 경로</dt>
					<dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
					<dd class="l"><a href="javascript:void(0)"><span>쇼핑기획전</span></a></dd>
				</dl>
				<h3>
					쇼핑 기획전
					<span class="tx">즐거움이 함께하는 마켓플랜트 기획전</span>
				</h3>
			</div>

			<!-- .exhi_best S -->
			<ol class="exhi_best">
			<c:choose>
				<c:when test="${not empty toplist }">
					<c:set var="topClsNm" value="" />
					<c:forEach var="top" items="${toplist}" varStatus="topSta">
						<c:if test="${topSta.last || topSta.count mod 2 == 0 }">
							<c:set var="topClsNm" value="l" />
						</c:if>
						<c:if test="${topSta.first || topSta.count mod 2 == 1 }">
							<c:set var="topClsNm" value="f" />
						</c:if>
						<li class="<c:out value="${topClsNm }" />" >
							<a href="javascript:void(0)" data-pln_mst_idx="<c:out value="${top.PLN_MST_IDX }"/>" id="planLink">
								<img src="<c:out value="${cdnDomain}" /><c:out value="${top.CMM_FLE_ATT_PATH}" /><c:out value="${top.CMM_FLE_SYS_NM}" />" alt="<c:out value="${top.CMN_FLE_ALT_TXT}"/>" />
								<strong class="tx_doc"><c:out value="${top.PLN_MST_TITLE }"/></strong>
							</a>
						</li>
						<li>
                            <a href="javascript:void(0)" data-pln_mst_idx="<c:out value="${top.PLN_MST_IDX }"/>" id="planLink">
                                <div class="thum_img">
                                    <img src="<c:out value="${cdnDomain}" /><c:out value="${top.CMM_FLE_ATT_PATH}" /><c:out value="${top.CMM_FLE_SYS_NM}" />" alt="<c:out value="${top.CMN_FLE_ALT_TXT}"/>" />
                                </div>
                                <p class="goods_title"><c:out value="${top.PLN_MST_TITLE }"/></p>
                                <!-- <p class="goods_exp">라운드넥라인, 헐렁한 핏의 롱 슬리브에 수갑이 달린 인심 사이드 포켓, 그리고 버클이 늘어선 같은 원단의 벨트가 돋보이는 플로잉 원피스.</p> -->
                                <em class="period">2019-09.30 ~ 2019-10-30</em>
                            </a>
                        </li>
					</c:forEach>
				</c:when>	
			</c:choose>
			</ol>
			<!--// .exhi_best E -->
			
			<c:if test="${not empty list }">
			<!-- .exhi_new S -->
			<dl class="exhi_new">
				<dt><strong>NEW 쇼핑 기획전</strong></dt>
				
				<!-- .exhi_list S -->				
				<dd class="exhi_list">
					<ol>
						<c:choose>
							<c:when test="${not empty list }">
								<c:set var="clsNm" value="" />
								<c:forEach var="row" items="${list}" varStatus="sta">
									<c:if test="${sta.last || sta.count mod 3 == 0 }">
										<c:set var="clsNm" value="l" />
									</c:if>
									<c:if test="${sta.first || sta.count mod 3 == 1 }">
										<c:set var="clsNm" value="f" />
									</c:if>
									<li class="<c:out value="${clsNm }" />" >
										<a href="javascript:void(0)" data-pln_mst_idx="<c:out value="${row.PLN_MST_IDX }"/>" id="planLink">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM}" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>" />
											<strong class="tx_doc"><c:out value="${row.PLN_MST_TITLE }"/></strong>
											<span>기간 : <ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
										</a>
									</li>
								</c:forEach>
							</c:when>
						</c:choose>
					</ol>
				</dd><!--// .exhi_list E -->
			
			</dl><!--// .exhi_new E -->
			</c:if>

		</div><!--// .contents E -->
			<form id="frm" name="frm">
				<input type="hidden" name="PLN_MST_IDX" value="" />
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	            <input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>" />
				<c:if test="${not empty list }">
				<dd class="section-pagination" style="padding:30px 0 50px">
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
				</dd>
				</c:if>
			</form>
	</article>      
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	// a Tag 클릭 이벤트
    $(document).on("click", "#planLink", function () 
    {
        var $frm = $("#frm");
        $frm.find("input[name='PLN_MST_IDX']").val($(this).data("pln_mst_idx"));
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/event/planProductList.do", "target":"_self", "method":"get"}).submit();
    });

	// 페이지 이동
    goPage = function (cPage){
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/event/planList.do", "target":"_self", "method":"get"}).submit();
    };
    addPlanList = function(planList){
    	for(var index =0; index < planList.length; index++){
    		addPalnItem(planList[i]);
    	}
    }
    addPlanItem = function(planData){
    	var planhtml = "<li>"
		+"<a href='javascript:void(0)' data-pln_mst_idx='"+planData.PLN_MST_IDX+"' id='planLink'>"
		+"<img src='"<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM}" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>" />"
		+"<strong class="tx_doc"><c:out value="${row.PLN_MST_TITLE }"/></strong>"
		+"<span>기간 : <ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>"
		+"</a>"
		+"</li>"
    }
   
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>

<script>
	$(document).ready(function(){
		$.each($('.exhi_best li'), function(){
			if($(this).find('strong').text().length > 25) $(this).addClass('li_1');
		});
	});
	  
</script>