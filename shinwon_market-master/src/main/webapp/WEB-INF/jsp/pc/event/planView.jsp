<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-main">

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
                    <a href="#!"><span>기획전</span></a>
                </div>
            </div><!-- // breadcrumb -->

            <div id="content"><!-- content -->

                <h2 class="sr-only">{{ 본문 영역 }}</h2>

                <div id="inner"><!-- inner -->
				
					<div class="container event-view"><!-- event-view -->
                        <div class="wrap">
                            
                            <div class="grid event-view-top">
                                <div class="col nth-child-1">
                                    <h4 class="subject"><c:out value="${planInfo.PLN_MST_TITLE }"/></h4>
                                    <span class="date"><ui:formatDate value="${planInfo.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${planInfo.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
                                </div>
                                <div class="col nth-child-2 text-right">
                                    <a href="#!"><i class="icon kakao-story"><em>카카오스토리</em></i></a>
                                    <a href="#!"><i class="icon twitter"><em>트위터</em></i></a>
                                    <a href="#!"><i class="icon facebook"><em>페이스북</em></i></a>
                                    <a href="#!"><i class="icon url"><em>URL 복사</em></i></a>
                                    <a class="js-toggle-class" href="#!"><i class="icon zzim"><em>저장하기</em></i></a>
                                </div>
                            </div>

                            <div class="event-view-body">
                                <c:out value="${planInfo.PLN_MST_PC_BANNER }" escapeXml="false"/>
                            </div>

                        </div>
                    </div><!-- // event-view -->
					
					<c:choose>
						<c:when test="${not empty detailGroupList and not empty detailList }">
                        	<c:forEach var="groupRow" items="${detailGroupList }" varStatus="i">
								<div class="container product-wrap mb-70"><!-- product-wrap -->
			                        <div class="wrap">
		                            	<h4 class="title text-center"><c:out value="${groupRow.PLN_GRP_TITLE }"/></h4>
			                            <div class="grid product-list image"><!-- product-list -->
			                            	<c:forEach var="item" items="${detailList }" varStatus="y">
			                            		<c:if test="${groupRow.PLN_GRP_IDX eq item.PLN_GRP_IDX }">
					                                <div class="col">
					                                    <div class="module">
					                                        <a href="javascript:goProductDetail('<c:out value="${item.PLN_PRD_MST_CD}"/>','<c:out value="${item.DSP_PRD_CTG_IDX }"/>');">
					                                            <span class="thumb"><img src="<c:out value="${cdnDomain}" />/<c:out value="${item.PRD_IMAGE}" />" alt="<c:out value="${item.PRD_IMAGE_ALT}" />" onerror="this.src='${frontDomain}/fr/img/mall/empty.png'" /></span>
					                                            <span class="icons">
					                                            	<c:if test="${item.ICON_NEW eq 'Y' }">
													                	<i class="badge new"><em>신상품</em></i>
													                </c:if>
												                	<c:if test="${item.PRD_MST_ICN_YN1 eq 'Y' }">
																		<i class="badge best"><em>BEST</em></i>
													                </c:if>
													                <c:if test="${item.PRD_SALE_RATE > 0 }" >
													                	<i class="badge sale"><em>할인</em></i>
													                </c:if>
													                <c:if test="${item.PRD_MST_PC_CPN_PRC > 0 }">
													                	<i class="badge sale-instant"><em>즉시할인</em></i>
													                </c:if>
					                                                <c:if test="${item.PRD_MST_DLV_FEE eq 0}">
					                                                	<i class="badge free-shipping"><em>무료배송</em></i>
					                                                </c:if>
					                                                <c:if test="${item.GFT_MST_IDX > 0}">
				                                                		<i class="badge gift"><em>사은품</em></i>
					                                                </c:if>
					                                            </span>
					                                            <span class="name"><c:out value="${item.PRD_MST_NM_SUB }" /></span>
					                                            <span class="line"><c:out value="${item.PRD_MST_NM }" /></span>
					                                            <span class="price-before">
				                                            	<c:if test="${item.PLN_PRD_PRICE ne item.PRD_MST_PRC }">
				                                            		<em>소비자가</em>
				                                                	<span class="line-through"><fmt:formatNumber value="${item.PRD_MST_PRC }" groupingUsed="true" />원</span>
				                                            	</c:if>
					                                            </span>
					                                            <span class="price-after">
					                                                <em>판매가</em>
					                                                <span><fmt:formatNumber value="${item.PLN_PRD_PRICE }" groupingUsed="true" />원</span>
					                                            </span>
					                                            <span class="stars">
					                                                <i class="icon star star-<c:out value="${item.REP_STAR }" />"><span><em>별점 10점 만점중 <c:out value="${item.REP_STAR }" />점</em></span></i>
					                                                <small><em class="sr-only">리뷰</em><c:out value="${item.REP_CNT }" />개</small>
					                                            </span>
					                                        </a>
					                                        <div class="quick">
					                                            <a href="javascript:goProductSimplePopUp('<c:out value="${item.PLN_PRD_MST_CD}" />', '<c:out value="${item.DSP_PRD_CTG_IDX}" />');"><i class="icon preview"><em>간편보기</em></i></a>
					                                            <a href="javascript:;"><i class="icon cart"><em>장바구니 담기</em></i></a>
					                                            <a href="javascript:;"><i class="icon wish"><em>위시리스트 담기</em></i></a>
					                                        </div>
					                                    </div>
					                                </div>
				                                </c:if>
			                            	</c:forEach>
			                            </div><!-- // product-list -->
			                        </div>
			                    </div><!-- // product-wrap -->
		                   	</c:forEach>
	                  	</c:when>
                   	</c:choose>

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

<form id="frm" name="frm" >
	<input type="text" name="cPage" id="" value="" />
</form>

<script>

//independent script
(function(BASE){
	
    'use strict';
    var $document = $(document);
    $document.ready(function(){
    });
    
})(BASEkit || window);

// 기획전 상세정보
function goList()
{
	location.href = "<c:out value="${serverDomain}"/>/pc/event/planList.do";
};

</script>
</body>
</html>