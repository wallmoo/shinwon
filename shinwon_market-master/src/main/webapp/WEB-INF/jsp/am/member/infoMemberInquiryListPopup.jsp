<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title"><c:out value="${memberInfo.CUST_ID }" />(<c:out value="${memberInfo.CUST_NM }" />)님의 정보<c:if test="${memberInfo.SCSS_YN eq 'Y' }"> - <c:out value="${fn:substring(memberInfo.SCSS_DE,0,4)}"/>년 <c:out value="${fn:substring(memberInfo.SCSS_DE,4,6)}"/>월 <c:out value="${fn:substring(memberInfo.SCSS_DE,6,8)}"/>일 탈퇴한 회원 입니다</c:if></h1>
    <a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

    <div id="contents"><!-- contents -->

        <div class="tab-a justified"><!-- tab -->
            <ul class="tab">
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">회원정보</a></li>
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">주문내역</a></li>
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">쿠폰내역</a></li>
<%-- 				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do?MEM_MST_MEM_ID=<c:out value="${commandMap.MEM_MST_MEM_ID}" />">쿠폰보유내역</a></li> --%>
<%-- 				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponUsePopup.do?MEM_MST_MEM_ID=<c:out value="${commandMap.MEM_MST_MEM_ID}" />">쿠폰사용내역</a></li> --%>
				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPointPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">포인트내역</a></li>
				<li class="active"><a href="#none">문의내역</a></li>
            </ul>
        </div><!-- // tab -->
        
        <div class="title-box">
             <h4 class="title">문의내역 검색</h4>

             <div class="right">
                 <a href="#none" id="search" class="button button-b"><span>검색</span></a>
                 <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
             </div>
         </div>
         
         <div class="section-form"><!-- section-form-a -->
             <form name="searchForm" id="searchForm">
                 <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                 <input type="hidden" name="CUST_ID" value="<c:out value="${commandMap.CUST_ID }"/>" />
                 <input type="hidden" name="COMP_CD" value="<c:out value="${commandMap.COMP_CD }"/>"/>
                 
                 <div class="form-group">
					<label class="label"><span>등록일</span></label>
					<div class="field">
						<input type="text" name="searchStartDate" id="searchStartDate" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate }"/>"/> ~
                      	<input type="text" name="searchEndDate" id="searchEndDate" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                      	<a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
                      	<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                       	<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                       	<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                      	<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                      	(날짜형식: YYYY-MM-DD)
					</div>
				</div>
					
				<div class="form-group">
					<label class="label"><span>구분</span></label>
					<div class="field">
						<select class="select" name="searchBrdCmnComIdx" id="searchBrdCmnComIdx">
							<option value="">전체</option>
							<c:if test="${not empty inqTypeCodeList }">
						    <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
						        <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>" <c:if test="${inqTypeCodeRow.CMN_COM_IDX eq commandMap.searchBrdCmnComIdx }">selected="selected"</c:if>>
						            <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
						        </option>
						    </c:forEach>
						</c:if>
						</select>
					</div>
				</div>
            </form>
		</div><!-- // section-form-a -->

        <h3 class="semantic">문의내역</h3>

        <h4 class="title">문의내역</h4>

        <div class="table-a"><!-- col list -->
             <table class="core">
                 <colgroup>
                     <col style="width: 5%;" />
                     <col style="width: 15%;" />
                     <col style="width: auto;" />
                     <col style="width: 20%;" />
                     <col style="width: 10%;" />
                 </colgroup>
                 <thead>
                     <tr>
                         <th>NO</th>
                         <th>구분</th>
                         <th>제목</th>
                         <th>등록일</th>
                         <th>답변상태</th>
                     </tr>
                 </thead>
                 <tbody id="inqList">
                     <c:choose>
                         <c:when test="${not empty list }">
                             <c:set var="listNum" value="${paging.listNum}" />
                             <c:forEach var="row" items="${list }" varStatus="i">
                                 <tr>
                            <td><c:out value="${listNum }"/></td>
                            <td><c:out value="${row.CMN_COM_NM }" /></td>
                            <td class="left">
                                <a href="#none" class="ellipsis preview" data-brd_inq_idx="<c:out value="${row.BRD_INQ_IDX }" />" data-brd_inq_reply_cd="<c:out value="${row.BRD_INQ_REPLY_CD }"/>">
                                   	<c:out value="${row.BRD_INQ_TITLE }" />
                                </a>
                            </td>
                            <td><ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                            <td><span class="label label-<c:out value="${row.BRD_INQ_REPLY_CD eq 'Y'?'b':'a' }"/>"><c:out value="${row.BRD_INQ_REPLY_CD eq 'Y'?'답변완료':'문의접수' }"/></span></td>
                        </tr>
                        <c:set var="listNum" value="${listNum-1}" />     
                             </c:forEach>
                         </c:when>
                         <c:otherwise>
                             <tr><td colspan="5">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td></tr>
                         </c:otherwise>
                     </c:choose>
                 </tbody>
             </table>
         </div><!-- // col list -->
                
        <div class="pagination"><!-- pagination -->
	        <ui:paging paging="${paging }" jsFunction="goPage" />
	    </div><!-- // pagination -->
	    
	    <form id="frm" name="frm">
    		 <input type="hidden" name="CUST_ID" value="<c:out value="${commandMap.CUST_ID }"/>" />
             <input type="hidden" name="BRD_INQ_IDX" value="" />
             <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
             <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
             <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
             <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
             <input type="hidden" name="COMP_CD" value="<c:out value="${commandMap.COMP_CD }"/>"/>
             <div class="bbs-status"><!-- bbs status -->
                 <div class="page" style="top:-50px;">
		               총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
		           </div>
                 <div class="sort" style="top:-50px;">
                     <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                 </div>
             </div>
        </form>
    </div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    
    // 상세 정보
   $(document).on("click", "#inqList .preview", function () {
       var $frm = $("#frm");
       $frm.find("input[name='BRD_INQ_IDX']").val($(this).data("brd_inq_idx"));
       $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInquiryViewPopup.do" , "target":"_self", "method":"post"}).submit();
   });
    
	// 검색 엔터 이벤트 
   $(document).on("keydown", ".serach-text", function (e) {
       if(e.keyCode == 13){
           $("#search").trigger("click");
           return false;
       }
   });
   
   // 검색 버튼 클릭 이벤트
   $(document).on("click", "#search", function () {
       var $searchForm = $("#searchForm"); 
       
       $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
       $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInquiryListPopup.do", "target":"_self", "method":"post"}).submit(); 
   });
   
   // 페이지 사이즈 변경 이벤트
   $(document).on("change", "select[name='pageSize']", function () {
       goPage(1);
   });
    
   // 페이지 이동
   goPage = function (cPage) 
   {
       var $frm = $("#frm");
       $frm.find("input[name='cPage']").val(cPage);
       $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInquiryListPopup.do", "target":"_self", "method":"post"}).submit();
   };
});
</script>
</body>
</html>