<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import = "com.market.mall.common.constants.RESELLER_BAN_CODE" %>

<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title"><span>${bnrCatList[1].TITLE } - ${bnrCatList[0].TITLE }</span></h3>
	
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="text-left">
		</div>
		<div class="text-right">
			<a href="#none" id="deleteAll" class="button small"><span>선택삭제</span></a>
			<a href="#none" id="modifySort" class="button small primary"><span>저장</span></a>
			<a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
		</div>
	</div><!-- // 목록 상단 버튼 -->

		<table class="table-col table-b">
			<colgroup>
				<col style="width:60px;">
				<col style="width:auto;">
				<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_TOP || 
								bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PLAN}">
					
					<col style="width:auto;">
					<col style="width:auto;">
					<col style="width:auto;">
					<col style="width:auto;">
					<col style="width:auto;">
				</c:if>
				<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PICK}">
					<col style="width:25%;">
					<col style="width:10%;">
					<col style="width:20%;">
					
				</c:if>
				<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_TREND || 
								bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_BANNER || 
								bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_2TOP}">
					<col style="width:10%;">
					<col style="width:50px;">
					<col style="width:25%;">
					<col style="width:20%;">
					<col style="width:auto;">
					<col style="width:auto;">
				</c:if>
				<c:if test="${empty bnrCatList[0].CMN_COM_ETC1}">
					<col style="width:auto;">
					<col style="width:auto;">
					<col style="width:auto;">
					<col style="width:auto;">
				</c:if>
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox"  id="all_check"></th>
					<th>제목</th>
					<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_TOP || 
									bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PLAN}">						
						<th>전시기간</th>
						<th>잔여기간</th>
						<th>등록일</th>
						<th>사용여부</th>
						<th>보기</th>
						<th>전시순서</th>
					</c:if>
					<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PICK}">
						
						<th>등록일</th>
						<th>사용여부</th>						
						<th>전시순서</th>

					</c:if>
					<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_TREND || 
									bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_BANNER || 
									bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_2TOP}">
						<th>전시기간</th>
						<th>잔여기간</th>  
						<th>등록일</th>
						<th>사용여부</th>
						
					</c:if>
					
					
					<c:if test="${empty bnrCatList[0].CMN_COM_ETC1}">
						<th>전시기간</th>
						<th>잔여기간</th>
						<th>등록일</th>
						<th>사용여부</th>
					</c:if>
				</tr>
			</thead>
			<tbody class="sort-target" id="banner_list_wrapper">
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="row" items="${list }" varStatus="i">
					<tr data-mstidx="<c:out value="${row.BNR_MST_IDX }"/>">
						<td><input type="checkbox" class="all_check_target"></td>
						<td>
							<a href="javascript:goView('<c:out value="${row.BNR_MST_IDX }" />');">
								<c:out value="${row.BNR_MST_TITLE }" />
							</a>
						</td>
						<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_TOP || 
										bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PLAN}">		
										
							<td>
								<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ 
								<ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy.MM.dd"/>
							</td>
							<td><c:out value="${row.BNR_MST_MOD_DT < 1 ? 0 : row.BNR_MST_MOD_DT }" /></td>
							<td><ui:formatDate value="${row.BNR_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
							<td>
								<select class="select">
	                        		<option value="Y" <c:if test="${row.BNR_MST_USE_YN eq 'Y'}">selected="selected"</c:if>>사용</option>
	                        		<option value="N" <c:if test="${row.BNR_MST_USE_YN eq 'N'}">selected="selected"</c:if>>미사용</option>
								</select>						
							</td>		
							<td>
								<a href="javascript:goShowImg(<c:out value="${row.BNR_MST_IDX }" />);" class="button button-b"><span>배너보기</span></a>
							</td>
							<td>
								<c:if test="${row.BNR_DTL_ORDER ne 1 }">	
								<a href="#none" class="row-sort" data-sort_type="up">△ </a>
								</c:if><c:if test="${row.BNR_DTL_ORDER ne fn:length(list) }">	
								<a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
								</c:if>
							</td>															

						</c:if>
						<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PICK}">
							<td><ui:formatDate value="${row.BNR_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
							<td>
								<select class="select">
	                        		<option value="Y" <c:if test="${row.BNR_MST_USE_YN eq 'Y'}">selected="selected"</c:if>>사용</option>
	                        		<option value="N" <c:if test="${row.BNR_MST_USE_YN eq 'N'}">selected="selected"</c:if>>미사용</option>
								</select>						
							</td>									
							<td>
								<c:if test="${row.BNR_DTL_ORDER ne 1 }">	
								<a href="#none" class="row-sort" data-sort_type="up">△ </a>
								</c:if><c:if test="${row.BNR_DTL_ORDER ne fn:length(list) }">	
								<a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
								</c:if>
							</td>
	
						</c:if>
						<c:if test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_TREND || 
										bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_BANNER || 
										bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_2TOP}">
							<td>
								<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ 
								<ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy.MM.dd"/>
							</td>
							<td><c:out value="${row.BNR_MST_MOD_DT < 1 ? 0 : row.BNR_MST_MOD_DT }" /></td>
							<td><ui:formatDate value="${row.BNR_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
							<td>
								<select class="select">
	                        		<option value="Y" <c:if test="${row.BNR_MST_USE_YN eq 'Y'}">selected="selected"</c:if>>사용</option>
	                        		<option value="N" <c:if test="${row.BNR_MST_USE_YN eq 'N'}">selected="selected"</c:if>>미사용</option>
								</select>						
							</td>										
						</c:if>
						
						
						<c:if test="${empty bnrCatList[0].CMN_COM_ETC1}">
							<td>
								<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ 
								<ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy.MM.dd"/>
							</td>
							<td><c:out value="${row.BNR_MST_MOD_DT < 1 ? 0 : row.BNR_MST_MOD_DT }" /></td>
							<td><ui:formatDate value="${row.BNR_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
							<td>
								<select class="select">
	                        		<option value="Y" <c:if test="${row.BNR_MST_USE_YN eq 'Y'}">selected="selected"</c:if>>사용</option>
	                        		<option value="N" <c:if test="${row.BNR_MST_USE_YN eq 'N'}">selected="selected"</c:if>>미사용</option>
								</select>						
							</td>						

						</c:if>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<c:choose>
							<c:when test="${bnrCatList[0].CMN_COM_ETC1 eq CONST_TOP || 
										bnrCatList[0].CMN_COM_ETC1 eq CONST_BAN}">
								<td colspan="10">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>	
							</c:when>
							<c:otherwise>
								<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>	
							</c:otherwise>
						</c:choose>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	
	<form id="frm" name="frm">
		<input type="hidden" name="BNR_MST_IDX" value="" />
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
		<input type="hidden" name="searchBnrMstTitle" value="<c:out value="${commandMap.searchBnrMstTitle }"/>"/>
		<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
		<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
		<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
		<input type="hidden" name="searchBnrMstUseYn" value="<c:out value="${commandMap.searchBnrMstUseYn }"/>"/>
		<input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
		<input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${commandMap.BNR_MST_GBN }"/>" />
		<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
		
	</form>
