<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<link href="https://pg.cnspay.co.kr:443/dlp/css/kakaopayDlp.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/SessionStorage.js"></script>
</head>

<script>
//window.history.forward(); 
</script>

<body class="page-order">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">

    <%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
    <!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <ul class="ct order-step"><!-- order-step -->
                <li class="nth-child-1"><span class="icon cart"><!-- icon --></span>STEP 01 <strong>장바구니</strong></li>
                <li class="nth-child-2 active"><span class="icon order"><!-- icon --></span>STEP 02 <strong>주문서/결제</strong><span class="blind">현재위치</span></li>
                <li class="nth-child-3"><span class="icon finish"><!-- icon --></span>STEP 03 <strong>주문완료</strong></li>
            </ul><!-- // order-step -->
            
            <%--카드 할부 가져올때 필요한 최종결제금액 --%>
           	<input type="hidden" id="CART_TOTAL" value="${cart_total}"/>
            
            <form name="LGD_PAYINFO" id="LGD_PAYINFO" method="post" data-use-autosave="true" action="<c:out value="${serverDomain}" />/pc/cart/payment.do">
            
            <!-- [START]가맹점 주문자 필드(승인요청 시 해당 정보를 부가정보로 사용) -->
			<input type='hidden' id="user_id"             name="user_id"             value="<c:out value="${userInfo.MEM_MST_MEM_ID }"/>" />         <!--[선택]고객ID -->
			<input type='hidden' id="EP_user_id"             name="EP_user_id"             value="<c:out value="${userInfo.MEM_MST_MEM_ID }"/>" />         <!--[선택]고객ID -->
			<input type='hidden' id="user_nm"             name="user_nm"             value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" />         <!--[선택]고객명 -->
			<input type='hidden' id="EP_user_nm"             name="EP_user_nm"             value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" />         <!--[선택]고객명 -->
			<!-- [END]가맹점 주문자 필드 -->
            
            <input type="hidden" id="EP_card_cd" name="EP_card_cd" value=""/>
            <input type="hidden" id="EP_noint" name="EP_noint" value=""/>
            
			<input type="hidden" id="LGD_CLOSEDATE_TEXT" name="LGD_CLOSEDATE_TEXT" value="<c:out value="${LGD_CLOSEDATE_TEXT}" />"/><!-- 메일발송용 -->
			<input type="hidden" id="ORD_MST_MAIL" name="ORD_MST_MAIL" value=""/>
			<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${ORD_MST_CD}" />"/><%-- 주문번호 --%>
			<input type="hidden" id="ORD_TMP_PRE_CD" value="<c:out value="${cartlist[0].ORD_TMP_PRE_CD}" />"/><%-- 재결제시 이전 주문번호 --%>
			
			<input type="hidden" id="install_period" name="install_period" value="00"/><%-- 할부 개월 --%>
			
			<input type="hidden" id="EP_cash_yn" name="EP_cash_yn" value="0"/><%-- 현금영수증 발행여부 --%>
			<input type="hidden" id="EP_cash_issue_type" name="EP_cash_issue_type" value=""/><%-- 현금영수증 발행용도 --%>
			<input type="hidden" id="EP_cash_auth_type" name="EP_cash_auth_type" value=""/><%-- 현금영수증 인증구분 --%>
			<input type="hidden" id="EP_cash_auth_value" name="EP_cash_auth_value" value=""/><%-- 현금영수증 인증번호 --%>
			
			<!-- 오캐이캐시백 파라미터 시작 -->
			<input type="hidden" id="CASHBAG_PW" name="CASHBAG_PW" value=""/>
            <input type="hidden" id="cartResult" name="cartResult" value="N"/>
			<!-- 오캐이캐시백 파라미터 끝 -->

            <h3 class="title mt0">주문상품정보</h3>

			<c:set var="rep_product_name" value=""/><!-- 상품명 -->
            <%-- 대표 상품명 설정 --%>
            <c:if test="${ fn:length(cartlist) gt 1 }"><c:set var="rep_product_name" value="${cartlist[0].PRD_MST_NM} 외 ${ fn:length(cartlist) - 1 }건"/></c:if>
            <c:if test="${ fn:length(cartlist) eq 1 }"><c:set var="rep_product_name" value="${cartlist[0].PRD_MST_NM}"/></c:if>
                        
			<%---------------------------------------------------------------- 마켓플랜트 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty sysRetailCartList}">
				<c:set var="c_dlv_gbn" value="${sysRetailCartList[0].ORD_TMP_DLV_GBN }"/>
	            <div class="cart-list-wrap price-king first-child"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title"> 배송상품</h4>
	                    <div class="desc">
	                        	 상품은 마켓플랜트 물류와 택배를 통해 안전하게 배송됩니다.
	                        <a href="javascript:com.laypop('show', '0');" class="link-guide"><span class="blind">안내</span></a>
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 배송비로 구성된  배송상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${sysRetailCartList}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
			</c:if>
			<%---------------------------------------------------------------- 마켓플랜트 상품 끝 ------------------------------------------------%>
			
			<%---------------------------------------------------------------- 입점업체 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty vendorCartList}">
				<c:set var="c_dlv_gbn" value="${vendorCartList[0].ORD_TMP_DLV_GBN }"/>
	            <div class="cart-list-wrap partner mt0"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">파트너 배송상품</h4>
	                    <div class="desc">
	                        	파트너 상품은 각 파트너사에서 택배를 통해 정성스럽게 배송됩니다. 
	                        <a href="javascript:com.laypop('show', '1');" class="link-guide"><span class="blind">안내</span></a>
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 배송비로 구성된 파트너 배송상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${vendorCartList}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
			</c:if>
            <%---------------------------------------------------------------- 입점업체 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 기타(겟잇나우, 무형, 장기할부) 시작 ------------------------------------------------%>
			<c:if test="${not empty cartlist and empty sysRetailCartList and empty vendorCartList }">
				<c:set var="c_dlv_gbn" value="${cartlist[0].ORD_TMP_DLV_GBN }"/>
				<c:choose>
					<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
						<%-- 겟잇나우 --%>
						<c:set var="c_cartlist_class" value="get-it-now"/>
					</c:when>
					<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_SERVICE_CD }">
						<%-- 무형 --%>
						<c:set var="c_cartlist_class" value="clean-king"/>
					</c:when>
					<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_LONG_INS_CD }">
						<%-- 장기할부 --%>
						<c:set var="c_cartlist_class" value="long-monthly"/>
					</c:when>
				</c:choose>
			
	            <div class="cart-list-wrap ${c_cartlist_class} first-child"><!-- cart-list-wrap -->
	            	<c:choose>
						<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
							<%-- 겟잇나우 --%>
							<div class="section-title"><!-- section-title -->
			                    <h4 class="title">겟잇나우 배송상품</h4>
			                    <div class="desc">
			                        	겟잇나우 상품은 결제완료 후, 매장에 직접 방문하여 찾아 가시는 상품입니다.
			                    </div>
			                </div><!-- // section-title -->
						</c:when>
						<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_SERVICE_CD }">
							<%-- 무형 --%>
							<div class="section-title"><!-- section-title -->
			                    <h4 class="title">클린킹</h4>
			                    <div class="desc">
			                        	클린킹 상품은 상담예약을 신청하시면, 해피콜을 통하여 구매하는 서비스입니다.
			                    </div>
			                </div><!-- // section-title -->
						</c:when>
						<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_LONG_INS_CD }">
							<%-- 장기할부 --%>
							<div class="section-title"><!-- section-title -->
			                    <h4 class="title">장기할부 배송상품</h4>
			                    <div class="desc">
			                        	장기할부 상품은 신용카드로만 결제하실 수 있는 상품입니다.
			                    </div>
			                </div><!-- // section-title -->
						</c:when>
					</c:choose>
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 배송비로 구성된 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${cartlist}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
			</c:if>
			<%---------------------------------------------------------------- 기타(겟잇나우, 무형, 장기할부) 끝 ------------------------------------------------%>
            
            <div class="total-price"><!-- total-price -->
                <div class="holder">
                    <div class="article order">
                        <p class="tit">총 주문상품금액</p>
                        <p class="price">
                        	<c:choose>
                            	<c:when test="${not empty cartlist[0].ESM_PRD_IDX}">
                            		<span>-</span>
                            	</c:when>
                            	<c:otherwise>
                            		<span><fmt:formatNumber value="${cart_prd_amount}" /></span>원
                            	</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <span class="reckoning minus"><em class="blind">빼기</em></span>
                    <div class="article discount">
                        <p class="tit">총 즉시할인금액</p>
                        <p class="price"><span><fmt:formatNumber value="${cart_ist_cpn_prc}" /></span>원</p>
                    </div>
                    <span class="reckoning plus"><em class="blind">더하기</em></span>
                    <div class="article ship">
                        <p class="tit">총 배송비</p>
                        <p class="price"><span><fmt:formatNumber value="${cart_delivery}" /></span>원</p>
                    </div>
                    <span class="reckoning value"><em class="blind">결과</em></span>
                    <div class="article final">
                        <p class="tit">총 결제예정금액</p>
                        <p class="price"><span><fmt:formatNumber value="${cart_total}" type="number" /></span>원</p>
                        
                        <%-- <c:choose>
                        	<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">재주문 아닌 경우
                        		<p class="price"><span><fmt:formatNumber value="${cart_total}" type="number" /></span>원</p>
                        	</c:when>
                        	<c:otherwise>재주문인 경우 포인트 할인 금액 보정 필요
                        		<p class="price"><span><fmt:formatNumber value="${cart_total + PRE_USED_MLG}" type="number" /></span>원</p>
                        	</c:otherwise>
                        </c:choose> --%>
                        
                        <c:if test="${not empty cartlist[0].ORD_TMP_LNG_DIV}">
		            		<p>
			            		<span style="color:#fd1f27">(월 청구예상금액 <fmt:formatNumber value="${cart_total/ cartlist[0].ORD_TMP_LNG_DIV}" type="number" pattern="###,###"/>원)</span>
			            	</p>
		            	</c:if>
		            	<p class="desc">(적립예정 포인트 : <span><fmt:formatNumber value="${cart_reserve_mileage}" type="number" /></span>P)</p>
                    </div>
                </div>
            </div><!-- // total-price -->
            
            <div id="shipFix" class="layer-tooltip"><!-- #shipFix -->
                <h5 class="title"><span class="icon"><!-- icon --></span> 지정일 배송 안내</h5>
                <div class="holder">
                    <div class="frame-a dotum small">
                        <p>
                            	배송희망일을 지정할 수 있으며, 선택하지 않으시면 기본 배송일에 배송됩니다. 지정일 배송은 상품 및 지역에 따라 서비스 제공이 어려울 수 있습니다.
                        </p>
                        <p class="mt10">
                            <strong>[참고]</strong><br />
		                            비회원 구매시, 배송 및 배송일 변경이 제한될 수 있습니다.<br />
		                            상품재고 보유현황에 따라 배송희망일이 변동될 수 있습니다.
                        </p>
                    </div>
                </div>
            </div><!-- // #shipFix -->

			<%---------------------------------------------------------------- 사은품 리스트 시작 ------------------------------------------------%>
			<c:if test="${empty cartlist[0].ORD_TMP_PRE_CD}"><%-- 재결제 아닌 경우에만 사은품 증정 --%>
				<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 쿠폰/포인트 사용 없음 --%>
				<c:if test="${not empty giftList}">
					<h3 class="title">사은품 정보</h3>
					
					<div class="free-gift"><!-- free-gift -->
		                <ul class="ct item-list">
		                	<c:forEach var="gift" items="${giftList}" varStatus="i">
		                		<c:if test="${gift.GFT_MST_STOCK_CNT gt 0 }">
		                			<input type="hidden" name="gftMstIdxs" value="<c:out value="${gift.GFT_MST_IDX}"/>">
		                		</c:if>
				                <li class="item">
			                        <div class="module">
			                            <label class="dotum title" for="giftItem_${i.index}">
			                            	<strong>
			                            		[<c:out value="${gift.GFT_MST_NAME}"/>]
			                            	</strong>
			                            </label>
			                            <span class="thumb">
			                            	<c:if test="${gift.GFT_MST_STOCK_CNT le 0 }">
				                            	<i class="soldout"><span>증정마감</span></i>		
		                            		</c:if>
			                            	<c:if test="${gift.GFT_MST_PRD_TYPE eq 'P' }">
			                            		<%-- 상품 이미지 --%>
			                            		<img src="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" class="thumb150" alt="<c:out value="${gift.PRD_IMAGE_ALT}"/>" />
			                            	</c:if>
			                            	<c:if test="${gift.GFT_MST_PRD_TYPE ne 'P' }">
			                            		<%-- 파일 등록 --%>
			                            		<img src="<c:out value="${cdnDomain }${gift.CMM_FLE_ATT_PATH}${gift.CMM_FLE_SYS_NM}"/>" class="thumb150" alt="<c:out value="${gift.CMN_FLE_ALT_TXT}"/>" />
			                            	</c:if>
			                            </span>
			                        </div>
			                    </li>
			                </c:forEach>
		                </ul>
		
		                <div class="guide">
		                    <h4><span class="blind">유의사항</span></h4>
		                    <ul class="list list-a">
		                        <li>사은품은 주문상품과 별도로 개별배송됩니다.</li>
		                        <li>사은품 이미지 및 색상은 화면과 다를 수 있으며, 사은품 교환 및 환불이 불가능합니다. 또한 신청이 완료된 이후에는 옵션 변경이 불가능합니다.</li>
		                        <li>사은품은 배송지 주소로 발송되며, 부정확한 정보로 인해 누락될 경우 재발송되지 않습니다.</li>
		                        <li>주문상품 반품시 사은품도 반납하셔야 하며, 부분반품으로 인하여 사은품 지급대상에서 제외시, 사은품도 함께 반납해 주셔야 합니다.</li>
		                        <li>사은품은 결제완료 이후에 배송되며, 무통장입금으로 주문하신 경우에는 입금이 완료된 이후에 배송됩니다.</li>
		                        <li>이벤트 기간 중이라도 사은품 재고가 소진되면 자동 마감될 수 있습니다.</li>
		                    </ul>
		                </div>
		            </div><!-- // free-gift -->
				</c:if>
				</c:if>
             </c:if>
             <%---------------------------------------------------------------- 사은품 리스트 끝 ------------------------------------------------%>
            
            <div class="ct payment-box order-sheet"><!-- payment-box -->
                <div class="payment-info"><!-- payment-info -->
                	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 쿠폰/포인트 사용 없음 --%>
                	<c:if test="${empty cartlist[0].ESM_PRD_IDX}"><%-- 견적주문은 쿠폰/포인트 사용 없음 --%>
                	<c:choose>
	                    <c:when test="${empty userInfo}">
	                    	<%-- 비회원인 경우 --%>
	                    	<h3 class="title">쿠폰/할인정보</h3>
	                    	<div class="frame-b discount-info nonmember"><!-- discount-info -->
		                        <div class="frame-a">
		                            <p>
			                                회원 전용 혜택입니다.<br />
			                                로그인 하시면 더 많은 혜택을 받으실 수 있습니다.
		                            </p>
		                            <a href="javascript:goLoginPopup();" class="btn_st0 btn_white small"><span>로그인 하기</span></a>
		                        </div>
		
		                        <div class="article-list"><!-- article-list -->
		                            <ul>
		                                <li class="article last">
		                                    <div class="module">
		                                        <h5 class="col tit"><span>유의사항</span></h5>
		                                        <div class="col notice">
		                                            <ul class="list list-a">
		                                                <li>포인트는 10,000P 이상부터 사용 가능하며, 소멸예정 포인트가 포함되어 있습니다. </li>
		                                                <li>소멸예정 포인트는 당월 말까지 사용하지 않으면 자동소멸되며, 1P 부터 사용 가능합니다.</li>
		                                                <li>배송비는 포인트로 결제할수 없습니다. </li>
		                                                <li>쿠폰과 포인트를 동시에 사용하는 경우에는 쿠폰을 먼저 사용하신 후, 포인트를 사용할 수 있습니다. </li>
		                                                <li>쿠폰마다 사용제한 조건이 다를 수 있으며, 일부 상품은 쿠폰 사용에 제외될 수 있습니다. </li>
		                                                <li>OK캐쉬백포인트는 포인트조회하시면 보유포인트를 확인 할 수 있습니다. </li>
		                                                <li>OK캐쉬백 카드번호는 회원가입시 발급된 카드번호이며, 비밀번호는 영문, 숫자 혼용 10 ~ 12자리 문자입니다.</li>
		                                            </ul>
		                                        </div>
		                                    </div>
		                                </li>
		                            </ul>
		                        </div><!-- // article-list -->
		                    </div><!-- discount-info -->
	                    </c:when>
	                    <c:otherwise>
	                    	<c:choose>
	                    		<c:when test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE or userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
	                    			<c:if test="${userInfo.MEM_MST_DCT_YN ne 'Y'}"><%-- 사용 제한 걸린 경우 제외 --%>
	                    			<%-- 통합/간편인 경우에만 사용 가능 --%>
	                    			<%---------------------------------------------------------------- 쿠폰/할인정보 시작 ------------------------------------------------%>
				                    <h3 class="title">쿠폰/할인정보</h3>
				
				                    <div class="frame-b discount-info"><!-- discount-info -->
				                        <div class="ct summary">
				                            <div class="core">
				                                <h4>추가할인금액</h4>
				                                <span class="price"><strong><span id="" class="span_cart_add_disc_prc">0</span></strong>원</span>
				                            </div>
				
				                            <div class="desc">
				                                <p class="dotum">추가할인금액 = 상품쿠폰 + 배송비쿠폰 + 포인트 + OK캐쉬백</p>
				                            </div>
				                        </div>
				
				                        <div class="article-list"><!-- article-list -->
				                            <ul>
				                            	<c:if test="${ empty cartlist[0].ORD_TMP_PRE_CD }">
				                                <li class="article">
				                                    <div class="module">
				                                        <h5 class="col tit"><span>상품쿠폰</span></h5>
				                                        <div class="col apply"><strong><span><span id="span_prd_cpn_tot_dc_amt_real">0</span></span>원</strong></div>
				                                        <div class="col property">
				                                            <p class="ar">
				                                            	적용 가능한 쿠폰 : <strong><span id=""><fmt:formatNumber value="${fn:length(totPrdCpnSet)}" type="number" /></span></strong>장
				                                            	(총 보유쿠폰 : <fmt:formatNumber value="${summaryMap.PRD_MEM_CPN_CNT}" type="number" />장)
				                                            </p> 
				                                        </div>
				                                        <div class="col shot">
				                                            <a href="javascript:;" class="btn_st1 btn_blk777 my-check"><span>상품쿠폰 사용<span class="blind">가능한 목록 <em>열기</em></span></span></a>
				                                        </div>
				                                    </div>
				                                    <div class="field field-coupon-product" id="div_prd_cpn"><!-- field -->
				                                        <h6>
				                                            <strong class="tit">쿠폰 총 할인금액</strong>
				                                            <span class="price"><strong><span id="span_prd_cpn_tot_dc_amt">0</span></strong> 원</span>
				                                        </h6>
				
				                                        <div class="section-selection"><!-- section-selection -->
				                                        	<c:forEach var="row" items="${criterionPrdCpnList }" varStatus="i">
				                                        		<c:if test="${row.dupCnt eq row.totListCnt }">
				                                        			<label for="dupCoupon_${i.index }" class=" dupCouponLabel" data-input_val="${row.CPN_MST_IDX }">
					                                                	<input type="radio" name="dupCoupon" id="dupCoupon_${i.index }" value="${row.CPN_MST_IDX }"/>
					                                                	${row.CPN_MST_TITLE}
					                                                	(~<ui:formatDate value="${row.END_DATE}" pattern="yy.MM.dd"/>)
					                                            	</label>
				                                        		</c:if>
				                                        	</c:forEach>
				
				                                            <div class="desc">
				                                                	전체적용 가능쿠폰
				                                                <a href="#possibleCoupon" class="link-guide js-tooltip" data-size="250x360"><span class="blind">안내</span></a>
				                                            </div>
				                                        </div><!-- // section-selection -->
				
				                                        <div id="possibleCoupon" class="layer-tooltip"><!-- #possibleCoupon -->
				                                            <div class="holder">
				                                                <p>
				                                                    	쿠폰 사용가능한 모든 상품에 일괄 선택됩니다.
				                                                </p>
				                                            </div>
				                                        </div><!-- // #possibleCoupon -->
				
				                                        <table class="table-b"><!-- table-b -->
				                                        <caption>상품/옵션 정보, 행사쿠폰, 할인금액으로 구성된 상품쿠폰 목록입니다.</caption>
				                                        <colgroup>
				                                            <col style="width: auto;">
				                                            <col style="width: 40%;">
				                                            <col style="width: 18%;">
				                                        </colgroup>
				                                        <thead>
				                                            <tr>
				                                                <th scope="row"><span>상품/옵션 정보</span></th>
				                                                <th scope="row"><span>행사쿠폰</span></th>
				                                                <th scope="row"><span>할인금액</span></th>
				                                            </tr>
				                                        </thead>
				                                        <tbody>
				                                        	<c:forEach var="row" items="${cartlist }">
				                                       			<tr>
					                                                <td class="al">
					                                                    <p class="subject"><a href="javascript:;"><c:out value="${row.PRD_MST_NM }"/></a></p>
					                                                    <p class="price"><strong><fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE}" type="number" /></strong>원</p>
					                                                </td>
					                                                <td>
					                                                <c:choose>
					                                                	<c:when test="${not empty row.prdCpnList}">
                                                                            <select class="sel_chg select_prd_cpn" title="1적용가능한 쿠폰" id="PRD_CPN_NO_${row.PRD_TMP_IDX }" name="PRD_CPN_NO_${row.PRD_TMP_IDX }" data-prd_tmp_idx="${row.PRD_TMP_IDX }">
						                                                        <option value="0" data-cpn_dc_price="0">쿠폰을 선택해주세요.</option>
						                                                        <c:forEach var="cpnRow" items="${row.prdCpnList }">
						                                                        	<option 
						                                                        		value="${cpnRow.CPN_MST_IDX }"
						                                                        		data-cpn_dc_price="${cpnRow.FIN_CPN_DC_PRICE }"
						                                                        	>
						                                                        		${cpnRow.CPN_MST_TITLE }
						                                                        		(~<ui:formatDate value="${cpnRow.END_DATE}" pattern="yy.MM.dd"/>)
						                                                        	</option>
						                                                        </c:forEach>
						                                                    </select>
						                                                    <span class="blind">사용가능한 쿠폰수량</span>
						                                                    <strong>(${fn:length(row.prdCpnList)})</strong>
					                                                	</c:when>
					                                                	<c:otherwise>
					                                                		적용가능한 쿠폰이 없습니다.
					                                                	</c:otherwise>
					                                                </c:choose>
					                                                </td>
					                                                <td>
					                                                    <p class="price">
					                                                    	<input type="hidden" id="PRD_CPN_PRC_${row.PRD_TMP_IDX}" name="PRD_CPN_PRC_${row.PRD_TMP_IDX}" value="0"/>
					                                                    	<strong id="span_cpn_dc_price_${row.PRD_TMP_IDX}">0</strong>원
					                                                    </p>
					                                                </td>
					                                            </tr>
				                                        	</c:forEach>
				                                        </tbody>
				                                        </table><!-- // table-b -->
				
				                                        <div class="section-button"><!-- section-button -->
				                                            <a href="javascript:couponReset();" class="btn_st0 btn_white"><span>쿠폰선택 초기화</span></a>
				                                            <a href="javascript:prdCpnDiscountAjax();" class="btn_st0 btn_rd"><span>선택쿠폰 적용하기</span></a>
				                                        </div><!-- // section-button -->
				                                    </div><!-- field -->
				                                </li>
				                                <li class="article">
				                                    <div class="module">
				                                        <h5 class="col tit"><span>배송비쿠폰</span></h5>
				                                        <div class="col apply"><strong><span id="span_dlv_cpn_tot_dc_amt_real">0</span>원</strong></div>
				                                        <div class="col property">
				                                            <p class="ar">적용 가능한 쿠폰 : <strong><span id=""><fmt:formatNumber value="${fn:length(totDlvCpnSet)}" type="number" /></span></strong>장</p> 
				                                        </div>
				                                        <div class="col shot">
				                                            <a href="javascript:;" class="btn_st1 btn_blk777 my-check"><span>배송비쿠폰 사용<span class="blind">가능한 목록 <em>열기</em></span></span></a>
				                                        </div>
				                                    </div>
				                                    <div class="field field-coupon-product" id="div_dlv_cpn"><!-- field -->
				                                        <table class="table-b"><!-- table-b -->
				                                        <caption>상품/옵션 정보, 배송비, 배송비쿠폰으로 구성된 배송비 쿠폰 목록입니다.</caption>
				                                        <colgroup>
				                                            <col style="width: auto;">
				                                            <col style="width: 18%;">
				                                            <col style="width: 40%;">
				                                        </colgroup>
				                                        <thead>
				                                            <tr>
				                                                <th scope="row"><span>상품/옵션 정보</span></th>
				                                                <th scope="row"><span>행사쿠폰</span></th>
				                                                <th scope="row"><span>배송비 쿠폰</span></th>
				                                            </tr>
				                                        </thead>
				                                        <tbody>
				                                        	<c:forEach var="row" items="${cartlist }">
				                                       			<tr>
					                                                <td class="al">
					                                                    <p class="subject"><a href="javascript:;"><c:out value="${row.PRD_MST_NM }"/></a></p>
					                                                    <p class="price"><strong><fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE}" type="number" /></strong>원</p>
					                                                </td>
					                                                
					                                                <c:choose>
																		<c:when test="${row.DLV_BUNDLE_YN eq 'Y' and row.VDR_ROWNUM eq 1}">
																			<td rowspan="${row.VDR_IDX_CNT}">
																				<c:choose>
																					<c:when
																						test="${row.FREE_DLV_CHARGE_YN eq 'Y' or row.FIN_DLV_CHARGE eq 0 }">
																						<span>무료배송</span>
																					</c:when>
																					<c:when test="${row.FREE_DLV_CHARGE_YN ne 'Y'}">
																						<span><fmt:formatNumber value="${row.FIN_DLV_CHARGE}" type="number" />원</span>
																					</c:when>
																				</c:choose>
																			</td>
																			<td rowspan="${row.VDR_IDX_CNT}">
																				<c:choose>
								                                                	<c:when test="${not empty row.dlvCpnList}">
								                                                		<select class="sel_chg select_dlv_cpn" title="적용가능한 쿠폰" id="DLV_CPN_NO_${row.PRD_TMP_IDX }" name="DLV_CPN_NO_${row.PRD_TMP_IDX }" data-prd_tmp_idx="${row.PRD_TMP_IDX }">
									                                                        <option value="">쿠폰을 선택해주세요.</option>
									                                                        <c:forEach var="cpnRow" items="${row.dlvCpnList }">
									                                                        	<option value="${cpnRow.CPN_MST_IDX }">
									                                                        		${cpnRow.CPN_MST_TITLE }
									                                                        		(~<ui:formatDate value="${cpnRow.END_DATE}" pattern="yy.MM.dd"/>)
									                                                        	</option>
									                                                        </c:forEach>
									                                                    </select>
									                                                    <span class="blind">사용가능한 쿠폰수량</span>
									                                                    <strong>(${fn:length(row.dlvCpnList)})</strong>
								                                                	</c:when>
								                                                	<c:otherwise>
								                                                		적용가능한 쿠폰이 없습니다.
								                                                	</c:otherwise>
								                                                </c:choose>
																			</td>
																		</c:when>
																		<c:when test="${row.DLV_BUNDLE_YN eq 'N'}">
																			<td>
																				<c:if test="${row.FREE_DLV_CHARGE_YN eq 'Y'}">
																					<span>무료배송</span>
																				</c:if>
																				<c:if test="${row.FREE_DLV_CHARGE_YN ne 'Y'}">
																					<c:if test="${row.FIN_DLV_CHARGE eq 0 }">
																						<span>무료배송</span>
																					</c:if>
																					<c:if test="${row.FIN_DLV_CHARGE gt 0 }">
																						<span><fmt:formatNumber value="${row.FIN_DLV_CHARGE}" type="number" />원</span>
																					</c:if>
																				</c:if>
																			</td>
																			<td>
																				<c:choose>
								                                                	<c:when test="${not empty row.dlvCpnList}">
								                                                		<select class="sel_chg select_dlv_cpn" title="적용가능한 쿠폰" id="DLV_CPN_NO_${row.PRD_TMP_IDX }" name="DLV_CPN_NO_${row.PRD_TMP_IDX }" data-prd_tmp_idx="${row.PRD_TMP_IDX }">
									                                                        <option value="">쿠폰을 선택해주세요.</option>
									                                                        <c:forEach var="cpnRow" items="${row.dlvCpnList }">
									                                                        	<option value="${cpnRow.CPN_MST_IDX }">
									                                                        		${cpnRow.CPN_MST_TITLE }
									                                                        		(~<ui:formatDate value="${cpnRow.END_DATE}" pattern="yy.MM.dd"/>)
									                                                        	</option>
									                                                        </c:forEach>
									                                                    </select>
									                                                    <span class="blind">사용가능한 쿠폰수량</span>
									                                                    <strong>(${fn:length(row.dlvCpnList)})</strong>
								                                                	</c:when>
								                                                	<c:otherwise>
								                                                		적용가능한 쿠폰이 없습니다.
								                                                	</c:otherwise>
								                                                </c:choose>
																			</td>
																		</c:when>
																	</c:choose>
					                                            </tr>
				                                        	</c:forEach>
				                                        
				                                        </tbody>
				                                        </table><!-- // table-b -->
				
				                                        <div class="section-button"><!-- section-button -->
				                                            <a href="javascript:dlvCpnDiscountAjax();" class="btn_st0 btn_rd"><span>선택쿠폰 적용하기</span></a>
				                                        </div><!-- // section-button -->
				                                    </div><!-- field -->
				                                </li>
				                                </c:if>
				                                <%-- 통합회원만 포인트/캐쉬백 사용 가능 --%>
				                                <c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
				                                	<c:choose>
				                                		<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">
				                                			<li class="article">
							                                    <div class="module">
							                                        <h5 class="col tit"><span>포인트</span></h5>
							                                        <div class="col apply"><input type="text" class="text number" id="toUseMileage" name="toUseMileage" value="0"/> P</div>
							                                        <div class="col property">
							                                            <span class="mine">보유 포인트 : <span id="span_SOLUBLE_MILEAGE"><fmt:formatNumber value="${SOLUBLE_MILEAGE}" type="number" /></span>P</span>
							                                            <input type="checkbox" id="allMileageUseChk" />
							                                            <label for="allMileageUseChk">모두사용</label>
							                                            <p class="disappear">당월소멸 예정 포인트  : <span id="span_extinctMileage"><fmt:formatNumber value="${extinctMileage}" type="number" /></span> P</p>
							                                        </div>
							                                        <div class="col shot"></div>
							                                    </div>
							                                </li>
				                                		</c:when>
				                                		<c:otherwise>
				                                			<li class="article">
							                                    <div class="module">
							                                        <h5 class="col tit"><span>포인트</span></h5>
							                                        <div class="col apply">
							                                        	<input type="hidden" id="toUseMileage" name="toUseMileage" value="<c:out value=" ${PRE_USED_MLG}"/>"/>
							                                        	<fmt:formatNumber value="${PRE_USED_MLG}" type="number" /> P
							                                        </div>
							                                        <div class="col property">
							                                        </div>
							                                        <div class="col shot"></div>
							                                    </div>
							                                </li>
				                                		</c:otherwise>
				                                	</c:choose>
					                                <%-- <c:if test="${ empty cartlist[0].ORD_TMP_PRE_CD }"> --%><%-- 재주문시 캐쉬백 사용 가능 --%>
					                                <li class="article">
					                                    <div class="module">
					                                        <h5 class="col tit"><span>OK캐쉬백</span></h5>
					                                        <div class="col apply"><input type="text" id="toUseCashbag" name="toUseCashbag" class="text number" value="0"/> 포인트</div>
					                                        <div class="col property">
					                                        	<input type="hidden" id="cashbagRemainPoint" value="0"/>
					                                            <span class="mine">보유 포인트 : <span id="span_cashbagRemainPoint">0</span>P</span>
					                                            <input type="checkbox" id="allCashbagUseChk" />
					                                            <label for="allCashbagUseChk">모두사용</label>
					                                        </div>
					                                        <div class="col shot">
					                                            <a href="javascript:;" class="btn_st1 btn_blk777 my-check"><span>포인트 조회<span class="blind"><em>열기</em></span></span></a>
					                                        </div>
					                                    </div>
					                                    <div class="field field-okcashbag"><!-- field -->
					                                        <table>
					                                        <caption>카드번호, 비밀번호로 구성된 OK캐쉬백 포인트 조회 입력 테이블입니다.</caption>
					                                        <tbody>
					                                            <tr>
					                                                <th scope="row"><label for="cashbag1">카드번호</label></th>
					                                                <td>
					                                                    <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>" type="text" id="cashbag1" maxlength="4" class="text small number" title="OK캐쉬백 카드번호 1~4번째 숫자" /> -
					                                                    <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>" type="text" id="cashbag2" maxlength="4" class="text small number" title="OK캐쉬백 카드번호 5~8번째 숫자" /> -
					                                                    <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 8, 12) }"/>" type="text" id="cashbag3" maxlength="4" class="text small number" title="OK캐쉬백 카드번호 9~12번째 자리" /> -
					                                                    <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 12, 16) }"/>" type="text" id="cashbag4" maxlength="4" class="text small number" title="OK캐쉬백 카드번호 13~16번째 자리"/>
					                                                </td>
					                                            </tr>
					                                            <tr>
					                                                <th scope="row"><label for="cashbagPw">비밀번호</label></th>
					                                                <td>
					                                                    <input value="" type="password" id="cashbagPw" class="text" maxlength="30"/>
					                                                    <a href="javascript:checkCashBagPoint();" class="btn_st1 btn_blk777"><span>조회</span></a>
					                                                </td>
					                                            </tr>
					                                        </tbody>
					                                        </table>
					                                    </div><!-- field -->
					                                </li>
					                                <%-- </c:if> --%>
				                                </c:if>
				                                
				                                <li class="article last">
				                                    <div class="module">
				                                        <h5 class="col tit"><span>유의사항</span></h5>
				                                        <div class="col notice">
				                                            <ul class="list list-a">
				                                                <li>포인트는 10,000P 이상부터 사용 가능하며, 소멸예정 포인트가 포함되어 있습니다. </li>
				                                                <li>소멸예정 포인트는 당월 말까지 사용하지 않으면 자동소멸되며, 1P 부터 사용 가능합니다.</li>
				                                                <li>배송비는 포인트로 결제할수 없습니다. </li>
				                                                <li>쿠폰과 포인트를 동시에 사용하는 경우에는 쿠폰을 먼저 사용하신 후, 포인트를 사용할 수 있습니다. </li>
				                                                <li>쿠폰마다 사용제한 조건이 다를 수 있으며, 일부 상품은 쿠폰 사용에 제외될 수 있습니다. </li>
				                                                <li>OK캐쉬백포인트는 포인트조회하시면 보유포인트를 확인 할 수 있습니다. </li>
				                                                <li>OK캐쉬백 카드번호는 회원가입시 발급된 카드번호이며, 비밀번호는 영문, 숫자 혼용 10 ~ 12자리 문자입니다.</li>
				                                            </ul>
				                                        </div>
				                                    </div>
				                                </li>
				                            </ul>
				                        </div><!-- // article-list -->
				                    </div><!-- discount-info -->
									<%---------------------------------------------------------------- 쿠폰/할인정보 끝 ------------------------------------------------%>
									</c:if>
	                    		</c:when>
	                    	</c:choose>
	                    </c:otherwise>
                    </c:choose>
                    </c:if>
                    </c:if>
					
					<%---------------------------------------------------------------- 주문고객 정보 시작 ------------------------------------------------%>
                    <h3 class="title">
                        	주문고객정보
                        <span class="desc">
                            <span class="essential"><em class="blind">필수입력 표시는</em></span>
                            	필수항목
                        </span>
                    </h3>
                    
                    
                    <c:choose>
                  		<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">
                  			<c:choose>
								<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD}"><%-- 겟잇나우인 경우 --%>
									<div class="ct orderer-info"><!-- orderer-info -->
				                        <table class="table-c table-col">
				                        <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 입력 테이블입니다.</caption>
				                        <colgroup>
				                            <col style="width: 120px;" />
				                            <col style="width: 200px;" />
				                            <col style="width: 120px;" />
				                            <col style="width: auto;" />
				                        </colgroup>
				                        <tbody>
				                            <tr>
				                                <th scope="row"><label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label></th>
				                                <td>
				                                	<input type="hidden" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>"/>
				                                	<c:out value="${userInfo.MEM_MST_MEM_NM }"/>
				                                </td>
				                                <th scope="row"><label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
				                                <td>
				                                	<input type="hidden" id="ORD_MST_HP1" name="ORD_MST_HP1" value="<c:out value="${userInfo.MEM_MST_HP1 }"/>"/>
				                                	<c:out value="${userInfo.MEM_MST_HP1 }"/>
				                                    -
				                                    <input type="hidden" id="ORD_MST_HP2" name="ORD_MST_HP2" value="<c:out value="${userInfo.MEM_MST_HP2 }"/>"/>
				                                    <c:out value="${userInfo.MEM_MST_HP2 }"/>
								                    -
								                    <input type="hidden" id="ORD_MST_HP3" name="ORD_MST_HP3" value="<c:out value="${userInfo.MEM_MST_HP3 }"/>"/>
								                    <c:out value="${userInfo.MEM_MST_HP3 }"/>
				                                </td>
				                            </tr>
				                            <tr>
				                                <th scope="row"><label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label></th>
				                                <td colspan="3">
				                                	<input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>"/>
				                                	<input type="hidden" name="EMAIL_DOMAIN" id="EMAIL_DOMAIN" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>"/>
				                                	<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>
				                                </td>
				                            </tr>
				                        </tbody>
				                        </table>
				                    </div><!-- orderer-info -->
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }"><%-- 기업회원인 경우 수정 불가 --%>
											<div class="ct orderer-info"><!-- orderer-info -->
						                        <table class="table-c table-col">
						                        <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 입력 테이블입니다.</caption>
						                        <colgroup>
						                            <col style="width: 120px;" />
						                            <col style="width: 200px;" />
						                            <col style="width: 120px;" />
						                            <col style="width: auto;" />
						                        </colgroup>
						                        <tbody>
						                        	<tr>
						                        		<th scope="row"><label for="MEM_CPR_NM">기업명</label></th>
						                        		<td colspan="3">
						                                	<c:out value="${userInfo.MEM_CPR_NM }"/>
						                                </td>
						                        	</tr>
						                            <tr>
						                                <th scope="row"><label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label></th>
						                                <td>
						                                	<input type="hidden" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>"/>
						                                	<c:out value="${userInfo.MEM_MST_MEM_NM }"/>
						                                </td>
						                                <th scope="row"><label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
						                                <td>
						                                	<input type="hidden" id="ORD_MST_HP1" name="ORD_MST_HP1" value="<c:out value="${userInfo.MEM_MST_HP1 }"/>"/>
						                                	<c:out value="${userInfo.MEM_MST_HP1 }"/>
						                                    -
						                                    <input type="hidden" id="ORD_MST_HP2" name="ORD_MST_HP2" value="<c:out value="${userInfo.MEM_MST_HP2 }"/>"/>
						                                    <c:out value="${userInfo.MEM_MST_HP2 }"/>
										                    -
										                    <input type="hidden" id="ORD_MST_HP3" name="ORD_MST_HP3" value="<c:out value="${userInfo.MEM_MST_HP3 }"/>"/>
										                    <c:out value="${userInfo.MEM_MST_HP3 }"/>
						                                </td>
						                            </tr>
						                            <tr>
						                                <th scope="row"><label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label></th>
						                                <td colspan="3">
						                                	<input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>"/>
						                                	<input type="hidden" name="EMAIL_DOMAIN" id="EMAIL_DOMAIN" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>"/>
						                                	<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>
						                                </td>
						                            </tr>
						                        </tbody>
						                        </table>
						                    </div><!-- orderer-info -->
										</c:when>
										<c:otherwise>
											<div class="ct orderer-info"><!-- orderer-info -->
						                        <table class="table-c table-col">
						                        <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 입력 테이블입니다.</caption>
						                        <colgroup>
						                            <col style="width: 120px;" />
						                            <col style="width: 200px;" />
						                            <col style="width: 120px;" />
						                            <col style="width: auto;" />
						                        </colgroup>
						                        <tbody>
						                            <tr>
						                                <th scope="row"><label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label></th>
						                                <td>
						                                       <input type="text" class="text" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" maxlength="15" title="주문자명" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>"/>
						                                </td>
						                                <th scope="row"><label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
						                                <td>
						                                	<select id="ORD_MST_HP1" name="ORD_MST_HP1"  title="휴대폰 번호 앞자리">
					                                      		<option value="">선택</option>
											                    <c:if test="${not empty hpCodeList }">
											                         <c:forEach var="hpRow" items="${hpCodeList }">
											                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${userInfo.MEM_MST_HP1 eq hpRow.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
											                         </c:forEach>
											                     </c:if>
											                </select>
						                                    -
						                                    <input type="text" id="ORD_MST_HP2" name="ORD_MST_HP2" class="text small" title="휴대폰 번호 중간자리" maxlength="4" value="<c:out value="${userInfo.MEM_MST_HP2 }"/>"/>
										                    -
										                    <input type="text" id="ORD_MST_HP3" name="ORD_MST_HP3" class="text small" title="휴대폰 번호 뒷자리" maxlength="4" value="<c:out value="${userInfo.MEM_MST_HP3 }"/>"/>
						                                </td>
						                            </tr>
						                            <tr>
						                                <th scope="row"><label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label></th>
						                                <td colspan="3">
						                                	<input type="text" class="text email id" name="EMAIL_ID" id="EMAIL_ID" maxlength="30" title="이메일 아이디" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>"/>
						                                    @
						                                    <input type="text" class="text email domain" name="EMAIL_DOMAIN" id="EMAIL_DOMAIN" maxlength="30" title="이메일 서비스 도메인" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>"/>
						                                    
						                                    <select id="emailDomainSelectbox" name="emailDomainSelectbox"  title="이메일 서비스 도메인 선택">
						                                        <option value="">직접입력</option>
						                                        <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
								                                    <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
								                                        <option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${emailRow.CMN_COM_NM eq fn:split(userInfo.MEM_MST_MAIL,'@')[1]}">selected="selected"</c:if>><c:out value="${emailRow.CMN_COM_NM }"/></option>
								                                    </c:forEach>
								                                </c:if>
						                                    </select>
						                                </td>
						                            </tr>
						                        </tbody>
						                        </table>
						                    </div><!-- orderer-info -->
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
                  		</c:when>
                  		
                  		<c:otherwise><%-- 재주문인 경우 --%>
                  			<div class="ct orderer-info"><!-- orderer-info -->
		                        <table class="table-c table-col">
		                        <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 입력 테이블입니다.</caption>
		                        <colgroup>
		                            <col style="width: 120px;" />
		                            <col style="width: 200px;" />
		                            <col style="width: 120px;" />
		                            <col style="width: auto;" />
		                        </colgroup>
		                        <tbody>
		                            <tr>
		                                <th scope="row"><label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                                <td>
		                                	<c:out value="${preOrderInfo.ORD_MST_ORD_NM }"/>
		                                </td>
		                                <th scope="row"><label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                                <td>
		                                	<c:out value="${preOrderInfo.ORD_MST_HP1 }"/>
		                                    -
		                                    <c:out value="${preOrderInfo.ORD_MST_HP2 }"/>
						                    -
						                    <c:out value="${preOrderInfo.ORD_MST_HP3 }"/>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th scope="row"><label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                                <td colspan="3">
		                                	<c:out value="${fn:split(preOrderInfo.ORD_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(preOrderInfo.ORD_MST_MAIL,'@')[1] }"/>
		                                </td>
		                            </tr>
		                        </tbody>
		                        </table>
		                    </div><!-- orderer-info -->
                  		</c:otherwise>
                  	</c:choose>	
                    <%---------------------------------------------------------------- 주문고객 정보 끝 ------------------------------------------------%>

					<%---------------------------------------------------------------- 배송지 정보 시작 ------------------------------------------------%>
                    <%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentDlvInfo.jsp" %>
                    <%---------------------------------------------------------------- 배송지 정보 끝 ------------------------------------------------%>

					<%---------------------------------------------------------------- 적립/혜택 정보 시작 ------------------------------------------------%>
					<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 적립/혜택 없음 --%>
					<c:choose>
						<c:when test="${empty userInfo }">
							<h3 class="title">적립 혜택정보</h3>
							<div class="point-info nonmember"><!-- point-info -->
		                        <div class="frame-a">
			                            회원 전용 혜택입니다.<br />
			                            로그인 하시면 더 많은 혜택을 받으실 수 있습니다.
		                        </div>
		                    </div><!-- point-info -->
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE or userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }"><%-- 간편/기업은 적립혜택 없음 --%>
						</c:when>
						<c:otherwise>
							<h3 class="title">적립 혜택정보</h3>
							<div class="point-info"><!-- point-info -->
		                        <table class="table-c table-col">
		                        <caption>포인트, OK 캐쉬백으로 구성된 적립 혜택정보 테이블입니다.</caption>
		                        <colgroup>
		                            <col style="width: 120px;">
		                            <col style="width: auto;">
		                        </colgroup>
		                        <tbody>
		                            <tr>
		                                <th scope="row">포인트</th>
		                                <td>
		                                    <span class="core"><span class="warning" id="span_saveMlg"><fmt:formatNumber value="${cart_reserve_mileage}" type="number" /></span>P 적립예정</span>
		                                    <span class="desc dotum">( 포인트는 구매가 확정되면 자동으로 적립됩니다.)</span>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th scope="row">OK 캐쉬백</th>
		                                <td>
		                                    <span class="core"><span class="warning" id="span_saveCashbag"><fmt:formatNumber value="${cartlist[0].SUM_RESERVE_CASHBAG}" type="number" /></span>포인트 적립예정</span>
		                                    <!-- <span class="desc dotum">포인트 적립예정</span> -->
		                                </td>
		                            </tr>
		                        </tbody>
		                        </table>
		                    </div><!-- point-info -->
						</c:otherwise>
					</c:choose>
					</c:if>
                    <%---------------------------------------------------------------- 적립/혜택 정보 끝 ------------------------------------------------%>

					<%---------------------------------------------------------------- 결제방법 시작 ------------------------------------------------%>
					<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 적립/혜택 없음 --%>
                    <h3 class="title">결제방법</h3>

                    <div class="payment-way-nav"><!-- payment-way-nav -->
                    	<c:forEach var="item" items="${codes.PAY_TYPE}" varStatus="i">
                    		<c:set var="c_show_yn" value="N"/>
                    		<c:if test="${item.CMN_COM_ETC3 ne 'N'}">
	                      		<c:if test="${i.index eq 0}">
	                      			<c:set var="pay_btn_class" value="btn_blk777"/>
	                      		</c:if>
	                      		<c:if test="${i.index gt 0}">
	                      			<c:set var="pay_btn_class" value="btn_white"/>
	                      		</c:if>
	                      		<c:choose>
	                      			<c:when test="${not empty cartlist[0].ORD_TMP_PRE_CD }"><%-- 재주문인 경우 신용카드/실시간계좌이체/해외카드만 가능 --%>
	                      				<c:if test="${item.CMN_COM_IDX eq Code.PAY_CARD or item.CMN_COM_IDX eq Code.PAY_ACCOUNT or item.CMN_COM_IDX eq Code.PAY_FOREIGN_CARD}">
	                      					<c:set var="c_show_yn" value="Y"/>
	                      				</c:if>
	                      			</c:when>
	                      			<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우인 경우 신용카드만 가능 --%>
	                      				<c:if test="${item.CMN_COM_IDX eq Code.PAY_CARD}">
	                      					<c:set var="c_show_yn" value="Y"/>
	                      				</c:if>
	                      			</c:when>
	                      			<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}"><%-- 장기할부인 경우 신용카드만 가능 --%>
	                      				<c:if test="${item.CMN_COM_IDX eq Code.PAY_CARD}">
	                      					<c:set var="c_show_yn" value="Y"/>
	                      				</c:if>
	                      			</c:when>
	                      			<c:otherwise>
	                      				<c:set var="c_show_yn" value="Y"/>
	                      			</c:otherwise>
	                      		</c:choose>
	                      		
	                      		<c:if test="${c_show_yn eq 'Y' }">
	                      			<input id="radioPayment_${item.CMN_COM_IDX}" class="radio radioPayment" type="radio" name="radioPayment" value="${item.CMN_COM_IDX }" <c:if test="${i.index eq 0}">checked="checked"</c:if> /> 
	                      			<a href="javascript:changePayWay('${item.CMN_COM_IDX}');" id="paymentBtn_${item.CMN_COM_IDX}" class="btn_st0 ${pay_btn_class} small"><span><c:out value="${item.CMN_COM_NM }"/></span></a>
	                      		</c:if>
                      		</c:if>
                      	</c:forEach>
                      	<input id="radioPayment_0" class="radio radioPayment" type="radio" name="radioPayment" value="${Code.PAY_MILEAGE}" style="display : none;"/>
                    </div><!-- // payment-way-nav -->

                    <div class="frame-b payment-way credit-card pay-way pay-way_${Code.PAY_CARD}"><!-- payment-way -->
                        <h4 class="blind">신용카드 결제</h4>

                        <div class="article-list"><!-- article-list -->
                            <ul>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit"><label for="EP_card_cd1">카드종류</label></h5>
                                        <div class="col apply">
                                        	<select  name="EP_card_cd1" id="EP_card_cd1" title="카드선택">
                                               	<option value="">선택</option>
                                               	<c:if test="${not empty cardList }">
				                                    <c:forEach var="row" items="${cardList }">
				                                        <option 
				                                        	value="<c:out value="${row.CRD_INF_CD_NO }"/>"
				                                        	data-req_type = "<c:out value="${row.CRD_INF_PAY }"/>"
				                                        	data-crd_inf_idx = "<c:out value="${row.CRD_INF_IDX }"/>"
				                                        ><c:out value="${row.CRD_INF_NM }"/></option>
				                                    </c:forEach>
				                                </c:if>
	                                        </select>
                                        </div>
                                    </div>
                                </li>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit"><label for="monthly1">할부종류</label></h5>
                                        <c:choose>
                                        	<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}"><%-- 장기할부인 경우 --%>
                                        		<input type="radio" id="EP_noint1" name="EP_noint1" value="02" checked="checked" style="display: none;"/>
                                        		<input type="hidden" id="freeInterestList" value="<c:out value="${cartlist[0].ORD_TMP_LNG_DIV }"/>"/>
                                        		<input type="hidden" id="noFreeInterestList" value=""/>
                                        		<div class="col apply" id="divInterest">
		                                            	무이자할부 <c:out value="${cartlist[0].ORD_TMP_LNG_DIV }"/>개월
		                                        </div>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<div class="col apply" id="divInterest">
		                                            <label for="EP_noint1" class=" on epNointLabel" data-desc_yn="N">
		                                                <input type="radio" name="EP_noint1" id="EP_noint1" value="00" checked="checked" />
		                                               		일시불
		                                            </label>
		                                            <label for="monthly2" class=" epNointLabel" id="freeInterestListLabel" data-desc_yn="N">
		                                                <input type="radio" name="EP_noint1" id="monthly2" value="02" />
		                                                	무이자할부
		                                            </label>
		                                            <select class="sel_chg interestList" id="freeInterestList" title="무이자할부 개월 수">
		                                                <option value="">선택</option>
		                                            </select>
		                                            <label for="monthly3" class=" epNointLabel" id="noFreeInterestListLabel" data-desc_yn="Y">
		                                                <input type="radio" name="EP_noint1" id="monthly3" class="interest" value="00"/>
		                                                	일반할부
		                                            </label>
		                                            <select class="sel_chg interestList"  id="noFreeInterestList" title="일반할부 개월 수">
		                                                <option value="">선택</option>
		                                            </select>
		                                        </div>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                </li>
                                <li class="article" id="li_samsung_pnt" style="display: none;">
                                    <div class="module">
                                        <h5 class="col tit"><label for="cardPoint1">카드 포인트 사용</label></h5>
                                        <div class="col apply">
                                            <label for="EP_point_useyn1" class="">
                                                <input type="radio" name="EP_point_useyn" id="EP_point_useyn1" value="Y"/>
                                                	카드사 포인트 사용
                                            </label>
                                            <label for="EP_point_useyn" class=" on">
                                                <input type="radio" name="EP_point_useyn" id="EP_point_useyn" value="N" checked="checked" />
                                               	 사용안함
                                            </label>
                                            <p class="mt20">
                                               	 삼성카드 보너스 포인트
                                            </p>
                                            <p class="message notice-b">
                                                	보너스 포인트 1점 이상 보유 시 1포인트 단위로 사용 가능
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div><!-- // article-list -->

                        <p class="message notice-b mt10">
                            	신용카드 매출전표는 부가가치세법 제32조의 3 제 3항에 의하여 발행되며, 동법 시행령 제57조 제2항에 의하여 세금계산서를 교부하지 않습니다.
                        </p>

                        <h6 class="title">혜택안내</h6>

                        <div class="benefit-wrap"><!-- benefit-wrap -->
                            <a href="javascript:;" class="tab-nav nth-child-1 active"><span>무이자 안내</span></a>
                            
                            <div class="benefit in">
                            	<c:choose>
                            		<c:when test="${not empty cardEventFreetList }">
                            			<table>
		                                <caption>카드종류, 할부종류로 구성된 신용카드별 무이자 혜택정보 테이블입니다.</caption>
		                                <colgroup>
		                                    <col style="width: auto;" />
		                                    <col style="width: 35%;" />
		                                    <col style="width: 40%;" />
		                                </colgroup>
		                                <thead class="blind">
		                                    <tr>
		                                        <th scope="col">카드종류</th>
		                                        <th scope="col">무이자 할부</th>
		                                        <th scope="col">부분무이자 할부</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="row" items="${cardEventFreetList }" varStatus="i">
		                                		<tr>
		                                			<c:if test="${row.RNUM eq 1 }">
				                                        <th scope="row" rowspan="${row.CRD_DIV_CNT }">
				                                            <span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
				                                        </th>
				                                        <td rowspan="${row.CRD_DIV_CNT }">
				                                        <c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST}">
				                                            <p class="price">(${row.DIV_DTL_PRC}만원<span class="up"><em class="blind">이상</em></span>)</p>
				                                            <p>${row.DIV_INF_MNT } 개월 무이자 할부</p>
				                                        </c:if>    
				                                        </td>
				                                        <c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST and row.CRD_DIV_CNT eq 1}">
				                                        	<td></td>
				                                        </c:if>
			                                        </c:if>
			                                         <c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST}">
			                                         <td>
			                                            <p class="price">(${row.DIV_DTL_PRC}만원<span class="up"><em class="blind">이상</em></span>)</p>
			                                            <p>
			                                            	<c:forEach var="month" items="${fn:split(row.DIV_INF_MNT, ',')}" varStatus="monthStatus">
									                    		<span>${month }</span>개월 ${row.DIV_INF_GBN_NM }
									                    		<c:if test="${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index] ne '-' }">
									                    			(${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index]})
									                    		</c:if>
									                    		<br/>
									                    	</c:forEach>
			                                            </p>
			                                        </td>
			                                        </c:if>
			                                    </tr>
		                                	</c:forEach>
		                                </tbody>
		                                </table>
		
		                                <ul class="list list-a mt10">
		                                    <li>위 결제액은 최종 결제금액 기준이며, 기준금액 미만이거나, 무이자할부가 되지 않는 신용카드를 사용하시는 경우 일반할부로 결제되오니 유의하시기 바랍니다.</li>
		                                    <li>무이자할부 이용시 카드포인트가 미적립될 수 있습니다. (자세한 내용은 카드사 홈페이지 참조)</li>
		                                    <li>법인카드, 체크카드, 기프트카드, 선불카드는 대상카드가 아닙니다.</li>
		                                </ul>
                            		</c:when>
                            		<c:otherwise>
                            			<p class="message no-more">
		                                    	진행중인 신용카드 혜택이 없습니다.
		                                </p>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            
                            <%-- 카드행사 목록 --%>
                            <c:set var="c_promotion_charge_cnt" value="0"/>
                            <c:set var="c_promotion_point_dc_cnt" value="0"/>
                            <c:set var="c_promotion_point_save_cnt" value="0"/>
                            <c:set var="c_promotion_cashbag_cnt" value="0"/>
                            <c:forEach var="row" items="${cardPromotionList }">
                            	<c:choose>
                            		<c:when test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CHARGE }">
                            			<c:set var="c_promotion_charge_cnt" value="${row.PMT_GBN_CNT }"/>
                            		</c:when>
                            		<c:when test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_DC }">
                            			<c:set var="c_promotion_point_dc_cnt" value="${row.PMT_GBN_CNT }"/>
                            		</c:when>
                            		<c:when test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_SAVE }">
                        				<c:set var="c_promotion_point_save_cnt" value="${row.PMT_GBN_CNT }"/>
                        			</c:when>
                        			<c:when test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CASHBAG }">
                            			<c:set var="c_promotion_cashbag_cnt" value="${row.PMT_GBN_CNT }"/>
                            		</c:when>
                            	</c:choose>
                            </c:forEach>

                            <a href="javascript:;" class="tab-nav nth-child-2"><span>청구할인 안내</span></a>
                            
                            <div class="benefit">
                            	<c:choose>
                            		<c:when test="${c_promotion_charge_cnt gt 0 }">
                            			<table>
		                                <caption>카드종류, 청구할인 혜택로 구성된 신용카드별 청구할인 혜택정보 테이블입니다.</caption>
		                                <colgroup>
		                                    <col style="width: 25%;" />
		                                    <col style="width: auto;" />
		                                </colgroup>
		                                <thead class="blind">
		                                    <tr>
		                                        <th scope="col">카드종류</th>
		                                        <th scope="col">청구할인 혜택</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="row" items="${cardPromotionList }">
		                                		<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CHARGE }">
				                                    <tr>
				                                        <th scope="row">
				                                            <span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
				                                        </th>
				                                        <td>
				                                            <p class="price">
				                                            	(${row.PMT_CRD_SML_PRC}만원 <span class="up"><em class="blind"></em></span>)
				                                            </p>
				                                            <p>	
				                                            	<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
				                                            		${row.PMT_CRD_SAL_PRC }%
				                                            	</c:if>
				                                            	<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
				                                            		${row.PMT_CRD_SAL_PRC }만원
				                                            	</c:if>
				                                            	청구할인, 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
				                                            	(~${row.END_DATE })
				                                            </p>
				                                        </td>
				                                    </tr>
			                                    </c:if>
		                                    </c:forEach>
		                                </tbody>
		                                </table>
		
		                                <ul class="list list-a mt10">
		                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
		                                </ul>
                            		</c:when>
                            		<c:otherwise>
                            			<p class="message no-more">
		                                    	진행중인 신용카드 혜택이 없습니다.
		                                </p>
                            		</c:otherwise>
                            	</c:choose>
                            </div>

                            <a href="javascript:;" class="tab-nav nth-child-3"><span>캐시백 안내</span></a>
                            
                            <div class="benefit">
                                <c:choose>
                            		<c:when test="${c_promotion_cashbag_cnt gt 0 }">
                            			<table>
		                                <caption>카드종류, 청구할인 혜택로 구성된 신용카드별 청구할인 혜택정보 테이블입니다.</caption>
		                                <colgroup>
		                                    <col style="width: 25%;" />
		                                    <col style="width: auto;" />
		                                </colgroup>
		                                <thead class="blind">
		                                    <tr>
		                                        <th scope="col">카드종류</th>
		                                        <th scope="col">청구할인 혜택</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="row" items="${cardPromotionList }">
		                                		<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CASHBAG }">
				                                    <tr>
				                                        <th scope="row">
				                                            <span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
				                                        </th>
				                                        <td>
				                                            <p class="price">
				                                            	(${row.PMT_CRD_SAL_PRC}만원 <span class="up"><em class="blind"></em></span>)
				                                            </p>
				                                            <p>	
				                                            	최소 <fmt:formatNumber value="${row.PMT_CRD_SML_PRC}" />만원 ~
				                                            	최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
				                                            	(~${row.END_DATE })
				                                            </p>
				                                        </td>
				                                    </tr>
			                                    </c:if>
		                                    </c:forEach>
		                                </tbody>
		                                </table>
		
		                                <ul class="list list-a mt10">
		                                	<li>카드사별 행사 적용모델이 다를 수 있으며, 카드혜택 안내 페이지를 참조해주세요.</li>
		                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
		                                </ul>
                            		</c:when>
                            		<c:otherwise>
                            			<p class="message no-more">
		                                    	진행중인 신용카드 혜택이 없습니다.
		                                </p>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            
                            <a href="javascript:;" class="tab-nav nth-child-4"><span>포인트 적립 안내</span></a>
                            
                            <div class="benefit">
                                <c:choose>
                            		<c:when test="${c_promotion_point_save_cnt gt 0 }">
                            			<table>
		                                <caption>카드종류, 청구할인 혜택로 구성된 신용카드별 청구할인 혜택정보 테이블입니다.</caption>
		                                <colgroup>
		                                    <col style="width: 25%;" />
		                                    <col style="width: auto;" />
		                                </colgroup>
		                                <thead class="blind">
		                                    <tr>
		                                        <th scope="col">카드종류</th>
		                                        <th scope="col">청구할인 혜택</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="row" items="${cardPromotionList }">
		                                		<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_SAVE }">
				                                    <tr>
				                                        <th scope="row">
				                                            <span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
				                                        </th>
				                                        <td>
				                                            <p class="price">
				                                            	(${row.PMT_CRD_SML_PRC}만원 <span class="up"><em class="blind"></em></span>)
				                                            </p>
				                                            <p>	
				                                            	~ 최대
				                                            	<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
				                                            		${row.PMT_CRD_SAL_PRC }%
				                                            	</c:if>
				                                            	<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
				                                            		${row.PMT_CRD_SAL_PRC }만원
				                                            	</c:if>
				                                            	적립
				                                            	<c:if test="${not empty row.PMT_CRD_MXM_PRC}">
				                                            		, <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
				                                            	</c:if>
				                                            	(~${row.END_DATE })
				                                            </p>
				                                        </td>
				                                    </tr>
			                                    </c:if>
		                                    </c:forEach>
		                                </tbody>
		                                </table>
		
		                                <ul class="list list-a mt10">
		                                	<li>카드사별 행사 적용모델이 다를 수 있으며, 카드혜택 안내 페이지를 참조해주세요.</li>
		                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
		                                </ul>
                            		</c:when>
                            		<c:otherwise>
                            			<p class="message no-more">
		                                    	진행중인 신용카드 혜택이 없습니다.
		                                </p>
                            		</c:otherwise>
                            	</c:choose>
                            </div>

                            <a href="javascript:;" class="tab-nav nth-child-5"><span>포인트 선할인 안내</span></a>
                            
                            <div class="benefit">

                                <p class="message">
                                    <strong>포인트연계할부 서비스란 ?</strong><br />
                                    	사용금액만큼 선할인 받고 정해진 상환기간 동안 약정원금과 일부 이자를 적립형 카드 이용 실적에 따라 적립된 포인트(부족분은 현금) 로 상환해 나가는 서비스 입니다. 
                                </p>

                                <c:choose>
                            		<c:when test="${c_promotion_point_dc_cnt gt 0 }">
                            			<table>
		                                <caption>카드종류, 청구할인 혜택로 구성된 신용카드별 청구할인 혜택정보 테이블입니다.</caption>
		                                <colgroup>
		                                    <col style="width: 25%;" />
		                                    <col style="width: auto;" />
		                                </colgroup>
		                                <thead class="blind">
		                                    <tr>
		                                        <th scope="col">카드종류</th>
		                                        <th scope="col">청구할인 혜택</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="row" items="${cardPromotionList }">
		                                		<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_DC }">
				                                    <tr>
				                                        <th scope="row">
				                                            <span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
				                                        </th>
				                                        <td>
				                                            <p class="price">
				                                            	(${row.PMT_CRD_SAL_PRC}만원 <span class="up"><em class="blind"></em></span>)
				                                            </p>
				                                            <p>	
				                                            	최소 <fmt:formatNumber value="${row.PMT_CRD_SML_PRC}" />만원 ~
				                                            	최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
				                                            	(~${row.END_DATE })
				                                            </p>
				                                        </td>
				                                    </tr>
			                                    </c:if>
		                                    </c:forEach>
		                                </tbody>
		                                </table>
		
		                                <ul class="list list-a mt10">
		                                	<li>카드사별 행사 적용모델이 다를 수 있으며, 카드혜택 안내 페이지를 참조해주세요.</li>
		                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
		                                </ul>
                            		</c:when>
                            		<c:otherwise>
                            			<p class="message no-more">
		                                    	진행중인 신용카드 혜택이 없습니다.
		                                </p>
                            		</c:otherwise>
                            	</c:choose>

                                <ul class="list list-a mt10">
                                    <li>안심클릭(간편결제) 신청창에서 &lsquo;세이브이용&rsquo; 선택 </li>
                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
                                </ul>
                            </div>
                        </div><!-- benefit-wrap -->
                    </div><!-- // payment-way -->
                    
                    <div class="frame-b payment-way credit-card pay-way pay-way_${Code.PAY_FOREIGN_CARD}"><!-- payment-way -->
                        <h4 class="blind">해외카드 결제</h4>

                        <div class="article-list"><!-- article-list -->
                            <ul>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit"><label for="EP_card_cd2">카드종류</label></h5>
                                        <div class="col apply">
                                        	<select  name="EP_card_cd2" id="EP_card_cd2" title="카드선택">
                                               	<option value="">선택</option>
                                               	<option value="050" data-req_type = "MPI" data-crd_inf_idx = "0">해외 VISA</option>
                                               	<option value="028" data-req_type = "MPI" data-crd_inf_idx = "0">해외 JCB</option>
                                               	<option value="048" data-req_type = "MPI" data-crd_inf_idx = "0">동양 다이너스</option>
                                               	<option value="046" data-req_type = "MPI" data-crd_inf_idx = "0">동양 해외</option>
                                               	<option value="049" data-req_type = "MPI" data-crd_inf_idx = "0">해외 MASTER</option>
                                               	<option value="081" data-req_type = "MPI" data-crd_inf_idx = "0">은련</option>
	                                        </select>
                                        </div>
                                    </div>
                                </li>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit"><label for="monthly1">할부종류</label></h5>
                                       		<div class="col apply" id="divInterest">
	                                            <label for="EP_noint2" class=" on epNointLabel" data-desc_yn="N">
	                                                <input type="radio" name="EP_noint2" id="EP_noint2" value="00" checked="checked" />
	                                               		일시불
	                                            </label>
	                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div><!-- // article-list -->
                    </div><!-- // payment-way -->
                    
                    

                    <div class="frame-b payment-way account-transfer pay-way pay-way_${Code.PAY_ACCOUNT}"><!-- payment-way -->
                        <h4 class="blind">실시간계좌이체 결제</h4>

                        <div class="article-list"><!-- article-list -->
                            <ul>
                                <li class="article nth-child-1">
                                    <div class="module">
                                        <h5 class="col tit">실시간계좌이체 결제 안내</h5>
                                        <div class="col apply">
                                            <ul class="list list-a">
                                                <li>실시간 계좌 이체 서비스는 은행계좌만 있으면 누구나 이용하실 수 있는 서비스로, 결제와 동시에 즉시 이체됩니다.</li>
                                                <li>결제 시 공인인증서가 반드시 필요합니다.</li>
                                                <li>은행 이용가능 서비스 시간은 은행사정에 따라 다소 변동될 수 있습니다.</li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <%-- 현금영수증 항목 --%>
                                <li class="article nth-child-2 cash-receipt">
	                                <c:set var="c_cash_receipt_no" value="0"/>
	                                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentCashReceipt.jsp" %>
                                </li>
                            </ul>
                        </div><!-- // article-list -->
                    </div><!-- // payment-way -->

                    <div class="frame-b payment-way kakao-pay pay-way pay-way_${Code.PAY_KAKAOPAY}"><!-- payment-way -->
                        <h4 class="blind">카카오페 결제안내 </h4>

                        <h5 class="title">카카오페이란? <span class="icon"><!-- icon --></span></h5>

                        <p class="message guide-text">
                            카카오페이는 개인 신용카드를 카카오톡앱에 등록/인증하여 결제하는 방식으로 최초 1회 결제정보만 입력하여 간편하게 결제하실 수 있는 모바일 결제 서비스 입니다.
                        </p>

                        <p class="dotum">
                            ㆍ 이용 가능한 카드 : BC카드, KB국민카드, 삼성카드, 롯데카드, 외환카드, 하나카드, 현대카드, 씨티카드, NH농협카드, 신한카드<br/>
                            ㆍ 단, BC 카드중 다음 3가지는 등록불가합니다.(신한, 하나, 국민)
                        </p>

                        <div class="frame-a dotum">
                            <h6>&lt;유의사항&gt;</h6>

                            <ul class="list list-a">
                                <li>본인명의 휴대폰에서 본인명의의 카드등록후 사용 가능합니다.</li>
                                <li>카카오톡앱 미설치시 앱스토어에서 앱 설치후 회원가입을 하셔야 합니다.</li>
                                <li>카카오톡앱 내에서 카카오페이 가입시 카드사 등록/인증을 하셔야 결제가 가능합니다.</li>
                            </ul>

                            <p class="desc small">
                                카카오페이는 무이자할부 및 제휴카드 혜택 내용과 관계가 없습니다.<br />
                                자세한 사항은 카카오페이 공지사항에서 확인하실 수 있습니다.
                            </p>
                        </div>

                        <p class="message notice-b">
                            신용카드 매출전표는 부가가치세법 제32조의 3 제 3항에 의하여 발행되며, 동법 시행령 제57조 제2항에 의하여 세금계산서를 교부하지 않습니다.
                        </p>
                    </div><!-- // payment-way -->

                    <div class="frame-b payment-way paynow pay-way pay-way_${Code.PAY_PAYNOW}"><!-- payment-way -->
                        <h4 class="blind">페이나우 결제안내 </h4>

                        <h5 class="title">페이나우 란?<span class="icon"><!-- icon --></span></h5>

                        <p class="message guide-text">
                            페이나우는 개인 신용카드를 페이나우앱에 등록/인증하여 결제하는 방식으로 최초 1회 결제정보만 입력하여 간편하게 결제하실 수 있는 모바일 결제 서비스 입니다.
                        </p>

                        <p class="dotum">
                            ㆍ 이용 가능한 카드 : BC카드, 하나카드, 신한카드, 삼성카드, 국민카드, 현대카드, NH농협카드
                        </p>

                        <div class="frame-a dotum">
                            <h6>&lt;유의사항&gt;</h6>

                            <ul class="list list-a">
                                <li>본인명의 휴대폰에서 본인명의의 카드등록후 사용 가능합니다.</li>
                                <li>페이나우앱 미설치시 앱스토어 또는 플레이스토어에서 앱 설치후 회원가입을 하셔야 합니다.</li>
                                <li>페이나우앱 내에서 페이나우가입시 카드사 등록/인증을 하셔야 결제가 가능합니다.</li>
                            </ul>

                            <p class="desc small">
                                페이나우는 무이자할부 및 제휴카드 혜택 내용과 관계가 없습니다.<br />
                                자세한 사항은 페이나우 공지사항에서 확인하실 수 있습니다.
                            </p>
                        </div>

                        <p class="message notice-b">
                            신용카드 매출전표는 부가가치세법 제32조의 3 제 3항에 의하여 발행되며, 동법 시행령 제57조 제2항에 의하여 세금계산서를 교부하지 않습니다.
                        </p>
                    </div><!-- // payment-way -->

                    <div class="frame-b payment-way deposit-bankbook pay-way pay-way_${Code.PAY_DEPOSIT} pay-way_${Code.PAY_ESCROW}"><!-- payment-way -->
                        <h4>무통장 결제안내</h4>

                        <div class="article-list"><!-- article-list -->
                            <ul>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit"><label for="EP_bank_cd">입금은행 <span class="essential"><em class="blind">필수입력</em></span></label></h5>
                                        <div class="col apply">
                                        	<select  name="EP_bank_cd" id="EP_bank_cd">
                                              	<option value="">선택</option>
												<c:forEach var="item" items="${depositBankList }">
													<option value="${item.CMN_COM_ETC1 }">${item.CMN_COM_NM }</option>
												</c:forEach>                                                
                                             </select>
                                            <span class="desc dotum">예금주명 : 마켓플랜트 </span>
                                        </div>
                                    </div>
                                </li>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit"><label for="ORD_MST_DPS_NM">입금자명 <span class="essential"><em class="blind">필수입력</em></span></label></h5>
                                        <div class="col apply">
                                            <input type="text" class="text" id="ORD_MST_DPS_NM" name="ORD_MST_DPS_NM" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" maxlength="20"/>
                                        </div>
                                    </div>
                                </li>
                                <li class="article">
                                    <div class="module">
                                        <h5 class="col tit">입금기한</h5>
                                        <div class="col apply">
                                            <p>
                                                <span class="warning"><c:out value="${LGD_CLOSEDATE_TEXT }"/></span>까지 입금이 확인되지 않으면 주문이 자동으로 취소됩니다.
                                            </p>

                                            <ul class="list list-a desc">
                                                <li>전용 계좌번호 발급으로 입금인 명의와 상관없이 입금 가능합니다.</li>
                                                <li>전용 계좌번호와 입금예정일은 MYLAND &gt; 쇼핑내역 &gt; 주문/배송조회에서 확인 가능합니다.</li>
                                                <li>만일, 해당 주문의 최종 결제 금액과 다른 금액을 입금하시면 주문이 정상적으로 처리되지 않으니 유의 바랍니다.</li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="article cash-receipt last">
                                    <c:set var="c_cash_receipt_no" value="1"/>
	                                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartpaymentCashReceipt.jsp" %>
                                </li>
                                <li class="article escrowa pay-way pay-way_${Code.PAY_ESCROW}">
                                    <div class="module">
                                        <label for="escrowaAreement" class="js-checkbox">
                                            <input type="checkbox" id="escrowaAreement" />
                                            	구매안전 서비스(에스크로) 이용약관 동의.
                                        </label>
                                        <a href="#" class="btn_st0 btn_white small" target="_blank" title="새 창 열림"><span>약관보기</span></a>
                                        <p>
                                            <a href="https://office.easypay.co.kr/homepage/other_service/EscrowAuthAction.do?memb_id=05109822" target="_blank" title="새 창 열림"><img src="${cdnDomain}/pc/img/btn/btn_kicc.png" alt="한국정보통신(주) 매매안심거래 서비스 가맹점. KICC의 이지에스크로 서비스를 통해 안심하고 거래하시기 바랍니다. 서비스가입확인" /></a>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div><!-- // article-list -->
                    </div><!-- // payment-way -->
                    </c:if>
                    <c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 적립/혜택 없음 --%>
                    	<input id="radioPayment_cleanking" class="radio radioPayment" type="radio" name="radioPayment" value="${Code.PAY_CLEANKING}"  checked="checked" style="display : none;"/>
                    </c:if>
                    <%---------------------------------------------------------------- 결제방법 끝 ------------------------------------------------%>
                </div><!-- // payment-info -->
                            
                <div id="paymentTotal" class="payment-total"><!-- payment-total -->   

                    <div class="price-box">
                        <h3>최종 결제금액 확인</h3>

                        <ul>
                            <li>               
                                <h4>총 주문상품금액</h4>
                                <span class="price"><strong>
                                	<c:choose>
		                            	<c:when test="${not empty cartlist[0].ESM_PRD_IDX}">
		                            		<span>-</span>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<span id="span_cart_prd_amount"><fmt:formatNumber value="${cart_prd_amount}" /></span>
		                            	</c:otherwise>
		                            </c:choose>
                                </strong>원</span>
                            </li>
                            <li>  
                                <h4>즉시할인</h4>
                                <span class="price"><strong>- <span id="span_cart_ist_cpn_prc"><fmt:formatNumber value="${cart_ist_cpn_prc}" /></span></strong>원</span>
                            </li>
                            <li>  
                                <h4>추가할인</h4>
                                <span class="price"><strong>- <span class="span_cart_add_disc_prc">0</span></strong>원</span>
                            </li>
                            <c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 배송비 없음 --%>
                            <li>  
                                <h4>배송비</h4>
                                <span class="price"><strong><span id=""><fmt:formatNumber value="${cart_delivery}" /></span></strong>원</span>
                            </li>
                            <li id="li_cart_add_delivery" style="display: none;">  
                                <h4>추가배송비</h4>
                                <span class="price"><strong><span id="span_cart_add_delivery"><fmt:formatNumber value="${cart_add_delivery}" /></span></strong>원</span>
                            </li>
                            </c:if>
                            <li class="final">  
                                <h4>최종 결제금액</h4>
                                <span class="price"><strong><span id="span_cart_total"><fmt:formatNumber value="${cart_total}" type="number" /></span></strong>원</span>
                                <c:if test="${not empty cartlist[0].ORD_TMP_LNG_DIV}">
				            		<p>
					            		<span style="color:#fd1f27">(실제 월 청구예상금액 <span id="span_expected_lng_prc"><fmt:formatNumber value="${cart_total/ cartlist[0].ORD_TMP_LNG_DIV}" type="number" pattern="###,###"/></span>원)</span>
					            	</p>
				            	</c:if>
                            </li>
                        </ul>

                        <div class="action">
                            <a href="javascript:paymentPrepare();" class="btn_st2 btn_rd xlarge" id="goPayBtn">
                            	<c:choose>
					       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 예약상담 --%>
					       	   	<span>예약상담하기</span>
					       	   </c:when>
					       	   <c:otherwise>
					       	   	<span>결제하기</span>
					       	   </c:otherwise>
					       	   </c:choose>
                            </a>
                        </div>
                    </div>

                    <div class="agree">
                        <h4>구매자 동의</h4>

                        <p>
                            주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?<br />
                            (전자상거래법 제 8조 2항)
                        </p>

                        <p class="mt20 dotum check">
                        	<input id="ORDER_CONFIRM" type="checkbox" class="check" name="ORDER_CONFIRM"/>
                            <label for="ORDER_CONFIRM">동의합니다.</label>
                        </p>
                    </div>
                </div><!-- // payment-total -->

            </div><!-- // payment-box -->
            
            <c:forEach items="${MEM_CRT_IDX}" var="crt_idx">
            <input type="hidden" name="MEM_CRT_IDX[]" value="${crt_idx}"/>                    
            </c:forEach>
	        <input type="hidden" id="INSURANCE_BIRTH" name="INSURANCE_BIRTH" value=""/>
	        <input type="hidden" id="ORD_MST_RFD_CD" name="ORD_MST_RFD_CD" value=""/>
	        <input type="hidden" id="ORD_MST_RFD_NM" name="ORD_MST_RFD_NM" value=""/>
	        <input type="hidden" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" value=""/>
	        <input type="hidden" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" value=""/>
			
			<!-- 카카오페이 파라미터 -->
			<div id="txnContents" style="display:none"><!-- style="display:none" -->
		        <input id="resultCode" name="resultCode" type="hidden" value=""/><br/>
		        <input id="resultMsg" name="resultMsg" type="hidden" value=""/><br/>
		        <input id="txnId" name="txnId" type="hidden" value=""/><br/>
		        <input id="merchantTxnNum" name="merchantTxnNum" type="hidden" value=""/><br/> <!-- Moid -->
		        <input id="prDt" name="prDt" type="hidden" value=""/><br/>
		    </div>
		    
		    <div id="dlpContents" style="display:none"><!-- style="display:none" -->
		        <input type="hidden" name="SPU" value=""/><br/>
		        <input type="hidden" name="SPU_SIGN_TOKEN" value=""/><br/>
		        <input type="hidden" name="MPAY_PUB" value=""/><br/>
		        <input type="hidden" name="NON_REP_TOKEN" value=""/><br/>
		    </div>

            </form>

            <!-- #laypop S -->
            <div id="laypop" class="laypop">
                <div id="priceKingGuide" class="laypop_con layer-popup"><!-- #priceKingGuide -->
                    <h5 class="title h1"> 배송상품 유의사항</h5>
                    <div class="holder">
                        <p class="message">
                            본 상품은 배송지와 가까운 마켓플랜트 물류센터에서 배송되는 상품입니다.<br />
                            물류재고 사정에 따라 일부 상품에 한해  배송기사가 직접 배송하거나,<br />
                            택배로 발송될 수 있습니다.  
                        </p>

                        <h6 class="title h2">배송</h6>

                        <div class="frame-a"><!-- frame-a -->
                            <ul class="list list-b small">
                                <li>익일배송이 원칙이며,, 주문시 희망배송일을 신청할 수 있습니다.  (일부상품 제외)</li>
                                <li>도서/산간지역의 경우 익일 배송이 불가능할 수 있으며, 제주도는 추가배송비 5,000원이 발생합니다.</li>
                                <li>배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다.</li>
                            </ul>
                        </div><!-- // frame-a -->

                        <h6 class="title h2">배송비부과</h6>

                        <div class="frame-a"><!-- frame-a -->
                            <ul class="list-b small">
                                <li>상품 개별 배송비가 원칙이며, 묶음배송이 가능한 상품에 한해 묶음배송비가 적용됩니다.</li>
                            </ul>
                        </div><!-- // frame-a -->
                    </div>
                    <div class="close">
                        <a href="javascript:com.laypop('hide')"><span class="blind">레이어 팝업 닫기</span></a>
                    </div>
                </div><!-- #priceKingGuide -->

                <div id="partnerGuide" class="laypop_con layer-popup"><!-- #priceKingGuide -->
                    <h5 class="title h1">파트너 배송상품 유의사항</h5>
                    <div class="holder">
                        <p class="message">
                            본 상품은 업체에서 배송되는 상품입니다.<br />
                            업체 배송정책에  따라  배송기사가 직접 배송하거나,<br />
                            택배로 발송될 수 있습니다. 
                        </p>

                        <h6 class="title h2">업체직접배송</h6>

                        <div class="frame-a"><!-- frame-a -->
                            <ul class="list list-b small">
                                <li>익일배송이 원칙이며,, 업체 사정에 의해 상품수량이 부족하여 배송이 지연되거나 안될 수 있습니다.</li>
                                <li>도서/산간지역의 경우 익일 배송이 불가능할 수 있으며, 제주도는 추가배송비 5,000원이 발생합니다.</li>
                            </ul>
                        </div><!-- // frame-a -->

                        <h6 class="title h2">업체택배배송</h6>

                        <div class="frame-a"><!-- frame-a -->
                            <ul class="list list-b small">
                                <li>택배 배송상품은 결제 후, 2~3일의 배송기간이 소요됩니다.</li>
                                <li>배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다.</li>
                            </ul>
                        </div><!-- // frame-a -->

                        <h6 class="title h2">배송비부과</h6>

                        <div class="frame-a"><!-- frame-a -->
                            <ul class="list-b small">
                                <li>상품 개별 배송비가 원칙이며, 묶음배송이 가능한 상품에 한해 묶음배송비가 적용됩니다.</li>
                            </ul>
                        </div><!-- // frame-a -->
                    </div>
                    <div class="close">
                        <a href="javascript:com.laypop('hide')"><span class="blind">레이어 팝업 닫기</span></a>
                    </div>
                </div><!-- #priceKingGuide -->
            </div>
            <!--// #laypop E -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	<!-- kakaopay LayerPopup의 Target DIV 생성 -->
	<div id="kakaopay_layer"  style="display: none"></div>

	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>
