<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- S : tab -->
	<div class="tab-list">
		<ul class="tab">
			<c:choose>
				<c:when test="${Code.SUPER_ADMINISTRATOR_IDX eq sessionAdmin.AUT_MST_IDX }">
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a></li>
					<c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'N'   }">


										
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberCouponPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">쿠폰</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPitPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPitPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">포인트</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberEventPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberEventPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">이벤트</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberReviewPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품후기</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberQnaPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberQnaPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품문의</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberInqPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberInqPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">1:1고객문의</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/sellerInquiryPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/sellerInquiryPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">셀러문의</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/cartListPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/cartListPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">장바구니</a></li>
					

					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOOTDPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberOOTDPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">OOTD</a></li>					
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberInq') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/commentListPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">댓글</a></li>
					<!-- <li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberTaxIvcPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberTaxIvcPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">세금계산서</a></li> -->
					</c:if>					
				</c:when>
				<c:otherwise>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a></li>
					<li class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">in</c:if>"><a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- E : tab -->