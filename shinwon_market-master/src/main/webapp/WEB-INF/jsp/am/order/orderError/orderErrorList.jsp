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

                <h2 class="title"><span>결제오류조회</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>목록</span></h3>
                </div><!-- // section-title -->
					
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="searchYn" value="Y" />			
                
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
	                            <th><span>오류일자</span></th>
	                            <td colspan=5>
	                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                       			<input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
	                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>		                           
	                            </td>
							</tr>
							<tr>
	                            <th><span>주문번호</span></th>
	                            <td>
	                                <input type="text" class="text" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword}"/>"/>
	                            </td>
	                            <th><span>오류구분</span></th>
	                            <td>
	                                <select class="select" name="searchOrderErrType" id="searchOrderErrType">
	                                	<option value="" <c:if test="${empty commandMap.searchOrderErrType }">selected="selected"</c:if>>선택</option>
	                                	<option value="${Code.ORDER_ERR_TYPE_PG}" <c:if test="${commandMap.searchOrderErrType eq Code.ORDER_ERR_TYPE_PG}">selected="selected"</c:if>>PG오류</option>
	                                	<option value="${Code.ORDER_ERR_TYPE_DB }" <c:if test="${commandMap.searchOrderErrType eq Code.ORDER_ERR_TYPE_DB}">selected="selected"</c:if>>DB오류</option>
	                                </select>
	                            </td>
	                            <th><span>카드종류</span></th>
	                            <td>
									<select id="searchOrderErrCard" name="searchOrderErrCard" class="select">
										<option value="">선택</option>
										<c:if test="${not empty cardList }">
											<c:forEach var="row" items="${cardList }">
												<option value="<c:out value="${row.CRD_INF_CD }"/>" <c:if test="${row.CRD_INF_CD eq commandMap.searchOrderErrCard}">selected="selected"</c:if>>
													<c:out value="${row.CRD_INF_NM }"/>
			                                  	</option>
											</c:forEach>
										</c:if>
	                                </select> 
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
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>번호</th>
                            <th>구분</th>
                            <th>주문번호</th>
                            <th>카드명</th>
                            <th>회원아이디</th>
                            <th>오류일시</th>
                            <th>오류메시지</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
							<c:when test="${not empty list }">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="row" items="${list }" varStatus="i">
									<tr>
										<td><c:out value="${listNum }"/></td>
										<td><c:out value="${row.ORD_ERR_TYPE eq Code.ORDER_ERR_TYPE_PG ? 'PG':'DB' }"/></td>
										<td><c:out value="${row.ORD_ERR_ORD_CD }"/></td>
		                                <td><c:out value="${row.ORD_ERR_CRD_NM }"/></td>
										<!-- <td><c:out value="${row.ORD_ERR_REG_ID }"/>
										(<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.ORD_ERR_REG_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.ORD_ERR_REG_ID }"/></a>)
										</td> -->
										<td>
										<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.ORD_ERR_REG_ID }" />');" title="새 창 으로 열립니다."><c:out value="${row.ORD_ERR_REG_ID }"/></a>
										</td>
										<td><ui:formatDate value="${row.ORD_ERR_REG_DT}" pattern="yyyy.MM.dd HH:mm"/></td>
										<td style="text-align: left;">
											[ORD_ERR_REP_CODE:<c:out value="${row.ORD_ERR_REP_CODE }"/>]
											<br/><c:out value="${row.ORD_ERR_MSG }" escapeXml="false"/>
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
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchOrderErrType" value="<c:out value="${commandMap.searchOrderErrType }"/>"/>
                    <input type="hidden" name="searchOrderErrCard" value="<c:out value="${commandMap.searchOrderErrCard }"/>"/>
                    					
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
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/orderError/orderErrorList.do", "target":"_self", "method":"post"}).submit(); 
    	}
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/order/orderError/orderErrorList.do", "target":"_self", "method":"post"}).submit();
    };
	
	//체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");
	
	//선택채널이 있는 경우 리스트 가져온다.
	<c:if test="${commandMap.searchChannel1 eq 'channel'}">
		getSubChannelListAjax();
	</c:if>

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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/order/order"+ path +"List.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
//    goPage = function (cPage) 
//    {
//        var $frm = $("#frm");
//        $frm.find("input[name='cPage']").val(cPage);
//        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/order"+ path +"List.do", "target":"_self", "method":"post"}).submit();
//    };

    // 엑셀다운
//    goExcelDown = function () 
//    {
//    	if("${paging.totalRecordCount}" > 10000){
//    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
//    		return;
//    	}else if("${paging.totalRecordCount}" == 0){
//    		alert("저장할 내역이 없습니다.");
//    		return;
//    	}
    	
//        var $frm = $("#frm");
//        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderListExcel.do", "target":"_self", "method":"post"}).submit();
//    };
    
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
    
 	// 채널 선택시 하위 채널 리스트
    $(document).on("change", "#searchChannel1", function () 
    {
        if($(this).val() == "channel"){
        	getSubChannelListAjax();
        }else{
        	$("#searchChannel2").html("<option value=\"\">선택없음</option>");
        	//$("#searchChannel2").hide();
        }
    });
 	
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

// 하위 채널 리스트
function getSubChannelListAjax(){
	$.ajax({
		type:"post",
		url : "<c:out value="${serverDomain}" />/am/order/getSubChannelListAjax.do",
		data : null,
		dataType : "json",
		async : false,
		success : function(data){
			var htmlStr = "<option value=\"\">선택</option>";
			var searchChannel2 = "${commandMap.searchChannel2}";
			
			//하위 채널 리스트
			$.each(data.list, function(i, item){
				var selected = "";
				if(item.CHN_DTL_CD == searchChannel2){
					selected = "selected=\"selected\"";
				}
				
				htmlStr += "<option value=\""+ item.CHN_DTL_CD +"\" "+ selected +"> "+ item.CHN_DTL_NM +"</option>";
			});
			$("#searchChannel2").html(htmlStr);
			//$("#searchChannel2").show();
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}
//-->
</script>

</body>
</html>
