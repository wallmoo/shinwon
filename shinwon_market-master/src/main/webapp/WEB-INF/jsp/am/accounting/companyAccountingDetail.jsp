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

                <h2 class="title"><span>업체별상세</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchTitle" id="searchTitle" value="" />
                    <input type="hidden" name="searchMonth" id="searchMonth" value="<c:out value="${commandMap.searchMonth }"/>" />
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>정산년월</span></th>
	                            <td colspan="3">
	                                <select class="select" name="searchJungsanYear" id="searchJungsanYear">
									 	<c:if test="${not empty yearList }">
										    <c:forEach var="yearRow" items="${yearList }" varStatus="i" >
										        <option value="<c:out value="${yearRow.JUNGSAN_YEAR }"/>" <c:if test="${yearRow.CHECK_YN eq 'Y' }">selected="selected"</c:if>>
										            <c:out value="${yearRow.JUNGSAN_YEAR }"/>
										        </option>
										    </c:forEach>
										</c:if>
									</select> 년&nbsp;
									<select class="select" name="searchJungsanMonth" id="searchJungsanMonth">
									 	<c:if test="${not empty monthList }">
										    <c:forEach var="monthRow" items="${monthList }" varStatus="i" >
										        <option value="<c:out value="${monthRow.JUNGSAN_MONTH }"/>" <c:if test="${monthRow.CHECK_YN eq 'Y' }">selected="selected"</c:if>>
										            <c:out value="${monthRow.JUNGSAN_MONTH }"/>
										        </option>
										    </c:forEach>
										</c:if>
									</select> 월
	                            </td>
                            </tr>
                            <tr>
	                            <th><span>입점사</span></th>
	                            <td>
	                                <c:if test="${commandMap.searchAdmMstSubIdx < 0}">
										<select class="select" name="searchVdrMstIdx" id="searchVdrMstIdx">
											<option value="">전체</option>
											<c:if test="${not empty vdrMstList }">
											    <c:forEach var="vdrMstListRow" items="${vdrMstList }" varStatus="i" >
											        <option value="<c:out value="${vdrMstListRow.VDR_MST_IDX }"/>" <c:if test="${vdrMstListRow.VDR_MST_IDX eq commandMap.searchVdrMstIdx }">selected="selected"</c:if>>
											            <c:out value="${vdrMstListRow.VDR_MST_NM }"/>
											        </option>
											    </c:forEach>
											</c:if>
										</select>
									</c:if>
									<c:if test="${commandMap.searchAdmMstSubIdx > 0}">
										<c:forEach var="vdrMstListRow" items="${vdrMstList }" varStatus="i" >
										         <c:if test="${vdrMstListRow.VDR_MST_IDX eq commandMap.searchAdmMstSubIdx }">
										            <c:out value="${vdrMstListRow.VDR_MST_NM }"/>
										            <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${vdrMstListRow.VDR_MST_IDX }"/>"/>
										        </c:if>
										</c:forEach>
									</c:if>
	                            </td>
	                            <th><span>MD별</span></th>
	                            <td>
	                            	<select class="select" name="searchVdrMstMdId" id="searchVdrMstMdId">
										<option value="">전체</option>
										<c:if test="${not empty admMstList }">
										    <c:forEach var="admMstListRow" items="${admMstList }" varStatus="i" >
										        <option value="<c:out value="${admMstListRow.ADM_MST_ID }"/>" <c:if test="${admMstListRow.ADM_MST_ID eq commandMap.searchVdrMstMdId }">selected="selected"</c:if>>
										            <c:out value="${admMstListRow.ADM_MST_NM }"/>
										        </option>
										    </c:forEach>
										</c:if>
									</select>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th><span>상품코드/상품명</span></th>
	                        	<td colspan="3">
                                    <textarea cols="30" rows="10"></textarea>
	                        	</td>
                            </tr>
    	                    <tr>
                            <th><span>상품명</span></th>
                            <td>
                                <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text" style="width:60%;" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
                            </td>
	                        	<th><span>주문번호/주문자명</span></th>
	                        	<td colspan=3>
	                        		<input type="text" name="searchOrdMstCd" id="searchOrdMstCd" class="text" value="<c:out value="${commandMap.searchOrdMstCd }"/>" /> /
									<input type="text" name="searchOrdMstNm" id="searchOrdMstNm" class="text" style="width:60%;" value="<c:out value="${commandMap.searchOrdMstNm }"/>" />
	                        	</td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
                </form>

                <div style="margin-top:10px;">
				* 즉시할인가: 입점업체에서 상품에 발급한 즉시할인가격<br/>
				* 정산대상금액 = 공급가 – 즉시할인가 + 배송비<br/>
				</div>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">
                	<input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="searchVdrMstMdId" value="<c:out value="${commandMap.searchVdrMstMdId }"/>"/>
                    <input type="hidden" name="searchJungsanYear" value="<c:out value="${commandMap.searchJungsanYear }"/>"/>
                    <input type="hidden" name="searchJungsanMonth" value="<c:out value="${commandMap.searchJungsanMonth }"/>"/>

                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchOrdMstCd" value="<c:out value="${commandMap.searchOrdMstCd }"/>"/>
                    <input type="hidden" name="searchOrdMstNm" value="<c:out value="${commandMap.searchOrdMstNm }"/>"/>
                    <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>

	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="text-right">
	                         <a id ="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
                            <col style="width: 3%;" />
                            <col style="width: 8%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 5%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
						<thead>
							<tr>
                                <th rowspan="2">NO</th>
                                <th rowspan="2">주문번호</th>
                                <th rowspan="2">결제방법</th>
                                <th rowspan="2">상품정보</th>
                                <th rowspan="2">판매가</th>
                                <th rowspan="2">수량</th>
                                <th rowspan="2">공급가</th>
                                <th rowspan="2">할인금액</th>
                                <th rowspan="2">배송비</th>
                                <th rowspan="2">결제금액</th>
                                <th rowspan="2">상품수수료</th>
                                <th rowspan="2">입점수수료</th>
                                <th colspan="2">매장수수료</th>
                                <th rowspan="2">정산대상금액</th>
                                <th rowspan="2">배송완료일</th>
                                <th rowspan="2">구매확정일</th>
                            </tr>
                            <tr>
                                <th class="border-left">매장픽업</th>
                                <th>매장택배발송</th>
                            </tr>
						</thead>
						<tbody id="accountingList">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:set var="prcSum" value="0" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>2</td>
			                                <td><c:out value="${row.ORD_MST_CD }" /></td>
			                                <td><c:out value="${row.ORD_MST_PAY_TYPE }" /></td>
			                                <td><c:out value="${row.PRD_MST_NM }" /><br/>(<c:out value="${row.ORD_PRD_MST_CD }" />))</td>
			                                <td><fmt:formatNumber value="${row.PRD_MST_PRC}" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.PRD_MST_ORD_PRC}" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.ORD_PRD_DLV_CAG}" groupingUsed="true" /></td>
                                            <td>-</td>
                                            <td>7,245</td>
                                            <td>-</td>
                                            <td>8,000</td>
			                                <td><fmt:formatNumber value="${row.JUNGSAN_AMT}" groupingUsed="true" /></td>
			                                <td><c:out value="${row.DLV_DTS }" /></td>
			                                <td><c:out value="${row.CNFM_DTS }" /></td>

			                            </tr>
			                            <c:set var="listNum" value="${listNum-1}" />
			                            <c:set var="prcSum" value="${prcSum+row.JUNGSAN_AMT}" />
                                    </c:forEach>
                                    <tr>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td></td>
			                                <td><fmt:formatNumber value="${prcSum}" groupingUsed="true" /></td>
			                                <td></td>
			                                <td></td>
			                            </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr><td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td></tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
					</table>

					<div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
				</form>
                <form name="excelForm" id="excelForm">
                	<input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="searchVdrMstMdId" value="<c:out value="${commandMap.searchVdrMstMdId }"/>"/>
                    <input type="hidden" name="searchJungsanYear" value="<c:out value="${commandMap.searchJungsanYear }"/>"/>
                    <input type="hidden" name="searchJungsanMonth" value="<c:out value="${commandMap.searchJungsanMonth }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchOrdMstCd" value="<c:out value="${commandMap.searchOrdMstCd }"/>"/>
                    <input type="hidden" name="searchOrdMstNm" value="<c:out value="${commandMap.searchOrdMstNm }"/>"/>
                </form>
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
$(function(){
	$.checkBoxSelect("checkAll", "checkRow");
	var $frm = $("#frm");


    // 검색 엔터 이벤트
    $("#searchForm").find("input").not(".datapicker").keydown(function (e){
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    goViewVendor = function (vdrLgnIdx) {
        var $frm = $("#frm");
        $frm.find("input[name='VDR_LGN_IDX']").val(vdrLgnIdx);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerEdit.do", "target":"_self", "method":"post"}).submit();
    };
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm");
        var searchJungsanYear = $("#searchJungsanYear").val();
        var searchJungsanMonth = $("#searchJungsanMonth").val();
        var searchMonth = searchJungsanYear+searchJungsanMonth;

        <c:if test="${commandMap.searchAdmMstSubIdx > 0}">
	        $("#searchTitle").val("조회결과  [정산월 : "+searchJungsanYear+"년 "+searchJungsanMonth+"월]");
        </c:if>
        <c:if test="${commandMap.searchAdmMstSubIdx < 0}">
	        var target = document.getElementById("searchVdrMstIdx");
	        var vdr_mst_nm = target.options[target.selectedIndex].text;

	        $("#searchTitle").val("조회결과 ("+vdr_mst_nm+") [정산월 : "+searchJungsanYear+"년 "+searchJungsanMonth+"월]");
    	</c:if>
        $("#searchMonth").val(searchMonth);
        //$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/accounting/companyAccountingDetail.do", "target":"_self", "method":"post"}).submit();
    });


    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });

    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };

 // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
    	var searchJungsanYear = $("#searchJungsanYear").val();
        var searchJungsanMonth = $("#searchJungsanMonth").val();
        var searchMonth = searchJungsanYear+searchJungsanMonth;

        $("#searchMonth").val(searchMonth);
       $("#searchForm").attr({"action": "<c:out value="${serverDomain}" />/am/accounting/companyAccountingDetailExcel.do", "target":"_self", "method":"post"}).submit();
    });
});
//-->
</script>

</body>
</html>
