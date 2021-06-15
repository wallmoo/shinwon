<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta id="viewport" name="viewport" content="initial-scale=1.0, width=device-width, minimum-scale=1.0">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>쑈윈도 | 전체메뉴</title>

 <!-- #wrap -->
    <div id="wrap" class="menuSlide">
        <!-- #header -->
        <header id="header" class="pop navi">
            <!-- .header_top -->
            <div class="header_top">
            <c:choose>
            	<c:when test="${not empty sessionUser.MEM_MST_MEM_ID}">
                <div class="login_section">
                    <a href="/mobile/main/index.do" class="home">메인으로 가기</a>
                    <p class="txt"><span><c:out value="${sessionUser.MEM_MST_MEM_NM}"/></span> 님 안녕하세요</p>
                </div>
                <div class="right_section">
                    <a href="/mobile/manager/logout.do" class="b_txt">로그아웃</a>
                    <a href="#n" class="setting">설정</a>
                </div>
                </c:when>
                <c:otherwise>
                <div class="login_section">
                    <a href="/mobile/main/index.do" class="home">메인으로 가기</a>
                    <a href="/mobile/manager/login.do" class="b_txt">로그인</a>
                    <a href="/mobile/member/joinMemType.do" class="b_txt">회원가입</a>
                </div>
                </c:otherwise>
             </c:choose>   
                <button type="button" class="btn_close">닫기</button>
            </div>
            <!-- // .header_top -->
        </header>
        <!-- // #header -->    
		<div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="all_menu_wp">
                    <div class="gnb_wp">
                        <div class="gnb">
                            <ul class="dep1">
                            	<c:forEach var="listGnbMenu" items="${listGnbMenu}" varStatus="i">
                                <li>
                                    <a href="<c:out value="${frontDomain }"/>/mobile/product/productMain.do?idx=<c:out value="${listGnbMenu.PRD_CTG_IDX }" />"><c:out value="${listGnbMenu.PRD_CTG_NM}"/></a>
		                            <ul class="dep2">
		                                 <c:if test="${not empty listGnbMenu.child }">
                                    		<c:forEach var="secondDepthCategroy" items="${listGnbMenu.child }" varStatus="j">
			                            		<li>
			                                       	<a href="<c:out value="${frontDomain }"/>/mobile/product/productList.do?idx=<c:out value="${secondDepthCategroy.PRD_CTG_IDX }" />"><c:out value="${secondDepthCategroy.PRD_CTG_NM}"/></a>
			                                    </li>
                                    		</c:forEach>
                                    	</c:if>
		                         	</ul>
                               	 </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <ul class="lk_list">
                            <li><a href="/mobile/special/specialList.do">SPECIAL</a></li>
                            <li><a href="/mobile/event/timeSaleList.do">타임세일</a></li>
                            <li><a href="/mobile/funding/fundingList.do">펀딩</a></li>
                            <li><a href="/mobile/event/planList.do">기획전</a></li>
                            <li><a href="/mobile/event/eventList.do">이벤트</a></li>
                            <li><a href="/mobile/sellerpick/sellerPickList.do">셀러픽</a></li>
                            <li><a href="/mobile/brand/brandMain.do">BRAND</a></li>
                            <li><a href="/mobile/topseller/topsellerMain.do">TOP SELLER</a></li>
                            <li><a href="/mobile/liveon/liveonList.do">라이브ON</a></li>
                            <li><a href="/mobile/channelon/channelonList.do">채널ON</a></li>
                        </ul>
                        <ul class="lk_list st2">
                            <li><a href="/mobile/customer/noticeBoardList.do">공지사항</a></li>
                            <li><a href="/mobile/customer/faqBoardList.do">FAQ</a></li>
                            <li><a href="/mobile/customer/inquiryMain.do">1:1문의</a></li>
                            <li><a href="/pc/business/businessMain.do" target='_blank'";>입점안내</a></li>
                        </ul>
                    </div>
                    <div class="favorite_wp">
                    <c:choose>
                    	<c:when test="${not empty sessionUser.MEM_MST_MEM_ID}">
	                        <div class="info">
	                            <p class="txt">자주 이용하는<br>카테고리를<br>등록해 주세요.</p>
	                            <button type="button" class="btn mid ok">즐겨찾기 설정</button>
	                        </div>
                        </c:when>
                        <c:otherwise>
	                        <div class="info">
	                            <p class="txt">로그인 후<br>상품 카테고리를<br>등록하실 수 있습니다.</p>
	                            <button type="button" class="btn mid ok" id="login">로그인</button>
	                        </div>
                        </c:otherwise>
                     </c:choose>   
                    </div>
                </div>
            </div>
            
            <!-- // #content_area -->
        </div>
        	<!-- // #container -->
        </div>
    <!-- // #wrap -->
        
<script>
    $("#login").on("click", function() {
    	location.href = "/mobile/manager/login.do"
	})
	
</script>
