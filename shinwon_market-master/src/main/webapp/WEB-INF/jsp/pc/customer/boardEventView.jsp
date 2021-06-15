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

			<div class="section-title">
			    <h3 class="title"><span>EVENT</span></h3>
			
			    <div class="more">
			        <select class="select">
						<option value="">진행중인 다른 이벤트 선택 </option>
						<c:if test="${not empty ingEventList }">
							 <c:forEach var="ingEventRow" items="${ingEventList }">
								 <option value="<c:out value="${ingEventRow.EVT_MST_IDX }"/>" ><c:out value="${ingEventRow.EVT_MST_TITLE }"/></option>
							 </c:forEach>
						 </c:if>
					</select>
			    </div>
			</div>
	
			<h4 class="title title-event">
				<span>
					[<c:out value="${row.EVT_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/> 이벤트] 
					<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
				</span>
			</h4>
			
			<div class="event-view-body"><!-- event-view-body -->
                <div class="holder">
                    <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
                </div>
            </div><!-- // event-view-body -->

            <p class="info">
                <span class="primary">상업적 게시글, 미풍양속에 위반되는 게시글, 이벤트 성격에 맞지 않는 게시글은 미통보 삭제될 수 있으니 양해바랍니다.</span>
            </p>

            <div class="bbs-status"><!-- bbs-status -->
                <div class="page">
                    <strong class="xlarge primary">게시글 : <fmt:formatNumber value="${totalCount }" groupingUsed="true"/>개</strong>
                </div>
            </div><!-- // bbs-status -->
            
            <form name="boardFrm" id="boardFrm" enctype="multipart/form-data">
            <input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
			<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
			<input type="hidden" name="EVT_BOARD_IDX" value="${boardRow.EVT_BOARD_IDX }"/>
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			<input type="hidden" name="bPage" value="<c:out value="${commandMap.bPage }"/>"/>
	            <table class="bbs-view core fixed" cellspacing="0"><!-- bbs-view -->
		            <caption></caption>
		            <colgroup>
		                <col style="width: 145px;" />
		                <col style="width: auto;" />
		                <col style="width: 145px;" />
		                <col style="width: auto;" />
		                <col style="width: 145px;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th><span>제목</span></th>
		                    <td colspan="5">
		                    	<c:out value="${boardRow.EVT_BOARD_TITLE }"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>작성자</span></th>
		                    <td>
		                       <c:out value="${fn:substring(boardRow.EVT_BOARD_REG_ID,0,(fn:length(boardRow.EVT_BOARD_REG_ID)-4))}" />****
		                    </td>
		                    <th><span>등록일</span></th>
		                    <td>
		                       <ui:formatDate value="${boardRow.EVT_BOARD_REG_DT }" pattern="yyyy.MM.dd"/>
		                    </td>
		                    <th><span>조회수</span></th>
		                    <td>
		                       <fmt:formatNumber value="${boardRow.EVT_BOARD_READ_CNT }" groupingUsed="true"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>내용</span></th>
		                    <td colspan="5">
		                        <div class="holder">
		                            <c:if test="${not empty imageList }">
		                            	<c:forEach items="${imageList }" var="imageRow" varStatus="i">		                            				
	                           				<img src="<c:out value="${cdnDomain}" />${imageRow.CMM_FLE_ATT_PATH}${imageRow.CMM_FLE_SYS_NM}" alt="<c:out value="${imageRow.CMN_FLE_ALT_TXT}"/>" />	                        							                            				
	                           			</c:forEach>
		                            </c:if>
		                            <p>
		                            	<ui:replaceLineBreak content="${boardRow.EVT_BOARD_CONTENTS }"/>
		                            </p>
		                        </div>
		                    </td>
		                </tr>
		            </tbody>
		        </table><!-- // bbs-view -->
	        </form>

            <div class="section-button text-right"><!-- section button -->
                <div class="pull-right">
                    <c:if test="${sessionUser.MEM_MST_MEM_ID eq boardRow.EVT_BOARD_REG_ID}">
                    	<a href="javascript:;" id="goDelete" class="button large"><span>삭제</span></a>
                    	<a href="javascript:;" id="goEdit" class="button info large"><span>수정</span></a>
                    </c:if>
                    <a href="javascript:;" id="goBoardList" class="button warning large"><span>목록</span></a>
                </div>
            </div><!-- // section button -->
			
			<form id="frm" name="frm">
            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            	<input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>" />
            	<input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
            	<input type="hidden" name="EVT_MST_IDX" value=""/>
            	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            </form>
            
            <div class="hr hr-a" aria-hidden="true"><!-- hr --></div>
			
			<div class="section-button"><!-- section button -->
			    <a href="javascript:;" id="goList" class="button primary large"><span>이벤트목록</span></a>
			</div><!-- // section button -->
			
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
		//console.log(location.pathname);
		//console.log(location.search);
		
		//전체 이벤트 목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventList.do", "target":"_self", "method":"get"}).submit();
		});
		
		//게시판형 이벤트 목록
		$(document).on("click","#goBoardList",function()
		{
			$("#boardFrm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventView.do", "target":"_self", "method":"get"}).submit();
		});
		
		// 진행중인 이벤트 선택
		$(document).on("change", ".select", function ()
		{
			$("#frm").find("input[name='EVT_MST_IDX']").val($(this).val());
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventView.do","target":"_self","method":"get"}).submit();
		});
		
		//게시판형 이벤트 게시글 삭제
		$("#goDelete").on("click",function()
		{
			if(confirm("삭제하시겠습니까?"))
			{
				$("#boardFrm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/boardEventDelete.do", "target":"_self", "method":"post"}).submit();
			}
		});
		
		//게시판형 이벤트 게시글 수정
		$("#goEdit").on("click",function()
		{
			$("#boardFrm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/boardEventEdit.do", "target":"_self", "method":"get"}).submit();
		});
	});

//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>