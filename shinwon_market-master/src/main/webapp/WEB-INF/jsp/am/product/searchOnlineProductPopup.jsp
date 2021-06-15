<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">상품검색</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">검색</h4>

			<div class="right">
				<a href="javascript:search();" class="button button-b"><span>검색</span></a>
				<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
			</div>
		</div>

		<div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
			<input type="hidden" name="searchYn" value="Y" />
            <input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
            <input type="hidden" id="searchParentShopCd"  name="searchParentShopCd" value="<c:out value="${commandMap.searchParentShopCd }"/>" />  
            <input type="hidden" id="searchStore" name="searchStore" value="<c:out value="${Code.ONLINE_SHOP_CODE }"/>" />           
            
			<div class="form-group">
				<label class="label"><span>ERP/몰상품코드</span></label>
				<div class="field">
					<input type="text" class="text" id="searchPrdErpCd" name="searchPrdErpCd" value="<c:out value="${commandMap.searchPrdErpCd }"/>" />
					/
					<input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>ERP제품명/몰 상품명</span></label>
				<div class="field">
					<input type="text" class="text" id="searchPrdMstNmPos" name="searchPrdMstNmPos" value="<c:out value="${commandMap.searchPrdMstNmPos }"/>" />
					/
					<input type="text" class="text" id="searchPrdMstNmKor" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>" />
				</div>
			</div>

			<div class="form-group">
				<label class="label"><span>카테고리</span></label>
				<div class="field">
					<select class="select" id="searchPrdCtgEnv" name="searchPrdCtgEnv" >
						<option value="" >미선택</option>
						<option value="<c:out value="${Code.CATEGORY_TYPE_PC }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_PC }" g="selected"/>>PC</option>
						<option value="<c:out value="${Code.CATEGORY_TYPE_MOBILE }" />" <ui:select v="${commandMap.searchPrdCtgEnv }" t="${Code.CATEGORY_TYPE_MOBILE }" g="selected"/>>MOBILE</option>
					</select>

					<select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
						<option value="">전체</option>
					</select>
					<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
						<option value="">1차 분류</option>
					</select>
					<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
						<option value="">2차 분류</option>
					</select>
					<select class="select" id="searchPrdCtgDepth4" name="searchPrdCtgDepth4" >
						<option value="">3차 분류</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" name="searchDetail">
				<label class="label"><span>쇼핑채널</span></label>
				<div class="field">
					<input type="radio" id="searchPrdMstChannelType1" name="searchPrdMstChannelType" class="checkbox channelType" value="" <c:if test="${empty commandMap.searchPrdMstChannelType }">checked="checked"</c:if> />
					<label for="searchPrdMstChannelType1">전체(PC+MOBILE)</label>
					<input type="radio" id="searchPrdMstChannelType2" name="searchPrdMstChannelType" class="checkbox channelType" value="PC" <c:if test="${commandMap.searchPrdMstChannelType eq 'PC'}">checked="checked"</c:if> />
					<label for="searchPrdMstChannelType2">PC</label>
					<input type="radio" id="searchPrdMstChannelType3" name="searchPrdMstChannelType" class="checkbox channelType" value="MOBILE" <c:if test="${commandMap.searchPrdMstChannelType eq 'MOBILE'}">checked="checked"</c:if> />
					<label for="searchPrdMstChannelType3">MOBILE</label>
				</div>
			</div>

			<div class="form-group"  name="searchDetail">
				<label class="label"><span>판매상태</span></label>
				<div class="field">
					<input type="radio" id="searchPrdMstSellState1" name="searchPrdMstSellState" value="" <c:if test="${empty commandMap.searchPrdMstSellState }">checked="checked"</c:if> />
					<label for="searchPrdMstSellState1">전체</label>
					<input type="radio" id="searchPrdMstSellState2" name="searchPrdMstSellState" value="${Code.PRODUCT_SELL_STATE_ING }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_ING}">checked="checked"</c:if> />
					<label for="searchPrdMstSellState2">판매중</label>
					<input type="radio" id="searchPrdMstSellState3" name="searchPrdMstSellState" value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_TEMPOUT}">checked="checked"</c:if> />
					<label for="searchPrdMstSellState3">품절상품</label>
					<input type="radio" id="searchPrdMstSellState4" name="searchPrdMstSellState" value="${Code.PRODUCT_SELL_STATE_STOP }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_STOP}">checked="checked"</c:if> />
					<label for="searchPrdMstSellState4">미판매</label>
				</div>
			</div>
			
			<div class="form-group" name="searchDetail">
				<label class="label"><span>기획년도</span></label>
				<div class="field">
					<select class="select" id="searchPlanYear" name="searchPlanYear" >
						<option value="">선택</option>
                        <c:forEach var="planYearItem" items="${planYearList}">
                            <option value="${planYearItem.CMON_CD_NM}" <ui:select v="${commandMap.searchPlanYear }" t="${planYearItem.CMON_CD_NM }" g="selected"/>><c:out value="${planYearItem.CMON_CD_NM }" /></option>
                        </c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group" name="searchDetail">
				<label class="label"><span>라인별</span></label>
				<div class="field">
					<select class="select" id="searchProductLine" name="searchProductLine" >
						<option value="">선택</option>
                        <c:forEach var="productLineItem" items="${productLineList}">
                            <option value="${productLineItem.CMON_CD}" <ui:select v="${commandMap.searchProductLine }" t="${productLineItem.CMON_CD }" g="selected"/>><c:out value="${productLineItem.CMON_CD_NM }" /></option>
                        </c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group" name="searchDetail">
				<label class="label"><span>시즌별</span></label>
				<div class="field">
					<select class="select" id="searchProductSesn" name="searchProductSesn" >
						<option value="">선택</option>
                        <c:forEach var="productSesnItem" items="${productSesnList}">
                            <option value="${productSesnItem.CMON_CD}" <ui:select v="${commandMap.searchProductSesn }" t="${productSesnItem.CMON_CD }" g="selected"/>><c:out value="${productSesnItem.CMON_CD_NM }" /></option>
                        </c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group" name="searchDetail">
				<label class="label"><span>구간검색</span></label>
				<div class="field">
					<select class="select" id="searchKind" name="searchKind" >
						<option value="">선택</option>
						<option value="stockCnt" <ui:select v="${commandMap.searchKind }" t="stockCnt" g="selected"/>>재고수량</option>
						<option value="viewCnt" <ui:select v="${commandMap.searchKind }" t="viewCnt" g="selected"/>>조회수</option>
					</select>
					<input type="text" class="number text" id="searchTextStart" name="searchTextStart" value="<c:out value="${commandMap.searchTextStart }"/>" />
					~
					<input type="text" class="number text" id="searchTextEnd" name="searchTextEnd" value="<c:out value="${commandMap.searchTextEnd }"/>" />
				</div>
			</div>
		</form>

		</div><!-- // section-form-a -->

		<div class="left title-box">
			<a href="javascript:return false;" id="toggleSearchDetail" class="button button-b"><span>상세검색 접기</span></a>
		</div> 
		

		<div class="title-box">
			<h4 class="title">리스트</h4>
		</div>
		
		<form id="frm" name="frm">
		
		<div class="sort pull-right" style="margin-top: -30px;">
			<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 160px" />
					<col style="width: auto;" />
					<col style="width: 100px"/>
					<col style="width: 100px"/>
					<col style="width:  80px"/>
					<col style="width:  80px"/>
				</colgroup>
				<thead>
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>정상가</th>
						<th>판매가</th>
						<th>판매상태</th>
						<th>쇼핑채널</th>
					</tr>
				</thead>
				<tbody id="tbodyProductList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${item.PRD_MST_CD }" /></td>
							<td class="left">
								<img src="<c:out value="${cdnDomain}${item.IMG_THUMBNAIL}" />" class="thumbnail" align="left" />
								<c:if test="${not empty item.PRM_TEXT}" >[<c:out value="${item.PRM_TEXT }" />]<br /></c:if>
								<a href="javascript:goParent('<c:out value="${item.PRD_MST_CD }" />');"><c:out value="${item.PRD_MST_NM }" /></a>
							</td>								
							<td><fmt:formatNumber value="${item.PRD_MST_NORMAL_PRICE }" groupingUsed="true" /></td>
							<td><fmt:formatNumber value="${item.PRD_MST_SELL_PRICE }" groupingUsed="true" /></td>
							<td>
							    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span class="label label-b">판매중</span></c:if>
							    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span class="label label-a">품절상품</span></c:if>
							    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span class="label label-a">미판매</span></c:if>
							</td>
							<td>
								<c:choose>
									<c:when test="${item.PRD_MST_CNL_MB_YN eq 'Y' and item.PRD_MST_CNL_PC_YN eq 'Y'}">전체
									</c:when>
									<c:otherwise>
										<c:if test="${item.PRD_MST_CNL_PC_YN eq 'Y'}" >PC</c:if>
										<c:if test="${item.PRD_MST_CNL_MB_YN eq 'Y'}" >MOBILE</c:if>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<c:if test="${commandMap.searchYn eq 'Y'}">
				    	<tr>
							<td colspan="6">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
						</tr>
				    	</c:if>
				    	<c:if test="${commandMap.searchYn ne 'Y'}">
				    	<tr>
							<td colspan="6">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
						</tr>
				    	</c:if>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->

		<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	    <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
	    <input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
	    <input type="hidden" name="searchPrdCtgBrand" value="<c:out value="${commandMap.searchPrdCtgBrand }"/>" />
		<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />	                
	    <input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
	    <input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
	    <input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
	    <input type="hidden" name="searchPrdCtgDepth4" value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" />
	    <input type="hidden" name="searchPrdMstChannelType" value="<c:out value="${commandMap.searchPrdMstChannelType }"/>" />
	    <input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
	    <input type="hidden" name="searchPrdIcn" value="<c:out value="${commandMap.searchPrdIcn }"/>" />
	    <input type="hidden" name="searchPrdMstDvlpYear" value="<c:out value="${commandMap.searchPrdMstDvlpYear }"/>" />
	    <input type="hidden" name="searchPrdMstGdsSctnCd" value="<c:out value="${commandMap.searchPrdMstGdsSctnCd }"/>" />
	    <input type="hidden" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" />	                	                
	    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	    <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
	    <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
	    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
	    <input type="hidden" id="searchStore" name="searchStore" value="<c:out value="${Code.ONLINE_SHOP_CODE }"/>" /> 
            
		<div class="pagination"><!-- pagination -->
			<ui:paging paging="${paging }" jsFunction="goPage" />
		</div><!-- // pagination -->

		<div class="bbs-status"><!-- bbs status -->
			<div class="page">
				Page : <strong class="em"><c:out value="${paging.cPage }" /></strong> / <c:out value="${paging.totalPageCount }" /> page
			</div>
			<div class="sort">
				 Total : <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>
			</div>
		</div><!-- // bbs status -->

        </form>
        
        <div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>취소</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->




