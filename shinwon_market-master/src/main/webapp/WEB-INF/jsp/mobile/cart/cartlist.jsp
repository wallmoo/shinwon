<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-order">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>장바구니</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="order-step"><!-- order-step -->
            <ol class="ui-grid-b">
                <li class="ui-block-a active"><i class="cart"><!-- icon --></i><strong>장바구니</strong><span class="blind">현재위치</span></li>
                <li class="ui-block-b"><i class="order"><!-- icon --></i><strong>주문서/결제</strong></li>
                <li class="ui-block-c"><i class="finish"><!-- icon --></i><strong>주문완료</strong></li>
            </ol>
        </div><!-- // order-step -->
        
        <form name="paymentform" id="paymentform" method="post"></form>

		<%---------------------------------------------------------------- 상품이 하나도 없는 경우 시작 ------------------------------------------------%>
        <c:if test="${empty cartlist}">
			<div class="cart-no-more"><!-- cart-no-more -->
	            <i><!-- icon --></i>
	            <p>
	                <span class="large">장바구니에 담긴 상품이 없습니다.</span>
	            </p>
	        </div><!-- // cart-no-more -->
	
	        <div class="section-button mb20"><!-- section-button -->
	            <a href="<c:out value="${mobileDomain}" />/mobile/main/index.do" target="_self" class="button warning"><span>쇼핑 계속하기</span></a>
	        </div><!-- // section-button -->
        </c:if>
        <%---------------------------------------------------------------- 상품이 하나도 없는 경우 끝 ------------------------------------------------%>
        
        <c:if test="${not empty cartlist}">
        	<hr class="hr-a">
        </c:if>
        
        <%---------------------------------------------------------------- 마켓플랜트 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty sysRetailCartList}">
				<c:set var="c_dlv_type" value="sysRetail"/>
				
				<div class="cart-list-wrap price-king"><!-- cart-list-wrap -->
		            <div class="cart-title"><!-- cart-title -->
		                <h3>
		                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
		                    <label for="selectAll_${c_dlv_type}"><strong>프라이스킹 배송상품</strong> (<c:out value="${fn:length(sysRetailCartList)}"/>)</label>
		                </h3>
		                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">프라이스킹 배송상품 <em>닫기</em></span></i></a>
		            </div><!-- // cart-title -->
		
					<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
					
		            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
		                <ul class="cart-list"><!-- cart-list -->
		                	<c:forEach var="cart" items="${sysRetailCartList}">
		                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
		                	</c:forEach>
		                </ul><!-- // cart-list -->
		            </div>
					
					<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
		            
		        </div><!-- // cart-list-wrap -->
            </c:if>
        <%---------------------------------------------------------------- 마켓플랜트 상품 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 입점업체 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty vendorCartList}">
				<c:set var="c_dlv_type" value="vendor"/>
				
				<div class="cart-list-wrap price-king partner"><!-- cart-list-wrap -->
		            <div class="cart-title"><!-- cart-title -->
		                <h3>
		                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
		                    <label for="selectAll_${c_dlv_type}"><strong>파트너 배송상품</strong> (<c:out value="${fn:length(vendorCartList)}"/>)</label>
		                </h3>
		                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">파트너 배송상품 <em>닫기</em></span></i></a>
		            </div><!-- // cart-title -->
		
					<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
					
		            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
		                <ul class="cart-list"><!-- cart-list -->
		                	<c:forEach var="cart" items="${vendorCartList}">
		                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
		                	</c:forEach>
		                </ul><!-- // cart-list -->
		            </div>
					
					<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
		            
		        </div><!-- // cart-list-wrap -->
            </c:if>
        <%---------------------------------------------------------------- 입점업체 상품 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 마켓플랜트/입점업체 총금액 시작 ------------------------------------------------%>
        <c:if test="${not empty vendorCartList or not empty sysRetailCartList}">
        
        <div class="section-price-total"><!-- section-price-total -->
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <span class="warning xlarge">총 결제예정금액</span>
                </div>
                <div class="ui-block-b">
                    <span class="warning xxlarge">
                    	<strong id="span_cart_total_normal" class="span_amt"><fmt:formatNumber value="${cart_total_sysRetail + cart_total_vendor}" type="number" /></strong>원
                    </span>
                </div>
            </div>
            <p class="text-right desc">(적립예정 포인트 : <span id="span_cart_reserve_mileage_normal" class="span_amt"><fmt:formatNumber value="${cart_reserve_mileage_sysRetail + cart_reserve_mileage_vendor}" type="number" /></span> P)</p>

            <div class="section-button"><!-- section-button -->
                <div class="ui-grid-b">
                    <div class="ui-block-a">
                        <a href="javascript:SelectedDeleteBtn('normal');" class="button full"><span>선택삭제</span></a>
                    </div>
                    <div class="ui-block-b">
                         <a href="javascript:payment('0', 'normal');" class="button primary full"><span>선택상품주문</span></a>
                    </div>
                    <div class="ui-block-c">
                        <a href="javascript:payment('-1', 'normal');" class="button warning full"><span>전체상품주문</span></a>
                    </div>
                </div>
            </div><!-- // section-button -->
        </div><!-- section-price-total --> 
        </c:if>
        <%---------------------------------------------------------------- 마켓플랜트/입점업체 총금액 끝 ------------------------------------------------%>

		<%---------------------------------------------------------------- 겟잇나우1 상품 시작 ------------------------------------------------%>
		<c:if test="${not empty getItNowCartList1}">
			<c:set var="c_dlv_type" value="get1"/>
            <div class="cart-list-wrap get-it-now"><!-- cart-list-wrap -->
	            <div class="cart-title"><!-- cart-title -->
	                <h3>
	                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
	                    <label for="selectAll_${c_dlv_type}"><strong>겟잇나우 배송상품</strong> ${getItNowCartList1[0].SHP_MST_NM} (<c:out value="${fn:length(getItNowCartList1)}"/>)</label>
	                </h3>
	                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">겟잇나우 배송상품 <em>닫기</em></span></i></a>
	            </div><!-- // cart-title -->
	
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
				
	            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
	                <ul class="cart-list"><!-- cart-list -->
	                	<c:forEach var="cart" items="${getItNowCartList1}">
	                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </ul><!-- // cart-list -->
	            </div>
	            
	            <div class="booking-info"><!-- booking-info -->
	                <h4><span class="large">방문예약정보</span></h4>
	                <p>
	                    <strong class="shop">${getItNowCartList1[0].SHP_MST_NM}</strong>
	                    <span class="date"><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowCartList1[0].MEM_CRT_GET_PKU_DT }"/>&nbsp;<c:out value="${getItNowCartList1[0].MEM_CRT_GET_PKU_HH }"/></span>
	                </p>
	                <a href="javascript:getItNowShopInfoPopup('${getItNowCartList1[0].MEM_CRT_SHP_MST_IDX }');" class="button small"><span>매장위치확인</span></a>
	            </div><!-- // booking-info -->
				
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
	            
	        </div><!-- // cart-list-wrap -->
	        
	        <div class="section-price-total"><!-- section-price-total -->
	            <div class="section-button"><!-- section-button -->
	                <div class="ui-grid-b">
	                    <div class="ui-block-a">
	                        <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="button full"><span>선택삭제</span></a>
	                    </div>
	                    <div class="ui-block-b">
	                         <a href="javascript:payment('0', '${c_dlv_type}');" class="button primary full"><span>선택상품주문</span></a>
	                    </div>
	                    <div class="ui-block-c">
	                        <a href="javascript:payment('-1', '${c_dlv_type}');" class="button warning full"><span>전체상품주문</span></a>
	                    </div>
	                </div>
	            </div><!-- // section-button -->
	        </div><!-- section-price-total --> 
        </c:if>
        <%---------------------------------------------------------------- 겟잇나우1 상품 끝 ------------------------------------------------%>
            
        <%---------------------------------------------------------------- 겟잇나우2 상품 시작 ------------------------------------------------%>
		<c:if test="${not empty getItNowCartList2}">
			<c:set var="c_dlv_type" value="get2"/>
            <div class="cart-list-wrap get-it-now"><!-- cart-list-wrap -->
	            <div class="cart-title"><!-- cart-title -->
	                <h3>
	                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
	                    <label for="selectAll_${c_dlv_type}"><strong>겟잇나우 배송상품</strong> ${getItNowCartList2[0].SHP_MST_NM} (<c:out value="${fn:length(getItNowCartList2)}"/>)</label>
	                </h3>
	                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">겟잇나우 배송상품 <em>닫기</em></span></i></a>
	            </div><!-- // cart-title -->
	
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
				
	            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
	                <ul class="cart-list"><!-- cart-list -->
	                	<c:forEach var="cart" items="${getItNowCartList2}">
	                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </ul><!-- // cart-list -->
	            </div>
	            
	            <div class="booking-info"><!-- booking-info -->
	                <h4><span class="large">방문예약정보</span></h4>
	                <p>
	                    <strong class="shop">${getItNowCartList2[0].SHP_MST_NM}</strong>
	                    <span class="date"><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowCartList2[0].MEM_CRT_GET_PKU_DT }"/>&nbsp;<c:out value="${getItNowCartList2[0].MEM_CRT_GET_PKU_HH }"/></span>
	                </p>
	                <a href="javascript:getItNowShopInfoPopup('${getItNowCartList2[0].MEM_CRT_SHP_MST_IDX }');" class="button small"><span>매장위치확인</span></a>
	            </div><!-- // booking-info -->
				
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
	            
	        </div><!-- // cart-list-wrap -->
	        
	        <div class="section-price-total"><!-- section-price-total -->
	            <div class="section-button"><!-- section-button -->
	                <div class="ui-grid-b">
	                    <div class="ui-block-a">
	                        <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="button full"><span>선택삭제</span></a>
	                    </div>
	                    <div class="ui-block-b">
	                         <a href="javascript:payment('0', '${c_dlv_type}');" class="button primary full"><span>선택상품주문</span></a>
	                    </div>
	                    <div class="ui-block-c">
	                        <a href="javascript:payment('-1', '${c_dlv_type}');" class="button warning full"><span>전체상품주문</span></a>
	                    </div>
	                </div>
	            </div><!-- // section-button -->
	        </div><!-- section-price-total -->
	        
        </c:if>
        <%---------------------------------------------------------------- 겟잇나우2 상품 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 겟잇나우3 상품 시작 ------------------------------------------------%>
		<c:if test="${not empty getItNowCartList3}">
			<c:set var="c_dlv_type" value="get3"/>
            <div class="cart-list-wrap get-it-now"><!-- cart-list-wrap -->
	            <div class="cart-title"><!-- cart-title -->
	                <h3>
	                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
	                    <label for="selectAll_${c_dlv_type}"><strong>겟잇나우 배송상품</strong> ${getItNowCartList3[0].SHP_MST_NM} (<c:out value="${fn:length(getItNowCartList3)}"/>)</label>
	                </h3>
	                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">겟잇나우 배송상품 <em>닫기</em></span></i></a>
	            </div><!-- // cart-title -->
	
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
				
	            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
	                <ul class="cart-list"><!-- cart-list -->
	                	<c:forEach var="cart" items="${getItNowCartList3}">
	                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </ul><!-- // cart-list -->
	            </div>
				
				<div class="booking-info"><!-- booking-info -->
	                <h4><span class="large">방문예약정보</span></h4>
	                <p>
	                    <strong class="shop">${getItNowCartList3[0].SHP_MST_NM}</strong>
	                    <span class="date"><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowCartList3[0].MEM_CRT_GET_PKU_DT }"/>&nbsp;<c:out value="${getItNowCartList3[0].MEM_CRT_GET_PKU_HH }"/></span>
	                </p>
	                <a href="javascript:getItNowShopInfoPopup('${getItNowCartList3[0].MEM_CRT_SHP_MST_IDX }');" class="button small"><span>매장위치확인</span></a>
	            </div><!-- // booking-info -->
	            
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
	            
	        </div><!-- // cart-list-wrap -->
	        
	        <div class="section-price-total"><!-- section-price-total -->
	            <div class="section-button"><!-- section-button -->
	                <div class="ui-grid-b">
	                    <div class="ui-block-a">
	                        <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="button full"><span>선택삭제</span></a>
	                    </div>
	                    <div class="ui-block-b">
	                         <a href="javascript:payment('0', '${c_dlv_type}');" class="button primary full"><span>선택상품주문</span></a>
	                    </div>
	                    <div class="ui-block-c">
	                        <a href="javascript:payment('-1', '${c_dlv_type}');" class="button warning full"><span>전체상품주문</span></a>
	                    </div>
	                </div>
	            </div><!-- // section-button -->
	        </div><!-- section-price-total -->
	        
        </c:if>
        <%---------------------------------------------------------------- 겟잇나우3 상품 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 매장위치 확인 팝업 시작 ------------------------------------------------%>
        <section id="shopInfo" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #shopInfo -->
        </section><!-- // #shopInfo -->
        <%---------------------------------------------------------------- 매장위치 확인 팝업 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 클린킹 상품 시작 ------------------------------------------------%>
		<c:if test="${not empty serviceCartList}">
			<c:set var="c_dlv_type" value="service"/>
            <div class="cart-list-wrap clean-king"><!-- cart-list-wrap -->
	            <div class="cart-title"><!-- cart-title -->
	                <h3>
	                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
	                    <label for="selectAll_${c_dlv_type}"><strong>클린킹 배송상품</strong> (<c:out value="${fn:length(serviceCartList)}"/>)</label>
	                </h3>
	                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">클린킹 배송상품 <em>닫기</em></span></i></a>
	            </div><!-- // cart-title -->
	
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
				
	            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
	                <ul class="cart-list"><!-- cart-list -->
	                	<c:forEach var="cart" items="${serviceCartList}">
	                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </ul><!-- // cart-list -->
	            </div>
	            
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
	            
	        </div><!-- // cart-list-wrap -->
	        
	        <div class="section-price-total"><!-- section-price-total -->
	            <div class="section-button section-button-clean"><!-- section-button -->
	                <div class="ui-grid-b">
	                    <div class="ui-block-a">
	                        <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="button full"><span>선택삭제</span></a>
	                    </div>
	                    <div class="ui-block-b">
	                         <a href="javascript:payment('0', '${c_dlv_type}');" class="button primary full"><span>선택상품상담예약</span></a>
	                    </div>
	                    <div class="ui-block-c">
	                        <a href="javascript:payment('-1', '${c_dlv_type}');" class="button warning full"><span>전체상품상담예약</span></a>
	                    </div>
	                </div>
	            </div><!-- // section-button -->
	        </div><!-- section-price-total --> 
        </c:if>
        <%---------------------------------------------------------------- 클린킹 상품 끝 ------------------------------------------------%>
            
		<%---------------------------------------------------------------- 장기할부 24개월 상품 시작 ------------------------------------------------%>
		<c:if test="${not empty longInsCartList24}">
			<c:set var="c_dlv_type" value="long24"/>
            <div class="cart-list-wrap long-monthly"><!-- cart-list-wrap -->
	            <div class="cart-title"><!-- cart-title -->
	                <h3>
	                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
	                    <label for="selectAll_${c_dlv_type}"><strong>장기할부 배송상품 (24개월)</strong> (<c:out value="${fn:length(longInsCartList24)}"/>)</label>
	                </h3>
	                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">장기할부 배송상품 <em>닫기</em></span></i></a>
	            </div><!-- // cart-title -->
	
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
				
	            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
	                <ul class="cart-list"><!-- cart-list -->
	                	<c:forEach var="cart" items="${longInsCartList24}">
	                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </ul><!-- // cart-list -->
	            </div>
	            
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
	            
	        </div><!-- // cart-list-wrap -->
	        
	        <div class="section-price-total"><!-- section-price-total -->
	            <div class="section-button"><!-- section-button -->
	                <div class="ui-grid-b">
	                    <div class="ui-block-a">
	                        <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="button full"><span>선택삭제</span></a>
	                    </div>
	                    <div class="ui-block-b">
	                         <a href="javascript:payment('0', '${c_dlv_type}');" class="button primary full"><span>선택상품주문</span></a>
	                    </div>
	                    <div class="ui-block-c">
	                        <a href="javascript:payment('-1', '${c_dlv_type}');" class="button warning full"><span>전체상품주문</span></a>
	                    </div>
	                </div>
	            </div><!-- // section-button -->
	        </div><!-- section-price-total -->
	        
        </c:if>
        <%---------------------------------------------------------------- 장기할부 24개월 상품 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 장기할부 36개월 상품 시작 ------------------------------------------------%>
		<c:if test="${not empty longInsCartList36}">
			<c:set var="c_dlv_type" value="long36"/>
            <div class="cart-list-wrap long-monthly"><!-- cart-list-wrap -->
	            <div class="cart-title"><!-- cart-title -->
	                <h3>
	                    <input type="checkbox" class="checkbox selectAll selectAll_${c_dlv_type} <c:if test="${c_dlv_type2 ne ''}"> selectAll_${c_dlv_type2}</c:if>" id="selectAll_${c_dlv_type}" data-dlv_type="${c_dlv_type}" checked="checked">
	                    <label for="selectAll_${c_dlv_type}"><strong>장기할부 배송상품 (36개월)</strong> (<c:out value="${fn:length(longInsCartList36)}"/>)</label>
	                </h3>
	                <a href="#productList_${c_dlv_type}" class="more js-toggler active"><i><span class="blind">장기할부 배송상품 <em>닫기</em></span></i></a>
	            </div><!-- // cart-title -->
	
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistHead.jsp" %>
				
	            <div id="productList_${c_dlv_type}" class="toggle toggle-item in">
	                <ul class="cart-list"><!-- cart-list -->
	                	<c:forEach var="cart" items="${longInsCartList36}">
	                		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </ul><!-- // cart-list -->
	            </div>
	            
				<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartlistPrice.jsp" %>
	            
	        </div><!-- // cart-list-wrap -->
	        
	        <div class="section-price-total"><!-- section-price-total -->
	            <div class="section-button"><!-- section-button -->
	                <div class="ui-grid-b">
	                    <div class="ui-block-a">
	                        <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="button full"><span>선택삭제</span></a>
	                    </div>
	                    <div class="ui-block-b">
	                         <a href="javascript:payment('0', '${c_dlv_type}');" class="button primary full"><span>선택상품주문</span></a>
	                    </div>
	                    <div class="ui-block-c">
	                        <a href="javascript:payment('-1', '${c_dlv_type}');" class="button warning full"><span>전체상품주문</span></a>
	                    </div>
	                </div>
	            </div><!-- // section-button -->
	        </div><!-- section-price-total -->
	        
        </c:if>
        <%---------------------------------------------------------------- 장기할부 36개월 상품 끝 ------------------------------------------------%>
        
        <hr class="hr-a">

        <div class="section-button"><!-- section-button -->
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <a href="javascript:soldOutDeleteBtn('');" class="button primary full"><span>품절상품삭제</span></a>
                </div>
                <div class="ui-block-b">
                     <a href="<c:out value="${mobileDomain}" />/mobile/main/index.do" class="button warning full"><span>계속 쇼핑하기</span></a>
                </div>
            </div>
        </div><!-- // section-button -->

        <div class="cart-guide-a" data-role="collapsible-set"><!-- cart-guide-a -->
            <div data-role="collapsible" data-collapsed="true">
                <h3>꼭 확인해주세요<i class="up-down"><span class="blind">닫기</span></i></h3>
                <div class="frame frame-a">
                    <ul class="list list-a">
                        <li>쿠폰적용 제외 상품은 모든 쿠폰이 적용되지 않습니다.</li>
                        <li>무통장 입금일 경우 3일 이내 해당 계좌로 입금하셔야 주문이 완료됩니다.</li>
                        <li>겟잇나우는 매장 방문하여 직접 수령하는 서비스로  상품재고 확보를 위해 신용카드 결제방법으로만  주문하실 수 있습니다.</li>
                        <li>결제완료 이후에는 배송방법을 변경하실 수 없으므로, 주문 취소 후 새로 주문해 주시기 바랍니다.</li>
                        <li>교환 및 반품은 배송완료 후 14일 이내만 신청 가능하며, 포장이 훼손되거나 사용하신 상품은 교환 및 환불 되지 않습니다.</li>
                    </ul>
                </div>
            </div>
        </div><!-- // cart-guide-a -->

		<c:if test="${not empty cardEventFreetList }">
        <div class="section-button mt10"><!-- section-button -->
            <a href="javascript:$.com.util.layPop('open', $('#cardMonthly'), true);" class="button full more"><span>무이자/부분무이자 혜택 안내</span></a>
        </div><!-- // section-button -->
		
        <section id="cardMonthly" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #cardBenefit -->
            <dl class="ui-content">
                <dt>
                    <h2>무이자/부분무이자 혜택 안내</h2>
                    <a href="javascript:$.com.util.layPop('close', $('#cardMonthly'), true)" class="btn_close"><span class="blind">팝업 닫기</span></a>
                </dt>
                <dd class="dd_con_d">
                    <div class="card-benefit"><!-- card-benefit -->
                        <table>
                        <caption>카드별 무이자/ 부분무이자 혜택 안내 테이블 입니다.</caption>
                        <tbody>
                        	<c:set var="cardListIdx" value="0"/>
                        	<c:forEach var="row" items="${cardEventFreetList }" varStatus="i">
                        		<c:if test="${row.RNUM eq 1}">
		                            	<c:if test="${cardListIdx eq 0 or cardListIdx%2 eq 0}">
		                            		<tr>
		                            	</c:if>
		                                <td>
		                                    <span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
		                                    <p>
		                                    (${row.DIV_DTL_PRC}만원<span class="up"><em class="blind">이상</em></span>)<br/>
		                                    <c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST }"><%-- 무이자만 출력 --%>
		                                        <c:out value="${row.DIV_INF_MNT }"/> 개월 무이자 할부
		                                        <br/> 
		                                    </c:if>
		                                    <c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST }"><%-- 부분무이자/특별무이자만 출력 --%>
		                                    	<c:forEach var="month" items="${fn:split(row.DIV_INF_MNT, ',')}" varStatus="monthStatus">
			                                    	<span>${month }개월</span>
				                    				<span>${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index] }</span>
				                    				<br/>
			                    				</c:forEach>
		                                    </c:if>
		                                    <%-- 같은 기준금액을 가진 서브 부분무이자/특별무이자 할부 리스트 --%>
		                                    <c:if test="${not empty row.subCardList}">
	                                    		<c:forEach var="subCard" items="${row.subCardList }" varStatus="subCardStatus">
			                                    	<c:forEach var="month" items="${fn:split(subCard.DIV_INF_MNT, ',')}" varStatus="monthStatus">
				                                    	<span>${month }개월</span>
					                    				<span>${fn:split(subCard.DIV_INF_NTC, '||')[monthStatus.index] }</span>
					                    				<br/>
				                    				</c:forEach>
			                    				</c:forEach>
		                                    </c:if>
		                                    </p>
		                                </td>
		                            	<c:if test="${cardListIdx%2 eq 1 or cardListIdx+1 eq cardListSize}"><%-- 두번째거나 마지막 카드인 경우 --%>
		                            		<c:if test="${cardListIdx%2 eq 0 }"><%-- 마지막이면서 첫번째 카드인 경우 --%>
		                            			<td>&nbsp;</td>
		                            		</c:if>
		                            		</tr>
		                            	</c:if>
		                            <c:set var="cardListIdx" value="${cardListIdx + 1}"/>
                        		</c:if>
                        	</c:forEach>
                        </tbody>
                        </table>
                    </div><!-- // card-benefit -->
                </dd>
            </dl>
        </section><!-- // #cardBenefit -->
        </c:if>

		<c:if test="${not empty keepingPrdList}">
        <div class="my-keeping"><!-- my-keeping -->
            <h3>
                <strong class="large">MY 키핑상품</strong>
                <span>고객님의 키핑상품으로 등록된 상품입니다.</span>
            </h3>

            <ul id="keepingSlider" class="product-list">
            	<c:forEach var="row" items="${keepingPrdList }">
            		<li>
	                    <div class="module">
	                        <a href="javascript:goProductView('<c:out value="${row.PRD_MST_CD }" />');">
	                            <span class="thumb">
	                            	<img data-original="<c:out value="${cdnDomain }"/>${row.PRD_IMAGE}" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${row.PRD_IMAGE_ALT}" />
	                            </span>
	                            <span class="subject">${row.PRD_MST_NM}</span>
	                        </a>
	                        <p class="price-after">
	                            <span class="blind">판매가</span><strong class="large"><fmt:formatNumber value="${row.PRD_MST_PRICE}" type="number" /></strong>원
	                            <!-- <em class="discount">
	                                <span class="blind">할인률</span>
	                                <strong class="tx_num">51</strong>%
	                            </em> -->
	                        </p>
	                    </div>
	                </li>
            	</c:forEach>
            </ul>
        </div><!-- // my-keeping -->
        
        <div class="section-button"><!-- section-button -->
            <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myKeepProductList.do','_self');" target="_self" class="button full more"><span>MY 키핑 상품 더 보러가기</span></a>
        </div><!-- // section-button -->
		</c:if>
			
	</article>
	<!--// #container E -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->
