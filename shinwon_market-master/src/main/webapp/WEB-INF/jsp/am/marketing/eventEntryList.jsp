<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">마케팅관리</a>
                &gt;
                <span>이벤트관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">이벤트관리</h3>

                <div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
                    <ul class="tab">
                        <li><a href="#none" id="goBiasicEdit">이벤트정보</a></li>
                        <li class="active"><a href="#none">응모자확인&당첨자 선정</a></li>
                        <li><a href="#none" id="goEventEntryWinnerList">당첨자 발표</a></li>
                    </ul>
                </div><!-- // tab -->
                
                <c:if test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }">
                	<div><b>이벤트명 : <c:out value="${info.EVT_MST_TITLE }"/></b></div>
                	<div class="right">[총 응모자수 <c:out value="${info.EVT_SVY_CNT }"/> 명]</div>
	                <div class="table-a"><!-- col list -->
			            <table class="core">
			                <colgroup>
			                	<col style="width: 15%;" />
			                    <col style="width: auto;" />
			                    <col style="width: 15%;" />
			                    <col style="width: 20%;" />
			                </colgroup>
			                <tbody>
				                <c:if test="${not empty list }">
				                	<c:forEach var="rowQs" items="${list }" varStatus="i">
					                	<tr>
					                		<td>항목<c:out value="${rowQs.EVT_DTL_NO }"/></td>
					                		<td><c:out value="${rowQs.EVT_DTL_NM }"/></td>
					                		<td>응모자수</td>
					                		<td><a href="javascript:searchSurvey('<c:out value="${rowQs.EVT_DTL_IDX }"/>')" ><c:out value="${rowQs.EVT_CNT }"/></a></td>
					                	</tr>
				                	</c:forEach>
				                </c:if>
			                </tbody>
			            </table>
			        </div>
                </c:if>

                <div class="title-box">
                    <h4 class="title">응모자 목록</h4>
                    <c:choose>
                    	<c:when test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }">
                    		<div class="right">
                    			<a href="javascript:;" id="goDisp" class="button button-b"><span>전시</span></a>
                    			<a href="javascript:;" id="goDelete" class="button button-b"><span>미전시</span></a>
<!--                     			<a href="javascript:;" id="excelDown" class="button button-b"><span>응모자 엑셀 다운로드</span></a> -->
                    			<a href="javascript:;" id="goEventWinnerSelect" class="button button-b"><span>당첨자 선정하기</span></a>
                			</div>
                    	</c:when>
                    	<c:when test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_IMAGE }">
                    		<div class="right">
                    			<a href="javascript:;" id="goDispImg" class="button button-b"><span>전시</span></a>
                    			<a href="javascript:;" id="goDeleteImg" class="button button-b"><span>미전시</span></a>
