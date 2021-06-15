<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-store">

<div id="skipToContent"><a href="#content"><span>본문으로 건너뛰기</span></a></div>

<h1 class="sr-only">MarketPlant</h1>

<div id="container"><!-- container -->

    <div id="header">
    	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
    </div><!-- // header -->

    <div id="wrapper"><!-- wrapper -->

        <div id="innerWrapper"><!-- innerWrapper -->
        
        	<div id="breadcrumb" class="breadcrumb"><!-- breadcrumb -->
                <div class="inner">
                    <a class="home" href="#!"><span>HOME</span></a>
                    <i><em>&gt;</em></i>
                    <a href="#!"><span>베스트</span></a>
                </div>
            </div><!-- // breadcrumb -->

            <div id="content"><!-- content -->

                <h2 class="sr-only">{{ 본문 영역 }}</h2>

                <div id="inner"><!-- inner -->
				
					<h3 class="title">베스트 20</h3>
                    <p class="subtitle">가장 잘 팔리는 베스트 상품이 한곳에!</p>

                    <div class="container product-wrap best-list"><!-- product-wrap -->
                        <div class="wrap">

                            <div class="grid product-list image"><!-- product-list -->
                            	<c:choose>
                            		<c:when test="${not empty list }">
                            			<c:forEach begin="0" end="2" var="data" items="${list }" varStatus="i">
	                           				<div class="col">
			                                    <div class="module">
			                                        <i class="sticker best-<c:out value="${i.index+1 }" />"><em>BEST <c:out value="${i.index }" /></em></i>
			                                        <a href="javascript:goProductDetail('<c:out value="${data.PRD_MST_CD}" />', '<c:out value="${data.DSP_PRD_CTG_IDX}" />');">
			                                            <span class="thumb"><img src="<c:out value="${cdnDomain}" /><c:out value="${data.PRD_IMAGE}" />" alt="<c:out value="${data.PRD_IMAGE_ALT}" />" onerror="this.src='${frontDomain}/fr/img/mall/empty.png'" /></span>
			                                            <span class="icons">
			                                            	<c:if test="${data.PRD_MST_NEW_ICO < 30}">
			                                                    <i class="badge new"><em>신상품</em></i>
			                                                </c:if>
			                                                <i class="badge best"><em>BEST</em></i>
			                                                <c:if test="${data.PRD_MST_PC_CPN_PRC > 0}">
			                                                    <i class="badge sale-instant"><em>즉시할인</em></i>
			                                                </c:if>
			                                                <c:if test="${data.PRD_MST_DLV_FEE eq 0}">
			                                                    <i class="badge free-shipping"><em>무료배송</em></i>
			                                                </c:if>
			                                                <c:if test="${data.PRD_MST_GFT_CNT > 0}">
			                                                    <i class="badge gift"><em>사은품</em></i>
			                                                </c:if>
			                                            </span>
			                                            <span class="name"><c:out value="${data.PRD_MST_NM}" /></span>
