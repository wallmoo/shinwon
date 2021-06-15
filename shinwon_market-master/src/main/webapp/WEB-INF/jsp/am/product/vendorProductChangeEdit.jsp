<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body>
	<div id="header">
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
	</div>
	<div id="container">
		<div id="aside" class="aside left">
			<%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</div>
		<!-- #wrapper -->
		<div id="wrapper">
			<!-- #contents -->
			<div id="contents">
				<!-- .container -->
				<div class="container">
					<!-- ##############################################################################

						S : 컨텐츠 삽입

					############################################################################### -->
					<h2 class="title"><span>입점업체 상품변경요청</span></h2>
					<div class="grid cf">
						<div class="col-1-2">
							<h3 class="title"><span>기존정보</span></h3>
							<table class="table-row table-a">
								<caption>기존정보의 상품코드, 상품명, 판매가, 판매가능수량, 할인율, 판매여부를 알 수 있는 표 입니다.</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									<tr>
										<th><span>상품코드</span></th>
										<td><c:out value="${productChangeInfo.PRD_MST_CD }"/></td>
									</tr>
									<tr>
										<th><span>상품명</span></th>
										<td><c:out value="${productChangeInfo.PRD_MST_NM }"/></td>
									</tr>
									<tr>
										<th><span>판매가</span></th>
										<td><c:out value="${productChangeInfo.PM_PRD_MST_PRC }"/></td>
									</tr>
									<tr>
										<th><span>판매가능수량</span></th>
										<td><c:out value="${productChangeInfo.PM_PRD_MST_SEL_CNT }"/>개</td>
									</tr>
									<tr>
										<th><span>할인율</span></th>
										<td>
											<div class="tbl_line"><c:out value="${productChangeInfo.PM_PRD_MST_UNT_NM }"/> / <c:out value="${productChangeInfo.PM_PRD_MST_SALE }"/></div>
										</td>
									</tr>
									<tr>
										<th><span>판매여부</span></th>
										<td><c:out value="${productChangeInfo.PM_PRD_MST_SEL_STATE_NM }"/> </td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-1-2">
							<h3 class="title"><span>변경정보</span></h3>
							<table class="table-row table-a">
								<caption>기존정보의 상품코드, 상품명, 판매가, 판매가능수량, 할인율, 판매여부를 알 수 있는 표 입니다.</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									
									<tr>
										<th><span>상품코드</span></th>
										<td><c:out value="${productChangeInfo.VAV_PRD_MST_CD }"/></td>
									</tr>
									<tr>
										<th><span>상품명</span></th>
										<td><c:out value="${productChangeInfo.VAV_PRD_MST_NM }"/></td>
									</tr>
									<tr>
										<th><span>판매가</span></th>
										<td><c:out value="${productChangeInfo.VAV_PRD_MST_PRC }"/>원</td>
									</tr>
									<tr>
										<th><span>판매가능수량</span></th>
										<td><c:out value="${productChangeInfo.VAV_PRD_MST_SEL_CNT }"/>개</td>
									</tr>
									<tr>
										<th><span>할인율</span></th>
										<td>
											<div class="tbl_line"><c:out value="${productChangeInfo.VAV_PRD_MST_UNT_NM }"/> / <c:out value="${productChangeInfo.VAV_PRD_MST_SALE }"/></div>
										</td>
									</tr>
									<tr>
										<th><span>판매여부</span></th>
										<td><c:out value="${productChangeInfo.VAV_PRD_MST_SEL_STATE_NM }"/></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="div_area ui cf">
						<div class="div_area_left">
							<h3 class="title"><span>보류사유2</span></h3>
						</div>
						<c:if test="${fn:length(productHoldOffDetail) > 0}">
						<div class="div_area_right">
							<a href="javascript:goPendingHistoryPopup('${productChangeInfo.PRD_MST_CD }');" class="button small btn_menual_down"><span>보류내역보기</span></a>
						</div>
						</c:if>
					</div>
					<form id="frm" name="frm">
					<input type="hidden" id="VDR_HLD_APV_STATE" name="VDR_HLD_APV_STATE" value="N"/>
					<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="<c:out value="${productChangeInfo.PRD_MST_CD }"/>"/>
					
                    <input type="hidden" name="searchErpPrdMstCd" value="<c:out value="${commandMap.searchErpPrdMstCd }"/>"/>
					<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
					<input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
					<input type="hidden" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
					<input type="hidden" name="searchPrdCtgEnv" value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />	                
					<input type="hidden" name="searchPrdCtgDepth1" value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
					<input type="hidden" name="searchPrdCtgDepth2" value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
					<input type="hidden" name="searchPrdCtgDepth3" value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
					<input type="hidden" name="searchPrdCtgDepth4" value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" />
					<input type="hidden" name="searchPrdMstSellState" value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
					<input type="hidden" name="searchPrdMstDplState" value="<c:out value="${commandMap.searchPrdMstDplState }"/>"/>
					<input type="hidden" name="searchPrdMstApvState" value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
					<input type="hidden" name="searchPrdMstMdId" value="<c:out value="${commandMap.searchPrdMstMdId }"/>" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
					<input type="hidden" name="searchDetailY" value="<c:out value="${commandMap.searchDetailY }"/>" />
					<input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                    
					<table class="table-row table-a">
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>승인여부<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" value="A" name="PM_PRD_MST_APV_STATE" id="state1" class="radio" checked="checked">
											<label for="state1" class="label">승인</label>
										</li>
										<li>
											<input type="radio" value="C" name="PM_PRD_MST_APV_STATE" id="state2" class="radio">
											<label for="state2" class="label">보류</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr class="_apvStsC" style="display:none;">
								<th><span>보류사유<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input class="vdrHldTy" type="checkbox" value="Y" name="VDR_HLD_PRC_YN" id="" class="checkbox">
											<label for="" class="label">판매가</label>
										</li>
										<li>
											<input class="vdrHldTy" type="checkbox" value="Y" name="VDR_HLD_NM_YN" id="" class="checkbox">
											<label for="" class="label">상품명</label>
										</li>
										<li>
											<input class="vdrHldTy" type="checkbox" value="Y" name="VDR_HLD_CTG_YN" id="" class="checkbox">
											<label for="" class="label">카테고리</label>
										</li>
										<li>
											<input class="vdrHldTy" type="checkbox" value="Y" name="VDR_HLD_CNT_YN" id="" class="checkbox">
											<label for="" class="label">영상/이미지</label>
										</li>
										<li>
											<input class="vdrHldTy" type="checkbox" value="Y" name="VDR_HLD_NFI_YN" id="" class="checkbox">
											<label for="" class="label">고시정보</label>
										</li>
										<li>
											<input class="vdrHldTy" type="checkbox" value="Y" name="VDR_HLD_ETC_YN" id="" class="checkbox">
											<label for="" class="label">기타</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr class="_apvStsC" style="display:none;">
								<th><span>상세사유<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<textarea name="VDR_HLD_DESC" id="VDR_HLD_DESC" class="textarea"><c:out value="${row.VDR_HLD_DESC }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="goRegist" class="button primary"><span>저장</span></a>
							<a href="javascript:;" id="goList" class="button"><span>목록</span></a>
						</div>
					</div>
					<!-- ##############################################################################

						E : 컨텐츠 삽입

					############################################################################### -->
				</div>
				<!-- // .container -->
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #wrapper -->
		<!-- quickmenu-->
		<div id="quickmenu" class="aside right">
			<%@ include file="/WEB-INF/jsp/am/include/quick.jsp"%>
		</div>
		<!-- // quickmenu -->
	</div><!-- // container -->
