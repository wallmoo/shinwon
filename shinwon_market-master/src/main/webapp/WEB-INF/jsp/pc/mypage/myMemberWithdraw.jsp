<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
           <div class="outer-wrap mypage-info-confirm"><!-- outer wrap -->

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
                                    <li><a href="#none">회원정보 관리</a></li>
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInfoPasswordModifyForm.do">비밀번호 변경</a></li>
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myDeliveList.do">배송지 관리</a></li>
                                    <li><a href="<c:out value="${frontDomain}" />/pc/mypage/myMemberWithdraw.do">회원탈퇴</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- // tab nav -->

                    <h4 class="title mt0">회원 탈퇴 </h4>

                    <div class="login-confirm"><!-- login-confirm -->
                    
						<form id="frm" name="frm">
							<input type="hidden" name="PASSWORD" value=""/>
							<input type="hidden" name="isWithdrawYn" value="Y"/>
						</form>
                        <div class="border-top-thick form">
                            <div class="grid-fix holder">
                                <div class="col-1-2">
                                    <span class="th">아이디</span>
                                    <strong><c:out value="${commandMap.MEM_MST_MEM_ID}" /></strong>
                                </div>
                                <div class="col-1-2">
                                    <span class="th">성명</span>
                                    <strong><c:out value="${commandMap.MEM_MST_MEM_NM}" /></strong>
                                </div>
                            </div>
                            <div class="grid-fix holder">
                                <span class="th"><label for="password">비밀번호</label></span>
                                <input id="password" type="password" class="text" maxlength="15" />
                            </div>
                        </div>
                        
                        <div class="border-bottom-thick description">
                            <p>
                                <c:out value="${commandMap.MEM_MST_MEM_NM}" />님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.<br />
		                                개인정보 보호를 위해 주기적으로 비밀번호를 변경해주시고, 타인에게 비밀번호가 노출되지 않도록 주의해주세요.<br />
		                                궁금하신 내용이나 불편사항은 BLACKYAK MALL 고객센터 전화 <c:out value="${Code.CALL_CENTER_TEL }"/>으로 문의하여 주시기 바랍니다. 
                            </p>
                        </div>

                        <div class="section-button">
                            <a href="javascript:;" id="goSubmit" onclick="goPwdChk();" class="button xlarge"><span>확인</span></a>
                        </div>

                    </div><!-- // login-confirm -->

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
	 //엔터 이벤트 
    $(document).on("keydown", "#password", function (e) {
        if(e.keyCode == 13){
            $("#goSubmit").trigger("click");
            return false;
        }
    });
});

//비밀번호 체크
function goPwdChk(){
	if($.trim($("#password").val()) == ""){
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();
		return;
	}
	$("input[name=PASSWORD]").val($.trim($("#password").val()));
	$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInfoPwChkProc.do", "target":"_self", "method":"post"}).submit();
}
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>