<%-- 			                                            <span class="line">VH-110/W [화이트 / 회오리바 회오리바 회오리바</span> --%>
			                                            <c:choose>
			                                                <c:when test="${data.PRD_NOW_DST_PRICE > 0}">
			                                                    <span class="price-before">
			                                                        <em>판매가</em>
			                                                        <span class="line-through"><fmt:formatNumber value="${data.PRD_MST_PRC}" type="number" />원</span>
			                                                    </span>
			                                                    <span class="price-after">
			                                                        <em>즉시 할인가</em>
			                                                        <span><fmt:formatNumber value="${data.PRD_NOW_DST_PRICE}" type="number" /></span>원
			                                                    </span>
			                                                </c:when>
			                                                <c:otherwise>
			                                                    <span class="price-after">
			                                                        <em>판매가</em>
			                                                        <span><fmt:formatNumber value="${data.PRD_MST_PRC}" type="number" /></span>원
			                                                    </span>
			                                                </c:otherwise>
			                                            </c:choose>
			                                            <span class="stars">
			                                                <i class="icon star star-<c:out value="${data.REP_POINT_GRD eq '00' ? 0 : data.REP_POINT_GRD}" />"><span><em>별점 10점 만점중 <c:out value="${data.REP_POINT_GRD eq '00' ? 0 : data.REP_POINT_GRD}" />점</em></span></i>
			                                                <small><em class="sr-only">리뷰</em><c:out value="${data.REP_CNT}"/>개</small>
			                                            </span>
			                                        </a>
			                                        <div class="quick">
			                                            <a href="javascript:goProductSimplePopUp('<c:out value="${data.PRD_MST_CD}" />', '<c:out value="${data.DSP_PRD_CTG_IDX}" />');"><i class="icon preview"><em>간편보기</em></i></a>
			                                            <a href="javascript:alert('준비중입니다.');"><i class="icon cart"><em>장바구니 담기</em></i></a>
			                                            <a href="javascript:alert('준비중입니다.');"><i class="icon wish"><em>위시리스트 담기</em></i></a>
			                                        </div>
			                                    </div>
			                                </div>
                            			</c:forEach>
                            		</c:when>
                            		<c:otherwise>
                            			<div class="no-result">베스트 상품이 없습니다.</div>
                            		</c:otherwise>
                            	</c:choose>
                            </div><!-- // product-list -->

                        </div>
                    </div><!-- // product-wrap -->


                    <div class="container product-wrap"><!-- product-wrap -->
                        <div class="wrap">

                            <div id="bestList" class="grid product-list image"><!-- product-list -->
                            	
                            	<c:choose>
                            		<c:when test="${not empty list }">
                            			<c:forEach begin="3" end="19" var="data" items="${list }" varStatus="i">
                            				<div class="col">
			                                    <div class="module">
			                                        <i class="sticker ranking"><em>BEST</em><span><c:if test="${i.index+1 < 10 }">0</c:if><c:out value="${i.index+1 }" /></span></i>
			                                        <a href="javascript:goProductDetail('<c:out value="${data.PRD_MST_CD}" />', '<c:out value="${data.DSP_PRD_CTG_IDX}" />');">
			                                            <span class="thumb"><img src="<c:out value="${cdnDomain}" /><c:out value="${data.PRD_IMAGE}" />" alt="<c:out value="${data.PRD_IMAGE_ALT}" />" onerror="this.src='${frontDomain}/fr/img/mall/empty.png'" /></span>
			                                            <span class="icons">
			                                                <c:if test="${data.PRD_MST_NEW_ICO < 30}">
			                                                    <i class="badge new"><em>신상품</em></i>
			                                                </c:if>
			                                                <i class="badge best"><em>BEST</em></i>
			                                                <c:if test="${data.PRD_MST_PC_CPN_PRC > 0}">
			                                                    <i class="badge sale-instant"><em>즉시할인</em></i>
			                                                </c:if>
			                                                <c:if test="${data.PRD_MST_DLV_FEE eq 0}">
			                                                    <i class="badge free-shipping"><em>무료배송</em></i>
			                                                </c:if>
			                                                <c:if test="${data.PRD_MST_GFT_CNT > 0}">
			                                                    <i class="badge gift"><em>사은품</em></i>
			                                                </c:if>
			                                            </span>
			                                            <span class="name"><c:out value="${data.PRD_MST_NM}" /></span>
			                                            <%-- <span class="line">VH-110/W [화이트 / 회오리바 회오리바 회오리바</span>--%>
			                                            <c:choose>
			                                                <c:when test="${data.PRD_NOW_DST_PRICE > 0}">
			                                                    <span class="price-before">
			                                                        <em>판매가</em>
			                                                        <span class="line-through"><fmt:formatNumber value="${data.PRD_MST_PRC}" type="number" />원</span>
			                                                    </span>
			                                                    <span class="price-after">
			                                                        <em>즉시 할인가</em>
			                                                        <span><fmt:formatNumber value="${data.PRD_NOW_DST_PRICE}" type="number" /></span>원
			                                                    </span>
			                                                </c:when>
			                                                <c:otherwise>
			                                                    <span class="price-after">
			                                                        <em>판매가</em>
			                                                        <span><fmt:formatNumber value="${data.PRD_MST_PRC}" type="number" /></span>원
			                                                    </span>
			                                                </c:otherwise>
			                                            </c:choose>
			                                            <span class="stars">
			                                                <i class="icon star star-<c:out value="${data.REP_POINT_GRD eq '00' ? 0 : data.REP_POINT_GRD}" />"><span><em>별점 10점 만점중 <c:out value="${data.REP_POINT_GRD eq '00' ? 0 : data.REP_POINT_GRD}" />점</em></span></i>
			                                                <small><em class="sr-only">리뷰</em><c:out value="${data.REP_CNT}"/>개</small>
			                                            </span>
			                                        </a>
			                                        <div class="quick">
			                                            <a href="javascript:goProductSimplePopUp('<c:out value="${data.PRD_MST_CD}" />', '<c:out value="${data.DSP_PRD_CTG_IDX}" />');"><i class="icon preview"><em>간편보기</em></i></a>
			                                            <a href="javascript:alert('준비중입니다.');"><i class="icon cart"><em>장바구니 담기</em></i></a>
			                                            <a href="javascript:alert('준비중입니다.');"><i class="icon wish"><em>위시리스트 담기</em></i></a>
			                                        </div>
			                                    </div>
			                                </div>
                            			</c:forEach>
                            		</c:when>
                            		<c:otherwise></c:otherwise>
                            	</c:choose>
                            
                            </div><!-- // product-list -->

                        </div>
                    </div><!-- // product-wrap -->

                    <div class="bottom-spacer" aria-hidden="true"></div>
				
                </div><!-- // inner -->

            </div><!-- // content -->

            <div id="skyscraper">
            	<%@ include file="/WEB-INF/jsp/pc/include/skyscraper.jsp" %>
            </div><!-- // skyscraper -->
            
        </div><!-- // innerWrapper -->

    </div><!-- // wrapper -->

    <div id="footer">
    	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    </div><!-- // footer -->

</div>

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

<script>

//independent script
(function(BASE){
    'use strict';

    var $document = $(document);

    $document.ready(function(){

//         $('.action a').on('click', function(e) {
//             e.preventDefault();
//             // do something..
//         });


    });

})(BASEkit || window);

</script>
</body>
</html>