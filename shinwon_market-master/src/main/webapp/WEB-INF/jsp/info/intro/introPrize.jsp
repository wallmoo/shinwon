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
            <strong>수상내역</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>수상내역</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        

        <div id="contents"><!-- #contents -->

            <h3 class="title">수상내역</h3>
			<hr class="hr-a" />

            

            <div class="awarded-list"><!-- awarded-list -->
                <ul class="reset">
                    
                    <li class="nth-child-3">
                        <div class="module">
                            <i class="icon"><!-- icon --></i>
                            <p class="date">
                                <span class="large18">2000. 01</span>
                            </p>
                            <h4 class="reset large24">고객의 마음을 움직이는<br />&lsquo;공감브랜드 대상&rsquo;</h4>
                            <p class="info">
                                <strong class="large16">동아일보</strong>
                            </p>
                        </div>
                    </li>
                </ul>
            </div><!-- // awarded-list -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
</body>
</html>