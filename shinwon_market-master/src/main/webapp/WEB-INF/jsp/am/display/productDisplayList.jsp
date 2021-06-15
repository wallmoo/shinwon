<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title">
		<span>
		<c:forEach var="row" items="${productCatList }" varStatus="i">
			<c:out value="${row.PRD_CTG_NM }"/> 
			<c:if test="${i.count < fn:length(productCatList)}"> - </c:if>
		</c:forEach>
		</span>
	</h3>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="text-right">
			<a href="javascript:goRemoveChecked();" class="button small"><span>선택삭제</span></a>
			<a href="javascript:openSearchProductPopup();" class="button small primary" "title="새 창 으로 열립니다."><span>상품등록</span></a>
		</div>
	</div><!-- // 목록 상단 버튼 -->
	
	
	<form id="frm" name="frm">
	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	<input type="hidden" name="searchBnrMstTitle" value="<c:out value="${commandMap.searchBnrMstTitle }"/>"/>
	<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	<input type="hidden" name="searchBnrMstUseYn" value="<c:out value="${commandMap.searchBnrMstUseYn }"/>"/>
	<input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
	<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="searchPrdType" name="searchPrdType" value="banner" />
	<input type="hidden" id="searchYn" name="searchYn" value="Y" />
	<input type="hidden" id="searchPrdCtgEnv" name="searchPrdCtgEnv" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	<input type="hidden" id="searchPrdMstChannelType" name="searchPrdMstChannelType" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	
		<div class="table-a"><!-- col list -->
			<table class="table-col table-b">
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" class="checkbox checkAll" /></th>
						<th>NO</th>
						<th>상품코드</th>
						<th>이미지</th>
						<th>상품명</th>
						<th>판매상태</th>
						<th>전시순서</th>
						<th>사용여부</th>
					</tr>
				</thead>
				<tbody class="sort-target">
				<c:choose>
				<c:when test="${not empty list}">
				<c:forEach var="row" items="${list }" varStatus="i">
					<tr>
						<td class="col-sort" data-bnr_dtl_idx="<c:out value="${row.DSP_CTG_IDX }"/> " data-bnr_dtl_srt="<c:out value="${row.DSP_CTG_SRT }"/> ">
							<input type="checkbox"  class="checkbox checkRow" id="DSP_CTG_IDX_${row.DSP_CTG_IDX}" name="DSP_CTG_IDX" value="${row.DSP_CTG_IDX}" />
							<input type="hidden" class="PRD_MST_CDs" name="PRD_MST_CDs" value="${row.PRD_MST_CD }"/>
						</td>
						<td>${i.index+1 }</td>
						<td>
							<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
								<c:out value="${row.PRD_MST_CD }" />
							</a>
						</td>
						<td><span class="thumbnail_img"><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${row.THUMBNAIL_IMG }"></span></td>
						<td class="left">
							<%-- <input type="text" class="text" style="width:100%" name="DSP_MST_TXT" id="DSP_MST_TXT" value="<c:out value="${row.DSP_MST_TXT }" />" /> --%>
							<textarea class="textarea" name="PRD_MST_NM" id="PRD_MST_NM" style="width:100%;height:30px;" maxlength=100 readonly><c:out value="${row.PRD_MST_NM }" /></textarea>
						</td>
						<td>
							<c:if test="${row.PRD_MST_SEL_STATE eq  Code.PRODUCT_SELL_STATE_ING}"><span class="history-condition success"><i class="fonti um-circle"></i>판매중</span></c:if>
							<c:if test="${row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT}" ><span class="history-condition info"><i class="fonti um-circle"></i>일시품절</span></c:if> 
							<c:if test="${row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}" ><span class="history-condition info"><i class="fonti um-circle"></i>품절상품</span></c:if> 
							<c:if test="${row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP}" ><span class="history-condition info"><i class="fonti um-circle"></i>미판매</span></c:if> 
						</td>
						
						<td>
							<a href="#none" class="row-sort" data-sort_type="up">△ </a>
							<a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
						</td>
						<td>
							<select class="dsp-use" value="">
								<option value="Y" <c:if test="${row.DSP_CTG_USE_YN eq 'Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${row.DSP_CTG_USE_YN eq 'N'}">selected</c:if>>미사용</option>
							</select>
						</td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
					</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->
		</div><!-- // col list -->	
						   
	</form>
	<div class="section-button"><!-- section-button -->
		<div class="wrap text-center">
			<a href="javascript:;" id="modifySort" class="button large primary"><span>저장</span></a>
		</div>
	</div><!-- // section-button --> 
