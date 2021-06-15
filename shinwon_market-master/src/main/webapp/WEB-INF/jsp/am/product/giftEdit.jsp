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

                <h2 class="title"><span>사은품관리</span></h2>

                <div class="push-guide instant"><!-- push-guide -->
                    <i class="icon"><!-- icon --></i>
                    <h3 class="title"><span>수정(<strong class="strong"><i class="require"><em>필수입력</em></i>는 필수입력사항입니다</strong>)</span></h3>
                </div><!-- // push-guide -->

				<form id="searchForm">
					<input type="hidden" name="searchYn"          value="<c:out value="${commandMap.searchYn }"/>" />
					<input type="hidden" name="pageSize"          value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="cPage"             value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchStartDate"   value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate"     value="<c:out value="${commandMap.searchEndDate }"/>"/>
					<input type="hidden" name="searchGftMstName"  value="<c:out value="${commandMap.searchGftMstName }"/>"/>
					<input type="hidden" name="searchGftMstUseYn" value="<c:out value="${commandMap.searchGftMstUseYn }"/>"/>
				</form>
				<form id="frm" name="frm" enctype="multipart/form-data">
					<input type="hidden" name="searchYn"          value="<c:out value="${commandMap.searchYn }"/>" />
					<input type="hidden" name="pageSize"          value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="cPage"             value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchStartDate"   value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate"     value="<c:out value="${commandMap.searchEndDate }"/>"/>
					<input type="hidden" name="searchGftMstName"  value="<c:out value="${commandMap.searchGftMstName }"/>"/>
					<input type="hidden" name="searchGftMstUseYn" value="<c:out value="${commandMap.searchGftMstUseYn }"/>"/>
					<input type="hidden" name="GFT_MST_IDX"       id="GFT_MST_IDX"  value="<c:out value="${giftInfo.GFT_MST_IDX }"/>"/>
					<input type="hidden" name="GFT_MST_BRAND_CD"  id="GFT_MST_BRAND_CD"  value="<c:out value="${giftInfo.GFT_MST_BRAND_CD }"/>"/>

	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>사은품명 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <input type="text" name="GFT_MST_NAME" id="GFT_MST_NAME" class="text large" value="<c:out value="${giftInfo.GFT_MST_NAME }"/>" maxlength="30"/> (최대 30자)
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>사은품 이미지 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <input type="radio" class="radio" name="GFT_MST_PRD_TYPE" id="GFT_MST_PRD_TYPE1" value="F" <c:if test="${giftInfo.GFT_MST_PRD_TYPE eq 'F' }">checked="checked"</c:if>/>
		                            <label for="GFT_MST_PRD_TYPE1">이미지등록</label>
		                            <input type="radio" class="radio" name="GFT_MST_PRD_TYPE" id="GFT_MST_PRD_TYPE2" value="P" <c:if test="${giftInfo.GFT_MST_PRD_TYPE eq 'P' }">checked="checked"</c:if>/>
		                            <label for="GFT_MST_PRD_TYPE2">상품선택</label>
		                            <div style="padding-top:15px; display:none;" id="type1">
		                            	<c:if test="${giftInfo.GFT_MST_PRD_TYPE eq 'F' }">
			                            	<ul class="img-upload">
							                	<li>
							                    	<i class="icon-file"></i>
							                        <a href="<c:out value="${cdnDomain }${giftInfo.CMM_FLE_ATT_PATH}${giftInfo.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
							                        	<c:out value="${giftInfo.CMM_FLE_ORG_NM }"/>
							                        </a>
							                        <input type="checkbox" class="checkbox" id="CMM_FLE_IDX" name="CMM_FLE_IDX" value="<c:out value="${giftInfo.CMM_FLE_IDX }"/>" />
							                        <label for="CMM_FLE_IDX">삭제</label>
							                    </li>
							                </ul>
							            </c:if>
			                            <input type="file" name="file" id="file" class="file"/>
							            <input type="hidden" name="CMM_FLE_TB_TYPE" value="I" />
							            <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
		 	                            <small class="desc">* 업로드 용량 : 2MB</small>
		 	                            <p class="img-text">
		                                    <span>대체텍스트 : </span> <input type="text" name="CMN_FLE_ALT_TXT_OLD" id="CMN_FLE_ALT_TXT_OLD" class="text long" maxlength="300" value="<c:out value="${giftInfo.CMN_FLE_ALT_TXT }"/>" />
		                                    <input type="hidden" name="CMN_FLE_ALT_TXT_IDX" id="CMN_FLE_ALT_TXT_IDX" value="<c:out value="${giftInfo.CMM_FLE_IDX }"/>"/>
		                                </p>
			                        </div>
			                        <div style="padding-top:15px; display:none;" id="type2">
			                            상품코드 : <input type="text" name="GFT_MST_PRD_CD" id="GFT_MST_PRD_CD" class="text" disabled=true maxlength="90" value="<c:out value="${giftInfo.GFT_MST_PRD_CD }"/>" />
			                            <a href="<c:out value="${serverDomain}" />/am/product/searchProductPopup.do?searchType=D" class="button button-b small js-modal" data-width="900" data-height="800" data-scroll="true" target="_blank" title="새 창 으로 열립니다."><span>상품검색</span></a>
			                        </div>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>옵션</span></th>
	                            <td>
	                                <input type="text" name="GFT_MST_OPTION" id="GFT_MST_OPTION" class="text large" maxlength="100" value="<c:out value="${giftInfo.GFT_MST_OPTION }"/>"/>
	                                <small>(최대 100자, 특수문자를 제외한 옵션명들을 ,로 구분하여 입력해 주세요. 사은품 옵션이 없을 때는 '옵션없음' 이라고 입력하셔야 합니다. )</small>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>사은기간 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                       			<input type="text" name="GFT_MST_ST_DT" id="GFT_MST_ST_DT" class="text" readonly="readonly" data-target-end="#GFT_MST_ED_DT" value="<c:out value="${giftInfo.GFT_MST_ST_DT }"/>"/> ~
	                       			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" name="GFT_MST_ED_DT" id="GFT_MST_ED_DT" class="text" readonly="readonly" data-target-start="#GFT_MST_ST_DT" value="<c:out value="${giftInfo.GFT_MST_ED_DT }"/>"/>
	                                <a href="javascript:fnDateSet('GFT_MST_ST_DT', 'GFT_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('GFT_MST_ST_DT', 'GFT_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('GFT_MST_ST_DT', 'GFT_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('GFT_MST_ST_DT', 'GFT_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>구분 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <input type="radio" name="GFT_MST_GUBUN" id="gubunA" value="S" class="radio" <c:if test="${giftInfo.GFT_MST_GUBUN eq 'S' }">checked="checked"</c:if> />
		                            <label for="gubunA">주문금액</label>
		                            <input type="text" class="number text" id="GFT_MST_COND_AMT" name="GFT_MST_COND_AMT" value="<fmt:formatNumber value="${giftInfo.GFT_MST_COND_AMT}" type="number"/>" maxlength="9" /> 원 이상 &nbsp;&nbsp;&nbsp;
		                            <input type="radio" name="GFT_MST_GUBUN" id="gubunB" value="P" class="radio" <c:if test="${giftInfo.GFT_MST_GUBUN eq 'P' }">checked="checked"</c:if> />
		                            <label for="gubunB">상품</label>
		                            <input type="radio" name="GFT_MST_GUBUN" id="gubunC" value="D" class="radio" <c:if test="${giftInfo.GFT_MST_GUBUN eq 'D' }">checked="checked"</c:if> />
		                            <label for="gubunC">기획전 상품</label>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>재고 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <input type="text" class="number text" id="GFT_MST_STOCK_CNT" name="GFT_MST_STOCK_CNT" value="<fmt:formatNumber value="${giftInfo.GFT_MST_STOCK_CNT}" type="number"/>" maxlength="7"/>개
	                            </td>
	                        </tr>
                            <tr class="productChoice" style="display:none;">
                                <th><span>적용상품 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	
                                    <select name="GFT_MST_PLN_IDX" id="GFT_MST_PLN_IDX" class="select">
                                        <option value="">기획전 상품 선택</option>
                                        <c:choose>
                                            <c:when test="${not empty planList}">
                                                <c:forEach var="planList" items="${planList}" varStatus="status">
                                                    <option value="<c:out value="${planList.PLN_MST_IDX}" />"  <c:if test="${planList.PLN_MST_IDX eq giftInfo.GFT_MST_PLN_IDX}">selected</c:if>>
                                                        <c:choose>
                                                            <c:when test="${planList.PLN_MST_CHANNEL_MOBILE_YN eq 'Y' and planList.PLN_MST_CHANNEL_PC_YN eq 'Y'}">[PC+MOBILE]
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${planList.PLN_MST_CHANNEL_PC_YN eq 'Y'}" >[PC]</c:if>
                                                                <c:if test="${planList.PLN_MST_CHANNEL_MOBILE_YN eq 'Y'}" >[MOBILE]</c:if>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:out value="${planList.PLN_MST_TITLE}" />
                                                    </option>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                    </select>
                                </td>
                            </tr>
	                        <tr><!-- row -->
	                            <th><span>상태 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <input type="radio" name="GFT_MST_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${giftInfo.GFT_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="GFT_MST_USE_YN" id="stateB" value="N" class="radio" <c:if test="${giftInfo.GFT_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미사용</label>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>적용상품</span></th>
	                            <td>
									<div id="divProduct"><!-- 상품검색 -->

										<div class="grid section-button-search"><!-- section button -->
											<a href="#none" id="goProductDelete" class="button small"><span>선택삭제</span></a>
											<a href="#none" id="goProductAdd" class="button small" title="새 창 으로 열립니다."><span>상품검색</span></a>
										</div><!-- // section button -->

										<table class="table-col table-b" id="tableProduct">
											<colgroup>
												<col style="width: 40px;" />
												<col style="width: 100px" />
												<col style="width: 80px;"/>
												<col style="width: auto"/>
												<col style="width: 100px"/>
												<col style="width: 80px"/>
												<col style="width: 80px"/>
											</colgroup>
											<thead>
												<tr>
													<th><input type="checkbox" class="checkbox checkAll"></th>
													<th>상품코드</th>
													<th>이미지</th>
													<th>상품명</th>
													<th>상품가격</th>
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
													    <input type="checkbox" class="checkbox checkRow" id="PRD_MST_CD_${item.PRD_MST_CD}" name="PRD_MST_CDs" value="${item.PRD_MST_CD}" />
													    <input type="hidden" name="APPLY_IDXs" value="${item.PRD_MST_CD}" />
													</td>
													<td>
														<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${item.PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
															<c:out value="${item.PRD_MST_CD }" />
														</a>
													</td>
													<td>
														<img src="<c:out value="${cdnDomain}" />${item.PRD_IMAGE}"/>
													</td>
													<td>
														<%-- <a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&ADMIN=Y" target="_blank">
															<c:out value="${item.PRD_MST_NM }" />
														</a> --%>
														<c:out value="${item.PRD_MST_NM }" />
													</td>
													<td><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" /></td>
													<!-- <td><fmt:formatNumber value="${item.PRD_MST_SCH_PRC }" groupingUsed="true" /></td>-->
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
				                                </c:forEach>
				                            </c:when>
				                            <c:otherwise>
				                                <tr id="productNodata"><!-- row -->
				                                    <td colspan="7">상품을 검색해 주세요.</td>
				                                </tr>
				                            </c:otherwise>
				                            </c:choose>
											</tbody>
										</table>
									</div><!-- // 상품검색 -->
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th><span>등록일</span></th>
	                        	<td>
	                        		<c:out value="${giftInfo.GFT_MST_REG_NM }"/>(<c:out value="${giftInfo.GFT_MST_REG_ID}"/>) / <ui:formatDate value="${giftInfo.GFT_MST_REG_DT }" pattern="yyyy.MM.dd"/>
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<th><span>수정일</span></th>
	                        	<td>
	                        		<c:if test="${giftInfo.GFT_MST_UPD_ID ne '' && giftInfo.GFT_MST_UPD_ID ne null}">
		                            	<c:out value="${giftInfo.GFT_MST_UPD_NM }"/>(<c:out value="${giftInfo.GFT_MST_UPD_ID}"/>) / <ui:formatDate value="${giftInfo.GFT_MST_UPD_DT }" pattern="yyyy.MM.dd"/>
		                            </c:if>
	                        	</td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
				</form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->

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
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<!-- template -->
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
	<td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" name="APPLY_IDXs" value="\${PRD_MST_CD}"/></td>
 	<td><span class="thumbnail_img"><img src="\${PRD_IMAGE}"></span></td>
	<td>
		\${PRD_MST_NM}
	</td>
	<td>\${PRD_MST_PRC}</td>
	<td>\${PRD_MST_SEL_STATE}</td>
	<td>\${PRD_MST_CHANNEL_TYPE}</td>
</tr>
</script>
<script>
$(function(){
var gft_mst_prd_type =  "<c:out value="${giftInfo.GFT_MST_PRD_TYPE}" />";

	if(gft_mst_prd_type =="F"){
		if($("#CMM_FLE_IDX").is(":checked"))
		{
			$("#file").prop("disabled", false);
		}
		else
		{
			$("#file").prop("disabled", true);
		}
	}
	// 파일 삭제 check box 변경 이벤트
    $(document).on("click", "#CMM_FLE_IDX", function () {
    	if($(this).is(":checked"))
    	{
    		$("#file").prop("disabled", false);
    	}
    	else
    	{
    		$("#file").prop("disabled", true);
    	}
    });

    // 폼체크
    $("#frm").validate({
        rules: {
        	GFT_MST_NAME:{required:true},     // 사은품명
        	//GFT_MST_OPTION:{required:true},   // 사은품 옵션
        	GFT_MST_ST_DT:{required:true},    // 사은품 증정 기간 시작
        	GFT_MST_ED_DT:{required:true},    // 사은품 증정 기간 종료
        	GFT_MST_USE_YN:{required:true},   // 상태
        	GFT_MST_STOCK_CNT:{required:true} // 재고
        }
    });

    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");

 	// 상품검색
    $(document).on("click", "#goProductAdd", function ()
    {
   		popup('<c:out value="${serverDomain}" />/am/product/searchProductPopup.do',"1100","700","no","_ProductPopup");

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
    		if(el.SEARCH_THPE != "D"){
	    		if( !fnDuplicationChk( el.PRD_MST_CD )){
	    			alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
					bCheck = false;
	    			return false;
	    		}
    		}
    	});
    	if( bCheck ){
        	//기본TR삭제
        	$("#productNodata").remove();
        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		var searchType = "";
    		$.each(params, function(index,item){
    			obj = new Object();
        		obj.PRD_MST_CD 				= item.PRD_MST_CD;
        		obj.PRD_MST_NM 				= item.PRD_MST_NM;
        		obj.PRD_CTG_PATH 			= item.PRD_CTG_PATH;
        		obj.CMN_BRD_NM 				= item.CMN_BRD_NM;
        		obj.PRD_MST_PRC			 	= setComma(item.PRD_MST_PRC);
        		obj.PRD_MST_SCH_PRC      	= setComma(item.PRD_MST_SCH_PRC);
        		obj.PRD_MST_SEL_STATE 		= item.PRD_MST_SEL_STATE;
        		obj.PRD_IMAGE = item.PRD_IMAGE;
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
				searchType		        	= item.SEARCH_THPE;
        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});
    		if(searchType == "D"){
    			$("#GFT_MST_PRD_CD").val(obj.PRD_MST_CD);
    		}else{
    			//기본TR삭제
            	$("#productNodata").remove();
            	$( "#productTemplate" ).tmpl( arrayObj ).appendTo( "#applyProductList" );
    		}

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
        	$("#applyProductList").append('<tr id="productNodata"><td colspan="7">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);

    });

    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/giftList.do", "target":"_self", "method":"post"}).submit();
    });

 	// 구분 라디오 클릭 금액 비 활성화
    $(document).on("click", "input[name=GFT_MST_GUBUN]", function () {
       if($(this).val() == "P"){
    	   $("input[name='GFT_MST_COND_AMT']").prop("disabled", true);
    	   $("input[name='GFT_MST_COND_AMT']").val(0);
    	   //$("#GFT_MST_PLN_IDX").hide();
           $("#divProduct").show();
           $(".productChoice").hide();
       }else if($(this).val() == "D"){
    	   $("input[name='GFT_MST_COND_AMT']").prop("disabled", true);
    	   $("input[name='GFT_MST_COND_AMT']").val(0);
    	   //$("#GFT_MST_PLN_IDX").show();
    	   $("#divProduct").show();
          	$(".productChoice").show();
       }else{
    	   var amtPrice = "<c:out value="${giftInfo.GFT_MST_COND_AMT}" />";

    	   if(amtPrice != ""){
    		   amtPrice = setComma(parseInt(amtPrice));
    	   }else{
    		   amtPrice = 0;
    	   }
    	   $("input[name='GFT_MST_COND_AMT']").prop("disabled", false);
    	   $("input[name='GFT_MST_COND_AMT']").val(amtPrice);
    	   //$("#GFT_MST_PLN_IDX").hide();
    	   $("#divProduct").show();
           $(".productChoice").hide();
       }
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        if($frm.valid()){

        	var productCheck = true;

        	//사은품이미지 등록 타입
            if($(':radio[name="GFT_MST_PRD_TYPE"]:checked').val() == "F" && ($("#file").val() == '' && $("#CMM_FLE_IDX").is(":checked"))){
             	alert("사은품이미지 [파일등록]의 경우 이미지를 첨부해주세요.");
             	$("#file").focus();
             	return false;
            }
            if($(':radio[name="GFT_MST_PRD_TYPE"]:checked').val() == "F" && $("#CMN_FLE_ALT_TXT_OLD").val() == ''){
             	alert("사은품이미지 [파일등록]의 경우 대체텍스트를 입력해주세요.");
             	$("#CMN_FLE_ALT_TXT_OLD").focus();
             	return false;
            }
            if($(':radio[name="GFT_MST_PRD_TYPE"]:checked').val() == "P" && $("#GFT_MST_PRD_CD").val() == ''){
             	alert("사은품이미지 [상품선택]의 경우 상품코드를 등록해주세요.");
             	$("#GFT_MST_PRD_CD").focus();
             	return false;
            }
        	//사은품 구분에 의한 체크
            if($(':radio[name="GFT_MST_GUBUN"]:checked').val() == "S" && ($("#GFT_MST_COND_AMT").val() == '' || $("#GFT_MST_COND_AMT").val() < 1 )){
            	alert("사은품 구분이 주문금액이면 주문금액을 입력해셔야 합니다.");
            	$("#GFT_MST_COND_AMT").focus();
            	return false;
            }
          	//사은품 구분에 의한 체크
            if($(':radio[name="GFT_MST_GUBUN"]:checked').val() == "D" && $("#GFT_MST_PLN_IDX").val() == ''){
            	alert("사은품 구분이 기획전 상품이면 기획전 상품을 선택 하셔야 합니다.");
            	$("#GFT_MST_COND_AMT").focus();
            	return false;
            }
            /* if($(".checkRow").length <= 0)
            {
	             alert("[적용상품]상품을 추가해 주십시오.");
	             $("#goProductAdd").focus();
	             productCheck = false;
	             return false;
            } */
        	// 제한금액이 없으면 무조건 0으로 넣어줌
        	if($("#GFT_MST_COND_AMT").val() == '')
        	{
        		$("#GFT_MST_COND_AMT").val(0);
        	}
        	// 재고가 없으면 무조건 0으로 넣어줌
        	if($("#GFT_MST_STOCK_CNT").val() == '')
        	{
        		$("#GFT_MST_STOCK_CNT").val(0);
        	}
        	// 사은품 구분이 기획전 상품이 아니면 값 삭제
        	if($(':radio[name="GFT_MST_GUBUN"]:checked').val() != "D" ){
        		$("#GFT_MST_PLN_IDX").val('');
            }
        	//상품선택일 때 파일 삭제 체크박스 강제 선택
        	if($("#CMN_FLE_ALT_TXT_IDX").val != "" && $(':radio[name="GFT_MST_PRD_TYPE"]:checked').val() == "P"){
        		$("#CMM_FLE_IDX").attr("checked",true);
        	}
        	//상품이미지 파일 등록 일 때 상품코드 삭제처리
        	if($(':radio[name="GFT_MST_PRD_TYPE"]:checked').val() == "F"){
        		$("#GFT_MST_PRD_CD").val("");
        	}

        	//제한금액 및 재고 콤마재거
        	$("#GFT_MST_COND_AMT").val(getInt($("#GFT_MST_COND_AMT").val()));
        	$("#GFT_MST_STOCK_CNT").val(getInt($("#GFT_MST_STOCK_CNT").val()));
        	//구분의 상태가 상품이면 비활성화 해제
        	$("input[name='GFT_MST_COND_AMT']").prop("disabled", false);

            if (confirm( "수정 하시겠습니까?")) {
            	$("#GFT_MST_PRD_CD").attr("disabled",false);
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/giftModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });

 	// 이미지등록 / 상품선택 라디오 체크
    $(document).on("click", "input[name=GFT_MST_PRD_TYPE]", function () {
       if($(this).val() == "F"){
    	   $("#type1").show();
    	   $("#type2").hide();
       }else{
    	   $("#type1").hide();
    	   $("#type2").show();
       }
    });

 	$("input[name=GFT_MST_PRD_TYPE]").each(function(){
 		if($(':radio[name="GFT_MST_PRD_TYPE"]:checked').val() == "F"){
 			$("#type1").show();
     	   	$("#type2").hide();
 		}else{
 			 $("#type1").hide();
	    	 $("#type2").show();
 		}
 	});

 	console.log('********************');
 	console.log($(':radio[name="GFT_MST_GUBUN"]:checked').val());
 	
	if($(':radio[name="GFT_MST_GUBUN"]:checked').val() == "P"){
     	   $("input[name='GFT_MST_COND_AMT']").prop("disabled", true);
     	   $("input[name='GFT_MST_COND_AMT']").val(0);
     	   //$("#GFT_MST_PLN_IDX").hide();
     	   $("#divProduct").show();
     	  $(".productChoice").hide();
	}else if($(':radio[name="GFT_MST_GUBUN"]:checked').val() == "D"){
     	   $("input[name='GFT_MST_COND_AMT']").prop("disabled", true);
     	   $("input[name='GFT_MST_COND_AMT']").val(0);
     	   //$("#GFT_MST_PLN_IDX").show();
     	   $("#divProduct").show();
     	  $(".productChoice").show();
    }else{
     	   var amtPrice = "<c:out value="${giftInfo.GFT_MST_COND_AMT}" />";

     	   if(amtPrice != ""){
     		   amtPrice = setComma(parseInt(amtPrice));
     	   }else{
     		   amtPrice = 0;
     	   }
     	   $("input[name='GFT_MST_COND_AMT']").prop("disabled", false);
     	   $("input[name='GFT_MST_COND_AMT']").val(amtPrice);
     	   //$("#GFT_MST_PLN_IDX").hide();
     	  	$(".productChoice").hide();
     	   $("#divProduct").show();
    }
});
//-->
</script>

</body>
</html>
