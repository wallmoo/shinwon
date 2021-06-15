<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>BI 소개</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
		</div>
        <div class="bi-wrap"><!-- bi-wrap -->

            <div class="padder mt20">
                <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/bi_1.png" alt="" />
            </div>

            <h3><span class="large16">BI 소개</span></h3>

            <div class="padder mt20">
                <p>
                    <strong class="large16">단순판매공간이 아닌 <sapn class="warning">따뜻한 감성과 신뢰</sapn>를 약속합니다.</strong>
                </p>
                <p class="small">
                    레드(Red)는 기업의 열정과 혁신, 고객을 향한 따뜻한 감성을 의미합니다. 둥근서체와 견고한 로고조합은 고객에게 친근하게 다가가고 신뢰를 약속하는 브랜드의 약속입니다.
                </p>
            </div>

            <h3><span class="large16">시그니춰</span> <span class="small">signature</span></h3>

            <div class="padder mt20">
                <p>
                    <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/bi_2.png" alt="가로조합형1" />
                </p>
                <p class="small">
                    <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/bi_3.png" alt="가로조합형2" />
                </p>
                <p class="small">
                    <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/bi_4.png" alt="세로조합형" />
                </p>
            </div>

            <h3><span class="large16">컬러시스템</span> <span class="small">color system</span></h3>

            <div class="padder mt20">
                <p class="small">
                    마켓플랜트을 표현하는 대표 요소로, 흰색 바탕에 사용하는 것을 원칙으로 합니다.
                </p>
                <p>
                    <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/bi_5.png" alt="" />
                </p>
                <div class="blind">
                    <h5>PK RED</h5>
                    <h6>Pantone Color</h6>
                    <p>
                        485C
                    </p>
                    <h6>Process Color</h6>
                    <p>
                        C0   M/Y100   K0
                    </p>
                    <h6>RGB Color</h6>
                    <p>
                        R237   G28    B36
                    </p>
                </div>
            </div>

            <h3><span class="large16">배경색상 규정</span> <span class="small">background color standard</span></h3>

            <div class="padder mt20">
                <p class="small">
                    배경에 색상이 있을 경우 배경색이 명도 50% 이하는 PK RED로 표현이 가능하며 60% 이상은 White로 사용이 가능합니다. 
                </p>
                <p>
                    <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/bi_6.png" alt="" />
                </p>
            </div>
        </div><!-- bi-wrap -->
        
	</article>
	<!--// #container E -->

<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>

<script type="text/javascript">
 

//]]>
</script>
</body>
</html>