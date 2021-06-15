<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="tab-list"><!-- tab -->
		<ul>
			<c:choose>
				<c:when test="${memberInfo.MEM_MST_LEV_YN eq 'N' }">
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberEventPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberEventPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">이벤트</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberReviewPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품평</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberQna') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberQnaPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품Q&A</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberInq') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberInqPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">고객상담</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberTaxIvcPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberTaxIvcPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">세금계산서</a></li>
					<li class="
						<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberCartPopup.do') > -1 || fn:indexOf(requestUrl,'/am/member/infoMemberKeepingPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberCartPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">관심상품</a></li>
				</c:when>
				<c:otherwise>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a></li>
					<li class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">active</c:if>
					">
					<a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div><!-- // tab -->