<!--                     			<a href="javascript:;" id="excelDown" class="button button-b"><span>응모자 엑셀 다운로드</span></a> -->
                    			<a href="javascript:;" id="goEventWinnerSelect" class="button button-b"><span>당첨자 선정하기</span></a>
                			</div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="right">
                       	 		<!-- a href="javascript:;" id="excelDown" class="button button-b"><span>응모자 엑셀 다운로드</span></a -->
                       	 		<a href="javascript:;" id="goEventWinnerSelect" class="button button-b"><span>당첨자 선정하기</span></a>
                    		</div>
                    	</c:otherwise>
                    </c:choose>
                </div>
                <div class="table-a"><!-- col list -->
		            <c:if test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_NORMAL }">	<!-- 일반형 -->
		            <table class="core">
		                <colgroup>
		                    <col style="width: 5%;" />
		                    <col style="width: 8%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 14%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 6%;" />
		                    <col style="width: 6%;" />
		                    <col style="width: 6%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 15%;" />
		                </colgroup>
		                <thead>
		                    <tr>
		                        <th>NO</th>
		                        <th>참여경로</th>
		                        <th>아이디</th>
		                        <th>회원이름</th>
		                        <th>회원등급</th>
		                        <th>휴대폰</th>
		                        <th>이벤트참여건수</th>
		                        <th>당첨건수</th>
		                        <th>주문건수</th>
		                        <th>IP</th>
		                        <th>응모일</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:choose>
		                        <c:when test="${not empty list }">
		                            <c:set var="listNum" value="${paging.listNum}" />
		                            <c:forEach var="row" items="${list }" varStatus="i">
		                                <tr>
		                                 <td><c:out value="${listNum }"/></td>
		                                 <td>
		                                 	<c:if test="${row.EVT_ETR_CHN_TYPE eq 'P'}">PC</c:if>
		                                 	<c:if test="${row.EVT_ETR_CHN_TYPE eq 'M'}">MOBILE</c:if>
		                                 </td>
		                                 <td><c:out value="${row.MEM_MST_MEM_ID }"/></td>
		                                 <td><c:out value="${row.MEM_MST_MEM_NM }"/></td>
		                                 <td><c:out value="${row.MEM_GRD_NM }"/></td>
		                                 <td><c:out value="${row.TEL_NO }"/></td>
		                                 <td><c:out value="${row.EVT_CNT }" /></td>
		                                 <td><c:out value="${row.EVT_WIN_CNT}"/></td>
		                                 <td><c:out value="${row.ORD_CNT}"/></td>
		                                 <td><c:out value="${row.EVT_ETR_REG_IP}"/><br/><c:out value="${row.EVT_ETR_AGT}"/></td>
		                                 <td><ui:formatDate value="${row.EVT_ETR_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
		                             </tr>
		                             <c:set var="listNum" value="${listNum-1}" />
		                            </c:forEach>
		                        </c:when>
		                        <c:otherwise>
		                            <tr><td colspan="11">이벤트에 응모한 회원이 없습니다.</td></tr>
		                        </c:otherwise>
		                    </c:choose>             
		                </tbody>
		            </table>
		            </c:if>
		            <c:if test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }">	<!-- 덧글형 -->
		            <table class="core">
                        <colgroup>
                        	<col style="width: 3%;" />
                        	<col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: auto;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 8%;" />
		                    <col style="width: 12%;" />
		                    <col style="width: 5%;" />                     
                        </colgroup>
                        <thead>
                            <tr>
                            	<th></th>
		                        <th>NO</th>
		                        <th>참여경로</th>
		                        <th>덧글</th>
		                        <th>아이디</th>
		                        <th>회원이름</th>
		                        <th>회원등급</th>
		                        <th>휴대폰</th>
		                        <th>이벤트참여건수</th>
		                        <th>당첨건수</th>
		                        <th>주문건수</th>
		                        <th>IP</th>
		                        <th>응모일</th>
		                        <th>전시여부</th>
		                    </tr>
                        </thead>                        
                        <tbody id="eventReplyTable">
						</tbody>
					</table>
		            </c:if>

		            <c:if test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_IMAGE }">	<!-- 이미지형 -->
		            <table class="core">
                        <colgroup>                        	
                        	<col style="width: 3%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: auto;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 8%;" />
		                    <col style="width: 12%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />                                     
                        </colgroup>
                        <thead>
                            <tr>
                                <th></th>
		                        <th>NO</th>
		                        <th>참여경로</th>
		                        <th>제목</th>
		                        <th>아이디</th>
		                        <th>회원이름</th>
		                        <th>회원등급</th>
		                        <th>휴대폰</th>
		                        <th>이벤트참여건수</th>
		                        <th>당첨건수</th>
		                        <th>주문건수</th>
		                        <th>IP</th>
		                        <th>응모일</th>
		                        <th>추천수</th>
		                        <th>전시여부</th>                        
                            </tr>
                        </thead>        
                        <tbody id="eventImageTable">
						</tbody>
					</table>
		            </c:if>
					<c:if test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }">	<!-- 설문형 -->
		            <table class="core">
                        <colgroup>                        	
                        	<col style="width: 6%;" />
                        	<col style="width: 6%;" />
		                    <col style="width: 6%;" />
		                    <col style="width: 11%;" />
		                    <col style="width: 14%;" />
		                    <col style="width: 7%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 5%;" />
		                    <col style="width: 11%;" />
		                    <col style="width: 14%;" />          
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>참여경로</th>
                                <th>항목</th>
		                        <th>아이디</th>
		                        <th>회원이름</th>
		                        <th>회원등급</th>
		                        <th>휴대폰</th>
		                        <th>이벤트참여건수</th>
		                        <th>당첨건수</th>
		                        <th>주문건수</th>
		                        <th>IP</th>
		                        <th>응모일</th>       
                            </tr>
                        </thead>        
                        <tbody id="eventSurveyTable">
						</tbody>
					</table>
		            </c:if>

		        </div><!-- // col list -->
				<c:choose>
					<c:when test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }">
						<div class="pagination" id="eventReplyPageDiv">
						</div>
					</c:when>
					<c:when test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_IMAGE }">
						<div class="pagination" id="eventImagePageDiv">
						</div>
					</c:when>
					<c:when test="${commandMap.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }">
						<div class="pagination" id="eventSurveyPageDiv">
						</div>
					</c:when>
					<c:otherwise>
						<div class="pagination"><!-- pagination -->
                    		<ui:paging paging="${paging }" jsFunction="goPage" />
                		</div><!-- // pagination -->
					</c:otherwise>
				</c:choose>				                
                <!-- 덧글 목록 폼 -->
                <form id="replyForm" name="replyForm">                                       
                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>"/>
                    <input type="hidden" name="EVT_MST_BRAND_CD" value="<c:out value="${commandMap.EVT_MST_BRAND_CD }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                                       	                
                </form>
                
                <form name="excelForm" id="excelForm">
                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
                </form>
                <form name="tabForm" id="tabForm">
                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/> 
                </form>
                <form id="frm" name="frm">
                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/> 
                    <input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
                    <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    
                    <div class="bbs-status"><!-- bbs status -->
                        <div class="page">
		                    총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
		                </div>
                        <div class="sort">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSizeEntry" type="" jsFunction="goPage"/>
                        </div>
                    </div>
                </form>
            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
 