<script>
$(function(){
	
    var slider = $('#keepingSlider'),
        sliderOption = {
            minSlides: 2,
            maxSlides: 2,
            pager: false,
            controls: true,
            captions: true,
            auto: false,
            slideWidth: $(window).width()/2,
            adaptiveHeight: true,
            nextText: '<span class="blind">MY 키핑상품 다음 슬라이드</span>',
            prevText: '<span class="blind">MY 키핑상품 이전 슬라이드</span>'
        };

        if(slider.length) {
            slider.bxSlider(sliderOption);
        }

    // 하위 메뉴 개수 표시
    $('.cart-list-wrap').each(function() {
        var $this = $(this);
        $this.find('.more').removeClass('active');
        $this.find('.toggle-item').removeClass('in');
        $('.order-step').next().next().next().find('.more').addClass('active');
        $('.order-step').next().next().next().find('.toggle-item').addClass('in');
    });

});
</script>

<script>

$(function(){
    //수량 변경시 바로 변경
    $(document).on("change",".memCrtCnt", function(){
    	goCntModify($(this).data("mem_crt_idx"));
    });
    
    $(document).on("click",".selectAll",function(){
		var dlvType = $(this).data("dlv_type");
		
		if($(this).is(":checked")){
			$(".crt_idx_"+dlvType).each(function(){
				if(!$(this).prop("disabled")){
					$(this).prop("checked", true);
				}
			});
		}else{
			$(".crt_idx_"+dlvType).each(function(){
				if(!$(this).prop("disabled")){
					$(this).prop("checked", false);
				}
			});
		}
		//주문금액 계산
		calculateCartAmount();
	});
	
	// 체크박스 변경시
	$(document).on("change",".crt_idx",function(){		
		var dlvType = $(this).data("dlv_type");
		
		//전체체크 해제
		if(!$(this).is(":checked")){
			$("#selectAll_"+dlvType).prop("checked", false);
		}
		
		calculateCartAmount();
	});
    
	//간편보기
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			window.open("<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd="+prdMstCd, "_blank");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
 	
	//장바구니 이동
	goCartList = function(){
		$('#_blank_form').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','method':'get'}).submit();	
	};
    
	//나의 키핑상품 이동
	goMyKeeping = function(){
		$('#_blank_form').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','method':'get'}).submit();	
	};
	
});

