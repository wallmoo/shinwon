<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display"><!-- page class : page-display -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	        <div id="breadcrumb" class="wrap">
	            <div class="holder">
	                <span>홈</span>
	                <span class="gt">&gt;</span>
	                <strong class="warning">STYLE INSIDE</strong>
	            </div>
	        </div>
	    </div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

			<h3 class="reset"><img src="<c:out value="${cdnDomain }"/>/pc/img/custom/style.png" alt="style inside" /></h3>

			<div class="section-bbs-category"><!-- section-bbs-category -->
			    <a href="javascript:;" <c:if test="${empty commandMap.searchCmnComIdx }">class="active"</c:if>><span>ALL</span></a>
			    <span class="pipe">|</span>			    			 
				<c:if test="${not empty codeList }">
					<c:forEach var="codeRow" items="${codeList }" varStatus="i">
						<a href="javascript:;" data-cmn_com_idx = "${codeRow.CMN_COM_IDX }" <c:if test="${commandMap.searchCmnComIdx eq codeRow.CMN_COM_IDX }"> class="active"</c:if>><span>${codeRow.CMN_COM_NM }</span></a>
			    		<span class="pipe">|</span>
					</c:forEach>	
				</c:if>			    
			</div><!-- // section-bbs-category -->

			<div class="thumbnail-list"><!-- thumbnail-list -->
			    <c:choose>
			    	<c:when test="${not empty styleInsideList }">
			    		<ul class="tab">
			    			<c:forEach var="styleInsideRow" items="${styleInsideList }" varStatus="i">	
			    				<li>
						            <a href="javascript:;" class="thumbnail" data-con_mst_idx = "${styleInsideRow.CON_MST_IDX }" data-con_cmn_com_idx = "${styleInsideRow.CON_CMN_COM_IDX }">
						            	<img src="${cdnDomain }${styleInsideRow.CMM_FLE_ATT_PATH}${styleInsideRow.CMM_FLE_SYS_NM}" alt="" style="width:322px;height:260px;"/>
						            </a>
						            <p class="type">
						            	[<c:out value="${styleInsideRow.CON_CMN_COM_NM }"/>]
						            </p>
						            <p class="subject">
						                <a href="javascript:;" data-con_mst_idx = "${styleInsideRow.CON_MST_IDX }" data-con_cmn_com_idx = "${styleInsideRow.CON_CMN_COM_IDX }">
						                	<c:out value="${styleInsideRow.CON_MST_TITLE }"/>
						                </a>
						            </p>
						        </li>	
			    			</c:forEach>
			    		</ul>
			    	</c:when>
			    	<c:otherwise>
			    		<p class="no-list-more top-line">
                        	등록된 게시물이 없습니다.
                        </p>
			    	</c:otherwise>
			    </c:choose>
			</div><!-- // thumbnail-list -->

			<form id="frm" name="frm">
				<input type="hidden" name="CON_MST_IDX" value="" />
				<input type="hidden" name="CON_CMN_COM_IDX" value=""/>
				<input type="hidden" name="CON_MST_TYPE" value="${commandMap.CON_MST_TYPE }"/>				
				<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	            <input type="hidden" name="searchCmnComIdx" value="<c:out value="${commandMap.searchCmnComIdx }"/>"/>  
	               
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
	$(function()
	{
		// 제목 a Tag 클릭 이벤트
	    $(document).on("click", ".subject a", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='CON_MST_IDX']").val($(this).data("con_mst_idx"));
	        $frm.find("input[name='CON_CMN_COM_IDX']").val($(this).data("con_cmn_com_idx"));
	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/contents/styleInsideView.do", "target":"_self", "method":"get"}).submit();
	    });
		
		// thumb 클릭 이벤트
		$(document).on("click", ".thumbnail", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='CON_MST_IDX']").val($(this).data("con_mst_idx"));
	        $frm.find("input[name='CON_CMN_COM_IDX']").val($(this).data("con_cmn_com_idx"));
	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/contents/styleInsideView.do", "target":"_self", "method":"get"}).submit();
	    });
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/contents/styleInsideList.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	    // 탭 변경 시
	    $(".section-bbs-category a").on("click",function()
	    {
	    	$("input[name='searchCmnComIdx']").val($(this).data("cmn_com_idx"));
	    	$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/contents/styleInsideList.do", "target":"_self", "method":"get"}).submit();
	    });
	  
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>