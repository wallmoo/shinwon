<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.market.mall.common.constants.RESELLER_BAN_CODE"%>


<h3 class="title">배너 등록</h3>

<p>
	<i class="require"><em>필수입력</em></i> ${bnrCatList[0].CMN_COM_ETC3 }
</p>
<p>
	<i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
</p>

<form name="frm" id="frm" enctype="multipart/form-data">
	<input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${commandMap.BNR_MST_GBN }"/>" />
	<input type="hidden" id="BNR_MST_ENV" name="BNR_MST_ENV" value="<c:out value="${commandMap.searchGubun }"/>" />	

	<table cellspacing="0" class="table-row table-a"><!-- table -->
		<colgroup>
			<col style="width: auto;" />
			<col style="width: auto;" />
		</colgroup>
		<tbody>
			<tr>
				<th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" class="radio" value="Y" checked=true/>
					<label for="BNR_MST_USE_YN1">사용</label>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" class="radio" value="N"/>
					<label for="BNR_MST_USE_YN1">미사용</label>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" style="width: 80%;" maxlength="150"/>
				</td>
			</tr>




		     <c:choose>
		         <c:when test="${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PICK}">
                       <tr>
                           <th><label class="label"><span>셀러픽<i class="require"><em>필수입력</em></i></span></label></th>
                           <td>
                               <div id="productBox">
                					<div class="section-form addFormCon productSelectform" data-type="basic">
                    					<input type="hidden" name="groupNum" class="groupNum" value="0"/>
					                    <table cellspacing="0" class="table-row table-a"><!-- table -->
					                        <tbody>
					                            <tr>
					                                <td>
					                                    <div class="grid section-button-search left"><!-- section button -->
					                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small goProductDelete"><span>선택삭제</span></a>
					                                        <a href="#none" class="button small search-sellerPick-popup" title="새 창 으로 열립니다."><span>셀러픽등록</span></a>
					                                    </div><!-- // section button -->
					                                    <table class="table-row table-a">
					                                        <colgroup>
					                                            <col style="width: 10%;" />
							                                    <col style="width: 50%;" />
					                                            <col style="width: 40%;" />
					             
					                                        </colgroup>
					                                        <thead>
					                                            <tr>
					                                                <th><input type="checkbox" class="checkbox checkAll" /></th>
					                                                <th>셀러픽명</th>
					                                                <th>등록일</th>
					                                            </tr>
					                                        </thead>
					                                        <tbody class="applyProductList">
					                                        </tbody>
					                                    </table>
					                                </td>
					                            </tr>
					                        </tbody>
					                    </table>
				                    </div><!-- //section-form addFormCon -->
				                </div><!-- //id="product" -->
                           </td>
                       </tr>
		         </c:when>
		          </c:choose>
                   <!-- 
					<tr>
					<th><label class="label"><span>대체 텍스트</span></label></th>
						<td>
							<textarea  name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="textarea xlarge" style="width: 80%;" maxlength="300"></textarea>
						</td>
					</tr>
					-->
		        
		     
		</tbody>
	</table><!-- // table -->
			
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
		<%-- <a href="javascript:goList('${codeRow.CMN_COM_IDX}');" class="button large"><span>목록</span></a> --%>
	</div>
</div><!-- // section-button --> 

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="sallerPickTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="CNT_MST_IDXs" value="\${CNT_MST_IDX}"/></td>
    <td><a href="\${serverDomain}/am/display/vendorSellerPickEdit.do?CNT_MST_IDX=\${CNT_MST_IDX}" target="_blank" title="새 창 으로 열립니다.">\${CNT_MST_TITLE}</a><input type="hidden" class="CNT_CNT_MST_IDX" name="CNT_MST_IDX\${NUM}" value="\${CNT_MST_IDX}"/><input type="hidden" name="CNT_MST_LIST" value="\${CNT_MST_IDX}"/></td>
	<td>\${CNT_MST_REG_DT}</td>
