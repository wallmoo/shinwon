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
            
            <h2 class="title"><span>주문내역</span></h2>
            
                <c:choose>
                    <c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
                        <%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>           
                    </c:when>
                    <c:otherwise>
                        <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                    </c:otherwise>
                </c:choose>
                
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
                <!-- // table -->
                
                <h3 class="title"><span>목록</span></h3>
            
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
                                <th><span>주문일자</span></th>
                                <td colspan="5">  
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>주문번호</span></th>
                                <td>
                                    <input type="text" class="text" name="searchOrderCd" placeholder="주문번호 입력" value="<c:out value="${commandMap.searchOrderCd}"/>"/> 
                                </td>
                                <th><span>주문상태</span></th>
                                <td>
                                    <select class="select" id="searchOrdPrdOrderState" name="searchOrdPrdOrderState">
                                        <option value="">주문상태 선택</option>
                                            <c:forEach items="${orderStateCodeList}" var="data">
                                                <option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchOrdPrdOrderState}" g="selected"/>>
                                                    <c:out value="${data.CMN_COM_NM}"/>
                                                </option> 
                                            </c:forEach> 
                                    </select>                               
                                </td>
                                <th><span>주문매체</span></th>
                                <td>
                                    <input type="radio" id="searchOrdType1" name="searchOrdType" class="radio" value="" <c:if test="${empty commandMap.searchOrdType }">checked="checked"</c:if> />
                                    <label for="searchOrdType1">전체</label>
                                    <input type="radio" id="searchOrdType2" name="searchOrdType" class="radio" value="${Code.USER_ENV_TYPE_PC }" <c:if test="${commandMap.searchOrdType eq Code.USER_ENV_TYPE_PC}">checked="checked"</c:if> />
                                    <label for="searchOrdType2">PC</label>
                                    <input type="radio" id="searchOrdType3" name="searchOrdType" class="radio" value="${Code.USER_ENV_TYPE_MOBILE }" <c:if test="${commandMap.searchOrdType eq Code.USER_ENV_TYPE_MOBILE}">checked="checked"</c:if> />
                                    <label for="searchOrdType3">MOBILE</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                            
                </form>
            
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchOrdPrdOrderState" value="<c:out value="${commandMap.searchOrdPrdOrderState }"/>"/>
                    <input type="hidden" name="searchOrderCd" value="<c:out value="${commandMap.searchOrderCd }"/>"/>
                    <input type="hidden" name="searchOrderId" value="<c:out value="${commandMap.searchOrderId }"/>"/>
                    <input type="hidden" name="searchOrdType" value="<c:out value="${commandMap.searchOrdType }"/>"/>
                    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>     
                    
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
                  
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <thead>  
                            <tr>
                                <!-- <th><input type="checkbox" class="checkbox checkAll"/></th> -->
                                <th><span>주문일시<br/>(주문번호)</span></th>
                                <th><span>주문자</span></th>
                                <th><span>상품명<br/>(상품코드)</span></th>                                
                                <th><span>수량</span></th>
                                <th><span>결제금액</span></th>
                                <th><span>주문매체</span></th>
                                <th><span>결제수단</span></th>
                                <th><span>채널</span></th>                                
                                <th><span>주문상태</span></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:set var="firstProd" value="Y"/>
                                <c:set var="prevOrdMstCd" value=""/>
                                <c:forEach items="${list}" var="data" varStatus="i">
                                    <!-- 같은 주문은 같은 색으로 음영처리 -->
                                    <c:if test="${data.ORD_MST_CD ne prevOrdMstCd}" > 
                                        <c:set var="firstProd" value="Y"/>
                                        <c:choose>
                                            <c:when test="${'N' ne sectionYn}">
                                                <c:set var="sectionYn" value="N"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="sectionYn" value="Y"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <tr <c:if test="${'Y' eq sectionYn}" >class="section"</c:if>>
                                    <c:if test="${firstProd eq 'Y'}" > 
                                        <%-- <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"> 
                                            <input type="checkbox" name="ordMstCds" value="<c:out value="${data.ORD_MST_CD }" />" class="checkbox checkRow"/>
                                        </td> --%>
                                        <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
                                            <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" title="새 창 으로 열립니다."><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm"/></a></p>
                                            <p>(<a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" title="새 창 으로 열립니다."><c:out value="${data.ORD_MST_CD}"/></a>)</p>
                                            <c:if test="${not empty data.ORD_MST_PRE_CD}">
                                                <p>재결제</p>
                                            </c:if>
                                        </td>
                                        <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
                                            <c:if test="${data.ORD_MST_ORD_ID ne '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>(<c:out value="${data.ORD_MST_ORD_ID}"/>)</c:if>
                                            <c:if test="${data.ORD_MST_ORD_ID eq '_GUEST_'}"><c:out value="${data.ORD_MST_ORD_NM}"/><br/>(비회원)</c:if>
                                        </td>
                                    </c:if>
                                        <td style="display:none;"></td>
                                        <td class="al">
                                        	<c:if test="${not empty data.ORD_PRD_ORG_IDX}" > 
                                                <img src="<c:out value="${serverDomain}"/>/am/img/ico_reply.png" alt="교환" style="width:17px;" />
                                            </c:if>
                                            
                                            <c:choose>
                                                <c:when test="${data.ORD_PRD_SLT_YN eq 'N' }"><%-- 마스터 or 필수옵션인 경우 --%>
                                                    <a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${data.ORD_PRD_MST_CD}" target="_blank">
                                                        <c:out value="${data.PRD_MST_NM}"/>
                                                    </a>
                                                    <c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0 }"><%-- 필수옵션인 경우 --%>
                                                        <br/>
                                                        (옵션)
                                                        <c:out value="${data.OPT_DTL_NM }"/>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${data.ORD_PRD_SLT_YN ne 'N' }"><%-- 선택옵션인 경우 --%>
                                                    (옵션)
                                                    <c:out value="${data.OPT_DTL_NM }"/>
                                                </c:when>
                                            </c:choose>
                                            <a href="javascript:goProductView('<c:out value="${data.ORD_PRD_MST_CD }" />');">
                                                (<c:out value="${data.ORD_PRD_MST_CD}"/>)
                                            </a>        
                                        </td>                                     
                                        <td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
                                        
                                        <c:if test="${firstProd eq 'Y'}" >  
                                            <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
                                                <fmt:formatNumber value="${data.CALCULATED_PAYMENT_PRICE}" type="number"/>
                                            </td>
                                        </c:if>
                                        
                                        <c:if test="${firstProd eq 'Y'}" >  
                                            <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
                                                <c:out value="${data.ORD_MST_ORD_TYPE eq 'P' ? 'PC' : 'MOBILE' }"/>
                                            </td>
                                        </c:if>
                                        
                                        <c:if test="${firstProd eq 'Y'}" >  
                                            <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />">
                                                <c:out value="${data.ORD_MST_PAY_TYPE_NM}"/>
                                                <%-- <c:if test="${not empty data.PAYDATE and data.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT}">
                                                    <br/>----------
                                                    <br/>
                                                    <ui:formatDate value="${data.PAYDATE}" pattern="MM/dd HH:mm"/>
                                                </c:if> --%>
                                            </td>
                                            <%-- <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"><fmt:formatNumber value="${data.ORD_MST_DLV_CAG}" type="number"/></td>
                                            <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"><fmt:formatNumber value="${data.ORD_MST_PAY_PRC}" type="number"/></td> --%>
                                            <%-- <td rowspan="<c:out value="${data.ORD_PRD_CNT }" />"><c:out value="${data.ORD_MST_ORD_TYPE}"/></td> --%>
                                        </c:if>
                                        
                                        <td><c:out value="${data.CHN_DTL_CD }"/></td>
                                        
                                        <td class="delivery">
                                            <p>
                                                <c:out value="${data.ORD_PRD_ORD_STATE_NM}"/>
                                            </p>    
                                            <c:if test="${not empty data.ORD_PRD_IVC_NO }">
                                            	<a href="javascript:goDeliveryView('<c:out value="${data.DLV_CPN_URL }" /><c:out value="${data.ORD_PRD_IVC_NO }" />');" class="button small">배송조회</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <c:set var="prevOrdMstCd" value="${data.ORD_MST_CD}"/>
                                    <c:set var="firstProd" value="N"/>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${commandMap.searchYn eq 'Y'}">
                                <tr>
                                    <td colspan="9">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                </tr>
                                </c:if>
                                <c:if test="${commandMap.searchYn ne 'Y'}">
                                <tr>
                                    <td colspan="9">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
                                </tr>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
            
                </form>
                
                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap">
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->
                     
                <form id="prdFrm" name="prdFrm">
                    <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value=""/>
                    <input type="hidden" id="searchPrdMstErpCd" name="searchPrdMstErpCd" value=""/>
                </form>
            
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->
    
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

<script>
$(function(){
    
    // 회원 검색 클릭 이벤트
    goSearch = function() 
    {
    	var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do", "target":"_self", "method":"post"}).submit(); 
    };  
     
    // 회원 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13)  
        {
            goSearch();
        }
    });
    
    // 페이지 이동 
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberOrderPopup.do", "target":"_self", "method":"post"}).submit();
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
    
    // 상품 상세페이지 이동
    goProductView = function (prdMstCd)
    {
        var $prdFrm = $("#prdFrm");
        $("#PRD_MST_CD").val(prdMstCd);
        $prdFrm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
    };
    
    //erp 상품 상세페이지 팝업
    goErpPrdDetail = function (erpMstCd)
    {
        var $prdFrm = $("#prdFrm");
        $("#searchPrdMstErpCd").val(erpMstCd);
        popup('',"1100","800","no","_ErpMstPrdDetailPopup");
        $prdFrm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/legacyErpProductDetailPopup.do", "target":"popup_ErpMstPrdDetailPopup", "method":"post"}).submit();
    };
});
</script>
</body>
</html>