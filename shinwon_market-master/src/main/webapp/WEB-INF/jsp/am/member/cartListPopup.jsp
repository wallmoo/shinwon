<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title">
					<span>장바구니</span>
				</h2>
				
				<%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>

				<div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
		             <ul class="tab">
		                 <li class="${(empty commandMap.searchTab || commandMap.searchTab eq 'warning') ? ' active' : ''}"><a href="<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?searchTab=warning&MEM_MST_MEM_ID=${commandMap.MEM_MST_MEM_ID}"><span>경고 내역</span></a></li>
		                 <li class="${commandMap.searchTab eq 'stopAndClear' ? ' active' : ''}"><a href="<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?searchTab=stopAndClear&MEM_MST_MEM_ID=${commandMap.MEM_MST_MEM_ID}"><span>정지/해제 내역</span></a></li>
		             </ul>
		        </div><!-- // tab -->

                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>

                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>

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
                                <th><span>등록일자</span></th>
                                <td colspan="7">
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
                                <th><span>입점사명</span></th>
                                <td colspan="3">
                                    <select class="select">
                                        <option>전체</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>상품코드</span></th>
                                <td>
                                    <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text" value="<c:out value="${commandMap.searchProductCd}"/>">
                                </td>
                                <th><span>상품명</span></th>
                                <td>
                                    <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text" value="<c:out value="${commandMap.searchPrdMstNm }"/>">
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>
                
                <p style="color:red;line-height:0;">! 장바구니는 최대 30일간 보관됩니다.</p>
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->

                   <table cellspacing="0" class="table-col table-b"><!-- table -->
                       <colgroup>
                           <col style="width: 5%;" />
                           <col style="width: 5%;" />
                           <col style="width: 10%;" />
                           <col style="width: auto;" />
                           <col style="width: 10%" />
                           <col style="width: 10%;" />
                           <col style="width: 10%;" />
                           <col style="width: 10%;" />
                       </colgroup>
                       <thead>
                           <tr>
                               <th>번호</th>
                               <th>상품코드</th>
                               <th>입점사명</th>
                               <th>상품명</th>
                               <th>옵션정보</th>
                               <th>수량</th>
                               <th>판매가</th>
                               <th>등록일자</th>
                           </tr>
                       </thead>
                        <tbody id="list-field">
                        	<c:choose>
							    <c:when test="${not empty cartlist }">
							        <c:forEach var="cart" items="${cartlist }" varStatus="i">
							            <tr>
							                <td><c:out value="${i.count }"/></td>
							                <td><a href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }" />');"><c:out value="${cart.PRD_MST_CD }"/></a></td>
							                <td><a href="javascript:goView('<c:out value="${cart.VDR_MST_IDX }"/>');"><c:out value="${cart.VDR_MST_NM }"/></a></td>
							                <td><a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${cart.PRD_MST_CD}" target="_blank"><c:out value="${cart.PRD_MST_NM }"/></a></td>
							                <td><c:out value="${cart.MEM_CRT_COLOR_TITLE }"/> / <c:out value="${cart.MEM_CRT_SIZE_VALUE }"/></td>
							                <td><c:out value="${cart.MEM_CRT_CNT }"/></td>
							                <td><fmt:formatNumber value="${cart.PRD_MST_PRC}" type="number"/>원</td>
							                <!-- TODO 등록일자 데이터 수정 -->
							                <td><ui:formatDate value="${cart.MEM_CRT_REG_DT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							            </tr>
							        </c:forEach>
							    </c:when>
							    <c:otherwise>
					    			<tr>
							            <td class="td_no_result">장바구니  목록이 없습니다.</td>
							        </tr>
							    </c:otherwise>
							</c:choose>
                        </tbody>
                   </table>

                   <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                   <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                   <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                   <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                   <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                   <input type="hidden" name="searchBrdInqContents" value=""/>
                   <input type="hidden" name="searchBrdInqReplyCd" value=""/>
                   <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
                   <input type="hidden" name="BRD_INQ_IDX" value=""/>

                   <div class="section-pagination"><!-- section pagination -->
                       <h4 class="sr-only">목록 페이징</h4>
                       <div class="wrap">
                           <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                        </div>
                   </div><!-- // section pagination -->

               </form>
               
               <form id="prdFrm" name="prdFrm">
                    <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value=""/>
                    <input type="hidden" id="searchPrdMstErpCd" name="searchPrdMstErpCd" value=""/>
                    <input type="hidden" id="VDR_CST_IDX" name="VDR_CST_IDX" value=""/>
                </form>
			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->

	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
	    $(function(){
	        // 페이지 이동
	        goPage = function (cPage)
	        {
	            var $frm = $("#frm");
	            $frm.find("input[name='cPage']").val(cPage);
	            $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/cartListPopup.do", "target":"_self", "method":"post"}).submit();
	        };
	        
	     	// 주문정보 상세 팝업페이지 호출
	        goOrderView = function (ordMstCd)
	        {
	            goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
	        };
	        
	        // 상품 상세페이지 이동
	        goProductView = function (prdMstCd)
		    {
		        var $prdFrm = $("#prdFrm");
		        $("#PRD_MST_CD").val(prdMstCd);
		        $prdFrm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
		    };
	        
	        goSearch = function(){
	        	var $searchForm = $("#searchForm");
	        	$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/cartListPopup.do", "target":"_self", "method":"post"}).submit();
	        }
	        
	     	// 업체명 클릭 이벤트
	    	goView = function (vdrCstIdx) {
	    		var $prdFrm = $("#prdFrm");
	    		$prdFrm.find("input[name='VDR_CST_IDX']").val(vdrCstIdx);
	    		$prdFrm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorCounselEdit.do", "target":"_self", "method":"post"}).submit();
	    	};
	    });
	</script>
</body>
</html>
