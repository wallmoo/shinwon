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
				<span>엑셀데이터내려받기</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">엑셀데이터내려받기</h3>
				
				<div class="title-box">
					<h4 class="title">상품조회조건</h4>
				</div>

				<form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
                <input type="hidden" name="searchYn" value="Y" />
                <input type="hidden" id="searchDetailY" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
                    
				<div class="section-form"><!-- section-form-a -->

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

					<div class="form-group" id="searchDetail">
						<label class="label"><span>쇼핑채널</span></label>
						<div class="field">
							<input type="radio" id="searchPrdMstChannelType1" name="searchPrdMstChannelType" class="checkbox channelType" value="" <c:if test="${empty commandMap.searchPrdMstChannelType }">checked="checked"</c:if> />
							<label for="searchPrdMstChannelType1">전체(PC+MOBILE)</label>
							<input type="radio" id="searchPrdMstChannelType2" name="searchPrdMstChannelType" class="checkbox channelType" value="${Code.CHANNEL_TYPE_CD_PC }" <c:if test="${item eq Code.CHANNEL_TYPE_CD_PC}">checked="checked"</c:if> />
							<label for="searchPrdMstChannelType2">PC</label>
							<input type="radio" id="searchPrdMstChannelType3" name="searchPrdMstChannelType" class="checkbox channelType" value="${Code.CHANNEL_TYPE_CD_MOBILE }" <c:if test="${item eq Code.CHANNEL_TYPE_CD_MOBILE}">checked="checked"</c:if> />
							<label for="searchPrdMstChannelType3">MOBILE</label>
						</div>
					</div>

					<div class="form-group" id="searchDetail">
						<label class="label"><span>판매상태</span></label>
						<div class="field">
							<input type="radio" id="searchPrdMstSellState1" name="searchPrdMstSellState" class="checkbox channelType" value="" <c:if test="${empty commandMap.searchPrdMstSellState}">checked="checked"</c:if> />
							<label for="searchPrdMstSellState1">전체</label>
							<input type="radio" id="searchPrdMstSellState2" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_ING }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_ING}">checked="checked"</c:if> />
							<label for="searchPrdMstSellState2">판매중</label>
							<input type="radio" id="searchPrdMstSellState3" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_STOP }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_STOP}">checked="checked"</c:if> />
							<label for="searchPrdMstSellState3">미판매<%--판매중지 --%></label>
							<input type="radio" id="searchPrdMstSellState4" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_TEMPOUT}">checked="checked"</c:if> />
							<label for="searchPrdMstSellState4">품절상품<%--일시품절 --%></label>
							<input type="radio" id="searchPrdMstSellState5" name="searchPrdMstSellState" class="checkbox channelType" value="${Code.PRODUCT_SELL_STATE_READY }" <c:if test="${commandMap.searchPrdMstSellState eq Code.PRODUCT_SELL_STATE_READY}">checked="checked"</c:if> />
							<label for="searchPrdMstSellState5">등록대기상품<%--등록대기상품 --%></label>							
						</div>
					</div>
					
					<div class="form-group" id="searchDetail">
						<label class="label"><span>계절코드</span></label>
						<div class="field">
 							<input type="text" class="text" id="searchPrdSsonCd" name="searchPrdSsonCd" value="<c:out value="${commandMap.searchPrdSsonCd }"/>" /> 
						</div>
					</div>		
				</div><!-- // section-form-a -->

				<div class="title-box">
					<h4 class="title">엑셀 데이터 양식</h4>              
				</div>
				
				<div class="section-form"><!-- section-form-a -->

					<div class="form-group">
						<label class="label"><span>출력항목</span></label>
						<div class="field">
 							<input type="checkbox" id="print_all" class="checkAll checkbox channelType" title="전체선택" /> <label for="print_all">전체선택</label>
 							<br />
 							<input type="checkbox" id="print_column_1" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PROD_CD|String|54|제품코드" title="제품코드" /> <label for="print_column_1">제품코드</label>
							<input type="checkbox" id="print_column_2" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PROD_NM|String|80|제품 명" title="제품 명" /> <label for="print_column_2">제품 명</label>
							<input type="checkbox" id="print_column_3" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="BRAND_CD|String|30|업체구분 코드" title="업체구분 코드" /> <label for="print_column_3">업체구분 코드</label>
							<input type="checkbox" id="print_column_4" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PROD_TYPE_CD|String|30|제품 유형 코드" title="제품 유형 코드" /> <label for="print_column_4">제품 유형 코드</label>
							<input type="checkbox" id="print_column_5" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PRD_MST_GDS_SCTN_CD|String|30|제품구분코드" title="제품구분코드" /> <label for="print_column_5">제품구분코드</label>
							<input type="checkbox" id="print_column_6" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PROD_SPEC|String|80|제품 규격" title="제품 규격" /> <label for="print_column_6">제품 규격</label>
							<br >
							<input type="checkbox" id="print_column_7" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="LIS_PROD_SPEC|String|80|LIS 제품 규격" title="LIS 제품 규격" /> <label for="print_column_7">LIS 제품 규격</label>
							<input type="checkbox" id="print_column_8" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="KAN_CD|String|54|KAN 코드" title="KAN 코드" /> <label for="print_column_8">KAN 코드</label>
							<input type="checkbox" id="print_column_9" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="END_YN|String|30|단종 여부" title="단종 여부" /> <label for="print_column_9">단종 여부</label>
							<input type="checkbox" id="print_column_10" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="CUST_UCOST|Dollar|30|소비자 가격" title="소비자 가격" /> <label for="print_column_10">소비자 가격</label>
							<input type="checkbox" id="print_column_11" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PRMT_GD_YN|String|30|판촉물 여부" title="판촉물 여부" /> <label for="print_column_11">판촉물 여부</label>
							<input type="checkbox" id="print_column_12" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="END_DATE|Date|45|단종 일자" title="단종 일자" /> <label for="print_column_12">단종 일자</label>
							<br >
							<input type="checkbox" id="print_column_13" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="DEL_FLAG|String|30|삭제 여부" title="삭제 여부" /> <label for="print_column_13">삭제 여부</label>
							<input type="checkbox" id="print_column_14" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="DEL_DATE|Date|45|삭제 일자" title="삭제 일자" /> <label for="print_column_14">삭제 일자</label>
							<input type="checkbox" id="print_column_15" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="GDS_SCTN_CD|String|60|상품 구분 코드" title="상품 구분 코드" /> <label for="print_column_15">상품 구분 코드</label>
							<input type="checkbox" id="print_column_16" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="ITEM_KND_CD|String|60|품종 코드" title="품종 코드" /> <label for="print_column_16">품종 코드</label>
							<input type="checkbox" id="print_column_17" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="COLO_CD|String|30|칼라 코드" title="칼라 코드" /> <label for="print_column_17">칼라 코드</label>
							<input type="checkbox" id="print_column_18" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="ITEM_SIZE|String|30|품목 사이즈" title="품목 사이즈" /> <label for="print_column_18">품목 사이즈</label>
							<br >
							<input type="checkbox" id="print_column_19" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="SSON_CD|String|60|계절 코드" title="계절 코드" /> <label for="print_column_19">계절 코드</label>
							<input type="checkbox" id="print_column_20" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="DVLP_YEAR|String|30|개발 년도" title="개발 년도" /> <label for="print_column_20">개발 년도</label>
							<input type="checkbox" id="print_column_21" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="GDS_LN_CD|String|60|상품 라인 코드" title="상품 라인 코드" /> <label for="print_column_21">상품 라인 코드</label>
							<input type="checkbox" id="print_column_22" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="SAIP_ITEM_YN|String|30|사입 품목 여부" title="사입 품목 여부" /> <label for="print_column_22">사입 품목 여부</label>
							<input type="checkbox" id="print_column_23" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="PROD_GRADE_CD|String|30|제품 등급 코드" title="제품 등급 코드" /> <label for="print_column_23">제품 등급 코드</label>
							<input type="checkbox" id="print_column_24" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="EXT1_DTL_CD|String|30|판매중지" title="판매중지" /> <label for="print_column_24">판매중지</label>
							<br >
							<input type="checkbox" id="print_column_25" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="REP_PROD_CD|String|54|대표 품목 코드" title="대표 품목 코드" /> <label for="print_column_25">대표 품목 코드</label>
							<input type="checkbox" id="print_column_26" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="SUB_BRAND_CD|String|54|서브업체구분코드" title="서브업체구분코드" /> <label for="print_column_26">서브업체구분코드</label>
							<input type="checkbox" id="print_column_27" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="SUB_BRAND_NM|String|80|서브업체구분명" title="서브업체구분명" /> <label for="print_column_27">서브업체구분명</label>
							<input type="checkbox" id="print_column_28" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="MSTAE|String|30|조달보류(SAP)" title="조달보류(SAP)" /> <label for="print_column_28">조달보류(SAP)</label>
							<input type="checkbox" id="print_column_29" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="ZGENDIND|String|30|성별구분" title="성별구분" /> <label for="print_column_29">성별구분</label>
							<input type="checkbox" id="print_column_30" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="ZGENDINDTXT|String|48|성별구분명" title="성별구분명" /> <label for="print_column_30">성별구분명</label>
							<br >
							<input type="checkbox" id="print_column_31" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="REG_DT|Date|45|최초전송일자" title="최초전송일자" /> <label for="print_column_31">최초전송일자</label>
							<input type="checkbox" id="print_column_32" name="PRINT_COLUMN" class="checkbox channelType checkRow" value="UDT_DT|Date|45|수정전송일자" title="수정전송일자" /> <label for="print_column_32">수정전송일자</label>

						</div>
					</div>
				</div>
				
				<div class="right">
					<a href="#none" class="button button-b" id="excelDown" ><span>엑셀 내려받기</span></a>
				</div>
				
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

    $(document).on("click", "input[name=searchPrdMstChannelType]", function (){
		var categoryEnv = { "1":"P", "2":"M", "":""};

    	if( categoryEnv[$(this).val()]!=""
    		&& categoryEnv[$(this).val()] != $("#searchPrdCtgEnv").find("option:selected").val() ){
    		$("#searchPrdCtgEnv").val(categoryEnv[$(this).val()]);
    		$("#searchPrdCtgEnv").change();
    	}
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
    
    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
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
        
        if( $(".checkRow:checked").length <3 ){
        	alert("출력항목을 3개이상 선택해주세요.");
        	return false;
        }
        
       $searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/dnProductExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/basicProductList.do", "target":"_self", "method":"post"}).submit(); 
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