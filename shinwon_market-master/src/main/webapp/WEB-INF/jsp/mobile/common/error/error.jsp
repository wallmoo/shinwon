<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="title" content="마켓플랜트">
<title>시스템 오류 &lt; 마켓플랜트</title>

<link rel="stylesheet" href="<c:out value="${cdnDomain }"/>/mobile/css/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" href="<c:out value="${cdnDomain }"/>/mobile/css/style.css"><!-- 공통 css-->

<script src="<c:out value="${cdnDomain }"/>/mobile/js/jquery-1.11.1.min.js"></script>
<script src="<c:out value="${cdnDomain }"/>/mobile/js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain }"/>/mobile/js/jquery.bxslider.min.js"></script><!-- slider js-->
<script src="<c:out value="${cdnDomain }"/>/mobile/js/jquery.lazyload.js"></script><!-- 이미지 로드 js -->
<script src="<c:out value="${cdnDomain }"/>/mobile/js/com.js"></script><!-- 공통 js -->

</head>
<body class="page-error">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
    
    <header class="header"><!-- #header -->
        <h1><span class="blind">마켓플랜트</span></a></h1>
    </header><!--// #header -->
    
    <!-- #container S -->
    <article id="container" class="container">
 
        <div class="error-frame"><!-- error-frame -->
            <i class="icon system"><!-- icon --></i>
            <h2 class="mt20">일시적으로 서비스를<br /> 이용하실 수 없습니다.</h2>
            <p class="mt15">
                서비스 이용에 불편을 드려 죄송합니다.<br />
                시스템 장애로 인해 정상적인 화면이 호출되지 않고 있습니다.<br />
                브라우저를 다시 띄우시거나, 잠시 후에 이용해 주시기 바랍니다.
            </p>
            <p class="mt20">
                해당 장애에 대한 문의사항은 <br />
                고객센터  02-6925-1160 로 문의주시거나, <br />
                지속적으로 발생 시  &lsquo;고객센터  &gt; 1:1문의&rsquo;를 이용하여 주세요.
            </p>
        </div><!-- error-frame -->

        <div class="section-button"><!-- section-button -->
            <a href="<c:out value="${mobileDomain }"/>/mobile/main/index.do" class="button warning xlarge _pg_link" target="_self"><span>쇼핑몰 홈으로 이동하기</span></a>
        </div><!-- // section-button -->

    </article>
    <!--// #container E -->
    
    <footer class="footer"><!-- #footer -->
        <div class="minW">
            MarketPlant © ALL Rights Reserved
        </div>
    </footer><!--// #footer -->

</section>
<!--// #wrap E -->
</body>
</html>