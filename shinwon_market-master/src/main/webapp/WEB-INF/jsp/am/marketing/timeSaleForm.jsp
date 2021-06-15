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

                <h2 class="title"><span>타임세일</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
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
	                    		<th><label class="label"><span>타임세일구분<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" class="radio" value="G" name="TIM_SAL_TYPE" id="normal" checked="checked">
	                    			<label for="normal">일반</label>
	                    			<input type="radio" class="radio" value="T" name="TIM_SAL_TYPE" id="timeSale">
	                    			<label for="timeSale">타임세일</label>
	                    		</td>
	                        </tr>
	                    	<tr>
	                    		<th><label class="label"><span>타임세일상품<i class="require"><em>필수입력</em></i></span></span></label></th>
	                    		<td>
	                    			<input type="text" class="text normalSearch" id="normalProductCode" name="normalProductCode" style="width:20%" readonly/>&nbsp;
									<input type="text" class="text normalSearch" id="normalProductName" name="normalProductName" style="width:50%" readonly/>
									<a href="javascript:searchProductPopup('normal');" class="button small search-product-popup normalSearch" id="normalSearch" title="새 창 으로 열립니다."><span>상품검색</span></a>
								
									<div id="productButton" class="grid section-button-search left"><!-- section button -->
			                            <a href="#none" id="goProductDelete" class="button button-a small"><span>선택삭제</span></a>
			                            <a href="javascript:searchProductPopup('timeSale');" class="button small search-product-popup" title="새 창 으로 열립니다." id="timeSaleSearch"><span>상품검색</span></a>
			                        </div><!-- // section button -->
			                        <table id="productTable" class="table-row table-a section-form">
			                            <colgroup>
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                            </colgroup>
			                            <thead>
			                                <tr>
			                                    <th rowspan="2"><input type="checkbox" class="checkbox checkAllSpec_P"></th>
			                                    <th rowspan="2">상품코드</th>
			                                    <th rowspan="2">이미지</th>
			                                    <th rowspan="2">상품명</th>
			                                    <th rowspan="2">브랜드</th>
			                                    <th>할인율</th>
			                                    <th>상품재고</th>
			                                    <th rowspan="2">전시순서</th>
			                                </tr>
			                                <tr>
			                                    <th>판매가</th>
			                                    <th>전시상태</th>
			                                </tr>
			                            </thead>
			                            <tbody class="applyProductList">
											<tr class="productNodata">
												<td colspan="8" class="text-center">상품을 검색해주세요.</td>
											</tr>
			                            </tbody>
			                        </table>
	                    		</td>
	                        </tr>
	                        <tr>
	                            <th><label class="label"><span>적용일자/시간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="TIM_SAL_ST_DT" name="TIM_SAL_ST_DT" readonly="readonly" data-target-end="#TIM_SAL_ED_DT"/>
	                               	<select id="TIM_SAL_ST_HH" name="TIM_SAL_ST_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }">${hour }</option>
									</c:forEach>
									</select> 시
									<select id="TIM_SAL_ST_MM" name="TIM_SAL_ST_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }">${minute }</option>
									</c:forEach>
									</select> 분 ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="TIM_SAL_ED_DT" name="TIM_SAL_ED_DT"  readonly="readonly" data-target-start="#TIM_SAL_ST_DT"/>
									<select id="TIM_SAL_ED_HH" name="TIM_SAL_ED_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <c:if test="${status.last}">selected</c:if>>${hour }</option>
									</c:forEach>
									</select> 시
									<select id="TIM_SAL_ED_MM" name="TIM_SAL_ED_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <c:if test="${status.last}">selected</c:if>>${minute }</option>
									</c:forEach>
									</select> 분
	                            </td>
	                        </tr>

	                        <tr class="normalSearch">
	                    		<th><label class="label"><span>상품가격</span></label></th>
	                    		<td>
	                    			<input type="text" class="text" id="PRD_MST_PRC" disabled>
	                    		</td>
	                        </tr>
	                        <tr class="normalSearch">
	                    		<th><label class="label"><span>할인율<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select class="select" name="TIM_PRD_MST_UNT" id="TIM_PRD_MST_UNT">
	                    				<option value="R" selected>정률(%)</option>
	                    				<option value="S">정액(%)</option>
	                    			</select>
	                    			<input type="number" class="text large" id="TIM_PRD_MST_SALE_RATE" name="TIM_PRD_MST_SALE_RATE">
	                    		</td>
	                        </tr>
	                        <tr class="normalSearch">
	                    		<th><label class="label"><span>판매가</span></label></th>
	                    		<td>
                                    <input type="text" class="text" id="saledPrice" disabled>
	                    			<!-- <span id="PRD_MST_PRC2"><fmt:formatNumber value="${info.ERP_MST_SELL_PRC }" groupingUsed="true" /></span>원 / <span id="PRD_MST_ORD_PRC"><fmt:formatNumber value="${info.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></span>원   -->
	                    		</td>
	                        </tr>
	                        <tr class="normalSearch">
	                    		<th><label class="label"><span>상품재고</span></label></th>
	                    		<td>
                                    <input type="text" class="text" id="TIM_SAL_PRD_CNT" disabled>
	                    			<!-- <span id="PRD_MST_SEL_CNT">상품을 선택하여 주십시오.</span>   -->
	                    		</td>
	                        </tr>

	                        <tr>
	                    		<th><label class="label"><span>타임세일제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text xlarge" id="TIM_SAL_NM" name="TIM_SAL_NM" style="width:80%;" maxlength="20"/> (20자이내)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>사용유무<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select id="TIM_SAL_USE_YN" name="TIM_SAL_USE_YN" class="select" title="사용유무">
			    						<option value="Y" selected="selected">사용</option>
			    						<option value="N">미사용</option>
	    							</select>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                

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
				
				</form>

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

