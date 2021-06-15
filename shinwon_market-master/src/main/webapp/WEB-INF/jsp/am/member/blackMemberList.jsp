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
				<a href="#none">회원관리</a>
				&gt;
				<span>블랙리스트회원관리</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">블랙리스트회원관리</h3>

				<div class="title-box">
					<h4 class="title">검색</h4>
				</div>

				<div class="section-form"><!-- section-form-a -->

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchYn" value="Y" />                    
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
					<div class="form-group">                    
                        <div class="col">
							<label class="label"><span>처리일</span></label>
							<div class="field">
								<input type="text" class="text datepicker s-datepicker" id="searchBlackStartDate" name="searchBlackStartDate" value="<c:out value="${commandMap.searchBlackStartDate }" />" /> ~
								<input type="text" class="text datepicker e-datepicker" id="searchBlackEndDate" name="searchBlackEndDate" value="<c:out value="${commandMap.searchBlackEndDate }" />" />
								<a href="javascript:fnDateSet('searchBlackEndDate', 'searchBlackStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('searchBlackEndDate', 'searchBlackStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('searchBlackEndDate', 'searchBlackStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                            <a href="javascript:fnDateSet('searchBlackEndDate', 'searchBlackStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            (날짜형식: YYYY-MM-DD)
							</div>
                        </div>
					</div>
					<div class="form-group">                    
                        <div class="col col-md-1-2">
							<label class="label"><span>아이디</span></label>
							<div class="field">
								<input type="text" class="text" id="searchId" name="searchId" value="<c:out value="${commandMap.searchId }"/>" maxlength="15"/>
							</div>
                        </div>           
                        <div class="col col-md-1-2">
							<label class="label"><span>이름</span></label>
							<div class="field">
								<input type="text" class="text" id="searchNm" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>" maxlength="6"/>
							</div>
                        </div>
					</div>
					
					<div class="form-group">                    
                        <div class="col col-md-1-2">
							<label class="label"><span>휴대폰(뒷자리)</span></label>
							<div class="field">
								<input type="text" class="text number" id="searchTel" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>" maxlength="4"/>
							</div>
                        </div>              
                        <div class="col col-md-1-2">
							<label class="label"><span>이메일</span></label>
							<div class="field">
								<input type="text" class="text" id="searchEmail" name="searchEmail" value="<c:out value="${commandMap.searchEmail }"/>" maxlength="50"/>
							</div>
                        </div>
					</div>
					
					<div class="form-group">                    
                        <div class="col">
		                   	<label class="label"><span>블랙리스트 유형</span></label>
		                   	<div class="field">
		                   		<input type="radio" id="searchBlackType1" name="searchBlackType" class="radio" value="" <c:if test="${empty commandMap.searchBlackType }">checked="checked"</c:if> />
								<label for="searchBlackType1">전체</label>
								<input type="radio" id="searchBlackType2" name="searchBlackType" class="radio" value="1" <c:if test="${commandMap.searchBlackType eq '1'}">checked="checked"</c:if> />
								<label for="searchBlackType2">일시정지</label>
								<input type="radio" id="searchBlackType3" name="searchBlackType" class="radio" value="2" <c:if test="${commandMap.searchBlackType eq '2'}">checked="checked"</c:if> />
								<label for="searchBlackType3">영구정지</label>
		                   	</div>
                        </div>
 	                </div>
 	                <div class="form-group">                    
                        <div class="col">
		                   	<label class="label"><span>사유</span></label>
		                   	<div class="field">
		                   		<select class="select" name="defaultBlackReason" id="defaultBlackReason">
	                                <option value="">전체</option>
	                            </select>
		                   		<select class="select" name="searchBlackReason" id="searchBlackReason">
	                                <option value="">전체</option>
	                                <c:if test="${not empty blackReasonList }">
	                                    <c:forEach var="blackReasonRow" items="${blackReasonList }">
	                                        <option value="<c:out value="${blackReasonRow.CMN_COM_IDX }"/>" <c:if test="${blackReasonRow.CMN_COM_IDX eq commandMap.searchBlackReason}">selected="selected"</c:if>><c:out value="${blackReasonRow.CMN_COM_NM }"/></option>
	                                    </c:forEach>
	                                </c:if>
	                            </select>
		                   	</div>
                        </div>
 	                </div>
				</form>
				
				</div><!-- // section-form-a -->

                <div class="section-button search">
						<a href="javascript:search();" class="button button-b submit"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                </div>

				<h4 class="title">목록</h4>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: 5%;" />
							<col style="width: 15%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: auto;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>아이디</th>
								<th>회원이름</th>
								<th>성별</th>
								<th>이메일</th>
								<th>휴대폰 번호</th>
								<th>블랙리스트<br/>유형</th>
								<th>사유</th>
								<th>블랙리스트<br/>처리일</th>
								<th>내역</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${listNum }" /></td>
									<td>
										<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${item.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
											<c:out value="${item.MEM_MST_MEM_ID }"/>
										</a>
									</td>
									<td>
										<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${item.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
											<c:out value="${item.MEM_MST_MEM_NM}"/>
										</a>
									</td>
									<td><c:out value="${item.MEM_MST_SEX eq 'M' ? '남자' : item.MEM_MST_SEX eq 'F' ? '여자' : '' }"/></td>
									<td><c:out value="${not empty item.MEM_MST_MAIL ? item.MEM_MST_MAIL : '' }"/></td>
									<td>
										<c:if test="${not empty item.MEM_MST_HP2 && not empty item.MEM_MST_HP3 }">
											<c:out value="${item.MEM_MST_HP1 }"/>-<c:out value="${item.MEM_MST_HP2}"/>-<c:out value="${item.MEM_MST_HP3 }"/>
										</c:if>
									</td>
									<td><c:out value="${item.MEM_MST_BLK_CD eq '1' ? '일시정지' : '영구정지'}"/></td>
									<td><c:out value="${item.MEM_MST_BLK_RSN }"/></td>
									<td><ui:formatDate value="${item.MEM_MST_BLK_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
									<td><a href="javascript:changeDetailListPopup('<c:out value="${item.MEM_MST_MEM_ID }" />');" class="button button-a">
											<span>변경내역보기</span>
										</a>
									</td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<c:if test="${commandMap.searchYn eq 'Y'}">
									<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
									</tr>
								</c:if>
								<c:if test="${commandMap.searchYn ne 'Y'}">
									<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
									</tr>
								</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                <input type="hidden" name="searchYn" value="Y" />
                <input type="hidden" name="searchBlackStartDate" value="<c:out value="${commandMap.searchBlackStartDate }"/>" />
                <input type="hidden" name="searchBlackEndDate" value="<c:out value="${commandMap.searchBlackEndDate }"/>" />
                <input type="hidden" name="searchId" value="<c:out value="${commandMap.searchId }"/>"/>
                <input type="hidden" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>"/>
                <input type="hidden" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>"/>
                <input type="hidden" name="searchEmail" value="<c:out value="${commandMap.searchEmail }"/>"/>
                <input type="hidden" name="searchBlackType" value="<c:out value="${commandMap.searchBlackType }"/>"/>
                <input type="hidden" name="searchBlackReason" value="<c:out value="${commandMap.searchBlackReason }"/>"/>
                
				<div class="pagination"><!-- pagination -->
				    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

				<div class="bbs-status"><!-- bbs status -->
					<div class="page">
						총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
					</div>
					<div class="sort">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div>
				</div><!-- // bbs status -->

                </form>
                
			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->

	<footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(function () {

	if("${commandMap.searchBlackType}" == ""){
		// 일시정지 & 영구정지 사유 숨기기(기본값)
		$("#searchBlackReason").hide();
		$("#defaultBlackReason").show();
	}
	else{
		$("#searchBlackReason").show();
		$("#defaultBlackReason").hide();
	}
	
	// 블랙리스트 유형 변경 시 사유 목록
	$(document).on("change","input[name='searchBlackType']",function(){
		var searchBlackType = $("input[name='searchBlackType']:checked").val();
		
		$("#searchBlackReason").val("");
		
		if(searchBlackType == ""){
			$("#defaultBlackReason").show();
			$("#searchBlackReason").hide();
		}
		else{
			$("#searchBlackReason").show();
			$("#defaultBlackReason").hide();
		}
	});
	
	// 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
    
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
		var $searchRequired = $.trim($("#searchId").val()) + $.trim($("#searchNm").val()) + $.trim($("#searchTel").val()) + $.trim($("#searchEmail").val());
        
        if( $searchRequired == ""){
			alert("[아이디,이름,휴대폰(뒷자리),이메일] 중 한개 이상은 필수 입력해주세요.");
			$("#searchId").focus();
			return;
        }
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/blackMemberList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/blackMemberList.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 변경내역보기 팝업
	changeDetailListPopup = function(memId){
		window.open("<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?MEM_MST_MEM_ID=" + memId,"changeDetailListPopup","width=700,height=600,scrollbars=yes,target=_blank");
	};
        
});

//팝업 닫고 변경 값 적용
// function parentFunction(){
// 	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/blackMemberList.do", "target":"_self", "method":"post"}).submit(); 
// }
</script>
</body>
</html>