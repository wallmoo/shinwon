<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/js/ark_manufacturer.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/js/search.js"></script>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <h3 class="title"><span>스펙 검색</span></h3>
            </div><!-- // push-guide -->
            
	        <form id="searchForm" name="searchForm">
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 30%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>스펙</span></th>
		                    <td>
		                        <select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
									<option value="">전체</option>
								</select>
								<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
									<option value="">1차 분류</option>
								</select>
								<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
									<option value="">2차 분류</option>
								</select>
								<c:if test="${commandMap.PRD_SPC_TYPE eq 'P' }">
									<select class="select" id="searchPrdCtgDepth4" name="searchPrdCtgDepth4" >
										<option value="">항목 분류</option>
									</select>
								</c:if>
		                    </td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
			<div class="grid section-button-search"><!-- section button -->
				<a href="#none" id="SpeccategoryApply" class="button small primary"><span>선택</span></a>
				<a href="#none" id="closePopup" class="button small"><span>취소</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
	var PRD_SPC_TYPE ="<c:out value="${commandMap.PRD_SPC_TYPE}" />";
    // 카테고리 1depth 설정
    getSpecList("searchPrdCtgDepth1", "-1", "", "<c:out value="${serverDomain}"/>","<c:out value="${commandMap.PRD_SPC_ENV}"/>");

    // 카테고리 변경 이벤트
    $(document).on("change", "#searchPrdCtgDepth1", function () 
    {
    	getSpecList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_SPC_ENV}");
    	getSpecList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_SPC_ENV}");
    });
    if(PRD_SPC_TYPE == "P"){
	    $(document).on("change", "#searchPrdCtgDepth2", function () 
	    {
	    	getSpecList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_SPC_ENV}");
	    	getSpecList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_SPC_ENV}");
	    });
	    $(document).on("change", "#searchPrdCtgDepth3", function () 
   	    {
   	    	getSpecList("searchPrdCtgDepth4", $("#searchPrdCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_SPC_ENV}");
   	    });
    }else{
    	$(document).on("change", "#searchPrdCtgDepth2", function () 
	    {
	    	getSpecList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_SPC_ENV}");
	    });
    }
    
    // 적용 클릭 이벤트
    $(document).on("click", "#SpeccategoryApply", function () 
    {
        var categoryIdx = "";
        var categoryPath = "";

        if ( $("#searchPrdCtgDepth1 option:selected").val() == '')
        {
        	alert("적용할 스팩을 선택해 주십시오.");
        	return;
        }

        if ( $("#searchPrdCtgDepth1 option:selected").val() != '')
        {
        	specCategoryIdx = $("#searchPrdCtgDepth1 option:selected").val();
        	specCategoryPath = $("#searchPrdCtgDepth1 option:selected").text();
        }

        if ( $("#searchPrdCtgDepth2 option:selected").val() != '')
        {
        	specCategoryIdx = $("#searchPrdCtgDepth2 option:selected").val();
        	specCategoryPath += " > " + $("#searchPrdCtgDepth2 option:selected").text();
        }

        if ( $("#searchPrdCtgDepth3 option:selected").val() != '')
        {
        	specCategoryIdx = $("#searchPrdCtgDepth3 option:selected").val();
        	specCategoryPath += " > " + $("#searchPrdCtgDepth3 option:selected").text();
        }
        else{
        	alert("스팩등록은 3뎁스 까지 선택 하셔야 합니다.");
        	return;
        }
        if(PRD_SPC_TYPE == "P"){
        	if ( $("#searchPrdCtgDepth4 option:selected").val() != '')
            {
            	specCategoryIdx = $("#searchPrdCtgDepth4 option:selected").val();
            	specCategoryPath += " > " + $("#searchPrdCtgDepth4 option:selected").text();
            }else{
            	alert("상품의 스펙등록은 항목까지 선택 하셔야합니다.");
            	return;
            }
        }
        
        var params = {"SPC_IDX":specCategoryIdx, "SPC_PATH":specCategoryPath, "PRD_SPC_ENV":"${commandMap.PRD_SPC_ENV}"};
        window.opener.fnResultSpecCategory(params);
        
        self.close();
    });
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});  
        
});


</script>
</body>
</html>
