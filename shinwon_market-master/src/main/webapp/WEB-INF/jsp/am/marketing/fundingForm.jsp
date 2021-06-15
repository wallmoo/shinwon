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

                <h2 class="title"><span>펀딩</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="searchPRD_MST_CD" value="<c:out value="${commandMap.searchPRD_MST_CD }"/>"/>
	                <input type="hidden" name="searchPRD_MST_NM" value="<c:out value="${commandMap.searchPRD_MST_NM }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchOneDayUesYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
					<input type="hidden" name="searchTimeSaleUseYn" value="<c:out value="${commandMap.searchTimeSaleUseYn }"/>"/>
					<input type="hidden" name="searchTimeSaleType" value="<c:out value="${commandMap.searchTimeSaleType }"/>"/>
				</form>

                <form id="frm" name="frm" enctype="multipart/form-data">
                
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>펀딩 상품<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text" id="PRD_MST_CD" name="PRD_MST_CD" style="width:20%" readonly/>&nbsp;
									<input type="text" class="text" id="PRD_MST_NM" name="PRD_MST_NM" style="width:50%" readonly/>
									<a href="javascript:searchProductPopup('fundfrd');" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>펀딩상품명<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text xlarge" id="FND_MST_NM" name="FND_MST_NM" style="width:80%;" maxlength="20"/> (20자이내)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>펀딩설명<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text xlarge" id="FND_MST_DSC" name="FND_MST_DSC" style="width:80%;" maxlength="50"/> (50자이내)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>목표수량<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="number" class="text" id="FND_MST_AIM" name="FND_MST_AIM">개
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>최대수량<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="number" class="text" id="FND_MST_LMT" name="FND_MST_LMT">개
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
                                <td >
                                    <input type="radio" class="radio" name="FND_MST_USE_YN" value="Y" checked>
                                    <label for="">사용</label>
                                    <input type="radio" class="radio" name="FND_MST_USE_YN"	value="N"> 
                                    <label for="">미사용</label>
                                </td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                

	                <h3 class="title"><span>펀딩가격</span></h3>
					<table class="table-row table-a">
						<colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
						</colgroup>
						<tbody>
	                        <tr>
	                    		<th><label class="label"><span>일반가<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="number" class="text" id="PRD_MST_PRC" name="PRD_MST_PRC"/>
	                    		</td>
	                    		<th><label class="label"><span>할인율<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select class="select" name="PRD_MST_UNT" id="PRD_MST_UNT">
	                    				<option value="R" selected>정률(%)</option>
	                    				<option value="S">정액(%)</option>
	                    			</select>
	                    			<input type="number" class="text large" id="PRD_MST_SALE_RATE" name="PRD_MST_SALE_RATE">
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>판매가</span></label></th>
	                    		<td colspan="3">
	                    			<input type="text" class="text" id="price" disabled/>  
	                    		</td>
	                        </tr>
						</tbody>
					</table>

	                <h3 class="title"><span>태그</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="">일반 TAG<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<p class="txt_warnning">태그 설정을 위해 '선택' 버튼을 클릭해 주세요.</p>
									<div class="tag_cloud_wrap_side">
										<div class="tag_cloud_wrap">
											<ul class="tag_cloud_list">
											</ul>
										</div>
										<button type="button" class="btn_tag_select">선택</button>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">대표 TAG<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select id="representTag" name="TAG_BND_REP_ID" class="select">
										<option value="">선택</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				
					<h3 class="title color_info_cls"><span>추가옵션</span></h3>
					<table class="table-row table-a color_info_cls">
						<colgroup>
							<col style="width: 15%">
							<col style="width: 85%">
						</colgroup>
						<tbody>
							<tr>
								<th><span>추가옵션</span></th>
								<td>
									<div class="grid section-button-search">
										<a href="javascript:;" id="" class="button button-a removeOption"><span>선택삭제</span></a>
										<a href="javascript:;" id="" class="button button-a primary addOption"><span>옵션추가</span></a>
									</div>
									<table class="table-row table-a">
										<colgroup>
											<col style="width: 33px">
											<col style="width: auto;">
											<col style="width: 150px;">
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="" id=""></th>
												<th class="ac">옵션명</th>
												<th class="ac">사용</th>
											</tr>
										</thead>
										<tbody id="optionList">
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				
	                <h3 class="title"><span>펀딩기간</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
                                <th><span>기간 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" class="text" name="FND_MST_ST_DT" id="FND_MST_ST_DT"	value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="FND_MST_ED_DT"> ~
	                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                                <input type="text" class="text" name="FND_MST_ED_DT"	id="FND_MST_ED_DT" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="FND_MST_ST_DT">
	                                <a href="javascript:fnDateSet('FND_MST_ST_DT', 'FND_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                                <a href="javascript:fnDateSet('FND_MST_ST_DT', 'FND_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                                <a href="javascript:fnDateSet('FND_MST_ST_DT', 'FND_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                                <a href="javascript:fnDateSet('FND_MST_ST_DT', 'FND_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                                <a href="javascript:fnDateSet('FND_MST_ST_DT', 'FND_MST_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
 	                               
 	                                <input type="checkbox" class="checkbox" id="FND_MST_DSP_YN" name="FND_MST_DSP_YN" />오픈예정
                                </td>
							</tr>
						</tbody>
					</table>
				</form>

				<h3 class="title"><span>함께 매치하기 좋은 상품</span></h3>
				<table class="table-row table-a">
					<colgroup>
						<col style="width: 15%">
						<col style="width: 85%">
					</colgroup>
					<tbody>
						<tr>
							<th><span>함께 매치하기 좋은 상품</span></th>
							<td>
								<ul class="product_match_list">
									<li><input type="text" name="PRD_MST_RLT_NM1" id="" class="text half"
										value="" readonly> <input type="hidden"
										name="PRD_MST_RLT_CD1" value="" />
										<button type="button" onclick="searchProductPopup('recommendation1')"
											id="PRD_MST_RLT_CD1" class="button button-a primary small">상품찾기</button>
										<button type="button" class="btn_row_plus"
											id="addMatchProduct">+</button>
										<button type="button"
											class="button button-a small removeMatchFirst">상품지우기</button>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="tab-list" id="menuViewTab">
					<ul>
						<li class="in"><a href="#none" data-tab_no="tab2" id="descTab">상품상세설명</a></li>
						<li><a href="#none" data-tab_no="tab4">상품고시정보</a></li>
					</ul>
				</div>

				<!--// 상품 이미지 등록 관련 코드 추가, 이상준, 끝 -->

				<div id="tab2">
					<h4 class="title">
						<span>상품 상세설명</span>
					</h4>

					<div class="section-form">
						<!-- section-form-a -->

						<div class="form-group">
							<h5 class="title">
								<span>PC</span>
							</h5>
							<div class="field">
								<input type="checkbox" class="checkbox" id="detailChk"
									onclick="detailDesc();" checked="checked" />모바일에서 PC와 동일한
								내용으로 사용<br />
								<textarea class="textarea" id="PRD_MST_DETAIL_DESC"
									name="PRD_MST_DETAIL_DESC">${productInfo.PRD_MST_PC_DTL_DSC}</textarea>
							</div>
						</div>

						<div class="form-group">
							<h5 class="title">
								<span>MOBILE</span>
							</h5>
							<div class="field">
								<textarea class="textarea" id="PRD_MST_DETAIL_DESC2"
									name="PRD_MST_DETAIL_DESC2">${productInfo.PRD_MST_MB_DTL_DSC}</textarea>
							</div>
						</div>
					</div>
					<!-- // section-form-a -->
				</div>

				<div id="tab4" style="display: none">

					<h4 class="title">
						<span>상품고시정보</span>
					</h4>

					<div class="table-a">
						<!-- col list -->
						<table class="table-row table-a">
							<colgroup>
								<col style="width: 25%;" />
								<col style="width: 25%;" />
								<col style="width: 25%;" />
								<col style="width: 25%;" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>품목 <i class="require"><em>필수입력</em></i></span></th>
									<td colspan="3" class="left"><select class="select"
										name="PRD_MST_NFI_IDX" id="PRD_MST_NFI_IDX">
											<option value="">==선택==</option>
											<c:choose>
												<c:when test="${not empty productNfiList}">
													<c:forEach var="productNfiList"	items="${productNfiList }" varStatus="status">
														<option	value="<c:out value="${productNfiList.PRD_NFI_IDX }" />"
															<ui:select v="${productInfo.PRD_MST_NFI_IDX }" t="${productNfiList.PRD_NFI_IDX }" g="selected"/>>
															<c:out	value="${productNfiList.PRD_NFI_NM }" />
														</option>
													</c:forEach>
												</c:when>
											</c:choose>
									</select></td>
								</tr>
								<tr>
									<th><span>브랜드 
										<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX ne Code.VENDOR_ADMINISTRATOR_IDX}">
											<i class="require"><em>필수입력</em></i>
										</c:if>
										</span>
									</th>
									<td class="left">
										<c:choose>
											<c:when test = "${not empty brandManagerInfo}">
												<c:set var="prd_brand_idx" value="${brandManagerInfo.BRD_MST_IDX }" />
												<c:set var="prd_brand_serv" value="${brandManagerInfo.BRD_MST_SERV }" />
												<c:set var="prd_brand_nm" value="${brandManagerInfo.BND_MST_BRAND_NM }" />
											</c:when>
											<c:otherwise>
												<c:set var="prd_brand_idx" value="${productInfo.PRD_MST_BRD_IDX }" />
												<c:set var="prd_brand_serv" value="${productInfo.PRD_MST_BRD_SERV }" />
												<c:set var="prd_brand_nm" value="${productInfo.PRD_MST_BRAND_NM }" />
											</c:otherwise>
										</c:choose>
										
										<input type="hidden" class="text" name="PRD_MST_BRD_IDX" id="PRD_MST_BRD_IDX"	value="<c:out value="${prd_brand_idx}" />" />
										<input type="hidden" class="text" name="PRD_MST_BRD_SERV"	id="PRD_MST_BRD_SERV"	value="<c:out value="${prd_brand_serv }" />" />
										<input type="text" class="text" name="PRD_MST_BRD_NM"	id="PRD_MST_BRD_NM" disabled="disabled"		value="<c:out value="${prd_brand_nm}" />" 
										<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.VENDOR_ADMINISTRATOR_IDX}">disabled</c:if>/>
										<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX ne Code.VENDOR_ADMINISTRATOR_IDX}">
										<a href="#none" class="button button-a small goBrandPopup"><span>검색</span></a>
										</c:if>
									</td>
										
									<th><span>제조사 <i class="require"><em>필수입력</em></i></span></th>
									<td class="left"><input type="hidden" class="text"	name="PRD_MST_MRK_IDX" id="PRD_MST_MRK_IDX" 	value="<c:out value="${productInfo.PRD_MST_MRK_IDX }" />" />
										<input type="text" class="text" name="PRD_MST_MRK_NM"	id="PRD_MST_MRK_NM" disabled="disabled"		value="<c:out value="${productInfo.PRD_MST_MRK_NM }" />" />
										<a href="#none" id="goMrkPopup"	class="button button-a small"><span>검색</span></a></td>
								</tr>
								<tr>
									<td colspan="4" class="left">
										<table class="table-row table-a">
											<colgroup>
												<col style="width: 25%;" />
												<col style="width: auto%;" />
											</colgroup>
											<tbody id="createproductNotificationInfoTable">

											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

               	<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
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
	<script type="text/template" id="optionTemplate">
