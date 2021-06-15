<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<form name="frm" id="frm">
		<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD}" />" /><!-- 상품코드 -->
		<input type="hidden" name="cateIdx" id="cateIdx" value="<c:out value="${commandMap.cateIdx}" />" /><!-- 상품코드 -->
		<double-submit:preventer/>
		<article id="container" class="container" data-role="content">
	
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>쿠폰다운받기</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
			
			<!-- .couponDw_d S -->
			<section class="couponDw_d">
				<ol class="cp_list">
					<c:choose>
	               		<c:when test="${not empty list }">
	               			<c:forEach var="list" items="${list }" varStatus="i">
	               				<input type="hidden" name="CPN_MST_IDXs" id="CPN_MST_IDXs" value="${list.CPN_MST_IDX }" />
	               				<li class="${i.first ? 'f' : ''}">
		                            <div class="module">
		                                <p class="coupon <c:out value="${list.CPN_MST_GBN_CLASS }" />">
		                                	<c:choose>
		                                		<c:when test="${list.CPN_MST_GBN eq 'F'}">
		                                			<span>무료배송</span>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<c:choose>
		                                				<c:when test="${list.CPN_MST_SAL_GBN eq 'A' }">
		                                					<span><strong><c:out value="${list.CPN_MST_SAL_PRC }" /></strong>%</span>할인 쿠폰
		                                				</c:when>
		                                				<c:otherwise>
		                                					 <span><strong><fmt:formatNumber value="${list.CPN_MST_SAL_PRC }" groupingUsed="true" /></strong>원</span>할인 쿠폰
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
			</section>
			<!--// .couponDw_d E -->
			
		</article>
		</form>
		<!--// #container E -->
		<%--// 각 화면 본문 끝 --%>
		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script type="text/javascript">
$(function(){
	getCouponDwn = function(){
		var $frm = $("#frm"); 
		$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/ProductCouponRegist.do", "target":"_self", "method":"post"}).submit();
	};
}); //function

</script>
</body>
</html>