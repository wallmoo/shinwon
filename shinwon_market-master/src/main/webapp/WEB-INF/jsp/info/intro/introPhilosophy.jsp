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
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>경영이념</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        

        <div id="contents"><!-- #contents -->

            

            <h3 class="title">경영이념</h3>
			<hr class="hr-a" />

            <p class="ti_history">
               <span class="large36">마켓플랜트는 고객중심의 경영, 인재중심의 경영,<br />미래를 준비하는 일등주의 경영을 경영이념으로 합니다.</span>
            </p>

            <div class="philosophy"><!-- philosophy -->
                <ul class="tab">
                    <li class="nth-child-1">
                        <div class="summary"><em class="">01</em><strong class="">고객중심의 경영</strong><i class="ico_l"></i></div>
                        <p>
                            고객을 위한 가치창조를 극대화하기 위해 전<br />
							임직원의 눈높이를 고객의 눈높이에 맞춰<br />
							고객중심적 경영을 펼치고, 초일류 유통기업<br />
							마켓플랜트가 완성되는 그 날까지 최상의 서비스와<br />
							제품, 매장을 제공하기 위한 현장경영 실천

                        </p>
                    </li>
                    <li class="nth-child-2">
                        <div class="summary"><em class="">02</em><strong class="">인재중심의 경영</strong><i class="ico_l"></i></div>
                        <p>
                            인재중심 경영을 통한 휴먼 네트워크 형성이 기업<br />
							경쟁력의 본질이며, 최고의 경쟁력을 가진 우수한<br />
							기업으로 가는 중요한 요소로 인식하고 고급 핵심<br />
							인재 양성에 적극 노력하는 기업 문화 형성
                        </p>
                    </li>
                    <li class="nth-child-3">
                        <div class="summary"><em class="">03</em><strong class="">일등주의 경영</strong><i class="ico_l"></i></div>
                        <p>
                            기술적 핵심역량을 키우고 신기술 개발에<br />
							도전하는 기업 문화를 형성하고 新시장, 新채널을<br />
							선점하기 위해 교육훈련강화
                        </p>
                    </li>
                </ul>

            </div><!-- // philosophy -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->


<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
</body>
</html>