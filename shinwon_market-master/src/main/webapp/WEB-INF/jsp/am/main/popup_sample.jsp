<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title">
					<span>제목</span>
				</h2>


				<div class="tab-list">
					<!-- tab -->
					<ul>
						<c:choose>
							<c:when test="${memberInfo.MEM_MST_LEV_YN eq 'N' }">
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberEventPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberEventPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">이벤트</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberReviewPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품평</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberQna') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberQnaPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품Q&A</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberInq') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberInqPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">고객상담</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberTaxIvcPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberTaxIvcPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">세금계산서</a>
								</li>
								<li
									class="
						<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberCartPopup.do') > -1 || fn:indexOf(requestUrl,'/am/member/infoMemberKeepingPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberCartPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">관심상품</a>
								</li>
							</c:when>
							<c:otherwise>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">active</c:if>">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- // tab -->

				<!-- 여기에 내용물을 입력하세요 -->
			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->

	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		//<![CDATA[
		$(function() {

		});
		//]]>
	</script>
</body>
</html>
