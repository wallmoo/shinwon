<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>채용정보</h2>
           <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt15">
            <h3 class="small">채용정보</h3>
        </div>

        <div class="recruit-ing"><!-- recruit-ing -->
            <i class="icon"><!-- icon --></i>
            <p class="mt15">
                <strong>채용정보</strong><br />준비중입니다.
            </p>
        </div><!-- // recruit-ing -->
        
	</article>
	<!--// #container E -->
	<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
</body>
</html>