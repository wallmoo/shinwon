<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">회원검색</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<h3 class="semantic">회원정보 검색</h3>

        <div class="title-box">
			<h4 class="title">검색</h4>

			<div class="right">
				<a href="javascript:search();" class="button button-b"><span>검색</span></a>
				<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
			</div>
		</div>

		<div class="section-form"><!-- section-form-a -->

              <form id="searchForm" name="searchForm">
                  <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                  
			<div class="form-group">
				<label class="label"><span>이름</span></label>
				<div class="field">
					<input type="text" class="text" id="searchMemberNm" name="searchMemberNm" value="<c:out value="${commandMap.searchMemberNm }"/>" />
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>아이디</span></label>
				<div class="field">
					<input type="text" class="text" id="searchWebId" name="searchWebId" value="<c:out value="${commandMap.searchWebId }"/>" />
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>연락처(뒤4자리)</span></label>
				<div class="field">
					<input type="text" class="text" id="searchPager3" name="searchPager3" value="<c:out value="${commandMap.searchPager3 }"/>" />
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>이메일</span></label>
				<div class="field">
					<input type="text" class="text" id="searchEmail" name="searchEmail" value="<c:out value="${commandMap.searchEmail }"/>" />
				</div>
			</div>
			  
		</form>
		
		</div><!-- // section-form-a -->


		<div class="title-box">
			<h4 class="title">리스트</h4>

			<div class="right">
				<a href="javascript:apply();" class="button button-b"><span>선택</span></a>
			</div>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 10%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 8%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
					    	<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>이메일</th>
						<th>회원등급</th>
						<th>고객번호</th>
						<th>추가</th>
					</tr>
				</thead>
				<tbody  id="tbodyMemberList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
						    <td><a href="javascript:goView('<c:out value="${item.MEM_MST_WEB_ID }" />');" title="새 창 으로 열립니다."><c:out value="${item.MEMBER_NM }" /></a></td>
							<td><a href="javascript:goView('<c:out value="${item.MEM_MST_WEB_ID }" />');" title="새 창 으로 열립니다."><c:out value="${item.MEM_MST_WEB_ID }" /></a></td>
							<td><c:out value="${item.PAGER1 }" />-<c:out value="${item.PAGER2 }" />-<c:out value="${item.PAGER3 }" /></td>
							<td><c:out value="${item.EMAIL }" /></td>
							<td><c:out value="${item.AUTH_TYPE_NM }" /></td>
							<td><c:out value="${item.MEMBER_NO }" /></td>
							<td><a href="javascript:goAdd('<c:out value="${item.MEM_MST_WEB_ID }" />','<c:out value="${item.MEMBER_NM }" />');" id="goAdd" class="button button-a"><span>추가</span></a></td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
						<tr>
							<td colspan="7">검색 조건을 선택하신 후, 검색해 주세요.</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->

        <form id="frm" name="frm">
        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
        <input type="hidden" name="searchMemberNm" value="<c:out value="${commandMap.searchMemberNm }"/>"/>
        <input type="hidden" name="searchWebId" value="<c:out value="${commandMap.searchWebId }"/>"/>
        <input type="hidden" name="searchPager3" value="<c:out value="${commandMap.searchPager3 }"/>"/>
        <input type="hidden" name="searchEmail" value="<c:out value="${commandMap.searchEmail }"/>"/>
        <input type="hidden" name="searchAuthType" value="<c:out value="${commandMap.searchAuthType }"/>"/>             
        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
               
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
                
		</div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	//체크박스 전체 선택
    //$.checkBoxSelect("checkAll", "checkRow");

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
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/searchPointMemberPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () 
    {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/searchPointMemberPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
        popup("<c:out value="${serverDomain}"/>/am/member/infoMemberPopup.do?MEM_MST_WEB_ID="+memMstWebId, "800", "500", "yes", "memberView");
    };
    
    //선택
    apply = function ()
    {
    	var $checkObj = $.find("#tbodyMemberList input[name='MEMBER_INFOs']:checked");
    	if( $checkObj.length == 0 ){
    		alert("회원을 선택하여 주십시오.");
    		return;
    	}
    	var params = new Array();
    	var obj;
    	var myArray;
    	$.each($checkObj, function(index,item){
    		myArray = $(this).val().split('^');
    		obj = new Object();
    		obj.USER_ID 	= myArray[0];
    		obj.USER_NM = myArray[1];
    		params.push(obj); 
    	});
    	window.opener.fnResultMember(params);
    };
    goAdd = function (ID, NAME)
    {	 
		obj = new Object();
		obj.ID 	= ID;
		obj.NAME= NAME;
		params.push(obj); 
 
		window.opener.fnResultMember(params);
    };
        
});
</script>
</body>
</html>