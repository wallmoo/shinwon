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

            <div class="container"><!-- container -->

                <h2 class="title"><span>채널별매출</span></h2>
    
                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>조회기간</span></th>
                                <td> 
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchStartDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchEndDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>구분</span></th>
                                <td> 
                                    <input type="radio" id="stateA" name="searchOrdGb" class="radio" <c:if test="${empty commandMap.searchOrdGb or commandMap.searchOrdGb eq 'A' }">checked="checked"</c:if> value="A"/>
                                    <label for="stateA">판매</label>
                                    <input type="radio" id="stateB" name="searchOrdGb" class="radio" <c:if test="${commandMap.searchOrdGb eq 'B' }">checked="checked"</c:if> value="B"/>
                                    <label for="stateB">매출</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                
                    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                        <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                        <a href="#none;" id="goSearch" class="button small primary datepicker"><span>검색</span></a>
                    </div><!-- // 검색 하단 버튼 -->
               
                </form>
                
                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>채널</th>
                            <th>총판매건수</th>
                            <th>취소판매건수</th>
                            <th>순판매건수</th>
                            <th>총판매금액</th>
                            <th>취소판매금액</th>
                            <th>순판매금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty list }">
                            <c:forEach var="rowSum" items="${list }" varStatus="i">
                                <tr>
                                    <td><a href="javascript:searchOrdChn('<c:out value="${rowSum.CHN_DTL_CD }"/>')" ><c:out value="${rowSum.CHN_DTL_NM }"/></a></td>
                                    <td><fmt:formatNumber value="${rowSum.TOTAL_CNT}" groupingUsed="true" /></td>
                                    <td><fmt:formatNumber value="${rowSum.CANCEL_CNT}" groupingUsed="true" /></td>
                                    <td><fmt:formatNumber value="${rowSum.ORD_CNT}" groupingUsed="true" /></td>
                                    <td><fmt:formatNumber value="${rowSum.TOTAL_PRC}" groupingUsed="true" /></td>
                                    <td><fmt:formatNumber value="${rowSum.CANCEL_PRC}" groupingUsed="true" /></td>
                                    <td><fmt:formatNumber value="${rowSum.ORD_PRC}" groupingUsed="true" /></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
               </table><!-- // table -->
               
               <div class="section-title"><!-- section-title -->
                   <h3 class="title"><span>주문상세</span></h3>
                   <div class="more">
                       <a href="javascript:goExcelDown();" class="button small primary"><span>엑셀 다운로드</span></a>
                   </div>
               </div><!-- // section-title -->
                    
               <table cellspacing="0" class="table-col table-b"><!-- table -->
                   <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 5%;" />
                        <col style="width: 7%;" />
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 7%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>주문번호</th>
                            <th>상품유형</th>
                            <th>회원명</th>
                            <th>상품코드</th>
                            <th>상품명</th>
                            <th>결제금액</th>
                            <th>수량</th>
                            <th>기간계상품코드</th>
                            <th>결제수단</th>
                            <th>주문일자</th>
                            <th>주문상태</th>
                        </tr>
                    </thead>
                    <tbody id="orderChannelTable">
                    </tbody>
                </table><!-- // table -->
                
                <form name="excelForm" id="excelForm"><!-- 엑셀다운 폼 -->
                    <input type="hidden" name="CHN_DTL_CD" value="<c:out value="${commandMap.CHN_DTL_CD }"/>" />
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchOrdGb" value="<c:out value="${commandMap.searchOrdGb }"/>" />
                </form><!-- // 엑셀다운 폼 -->
                
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
                </form>
                
            </div><!-- // container -->

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
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>  
  
<script>    
$(function () {
    
	getOrderChannelListAjax();
	   
    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
       $("#excelForm").attr({"action": "<c:out value="${serverDomain}" />/am/stats/orderChannelListExcel.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#goSearch", function () {
        var $searchForm = $("#searchForm");
        
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/stats/orderChannelList.do", "target":"_self", "method":"post"}).submit(); 
    });
    // 페이지 이동

    var CHN_DTL_CD =  "";
    
    function searchOrdChn(evtDtlIdx)
    {
        CHN_DTL_CD = evtDtlIdx;
        getOrderChannelListAjax();
    }
    
    //설문 목록 가져오기
    function getOrderChannelListAjax()
    {       
         
        var searchStartDate =  $("#searchStartDate").val();
        var searchEndDate =  $("#searchEndDate").val();
        var searchOrdGb =  $(":input:radio[name=searchOrdGb]:checked").val();
        
        $.ajax({
            type: "post",
            url: "<c:out value="${serverDomain}"/>/am/stats/orderChannelListAjax.do",
            data: {"CHN_DTL_CD" : CHN_DTL_CD, "searchStartDate" : searchStartDate, "searchEndDate" : searchEndDate, "searchOrdGb" : searchOrdGb},   
            dataType : "json",
            async: false,
            success: function(data)
            {
                if(data.orderList != null)
                {
                    var i = 0;
                    var html = "";
                    $.each(data.orderList, function(index,item)
                    {    
                        i++;
                        html += "<tr>"; 
                        html += "<td>";
                        html += i;
                        html += "</td>";
                        html += "<td>";
                        html += item.ORD_MST_CD;
                        html += "</td>";
                        html += "<td>";
                        html += item.PRD_MST_TYPE;
                        html += "</td>";
                        html += "<td>";
                        html += item.ORD_MST_ORD_NM;
                        html += "</td>";
                        html += "<td>";
                        html += item.PRD_MST_CD;
                        html += "</td>";
                        html += "<td>";
                        html += item.PRD_MST_NM;
                        html += "</td>";
                        html += "<td>";
                        html += setComma(item.ORD_PRD_ORD_PRC);
                        html += "</td>";
                        html += "<td>";
                        html += item.ORD_PRD_ORD_CNT;
                        html += "</td>";
                        html += "<td>";
                        html += item.PRD_MST_ERP_CD;
                        html += "</td>";
                        html += "<td>";
                        html += item.ORD_MST_PAY_TYPE;
                        html += "</td>";
                        html += "<td>";
                        html += item.ORD_MST_ORD_DT;
                        html += "</td>";
                        html += "<td>";
                        html += item.ORD_PRD_ORD_STATE;
                        html += "</td>";
                        
                        html += "</tr>";
                    });     
                        $("#orderChannelTable").html(html);
                        
                        if(i==0)$( "#orderChannelTable" ).html("<tr><td colspan=\"12\">매출 내역이 없습니다.</td></tr>");
                        
                }
                else
                {   
                    $( "#orderChannelTable" ).html("<tr><td colspan=\"12\"매출 내역이 없습니다.</td></tr>");
                }   
            },
            error : function (err)
            {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }
        });
    }
    
});
</script>

</body>
</html>
