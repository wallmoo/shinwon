<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title">
		<span>
		<c:forEach var="row" items="${productCatList }" varStatus="i">
			<c:out value="${row.PRD_CTG_NM }"/> - TOP SELLER (PC)
			<c:if test="${i.count < fn:length(productCatList)}"> - </c:if>
		</c:forEach>
		</span>
	</h3>
	<div class="tab-list">
		<ul class="top_tab_container is_delete">
		<c:set var="firstTopTabUseYN"/>
		<c:forEach var="row" items="${tabList }" varStatus="i">
			<c:if test="${row.DSP_TAB_TYP eq 'T'}">
				<c:if test ="${firstTopTabUseYN eq ''}"><c:set var="firstTopTabUseYN" value="${row.DSP_TAB_USE_YN}"/></c:if>
				<li value="${row.DSP_TAB_IDX }" ><a href='javascript:;' class="tab" value="${row.DSP_TAB_IDX }" data-type="${row.DSP_TAB_TYP}">${row.DSP_TAB_NM }</a><button type="button" class="btn_tab_del" value="${row.DSP_TAB_IDX }">X</button></li>
			</c:if>		
		</c:forEach>
		</ul>
		<a href="javascript:;" class="button small primary btn_tab_add"><span>TAB 추가</span></a>
		<div class="tab_form" style="display:none;" >
			<input type="text"  >
			<a href="javascript:;" class="button small registTabBtn" data-type="T"><span>확인</span></a>
		</div>
	</div>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="col-1-2 text-left">
			<dl class="cf">
				<dt>TAB 사용여부</dt>
				<dd>
					<ul class="form_radio_check_list">
						<li>
							<input type="radio" name="radioT" class="radio" <ui:select v="${firstTopTabUseYN}" t="Y" g="checked"/>>
							<label for="radioT" class="label" >사용</label>
						</li>
						<li>
							<input type="radio" name="radioT" class="radio" <ui:select v="${firstTopTabUseYN}" t="N" g="checked"/>>
							<label for="radioT" class="label">미사용</label>
						</li>
					</ul>
				</dd>
			</dl>
		</div>		
		<div class="text-right">
			<a href="javascript:;" onclick="goRemoveChecked(this)" class="button small" data-type="T"><span>선택삭제</span></a>
			<a href="javascript:;" onclick="openSearchProductPopup(this)" class="button small primary" "title="새 창 으로 열립니다." data-type="T"><span>상품등록</span></a>
		</div>
	</div><!-- // 목록 상단 버튼 -->
	
	<form id="frm" name="frm">
	
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
						<th><input type="checkbox" class="checkbox checkAll_top" /></th>
						<th>상품코드</th>
						<th>이미지</th>
						<th>상품명</th>
						<th>판매상태</th>
						<th>등록일</th>
						<th>전시순서</th>
						<th>사용여부</th>
					</tr>
				</thead>
				<tbody id="TList">
					<c:forEach var="row" items="${productList }" varStatus="i">
					<c:if test="${row.DSP_TAB_TYP eq 'T' }">
					<tr class="column">
						<td class="col-sort" data-bnr_dtl_idx="<c:out value="${row.DSP_MST_IDX }"/> " data-bnr_dtl_srt="<c:out value="${row.DSP_MST_SRT }"/> ">
							<input type="checkbox"  class="checkbox checkRow_top" id="DSP_MST_IDX_${row.DSP_MST_IDX}" name="DSP_MST_IDX" value="${row.DSP_MST_IDX}" />
							<input type="hidden" class="PRD_MST_CDs" name="PRD_MST_CDs" value="${row.PRD_MST_CD }"/>
						</td>
						
						<td>
							<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
								<c:out value="${row.PRD_MST_CD }" />
							</a>
						</td>
						<td><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${row.PRD_IMAGE }"></td>
						<td><input type="text" class="text xlarge" value="${row.DSP_MST_TXT }" disabled></td>
						<td>
							<c:if test="${row.PRD_MST_SEL_STATE eq 'I' }">판매중</c:if>
							<c:if test="${row.PRD_MST_SEL_STATE eq 'T' }">품절</c:if>
							<c:if test="${row.PRD_MST_SEL_STATE eq 'S' }">미판매</c:if>
						</td>
						<td>${row.DSP_MST_REG_DT }</td>
						<td>
							<a href="#none" class="row-sort" data-sort_type="up">△ </a>
							<a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
						</td>
						<td>
							<select name="DSP_MST_USE_YN" class="select">
								<option value="Y" <c:if test="${row.DSP_MST_USE_YN eq 'Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${row.DSP_MST_USE_YN eq 'N'}">selected</c:if>>미사용</option>
							</select>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- // col list -->	
						   
	
	
	<h3 class="title">
		<span>
		<c:forEach var="row" items="${productCatList }" varStatus="i">
			<c:out value="${row.PRD_CTG_NM }"/> NEW PRODUCT (PC)
			<c:if test="${i.count < fn:length(productCatList)}"> - </c:if>
		</c:forEach>
		</span>
	</h3>
	<div class="tab-list">
		<ul class="new_tab_container is_delete">
		<c:set var="firstNewTabUseYN" />
		<c:forEach var="row" items="${tabList}" varStatus="i">
			<c:if test="${row.DSP_TAB_TYP eq 'N'}">
				<c:if test ="${firstNewTabUseYN eq ''}"><c:set var="firstNewTabUseYN" value="${row.DSP_TAB_USE_YN}"/></c:if>
				<li class="" value="${row.DSP_TAB_IDX }" ><a href='javascript:;' class="tab" value="${row.DSP_TAB_IDX }" data-type="${row.DSP_TAB_TYP}">${row.DSP_TAB_NM }</a><button type="button" class="btn_tab_del" value="${row.DSP_TAB_IDX }">X</button></li>
			</c:if>		
		</c:forEach>
		</ul>
		<a href="javascript:;" class="button small primary btn_tab_add"><span>TAB 추가</span></a>
		<div class="tab_form" style="display:none;">
			<input type="text"  >
			<a href="javascript:;" class="button small registTabBtn" data-type="N"><span>확인</span></a>
		</div>
	</div>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="col-1-2 text-left">
			<dl class="cf">
				<dt>TAB 사용여부</dt>
				<dd>
					<ul class="form_radio_check_list">
						<li>
							<input type="radio" name="radioN" class="radio" value="Y" <ui:select v="${firstNewTabUseYN}" t="Y" g="checked"/>>
							<label for="radioN" class="label" >사용</label>
						</li>
						<li>
							<input type="radio" name="radioN" class="radio" value="N" <ui:select v="${firstNewTabUseYN}" t="N" g="checked"/>>
							<label for="radioN" class="label">미사용</label>
						</li>
					</ul>
				</dd>
			</dl>
		</div>		
		<div class="text-right">
			<a href="javascript:;" onclick="goRemoveChecked(this)" class="button small" data-type="N"><span>선택삭제</span></a>
			<a href="javascript:;" onclick="openSearchProductPopup(this)" class="button small primary" "title="새 창 으로 열립니다." data-type="N"><span>상품등록</span></a>
		</div>
	</div><!-- // 목록 상단 버튼 -->
	
	
	
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
					<th><input type="checkbox" class="checkbox checkAll_new" /></th>
					<th>상품코드</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>판매상태</th>
					<th>등록일</th>
					<th>전시순서</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody id="NList">
				<c:forEach var="row" items="${productList }" varStatus="i">
				<c:if test="${row.DSP_TAB_TYP eq 'N' }">
				<tr class="column">
					<td class="col-sort" data-bnr_dtl_idx="<c:out value="${row.DSP_MST_IDX }"/> " data-bnr_dtl_srt="<c:out value="${row.DSP_MST_SRT }"/> ">
						<input type="checkbox"  class="checkbox checkRow_new" id="DSP_MST_IDX_${row.DSP_MST_IDX}" name="DSP_MST_IDX" value="${row.DSP_MST_IDX}" />
						<input type="hidden" class="PRD_MST_CDs" name="PRD_MST_CDs" value="${row.PRD_MST_CD }"/>
					</td>
					<td>
						<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
							<c:out value="${row.PRD_MST_CD }" />
						</a>
					</td>
					<td><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}"/>${row.PRD_IMAGE }"></td>
					<td><input type="text" class="text xlarge" value="${row.DSP_MST_TXT }" disabled></td>
					<td>
						<c:if test="${row.PRD_MST_SEL_STATE eq 'I' }">판매중</c:if>
						<c:if test="${row.PRD_MST_SEL_STATE eq 'T' }">품절</c:if>
						<c:if test="${row.PRD_MST_SEL_STATE eq 'S' }">미판매</c:if>
					</td>
					<td>${row.DSP_MST_REG_DT }</td>
					<td>
						<a href="#none" class="row-sort" data-sort_type="up">△ </a>
						<a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
					</td>
					<td>
						<select name="DSP_MST_USE_YN"  class="select" >
							<option value="Y" <c:if test="${row.DSP_MST_USE_YN eq 'Y'}">selected</c:if>>사용</option>
							<option value="N" <c:if test="${row.DSP_MST_USE_YN eq 'N'}">selected</c:if>>미사용</option>
						</select>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- // col list -->	
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:;" id="modifySort" class="button large primary"><span>저장</span></a>
	</div>
