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
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="#!" class="home"><span>채용정보</span></a>
            <span class="gt">&gt;</span> 
            <strong>인재상</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <div id="contents" class="mb50"><!-- #contents -->
			<h3 class="title">채용정보</h3>
            <hr class="hr-a" />

            <img src="<c:out value="${cdnDomain}" />/pc/img/info/icon_recruit.jpg" alt="채용정보 페이지는 준비중입니다." class="mt50" />
           
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->

 

<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
</body>
</html>