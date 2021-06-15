<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

	<aside id="navigation"><!-- navigation -->
		<nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">상품관리</a>
				&gt;
				<span>상품휴지통</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">상품휴지통</h3>
				
				<div class="title-box">
					<h4 class="title">검색</h4>

					<div class="right">
						<a href="javascript:search();" class="button button-b"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
					</div>
				</div>

				<div class="section-form"><!-- section-form-a -->
				
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />

					<div class="form-group">
						<label class="label"><span>상품코드</span></label>
						<div class="field">
 							<input type="text" class="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> 
						</div>
					</div>

					<div class="form-group">
						<label class="label"><span>상품명</span></label>
						<div class="field">
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
								<option value="">중분류</option>
							</select>
							<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
								<option value="">소분류</option>
							</select>
							
						</div>
					</div>
	
					<div class="form-group">
						<label class="label"><span>삭제일</span></label>
						<div class="field">
							<input type="text" class="text datepicker s-datepicker" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" /> ~
							<input type="text" class="text datepicker e-datepicker" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" />
							<a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            (날짜형식: YYYY-MM-DD)
						</div>
					</div>
                </form>
				</div><!-- // section-form-a -->

                <form id="frm" name="frm">
	                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNmKor" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>"/>
	                <input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
					<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />	                
	                <input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
	                <input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
	                <input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
	                <input type="hidden" name="searchPrdMstChannelType" value="<c:out value="${commandMap.searchPrdMstChannelType }"/>" />
	                <input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
	                <input type="hidden" name="searchPrdIcn" value="<c:out value="${commandMap.searchPrdIcn }"/>" />
	                <input type="hidden" name="searchPrdMstDvlpYear" value="<c:out value="${commandMap.searchPrdMstDvlpYear }"/>" />
	                <input type="hidden" name="searchPrdMstGdsSctnCd" value="<c:out value="${commandMap.searchPrdMstGdsSctnCd }"/>" />
	                <input type="hidden" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" />	                	                
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	                <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" />
	                <input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
                     <input type="hidden" name="searchYn" value="Y" />

				<div class="title-box">
					<h4 class="title">상품목록</h4> 
					<br /><span style="padding-top:-30px; padding-left:20px"><em>*상품정보 수정은 복원 후 상품관리 메뉴에서 하실 수 있습니다.	</em></span>
					<div class="right">
						<a href="javascript:goRestore();" class="button button-b"><span>선택상품복원</span></a>
					</div>
				</div>
				
				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 40px" />
							<col style="width: 180px" />
							<col />
							<col style="width: 120px"/>
							<col style="width: 120px"/>
							<col style="width: 120px"/>
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>상품코드</th>
								<th>상품명</th>
								<th>소비자가격</th>
								<th>쇼핑채널</th>
								<th>삭제일</th>
							</tr>
						</thead>
						<tbody id="tbodyProductList">
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><input type="checkbox" id="PRD_MST_CD_${item.PRD_MST_CD }" name="PRD_MST_CDs" value="${item.PRD_MST_CD }" /></td>
									<td><c:out value="${item.PRD_MST_CD }" /></td>
									<td class="left">
										<img src="<c:out value="${img_domain }${item.IMG_THUMBNAIL}" />"  class="thumbnail" align="left" />
										<c:if test="${not empty item.PRM_TEXT}" >[<c:out value="${item.PRM_TEXT }" />]<br /></c:if>
										<b>[<c:out value="${item.CMN_BRD_NM }" />]</b><br />
										<c:out value="${item.PRD_MST_NM }" />
									</td>					
									<td><fmt:formatNumber value="${item.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" /></td>
									<td>
										<c:if test="${item.PRD_MST_CHANNEL_TYPE eq Code.CHANNEL_TYPE_CD_PC}" >PC</c:if>
										<c:if test="${item.PRD_MST_CHANNEL_TYPE eq Code.CHANNEL_TYPE_CD_MOBILE}" >MOBILE</c:if>
										<c:if test="${item.PRD_MST_CHANNEL_TYPE eq Code.CHANNEL_TYPE_CD_PCMOBILE}" >전체</c:if>
									</td>
									<td><ui:formatDate value="${item.PRD_MST_DEL_DATE }" pattern="yyyy.MM.dd" />
									</td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<c:if test="${param.searchYn eq 'Y'}">
						    	<tr>
									<td colspan="6">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    	</c:if>
						    	<c:if test="${param.searchYn ne 'Y'}">
						    	<tr>
									<td colspan="6">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
						    	</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
									
				</div><!-- // col list -->

                <div class="pagination"><!-- pagination -->
					<ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->


				<div class="bbs-status"><!-- bbs status -->
					<div class="page">
						총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
					</div>
					<%--div class="sort">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div--%>
				</div><!-- // bbs status -->
								
                </form>

			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->

    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");

    // 카테고리 설정
    
    if( $("#frm").find("input[name='searchPrdCtgEnv']").val() != ""){
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>");
    }
    if( $("#frm").find("input[name='searchPrdCtgIdx']").val() == "")
    {
//    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>");
    }
    else
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>");
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>");
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>");
    }

    // 카테고리 변경 이벤트
    $(document).on("change", "#searchPrdCtgEnv", function () 
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgEnv option:selected").val() );
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${serverDomain}"/>");
    });
    
    $(document).on("change", "#searchPrdCtgDepth1", function () 
    {
        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>");
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>");
    });
    $(document).on("change", "#searchPrdCtgDepth2", function () 
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>");
    });

    $(document).on("click", "input[name=searchPrdMstChannelType]", function ()
	{
		$("#searchPrdCtgEnv").val($(this).val());
		$("#searchPrdCtgEnv").change();
    });    

    // 아이콘 전체선택
    $(document).on("click", "#searchPrdIcn1", function () 
    {
    	if($("input:checkbox[id=searchPrdIcn1]").is(":checked") == true) {
    		$("input:checkbox[name=searchPrdIcn]").attr("checked", true);	
    	}
//    	$("input:checkbox[name=searchPrdIcn]").attr("checked", $("input:checkbox[id=searchPrdIcn1]").is(":checked"));	
    });

    $(document).on("click", "input[name=searchPrdIcn]", function ()
    {
    	if( $(this).is(":checked") == false ) {
    		$("input:checkbox[id=searchPrdIcn1]").attr("checked", false);
    	}    		
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
        
        //쇼핑채널 검색 조건
        /*
        var searchPrdMstChannelType = "";
        $searchForm.find(".channelType").each(function(){
            if ($(this).is(":checked"))
            {
            	searchPrdMstChannelType += $(this).val() + ",";
            }
        });
        searchPrdMstChannelType = searchPrdMstChannelType.substring(0, searchPrdMstChannelType.length-1);
        $searchForm.find("input[name='searchPrdMstChannelType']").val(searchPrdMstChannelType);
        */
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/withdrawnProductList.do", "target":"_self", "method":"post"}).submit(); 
    };
        
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/withdrawnProductList.do", "target":"_self", "method":"post"}).submit();
    };
    
    //상품휴지통
    goRestore = function (){
    	var $checkObj = $.find("#tbodyProductList input[name='PRD_MST_CDs']:checked");
    	if( $checkObj.length == 0 ){
    		alert("상품을 선택하여 주십시오.");
    		return;
    	}
    	
    	if (confirm( "복원된 상품은 등록대기 상태로 복원됩니다.\r\n선택하신 상품을 복원하시겠습니까?")) 
        {
        	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/withdrawnProductRestore.do", "target":"_self", "method":"post"}).submit();
        }
    };
    
    
    // 상품 상세페이지 이동
    goView = function (prdMstCd)
    {
        var $frm = $("#frm");
        $frm.find("#PRD_MST_CD").val(prdMstCd);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do", "target":"_self", "method":"post"}).submit();
    };
        
    $("div[id=searchDetail]").each( function(){
		$(this).css("display", "${commandMap.searchDetailY }" );
		$("a[id=toggleSearchDetail]").children("span").html("${commandMap.searchDetailY }"=="none"?"상세검색 보기":"상세검색 접기");
	});
    
    $(document).on("click", "a[id=toggleSearchDetail]", function ()
    {
    	
    	var display = $("#searchForm #searchDetailY").val();
    	display = ("none"==display)?"":"none";
    	
    	$("div[id=searchDetail]").each( function(){
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
    
});
</script>
</body>
</html>