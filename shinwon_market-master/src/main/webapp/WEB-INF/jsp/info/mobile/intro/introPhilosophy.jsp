<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-about">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>경영이념</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="#!" class="home"><span>홈</span></a>
            <span class="gt">&gt;</span>
            <a href="#!" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>경영이념</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <%@ include file="/WEB-INF/jsp/info/include/leftMenu.jsp" %>

        <div id="contents"><!-- #contents -->

            <hr class="hr-a" />

            <h3 class="title">경영이념</h3>

            <p class="text-center">
                <strong class="large24"><span class="warning">마켓플랜트</span>는 고객중심의 경영, 인재중심의 경영,<br />미래를 준비하는 일등주의 경영을 경영이념으로 합니다.</strong>
            </p>

            <div class="philosophy"><!-- philosophy -->
                <ul class="tab">
                    <li class="nth-child-1">
                        <div class="summary"><em class="large28">01</em><strong class="large18">고객중심의<br />경영</strong></div>
                        <p>
                            고객을 위한 가치창조를 극대화하기 위해<br />
                            전 임직원의 눈높이를 고객의 눈높이에 맞춰<br />
                            고객중심적 경영을 펼치고, 초일류 유통기업 마켓플랜트가 완성되는 그 날까지 <br />
                            최상의 서비스와 제품, 매장을 제공하기 위한 현장경영 실천
                        </p>
                    </li>
                    <li class="nth-child-2">
                        <div class="summary"><em class="large28">02</em><strong class="large18">인재 중심의<br />경영</strong></div>
                        <p>
                            인재중심 경영을 통한 휴먼 네트워크 형성이<br />
                            기업 경쟁력의 본질이며, 최고의 경쟁력을 가진<br />
                            우수한 기업으로 가는 중요한 요소로 인식하고<br />
                            고급 핵심 인재 양성에 적극 노력하는 기업 문화 형성
                        </p>
                    </li>
                    <li class="nth-child-3">
                        <div class="summary"><em class="large28">03</em><strong class="large16">미래를 준비하는<br />일등주의 경영</strong></div>
                        <p>
                            기술적 핵심역량을 키우고 신기술 개발에<br />
                            도전하는 기업 문화를 형성하고 新 시장, 新 채널을<br />
                            선점하기 위해 교육훈련강화
                        </p>
                    </li>
                </ul>

            </div><!-- // philosophy -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->


<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
</body>
</html>