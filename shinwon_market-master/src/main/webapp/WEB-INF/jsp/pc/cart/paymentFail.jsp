<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
</script>

<body class="page-order">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">

    <%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
	<!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <ul class="ct order-step"><!-- order-step -->
                <li class="nth-child-1"><span class="icon cart"><!-- icon --></span>STEP 01 <strong>장바구니</strong></li>
                <li class="nth-child-2"><span class="icon order"><!-- icon --></span>STEP 02 <strong>주문서/결제</strong></li>
                <li class="nth-child-3"><span class="icon finish"><!-- icon --></span>STEP 03 <strong>주문완료</strong></li>
            </ul><!-- // order-step -->

            <div class="order-fail"><!-- order-fail -->
                <div class="holder">
                    <p class="result">
                        <strong>죄송합니다.</strong>
                        <span>고객님의 주문이 정상적으로 처리되지 않았습니다.</span>
                    </p>

                    <div class="error-type">
                        <div class="inner">
                            &lt; [code:<c:out value="${commandMap.resultCode}"/>] 사유 : <c:out value="${commandMap.resultMessage}"/> &gt;
                        </div>
                    </div>

                    <ul class="list list-a mt20">
                        <li>시스템 장애로 인해 주문/결제가 정상적으로 실행되지 못하여 주문/결제가 취소되었습니다.</li>
                        <li>지속적인 장애발생 시 고객센터  02-6925-1160 로 문의주시거나, <span class="warning">&lsquo;고객센터 > 1:1문의&rsquo;</span>를 이용해 주세요.</li>
                    </ul>
                </div>
            </div><!-- // order-fail -->

            <div class="section-button mt30"><!-- section-button -->
                <a href="<c:out value="${serverSslDomain}"/>/pc/cart/cartlist.do" class="btn_st2 btn_rd xlarge"><span>장바구니로 이동하기</span></a>
            </div><!-- // section-button -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>
<!--// #wrap E -->
<script type="text/javascript">
</script>
</body>
</html>	