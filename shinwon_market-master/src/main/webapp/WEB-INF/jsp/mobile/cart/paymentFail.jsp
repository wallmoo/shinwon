<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
</script>

<body class="page-order">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>주문실패</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="order-step"><!-- order-step -->
            <ol class="ui-grid-b">
                <li class="ui-block-a"><i class="cart"><!-- icon --></i><strong>장바구니</strong></li>
                <li class="ui-block-b"><i class="order"><!-- icon --></i><strong>주문서/결제</strong></li>
                <li class="ui-block-c"><i class="finish"><!-- icon --></i><strong>주문완료</strong></li>
            </ol>
        </div><!-- // order-step -->

        <hr class="hr-a">

        <div class="order-finish fail"><!-- order-finish -->
            <p class="result">
                죄송합니다.<br />
                고객님의 주문이 정상적으로<br />
                처리되지 않았습니다.
            </p>

            <p class="message-a">
                &lt; [code:<c:out value="${commandMap.resultCode}"/>] 사유 : <c:out value="${commandMap.resultMessage}"/> &gt;
            </p>

            <div class="frame frame-a">
                <ul class="list list-a">
                    <li>시스템 장애로 인해 주문/결제가 정상적으로 실행되지 못하여 주문/결제가 취소되었습니다.</li>
                    <li>지속적인 장애발생시 고객센터 02-6925-1160로 문의주시거나, &lsquo;고객센터 &gt; 1:1문의&rsquo;를 이용해 주세요.</li>
                </ul>
            </div>
        </div><!-- // order-finish -->
        
        <div class="section-button"><!-- section-button -->
            <a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain}"/>/mobile/cart/cartlist.do','_self');" target="_self" class="button full"><span>장바구니로 이동하기</span></a>
        </div><!-- // section-button -->
			
	</article>
	<!--// #container E -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->
</body>
</html>