</body>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	setTimeout(function() {
		$('body').addClass('p_loaded');
	}, 1000);
	
	// 목록 이벤트
	$(document).on("click", "#goList", function () 
	{
		var $frm = $("#frm"); 
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/vendorProductChangeList.do", "target":"_self", "method":"post"}).submit();
	}); 
	
	// 상품 삭제
	$(document).on("click", "#productDelete", function () {
		if (confirm( "승인거절 하시겠습니까?")) 
		{
			var $frm = $("#frm"); 
			$frm.attr({"action": "<c:out value="${serverDomain}" />/am/product/vendorProductChangeDelete.do", "target":"_self", "method":"post"}).submit(); 
		}
	});

	// 상세사유 1500byte 제한
	$(document).on("keyup","#VDR_HLD_DESC",function(){
        getStrByte(this, null, 1500, 2);
    });
	
	//저장
    $(document).on("click", "#goRegist", function () {
		var $frm = $("#frm"); 

		//var productsList = [];
		//productsList.push({PRD_MST_CD : $("#PRD_MST_CD").val()});
		//$("#productCodeList").val(JSON.stringify(productsList));
		//$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/vendorApprovalProductHoldModify.do", "target":"_self", "method":"post"}).submit();

		var paramData = {};
		//paramData['productCodeList'] = ${productChangeInfo.PRD_MST_CD };
    	
    	//paramData['VDR_HLD_DESC'] = $('#VDR_HLD_DESC').val();
		var productsList = [];
		productsList.push({PRD_MST_CD : $("#PRD_MST_CD").val()});
    	
    	paramData["productCodeList"] = JSON.stringify(productsList);
    	
    	var isChecked = false;
    	$('.vdrHldTy').each(function(){
    		var curCheckedStatus = $(this).is(":checked");
    		paramData[this.name] = curCheckedStatus ? 'Y' : 'N';
    		
    		if(isChecked == false && curCheckedStatus) isChecked = true;
    	});

    	paramData['VDR_HLD_DESC'] = $('#VDR_HLD_DESC').val();
    	
    	if($('input[name=PM_PRD_MST_APV_STATE]:checked').val() == 'C'){
    		if($('.vdrHldTy:checked').length == 0){
        		alert("보류사유를 선택해 주세요.");
        		return false;
    		}
    		
    		if($('#VDR_HLD_DESC').val() == ''){
        		alert("상세사유를 입력해주세요.");
        		return false;
    		}
    	}
    	
    	paramData['VDR_HLD_APV_STATE'] = $('input[name=PM_PRD_MST_APV_STATE]:checked').val();
    	
    	//if(isChecked == false) {
    	//	alert("보류사유를 선택해 주세요.");
    	//	return false;
    	//} else if($("#VDR_HLD_DESC") == ""){
    	//	alert("상세사유를 입력해주세요.");
    	//	return false;	
    	//} 
    	
		$.ajax({
			async : false,
			type : "POST",
			data : paramData,
			url : "<c:out value="${serverDomain}" />/am/product/vendorApprovalProductHoldModify.do",
			success : function(data) {
				alert("수정 되었습니다.");
				var $frm = $("#frm"); 
				$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/vendorProductChangeList.do", "target":"_self", "method":"post"}).submit()
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		}); 
    });

	// 보류사유 작성여부
	$(document).on("click", "[name='PM_PRD_MST_APV_STATE']", function () {
		if($(this).val() == "C"){
			$("._apvStsC").show();
		} else{
			$("._apvStsC").hide();
		}
	});

	//보류사유 팝업
	goPendingHistoryPopup = function(prdMstCd) {
		var $frm = $("#frm");
		$frm.find("input[name='PRD_MST_CD']").val(prdMstCd);
		$frm.attr('action','<c:out value="${serverDomain}"/>/am/product/pendingHistoryPopup.do');
		$frm.attr('target','popup_PendingHistoryPopup');
		$frm.attr('method','POST');
		popup('', "1100", "800", "no", "_PendingHistoryPopup");
		$frm.submit();
	};
});

</script>
</body>
</html>