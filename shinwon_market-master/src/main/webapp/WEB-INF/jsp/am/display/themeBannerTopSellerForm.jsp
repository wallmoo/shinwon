<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<h3 class="title"><span>탑셀러 등록</span></h3>
	<div class="grid section-button-list">
		<div class="col-1-2 text-left">콘텐츠명 : 이미지 사이즈 (콘텐츠 정의)</div>		
	</div>
	<form name="frm" id="frm" enctype="multipart/form-data">
	<input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" />
	<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="BNR_MST_ENV" name="BNR_MST_ENV" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="useListNum" name="useListNum" value="<c:out value="${commandMap.useListNum}"/>"/>
	<input type="hidden" id="unUseListNum" name="unUseListNum" value="<c:out value="${commandMap.unUseListNum}"/>"/>
	<input type="hidden" id="minListLimit" name="minListLimit" value="<c:out value="${commandMap.minListLimit}"/>"/>
	<input type="hidden" id="maxListLimit" name="maxListLimit" value="<c:out value="${commandMap.maxListLimit}"/>"/>
	<input type="hidden" name="tagList" id="tagList">
	<input type="hidden" name="productList" id="productList">
	<input type="hidden" name="VDR_MST_IDX" id="VDR_MST_IDX">
	<input type="hidden" name="BNR_MST_TITLE" id="BNR_MST_TITLE">

	
	<table cellspacing="0" class="table-row table-a">
		<colgroup>
			<col style="width:15%">
			<col style="width:85%">
		</colgroup>
		<tbody>
			<tr>
				<th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" value="Y" checked="checked"><label for="BNR_MST_USE_YN1">사용</label>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" value="N"><label for="BNR_MST_USE_YN2">미사용</label>
				</td>
			</tr>
			<tr>
				<th><span>전시기간<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<div class="tbl_line">
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text small" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT"/>
						<select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.first}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }" /><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="59" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.first}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 분 ~
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text small" id="BNR_MST_ED_DT" name="BNR_MST_ED_DT"  readonly="readonly" data-target-start="#BNR_MST_ST_DT"/>
						<select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.last}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="59" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.last}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 분
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
					</div>
					<div class="tbl_line">
						* 전시기간은 ‘Today+1일’부터 설정 가능합니다.
					</div>
				</td>
			</tr>
			
			<tr>
				<th><span>셀러선택<i class="require"><em>필수입력</em></i></span></th>
				<td><a href="#" id="searchSellerBtn" class="searchSellerBtn button button-a xsmall">셀러선택</a> <span id="selNM">선택된 셀러 없음</span></td>
			</tr>			

			<tr>
				<th><span>TAG<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<div class="tag_cloud_wrap_side cf">
						<div class="tag_cloud_wrap">
							<ul class="tag_cloud_list">
							</ul>
						</div>
						<button type="button" id="tagBtn" class="button btn_tag_select">선택</button>
					</div>
				</td>
			</tr>

			<tr>
				<th><span>대표상품<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<div class="grid section-button-search">
						<a href="#none" id="" class="button button-a small warning goProductDelete"><span>선택삭제</span></a> 
						<a href="javascript:searchProduct();" id="" class="button button-b small"><span>상품검색</span></a>
						<a href="javascript:settingRefProduct();" id="" class="button button-b small primary"><span>대표상품 설정</span></a>
					</div>
					<table class="table-row table-a section-form">
						<caption></caption>
						<colgroup>
							<col style="width:33px">
							<col style="width:10%">
							<col style="width:90px;">
							<col style="width:auto">
							<col style="width:10%">
							<col style="width:10%">
							<col style="width:10%">
						</colgroup>
						<thead class="center">
							<tr>
								<th scope="col"><input type="checkbox" name="" id="allCheckboxBtn"></th>
								<th scope="col">상품코드</th>
								<th scope="col">이미지</th>
								<th scope="col">상품명</th>
								<th scope="col">상품가격</th>
								<th scope="col">판매상태</th>
								<th scope="col">쇼핑채널</th>
							</tr>
						</thead>
						<tbody class="center applyProductList">
							<tr class="productNodata"><!-- row -->
                                <td colspan="10" class="text-center">상품을 선택해 주세요.</td>
                            </tr>
						</tbody>
					</table>
				</td>
			</tr>

			<tr>
				<th><label for="">URL<i class="require"><em>필수입력</em></i></label></th>
				<td>
					<div class="tbl_line">
						<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text xlarge" maxlength="250">
					</div>
					<div class="tbl_line">
						* 팝업에 등록되는 배너는 현재창으로 링크가 안됩니다.
					</div>
				</td>
			</tr>
			
		</tbody>
	</table><!-- // table -->
			
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
		<a href="javascript:goList('${codeRow.CMN_COM_IDX}');" class="button large"><span>목록</span></a>
	</div>