<script id="productTemplate" type="text/x-jquery-tmpl">
<tr data-num="\${CNT_DTL_ORDER}">
	<input type="hidden" name="PRD_MST_CD" value="\${PRD_MST_CD}">
    <td rowspan="2"><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
    <td rowspan="2"><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="CNT_PRD_MST_CD" name="CNT_PRD_MST_CD_\${PRD_MST_CD}" value="\${PRD_MST_CD}"/></td>
	<td rowspan="2"><span class="thumbnail_img"><img src="\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></span></td>
    <td rowspan="2" class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
    <td rowspan="2">\${BND_MST_BRAND_NM}</td>
    <td>
		<select class="select" name="TIM_PRD_MST_UNT_\${PRD_MST_CD}" data-prd_mst_prc="\${PRD_MST_PRC}" data-prd_mst_cd="\${PRD_MST_CD}">
			<option value="R">정율(%)</option>
			<option value="S">정액(%)</option>
		</select>
		<input type="number" class="text saledPrice" name="TIM_PRD_MST_SALE_RATE_\${PRD_MST_CD}">
	</td>
    <td name="TIM_SAL_PRD_CNT">\${PRD_MST_SEL_CNT}</td>
    <td rowspan="2">
		<c:if test="${row.CNT_DTL_ORDER ne 1 }">
        <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.CNT_DTL_ORDER ne fn:length(list) }">
 		<a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="CNT_DTL_ORDER_\${PRD_MST_CD}" value="\${CNT_DTL_ORDER}"></input>
    </td>
</tr>
<tr data-num="\${CNT_DTL_ORDER}">
	<td><input type="text" class="text xlarge calcAmt" id="\${PRD_MST_CD}" disabled></td>
	<td>\${PRD_MST_DPL_STATE}</td>
</tr>
</script>