</div><!-- // contents-inner -->
<script type="text/javascript">
$(document).ready(function () {
	// 검색 엔터 이벤트 
	/* $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
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
		var url = "<c:out value="${serverDomain}" />/am/display/bannerDisplayList.do";
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$("#searchBnrMstTitle").val(Base64.encode($("#searchBnrMstTitle").val()));
		var param = $searchForm.serialize();
		callPageLoad(url, param);
	}; */

	// 페이지 이동
	goPage = function (cPage){
		var $frm = $("#frm");
		var url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerList.do";
		$frm.find("input[name='searchBnrMstTitle']").val(($frm.find("input[name='searchBnrMstTitle']").val()));
		$frm.find("input[name='cPage']").val(cPage);
		callPageLoad(url, param);
	};
	
	// 전시배너관리 등록페이지 이동
	goForm = function (){
		var $frm = $("#frm");
		var url = "";		
		if ( $('#CMN_COM_IDX').val() == '3613'  ) {
			
			if( $("#banner_list_wrapper").children("tr").length == 4){
				alert('셀러픽 등록은 최대 4개까지 등록이 가능합니다.');
				return;
			}			
			
			
			url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerFormSellerPick.do";			
		}else{
			url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerForm.do";			
		}		
		

		$frm.find("input[name='searchBnrMstTitle']").val(($frm.find("input[name='searchBnrMstTitle']").val()));
		var param = $frm.serialize();
		callPageLoad(url, param);
	};
	
	// 전시배너관리 상세페이지 이동
	goView = function (bnrMstIdx)
	{
		var $frm = $("#frm");
		var url  = "";
		
		if ( $('#CMN_COM_IDX').val() == '3613'  ) {
			url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerEditSellerPick.do";
		}else{
			url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerEdit.do";
		}		
		
		
		
		
		
		$frm.find("input[name='BNR_MST_IDX']").val(bnrMstIdx);
		$frm.find("input[name='searchBnrMstTitle']").val(($frm.find("input[name='searchBnrMstTitle']").val()));
		var param = $frm.serialize();
		callPageLoad(url, param);
	};
	
	// 페이지 로드
	callPageLoad = function (url, param) 
	{
		$("#main_con").empty();
		$("#main_con").load(url, param, function () {
			//treePageSetting();
		});
	};
	
	
	// 배너 순서 변경 이벤트
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
	});
	
	$('#deleteAll').off('click').on('click',function(){
		if (confirm( "삭제 하시겠습니까?")) {
			var paramData = [];
			$(".all_check_target:checked").each(function(){
				paramData.push({"BNR_MST_IDX":$(this).parent().parent().attr('data-mstidx')});
			});
	    	
	        $.ajax ({
	           async : false,
	           type : "POST",
	           url : "<c:out value="${serverDomain}" />/am/display/bannerDisplayListDeleteAjax.do", 
	           data : {"bannerList":JSON.stringify(paramData)},
	           success : function (data) {
	        	   if(data.resultCode == "200"){
	        		   alert('삭제 성공했습니다.');   
	        		   reqBannerDisplayList($("#CMN_COM_IDX").val());
	        	   }
	           },
	           error : function () {
	               alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
	           }
	        });
		}
	});
	
	// 배너 순서 저장 버튼 클릭 이벤트
	$(document).off("click", "#modifySort");
	$(document).on("click", "#modifySort", function () {
		if (confirm( "저장 하시겠습니까?")) {		
			
			var $listElem = $('#banner_list_wrapper tr');
	    	var paramData = [];
	    	for(var i = 0; i < $listElem.length; i ++) {
	    		var $curTr = $($listElem[i]);

				var bannerObject = new Object();
		    		
		    	bannerObject.BNR_MST_IDX = $curTr.data('mstidx');
		    	bannerObject.BNR_MST_USE_YN =  $('select option:selected', $curTr).val();
		    	bannerObject.BNR_MST_SRT = i+1;
		    	paramData.push(bannerObject);
	    	}
		    		
			$.ajax ({
				   async : false,
				   type : "POST",
		           url : "<c:out value="${serverDomain}" />/am/display/bannerDisplayListUseYNAjax.do", 
		           data : {"bannerList":JSON.stringify(paramData)},
				   success : function (data) {
					   alert("성공적으로 수정하였습니다.");
					   
				   },
				   error : function () {
					   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");
					   
				   }
				});

		}
	});
	
	// 전시배너관리 이미지 미리보기
	goShowImg = function (bnrMstIdx)
	{
		var $frm = $("#frm");
		$frm.find("input[name='BNR_MST_IDX']").val(bnrMstIdx);
		popup('',"1925","600","no","_BannerShowImagePopup");
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/bannerDisplayImagePopup.do", "target":"popup_BannerShowImagePopup", "method":"post"}).submit();
	};

	// Check Box Event Handler
	$('#all_check').off('change').on('change', function(){
		
		var curChecked = $(this).is(':checked');
		
		$('.all_check_target').prop('checked', curChecked);
		
	});
	
	reqBannerDisplayList = function(CMN_COM_IDX){
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : 'http://scm.localhost:8080/am/display/sellerRoomBannerList.do',
			data : {
				   'CMN_COM_IDX' : CMN_COM_IDX,
				   'BND_MST_LAY_TPY' : $('#BND_MST_LAY_TPY').val(),
				   'searchGubun' : $('input[name=searchGubun]:checked').val()
				   },  
			success : function(data){
				console.log(data);
				$('#main_con').html(data);  
			}
		});
	}
});

</script>