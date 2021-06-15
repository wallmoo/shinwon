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
<!-- 	    	<h2 class="title"><span>상품 상세보기</span></h2> -->
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>상품검색</span></h3>
            </div><!-- // push-guide -->
            
            <form id="searchForm" name="searchForm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	            <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
				<input type="hidden" name="searchYn" value="Y" />
	            <input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
	            <input type="hidden" id="searchStore" name="searchStore" value="<c:out value="${Code.ONLINE_SHOP_CODE }"/>" />
	            <input type="hidden" id="searchType" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
	            <input type="hidden" id="searchOrdPrdIdx" name="searchOrdPrdIdx" value="<c:out value="${commandMap.searchOrdPrdIdx }"/>" /><%-- 주문상세팝업용 파라미터 --%>       
	        
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
		                        <input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
		                    </td>
		                    <th><span>상품명</span></th>
		                    <td>
		                        <input type="text" class="text" id="searchPrdMstNmKor" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>" />
		                    </td>
		                    <th><span>쇼핑채널</span></th>
		                    <td>
		                        <select class="select" id="searchPrdMstChannelType" name="searchPrdMstChannelType" >
									<option value="" >전체(PC+MOBILE)</option>
									<option value="<c:out value="${Code.CATEGORY_TYPE_PC }" />" <ui:select v="${commandMap.searchPrdMstChannelType }" t="${Code.CATEGORY_TYPE_PC }" g="selected"/>>PC</option>
									<option value="<c:out value="${Code.CATEGORY_TYPE_MOBILE }" />" <ui:select v="${commandMap.searchPrdMstChannelType }" t="${Code.CATEGORY_TYPE_MOBILE }" g="selected"/>>MOBILE</option>
								</select>
		                    </td>
		                </tr>
		                <tr>
		                	<th><span>카테고리</span></th>
		                	<td colspan=5>
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
								<select class="select" id="searchPrdCtgDepth5" name="searchPrdCtgDepth5" >
									<option value="">4차 분류</option>
								</select>
		                	</td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
		    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
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
	                        <th><input type="checkbox" class="checkbox checkAll" id="allCheck" name="allCheck" /></th>
							<th>상품코드<br />(기간계코드)</th>
							<th>상품명</th>
							<th>옵션</th>
							<th>상품가격</th>
							<th>검색가</th>
							<th>판매상태</th>
							<th>쇼핑채널</th>
	                    </tr>
	                </thead>
	                <tbody id="tbodyProductList">
	                    <c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
						    	<input type="hidden" id="OPT_DTL_IDX_${item.PRD_MST_CD}" name="OPT_DTL_IDX_${item.PRD_MST_CD}" value="" />
							    <input type="hidden" id="EMS_PRD_CNT_${item.PRD_MST_CD}" name="EMS_PRD_CNT_${item.PRD_MST_CD}" value="" />
							    <input type="hidden" id="PRD_OPT_NM_${item.PRD_MST_CD}" name="PRD_OPT_NM_${item.PRD_MST_CD}" value="" />
							    <input type="hidden" id="OPT_DTL_NM_${item.PRD_MST_CD}" name="OPT_DTL_NM_${item.PRD_MST_CD}" value="" />
							    <input type="hidden" id="OPT_DTL_ADD_PRC_${item.PRD_MST_CD}" name="OPT_DTL_ADD_PRC_${item.PRD_MST_CD}" value="" />
							    <input type="hidden" id="PRD_OPT_EST_YN_${item.PRD_MST_CD}" name="PRD_OPT_EST_YN_${item.PRD_MST_CD}" value="" />
							    <input type="hidden" id="OPT_DTL_STK_CNT_${item.PRD_MST_CD}" name="OPT_DTL_STK_CNT_${item.PRD_MST_CD}" value="" />
								<tr>
									<td>
							    		<input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.PRD_MST_CD}" name="PRD_MST_CDs" value="${item.PRD_MST_CD}^${item.PRD_MST_NM}^${item.PRD_CTG_PATH}^${item.CMN_BRD_NM}^${item.PRD_MST_PRC}^${item.PRD_MST_SCH_PRC}^${item.PRD_MST_SEL_STATE}^${item.PRD_MST_CNL_PC_YN}^${item.PRD_MST_CNL_MB_YN}^${cdnDomain}${item.IMG_THUMBNAIL}^${item.PRD_MST_VDR_YN}^${item.PRD_MST_OPT_EST_CNT}" />
							    		<input type="hidden" name="APPLY_IDXs" value="${item.PRD_MST_CD}" />
									</td>
									<td>
										<a href="javascript:goView('<c:out value="${item.PRD_MST_CD }" />');" class="underline"  title="새 창 으로 열립니다.">
											<c:out value="${item.PRD_MST_CD }" />
										</a>
									</td>
									<td>
										<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&ADMIN=Y" target="_blank">
											<c:out value="${item.PRD_MST_NM }" />
										</a>
									</td>	
									<td id="optSearchText_${listNum }"><a href="javascript:searchProductOption('<c:out value="${item.PRD_MST_CD }" />','<c:out value="${listNum }" />');" ><span style="cursor:pointer;" >옵션선택</span></a></td>							
									<td><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
									<td><fmt:formatNumber value="${item.PRD_MST_SCH_PRC }" groupingUsed="true" /></td>
									<td>
									    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING}" ><span>판매중</span></c:if>
									    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span>품절상품</span></c:if>
									    <c:if test="${item.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span>미판매</span></c:if>
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
									<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${commandMap.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="8">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	            </table><!-- // table -->
            
	            <input type="hidden" name="searchErpPrdMstCd" value="<c:out value="${commandMap.searchErpPrdMstCd }"/>"/>
				<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
			    <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
			    <input type="hidden" name="searchPrdMstNmPos" value="<c:out value="${commandMap.searchPrdMstNmPos }"/>"/>
			    <input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
			    <input type="hidden" name="searchPrdCtgBrand" value="<c:out value="${commandMap.searchPrdCtgBrand }"/>" />
				<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />	                
			    <input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
			    <input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
			    <input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
			    <input type="hidden" name="searchPrdCtgDepth4" value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" />
			    <input type="hidden" name="searchPrdMstChannelType" value="<c:out value="${commandMap.searchPrdMstChannelType }"/>" />
			    <input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
		        <input type="hidden" name="searchPlanYear" value="<c:out value="${commandMap.searchPlanYear }"/>" />
		        <input type="hidden" name="searchProductLine" value="<c:out value="${commandMap.searchProductLine }"/>" />
		        <input type="hidden" name="searchProductSesn" value="<c:out value="${commandMap.searchProductSesn }"/>" />
		        <input type="hidden" name="searchKind" value="<c:out value="${commandMap.searchKind }"/>" />
		        <input type="hidden" name="searchTextStart" value="<c:out value="${commandMap.searchTextStart }"/>" />
		        <input type="hidden" name="searchTextEnd" value="<c:out value="${commandMap.searchTextEnd }"/>" />
		        <input type="hidden" name="searchStore" value="<c:out value="${commandMap.searchStore }"/>" />
		        <input type="hidden" name="searchStoreName" value="<c:out value="${commandMap.searchStoreName }"/>" />
			    <input type="hidden" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" />	                	                
			    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
			    <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
			    <input type="hidden" id="optSearchTextNum" name="optSearchTextNum" value="" />
			    <input type="hidden" id="PRD_MST_CDs" name="PRD_MST_CDs" value="" />
			    <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
			    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
		    
		    </form>

            <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
            </div><!-- // section pagination -->
	        
			<div class="grid section-button-search"><!-- section button -->
				<a href="javascript:;" id="productApply" class="button small primary"><span>선택</span></a>
				<a href="#none" id="closePopup" class="button small"><span>취소</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
	//체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");

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
    	getCategoryList("searchPrdCtgDepth5", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${commandMap.searchPrdCtgDepth5}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgEnv}" />");
    }

    // 카테고리 변경 이벤트
    $(document).on("change", "#searchPrdCtgEnv", function () 
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth4", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth5", "<c:out value="${commandMap.searchPrdCtgDepth4}" />", "<c:out value="${commandMap.searchPrdCtgDepth5}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth1", function () 
    {
        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth2", function () 
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth3", function () 
    {
        getCategoryList("searchPrdCtgDepth4", $("#searchPrdCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
        getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgDepth4", function () 
 	{
 		getCategoryList("searchPrdCtgDepth5", $("#searchPrdCtgDepth4 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductEsmPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchProductEsmPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상품 상세페이지 이동 (새창)
    goView = function (prdMstCd)
    {
        var $frm = $("#frm");
        $frm.find("input[name='PRD_MST_CD']").val(prdMstCd);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_blank", "method":"post"}).submit();
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
    	var searchType = $("#searchType").val();
    	if( $checkObj.length == 0 ){
    		alert("상품을 선택하여 주십시오.");
    		return;
    	}
    	
    	if(searchType =="D"){
    		if( $checkObj.length > 1 ){
        		alert("상품을 1개만 선택하여 주십시오.");
        		return;
        	}
    	}
    	
    	var chkPrdMstCd = "";
    	var chkEstYnCnt = "";
    	var chkMasg = "";
    	$("input[name='PRD_MST_CDs']:checked").each(function(){
    		chkPrdMstCd = $(this).val().split("^")[0];
    		chkEstYnCnt = $(this).val().split("^")[12];
    		if(chkEstYnCnt > 0){
    			if($("#PRD_OPT_EST_YN_"+chkPrdMstCd ).val().indexOf("Y") < 0){
    				if(chkMasg != "") chkMasg += ",";
    				chkMasg += "["+chkPrdMstCd+"]";
    			}
    		}
    	});
    	
    	if(chkMasg != ""){
    		alert("필수 옵션이 있는 상품은 필수 옵션을 선택 하셔야 합니다.\n필수 옵션이 있는 상품"+chkMasg);
    		return;
    	}
    	
    	var params = new Array();
    	var obj;
    	var myArray;
    	$.each($checkObj, function(index,item){
    		myArray = $(this).val().split('^');
    		obj = new Object();
    		obj.PRD_MST_CD 				= myArray[0];	//상품코드
    		obj.PRD_MST_NM 			= myArray[1];		//상품명
    		obj.PRD_CTG_PATH 			= myArray[2];	//뎁스 카테고리명 나열
    		obj.CMN_BRD_NM 				= myArray[3];	//브랜드명
    		obj.PRD_MST_PRC 	= myArray[4];			//상품가격
    		obj.PRD_MST_SCH_PRC 		= myArray[5];	//검색가격
    		
    		obj.PRD_MST_SEL_STATE_CODE = myArray[6];	//판매상태
    		if( myArray[6] =="<c:out value='${Code.PRODUCT_SELL_STATE_ING}'/>" ){
    			obj.PRD_MST_SEL_STATE 		= "판매중";
    		}else if( myArray[6] =="<c:out value='${Code.PRODUCT_SELL_STATE_TEMPOUT}'/>" ){
    			obj.PRD_MST_SEL_STATE 		= "품절상품";
    		}else{
    			obj.PRD_MST_SEL_STATE 		="미판매";
    		}
    		
    		obj.PRD_MST_CNL_PC_YN  = myArray[7];		//PC채널 사용유무
    		obj.PRD_MST_CNL_MB_YN  = myArray[8];		//MOBILE채널 사용유무

    		
    		// 신규추가
    		obj.PRD_IMG_THUM_URL = myArray[9];			//썸네일 이미지
    		obj.SEARCH_THPE = searchType;				//상품검색타입
    		obj.PRD_MST_VDR_YN = myArray[10];				//입점상품 여부
    		
    		//옵션추가
    		if(obj.PRD_MST_CD != ""){
    			obj.OPT_DTL_IDX = $("#OPT_DTL_IDX_"+obj.PRD_MST_CD ).val();
				obj.EMS_PRD_CNT = $("#EMS_PRD_CNT_"+obj.PRD_MST_CD ).val();
				obj.PRD_OPT_NM = $("#PRD_OPT_NM_"+obj.PRD_MST_CD ).val();
				obj.OPT_DTL_NM = $("#OPT_DTL_NM_"+obj.PRD_MST_CD ).val();
				obj.OPT_DTL_ADD_PRC = $("#OPT_DTL_ADD_PRC_"+obj.PRD_MST_CD ).val();
				obj.PRD_OPT_EST_YN = $("#PRD_OPT_EST_YN_"+obj.PRD_MST_CD ).val();
				obj.OPT_DTL_STK_CNT = $("#OPT_DTL_STK_CNT_"+obj.PRD_MST_CD ).val();
    		}
    		else{
    			obj.OPT_DTL_IDX = "";
				obj.EMS_PRD_CNT = 1;
				obj.PRD_OPT_NM = "";
				obj.OPT_DTL_NM = "";
				obj.OPT_DTL_ADD_PRC = "";
				obj.PRD_OPT_EST_YN = "";
				obj.OPT_DTL_STK_CNT = "";
    		}
			
    		obj.ORD_PRD_IDX = $("#searchOrdPrdIdx").val(); //주문상세에서 쓸 파라미터
    		params.push(obj); //만들어진  object를 배열에 추가
    	});
    	
    	if(	window.opener.fnResultProduct(params) )    	
    		self.close();
    });
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});  
 	
 	searchProductOption = function(prdMstCd,listNum){
 		if(prdMstCd == ""){
 			alert("선택된 상품이 없습니다.");
 			return false;
 		}else{
 			$("#PRD_MST_CD").val(prdMstCd);	
 			
 			$("#optSearchTextNum").val(listNum);
 			popup('',"700","320","no","_ProductSearchOptionPopup");
 	   		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductOptionPopup.do", "target":"popup_ProductSearchOptionPopup", "method":"post"}).submit();	
 		}
 	};
 	
 	//상품팝업 옵션 선택시 호출되는 메소드
    fnResultProductOption = function(params){
    	var optLocation = "";
    	var listNum = "";
    	var listPrdMstCd = "";
 		$.each(params, function(index,item){
 			listNum = item.LIST_NUM;
 			listPrdMstCd = item.PRD_MST_CD;
 			optLocation += item.PRD_OPT_NM +" : "+item.OPT_DTL_NM +"<br />수량 : " + item.EMS_PRD_CNT +" 개<br/>추가가격 : "+setComma(parseInt(item.OPT_DTL_ADD_PRC))+"<br/>";
 			
 			//옵션상세 idx
    		if($("#OPT_DTL_IDX_"+listPrdMstCd).val() == ""){
 				$("#OPT_DTL_IDX_"+listPrdMstCd).val(item.OPT_DTL_IDX);	
 			}else{
 				$("#OPT_DTL_IDX_"+listPrdMstCd).val($("#OPT_DTL_IDX_"+listPrdMstCd).val() + "," +item.OPT_DTL_IDX);
 			}
    		//옵션에 대한 수량
    		if($("#EMS_PRD_CNT_"+listPrdMstCd).val() == ""){
 				$("#EMS_PRD_CNT_"+listPrdMstCd).val(item.EMS_PRD_CNT);	
 			}else{
 				$("#EMS_PRD_CNT_"+listPrdMstCd).val($("#EMS_PRD_CNT_"+listPrdMstCd).val() + "," +item.EMS_PRD_CNT);
 			}
    		//옵션명
    		if($("#PRD_OPT_NM_"+listPrdMstCd).val() == ""){
 				$("#PRD_OPT_NM_"+listPrdMstCd).val(item.PRD_OPT_NM);	
 			}else{
 				$("#PRD_OPT_NM_"+listPrdMstCd).val($("#PRD_OPT_NM_"+listPrdMstCd).val() + "," +item.PRD_OPT_NM);
 			}
    		//옵션 상세명
    		if($("#OPT_DTL_NM_"+listPrdMstCd).val() == ""){
 				$("#OPT_DTL_NM_"+listPrdMstCd).val(item.OPT_DTL_NM);	
 			}else{
 				$("#OPT_DTL_NM_"+listPrdMstCd).val($("#OPT_DTL_NM_"+listPrdMstCd).val() + "," +item.OPT_DTL_NM);
 			}
    		//옵션 추가가격
    		if($("#OPT_DTL_ADD_PRC_"+listPrdMstCd).val() == ""){
 				$("#OPT_DTL_ADD_PRC_"+listPrdMstCd).val(item.OPT_DTL_ADD_PRC);	
 			}else{
 				$("#OPT_DTL_ADD_PRC_"+listPrdMstCd).val($("#OPT_DTL_ADD_PRC_"+listPrdMstCd).val() + "," +item.OPT_DTL_ADD_PRC);
 			}
    		//필수여부
    		if($("#PRD_OPT_EST_YN_"+listPrdMstCd).val() == ""){
 				$("#PRD_OPT_EST_YN_"+listPrdMstCd).val(item.PRD_OPT_EST_YN);	
 			}else{
 				$("#PRD_OPT_EST_YN_"+listPrdMstCd).val($("#PRD_OPT_EST_YN_"+listPrdMstCd).val() + "," +item.PRD_OPT_EST_YN);
 			}
    		//옵션 잔여 수량
    		if($("#OPT_DTL_STK_CNT_"+listPrdMstCd).val() == ""){
 				$("#OPT_DTL_STK_CNT_"+listPrdMstCd).val(item.OPT_DTL_STK_CNT);	
 			}else{
 				$("#OPT_DTL_STK_CNT_"+listPrdMstCd).val($("#OPT_DTL_STK_CNT_"+listPrdMstCd).val() + "," +item.OPT_DTL_STK_CNT);
 			}
    	});
 		optLocation += "<input type=\"button\" onclick=\"goProductOptionDel('"+listNum+"','"+listPrdMstCd+"');\" value=\"취소\" />";
		$("#optSearchText_"+listNum).html(optLocation);
    	return false;
    };
    
    goProductOptionDel = function(listNum, prdMstCd){
    	//각 input 값 삭제
		$("#OPT_DTL_IDX_"+prdMstCd).val('');
		$("#EMS_PRD_CNT_"+prdMstCd).val('');
		$("#PRD_OPT_NM_"+prdMstCd).val('');
		$("#OPT_DTL_NM_"+prdMstCd).val('');
		$("#OPT_DTL_ADD_PRC_"+prdMstCd).val('');
		$("#PRD_OPT_EST_YN_"+prdMstCd).val('');
		$("#OPT_DTL_STK_CNT_"+prdMstCd).val('');
		$("#optSearchText_"+listNum).html("<a href=\"javascript:searchProductOption('"+prdMstCd+"','"+listNum+"');\" ><span class=\"label label-b\" style=\"cursor:pointer;\" >옵션선택</span></a>");
    };
 	
});
</script>
</body>
</html>