<script>
$(function(){
	$("#productButton, #productTable").hide();
	
	// 폼체크
    $("#frm").validate({
        rules: {
        	PRD_MST_CD : { required:true },
        	TIM_SAL_NM : { required:true },
        	TIM_SAL_ST_DT : { required:true },
        	TIM_SAL_ST_HH : { required:true },
        	TIM_SAL_ST_MM : { required:true },
        	TIM_SAL_ED_DT : { required:true },
        	TIM_SAL_ED_HH : { required:true },
        	TIM_SAL_ED_MM : { required:true },
        	TIM_SAL_PRD_CNT : { required:true }
        }
    });

    // 저장 이벤트
    $(document).on("click", "#goRegist", function ()
    {
        var $frm = $("#frm");
        if($frm.valid()){
        	if($("input:radio[name='TIM_SAL_TYPE']:checked").val() == "G"){
        		//일반 일때
        		if($("#normalProductCode").val() == ""){
        			alert("상품을 선택해 주십시오.");
        			$("#normalProductCode").focus();
        			return;
        		}
        		
        		if($("#TIM_PRD_MST_SALE_RATE").val() == ""){
        			alert("할인율을 입력해 주십시오.");
        			$("#TIM_PRD_MST_SALE_RATE").focus();
        			return;
        		}
        	} else {
        		//타임세일 일때
        		if($(".applyProductList").children("tr").length <= 1){
        			alert("상품을 선택해 주십시오.");
        			$("#timeSaleSearch").focus();
        			return;
        		}
        		
        		var chkList = false;
        		$(".applyProductList").children("tr").each(function() {
                    if($(this).find(".saledPrice").val() == "") {
            			alert("할인율을 입력해 주십시오.");
            			$(this).find(".saledPrice").focus();
            			chkList = true;
            			return false;
                    }
                });

        		if(chkList){
        			return;
        		}
        	}

        	var dt = $("#TIM_SAL_ST_DT").val()+$("#TIM_SAL_ST_HH").val()+$("#TIM_SAL_ST_MM").val();
        	var stDt = $("#TIM_SAL_ST_DT").val();
        	var edDt = $("#TIM_SAL_ED_DT").val();
        	var sthhmm = $("#TIM_SAL_ST_HH").val()+$("#TIM_SAL_ST_MM").val();
        	var edhhmm = $("#TIM_SAL_ED_HH").val()+$("#TIM_SAL_ED_MM").val();
        	var today = getToday();

        	if(dt < today)
        	{
        		alert("적용일자시간은 현재시간 이후여야 합니다.");
    			$("#TIM_SAL_ST_DT").focus();
    			return;
        	}

        	if(stDt > edDt)
        	{
        		alert("적용종료일은 시작일보다 커야 합니다.");
    			$("#TIM_SAL_ED_HH").focus();
    			return;
        	}

        	if(sthhmm >= edhhmm)
        	{
        		alert("적용 종료시간은 시작시간보다 커야 합니다.");
    			$("#TIM_SAL_ED_HH").focus();
    			return;
        	}
        	
        	if($(".tag_cloud_list").children().length <=0 ){
        		alert("TAG을 선택해 주십시오.");
    			$(".tag_cloud_list").focus();
    			return;
        	}

            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/timeSaleRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });


    // 목록 이벤트
    $(document).on("click", "#goList", function ()
    {
        var $frm = $("#searchForm");
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/timeSaleList.do", "target":"_self", "method":"post"}).submit();
    });

    getToday = function ()
    {
    	var dateObj = new Date();
    	var year = dateObj.getFullYear();
    	var month = dateObj.getMonth()+1;
    	if(month < 10)month = "0"+month;
    	var day = dateObj.getDate();
    	if(day < 10)day = "0"+day;

    	var hour = dateObj.getHours();
    	if(hour < 10)hour = "0"+hour;
    	var min = dateObj.getMinutes();
    	if(min < 10)min = "0"+min;

    	var today = year +"-"+ month +"-"+ day+hour+min;
    	return today;
    };
    
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
        
        if(caller == 'normal'){ //일반 타임세일
            //기본TR삭제
            $(".productNodata").remove();
        
			if(params.length > 1){
				alert('상품을 1개 이하로 선택하여 주십시오.');
				return;
			}	
        	if(params.length == 1){
        		var curData = params[0];
        		$('input[name=normalProductCode]').val(curData.PRD_MST_CD);
        		$('#normalProductName').val(setComma(curData.PRD_MST_NM));
        		$('#PRD_MST_PRC').val(curData.PRD_MST_PRC);
        		$('input[name=TIM_PRD_MST_SALE_RATE]').val(curData.TIM_PRD_MST_SALE_RATE);
        		$('#TIM_SAL_PRD_CNT').val(setComma(curData.PRD_MST_SEL_CNT));
        	}
        	
        }else if(caller == 'timeSale'){ //타임세일 타입
            //기본TR삭제
            $(".productNodata").remove();
        
			//배열재정의
            var arrayObj = new Array();
            var len = $productBox.find(".applyProductList .CNT_PRD_MST_CD").length;

            var obj;
            if( bCheck ){

                $.each(params, function(index,item){
                    len++;
                    obj = new Object();
                    obj.PRD_MST_CD              = item.PRD_MST_CD;
                    obj.PRD_MST_NM          = item.PRD_MST_NM;
                    obj.PRD_MST_PRC         = item.PRD_MST_PRC;
                    obj.PRD_MST_DLV_FEE     = setComma(item.PRD_MST_DLV_FEE);
                    obj.PRD_MST_SEL_STATE       = item.PRD_MST_SEL_STATE;
                    obj.PRD_MST_VDR_NM            = item.PRD_MST_VDR_NM;
                    obj.CNT_DTL_ORDER            = len;
    				obj.PRD_NOW_DST_PRICE	=	setComma(item.PRD_NOW_DST_PRICE);
    				obj.PRD_IMAGE = item.PRD_IMAGE;
    				obj.PRD_IMAGE_ALT = item.PRD_IMAGE_ALT;
    				obj.BND_MST_BRAND_NM = item.BND_MST_BRAND_NM;
    				obj.PRD_MST_DPL_STATE = item.PRD_MST_DPL_STATE;
    				obj.PRD_MST_SEL_CNT = item.PRD_MST_SEL_CNT;
    				obj.PRD_NOW_DST_PRICE = item.PRD_NOW_DST_PRICE;
                    obj.PRD_MST_SALE_RATE = item.PRD_MST_SALE_RATE;
                    if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
                    {
                        obj.PRD_MST_SEL_STATE_CLASS = "b";
                    }
                    else
                    {
                        obj.PRD_MST_SEL_STATE_CLASS = "a";
                    }

                    if ( item.PRD_MST_CNL_PC_YN == 'Y' && item.PRD_MST_CNL_MB_YN == 'Y' )
                    {
                        obj.PRD_MST_CHANNEL_TYPE = "전체";
                    }
                    else if ( item.PRD_MST_CNL_PC_YN == 'Y' )
                    {
                        obj.PRD_MST_CHANNEL_TYPE = "PC";
                    }
                    else if ( item.PRD_MST_CNL_MB_YN == 'Y' )
                    {
                        obj.PRD_MST_CHANNEL_TYPE = "MOBILE";
                    }

                    obj.FRONT_URL = '<c:out value="${frontDomain}" />';

                    obj.serverDomain            = '<c:out value="${serverDomain}" />';


                    arrayObj.push(obj); //만들어진  object를 배열에 추가
                });
                $( "#productTemplate" ).tmpl( arrayObj ).appendTo($(".applyProductList"));
            }
        }
        
        return true;
    };
    
	// 상품 삭제 이벤트
	$(document).on("click", "#goProductDelete", function () {

        var $topParent = $(this).parents("td");
        if($topParent.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 상품을 선택하여 주십시오.");
            return;
        }

        var chkNum = 0;
        $topParent.find(".applyProductList").children("tr").each(function() {

            if($(this).find(".checkRow").is(":checked"))
            {
            	chkNum = $(this).data("num");
				$(this).remove();
				//$(this).find("tr").remove();
            } else if(chkNum == $(this).data("num")){
				$(this).remove();
            }
        });
        
        //사용상품 삭제시 순서 재배치
        var index = 1;
        $topParent.find(".applyProductList").children("tr").each(function() {
        	if($(this).children().length >=9){
	        	$(this).children()[8].children[2].value = index++;
        	}
        });

        if($topParent.find(".applyProductList").children("tr").length == 0)
        {
            $topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAll").prop("checked", false);

    });
    
    $(document).on("click", "#timeSale", function () 
	{
    	$(".normalSearch").hide();
    	productSearchShow();
	});
    
	$(document).on("click", "#normal", function () 
	{
		$(".normalSearch").show();
		productSearchHide();
	});
	
});

function calcSaledPriceWithRate(price, rate){
	return price - (price*(rate/100)); 
}

function calcSaledPriceWithAmount(price, amount){
	return price - amount;
}

function productSearchHide()
{
    $("#productButton, #productTable").hide();
}
function productSearchShow()
{
    $("#productButton, #productTable").show();
}
//일반 타임세일 판매가 계산
$(document).on("change", "#TIM_PRD_MST_SALE_RATE", function(){
	var value = parseFloat($(this).val());
	var saleUnit = $("#TIM_PRD_MST_UNT").val();
	var prdMstPrc = $("#PRD_MST_PRC").val();
	var result = 0;
	if(saleUnit == 'R'){
		 result = calcSaledPriceWithRate(parseFloat(prdMstPrc), value );
	}
	else{
		result = calcSaledPriceWithAmount(parseFloat(prdMstPrc), value );
	}
	$("#saledPrice").val(result);
});

//타임스페셜 판매가 계산
$(document).on("change", ".saledPrice", function(){
	var value = parseFloat($(this).val());
	var saleUnit = $(this).parent().find("select").val();
	var prdMstPrc = $(this).parent().find("select").data("prd_mst_prc");
	var prdMstCd = $(this).parent().find("select").data("prd_mst_cd");
	var result = 0;
	if(saleUnit == 'R'){
		 result = calcSaledPriceWithRate(parseFloat(prdMstPrc), value );
	}
	else{
		result = calcSaledPriceWithAmount(parseFloat(prdMstPrc), value );
	}	
	$("#"+prdMstCd).val(result);	
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


function moveUp(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소

	var index = $(el).parent().children()[2].value
	$tr.prev().children()[7].children[2].value =index;
	$(el).parent().children()[2].value = --index;
	
	$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
}

function moveDown(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var index = $(el).parent().children()[2].value
	$tr.next().children()[7].children[2].value =index;
	$(el).parent().children()[2].value = ++index;
	$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
}


//-->
</script>

</body>
</html>