//매장위치확인 팝업
function getItNowShopInfoPopup(shpMstIdx){
	$("#shopInfo").load("<c:out value="${mobileSslDomain}"/>/mobile/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx, function(){
		$.com.util.layPop('open', $('#shopInfo'), true);
	});
}

/**
 * 장바구니 개별 삭제
 */
function deleteitem(idx) {
	if (confirm('해당 상품을 삭제하시겠습니까?')) {
		var crt_idx_arr = [ idx ];
		deletecart(crt_idx_arr);
	}
}

/*
 * 서버에 삭제 요청
 */
function deletecart(idx_arr) {
	$.ajax({
				async : false,
				type : "POST",
				data : {
					"MEM_CRT_IDX[]" : idx_arr
				},
				url : "<c:out value="${mobileSslDomain}" />/mobile/cart/deleteCart.do",
				success : function(data) {
					alert("삭제되었습니다.");
					location.reload(true);
				},
				error : function(err) {
					alert("오류가 발생하였습니다.\n[" + err.status + "]");
					window.jquery
							|| console
									.log('오류가 발생하였습니다: ' + err.status);
				}
			});
}

//체크박스 변경시 금액 계산하기
function calculateCartAmount(){
	var idx_arr = new Array();
	
	if($('.crt_idx:checked').length > 0){
		$('.crt_idx:checked').each(function() {
			idx_arr[idx_arr.length] = $(this).val();
		});
		$.ajax({
			type: "post",
			url : "<c:out value="${mobileSslDomain}"/>/mobile/cart/calculateCartAmountAjax.do",
			data : {"MEM_CRT_IDX[]" : idx_arr},
			dataType : "json",
			async : false,
			success : function(data){
				$.each(data, function(key, item){
					if(document.getElementById("span_"+key) != null){
						//console.log(key);
						//console.log(item);
						//console.log(document.getElementById("span_"+key));
						document.getElementById("span_"+key).innerHTML = setComma(item);
					}
				});
				
				// 마켓플랜트/입점업체 상품 합계 금액은 따로 계산 필요
				//document.getElementById("span_cart_prd_amount_normal").innerHTML = setComma(data.cart_prd_amount_sysRetail + data.cart_prd_amount_vendor);
				//document.getElementById("span_cart_ist_cpn_prc_normal").innerHTML = setComma(data.cart_ist_cpn_prc_sysRetail + data.cart_ist_cpn_prc_vendor);
				//document.getElementById("span_cart_delivery_normal").innerHTML = setComma(data.cart_delivery_sysRetail + data.cart_delivery_vendor);
				document.getElementById("span_cart_total_normal").innerHTML = setComma(data.cart_total_sysRetail + data.cart_total_vendor);
				document.getElementById("span_cart_reserve_mileage_normal").innerHTML = setComma(data.cart_reserve_mileage_sysRetail + data.cart_reserve_mileage_vendor);
				
			},
			error : function(error){
				alert(error);
			}
		});
	}else{
		$(".span_amt").html("0");
	}
}

