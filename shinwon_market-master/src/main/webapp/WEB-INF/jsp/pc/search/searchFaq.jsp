<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-customer">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	
	<!-- #wrap S -->
	<section id="wrap"> 
		
		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
	        <div class="minW contents"><!-- contents S -->
	
	            <dl class="loc">
	                <dt class="blind">현제 카테고리 경로</dt>
	                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
	                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>자주 묻는 질문 (FAQ)</span></a></dd>
	            </dl>
	
	            <%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>
	
	            <div id="body"><!-- #body -->
	
	                <%@ include file="/WEB-INF/jsp/pc/include/customer/search.jsp" %>
	
	                <h3 class="title">자주 묻는 질문 (FAQ)</h3>
	
	                <div class="faq-tab"><!-- faq-tab -->
	                    <h4>배송</h4>
	                    <div class="tab">
	                        <ul class="ct">
	                            <li class="active"><a href="javascript:;"><span>전체보기</span></a><span class="blind">현재위치</span></li>
	                            <li><a href="javascript:;"><span>상품관련 하위 분류</span></a></li>
	                            <li><a href="javascript:;"><span>상품관련 하위 분류</span></a></li>
	                            <li><a href="javascript:;"><span>상품관련 하위 분류</span></a></li>
	                            <li><a href="javascript:;"><span>교환/반품/취소</span></a></li>
	                            <li><a href="javascript:;"><span>환불/AS</span></a></li>
	                            <li><a href="javascript:;"><span>적립금/쿠폰</span></a></li>
	                            <li><a href="javascript:;"><span>기타문의</span></a></li>
	                        </ul>
	                    </div>
	                </div><!-- // faq-tab -->
	
	                <p class="bbs-status"><!-- bbs-status -->
	                    배송 FAQ (<span class="warning">50</span>건)
	                <p><!-- // bbs-status -->
	
	                <p class="faq-search-result"><!-- faq-search-result -->
	                    &ldquo;<span class="warning">구매</span>&rdquo;에 대한 총 <span class="warning">0</span>건의 FAQ가 검색 되었습니다.
	                </p><!-- // faq-search-result -->
	
	                <table class="bbs-list faq-list"><!-- bbs-list -->
	                <caption>게시글 유형, 카테고리, 제목으로 구성된 자주묻는 질문 목록입니다.</caption>
	                <colgroup>
	                    <col style="width: 6%;" />
	                    <col style="width: 14%;" />
	                    <col style="width: auto%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">게시글 유형</th>
	                        <th scope="col">카테고리</th>
	                        <th scope="col">제목</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
	                        <td class="category">상품관련</td>
	                        <td class="subject"><a href="javascript:;"><span class="warning">구매</span>가능 여부를 알고 싶어요.<span class="blind">답변보기</span></a></td>
	                    </tr>
	                    <tr class="answer">
	                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
	                        <td colspan="2" class="substance">
	                            비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능하십니다.<br />
	                            ※ 마켓플랜트의 회원으로 가입 후 주문하시면 마켓플랜트에서 제공하는 할인쿠폰 및 적립금 적립, 이 벤트 등 각종 혜택을 받으실 수 있습니다. 
	                        </td>
	                    </tr>
	                </tbody>
	                </table><!-- // bbs-list -->
	
	                <div class="section-pagination"><!-- section pagination -->
	                    <a href="javascript:;" class="nav first"><span class="blind">첫 페이지</span></a>
	                    <a href="javascript:;" class="nav prev"><span class="blind">이전 페이지</span></a>
	                    <a href="javascript:;" class="num active"><span>1</span></a>
	                    <a href="javascript:;" class="num"><span>2</span></a>
	                    <a href="javascript:;" class="num"><span>3</span></a>
	                    <a href="javascript:;" class="num"><span>4</span></a>
	                    <a href="javascript:;" class="num"><span>5</span></a>
	                    <a href="javascript:;" class="num"><span>6</span></a>
	                    <a href="javascript:;" class="num"><span>7</span></a>
	                    <a href="javascript:;" class="num"><span>8</span></a>
	                    <a href="javascript:;" class="num"><span>9</span></a>
	                    <a href="javascript:;" class="num"><span>10</span></a>
	                    <a href="javascript:;" class="nav next"><span class="blind">다음 페이지</span></a>
	                    <a href="javascript:;" class="nav last"><span class="blind">마지막 페이지</span></a>
	                </div><!-- // section pagination -->
	
	            </div><!-- // #body -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
		
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	</section>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
$(function(){

    // faq toggle
    com.accordion($('table.faq-list .subject a'), 'tr');

});
</script>
</body>
</html>