</tr>
</script>
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="CNT_MST_IDXs" value="\${CNT_MST_IDX}"/></td>
    <td><a href="\${serverDomain}/am/product/basicProductEdit.do?CNT_MST_IDX=\${CNT_MST_IDX}" target="_blank" title="새 창 으로 열립니다.">\${CNT_MST_TITLE}</a><input type="hidden" class="CNT_CNT_MST_IDX" name="CNT_MST_IDX\${NUM}" value="\${CNT_MST_IDX}"/><input type="hidden" name="CNT_MST_LIST" value="\${CNT_MST_IDX}"/></td>
	<td>\${PRD_MST_REG_DT}</td>

    <td>
		<c:if test="${row.CNT_DTL_ORDER ne 1 }">
        <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.CNT_DTL_ORDER ne fn:length(list) }">
 		<a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="CNT_DTL_ORDER_\${NUM}_\${PRD_MST_CD}" value="\${CNT_DTL_ORDER}"></input>
    </td>

</tr>
</script>

<script type="text/javascript">
$(function () {
	
	var fileFlag = false;
	var urlFlag = false;
	
	if($('#required_file').val() == 'Y') fileFlag = true;
	
	// 폼체크
	$("#frm").validate({
		rules: 
		{
			BNR_MST_TITLE:{required:true}, // 제목
			BNR_MST_USE_YN:{required:true} // 상태
			
			
		},
		messages:
		{
			BNR_MST_TITLE:{required:"제목을 입력하세요"},
			BNR_MST_USE_YN:{required:"사용 여부를 선택하세요"}
		}
	});
	
	$.checkBoxSelect("checkAll", "checkRow");
	
	function hasExtension(inputID, exts) {
		if(!fileFlag){return true;}
	    var fileName = document.getElementById(inputID).value;
	    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
	}
	
	// submit 
	goRegist = function () {
		
		var $topParent = $(this).parents(".section-form");


		var $frm = $("#frm");
		var url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerSellerPickRegist.do";
		if($frm.valid())
		{
			if( $(".applyProductList").children("tr").length == 0){
				alert('셀러픽을 한개 이상 선택하세요');
				return;
			}
			

			if (confirm( "저장 하시겠습니까?")) 
			{
				$frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
			}
		}


	};
	
	var $productBox = null;
    $(document).on("click", "#productBox .search-sellerPick-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".productSelectform");

        popup("<c:out value="${serverDomain}" />/am/display/searchSallerPickPopup.do", "900", "500", "yes", "searchProduct");

        //popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
        
        
        
    });
    

    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .CNT_CNT_MST_IDX");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
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
            if( !fnDuplicationChk( el.CNT_MST_IDX )){
                alert("["+el.CNT_MST_TITLE+"] 이미 선택된 항목입니다.");
                bCheck = false;
                return false;
            }
        });

        //기본TR삭제
        $productBox.find(".productNodata").remove();
        //배열재정의
        var arrayObj = new Array();
        var len = $productBox.find(".applyProductList .CNT_PRD_MST_CD").length;

        var obj;
        if( bCheck ){
        	 
            $.each(params, function(index,item){
            	debugger;
                len++;
                obj = new Object();
                obj.CNT_MST_IDX    = item.CNT_MST_IDX;
                obj.CNT_MST_TITLE  = item.CNT_MST_TITLE;
                obj.CNT_MST_REG_DT = item.CNT_MST_REG_DT;
                obj.CNT_DTL_ORDER  = len;
                obj.NUM            = $productBox.find(".groupNum").val();
                obj.serverDomain            = '<c:out value="${serverDomain}" />';
                arrayObj.push(obj); //만들어진  object를 배열에 추가
            });
            $( "#sallerPickTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));
        }
        return true;
    };
    
    $(document).on("click", ".goProductDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 상품을 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyProductList").children("tr").each(function() {

            if($(this).find(".checkRow").is(":checked"))
            {
                $(this).remove();
            }
        });
        
        //사용상품 삭제시 순서 재배치
        /*
        var index = 1;
        $topParent.find(".applyProductList").children("tr").each(function() {
        	$(this).children()[9].children[2].value = index++;
        });

        if($topParent.find(".applyProductList").children("tr").length == 0)
        {
            $topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        */
        //체크박스 전체 선택
        $topParent.find(".checkAll").prop("checked", false);

    });
    
    
});

</script>
</body>
</html>