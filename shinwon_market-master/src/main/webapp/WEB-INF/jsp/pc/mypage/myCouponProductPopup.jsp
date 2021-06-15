<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup"><!-- page-list -->
	
<div id="popContainer"><!-- popContainer -->

    <h1 class="title">쿠폰 적용 상품보기</h1>

    <div id="popWrapper" class="coupon-product"><!-- popWrapper -->

        <table class="table-product"><!-- table-product -->
        <caption>상품코드, 상품정보, 판매가로 구성된 쿠폰 적용 상품 목록입니다.</caption>
        <colgroup>
            <col style="width: 100px;" />
            <col style="width: auto;" />
            <col style="width: 120px;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>상품코드</span></th>
                <th scope="col"><span>상품명</span></th>
                <th scope="col"><span>판매가</span></th>
            </tr>
        </thead>
        <tbody>
        	<c:choose>
        		<c:when test="${not empty list }">
        			<c:forEach var="list" items="${list }" varStatus="status">
	        			<tr>
			                <td class="number"><c:out value="${list.PRD_MST_CD }" /></td>
			                <td class="product">
			                    <div class="item">
			                        <div class="thumb">
			                        	<c:if test="${list.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT }">
											<i class="soldout passing"><span>일시품절</span></i>
										</c:if>
										<c:if test="${list.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT }">
											<i class="soldout"><span>품절</span></i>
										</c:if>
			                            <a href="javascript:goProduct('<c:out value="${list.PRD_MST_CD }" />');"><img src="<c:out value="${cdnDomain}" />/<c:out value="${list.PRD_IMG_ATT_PATH}" /><c:out value="${list.PRD_IMG_SYS_NM}" />" class="thumb84" width="84" height="84" alt="<c:out value="${list.PRD_IMG_ALT_TEXT}" />" /></a>
			                        </div>
			                        <div class="core">
			                            <p class="subject">
			                               <a href="javascript:goProduct('<c:out value="${list.PRD_MST_CD }" />');"><c:out value="${list.PRD_MST_NM }" /></a>
			                            </p>
			                        </div>
			                    </div>
			                </td>
			                <td class="price">
			                	<c:choose>
			                		<c:when test="${list.PRD_MST_PRICE > 0 }">
			                			<p class="price-before"><span class="blind">판매가</span><fmt:formatNumber value="${list.PRD_MST_PRC }" groupingUsed="true" />원</p>
					                    <p class="price-after"><span class="blind">즉시할인가</span><strong class="warning"><fmt:formatNumber value="${list.PRD_MST_PRICE }" groupingUsed="true" /></strong>원</p>
			                		</c:when>
			                		<c:otherwise>
					                    <p class="price-after"><span class="blind">판매가</span><strong class="warning"><fmt:formatNumber value="${list.PRD_MST_PRC }" groupingUsed="true" /></strong>원</p>
			                		</c:otherwise>
			                	</c:choose>
					                    
			                </td>
			            </tr>
			    	</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<tr><td colspan=3>적용된 상품이 없습니다.</td></tr>
        		</c:otherwise>
        	</c:choose>
        </tbody>
        </table><!-- // table-product -->

        <form id="pageFrm" name="pageFrm">
    	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
    	<input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>"/>
         <div class="section-pagination"><!-- section pagination -->
             <ui:frontpaging paging="${paging }" jsFunction="goPage" />
         </div><!-- // section pagination -->
        </form>

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script type="text/javascript">

$(function(){
	goProduct = function(prdMstCd){
		window.open("<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd="+prdMstCd);
		//self.close();
	};
	
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myCouponProductPopup.do", "target":"_self", "method":"post"}).submit();
    };
}); //function

</script>
</html>