<script type="text/javascript">
$(document).ready(function () {	
	// 덧글 목록 가져오기
	if("${commandMap.EVT_MST_TYPE}" == "${Code.EVENT_MASTER_TYPE_REPLY}")
	{
		getEventReplyListAjax();	
	}
	
	if("${commandMap.EVT_MST_TYPE}" == "${Code.EVENT_MASTER_TYPE_IMAGE}")
	{
		getEventImageListAjax();	
	}
	if("${commandMap.EVT_MST_TYPE}" == "${Code.EVENT_MASTER_TYPE_SURVEY}")
	{
		//getEventSurveyListAjax();	
		getEventSurveyListAjax(1);
	}
	// 덧글 미전시 클릭 이벤트	
	$(document).on("click", "#goDelete", function () 
	{	
		var evtReplyIdxs = [];
		var evtReplyDisplayYns = [];
		
		if($("input[name='EVT_RPL_IDX']:checked").length == 0)
		{
			alert("덧글을 선택하세요.");
			return;
		}
		else
		{
			$("input[name='EVT_RPL_IDX']:checked").each(function(){
				evtReplyIdxs[evtReplyIdxs.length] = $(this).val();
				evtReplyDisplayYns[evtReplyDisplayYns.length] = "Y";
				 
			});

			$.ajax({
				type: "post",
				url: "<c:out value="${serverDomain}"/>/am/marketing/eventReplyDelAjax.do",
				data: {"evtReplyIdxs[]": evtReplyIdxs, "evtReplyDisplayYns[]": evtReplyDisplayYns},			
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
						alert("처리 되었습니다.");
						getEventReplyListAjax();			
					}				
				},
				error : function (err)
		        {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		        }
			});
		}
	});
	
	$(document).on("click", "#goDisp", function () 
	{	
		var evtReplyIdxs = [];
		var evtReplyDisplayYns = [];
		
		if($("input[name='EVT_RPL_IDX']:checked").length == 0)
		{
			alert("덧글을 선택하세요.");
			return;
		}
		else
		{
			$("input[name='EVT_RPL_IDX']:checked").each(function(){
				evtReplyIdxs[evtReplyIdxs.length] = $(this).val();
				evtReplyDisplayYns[evtReplyDisplayYns.length] = "N";
				 
			});

			$.ajax({
				type: "post",
				url: "<c:out value="${serverDomain}"/>/am/marketing/eventReplyDelAjax.do",
				data: {"evtReplyIdxs[]": evtReplyIdxs, "evtReplyDisplayYns[]": evtReplyDisplayYns},			
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
						alert("처리 되었습니다.");
						getEventReplyListAjax();			
					}				
				},
				error : function (err)
		        {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		        }
			});
		}
	});
    
	// 덧글 미전시 클릭 이벤트	
	$(document).on("click", "#goDeleteImg", function () 
	{	
		var evtImageIdxs = [];
		var evtImageDisplayYns = [];
				
		if($("input[name='EVT_IMG_IDX']:checked").length == 0)
		{
			alert("덧글을 선택하세요.");
			return;
		}
		else
		{
			$("input[name='EVT_IMG_IDX']:checked").each(function(){
				evtImageIdxs[evtImageIdxs.length] = $(this).val();
				evtImageDisplayYns[evtImageDisplayYns.length] = "Y";
				 
			});

			$.ajax({
				type: "post",
				url: "<c:out value="${serverDomain}"/>/am/marketing/eventImageDelAjax.do",
				data: {"evtImageIdxs[]": evtImageIdxs, "evtImageDisplayYns[]": evtImageDisplayYns},			
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
						alert("처리 되었습니다.");
						getEventImageListAjax();			
					}				
				},
				error : function (err)
		        {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		        }
			});
		}
	});
	
	$(document).on("click", "#goDispImg", function () 
	{	
		var evtImageIdxs = [];
		var evtImageDisplayYns = [];
				
		if($("input[name='EVT_IMG_IDX']:checked").length == 0)
		{
			alert("덧글을 선택하세요.");
			return;
		}
		else
		{
			$("input[name='EVT_IMG_IDX']:checked").each(function(){
				evtImageIdxs[evtImageIdxs.length] = $(this).val();
				evtImageDisplayYns[evtImageDisplayYns.length] = "N";
				 
			});

			$.ajax({
				type: "post",
				url: "<c:out value="${serverDomain}"/>/am/marketing/eventImageDelAjax.do",
				data: {"evtImageIdxs[]": evtImageIdxs, "evtImageDisplayYns[]": evtImageDisplayYns},			
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
						alert("처리 되었습니다.");
						getEventImageListAjax();			
					}				
				},
				error : function (err)
		        {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		        }
			});
		}
	});
	
    // 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goBiasicEdit", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryWinnerList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target" : "_self", "method" : "get"}).submit();
    });
    
    $(document).on("click", "#goEventWinnerSelect", function () {
    	$("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerSelect.do", "target" : "_self", "method" : "post"}).submit();
    });
    
    
 	// 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='EVT_BOARD_IDX']").val($(this).data("evt_board_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryBoardEdit.do", "target":"_self", "method":"post"}).submit();
    });
 	
 // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-popup", function () {
        var $frm = $("#frm");
        var EVT_IMG_IDX = $(this).data("evt_img_idx");
        popup("<c:out value="${serverDomain}" />/am/marketing/eventMemberImagePopup.do?EVT_IMG_IDX="+EVT_IMG_IDX, "800", "600", "yes", "eventMemberImagePopup");
    });
    
    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
       $("#excelForm").attr({"action": "<c:out value="${serverDomain}" />/am/marketing/eventEntryListExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSizeEntry']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPageEntry']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target":"_self", "method":"post"}).submit();
    };
});