<!--// #wrap E -->

<%-- <script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 --> --%>
<script>
var isSubmit = false;

$(function(){
    //달력
    //epass.datepickr-0.4.js 이거불러와서 써주세요.
    if($('.btn_calendar').length > 0){
    	$('.btn_calendar').datePickr();
    }

    // 쿠폰/포인트 조회
    $('.discount-info .my-check').on('click', function(e) {
        e.preventDefault();

        var $this = $(this),
            field = $this.parents('.article').find('.field');

        field.slideToggle('400');
        if ($this.hasClass('in')){
            $this.removeClass('in').find('.blind em').html('열기');
        }else {
            $this.addClass('in').find('.blind em').html('닫기');
        }
    });

    // 신용카드 혜택
    $('.payment-way .benefit-wrap .tab-nav').on('mouseover', function(e) {
        e.preventDefault();

        var $this = $(this);
            $this.addClass('active').siblings('.tab-nav').removeClass('active');
            $this.next().addClass('in').siblings('.benefit').removeClass('in');

    });

});
</script>

<%-- kakaoPay script 시작--%>
<script src="https://pg.cnspay.co.kr:443/dlp/scripts/lib/easyXDM.min.js" type="text/javascript"></script>
<script src="https://kmpay.lgcns.com:8443/js/dlp/client/kakaopayDlpConf.js" charset="utf-8"></script>
<script src="https://kmpay.lgcns.com:8443/js/dlp/client/kakaopayDlp.min.js" charset="utf-8"></script>

