<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>EVENT</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- warp -->

				<div class="field text-right mt10">
				    <select class="select">
				    	<option value="">전체</option>
				    	<option value="Y" <c:if test="${commandMap.searchEvtMstGubun eq 'Y'}">selected="selected"</c:if>>단독 이벤트</option>
				        <option value="N" <c:if test="${commandMap.searchEvtMstGubun eq 'N'}">selected="selected"</c:if>>본사 이벤트</option>
				    </select>
				</div>
				
				<div class="gird section-plan"><!-- section-plan -->
				    <c:choose>
				    	<c:when test="${not empty list }">
				    		<c:forEach var="row" items="${list }" varStatus="i">
				    			<div class="col-1-1 plan-item">
							        <a href="javascript:;" class="item" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }"/>" data-evt_mst_type="<c:out value="${row.EVT_MST_TYPE }"/>">
							            <span class="img-wrap">
							                <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>" />
							                <c:if test="${row.EVT_MST_STATUS eq 'ing'}">
							                	<span class="label continue">
								                	진행중
								                </span>
							                </c:if>
							            </span>
							            <span class="plan-date">
							                [<c:out value="${row.EVT_MST_GUBUN eq 'Y'? '단독' : '본사' }"/>] 
							                <c:choose>
						                		<c:when test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_AUCTION }">
						                			<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> <c:out value="${row.EVT_MST_AUC_ST_HH }"/> : <c:out value="${row.EVT_MST_AUC_ST_MM }"/>
						                			~ 
						                			<ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/> <c:out value="${row.EVT_MST_AUC_ED_HH }"/> : <c:out value="${row.EVT_MST_AUC_ED_MM }"/>
						                		</c:when>
						                		<c:otherwise>
						                			<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
						                		</c:otherwise>
						                	</c:choose>
							            </span>
							            <strong class="plan-title"><c:out value="${row.EVT_MST_TITLE }"/></strong>
							        </a>
							    </div>
				    		</c:forEach>
				    	</c:when>
				    	<c:otherwise>
				    		<div class="section-message message">
	                            <p>진행중인 이벤트가 없습니다.</p>
	                        </div>
				    	</c:otherwise>
				    </c:choose>
				</div><!-- // section-plan-list -->

				<form id="frm" name="frm">
					<input type="hidden" name="EVT_MST_IDX" value="" />
					<input type="hidden" name="EVT_MST_TYPE" value=""/>				
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
		            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		            <input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>" />
		            <input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
		               
		            <div class="section-pagination"><!-- section pagination -->
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
		            </div><!-- // section pagination -->
            	</form>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
		</div><!-- // container -->
	</div><!-- // contents -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

	$(function(){
		// item영역 클릭 이벤트
	    $(document).on("click", ".item", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='EVT_MST_IDX']").val($(this).data("evt_mst_idx"));
	        $frm.find("input[name='EVT_MST_TYPE']").val($(this).data("evt_mst_type"));
	        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/eventView.do", "target":"_self", "method":"get"}).submit();
	    });
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/eventList.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	    // 단독 이벤트/본사이벤트 selectbox 클릭 시
	    $(".select").on("change",function()
	    {
	    	var $frm = $("#frm");
	    	var searchEvtMstGubun = $(".select :selected").val();
	    	$frm.find("input[name='cPage']").val("1");
	    	$("input[name='searchEvtMstGubun']").val(searchEvtMstGubun);
	    	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/eventList.do", "target":"_self", "method":"get"}).submit();
	    });
	    
	});

</script>

</body>
</html>