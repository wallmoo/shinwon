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
<body>

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

                <h2 class="title"><span>쿠폰발행내역</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

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
	                        <tr>
	                            <th><span>쿠폰종류</span></th>
	                            <td>
	                                <select id="searchCpnMstGbn" name="searchCpnMstGbn" class="select" title="쿠폰종류">
										<option value="">전체</option>
										<option value="A" <c:if test="${commandMap.searchCpnMstGbn eq 'A' }">selected="selected"</c:if>>일반</option>
										<option value="B" <c:if test="${commandMap.searchCpnMstGbn eq 'B' }">selected="selected"</c:if>>생일</option>
										<option value="C" <c:if test="${commandMap.searchCpnMstGbn eq 'C' }">selected="selected"</c:if>>첫구매</option>
										<option value="D" <c:if test="${commandMap.searchCpnMstGbn eq 'D' }">selected="selected"</c:if>>회원등급</option>
										<option value="E" <c:if test="${commandMap.searchCpnMstGbn eq 'E' }">selected="selected"</c:if>>회원가입</option>
										<option value="F" <c:if test="${commandMap.searchCpnMstGbn eq 'F' }">selected="selected"</c:if>>배송비무료</option>
										<option value="G" <c:if test="${commandMap.searchCpnMstGbn eq 'G' }">selected="selected"</c:if>>제휴</option>
					                </select>
	                            </td>
	                            <th><span>쿠폰명</span></th>
	                            <td>
	                                <input type="text" name="searchCpnMstTitle" id="searchCpnMstTitle" class="text long" value="<c:out value="${commandMap.searchCpnMstTitle }"/>">
	                            </td>
	                            <th><span>쿠폰번호</span></th>
	                            <td>
	                              	<input type="text" name="searchCpnMstIdx" id="searchCpnMstIdx" class="text long" value="<c:out value="${commandMap.searchCpnMstIdx }"/>" style="width:50%;">
	                            </td>
                            </tr>
                            <tr>
	                            <th><span>발급방식</span></th>
	                            <td>
	                                <select id="searchCpnMstIsuGbn" name="searchCpnMstIsuGbn" class="select" title="발급방식">
										<option value="">전체</option>
										<option value="A" <c:if test="${commandMap.searchCpnMstIsuGbn eq 'A' }">selected="selected"</c:if>>자동발급</option>
										<option value="B" <c:if test="${commandMap.searchCpnMstIsuGbn eq 'B' }">selected="selected"</c:if>>운영자수동발급</option>
										<option value="C" <c:if test="${commandMap.searchCpnMstIsuGbn eq 'C' }">selected="selected"</c:if>>다운로드발급</option>
					                </select>
	                            </td>
	                            <th><span>대상채널</span></th>
	                            <td>
	                                <input type="radio" id="shoppingChannerA" name="searchCpnMstShopType" class="radio" <c:if test="${empty commandMap.searchCpnMstShopType }">checked="checked"</c:if> value=""/>
	                                <label for="shoppingChannerA">전체</label>
	                                <input type="radio" id="shoppingChannerB" name="searchCpnMstShopType" class="radio" <c:if test="${commandMap.searchCpnMstShopType eq 'PC' }">checked="checked"</c:if> value="PC"/>
	                                <label for="shoppingChannerB">PC</label>
	                                <input type="radio" id="shoppingChannerC" name="searchCpnMstShopType" class="radio" <c:if test="${commandMap.searchCpnMstShopType eq 'MOBILE' }">checked="checked"</c:if> value="MOBILE"/>
	                                <label for="shoppingChannerC">MOBILE</label>
	                            </td>
	                            <th><span>상태</span></th>
	                            <td>
	                              	<input type="radio" id="stateA" name="searchCpnMstUseYn" class="radio" <c:if test="${empty commandMap.searchCpnMstUseYn }">checked="checked"</c:if> value=""/>
	                                <label for="stateA">전체</label>
	                                <input type="radio" id="stateB" name="searchCpnMstUseYn" class="radio" <c:if test="${commandMap.searchCpnMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                                <label for="stateB">사용</label>
	                                <input type="radio" id="stateC" name="searchCpnMstUseYn" class="radio" <c:if test="${commandMap.searchCpnMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/>
	                                <label for="stateC">중지</label>
	                            </td>
                            </tr>
                            <tr>
	                            <th><span>기간검색</span></th>
	                            <td colspan="5">
	                            	<select id="searchCpnMstSeDt" name="searchCpnMstSeDt" class="select" title="기간검색">
		                        		<option value="A" <c:if test="${commandMap.searchCpnMstSeDt eq 'A' }">selected="selected"</c:if>>등록일</option>
										<option value="B" <c:if test="${commandMap.searchCpnMstSeDt eq 'B' }">selected="selected"</c:if>>발급기간</option>
					                </select>

	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchCpnMstStDt" name="searchCpnMstStDt" value="<c:out value="${commandMap.searchCpnMstStDt }"/>"   readonly="readonly" data-target-end="#searchCpnMstEdDt"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchCpnMstEdDt" name="searchCpnMstEdDt" value="<c:out value="${commandMap.searchCpnMstEdDt }"/>"  readonly="readonly" data-target-start="#searchCpnMstStDt"/>
									<a href="javascript:fnDateReset('searchCpnMstEdDt', 'searchCpnMstStDt');" class="button button-a xsmall"><span>전체</span></a>
	                                <a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                                <a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                                <a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                                <a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	                <input type="hidden" name="searchGb" id="searchGb" value="Y"/>
                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">
	                <input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value="" />
                    <input type="hidden" name="CPN_MST_GBN" id="CPN_MST_GBN" value="" />
                    <input type="hidden" name="CPN_MST_TITLE" id="CPN_MST_TITLE" value="" />
                    <input type="hidden" name="CPN_MST_YN" id="CPN_MST_YN" value="" />
                    <input type="hidden" name="searchCpnMstGbn" value="<c:out value="${commandMap.searchCpnMstGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstTitle" value="<c:out value="${commandMap.searchCpnMstTitle }"/>"/>
                    <input type="hidden" name="searchCpnMstIdx" value="<c:out value="${commandMap.searchCpnMstIdx }"/>"/>
                    <input type="hidden" name="searchCpnMstIsuGbn" value="<c:out value="${commandMap.searchCpnMstIsuGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstShopType" value="<c:out value="${commandMap.searchCpnMstShopType }"/>"/>
                    <input type="hidden" name="searchCpnMstUseYn" value="<c:out value="${commandMap.searchCpnMstUseYn }"/>"/>
                    <input type="hidden" name="searchCpnMstSeDt" value="<c:out value="${commandMap.searchCpnMstSeDt }"/>"/>
                    <input type="hidden" name="searchCpnMstStDt" value="<c:out value="${commandMap.searchCpnMstStDt }"/>"/>
                    <input type="hidden" name="searchCpnMstEdDt" value="<c:out value="${commandMap.searchCpnMstEdDt }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>

	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>
                        <div class="col-1-2 text-right">
                            <a href="#none;" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                	</div><!-- // 목록 상단 버튼 -->


	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
                            <col style="width: 3%;" />
							<col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 5%;" />
                            <col style="width: 5%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 6%;" />
	                        <col style="width: 6%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 5%;" />
						</colgroup>
						<thead>
							<tr>
                                <th><input type="checkbox" class="checkbox checkAll"></th>
								<th>쿠폰번호</th>
	                            <th>쿠폰종류</th>
	                            <th>쿠폰명</th>
	                            <th>할인금액/율 <br/>(최대할인금액)</th>
	                            <th>발급(등록)기간</th>
	                            <th>사용기간</th>
	                            <th>발급수량</th>
                                <th>사용수량</th>
	                            <th>상태</th>
	                            <th>적용채널</th>
	                            <th>등록자</th>
	                            <th>등록일</th>
	                            <th>발행</th>
							</tr>
						</thead>
						<tbody id="list-field">
							<c:choose>
								<c:when test="${not empty list }">
									<c:set var="listNum" value="${paging.listNum}" />
									<c:forEach var="row" items="${list }" varStatus="i">
										<tr>
                                            <td><input type="checkbox" class="checkbox"></td>
											<td><c:out value="${row.CPN_MST_IDX }"/></td>
											<td>${row.CPN_GBN_NM}</td>
											<td class="left">
												<c:if test="${row.CPN_MST_GBN ne 'G' }">
													<a href="#none" class="list-title" data-cpn_mst_idx="<c:out value="${row.CPN_MST_IDX }"/>" data-cpn_mst_gbn="<c:out value="${row.CPN_MST_GBN }"/>" data-cpn_mst_title="<c:out value="${row.CPN_MST_TITLE }"/>" data-cpn_mst_yn="<c:out value="${row.CPN_MST_YN }"/>" data-view_type="view">
												</c:if>
												<c:choose>
													<c:when test="${row.CPN_MST_GBN eq 'D'}">
														${row.MEM_GRD}
													</c:when>
													<c:when test="${row.CPN_MST_TITLE eq null}">-</c:when>
													<c:otherwise><c:out value="${row.CPN_MST_TITLE }"/></c:otherwise>
												</c:choose>
				                                <c:if test="${row.CPN_MST_GBN ne 'G' }">
				                                	</a>
												</c:if>
			                                </td>
			                                <td>
			                                	<c:choose>
	                                            	<c:when test="${row.CPN_MST_SAL_GBN eq 'A'}"><fmt:formatNumber value="${row.CPN_MST_SAL_PRC}" type="number"/>%
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
		                                        <ui:formatDate value="${row.CPN_MST_ISU_ST_DT }" pattern="yyyy.MM.dd"/> ~<br/>
		                                        <ui:formatDate value="${row.CPN_MST_ISU_ED_DT }" pattern="yyyy.MM.dd"/>
			                                </td>
			                                <td>
			                                	<c:choose>
												<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'A'}">
													<ui:formatDate value="${row.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/> ~<br/>
	                                              	<ui:formatDate value="${row.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/>
												</c:when>
												<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'B'}">
													<span><c:if test="${row.CPN_MST_GBN eq 'G'}">등록</c:if>
														<c:if test="${row.CPN_MST_GBN ne 'G'}">발급</c:if>일로부터&nbsp;<c:out value="${row.CPN_MST_USE_DAY }"/>일</span>
												</c:when>
												<c:when test="${row.CPN_MST_ISU_DAY_GBN eq 'M'}">
													<span>
														발행당월말까지사용
													</span>
												</c:when>
												<c:otherwise>-</c:otherwise>
												</c:choose>
		                               		</td>
											<td><fmt:formatNumber value="${row.CPN_ISU_CNT }" pattern="###,###,###,###"/>
												<%-- <c:choose>
												<c:when test="${row.CPN_MST_LMT_YN eq 'Y'}">무제한
												</c:when>
												<c:otherwise>
													<c:if test="${row.CPN_MST_GBN ne 'G'}">
														<fmt:formatNumber value="${row.CPN_MST_ISU_CNT}" type="number"/>
													</c:if>
													<c:if test="${row.CPN_MST_GBN eq 'G'}">
														<a href="javascript:fnSearchOfflineCouponPopup('<c:out value="${row.CPN_MST_IDX }" />')">
															<fmt:formatNumber value="${row.CPN_MST_PTN_SHP_RND}" type="number"/>
														</a>
													</c:if>
												</c:otherwise>
												</c:choose> --%>
											</td>
                                            <td>
                                                <fmt:formatNumber value="${row.CPN_ISU_USED_CNT }" pattern="###,###,###,###"/>
                                            </td>
										 	<td>
										 		<c:out value="${row.CPN_MST_YN eq 'Y' ? '사용' : '미사용' }"/>
	                                       	</td>
											<td class="channel">
			                                	<c:choose>
													<c:when test="${row.CPN_MST_MBA_YN eq 'Y' and row.CPN_MST_MBW_YN eq 'Y' and row.CPN_MST_PC_YN eq 'Y'}">전체
													</c:when>
													<c:otherwise>
														<c:if test="${row.CPN_MST_PC_YN eq 'Y'}" >PC, </c:if>
														<c:if test="${row.CPN_MST_MBW_YN eq 'Y'}" >MOBILE Web, </c:if>
														<c:if test="${row.CPN_MST_MBA_YN eq 'Y'}" >MOBILE App, </c:if>
													</c:otherwise>
												</c:choose>
			                                </td>
			                                <td>
												<c:out value="${row.ADM_MST_NM }"/><br/>(<c:out value="${row.CPN_MST_REG_ID }"/>)
											</td>
											<td>
	                                        	<ui:formatDate value="${row.CPN_MST_REG_DT }" pattern="yyyy.MM.dd"/>
			                                </td>
			                                <td>
	                                        	<c:if test="${(row.CPN_MST_YN eq 'Y')}">
	                                               	<c:if test="${row.CPN_MST_GBN ne 'G'}">
			                                			<a href="<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueAdm.do?CPN_MST_IDX=${row.CPN_MST_IDX}&CPN_MST_YN=${row.CPN_MST_YN}&CPN_MST_GBN=${row.CPN_MST_GBN}" class="button button-a" target="_self"><span>발행 </span></a>
			                                		</c:if>
			                                		<c:if test="${row.CPN_MST_GBN eq 'G'}">
			                                			<a href="<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueDetOff.do?CPN_MST_IDX=${row.CPN_MST_IDX}&CPN_MST_YN=${row.CPN_MST_YN}&CPN_MST_GBN=${row.CPN_MST_GBN}" class="button button-a" target="_self"><span>내역 </span></a>
			                                		</c:if>
			                                	</c:if>
			                                	<c:if test="${(row.CPN_MST_YN != 'Y')}">
				                                	<span class="label label-<c:out value="${row.CPN_MST_YN eq 'Y'?'b':'a' }"/>">
	                                                    <c:out value="${row.CPN_MST_YN eq 'Y'?'발행':'발행' }"/>
	                                                </span>
			                                	</c:if>
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
	 // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm");
        if($searchForm.valid())
        {
	        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueList.do", "target":"_self", "method":"post"}).submit();
        }
    });

 	// 상세페이지 이동
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='CPN_MST_IDX']").val($this.data("cpn_mst_idx"));
        $frm.find("input[name='CPN_MST_GBN']").val($this.data("cpn_mst_gbn"));
        $frm.find("input[name='CPN_MST_TITLE']").val($this.data("cpn_mst_title"));
        $frm.find("input[name='CPN_MST_YN']").val($this.data("cpn_mst_yn"));
        var viewType = $this.data("view_type");
        var url = "";
        if(viewType == "view")
        {
        	url = "<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueDet.do";
        }

        $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
    });
 	
 	// 전체 체크박스 선택 이벤트
 	$(document).on("change", "input.checkAll", function() {
		if($(this).is(":checked")){
			$('#list-field input:checkbox').prop('checked', true).addClass('focus');
		}else{
			$('#list-field input:checkbox').removeAttr('checked').removeClass('focus');
		}
	});
 	
 	// 개별 체크박스 선택 이벤트
 	$(document).on("change", "#list-field input:checkbox", function() {
		if($(this).is(":checked")){
			let chkAll = true;
			$('#list-field input:checkbox').each(function() {
				if(!$(this).is(":checked")){
					chkAll = false;
				}
			})
			
			if(chkAll){
				$('input.checkAll').prop('checked', true).addClass('focus');
			}
		}else{
			$('input.checkAll').removeAttr('checked').removeClass('focus');
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueList.do", "target":"_self", "method":"post"}).submit();
    };
    fnSearchOfflineCouponPopup = function( CPN_MST_IDX ){

		popup("<c:out value="${serverDomain}" />/am/marketing/onlineCouponPopup.do?CPN_MST_IDX="+CPN_MST_IDX, "800", "800", "yes", "searchOfflineCouponPopup");
	};
	
	$('.channel').each(function() {
		let text = $(this).text().trim();
		if(text.substr(text.length - 1) == ','){
			$(this).text(text.slice(0, -1));
		};
	})
});
//-->
</script>

</body>
</html>