<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
	
    // 카테고리 설정
    if( $("#frm").find("input[name='searchPrdCtgEnv']").val() != ""){
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    }
    if( $("#frm").find("input[name='searchPrdCtgIdx']").val() == "")
    {
//    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>");
    }
    else
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    	getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    }

    // 카테고리 변경 이벤트
    $(document).on("change", "#searchPrdCtgEnv", function () 
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth1", function () 
    {
        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth2", function () 
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth3", function () 
    {
        getCategoryList("searchPrdCtgDepth4", $("#searchPrdCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    
    

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

        // 상품 카테고리 검색 조건
        var searchCategoryIdx = "";
        var tempCategoryIdx = "";
        
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth1 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth2 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth3 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        $searchForm.find("#searchPrdCtgIdx").val(searchCategoryIdx);

        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchOnlineProductPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchOnlineProductPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 부모창으로 파마미터 전달.
    goParent = function (prdMstCd)
    {
    	window.opener.fnOnlineProduct(prdMstCd);
    	self.close();
    };
	
    // 상세검색 보기/접기 
    $("div[name=searchDetail]").each( function(){
		$(this).css("display", "${commandMap.searchDetailY }" );
		$("a[id=toggleSearchDetail]").children("span").html("${commandMap.searchDetailY }"=="none"?"상세검색 보기":"상세검색 접기");
	});
    
    $(document).on("click", "a[id=toggleSearchDetail]", function ()
    {
    	
    	var display = $("#searchForm #searchDetailY").val();
    	display = ("none"==display)?"":"none";
    	
    	$("div[name=searchDetail]").each( function(){
    		$(this).css("display", display );
    	});
    	
    	if( display == "none"){
    		$("#searchPrdMstChannelType1").prop("checked",  true);
    		$("#searchPrdMstSellState1").prop("checked", true);
    		$("#searchPrdIcn1").attr("checked", false);
        	$("input:checkbox[name=searchPrdIcn]").attr("checked", false);	
    		$("#searchPrdMstDvlpYear").val("");
    		$("#searchPrdMstGdsSctnCd").find("option:first").attr("selected", "selected"); 
    		$("#searchPrdSsonCd").val("");
    	}
    	$("input[name=searchDetailY]").val(display);
    	
    	$(this).children("span").html(display=="none"?"상세검색 보기":"상세검색 접기");
    });
    
    
    
    // 선택 클릭 이벤트
    $(document).on("click", "#productApply", function () 
    {
    	var $checkObj = $.find("#tbodyProductList input[name='PRD_MST_CDs']:checked");
    	if( $checkObj.length == 0 ){
    		alert("상품을 선택하여 주십시오.");
    		return;
    	}
    	  	
    	var params = new Array();
    	var obj;
    	var myArray;
    	$.each($checkObj, function(index,item){
    		myArray = $(this).val().split('^');
    		obj = new Object();
    		obj.PRD_MST_CD 				= myArray[0];
    		obj.PRD_MST_NM 			= myArray[1];
    		obj.PRD_CTG_PATH 			= myArray[2];
    		obj.CMN_BRD_NM 				= myArray[3];
    		obj.PRD_MST_NORMAL_PRICE 	= myArray[4];
    		obj.PRD_MST_SELL_PRICE 		= myArray[5];
    		
    		obj.PRD_MST_SEL_STATE_CODE = myArray[6];
    		if( myArray[6] =="<c:out value='${Code.PRODUCT_SELL_STATE_ING}'/>" ){
    			obj.PRD_MST_SEL_STATE 		= "판매중";
    		}else if( myArray[6] =="<c:out value='${Code.PRODUCT_SELL_STATE_TEMPOUT}'/>" ){
    			obj.PRD_MST_SEL_STATE 		= "품절상품";
    		}else{
    			obj.PRD_MST_SEL_STATE 		="미판매";
    		}
    		
    		obj.PRD_MST_CNL_PC_YN  = myArray[7];
    		obj.PRD_MST_CNL_MB_YN  = myArray[8];

    		obj.SAL_MST_RATE = myArray[9];
    		
    		// 신규추가
    		obj.PRM_TEXT = myArray[10];
    		obj.PRD_IMG_THUM_URL = myArray[11];
    		obj.PRD_MST_DISC_RT = myArray[12];
    		
    		params.push(obj); //만들어진  object를 배열에 추가
    	});
    	
    	if(	window.opener.fnResultProduct(params) )    	
    		self.close();
    });
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
//]]>
</script>
</body>
</html>