/**
 * 결제요청
 * [idx] -1:전체주문, 0:선택주문 0이상:특정상품 바로구매 
 */
function payment(idx, dlv_type) {
	
	var idx_arr = new Array();

	if (idx > '0') {
		idx_arr = [ idx ];
	} else if (idx == '0') {
		$('.crt_idx_'+ dlv_type +':checked').each(function() {
			idx_arr[idx_arr.length] = $(this).val();
		});
	} else if (idx == '-1') {
		$('.crt_idx_'+ dlv_type).each(function() {
			idx_arr[idx_arr.length] = $(this).val();
		});
	}

	if (idx_arr.length == 0) {
		if (idx == '-1') {
			alert('장바구니에 담으신 상품이 없습니다.');
		} else if (idx == '0') {
			alert('선택하신 상품이 없습니다.');
		}
		return;
	}

	if (idx_arr.length > 30) {
		alert('상품 종류 기준으로 30개까지만 주문 가능합니다.');
		return;
	}
	
	$('#paymentform').empty();
	
	$.ajax
    ({
        async : false,
        type : "POST",
        data : {
        			"MEM_CRT_IDX[]" : idx_arr
        		  },
        url : "<c:out value="${mobileSslDomain}" />/mobile/cart/insertCartpaymentAjax.do",
        success : function (data) 
        { 
			switch (data.result) {
			case 1:
				$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
				<c:choose>
				<%-- 1. 비회원 --%>
				<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
				
				var url = "<c:out value="${mobileSslDomain}"/>/mobile/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD;
				if(appType){
					callJavascriptLoginUrl(url); //app 로그인 연동
				}else{
					url = encodeURIComponent(url);
		        	location.target = "_self";
		        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
				}
				
				<%--
				var url = "<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do?ORD_MST_CD="+data.ORD_MST_CD;
				url = encodeURIComponent(url);
	        	window.open("<c:out value="${mobileSslDomain}"/>/mobile/manager/loginPopup.do?url=" + url + "&locationProtocol=<c:out value="${locationProtocol}"/>","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
				--%>
				
	        	</c:when>
				<%-- 2. 회원 --%>
				<c:when test="${sessionUser.ROLE_USER eq 'user'}">
				$('#paymentform').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do', 'target':'_self'}).submit();
				</c:when>
				</c:choose>
				break;
			default :
				alert(data.resultMsg);
				break;
			}
        },
        error : function (err)
        {
            alert("오류가 발생하였습니다.\n[" + err.status + "]");
            window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
        }
	});
}
 
//옵션 변경
function goOptionModify(mem_crt_idx){
	var orgOption = $("#org_option_"+mem_crt_idx).val();
	var $option = $("#option_"+mem_crt_idx);
	var toChangeOptionIdx = $("#option_"+mem_crt_idx).val();
	var OPTION_MODIFY_YN = "Y"; //옵션 변경 여부
	var $optionCnt = parseInt($("#inp_amount_"+mem_crt_idx).val());//선택옵션인 경우에만 존재함!
	
	if($optionCnt == undefined || isNaN($optionCnt)){
		$optionCnt = "";
	}
	
	if($optionCnt > 99){
		alert("주문 수량은 99개 이하만 가능합니다.\n100개 이상의 상품은 대량견적을 이용해주세요.");
		return;
	}
	
	// 기존 옵션과 동일한 옵션인 경우 수량만 변경.. 일단 무조건 변경하게 주석 처리...
	/* if(orgOption == $option.val()){
		toChangeOptionIdx = "";
		OPTION_MODIFY_YN = "N";
	} */
	
	if($option.val() == ""){
		alert("옵션을 선택하세요.");
		$option.focus();
		return;
	}
		
	$.ajax({
		type: "post",
		url : "<c:out value="${mobileSslDomain}"/>/mobile/cart/productOptionCntModifyAjax.do",
		data : 
		{
			PRD_OPT_DTL_IDX : toChangeOptionIdx
			, MEM_CRT_CNT : $optionCnt
			, MEM_CRT_IDX : mem_crt_idx
			, OPTION_MODIFY_YN : OPTION_MODIFY_YN
		},
		dataType : "json",
		async : false,
		success : function(data){
			// -1 : 동일옵션 있음.
			// 0 : 옵션변경 실패
			// 0 이상 : 성공
			alert(data.resultMsg);
		
			if(data.result > 0){
				location.reload(true);
			}
		},
		error : function(error){
			alert(error);
		}
	});
}

//수량 변경
function goCntModify(mem_crt_idx){
	var $memCrtCnt = $("#memCrtCnt_"+mem_crt_idx);
	
	if(isNaN($memCrtCnt.val())){
		alert("숫자를 입력해주십시오.");
		$memCrtCnt.val(1); 
		return;
	}
	
	if(parseInt($memCrtCnt.val()) < 1){
		alert("최소구매수량은 1개입니다.");
		$memCrtCnt.val(1); 
		return;
	}
	
	if(parseInt($memCrtCnt.val()) > 99){
		alert("주문 수량은 99개 이하만 가능합니다.\n100개 이상의 상품은 대량견적을 이용해주세요.");
		return;
	}
	
	$.ajax({
		type: "post",
		url : "<c:out value="${mobileSslDomain}"/>/mobile/cart/productOptionCntModifyAjax.do",
		data : {
					MEM_CRT_IDX : mem_crt_idx,
					MEM_CRT_CNT : parseInt($memCrtCnt.val())
				},
		dataType : "json",
		async : false,
		success : function(data){
			// -1 : 동일옵션 있음.
			// 0 : 옵션변경 실패
			// 0 이상 : 성공
			alert(data.resultMsg);
		
			if(data.result > 0){
				location.reload(true);
			}
		},
		error : function(error){
			alert(error);
		}
	});
}

//전체선택
function allSelectBtn(dlv_type){
	$(".selectAll_"+dlv_type).prop("checked", true);
	$(".crt_idx_"+dlv_type).prop("checked", true);
	//주문금액 계산
	calculateCartAmount();
}

//전체삭제
function allDeleteBtn(dlv_type){
	if(confirm("전체 삭제하시겠습니까?")){
		var idx_arr = new Array();
		$('.crt_idx_'+ dlv_type).each(function() {
			idx_arr[idx_arr.length] = $(this).val();
		});
		deletecart(idx_arr);
	}
}

//선택삭제
function SelectedDeleteBtn(dlv_type){
	if($('.crt_idx_'+ dlv_type +':checked').length == 0){
		alert("선택된 상품이 없습니다.");
		return;
	}
	
	if(confirm("선택상품 삭제하시겠습니까?")){
		var idx_arr = new Array();
		$('.crt_idx_'+ dlv_type +':checked').each(function() {
			idx_arr[idx_arr.length] = $(this).val();
		});
		deletecart(idx_arr);
	}
}

//품절상품삭제
function soldOutDeleteBtn(dlv_type){
	if(confirm("품절상품 삭제하시겠습니까?")){
		var idx_arr = new Array();
		if(dlv_type != "" && dlv_type != undefined){
			$('.crt_idx_'+ dlv_type).each(function() {
				idx_arr[idx_arr.length] = $(this).val();
			});
		}else{
			$('.crt_idx').each(function() {
				idx_arr[idx_arr.length] = $(this).val();
			});
		}
		
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"MEM_CRT_IDX[]" : idx_arr
			},
			url : "<c:out value="${mobileSslDomain}" />/mobile/cart/deleteSoldOutCartAjax.do",
			success : function(data) {
				alert("삭제되었습니다.");
				location.reload(true);
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}
}

//부분 무이자 팝업
function showPartInterestPop(div_dtl_cd, div_dtl_prc, crd_div_idx, card_nm){
	var titleHtml = "<p class=\"card card-"+ div_dtl_cd +"\"><em class=\"blind\">"+ card_nm +"</em></p>";
	$("#div_partFree").find("p").eq(0).remove();
	$("#div_partFree").prepend(titleHtml);
	
	var html = "";
	$(".li_etc_interest_"+div_dtl_cd+"_"+div_dtl_prc+"_"+crd_div_idx).each(function(i,item){
		html += "<tr>";
		html += "<th scope=\"row\"><span>"+ $(this).find("span").eq(0).text() +"</span></th>";
		html += "<td class=\"al small\">"+ $(this).find("span").eq(1).text() +"</td>";
		html += "</tr>";
	});
	
	$("#tbody_partFree").html(html);
	
	com.laypop('show', '0');
}

// 관심등록
function insertKeeping(prdMstCd){
	$.ajax({
		async : false,
		type : "POST",
		data : {
			"PRD_MST_CD" : prdMstCd
		},
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/insertInterestProductAjax.do",
		success : function(data) {
			var result = data.result;//0:로그인 필요 1:성공 -1:실패
			if(result == 0){
				if(confirm(data.resultMsg)){
					var url = location.href;
		        	if(appType){
						callJavascriptLoginUrl(url); //app 로그인 연동
					}else{
						url = encodeURIComponent(url);
						location.target = "_self";
			        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
					}
				}
			}else{
				alert(data.resultMsg);
			}
		},
		error : function(err) {
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
			window.jquery
					|| console
							.log('오류가 발생하였습니다: ' + err.status);
		}
	});
}
 
</script>

</body>
</html>