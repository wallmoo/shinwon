<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


			<div class="my_modify_top_wrap mb100">
				<div class="my_modify_top_wrap mt110">
					<div class="my_modify_top">
						<div class="personal_box clearboth">
							<div class="position_left">
								<c:choose>
									<c:when test="${not empty memberInfo.MEM_MST_PRF_IMG }">
										<div class="portrait">
											<img src="<c:out value="${cdnDomain }" /><c:out value="${memberInfo.MEM_MST_PRF_IMG }" />" alt="프로필 이미지">
										</div>
									</c:when>
									<c:otherwise>
										<div class="portrait">
											<img src="/nas/cdn/PW/images/mypage/img_default_profile.png" alt="개인화 이미지">
										</div>
									</c:otherwise>
								</c:choose>
							</div>    
							<div class="position_right">
								<div class="txt_box">
									<span class="welcome">환영해요!</span>
									<span class="class"><em class="lato bold"><c:out value="${sessionUser.MEM_MST_MEM_ID }"/></em> 님은 <c:out value="${summaryMap.MEM_GRD_NM }"/> 고객입니다.
									</span>
								</div>
								<div class="btn_box">
									<a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoEditForm.do" class="btn" role="button">내정보수정</a>
									<a href="<c:out value="${frontDomain }"/>/pc/event/memberBenefit.do" class="btn" role="button">등급별혜택</a>
								</div>
							</div>
						</div><!-- //personal_box -->
						
						<div class="tab_wrap">
								<ul class="tab n2">
									<li><a href="#my_tab2" id="goPageOotdBtn">OOTD</a></li>
									<li class="on"><a href="#my_tab1" id="goPageShoppingBtn">My Shopping</a></li>
								</ul>
								<div class="tab_cont" id="my_tab1">
									<h4 class="blind">My Shopping</h4>
									<div class="q_link_wrap">
										<ul class="clearboth">
											<li class="on"><a href="<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do">주문/배송 조회</a></li>
											<li><a href="<c:out value="${serverSslDomain }" />/pc/mypage/myOrderCancelBackList.do">취소/교환/반품 현황</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/event/memberBenefit.do">회원등급 및 혜택</a></li>
											<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myMileageList.do">포인트</a></li>
											<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponUsableList.do">할인쿠폰</a></li>
											<li><a href="<c:out value="${frontDomain }" />/pc/mypage/myFitList.do">마이핏 관리</a></li>
											<li><a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myInfoPasswordForm.do">회원정보 수정</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myDeliveList.do">배송지 관리</a></li>
											<li><a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myRefundAccountList.do">환불계좌 관리</a></li>
											<li><a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoDeleteForm.do">회원탈퇴</a></li>
										</ul>
									</div>
								</div>
								
								<div class="tab_cont" id="my_tab2">
									<h4 class="blind">OOTD</h4>
									<div class="q_link_wrap">
										<ul class="clearboth">
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myFeedList.do">피드 관리</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myOotdList.do">OOTD 관리</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myReplyList.do">댓글 관리</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myLikeList.do">좋아요 관리</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myEventList.do">이벤트 참여현황</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myProductReviewList.do">상품 리뷰</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/restockNotificationList.do">재입고 알림</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myFavoriteList.do">즐겨찾기 관리</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myProductInquiryIncompleteList.do">상품문의</a></li>
											<li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myInquiryList.do">1:1문의</a></li>
										</ul>
									</div>
								</div>
								
								
								<!-- //tab2 -->
						</div>
						<!-- //tab_wrap -->
						</form>
					</div>
				</div>
			</div>

		
<script>
/* $(function(){
	
	$('.tab_cont a').filter(function(){
		return this.href==location.href}).parent().addClass('on').siblings().removeClass('on')
	$('.tab_cont a').click(function(){
		$(this).parent().addClass('on').siblings().removeClass('on')	
	})
});
 */

$(function () {
	$("#goPageOotdBtn").click(function () {
		location.href = "<c:out value="${frontDomain}"/>/pc/mypage/myPageMain.do";
	})
	
	$("#goPageShoppingBtn").click(function () {
		location.href = "<c:out value="${serverSslDomain}"/>/pc/mypage/myPageMainShopping.do";
	})
});


</script>