<script type="text/javascript">

    /**
    cnspay  를 통해 결제를 시작합니다.
    */
    function cnspay() {
    	
    	var radioPayment = "";
    	$("input[name=radioPayment]").each(function(){
            if($(this).attr("checked")){
                radioPayment = $(this).val();
            }
        });
        
        if(radioPayment == "${Code.PAY_KAKAOPAY}"){
            // 00(=정상)
            if(document.LGD_PAYINFO.resultCode.value == '00') {
            	//결제 시  euc-kr로 해야한다.
	            /* document.LGD_PAYINFO.acceptCharset = "euc-kr";
	            if (LGD_PAYINFO.canHaveHTML) { // detect IE
	            document.charset = LGD_PAYINFO.acceptCharset;
	            } */
	            
                // TO-DO : 가맹점에서 해줘야할 부분(TXN_ID)과 KaKaoPay DLP 호출 API
                kakaopayDlp.setTxnId(document.LGD_PAYINFO.txnId.value);
                kakaopayDlp.setChannelType('WPM', 'TMS'); // PC결제
                //kakaopayDlp.setChannelType('MPM', 'WEB'); // 모바일 웹(브라우저)결제
                //kakaopayDlp.addRequestParams({ MOBILE_NUM : '010-1234-5678'}); // 초기값 세팅
                kakaopayDlp.callDlp('kakaopay_layer', document.LGD_PAYINFO, submitFunc);
            } else {
            	//결제 취소시 utf-8로 리셋
	            /* document.LGD_PAYINFO.acceptCharset = "utf-8";
	            if (LGD_PAYINFO.canHaveHTML) { // detect IE
	            document.charset = LGD_PAYINFO.acceptCharset;
	            } */
	            
                alert(document.LGD_PAYINFO.resultMsg.value);
            }
            
        }
        
    }
    
    function getTxnId(){
       /* 무이자할부는 없으므로 주석처리
        var maxInt = document.getElementById('maxInt').value;
        var fixedInt = document.getElementById('fixedInt').value;
        
        if( maxInt != '' && fixedInt != '' && fixedInt > maxInt ) {
            alert('가맹점에서 설정한 최대 할부 개월수를 초과하여 결제요청되었습니다.');
        } else { */
        	
            $.ajax({
				type : "post",
				url : "<c:out value="${serverDomain}" />/pc/cart/getTxnId.do",
				data : $("#LGD_PAYINFO").serialize(),
				dataType : "json",
				async : false,
				success : function(data){
		            // 가져온 결과를 LGD_PAYINFO에 세팅
		            $("#resultCode").val(data.resultCode);
		            $("#resultMsg").val(data.resultMsg);
		            $("#txnId").val(data.txnId);
		            //$("#merchantTxnNum").val(data.merchantTxnNum);
		            $("#prDt").val(data.prDt);
		            
			        cnspay();
				},
				error : function(err){
					alert("오류가 발생하였습니다.\n[" + err.status + "]");
				}
			});
            
            // 이후의 과정은 getTxnId.jsp 부터 진행
       /*  } */
    }
    
    var submitFunc = function cnspaySubmit(data){

				// 매뉴얼 참조하여 부인방지코드값 관리
				
        if(data.RESULT_CODE === '00') {
        	isSubmit = true;
        	$("#LGD_PAYINFO").attr({"action":"<c:out value="${serverDomain}" />/pc/cart/payment.do", "method":"post", "target":"_self"}).submit();
            //document.LGD_PAYINFO.submit();
        } else if(data.RESULT_CODE === 'KKP_SER_002') {
            // X버튼 눌렀을때의 이벤트 처리 코드 등록
            alert(data.RESULT_MSG);
        } else {
            alert(data.RESULT_MSG);
        }
        
    };

    function installmentOnChange(){
        var paymentMethod = "CC";
        var possiCardNum = document.getElementById('possiCard').value;
        var fixedIntNum = document.getElementById('fixedInt').value;
        
        if( possiCardNum == '' || fixedIntNum == '' ){
            document.getElementById('noIntOpt').value = "";
            
        } else {
            // 무이자 할부를 선택함에 따라 넘겨줘야 하는 값(pdf 참조)
            document.getElementById('noIntOpt').value = paymentMethod + possiCardNum + fixedIntNum;
            
        }
    }
    
    function noIntYNonChange(){
        var noIntYN = document.getElementById('noIntYN').value;
        var paymentMethod = "CC";
        var possiCardNum = document.getElementById('possiCard').value;
        var fixedIntNum = document.getElementById('fixedInt').value;
        
        if( noIntYN == 'N' ){
            document.getElementById('noIntOpt').value = "";
            
        } else if( possiCardNum == '' || fixedIntNum == '' ){
            document.getElementById('noIntOpt').value = "";
            
        } else {
            // 무이자 할부를 선택함에 따라 넘겨줘야 하는 값(pdf 참조)
            document.getElementById('noIntOpt').value = paymentMethod + possiCardNum + fixedIntNum;
            
        }
    }
    
    function maxIntChange(){
        //최대할부개월에 따라서 고정할부개월의 선택 가능 범위 조정
        
    }
    
