<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
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
                <li class="nth-child-1 active"><span class="icon cart"><!-- icon --></span>STEP 01 <strong>장바구니</strong><span class="blind">현재위치</span></li>
                <li class="nth-child-2"><span class="icon order"><!-- icon --></span>STEP 02 <strong>주문서/결제</strong></li>
                <li class="nth-child-3"><span class="icon finish"><!-- icon --></span>STEP 03 <strong>주문완료</strong></li>
            </ul><!-- // order-step -->

            <h3 class="blind">장바구니</h3>
            
			<c:choose>
				<c:when test="${not empty userInfo}">
					<c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE}"><%-- 일반회원 --%>
						
						<c:set var="condition_class" value=""/>
			            <c:choose>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD eq  Code.PRI_MEMBER_RED_GRADE}">
			            		<c:set var="condition_class" value="red"/>
			            	</c:when>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD eq  Code.PRI_MEMBER_SILVER_GRADE}">
			            		<c:set var="condition_class" value="silver"/>
			            	</c:when>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD eq  Code.PRI_MEMBER_GOLD_GRADE}">
			            		<c:set var="condition_class" value="gold"/>
			            	</c:when>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD eq  Code.PRI_MEMBER_VIP_GRADE}">
			            		<c:set var="condition_class" value="vip"/>
			            	</c:when>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD eq  Code.PRI_MEMBER_PLATINUM_GRADE}">
			            		<c:set var="condition_class" value="platinum"/>
			            	</c:when>
			            </c:choose>
					
						<div class="my-condition ${condition_class}"><!-- my-condition --><!-- platinum, vip, gold, silver, red, easy, business, nonmember -->
			                <div class="ct holder">
			                    <div class="membership">
			                        <span class="icon-level"><!-- icon-level --></span>
			                        <c:out value="${userInfo.MEM_MST_MEM_NM }"/> 고객님은 <strong class="level red"><c:out value="${userInfo.MEM_MST_MEM_GRD_NM }"/></strong>회원 입니다.
			                    </div>            
			                    <ul class="stage">
			                        <li class="coupon">
			                            <span class="icon"><!-- icon --></span>
			                            	쿠폰 
			                            	<a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponUsableList.do" target="_blank">
			                            		<strong><c:out value="${summaryMap.MEM_CPN_CNT }"/></strong>장 
			                            	</a>
			                        </li>
			                        <li class="mileage">
			                            <span class="icon"><!-- icon --></span>
			                          		 포인트 
			                          		 <a href="<c:out value="${frontDomain}" />/pc/mypage/myMileageList.do" target="_blank">
			                          		 	<strong><fmt:formatNumber value="${summaryMap.SOLUBLE_MILEAGE}" groupingUsed="true" /></strong>P
			                          		 </a>
			                        </li>
			                        <li class="point">
			                            <span class="icon"><!-- icon --></span>
			                           		 크라운 
			                           		 <a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do" target="_blank">
			                           		 	<strong><fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0 }" groupingUsed="true"/></strong>
			                            	</a>
			                            <p class="ac">
			                                <a href="<c:out value="${frontDomain}" />/pc/mypage/myPointList.do" class="more" target="_blank">포인트로 전환</a>
			                            </p>
			                        </li>
			                    </ul>
			                </div>
			            </div><!-- // my-condition -->
		            </c:if>
		            <c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE}"><%-- 기업회원 --%>
		            	<c:set var="business_condition_class" value=""/>
			            <c:choose>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD ne  Code.COMP_MEMBER_BASIC_GRADE}">
			            		<c:set var="business_condition_class" value="business-b"/>
			            	</c:when>
			            	<c:when test="${userInfo.MEM_MST_MEM_GRD eq  Code.COMP_MEMBER_BASIC_GRADE}">
			            		<c:set var="business_condition_class" value="business-a"/>
			            	</c:when>
			            </c:choose>
		            	<div class="my-condition business ${business_condition_class}"><!-- my-condition -->
			                <div class="ct holder">
			                    <div class="membership">
			                        <span class="icon-level"><!-- icon-level --></span>
			                        	<c:out value="${userInfo.MEM_MST_MEM_NM }"/> 고객님은 <strong class="level red">기업 [<c:out value="${userInfo.MEM_MST_MEM_GRD_NM }"/>]</strong>회원 입니다.
			                    </div>   
			                </div>
			            </div><!-- // my-condition -->
		            </c:if>
		            <c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}"><%-- 간편회원 --%>
		            	<div class="my-condition easy"><!-- my-condition -->
			                <div class="ct holder">
			                    <div class="membership">
			                        <span class="icon-level"><!-- icon-level --></span>
					                   <c:out value="${userInfo.MEM_MST_MEM_NM }"/> 고객님은 <strong class="level red">간편회원</strong>입니다.<br />
					                        마켓플랜트 통합회원으로 전환 하시면 보다 많은 혜택을 받으실 수 있습니다.
			                    </div>            
			                    <ul class="stage">
			                        <li class="coupon">
			                            <span class="icon"><!-- icon --></span>
			                         	   쿠폰
			                         	<a href="<c:out value="${frontDomain}" />/pc/mypage/myCouponUsableList.do" target="_blank">
		                            		<strong><c:out value="${summaryMap.MEM_CPN_CNT }"/></strong>장 
		                            	</a>   
		                            	<p class="ac">
		                            		<a href="<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do?gubun=ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>" class="more" target="_blank">통합회원 전환하기</a>
		                            	</p>
			                        </li>
			                    </ul>
			                </div>
			            </div><!-- // my-condition -->
		            </c:if>
				</c:when>
				<c:otherwise><%-- 비회원 --%>
					<div class="my-condition nonmember"><!-- my-condition -->
		                <div class="ct holder">
		                    <div class="membership">
		                        <span class="icon-level"><!-- icon-level --></span>
				                        고객님은 <strong class="level red">비로그인</strong>상태 입니다.
				                        로그인 후,  포인트, 쿠폰, 크라운 혜택 정보를 확인하실 수 있습니다.
		                        <a href="javascript:goLoginPopup();" class="btn_st0 btn_white small"><span>로그인 하기</span></a>
		                    </div>       
		                </div>
		            </div><!-- // my-condition -->
				</c:otherwise>
			</c:choose>
			
			<form name="paymentform" id="paymentform" method="post"></form>
			
            <%---------------------------------------------------------------- 상품이 하나도 없는 경우 시작 ------------------------------------------------%>
            <c:if test="${empty cartlist}">
            <table class="table-product"><!-- table-product -->
	            <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 장바구니에 담긴 상품 목록입니다.</caption>
	            <colgroup>
	                <col style="width: 3%;" />
	                <col style="width: auto;" />
	                <col style="width: 11%;" />
	                <col style="width: 6%;" />
	                <col style="width: 9%;" />
	                <col style="width: 11%;" />
	                <col style="width: 10%;" />
	                <col style="width: 10%;" />
	                <col style="width: 8%;" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th scope="col"><input type="checkbox" title="모두선택" /></th>
	                    <th scope="col"><span>상품/옵션 정보</span></th>
	                    <th scope="col"><span>판매가</span></th>
	                    <th scope="col"><span>수량</span></th>
	                    <th scope="col"><span>즉시할인금액</span></th>
	                    <th scope="col"><span>주문예정금액</span></th>
	                    <th scope="col"><span>추가혜택
	                        <a href="#benefitAdd" class="link-guide js-tooltip" data-size="250x360"><em class="blind">안내</em></a>
	                    </span></th>
	                    <th scope="col"><span>배송비</span></th>
	                    <th scope="col"><span>선택</span></th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td colspan="9">
	                        <p class="message no-more">
	                            장바구니에 담긴 상품이 없습니다.
	                        </p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table-product -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	            </div><!-- // section-button -->
	        </c:if>   
            <%---------------------------------------------------------------- 상품이 하나도 없는 경우 끝 ------------------------------------------------%>
            
			<%---------------------------------------------------------------- 마켓플랜트 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty sysRetailCartList}">
				<c:set var="c_dlv_type" value="sysRetail"/>
	            <div class="cart-list-wrap price-king" <c:if test="${empty vendorCartList }">style="margin-bottom : 0;"</c:if>><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">프라이스킹 배송상품</h4>
	                    <div class="desc">
	                        	프라이스킹 상품은 마켓플랜트 물류와 택배를 통해 안전하게 배송됩니다.
	                        <a href="javascript:com.laypop('show', '1');" class="link-guide"><span class="blind">안내</span></a>
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 프라이스킹 배송상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${sysRetailCartList}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
            </c:if>
            <%---------------------------------------------------------------- 마켓플랜트 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 입점업체 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty vendorCartList}">
				<c:set var="c_dlv_type" value="vendor"/>
	            <div class="cart-list-wrap partner"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">파트너 배송상품</h4>
	                    <div class="desc">
	                        	파트너 상품은 각 파트너사에서 택배를 통해 정성스럽게 배송됩니다. 
                        	<a href="javascript:com.laypop('show', '2');" class="link-guide"><span class="blind">안내</span></a>
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 파트너 배송상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${vendorCartList}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
            </c:if>
            <%---------------------------------------------------------------- 입점업체 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 마켓플랜트/입점업체 총금액 시작 ------------------------------------------------%>
            <c:if test="${not empty vendorCartList or not empty sysRetailCartList}">
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('normal');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('normal');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('normal');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('normal');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <div class="fr">
	                    <p class="message notice">
	                        	쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div>
	            </div><!-- // section-button -->
	
	            <div class="total-price"><!-- total-price -->
	                <div class="holder">
	                    <div class="article order">
	                        <p class="tit">총 주문상품금액</p>
	                        <p class="price"><span id="span_cart_prd_amount_normal" class="span_amt"><fmt:formatNumber value="${cart_prd_amount_sysRetail + cart_prd_amount_vendor}" type="number" /></span>원</p>
	                    </div>
	                    <span class="reckoning minus"><em class="blind">빼기</em></span>
	                    <div class="article discount">
	                        <p class="tit">총 즉시할인금액</p>
	                        <p class="price"><span id="span_cart_ist_cpn_prc_normal" class="span_amt"><fmt:formatNumber value="${cart_ist_cpn_prc_sysRetail + cart_ist_cpn_prc_vendor}" type="number" /></span>원</p>
	                    </div>
	                    <span class="reckoning plus"><em class="blind">더하기</em></span>
	                    <div class="article ship">
	                        <p class="tit">총 배송비</p>
	                        <p class="price"><span id="span_cart_delivery_normal" class="span_amt"><fmt:formatNumber value="${cart_delivery_sysRetail + cart_delivery_vendor}" type="number" /></span>원</p>
	                    </div>
	                    <span class="reckoning value"><em class="blind">결과</em></span>
	                    <div class="article final">
	                        <p class="tit">총 결제예정금액</p>
	                        <p class="price"><span id="span_cart_total_normal" class="span_amt"><fmt:formatNumber value="${cart_total_sysRetail + cart_total_vendor}" type="number" /></span>원</p>
	                        <p class="desc">(적립예정 포인트 : <span id="span_cart_reserve_mileage_normal" class="span_amt"><fmt:formatNumber value="${cart_reserve_mileage_sysRetail + cart_reserve_mileage_vendor}" type="number" /></span>P)</p>
	                    </div>
	                </div>
	            </div><!-- // total-price -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', 'normal');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 주문하기</span></a>
	                <a href="javascript:payment('-1', 'normal');" class="btn_st2 btn_rd xlarge"><span>전체 상품 주문하기</span></a>
	            </div><!-- // section-button -->
            </c:if>
            <%---------------------------------------------------------------- 마켓플랜트/입점업체 총금액 끝 ------------------------------------------------%>
            
			<%---------------------------------------------------------------- 겟잇나우1 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty getItNowCartList1}">
				<c:set var="c_dlv_type" value="get1"/>
	            <div class="cart-list-wrap get-it-now"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">겟잇나우 배송상품 (${getItNowCartList1[0].SHP_MST_NM})</h4>
	                    <div class="desc">
	                        	겟잇나우 상품은 결제완료 후, 매장에 직접 방문하여 찾아 가시는 상품입니다.
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 겟잇나우 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${getItNowCartList1}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
	            
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <div class="fr">
	                    <p class="message notice">
	                        쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div>
	            </div><!-- // section-button -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', '${c_dlv_type}');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 주문하기</span></a>
	                <a href="javascript:payment('-1', '${c_dlv_type}');" class="btn_st2 btn_rd xlarge"><span>전체 상품 주문하기</span></a>
	            </div><!-- // section-button -->
	            
            </c:if>
            <%---------------------------------------------------------------- 겟잇나우1 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 겟잇나우2 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty getItNowCartList2}">
				<c:set var="c_dlv_type" value="get2"/>
	            <div class="cart-list-wrap get-it-now"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">겟잇나우 배송상품 (${getItNowCartList2[0].SHP_MST_NM})</h4>
	                    <div class="desc">
	                        	겟잇나우 상품은 결제완료 후, 매장에 직접 방문하여 찾아 가시는 상품입니다.
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 겟잇나우 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${getItNowCartList2}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
	            
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <div class="fr">
	                    <p class="message notice">
	                        쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div>
	            </div><!-- // section-button -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', '${c_dlv_type}');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 주문하기</span></a>
	                <a href="javascript:payment('-1', '${c_dlv_type}');" class="btn_st2 btn_rd xlarge"><span>전체 상품 주문하기</span></a>
	            </div><!-- // section-button -->
	            
            </c:if>
            <%---------------------------------------------------------------- 겟잇나우2 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 겟잇나우3 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty getItNowCartList3}">
				<c:set var="c_dlv_type" value="get3"/>
	            <div class="cart-list-wrap get-it-now"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">겟잇나우 배송상품 (${getItNowCartList3[0].SHP_MST_NM})</h4>
	                    <div class="desc">
	                        	겟잇나우 상품은 결제완료 후, 매장에 직접 방문하여 찾아 가시는 상품입니다.
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 겟잇나우 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${getItNowCartList3}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
	            
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <div class="fr">
	                    <p class="message notice">
	                        쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div>
	            </div><!-- // section-button -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', '${c_dlv_type}');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 주문하기</span></a>
	                <a href="javascript:payment('-1', '${c_dlv_type}');" class="btn_st2 btn_rd xlarge"><span>전체 상품 주문하기</span></a>
	            </div><!-- // section-button -->
	            
            </c:if>
            <%---------------------------------------------------------------- 겟잇나우3 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 클린킹 상품 시작 ------------------------------------------------%>
			<c:if test="${not empty serviceCartList}">
				<c:set var="c_dlv_type" value="service"/>
	            <div class="cart-list-wrap clean-king"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                     <h4 class="title">클린킹</h4>
	                    <div class="desc">
	                        클린킹 상품은 상담예약을 신청하시면, 해피콜을 통하여 구매하는 서비스입니다
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 클린킹 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${serviceCartList}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
	            
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <!-- <div class="fr">
	                    <p class="message notice">
	                        쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div> -->
	            </div><!-- // section-button -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', '${c_dlv_type}');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 상담예약하기</span></a>
	                <a href="javascript:payment('-1', '${c_dlv_type}');" class="btn_st2 btn_rd xlarge"><span>전체 상품 상담예약하기</span></a>
	            </div><!-- // section-button -->
	            
            </c:if>
            <%---------------------------------------------------------------- 클린킹 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 장기할부 24개월 상품 시작 ------------------------------------------------%>
            <c:if test="${not empty longInsCartList24}">
				<c:set var="c_dlv_type" value="long24"/>
	            <div class="cart-list-wrap long-monthly"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">장기할부 배송상품 (${longInsCartList24[0].MEM_CRT_LNG_DIV}개월)</h4>
	                    <div class="desc">
	                        	장기할부 상품은 신용카드로만 결제하실 수 있는 상품입니다.
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 장기할부 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${longInsCartList24}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
	            
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <div class="fr">
	                    <p class="message notice">
	                        쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div>
	            </div><!-- // section-button -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', '${c_dlv_type}');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 주문하기</span></a>
	                <a href="javascript:payment('-1', '${c_dlv_type}');" class="btn_st2 btn_rd xlarge"><span>전체 상품 주문하기</span></a>
	            </div><!-- // section-button -->
	            
            </c:if>
            <%---------------------------------------------------------------- 장기할부 24개월 상품 끝 ------------------------------------------------%>
            
            <%---------------------------------------------------------------- 장기할부 36개월 상품 시작 ------------------------------------------------%>
            <c:if test="${not empty longInsCartList36}">
				<c:set var="c_dlv_type" value="long36"/>
	            <div class="cart-list-wrap long-monthly"><!-- cart-list-wrap -->
	                <div class="section-title"><!-- section-title -->
	                    <h4 class="title">장기할부 배송상품 (${longInsCartList36[0].MEM_CRT_LNG_DIV}개월)</h4>
	                    <div class="desc">
	                        	장기할부 상품은 신용카드로만 결제하실 수 있는 상품입니다.
	                    </div>
	                </div><!-- // section-title -->
	
	                <table class="table-product"><!-- table-product -->
	                <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문예정금액, 추가혜택, 배송비, 선택으로 구성된 장기할부 상품 목록입니다.</caption>
	                <%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistHead.jsp" %>
	                <tbody>
	                	<c:forEach var="cart" items="${longInsCartList36}">
            				<%@ include file="/WEB-INF/jsp/pc/cart/include/cartlistRow.jsp" %>
	                	</c:forEach>
	                </tbody>
	                </table><!-- // table-product -->
	            </div><!-- // cart-list-wrap -->
	            
	            <div class="ct section-button mt10"><!-- section-button -->
	                <div class="fl">
	                    <a href="javascript:allSelectBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                    <a href="javascript:allDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>전체삭제</span></a>
	                    <a href="javascript:SelectedDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>선택상품 삭제</span></a>
	                    <a href="javascript:soldOutDeleteBtn('${c_dlv_type}');" class="btn_st0 btn_white small"><span>품절상품 삭제</span></a>
	                </div>
	                <div class="fr">
	                    <p class="message notice">
	                        쿠폰 은 주문/결제 단계에서 적용됩니다.
	                    </p>
	                </div>
	            </div><!-- // section-button -->
	
	            <div class="section-button section-button-order"><!-- section-button -->
	                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>계속 쇼핑하기</span></a>
	                <a href="javascript:payment('0', '${c_dlv_type}');" class="btn_st2 btn_blk777 xlarge"><span>선택 상품 주문하기</span></a>
	                <a href="javascript:payment('-1', '${c_dlv_type}');" class="btn_st2 btn_rd xlarge"><span>전체 상품 주문하기</span></a>
	            </div><!-- // section-button -->
	            
            </c:if>
            <%---------------------------------------------------------------- 장기할부 36개월 상품 끝 ------------------------------------------------%>

            <div id="benefitAdd" class="layer-tooltip"><!-- #benefitAdd -->
                <h5 class="title h1">추가혜택 안내</h5>
                <div class="holder">
                    <h6 class="title h2">1.카드할인 프로모션</h6>

                    <p>
                        각 카드사별 카드할인을 안내드립니다.<br />
                        (상품별 적용대상이 다를 수 있습니다)
                    </p> 

                    <h6 class="title h2">2.포인트 추가 적립</h6>

                    <p>
                        상품구매시 기본 적립율 외에 회원등급별 추가 포인트가 적립됩니다.
                    </p>

                    <h6 class="title h2 level">회원등급별 추가적립안내</h6>

                    <div class="frame-a level-point">
                        <ul>
                            <li>PLATINUM – 기본 0.24% + <span class="">추가 0.26%</span></li>
                            <li>VIP – 기본 0.24% + <span class="">추가 0.16%</span></li>
                            <li>GOLD – 기본 0.24% + <span class="">추가 0.06%</span></li>
                            <li>SILVER – 기본 0.24%</li>
                            <li>RED – 기본 0.24% </li>
                        </ul>
                    </div>
                </div>
            </div><!-- // #benefitAdd -->

            <div class="order-guide"><!-- order-guide -->
                <div class="head"><!-- head --></div>
                <div class="body">
                    <h4><span class="blind">꼭 확인해 주세요</span></h4>
                    <ul class="list list-a">
                        <li>쿠폰적용 제외 상품은 쿠폰적용 가능 주문금액에서 제외됩니다.</li>
                        <li>무통장 입금일 경우 3일 이내 해당 계좌로 입금하셔야 주문이 완료되며, 입금 확인 후 3~5일이내에 배송됩니다.</li>
                        <li>겟잇나우는 매장 방문하여 직접 수령하는 서비스로  상품재고 확보를 위해 신용카드 결제방법으로만  주문하실 수 있습니다. </li>
                        <li>결제완료 이후에는 배송방법을 변경하실 수 없으므로, 주문 취소 후 새로 주문해 주시기 바랍니다.</li>
                        <li>교환 및 반품은 배송완료 후 7일 이내만 신청 가능하며, 포장이 훼손되거나 사용하신 상품은 교환 및 환불 되지 않습니다.</li>
                    </ul>
                </div>
                <div class="foot"><!-- head --></div>
            </div><!-- // order-guide -->

			<c:if test="${not empty cardEventFreetList }">
	            <h4 class="title-a"><span>${cardEventFreetList[0].THIS_MONTH }월 카드 무이자/부분무이자 할부 혜택</span></h4>
	
	            <ul class="card-benefit"><!-- card-benefit -->
	            	<c:forEach var="row" items="${cardEventFreetList }">
	            		<c:if test="${row.RNUM eq 1}">
	            			<li>
			                    <span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span>
			                    <p class="price">(${row.DIV_DTL_PRC}만원<span class="up"><em class="blind">이상</em></span>)</p>
			                    <c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST }"><%-- 무이자만 출력 --%>
				                    <p class="monthly">
				                    	<c:forEach var="month" items="${fn:split(row.DIV_INF_MNT, ',')}">
				                    			<span>${month }</span>
				                    	</c:forEach>
				                    	개월 무이자 할부
				                    </p>
				                </c:if>
			                    <c:if test="${(row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST and row.CRD_DIV_CNT gt 1) or row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST}">
			                    	<a href="javascript:showPartInterestPop('${row.DIV_DTL_CD }','${row.DIV_DTL_PRC}','${row.CRD_DIV_IDX }','${row.CARD_NM }');">부분무이자 안내 &gt;</a>
			                    </c:if>
			                </li>	
            			</c:if>
		                <c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST }"><%-- 부분무이자/특별무이자만 출력 --%>
		                	<c:forEach var="month" items="${fn:split(row.DIV_INF_MNT, ',')}" varStatus="monthStatus">
			                	<li class="li_etc_interest_${row.DIV_DTL_CD }_${row.DIV_DTL_PRC}_${row.CRD_DIV_IDX}" style="display: none;">
		                    		<span>${month }개월</span>
		                    		<span>${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index] }</span>
				                </li>
			                </c:forEach>
		                </c:if>
	            	</c:forEach>
	            </ul><!-- // card-benefit -->
	
	            <div class="frame-a"><!-- frame-a -->
	                <ul class="list list-a">
	                    <li>위 결제액은 최종 결제금액 기준이며, 기준금액 미만이거나, 무이자할부가 되지 않는 신용카드를 사용하시는 경우 일반할부로 결제되오니 유의하시기 바랍니다.</li>
	                    <li>법인카드/체크카드는 할부 적용 대상에서 제외됩니다.</li>
	                </ul>
	            </div><!-- // frame-a -->
            
            </c:if>

			<c:if test="${not empty keepingPrdList}">
	            <h4 class="title-a"><span>나의 키핑상품<span class="desc">고객님의 키핑상품으로 등록된 상품입니다.</span></span></h4>
	
	            <div class="product-list-a"><!-- product-list-a -->
	                <ul class="ct">
	                	<c:forEach var="row" items="${keepingPrdList }">
	                		<li>
		                        <div class="module">
		                            <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${row.PRD_MST_CD}">
		                                <span class="thumb"><img src="<c:out value="${cdnDomain }"/>${row.PRD_IMAGE}" class="thumb200" alt="${row.PRD_IMAGE_ALT}" /></span>
		                                <span class="subject">${row.PRD_MST_NM}</span>
		                            </a>
		                            <div class="utill">
		                                <a href="javascript:goProductView('<c:out value="${row.PRD_MST_CD }" />');" class="view"><span class="blind">상품 크게보기</span></a>
		                                <a href="javascript:inertCart('<c:out value="${row.PRD_MST_CD}" />');" class="cart"><span class="blind">상품 장바구니에 담기</span></a>
		                                <a href="javascript:<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD}" />" class="sns"><span class="blind">상품 공유하기</span></a>
		                                <a href="javascript:insertKeeping('<c:out value="${row.PRD_MST_CD}" />');" class="wish"><span class="blind">상품 찜하기</span></a>
		                            </div>
		                            <p class="price-before"><span class="blind">소비자가</span><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC}" type="number" /></strong>원</p>
		                            <p class="price-after"><span class="blind">판매가</span><strong><fmt:formatNumber value="${row.PRD_MST_PRICE}" type="number" /></strong>원</p>
		                            <c:if test="${row.REP_CNT gt 0 }">
			                            <p class="reviews">
			                                <span class="blind">상품평균점수 5점 만점 중</span>
			                                <i class="ico_star1"><i class="star_${row.REP_POINT_GRD}"><span class="ir">${row.REP_POINT}점</span></i></i>
			                                <span class="blind">상품평 등록</span>
			                                <span class="number">(${row.REP_CNT}개)</span>
			                            </p>
		                            </c:if>
		                            <p class="ico_box">
		                            	<c:if test="${row.PRD_NEW_ICO lt 30 }">
		                            		<span class="ico_new"><span class="ir">NEW</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_PC_CPN_PRC gt 0 }">
		                            		<span class="ico_sale"><span class="ir">즉시할인</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_COU_CNT gt 0 }">
		                            		<span class="ico_coupon"><span class="ir">쿠폰할인</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_GFT_CNT gt 0 }">
		                            		<span class="ico_gift"><span class="ir">사은품</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_DLV_FEE eq 0 }">
		                            		<span class="ico_free"><span class="ir">무료배송</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_CRD_CNT gt 0 }">
		                            		<span class="ico_card"><span class="ir">카드할인</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_LNG_DIV_YN eq 'Y'}">
		                            		<span class="ico_plan"><span class="ir">장기할부</span></span>
		                            	</c:if>
		                            	<c:if test="${row.PRD_MST_O2O_YN eq 'Y' }">
		                            		<span class="ico_getNew"><span class="ir">겟잇나우</span></span>
		                            	</c:if>
		                            </p>
		                        </div>
		                    </li>
	                	</c:forEach>
	                </ul>
	            </div><!-- // product-list-a -->
            </c:if>

            <!-- #laypop S -->
            <div id="laypop" class="laypop">
                <div id="partFree" class="laypop_con layer-popup"><!-- #partFree -->
                    <h5 class="title h1">부분무이자 할부 안내</h5>
                    <div class="holder" id="div_partFree">
                        <p class="card card-1"><em class="blind">농협카드</em></p>
                        <table class="table-a">
                        <caption>할부기간, 무이자 안내로 구성된 부분무이자 할부 목록입니다.</caption>
                        <colgroup>
                            <col style="width: 150px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody id="tbody_partFree">
                            <tr>
                                <th scope="row"><span>6개월</span></th>
                                <td class="al small">1회차 고객 이자 부담, 5만원 이상</td>
                            </tr>
                            <tr>
                                <th scope="row"><span>8개월</span></th>
                                <td class="al small">1회차 고객 이자 부담, 5만원 이상</td>
                            </tr>
                            <tr>
                                <th scope="row"><span>10개월</span></th>
                                <td class="al small">1회, 2회차 고객 이자 부담, 5만원 이상</td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                    <div class="close">
                        <a href="javascript:com.laypop('hide')"><span class="blind">레이어 팝업 닫기</span></a>
                    </div>
                </div><!-- #partFree -->

                <div id="priceKingGuide" class="laypop_con layer-popup"><!-- #priceKingGuide -->
                    <h5 class="title h1">프라이스킹 배송상품 유의사항</h5>
                    <div class="holder">
                        <p class="message">
                            본 상품은 배송지와 가까운 마켓플랜트 물류센터에서 배송되는 상품입니다.<br />
                            물류재고 사정에 따라 일부 상품에 한해  배송기사가 직접 배송하거나,<br />
                            택배로 발송될 수 있습니다.  
                        </p>

                        <h6 class="title h2">프라이스킹배송</h6>

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
	
	<!-- <a href="javascript:test();">견적 테스트!!</a> -->
	
	<form name="paymentform" id="paymentform" method="post"></form>

	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>