</div><!-- // section-button --> 
	
	
	
	
</div><!-- // contents-inner -->
<script id="tabTemplate" type="text/x-jquery-tmpl">
<li value="\${DSP_TAB_IDX }" >
	<a href='javascript:;' class="tab" value="\${DSP_TAB_IDX }" data-type="\${DSP_TAB_TYP}">\${DSP_TAB_NM }</a>
	<button type="button" class="btn_tab_del" value="\${DSP_TAB_IDX }">X</button>
</li>
</script>
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr class="column">
	<td class="col-sort" data-bnr_dtl_idx="<c:out value="\${DSP_MST_IDX }"/> " data-bnr_dtl_srt="<c:out value="\${DSP_MST_SRT }"/> ">
		<input type="checkbox"  class="checkbox \${checkRow_type}" id="DSP_MST_IDX_\${DSP_MST_IDX}" name="DSP_MST_IDX" value="\${DSP_MST_IDX}" />
		<input type="hidden" class="PRD_MST_CDs" name="PRD_MST_CDs" value="\${PRD_MST_CD }"/>
	</td>
	<td>
		<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD} " target="_blank" title="새 창 으로 열립니다.">
			<c:out value="\${PRD_MST_CD }" />
		</a>
	</td>
	<td><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />\${PRD_IMAGE }"></td>
	<td><input type="text" class="text xlarge" value="\${DSP_MST_TXT }" disabled></td>
	<td>
		{{if PRD_MST_SEL_STATE == 'I'}}
		판매중
		{{else [PRD_MST_SEL_STATE == 'T']}}
		품절
		{{else}}  
		미판매
		{{/if}}
		
	</td>
	<td>\${DSP_MST_REG_DT}</td>
	<td>
		<a href="#none" class="row-sort" data-sort_type="up">△ </a>
		<a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
	</td>
	<td>
		<select class="select" name="DSP_MST_USE_YN">
			<option value="Y" {{if DSP_MST_USE_YN == 'Y'}}selected{{/if}}>사용</option>
			<option value="N" {{if DSP_MST_USE_YN == 'N'}}selected{{/if}}>미사용</option>
		</select>
	</td>
