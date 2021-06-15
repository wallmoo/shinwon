<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
<%-- <%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %> --%>
 
<!-- #container S -->
	<article id="container" class="container" data-role="content">  
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">  
            <h2>수상내역</h2>
          	<%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="awarded-list"><!-- awarded-list -->
            <ul>
                <li class="nth-child-1">
                    <p class="date">
                        <span class="small">2016. 01</span>
                    </p>
                    <h4>2016소비자 선정 최고의 브랜드 대상<span class="desc">포브스 코리아</span></h4>
                </li>
                <li class="nth-child-2">
                    <p class="date">
                        <span class="small">2015. 12</span>
                    </p>
                    <h4>한경미디어그룹 K- 가전유통부문 마켓플랜트 쿡앤킹</h4>
                    <p class="small mt10">
                        중국 한류 확산에 기여,노력한 기업으로 마켓플랜트가 가전유통 부문에 수상했습니다.
                    </p>
                </li>
                <li class="nth-child-3">
                    <p class="date">
                        <span class="small">2015. 11</span>
                    </p>
                    <h4>고객의 마음을 움직이는<br />&lsquo;2015 공감브랜드 대상&rsquo;<span class="desc">동아일보</span></h4>
                </li>
                <li class="nth-child-4">
                    <p class="date">
                        <span class="small">2015. 03</span>
                    </p>
                    <h4>2015 대한민국 명품브랜드 대상<span class="desc">한국경제신문</span></h4>
                </li>
                <li class="nth-child-5">
                    <p class="date">
                        <span class="small">2011</span>
                    </p>
                    <h4>인기상품 고객만족부분<span class="desc">전자신문</span></h4>
                    <p class="small mt10">
                        전자신문사에서 선정한 2011 인기상품에서 고객만족부분을 마켓플랜트가 수상했습니다.
                    </p>
                </li>
                <li class="nth-child-6">
                    <p class="date">
                        <span class="small">2003</span>
                    </p>
                    <h4>대한민국 고객만족경영 대상 고객서비스 혁신부문 우수상<span class="desc">한국능률협회컨설팅</span></h4>
                    <p class="small mt10">
                        한국능률협회컨설팅에서 주관하는 2003년 제 11회 대한민국 고객만족경영대상에서 고객서비스혁신부분 우수상에 마켓플랜트가 선정되었습니다.
                    </p>
                </li>
            </ul>
        </div><!-- // awarded-list -->
        
	</article>
	<!--// #container E -->

<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>

<script type="text/javascript">
 

//]]>
</script>
</body>
</html>