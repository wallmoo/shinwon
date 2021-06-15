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
            <strong>채용정보</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="#!" class="home"><span>홈</span></a>
            <span class="gt">&gt;</span>
            <a href="#!" class="home"><span>채용정보</span></a>
            <span class="gt">&gt;</span> 
            <strong>인재상</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <%@ include file="/WEB-INF/jsp/info/include/leftMenu.jsp" %>

        <div id="contents"><!-- #contents -->

            <hr class="hr-a" />

            <h3 class="title">직무소개</h3>

            <div class="recruit-ing"><!-- recruit-ing -->
                <i class="icon"><!-- icon --></i>
                <p class="mt40">
                    <strong>채용정보</strong><br />준비중입니다.
                </p>
            </div><!-- // recruit-ing -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->

 

<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
</body>
</html>