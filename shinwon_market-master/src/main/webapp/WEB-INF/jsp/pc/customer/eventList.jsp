<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-event"><!-- page class : page-event -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
	
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	        <div id="breadcrumb" class="wrap">
	            <div class="holder">
	                <span>홈</span>
	                <span class="gt">&gt;</span>
	                <strong class="warning">EVENT</strong>
	            </div>
	        </div>
	    </div><!-- // breadcrumb -->


		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->
	
	  		<h3 class="reset"><img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_event.png" alt="EVENT" /></h3>
	
			<div class="section-bbs-category"><!-- section-bbs-category -->
				<a href="<c:out value="${frontDomain }"/>/pc/customer/eventList.do" <c:if test="${empty commandMap.searchEvtMstGubun }">class="active"</c:if>><span>ALL</span></a>
			    <span class="pipe">|</span>
			    <a href="javascript:;" <c:if test="${commandMap.searchEvtMstGubun eq 'Y'}">class="active"</c:if> id="solo"><span>단독 이벤트</span></a>
			    <span class="pipe">|</span>
			    <a href="javascript:;" <c:if test="${commandMap.searchEvtMstGubun eq 'N'}">class="active"</c:if> id="company"><span>본사 이벤트</span></a>
			</div><!-- // section-bbs-category -->
	
			<div class="thumbnail-list"><!-- thumbnail-list -->
	        	<c:choose>
	            	<c:when test="${not empty list }">
	            		<ul class="tab">
	                		<c:forEach var="row" items="${list }" varStatus="i">
						        <li>
						            <c:if test="${row.EVT_MST_STATUS eq 'ing' }">
						            	<span class="event-ing">진행중</span>
						            </c:if>
						            <a href="javascript:;" class="thumbnail" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }"/>" data-evt_mst_type="<c:out value="${row.EVT_MST_TYPE }"/>">
						            	<img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>" style="width:322px;height:260px;">
						            </a>
						            <p class="type">[<c:out value="${row.EVT_MST_GUBUN eq 'Y'? '단독' : '본사' }"/> 이벤트]</p>
						            <p class="desc">
						                <span class="date">
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
						            </p>
						            <p class="subject">
						                <a href="javascript:;" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }"/>" data-evt_mst_type="<c:out value="${row.EVT_MST_TYPE }"/>">
						                	<c:out value="${row.EVT_MST_TITLE }"/>
						                </a>
						            </p>
						        </li>
	                		</c:forEach>
	                	</ul>
	                </c:when>
	                <c:otherwise>
	               		<p class="no-list-more top-line">
                        	진행중인 이벤트가 없습니다.
                        </p>
	                </c:otherwise>
	            </c:choose>
			</div><!-- // thumbnail-list -->
	
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
               
			<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>
	
	        </div><!-- wrap -->
        </div><!-- // container -->              

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	// 제목 a Tag 클릭 이벤트
    $(document).on("click", ".subject a", function () 
    {
        var $frm = $("#frm");
        $frm.find("input[name='EVT_MST_IDX']").val($(this).data("evt_mst_idx"));
        $frm.find("input[name='EVT_MST_TYPE']").val($(this).data("evt_mst_type"));
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/eventView.do", "target":"_self", "method":"get"}).submit();
    });
	
	// thumb 클릭 이벤트
	$(document).on("click", ".thumbnail", function () 
    {
        var $frm = $("#frm");
        $frm.find("input[name='EVT_MST_IDX']").val($(this).data("evt_mst_idx"));
        $frm.find("input[name='EVT_MST_TYPE']").val($(this).data("evt_mst_type"));
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/eventView.do", "target":"_self", "method":"get"}).submit();
    });
	
	// 페이지 이동
    goPage = function (cPage) 
    {
		var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventList.do", "target":"_self", "method":"get"}).submit();
    };
    
    // 단독 이벤트 클릭 시
    $("#solo").on("click",function()
    {
    	$("input[name='searchEvtMstGubun']").val("Y");
    	$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventList.do", "target":"_self", "method":"get"}).submit();
    });
    
    // 본사 이벤트 클릭 시
    $("#company").on("click",function()
	{
    	$("input[name='searchEvtMstGubun']").val("N");
    	$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventList.do", "target":"_self", "method":"get"}).submit();
    });
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>