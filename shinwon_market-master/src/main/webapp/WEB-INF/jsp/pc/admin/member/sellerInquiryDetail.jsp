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
					<span>셀러문의 상세</span>
				</h2>


				<div class="tab-list">
					<!-- tab -->
					<ul>
						<c:choose>
							<c:when test="${memberInfo.MEM_MST_LEV_YN eq 'N' }">
								<li	class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">active</c:if>">
									<a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a>
								</li>
								<li	class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">active</c:if>">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a>
								</li>
								<li class="">active</c:if>
									<a	href="#">쿠폰</a>
								</li>
								<li	class="">active</c:if>
									<a	href="#">포인트</a>
								</li>
								<li	class=""<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberEventPopup.do') > -1}">active</c:if>
									<a href="<c:out value="${serverDomain}" />/am/member/infoMemberEventPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">이벤트</a>
								</li>
								<li	class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberReviewPopup.do') > -1}">active</c:if>">
									<a href="<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품후기</a>
								</li>
								<li	class="<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberQna') > -1}">active</c:if>">
									<a href="<c:out value="${serverDomain}" />/am/member/infoMemberQnaPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품Q&A</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberInq') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberInqPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">1:1 고객문의</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">셀러문의</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">장바구니</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">OOTD</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">댓글</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- // tab -->

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        </colgroup>
                    <tbody>
                        <tr>
                            <th><span>아이디(이름)</span></th>
                            <td>
                                Never11(홍길동)
                            </td>
                            <th><span>닉네임</span></th>
                            <td>
                                헨젤과그랬데
                            </td>
                            <th><span>프로필사진</span></th>
                            <td>
                                <p class="profile_img"><img src="../img/user.gif" alt=""></p>
                            </td>
                            <th><span>회원가입 유형</span></th>
                            <td>
                                일반회원
                            </td>
                        </tr>
                    </tbody>
                </table>

            <h3 class="title"><span>상세정보</span></h3>

            <form>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>입점사 명</span></th>
                            <td><a href="">베스트벨리</a></td>
                        </tr>
                        <tr>
                            <th><span>제목</span></th>
                            <td>배송이 아직 안와요</td>
                        </tr>
                        <tr>
                            <th><span>내용</span></th>
                            <td>주문을 3일전에 했는데도 아직 배송이 안옵니다.</td>
                        </tr>
                        <tr>
                            <th><span>등록일</span></th>
                            <td>2019-12-02 09:05:22</td>
                        </tr>
                    </tbody>
                </table><!-- // table -->

            </form>

            <h3 class="title"><span>답변하기</span></h3>

            <form>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>사용여부</span></th>
                            <td>사용</td>
                        </tr>
                        <tr>
                            <th><span>답변상태</span></th>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <th><span>답변내용</span></th>
                            <td>내일 수령 가능하십니다..</td>
                        </tr>
                        <tr>
                            <th><span>답변일</span></th>
                            <td>2019-12-02 09:05:22</td>
                        </tr>
                        <tr>
                            <th><span>답변자</span></th>
                            <td>sigeadmin(지이크관리자)</td>
                        </tr>
                    </tbody>
                </table><!-- // table -->

            </form>

            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

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