<!--// #wrap E -->

<script>

$(function(){
    com.amount($('.inp_amount'));
    
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
			window.open("<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd="+prdMstCd, "_blank");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
 	
	//장바구니 이동
	goCartList = function(){
		$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();	
	};
    
	//나의 키핑상품 이동
	goMyKeeping = function(){
		$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();	
	};
	
	
	/* test = function(){
        
        $('#paymentform').empty();
		
        if(confirm("견적 주문하시겠습니까?")){
        	$.ajax
            ({
                async : false,
                type : "POST",
                data : null,
                url : "<c:out value="${serverSslDomain}" />/pc/mypage/insertEstimateOrderAjax.do",
                success : function (data) 
                { 
    				switch (data.result) {
    				case 1:
    					$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
    					$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
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
	}; */
	
	
	
});

//매장위치확인 팝업
function getItNowShopInfoPopup(shpMstIdx){
	window.open("<c:out value="${serverSslDomain}"/>/pc/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx,"getItNowShopInfoPopup", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=500,height=550,scrollbars=yes');
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
				url : "<c:out value="${serverSslDomain}" />/pc/cart/deleteCart.do",
				success : function(data) {
					alert("삭제되었습니다.");
					//location.reload(true);
					location.href = "<c:out value="${serverSslDomain}"/>/pc/cart/cartlist.do";
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
			url : "<c:out value="${serverSslDomain}"/>/pc/cart/calculateCartAmountAjax.do",
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
				document.getElementById("span_cart_prd_amount_normal").innerHTML = setComma(data.cart_prd_amount_sysRetail + data.cart_prd_amount_vendor);
				document.getElementById("span_cart_ist_cpn_prc_normal").innerHTML = setComma(data.cart_ist_cpn_prc_sysRetail + data.cart_ist_cpn_prc_vendor);
				document.getElementById("span_cart_delivery_normal").innerHTML = setComma(data.cart_delivery_sysRetail + data.cart_delivery_vendor);
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
        url : "<c:out value="${serverSslDomain}" />/pc/cart/insertCartpaymentAjax.do",
        success : function (data) 
        { 
			switch (data.result) {
			case 1:
				$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
				<c:choose>
				<%-- 1. 비회원 --%>
				<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
				var url = "<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do?ORD_MST_CD="+data.ORD_MST_CD;
				url = encodeURIComponent(url);
	        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=<c:out value="${locationProtocol}"/>","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
				</c:when>
				<%-- 2. 회원 --%>
				<c:when test="${sessionUser.ROLE_USER eq 'user'}">
				$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
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
		url : "<c:out value="${serverSslDomain}"/>/pc/cart/productOptionCntModifyAjax.do",
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
		url : "<c:out value="${serverSslDomain}"/>/pc/cart/productOptionCntModifyAjax.do",
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
		$('.crt_idx_'+ dlv_type).each(function() {
			idx_arr[idx_arr.length] = $(this).val();
		});
		
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"MEM_CRT_IDX[]" : idx_arr
			},
			url : "<c:out value="${serverSslDomain}" />/pc/cart/deleteSoldOutCartAjax.do",
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
		url : "<c:out value="${serverSslDomain}" />/pc/cart/insertInterestProductAjax.do",
		success : function(data) {
			var result = data.result;//0:로그인 필요 1:성공 -1:실패
			if(result == 0){
				if(confirm(data.resultMsg)){
					var url = location.href;
					url = encodeURIComponent(url);
		        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
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