<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
		<div class="modal-inner">
			<h3 class="title"><span>셀러픽검색</span></h3>
			<form id="searchForm" name="searchForm">   
				 <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
				 <input type="hidden" name="searchYn" value="Y" />
				<table class="table-row table-a">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 35%;" />
						<col style="width: 15%;" />
						<col style="width: 35%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><label for="">등록일</label></th>
							<td colspan="3">
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchRegStartDate" id="searchRegStartDate" class="text date small" value="<c:out value="${commandMap.searchRegStartDate }"/>" readonly="readonly" data-target-end="#searchRegEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="searchRegEndDate" id="searchRegEndDate" class="text date small" value="<c:out value="${commandMap.searchRegEndDate }"/>" readonly="readonly" data-target-start="#searchRegStartDate"/>
									<a href="javascript:fnDateSet('searchRegEndDate', 'searchRegStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
									<a href="javascript:fnDateSet('searchRegEndDate', 'searchRegStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('searchRegEndDate', 'searchRegStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('searchRegEndDate', 'searchRegStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
							</td>
						</tr>
						
						<tr>
							<th><label for="searchPrdMstNm">키워드</label></th>
							<td colspan="3">
								<input type="text" class="text xlarge" id="searchKeyWords" name="searchKeyWords" value="<c:out value="${commandMap.searchKeyWords}"/>" />
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->
			</form>
			
			<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
				<a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
				<a href="javascript:search();" class="button small primary"><span>검색</span></a>
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
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 20%;" />

					</colgroup>
					<thead>
						<tr>
							<th rowspan="1"></th>
							<th rowspan="1">제목</th>
							<th rowspan="1">등록일</th>
						</tr>

					</thead>
					<tbody id="tbodyProductList">
						<c:choose>
							<c:when test="${not empty list}">
								<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td>
										<input type="radio" class="radio checkRow" id="CNT_MST_IDX_${item.CNT_MST_IDX}" name="CNT_MST_IDXs" value="${item.CNT_MST_IDX}^${item.CNT_MST_TITLE}^${item.CNT_MST_REG_DT}" />
										<input type="hidden" name="APPLY_IDXs" value="${item.CNT_MST_IDX}" />
									</td>
									<td>
									   <a href="${serverDomain}/am/display/vendorSellerPickEdit.do?CNT_MST_IDX=${item.CNT_MST_IDX}" target="_blank" title="새 창 으로 열립니다.">
										  <c:out value="${item.CNT_MST_TITLE }" />
										</a>
									</td>
									
									<td>
										<c:out value="${item.CNT_MST_REG_DT }" />
									</td>									
								</tr>

								<c:set var="listNum" value="${listNum-1}" />
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
                                <!-- 
								<tr>
									<td colspan="8">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
                                -->
							</c:otherwise>
						</c:choose>
					</tbody>
				</table><!-- // table -->
			
				<input type="hidden" name="searchRegStartDate" value="<c:out value="${commandMap.searchRegStartDate }"/>"/>
				<input type="hidden" name="searchRegEndDate" value="<c:out value="${commandMap.searchRegEndDate }"/>"/>
				<!-- <input type="hidden" name="searchKeyWords" value="<c:out value="${commandMap.searchKeyWords }"/>" /> -->
				<input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />

			</form>

			<div class="section-pagination"><!-- section pagination -->
				<h4 class="sr-only">목록 페이징</h4>
				<div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
					<ui:paging paging="${paging }" jsFunction="goPage" />
				</div>
			</div><!-- // section pagination -->
			
			<div class="grid section-button-search"><!-- section button -->
				<button type="button" id="productApply" class="button small primary"><span>선택</span></button>
				<button type="button" id="closePopup" class="button small" onclick="self.close()"><span>취소</span></button>
			</div>
		</div>
	</div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
window.onload = function () {
	  opener.SearchProductPop = this;  //자식 창이 뜰때 opener에 popup이라는 변수에 this를 지정해주며, 부모창에서 'popup'으로 자식창의 함수를 호출함.
	 }

$(document).ready(function () 
{	
	//체크박스 전체 선택
	$.checkBoxSelect("checkAll", "checkRow");


	// 검색 엔터 이벤트 
	$('#searchForm').find("input").not(".datepicker").keydown(function (e) 
	{
		if(e.keyCode == 13)
		{
			search();
		}
	});
	
	// 검색폼 초기화
	searchClear = function(formId){
		
	    $("#"+formId).find("input[type=text]").val("");
	    $("#"+formId).find("select").find("option:eq(0)").prop("selected", true);
	    $("#"+formId).find(":checkbox").prop("checked", false);
	    $("#"+formId).find("textarea").val("");
	    
	    var tmpRadioNm = "";
	    
	    $.each($("#"+formId).find(":radio"),function(idx,item){
	        if(tmpRadioNm != $(item).attr("name")){
	            $("#"+formId).find("input[name=" + $(item).attr("name") + "]:eq(0)").prop("checked", true);
	        }
	        tmpRadioNm = $(item).attr("name");
	    });
	}
	
	// 검색
	search = function() 
	{
		var $searchForm = $("#searchForm"); 

		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/searchSallerPickPopup.do" , "target":"_self", "method":"post"}).submit();

		
	};
	
	// 페이지 이동
	goPage = function (cPage) 
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/searchSallerPickPopup.do", "target":"_self", "method":"post"}).submit();
	};
	
	// 상품 상세페이지 이동 (새창)
	goView = function (prdMstCd)
	{
		var $frm = $("#frm");
		$frm.find("input[name='PRD_MST_CD']").val(prdMstCd);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
		
				
	};
	

	// 선택 클릭 이벤트
	$(document).on("click", "#productApply", function () 
	{
	
		var $checkObj = $.find("#tbodyProductList input[name='CNT_MST_IDXs']:checked");
		if( $checkObj.length == 0 ){
			alert("셀러픽을 선택하여 주십시오.");
			return;
		}
		
	
		var params = new Array();
		var obj;
		var myArray;

				
		
		$.each($checkObj, function(index,item){
			
			myArray = $(this).val().split('^');
			obj = new Object();
			obj.CNT_MST_IDX 	= myArray[0];	//셀러픽 idx
			obj.CNT_MST_TITLE	= myArray[1];	//셀러픽 이름
			obj.CNT_MST_REG_DT 	= myArray[2];	//셀러픽 등록일자 
			
			params.push(obj); //만들어진  object를 배열에 추가
		});
		
		
		window.opener.fnResultProduct(params);   	
		self.close();
	});
	
	alertMsg = function (msg){
		alert(msg);
	}
	
	$(document).on("click","#closePopup",function()
	{
		self.close();
	});    
		
});


$(document).ready(function () {
    //Paging count select 박스 적용
    var vPageSize = '<c:out value="${commandMap.pageSize }"/>';
    if ( vPageSize != '' )
      $('#pageSize').val( vPageSize );
    
});

</script>
</body>
</html>
