<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

    <div class="modal"><!-- modal -->
    
        <div class="modal-wrapper"><!-- modal-wrapper -->
        
            <div class="modal-inner"><!-- modal-inner -->
            
            <h2 class="title"><span>쿠폰</span></h2>
            
                <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
                <!-- // table -->
                
                <h3 class="title"><span>목록</span></h3>
            
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>사용가능쿠폰</span></th>
                            <td>
                                <c:if test="${empty couponSum.CPN_A_CNT }">0</c:if>
                                <c:if test="${not empty couponSum.CPN_A_CNT }"><fmt:formatNumber value="${couponSum.CPN_A_CNT}" type="number"/></c:if>
                            </td>
                            <th><span>사용한 쿠폰</span></th>
                            <td>
                                <c:if test="${empty couponSum.CPN_U_CNT }">0</c:if>
                                <c:if test="${not empty couponSum.CPN_U_CNT }"><fmt:formatNumber value="${couponSum.CPN_U_CNT}" type="number"/></c:if>
                            </td>
                            <th><span>만료된 쿠폰</span></th>
                            <td>
                                <c:if test="${empty couponSum.CPN_N_CNT }">0</c:if>
                                <c:if test="${not empty couponSum.CPN_N_CNT }"><fmt:formatNumber value="${couponSum.CPN_N_CNT}" type="number"/></c:if>
                            </td>
                        </tr>
                         
                    </tbody>
                </table><!-- // table -->
                            
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
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
                                <th><span>유효기간</span></th>
                                <td colspan="5">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchCouponStDt" id="searchCouponStDt" class="text" value="<c:out value="${commandMap.searchCouponStDt }"/>" readonly="readonly" data-target-end="#searchCouponEdDt"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchCouponEdDt" id="searchCouponEdDt" class="text" value="<c:out value="${commandMap.searchCouponEdDt }"/>" readonly="readonly" data-target-start="#searchCouponStDt"/>
                                    <a href="javascript:fnDateSet('searchCouponEdDt', 'searchCouponStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchCouponEdDt', 'searchCouponStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchCouponEdDt', 'searchCouponStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchCouponEdDt', 'searchCouponStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>쿠폰종류</span></th>
                                <td colspan="5">
                                    <select id="searchCpnMstGbn" name="searchCpnMstGbn" class="select" title="쿠폰종류">
                                        <option value="">전체</option>
                                        <c:forEach var="row" items="${couponTypeList}" varStatus="i">
											<option value="${row.CMN_COM_ETC1 }" <c:if test="${commandMap.searchCpnMstGbn eq row.CMN_COM_ETC1 }">selected="selected"</c:if>>${row.CMN_COM_NM }</option>
										</c:forEach>
                                    </select>                        
                                </td>
                            </tr>
                            <tr> 
                                <th><span>주문번호</span></th>
                                <td>
                                    <input type="text" class="text" name="searchCpnOrdNo" placeholder="주문번호 입력" value="<c:out value="${commandMap.searchCpnOrdNo}"/>"/> 
                                </td>
                                <th><span>쿠폰명</span></th>
                                <td>
                                    <input type="text" class="text" name="searchCpnMstNm" placeholder="쿠폰명 입력" value="<c:out value="${commandMap.searchCpnMstNm}"/>"/> 
                                </td>
                                <th><span>쿠폰번호</span></th>
                                <td>
                                    <input type="text" class="text" name="searchCpnMstIdx" placeholder="쿠폰번호 입력" value="<c:out value="${commandMap.searchCpnMstIdx}"/>"/> 
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
            
                </form>
                 
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->  
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div><!-- // 검색 하단 버튼 -->

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em">1</strong>건, 1 of 1 page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                  
                <form id="frm" name="frm">
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 10%;" />
                                <col style="width: 15%;" />
                                <col style="width: 15%;" />
                                <col style="width: 10%;" />
                                <col style="width: 20%;" />
                                <col style="width: 15%;" />
                                <col style="width: 10%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>쿠폰번호</th>
                                    <th>쿠폰종류</th>
                                    <th>쿠폰명</th>
                                    <th>할인금액/율<br/>(최대할인금액)</th>
                                    <th>유효기간</th>
                                    <th>사용일</th>
                                    <th>주문번호</th>
                                </tr>
                            </thead>
                            <tbody id="list-field">
                                <c:choose>
                                    <c:when test="${not empty list }">
                                        <c:set var="listNum" value="${paging.listNum}" />
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td><c:out value="${listNum }"/></td>
                                                <td><c:out value="${row.CPN_MST_IDX }"/></td>                                           
                                                <td>  ${row.CPN_MST_GBN_NM }
                                                    
                                                </td>
                                                <td class="left">       
                                                    <c:choose>
                                                    <c:when test="${row.CPN_MST_TITLE eq null}">-</c:when>
                                                    <c:otherwise><c:out value="${row.CPN_MST_TITLE }"/></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>                                                 
                                                    <c:choose>
                                                    <c:when test="${row.CPN_MST_SAL_GBN eq 'A'}">
                                                        <c:choose>
                                                            <c:when test="${row.CPN_MST_SAL_PRC eq null}">-</c:when>
                                                            <c:otherwise><fmt:formatNumber value="${row.CPN_MST_SAL_PRC}" type="number"/>%</c:otherwise>     
                                                        </c:choose> 
                                                        <c:choose>
                                                        <c:when test="${row.CPN_MST_MXM_PRC eq null}"></c:when>
                                                        <c:otherwise><br/>(<fmt:formatNumber value="${row.CPN_MST_MXM_PRC}" type="number"/>)</c:otherwise>     
                                                        </c:choose>                                           
                                                    </c:when>
                                                    <c:when test="${row.CPN_MST_SAL_GBN eq 'B'}"><c:out value="${row.CPN_MST_SAL_PRC }"/>
                                                    </c:when>
                                                    <c:otherwise>-
                                                    </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.CPN_USE_ST_DT }" pattern="yyyy.MM.dd"/> ~
                                                    <ui:formatDate value="${row.CPN_USE_ED_DT }" pattern="yyyy.MM.dd"/>
                                                </td>
                                                <td>          
                                                    <c:choose>
                                                    <c:when test="${row.CPN_USE_DT eq null}">-</c:when>
                                                    <c:otherwise><c:out value="${row.CPN_USE_DT }"/></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                
                                                <td>        
                                                    <p><a href="javascript:goOrderView('<c:out value="${row.CPN_USE_ORD_NO }" />');" title="새 창 으로 열립니다."><c:out value="${row.CPN_USE_ORD_NO}"/></a></p>
                                                </td>
                                                
                                            <c:set var="listNum" value="${listNum-1}" />
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                        </tr>
                                    </c:otherwise>  
                                </c:choose>
                            </tbody>
                        </table>
        
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchCouponStDt" value="<c:out value="${commandMap.searchCouponStDt }"/>"/>
                    <input type="hidden" name="searchCouponEdDt" value="<c:out value="${commandMap.searchCouponEdDt }"/>"/>
                    <input type="hidden" name="searchCpnOrdNo" value="<c:out value="${commandMap.searchCpnOrdNo }"/>"/>
                    <input type="hidden" name="searchCpnMstGbn" value="<c:out value="${commandMap.searchCpnMstGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstNm" value="<c:out value="${commandMap.searchCpnMstNm }"/>"/>
                    <input type="hidden" name="searchCpnMstIdx" value="<c:out value="${commandMap.searchCpnMstIdx }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>     
            
                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4> 
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div><!-- // section pagination -->
        
                </form>
            
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->
    
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

<script>
//<![CDATA[
$(document).ready(function () 
{
    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            goSearch();
        }
    });
    
    // 검색
    goSearch = function() 
    {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberCouponPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
        goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
        //goSearchDelivery(url);
        popup(url, "550", "700", "yes", "deliveryView");
    };
    
 	// 엑셀 다운로드
    $(document).on("click", "#excelDown", function () 
    {
    	 var $frm = $("#frm");
         $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberCouponListExcelDownload.do", "target":"_self", "method":"post"}).submit();
    });
    
});      
//]]>
</script>
</body>
</html>