</div><!-- // contents-inner -->
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function () {
	
	$.checkBoxSelect("checkAll", "checkRow");
	
   // 페이지 이동
	goPage = function (cPage){
		var $frm = $("#frm");
		var url = "<c:out value="${serverDomain}"/>/am/display/productDisplayList.do";
		$frm.find("input[name='searchBnrMstTitle']").val(Base64.encode($frm.find("input[name='searchBnrMstTitle']").val()));
		$frm.find("input[name='cPage']").val(cPage);
		var param = $frm.serialize();
		callPageLoad(url, param);
	};
	
	
	// 페이지 로드
	callPageLoad = function (url, param) 
	{
		$("#main_con").empty();
		$("#main_con").load(url, param, function () {
			/* treePageSetting();*/
		});
	};
	
	// 선택 항목 삭제
	goRemoveChecked = function(){

		if( $(".checkRow:checked").length == 0 ){
			alert("삭제할 상품을 선택하여 주십시오.");
			return;
		}    	

		if( !confirm('체크된 항목을 삭제하시겠습니까?') ){
			return;
		}    	
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/productDisplayRemove.do", "target":"_self", "method":"post"}).submit();
	};
	
	//상품팝업 상품선택시 호출되는 메소드
	fnResultProduct = function(params){
		debugger;
		var addedCnt = eval(params.length);
		var bCheck = true;
		if($(".PRD_MST_CDs").size()+addedCnt>20){
			alert("최대 20개까지 등록 가능합니다.");
			bCheck = false;
			return false;
		}
		//상품중복체크
		$.each( params, function( index, el )
		{
			if( !fnDuplicationChk( el.PRD_MST_CD ))
			{
				alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
				bCheck = false;
				return false;
			}
		});
		
		var frm = $("#frm");
		
		if( $("input[name='DSP_CTG_IDX']").length > 0 )
		{
			$.each(params, function(index,item)
			{	    		
				if( bCheck )
				{
					frm.append('<input type="hidden" class="checkbox checkRow" name="REG_DSP_MST_IDX" value="'+item.PRD_MST_CD+'" />');
					frm.append('<input type="hidden" class="checkbox checkRow" name="DSP_MST_TXTs" value="'+item.PRD_MST_NM+'" />');
				}
			});
		}
		else
		{
			$.each(params, function(index,item)
			{
				frm.append('<input type="hidden" class="checkbox checkRow" name="REG_DSP_MST_IDX" value="'+item.PRD_MST_CD+'" />');
				frm.append('<input type="hidden" class="checkbox checkRow" name="DSP_MST_TXTs" value="'+item.PRD_MST_NM+'" />');
			});
		}
		
		if( bCheck )
		{
			frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/productDisplayRegist.do", "target":"_self", "method":"post"}).submit();
		}
	};

	//상품 중복체크
	fnDuplicationChk = function( selectObj )
	{
		var bReturn = true;
		var $obj = $("#frm").find(".PRD_MST_CDs");
		$.each($obj, function(){
			if(selectObj == $(this).val()){
				bReturn = false;
				return false;
			}
		});
		return bReturn;
	};
	
	// 상품선택 팝업
	openSearchProductPopup = function ()
	{
		popup('',"1100","700","no","_BasicProductPopup");
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "target":"popup_BasicProductPopup", "method":"post"}).submit();
	};
	
	// 배너 순서 변경 이벤트
	/* $(document).on("click", ".row-sort", function () {
			
		var $this = $(this);
		var $tr = $this.parent().parent();
		var type = $this.data("sort_type");
		if(type == "up")
		{
			var $prevTr = $tr.prev(); 
			if($prevTr.length > 0)
			{                
				var $trClone = $tr.clone();
				$prevTr.before($trClone);
				$tr.remove();  
				
				// 최상위 또는 최하위가 포함된 경우 이동마크 변경
				var $newTr = $prevTr.prev();
				if($newTr.prev().length == 0 || $prevTr.next().length==0 ){
					var newTrHtml = $newTr.find('[data-sort_type="up"]').parent().html();
					var nextTrHtml = $prevTr.find('[data-sort_type="down"]').parent().html();

					$prevTr.find('[data-sort_type="down"]').parent().html(newTrHtml);
					$newTr.find('[data-sort_type="up"]').parent().html(nextTrHtml);
				}
			}
			else
			{
				alert("최 상위 순서 입니다.");
				return;
			} 
		}
		else
		{
			var $nextTr = $tr.next();
			if($nextTr.length > 0)
			{
				var $trClone = $tr.clone();
				$tr.next().after($trClone);
				$tr.remove();
				
				// 최상위 또는 최하위가 포함된 경우 이동마크 변경
				var $newTr = $nextTr.next();
				if($newTr.next().length == 0 || $nextTr.prev().length==0 ){
					var newTrHtml = $newTr.find('[data-sort_type="down"]').parent().html();
					var nextTrHtml = $nextTr.find('[data-sort_type="up"]').parent().html();
					
					$nextTr.find('[data-sort_type="up"]').parent().html(newTrHtml);
					$newTr.find('[data-sort_type="down"]').parent().html(nextTrHtml);
				}                
			}
			else
			{
				alert("최 하위 순서 입니다.");
				return;
			}
		}
		
	}); */
	
 // 공통코드 순서 변경 이벤트
	$(document).off("click", ".row-sort");
	$(document).on("click", ".row-sort", function () {
		
		var $this = $(this);
		var $tr = $this.parent().parent();
		var type = $this.data("sort_type");
		
		if(type == "up")
		{
			var $prevTr = $tr.prev(); 
			if($prevTr.length > 0)
			{
				var $trClone = $tr.clone();
				$prevTr.before($trClone);
				$tr.remove();    
			}
			else
			{
				alert("최 상위 순서 입니다.");
				return;
			} 
		}
		else
		{
			var $nextTr = $tr.next();
			if($nextTr.length > 0)
			{
				var $trClone = $tr.clone();
				$tr.next().after($trClone);
				$tr.remove();
			}
			else
			{
				alert("최 하위 순서 입니다.");
				return;
			}
		}
	});
	
	
	// 배너 순서 저장 버튼 클릭 이벤트
	$(document).off("click", "#modifySort");
	$(document).on("click", "#modifySort", function () {
		if (confirm( "저장 하시겠습니까?")) {
			var idxArray = new Array();
			var sortArray = new Array();
			var useArray = new Array();
			$(".sort-target").find("tr").each(function (i) {
				var $tr = $(this).find(".col-sort");
				idxArray.push($tr.data("bnr_dtl_idx"));
			});
			
			$(".dsp-use").each(function(i){
				useArray.push($(this).val());
			});

			$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/display/productDisplaySortArrayAjax.do", 
			   data : {"DSP_CTG_IDX":idxArray, 
						"DSP_CTG_USE": useArray,
						"CMN_COM_IDX":"${commandMap.CMN_COM_IDX }" },
			   success : function (data) {
				   alert(data.message); 	
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
			   }
			});
		}
	});

	
});

</script>