//덧글 목록 가져오기
function getEventReplyListAjax(curPage)
{		
	
	var cPage = curPage != undefined ? curPage : "";
	var EVT_MST_IDX = $("input[name='EVT_MST_IDX']").val();
	
	$.ajax({
		type: "post",
		url: "<c:out value="${serverDomain}"/>/am/marketing/eventReplyListAjax.do",
		data: {"cPage" : cPage, "EVT_MST_IDX" : EVT_MST_IDX},	
		dataType : "json",
		async: false,
		success: function(data)
		{
			if(data.list != null)
			{
				var eventReplyHtml = "";
				var i = 0;
				$.each(data.list, function(index,item)
				{	 
					i++;	
					eventReplyHtml += "<tr>";	
					eventReplyHtml += "<td>";
					eventReplyHtml += "<input type=\"checkbox\" name=\"EVT_RPL_IDX\" value=\""+ item.EVT_RPL_IDX +"\" data-evt_rpl_dpl_yn=\""+ item.EVT_RPL_DPL_YN + "\" />";
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item.RNUM;
					eventReplyHtml += "</td>";
					if(item.EVT_RPL_CHN_TYPE =="P")eventReplyHtml += "<td>PC</td>";
					else if(item.EVT_RPL_CHN_TYPE =="M")eventReplyHtml += "<td>MOBILE</td>";
					else eventReplyHtml += "<td></td>";
					eventReplyHtml += "<td class=\"left\">";
					eventReplyHtml += item.EVT_RPL_CTS;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item.MEM_MST_MEM_ID;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item.MEM_MST_MEM_NM;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item. MEM_GRD_NM;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item. TEL_NO;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item. EVT_CNT;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item. EVT_WIN_CNT;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item. ORD_CNT;
					eventReplyHtml += "</td>";
					eventReplyHtml += "<td>";
					eventReplyHtml += item. EVT_RPL_REG_IP+"<br/>"+item.EVT_RPL_AGT;
					eventReplyHtml += "</td>";
					${row.EVT_ETR_REG_DT }
					eventReplyHtml += "<td>";
					eventReplyHtml += item.EVT_RPL_REG_DT;
					eventReplyHtml += "</td>";
					if(item.EVT_RPL_DPL_YN == "N")
					{
						eventReplyHtml += "<td>";
						eventReplyHtml += "<span class=\"label label-a\">";
						eventReplyHtml += "미전시";
						eventReplyHtml += "</span>";
						eventReplyHtml += "</td>";
					}
					else
					{
						eventReplyHtml += "<td>";
						eventReplyHtml += "<span class=\"label label-b\">";
						eventReplyHtml += "전시";
						eventReplyHtml += "</span>";
						eventReplyHtml += "</td>";
					}
					eventReplyHtml += "</tr>";
				});		
					$("#eventReplyTable").html(eventReplyHtml);
	        		$( "#eventReplyPageDiv" ).html(data.page);
	        		if(i==0)$( "#eventReplyTable" ).html("<tr><td colspan=\"14\">이벤트에 응모한 회원이 없습니다.</td></tr>");
			}
			else
			{
				$( "#eventReplyTable" ).html("<tr><td colspan=\"14\">이벤트에 응모한 회원이 없습니다.</td></tr>");
			}	
		},
		error : function (err)
	    {
            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	   	}
	});
}
	
	//이미지 목록 가져오기
	function getEventImageListAjax(curPage)
	{		
		var cPage = curPage != undefined ? curPage : "";
		var EVT_MST_IDX = $("input[name='EVT_MST_IDX']").val();
		
		$.ajax({
			type: "post",
			url: "<c:out value="${serverDomain}"/>/am/marketing/eventImageListAjax.do",
			data: {"cPage" : cPage, "EVT_MST_IDX" : EVT_MST_IDX},	
			dataType : "json",
			async: false,
			success: function(data)
			{
				if(data.list != null)
				{
					var eventImageHtml = "";
					var i = 0;
					$.each(data.list, function(index,item)
					{	 
						i++;
						eventImageHtml += "<tr>";	
						eventImageHtml += "<td>";
						eventImageHtml += "<input type=\"checkbox\" name=\"EVT_IMG_IDX\" value=\""+ item.EVT_IMG_IDX +"\" data-evt_img_dpl_yn=\""+ item.EVT_IMG_DPL_YN + "\" />";
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item.RNUM;
						eventImageHtml += "</td>";
						if(item.EVT_IMG_CHN_TYPE =="P")eventImageHtml += "<td>PC</td>";
						else if(item.EVT_IMG_CHN_TYPE =="M")eventImageHtml += "<td>MOBILE</td>";
						else eventImageHtml += "<td></td>";
						eventImageHtml += "<td class=\"left\">";
						eventImageHtml += "<a href=\"#none\" class=\"list-popup\" data-evt_img_idx=\""+ item.EVT_IMG_IDX +"\">";
						eventImageHtml += item.EVT_IMG_NM;
						eventImageHtml += "";
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item.MEM_MST_MEM_ID;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item.MEM_MST_MEM_NM;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. MEM_GRD_NM;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. TEL_NO;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. EVT_CNT;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. EVT_WIN_CNT;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. ORD_CNT;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. EVT_IMG_REG_IP+"<br/>"+item.EVT_IMG_AGT;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item.EVT_IMG_REG_DT;
						eventImageHtml += "</td>";
						eventImageHtml += "<td>";
						eventImageHtml += item. EVT_IMG_RCM_CNT;
						eventImageHtml += "</td>";
						if(item.EVT_IMG_DPL_YN == "N")
						{
							eventImageHtml += "<td>";
							eventImageHtml += "<span class=\"label label-a\">";
							eventImageHtml += "미전시";
							eventImageHtml += "</span>";
							eventImageHtml += "</td>";
						}
						else
						{
							eventImageHtml += "<td>";
							eventImageHtml += "<span class=\"label label-b\">";
							eventImageHtml += "전시";
							eventImageHtml += "</span>";
							eventImageHtml += "</td>";
						}
						eventImageHtml += "</tr>";
					});		
					
					$("#eventImageTable").html(eventImageHtml);
		        	$("#eventImagePageDiv" ).html(data.page);
		        		
		        	if(i==0)$( "#eventImageTable" ).html("<tr><td colspan=\"13\">이벤트에 응모한 회원이 없습니다.</td></tr>");
				}
				else
				{
					$( "#eventImageTable" ).html("<tr><td colspan=\"13\">이벤트에 응모한 회원이 없습니다.</td></tr>");
				}	
			},
			error : function (err)
		    {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		   	}
		});
	};
	
	var EVT_DTL_IDX =  "";
	
	function searchSurvey(evtDtlIdx)
	{
		EVT_DTL_IDX = evtDtlIdx;
		getEventSurveyListAjax(1);
	}
	
	//설문 목록 가져오기
	function getEventSurveyListAjax(curPage)
	{		
		var cPage = curPage != undefined ? curPage : "";
		var EVT_MST_IDX = $("input[name='EVT_MST_IDX']").val();
		 
		$.ajax({
			type: "post",
			url: "<c:out value="${serverDomain}"/>/am/marketing/eventSurveyListAjax.do",
			data: {"cPage" : cPage, "EVT_MST_IDX" : EVT_MST_IDX, "EVT_DTL_IDX" : EVT_DTL_IDX},	
			dataType : "json",
			async: false,
			success: function(data)
			{
				if(data.surveyList != null)
				{
					var i = 0;
					var eventSurveyHtml = "";
					$.each(data.surveyList, function(index,item)
					{	 
						i++;
						eventSurveyHtml += "<tr>";	
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item.RNUM;
						eventSurveyHtml += "</td>";
						if(item.EVT_SVY_CHN_TYPE =="P")eventSurveyHtml += "<td>PC</td>";
						else if(item.EVT_SVY_CHN_TYPE =="M")eventSurveyHtml += "<td>MOBILE</td>";
						else eventSurveyHtml += "<td></td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item.EVT_DTL_NO;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item.MEM_MST_MEM_ID;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item.MEM_MST_MEM_NM;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item. MEM_GRD_NM;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item. TEL_NO;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item. EVT_CNT;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item. EVT_WIN_CNT;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item. ORD_CNT;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item. EVT_SVY_REG_IP+"<br/>"+item.EVT_SVY_AGT;
						eventSurveyHtml += "</td>";
						eventSurveyHtml += "<td>";
						eventSurveyHtml += item.EVT_SVY_REG_DT;
						eventSurveyHtml += "</td>";
						
						eventSurveyHtml += "</tr>";
					});		
						$("#eventSurveyTable").html(eventSurveyHtml);
		        		$("#eventSurveyPageDiv" ).html(data.page);
		        		
		        		if(i==0)$( "#eventSurveyTable" ).html("<tr><td colspan=\"12\">이벤트에 응모한 회원이 없습니다.</td></tr>");
		        		
				}
				else
				{	
					$( "#eventSurveyTable" ).html("<tr><td colspan=\"12\">이벤트에 응모한 회원이 없습니다.</td></tr>");
				}	
			},
			error : function (err)
		    {
	            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
		   	}
		});
	};
</script>
</body>
</html>