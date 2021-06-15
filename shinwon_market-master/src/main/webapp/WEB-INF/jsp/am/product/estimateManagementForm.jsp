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

                <h2 class="title"><span>견적관리</span></h2>

                <div class="push-guide instant"><!-- push-guide -->
                    <i class="icon"><!-- icon --></i>
                    <h3 class="title"><span>기본정보</span></h3>
                </div><!-- // push-guide -->
				
				<form id="searchForm" name="searchForm">
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchEsmMstType" value="<c:out value="${commandMap.searchEsmMstType }"/>"/>
	                <input type="hidden" name="searchEsmMstMemNm" value="<c:out value="${commandMap.searchEsmMstMemNm }"/>"/>
	                <input type="hidden" name="searchEsmMstMemId" value="<c:out value="${commandMap.searchEsmMstMemId }"/>"/>
	                <input type="hidden" name="searchEsmMstHp1" value="<c:out value="${commandMap.searchEsmMstHp1 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp2" value="<c:out value="${commandMap.searchEsmMstHp2 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp3" value="<c:out value="${commandMap.searchEsmMstHp3 }"/>"/>
	                <input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>"/>
                </form>
                
                <form id="frm" name="frm">
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                <input type="hidden" name="searchEsmMstType" value="<c:out value="${commandMap.searchEsmMstType }"/>"/>
	                <input type="hidden" name="searchEsmMstMemNm" value="<c:out value="${commandMap.searchEsmMstMemNm }"/>"/>
	                <input type="hidden" name="searchEsmMstMemId" value="<c:out value="${commandMap.searchEsmMstMemId }"/>"/>
	                <input type="hidden" name="searchEsmMstHp1" value="<c:out value="${commandMap.searchEsmMstHp1 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp2" value="<c:out value="${commandMap.searchEsmMstHp2 }"/>"/>
	                <input type="hidden" name="searchEsmMstHp3" value="<c:out value="${commandMap.searchEsmMstHp3 }"/>"/>
	                <input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>"/>
	                <input type="hidden" name="ESM_MST_PRD_CHANGE_YN" id="ESM_MST_PRD_CHANGE_YN" value="Y"/>
	                <input type="hidden" name="ESM_MST_ADV_TYPE" id="ESM_MST_ADV_TYPE" value="1932"/>
	                <input type="hidden" name="ESM_MST_QST_TYPE" id="ESM_MST_QST_TYPE" value=""/>
	                <input type="hidden" name="EMS_MST_OPN_YN" id="EMS_MST_OPN_YN" value="Y"/>
                
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>구분 <i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <c:choose>
										<c:when test="${not empty codeList}">
											<select name="ESM_MST_TYPE" id="ESM_MST_TYPE" class="select">
		    	                            <c:forEach var="emsType" items="${codeList}" varStatus="status">
												<option value="${emsType.CMN_COM_IDX}"> <c:out value="${emsType.CMN_COM_NM}" /></option>
		                        		    </c:forEach>
		                        		    </select>
	                       	    		</c:when>
	                       	    	</c:choose>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>사용여부</span></th>
	                            <td>
	                                <input type="radio" class="radio" name="ESM_MST_USE_YN" id="ESM_MST_USE_YN1" value="Y" checked=true />
		                            <label for="ESM_MST_USE_YN1">사용</label>
		                            <input type="radio" class="radio" name="ESM_MST_USE_YN" id="ESM_MST_USE_YN2" value="N" />
		                            <label for="ESM_MST_USE_YN2">미사용</label>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>견적번호</span></th>
	                            <td>
	                                자동생성
	                            </td>
	                        </tr>
	                        <tr>
								<th><span>신청자명/ID <i class="require"><em>필수입력</em></i></span></th>
								<td>
									<input type="text" name="ESM_MST_MEM_NM" id="ESM_MST_MEM_NM" class="text" maxlength=30 /> / <input type="text" name="ESM_MST_MEM_ID" id="ESM_MST_MEM_ID" class="text" maxlength=20 />
									<a href="javascript:;" id="memberPopup" class="button small"><span>회원검색</span></a>
								</td>
							</tr>
	                        <tr><!-- row -->
	                            <th><span>휴대폰 <i class="require"><em>필수입력</em></i></span></th>
								<td>
									<c:choose>
										<c:when test="${not empty hpList}">
											<select name="ESM_MST_HP1" id="ESM_MST_HP1" class="select">
		    	                            <c:forEach var="hpList" items="${hpList}" varStatus="status">
												<option value="${hpList.CMN_COM_IDX}"> <c:out value="${hpList.CMN_COM_NM}" /></option>
		                        		    </c:forEach>
		                        		    </select>
	                       	    		</c:when>
	                       	    	</c:choose>
	                       	    	<input type="text" name="ESM_MST_HP2" id="ESM_MST_HP2" class="text number" maxlength=4 /> - 
	                       	    	<input type="text" name="ESM_MST_HP3" id="ESM_MST_HP3" class="text number" maxlength=4 />
								</td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>이메일 <i class="require"><em>필수입력</em></i></span></th>
								<td>
									<input type="text" name="ESM_MST_MAIL" id="ESM_MST_MAIL" class="text" maxlength=100 />
								</td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>문의사항 <i class="require"><em>필수입력</em></i></span></th>
								<td>
									<c:choose>
										<c:when test="${not empty qstList}">
										<c:set var="listNum" value="1" />
		    	                            <c:forEach var="qstList" items="${qstList}" varStatus="status">
												<input type="checkbox" class="checkbox" id="ESM_MST_QST_TYPE_${qstList.CMN_COM_IDX}" name="esmmstqsttype" value="${qstList.CMN_COM_IDX}" /><label for="ESM_MST_QST_TYPE_${qstList.CMN_COM_IDX}" > ${qstList.CMN_COM_NM}</label>
											<c:set var="listNum" value="${listNum + 1}" />
		                        		    </c:forEach>
	                       	    		</c:when>
	                       	    	</c:choose>
								</td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>내용 <i class="require"><em>필수입력</em></i></span></th>
								<td>
									<textarea name="ESM_MST_QST" id="ESM_MST_QST" maxlength=4000></textarea>
								</td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>상품대체</span></th>
								<td>YES</td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>상담방법</span></th>
								<td>온라인</td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            
		            <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>MD 견적 사항</span></h3>
	                </div><!-- // push-guide -->
	                
	                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
	                    <a href="#none" id="goProductDelete" class="button small"><span>선택삭제</span></a>
						<a href="#none" id="goProductAdd" class="button small" title="새 창 으로 열립니다."><span>상품검색</span></a>
	                </div><!-- // 검색 하단 버튼 -->
	                
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
                        	<col style="width: 5%;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 5%;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 15%;" />
	                        <col style="width: 15%;" />
	                    </colgroup>
	                    <thead>
                            <tr>   
                            	<th scope="col"><input type="checkbox" class="checkbox checkAll" /></th>
                            	<th scope="col">상품코드<br /><small>(기간계코드)</small></th>
                                <th scope="col">상품명</th>
                                <th scope="col">옵션</th>
                                <th scope="col">수량</th>
                                <th scope="col">판매가</th>
                                <th scope="col">상품가격</th>
                                <th>MD견적가</th>
                            </tr>
                        </thead>
	                    <tbody id="applyProductList">
                            <tr id="productNodata">
                                 <td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                            </tr>
                        </tbody>
                        <tfoot>
	                        <tr>
	                        	<th scope="row" colspan="6" class="text-right pr20"><span>합계</span></th>
	                        	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" /></td>
	                        	<td>
	                        		<input type="text" class="text" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="<fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" />" disabled=true/>
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<th scope="row" colspan="6" class="text-right pr20"><span>견적희망가격(할인율: <c:out value="${estimateInfo.ESM_MST_TOT_PRICE }" />%)</span></th>
	                        	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></td>
	                        	<td>
	                        		
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<th scope="row" colspan="6" class="text-right pr20"><span>MD 견적합계(할인율: <strong id="mdDiscount" class="primary"><c:out value="${estimateInfo.ESM_MST_TOT_PRICE }" /></strong>%)</span></th>
	                        	<td><fmt:formatNumber value="${estimateInfo.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></td>
	                        	<td>
	                        		<input type="text" class="text" name="ESM_MST_WSH_TOT_PRICE" id="ESM_MST_WSH_TOT_PRICE" value="<fmt:formatNumber value="${estimateInfo.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" />" disabled=true />
	                        	</td>
	                        </tr>
                        </tfoot>
	                </table><!-- // table -->
	                
               		<table class="table-row table-a">
               			<col style="width: 15%;" />
               			<col style="width: 20%;" />
               			<col style="width: 15%;" />
               			<col style="width: auto;" />
               			<tbody>
               				<tr>
               					<th><span>고객구매결정</span></th>
               					<td>
               						<input type="radio" class="radio" name="ESM_PCH_MEM_BUY_YN" id="ESM_PCH_MEM_BUY_YN1" value="N" checked=true /><label for="ESM_PCH_MEM_BUY_YN1"><span>구매 미결정</span></label>
               						<input type="radio" class="radio" name="ESM_PCH_MEM_BUY_YN" id="ESM_PCH_MEM_BUY_YN2" value="Y" /><label for="ESM_PCH_MEM_BUY_YN2"><span>구매 결정</span></label>
               					</td>
               					<th><span>MD구매승인</span></th>
               					<td height="30">
               						<input type="radio" class="radio" name="ESM_PCH_MD_BUY_YN" id="ESM_PCH_MD_BUY_YN1" value="N" checked=true /><label for="ESM_PCH_MD_BUY_YN1"><span>구매 미승인</span></label>
               						<input type="radio" class="radio" name="ESM_PCH_MD_BUY_YN" id="ESM_PCH_MD_BUY_YN2" value="Y" /><label for="ESM_PCH_MD_BUY_YN2"><span>구매 승인</span></label>
               						<span id="getDate" style="display:none;">
               							<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
			                			<input type="text" name="StartDate" id="StartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#EndDate"/> ~
			                			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
			                         	<input type="text" name="EndDate" id="EndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#StartDate"/>
               						</span>
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
<tr>
	<td>
		<input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/>
		{{if OPT_PRD_MST_CNT == 0}}
		<input type="hidden" name="ESM_PRD_CD" id="ESM_PRD_CD" value="\${PRD_MST_CD}" />
		{{/if}}
		<input type="hidden" name="PRD_MST_PRC" id="PRD_MST_PRC" value="\${PRD_MST_PRC3}" />
		<input type="hidden" name="OPT_EST_CNTs" id="OPT_EST_CNTs" value="\${OPT_EST_CNT}" />
	</td>
	<td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" name="APPLY_IDXs" value="\${PRD_MST_CD}"/></td>
	<td>
		\${PRD_MST_NM}
	</td>
	<td colspan=5>
		<table class="table-row table-b" style="border-top:0px;">
			<colgroup>
			<col style="width: auto;" />
			<col style="width: auto;" />
			<col style="width: auto;" />
			<col style="width: auto" />
			<col style="width: auto;" />
			</colgroup>
			<tbody>
				{{html OPT_LOC_TXT}}
			</tbody>
		</table>
	</td>
</tr>
</script>

<script>
$(function(){
	// 폼체크
    $("#frm").validate({
        rules: {
        	ESM_MST_MEM_NM : { required:true },  				  // 신청자명 
        	ESM_MST_MEM_ID : { required:true },                // 신청자ID
        	ESM_MST_HP2 : { required:true },                // 핸드폰 두번째
        	ESM_MST_HP3 : { required:true },                // 핸드폰 마지막
        	ESM_MST_MAIL : { required:true,email:true },                // 이메일
        	ESM_MST_QST : { required:true }                // 내용
        },
        messages: {
        	ESM_MST_MEM_NM: { required: "신청자명은 필수입력입니다."},
        	ESM_MST_MEM_ID: { required: "신청자ID는 필수입력입니다."},
        	ESM_MST_HP2: { required: "휴대폰 중간자리는 필수입력입니다."},
        	ESM_MST_HP3: { required: "휴대폰 마지막자리는 필수입력입니다."},
        	ESM_MST_MAIL: { required: "이메일은 필수입력입니다."},
        	ESM_MST_QST: { required: "문의내용은 필수입력입니다."}
        }
    });
	
	//체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");
    fnDateSet('EndDate', 'StartDate', 0, 0, 3, 0, 0, 0,  '-');
	
    $(document).on("focusout",".wshPrice",function(){
		var totalPrice = 0;
		var mdPrice = 0;
		var mdDiscount = 0;
		
		$("input[name=ESM_PRD_WSH_PRICE]").each(function(){
			if(getInt($(this).val()) != "" && getInt($(this).val()) > 0){
				totalPrice = parseInt(totalPrice) + parseInt(getInt($(this).val()));
			}
		});
		
		$("input[name=ESM_PRD_ESM_PRICE]").each(function(){
			if(getInt($(this).val()) != "" && getInt($(this).val()) > 0){
				mdPrice = parseInt(mdPrice) + parseInt(getInt($(this).val()));
			}
		});
	
		//$("#ESM_MST_ESM_TOT_PRICE").val(setComma(parseInt(mdPrice)));
		$("#ESM_MST_WSH_TOT_PRICE").val(setComma(parseInt(mdPrice)));
		mdDiscount = ((parseInt(totalPrice)-parseInt(mdPrice)) / parseInt(totalPrice)) * 100;
		$("#mdDiscount").html(Math.round(mdDiscount.toFixed(3)*100)/100 + "% / " + setComma(mdPrice - totalPrice) + "원");
	});
	
	// 상품검색 
    $(document).on("click", "#goProductAdd", function () 
    {	
    	popup('',"1100","900","no","_ProductEsmPopup");
   		$("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductEsmPopup.do", "target":"popup_ProductEsmPopup", "method":"post"}).submit();

    });	
	
  	//상품 중복체크
    fnDuplicationChk = function( selectObj , selectObjOpt ){
		var bReturn = true;
		var optChkLen = 0;
    	var $obj = $("#applyProductList input[name='PRD_MST_CDs']");
    	var $objOpt = $("#applyProductList input[name='OPT_DTL_IDXs']");
		/* 하단 스크립트는 같은 상품코드의 다중옵션의 경우 모두 같은 옵션만 제어 하는 스크립트 */
		/* 해당 부분을 수정 하려면 impl단 및 폼의 전송 데이터의 로직도 수정해야댐  */
    	//var $objTr = $("#applyProductList tr");
		
		/* $.each($objTr, function(idx){
			var $obj = $(this).find("input[name='PRD_MST_CDs']");
			var $objOpt = $(this).find("input[name='OPT_DTL_IDXs']");
			
			if($obj.val() != undefined){
				if( selectObj == $obj.val() ){
					if(selectObjOpt.indexOf(",") > 0){//옵션이 배열일 경우
						var aryObjOpt = selectObjOpt.split(",");
						for(i = 0; i < aryObjOpt.length; i++){
	    					if(aryObjOpt[i] != ""){
	    						$.each($objOpt, function(){
	    							if( aryObjOpt[i] == $(this).val() ){
	    								optChkLen ++;
	            		    		}
	            		    	});
	    						//선택한 상품의 옵션이 모두 같을 경우 담기지 않음
	    						if(optChkLen == aryObjOpt.length){
	    							bReturn = false;
	        		    			return false;
	    						}
	    					}
	    				}
						optChkLen = 0;//초기화
					}else{
	    				if(selectObjOpt != ""){
	        	    		$.each($objOpt, function(){
	        	    			if( selectObjOpt == $(this).val() ){
	        		    			bReturn = false;
	        		    			return false;
	        		    		}
	        		    	});
	        	    	}
	    			}
				}
			}
		}); */
		
    	$.each($obj, function(){
    		if( selectObj == $(this).val() ){
    			if(selectObjOpt.indexOf(",") > 0){
    				var aryObjOpt = selectObjOpt.split(",");
    				for(i = 0; i < aryObjOpt.length; i++){
    					if(aryObjOpt[i] != ""){
    						$.each($objOpt, function(){
    							if( aryObjOpt[i] == $(this).val() ){
            		    			bReturn = false;
            		    			return false;
            		    		}
            		    	});
    					}
    				}
    			}else{
    				if(selectObjOpt != ""){
        	    		$.each($objOpt, function(){
        	    			if( selectObjOpt == $(this).val() ){
        		    			bReturn = false;
        		    			return false;
        		    		}
        		    	});
        	    	}
    			}
    			
    		}
    	});
    	return bReturn;
    };
	
  	//상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
    	var bCheck = true;
    	//상품중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationChk( el.PRD_MST_CD , el.OPT_DTL_IDX)){
    			alert("["+el.PRD_MST_CD+"] 상품의 ["+el.PRD_OPT_NM+" : "+el.OPT_DTL_NM+"] 옵션이 있습니다.");
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
    		var totPrice = 0;
    		var trLen = $("#applyProductList").find("tr").not($("table .tdleft").find("tr")).length;
    		
    		$.each(params, function(index,item){
        		
    			obj = new Object();
        		obj.PRD_MST_CD 				= item.PRD_MST_CD;
        		obj.PRD_MST_NM 			= item.PRD_MST_NM;
        		obj.PRD_CTG_PATH 			= item.PRD_CTG_PATH;
        		obj.CMN_BRD_NM 				= item.CMN_BRD_NM;
        		obj.PRD_MST_PRC 	= setComma(item.PRD_MST_PRC);
        		obj.PRD_MST_SCH_PRC      = setComma(item.PRD_MST_SCH_PRC);
        		obj.PRD_MST_PRC2 	= item.PRD_MST_PRC;
        		obj.PRD_MST_SCH_PRC2      = item.PRD_MST_SCH_PRC;
        		obj.PRD_MST_SEL_STATE 		= item.PRD_MST_SEL_STATE;
        		obj.TRLEN 					= trLen;
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
				
        		if($("#ESM_MST_ESM_TOT_PRICE").val() == ""){
					$("#ESM_MST_ESM_TOT_PRICE").val(obj.PRD_MST_PRC);
					$("#ESM_MST_WSH_TOT_PRICE").val(obj.PRD_MST_PRC);
				}else{
					totPrice = parseInt(removeComma($("#ESM_MST_ESM_TOT_PRICE").val())) + parseInt(item.PRD_MST_PRC);
					$("#ESM_MST_ESM_TOT_PRICE").val(setComma(totPrice));
					$("#ESM_MST_WSH_TOT_PRICE").val(setComma(totPrice));
				}
				
				//옵션추가
				obj.OPT_DTL_IDX 				= item.OPT_DTL_IDX.split(",");
				obj.EMS_PRD_CNT 				= item.EMS_PRD_CNT;
				var totalPrice = 0; //총 가격
				var opt_loc_txt_result = "";
				var optSteveHtml = "";
				var optTotalPrice = 0;
				var optEstCnt = 0;
				var optPrdMstCdCnt = 0;
				
				if(item.OPT_DTL_IDX.indexOf(",") > 0){//다중
					var OPT_DTL_IDXs = item.OPT_DTL_IDX.split(",");
					var OPT_DTL_ADD_PRCs = item.OPT_DTL_ADD_PRC.split(",");
					var EMS_PRD_CNTs = item.EMS_PRD_CNT.split(",");
					var PRD_OPT_NMs = item.PRD_OPT_NM.split(",");
					var OPT_DTL_NMs = item.OPT_DTL_NM.split(",");
					var PRD_OPT_EST_YNs = item.PRD_OPT_EST_YN.split(",");
					var OPT_DTL_STK_CNTs = item.OPT_DTL_STK_CNT.split(",");
					for(i = 0; i < OPT_DTL_IDXs.length; i++){
						if(OPT_DTL_IDXs[i] != ""){
							optSteveHtml += "<tr>";
							optTotalPrice = 0;

							if(PRD_OPT_EST_YNs[i] == "Y"){
								optTotalPrice = parseInt(item.PRD_MST_PRC);
								opt_loc_txt_result = "[필수]"
								optEstCnt ++;
							}else{
								opt_loc_txt_result = "[선택]"
							}
							opt_loc_txt_result += PRD_OPT_NMs[i] +" : "+OPT_DTL_NMs[i] ;
							
							if(OPT_DTL_ADD_PRCs[i] != ""){
								opt_loc_txt_result += "<br/>추가가격 : " + setComma(parseInt(OPT_DTL_ADD_PRCs[i]));
								if(OPT_DTL_ADD_PRCs[i] < 0){
									optTotalPrice = optTotalPrice - parseInt(Math.abs(OPT_DTL_ADD_PRCs[i]));
								}else{
									optTotalPrice = optTotalPrice + parseInt(OPT_DTL_ADD_PRCs[i]);
								}
								optSteveHtml += "<td align=center>"+opt_loc_txt_result+"</td>";
							}
							optTotalPrice = optTotalPrice * parseInt(EMS_PRD_CNTs[i]);
							optSteveHtml += "<td><input type=\"text\" class=\"number text\" name=\"EMS_PRD_CNTs\" id=\"EMS_PRD_CNTs\" value="+EMS_PRD_CNTs[i]+" maxlength=9 />";
							optSteveHtml += "<input type=\"hidden\" name=\"OPT_DTL_IDXs\" id=\"OPT_DTL_IDXs\" value="+OPT_DTL_IDXs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"OPT_DTL_STK_CNTs\"id=\"OPT_DTL_STK_CNTs\" value="+OPT_DTL_STK_CNTs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"PRD_OPT_EST_YNs\" id=\"PRD_OPT_EST_YNs\" value="+PRD_OPT_EST_YNs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"OPT_DTL_ADD_PRCs\" id=\"OPT_DTL_ADD_PRCs\" value="+OPT_DTL_ADD_PRCs[i]+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"ADD_PRD_MST_CDs\" id=\"ADD_PRD_MST_CDs\" value="+obj.PRD_MST_CD+" />";
							optSteveHtml += "<input type=\"hidden\" name=\"ESM_PRD_WSH_PRICE\" id=\"ESM_PRD_WSH_PRICE\" value="+optTotalPrice+" />";
							optSteveHtml += "</td>";
							if(i == 0){
								optSteveHtml += "<td rowspan="+OPT_DTL_IDXs.length+">"+setComma(item.PRD_MST_PRC)+"</td>";
							}
							optSteveHtml += "<td><span id=\"spanPrdMstPrc_"+(obj.TRLEN + i)+"\">"+setComma(optTotalPrice)+"</span></td>";
							optSteveHtml += "<td><input type=\"text\" class=\"text wshPrice\" name=\"ESM_PRD_ESM_PRICE\" id=\"ESM_PRD_ESM_PRICE\" value="+setComma(optTotalPrice)+" /></td>";
						}
							
							optSteveHtml += "</tr>";
							opt_loc_txt_result = "";
							totalPrice = totalPrice + optTotalPrice;
					}
				}else{
					if(item.OPT_DTL_IDX != ""){
						if(item.PRD_OPT_EST_YN == "Y"){
							optTotalPrice = parseInt(item.PRD_MST_PRC);
							opt_loc_txt_result = "<td align=center>[필수]"
							optEstCnt ++;
						}else{
							opt_loc_txt_result = "<td align=center>[선택]"
						}
						opt_loc_txt_result += item.PRD_OPT_NM +" : "+item.OPT_DTL_NM ;
						totalPrice = parseInt(item.PRD_MST_PRC);
						if(item.OPT_DTL_ADD_PRC != ""){
							opt_loc_txt_result +="<br/>추가가격 : " + setComma(parseInt(item.OPT_DTL_ADD_PRC));
							obj.OPT_DTL_ADD_PRC = item.OPT_DTL_ADD_PRC;
							if(item.OPT_DTL_ADD_PRC < 0){
								totalPrice = totalPrice - parseInt(Math.abs(item.OPT_DTL_ADD_PRC));
							}else{
								totalPrice = totalPrice + parseInt(item.OPT_DTL_ADD_PRC);
							}
						}
						opt_loc_txt_result += "</td>";
						totalPrice = totalPrice * parseInt(item.EMS_PRD_CNT);
						opt_loc_txt_result += "<td><input type=\"text\" class=\"number text\" name=\"EMS_PRD_CNTs\" id=\"EMS_PRD_CNTs\" value="+item.EMS_PRD_CNT+" maxlength=9 />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_IDXs\" id=\"OPT_DTL_IDXs\" value="+item.OPT_DTL_IDX+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_STK_CNTs\" id=\"OPT_DTL_STK_CNTs\" value="+item.OPT_DTL_STK_CNT+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"PRD_OPT_EST_YNs\" id=\"PRD_OPT_EST_YNs\" value="+item.PRD_OPT_EST_YN+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_ADD_PRCs\" id=\"OPT_DTL_ADD_PRCs\" value="+item.OPT_DTL_ADD_PRC+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ADD_PRD_MST_CDs\" id=\"ADD_PRD_MST_CDs\" value="+obj.PRD_MST_CD+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ESM_PRD_WSH_PRICE\" id=\"ESM_PRD_WSH_PRICE\" value="+totalPrice+" />";
						opt_loc_txt_result += "</td>";
						opt_loc_txt_result += "<td>"+setComma(item.PRD_MST_PRC)+"</td>";
						opt_loc_txt_result += "<td><span id=\"spanPrdMstPrc_"+obj.TRLEN+"\">"+obj.PRD_MST_PRC+"</span></td>";
						opt_loc_txt_result += "<td><input type=\"text\" class=\"text wshPrice\" name=\"ESM_PRD_ESM_PRICE\" id=\"ESM_PRD_ESM_PRICE\" value="+setComma(totalPrice)+" /></td>";
					}
					else{
						opt_loc_txt_result = "<td align=center>옵션없음.</td>";
						obj.OPT_DTL_ADD_PRC = "";
						totalPrice = parseInt(item.PRD_MST_PRC);
						opt_loc_txt_result += "<td><input type=\"text\" class=\"number text\" name=\"EMS_PRD_CNTs\" id=\"EMS_PRD_CNTs\" value=1 maxlength=9 />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"PRD_OPT_EST_YNs\" id=\"PRD_OPT_EST_YNs\" value=\"N\" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_IDXs\" id=\"OPT_DTL_IDXs\" value=\"0\" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"OPT_DTL_ADD_PRCs\" id=\"OPT_DTL_ADD_PRCs\" value=\"0\" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ADD_PRD_MST_CDs\" id=\"ADD_PRD_MST_CDs\" value="+obj.PRD_MST_CD+" />";
						opt_loc_txt_result += "<input type=\"hidden\" name=\"ESM_PRD_WSH_PRICE\" id=\"ESM_PRD_WSH_PRICE\" value="+totalPrice+" />";
						opt_loc_txt_result += "</td>";
						opt_loc_txt_result += "<td>"+setComma(item.PRD_MST_PRC)+"</td>";
						opt_loc_txt_result += "<td><span id=\"spanPrdMstPrc_"+obj.TRLEN+"\">"+obj.PRD_MST_PRC+"</span></td>";
						opt_loc_txt_result += "<td><input type=\"text\" class=\"text wshPrice\" name=\"ESM_PRD_ESM_PRICE\" id=\"ESM_PRD_ESM_PRICE\" value="+setComma(totalPrice)+" /></td>";
					}
					optSteveHtml += "<tr>";
					optSteveHtml += opt_loc_txt_result;
					optSteveHtml += "</tr>";
					opt_loc_txt_result = "";
				}
				
				$("input[name=ESM_PRD_CD]").each(function(){
					if($(this).val() == obj.PRD_MST_CD){
						optPrdMstCdCnt++;
					}
				});

				obj.OPT_LOC_TXT = optSteveHtml;
				obj.OPT_EST_CNT = optEstCnt;
				obj.OPT_PRD_MST_CNT = optPrdMstCdCnt;
				
				obj.PRD_MST_PRC 	= setComma(totalPrice);
				obj.PRD_MST_PRC2 	= totalPrice;
				obj.PRD_MST_SCH_PRC2      = totalPrice;
				obj.PRD_MST_PRC3      = parseInt(item.PRD_MST_PRC);
				obj.PRD_MST_PRC4      = setComma(item.PRD_MST_PRC);
				

        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        		trLen = trLen + 1
        	});
    		$( "#productTemplate" ).tmpl( arrayObj ).appendTo( "#applyProductList" );
    		$("input[name=EMS_PRD_CNTs]").trigger('focusout');
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
        
        //상품가격 재 계산
        var totPrice = 0;
        $("input[name=ESM_PRD_ESM_PRICE]").each(function(){
        	totPrice = parseInt(totPrice) + parseInt($(this).val());
        });
        
        $("#ESM_MST_ESM_TOT_PRICE").val(setComma(totPrice));
		$("#ESM_MST_WSH_TOT_PRICE").val(setComma(totPrice));
        
        if ( $("#applyProductList").children("tr").length == 0 )
        {
        	$("#applyProductList").append('<tr id="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);
        
    });
    
 	// 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	
        	var qstType = "";
        	$frm.find("input[name^=esmmstqsttype]").each(function(){
				if($(this).is(":checked"))
				{
					if(qstType == ""){
						qstType = $(this).val();
					}else{
						qstType += "|" +$(this).val();
					}
				}
        	});
        	
        	if(qstType == "")
        	{
        		alert("문의사항은 한개 이상 필 수 입니다.");
        		return;
        	}
        	
        	if($(".checkRow").length <= 0)
            {
	             alert("[적용상품]상품을 추가해 주십시오.");
	             $("#goProductAdd").focus();
	             productCheck = false;
	             return false;
            }
        	
        	var optResult = false;
        	var optCntFocus = "";
        	
        	$("#EMS_PRD_CNT").each(function(idx){
        		if($(this).val() < 1){
        			optResult = true;
        			optCntFocus = $("#EMS_PRD_CNT").eq(idx);
        			return false;
        		}
        	});
        	
        	if(optResult){
        		alert("옵션수량이 잘못 되었습니다.");
        		optCntFocus.focus();
        		return;
        	}
        	
        	var setMdPrice = true;
        	var setMdFocus = "";
        	
        	$("input[name=ESM_PRD_ESM_PRICE]").each(function(){
    			if($(this).val() == "" || getInt($(this).val()) < 0){
    				setMdPrice = false;
    				setMdFocus = $(this).focus();
    			}
    		});
        	
        	if(setMdPrice == false){
        		alert("MD견적가중 잘못 된 견적가가 있습니다.\n다시 확인해주세요.");
        		setMdFocus;
        		return;
        	}
            
        	$("#ESM_MST_QST_TYPE").val(qstType);
        	if (confirm( "등록 하시겠습니까?")) 
            {
        		$("input[name=ESM_PRD_ESM_PRICE]").each(function(){
                	$(this).val(getInt($(this).val()));
                });
        		$("#ESM_MST_ESM_TOT_PRICE").val(removeComma($("#ESM_MST_ESM_TOT_PRICE").val()));
        		$("#ESM_MST_WSH_TOT_PRICE").val(removeComma($("#ESM_MST_WSH_TOT_PRICE").val()));
        		$("#ESM_MST_ESM_TOT_PRICE").attr("disabled",false);
        		$("#ESM_MST_WSH_TOT_PRICE").attr("disabled",false);
        		
        		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
 	
 	//수량 변경 시 금액 변경
    $(document).on("focusout","input[name=EMS_PRD_CNTs]",function(index){
    	var ems_prd_cnt = $(this).val();
 		var totalPrice = 0;
 		var sumTotalPrice = 0;
 		var price = 0;
 		var idx = $(this).parent("td").parent("tr").parent("tbody").parent("table").parent("td").parent("tr").index();
 		var $this = $(this).parent("td").parent("tr").parent("tbody").parent("table"); 
 		
 		if(ems_prd_cnt < 1){
 			alert("수량이 잘못 입력 되었습니다.");
 			return;
 		}else{
 			$("input[name=EMS_PRD_CNTs]").each(function(idx2){
 				var prdMstPrc = 0;
 	 			var esmPrdCnt = 0;
 	 			var prdOptEstYn = "";
 	 			var addPrdMstCd = "";	
 				var optDtlAddPrc = 0;
 				
 	 			esmPrdCnt = $(this).val();
 				$this = $(this).parent("td").parent("tr").parent("tbody").parent("table").parent("td").parent("tr");
 				$thisTrLen = $(this).parent("td").parent("tr").parent("tbody").find("tr").length;
 				index = $this.index();
 				
 				prdMstPrc = $this.find("input[name=PRD_MST_PRC]").val();
 				prdMstCd = $this.find("input[name=PRD_MST_CDs]").val();
 				prdOptEstYn = $("input[name=PRD_OPT_EST_YNs]").eq(idx2).val();
 				addPrdMstCd = $("input[name=ADD_PRD_MST_CDs]").eq(idx2).val();
 				
 				if($thisTrLen == 1){
 	 				totalPrice = 0;
 	 			}
 				
 				if($("input[name=OPT_DTL_ADD_PRCs]").eq(idx2).val() != 0){//옵견 추가가격
 					optDtlAddPrc = $("input[name=OPT_DTL_ADD_PRCs]").eq(idx2).val();
 				}
 				
 				//금액 계산
 				if(prdOptEstYn == "Y"){
 					sumTotalPrice = (parseInt(prdMstPrc) + parseInt(optDtlAddPrc)) * parseInt(esmPrdCnt);
 				}else{
 					if($("input[name=OPT_DTL_IDXs]").eq(idx2).val() != 0){//옵션이 있다면
 						sumTotalPrice = parseInt(optDtlAddPrc) * parseInt(esmPrdCnt);
 	 				}else{
 	 					sumTotalPrice = parseInt(prdMstPrc) * parseInt(esmPrdCnt);
 	 				}
 				}

 				if(addPrdMstCd == prdMstCd){
 					totalPrice = totalPrice + sumTotalPrice;
 				}else{
 					totalPrice = sumTotalPrice;
 				}
 				
 				$("#spanPrdMstPrc_"+index).html(setComma(totalPrice));
 				$("input[name=ESM_PRD_ESM_PRICE]").eq(idx2).val(sumTotalPrice);
 	 			$("input[name=ESM_PRD_WSH_PRICE]").eq(idx2).val(sumTotalPrice);
 				
 	 			if($thisTrLen == 1){
 	 				totalPrice = 0;
 	 			}
 			});
 			
 			$("input[name=ESM_PRD_ESM_PRICE]").each(function(idx){
 				price = price +  parseInt($(this).val());
 			});
			$("#ESM_MST_ESM_TOT_PRICE").val(setComma(price));
			$("#ESM_MST_WSH_TOT_PRICE").val(setComma(price));
 		}
 		
 	});
 	
 	// 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
      	var $frm = $("#searchForm"); 
      	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/estimateManagementList.do", "target":"_self", "method":"post"}).submit();
    }); 
 	//회원검색 팝업
    $(document).on("click", "#memberPopup", function () 
	{	
		popup('<c:out value="${serverDomain}" />/am/member/searchMemberPopup.do?type=estim',"900","900","no","_MemberPopup");

	});
 	
    fnResultMember = function(params){
    	var bCheck = true;
    	if( bCheck ){
    	
    		var obj;
    		$.each(params, function(index,item){
    			
        		obj = new Object();
        		obj.ID 			= item.MEM_MST_MEM_ID;
        		obj.NAME 			= item.MEM_MST_MEM_ADD;
        		obj.MEM_MST_MAIL 			= item.MEM_MST_MAIL;
        		obj.MEM_MST_HP1 			= item.MEM_MST_HP1;
        		obj.MEM_MST_HP2 			= item.MEM_MST_HP2;
        		obj.MEM_MST_HP3 			= item.MEM_MST_HP3;
        		
        		
        		$("#ESM_MST_MEM_NM").val(obj.NAME);
        		$("#ESM_MST_MEM_ID").val(obj.ID);
        		
        		$("#ESM_MST_MAIL").val(obj.MEM_MST_MAIL);
        		$("#ESM_MST_HP1").each(function(){
        			if($(this).val() == obj.MEM_MST_HP1){
        				$(this).prop("selected",true);
        			}
        		});
        		$("#ESM_MST_HP2").val(obj.MEM_MST_HP2);
        		$("#ESM_MST_HP3").val(obj.MEM_MST_HP3);
        		
        	});
    	 
    	}
    	 
    	return true;
    };
    
    $(document).on("click", "input[name=ESM_PCH_MD_BUY_YN]", function (){ 
    	if($(this).val() == "Y"){
    		$("#getDate").show();
    	}
    	else{
    		$("#getDate").hide();
    	}
    });
});
//-->
</script>

</body>
</html>
