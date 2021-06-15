<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title"><span>${productCatList[1].TITLE } - ${productCatList[0].TITLE }</span></h3>
	
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="col-1-2 text-left">
			${productCatList[0].CMN_COM_ETC3 }	&nbsp;	
		</div>		
		<div class="col-1-2 text-right">
		    <a href="javascript:goRemoveChecked();" class="button small"><span>선택상품삭제</span></a>
		    <c:if test="${commandMap.CMN_COM_IDX eq Code.COMMON_THEME_PRODUCT_TIME_POPUP }">
		    	<a href="javascript:openSearchProductPopup('time');" class="button small primary" "title="새 창 으로 열립니다."><span>상품등록</span></a>
		    </c:if>
		    <c:if test="${commandMap.CMN_COM_IDX ne Code.COMMON_THEME_PRODUCT_TIME_POPUP }">
		    	<a href="javascript:openSearchProductPopup('product');" class="button small primary" "title="새 창 으로 열립니다."><span>상품등록</span></a>
	    	</c:if>
		</div>
	</div><!-- // 목록 상단 버튼 -->
	
	<form id="frm" name="frm">
		<input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
	    <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	    <input type="hidden" id="DSP_MST_ENV" name="DSP_MST_ENV" value="<c:out value="${commandMap.DSP_MST_ENV }"/>" />
	    <input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
    	
		<div class="table-a"><!-- col list -->
			<table class="table-col table-b">
				<colgroup>
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" class="checkbox checkAll" /></th>
						<th>상품코드</th>
						<th>이미지</th>
						<th>상품명</th>
						<th>전시여부</th>
						<th>판매상태</th>
						<th>등록일</th>
						<th>전시순서</th>
						<th>사용여부</th>
					</tr>
				</thead>
				<tbody class="sort-target">
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="row" items="${list }" varStatus="i">
								
								<tr>
									<td class="col-sort" data-bnr_dtl_idx="<c:out value="${row.DSP_MST_IDX }"/> " data-bnr_dtl_srt="<c:out value="${row.DSP_MST_SRT }"/> ">
										<input type="checkbox" class="checkbox checkRow" id="DSP_MST_IDX_${row.DSP_MST_IDX}" name="DSP_MST_IDX" value="${row.DSP_MST_IDX}" />
									</td>									
									<td>
										<a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
											<c:out value="${row.PRD_MST_CD }" /><br/>
											<c:if test="${not empty row.PRD_MST_ERP_CD}" >(<c:out value="${row.PRD_MST_ERP_CD }" />)</c:if>
										</a>
									</td>
									<td><img name="PRD_IMAGE" src="<c:out value="${cdnDomain}" />${row.PRD_IMAGE }"></td>
								    <td class="left" style="padding-left:10px">
										<input type="text" class="text" style="width:100%" name="DSP_MST_TXT" id="DSP_MST_TXT_<c:out value="${row.PRD_MST_CD }" />" value="<c:out value="${row.DSP_MST_TXT }" />" readonly/>
								    	<input type="hidden" class="PRD_MST_CDs" name="PRD_MST_CDs" value="${row.PRD_MST_CD }"/>
								    	
								    </td>
								    <td>
								    	<c:out value="${row.PRD_MST_DPL_STATE eq 'Y' ? '전시' : '미전시' }"/>
								    </td>
								    <td>
								    	<c:out value="${row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_ING ? '판매중' : row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT ? '일시품절' : row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT ? '품절상품' : row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP ? '미판매' : ''  }"/>
								    </td>
								    <td>
									    <ui:formatDate value="${row.DSP_MST_REG_DT }" pattern="yyyy-MM-dd"/>
								    </td>
							    	<td>
								    	<a href="#none" class="row-sort" data-sort_type="up">△ </a>
			                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
							    	</td>
							    	<td>
										<select name="DSP_MST_USE_YN" class="select">
											<option value="Y" <c:if test="${row.DSP_TAB_USE_YN eq 'Y'}">selected</c:if>>사용</option>
											<option value="N" <c:if test="${row.DSP_TAB_USE_YN eq 'N'}">selected</c:if>>미사용</option>
										</select>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->	
						   
    </form>
	<div class="section-button"><!-- section-button -->
		<div class="wrap text-center">
			<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
		</div>
	</div><!-- // section-button --> 
</div><!-- // contents-inner -->