</script>
<%-- kakaoPay script 끝--%>

<%-- kicc isp script 시작--%>
<c:if test="${CST_PLATFORM eq 'test'}">
<script type="text/javascript" src="http://testpg.easypay.co.kr/webpay/EasypayCard_Web.js" charset=UTF-8></script><!--test -->
<script language=javascript src="http://www.bankpay.or.kr/BankPayEFT_UTF8.js"></script>
</c:if>
<c:if test="${CST_PLATFORM ne 'test'}">
<script type="text/javascript" src="https://pg.easypay.co.kr/webpay/EasypayCard_Web.js" charset=UTF-8></script><!-- real-->
<script language=javascript src="https://www.bankpay.or.kr/BankPayEFT_UTF8_SSL.js"></script>
</c:if>

<script src="<c:out value="${cdnDomain}"/>/pc/js/jquery.validate.js"></script>

<script type="text/javascript">
var frm_pay = document.LGD_PAYINFO;

function f_card() 
{
    if( frm_pay.EP_product_amt.value < 50000 ) 
    {
        frm_pay.EP_install_period.value = "00";
        frm_pay.EP_noint_yn.value = "N";
    }
    else 
    {
        frm_pay.EP_install_period.value = frm_pay.install_period.value;
    }

    /* UTF-8 사용가맹점의 경우 EP_charset 값 셋팅 필수 */
    if( frm_pay.EP_charset.value == "UTF-8" ) 
    {
        // 한글이 들어가는 값은 모두 encoding 필수.
        frm_pay.EP_mall_nm.value      = encodeURIComponent( frm_pay.EP_mall_nm.value );
        frm_pay.EP_product_nm.value   = encodeURIComponent( frm_pay.EP_product_nm.value );
    }

    /* 가맹점에서 원하는 인증창 호출 방법을 선택 */
    /* iframe */
    easypay_card_webpay(frm_pay,"<c:out value="${serverDomain}"/>/pc/cart/v3d_req.do","hiddenifr","0","0","iframe",30);
    /* popup  */
    //easypay_card_webpay(frm_pay,"./card_req_popup.jsp","hiddenifr","","","popup",30);
    /* submit */
    //easypay_card_webpay(frm_pay,"./card_req.jsp","hiddenifr","0","0","submit",30);
}

