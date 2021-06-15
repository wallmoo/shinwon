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
            <strong>본사위치</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>본사위치</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        

        <div id="contents"><!-- #contents -->

            

            <h3 class="title">본사위치</h3>

            <div>
                <img src="<c:out value="${cdnDomain}"/>/pc/img/info/map.jpg">
            </div>

            <div class="section-button tx_add"><!-- section-button -->
				<p class="large18">서울 금천구 가산동 60-73 벽산디지털밸리5차 512호</p>
				<div class="link_box">
					<a href="http://map.naver.com/?dlevel=12&pinType=site&pinId=21306182&x=126.8858260&y=37.4767188&enc=b64" class="button small more" target="_blank" title="새 창 열림"><span>네이버 지도</span></a>
					<a href="http://map.daum.net/?urlX=474748&urlY=1104826&itemId=18679763" class="button small more" target="_blank" title="새 창 열림"><span>다음 지도</span></a>
					<a href="https://goo.gl/maps/geNrW9mbATU2" class="button small more" target="_blank" title="새 창 열림"><span>구글 지도</span></a>
				</div>
            </div><!-- // section-button -->

            <div class="grid map-guide"><!-- map-guide -->
                <div class="col col-1-2 bus">
                    <div class="module">
                        <h4 class="reset large16">버스</h4>
                        <i class="icon"></i>
                        <ul class="reset">
                            <li><span class="label line-a">간선</span> </li>
                            <li><span class="label line-b">지선</span> </li>
                        </ul>
                    </div>
                </div>
                <div class="col col-1-2 metro">
                    <div class="module">
                        <h4 class="reset large16">지하철</h4>
                        <i class="icon"></i>
                        <ul class="reset">
                            <li class="nth-child-1"><span class="label line-c">1호선</span>가산디지털단지역 4번 출구(10분 소요)</li>
                            <li class="nth-child-2"><span class="label line-d">7호선</span>가산디지털단지역 4번 출구(10분 소요)</li>
                        </ul>
                    </div>
                </div>
            </div><!-- // map-guide -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->

<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
</body>
</html>