</div><!-- // section-button --> 
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
    <td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="PLN_PRD_MST_CD" name="PLN_PRD_MST_CD\${NUM}" value="\${PRD_MST_CD}"/></td>
	<td><img src="\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></td>
    <!--<td class="left"><img name="PRD_IMAGE" src="<c:out value="\${cdnDomain}" />\${PRD_MST_CD }"></td>-->
    <td>\${PRD_MST_NM}</td>
    <td>\${PRD_MST_PRC}</td>
    <td>\${PRD_MST_SEL_STATE}</td>
	<td>\${PRD_MST_CHANNEL_TYPE}</td>
</tr>
</script>
<%-- <ui:editor objId="#BNR_MST_CONTENTS" /> --%>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script type="text/javascript">
$(function () {
	var data = new Array();
	var fileFlag = true;
    var validation = true;
	<%--
	var editorBannerFlag = false;
	<c:if test="${codeRow.CMN_COM_IDX eq Code.MAIN_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_P_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_S_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_M_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_J_B_A_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_W_B_E_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_M_B_E_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_K_B_E_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_A_B_E_CODE	or codeRow.CMN_COM_IDX eq Code.CATEGORY_B_B_E_CODE}" >
		fileFlag = false;
		editorBannerFlag = true;
	</c:if>
	--%>

	
	// 폼체크
	$("#frm").validate({
		rules: 
		{
			BNR_MST_ST_DT:{required:true, date:true}, // 전시기간 시작일
			BNR_MST_ST_HH:{required:true, number:true}, // 전시기간 시작 시
			BNR_MST_ST_MM:{required:true, number:true}, // 전시기간 시작 분
			BNR_MST_ED_DT:{required:true, date:true}, // 전시기간 종료일
			BNR_MST_ED_HH:{required:true, number:true}, // 전시기간 종료 시
			BNR_MST_ED_MM:{required:true, number:true}, // 전시기간 종료 분
			BNR_MST_USE_YN:{required:true}, // 상태
			PRD_MST_CDs: {required:true},
            BNR_MST_URL:{required:true, url:true} // 링크 주소
		},
		messages:
		{
			BNR_MST_ST_DT:{required:"시작일은 필수 선택사항입니다.", date:"시작일 날짜가 잘못 입력되었습니다."},
			BNR_MST_ST_HH:{required:"시작시는 필수 선택사항입니다.", number:"시작시는 숫자만 입력해 주십시오."},
			BNR_MST_ST_MM:{required:"시작분은 필수 선택사항입니다.", number:"시작분은 숫자만 입력해 주십시오."},
			BNR_MST_ED_DT:{required:"종료일은 필수 선택사항입니다.", date:"종료일 날짜가 잘못 입력되었습니다."},
			BNR_MST_ED_HH:{required:"종료시는 필수 선택사항입니다.", number:"종료시는 숫자만 입력해 주십시오."},
			BNR_MST_ED_MM:{required:"종료분은 필수 선택사항입니다.", number:"종료분은 숫자만 입력해 주십시오."},
			PRD_MST_CDs:{required:"대표상품은 필수 입력사항입니다"},
			BNR_MST_URL:{required:"URL은 필수 입력사항입니다.", url:"URL규칙에 어긋납니다"}
		}
	});
	

	var searchGubun = $('input:radio[name=searchGubun]:checked').val();


	
    /* $.ajax({
        type : "POST",
        async:true,
        dataType :"html",
        url : '<c:out value="${serverDomain}"/>/am/display/themeBannerList.do',
        data : {
               'CMN_COM_IDX' : idx,
               'searchGubun' : searchGubun
               },  
        success : function(data){
            $('#main_con').html(data);  
        }
    });  */
    
     // 목록 이동 함수
    goList = function (idx){
    	var searchGubun = $('input:radio[name=searchGubun]:checked').val();
        $.ajax({
            type : "POST",
            async:true,
            dataType :"html",
            url : '<c:out value="${serverDomain}"/>/am/display/themeBannerList.do',
            data : {
                   'CMN_COM_IDX' : idx,
                   'searchGubun' : searchGubun
                   },  
            success : function(data){
                $('#main_con').html(data);  
            }
        }); 
        
    }; 
    
    // submit 
    goRegist = function () {
        var $frm = $("#frm");
        var url = "<c:out value="${serverDomain}"/>/am/display/themeBannerRegist.do";
        $("#tagList").val(fnGetSelectedTagList());
        $("#productList").val(fnGetSelectedProductList());
        
        if($frm.valid())
        {
        	if($("#listNum").val()==$("#maxListLimit").val() && $("input:radio[name='BNR_MST_USE_YN']:checked").val() == 'Y'){
        		alert("최대노출개수를 초과하셨습니다.");
        		return;
        	}
        	if($("#VDR_MST_IDX").val() == ""){
        		alert("셀러를 입력해주세요.");
        		return;
        	}
        	
        	if($("#tagList").val() == "[]"){
        		alert("태그를 입력해주세요.");
        		return;
        	}
        	if($(".sel_tag_list").length > 6){
        		alert("TAG는 최대 6개를 선택 할 수 있습니다");
        		return;
        	}
        	
        	if($("#productList").val() == "[]"){
        		alert("상품을 입력해주세요.");
        		return;
        	}
       		if(validation){
       			alert("대표상품을 설정해주세요.");
        		return;
       		}
       		
            if($("#useListNum").val()==$("#maxListLimit").val() && $("input:radio[name='BNR_MST_USE_YN']:checked").val() == 'Y'){
				alert("최대 " + $("#maxListLimit").val() + "개의 배너를 노출 할 수 있습니다.");
        		return;
        	}
            if (confirm( "저장 하시겠습니까?")){
                $frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
            }
        }
    };
    settingRefProduct = function(){
    	var count = 0;
    	data = [];
    	if($("#VDR_MST_IDX").val() == ""){
    		alert("셀러를 입력해주세요.");
    		return;
    	}
    	$(".applyProductList").children("tr").each(function() {
            if($(this).find(".checkRow").is(":checked")){
                count++;
            }
        });
    	if(count==0){
    		alert("대표상품을 선택해주세요.")
    		return false;
    	}
    	
    	if (confirm("대표상품으로 설정하겠습니까?")){
    		$(".applyProductList").children("tr").each(function() {
                if($(this).find(".checkRow").is(":checked")){
                	var obj = $(this).find(".checkRow").val();
                	data.push(obj);
                }
            });
    		alert("대표상품으로 설정되었습니다");
    		
        }
    }
     // 페이지 로드
    callPageLoad = function (url, param) 
    {
        $("#main_con").empty();
        $("#main_con").load(url, param, function () {
        	treePageSetting();
        });
    };
    
    $("#tagBtn").on("click",function(){
    	popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do", "900", "500", "yes");
    });
	
    
	$(".searchSellerBtn").on("click",function(){
    	popup("<c:out value="${serverDomain}" />/am/site/searchSellerPopup.do", "900", "500", "yes");
    });
   	searchProduct = function () {
   		if($("#VDR_MST_IDX").val() == ""){
    		alert("셀러를 입력해주세요.");
    		return;
    	}
   		$productBox = $(this).parents(".section-button-search");
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
        
    };
    $(document).on("click", ".btn_del", function() {
	 	for(var i=0;i<tagList.length;i++){
	 		if(tagList[i] + "X" == $(this).parent().text()){
	 			tagList.splice(i,1);
	 			break;
	 		}
	 	}
	 	$(this).parent().remove();
	 });
    fnResultTag = function(params){
    	tagList = new Array();
    	$(".tag_cloud_list").children().remove()
    	for(var i=0;i<params.length;i++){
    		$(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">'+ params[i].value +'<button type="button" class="btn_del button">X</button></li>')
    		tagList.push(params[i]);
    	}
    }
    fnGetSelectedTagList = function(){
    	var selectedTagList = new Array();
    	$(".sel_tag_list").each(function(){
    		var obj = new Object();
    		obj.TAG_MST_ID = $(this).attr("value");
    		selectedTagList.push(obj);
    	});    	
    	return JSON.stringify(selectedTagList);;
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
		if(params.length + $(".checkRow").length >3){
			alert("상품은 3개를 초과할 수 없습니다");
            return false;
		}
        //기본TR삭제
        $(".productNodata").remove();
        //배열재정의
        var arrayObj = new Array();
        var len = $(".applyProductList .PLN_PRD_MST_CD").length;

        var obj;
        if( bCheck ){

            $.each(params, function(index,item){
                len++;
                obj = new Object();
                obj.PRD_MST_CD          = item.PRD_MST_CD;
                obj.PRD_MST_NM          = item.PRD_MST_NM;
                obj.PRD_MST_PRC         = setComma(item.PRD_MST_PRC);
                obj.PRD_MST_DLV_FEE     = setComma(item.PRD_MST_DLV_FEE);
                obj.PRD_MST_SEL_STATE   = item.PRD_MST_SEL_STATE;
                obj.VDR_MST_NM          = item.VDR_MST_NM;
                obj.PRD_IMAGE           = item.PRD_IMAGE;
                obj.PLN_DTL_ORDER       = len;
                obj.NUM = $productBox.find(".groupNum").val();
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
        return true;
    };
  //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .PLN_PRD_MST_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    fnResultSeller = function(selMstNm,selMstIdx){
    	$("#VDR_MST_IDX").val(selMstIdx);
    	$("#selNM").text(selMstNm);
    	$("#BNR_MST_TITLE").text(selMstNm);
    	
    };
    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".goProductDelete", function () {
        $(".applyProductList").children("tr").each(function() {
            if($(this).find(".checkRow").is(":checked"))
            {
                $(this).remove();
            }
        });

    });
    $("#allCheckboxBtn").on("click",function(){
		if($("#allCheckboxBtn").is(":checked")){
	    	$(".applyProductList").children("tr").each(function() {
	    		$(this).find(".checkRow").prop("checked", true); 
	    	});
    	}else{
			$(".applyProductList").children("tr").each(function() {
				$(this).find(".checkRow").prop("checked", false);
	    	});
    	}
    })
    fnGetSelectedProductList = function(){
    	var arrayObj = new Array();
    	validation = true;
    	$(".applyProductList").children("tr").each(function() {
    		if($(this).hasClass("productNodata")) return false;
   			var obj = new Object()
             if(data.includes($(this).find(".checkRow").val())){
            	 obj.BNR_PRD_MST_CD = $(this).find(".checkRow").val()
            	 obj.BNR_PRD_REF_USE_YN = "Y";
        		validation = false;
             }else{
            	 obj.BNR_PRD_MST_CD = $(this).find(".checkRow").val()
            	 obj.BNR_PRD_REF_USE_YN = "N";
             }
   			arrayObj.push(obj);
         });
    	return JSON.stringify(arrayObj);
    }
});

</script>
</body>
</html>