</tr>
</script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	$.checkBoxSelect("checkAll_top", "checkRow_top");
	$.checkBoxSelect("checkAll_new", "checkRow_new");
	
	$(".is_delete").each(function(index,item){
		$(this).find("li").each(function(index,item){
			if(index==0) $(this).addClass("in");
		})
	});
	
	$(document).off("click", ".btn_tab_add");
	$(document).on("click", ".btn_tab_add", function () {
		if($(this).next().is(":visible"))
			$(this).next().hide();
		else
			$(this).next().show();	
	});
		
	// 탭 이동
	$(document).off("click", ".tab");
	$(document).on("click", ".tab", function () {
		
		changeTab(this);
	});

	changeTab = function(tab){
		var DSP_TAB_TYP = $(tab).data("type"); 
		var DSP_TAB_IDX = $(tab).attr("value");
		var tabContainer = $(".new_tab_container");
		if(DSP_TAB_TYP == "T"){
			tabContainer = $(".top_tab_container");	
		}
	
		if($("li.in", tabContainer).attr("value") == DSP_TAB_IDX){
			return;
		}
		
		$("li.in", tabContainer).removeClass( "in" );
			
		$(tab).parent().addClass("in");
		
		reqTabProductListAjax(DSP_TAB_TYP, DSP_TAB_IDX);
	}
	
	reqTabProductListAjax = function(DSP_TAB_TYP, DSP_TAB_IDX){
		if(DSP_TAB_TYP == null || DSP_TAB_IDX == null){
			return;
		}
		$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/display/productDisplayTabProductListAjax.do", 
			   data : {
				   "DSP_TAB_IDX":DSP_TAB_IDX
				   },
			   success : function (data) {
				   
				   if(data.resultCode != "200"){
					   	alert("실패했습니다"); 
						return;
				   }
				      
				   var tableBody = $("#"+DSP_TAB_TYP+"List");
				   renderProductList(tableBody, data.productList);
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
			   }
			});
	}
	//상품 중복체크
	fnDuplicationChk = function( selectObj )
	{	
		var bReturn = true;
		var $obj = $("#"+mRegiTabType+"List").find(".PRD_MST_CDs");
		$.each($obj, function(){
			if(selectObj == $(this).val()){
				bReturn = false;
				return false;
			}
		});
		return bReturn;
	};
	
	var mRegiTabType = "T";
	var mRegiTabIdx = null;
	// 상품선택 팝업
	openSearchProductPopup = function (item)
	{	
		mRegiTabType = $(item).data("type");
		var tabContainer = mRegiTabType == "T" ? $(".top_tab_container") : $(".new_tab_container");
		mRegiTabIdx = $("li.in", tabContainer).attr("value");
		if(mRegiTabIdx == null || mRegiTabIdx == ""){
			return;
		}
		popup('',"1100","700","no","_BasicProductPopup");
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "target":"popup_BasicProductPopup", "method":"post"}).submit();
	};
	
	
	
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
		
	
	$(".registTabBtn").off("click").on("click", function(event){
		event.stopPropagation();
		
		if($(this).prev().val() == ""){
			alert("TAB 이름을  입력해주세요.");
			return;
		}
		$(this).parent().hide();
		$.ajax ({
		   	async : false,
		   	type : "POST",
		   	url : "<c:out value="${serverDomain}" />/am/display/productDisplayTabRegistAjax.do", 
	   		context: this, 
		  	data : {"DSP_TAB_USE_YN":"Y", 
					"DSP_TAB_TYP":$(this).data("type"), 
					"DSP_TAB_NM":$(this).prev().val(),
					"PRD_CTG_IDX":"${commandMap.PRD_CTG_IDX }" },
		   	success : function (data) {
			   if(data.resultCode != "200"){
				   	alert("실패했습니다"); 
					return;
			   }
			   
			   data.DSP_TAB_TYP = $(this).data("type");
			   data.DSP_TAB_NM = $(this).prev().val();
			   renderTab($(this).parent().parent().find("ul"), data);
			}, 	
		   	error : function (request,status,error) {
			   alert(error);  
			   return;
		   	}
		});
	});
	$(document).off("click", ".btn_tab_del");
	$(document).on("click", ".btn_tab_del", function (event) {
		
		event.stopPropagation();
		if(!confirm("정말로 삭제 하시겠습니까?")){
			return;
		}
		if($(this).parent().parent().children().length == 1){
			alert("더 이상 삭제할 수 없습니다.");
			return;
		}else{
			$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/display/productDisplayTabDelAjax.do", 
			   data : {"DSP_TAB_IDX":$(this).val() },
		   	   context: this, 
			   success : function (data) {
				   if(data.resultCode != "200"){
					   	alert("실패했습니다"); 
						return;
				   }
				   if($(this).parent().hasClass("in")){
					   var tabContainer = $('.top_tab_container'); 
					   if($(".tab", $(this).parent()).data("type") == "N"){
						   tabContainer = $('.new_tab_container');
					   }

					   changeTab(tabContainer.find(".tab").first());
				   }
				   $(this).parent().remove();
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
				   return;
			   }
			});
		}
	});

	$("#modifySort").off("click").on("click",function(event){
		event.stopPropagation();
		var arrayObj = new Array();
		
		$("#TList .column").each(function(index,item){
			var obj = new Object();
			obj.DSP_MST_IDX = $(this).find(".checkRow_top").val();
			obj.DSP_MST_SRT = index;
			obj.DSP_MST_USE_YN = $(this).find("select[name=DSP_MST_USE_YN] option:selected").val();
			arrayObj.push(obj);
		});
		
		$("#NList .column").each(function(index,item){
			var obj = new Object();
			obj.DSP_MST_IDX = $(this).find(".checkRow_new").val();
			obj.DSP_MST_SRT = index;
			obj.DSP_MST_USE_YN = $(this).find("select[name=DSP_MST_USE_YN] option:selected").val();
			arrayObj.push(obj);
		});
		$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/display/productDisplayTabProductEditAjax.do", 
			   data : {"productList":JSON.stringify(arrayObj)},
			   success : function (data) {
				   if(data.resultCode != "200"){
					   	alert("실패했습니다."); 
						return;
				   }
				   alert("성공적으로 저장했습니다.");
				   
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");
				   location.reload();
			   }
			}); 
	
	});

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
		
		if(!bCheck){
			return;
		}
		var requestCount = params.length;
		
		$.each(params, function(index,item){
			$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/display/productDisplayTabProductRegistAjax.do", 
			   data : {"DSP_TAB_IDX" : mRegiTabIdx,
					   "PRD_MST_CD" : item.PRD_MST_CD,
					   "DSP_MST_USE_YN" : "Y",
					   "DSP_MST_TXT" : item.PRD_MST_NM
					   },
			   success : function (data) {
				   if(data.resultCode != "200"){
					   	alert("실패했습니다"); 
				   } 
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
			   },
			   complete:function(){
				requestCount--;
				if(requestCount <=0){
					debugger;
					reqTabProductListAjax(mRegiTabType, mRegiTabIdx);				    
				}
			   }
			});
		});
	}
	// 선택 항목 삭제
	goRemoveChecked = function(item){
		
		var checkedRowSelector = $(item).data("type") == "T"? ".checkRow_top:checked":".checkRow_new:checked";
		
		if( $(checkedRowSelector).length==0 ){
			alert("삭제할 상품을 선택하여 주십시오.");
			return;
		}    	

		if( !confirm('체크된 항목을 삭제하시겠습니까?') ){
			return;
		}    	
		var arrayObj = new Array();
		$(checkedRowSelector).each(function(){
			arrayObj.push($(this).val());
		})
		
		$.ajax ({
		   async : false,
		   type : "POST",
		   url : "<c:out value="${serverDomain}" />/am/display/productDisplayTabProductDelAjax.do", 
		   data : {"arrDSP_MST_IDX":JSON.stringify(arrayObj) },
		   context:item,
		   success : function (data) {
			   if(data.resultCode != "200"){
				   	alert("실패했습니다"); 
					return;
			   }
			   $(checkedRowSelector).each(function(){
				   $(this).parent().parent().remove();
			   })
			   alert("성공적으로 삭제했습니다.");
		   },
		   error : function () {
			   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
		   }
		});
	};
	
	renderTab = function(container, tabData){
		$("#tabTemplate").tmpl(tabData).appendTo(container);
	}
	
	renderProductList = function(container, productList){
		
		if(container == null || productList == null){return;}
		container.empty();
		$.each(productList, function(index, item){
			if(item.DSP_TAB_TYP == 'T'){
				item.checkRow_type = "checkRow_top";
			}
			else{
				item.checkRow_type = "checkRow_new";
		    }
		});
		$("#productTemplate").tmpl(productList).appendTo(container);
	}
});

</script>