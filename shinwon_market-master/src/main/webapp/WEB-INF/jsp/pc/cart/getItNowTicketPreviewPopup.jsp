<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup page-post-preview">

<!--  팝업사이즈 450x795 사이즈 입니다 -->

<div id="popContainer"><!-- popContainer -->
    <div class="holder">

        <h1 class="title">교환권 발송하기</h1>

        <div id="popWrapper"><!-- popWrapper -->

            <ul>
                <li>상품명 : <c:out value="${commandMap.PRD_NM }"/></li>
                <li>주문번호 : <c:out value="${commandMap.ORD_MST_CD }"/></li>
                <li>주문자 : <c:out value="${commandMap.ORD_MST_ORD_NM }"/></li>
                <li>주문일시 : <ui:formatDate value="${commandMap.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm"/></li>
                <li>주문매장 : <c:out value="${commandMap.SHP_MST_NM }"/></li>
                <li>전화번호 : <c:out value="${commandMap.SHP_MST_TEL }"/></li>
                <li>교환코드 : <c:out value="${commandMap.ORD_GET_TIK }"/></li>
            </ul>

            <p>
                &lt;유의사항&gt;
            </p>

            <ol>
                <li>상품준비가 완료되면 별도 알람 문자를 고객님께 발송합니다. 문자를 확인하신 후 매장에 방문해 주십시오.</li>
                <li>픽업일로부터 2일이 경과된 시점까지 상품을 수령하지 않으실 경우 주문하신 상품은 자동으로 취소됩니다.</li>
                <li>신분증, 결제신용카드, 교환권 문자를 꼭 가지고 매장에 방문해 주십시오.</li>
            </ol>

            <p>
                마켓플랜트 고객센터 : 02-6925-1160
            </p>

        </div><!-- // popWrapper -->
    </div>
    
</div><!-- // popContainer -->

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

</body>
</html>