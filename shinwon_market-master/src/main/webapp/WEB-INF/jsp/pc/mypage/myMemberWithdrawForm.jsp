<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
           <div class="outer-wrap mypage-info-signout"><!-- outer wrap -->

                <div class="wrap"><!-- wrap -->

                    <h3 class="title">마이페이지</h3>

                    <div class="clearfix mypage-status"><!-- mypage-status -->
                        <ul class="tab">
                            <li><span><c:out value="${sessionUser.MEM_MST_MEM_NM }" /> 고객님은 <strong><c:out value="${sessionUser.MEM_MST_MEMBER_GROUP_NM }" /></strong> 입니다.</span></li>
                            <li><span>장바구니 <a href="<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do"><strong><fmt:formatNumber value="${summaryMap.CART_CNT}" type="number"/></strong></a> 건</span></li>
                            <li><span>주문 <a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingList.do"><strong><fmt:formatNumber value="${summaryMap.ORDER_CNT}" type="number"/></strong></a> 건</span></li>
                            <c:choose>
					            <c:when test="${sessionUser.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_OWN || sessionUser.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_SUB || sessionUser.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_VIP}">
                                    <li><span>당월 잔여 구매한도 <strong><fmt:formatNumber value="${sessionUser.MEM_MST_ALCO_MONTH_LIMIT}" type="number"/></strong> 원</span></li>
					            </c:when>
					            <c:otherwise>
                                    <li><span>포인트 <a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do"><strong><fmt:formatNumber value="${summaryMap.POINT}" type="number"/></strong></a> P</span></li>
                                    <li><span>쿠폰 <a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponList.do"><strong><fmt:formatNumber value="${summaryMap.COUPON_CNT}" type="number"/></strong></a> 장</span></li>
					            </c:otherwise>
					        </c:choose>
                        </ul>
                    </div><!-- // mypage-status -->

                    <div id="mypageTab" class="tab-nav js-tab-toggle-active"><!-- tab nav -->
                        <ul class="tab">
                            <li class="col-1-6">
                                <a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingList.do"><span>나의 쇼핑내역</span></a>
                                <ul class="sub">
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingList.do">주문/배송조회</a></li>
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myOrderCancelBackList.do">취소/반품 내역</a></li>
                                </ul>
                            </li>
                            <li class="col-1-6"><a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponList.do"><span>나의 쿠폰함</span></a></li>
                            <li class="col-1-6"><a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do"><span>나의 포인트</span></a></li>
                            <li class="col-1-6"><a href="<c:out value="${frontDomain}" />/pc/mypage/myProductCommentList.do"><span>나의 상품평</span></a></li>
                            <li class="col-1-6"><a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do"><span>나의 문의내역</span></a></li>
                            <li class="col-1-6 active">
                                <a href="<c:out value="${frontDomain}" />/pc/mypage/myInfoMemberStep1.do"><span>나의 정보</span></a>
                                <ul class="sub">
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInfoMemberStep1.do">회원정보 관리</a></li>
                                    <li><a href="#none">비밀번호 변경</a></li>
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myDeliveList.do">배송지 관리</a></li>
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myMemberWithdraw.do">회원탈퇴</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- // tab nav -->

                    <h4 class="title mt0">회원탈퇴</h4>

                    <div class="border-top-thick guide"><!-- guide -->
                        <ul class="list-a">
                            <li>구매확정 되지 않은 주문 건이 있거나 주문취소/반품이 진행 중인 경우 탈퇴가 불가능합니다.</li>
                            <li>탈퇴 시 개인정보와 보유중인 포인트와 쿠폰은 모두 즉시 삭제됩니다.</li>
                            <li>회원 탈퇴 후 철회가 불가능 합니다.</li>
                        </ul>
                    </div><!-- // guide -->

                    <div class="border-top-thick border-bottom-thick guide-detail"><!-- guide-detail -->
                        <h5 class="title">LS네트웍스 멤버십 탈퇴 이용약관</h5>
                        <ul class="list-a">
                            <li>
                                재가입 시 기존 아이디 사용 불가 안내
                                <p>
                                - 탈퇴 시 해당 아이디는 즉시 탈퇴 처리되며, 탈퇴 후 30일이 지난 후에도 동일 아이디로 가입이 불가능 합니다.<br />
                                - 재가입을 희망하실 경우, 탈퇴 후 30일 이후 신규 아이디로 재가입이 가능합니다. 
                                </p>
                            </li>
                            <li>
                                재가입 가능 기간 안내
                                <p>
                                - 회원탈퇴 후 30일 내 재가입이 불가능 합니다.
                                </p>
                            </li>
                            <li>
                                회원 정보 및 게시물 삭제
                            </li>
                        </ul>
                        <table class="fixed inner">
                        <caption>회원 정보 및 게시물 삭제</caption>
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: 95px;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><span>내용</span></th>
                                <th><span>기간</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>계약 또는 청약철회 등에 관한 기록</td>
                                <td class="text-center">5년</td>
                            </tr>
                            <tr>
                                <td>대금결제 및 재화 등의 공급에 관한 기록</td>
                                <td class="text-center">5년</td>
                            </tr>
                            <tr>
                                <td>소비자의 불만 또는 분쟁처리에 관한 기록</td>
                                <td class="text-center">3년</td>
                            </tr>
                        </tbody>
                        </table>
                    </div><!-- // border -->
                    
                    <form id="frm" name="frm">
                    </form>

                    <div class="section-button gutter"><!-- section button -->
                        <a href="javascript:;" id="goSubmit" class="button xlarge"><span>회원탈퇴</span></a>
                        <a href="javascript:;" id="goCancel" class="button gray xlarge"><span>취소</span></a>
                    </div><!-- // section button -->

                </div><!-- // wrap -->

            </div><!-- // outer-wrap -->

            <div class="bottom-spacer" aria-hidden="true"></div><!-- bottom spacer : container 닫는 태그 상단에 위치 -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/plugins.js" charset="utf-8"></script>
<!--[if (gt IE 8)|!(IE)]> <!--> <script src="<c:out value="${cdnDomain}" />/pc/js/plugins/jquery.touchSwipe.1.3.3.min.js" charset="utf-8"></script> <!--<![endif]-->
<script src="<c:out value="${cdnDomain}" />/pc/js/base.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/main.js" charset="utf-8"></script> --%>
<!--
<script>document.write('<script src="<c:out value="${cdnDomain}" />/pc/js/main.js?timeStamp='+Math.floor(+new Date()/1000)+'" charset="utf-8"><\/script>');</script>
-->
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/defer.js" charset="utf-8" defer></script> --%>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/ui.js" charset="utf-8" defer></script> --%>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
//<![CDATA[
$(function(){
	// 회원탈퇴 버튼 클릭 이벤트
    var submitCnt = 0;
    $(document).on("click", "#goSubmit", function () {
        if(submitCnt == 0)
        {
             if (confirm( "탈퇴하시겠습니까?"))
             {
                 submitCnt = submitCnt + 1;
                 $("#frm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myMemberWithdrawProc.do", "target":"_self", "method":"post"}).submit();
             }
        }
        else
        {
            alert("회원탈퇴가 진행중입니다.");
            return;
        }
    });
    
    // 취소 버튼 클릭 이벤트
    $(document).on("click", "#goCancel", function () {
    	if (confirm( "메인화면으로 이동하시겠습니까?"))
        {
    		location.replace("<c:out value="${frontDomain}" />/pc/main/index.do");
        }
    });
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>