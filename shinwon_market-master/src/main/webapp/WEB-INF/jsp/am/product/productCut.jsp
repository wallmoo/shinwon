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
				<span>상품전시기준(품절)관리</span>
			</div><!-- // breadcrumb -->
						

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">상품전시기준(품절)관리</h3>
				
				<h4 class="title">상품전시기준(품절)관리</h4>
				각 업체구분의 상품 구분별 품절기준이 되는 상품의 수량과 배송가능 매장 수를 설정하시기 바랍니다.
				
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 13%;" />
                            <col style="width: 14%;" />
                            <col style="width: 14%;" />
                            <col style="width: 14%;" />
                            <col style="width: 14%;" />
                            <col style="width: 15%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th rowspan="2">업체구분</th>
                                <c:choose>
								<c:when test="${not empty prdGdsSctnList}">
                                <c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
                                <th>${prdGdsSctnItem.CMN_COM_NM }</th>
                                </c:forEach>
                                </c:when>
                                </c:choose>
                                <th rowspan="2">최근변경일</th>
                                <th rowspan="2">품절기준설정</th>
                                <th rowspan="2">변경이력조회</th>
                            </tr>
                            <tr>
                                <c:choose>
								<c:when test="${not empty prdGdsSctnList}">
                                <c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
                                <th>수량(개) / 매장(%)</th>
                                </c:forEach>
                                </c:when>
                                </c:choose>
                            </tr>
                        </thead>
                        <tbody>
						<c:choose>
						<c:when test="${not empty list}">
						<c:forEach var="item" items="${list }" varStatus="status">              
                        	<tr>
                               	<td>${item.BRD_NM }</td>
                               	<c:choose>
								<c:when test="${not empty prdGdsSctnList}">
                                <c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
                                <c:set var="cnt" value="${prdGdsSctnItem.CMN_COM_ETC1}_CNT" />
                                <c:set var="rate" value="${prdGdsSctnItem.CMN_COM_ETC1}_RATE" />
                                <td>${item[cnt] } / ${item[rate] }</td>
                                </c:forEach>
                                </c:when>
                                </c:choose>
                                <td><ui:formatDate value="${item.PRD_CUT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
                                <td><a href="/am/product/productCutForm.do?PRD_CUT_BRAND_CD=${item.BRD_CD}" class="button button-b small js-modal" data-width="900" data-height="500" data-scroll="false" target="_blank" title="새 창 으로 열립니다."><span>설정</span></a></td>
                                <td><a href="/am/product/productCutHistory.do?PRD_CUT_BRAND_CD=${item.BRD_CD}" class="button button-b small js-modal" data-width="900" data-height="700" data-scroll="true" target="_blank" title="새 창 으로 열립니다."><span>보기</span></a></td>
                        	</tr>
                        </c:forEach>
                        </c:when>
                        <c:otherwise>
                        	<tr>
                        	<td colspan="8">
                        	${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_ }
                        	</td>
                        	</tr>
                        </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div><!-- // col list -->
                      
			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->

	<footer><!-- footer -->
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->
<form id="frm" name="frm"> 
	<input type="hidden" id="PRD_CUT_BRAND_CD" name="PRD_CUT_BRAND_CD" value=""/>
	<input type="hidden" id="PRD_CUT_REG_NOTE" name="PRD_CUT_REG_NOTE" value=""/>
	<c:choose>
	<c:when test="${not empty prdGdsSctnList}">
	<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
	<c:set var="cnt" value="${prdGdsSctnItem.CMN_COM_ETC1}_CNT" />
	<c:set var="rate" value="${prdGdsSctnItem.CMN_COM_ETC1}_RATE" />
	<input type="hidden" id="CNT_${prdGdsSctnItem.CMN_COM_ETC1}" name="CNT_${prdGdsSctnItem.CMN_COM_ETC1}"   /> 
	<input type="hidden" id="RATE_${prdGdsSctnItem.CMN_COM_ETC1}" name="RATE_${prdGdsSctnItem.CMN_COM_ETC1}" />
	</c:forEach>
	</c:when>
	</c:choose>
</form>						    	

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

	goRegist = function( params ){

		$("#frm input").each(function(index,item){
        	$(this).val( params[$(this).attr('id')] );
    	});
	        			
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/productCutRegist.do", "target":"_self", "method":"post"}).submit();
	}
	
});


</script>
</body>
</html>