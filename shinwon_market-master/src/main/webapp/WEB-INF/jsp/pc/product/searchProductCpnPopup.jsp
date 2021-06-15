<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup"><!-- page-list -->
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">	
	<!-- #container S -->
	<article id="container" class="container coupon_down_pop">
		<header>
			<h1>쿠폰 다운로드</h1>
		</header>
		<form name="frm" id="frm">
		<double-submit:preventer/>
		<div class="contents"><!-- .contents S -->

			<ol class="cp_list">
				<c:choose>
               		<c:when test="${not empty list }">
               			<c:forEach var="list" items="${list }" varStatus="status">
               				<input type="hidden" name="CPN_MST_IDXs" id="CPN_MST_IDXs" value="${list.CPN_MST_IDX }" />
               				<li>
	                            <div class="module">
	                                <p class="coupon <c:out value="${list.CPN_MST_GBN_CLASS }" />">
	                                	<c:choose>
	                                		<c:when test="${list.CPN_MST_GBN eq 'F'}">
	                                			<strong class="tit">무료배송</strong>
	                                			<span class="text">할인쿠폰</span>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:choose>
	                                				<c:when test="${list.CPN_MST_SAL_GBN eq 'A' }">
	                                					<span class="tit"><strong><c:out value="${list.CPN_MST_SAL_PRC }" /></strong>%</span>
	                                					<span class="text">할인쿠폰</span>
	                                				</c:when>
	                                				<c:otherwise>
	                                					 <span class="tit"><strong><fmt:formatNumber value="${list.CPN_MST_SAL_PRC }" groupingUsed="true" /></strong>원</span>
	                                					<span class="text">할인쿠폰</span>
	                                				</c:otherwise>
	                                			</c:choose>
	                                		</c:otherwise>
	                                	</c:choose>
	                                		
	                                </p>
	                                <span class="tx_tate">
	                                	<c:choose>
	                                		<c:when test="${list.CPN_MST_USE_DAY > 0 }">
	                                			발행일로부터 <c:out value="${list.CPN_MST_USE_DAY }" />일
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:out value="${list.CPN_MST_USE_ST_DT }" /> ~ <c:out value="${list.CPN_MST_USE_ED_DT }" />
	                                		</c:otherwise>
	                                	</c:choose>
	                                </span>
	                                <span class="tx_price">
	                                	<fmt:formatNumber value="${list.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시
	                                </span>
	                            </div>
	                        </li>
               			</c:forEach>
               		</c:when>
               		<c:otherwise>
               			<p class="message no-more">
	                        사용 가능한 쿠폰이 없습니다.
	                    </p>
               		</c:otherwise>
               	</c:choose>
			</ol>
			<a href="javascript:getCouponDwn();" class="btn_down"><strong>다운로드</strong><i class="ico_down"></i></a>
			
			<p class="tx_ex">
				<strong>사용시 유의사항</strong>
				<span><i>-</i> 다운받은 쿠폰은 MYLAND > 쇼핑혜택 > 사용가능쿠폰내역에서 확인하실 수 있습니다.</span>
				<span><i>-</i> 각 쿠폰은 한 번씩만 다운받을 수 있으며, 사용 후 언제든지 재발행 가능합니다. </span>
				<span><i>-</i> 일부상품은 쿠폰사용이 제한될 수 있습니다.</span>
			</p>
		</div><!--// .contents E -->
		</form>
	</article>
	<!--// #container E -->

</section>
<!--// #wrap E -->
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script type="text/javascript">

$(function(){
	getCouponDwn = function(){
		var $frm = $("#frm"); 
		$frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/ProductCouponRegist.do", "target":"_self", "method":"post"}).submit();
	};
}); //function

</script>
</html>