function f_submit()
{
    // 정상("0000") 일 때 승인요청페이지로 이동.
    if( frm_pay.EP_res_cd.value == "0000" )
    {
        if( frm_pay.EP_charset.value == "UTF-8" )
        {
            // 한글이 들어가는 값은 모두 encoding 필수.
            frm_pay.EP_mall_nm.value      = decodeURIComponent( frm_pay.EP_mall_nm.value );
            frm_pay.EP_product_nm.value   = decodeURIComponent( frm_pay.EP_product_nm.value );
        }
        
        frm_pay.target = "_self";
        frm_pay.action = "<c:out value="${serverDomain}"/>/pc/cart/payment.do";
        isSubmit = true;
        frm_pay.submit();
    }
}

// 계좌이체
function f_account_submit() {
    /* 금결원 전자지갑 플러그인 설치 확인 */
    if( document.BankPayEFT == null || document.BankPayEFT.object == null )
    {
    	alert("금결원 전자지갑 플러그인이 설치되지 않았습니다." );
        return false;
    }
    
    frm_pay.target = "_self";
    frm_pay.action = "<c:out value="${serverDomain}"/>/pc/cart/payment.do";
    
    //bankpay 결제모듈 닫으면 selectbox, radio, checkbox 초기화되는 버그 막기 위한 스크립트..
    /* $("input[type=radio]:checked").each(function(){
    	$(this).parent().parent().find("input[type=radio]").removeAttr("checked");
    	$(this).prop("checked",true);
    	$(this).attr("checked","checked");
    });
    $("input[type=checkbox]:checked").each(function(){
    	$(this).prop("checked",true);
    	$(this).attr("checked","checked");
    });
    $("input[type=checkbox]:unchecked").each(function(){
    	$(this).prop("checked",false);
    	$(this).removeAttr("checked");
    });
    $("select option:selected").each(function(){
    	var value = $(this).val();
    	if(value != ""){
    		$(this).siblings().removeAttr("selected");
    		$(this).prop("selected",true);
        	$(this).attr("selected","selected");
    	}
    }); */
    
    payRequestLink( frm_pay );
}


</script>
<%-- kicc isp script 끝--%>

<%-- LGU+ xpay script 시작-
<!--  UTF-8 인코딩 사용 시는 xpay.js 대신 xpay_utf-8.js 을  호출하시기 바랍니다.-->
<c:if test="${CST_PLATFORM eq 'test'}">
<script type="text/javascript" src="<%=request.getScheme()%>://xpay.uplus.co.kr<%=request.getScheme().equals("https")?":7443":":7080"%>/xpay/js/xpay_ub_utf-8.js"></script>
<script language="javascript" src="http://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
</c:if>
<c:if test="${CST_PLATFORM ne 'test'}">
<script type="text/javascript" src="<%=request.getScheme()%>://xpay.uplus.co.kr/xpay/js/xpay_ub_utf-8.js"></script>
<script language="javascript" src="http://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
</c:if>
<%-- LGU+ xpay script 끝--%>

<script type="text/javascript">

var ORD_MST_CD = "${ORD_MST_CD}";

<%-- 재주문인 경우 마일리지 재계산 필요 --%>
<c:if test="${not empty cartlist[0].ORD_TMP_PRE_CD}">
	<c:if test="${not empty PRE_USED_MLG && PRE_USED_MLG gt 0}">
		mileageDiscountAjax("${PRE_USED_MLG}");
	</c:if>
</c:if>

