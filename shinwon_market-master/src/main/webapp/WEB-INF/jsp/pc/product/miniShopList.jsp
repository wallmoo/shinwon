<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display"><!-- page-display : 기획전 -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
            <div id="inner"><!-- inner -->

               <div class="container breadcrumb-wrap"><!-- breadcrumb -->
                    <div id="breadcrumb" class="wrap">
                        <div class="holder">
                            <a href="#!" class="home"><span>홈</span></a>
                            <span class="gt">&gt;</span>
                            <strong class="warning">MINI SHOP</strong>
                        </div>
                    </div>
                </div><!-- // breadcrumb -->


                <div class="container"><!-- container -->
                    <div class="wrap"><!-- wrap -->

                        <div class="section-title">
                            <h3 class="title"><span>MINI SHOP</span></h3>
                        </div>

                        <div>
                            <img src="<c:out value='${cdnDomain}'/>/pc/img/custom/minishop.png" alt="MINI OFFLINE SHOP" />
                        </div>

                        <div class="thumbnail-list minishop mt40"><!-- thumbnail-list -->     
							<c:choose>
								<c:when test="${not empty miniShopBannerList}">
								<ul class="tab">
									<c:forEach var="miniShopBannerRow" items="${miniShopBannerList}" varStatus="status">
										<li>
											<a href="${empty miniShopBannerRow.BNR_DTL_TARGET ? '#!' : miniShopBannerRow.BNR_DTL_URL}" target="${miniShopBannerRow.BNR_DTL_TARGET eq 'N' ? '_blank' : '_self' }" class="thumbnail">
												<img src="<c:out value='${cdnDomain}${miniShopBannerRow.CMM_FLE_ATT_PATH}${miniShopBannerRow.CMM_FLE_SYS_NM}'/>" alt="${miniShopBannerRow.CMN_FLE_ALT_TXT}" />
											</a>
										</li>										
									</c:forEach>
								 </ul>	
								</c:when>
								<c:otherwise>
									<p class="no-list-more top-line">
                                       준비중입니다.
                                    </p>
								</c:otherwise>
							</c:choose> 
                        </div><!-- // thumbnail-list -->

                        <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

                    </div><!-- wrap -->
                </div><!-- // container -->

            </div><!-- // inner -->
   
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
$(document).ready(function () {
	
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>