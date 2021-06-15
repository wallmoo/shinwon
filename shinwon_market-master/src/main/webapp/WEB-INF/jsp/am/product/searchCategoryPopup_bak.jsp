<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
   <h1 class="title">카테고리검색</h1>
   <a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

   <div id="contents"><!-- contents -->

      <div class="title-box">
         <h4 class="title">카테고리 검색</h4>

      </div>

      <div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
        
         <div class="form-group">
            <label class="label"><span> 카테고리</span></label>
            <div class="field">
               <select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" >
                  <option value="">전체</option>
               </select>
               <select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" >
                  <option value="">1차 분류</option>
               </select>
               <select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" >
                  <option value="">2차 분류</option>
               </select>
               <select class="select" id="searchPrdCtgDepth4" name="searchPrdCtgDepth4" >
                  <option value="">3차 분류</option>
               </select>
               <select class="select" id="searchPrdCtgDepth5" name="searchPrdCtgDepth5" >
                  <option value="">4차 분류</option>
               </select>
            </div>
         </div>
        
      </form>

      </div><!-- // section-form-a -->

      <div class="section-button-popup"><!-- section button -->
         <a href="#none" id="categoryApply" class="button button-b"><span>선택</span></a>
         <a href="#none" id="closePopup" class="button button-b"><span>취소</span></a>
      </div><!-- // section button -->

   </div><!-- // contents -->

</div><!-- // container -->




<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
   
    // 카테고리 1depth 설정
    getCategoryList("searchPrdCtgDepth1", "-1", "", "<c:out value="${serverDomain}"/>","<c:out value="${commandMap.PRD_CTG_ENV}"/>");

    // 카테고리 변경 이벤트
    $(document).on("change", "#searchPrdCtgDepth1", function () 
    {
        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
        getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
    });
    $(document).on("change", "#searchPrdCtgDepth2", function () 
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
        getCategoryList("searchPrdCtgDepth4", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
        getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
    });
    $(document).on("change", "#searchPrdCtgDepth3", function () 
    {
        getCategoryList("searchPrdCtgDepth4", $("#searchPrdCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
        getCategoryList("searchPrdCtgDepth5", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
    });
    $(document).on("change", "#searchPrdCtgDepth4", function () 
    {
        getCategoryList("searchPrdCtgDepth5", $("#searchPrdCtgDepth4 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.PRD_CTG_ENV}");
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
        
        if ( $("#searchPrdCtgDepth4 option:selected").val() != '')
        {
           categoryIdx = $("#searchPrdCtgDepth4 option:selected").val();
           categoryPath += " > " + $("#searchPrdCtgDepth4 option:selected").text();
        }
        
        if ( $("#searchPrdCtgDepth5 option:selected").val() != '')
        {
           categoryIdx = $("#searchPrdCtgDepth5 option:selected").val();
           categoryPath += " > " + $("#searchPrdCtgDepth5 option:selected").text();
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
//]]>
</script>
</body>
</html>