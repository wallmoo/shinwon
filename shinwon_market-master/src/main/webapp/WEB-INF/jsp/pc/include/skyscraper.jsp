<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrapper">
    <h2 class="sr-only">{{ skyscraper 영역 }}</h2>
    <ul class="reset">
        <li class="item nth-child-1">
            <c:choose>
                <c:when test="${sessionUser.ROLE_USER eq 'user'}">
                    <a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepProductList.do">
                </c:when>
                <c:otherwise>
                    <a href="javascript:goLoginPopup();">
                </c:otherwise>
            </c:choose>        
                <i class="icon">
                    <em>관심상품</em>
                    <span>${keepProductCnt}</span>
                </i>
            </a>
        </li>
        <li class="item nth-child-2">
            <c:choose>
                <c:when test="${sessionUser.ROLE_USER eq 'user'}">
                    <a href="<c:out value="${frontDomain }"/>/pc/cart/cartlist.do">
                </c:when>
                <c:otherwise>
                    <a href="javascript:goLoginPopup();">
                </c:otherwise>
            </c:choose>        
                <i class="icon">
                    <em>장바구니</em>
                    <span>${cartCnt}</span>
                </i>
            </a>
        </li>
        <li class="item nth-child-3">
            <a href="#!">
                <i class="icon">
                    <em>최근 본 상품</em>
                    <span>${recentProductCount}</span>
                </i>
            </a>
        </li>
        <li class="item nth-child-4">
            <a href="#!">쿠폰</a>
        </li>
        <li class="item nth-child-5">
            <a href="<c:out value="${frontDomain }"/>/pc/customer/customerMain.do">고객센터</a>
        </li>
    </ul>
    <div id="scraperToggle" class="core">
        <p class="user">
            <strong>최근 본 상품</strong>
        </p>
        <div class="product-wrap">
            <div id="skyView" class="grid product-list list"><!-- skyscraperView ajax load --></div>
        </div>
        <a class="close" href="#!"><i class="icon"><em>close</em></i></a>
    </div>
</div>
<a href="#!" class="js-top"><i class="icon"><em>Top</em></i></a>
<script>
$.skyscraperView = $.skyscraperView || {
    "group": [{
        "subject" : "관심상품",
        "items": []
    }, {
       "subject" : "장바구니",
        "items": [{
            "thumb": "../img/mall/empty.png",
            "alt": "미떼 핫초코 20T 오리지널미떼 핫초코 20T 오리지널미떼 핫초코 20T 오리지널미떼 핫초코 20T 오리지널",
            "price": "2000",
            "src": "#!"
        }]
    }, {
       "subject" : "최근 본 상품",
        "items": [
    	<c:choose>
		<c:when test="${not empty recentProductList }">
                <c:forEach var="recentProductRow" items="${recentProductList }" varStatus="i">
        		{
                    "thumb": "<c:out value="${cdnDomain }${recentProductRow.PRD_IMAGE }"/>",
                    "alt": "<c:out value="${recentProductRow.PRD_MST_NM }"/>",
                    "price": "<fmt:formatNumber value="${recentProductRow.PRD_MST_PRICE }" groupingUsed="true"/>",
                    "src": "<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${recentProductRow.PRD_MST_CD}"
                },                
                </c:forEach>
    	</c:when>
    	<c:otherwise>
    			"items": []
    	</c:otherwise>
	</c:choose>        
        
        
        
        
        
        
        
        
        
    	] 
    }]
};


// LOGIN 클릭 이벤트
goLoginPopup = function(){
	
	var url = location.href;
	
	//주문서에서 로그인하는 경우 장바구니로 간다.
	if(url.indexOf("cartpayment") > 0){
		url = "<c:out value="${frontDomain }"/>/pc/cart/cartlist.do";
	}
	
	url = encodeURIComponent(url);
	
	window.open("<c:out value="${frontDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=<c:out value="${locationProtocol}"/>","loginPopup","width=1030,height=680,scrollbars=no,target=_blank");
};	

</script>