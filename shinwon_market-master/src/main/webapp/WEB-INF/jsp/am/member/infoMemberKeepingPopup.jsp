<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title"><c:out value="${memberInfo.MEM_MST_MEM_ID }" />(<c:out value="${memberInfo.MEM_MST_MEM_NM }" />)님의 키핑상품<c:if test="${memberInfo.MEM_MST_LEV_YN ne 'N' }"> - <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,0,4)}"/>년 <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,4,6)}"/>월 <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,6,8)}"/>일 <c:out value="${memberInfo.MEM_MST_LEV_YN eq 'Y' ? '탈퇴한' : '직권 탈퇴된' }"/> 회원 입니다</c:if></h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<c:choose>
			<c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
				<%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>			
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
			</c:otherwise>
		</c:choose>
		
		<div class="title-box">
			<h3>
				<a href="<c:out value="${serverDomain}" />/am/member/infoMemberCartPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>" 
				class="tab 
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberCartPopup.do') > -1}">active</c:if>
				"><span>장바구니</span></a>
				<span class="pipe">|</span>
				<a href="<c:out value="${serverDomain}" />/am/member/infoMemberKeepingPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>" 
				class="tab 
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberKeepingPopup.do') > -1}">active</c:if>
				"><span>키핑상품</span></a>
			</h3> 
		</div>
		
		<div class="title-box">
             <h4 class="title">검색</h4>
         </div>

		<div class="section-form"><!-- section-form-a -->
		
		<form id="searchForm" name="searchForm">
		<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
		    
		    <div class="form-group">
			<label class="label"><span>등록일자</span></label>
			<div class="field">
			    <input type="text" name="searchStartDate" id="searchStartDate" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate }"/>"/> ~
			    <input type="text" name="searchEndDate" id="searchEndDate" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate }"/>"/>
			    <!-- <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a> -->
			    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
			    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
			    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
			    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
			    (날짜형식: YYYY-MM-DD)
			</div>
		    </div>
		    
		<div class="form-group">
		    <label class="label"><span>상품코드</span></label>
		    <div class="field">
				<input type="text" class="text" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd}"/>"/> 
		    </div>
		</div>
		
		<div class="form-group">
		    <label class="label"><span>상품명</span></label>
		    <div class="field">
				<input type="text" class="text" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm}"/>"/> 
		    </div>
		</div>
		    
		</form>

		</div><!-- // section-form-a -->

		<div class="section-button search">
            <a href="#none" id="search" class="button button-b"><span>검색</span></a>
            <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
        </div>

        <h4 class="title">리스트</h4>

		<div class="table-a"><!-- col list -->
            <table class="core">
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 20%;" />
                    <col style="width: auto;" />
                    <col style="width: 10%;" />
                    <col style="width: 15%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>상품코드</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>등록일자</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty list }">
                            <c:set var="listNum" value="${paging.listNum}" />
                            <c:forEach var="row" items="${list }" varStatus="i">
                                <tr>
		                           <td>
		                           		<c:out value="${listNum }"/>
		                           </td>
		                           <td>
		                           		<c:out value="${row.PRD_MST_CD }"/>
		                          	</td>
		                          	<td>
		                          		<a href="javascript:goPreview('<c:out value="${row.PRD_MST_CD }" />');"><c:out value="${row.PRD_MST_NM }"/></a>
		                          	</td>
		                          	<td>
		                          		<fmt:formatNumber value="${row.PRD_MST_PRC}" type="number"/>
		                          	</td>
		                          	<td>
		                          		<ui:formatDate value="${row.MEM_KEP_REG_DT}" pattern="yyyy.MM.dd HH:mm"/>
		                          	</td>
		                       </tr>
                                <c:set var="listNum" value="${listNum-1}" />
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
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
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
            <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
            <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
            <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
         <div class="bbs-status"><!-- bbs status -->
                <div class="page">
                    총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
                </div>
             <div class="sort">
                 <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
             </div>
         </div>
        </form>
	
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(function() {
	
	var $searchForm = $("#searchForm"); 
	var $frm = $("#frm");
	
	// 폼체크
    $searchForm.validate({
        rules: {
        	searchStartDate:{required:{depends:function(){
                if($("#searchEndDate").val() != "") return true;
                else return false;
	        }}}, // 등록일 시작
	        searchEndDate:{required:{depends:function(){
                if($("#searchStartDate").val() != "") return true;
                else return false;
	        }}} // 등록일 끝
        },
        messages: {
        	searchStartDate : { required:"검색 시작일을 입력해주십시오." },  				  // 검색시작일
        	searchEndDate : { required:"검색 종료일을 입력해주십시오." }  				  // 검색종료일
        }
    });
    
    // 검색 필드 엔터 이벤트 
    $(document).on("keydown", "#searchForm :text", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
    	if($searchForm.valid()){
	        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberKeepingPopup.do", "target":"_self", "method":"post"}).submit(); 
    	}
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberKeepingPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
	// 상품 상세페이지 이동 (프론트)
    goPreview = function (prdMstCd)
    {
    	var openNewWindow = window.open("about:blank");
    	
    	openNewWindow.location.href ="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd="+prdMstCd;
    };
    
});
</script>
</body>
</html>
