<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-popup">

<div id="popContainer"><!-- popContainer -->

    <h1 class="title">주문 내역</h1>

    <div id="popWrapper" class="order-history"><!-- popWrapper -->

        <p class="dotum">
            최근 6개월 동안의 주문내역입니다. 
        </p>

        <table class="table-product"><!-- table-product -->
        <caption>주문일, 주문번호, 상품정보, 주문금액, 선택으로 구성된 프라이스킹 배송상품 목록입니다.</caption>
        <colgroup>
            <col style="width: 80px;" />
            <col style="width: 100px;" />
            <col style="width: auto;" />
            <col style="width: 80px;" />
            <col style="width: 70px;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>주문일</span></th>
                <th scope="col"><span>주문번호</span></th>
                <th scope="col"><span>상품정보</span></th>
                <th scope="col"><span>주문금액</span></th>
                <th scope="col"><span>선택</span></th>
            </tr>
        </thead>
        <tbody>
        	<c:choose>
			    <c:when test="${not empty list}">
			    	<c:forEach var="data" items="${list }" varStatus="status">
			    		<tr>
			    			<c:if test="${data.ORD_RNK eq 1 }">
		                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="date"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
		                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="number">
		                            <c:out value="${data.ORD_MST_CD }" />
		                        </td>
	                        </c:if>
			                <td class="product">
			                    <div class="item">
			                        <div class="thumb">
			                            <a href="javascript:;"><img src="<c:out value="${cdnDomain }${data.PRODUCT_THUM_IMG}"/>" class="thumb84" alt="${data.PRD_IMAGE_ALT}" /></a>
			                        </div>
			                        <div class="core">
			                            <p class="subject">
			                                <a href="javascript:;"><c:out value="${data.PRD_MST_NM }" /></a>
			                            </p>
			                            <c:if test="${not empty data.OPT_DTL_NM or not empty data.subPrdList}">
											<div class="option dotum">
												옵션 :
												<c:if test="${not empty data.optionList}">
													<c:out value="${data.OPT_DTL_NM}" />
													<c:if test="${not empty data.subPrdList}">
														&nbsp;/&nbsp;
													</c:if>
												</c:if>
												
												<%-- 선택옵션 상품 리스트 --%>
												<c:if test="${not empty data.subPrdList}">
													<c:forEach var="subPrd" items="${data.subPrdList}" varStatus="i">
														${subPrd.OPT_DTL_NM}
														(
																			<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																				+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																			</c:if>
																		<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
														${i.last ? '' : '/&nbsp;'}	
													</c:forEach>
												</c:if>
											</div>
										</c:if>
			                        </div>
			                    </div>
			                </td>
			                <td class="price">
			                    <p><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC + data.SUM_SUB_OPTION_ADD_PRC}" type="number" />원</p>
			                </td>
			                <c:if test="${data.ORD_RNK eq 1 }">
				                <td class="action" rowspan="<c:out value="${data.ORD_MST_CNT}"/>">
				                    <p><a href="javascript:goOrder('<c:out value="${data.ORD_MST_CD }"/>');" class="btn_st0 btn_blk777 small"><span>선택</span></a></p>
				                </td>
			                </c:if>
			            </tr>
			    	</c:forEach>
			    </c:when>
			    <c:otherwise>
			    	<tr>
		                <td colspan="5" class="no-more">
		                    <p class="message no-more">
		                        최근 6개월간 주문내역이 존재하지 않습니다.
		                    </p>
		                </td>
		            </tr>
			    </c:otherwise>
			</c:choose>			    	
        </tbody>
        </table><!-- // table-product -->

        <form id="frm" name="frm">
             <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
             <input type="hidden" name="ORD_MST_CD" value=""/> 
             <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
             <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
             
			 <div class="section-pagination"><!-- section pagination -->
	    		<ui:frontpaging paging="${paging }" jsFunction="goPage" />
             </div><!-- // section pagination -->
         </form>

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

<script>
	$(function(){
		var $frm = $("#frm");
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/orderInfoPopup.do", "target":"_self", "method":"post"}).submit();
	    };
	});
	
	function goOrder(ordMstCd){
		window.opener.resultOrderCd(ordMstCd);
		
		self.close();
	}
</script>

</body>
</html>