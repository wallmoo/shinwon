<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup"><!-- page-list -->
	
<div id="popContainer"><!-- popContainer -->

    <h1 class="title">상품 검색</h1>
	<form id="searchForm" name="searchForm">
	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	<input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
	<input type="hidden" name="searchYn" value="Y" />
    <div id="popWrapper" class="search-product"><!-- popWrapper -->

        <div class="search"><!-- search -->
            <div class="holder">
                <div>
                    <select class="sel_chg" title="대카테고리" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1">
                        <option value="">대카테고리</option>
                    </select>
                    <select class="sel_chg" title="중카테고리" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2">
                        <option value="">중카테고리</option>
                    </select>
                    <select class="sel_chg" title="소카테고리" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3">
                        <option value="">소카테고리</option>
                    </select>
                </div>
                <div class="mt10">
                    <label for="itemName">상품명</label>
                    <input type="text" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>" class="text" />
                    <label for="code" style="margin-left: 10px;">상품코드</label>
                    <input type="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" class="text" />
                </div>
                <a href="javascript:search();" class="btn_st0 btn_rd"><span>검색</span></a>
            </div>
        </div><!-- // search -->

        <table class="table-product"><!-- table-product -->
        <caption>상품코드, 상품명, 판매가격, 선택으로 구성된 프라이스킹 배송상품 목록입니다.</caption>
        <colgroup>
            <col style="width: 200px;" />
            <col style="width: auto;" />
            <col style="width: 100px;" />
            <col style="width: 70px;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>상품코드</span></th>
                <th scope="col"><span>상품명</span></th>
                <th scope="col"><span>판매가격</span></th>
                <th scope="col"><span>선택</span></th>
            </tr>
        </thead>
        <tbody class="dotum">
        	<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="list" items="${list }" varStatus="status">
						<tr>
			                <td class="number"><c:out value="${list.PRD_MST_CD }" /></td>
			                <td class="subject">
			                    <a href="javascript:goProduct('<c:out value="${list.PRD_MST_CD }" />');"><c:out value="${list.PRD_MST_NM }" /></a>
			                </td>
			                <td class="price">
			                    <p class="price-before"><span class="blind">소비자가</span>
			                    	<c:choose>
			                    		<c:when test="${list.PRD_MST_ERP_DSP_PRC > 0}">
			                    			<fmt:formatNumber value="${list.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" />원
			                    		</c:when>
			                    		<c:otherwise>
			                    			<fmt:formatNumber value="${list.ERP_MST_SELL_PRC }" groupingUsed="true" />원
			                    		</c:otherwise>
			                    	</c:choose>
			                    </p>
			                    <p class="price-after"><span class="blind">판매가</span><strong><fmt:formatNumber value="${list.PRD_MST_PRICE }" groupingUsed="true" />원</strong></p>
			                </td>
			                <td class="action">
			                    <p><a href="javascript:productApply('<c:out value="${list.PRD_MST_CD }" />');" class="btn_st0 btn_blk777 small"><span>선택</span></a></p>
			                </td>
			            </tr>
			    	</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
		                <td colspan="4" class="no-more">
		                    <p class="message no-more">
		                        검색결과가 없습니다.
		                    </p>
		                </td>
		            </tr>
				</c:otherwise>
			</c:choose>
        </tbody>
        </table><!-- // table-product -->

        <div class="section-pagination"><!-- section pagination -->
            <ui:frontpaging paging="${paging }" jsFunction="goPage" />
        </div><!-- // section pagination -->
		
    </div><!-- // popWrapper -->
    </form>
</div><!-- // popContainer -->
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script type="text/javascript">

$(function(){
	
	if( $("#searchForm").find("input[name='searchPrdCtgIdx']").val() == "")
    {
		getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${frontDomain}"/>", "P");
    }
    else
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${frontDomain}"/>", "P");
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${frontDomain}"/>", "P");
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${frontDomain}"/>", "P");
    }
	
	$(document).on("click", "#searchPrdCtgDepth1", function () 
    {
        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${frontDomain}"/>", "P");
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${frontDomain}"/>", $("#searchPrdCtgEnv option:selected").val());

    });
    $(document).on("click", "#searchPrdCtgDepth2", function () 
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${frontDomain}"/>", "P");

    });
	
	goPage = function (cPage) 
    {
        var $pageFrm = $("#searchForm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
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

        // 상품 카테고리 검색 조건
        var searchCategoryIdx = "";
        var tempCategoryIdx = "";
        
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth1 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth2 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth3 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        $searchForm.find("#searchPrdCtgIdx").val(searchCategoryIdx);

        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    goProduct = function(prdMstCd){
		window.open("<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd="+prdMstCd);
		self.close();
	};
	
	// 선택 클릭 이벤트
    productApply = function (prdMstCd) 
    {
    	if( prdMstCd == "" ){
    		alert("상품을 선택하여 주십시오.");
    		return;
    	}

    	var obj = new Object();
    	
    	obj.PRD_MST_CD = prdMstCd;
		
    	window.opener.fnResultProduct(obj);
    	self.close();
    };
}); //function

</script>
</html>