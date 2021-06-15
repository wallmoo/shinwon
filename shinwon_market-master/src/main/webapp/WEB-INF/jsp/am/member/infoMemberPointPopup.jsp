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
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}" />&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">회원정보</a></li>
				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}" />&COMP_CD=<c:out value="${commandMap.COMP_CD}" />">주문정보</a></li>
				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}" />&COMP_CD=<c:out value="${commandMap.COMP_CD}" />">쿠폰내역</a></li>
<%-- 				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponUsePopup.do?MEM_MST_MEM_ID=<c:out value="${commandMap.MEM_MST_MEM_ID}" />">쿠폰사용내역</a></li> --%>
				<li class="active"><a href="#none">포인트내역</a></li>
				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberInquiryListPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}" />&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">1:1문의내역</a></li>
			</ul>
		</div><!-- // tab -->

		<h3 class="semantic">포인트내역</h3>

		<div class="table-a"><!-- total-form-a -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>가용포인트 : <fmt:formatNumber value="${memberInfo.RMN_PNT}" type="number"/>원</th>
						<th>사용포인트 : <fmt:formatNumber value="${memberInfo.USE_PNT}" type="number"/>원</th>
						<th>누적포인트 : <fmt:formatNumber value="${memberInfo.ACCU_PNT}" type="number"/>원</th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div><!-- // table-a -->

		<div class="title-box">
			<h4 class="title">포인트내역</h4>
			<div class="right">
				(최근 6개월간 적립/차감내역)
			</div>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>처리일</th>
						<th>구분</th>
						<th>적립포인트</th>
						<th>사용포인트</th>
						<th>조정포인트</th>
						<th>사용처</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><fmt:formatNumber value="${listNum}" groupingUsed="true"/></td>
							<td><ui:formatDate value="${item.SELL_DE }" pattern="yyyy.MM.dd" /></td>
							<td><c:out value="${item.MEMO }" /></td>
							<td><fmt:formatNumber value="${item.ACCU_PNT}" groupingUsed="true"/>원</td>
							<td><fmt:formatNumber value="${item.USE_PNT}" groupingUsed="true"/>원</td>
							<td><fmt:formatNumber value="${item.ADJU_PNT}" groupingUsed="true"/>원</td>
							<td><c:out value="${item.SHOP_NM }" /></td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
						<tr>
							<td colspan="7">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<div class="pagination"><!-- pagination -->
	        <ui:paging paging="${paging }" jsFunction="goPage" />
	    </div><!-- // pagination -->
	    
	    <form id="frm" name="frm">
    		<input type="hidden" name="CUST_ID" value="<c:out value="${commandMap.CUST_ID}" />" />
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
            <div class="bbs-status"><!-- bbs status -->
                 <div class="page">
		               총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
		           </div>
                 <div class="sort" style="top:-60px;">
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
//<![CDATA[
$(document).ready(function () 
{
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
      
});      
//]]>
</script>
</body>
</html>
