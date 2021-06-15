<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
          <div class="outer-wrap helpdesk-sitemap"><!-- outer wrap -->

                <div class="wrap"><!-- wrap -->
                    <%-- <div class="breadcrumbs">
                        <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="home"></a>
                        <span class="gt"></span>
                        <span class="current">고객센터</span>
                    </div> --%>
                    <h3 class="title">고객센터</h3>
		
                    <div class="tab-helpdesk js-tab-toggle-active"><!-- tab nav -->
                        <ul class="tab">
                            <li class="nth-child-1"><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do"><span>공지사항</span></a></li>
                            <li class="nth-child-2"><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do"><span>쇼핑FAQ</span></a></li>
                            <li class="nth-child-3"><a href="<c:out value="${frontDomain}" />/pc/customer/shoppingGuideMain.do"><span>쇼핑가이드</span></a></li>
                            <li class="nth-child-4"><a href="<c:out value="${frontDomain}" />/pc/customer/productGuideMain.do"><span>상품가이드</span></a></li>
                            <li class="nth-child-5"><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do"><span>1:1문의</span></a></li>
                            <li class="nth-child-6"><a href="<c:out value="${frontDomain}" />/pc/customer/agreementBoardList.do"><span>이용약관</span></a></li>
                            <li class="nth-child-7"><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do"><span>단체주문문의</span></a></li>
                            <li class="nth-child-8 active"><a href="<c:out value="${frontDomain}" />/pc/customer/sitemap.do"><span>사이트맵</span></a></li>
                        </ul>
                    </div><!-- // tab nav -->
                    
	                <h4 class="title">사이트맵</h4>
					<ul id="sitemap">
					<li class="first clearfix"><span><a href="<c:out value="${frontDomain}" />/pc/brand/brand.do?idx=24">brand</a></span>
						<ul class="d2">
						<c:choose>
			            <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap[fn:trim(Code.CATEGORY_BRAND_TOP_IDX)] }" >
			            <c:forEach var="item" items="${categoryMenuMap[fn:trim(Code.CATEGORY_BRAND_TOP_IDX)] }" varStatus="status">
							<li><a href="<c:out value="${frontDomain}" />/pc/brand/brand.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a>
								<ul class="d3">
								<c:choose>
			                    <c:when test="${not empty categoryMenuMap[fn:trim(item.PRD_CTG_IDX)] }" >
			                    <c:forEach var="item2" items="${categoryMenuMap[fn:trim(item.PRD_CTG_IDX)] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/brand/brand.do?idx=${item2.PRD_CTG_IDX}">${item2.PRD_CTG_NM}</a></li>
                                </c:forEach>
                                </c:when>
                                </c:choose>
								</ul>
							</li>
                        </c:forEach>
                        </c:when>
                        </c:choose>
						</ul>
					</li>
					<li class="clearfix"><span><a href="javascript:;">category</a></span>
						<ul class="d2">
							<c:choose>
			                <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap['1'] }" >
							<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=1">women</a>
								<ul class="d3">
			                    <c:forEach var="item" items="${categoryMenuMap['1'] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a></li>
                                </c:forEach>
								</ul>
							</li>
							</c:when>
                            </c:choose>
							<c:choose>
			                <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap['2'] }" >
							<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=2">men</a>
								<ul class="d3">
								<c:forEach var="item" items="${categoryMenuMap['1'] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a></li>
                                </c:forEach>
								</ul>
							</li>
							</c:when>
                            </c:choose>
							<c:choose>
			                <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap['3'] }" >
							<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=3">kids</a>
								<ul class="d3">
								<c:forEach var="item" items="${categoryMenuMap['3'] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a></li>
                                </c:forEach>
								</ul>
							</li>
							</c:when>
							</c:choose>
							<c:choose>
			                <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap['4'] }" >
							<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=4">bag&amp;acc</a>
								<ul class="d3">
			                    <c:forEach var="item" items="${categoryMenuMap['4'] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a></li>
                                </c:forEach>
								</ul>
							</li>
                            </c:when>
                            </c:choose>
							<c:choose>
			                <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap['5'] }" >
							<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=5">bike</a>
								<ul class="d3">								
			                    <c:forEach var="item" items="${categoryMenuMap['5'] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a></li>
                                </c:forEach>
								</ul>
							</li>
							</c:when>
                            </c:choose>
						</ul>
					</li>
					<li class="clearfix"><span><a href="javascript:;">event &amp; lookbook</a></span>
						<ul class="d2">
							<li>
								<a href="<c:out value="${frontDomain}" />/pc/event/planList.do">event</a>
							</li>
							<li>
								<a href="<c:out value="${frontDomain}" />/pc/lookbook/main.do">lookbook</a>
							</li>
							
						</ul>
					</li>
					<li class="clearfix"><span><a href="javascript:;">outlet</a></span>
						<ul class="d2">
						<c:choose>
			            <c:when test="${not empty categoryMenuMap && not empty categoryMenuMap[fn:trim(Code.CATEGORY_OUTLET_TOP_IDX)] }" >
			            <c:forEach var="item" items="${categoryMenuMap[fn:trim(Code.CATEGORY_OUTLET_TOP_IDX)] }" varStatus="status">
							<li><a href="<c:out value="${frontDomain}" />/pc/outlet/outlet.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM}</a>
								<ul class="d3">
								<c:choose>
			                    <c:when test="${not empty categoryMenuMap[fn:trim(item.PRD_CTG_IDX)] }" >
			                    <c:forEach var="item2" items="${categoryMenuMap[fn:trim(item.PRD_CTG_IDX)] }" varStatus="status">
			                    	<li><a href="<c:out value="${frontDomain}" />/pc/outlet/outlet.do?idx=${item2.PRD_CTG_IDX}">${item2.PRD_CTG_NM}</a></li>
                                </c:forEach>
                                </c:when>
                                </c:choose>
								</ul>
							</li>
                        </c:forEach>
                        </c:when>
                        </c:choose>
						</ul>
					</li>
					<li class="clearfix"><span><a href="<c:out value="${frontDomain }"/>/pc/customer/customerMain.do">고객센터</a></span>
						<ul class="d2">
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do">공지사항</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do">쇼핑 FAQ</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/shoppingGuideMain.do">쇼핑가이드</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/productGuideMain.do">상품가이드</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do">1:1문의</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/agreementBoardList.do">이용약관</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do">단체주문문의</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/customer/sitemap.do">사이트맵</a></li>
						</ul>
					</li>
					<li class="clearfix"><span><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do">마이페이지</a></span>
						<ul class="d2">
							<li>
								<a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingList.do">나의 쇼핑내역</a>
								<ul class="d3">
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myShoppingList.do">주문/배송 조회</a></li>
									<!-- <li><a href="javascript:;">취소/반품 신청</a></li> -->  
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myOrderCancelBackList.do">취소/반품 내역</a></li>
								</ul>
							</li>
							<li>
								<a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do">나의 문의내역</a>
								<ul class="d3">
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do">1:1문의</a></li>
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do?searchBrdInqType=Q">상품 Q&amp;A</a></li>
								</ul>
							</li>
							<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInfoMemberStep1.do">나의 정보</a>
								<ul class="d3">
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInfoMemberStep1.do">회원정보 관리</a></li>
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myInfoPasswordModifyForm.do">비밀번호 변경</a></li>
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myDeliveList.do">배송지 관리</a></li>
									<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myMemberWithdraw.do">회원탈퇴</a></li>
								</ul>
							</li>
							<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponList.do">나의 쿠폰함</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myProductCommentList.do">나의 상품평</a></li>
							<li><a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do">나의 포인트</a></li>
							<li><a href="<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do">장바구니</a></li>
						</ul>
					</li>
				</ul>

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
	//페이지 로드시 첫번째 이용약관 불러오기
	getDetailAjax("${Code.AGREEMENT_CUSTOMER_CENTER1}");
});	
//상세 가져오기
function getDetailAjax(brdCmnComIdx){
	$("#ajaxDiv").load("<c:out value="${frontDomain}" />/pc/customer/agreementBoardDetailAjax.do",{"BRD_CMN_COM_IDX":brdCmnComIdx}, function(){
		$(".agreementBoardListLi").removeClass("active");
		$("#li_"+brdCmnComIdx).addClass("active");
	});
}	

//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>