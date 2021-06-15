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

                <h2 class="title"><span>정산목록</span></h2>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchMonth" id="searchMonth"/>
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;" />
	                        <col style="width: 35%;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 35%;" />
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
									</select> 년
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
	                            <th><span>업체명</span></th>
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
										<option value="" >전체</option>
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
	                    </tbody>
	                </table><!-- // table -->
                </form>

                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">
                	<input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="searchVdrMstMdId" value="<c:out value="${commandMap.searchVdrMstMdId }"/>"/>
                    <input type="hidden" name="searchJungsanYear" value="<c:out value="${commandMap.searchJungsanYear }"/>"/>
                    <input type="hidden" name="searchJungsanMonth" value="<c:out value="${commandMap.searchJungsanMonth }"/>"/>
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->

	                    <div class="text-right">
	                    	<c:if test="${commandMap.searchAdmMstSubIdx > 0}">
	                        	<a href="#none" id="goRequestCnfm" class="button small primary"><span>SCM정산확정</span></a>
	                        </c:if>
	                        <c:if test="${commandMap.searchAdmMstSubIdx < 0}">
	                        	<a href="#none" id="goRequest" class="button small primary"><span>SCM정산요청</span></a>
	                        </c:if>
	                         <a id ="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2"><input type="checkbox" class="checkbox checkAll"/></th>
								<th rowspan="2">NO</th>
                                <th rowspan="2">업체명</th>
                                <th rowspan="2">정산일자</th>
                                <th rowspan="2">구매확정건수</th>
                                <th rowspan="2">결제금액</th>
                                <th rowspan="2">할인금액</th>
                                <th rowspan="2">배송비</th>
                                <th rowspan="2">입점수수료</th>
                                <th colspan="2">매장수수료</th>
                                <th rowspan="2">정산대상금액</th>
                                <th rowspan="2">MD명</th>
                                <th rowspan="2">SCM확인여부</th>
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
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td>
			                                	<input type="checkbox" class="checkbox checkRow"  id="VDR_MST_IDX<c:out value="${i.index }"/>" name="VDR_MST_IDX_CHK" value="<c:out value="${row.VDR_MST_IDX }"/>" />
			                                	<input type="hidden" name="ACC_MONTH" id="ACC_MONTH<c:out value="${i.index }"/>"  value="<c:out value="${row.ACC_MONTH }"/>"/>
			                                	<input type="hidden" name="ACC_REQ_STATUS" id="ACC_REQ_STATUS<c:out value="${i.index }"/>"  value="<c:out value="${row.ACC_REQ_STATUS }"/>"/>
			                                </td>
			                                <td>
												<a href="#none" class="list-title"	data-vdr_mst_idx="${row.VDR_MST_IDX }" data-acc_month="${row.ACC_MONTH }">
			                                		<c:out value="${row.VDR_MST_NM }" />
			                                	</a>
			                                </td>
			                                <td><c:out value="${row.VDR_MST_BAL_ACT }" />일</td>
			                                <td><c:out value="${row.ORD_CNT }" /></td>
			                                <td><fmt:formatNumber value="${row.PRD_MST_BUY_PRC}" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.PRD_MST_ORD_PRC}" groupingUsed="true" /></td>
			                                <td><fmt:formatNumber value="${row.ORD_PRD_DLV_CAG}" groupingUsed="true" /></td>
                                            <td>1,500,000</td>
                                            <td>2,500,000</td>
			                                <td><fmt:formatNumber value="${row.JUNGSAN_AMT}" groupingUsed="true" /></td>
			                                <td><c:out value="${row.ADM_MST_NM }" /></td>
			                                <td>
			                                	<c:choose>
			                                		<c:when test="${row.ACC_REQ_STATUS eq 'X'}">
			                                		정산미진행
			                                		</c:when>
			                                		<c:when test="${row.ACC_REQ_STATUS eq 'R'}">
			                                		정산요청중
			                                		</c:when>
			                                		<c:when test="${row.ACC_REQ_STATUS eq 'Y'}">
			                                		정산확정
			                                		</c:when>
			                                	</c:choose>
			                                </td>

			                            </tr>
			                            <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
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
	                        <%-- <ui:paging paging="${paging }" jsFunction="goPage" /> --%>
	                        <a class="ir first" href="javascript:;" ><i><em>처음</em></i></a> <a class="ir prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em></em><span>1<span></strong> <a class="ir next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="ir last" href="javascript:;" ><i><em>끝</em></i></a>
	                    </div>
	                </div><!-- // section pagination -->
				</form>
                <form name="excelForm" id="excelForm">
                	<input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="searchVdrMstMdId" value="<c:out value="${commandMap.searchVdrMstMdId }"/>"/>
                    <input type="hidden" name="searchJungsanYear" value="<c:out value="${commandMap.searchJungsanYear }"/>"/>
                    <input type="hidden" name="searchJungsanMonth" value="<c:out value="${commandMap.searchJungsanMonth }"/>"/>

                </form>
                <form name="detailForm" id="detailForm">
                	<input type="hidden" name="searchVdrMstIdx" value=""/>
                    <input type="hidden" name="searchJungsanYear" value=""/>
                    <input type="hidden" name="searchJungsanMonth" value=""/>
                    <input type="hidden" name="searchMonth" value=""/>
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
    $(document).on("keydown", ".serach-text", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });

    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm");
        var searchJungsanYear = $("#searchJungsanYear").val();
        var searchJungsanMonth = $("#searchJungsanMonth").val();
        var searchMonth = searchJungsanYear+searchJungsanMonth;

        $("#searchMonth").val(searchMonth);
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/accounting/companyAccountingList.do", "target":"_self", "method":"post"}).submit();
    });

    $(document).on("click", "#accountingRequest", function () {
        var $searchForm = $("#searchForm");
        var searchJungsanYear = $("#searchJungsanYear").val();
        var searchJungsanMonth = $("#searchJungsanMonth").val();
        var searchMonth = searchJungsanYear+searchJungsanMonth;

        $("#searchMonth").val(searchMonth);
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/accounting/companyAccountingRequest.do", "target":"_self", "method":"post"}).submit();
    });


 	$(document).on("click", "#goRequest", function ()
 	{
 		var vdrMstIdxs = [];
 		var accMonths = [];
 		var chk = "Y";
 		if($("input[name='VDR_MST_IDX_CHK']:checked").length == 0)
 		{
 			alert("정산요청할 행을 선택하세요.");
 			return;
 		}
 		if(!confirm("정산요청 하시겠습니까?"))
 		{
 			return;
 		}
 		else
 		{
 			$("input[name='VDR_MST_IDX_CHK']:checked").each(function(){
 				var id = $(this).attr('id');
 				var VDR_MST_IDX = $(this).val();
 				id = id.replace('VDR_MST_IDX','');
 				var accMonth = $("#ACC_MONTH"+id).val();
 				var status = $("#ACC_REQ_STATUS"+id).val();

 				if(status =="R")
 				{
 					alert("이미 정산요청 되었습니다.");
 					chk = "N";
 				}
 				if(status =="Y")
 				{
 					alert("이미 정산확정 되었습니다.");
 					chk = "N";
 				}

 				vdrMstIdxs[vdrMstIdxs.length] = VDR_MST_IDX;
 				accMonths[accMonths.length] = accMonth;

 				$(this).prop("checked",false);
 			});
 			if(chk=="Y")
 			{
				$.ajax({
	 				type: "post",
	 				url: "<c:out value="${serverDomain}"/>/am/accounting/companyAccountingUpdateAjax.do",
	 				data: {"vdrMstIdxs[]": vdrMstIdxs, "accMonths[]": accMonths},
	 				async: false,
	 				success: function(data)
	 				{
	 					if(data.result == "success" )
	 					{
	 						alert("처리 되었습니다.");
	 						//	getEventImageListAjax();
	 						$("#search").trigger('click');
	 					}
	 				},
	 				error : function (err)
	 				{
	 			      	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	 				}
	 			});
	 		}
 		}
 	});

 	$(document).on("click", "#goRequestCnfm", function ()
 	{
 		var vdrMstIdxs = [];
 		var accMonths = [];
 		var chk = "Y";
 		if($("input[name='VDR_MST_IDX_CHK']:checked").length == 0)
 		{
 			alert("정산확정할 행을 선택하세요.");
 			return;
 		}
 		if(!confirm("정산확정 하시겠습니까?"))
 		{
 			return;
 		}
 		else
 		{
 			$("input[name='VDR_MST_IDX_CHK']:checked").each(function(){
 			var id = $(this).attr('id');
 			var VDR_MST_IDX = $(this).val();
 			id = id.replace('VDR_MST_IDX','');
 			var accMonth = $("#ACC_MONTH"+id).val();
 			var status = $("#ACC_REQ_STATUS"+id).val();

 			if(status =="X")
 			{
 		 		alert("아직 정산요청 되지 않았습니다.");
 		 		chk = "N";
 		 	}
 		 	if(status =="Y")
 		 	{
 		 		alert("이미 정산확정 되었습니다.");
 		 		chk = "N";
 		 	}

 		 	vdrMstIdxs[vdrMstIdxs.length] = VDR_MST_IDX;
 		 	accMonths[accMonths.length] = accMonth;

 		 	$(this).prop("checked",false);
 		 	});
 		 	if(chk=="Y")
 		 	{
 				$.ajax({
 					type: "post",
 					url: "<c:out value="${serverDomain}"/>/am/accounting/companyAccountingCnfmUpdateAjax.do",
 					data: {"vdrMstIdxs[]": vdrMstIdxs, "accMonths[]": accMonths},
 					async: false,
 					success: function(data)
 					{
 						if(data.result == "success" )
 						{
 							alert("처리 되었습니다.");
 							//	getEventImageListAjax();
 							$("#search").trigger('click');
 			 			}
 			 		},
 			 		error : function (err)
 			 		{
 			 		   	alert("오류가 발생하였습니다.\n[" + err.status + "]");
 			 		}
 			 	});
 		 	}
 		}
 	});
 // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
    	var searchJungsanYear = $("#searchJungsanYear").val();
        var searchJungsanMonth = $("#searchJungsanMonth").val();
        var searchMonth = searchJungsanYear+searchJungsanMonth;

        $("#searchMonth").val(searchMonth);
       $("#searchForm").attr({"action": "<c:out value="${serverDomain}" />/am/accounting/companyAccountingExcel.do", "target":"_self", "method":"post"}).submit();
    });

    $(document).on(	"click",".list-title",function() {
		var $frm = $("#detailForm");
		var acc_month = $(this).data("acc_month")+"";
		//alert(acc_month);
		var acc_year = acc_month.substring(0,4);
		//alert(acc_year);
		var acc_mon = acc_month.substring(4);
		//alert(acc_mon);
		$frm.find("input[name='searchVdrMstIdx']").val($(this).data("vdr_mst_idx"));
		$frm.find("input[name='searchJungsanYear']").val(acc_year);
		$frm.find("input[name='searchJungsanMonth']").val(acc_mon);
		$frm.find("input[name='searchMonth']").val(acc_month);

		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/accounting/companyAccountingDetail.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
	});
});
//-->
</script>

</body>
</html>
