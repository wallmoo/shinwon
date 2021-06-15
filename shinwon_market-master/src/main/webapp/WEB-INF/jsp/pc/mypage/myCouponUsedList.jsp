<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

	<div class="container breadcrumb-wrap"><!-- breadcrumb -->
        <div id="breadcrumb" class="wrap">
            <div class="holder">
                <span>홈</span>
                <span class="gt">&gt;</span>
                <span>MYPAGE</span>
                <span class="gt">&gt;</span>
                <span>쇼핑혜택</span>
                <span class="gt">&gt;</span>
                <strong class="warning">쿠폰</strong>
            </div>
        </div>
    </div><!-- // breadcrumb -->

	<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->
	
	<%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
			<div id="internal"><!-- internal -->

                <h4 class="title"><!-- title -->
                    <span>쿠폰</span>
                    <small class="desc">
                        고객님께서 주문 시 사용하신 쿠폰 현황입니다.
                    </small>
                </h4><!-- // title -->

                <div class="tab-d mb20 full-width item-2"><!-- tab-anchor -->
                    <ul class="tab">
                        <li ><a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponUsableList.do"><span>사용가능쿠폰</span></a></li>
                        <li class="active"><a href="#!"><span>쿠폰사용내역</span></a></li>
                    </ul>
                </div><!-- // tab-anchor -->

                <table class="table-col table-a table-coupon" cellspacing="0"><!-- bbs-list -->
                <caption></caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: auto;" />
                    <col style="width: 16%;" />
                    <col style="width: 16%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th><span>NO</span></th>
                        <th><span>쿠폰명</span></th>
                        <th><span>주문번호</span></th>
                        <th><span>사용일</span></th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td class="no"><fmt:formatNumber value="${listNum}" groupingUsed="true"/></td>
                            <td class="subject text-left"><c:out value="${item.COUPON_NM }" /></td>
                            <td class="code"><a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingInfo.do?ORD_MST_CD=<c:out value="${item.ORD_MST_CD}" />"/><c:out value="${item.ORD_MST_CD }" /></a></td>
                            <td class="date"><ui:formatDate value="${item.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd" /></td>
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
						<tr>
	                        <td colspan="4">
	                            <p class="message no-more">
                                	사용한 쿠폰이 없습니다.
	                            </p>
	                        </td>
						</tr>
				    </c:otherwise>
				</c:choose>
                </tbody>
                </table><!-- // table -->

                <form id="frm" name="frm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
				
					<div class="section-pagination"><!-- section pagination -->
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
					</div><!-- // section pagination -->
				</form>

                <h4 class="title small"><!-- title -->
                    <span><span class="icon coupon"></span>&nbsp;쿠폰 사용 안내</span>
                </h4><!-- // title -->

                <ul class="list list-a">
                    <li>결제 당 1개의 쿠폰에 한하여 사용 가능합니다.</li>
                    <li>쿠폰별, 사용방법에 제한이 있을 수 있습니다. 쿠폰별 사용조건을 확인해주시기 바랍니다.</li>
                    <li>쿠폰 사용기간이 있으며, 기간만료 후 자동으로 삭제됩니다.</li>
                    <li>주문 시 적용된 쿠폰은 주문취소, 반품 시 반환됩니다. (유효기간이 남아있는 경우, 해당기간 까지 사용 가능)</li>
                </ul>

                <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

            </div><!-- internal -->

		</div><!-- wrap -->
	</div><!-- // container -->

</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
$(function(){
	goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myCouponUsedList.do", "target":"_self", "method":"get"}).submit();
    };
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>