// 주문 실행
function paymentPrepare(){
	
	var CRD_INF_IDX = "";
	var CARD_REQ_TYPE = "";
	
	if(!isSubmit){
	var radioPayment = "";
	$("input[name=radioPayment]").each(function(){
		if($(this).attr("checked")){
			radioPayment = $(this).val();
		}
	});
	
	//-- [BEGIN] 유효성검사
	 // 폼체크
   $("#LGD_PAYINFO").validate({
       rules: {
       	ORD_MST_ORD_NM : {required:true}, //주문자 이름
       	ORD_MST_HP1:{required:true},	// 핸드폰번호 앞자리
       	ORD_MST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
       	ORD_MST_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
           EMAIL_ID:{required:true}, // 이메일 아이디
           EMAIL_DOMAIN:{required:true, emailDomain:true}, // 이메일 도메인
           ORD_DLV_NM : {required:true}, //수령자 이름
           ORD_DLV_HP1:{required:true},	// 핸드폰번호 앞자리
       	ORD_DLV_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
       	ORD_DLV_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
       	ORD_DLV_TEL1:{required:{depends:function(){
               if($("#ORD_DLV_TEL2").val() != "" || $("#ORD_DLV_TEL3").val() != ""){
              	 return true;
               }else{
              	 return false;
               }	 
	        }}},
       	ORD_DLV_TEL2:{required:{depends:function(){
                if($("#ORD_DLV_TEL1").val() != "" || $("#ORD_DLV_TEL3").val() != ""){
               	 return true;
                }else{
               	 return false;
                }	 
	        }}, number:true, maxlength:4}, 
	       ORD_DLV_TEL3:{required:{depends:function(){
              if($("#ORD_DLV_TEL1").val() != "" || $("#ORD_DLV_TEL2").val() != ""){
             	 return true;
              }else{
             	 return false;
              }	 
	        }}, number:true, maxlength:4},
       	ORD_DLV_ZIP_CDE5:{required:true, number:true}, // 우편번호
       	ORD_DLV_DRO_ADR1:{required:true}, // 도로명 본주소
       	ORD_DLV_DRO_ADR2:{required:true}, // 도로명 상세주소
       	ORD_DLV_JBN_ADR1:{required:true} // 지번 본주소
       },
       messages :{
       	ORD_MST_ORD_NM : {required:"주문하시는분 성명을 반드시 입력해 주십시오."}, 
       	ORD_MST_HP1: {required:"주문자 휴대폰 번호 첫자리를 입력해주십시오."},
       	ORD_MST_HP2: {required:"주문자 휴대폰 번호 중간자리를 입력해주십시오." ,minlength:"[주문자 휴대폰 번호 중간자리]최소 3글자 이상입니다." , maxlength:"[주문자 휴대폰 번호 중간자리]최대 4글자입니다."},
       	ORD_MST_HP3: {required:"주문자 휴대폰 번호 끝자리를 입력해주십시오." ,minlength:"[주문자 휴대폰 번호 끝자리]최소 4글자 이상입니다." , maxlength:"[주문자 휴대폰 번호 끝자리]최대 4글자입니다."},
           EMAIL_ID : {required:"[이메일]아이디를 반드시 입력해 주십시오."},
           EMAIL_DOMAIN : {required:"[이메일]도메인을 반드시 입력해 주십시오.", emailDomain:"[이메일]도메인 형식을 올바르게 입력해 주십시오."},
           ORD_DLV_NM : {required:"받으시는분 성명을 반드시 입력해 주십시오."}, 
           ORD_DLV_HP1: {required:"수령자 휴대폰 번호 첫자리를 입력해주십시오."},
       	ORD_DLV_HP2: {required:"수령자 휴대폰 번호 중간자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 중간자리]최소 3글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 중간자리]최대 4글자입니다."},
       	ORD_DLV_HP3: {required:"수령자 휴대폰 번호 끝자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 끝자리]최소 4글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 끝자리]최대 4글자입니다."},
       	ORD_DLV_TEL1: {required:"수령자 전화 번호 첫자리를 입력해주십시오."},
       	ORD_DLV_TEL2: {required:"수령자 전화 번호 중간자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 중간자리]최대 4글자입니다."},
       	ORD_DLV_TEL3: {required:"수령자 전화 번호 끝자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 끝자리]최대 4글자입니다."},
       	ORD_DLV_ZIP_CDE5: {required:"[우편번호]필수 정보입니다."},
       	ORD_DLV_DRO_ADR1: {required:"[도로명주소]필수 정보입니다."},
       	ORD_DLV_DRO_ADR2: {required:"[도로명 상세주소]필수 정보입니다."},
       	ORD_DLV_JBN_ADR1: {required:"[지번주소]필수 정보입니다."}
       }
       //,ignore: ":hidden"
       ,onkeyup:false
	   ,onclick:false
	   ,onfocusout:false
       ,showErrors:function(errorMap, errorList){
	       if(this.numberOfInvalids()) { 
	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
	    	   //alert('[' + caption + '] ' + errorList[0].message);
	    	   var errorOobjId = $(errorList[0].element).attr('id');
	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
	    	   caption = caption.replace('*','').replace(/\s/gi,'');
	    	   if(caption != null && caption != "") 
	    	   {
	    	       alert('[' + caption + '] ' + errorList[0].message);
	    	   }
	    	   else
	    	   {
	    	       alert(errorList[0].message);
	    	   }
	    	   $(errorList[0].element).focus();
	       }
	   }
   });
	
   if($("#LGD_PAYINFO").valid()){
   	$("#ORD_MST_MAIL").val($.trim($('#EMAIL_ID').val()) + "@" + $.trim($('#EMAIL_DOMAIN').val()));
   }else{
   	return;
   }
   
	// 0원 결제 체크
	var cart_total = $("#span_cart_total").text();
	
	// 할부개월 초기화
   $("#install_period").val("00");
   
   // 현금영수증 값 초기화
   $("#EP_cash_yn").val("0");
   $("#EP_cash_issue_type").val("");
   $("#EP_cash_auth_type").val("");
   $("#EP_cash_auth_value").val("");
	
	if(cart_total != "0"){
		// 겟잇나우 유효성 체크
		<c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD}"><%-- 겟잇나우인 경우 --%>
			if($("input[name=ORD_GET_GBN]:checked").val() == "1"){
				if($("#ORD_GET_NM").val() == ""){
			   		alert("인수자명을 입력하세요.");
			   		$("#ORD_GET_NM").focus();
			   		return;
			   	}
				
				if($("#ORD_GET_TEL1").val() == ""){
			   		alert("인수자 휴대폰 번호 첫째자리를 입력하세요.");
			   		$("#ORD_GET_TEL1").focus();
			   		return;
			   	}
				
				if($("#ORD_GET_TEL2").val() == ""){
			   		alert("인수자 휴대폰 번호 둘째자리를 입력하세요.");
			   		$("#ORD_GET_TEL1").focus();
			   		return;
			   	}
				
				if($("#ORD_GET_TEL3").val() == ""){
			   		alert("인수자 휴대폰 번호 셋째자리를 입력하세요.");
			   		$("#ORD_GET_TEL3").focus();
			   		return;
			   	}
				
				if($("#ORD_GET_RLT").val() == ""){
			   		alert("주문자와의 관계를 선택해주세요.");
			   		$("#ORD_GET_RLT").focus();
			   		return;
			   	}
			}
		</c:if>
		
		// 현금영수증 부모 li
		   var $li = $(".pay-way_"+radioPayment);
		   var $cash_auth_value_hp1 = $li.find("select[name='cash_auth_value_hp1']");
			var $cash_auth_value_hp2 = $li.find("input[name='cash_auth_value_hp2']");
			var $cash_auth_value_hp3 = $li.find("input[name='cash_auth_value_hp3']");
			var $cash_auth_value_company1 = $li.find("input[name='cash_auth_value_company1']");
			var $cash_auth_value_company2 = $li.find("input[name='cash_auth_value_company2']");
			var $cash_auth_value_company3 = $li.find("input[name='cash_auth_value_company3']");
			
			// 현금영수증 유효성 체크 여부
			var isCashReceiptCheck = false;
		   
		   // 결제수단별 유효성 검사
		   if(radioPayment == "${Code.PAY_CARD}"){//신용카드
		   	if($("#EP_card_cd1").val() == ""){
		   		alert("카드를 선택해주세요.");
		   		return;
		   	}
		   
		   	if($("input[name='EP_noint1']:checked").val() == "00"){//일시불or일반할부인 경우
		   		if($("input[name='EP_noint1']:checked").hasClass("interest")){//일반할부
		   			if($("#noFreeInterestList").val() == ""){
		   				alert("일반할부 개월수를 선택해주세요.");
		   				return;
		   			}
		   			$("#install_period").val($("#noFreeInterestList").val());
		   		}
		   	}else{//무이자할부인 경우
		   		if($("#freeInterestList").val() == ""){
						alert("무이자 할부 개월수를 선택해주세요.");
						return;
					}
		   		$("#install_period").val($("#freeInterestList").val());
		   	}
		   	
		   	CRD_INF_IDX = $("#EP_card_cd1").find("option:selected").data("crd_inf_idx");
		   	CARD_REQ_TYPE = $("#EP_card_cd1 option:selected").data("req_type");
		   	$("#EP_card_cd").val($("#EP_card_cd1").val());
		   	$("#EP_noint").val($("input[name='EP_noint1']:checked").val());
		   	
		   }else if(radioPayment == "${Code.PAY_FOREIGN_CARD}"){//해외카드
			   if($("#EP_card_cd2").val() == ""){
			   		alert("카드를 선택해주세요.");
			   		return;
			   	}
		   
			CRD_INF_IDX = $("#EP_card_cd2").find("option:selected").data("crd_inf_idx");
			CARD_REQ_TYPE = $("#EP_card_cd2 option:selected").data("req_type");
			$("#EP_card_cd").val($("#EP_card_cd2").val());
			$("#EP_noint").val($("input[name='EP_noint2']:checked").val());
		    
		   }else if(radioPayment == "${Code.PAY_ACCOUNT}"){//실시간계좌이체
		   	isCashReceiptCheck = true;
		   }else if(radioPayment == "${Code.PAY_DEPOSIT}"){//무통장 입금
		   	isCashReceiptCheck = true;
		   
		   	if($("#EP_bank_cd").val() == ""){
		   		alert("입금은행을 선택해주세요.");
		   		return;
		   	}
		   	
		   	if($("#ORD_MST_DPS_NM").val() == ""){
		   		alert("입금자명을 입력해주세요.");
		   		$("#ORD_MST_DPS_NM").focus();
		   		return;
		   	}
		   	
		   }else if(radioPayment == "${Code.PAY_ESCROW}"){//에스크로
		   	isCashReceiptCheck = true;
		   
		   	if($("#EP_bank_cd").val() == ""){
		   		alert("입금은행을 선택해주세요.");
		   		return;
		   	}
		   	
		   	if($("#ORD_MST_DPS_NM").val() == ""){
		   		alert("입금자명을 입력해주세요.");
		   		$("#ORD_MST_DPS_NM").focus();
		   		return;
		   	}
		   	
		   	// 에스크로 구매동의 ORDER_CONFIRM
		   	var $escrowaAreement = $("#escrowaAreement");
		   	if( !$escrowaAreement.is(":checked") ){
		   		alert('구매안전 서비스(에스크로) 이용약관에 동의해 주셔야 합니다.');
		   		$escrowaAreement.focus();
		   		return;
		   	}
		   }
		   
		   //현금영수증 체크
		   if(isCashReceiptCheck){
		   	if($li.find("input[name='cashReceipt']:checked").length == 0){
		   		alert("현금영수증 발급여부를 선택해주세요.");
		   		return;
		   	}else{
		   		if($li.find("input[name='cashReceipt']:checked").val() == "3"){//개인소득공제
		   			if($cash_auth_value_hp1.val() == ""){
		   				alert("현금영수증 휴대폰 번호 첫째자리를 입력해주세요.");
		   				return;
		   			}
		   		
		   			if($cash_auth_value_hp2.val() == ""){
		   				alert("현금영수증 휴대폰 번호 둘째자리를 입력해주세요.");
		   				$cash_auth_value_hp2.focus();
		   				return;
		   			}
		   			
		   			if($cash_auth_value_hp3.val() == ""){
		   				alert("현금영수증 휴대폰 번호 셋째자리를 입력해주세요.");
		   				$cash_auth_value_hp3.focus();
		   				return;
		   			}
		   			
		   			if(isNaN($cash_auth_value_hp1.val())){
		   				alert("[현금영수증 휴대폰 번호 첫째자리]숫자를 입력해주세요.");
		   				return;
		   			}
		   		
		   			if(isNaN($cash_auth_value_hp2.val())){
		   				alert("[현금영수증 휴대폰 번호 둘째자리]숫자를 입력해주세요.");
		   				$cash_auth_value_hp2.focus();
		   				return;
		   			}
		   			
		   			if(isNaN($cash_auth_value_hp3.val())){
		   				alert("[현금영수증 휴대폰 번호 셋째자리]숫자를 입력해주세요.");
		   				$cash_auth_value_hp3.focus();
		   				return;
		   			}
		   			
		   			$("#EP_cash_yn").val("1");
		   			$("#EP_cash_issue_type").val("01");
		   			$("#EP_cash_auth_type").val("3");
		   			$("#EP_cash_auth_value").val($.trim($cash_auth_value_hp1.val())+ $.trim($cash_auth_value_hp2.val()) + $.trim($cash_auth_value_hp3.val()));
		   		}else if($li.find("input[name='cashReceipt']:checked").val() == "4"){//사업자지출증빙
		   			if($cash_auth_value_company1.val() == ""){
		   				alert("현금영수증 사업자 번호 첫째자리를 입력해주세요.");
		   				$cash_auth_value_company1.focus();
		   				return;
		   			}
		   			if($cash_auth_value_company2.val() == ""){
		   				alert("현금영수증 사업자 번호 둘째자리를 입력해주세요.");
		   				$cash_auth_value_company2.focus();
		   				return;
		   			}
		   			if($cash_auth_value_company3.val() == ""){
		   				alert("현금영수증 사업자 번호 셋째자리를 입력해주세요.");
		   				$cash_auth_value_company3.focus();
		   				return;
		   			}
		   			
		   			if(isNaN($cash_auth_value_company1.val())){
		   				alert("[현금영수증 사업자 번호 첫째자리]숫자를 입력해주세요.");
		   				$cash_auth_value_company1.focus();
		   				return;
		   			}
		   			if(isNaN($cash_auth_value_company2.val())){
		   				alert("[현금영수증 사업자 번호 둘째자리]숫자를 입력해주세요.");
		   				$cash_auth_value_company2.focus();
		   				return;
		   			}
		   			if(isNaN($cash_auth_value_company3.val())){
		   				alert("[현금영수증 사업자 번호 셋째자리]숫자를 입력해주세요.");
		   				$cash_auth_value_company3.focus();
		   				return;
		   			}
		   			
		   			$("#EP_cash_yn").val("1");
		   			$("#EP_cash_issue_type").val("02");
		   			$("#EP_cash_auth_type").val("4");
		   			$("#EP_cash_auth_value").val($.trim($cash_auth_value_company1.val()) + $.trim($cash_auth_value_company2.val()) + $.trim($cash_auth_value_company3.val()));
		   		}else if($li.find("input[name='cashReceipt']:checked").val() == "N"){//신청안함
		   			$("#EP_cash_yn").val("0");
		   		}
		   	}
		 }
	}else{
		radioPayment = "${Code.PAY_MILEAGE}";
	}
    
	// 구매동의 ORDER_CONFIRM
	var $ORDER_CONFIRM = $("#ORDER_CONFIRM");
	if( !$ORDER_CONFIRM.is(":checked") ){
		alert('전자상거래법에 의거 주문상품, 결제금액 등 본 주문서의 내역을 확인하시고 이에 동의해 주셔야 합니다.');
		$ORDER_CONFIRM.focus();
		return;
	}
	//-- [END] 유효성검사
	
	// 묶음배송 배송일 지정시 기타 묶음 배송 상품도 배송일 변경
	$("input[id^=DLV_DUE_DT_]").each(function(){
		var vdr_idx = $(this).data("vdr_idx");
		var dlv_bundle_yn = $(this).data("dlv_bundle_yn");
		if(dlv_bundle_yn == "Y"){
			$(".DLV_DUE_DT_"+vdr_idx+"_"+dlv_bundle_yn).val($(this).val());
		}
	});
	
	if(confirm("주문임시저장 테스트를 진행하시겠습니까?")){
		$("input[name=cartResult]").val("Y");
	}
	//kicc 결제부분 주석처리
    	$.ajax
        ({
            async : false,
            type : "POST",
            data : {"ORD_MST_CD" : ORD_MST_CD
            			, "radioPayment" : radioPayment
            			, "EP_noint" : $("#EP_noint").val() /* 무이자 여부 */
            			, "CRD_INF_IDX" : CRD_INF_IDX /* 카드사 IDX */
            		  },
            url : "<c:out value="${serverDomain}" />/pc/cart/paymentPrepare.do",
            success : function (data) 
            { 
            	if(data.result == 0){
            		SessionStorage.setSessionStorage(ORD_MST_CD,data.StorageKey);//데이터 임시저장
            		
            		$('.LGD_FORM').remove();
            	    
    	        	var formtag = '';
    	        	
    	        	//var input_type = 'text';
    	        	var input_type = 'hidden';
    	        	
    	        	//공통 파라미터
    	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="ORD_MST_PAY_PRC"                  id="ORD_MST_PAY_PRC"		value="'+ data.CART_PAYMENT_TOTAL + '">';<%-- 총 결제금액 --%>
    	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CART_PAYMENT_DC_MILEAGE"                  id="CART_PAYMENT_DC_MILEAGE"		value="'+ data.CART_PAYMENT_DC_MILEAGE + '">';<%-- 총 사용 포인트 --%>
    	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CART_PAYMENT_DC_COUPON"                  id="CART_PAYMENT_DC_COUPON"		value="'+ data.CART_PAYMENT_DC_COUPON + '">';<%-- 총 사용 쿠폰 --%>
    	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CART_PAYMENT_DC_CASHBAG"                  id="CART_PAYMENT_DC_CASHBAG"		value="'+ data.CART_PAYMENT_DC_CASHBAG + '">';<%-- 총 사용 캐쉬백 --%>
    	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="ORD_MST_ORD_TYPE"              id="ORD_MST_ORD_TYPE"		value="'+ "${Code.MEMBER_JOIN_TYPE_PC}" + '">';<%-- 주문 매체 --%>
    	        	
    	        	// 결제수단별 파라미터 셋팅
    	        	if(radioPayment == "${Code.PAY_CARD}" 
    	        	  || radioPayment == "${Code.PAY_ACCOUNT}"  
    	        	  || radioPayment == "${Code.PAY_DEPOSIT}" 
            		  || radioPayment == "${Code.PAY_ESCROW}" 
           			  || radioPayment == "${Code.PAY_FOREIGN_CARD}"
    	        	  ){ // 신용카드/계좌이체/무통장입금/에스크로 - kicc
    	        		
    	        		// 상품명에 특수문자는 없애야한다.
    	        		var rep_product_name = "<c:out value="${rep_product_name}"/>";
    	        		var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
    	        		
    	        		if(regExp.test(rep_product_name)){
    	        		      //특수문자 제거
    	        		      rep_product_name = rep_product_name.replace(regExp, "");
    	        		  }
    	        		
    	        		//공통 파라미터
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_tr_cd"                  id="EP_tr_cd"		value="">';<%-- 요청구분 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_pay_type"                  id="EP_pay_type"		value="'+ data.EP_pay_type + '">';<%-- 결제수단 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_tot_amt"                  id="EP_tot_amt"		value="'+ data.EP_tot_amt + '">';<%-- 총결제금액 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_currency"                  id="EP_currency"		value="00">';<%-- 통화코드[원화 : 00, 달러 : 01] --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_escrow_yn"                  id="EP_escrow_yn"		value="'+ data.EP_escrow_yn +'">';<%-- 에스크로 사용유무 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_complex_yn"                  id="EP_complex_yn"		value="N">';<%-- 복합결제 사용유무 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_order_no"                  id="EP_order_no"		value="'+ data.EP_order_no +'">';<%-- 가맹점 주문번호 --%>
    		        	
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="product_nm"                  id="product_nm"		value="'+ rep_product_name +'">';<%-- 상품명 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_product_nm"                  id="EP_product_nm"		value="'+ rep_product_name +'">';<%-- 상품명 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_product_amt"                  id="EP_product_amt"		value="'+ data.EP_product_amt +'">';<%-- 상품금액 --%>
    		        	
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="user_phone2"                  id="user_phone2"		value="'+ $('#ORD_MST_HP1').val()+$('#ORD_MST_HP2').val()+$('#ORD_MST_HP3').val() +'">';<%-- 고객 휴대폰번호 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_phone2"                  id="EP_user_phone2"		value="'+ $('#ORD_MST_HP1').val()+$('#ORD_MST_HP2').val()+$('#ORD_MST_HP3').val() +'">';<%-- 고객 휴대폰번호 --%>
    		        	
    	        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_mall_id"                  id="EP_mall_id"		value="'+ data.EP_mall_id + '">';<%-- 가맹점 mall id --%>
    	        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_mall_nm"                  id="EP_mall_nm"		value="마켓플랜트">';<%-- 가맹점명 --%>
    		        	
    	        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="user_mail"                  id="user_mail"		value="'+ $('#ORD_MST_MAIL').val() +'">';<%-- 구매자 이메일 --%>
    	        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_mail"                  id="EP_user_mail"		value="'+ $('#ORD_MST_MAIL').val() +'">';<%-- 구매자 이메일 --%>
    	        		
    		        		if(radioPayment == "${Code.PAY_CARD}" || radioPayment == "${Code.PAY_FOREIGN_CARD}"){
    		        		
    		        		var reqType = "1";
    		        		var req_type = CARD_REQ_TYPE;
    		        		
    		        		if(req_type != "ISP"){
    		        			reqType = "2";
    		        		}
    		        		
    		        		// 1. ISP / 안심클릭 구분
    		        		// 2. ISP 파라미터 셋팅
    		        		// 2. 안심클릭 파라미터 셋팅
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_pgid"                  id="EP_kvp_pgid"		value="A0042">';<%--[선택]ISP PGID --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_charset"                  id="EP_charset"		value="UTF-8">';<%-- charset --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_client_version"                  id="EP_client_version"		value="">';<%-- 모듈 버전 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kmotion_useyn"                  id="EP_kmotion_useyn"		value="Y">';<%-- 국민 앱카드 결제화면 노출여부(Y:앱카드결제 노출) --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_buss_no"                  id="EP_buss_no"		value="">';<%-- [선택]가맹점 사업자번호 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_card_join_no"                  id="EP_card_join_no"		value="">';<%-- [선택]카드사 가맹점 번호 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_cardcode"                  id="EP_kvp_cardcode"		value="">';			<%-- [선택]KVP 카드정보 --%>        
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_sessionkey"                  id="EP_kvp_sessionkey"		value="">';		<%-- [선택]KVP 암호화키 --%>        
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_encdata"                  id="EP_kvp_encdata"		value="">';			<%-- [선택]KVP 암호화전문 --%>      
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_payset_flag"                  id="EP_kvp_payset_flag"		value="">';		<%-- [선택]KVP 포인트플래그 --%>    
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_using_point"                  id="EP_kvp_using_point"		value="">';		<%-- [선택]KVP 포인트 사용금액 --%> 
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vp_ret_save_point"                  id="EP_vp_ret_save_point"		value="">';	<%-- [선택]KVP 세이브 결제 유무 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_quota"                  id="EP_kvp_quota"		value="">';			<%-- [선택]KVP 할부개월 --%>        
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_noint"                  id="EP_kvp_noint"		value="">';			<%-- [선택]KVP 무이자여부 --%>      
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_card_prefix"                  id="EP_kvp_card_prefix"		value="">';		<%-- [선택]카드 BIN(6자리) --%>
    		        		
    		        		<%-- 카드결제종류(수정불가) --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_req_type"                  id="EP_req_type"		value="'+ reqType + '">';
    		        		<%-- 신용카드 결제금액 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_card_amt"                  id="EP_card_amt"		value="'+ data.EP_tot_amt +'">';
    		        		<%-- 할부개월 --%> 
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_install_period"                  id="EP_install_period"		value="">';
    		        		
    		        		<%-- 가맹점 필드 --%>
    		        		/* formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define1"                  id="EP_user_define1"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define2"                  id="EP_user_define2"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define3"                  id="EP_user_define3"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define4"                  id="EP_user_define4"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define5"                  id="EP_user_define5"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define6"                  id="EP_user_define6"		value="">'; */
    		        		
    		        		//MPI
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_return_url"                  id="EP_return_url"		value="'+ data.EP_return_url +'">';<%-- mpi 리턴 url --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_expire_date"                  id="EP_expire_date"		value="">';<%-- 유효기간 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_noint_yn"                  id="EP_noint_yn"		value="">';<%-- 무이자 여부 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_save_useyn"                  id="EP_save_useyn"		value="N">';<%-- 세이브 여부 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_lang_flag"                  id="EP_lang_flag"		value="KOR">';<%-- 언어 구분 --%>
    		        		
    		        		//MPI 응답 파라미터
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_res_cd"                  id="EP_res_cd"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_res_msg"                  id="EP_res_msg"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_ret_save_used"                  id="EP_ret_save_used"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_ret_save_kind"                  id="EP_ret_save_kind"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_card_no"                  id="EP_card_no"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_cavv"                  id="EP_cavv"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_eci"                  id="EP_eci"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_xid"                  id="EP_xid"		value="">';
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_cno"                  id="EP_cno"		value="">';
    		        		
    		        	}else if(radioPayment == "${Code.PAY_DEPOSIT}"){
    		        		//무통장 입금
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_txtype"                  id="EP_vacct_txtype"		value="'+ data.EP_vacct_txtype +'">';<%-- 처리종류 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_amt"                  id="EP_vacct_amt"		value="'+ data.EP_tot_amt +'">';<%-- 결제금액 --%>
    			        	<%-- formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bank_cd"                  id="EP_bank_cd"		value="'+ data.EP_bank_cd +'">';입금은행 코드 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_expire_date"                  id="EP_expire_date"		value="<c:out value="${EP_expire_date}"/>">';<%-- 만료일자 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_expire_time"                  id="EP_expire_time"		value="235959">';<%-- 만료시간 --%>
    			        	
    		        	}else if(radioPayment == "${Code.PAY_ESCROW}"){
    		        		//에스크로
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_txtype"                  id="EP_vacct_txtype"		value="'+ data.EP_vacct_txtype +'">';<%-- 처리종류 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_amt"                  id="EP_vacct_amt"		value="'+ data.EP_tot_amt +'">';<%-- 결제금액 --%>
    		        		
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_escr_type"                  id="EP_escr_type"		value="K">';<%-- 에스크로 타입 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bk_cnt"                  id="EP_bk_cnt"		value="'+ data.EP_bk_cnt +'">';<%-- 장바구니 건수 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bk_totamt"                  id="EP_bk_totamt"		value="'+ data.EP_product_amt +'">';<%-- 장바구니 총금액 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bk_goodinfo"                  id="EP_bk_goodinfo"		value="'+ data.EP_bk_goodinfo +'">';<%-- 장바구니 정보 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_recv_nm"                  id="EP_recv_nm"		value="'+ $('#ORD_MST_ORD_NM').val() +'">';<%-- 구매자명(주문자) --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_recv_mob"                  id="EP_recv_mob"		value="'+ $('#ORD_MST_HP1').val() + $('#ORD_MST_HP2').val() + $('#ORD_MST_HP3').val() +'">';<%-- 구매자 휴대폰번호 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_recv_mail"                  id="EP_recv_mail"		value="'+ $('#ORD_MST_MAIL').val() +'">';<%-- 구매자 이메일 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_end_date"                  id="EP_vacct_end_date"		value="<c:out value="${EP_expire_date}"/>">';<%-- 만료일자 --%>
    			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_end_time"                  id="EP_vacct_end_time"		value="235959">';<%-- 만료시간 --%>
    		        	}else if(radioPayment == "${Code.PAY_ACCOUNT}"){
    		        		var today = new Date();
    		        		var time  = today.getTime();
    		        		var serial_no = time.toString().substr(time.toString().length-7, 7);
    		        		
    		        		//계좌이체
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_acnt_txtype"                  id="EP_acnt_txtype"		value="20">';<%-- 처리종류 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_acnt_amt"                  id="EP_acnt_amt"		value="'+ data.EP_tot_amt +'">';<%-- 계좌이체 결제금액 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_pre_msg_type"                  id="hd_pre_msg_type"		value="EFT">';<%-- [필수]전자 지갑의 결제 유형을 설정한다. EFT로 고정 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_msg_code"                  id="hd_msg_code"		value="0200">';<%-- [필수]0200 : 승인 요청 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_msg_type"                  id="hd_msg_type"		value="EFT">';<%-- [필수]계좌이체는 EFT로 입력 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_ep_type"                  id="hd_ep_type"		value="'+ data.hd_ep_type +'">';<%-- [필수]SECUCERT 고정로 입력 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_pi"                  id="hd_pi"		value="">';<%-- [필수]공백으로 고정 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_approve_no"                  id="hd_approve_no"		value="'+ data.hd_approve_no +'">';<%-- [필수]업체의 승인 번호 : KICC로 부터 부여받은 금융결제원 승인번호  --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_serial_no"                  id="hd_serial_no"		value="'+ serial_no +'">';<%-- [필수] 당일 unique 한 값(가맹점 세팅후 관리 해아합니다) --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_firm_name"                  id="hd_firm_name"		value="마켓플랜트">';<%-- [필수]전자지갑에 표시될 기관명을 세팅한다. --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="tx_amount"                  id="tx_amount"		value="'+ data.EP_tot_amt +'">';<%-- [필수]실제로 결제할 금액을 기입한다. --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_input_option"                  id="hd_input_option"		value="22">';<%-- [필수]전자지갑 숫자표시 옵션(수정불가) --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_ep_option"                  id="hd_ep_option"		value="222">';<%-- [필수]전자지갑 숫자표시 옵션(수정불가) --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="hd_timeout_yn"                  id="hd_timeout_yn"		value="N">';<%-- [필수]전자지갑 타임아웃 설정: 거래 없이 일정시간 지나면 종료되도록 하는 옵션임 --%>
    		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="tx_email_addr"                  id="tx_email_addr"		value="'+ $('#ORD_MST_MAIL').val() +'">';<%-- 결제내역이 전송될 이메일주소 : DB에서 고객의 이메일주소를 불러와서 쓸 경우에만 입력, 기본적으로는 사용자가 전자지갑에서 입력하도록 되어있음 --%>
    		        	}
    		        <%-- 	
    	        	}else if(radioPayment == "${Code.PAY_PAYNOW}"){//페이나우
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CST_PLATFORM"                id="CST_PLATFORM"		value="'+ data.CST_PLATFORM + '">';테스트, 서비스 구분                   
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CST_MID"                     id="CST_MID"		value="'+ data.CST_MID + '">';상점아이디
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_MID"                     id="LGD_MID"		value="'+ data.LGD_MID + '">';상점아이디
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_OID"                     id="LGD_OID"		value="'+ data.LGD_OID + '">';주문번호
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_PRODUCTINFO"             id="LGD_PRODUCTINFO"	value="<c:out value="${rep_product_name}"/>">';상품정보
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_AMOUNT"                  id="LGD_AMOUNT"		value="'+ data.LGD_AMOUNT + '">';결제금액
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_CUSTOM_SKIN"             id="LGD_CUSTOM_SKIN" 	value="'+ data.LGD_CUSTOM_SKIN + '">';결제창 SKIN
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_WINDOW_VER"              id="LGD_WINDOW_VER" 	value="'+ data.LGD_WINDOW_VER + '">';결제창 버젼정보
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_CUSTOM_PROCESSTYPE"      id="LGD_CUSTOM_PROCESSTYPE"	value="'+ data.LGD_CUSTOM_PROCESSTYPE + '">';트랜잭션 처리방식
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_TIMESTAMP"               id="LGD_TIMESTAMP"		value="'+ data.LGD_TIMESTAMP + '">';타임스탬프
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_HASHDATA"                id="LGD_HASHDATA"		value="'+ data.LGD_HASHDATA + '">';MD5 해쉬암호값
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_PAYKEY"                  id="LGD_PAYKEY">';      LG유플러스 PAYKEY(인증후 자동셋팅)
    		        	
    		        	/* 논액티브엑스 수정 파라미터*/
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_VERSION"         	    id="LGD_VERSION"		value="JSP_SmartXPay_1.0">';
    		        	
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_BUYERIP"                 id="LGD_BUYERIP"		value="'+ data.LGD_BUYERIP + '">';구매자IP
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_CASNOTEURL"              id="LGD_CASNOTEURL"		value="'+ data.LGD_CASNOTEURL + '">';가상계좌 NOTEURL
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_CLOSEDATE"              id="LGD_CLOSEDATE"		value="<c:out value="${LGD_CLOSEDATE}"/>">';가상계좌 마감시한
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_CUSTOM_FIRSTPAY"              id="LGD_CUSTOM_FIRSTPAY"		value="'+ $(':radio[name="radioPayment"]:checked').val() + '">';결제 수단
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_CUSTOM_USABLEPAY"              id="LGD_CUSTOM_USABLEPAY"		value="'+ $(':radio[name="radioPayment"]:checked').val() + '">';결제 수단
    		        	
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_ACCOUNTOWNER"              id="LGD_ACCOUNTOWNER"		value="'+ $('#ORD_MST_ORD_NM').val() +'">';입금자명
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_BANKCODE"              id="LGD_BANKCODE"		value="'+ $('#EP_bank_cd').val() +'">';은행코드
    		        	
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_BUYEREMAIL"              id="LGD_BUYEREMAIL"		value="'+ $('#ORD_MST_MAIL').val() +'">';구매자 이메일
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_BUYER"                   id="LGD_BUYER"		value="'+ $('#ORD_MST_ORD_NM').val() +'">';구매자
    		        	
    		        	<c:if test="${ user.ROLE_USER eq 'user' }">
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_BUYERID"                 id="LGD_BUYERID"		value="<c:out value="${user.MEM_MST_MEM_ID }"/>">';구매자ID
    		        	</c:if>
    		        	<c:if test="${ user.ROLE_USER ne 'user' }">
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_BUYERID"                 id="LGD_BUYERID"		value="_GUEST_">';구매자ID
    		        	</c:if>
    		        	
    		        	/* 논액티브엑스 추가 파라미터 */
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_RETURNURL"                 id="LGD_RETURNURL"		value="<c:out value="${serverDomain}"/>/pc/cart/paymentReqReturnPopup.do">';return url
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_ENCODING"                 id="LGD_ENCODING"		value="UTF-8">';인코딩
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_ENCODING_NOTEURL"                 id="LGD_ENCODING_NOTEURL"		value="UTF-8">';인코딩
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_ENCODING_RETURNURL"                 id="LGD_ENCODING_RETURNURL"		value="UTF-8">';인코딩
    		        	
    		        	/* 페이나우 테스트 */
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="LGD_EASYPAY_ONLY"                 id="LGD_EASYPAY_ONLY"		value="PAYNOW">';
    	        	 --%>
    	        	}else if(radioPayment == "${Code.PAY_KAKAOPAY}"){
    	        		//[BEGIN] 카카오 페이 인증 요청을 위한 파라미터 셋팅
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="prType"                  id="prType"		value="'+ data.prType + '">';<%-- 결제요청타입 WPM(WEB 결제) / MPM(Mobile 결제) --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="MID"                id="MID"		value="'+ data.MID + '">';<%-- 가맹점 ID --%>                   
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="Moid"                     id="Moid"		value="'+ data.Moid + '">'<%-- 가맹점 거래번호 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="GoodsName"             id="GoodsName"	value="<c:out value="${rep_product_name}"/>">';<%-- 상품정보 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="Amt"                  id="Amt"		value="'+ data.Amt + '">';<%-- 결제금액 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="currency"             id="currency" 	value="'+ data.currency + '">';<%-- 거래통화 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="certifiedFlag"              id="certifiedFlag" 	value="'+ data.certifiedFlag + '">';<%-- 인증구분값 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="channelType"      id="channelType"	value="'+ data.channelType + '">';<%-- 채널타입 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="possiCard"               id="possiCard"		value="">';<%-- 결제가능카드 설정 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EncryptData"               id="EncryptData"		value="'+ data.EncryptData + '">';<%-- 해쉬 값 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="requestDealApproveUrl"               id="requestDealApproveUrl"		value="'+ data.requestDealApproveUrl + '">';<%--requestDealApproveUrl  --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="PayMethod"               id="PayMethod"		value="'+ data.PayMethod + '">';<%-- 결제수단 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EdiDate"               id="EdiDate"		value="'+ data.EdiDate + '">';<%-- ediDate --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="GoodsCnt"               id="GoodsCnt"		value="1">';<%-- 상품 개수 1 고정--%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="AuthFlg"               id="AuthFlg"		value="'+ data.AuthFlg + '">';<%-- 카카오는 10으로 고정 --%>
    		        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="BuyerName"                   id="BuyerName"		value="'+ $('#ORD_MST_ORD_NM').val() +'">';<%-- 구매자 --%>
    		        	//[END] 카카오 페이 인증 요청을 위한 파라미터 셋팅
    	        	}else if(radioPayment == "${Code.PAY_MILEAGE}"){//결제금액 0원
    	        		$("#radioPayment_0").prop("checked",true);
    	        	}
    	        	
    	        	$('#LGD_PAYINFO').append(formtag);
    	        	
    	        	if(radioPayment == "${Code.PAY_CARD}" || radioPayment == "${Code.PAY_FOREIGN_CARD}"){//신용카드인 경우
    	        		f_card();
    	        	}else if(radioPayment == "${Code.PAY_ACCOUNT}"){//계좌이체인 경우
    	        		f_account_submit();
    	        	}else if(radioPayment == "${Code.PAY_KAKAOPAY}"){//카카오페이
    	        		getTxnId();
            		}else{
            			isSubmit = true;
    	        		$("#LGD_PAYINFO").attr({"action":"<c:out value="${serverDomain}" />/pc/cart/payment.do", "method":"post", "target":"_self"}).submit();
    	        	}
            	}else if(data.result == -999){
            		alert(data.resultMsg);
            		location.replace("<c:out value="${serverDomain}"/>/pc/manager/login.do");
            	}else if(data.result == -888){<%-- 결제금액 0 이하 --%>
                		alert(data.resultMsg);
            	}else{
            		alert(data.resultMsg);
            		location.replace("<c:out value="${serverDomain}"/>/pc/cart/cartlist.do");
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
        });
	
	}else{
		//alert("처리중입니다.");
		return;
	}
}
//-- PG 관련, 끝

$(function() {
	controlPaymentInfo();
	
	//무이자/일반할부 처음에 안보여준다.
	$("#freeInterestListLabel").next().next().hide();    
	$("#freeInterestListLabel").hide();
	$("#noFreeInterestListLabel").next().next().hide();   
	$("#noFreeInterestListLabel").hide();
	
	$(function(){
		//현금영수증 발급용도 변경시
		$(document).on("click", ".cashReceiptLabel", function(){
			$(".cashR").val("");
			$(".cashR").prop("disabled", true);
			
			//var $idx = $(this).val();
			var $idx = $(this).data("input_val");
			$("input:radio[name='cashReceipt']:radio[value="+$idx+"]").attr('checked', true); 
			if($idx == "3"){//개인소득공제
				$(".cashR"+$idx).prop("disabled", false);
				$(".private-cash-receipt").show();
				$(".company-cash-receipt").hide();
			}else if($idx == "4"){//사업자지출증빙
				$(".cashR"+$idx).prop("disabled", false);
				$(".private-cash-receipt").hide();
				$(".company-cash-receipt").show();
			}else{
				$(".private-cash-receipt").hide();
				$(".company-cash-receipt").hide();
			}
			
			com.sel_chg($("#cash_hp_"+"${c_cash_receipt_no }"), 'chg');
		});
	});
	
	// 무이자할부/일반할부 셀렉트 박스 선택시 라디오버튼 자동 체크
	$(document).on("click","#freeInterestList",function(){
		$("#monthly2").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
	});
	$(document).on("click","#noFreeInterestList",function(){
		$("#monthly3").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
	});
	
	// 일시불/무이자/일반할부 선택시 일반할부 추가설명 show/hide
	$(document).on("click",".epNointLabel",function(){
		if($(this).data("desc_yn") == "N"){
			//부분무이자 설명 remove
			$("#noFreeDesc").hide();
		}else{
			$("#noFreeDesc").show();
		}
	});
	
	// 결제인증결과
    payment_return = function(LGD_RESPCODE, LGD_RESPMSG, LGD_PAYKEY)
    {
        if (LGD_RESPCODE == "0000") 
        {
            document.getElementById("LGD_PAYKEY").value = LGD_PAYKEY;
            $("#LGD_PAYINFO").attr({"action":"<c:out value="${serverDomain}" />/pc/cart/payment.do", "method":"post", "target":"_self"}).submit();
            //document.getElementById('LGD_PAYINFO').submit();
       } 
       else 
       {
    	   alert(LGD_RESPMSG);
           closeIframe();
       }
    };
	
	// 결제수단별 안내 event 설정
	$(document).on("change",":radio[name='radioPayment']",function(){
		controlPaymentInfo();
	});
	
	// 현금영수증 신청/미신청
	$(document).on("change","input[name=cashreceiptUseYn]",function(){
		var cashreceiptUseYn = this.value;
		if(cashreceiptUseYn == "Y"){
			$("#cashreceiptTr").show();
			$("#cashreceiptTr input").prop("disabled",false);
		}else{
			$("#cashreceiptTr").hide();
			$("#cashreceiptTr input").prop("disabled",true);
		}
	});
	
	// [쿠폰] 전체 적용가능 쿠폰 선택시
	$(document).on("click",".dupCouponLabel",function(){
		var thisValue = $(this).data("input_val");
		$("input:radio[name=dupCoupon]:radio[value="+thisValue+"]").attr('checked', true); 
		$(".select_prd_cpn").each(function(){
			$(this).val(thisValue);
			com.sel_chg($(this), 'chg');
		});
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 상품 쿠폰 선택시
	$(document).on("click",".select_prd_cpn",function(){
		var $this = $(this);
		var isPass = true;
		/* $(".select_prd_cpn").each(function(){
			if($(this).val() != "" && $this.val() != ""){
				if($this.val() != $(this).val()){
					//기존 선택 쿠폰과 다른 경우에는 선택할 수 없다.
					isPass = false;
					return;
				}
			}
		});
		
		if(!isPass){
			alert("한 주문에는 하나의 쿠폰만 사용 가능합니다.");
			$this.val("");
			com.sel_chg($this, 'reset');
		} */
		
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 배송비 쿠폰 선택시
	$(document).on("click",".select_dlv_cpn",function(){
		var $this = $(this);
		var isPass = true;
		
		var selectedCnt = 0;
		$(".select_dlv_cpn").each(function(){
			if($(this).val() != ""){
				selectedCnt++;
			}
			
			if(selectedCnt > 1){
				isPass = false;
				return;
			}
		});
		
		if(!isPass){
			alert("배송비 쿠폰은 주문당 하나만 사용 가능합니다.");
			$this.val("");
			com.sel_chg($this, 'reset');
		}
	});
	
	// [포인트] blur 시 금액 계산
	$(document).on("blur","#toUseMileage",function(){
		var toUseMileage = $("#toUseMileage").val() =="" ? 0 : parseInt($("#toUseMileage").val());
		mileageDiscountAjax(toUseMileage);
	});
	
	// [포인트] 모두사용 체크시
	$(document).on("change","#allMileageUseChk",function(){
		if($(this).is(":checked")){
			if("${SOLUBLE_MILEAGE}" > 0){
				var toUseMileage = 999999999;
				mileageDiscountAjax(toUseMileage);
			}else{
				$(this).prop("checked",false);
			}
		}else{
			var toUseMileage = 0;
			mileageDiscountAjax(toUseMileage);
		}
	});
	
	// [OK캐쉬백] blur 시 금액 계산
	$(document).on("blur","#toUseCashbag",function(){
		var toUseCashbag = $("#toUseCashbag").val() =="" ? 0 : parseInt($("#toUseCashbag").val());
		cashbagDiscountAjax(toUseCashbag);
	});
	
	// [OK캐쉬백] 모두사용 체크시
	$(document).on("change","#allCashbagUseChk",function(){
		if($(this).is(":checked")){
			var toUseCashbag = 999999999;
			cashbagDiscountAjax(toUseCashbag);
		}else{
			var toUseCashbag = 0;
			cashbagDiscountAjax(toUseCashbag);
		}
	});
	
	// 이메일 도메인 select box 변경 이벤트
    $(document).on("click", "#emailDomainSelectbox", function () {
        var $obj = $("#EMAIL_DOMAIN");
        if($(this).val() == "")
        {
            $obj.prop("readonly", false);
            $obj.val("");
        }
        else
        {
            $obj.prop("readonly", true);
            $obj.val($(this).val());
        }
    });
	
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}"><%-- 장기할부가 아닌 경우에만! --%>
	// 신용카드 변경시 할부 목록 가져오기
    $(document).on("click", "#EP_card_cd1", function () {
        var crd_inf_idx = $(this).find("option:selected").data("crd_inf_idx");
        
        $(".interestList").html("<option value=\"\">선택</option>");
        com.sel_chg($("#freeInterestList"), 'chg');
        com.sel_chg($("#noFreeInterestList"), 'chg');
        
        //일시불로 리셋
		$("#EP_noint1").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
		var freeCnt = 0;
		var noFreeCnt = 0;
		//부분무이자 설명 remove
		$("#noFreeDesc").remove();
        
        if(crd_inf_idx != undefined){
        	
        	//삼성카드인 경우 카드사 포인트 사용 여부 SHOW
        	var CRD_INF_CD_NO = $(this).find("option:selected").val();
        	if(CRD_INF_CD_NO == "031"){
        		$("#li_samsung_pnt").show();
        	}else{
        		$("#EP_point_useyn").prop("checked",true).parent().addClass("on");
            	$("#EP_point_useyn1").prop("checked",false).parent().removeClass("on");
        		$("#li_samsung_pnt").hide();
        	}
        	
        	$.ajax({
        		type:"post",
        		url : "<c:out value="${serverDomain}" />/pc/cart/getCardInstallmentListAjax.do",
        		data : {"CRD_INF_IDX": crd_inf_idx
        				, "cart_total": $("#CART_TOTAL").val()
        				},
        		dataType : "json",
        		async : false,
        		success : function(data){
        			var list = data.list;
        			if(list != null){
        				$.each(list, function(i, item){
        					var interestListId = "noFreeInterestList";
        					if(item.DIV_INF_GBN == "${Code.CARD_DIV_TYPE_FREE_INTEREST}"){//무이자인 경우
        						interestListId = "freeInterestList";
        						freeCnt++;
        					}else{
        						noFreeCnt++;
        					}
        					
        					var html = "<option value=\""+ item.DIV_INF_MNT +"\" data-desc=\""+ item.DIV_INF_NTC +"\">"+ item.DIV_INF_MNT +"개월</option>";
        					$("#"+interestListId).append(html);
        					com.sel_chg($("#"+interestListId), 'chg');
        				});
        			}
        		},
        		error : function(err){
        			alert("오류가 발생하였습니다.\n[" + err.status + "]");
        		}
        	});
        }
        
        //무이자/일반할부 없으면 삭제한다.
		if(freeCnt === 0){
			$("#freeInterestListLabel").next().next().hide();    
			$("#freeInterestListLabel").hide();
		}else{
			$("#freeInterestListLabel").next().next().show();
			$("#freeInterestListLabel").show();
		}
		
		if(noFreeCnt === 0){
			$("#noFreeInterestListLabel").next().next().hide();   
			$("#noFreeInterestListLabel").hide();
		}else{
			$("#noFreeInterestListLabel").next().next().show();
			$("#noFreeInterestListLabel").show();
		}
    });
	</c:if>
	
	// 일반할부 선택시 해당 상세 보여주기
	$(document).on("click" ,"#noFreeInterestList", function(){
		var descHtml = "";
		if($(this).val() != ""){
			var desc = $(this).find("option:selected").data("desc");
			if(desc != null){
				descHtml = "<p class=\"message notice-c dotum desc\" id=\"noFreeDesc\">"+ desc +"</p>";
			}
		}
		$("#noFreeDesc").remove();
		$("#divInterest").append(descHtml);
	});
	
	SessionStorage.getSessionStorage("<c:out value="${ORD_MST_CD}"/>","<c:out value="${StorageKey}"/>");//결제 임시저장 데이터 노출
});

//LG UPLUS iframe
function launchCrossPlatform(){
	lgdwin = openXpay(document.getElementById('LGD_PAYINFO'), '${CST_PLATFORM}', 'iframe', null, "", "");
}

//결제수단별 안내
function controlPaymentInfo(){
	var thisValue = "";
	$('.pay-way').hide();
	$("input[name=radioPayment]").each(function(){
		if($(this).attr("checked")){
			thisValue = $(this).val();
		}
	});
	$('.pay-way_'+thisValue).show();
}

// 상품상세 호출
function goProductView(prdCd){
	window.open("<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd="+prdCd, "_blank");
}

//결제수단 선택 disable 
function disableRadioPayment(){
	$(".radioPayment").prop("disabled", true);
	$(".radioPayment").prop("checked", false);
	$(".noPointDiv").hide();
	$(".pointDiv").show();
	//$('.pay-way').hide();
}

//결제수단 선택 enable
function enableRadioPayment(){
	if($("#radioPayment1").prop("disabled")){
		$(".radioPayment").prop("disabled", false);
		$("#radioPayment1").prop("checked", true);
		$(".noPointDiv").show();
		controlPaymentInfo();
	}
}

//쿠폰선택 초기화
function couponReset(){
	$("input:radio[name='dupCoupon']").removeAttr("checked");
	$("input[name=dupCoupon]").parent().removeClass("on");
	$(".select_prd_cpn").each(function(){
		$(this).val("");
		//com.sel_chg($(this), 'reset');
	});
	calculateCoupon();
	prdCpnDiscountAjax();
}

//쿠폰할인금액 계산
function calculateCoupon(){
	var cpn_tot_dc_amt = 0;
	$(".select_prd_cpn").each(function(){
		var thisValue = $(this).val();
		var prd_tmp_idx = $(this).data("prd_tmp_idx");
		if(thisValue == ""){
			$("#span_cpn_dc_price_"+prd_tmp_idx).html("0");
			$("#PRD_CPN_PRC_"+prd_tmp_idx).val(0);
		}else{
			var cpn_dc_price = $(this).find("option:selected").data("cpn_dc_price");
			$("#span_cpn_dc_price_"+prd_tmp_idx).html(setComma(cpn_dc_price));
			$("#PRD_CPN_PRC_"+prd_tmp_idx).val(cpn_dc_price);
			cpn_tot_dc_amt += parseInt(cpn_dc_price);
		}
	});
	//쿠폰총 할인금액
	$("#span_prd_cpn_tot_dc_amt").html(setComma(cpn_tot_dc_amt));
}

//캐쉬백 조회하기
function checkCashBagPoint(){
	var pnt = $("#CART_TOTAL").val();
	var cashbagCardNo = $("#cashbag1").val() + $("#cashbag2").val() + $("#cashbag3").val() + $("#cashbag4").val();
	var cashbagPw = $("#cashbagPw").val();
	$.ajax({
		type: "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/checkCashBagPointAjax.do",
		data : {
			EP_pnt_idno : cashbagCardNo
			, EP_pnt_pwd : cashbagPw
			, EP_order_no : ORD_MST_CD
			, ORD_MST_CD : ORD_MST_CD
			, EP_product_amt : pnt
			, EP_tot_amt : pnt
			, EP_pnt_amt : pnt
		},
		dataType : "json",
		async : false,
		success : function(data){
			var resultCd = data.PAY_MST_RESPCODE;
			var resultMsg = data.PAY_MST_RESPMSG;
			if(resultCd != "0000"){
				alert(resultMsg);
				$("#CASHBAG_PW").val("");//비밀번호 초기화
			}else{
				$("#CASHBAG_PW").val(cashbagPw);//캐쉬백 사용 위한 비밀번호 저장
			}
			$("#cashbagRemainPoint").val(data.cashbagRemainPoint);
			$("#span_cashbagRemainPoint").html(setComma(data.cashbagRemainPoint));
			$("#toUseCashbag").val(0);
		},
		error : function(error){
			alert("통신 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
		}
	});
	
	cashbagDiscountAjax(0);//사용 캐쉬백 포인트 초기화
}

//상품 쿠폰 사용시 금액 계산
function prdCpnDiscountAjax(){
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/prdCpnDiscountAjax.do",
		data : $("#LGD_PAYINFO").serialize(),
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "Y"){
				$("#span_prd_cpn_tot_dc_amt_real").html(setComma(data.prd_cpn_tot_dc_amt_real));//상품 쿠폰 총 할인금액
				$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
				$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
				
				if(data.prd_cpn_tot_dc_amt_real > 0){//쿠폰할인 선택 일 때 포인트 사용 못하도록
					$("#allMileageUseChk").prop("disabled",true);
					$("#toUseMileage").prop("disabled",true);
				}else{
					$("#allMileageUseChk").prop("disabled",false);
                    $("#toUseMileage").prop("disabled",false);
				}
				
				//적립예정 마일리지/캐쉬백 추가
				$("#span_saveMlg").html(setComma(data.saveMlg));
				$("#span_saveCashbag").html(setComma(data.saveCashbag));
				
				// 포인트/캐쉬백 초기화
				cashbagDiscountAjax(0);
				mileageDiscountAjax(0);
			}else{
				alert(data.resultMsg);
			}
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
	$("#div_prd_cpn").slideUp("400");
}

//배송비 쿠폰 사용시 금액 계산
function dlvCpnDiscountAjax(){
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/dlvCpnDiscountAjax.do",
		data : $("#LGD_PAYINFO").serialize(),
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "Y"){
				$("#span_dlv_cpn_tot_dc_amt_real").html(setComma(data.dlv_cpn_tot_dc_amt_real));//배송비 쿠폰 총 할인금액
				$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
				$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
				
				//적립예정 마일리지/캐쉬백 추가
				$("#span_saveMlg").html(setComma(data.saveMlg));
				$("#span_saveCashbag").html(setComma(data.saveCashbag));
				
				// 포인트/캐쉬백 초기화
				//cashbagDiscountAjax(0);
				//mileageDiscountAjax(0);
			}else{
				alert(data.resultMsg);
			}
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
	$("#div_dlv_cpn").slideUp("400");
}

//캐쉬백 사용시 금액 계산
function cashbagDiscountAjax(toUseCashbag){
	var cashbagRemainPoint = $("#cashbagRemainPoint").val();
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/cashbagDiscountAjax.do",
		data : {"toUseCashbag" : toUseCashbag, "cashbagRemainPoint" : cashbagRemainPoint, "ORD_MST_CD" : ORD_MST_CD},
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "N"){
				alert(data.resultMsg);
			}
			
			$("#toUseCashbag").val(data.toUseCashbag);//사용캐쉬백포인트
			$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
			$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
			
			//적립예정 마일리지/캐쉬백 추가
			$("#span_saveMlg").html(setComma(data.saveMlg));
			$("#span_saveCashbag").html(setComma(data.saveCashbag));
			
			//최종결제금액은 카드 할부 목록 가져올때 필요하므로 저장해둔다.
			$("#CART_TOTAL").val(data.cart_total);
			
			if(data.allCashbagUseYn == "Y"){
				$("#allCashbagUseChk").prop("checked", true);
			}else{
				$("#allCashbagUseChk").prop("checked", false);
			}
			
			//장기할부인 경우 월 청구금액 보여준다
			<c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
				var lng_div = parseInt("${cartlist[0].ORD_TMP_LNG_DIV}");
				$("#span_expected_lng_prc").html(setComma(parseInt(data.cart_total/lng_div)));
			</c:if>
			
			//카드 리셋
			cardListReset();
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}

// 포인트 사용시 금액 계산
function mileageDiscountAjax(toUseMileage){
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/mileageDiscountAjax.do",
		data : {"toUseMileage" : toUseMileage, "ORD_MST_CD" : ORD_MST_CD},
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "N"){
				alert(data.resultMsg);
			}
			
			$("#toUseMileage").val(data.toUseMileage);//사용포인트
			$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
			$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
			
			//적립예정 마일리지/캐쉬백 추가
			$("#span_saveMlg").html(setComma(data.saveMlg));
			$("#span_saveCashbag").html(setComma(data.saveCashbag));
			
			//최종결제금액은 카드 할부 목록 가져올때 필요하므로 저장해둔다.
			$("#CART_TOTAL").val(data.cart_total);
			
			if(data.allMileageUseYn == "Y"){
				$("#allMileageUseChk").prop("checked", true);
			}else{
				$("#allMileageUseChk").prop("checked", false);
			}
			
			//장기할부인 경우 월 청구금액 보여준다
			<c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
				var lng_div = parseInt("${cartlist[0].ORD_TMP_LNG_DIV}");
				$("#span_expected_lng_prc").html(setComma(parseInt(data.cart_total/lng_div)));
			</c:if>
			
			//카드 리셋
			cardListReset();
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}

//추가배송비 계산
function getAddDlvCharge(){
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD and cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD }"><%-- 클린킹/장기할부는 추가배송비 없음 --%>
	$.ajax({
		type:"post",
		url : "<c:out value="${serverDomain}" />/pc/cart/addDlvChargeAjax.do",
		data : {"ORD_MST_CD" : ORD_MST_CD, "ORD_DLV_ZIP_CDE5" : $("#ORD_DLV_ZIP_CDE5").val(), "ORD_DLV_ZIP_CDE6_1" : $("#ORD_DLV_ZIP_CDE6_1").val()},
		dataType : "json",
		async : false,
		success : function(data){
			
			//적립예정 마일리지/캐쉬백 추가
			$("#span_saveMlg").html(setComma(data.saveMlg));
			$("#span_saveCashbag").html(setComma(data.saveCashbag));
			
			$.each(data, function(key, item){
				var $targetSpan = $("#span_"+key);
				
				if($targetSpan.length > 0){
					//console.log(key);
					//console.log(item);
					//console.log(document.getElementById("span_"+key));
					//document.getElementById("span_"+key).innerHTML = setComma(item);
					
					$targetSpan.html(setComma(item));
					
					//추가배송비 있는 경우에만 show
					if(key == "cart_add_delivery"){
						if(item != "0"){
							$("#li_cart_add_delivery").show();
						}else{
							$("#li_cart_add_delivery").hide();
						}
					}
				}
				
				//최종결제금액은 카드 할부 목록 가져올때 필요하므로 저장해둔다.
				if(key == "cart_total"){
					$("#CART_TOTAL").val(item);
				}
				
				//카드 리셋
				cardListReset();
			});
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
	</c:if>
}

//결제방법 선택시
function changePayWay(pay_idx){
	$("input:radio[name='radioPayment']").removeAttr("checked");
    $("input:radio[name='radioPayment']:radio[value="+pay_idx+"]").attr("checked",true)
	$("#radioPayment_"+pay_idx).trigger("change");
	$("#paymentBtn_"+pay_idx).siblings().removeClass("btn_blk777");
	$("#paymentBtn_"+pay_idx).siblings().addClass("btn_white");
	$("#paymentBtn_"+pay_idx).removeClass("btn_white");
	$("#paymentBtn_"+pay_idx).addClass("btn_blk777");
}

//카드사 리셋(금액에 따라 할부 가능 개월수가 달라지기 때문에 결제금액 변동시마다 호출한다.)
function cardListReset(){
	//카드종류 리셋
	$("#EP_card_cd1").val("");
	com.sel_chg($("#EP_card_cd1"), 'reset');
	
	<%-- 장기할부 아닌 경우 --%>
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
		//일시불로 리셋
		$("#EP_noint1").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
		//무이자할부/일반할부 목록 리셋
		$(".interestList").html("<option value=\"\">선택</option>");
	    com.sel_chg($("#freeInterestList"), 'reset');
	    com.sel_chg($("#noFreeInterestList"), 'reset');
    </c:if>
    
    <%-- 장기할부인 경우 --%>
    <c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
   	 	//장기할부인 경우 카드 목록 가져오기
   	 	$.ajax({
			type:"post",
			url : "<c:out value="${serverDomain}" />/pc/cart/getCardListAjax.do",
			data : {"ORD_TMP_LNG_DIV" : "${cartlist[0].ORD_TMP_LNG_DIV}", "cart_total" : $("#CART_TOTAL").val()},
			dataType : "json",
			async : false,
			success : function(data){
				$("#EP_card_cd1").html("<option value=\"\">선택</option>");
		        com.sel_chg($("#EP_card_cd1"), 'reset');
		        
				if(data.result > 0){
					$.each(data.cardList, function(key, item){
						var htmlStr = "";
						htmlStr += "<option value=\""+ item.CRD_INF_CD_NO +"\" ";
						htmlStr += "data-req_type=\""+ item.CRD_INF_PAY +"\" ";
						htmlStr += "data-crd_inf_idx=\""+ item.CRD_INF_IDX +"\" >";
						htmlStr += item.CRD_INF_NM;
						htmlStr += "</option>";
						
						$("#EP_card_cd1").append(htmlStr);
						com.sel_chg($("#EP_card_cd1"), 'chg');
					});
				}else{
					alert(data.resultMsg);
				}
			},
			error : function(err){
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});
    </c:if>
}

</script>

</body>
</html>