<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 	    	<h2 class="title"><span>상품 상세보기</span></h2> -->
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>카테고리 검색</span></h3>
            </div><!-- // push-guide -->
            
            <form id="searchForm" name="searchForm">
            	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>카테고리</span></th>
		                    <td>
		                        <select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
									<option value="">전체</option>
								</select>
								<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
									<option value="">2차 카테고리</option>
								</select>
								<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
									<option value="">3차 카테고리</option>
								</select>
<!-- 								<select class="select" id="searchPrdCtgDepth4" name="searchPrdCtgDepth4" >
									<option value="">3차 분류</option>
								</select>
								<select class="select" id="searchPrdCtgDepth5" name="searchPrdCtgDepth5" >
									<option value="">4차 분류</option>
								</select> -->
		                    </td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>

			<div class="grid section-button-search"><!-- section button -->
				<a href="javascript:;" id="categoryApply" class="button small primary"><span>선택</span></a>
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
    
    // 적용 클릭 이벤트
    $(document).on("click", "#categoryApply", function () 
    {
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
       
        var params = {"CTG_IDX":categoryIdx, "CTG_PATH":categoryPath, "PRD_CTG_ENV":"${commandMap.PRD_CTG_ENV}"};
        window.opener.fnResultCategory(params);
        
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
