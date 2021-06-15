<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
    <div id="productListHtml">
        <c:if test="${empty listProduct}">
            <div class="no-result">등록된 상품이 없습니다.</div>
        </c:if>
        <c:forEach var="data" items="${listProduct}" varStatus="i">
        <div class="col">
            <div class="module">
                <c:choose>
                    <c:when test="${data.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || data.PRD_MST_SEL_CNT == 0}">
                        <i class="sticker temporary">일시품절</i>
                    </c:when>
                    <c:when test="${data.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}">
                        <i class="sticker soldout">sold out</i>
                    </c:when>
                </c:choose>
                <a href="javascript:goProductDetail('<c:out value="${data.PRD_MST_CD}" />', '<c:out value="${commandMap.catIdx}"/>');">
                    <span class="thumb"><img src="<c:out value="${cdnDomain}" /><c:out value="${data.PRD_IMAGE}" />" alt="<c:out value="${data.PRD_IMAGE_ALT}" />" onerror="this.src='${frontDomain}/fr/img/mall/empty.png'"/></span>
                    <span class="icons">
                        <c:if test="${data.PRD_MST_NEW_ICO < 30}">
                            <i class="badge new"><em>신상품</em></i>
                        </c:if>
                        <c:if test="${data.PRD_MST_PC_CPN_PRC > 0}">
                            <i class="badge sale-instant"><em>즉시할인</em></i>
                        </c:if>
                        <c:if test="${data.PRD_MST_DLV_FEE eq 0}">
                            <i class="badge free-shipping"><em>무료배송</em></i>
                        </c:if>
                        <c:if test="${data.PRD_MST_GFT_CNT > 0}">
                            <i class="badge gift"><em>사은품</em></i>
                        </c:if>
                        <%-- 
                        <i class="badge best"><em>BEST</em></i>
                        <i class="badge sale"><em>할인</em></i>
                        --%>
                    </span>
                    <span class="name"><c:out value="${data.PRD_MST_NM}" /></span>
                    <%-- 
                    <span class="line">VH-110/W [화이트 / 회오리바 회오리바 회오리바</span>
                    --%>
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
                    <a href="javascript:goProductSimplePopUp('<c:out value="${data.PRD_MST_CD}" />', '<c:out value="${commandMap.catIdx}" />');"><i class="icon preview"><em>간편보기</em></i></a>
                    <c:if test="${data.PRD_MST_SEL_STATE ne Code.PRODUCT_SELL_STATE_TEMPOUT and data.PRD_MST_SEL_STATE ne Code.PRODUCT_SELL_STATE_OP_TEMPOUT and data.PRD_MST_SEL_CNT > 0}">
                        <a href="javascript:alert('준비중입니다.');"><i class="icon cart"><em>장바구니 담기</em></i></a>
                    </c:if>
                    <a href="javascript:alert('준비중입니다.');"><i class="icon wish"><em>위시리스트 담기</em></i></a>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    
    <div id="pagingHtml">
        <h4 class="sr-only">목록 페이징</h4>
        <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
            <ui:frontpaging paging="${paging}" jsFunction="goPage" />
        </div>
    </div>
    <input type="hidden" id="totalRecordCount" value="${paging.totalRecordCount}" />
</div>