<script type="text/javascript">
$(document).ready(function () {
	
	$.checkBoxSelect("checkAll", "checkRow");
	
/*     // 페이지 이동
    goPage = function (cPage){
        var $frm = $("#frm");
        var url = "<c:out value="${serverDomain}"/>/am/display/productDisplayList.do";
        $frm.find("input[name='searchBnrMstTitle']").val(Base64.encode($frm.find("input[name='searchBnrMstTitle']").val()));
        $frm.find("input[name='cPage']").val(cPage);
        callPageLoad(url, param);
    };
    
    // 페이지 로드
    callPageLoad = function (url, param) 
    {
        $("#main_con").empty();
        $("#main_con").load(url, param, function () {
            treePageSetting();
        });
    }; */
    
	 // 선택 항목 삭제
    goRemoveChecked = function(){

    	if( $(".checkRow:checked").length == 0 ){
    		alert("삭제할 상품을 선택하여 주십시오.");
    		return;
    	}    	

    	if( !confirm('체크된 항목을 삭제하시겠습니까?') ){
    		return;
    	}    	
    	
    	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/themeProductRemove.do", "target":"_self", "method":"post"}).submit();
    };
    
	//상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
     	var addedCnt = eval(params.length);
     	var bCheck = true;
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
    	
    	
    	var list_length = 0;
    	    	
    	if( $("input[name='DSP_MST_IDX']").length > 0 )
    	{
    		list_length = $("input[name='DSP_MST_IDX']").length;    				
    	}

    	
    	var frm = $("#frm");
    	
    	if( $("input[name='DSP_MST_IDX']").length > 0 )
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
    		frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/themeProductRegist.do", "target":"_self", "method":"post"}).submit();
    	}
    };
	//타임특가플로팅팝업 상품 검색 팝업 - 상품 선택시 호출되는 메소드
    fnResultTimeSaleProduct =  function(params){
    	debugger;
		var frm = $("#frm");
    	var bCheck = true;
    	//상품중복체크
    	$.each(params, function( index, el ){
    		if( !fnDuplicationChk( el.PRD_MST_CD ))
    		{
    			alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
				bCheck = false;
    			return false;
    		}
    	});
    	
    	$.each(params, function(index,item){
    		frm.append('<input type="hidden" class="checkbox checkRow" name="REG_DSP_MST_IDX" value="'+item.PRD_MST_CD+'" />');
    		frm.append('<input type="hidden" class="checkbox checkRow" name="DSP_MST_TXTs" value="'+item.PRD_MST_NM+'" />');
    	});
    	
		if(bCheck){
			frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/themeProductRegist.do", "target":"_self", "method":"post"}).submit();
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
    openSearchProductPopup = function (type)
    {
	 	if(type=='product')
 		{
	 		 popup('',"1100","700","no","_BasicProductPopup");
	     	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "target":"popup_BasicProductPopup", "method":"post"}).submit();	
 		}
	 	if(type == 'time')
 		{
	 		popup('',"1100","700","no","_TimeSaleProductPopup");	
	 		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/searchTimeSaleProductPopup.do", "target":"popup_TimeSaleProductPopup", "method":"post"}).submit();
 		}
       
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
 	$(document).off("click", "#goRegist");
    $(document).on("click", "#goRegist", function () {
    	var cmmIdx = $('#CMN_COM_IDX').val();


        if (confirm( "저장 하시겠습니까?")) {
	        var idxArray = new Array();
	        var sortArray = new Array();
	        var useArray = new Array();
	        
	        $(".sort-target").find("tr").each(function (i) {
	            var $tr = $(this).find(".col-sort");
	            idxArray.push($tr.data("bnr_dtl_idx"));
	            sortArray.push(i);
	            useArray.push($("select[name=DSP_MST_USE_YN]").val());
	        });
	        
	        $.ajax ({
	           async : false,
	           type : "POST",
	           url : "<c:out value="${serverDomain}" />/am/display/themeProductOrderAjax.do", 
	           data : {"DSP_MST_IDX":idxArray, 
	        	   		"DSP_MST_SRT":sortArray, 
	        	   		"DSP_MST_USE_YN":useArray,
	        	   		"DSP_MST_ENV":"${commandMap.DSP_MST_ENV}",
	        	   		"CMN_COM_IDX":"${commandMap.CMN_COM_IDX }" },
	           success : function (data) {
	               alert("수정 되었습니다."); 	
	           },
	           error : function () {
	               alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
	           }
	        });
        }
    });

    
});

</script>