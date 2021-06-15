<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${sessionUser.ROLE_USER eq 'user'}">
		<div class="table user-info"><!-- user-info -->
		    <div class="row">
		        <div class="cell name">
		            <c:out value="${sessionUser.MEM_MST_MEM_NM }" /> 님<br />
		            <strong>
		            	<c:out value="${sessionUser.MEM_MST_MEMBER_GROUP_NM }"/>
		            </strong>
		            <br />
		            <p class="reset mt10">
		                <c:if test="${sessionUser.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GRADE_NORMAL}">
							<span class="card family"><em>일반카드</em></span>
		                </c:if>
		                <c:if test="${sessionUser.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GRADE_SILVER}">
							<span class="card silver"><em>실버카드</em></span>
		                </c:if>
		                <c:if test="${sessionUser.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GRADE_GOLD}">
							<span class="card gold"><em>골드카드</em></span>
		                </c:if>
		            </p>
		        </div>
		        <div class="cell desc">
		            <div class="item coupon">
		                <span class="subject">
		                    <span class="icon"></span>
		                   	 쿠폰
		                </span>
		                <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myCouponUsableList.do','_self');">
		               		<strong><fmt:formatNumber value="${summaryMap.COUPON_CNT}" type="number"/>장</strong>
		                </a>
		            </div>
		            <div class="item point">
		                <span class="subject">
		                    <span class="icon"></span>
		                    	크라운
		                </span>
		                <a href="<c:out value="${mobileDomain}" />/mobile/mypage/myPointList.do">
		                	<strong><fmt:formatNumber value="${summaryMap.RMN_PNT}" type="number"/>C</strong>
		                </a>
		            </div>
		            <div class="item today">
		                <span class="subject">
		                    <span class="icon"></span>
		                    	오늘 본 상품
		                </span>
		                <a href="<c:out value="${mobileDomain}" />/mobile/mypage/todayViewProductList.do">
		                	<strong><fmt:formatNumber value="${summaryMap.PRD_TDY_CNT}" type="number"/>개</strong>
		                </a>
		            </div>
		            <div class="item basket">
		                <span class="subject">
		                    <span class="icon"></span>
		                    	장바구니
		                </span>
		                <a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','_self');">
		                	<strong><fmt:formatNumber value="${summaryMap.CART_CNT}" type="number"/>개</strong>
		                </a>
		            </div>
		        </div>
		    </div>
		</div><!-- // user-info -->
	</c:when>
</c:choose>

