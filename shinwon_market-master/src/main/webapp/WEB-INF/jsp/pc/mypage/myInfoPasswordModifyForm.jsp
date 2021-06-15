<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
           <div class="outer-wrap mypage-info-password"><!-- outer wrap -->

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
                                    <li><span>크라운 <a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do"><strong><fmt:formatNumber value="${summaryMap.POINT}" type="number"/></strong></a> C</span></li>
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
                            <li class="col-1-6"><a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do"><span>나의 크라운</span></a></li>
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

                    <h4 class="title mt0">비밀번호 변경</h4>

					<form id="frm" name="frm">
                    <div class="border-top-thick border-bottom-thick core"><!-- table wrap -->
                        <ul class="list-a">
                            <li>쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같은 경우, 도용되기 쉬우므로 정보보호를 위해 정기적으로 변경하여 주시기 바랍니다.</li>
                            <li>영문 대/소문자와 숫자 조합으로 8~15자까지 사용가능합니다. 공백은 사용할 수 없습니다.</li>
                            <li>아이디와 주민등록번호, 생일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 반복된 문자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 개인정보 유출의 위험이 높으므로 사용을 자제해 주시기 바랍니다.</li>
                        </ul>
                        <table class="table-row fixed" cellspacing="0"><!-- table -->
                        <caption>기본정보 입력</caption>
                        <colgroup>
                            <col style="width: 160px;" />
                            <col style="width: auto;" />
                        </colgorup>
                        <tr>
                            <th><span>기존 비밀번호</span></th>
                            <td>
                                <input type="password" name="OLD_PASSWORD" id="OLD_PASSWORD" class="text" maxlength="15" title="기존 비밀번호" />
                                <c:if test="${not empty commandMap.MEM_MST_LST_PW_UPD_DT }">
	                                <span class="message warning">
	                                	* 비밀번호 최종변경일 :
	                                	<ui:formatDate value="${commandMap.MEM_MST_LST_PW_UPD_DT }" pattern="yyyy.MM.dd" />
	                                </span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th><span>새 비밀번호</span></th>
                            <td>
                                <input type="password" name="NEW_PASSWORD" id="NEW_PASSWORD" class="text" maxlength="15" title="새 비밀번호" />
                                <span class="message">8~15자 이상의 영문 대/소문자, 숫자 조합으로 입력하세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <th><span>새 비밀번호 확인</span></th>
                            <td>
                                <input type="password" name="PASSWORD_RE" id="PASSWORD_RE" class="text" maxlength="15" title="새 비밀번호 확인" />
                                <span class="message">비밀번호 확인을 위해 다시 한 번 입력하세요.   </span>
                            </td>
                        </tr>
                        </table>
                    </div><!-- // table wrap -->
                    </form>
						
					<div class="section-button gutter"><!-- section button -->
                        <a href="javascript:;" id="goModify" class="button xlarge primary"><span>변경</span></a>
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
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/jquery.validate.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
//<![CDATA[
$(function(){
	 $("#frm").validate({
        rules: {
        	OLD_PASSWORD:{required:true, minlength:8, maxlength:15}, // 기존 비밀번호
        	NEW_PASSWORD:{required:true, engAndNumOrSl:true, minlength:8, maxlength:15}, // 비밀번호
            PASSWORD_RE:{required:true, equalTo:"#NEW_PASSWORD"} // 비밀번호 확인
        },
        messages :{
        	OLD_PASSWORD : {required:"[기존 비밀번호]반드시 입력해 주십시오.", minlength:"[기존 비밀번호]8자 이상으로 입력해 주십시오.", maxlength:"[기존 비밀번호]15자 이하로 입력해 주십시오."},
        	NEW_PASSWORD : {required:"[비밀번호]반드시 입력해 주십시오.", engAndNumOrSl:"[비밀번호]영문자와 숫자를 조합해서 입력해 주십시오.", minlength:"[비밀번호]8자 이상으로 입력해 주십시오.", maxlength:"[비밀번호]15자 이하로 입력해 주십시오."},
            PASSWORD_RE :{required:"[비밀번호 확인]반드시 입력해 주십시오.", equalTo:"[비밀번호 확인]비밀번호와 값이 일치하지 않습니다."}
        }
     });
	 
	// 변경 버튼 클릭 이벤트
    var submitCnt = 0;
    $(document).on("click", "#goModify", function () {
        if(submitCnt == 0)
        {
            var $frm = $("#frm");
            if($frm.valid())
            {
                if (confirm( "비밀번호를 변경하시겠습니까?"))
                {
                    submitCnt = submitCnt + 1;
                    $("#frm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myInfoPasswordModifyProc.do", "target":"_self", "method":"post"}).submit();
                }
            }
        }
        else
        {
            alert("비밀번호 변경이 진행중입니다.");
            return;
        }
    });
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>