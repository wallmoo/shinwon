<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>세금계산서 신청관리</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>목록</span></h3>
                </div><!-- // section-title -->
					
				<form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />	
                
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
							<tr>
	                            <th><span>신청일자</span></th>
	                            <td colspan=5>
	                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                       			<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
	                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
	                            </td>
							</tr>
							<tr>
	                            <th><span>키워드검색</span></th>
	                            <td>
	                                <select class="select" name="searchKeywordType">
										<option value="regId" <c:if test="${empty commandMap.searchKeywordType or commandMap.searchKeywordType eq 'regId'}">selected="selected"</c:if>>아이디</option>
										<option value="regNm" <c:if test="${commandMap.searchKeywordType eq 'regNm'}">selected="selected"</c:if>>신청자명</option>
										<option value="orderCd" <c:if test="${commandMap.searchKeywordType eq 'orderCd'}">selected="selected"</c:if>>주문번호</option>
										<option value="phoneNo" <c:if test="${commandMap.searchKeywordType eq 'phoneNo'}">selected="selected"</c:if>>연락처 뒷자리</option>
										<option value="cprNm" <c:if test="${commandMap.searchKeywordType eq 'cprNm'}">selected="selected"</c:if>>상호/법인명</option>
										<option value="cprNo" <c:if test="${commandMap.searchKeywordType eq 'cprNo'}">selected="selected"</c:if>>사업자번호</option>
									</select>	
									<input type="text" class="text" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword}"/>"/> 
	                            </td>
	                            <th><span>결제수단</span></th>
	                            <td>
	                                <select class="select" name="searchPayType" id="searchPayType">
	                                	<option value="" <c:if test="${empty commandMap.searchPayType }">selected="selected"</c:if>>선택</option>
	                                	<option value="${Code.PAY_ACCOUNT}" <c:if test="${commandMap.searchPayType eq Code.PAY_ACCOUNT}">selected="selected"</c:if>>실시간계좌이체</option>
	                                	<option value="${Code.PAY_DEPOSIT}" <c:if test="${commandMap.searchPayType eq Code.PAY_DEPOSIT}">selected="selected"</c:if>>가상계좌</option>
	                                	<option value="${Code.PAY_ESCROW}" <c:if test="${commandMap.searchPayType eq Code.PAY_ESCROW}">selected="selected"</c:if>>에스크로</option>
	                                </select>
	                            </td>
	                            <th><span>발행현황</span></th>
	                            <td>
	                                <input type="radio" id="stateA" name="searchTaxIvcState" class="radio" <c:if test="${commandMap.searchTaxIvcState eq 'A'}">checked="checked"</c:if> value="A"/>
		                            <label for="stateA">전체</label>
		                            <input type="radio" id="stateB" name="searchTaxIvcState" class="radio" <c:if test="${commandMap.searchTaxIvcState eq 'Y' }">checked="checked"</c:if> value="Y"/>
		                            <label for="stateB">발행</label>
		                            <input type="radio" id="stateC" name="searchTaxIvcState" class="radio" <c:if test="${commandMap.searchTaxIvcState eq 'N' }">checked="checked"</c:if> value="N"/>
		                            <label for="stateC">미발행</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->
                
				<form id="frm" name="frm">
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="col-1-2 text-left">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
	                    </div>
	                </div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
		                <colgroup>
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <thead>
		                    <tr>
	                            <th>신청일시<br/>(신청번호)</th>
	                            <th>신청자명</th>
	                            <th>상호/법인명</th>
	                            <th>담당자연락처</th>
	                            <th>사업자번호</th>
	                            <th>담당자이메일</th>
	                            <th>주문번호</th>
	                            <th>현금영수증<br/>발행여부</th>
	                            <th>발행현황</th>
	                        </tr>
		                </thead>
		                <tbody>
		                    <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td>
			                                	<ui:formatDate value="${row.TAX_IVC_REG_DT}" pattern="yyyy.MM.dd HH:mm"/>
			                                	<br/>
			                                	(<a href="javascript:goTaxIvcPopup('<c:out value="${row.TAX_IVC_IDX }"/>');"><c:out value="${row.TAX_IVC_IDX }"/></a>)
			                                </td>
		                                	<td>
		                                		<c:out value="${row.MEM_MST_MEM_NM }"/>
		                                		<br/>
		                                		<c:if test="${row.MEMBER_YN eq 'Y' }">
		                                			(<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.TAX_IVC_REG_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.TAX_IVC_REG_ID }"/></a>)
		                                		</c:if>
		                                		<c:if test="${row.MEMBER_YN ne 'Y' }">
		                                			(비회원)
		                                		</c:if>
		                                	</td>
		                                	<td>
		                                		<c:out value="${row.TAX_IVC_CPR_NM }"/>
		                                	</td>
		                                	<td>
		                                		<c:out value="${row.MEM_MST_HP1 }"/>-****-<c:out value="${row.MEM_MST_HP3 }"/>
		                                	</td>
		                                	<td>
		                                		<c:out value="${row.TAX_IVC_CPR_NO1 }"/>-<c:out value="${row.TAX_IVC_CPR_NO2 }"/>-<c:out value="${row.TAX_IVC_CPR_NO3 }"/>
		                                	</td>
			                                <td><c:out value="${row.TAX_IVC_MAIL }"/></td>
			                                <td><a href="javascript:goOrderView('<c:out value="${row.TAX_IVC_ORD_CD }" />');" title="새 창 으로 열립니다."><c:out value="${row.TAX_IVC_ORD_CD }"/></a></td>
			                                <td><c:out value="${row.ORD_MST_CSH_RCP eq 'Y' ? '발행':'미발행' }"/></td>
			                                <td>
			                                	<c:choose>
				                           			<c:when test="${row.TAX_IVC_STATE eq 'Y'}">
				                           				발행
				                           			</c:when>
				                           			<c:when test="${row.TAX_IVC_STATE eq 'N'}">
				                           				미발행
				                           			</c:when>
				                           			<c:when test="${empty row.TAX_IVC_STATE}">
				                           				-
				                           			</c:when>
				                           		</c:choose>
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
	                </table><!-- // table -->
	                
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchKeywordType" value="<c:out value="${commandMap.searchKeywordType }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchPayType" value="<c:out value="${commandMap.searchPayType }"/>"/>
                    <input type="hidden" name="searchTaxIvcState" value="<c:out value="${commandMap.searchTaxIvcState }"/>"/>
					
				</form>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  
    
    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
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
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/taxIvc/taxIvcList.do", "target":"_self", "method":"post"}).submit(); 
    	}
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/order/taxIvc/taxIvcList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상세 팝업
    goTaxIvcPopup = function (idx)
    {
        popup("<c:out value="${serverDomain}" />/am/order/taxIvc/taxIvcInfoPopup.do?TAX_IVC_IDX="+idx, "960", "600", "yes", "taxIvcInfoPopup");
    };
    
 	// 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
});

//-->
</script>

</body>
</html>
