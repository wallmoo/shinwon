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
				<span>홍보문구관리</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">홍보문구관리</h3>

				<h4 class="title">등록</h4>
				
				<p>
					<strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
				</p>
				
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchPrmWrdTxt" value="<c:out value="${commandMap.searchPrmWrdTxt }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchPrmWrdState" value="<c:out value="${commandMap.searchPrmWrdState }"/>"/>
                    
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>   
                </form>
                
                <form id="frm" name="frm">
                    <input type="hidden" name="searchPrmWrdTxt" value="<c:out value="${commandMap.searchPrmWrdTxt }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchPrmWrdState" value="<c:out value="${commandMap.searchPrmWrdState }"/>"/>
                    
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>                   
	                <input type="hidden" name="PRM_WRD_IDX" value="<c:out value="${sellingPointInfo.PRM_WRD_IDX }"/>"/>    
	                
					<input type="hidden" name="PRM_WRD_POSITION" value="${sellingPointInfo.PRM_WRD_POSITION }" />
					<input type="hidden" name="PRM_WRD_SCOPE" value="${Code.SCOPE_PRODUCT }"  />
                	
				<div class="section-form"><!-- section-form-a -->

					<div class="form-group">
						<label class="label"><span>홍보문구 <em class="strong">*</em></span></label>
						<div class="field">
							<input type="text" class="text" style="width: 87%;" id="PRM_WRD_TXT" name="PRM_WRD_TXT" maxlength="20" value="<c:out value="${sellingPointInfo.PRM_WRD_TXT }" />" />*최대 20자
						</div>
					</div>
					
					<div class="form-group">
						<label class="label"><span>게시글코드</span></label>
						<div class="field">
							<c:out value="${sellingPointInfo.PRM_WRD_IDX }"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="label"><span>전시기간 <em class="strong">*</em></span></label>
						<div class="field">
							<input type="text" class="text datepicker s-datepicker" id="PRM_WRD_ST_DT" name="PRM_WRD_ST_DT" value="<ui:formatDate value="${sellingPointInfo.PRM_WRD_ST_DT }" pattern="yyyy.MM.dd"/>" /> ~
							<input type="text" class="text datepicker e-datepicker" id="PRM_WRD_ED_DT" name="PRM_WRD_ED_DT" value="<ui:formatDate value="${sellingPointInfo.PRM_WRD_ED_DT }" pattern="yyyy.MM.dd"/>" />
							<a href="javascript:fnDateSet('PRM_WRD_ST_DT', 'PRM_WRD_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                            <a href="javascript:fnDateSet('PRM_WRD_ST_DT', 'PRM_WRD_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                            <a href="javascript:fnDateSet('PRM_WRD_ST_DT', 'PRM_WRD_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                            <a href="javascript:fnDateSet('PRM_WRD_ST_DT', 'PRM_WRD_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            (날짜형식: YYYY-MM-DD)
						</div>
					</div>
					
					<div class="form-group">
						<label class="label"><span>상태 <em class="strong">*</em></span></label>
						<div class="field">
							<input type="radio" id="PRM_WRD_STATE1" class="radio" name="PRM_WRD_STATE" value="Y" <ui:select v="${sellingPointInfo.PRM_WRD_STATE }" t="Y" g="checked"/> />
							<label for="PRM_WRD_STATE1">사용</label>
							<input type="radio" id="PRM_WRD_STATE2" class="radio" name="PRM_WRD_STATE" value="N" <ui:select v="${sellingPointInfo.PRM_WRD_STATE }" t="N" g="checked"/> />
							<label for="PRM_WRD_STATE2">미사용</label>
						</div>
					</div>
					

					<div class="form-group">
						<label class="label"><span>사용상품 <em class="strong">*</em></span></label>
						<div class="field">

							<div id="divProduct"><!-- 상품검색 -->
								<div class="section-button"><!-- section button -->
									<a href="#none" id="goProductDelete" class="button button-a small"><span>선택삭제</span></a>
									<a href="#none" id="goProductAdd" class="button button-b small js-modal" title="새 창 으로 열립니다."><span>상품검색</span></a>
								</div><!-- // section button -->

								<div class="table-a"><!-- col list -->
									<table class="core" id="tableProduct">
										<colgroup>
											<col style="width: 40px;" />
											<col style="width: 160px" />
											<col style="width: auto;"/>
											<col style="width: 100px"/>
											<col style="width: 100px"/>
											<col style="width: 80px"/>
											<col style="width: 60px"/>
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" class="checkbox checkAll" /></th>
												<th>상품코드</th>
												<th>상품명</th>
												<th>정상가</th>
												<th>판매가</th>
												<th>판매상태</th>
												<th>쇼핑채널</th>
											</tr>
										</thead>
										<tbody id="applyProductList">
			                            <c:choose>
			                            <c:when test="${not empty productList}">
			                                <c:forEach var="item" items="${productList }" varStatus="status">
											<tr>
												<td>
												    <input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.PRD_PRD_MST_CD}" name="PRD_MST_CDs" value="${item.PRD_PRD_MST_CD}" />
												    <input type="hidden" name="APPLY_IDXs" value="${item.PRD_PRD_MST_CD}" />
												</td>
												<td>
													<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${item.PRD_PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
														<c:out value="${item.PRD_PRD_MST_CD }" />
													</a>
												</td>
												<td class="left">
													<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${item.PRD_PRD_MST_CD}&ADMIN=Y" target="_blank">
														<c:out value="${item.PRD_MST_NM }" />
													</a>
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
			                                </c:forEach>
			                            </c:when>
			                            <c:otherwise>
			                                <tr id="productNodata"><!-- row -->
			                                    <td colspan="8">상품을 검색해 주세요.</td>
			                                </tr>
			                            </c:otherwise>
			                            </c:choose>
										</tbody>
									</table>
								</div><!-- // col list -->
							</div><!-- // 상품검색 -->

							<div id="divCategory" class="hide"><!-- 카테고리 -->
								<div class="section-button"><!-- section button -->
									<a href="#none" id="goCategoryDelete" class="button button-a small"><span>선택삭제</span></a>
									<a href="" class="button button-b small js-modal" data-width="600" data-height="300" data-scroll="true" target="_blank" title="새 창 으로 열립니다."><span>카테고리 추가</span></a>
								</div><!-- // section button -->

								<div class="table-a"><!-- col list -->
									<table class="core" id="tableCategory">
										<colgroup>
											<col style="width: 40px;" />
											<col style="width: auto;" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" class="checkbox checkAll" /></th>
												<th>카테고리 경로</th>
											</tr>
										</thead>
										<tbody id="applyCategoryList">
			                            <c:choose>
			                            <c:when test="${not empty categoryList}">
			                                <c:forEach var="item" items="${categoryList }" varStatus="status">
											<tr>
												<td>
												    <input type="checkbox" class="checkbox checkRow" id="PRD_CTG_IDX_${item.PRM_PRD_CTG_IDX}" name="PRD_CTG_IDXs" value="${item.PRM_PRD_CTG_IDX}" />
												    <input type="hidden" name="APPLY_IDXs" value="${item.PRM_PRD_CTG_IDX}" />
												</td>
												<td class="left"><c:out value="${item.PRD_CTG_PATH }" /></td>
											</tr>
			                                </c:forEach>
			                            </c:when>
			                            <c:otherwise>
			                                <tr id="categoryNodata"><!-- row -->
												<td colspan="2">카테고리를 추가해 주세요.</td>
			                                </tr>
			                            </c:otherwise>
			                            </c:choose>
										</tbody>
									</table>
								</div><!-- // col list -->
							</div><!-- // 카테고리 -->
						</div>
					</div>
				
				</div>
				
                </form>
                
				<div class="section-button"><!-- section button -->
					<a href="#none" class="button button-b" id="goRegist" ><span>저장</span></a>
					<a href="#none" class="button button-a" id="goList" ><span>목록</span></a>
				</div><!-- // section button -->

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
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<!-- template -->
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
	<td>\${CMN_BRD_NM}</td>
	<td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" name="APPLY_IDXs" value="\${PRD_MST_CD}"/></td>
	<td class="left">
		<a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
	<td>\${PRD_MST_NORMAL_PRICE}</td>
	<td>\${PRD_MST_SELL_PRICE}</td>
	<td><span class="label label-\${PRD_MST_SEL_STATE_CLASS}">\${PRD_MST_SEL_STATE}</span></td>
	<td>\${PRD_MST_CHANNEL_TYPE}</td>
</tr>
</script>
<script id="categoryTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="PRD_CTG_IDXs" value="\${CTG_IDX}"/></td>
	<td class="left">\${CTG_PATH}<input type="hidden" name="APPLY_IDXs" value="\${CTG_IDX}"/></td>
</tr>
</script>

<script type="text/javascript">
$(document).ready(function () 
{
    //사용상품 적용 범위(상품/카테고리)에 따른 DIV 표시 (default 상품, 카테고리일 경우 표시 DIV 변경)
    if ( '<c:out value="${sellingPointInfo.PRM_WRD_SCOPE}" />' == '<c:out value="${Code.SCOPE_CATEGORY}" />' )
    {
        $("#divProduct").hide();
        $("#divCategory").show();
    }
        
    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");

    // 폼체크
    $("#frm").validate({
        rules: {
        	PRM_WRD_TXT      : { required:true },
        	PRM_WRD_POSITION : { required:true },
        	PRM_WRD_ST_DT    : { required:true },
        	PRM_WRD_ED_DT    : { required:true },
        	PRM_WRD_SCOPE    : { required:true },
        	PRM_WRD_STATE    : { required:true }
        }
    });
    
 	// 상품검색 
    $(document).on("click", "#goProductAdd", function () 
    {	
   		popup('',"900","500","no","_ProductPopup");
   		$("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "target":"popup_ProductPopup", "method":"post"}).submit();

    });
    
    // 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	//상품/카테고리 등록 확인
            var cnt = $(".checkRow").length;
        	var alertMsg = "추가 할 상품을 선택해주세요.";
        	
        	if ( $("#PRM_WRD_SCOPE").val() == 'C' )
        	{
        		alertMsg = "추가 할 카테고리를 선택해주세요.";
        	}
            if (cnt <= 0){
                alert(alertMsg);
                return;
            }
            
            if (confirm( "저장 하시겠습니까?")) {               
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/sellingPointProductModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
        
    // 사용상품 상품/카테고리 선택 이벤트
    $(document).on("click", "#PRM_WRD_SCOPE1", function () 
    {
        // 상품검색
        $("#applyCategoryList").children("tr").remove();
        $("#applyCategoryList").append('<tr id="categoryNodata"><td colspan="2">카테고리를 검색해 주세요.</td></tr>');
        
        $("#divCategory").hide();
        $("#divProduct").show();
    });
    $(document).on("click", "#PRM_WRD_SCOPE2", function () 
    {
    	// 카테고리
        $("#applyProductList").children("tr").remove();
        $("#applyProductList").append('<tr id="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        
        $("#divProduct").hide();
        $("#divCategory").show();
    });

	//상품 중복체크
    fnDuplicationChk = function( selectObj ){
		var bReturn = true;
    	var $obj = $("#applyProductList input[name='PRD_MST_CDs']");
    	$.each($obj, function(){
    		if( selectObj == $(this).val() ){
    			bReturn = false;
    			return false;
    		}
    	});
    	return bReturn;
    };
    //상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	var bCheck = true;
    	//상품중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationChk( el.PRD_MST_CD )){
    			alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$("#productNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		$.each(params, function(index,item){
        		obj = new Object();
        		obj.PRD_MST_CD 				= item.PRD_MST_CD;
        		obj.PRD_MST_NM 			= item.PRD_MST_NM;
        		obj.PRD_CTG_PATH 			= item.PRD_CTG_PATH;
        		obj.CMN_BRD_NM 				= item.CMN_BRD_NM;
        		obj.PRD_MST_NORMAL_PRICE 	= setComma(item.PRD_MST_NORMAL_PRICE);
        		obj.PRD_MST_SELL_PRICE      = setComma(item.PRD_MST_SELL_PRICE);
        		obj.PRD_MST_SEL_STATE 		= item.PRD_MST_SEL_STATE;
        		if(item.PRD_MST_CNL_PC_YN == "Y" && item.PRD_MST_CNL_MB_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE ="전체";
        		}
        		else if(item.PRD_MST_CNL_PC_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE="PC";	
        		}
        		else if(item.PRD_MST_CNL_MB_YN == "Y")
        		{
        			obj.PRD_MST_CHANNEL_TYPE="MOBILE";	
        		}
        		
				obj.FRONT_URL = '<c:out value="${frontDomain}" />';
        		
        		obj.serverDomain 			= '<c:out value="${serverDomain}" />';
        		if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "b";
        		}
        		else
        		{
        		    obj.PRD_MST_SEL_STATE_CLASS = "a";
        		}
        		obj.imgpath 		        = item.PRD_IMG_THUM_URL;

        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		$( "#productTemplate" ).tmpl( arrayObj ).appendTo( "#applyProductList" );
    		return true;
    	}
    };

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", "#goProductDelete", function () 
    {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("삭제할 상품을 선택하여 주십시오.");
    		return;
    	}
        $("#applyProductList").children("tr").each(function()
        {
        	if ( $(this).find("input[name='PRD_MST_CDs']").is(":checked") )
        	{
        		$(this).remove();
        	}
        });
        
        if ( $("#applyProductList").children("tr").length == 0 )
        {
        	$("#applyProductList").append('<tr id="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);
        
    });

  	//카테고리 검색 결과
    fnResultCategory = function(params)
    {
    	var bCheck = true;
    	var $obj = $("#applyCategoryList input[name='PRD_CTG_IDXs']");
    	$.each($obj, function(){
    		if( params.CTG_IDX == $(this).val() ){
    			alert("["+params.CTG_PATH+"] 이미 선택된 카테고리입니다.");
    			bCheck = false;
    			return false;
    		}
    	});
    	if( bCheck )
    	{
    		//기본TR삭제 
        	$("#categoryNodata").remove();
    		
        	var idx = $("#applyCategoryList").find("tr").length;
        	params.IDX = ++idx;
        	
    	    $("#categoryTemplate").tmpl(params).appendTo("#applyCategoryList");
    	}
    };

    // 사용상품 카테고리 선택삭제 이벤트
    $(document).on("click", "#goCategoryDelete", function () 
    {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("삭제할 카테고리를 선택하여 주십시오.");
    		return;
    	}
        $("#applyCategoryList").children("tr").each(function()
        {
        	if ( $(this).find("input[name='PRD_CTG_IDXs']").is(":checked") )
        	{
        		$(this).remove();
        	}
        });
        
        if ( $("#applyCategoryList").children("tr").length == 0 )
        {
        	$("#applyCategoryList").append('<tr id="categoryNodata"><td colspan="2">카테고리를 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);
    });

    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
        var $frm = $("#searchForm"); 
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/sellingPointProductList.do", "target":"_self", "method":"post"}).submit();
    });
    
});
</script>
</body>
</html>  