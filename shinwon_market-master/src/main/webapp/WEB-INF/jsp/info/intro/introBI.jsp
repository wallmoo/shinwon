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
            <strong>BI 소개</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>BI 소개</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
        <div id="contents" class="mb50"><!-- #contents -->
            

            <h3 class="title">BI 소개</h3>
			<hr class="hr-a" />

            <div class="bi_tx_d">
				<p class="tx_bi">
					<span class="ti">
						BI 소개
						<i class="ico_l"></i>
					</span>					
					<span class="tx">
						BI 소개
					</span>
				</p>
            </div>
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
</body>
</html>