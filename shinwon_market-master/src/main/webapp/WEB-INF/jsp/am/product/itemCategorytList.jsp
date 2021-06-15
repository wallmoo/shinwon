<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">상품관리</a>
                &gt;
                <span>품목카테고리관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">품목카테고리관리</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>
                </div>
                
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="searchYn" value="Y" />

	                    <div class="table-a"><!-- col list -->
		                    <table class="core">
		                        <colgroup>
		                            <col style="width: 10%;" />
		                            <col style="width: auto;" />
		                        </colgroup>
		                        <tbody>
		                            <tr>
		                                <th>구분</th>
		                                <td class="left">
		                                	<table class="core" style="width:40%;">
						                        <colgroup>
						                            <col style="width: 20%;" />
						                            <col style="width: 20%;" />
						                            <col style="width: 20%;" />
						                        </colgroup>
						                        <tbody>
						                        	<tr>
						                        		<td>
						                        			사업부 
						                        			<select class="select" id="searchItmCtgDepth1" name="searchItmCtgDepth1" >
																<option value="">전체</option>
															</select>
						                        		</td>
						                        		<td>
						                        			그룹 
						                        			<select class="select" id="searchItmCtgDepth2" name="searchItmCtgDepth2" >
																<option value="">전체</option>
															</select>
						                        		</td>
						                        		<td>
						                        			품목그룹 
						                        			<select class="select" id="searchItmCtgDepth3" name="searchItmCtgDepth3" >
																<option value="">전체</option>
															</select>
						                        		</td>
						                        	</tr>
						                        </tbody>
						                	</table>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th>품목</th>
		                                <td class="left">
		                                	<table class="core" style="width:50%;">
						                        <colgroup>
						                            <col style="width: 10%;" />
						                            <col style="width: 10%;" />
						                            <col style="width: 10%;" />
						                            <col style="width: 10%;" />
						                            <col style="width: 10%;" />
						                        </colgroup>
						                        <tbody id="applyItemCategoryList">
						                        	<tr id="itemCategoryNodata">
						                        		<td colspan=5>구분을 선택해주세요.</td>
						                        	</tr>
						                        </tbody>
						                	</table>
		                                </td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </div><!-- // col list -->

                    </form>

            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

<script type="text/javascript">
$(document).ready(function () {
	// 카테고리 1depth 설정
    getItemList("searchItmCtgDepth1", "-1", "", "<c:out value="${serverDomain}"/>","<c:out value="${commandMap.ITM_CTG_ENV}"/>");
	
    $(document).on("change", "#searchItmCtgDepth1", function () 
    {
    	getItemList("searchItmCtgDepth2", $("#searchItmCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.ITM_CTG_ENV}");
    	getItemList("searchItmCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", "${commandMap.ITM_CTG_ENV}");
    });
    $(document).on("change", "#searchItmCtgDepth2", function () 
    {
    	getItemList("searchItmCtgDepth3", $("#searchItmCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.ITM_CTG_ENV}");
    });
    $(document).on("change", "#searchItmCtgDepth3", function () 
    {
    	getItemList("applyItemCategoryList", $("#searchItmCtgDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", "${commandMap.ITM_CTG_ENV}");
    });
});
</script>
</body>
</html>