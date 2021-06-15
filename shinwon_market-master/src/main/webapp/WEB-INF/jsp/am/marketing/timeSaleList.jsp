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

                <h2 class="title"><span>타임세일</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
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
	                        <tr><!-- row -->
	                            <th><span>상품코드</span></th>
	                            <td>
	                                <input type="text" class="text large" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
	                            </td>
	                            <th><span>상품명</span></th>
	                            <td>
	                                <input type="text" class="text large" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                            </td>
	                            <th><span>사용여부</span></th>
	                            <td>
	                              	<input type="radio" id="searchTimeSaleUseYn1" class="radio" name="searchTimeSaleUseYn" value="" <ui:select v="${commandMap.searchTimeSaleUseYn }" t="" g="checked"/> />
									<label for="searchTimeSaleUseYn1">전체</label>
									<input type="radio" id="searchTimeSaleUseYn2" class="radio" name="searchTimeSaleUseYn" value="Y" <ui:select v="${commandMap.searchTimeSaleUseYn }" t="Y" g="checked"/> />
									<label for="searchTimeSaleUseYn2">사용</label>
									<input type="radio" id="searchTimeSaleUseYn3" class="radio" name="searchTimeSaleUseYn" value="N" <ui:select v="${commandMap.searchTimeSaleUseYn }" t="N" g="checked"/> />
									<label for="searchTimeSaleUseYn3">미사용</label>
	                            </td>
                            </tr>
                            <tr>
                                <th><span>구분</span></th>
                                <td>
                                   <select class="select" name="searchTimeSaleType">
                                        <option value="">전체</option>
                                        <option value="G" <c:if test="${commandMap.searchTimeSaleType eq 'G'}">selected="selected"</c:if>>일반</option>
                                        <option value="T" <c:if test="${commandMap.searchTimeSaleType eq 'T'}">selected="selected"</c:if>>타임스페셜</option>
                                   </select>
                                </td>
	                            <th><span>기간검색</span></th>
	                            <td colspan="5">
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />"   readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />"  readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button small"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button small"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button small"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button small"><span>한달</span></a>
	                           		<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button small"><span>두달</span></a>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:search();" class="button small primary"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
	                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchTimeSaleUesYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" id="TIM_SAL_IDX" name="TIM_SAL_IDX" value="" />
	                <input type="hidden" name="selectedTimeSaleList" id="selectedTimeSaleList">
	                <input type="hidden" name="COPY_YN" value="N" />
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
						
	                    <div class="col-1-2 text-right">
	                        <a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
	                       
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
			 	
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: auto;" />
							<col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: auto;" />
							<col style="width: 5%;" />
							<col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: 5%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>타임세일제목</th>
                                <th>구분</th>
								<th>상품코드</th>
                                <th>이미지</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>상품재고</th>
								<th>적용일/시간</th>
                                <th>전시여부</th>
                                <th>사용여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="timeSaleList">
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="item" items="${list }" varStatus="status">
							    		<c:forEach var="product" items="${item.productList }" varStatus="i">
							    				<tr>
													<c:if test="${i.first }">
									    				<td rowspan="${fn:length(item.productList) }"><c:out value="${item.RNUM }" /></td>
														<td rowspan="${fn:length(item.productList) }" class="left">
															<a href="#none" class="list-title" data-tim_sal_idx="<c:out value="${item.TIM_SAL_IDX }"/>">
																<c:out value="${item.TIM_SAL_NM }" />
															</a>
														</td>
														<td rowspan="${fn:length(item.productList) }"><c:out value="${item.TIM_SAL_TYPE eq 'G' ? '일반' : '타임스페셜' }" /></td>
													</c:if>
									    			
													<td class="border-left"><c:out value="${product.TIM_PRD_MST_CD }" /></td>
			                                        <td><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${product.PRD_IMAGE }"></span></td>
													<td class="left"><c:out value="${product.PRD_MST_NM }" /></td>
													<td><fmt:formatNumber value="${product.SALED_PRICE }" groupingUsed="true" /></td>
													<td><c:out value="${product.PRD_MST_SEL_CNT }" /></td>
													<c:if test="${i.first }">
									    				<td rowspan="${fn:length(item.productList) }">
									    					<ui:formatDate value="${item.TIM_SAL_ST_DT }" pattern="yyyy.MM.dd"/>&nbsp; <c:out value="${item.TIM_SAL_ST_HH }" />:<c:out value="${item.TIM_SAL_ST_MM }" />
															<br/>~<ui:formatDate value="${item.TIM_SAL_ED_DT }" pattern="yyyy.MM.dd"/>&nbsp;<c:out value="${item.TIM_SAL_ED_HH }" />:<c:out value="${item.TIM_SAL_ED_MM }" />
														</td>
														<td rowspan="${fn:length(item.productList) }">
															<select name="TIM_SAL_DSP_YN" class="select">
																<option <c:if test="${item.TIM_SAL_DSP_YN eq 'Y'}"> selected data-tim_sal_dsp_yn="Y" </c:if>>전시</option>
																<option <c:if test="${item.TIM_SAL_DSP_YN eq 'N'}"> selected data-tim_sal_dsp_yn="N" </c:if>>미전시</option>
															</select>
														</td>
														<td rowspan="${fn:length(item.productList) }"><c:if test="${item.TIM_SAL_USE_YN eq 'Y'}">사용</c:if><c:if test="${item.TIM_SAL_USE_YN eq 'N'}">미사용</c:if> </td>
														<td rowspan="${fn:length(item.productList) }">
															<ui:formatDate value="${item.TIM_SAL_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
														</td>
													</c:if>
												</tr>										
										</c:forEach>
									</c:forEach>
						    	</c:when>
								<c:otherwise>
									<c:if test="${param.searchYn eq 'Y'}">
							    	<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
									</tr>
							    	</c:if>
							    	<c:if test="${param.searchYn ne 'Y'}">
							    	<tr>
										<td class="td_no_result">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
									</tr>
							    	</c:if>
							    </c:otherwise>
							</c:choose>
						</tbody>
					</table>
                    
                    <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
                        <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                    </div><!-- // section button --> 
						
					<div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
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
	 // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
	
 // 상세페이지 이동
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        
        $frm.find("input[name='TIM_SAL_IDX']").val($this.data("tim_sal_idx"));
        
        var url = "";
        
        url = "<c:out value="${serverDomain}" />/am/marketing/timeSaleEdit.do";
        
        $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
    });
 
	$(document).on("click",	"#goRegist",function() {
		
		var data = new Array();
    	$("#timeSaleList").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.TIM_SAL_IDX = $tr.data("tim_sal_idx");
			obj.TIM_SAL_DSP_YN = $(this).find("select :selected").val() == "전시" ? 'Y' : 'N';
			data.push(obj);
		});
    	
		$("#selectedTimeSaleList").val(JSON.stringify(data));
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/marketing/timeSaleListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
    
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm");
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/timeSaleList.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/timeSaleList.do", "target":"_self", "method":"post"}).submit();
    };
    
    goView = function ( env, popMstIdx)
    {
        var $frm = $("#frm");
        $frm.find("TIM_SAL_IDX").val(popMstIdx);
        
      
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/timeSaleEdit.do", "target":"_self", "method":"post"}).submit();
     
    };

  
    goForm = function ()
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/timeSaleForm.do", "target":"_self", "method":"post"}).submit();
    };
    
	$(document).on("click", "#goCopy", function () {
    	
        var $frm = $("#frm");
        $frm.find("input[name='TIM_SAL_IDX']").val($(this).data("tim_sal_idx"));
        $frm.find("input[name='COPY_YN']").val("Y");
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/timeSaleEdit.do", "target":"_self", "method":"post"}).submit();
        
    });
});
//-->
</script>

</body>
</html>
