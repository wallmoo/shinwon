<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <h3 class="title"><span>카테고리 변경</span></h3>
                <form id="" name="">
                    <table class="table-row table-a">
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>카테고리</span></th>
                                <td>
                                    <div class="tbl_line cf">
                                        <div class="tbl_line_left">
                                            <select name="searchPrdCtgDepth1" id="searchPrdCtgDepth1" class="select">
                                                <option value="" selected title="1차 카테고리 선택">1차 카테고리</option>
                                            </select>
                                            <select name="searchPrdCtgDepth2" id="searchPrdCtgDepth2" class="select">
                                                <option value="" selected title="2차 카테고리 선택">2차 카테고리</option>
                                            </select>
                                            <select name="searchPrdCtgDepth3" id="searchPrdCtgDepth3" class="select">
                                                <option value="" selected title="3차 카테고리 선택">3차 카테고리</option>
                                            </select>
                                        </div>
                                        <div class="tbl_line_right">
                                            <a href="javascript:;" class="button button-a small" id="goCategoryDelete_P"><span>선택삭제</span></a>
                                            <a href="javascript:;" class="button button-a small" id="categoryApply"><span>카테고리 추가</span></a>
                                        </div>
                                    </div>
                                    <table class="table-row table-a">
                                        <colgroup>
                                            <col style="width:46px;">
                                            <col style="width:auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" class="checkbox"></th>
                                                <th class="ac">카테고리 경로</th>
                                            </tr>
                                        </thead>
                                        <tbody id="applyCategoryList_P">
                                            <tr id="categoryNodata_P">
                                                <td colspan="2" class="ac">카테고리를 선택해주세요.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- 
                    <table class="table-row table-a">
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>MOBILE 카테고리</span></th>
                                <td>
                                    <div class="tbl_line cf">
                                        <div class="tbl_line_left">
                                            <select name="searchPrdCtgDepthM1" id="searchPrdCtgDepthM1" class="select">
                                                <option value="" selected title="1차 카테고리 선택">1차 카테고리</option>
                                            </select>
                                            <select name="searchPrdCtgDepthM2" id="searchPrdCtgDepthM2" class="select">
                                                <option value="" selected title="2차 카테고리 선택">2차 카테고리</option>
                                            </select>
                                            <select name="searchPrdCtgDepthM3" id="searchPrdCtgDepthM3" class="select">
                                                <option value="" selected title="3차 카테고리 선택">3차 카테고리</option>
                                            </select>
                                        </div>
                                        <div class="tbl_line_right">
                                            <a href="javascript:;" class="button button-a small" id="goCategoryDelete_M"><span>선택삭제</span></a>
                                            <a href="javascript:;" class="button button-a small" id="categoryApplyM"><span>카테고리 추가</span></a>
                                        </div>
                                    </div>
                                    <table class="table-row table-a">
                                        <colgroup>
                                            <col style="width:46px;">
                                            <col style="width:auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" class="checkbox"></th>
                                                <th class="ac">카테고리 경로</th>
                                            </tr>
                                        </thead>
                                        <tbody id="applyCategoryList_M">
                                        	<tr id="categoryNodata_M">
                                                <td colspan="2" class="ac">카테고리를 선택해주세요.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    -->
                </form>
                <form id="frm" name="frm">
                	<input type="hidden" id="productData" name="productData"/>
                	<input type="hidden" id="arrPRD_CTG_IDX" name="arrPRD_CTG_IDX"/>
	                <div class="grid section-button-search ac">
						<a href="javascript:goRegist();" class="button small primary"><span>저장</span></a>
						<a href="#none" id="closePopup" class="button small"><span>닫기</span></a>
					</div>
                </form>
            </div>
        </div>
    </div>
    <script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
    <script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
    <script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="categoryTemplate" type="text/x-jquery-tmpl">
<tr>
	<th style="background-color:#fff;"><input type="checkbox" class="checkbox checkRow_\${PRD_CTG_ENV}" name="PRD_CTG_IDXs_\${PRD_CTG_ENV}" value="\${CTG_IDX}"/></th>
	<td class="left">\${CTG_PATH}<input type="hidden" name="PRD_CTG_IDXs" value="\${CTG_IDX}"/></td>
