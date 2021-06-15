<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:forEach var="list" items="${list }" varStatus="status">
	<li>
        <div class="core">
            <p class="coupon <c:out value="${list.CPN_MST_GBN_CLASS }" />">
            	<c:choose>
                  		<c:when test="${list.CPN_MST_GBN eq 'F'}">
                  			<span>무료배송</span>
                  		</c:when>
                  		<c:otherwise>
                  			<c:choose>
                  				<c:when test="${list.CPN_MST_SAL_GBN eq 'A' }">
                  					<strong><c:out value="${list.CPN_MST_SAL_PRC }" /></strong><span>%할인</span>
                  				</c:when>
                  				<c:otherwise>
                  					 <strong><fmt:formatNumber value="${list.CPN_MST_SAL_PRC }" groupingUsed="true" /></strong><span>원</span>
                  				</c:otherwise>
                  			</c:choose>
                  		</c:otherwise>
                  	</c:choose>
            </p>
            <div class="scale">
				<c:if test="${list.CPN_MST_TGT_GBN eq 'A' }">
					<a href="javascript:goSetCouponPopup('1','<c:out value="${list.CPN_MST_IDX }" />');" class="button full primary small"><span>적용상품보기</span></a>
				</c:if>
				<c:if test="${list.CPN_MST_TGT_GBN eq 'B' }">
					<p class="all">전체상품</p>
				</c:if>
				<c:if test="${list.CPN_MST_TGT_GBN eq 'C' }">
					<a href="javascript:goSetCouponPopup('2','<c:out value="${list.CPN_MST_IDX }" />');" class="button full primary small"><span>적용브랜드보기</span></a>
				</c:if>
				<c:if test="${list.CPN_MST_TGT_GBN eq 'D' }">
					<a href="javascript:goSetCouponPopup('3','<c:out value="${list.CPN_MST_IDX }" />');" class="button full primary small"><span>적용기획전보기</span></a>
				</c:if>
            </div>
        </div>
        <div class="desc">
            <p class="subject"><strong class="large"><c:out value="${list.CPN_MST_TITLE }" /></strong></p>
            <p class="date">
            	<c:choose>
                  		<c:when test="${list.CPN_MST_USE_DAY > 0 }">
                  			발행일로부터 <c:out value="${list.CPN_MST_USE_DAY }" />일
                  		</c:when>
                  		<c:otherwise>
                  			<c:out value="${list.CPN_MST_USE_ST_DT }" /> ~ <c:out value="${list.CPN_MST_USE_ED_DT }" />
                  		</c:otherwise>
                  	</c:choose>
            </p>
            <p class="limit">
            	<fmt:formatNumber value="${list.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시
            	<c:if test="${list.CPN_MST_GBN ne 'F' }" >
                  		최대 <fmt:formatNumber value="${list.CPN_MST_MXM_PRC }" groupingUsed="true" />원 할인
                  	</c:if>
            </p>
        </div>
    </li>
</c:forEach>