<tr>
	<td>
		<input type="checkbox" name="option" id="">
	</td>
	<td>
		<input type="text" name="PRD_OPT_NM" id="" class="text xlarge" value="" place-holder="옵션명입력">
	</td>
	<td>
		<select name="PRD_OPT_USE_YN" class="PRD_OPT_USE_YN" id="" class="select xlarge">
			<option value="Y" selected>사용</option>
			<option value="N" >미사용</option>
		</select>
	</td>
</tr>
</script>

	<script type="text/template" id="matchProductTemplate">
<li>
	<input type="text" name="PRD_MST_RLT_NM\${NUM}" id="" class="text half PRD_MST_RLT_CD" value="" readonly>
	<input type="hidden" name="PRD_MST_RLT_CD\${NUM}" value="" />
	<button type="button" onclick="searchProductPopup('recommendation\${NUM}')" id="PRD_MST_RLT_CD\${NUM}" class="button button-a primary small">상품찾기</button>
	<button type="button" class="btn_row_minus removeMatchProduct">-</button>
</li>
</script>

<script>
$(function(){
	// 폼체크

    // 저장 이벤트
    $(document).on("click", "#goRegist", function ()
    {
      	if($("#PRD_MST_CD").val() == "") {
      		alert("상품을 선택해야합니다.");
  			$("#PRD_MST_CD").focus();
  			return;
      	}

      	if($("#FND_MST_NM").val() == "") {
      		alert("펀드 상품명을 입력하시오.");
  			$("#FND_MST_NM").focus();
  			return;
      	}

      	if($("#FND_MST_DSC").val() == "") {
      		alert("펀드 설명을 입력하시오.");
  			$("#FND_MST_DSC").focus();
  			return;
      	}

      	if($("#FND_MST_AIM").val() == "") {
      		alert("목표 수량을 입력하시오.");
  			$("#FND_MST_DSC").focus();
  			return;
      	}

      	if($("#FND_MST_LMT").val() == "") {
      		alert("최대 수량을 입력하시오.");
  			$("#FND_MST_DSC").focus();
  			return;
      	}

      	if($("#PRD_MST_PRC").val() == "") {
      		alert("일반가를 입력하시오.");
  			$("#PRD_MST_PRC").focus();
  			return;
      	}

      	if($("#PRD_MST_SALE_RATE").val() == "") {
      		alert("할인율을 입력하시오.");
  			$("#PRD_MST_SALE_RATE").focus();
  			return;
      	}

      	if($("#FND_MST_ST_DT").val() == "") {
      		alert("펀딩시작일자를 입력하시오.");
  			$("#FND_MST_ST_DT").focus();
  			return;
      	}

      	if($("#FND_MST_Ed_DT").val() == "") {
      		alert("펀딩종료일자를 입력하시오.");
  			$("#FND_MST_Ed_DT").focus();
  			return;
      	}

      	if (confirm( "저장 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/fundingRegist.do", "target":"_self", "method":"post"}).submit();
        }
    });

    // 목록 이벤트
    $(document).on("click", "#goList", function () {
        var $frm = $("#searchForm");
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/fundingList.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 할인율 변경에 따른 판매가 변경
    $(document).on( "change", "#PRD_MST_SALE_RATE", function() {
    	fnSetPrice();
	});

    // 추가옵션_옵션추가
	$(document).on("click", ".addOption", function() {
		var params = {
			"OPT_IDX" : 0,
			"OPT_CNT" : 0
		};
		$("#optionTemplate").tmpl(params).appendTo("#optionList");

		return true;
	});
    
    // 함께 매치하기 좋은 상품_+
	$(document).on("click", "#addMatchProduct", function() {
		if ($(".product_match_list li").length >= 3) {
			alert("최대 슬롯은 3개입니다.");
			return;
		}
		
		fnRenderAddMatchLi();
		//treePageSetting();
		return true;
	});

    // 함께 매치하기 좋은 상품_-
	$(document).on("click", ".removeMatchProduct", function() {
		$(this).parent().remove();
		$(".PRD_MST_RLT_CD").each(function(index, item) {
			var idx = index + 1;
			$(this).next().attr("name", "PRD_MST_RLT_CD" + idx)
			$(this).next().next().attr("id", "PRD_MST_RLT_CD" + idx)
		});

	});

    // 함께 매치하기 좋은 상품_상품지우기
	$(document).on("click", ".removeMatchFirst", function() {
		$(this).parent().find("input").each(function() {
			$(this).val("");
		});
	})
    
    // 추가옵션_선택삭제
	$(document).on("click", ".removeOption", function() {
		$("input[name=option]:checked").each(function() {
			$(this).parent().parent().remove();
		})
	})

	// tab 변경
	$("#menuViewTab").on("click", "a", function() {

		var this_tab_no = $(this).data('tab_no');

		$(this).parent().parent().find('a').each(function(i, item) {
			if (this_tab_no == $(item).data("tab_no")) {
				$("#" + $(item).data("tab_no")).show();
				$(item).parent().attr("class", "in");
			} else {
				$("#" + $(item).data("tab_no")).hide();
				$(item).parent().attr("class", "");
			}
		});
	});

    // 상품검색 팝업창 호출
	$productBox = null;
	searchProductPopup = function(item) {
		curId = item;
		$productBox = $('#timeSaleSearch').parents("#productButton");
		popup(
				"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do?caller="+curId,
				"900", "500", "yes", "searchProduct");
	};
    
	//상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .CNT_PRD_MST_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
    // 상품 판매가 적용
    fnSetPrice = function(){
    	if ($("#PRD_MST_UNT option:selected").val() == "R") {
			var rate = parseInt($("#PRD_MST_SALE_RATE").val());
			if (rate > 100) {
				rate = 100;
			}
			$("#price").val($("#PRD_MST_PRC").val().replace(/,/g, '') * (100 - rate) / 100);
		} else {
			$("#price").val( $("#PRD_MST_PRC").val().replace(/,/g, '')- $("#PRD_MST_SALE_RATE").val());
		}
    }
    
	//상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params, caller){
    	var bCheck = true;
        //상품중복체크
        
        $.each( params, function( index, el ){
            if( !fnDuplicationChk( el.PRD_MST_CD )){
                alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
                bCheck = false;
                return false;
            }
        });
		if(caller == 'fundfrd') { // 펀딩상품

            //기본TR삭제
            $(".productNodata").remove();
        
			if(params.length > 1){
				alert('상품을 1개 이하로 선택하여 주십시오.');
				return;
			}	
			
			if(params.length == 1){
        		var curData = params[0];
        		$('input[name=PRD_MST_CD]').val(curData.PRD_MST_CD);
        		$('#PRD_MST_NM').val(setComma(curData.PRD_MST_NM));
        		$('#PRD_MST_PRC').val(curData.PRD_MST_PRC);
        		$('input[name=TIM_PRD_MST_SALE_RATE]').val(curData.TIM_PRD_MST_SALE_RATE);
        		$('#TIM_SAL_PRD_CNT').val(setComma(curData.PRD_MST_SEL_CNT));
				fnPrdDetail(curData.PRD_MST_CD);
        	}
        	
		}else if (caller.indexOf('recommendation') >= 0) //매치상품
		{
			if(params.length>3){
				alert('상품을 3개 이하로 선택하여 주십시오.');
				return;
			}				

			var callerIndex = caller.replace('recommendation', '');
			callerIndex = callerIndex * 1;
			
			if(params.length > 0) {
				
				var prevData = $('.product_match_list li');
				var allData = [];
				for(var i = 0; i < prevData.length; i++) {
					var $curLiElem = $(prevData[i]);
					
					var obj = new Object();
					obj.PRD_MST_CD = $('input[name=PRD_MST_RLT_CD' + (i + 1) + ']', $curLiElem).val();
					obj.PRD_MST_NM = $('input[name=PRD_MST_RLT_NM' + (i + 1) + ']', $curLiElem).val();
					allData.push(obj); 
				}
				
				var newData = [];
				for(var i = 0 ; i < params.length; i++) {
					var curData = params[i];
				
					var isOld = false;
					for(var k = 0 ; k < allData.length ; k++) {
						if(allData[k].PRD_MST_CD == curData.PRD_MST_CD) {
							isOld = true;
							break;
						}
					}
					if(!isOld) newData.push(curData);
				}
				
				if(newData.length > 0) {
					var maxCount = (callerIndex + newData.length - 1) > 3 ? 3 : (callerIndex + newData.length - 1);
					var newDataIdx = 0;
					console.log(maxCount);
					for(var i = callerIndex ; i <= maxCount; i ++) {
						var curData = newData[newDataIdx++];
						if($(".product_match_list li").length < i)
							fnRenderAddMatchLi();
						
						var $curLiElem = $('.product_match_list li:nth-child(' + i + ')');
						$('input[name=PRD_MST_RLT_CD' + i + ']', $curLiElem).val(curData.PRD_MST_CD);
						$('input[name=PRD_MST_RLT_NM' + i + ']', $curLiElem).val(curData.PRD_MST_NM);
						
					}
				}
			}
		}

        return true;
    };

	fnRenderAddMatchLi = function() {
		var params = {
				"NUM" : $(".product_match_list li").length + 1,
				"OPT_IDX" : 0,
				"OPT_CNT" : 0
			};
			$("#matchProductTemplate").tmpl(params).appendTo(".product_match_list");
	}
	
	fnPrdDetail = function(prdCd) {
		$.ajax({
			type: "post",
			url: "<c:out value="${serverDomain}"/>/am/marketing/getBasicProductAjax.do",
			data: {"PRD_MST_CD": prdCd},			
			async: false,
			success: function(data) {
				console.log(data.resultMap);
				var productInfo 	= data.resultMap.productInfo		// 상품 정보
		        var mustOptionList	= data.resultMap.mustOptionList		// 상품 필수 옵션 리스트
		        var addOptionList	= data.resultMap.addOptionList		// 상품 추가 옵션 리스트
				var tagList 		= data.resultMap.tagList; 			// 태그 설정
				var productNfiInfo	= data.resultMap.productNfiInfo		// 상품고시

				// 펀딩가격
				$("#PRD_MST_UNT").val(productInfo.PRD_MST_UNT).prop("selected", true);
				$("#PRD_MST_SALE_RATE").val(productInfo.PRD_MST_SALE_RATE);
				fnSetPrice();

				// 태그
				$("#representTag").find("option").remove();
				var chkYn = "";
				for (var i = 0; i < tagList.length; i++) {
					if ("Y" == $.trim(tagList[i].TAG_BND_REP)){
						chkYn = "selected";
					}else {
						chkYn = "";
					}
					$(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + tagList[i].TAG_MST_ID +'">' + tagList[i].TAG_MST_TITLE + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + tagList[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
					$("#representTag").append('<option value="' + tagList[i].TAG_MST_ID + '"name="'+ tagList[i].TAG_MST_ID +'" ' + chkYn + '>'+ tagList[i].TAG_MST_TITLE + '</option>');
				}
			},
			error : function (err)
	        {
            	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	        }
		});
	}
    
});

//태그 선택 버튼 클릭 이벤트
$(document).on("click", ".btn_tag_select",function() {
	popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
});

fnResultTag = function(params) {
	$(".tag_cloud_list").children().remove()
	$("#representTag").find("option").remove();
	for (var i = 0; i < params.length; i++) {
		$(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
		$("#representTag").append('<option value="' + params[i].TAG_MST_ID + '"name="'+ params[i].TAG_MST_ID +'">'+ params[i].value + '</option>');
	}
}

$(document).on("click", ".btn_del", function() {
	var tagLangth = $('.tag_cloud_list > li').length;
	if (tagLangth <= 1) {
		$('.tag_cloud_wrap_side').siblings('.txt_warnning').show();
		$("#representTag").append('<option value="선택" selected>선택</option>');
	}
	var origin = $(this).parent();
	$('.tag_cloud_list li').each(function(index, item) {
		if ($(this).attr('value') == origin.attr('value')) {
			$(this).remove();
			$("#representTag option:eq(" + index + ")").remove();
			return false;
		}
	})
});



//-->
</script>

</body>
</html>