</tr>
</script>
 <script>
   $(document).ready(function (){
  		    // 카테고리 1depth 설정
   		getCategoryList("searchPrdCtgDepth1", "-1", "", "<c:out value="${serverDomain}"/>","<c:out value="${commandMap.PRD_CTG_ENV}"/>");

	    // 카테고리 변경 이벤트
	    $(document).on("change", "#searchPrdCtgDepth1", function () 
	    {
	        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
	        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
	    });
	    $(document).on("change", "#searchPrdCtgDepth2", function () 
	    {
	        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
	    });
		
	    /*
		// 카테고리 1depth 설정
   		getCategoryList("searchPrdCtgDepthM1", "-1", "", "<c:out value="${serverDomain}"/>","M");

	    // 카테고리 변경 이벤트
	    $(document).on("change", "#searchPrdCtgDepthM1", function () 
	    {
	        getCategoryList("searchPrdCtgDepthM2", $("#searchPrdCtgDepthM1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "M");
	        getCategoryList("searchPrdCtgDepthM3", "", "", "<c:out value="${serverDomain}"/>", "M");
	    });
	    $(document).on("change", "#searchPrdCtgDepth2", function () 
	    {
	        getCategoryList("searchPrdCtgDepthM3", $("#searchPrdCtgDepthM2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "M");
	    });
	    */
	    
	 // 적용 클릭 이벤트
	    $(document).on("click", "#categoryApply", function (){
	        var categoryIdx = "";
	        var categoryPath = "";

	        if ( $("#searchPrdCtgDepth1 option:selected").val() == '')
	        {
	        	alert("적용할 카테고리를 선택해 주십시오.");
	        	return;
	        }

	        if ( $("#searchPrdCtgDepth1 option:selected").val() != '')
	        {
	        	categoryIdx = $("#searchPrdCtgDepth1 option:selected").val();
	        	categoryPath = $("#searchPrdCtgDepth1 option:selected").text();
	        }

	        if ( $("#searchPrdCtgDepth2 option:selected").val() != '')
	        {
	        	categoryIdx = $("#searchPrdCtgDepth2 option:selected").val();
	        	categoryPath += " > " + $("#searchPrdCtgDepth2 option:selected").text();
	        }

	        if ( $("#searchPrdCtgDepth3 option:selected").val() != '')
	        {
	        	categoryIdx = $("#searchPrdCtgDepth3 option:selected").val();
	        	categoryPath += " > " + $("#searchPrdCtgDepth3 option:selected").text();
	        }
	       
	        var params = {"CTG_IDX":categoryIdx, "CTG_PATH":categoryPath, "PRD_CTG_ENV":"P"};
	        fnResultCategory(params);
	    });
	    
	    /*
	    $(document).on("click", "#categoryApplyM", function (){
	        var categoryIdx = "";
	        var categoryPath = "";

	        if ( $("#searchPrdCtgDepth1 option:selected").val() == '')
	        {
	        	alert("적용할 카테고리를 선택해 주십시오.");
	        	return;
	        }

	        if ( $("#searchPrdCtgDepth1 option:selected").val() != '')
	        {
	        	categoryIdx = $("#searchPrdCtgDepth1 option:selected").val();
	        	categoryPath = $("#searchPrdCtgDepth1 option:selected").text();
	        }

	        if ( $("#searchPrdCtgDepth2 option:selected").val() != '')
	        {
	        	categoryIdx = $("#searchPrdCtgDepth2 option:selected").val();
	        	categoryPath += " > " + $("#searchPrdCtgDepth2 option:selected").text();
	        }

	        if ( $("#searchPrdCtgDepth3 option:selected").val() != '')
	        {
	        	categoryIdx = $("#searchPrdCtgDepth3 option:selected").val();
	        	categoryPath += " > " + $("#searchPrdCtgDepth3 option:selected").text();
	        }
	       
	        var params = {"CTG_IDX":categoryIdx, "CTG_PATH":categoryPath, "PRD_CTG_ENV":"M"};
	        fnResultCategory(params);
	    });
	    */
	    
	    fnResultCategory = function(params) {
			var bCheck = true;
			var $obj = $("#applyCategoryList_" + params.PRD_CTG_ENV
					+ " input[name='PRD_CTG_IDXs_" + params.PRD_CTG_ENV
					+ "']");
			$.each($obj, function() {
				if (params.CTG_IDX == $(this).val()) {
					alert("[" + params.CTG_PATH + "] 이미 선택된 카테고리입니다.");
					bCheck = false;
					return false;
				}
			});

			if (bCheck) {
				//기본TR삭제
				$("#categoryNodata_" + params.PRD_CTG_ENV).remove();

				var idx = $("#applyCategoryList_" + params.PRD_CTG_ENV).find("tr").length;
				params.IDX = ++idx;

				if (params.PRD_CTG_ENV == "P") {
					$("#CTG_PATH").val(params.CTG_PATH);
				}

				$("#categoryTemplate").tmpl(params).appendTo("#applyCategoryList_" + params.PRD_CTG_ENV);
			}
		};
		goRegist = function(){
	   		var arrayObj = new Array();
	   		var arrayCategoryIdx  = new Array();
	   		if($("input[name=PRD_CTG_IDXs]").length==0){
	   			alert("선택한 카테고리가 없습니다.");
	   			return;
	   		}
	   		if(confirm("선택한 카테고리로 변경하시겠습니까?")){
	   			var selectedProductList = window.opener.getSelectedProductList();
	   			selectedProductList.each(function(){
	   				var obj = new Object;
	   				obj.PRD_MST_CD = $(this).parent().parent().find("input[name=PRD_MST_CDs]").val();
   					//console.log ('===============PRD_MST_CD: ' + $(this).parent().parent().find("input[name=PRD_MST_CDs]").val() )	   				
	   				
	   				arrayObj.push(obj);
	   			});
	   			
   				$("input[name=PRD_CTG_IDXs]").each(function(){
   					var categoryObj = new Object();
   					categoryObj.PRD_CTG_IDX = $(this).val();
   					
   					
   					//console.log ('------------PRD_CTG_IDX: ' + $(this).val() )
   					
   					arrayCategoryIdx.push(categoryObj);
	   			});
   				$("#arrPRD_CTG_IDX").val(JSON.stringify(arrayCategoryIdx));
	   			$("#productData").val(JSON.stringify(arrayObj));
	   			
	   			//return ;
	   			$("#frm").attr({
								"action" : "<c:out value="${serverDomain}" />/am/product/basicProductCategoryModify.do",
								"target" : "_self",
								"method" : "post"
							}).submit(); 
	   			window.opener.location.reload();
	   			self.close();
	   		}
		};
	   	$("#closePopup").on("click",function(){
	   		self.close();
	   	});
  	});

    	 
 </script>		
</body>
</html>