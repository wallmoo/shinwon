<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
</script>
    
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
            <h2>주문서결제</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="order-step"><!-- order-step -->
            <ol class="ui-grid-b">
                <li class="ui-block-a"><i class="cart"><!-- icon --></i><strong>장바구니</strong></li>
                <li class="ui-block-b active"><i class="order"><!-- icon --></i><strong>주문서/결제</strong><span class="blind">현재위치</span></li>
                <li class="ui-block-c"><i class="finish"><!-- icon --></i><strong>주문완료</strong></li>
            </ol>
        </div><!-- // order-step -->
        
        <%--카드 할부 가져올때 필요한 최종결제금액 --%>
		<input type="hidden" id="CART_TOTAL" value="${cart_total}"/>
		
		<form name="LGD_PAYINFO" id="LGD_PAYINFO" method="post" action="<c:out value="${mobileSslDomain}" />/mobile/cart/payment.do">
		
		<!-- [START]가맹점 주문자 필드(승인요청 시 해당 정보를 부가정보로 사용) -->
		<input type='hidden' id="user_id"             name="user_id"             value="<c:out value="${userInfo.MEM_MST_MEM_ID }"/>" />         <!--[선택]고객ID -->
		<input type='hidden' id="EP_user_id"             name="EP_user_id"             value="<c:out value="${userInfo.MEM_MST_MEM_ID }"/>" />         <!--[선택]고객ID -->
		<input type='hidden' id="user_nm"             name="user_nm"             value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" />         <!--[선택]고객명 -->
		<input type='hidden' id="EP_user_nm"             name="EP_user_nm"             value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" />         <!--[선택]고객명 -->
		<!-- [END]가맹점 주문자 필드 -->
		
		<!-- [START]인증 요청 필드 -->
		<input type='hidden' id="sp_app_scheme"       name="sp_app_scheme"       value="">           <!--[선택]가맹점APP scheme -->
		<!-- [END]인증 요청 필드-->
		
		<!-- ISP -->
		<input type="hidden" id="sp_kvp_remain_point" name="sp_kvp_remain_point" value="" />         <!-- [선택]남은 포인트 -->




		
		
		<input type="hidden" id="sp_card_cd" name="sp_card_cd" value=""/>
        <input type="hidden" id="sp_noint" name="sp_noint" value=""/>
		         
		<input type="hidden" id="LGD_CLOSEDATE_TEXT" name="LGD_CLOSEDATE_TEXT" value="<c:out value="${LGD_CLOSEDATE_TEXT}" />"/><!-- 메일발송용 -->
		<input type="hidden" id="ORD_MST_MAIL" name="ORD_MST_MAIL" value=""/>
		<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${ORD_MST_CD}" />"/><%-- 주문번호 --%>
		<input type="hidden" id="ORD_TMP_PRE_CD" value="<c:out value="${cartlist[0].ORD_TMP_PRE_CD}" />"/><%-- 재결제시 이전 주문번호 --%>
		
		<input type="hidden" id="install_period" name="install_period" value="00"/><%-- 할부 개월 --%>
		
		<input type="hidden" id="EP_cash_yn" name="EP_cash_yn" value="0"/><%-- 현금영수증 발행여부 --%>
		<input type="hidden" id="EP_cash_issue_type" name="EP_cash_issue_type" value=""/><%-- 현금영수증 발행용도 --%>
		<input type="hidden" id="EP_cash_auth_type" name="EP_cash_auth_type" value=""/><%-- 현금영수증 인증구분 --%>
		<input type="hidden" id="EP_cash_auth_value" name="EP_cash_auth_value" value=""/><%-- 현금영수증 인증번호 --%>
		
		<input type="hidden" id="sp_cash_yn" name="sp_cash_yn" value="0"/><%-- 모바일용 현금영수증 발행여부 --%>
		<input type="hidden" id="sp_cash_issue_type" name="sp_cash_issue_type" value=""/><%-- 모바일용 현금영수증 발행용도 --%>
		<input type="hidden" id="sp_cash_auth_type" name="sp_cash_auth_type" value=""/><%-- 모바일용 현금영수증 인증구분 --%>
		<input type="hidden" id="sp_cash_auth_value" name="sp_cash_auth_value" value=""/><%-- 모바일용 현금영수증 인증번호 --%>
		
		<!-- 오캐이캐시백 파라미터 시작 -->
		<input type="hidden" id="CASHBAG_PW" name="CASHBAG_PW" value=""/>
		<!-- 오캐이캐시백 파라미터 끝 -->
		
		<c:set var="rep_product_name" value=""/><!-- 상품명 -->
		<%-- 대표 상품명 설정 --%>
		<c:if test="${ fn:length(cartlist) gt 1 }"><c:set var="rep_product_name" value="${cartlist[0].PRD_MST_NM} 외 ${ fn:length(cartlist) - 1 }건"/></c:if>
		<c:if test="${ fn:length(cartlist) eq 1 }"><c:set var="rep_product_name" value="${cartlist[0].PRD_MST_NM}"/></c:if>

        <hr class="hr-a">

        <div class="order-sheet accordion product" data-role="collapsible-set"><!-- product -->
            <div class="section" data-role="collapsible" data-collapsed="true">
                <h3>
                    <strong>주문상품정보</strong>

                    <span class="price"><strong class="warning xlarge"><fmt:formatNumber value="${cart_total}" type="number" /></strong>원</span>
                    (<c:out value="${fn:length(cartlist)}"/>)
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                	<%---------------------------------------------------------------- 전자랜드 상품 시작 ------------------------------------------------%>
					<c:if test="${not empty sysRetailCartList}">
						<c:set var="c_dlv_gbn" value="${sysRetailCartList[0].ORD_TMP_DLV_GBN }"/>
						
						<div class="cart-list-wrap price-king"><!-- cart-list-wrap -->
	                        <div class="cart-title"><!-- cart-title -->
	                            <h4><strong>프라이스킹 배송상품</strong> (<c:out value="${fn:length(sysRetailCartList)}"/>)</h4>
	                        </div><!-- // cart-title -->
	
	                        <ul class="cart-list"><!-- cart-list -->
	                        	<c:forEach var="cart" items="${sysRetailCartList}">
	                        		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartpaymentRow.jsp" %>
	                        	</c:forEach>
	                        </ul><!-- // cart-list -->
	                    </div><!-- // cart-list-wrap -->
					</c:if>
					<%---------------------------------------------------------------- 전자랜드 상품 끝 ------------------------------------------------%>
                
                	<%---------------------------------------------------------------- 입점업체 상품 시작 ------------------------------------------------%>
					<c:if test="${not empty vendorCartList}">
						<c:set var="c_dlv_gbn" value="${vendorCartList[0].ORD_TMP_DLV_GBN }"/>
			            
			            <div class="cart-list-wrap partner"><!-- cart-list-wrap -->
	                        <div class="cart-title"><!-- cart-title -->
	                            <h4><strong>파트너 배송상품</strong> (<c:out value="${fn:length(vendorCartList)}"/>)</h4>
	                        </div><!-- // cart-title -->
	
	                        <ul class="cart-list"><!-- cart-list -->
	                        	<c:forEach var="cart" items="${vendorCartList}">
	                        		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartpaymentRow.jsp" %>
	                        	</c:forEach>
	                        </ul><!-- // cart-list -->
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
								<c:set var="c_cartlist_name" value="겟잇나우"/>
							</c:when>
							<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_SERVICE_CD }">
								<%-- 무형 --%>
								<c:set var="c_cartlist_class" value="clean-king"/>
								<c:set var="c_cartlist_name" value="클린킹"/>
							</c:when>
							<c:when test="${c_dlv_gbn eq Code.CART_DLV_GBN_LONG_INS_CD }">
								<%-- 장기할부 --%>
								<c:set var="c_cartlist_class" value="long-monthly"/>
								<c:set var="c_cartlist_name" value="장기할부"/>
							</c:when>
						</c:choose>
					
						<div class="cart-list-wrap ${c_cartlist_class}"><!-- cart-list-wrap -->
	                        <div class="cart-title"><!-- cart-title -->
	                            <h4><strong><c:out value="${c_cartlist_name }"/> 배송상품</strong> (<c:out value="${fn:length(cartlist)}"/>)</h4>
	                        </div><!-- // cart-title -->
	
	                        <ul class="cart-list"><!-- cart-list -->
	                        	<c:forEach var="cart" items="${cartlist}">
	                        		<%@ include file="/WEB-INF/jsp/mobile/cart/include/cartpaymentRow.jsp" %>
	                        	</c:forEach>
	                        </ul><!-- // cart-list -->
	                    </div><!-- // cart-list-wrap -->
					</c:if>
					<%---------------------------------------------------------------- 기타(겟잇나우, 무형, 장기할부) 끝 ------------------------------------------------%>
			
                </div>
            </div>
        </div><!-- // product -->

		<%---------------------------------------------------------------- 사은품 리스트 시작 ------------------------------------------------%>
		<c:if test="${empty cartlist[0].ORD_TMP_PRE_CD}"><%-- 재결제 아닌 경우에만 사은품 증정 --%>
			<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 쿠폰/포인트 사용 없음 --%>
			<c:if test="${not empty giftList}">
				<div class="order-sheet accordion free-gift" data-role="collapsible-set"><!-- free-gift -->
		            <div class="section" data-role="collapsible" data-collapsed="true">
		                <h3>
		                    <strong>사은품정보</strong>
		                    (${fn:length(giftList)})
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="free-gift-list"><!-- free-gift-list -->
		                    	<c:forEach var="gift" items="${giftList}" varStatus="i">
		                    		<c:if test="${gift.GFT_MST_STOCK_CNT gt 0 }">
			                			<input type="hidden" name="gftMstIdxs" value="<c:out value="${gift.GFT_MST_IDX}"/>">
			                		</c:if>
				                    <li class="ct col">
				                    	<c:if test="${gift.GFT_MST_STOCK_CNT le 0 }">
	                            			<i class="icon soldout"><strong class="small warning">증정마감</strong></i>
	                            		</c:if>
				                    	
			                            <span class="thumb">
			                            	<c:if test="${gift.GFT_MST_PRD_TYPE eq 'P' }">
			                            		<%-- 상품 이미지 --%>
			                            		<img data-original="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain }"/>/mobile/img/lay/grey.gif" alt="<c:out value="${gift.PRD_IMAGE_ALT}"/>" />
			                            	</c:if>
			                            	<c:if test="${gift.GFT_MST_PRD_TYPE ne 'P' }">
			                            		<%-- 파일 등록 --%>
			                            		<img data-original="<c:out value="${cdnDomain }${gift.CMM_FLE_ATT_PATH}${gift.CMM_FLE_SYS_NM}"/>" src="<c:out value="${cdnDomain }"/>/mobile/img/lay/grey.gif" alt="<c:out value="${gift.CMN_FLE_ALT_TXT}"/>" />
			                            	</c:if>
			                            </span>
			                            <div class="core">
			                                <strong class="subject">
			                                	<c:out value="${gift.GFT_MST_NAME}"/>
			                                </strong>
			                                <!-- <div class="desc">
			                                    <p>50만원/70만원/100만원 이상</p>
			                                    <p>구매 사은품</p>
			                                </div> -->
			                            </div>
			                        </li>
				                </c:forEach>
		                    </ul><!-- // free-gift-list --> 
		
		                    <div class="cart-guide-a" data-role="collapsible-set"><!-- cart-guide-a -->
		                        <div data-role="collapsible" data-collapsed="true">
		                            <h4>사은품지급유의사항<i class="up-down"><span class="blind">닫기</span></i></h4>
		                            <div class="frame">
		                                <ul class="list list-a">
		                                    <li>사은품은 주문상품과 별도로 개별배송됩니다.</li>
		                                    <li>사은품 이미지 및 색상은 화면과 다를 수 있으며, 사은품 교환 및 환불이 불가능합니다. 또한 신청이 완료된 이후에는 옵션 변경이 불가능합니다.</li>
		                                    <li>사은품은 배송지 주소로 발송되며, 부정확한 정보로 인해 누락될 경우 재발송되지 않습니다.</li>
		                                    <li>주문상품 반품시 사은품도 반납하셔야 하며, 부분반품으로 인하여 사은품 지급대상에서 제외시, 사은품도 함께 반납해 주셔야 합니다.</li>
		                                    <li>사은품은 결제완료 이후에 배송되며, 무통장입금으로 주문하신 경우에는 입금이 완료된 이후에 배송됩니다.</li>
		                                    <li>이벤트 기간 중이라도 사은품 재고가 소진되면 자동 마감될 수 있습니다.</li>
		                                </ul>
		                            </div>
		                        </div>
		                    </div><!-- // cart-guide-a -->     
		                </div>      
		            </div>
		        </div><!-- // free-gift -->
			</c:if>
			</c:if>
        </c:if>
        <%---------------------------------------------------------------- 사은품 리스트 끝 ------------------------------------------------%>

		<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 쿠폰/포인트 사용 없음 --%>
		<c:if test="${empty cartlist[0].ESM_PRD_IDX}"><%-- 견적주문은 쿠폰/포인트 사용 없음 --%>
		<c:choose>
        <c:when test="${empty userInfo}">
        </c:when>
        <c:otherwise>
        	<c:choose>
        		<c:when test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE or userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
        			<c:if test="${userInfo.MEM_MST_DCT_YN ne 'Y'}"><%-- 사용 제한 걸린 경우 제외 --%>
        			<%-- 통합/간편인 경우에만 사용 가능 --%>
        			<%---------------------------------------------------------------- 쿠폰/할인정보 시작 ------------------------------------------------%>
        			
        			<div class="order-sheet accordion discount" data-role="collapsible-set"><!-- discount -->
			            <div class="section" data-role="collapsible" data-collapsed="false">
			                <h3>
			                    <strong>쿠폰/할인정보</strong>
			                    <strong class="warning xlarge span_cart_add_disc_prc">0</strong>원
			                    <i><!-- icon --></i>
			                </h3>
			
			                <div class="toggle-box">
			                    <ul>
			                    	<c:if test="${ empty cartlist[0].ORD_TMP_PRE_CD }">
			                        <li class="article coupon"><!-- coupon -->
			                            <div class="upper">
			                                <h4>상품쿠폰</h4>
			                                <strong class="warning large" id="span_prd_cpn_tot_dc_amt_real">0</strong>원
			                                <p class="desc">
			                                    (적용 가능한 쿠폰 : <fmt:formatNumber value="${fn:length(totPrdCpnSet)}" type="number" /> 장)<br />
			                                    (총 보유쿠폰 : <fmt:formatNumber value="${summaryMap.PRD_MEM_CPN_CNT}" type="number" />장)
			                                </p>
			                                <a href="#discount1" id="discount1Atag" class="js-toggler up-down coupon-more"><i><span class="blind">상품쿠폰 목록 <em>열기</em></span></i></a>
			                            </div>
			                            <div id="discount1" class="downer toggle">
			                                <p class="total">
			                                    <strong>상품쿠폰 총 할인금액  :  <span id="span_prd_cpn_tot_dc_amt">0</span> 원</strong>
			                                </p>
			
			                                <h5>전체 적용가능 쿠폰</h5>
			
			                                <div class="coupon-wrap">
			                                    <ul class="coupon-all">
			                                    	<c:forEach var="row" items="${criterionPrdCpnList }" varStatus="i">
		                                        		<c:if test="${row.dupCnt eq row.totListCnt }">
			                                            	<li class="col">
					                                            <input type="radio" name="dupCoupon" id="dupCoupon_${i.index }" value="${row.CPN_MST_IDX }" class="radio" data-text="${row.CPN_MST_TITLE}(~<ui:formatDate value="${row.END_DATE}" pattern="yy.MM.dd"/>)">
					                                            <label for="dupCoupon_${i.index }">${row.CPN_MST_TITLE}(~<ui:formatDate value="${row.END_DATE}" pattern="yy.MM.dd"/>)</label>
					                                        </li>
		                                        		</c:if>
		                                        	</c:forEach>
			                                    </ul>
			                                </div>
			
			                                <h5>쿠폰을 선택하세요</h5>
			
			                                <div class="coupon-wrap">
			                                    <ul class="coupon-item">
			                                    	<c:forEach var="row" items="${cartlist }">
			                                    		<li class="col">
				                                            <span class="blind">주문한 상품</span>
				                                            <strong><c:out value="${row.PRD_MST_NM }"/>&nbsp;&nbsp;<fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE}" type="number" />원</strong>
				                                            <ul>
				                                            	<c:choose>
				                                                	<c:when test="${not empty row.prdCpnList}">
				                                                		<li>
						                                                    <label for="PRD_CPN_NO_${row.PRD_TMP_IDX }"><span class="tit">행사쿠폰</span></label>
						                                                    <label for="PRD_CPN_NO_${row.PRD_TMP_IDX }" class="sel_box_st0">
						                                                    	<select class="select_prd_cpn" title="적용가능한 쿠폰" id="PRD_CPN_NO_${row.PRD_TMP_IDX }" name="PRD_CPN_NO_${row.PRD_TMP_IDX }" data-prd_tmp_idx="${row.PRD_TMP_IDX }">
						                                                            <option value="">쿠폰을 선택해주세요.</option>
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
						                                                    </label>
						                                                    <span class="small">(<span class="warning">${fn:length(row.prdCpnList)}</span>)</span>
						                                                </li>
						                                                <li class="text-right">
						                                                	<input type="hidden" id="PRD_CPN_PRC_${row.PRD_TMP_IDX}" name="PRD_CPN_PRC_${row.PRD_TMP_IDX}" value="0"/>
						                                                    <span class="tit">할인금액</span>
						                                                    <span class="warning" id="span_cpn_dc_price_${row.PRD_TMP_IDX}">0</span><span class="small">원</span>
						                                                </li>
					                                                </c:when>
					                                                <c:otherwise>
					                                                	<li class="text-center">
						                                                    <span class="tit">행사쿠폰</span>
						                                                    <p class="no-more">적용 가능한 쿠폰이 없습니다.</p>
						                                                </li>
						                                                <li class="text-right">
						                                                	<input type="hidden" id="PRD_CPN_PRC_${row.PRD_TMP_IDX}" name="PRD_CPN_PRC_${row.PRD_TMP_IDX}" value="0"/>
						                                                    <span class="tit">할인금액</span>
						                                                    <span class="warning" id="span_cpn_dc_price_${row.PRD_TMP_IDX}">0</span><span class="small">원</span>
						                                                </li>
					                                                </c:otherwise>
					                                            </c:choose>
				                                            </ul>
				                                        </li>
			                                    	</c:forEach>
			                                    </ul>
			                                </div>
			
			                                <div class="section-button"><!-- section-button -->
			                                    <div class="ui-grid-a">
			                                        <div class="ui-block-a">
			                                            <a href="javascript:couponReset();" class="button full"><span>쿠폰선택초기화</span></a>
			                                        </div>
			                                        <div class="ui-block-b">
			                                             <a href="javascript:prdCpnDiscountAjax();" class="button primary full"><span>선택쿠폰적용하기</span></a>
			                                        </div>
			                                    </div>
			                                </div><!-- // section-button -->      
			                            </div>
			                        </li><!-- // coupon -->
			                        <li class="article coupon-ship"><!-- coupon-ship -->
			                            <div class="upper">
			                                <h4>배송비쿠폰</h4>
			                                <strong class="warning large" id="span_dlv_cpn_tot_dc_amt_real">0</strong>원
			                                <p class="desc">
			                                    (적용 가능한 쿠폰 : <fmt:formatNumber value="${fn:length(totDlvCpnSet)}" type="number" /> 장)
			                                </p>
			                                <a href="#discount2" id="discount2Atag" class="js-toggler up-down coupon-more"><i><span class="blind">상품쿠폰 목록 <em>열기</em></span></i></a>
			                            </div>
			                            <div id="discount2" class="downer toggle">
			                                <h5>쿠폰을 선택하세요</h5>
			
			                                <div class="coupon-wrap">
			                                    <ul class="coupon-item">
			                                    	<c:forEach var="row" items="${cartlist }">
			                                    		<c:choose>
															<c:when test="${row.DLV_BUNDLE_YN eq 'Y' and row.VDR_ROWNUM eq 1}"><%-- 묶음배송 대표 상품 --%>
																<li class="col">
						                                            <span class="blind">주문한 상품</span>
						                                            <strong><c:out value="${row.PRD_MST_NM }"/>&nbsp;&nbsp;<fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE}" type="number" />원</strong>(묶음배송)
						                                            <ul>
						                                                <li>
						                                                    <span class="tit">배송비</span>
						                                                    <strong>
						                                                    	<c:choose>
																					<c:when
																						test="${row.FREE_DLV_CHARGE_YN eq 'Y' or row.FIN_DLV_CHARGE eq 0 }">
																						<span>무료배송</span>
																					</c:when>
																					<c:when test="${row.FREE_DLV_CHARGE_YN ne 'Y'}">
																						<span><fmt:formatNumber value="${row.FIN_DLV_CHARGE}" type="number" />원</span>
																					</c:when>
																				</c:choose>
						                                                    </strong>
						                                                </li>
						                                                <c:choose>
						                                                	<c:when test="${not empty row.dlvCpnList}">
						                                                		<li>
								                                                    <label for="DLV_CPN_NO_${row.PRD_TMP_IDX }"><span class="tit">배송비쿠폰</span></label>
								                                                    <label for="DLV_CPN_NO_${row.PRD_TMP_IDX }" class="sel_box_st0">
								                                                    	<select class="select_dlv_cpn" title="적용가능한 쿠폰" id="DLV_CPN_NO_${row.PRD_TMP_IDX }" name="DLV_CPN_NO_${row.PRD_TMP_IDX }" data-prd_tmp_idx="${row.PRD_TMP_IDX }">
								                                                            <option value="">쿠폰을 선택해주세요</option>
								                                                            <c:forEach var="cpnRow" items="${row.dlvCpnList }">
									                                                        	<option value="${cpnRow.CPN_MST_IDX }">
									                                                        		${cpnRow.CPN_MST_TITLE }
									                                                        		(~<ui:formatDate value="${cpnRow.END_DATE}" pattern="yy.MM.dd"/>)
									                                                        	</option>
									                                                        </c:forEach>
								                                                        </select>
								                                                    </label>
								                                                    <span class="small">(<span class="warning">${fn:length(row.dlvCpnList)}</span>)</span>
								                                                </li>
							                                                </c:when>
							                                                <c:otherwise>
							                                                	<li>
								                                                    <span class="tit">배송비쿠폰</span>
								                                                    <p class="no-more">적용 가능한 쿠폰이 없습니다.</p>
								                                                </li>
							                                                </c:otherwise>
							                                            </c:choose>
						                                            </ul>
						                                        </li>
															</c:when>
															<c:when test="${row.DLV_BUNDLE_YN eq 'Y' and row.VDR_ROWNUM ne 1}"><%-- 묶음배송 기타 상품 --%>
																<li class="col">
						                                            <span class="blind">주문한 상품</span>
						                                            <strong><c:out value="${row.PRD_MST_NM }"/>&nbsp;&nbsp;<fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE}" type="number" />원</strong>(묶음배송)
						                                        </li>
															</c:when>
															<c:when test="${row.DLV_BUNDLE_YN eq 'N'}"><%-- 개별배송 상품 --%>
																<li class="col">
																	<span class="blind">주문한 상품</span>
							                                        <strong><c:out value="${row.PRD_MST_NM }"/>&nbsp;&nbsp;<fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE}" type="number" />원</strong>
							                                        <ul>
						                                                <li>
						                                                    <span class="tit">배송비</span>
						                                                    <strong>
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
						                                                    </strong>
						                                                </li>
						                                                <c:choose>
						                                                	<c:when test="${not empty row.dlvCpnList}">
						                                                		<li>
								                                                    <label for="DLV_CPN_NO_${row.PRD_TMP_IDX }"><span class="tit">배송비쿠폰</span></label>
								                                                    <label for="DLV_CPN_NO_${row.PRD_TMP_IDX }" class="sel_box_st0">
								                                                    	<select class="select_dlv_cpn" title="적용가능한 쿠폰" id="DLV_CPN_NO_${row.PRD_TMP_IDX }" name="DLV_CPN_NO_${row.PRD_TMP_IDX }" data-prd_tmp_idx="${row.PRD_TMP_IDX }">
								                                                            <option value="">쿠폰을 선택해주세요</option>
								                                                            <c:forEach var="cpnRow" items="${row.dlvCpnList }">
									                                                        	<option value="${cpnRow.CPN_MST_IDX }">
									                                                        		${cpnRow.CPN_MST_TITLE }
									                                                        		(~<ui:formatDate value="${cpnRow.END_DATE}" pattern="yy.MM.dd"/>)
									                                                        	</option>
									                                                        </c:forEach>
								                                                        </select>
								                                                    </label>
								                                                    <span class="small">(<span class="warning">${fn:length(row.dlvCpnList)}</span>)</span>
								                                                </li>
							                                                </c:when>
							                                                <c:otherwise>
							                                                	<li>
								                                                    <span class="tit">배송비쿠폰</span>
								                                                    <p class="no-more">적용 가능한 쿠폰이 없습니다.</p>
								                                                </li>
							                                                </c:otherwise>
							                                            </c:choose>
						                                            </ul>
					                                            </li>
															</c:when>
														</c:choose>
			                                    	</c:forEach>
			                                    </ul>
			                                </div>
			
			                                <div class="section-button"><!-- section-button -->
			                                    <a href="javascript:dlvCpnDiscountAjax();" class="button primary"><span>선택쿠폰적용하기</span></a>
			                                </div><!-- // section-button -->
			                            </div>
			                        </li><!-- // coupon-ship -->
			                        </c:if>
			                        
			                        <%-- 통합회원만 포인트/캐쉬백 사용 가능 --%>
	                                <c:if test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
	                                	<c:choose>
	                                		<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">
	                                			<li class="article mileage"><!-- mileage -->
						                            <div class="upper">
						                                <h4>포인트</h4>
						                                <input type="number" class="text number" id="toUseMileage" name="toUseMileage" title="사용할 포인트" value="0"> P
						                                <input type="checkbox" id="allMileageUseChk" class="checkbox">
						                                <label for="allMileageUseChk">모두사용</label>
						                                <p class="desc">
						                                    	보유 포인트 : <span id="span_SOLUBLE_MILEAGE"><fmt:formatNumber value="${SOLUBLE_MILEAGE}" type="number" /></span>
						                                </p>
						                                <p class="desc">
						                                    <span class="warning">당월 소멸 예정 포인트 : <span id="span_extinctMileage"><fmt:formatNumber value="${extinctMileage}" type="number" /></span></span>
						                                </p>
						                            </div>
						                        </li><!-- // mileage -->
	                                		</c:when>
	                                		<c:otherwise>
	                                			<li class="article mileage"><!-- mileage -->
						                            <div class="upper">
						                                <h4>포인트</h4>
						                                <input type="hidden" id="toUseMileage" name="toUseMileage" value="<c:out value=" ${PRE_USED_MLG}"/>"> 
						                                <fmt:formatNumber value="${PRE_USED_MLG}" type="number" /> P
						                            </div>
						                        </li><!-- // mileage -->
	                                		</c:otherwise>
	                                	</c:choose>
	                                	<%-- <c:if test="${ empty cartlist[0].ORD_TMP_PRE_CD }"> --%><%-- 재주문시 캐쉬백 사용 가능 --%>
	                                		<li class="article okcashbag"><!-- okcashbag -->
					                            <div class="upper">
					                                <h4>OK캐쉬백</h4>
					                                <input type="number" class="text number" id="toUseCashbag" name="toUseCashbag" title="사용할 OK캐쉬백" value="0"> 포인트
					                                <input type="checkbox" id="allCashbagUseChk" class="checkbox">
					                                <label for="allCashbagUseChk">모두사용</label>
					                                <p class="check">
					                                    	포인트 조회
					                                    <a href="#okcashbagCheck" class="js-toggler up-down"><i><span class="blind">즉시할인 금액 <em>열기</em></span></i></a>
					                                </p>
					                            </div>
					                            <div id="okcashbagCheck" class="downer toggle">
					                                <ul>
					                                    <li class="nth-child-1">
					                                        <label for="cashbag1">카드번호</label>
					                                        <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>" type="text" id="cashbag1" maxlength="4" class="text" title="OK캐쉬백 카드번호 첫째자리">
					                                        <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>" type="text" id="cashbag2" maxlength="4" class="text" title="OK캐쉬백 카드번호 둘째자리">
					                                        <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 8, 12) }"/>" type="text" id="cashbag3" maxlength="4" class="text" title="OK캐쉬백 카드번호 셋째자리">
					                                        <input value="<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 12, 16) }"/>" type="text" id="cashbag4" maxlength="4" class="text" title="OK캐쉬백 카드번호 넷째자리">
					                                    </li>
					                                    <li class="nth-child-2">
					                                        <label for="cashbagPw">비밀번호</label>
					                                        <input type="password" id="cashbagPw" class="text" value="" maxlength="30">
					                                        <a href="javascript:checkCashBagPoint();" class="button primary small"><span>조회</span></a>
					                                        <p class="desc">
					                                        	<input type="hidden" id="cashbagRemainPoint" value="0"/>
					                                            <span class="warning small">보유 포인트 : <span id="span_cashbagRemainPoint">0</span></span>
					                                        </p>
					                                    </li>
					                                </ul>
					                            </div>
					                        </li><!-- // okcashbag -->
	                                	<%-- </c:if> --%>
			                        </c:if>
			                    </ul>
			
			                    <div class="cart-guide-a" data-role="collapsible-set"><!-- cart-guide-a -->
			                        <div data-role="collapsible" data-collapsed="true">
			                            <h4>유의사항<i class="up-down"><span class="blind">닫기</span></i></h4>
			                            <div class="frame">
			                                <ul class="list list-a">
			                                    <li>포인트는 10,000P 이상부터 사용 가능하며, 소멸예정 포인트가 포함되어 있습니다.</li>
			                                    <li>소멸예정 포인트는 당월 말까지 사용하지 않으면 자동소멸되며, 1P 부터 사용 가능합니다.</li>
			                                    <li>배송비는 포인트로 결제할수 없습니다. </li>
			                                    <li>쿠폰과 포인트를 동시에 사용하는 경우에는 쿠폰을 먼저 사용하신 후, 포인트를 사용할 수 있습니다. </li>
			                                    <li>쿠폰마다 사용제한 조건이 다를 수 있으며, 일부 상품은 쿠폰 사용에 제외될 수 있습니다. </li>
			                                    <li>OK캐쉬백포인트는 포인트조회하시면 보유포인트를 확인 할 수 있습니다. </li>
			                                    <li>OK캐쉬백 카드번호는 회원가입시 발급된 카드번호이며, 비밀번호는 영문, 숫자 혼용 10 ~ 12자리 문자입니다.</li>
			                                </ul>
			                            </div>
			                        </div>
			                    </div><!-- // cart-guide-a -->     
			                </div>      
			            </div>
			        </div><!-- // discount -->

					<%---------------------------------------------------------------- 쿠폰/할인정보 끝 ------------------------------------------------%>
					</c:if>
        		</c:when>
        	</c:choose>
        </c:otherwise>
       </c:choose>
       </c:if>
       </c:if>
		
		<%---------------------------------------------------------------- 주문고객 정보 시작 ------------------------------------------------%>
		<c:choose>
       		<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">
       			<c:choose>
					<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD}"><%-- 겟잇나우인 경우 --%>
						<div class="order-sheet accordion orderer" data-role="collapsible-set"><!-- orderer -->
				            <div class="section" data-role="collapsible" data-collapsed="false">
				                <h3>
				                    <strong>주문고객정보</strong>
				                    <strong class="small"><c:out value="${userInfo.MEM_MST_MEM_NM }"/></strong>
				                    <i><!-- icon --></i>
				                </h3>
				
				                <div class="toggle-box">
				                    <ul class="form-a">
				                        <li class="name">
				                            <div class="tit">
				                                <label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
				                            </div>
				                            <div class="field">
				                            	<input type="hidden" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>"/>
				                                <c:out value="${userInfo.MEM_MST_MEM_NM }"/>
				                            </div>
				                        </li>
				                        <li class="tel">
				                            <div class="tit">
				                                <label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
				                            </div>
				                            <div class="field">
			                                    <input type="hidden" id="ORD_MST_HP1" name="ORD_MST_HP1" value="<c:out value="${userInfo.MEM_MST_HP1 }"/>"/>
			                                    <c:out value="${userInfo.MEM_MST_HP1 }"/>
			                                    -
			                                    <input type="hidden" id="ORD_MST_HP2" name="ORD_MST_HP2" value="<c:out value="${userInfo.MEM_MST_HP2 }"/>"/>
			                                    <c:out value="${userInfo.MEM_MST_HP2 }"/>
							                    -
							                    <input type="hidden" id="ORD_MST_HP3" name="ORD_MST_HP3" value="<c:out value="${userInfo.MEM_MST_HP3 }"/>"/>
							                    <c:out value="${userInfo.MEM_MST_HP3 }"/>
				                            </div>
				                        </li>
				                        <li class="mail">
				                            <div class="tit">
				                                <label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label>
				                            </div>
				                            <div class="field">
				                                <p>
				                                    <input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>"/>
				                                	<input type="hidden" name="EMAIL_DOMAIN" id="EMAIL_DOMAIN" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>"/>
				                                	<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>
				                                </p>
				                            </div>
				                        </li>
				                    </ul>
				                </div>      
				            </div>
				        </div><!-- // orderer -->
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }"><%-- 기업회원인 경우 수정 불가 --%>
								<div class="order-sheet accordion orderer" data-role="collapsible-set"><!-- orderer -->
						            <div class="section" data-role="collapsible" data-collapsed="false">
						                <h3>
						                    <strong>주문고객정보</strong>
						                    <strong class="small"><c:out value="${userInfo.MEM_MST_MEM_NM }"/></strong>
						                    <i><!-- icon --></i>
						                </h3>
						
						                <div class="toggle-box">
						                    <ul class="form-a">
						                    	<li class="name">
						                            <div class="tit">
						                                <label for="MEM_CPR_NM">기업명</label>
						                            </div>
						                            <div class="field">
						                                <c:out value="${userInfo.MEM_CPR_NM }"/>
						                            </div>
						                        </li>
						                        <li class="name">
						                            <div class="tit">
						                                <label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
						                            </div>
						                            <div class="field">
						                            	<input type="hidden" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>"/>
						                                <c:out value="${userInfo.MEM_MST_MEM_NM }"/>
						                            </div>
						                        </li>
						                        <li class="tel">
						                            <div class="tit">
						                                <label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
						                            </div>
						                            <div class="field">
					                                    <input type="hidden" id="ORD_MST_HP1" name="ORD_MST_HP1" value="<c:out value="${userInfo.MEM_MST_HP1 }"/>"/>
					                                    <c:out value="${userInfo.MEM_MST_HP1 }"/>
					                                    -
					                                    <input type="hidden" id="ORD_MST_HP2" name="ORD_MST_HP2" value="<c:out value="${userInfo.MEM_MST_HP2 }"/>"/>
					                                    <c:out value="${userInfo.MEM_MST_HP2 }"/>
									                    -
									                    <input type="hidden" id="ORD_MST_HP3" name="ORD_MST_HP3" value="<c:out value="${userInfo.MEM_MST_HP3 }"/>"/>
									                    <c:out value="${userInfo.MEM_MST_HP3 }"/>
						                            </div>
						                        </li>
						                        <li class="mail">
						                            <div class="tit">
						                                <label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label>
						                            </div>
						                            <div class="field">
						                                <p>
						                                    <input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>"/>
						                                	<input type="hidden" name="EMAIL_DOMAIN" id="EMAIL_DOMAIN" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>"/>
						                                	<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>
						                                </p>
						                            </div>
						                        </li>
						                    </ul>
						                </div>      
						            </div>
						        </div><!-- // orderer -->
							</c:when>
							<c:otherwise>
								<div class="order-sheet accordion orderer" data-role="collapsible-set"><!-- orderer -->
						            <div class="section" data-role="collapsible" data-collapsed="false">
						                <h3>
						                    <strong>주문고객정보</strong>
						                    <strong class="small"><c:out value="${userInfo.MEM_MST_MEM_NM }"/></strong>
						                    <i><!-- icon --></i>
						                </h3>
						
						                <div class="toggle-box">
						                    <ul class="form-a">
						                        <li class="name">
						                            <div class="tit">
						                                <label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
						                            </div>
						                            <div class="field">
						                                <input type="text" class="text" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" maxlength="15" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>">
						                            </div>
						                        </li>
						                        <li class="tel">
						                            <div class="tit">
						                                <label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
						                            </div>
						                            <div class="field">
						                                <label for="ORD_MST_HP1" class="sel_box_st0">
						                                    <select id="ORD_MST_HP1" name="ORD_MST_HP1" class="select">
						                                        <option value="">선택</option>
											                    <c:if test="${not empty hpCodeList }">
											                         <c:forEach var="hpRow" items="${hpCodeList }">
											                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${userInfo.MEM_MST_HP1 eq hpRow.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
											                         </c:forEach>
											                     </c:if>
						                                    </select>
						                                </label> -
						                                <input type="number" id="ORD_MST_HP2" name="ORD_MST_HP2" class="text small number" maxlength="4"  title="휴대폰 번호 중간자리" value="<c:out value="${userInfo.MEM_MST_HP2 }"/>"> -
						                                <input type="number" id="ORD_MST_HP3" name="ORD_MST_HP3" class="text small number"  maxlength="4" title="휴대폰 번호 끝자리" value="<c:out value="${userInfo.MEM_MST_HP3 }"/>">
						                            </div>
						                        </li>
						                        <li class="mail">
						                            <div class="tit">
						                                <label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label>
						                            </div>
						                            <div class="field">
						                                <p>
						                                    <input type="text" class="text email id" name="EMAIL_ID" id="EMAIL_ID" maxlength="30" title="이메일 아이디" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>"/> @
						                                    <input type="text" class="text email domain" name="EMAIL_DOMAIN" id="EMAIL_DOMAIN" maxlength="30" title="이메일 도메인" value="<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>"/>
						                                </p>
						                                <p>
						                                    <label for="emailDomainSelectbox" class="sel_box_st0">
						                                        <select id="emailDomainSelectbox" class="select">
						                                            <option value="">직접입력</option>
						                                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
									                                    <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
									                                        <option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${emailRow.CMN_COM_NM eq fn:split(userInfo.MEM_MST_MAIL,'@')[1]}">selected="selected"</c:if>><c:out value="${emailRow.CMN_COM_NM }"/></option>
									                                    </c:forEach>
									                                </c:if>
						                                        </select>
						                                    </label>
						                                </p>
						                            </div>
						                        </li>
						                    </ul>
						                </div>      
						            </div>
						        </div><!-- // orderer -->
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise><%-- 재주문인 경우 --%>
				<div class="order-sheet accordion orderer" data-role="collapsible-set"><!-- orderer -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>주문고객정보</strong>
		                    <strong class="small"><c:out value="${preOrderInfo.MEM_MST_MEM_NM }"/></strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a">
		                        <li class="name">
		                            <div class="tit">
		                                <label for="ORD_MST_ORD_NM">주문하시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
		                            </div>
		                            <div class="field">
		                                <c:out value="${preOrderInfo.ORD_MST_ORD_NM }"/>
		                            </div>
		                        </li>
		                        <li class="tel">
		                            <div class="tit">
		                                <label for="ordererPhone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
		                            </div>
		                            <div class="field">
		                                <label for="ordererPhone" class="sel_box_st0">
		                                    <c:out value="${preOrderInfo.ORD_MST_HP1 }"/>
		                                    -
		                                    <c:out value="${preOrderInfo.ORD_MST_HP2 }"/>
						                    -
						                    <c:out value="${preOrderInfo.ORD_MST_HP3 }"/>
		                                </label>
		                            </div>
		                        </li>
		                        <li class="mail">
		                            <div class="tit">
		                                <label for="EMAIL_ID">이메일 주소<span class="essential"><em class="blind">필수입력</em></span></label>
		                            </div>
		                            <div class="field">
		                                <p>
		                                    <c:out value="${fn:split(preOrderInfo.ORD_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(preOrderInfo.ORD_MST_MAIL,'@')[1] }"/>
		                                </p>
		                            </div>
		                        </li>
		                    </ul>
		                </div>      
		            </div>
		        </div><!-- // orderer -->
			</c:otherwise>		
		</c:choose>
		<%---------------------------------------------------------------- 주문고객 정보 끝 ------------------------------------------------%>

		<%---------------------------------------------------------------- 배송지 정보 시작 ------------------------------------------------%>
        <%@ include file="/WEB-INF/jsp/mobile/cart/include/cartpaymentDlvInfo.jsp" %>
        <%---------------------------------------------------------------- 배송지 정보 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 매장위치 확인 팝업 시작 ------------------------------------------------%>
        <section id="shopInfo" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #shopInfo -->
        </section><!-- // #shopInfo -->
        <%---------------------------------------------------------------- 매장위치 확인 팝업 끝 ------------------------------------------------%>
        
		<%---------------------------------------------------------------- 적립/혜택 정보 시작 ------------------------------------------------%>
		<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 적립/혜택 없음 --%>
		<c:choose>
			<c:when test="${empty userInfo }">
			</c:when>
			<c:when test="${userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE or userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }"><%-- 간편/기업은 적립혜택 없음 --%>
			</c:when>
			<c:otherwise>
				<div class="order-sheet accordion point" data-role="collapsible-set"><!-- point -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>적립/혜택정보</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a">
		                        <li>
		                            <div class="tit">
		                                포인트
		                            </div>
		                            <div class="field">
		                                <strong class="warning" id="span_saveMlg"><fmt:formatNumber value="${cart_reserve_mileage}" type="number" /></strong> P 적립예정
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">
		                                OK캐쉬백
		                            </div>
		                            <div class="field">
		                                <strong class="warning" id="span_saveCashbag"><fmt:formatNumber value="${cartlist[0].SUM_RESERVE_CASHBAG}" type="number" /></strong> 포인트 적립예정
		                            </div>
		                        </li>
		                    </ul>
		                    <p class="desc">
		                        - 포인트는 구매가 확정 되면 자동으로 적립됩니다.
		                    </p>
		                </div>      
		            </div>
		        </div><!-- // point -->
			</c:otherwise>
		</c:choose>
		</c:if>
        <%---------------------------------------------------------------- 적립/혜택 정보 끝 ------------------------------------------------%>

		<%---------------------------------------------------------------- 결제방법 시작 ------------------------------------------------%>
		<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 적립/혜택 없음 --%>
        <div class="order-sheet accordion payment-way" data-role="collapsible-set"><!-- payment-way -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong>결제정보</strong>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <div class="upper">
                    	<input id="radioPayment_0" class="radio radioPayment" type="radio" name="radioPayment" value="${Code.PAY_MILEAGE}" style="display : none;"/>
                        <ul class="ct">
                        	<c:forEach var="item" items="${codes.PAY_TYPE}" varStatus="i">
                        		<c:set var="c_show_yn" value="N"/>
                        		<c:if test="${item.CMN_COM_ETC3 ne 'N'}">
                        			<c:choose>
		                      			<c:when test="${not empty cartlist[0].ORD_TMP_PRE_CD }"><%-- 재주문인 경우 신용카드/실시간계좌이체/해외카드만 가능 --%>
		                      				<c:if test="${item.CMN_COM_IDX eq Code.PAY_CARD or  item.CMN_COM_IDX eq Code.PAY_ACCOUNT or item.CMN_COM_IDX eq Code.PAY_FOREIGN_CARD}">
		                      					<c:set var="c_show_yn" value="Y"/>
		                      				</c:if>
		                      			</c:when>
		                      			<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }"><%-- 겟잇나우인 경우 신용카드 가능 --%>
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
		                      			<li>
			                                <input type="radio" id="radioPayment_${item.CMN_COM_IDX}" name="radioPayment" class="radio radioPayment" value="${item.CMN_COM_IDX }" <c:if test="${i.index eq 0}">checked="checked"</c:if>>
			                                <label for="radioPayment_${item.CMN_COM_IDX}"><c:out value="${item.CMN_COM_NM }"/></label>
			                            </li>
		                      		</c:if>
                        		</c:if>
                        	</c:forEach>
                        </ul>
                    </div>

                    <div class="downer card pay-way pay-way_${Code.PAY_CARD}"><!-- 신용카드 -->
                        <ul class="form-a">
                            <li>
                                <div class="tit">
                                    <label for="sp_card_cd1">카드종류</label>
                                </div>
                                <div class="field">
                                    <label for="sp_card_cd1" class="sel_box_st0">
                                        <select name="sp_card_cd1" id="sp_card_cd1" class="select">
                                            <option value="">카드선택</option>
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
                                    </label>
                                </div>
                            </li>
                            <li class="monthly">
                                <div class="tit">
                                    	할부종류
                                </div>
                                <div class="field">
                                	<c:choose>
                                       	<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}"><%-- 장기할부인 경우 --%>
                                       		<p>
                                       			<input type="radio" id="sp_noint1" name="sp_noint1" value="02" checked="checked" style="display: none;"/>
                                        		<input type="hidden" id="freeInterestList" value="<c:out value="${cartlist[0].ORD_TMP_LNG_DIV }"/>"/>
                                        		<input type="hidden" id="noFreeInterestList" value=""/>
                                        		무이자할부 <c:out value="${cartlist[0].ORD_TMP_LNG_DIV }"/>개월
                                       		</p>
                                        </c:when>
                                        <c:otherwise>
                                        	<p>
		                                        <input type="radio" id="sp_noint1" name="sp_noint1" value="00" checked="checked" class="radio" data-desc_yn="N">
		                                        <label for="sp_noint1">일시불</label>
		                                    </p>
		                                    <p id="freeInterestListLabel">
		                                        <input type="radio" id="monthly2" name="sp_noint1" class="radio" value="02" data-desc_yn="N">
		                                        <label for="monthly2">무이자할부</label>
		                                        <label class="sel_box_st0">
		                                            <select class="select interestList" id="freeInterestList" title="무이자할부 개월 수">
		                                                <option value="">선택</option>
		                                            </select>
		                                        </label>
		                                    </p>
		                                    <p id="noFreeInterestListLabel">
		                                        <input type="radio" id="monthly3" name="sp_noint1" class="radio" value="00" data-desc_yn="Y">
		                                        <label for="monthly3">일반할부</label>
		                                        <label class="sel_box_st0">
		                                            <select class="select interestList" id="noFreeInterestList" title="무이자할부 개월 수">
		                                                <option value="">선택</option>
		                                            </select>
		                                        </label>
		                                    </p>
		                                    <p class="primary" id="divInterest" style="display: none;">
		                                    </p>
                                        </c:otherwise>
                                    </c:choose>    	
                                </div>
                            </li>
                            <li id="li_samsung_pnt" style="display: none;">
                                <div class="tit">
                                    <label for="cardPoint">카드포인트<br />사용</label>
                                </div>
                                <div class="field">
                                    <p>
                                        <input type="radio" id="sp_point_useyn1" name="sp_point_useyn" class="radio" value="Y">
                                        <label for="sp_point_useyn1">카드 포인트 사용</label>
                                    </p>
                                    <p>
                                        <input type="radio" id="sp_point_useyn" name="sp_point_useyn" class="radio" value="N" checked="checked">
                                        <label for="sp_point_useyn">사용 안함</label>
                                    </p>
                                    <ul class="list list-a desc">
                                        <li>[포인트 Tip] 포인트로 현금처럼 결제하세요.</li>
                                        <li>삼성카드 보너스 포인트<br />
                                            	보너스 포인트 1점 이상 보유 시 1포인트 단위로 사용 가능
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                        <div class="guide">
                            <p class="primary">
                                	신용카드 매출전표는 부가가치세법 제32조의 3 제 3항에 의하여 발행되며, 동법 시행령 제57조 제2항에 의하여 세금계산서를 교부하지 않습니다.
                            </p>
                        </div>
                        <div class="action">
                            <a href="javascript:$.com.util.layPop('open', $('#cardBenefit'), true);" class="button primary"><span>카드혜택안내</span></a>
                        </div>
                    </div><!-- // 신용카드 -->
                    
                    
                    <div class="downer card pay-way pay-way_${Code.PAY_FOREIGN_CARD}"><!-- 해외카드 -->
                        <ul class="form-a">
                            <li>
                                <div class="tit">
                                    <label for="sp_card_cd2">카드종류</label>
                                </div>
                                <div class="field">
                                    <label for="sp_card_cd2" class="sel_box_st0">
                                        <select name="sp_card_cd2" id="sp_card_cd2" class="select">
                                            <option value="">카드선택</option>
                                            <option value="050" data-req_type = "MPI" data-crd_inf_idx = "0">해외 VISA</option>
                                          	<option value="028" data-req_type = "MPI" data-crd_inf_idx = "0">해외 JCB</option>
                                          	<option value="048" data-req_type = "MPI" data-crd_inf_idx = "0">동양 다이너스</option>
                                          	<option value="046" data-req_type = "MPI" data-crd_inf_idx = "0">동양 해외</option>
                                          	<option value="049" data-req_type = "MPI" data-crd_inf_idx = "0">해외 MASTER</option>
                                          	<option value="081" data-req_type = "MPI" data-crd_inf_idx = "0">은련</option>
                                        </select>
                                    </label>
                                </div>
                            </li>
                            <li class="monthly">
                                <div class="tit">
                                    	할부종류
                                </div>
                                <div class="field">
                                    <p>
                                        <input type="radio" id="sp_noint2" name="sp_noint2" value="00" checked="checked" class="radio" data-desc_yn="N">
                                        <label for="sp_noint2">일시불</label>
                                    </p>
                                </div>
                            </li>
                        </ul>
                        <div class="guide">
                            <p class="primary">
                                	신용카드 매출전표는 부가가치세법 제32조의 3 제 3항에 의하여 발행되며, 동법 시행령 제57조 제2항에 의하여 세금계산서를 교부하지 않습니다.
                            </p>
                        </div>
                        <div class="action">
                            <a href="javascript:$.com.util.layPop('open', $('#cardBenefit'), true);" class="button primary"><span>카드혜택안내</span></a>
                        </div>
                    </div><!-- // 신용카드 -->
                    
                    
                    
                    <section id="cardBenefit" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #cardBenefit -->
                        <dl class="ui-content">
                            <dt>
                                <h2>카드혜택안내</h2>
                                <a href="javascript:$.com.util.layPop('close', $('#cardBenefit'), true)" class="btn_close"><span class="blind">팝업 닫기</span></a>
                            </dt>
                            <dd class="dd_con_d">
                                <div class="card-guide accordion" data-role="collapsible-set"><!-- card-guide -->
                                    <div data-role="collapsible" data-collapsed="false">
                                        <h3><strong>무이자 안내</strong><i><!-- icon --></i></h3>

                                        <div class="toggle-box">
                                        	<c:choose>
                            					<c:when test="${not empty cardEventFreetList }">
                            						<ul class="card-list">
                            							<c:forEach var="row" items="${cardEventFreetList }" varStatus="i">
                            								<c:if test="${row.RNUM eq 1 }">
				                                                <li>
				                                                	<div class="tit">
				                                                        <span class="card card-${row.DIV_DTL_CD}"><!-- card --></span>
				                                                    </div>
				                                                    <div class="field">
				                                                        <p>
				                                                        	( ${row.DIV_DTL_PRC}만원 <span class="up"><em class="blind">이상 구매시</em></span>) <br />
				                                                        	<c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST }"><%-- 무이자만 출력 --%>
				                                                            	${row.DIV_INF_MNT } 개월 무이자 할부<br/> 
				                                                        	</c:if>
				                                                        	<c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST }"><%-- 부분무이자/특별무이자만 출력 --%>
				                                                        		<c:forEach var="month" items="${fn:split(row.DIV_INF_MNT, ',')}" varStatus="monthStatus">
														                    		<span>${month }</span>개월 ${row.DIV_INF_GBN_NM }
														                    		<c:if test="${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index] ne '-' }">
														                    			(${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index]})
														                    		</c:if>
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
				                                                    </div>
				                                                </li>
			                                                </c:if>
		                                                </c:forEach>
		                                            </ul>
                            					</c:when>
                            					<c:otherwise>
                            						<p class="no-more">
	                                                	진행중인 신용카드 혜택이 없습니다.
		                                            </p>
                            					</c:otherwise>
                            				</c:choose>

                                            <div class="frame frame-a mt10">
                                                <ul class="list list-a">
                                                    <li>위 결제액은 최종 결제금액 기준이며, 기준금액 미만이거나, 무이자할부가 되지 않는 신용카드를 사용하시는 경우 일반할부로 결제되오니 유의하시기 바랍니다.</li>
                                                    <li>무이자할부 이용시 카드포인트가 미적립될 수 있습니다. (자세한 내용은 카드사 홈페이지 참조)</li>
                                                    <li><span class="warning">법인카드, 체크카드, 기프트카드, 선불카드는 대상카드가 아닙니다.</span></li>
                                                </ul>
                                            </div>
                                        </div>
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

                                    <div data-role="collapsible" data-collapsed="true">
                                        <h3><strong>청구할인 안내</strong><i><!-- icon --></i></h3>

                                        <div class="toggle-box">
                                        	<c:choose>
                            					<c:when test="${c_promotion_charge_cnt gt 0 }">
                            						<ul class="card-list">
                            							<c:forEach var="row" items="${cardPromotionList }">
                            								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CHARGE }">
				                                                <li>
				                                                    <div class="tit">
				                                                        <span class="card card-${row.PMT_CRD_IDX }"><!-- card --></span>
				                                                    </div>
				                                                    <div class="field">
				                                                        <p>
				                                                            ( ${row.PMT_CRD_SML_PRC}만원 <span class="up"><em class="blind">이상 구매시</em></span>) <br />
				                                                            <c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
							                                            		${row.PMT_CRD_SAL_PRC }%
							                                            	</c:if>
							                                            	<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
							                                            		${row.PMT_CRD_SAL_PRC }만원
							                                            	</c:if>
							                                            	청구할인, 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
							                                            	(~${row.END_DATE })
				                                                        </p>
				                                                    </div>
				                                                </li>
			                                                </c:if>
		                                                </c:forEach>
		                                            </ul>
                            					</c:when>
                            					<c:otherwise>
                            						<p class="no-more">
	                                                	진행중인 신용카드 혜택이 없습니다.
		                                            </p>
                            					</c:otherwise>
                            				</c:choose>

                                            <div class="frame frame-a mt10">
                                                <ul class="list list-a">
                                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div data-role="collapsible" data-collapsed="true">
                                        <h3><strong>캐쉬백 안내</strong><i><!-- icon --></i></h3>

                                        <div class="toggle-box">
                                        	<c:choose>
                            					<c:when test="${c_promotion_cashbag_cnt gt 0 }">
                            						<ul class="card-list">
                            							<c:forEach var="row" items="${cardPromotionList }">
                            								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CASHBAG }">
				                                                <li>
				                                                    <div class="tit">
				                                                        <span class="card card-${row.PMT_CRD_IDX }"><!-- card --></span>
				                                                    </div>
				                                                    <div class="field">
				                                                        <p>
				                                                            ( ${row.PMT_CRD_SAL_PRC}만원 <span class="up"><em class="blind">이상 구매시</em></span>) <br />
							                                                            최소 <fmt:formatNumber value="${row.PMT_CRD_SML_PRC}" />만원 ~
							                                            	최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
							                                            	(~${row.END_DATE })
				                                                        </p>
				                                                    </div>
				                                                </li>
			                                                </c:if>
		                                                </c:forEach>
		                                            </ul>
                                        		</c:when>
                            					<c:otherwise>
                            						<p class="no-more">
	                                                	진행중인 신용카드 혜택이 없습니다.
		                                            </p>
                            					</c:otherwise>
                            				</c:choose>

                                            <div class="frame frame-a mt10">
                                                <ul class="list list-a">
                                                    <li>카드사별 행사 적용모델이 다를 수 있으며,  카드혜택 안내 페이지를 참조해주세요</li>
                                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div data-role="collapsible" data-collapsed="true">
                                        <h3><strong>포인트적립 안내</strong><i><!-- icon --></i></h3>

                                        <div class="toggle-box">
                                        	<c:choose>
                            					<c:when test="${c_promotion_point_save_cnt gt 0 }">
                            						<ul class="card-list">
                            							<c:forEach var="row" items="${cardPromotionList }">
                            								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_SAVE }">
				                                                <li>
				                                                    <div class="tit">
				                                                        <span class="card card-${row.PMT_CRD_IDX }"><!-- card --></span>
				                                                    </div>
				                                                    <div class="field">
				                                                        <p>
				                                                            ( ${row.PMT_CRD_SML_PRC}만원 <span class="up"><em class="blind">이상 구매시</em></span>) <br />
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
				                                                    </div>
				                                                </li>
			                                                </c:if>
		                                                </c:forEach>
		                                            </ul>
                                        		</c:when>
                            					<c:otherwise>
                            						<p class="no-more">
	                                                	진행중인 신용카드 혜택이 없습니다.
		                                            </p>
                            					</c:otherwise>
                            				</c:choose>

                                            <div class="frame frame-a mt10">
                                                <ul class="list list-a">
                                                    <li>무이자할부 이용시 카드포인트가 미적립될 수 있습니다. (자세한 내용은 카드사 홈페이지 참조)</li>
                                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div data-role="collapsible" data-collapsed="true">
                                        <h3><strong>포인트선할인 안내</strong><i><!-- icon --></i></h3>

                                        <div class="toggle-box">
                                        	<c:choose>
                            					<c:when test="${c_promotion_point_dc_cnt gt 0 }">
                            						<ul class="card-list">
                            							<c:forEach var="row" items="${cardPromotionList }">
                            								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_DC }">
				                                                <li>
				                                                    <div class="tit">
				                                                        <span class="card card-${row.PMT_CRD_IDX }"><!-- card --></span>
				                                                    </div>
				                                                    <div class="field">
				                                                        <p>
				                                                            ( ${row.PMT_CRD_SAL_PRC}만원 <span class="up"><em class="blind">이상 구매시</em></span>) <br />
										                                              최소 <fmt:formatNumber value="${row.PMT_CRD_SML_PRC}" />만원 ~
							                                            	최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
							                                            	(~${row.END_DATE })
				                                                        </p>
				                                                    </div>
				                                                </li>
			                                                </c:if>
		                                                </c:forEach>
		                                            </ul>
                                        		</c:when>
                            					<c:otherwise>
                            						<p class="no-more">
	                                                	진행중인 신용카드 혜택이 없습니다.
		                                            </p>
                            					</c:otherwise>
                            				</c:choose>

                                            <div class="frame frame-a mt10">
                                                <ul class="list list-a">
                                                    <li>위 결제액은 최종 결제금액 기준이며, 기준금액 미만이거나, 무이자할부가 되지 않는 신용카드를 사용하시는 경우 일반할부로 결제되오니 유의하시기 바랍니다.</li>
                                                    <li>카드사 혜택은 카드사 및 자사 상황에 따라 축소되거나,  조기 종료될 수 있습니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- // card-guide -->
                            </dd>
                        </dl>
                    </section><!-- // #cardBenefit -->

                    <div class="downer account-a pay-way pay-way_${Code.PAY_ACCOUNT}"><!-- 실시간계좌이체 -->
                        <ul class="form-a">
                            <c:set var="c_cash_receipt_no" value="0"/>
                            <%@ include file="/WEB-INF/jsp/mobile/cart/include/cartpaymentCashReceipt.jsp" %>
                            <li class="guide">
                                <h4>실시간계좌이체 결제 안내</h4>
                                <ul class="list list-a">
                                    <li>실시간 계좌 이체 서비스는 은행계좌만 있으면 누구나 이용하실 수 있는 서비스로, 결제와 동시에 즉시 이체됩니다.</li>
                                    <li>결제 시 공인인증서가 반드시 필요합니다.</li>
                                    <li>은행 이용가능 서비스 시간은 은행사정에 따라 다소 변동될 수 있습니다.</li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- // 실시간계좌이체 -->

                    <div class="downer kakaopay pay-way pay-way_${Code.PAY_KAKAOPAY}"><!-- 카카오페이 -->
                        <ul class="form-a">
                            <li>
                                <h4>카카오페이 결제안내</h4>

                                <ul class="list list-a">
                                    <li>카카오페이는 개인 신용카드를 카카오톡앱에 등록/인증하여 결제하는 방식으로 최초 1회 결제정보만 입력하여 간편하게 결제하실 수 있는 모바일 결제 서비스 입니다.</li>
                                    <li>이용 가능한 카드 : BC카드, KB국민카드, 삼성카드, 롯데카드, 외환카드, 하나카드, 현대카드, 씨티카드, NH농협카드, 신한카드</li>
                                    <li>단, BC 카드중 다음 3가지는 등록불가합니다.(신한, 하나, 국민)</li>
                                </ul>

                                <div class="frame">
                                    <ul class="list list-b">
                                        <li>본인명의 휴대폰에서 본인명의의 카드등록후 사용 가능합니다.</li>
                                        <li>카카오톡앱 미설치시 앱스토어에서 앱 설치후 회원가입을 하셔야 합니다.</li>
                                        <li>카카오톡앱 내에서 카카오페이 가입시 카드사 등록/인증을 하셔야 결제가 가능합니다.</li>
                                        <li>카카오페이는 무이자할부 및 제휴카드 혜택 내용과 관계가 없습니다. 자세한 사항은 카카오페이 공지사항에서 확인하실 수 있습니다.</li>
                                    </ul>
                                </div>
                            </li>
                            <li class="guide">
                                <p class="primary">
                                    신용카드 매출전표는 부가가치세법 제32조의 3 제 3항에 의하여 발행되며, 동법 시행령 제57조 제2항에 의하여 세금계산서를 교부하지 않습니다.
                                </p>
                            </li>
                        </ul>
                    </div><!-- // 카카오페이 -->

                    <div class="downer account-b pay-way pay-way_${Code.PAY_DEPOSIT} pay-way_${Code.PAY_ESCROW}"><!-- 무통장입금 -->
                        <ul class="form-a">
                            <li>
                                <div class="tit">
                                    <label for="EP_bank_cd">입금은행<span class="essential"><em class="blind">필수입력</em></span></label>
                                </div>
                                <div class="field">
                                    <p>
                                        <label for="EP_bank_cd" class="sel_box_st0">
                                            <select id="EP_bank_cd" name="EP_bank_cd" class="select">
                                                <option value="">은행선택</option>
                                                <c:forEach var="item" items="${depositBankList }">
													<option value="${item.CMN_COM_ETC1 }">${item.CMN_COM_NM }</option>
												</c:forEach> 
                                            </select>
                                        </label>
                                    </p>
                                    <p>
                                        <strong>예금주명 : (주)이패스씨앤아이 </strong>
                                    </p>
                                </div>
                            </li>
                            <li>
                                <div class="tit">
                                    <label for="ORD_MST_DPS_NM">입금자명<span class="essential"><em class="blind">필수입력</em></span></label>
                                </div>
                                <div class="field">
                                    <input type="text" id="ORD_MST_DPS_NM" class="text" name="ORD_MST_DPS_NM" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" maxlength="20">
                                </div>
                            </li>
                            <li>
                                <div class="tit">
                                    	입금기한
                                </div>
                                <div class="field">
                                    <p>
                                        <strong class="warning"><c:out value="${LGD_CLOSEDATE_TEXT }"/> 까지</strong>
                                    </p>
                                    <p class="desc">
                                        <span>입금이 확인되지 않으면 주문이 자동으로 취소됩니다.</span>
                                    </p>
                                </div>
                            </li>
                            <li class="guide">
                                <p class="desc">
                                    전용 계좌번호 발급으로 입금인 명의와 상관없이 입금 가능합니다.<br />
                                    전용 계좌번호와 입금예정일은 MYLAND &gt; 쇼핑내역 &gt; 주문/배송조회에서 확인 가능합니다.<br />
                                    만일, 해당 주문의 최종 결제 금액과 다른 금액을 입금하시면 주문이 정상적으로 처리되지 않으니 유의 바랍니다
                                </p>
                            </li>
                            <c:set var="c_cash_receipt_no" value="1"/>
                            <%@ include file="/WEB-INF/jsp/mobile/cart/include/cartpaymentCashReceipt.jsp" %>
                            <li class="escrowa pay-way pay-way_${Code.PAY_ESCROW}">
                                <p>
                                    <input type="checkbox" id="escrowaAreement" class="checkbox">
                                    <label for="escrowaAreement"><strong>구매안전 서비스(에스크로) 이용약관 동의</strong></label>
                                    <a href="http://www.etland.co.kr/etland/order/kicc/escrow/html/escrow_info.html" class="button small" target="_blank" title="새 창 열림"><span>약관보기</span></a>
                                </p>
                                <div class="check-escrowa">
                                    <p><strong>한국정보통신(주) 매매안심거래 서비스 가맹점</strong></p>
                                    <p>KICC의 이지에스크로 서비스를 통해 안심하고 거래하시기 바랍니다.</p>
                                    <a href="https://office.easypay.co.kr/homepage/other_service/EscrowAuthAction.do?memb_id=05109822" class="button small" target="_blank" title="새 창 열림"><span>서비스 가입확인</span></a>
                                </div>
                            </li>
                        </ul>
                    </div><!-- // 무통장입금 -->
                </div>      
            </div>
        </div><!-- // payment-way -->
        </c:if>
        <c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 적립/혜택 없음 --%>
        	<input id="radioPayment_cleanking" class="radio radioPayment" type="radio" name="radioPayment" value="${Code.PAY_CLEANKING}"  checked="checked" style="display : none;"/>
        </c:if>
        <%---------------------------------------------------------------- 결제방법 끝 ------------------------------------------------%>

        <div class="order-sheet accordion price" data-role="collapsible-set"><!-- price -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong class="core">최종 결제 금액</strong>
                    <strong class="price"><span id="span_cart_total"><fmt:formatNumber value="${cart_total}" type="number" /></span>원</strong>
                    <c:if test="${not empty cartlist[0].ORD_TMP_LNG_DIV}">
                    	<strong class="monthly small">(실제 월 청구금액 <span id="span_expected_lng_prc"><fmt:formatNumber value="${cart_total/ cartlist[0].ORD_TMP_LNG_DIV}" type="number" pattern="###,###"/></span>원)</strong>
                    </c:if>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <ul class="form-a">
                        <li>
                            <div class="tit">총 주문상품금액</div>
                            <div class="field">
                            	<c:choose>
                            	<c:when test="${not empty cartlist[0].ESM_PRD_IDX}">
                            		<strong class="large">-</strong>
                            	</c:when>
                            	<c:otherwise>
                            		<strong class="large"><span id="span_cart_prd_amount"><fmt:formatNumber value="${cart_prd_amount}" /></span></strong>원
                            	</c:otherwise>
                            	</c:choose>
                            </div>
                        </li>
                        <li>
                            <div class="tit">즉시할인</div>
                            <div class="field">
                                <span class="warning"><strong class="large">-<span id="span_cart_ist_cpn_prc"><fmt:formatNumber value="${cart_ist_cpn_prc}" /></span></strong>원</span>
                            </div>
                        </li>
                        <li>
                            <div class="tit">추가할인</div>
                            <div class="field">
                                <span class="warning"><strong class="large">-<span class="span_cart_add_disc_prc">0</span></strong>원</span>
                            </div>
                        </li>
                        <c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 배송비 없음 --%>
                        <li>
                            <div class="tit">배송비</div>
                            <div class="field">
                                <span class="warning"><strong class="large">+<span id=""><fmt:formatNumber value="${cart_delivery}" /></span></strong>원</span>
                            </div>
                        </li>
                        <li id="li_cart_add_delivery" style="display: none;">
                            <div class="tit">추가배송비</div>
                            <div class="field">
                                <span class="warning"><strong class="large">+<span id="span_cart_add_delivery"><fmt:formatNumber value="${cart_add_delivery}" /></span></strong>원</span>
                            </div>
                        </li>
                        </c:if>
                    </ul>

                    <div class="agree">
                        <h4>구매자 동의</h4>

                        <p class="mt10">
                            주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?<br />
                            (전자상거래법 제 8조 2항)
                        </p>

                        <p class="mt10 text-right">
                            <input id="ORDER_CONFIRM" type="checkbox" class="checkbox" name="ORDER_CONFIRM"/>
                            <label for="ORDER_CONFIRM">동의합니다.</label>
                        </p>
                    </div>

                    <div class="section-button"><!-- section-button -->
                    	<c:choose>
			       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 예약상담 --%>
			       	   	<a href="javascript:paymentPrepare();" class="button warning full"><span><strong class="xxlarge"><span id="span_cart_total2"><fmt:formatNumber value="${cart_total}" type="number" /></span></strong>원 예약상담</span></a>
			       	   </c:when>
			       	   <c:otherwise>
			       	   	<a href="javascript:paymentPrepare();" class="button warning full"><span><strong class="xxlarge"><span id="span_cart_total2"><fmt:formatNumber value="${cart_total}" type="number" /></span></strong>원 결제</span></a>
			       	   </c:otherwise>
			       	   </c:choose>
                    </div><!-- // section-button -->
                </div>      
            </div>
        </div><!-- // price -->
        
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
			
	</article>
	<!--// #container E -->
	
	<div id="kakaopay_layer"  style="display: none"></div>
	
	<%-- 우편번호 레이어 --%>
	<%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->

<%-- kakaoPay script 시작--%>
<script src="https://pg.cnspay.co.kr:443/dlp/scripts/lib/easyXDM.min.js" type="text/javascript"></script>
<script src="https://kmpay.lgcns.com:8443/js/dlp/client/kakaopayDlpConf.js" charset="utf-8"></script>
<script src="https://kmpay.lgcns.com:8443/js/dlp/client/kakaopayDlp.min.js" charset="utf-8"></script>

<script type="text/javascript">
	var isSubmit = false;

    /**
    cnspay  를 통해 결제를 시작합니다.
    */
    function cnspay() {
    	
    	var radioPayment = $(":radio[name='radioPayment']:checked").val();
        
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
                //kakaopayDlp.setChannelType('WPM', 'TMS'); // PC결제
                kakaopayDlp.setChannelType('MPM', 'WEB'); // 모바일 웹(브라우저)결제
                //kakaopayDlp.addRequestParams({ MOBILE_NUM : '010-1234-5678'}); // 초기값 세팅
                //kakaopayDlp.callDlp('kakaopay_layer', document.LGD_PAYINFO, submitFunc);
                
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
				url : "<c:out value="${mobileSslDomain}" />/mobile/cart/getTxnId.do",
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
        	$("#LGD_PAYINFO").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/cart/payment.do", "method":"post", "target":"_self"}).submit();
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
</c:if>
<c:if test="${CST_PLATFORM ne 'test'}">
<script type="text/javascript" src="https://pg.easypay.co.kr/webpay/EasypayCard_Web.js" charset=UTF-8></script><!-- real-->
</c:if>

<script type="text/javascript">
var frm_pay = document.LGD_PAYINFO;

function f_card() 
{
    if( frm_pay.sp_product_amt.value < 50000 ) 
    {
        frm_pay.sp_install_period.value = "00";
        frm_pay.sp_noint_yn.value = "Y";
    }
    else 
    {
        frm_pay.sp_install_period.value = frm_pay.install_period.value;
    }

    /* UTF-8 사용가맹점의 경우 EP_charset 값 셋팅 필수 */
    if( frm_pay.sp_charset.value == "UTF-8" )
    {
        // 한글이 들어가는 값은 모두 encoding 필수.
        frm_pay.sp_mall_nm.value      = encodeURIComponent( frm_pay.sp_mall_nm.value );
        frm_pay.sp_product_nm.value   = encodeURIComponent( frm_pay.sp_product_nm.value );
    }

    /* 가맹점에서 원하는 인증창 호출 방법을 선택 */
    /* if( document.frm_pay.sp_window_type.value == "iframe" ) 
    { */
        //iframe
        //frm_pay.sp_return_url.value = "<c:out value="${mobileSslDomain}"/>/mobile/cart/v3d_res.do";
        easypay_card_webpay(frm_pay,"<c:out value="${mobileSslDomain}"/>/mobile/cart/v3d_req.do","hiddenifr","0","0","iframe",30);
    /* } */
    /* else 
    {     
        //submit
        frm_pay.sp_return_url.value = "가맹점 URL/mobile/card/card_res_submit.jsp";
        easypay_card_webpay(frm_pay,"./card_req.jsp","_self","0","0","submit",30);
    } */
    
    /* if( !frm_pay.sp_return_url.value ) 
    {
        alert("return url 을 입력하세요.!!");
        frm_pay.sp_return_url.focus();
        return;
    } */
}

function f_submit()
{
    // 정상("0000") 일 때 승인요청페이지로 이동.
    if( frm_pay.sp_res_cd.value == "0000" )
    {
        if( frm_pay.sp_charset.value == "UTF-8" )
        {
            // 한글이 들어가는 값은 모두 encoding 필수.
            frm_pay.sp_mall_nm.value      = decodeURIComponent( frm_pay.sp_mall_nm.value );
            frm_pay.sp_product_nm.value   = decodeURIComponent( frm_pay.sp_product_nm.value );
        }
        
        frm_pay.target = "_self";
        frm_pay.action = "<c:out value="${mobileSslDomain}"/>/mobile/cart/payment.do";
        isSubmit = true;
        frm_pay.submit();
    }
}

<%-- 모바일 계좌이체 iframe용
f_account_submit();을 호출한다.
iframe 쓸 경우 T_CRT_TMP 사용 안해도 된다. JAVA 단  INSERT/SELECT 하는 부분 주석처리할 것. 
function f_account() 
{
    /* UTF-8 사용가맹점의 경우 EP_charset 값 셋팅 필수 */
    if( frm_pay.sp_charset.value == "UTF-8" )
    {
        // 한글이 들어가는 값은 모두 encoding 필수.
        frm_pay.sp_mall_nm.value      = encodeURIComponent( frm_pay.sp_mall_nm.value );
        frm_pay.sp_product_nm.value   = encodeURIComponent( frm_pay.sp_product_nm.value );
    }

     //iframe
     //frm_pay.sp_return_url.value = "<c:out value="${mobileSslDomain}"/>/mobile/cart/acnt_res.do";
     easypay_card_webpay(frm_pay,"<c:out value="${mobileSslDomain}"/>/mobile/cart/acnt_req.do","hiddenifr","0","0","iframe",30);
}

function f_account_submit() {
    if( frm_pay.sp_charset.value == "UTF-8" )
    {
        // 인증요청 시 인코딩 한 값은 승인요청 시 디코딩 처리해야함.
        frm_pay.sp_mall_nm.value      = decodeURIComponent( frm_pay.sp_mall_nm.value );
        frm_pay.sp_product_nm.value   = decodeURIComponent( frm_pay.sp_product_nm.value );
    }
    
    frm_pay.target = "_self";
    frm_pay.action = "<c:out value="${mobileSslDomain}"/>/mobile/cart/payment.do";
    isSubmit = true;
    frm_pay.submit();
}
--%>

function f_account_submit() {
	 /* UTF-8 사용가맹점의 경우 EP_charset 값 셋팅 필수 */
    if( frm_pay.sp_charset.value == "UTF-8" )
    {
        // 한글이 들어가는 값은 모두 encoding 필수.
        frm_pay.sp_mall_nm.value      = encodeURIComponent( frm_pay.sp_mall_nm.value );
        frm_pay.sp_product_nm.value   = encodeURIComponent( frm_pay.sp_product_nm.value );
    }
    
    frm_pay.target = "_self";
    //frm_pay.sp_return_url.value = "<c:out value="${mobileSslDomain}"/>/mobile/cart/payment.do";
    <c:if test="${CST_PLATFORM eq 'test'}">
    frm_pay.action = "http://testsp.easypay.co.kr/ep8/acnt/DirectAcntCertReqAction.do";
    </c:if>
    <c:if test="${CST_PLATFORM ne 'test'}">
    frm_pay.action = "https://sp.easypay.co.kr/ep8/acnt/DirectAcntCertReqAction.do";
    </c:if>
    //isSubmit = true;
    frm_pay.submit();
}

</script>
<%-- kicc isp script 끝--%>

<script>
$(function(){
	//무이자/일반할부 처음에 안보여준다.
	$("#freeInterestListLabel").hide();
	$("#noFreeInterestListLabel").hide();
	
	//현금영수증 발급용도 변경시
	$(document).on("change", "input[name='cashReceipt']", function(){
		$(".cashR").val("");
		$(".cashR").prop("disabled", true);
		
		var $idx = $(this).val();
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
	});
});

//배송 지정일 저장
function saveDlvDueDt(prd_tmp_idx){
	var min_dt = $("#MIN_DLV_DUE_DT_"+prd_tmp_idx).val();
	var max_dt = $("#MAX_DLV_DUE_DT_"+prd_tmp_idx).val();
	
	//console.log(min_dt);
	//console.log(max_dt);
	
	var $year = $("#DLV_DUE_DT_YEAR_"+prd_tmp_idx);
	var $month = $("#DLV_DUE_DT_MON_"+prd_tmp_idx);
	var $day = $("#DLV_DUE_DT_DAY_"+prd_tmp_idx);
	
	var year = $year.val();
	var month = $month.val();
	var day = $day.val();
	
	//console.log(year);
	//console.log(month);
	//console.log(day);
	
	if(year == ""){
		alert("연도를 선택해주십시오.");
		$year.focus();
		return;
	}
	
	if(month == ""){
		alert("월을 선택해주십시오.");
		$month.focus();
		return;
	}
	
	if(day == ""){
		alert("일자를 선택해주십시오.");
		$day.focus();
		return;
	}
	
	// 해당월 마지막일자 체크
	var nMaxDay = new Date(new Date(year, month, 1) - 86400000).getDate();  
	//console.log("nMaxDay==="+nMaxDay);
	// 마지막 일보다 큰 경우 날짜 변경
	if(nMaxDay < day){
		day = nMaxDay;
		$day.val(day);
	}
	
	// 최소,최대 가능일 체크
	var selectedDt = new Date(year, month-1, day);
	
	//console.log("selectedDt==="+selectedDt);
	//console.log("selectedDt==="+selectedDt.getTime());
	
	var minDate = min_dt.split("-");  
    var minYear = Number(minDate[0]);  
    var minMonth = Number(minDate[1]);  
    var minDay = Number(minDate[2]);
    
    var minDt = new Date(minYear, minMonth-1, minDay);
    
    //console.log("minDt==="+minDt);
    //console.log("minDt==="+minDt.getTime());
    
    var maxDate = max_dt.split("-");  
    var maxYear = Number(maxDate[0]);  
    var maxMonth = Number(maxDate[1]);  
    var maxDay = Number(maxDate[2]);
    
    var maxDt = new Date(maxYear, maxMonth-1, maxDay);
    
    //console.log("maxDt==="+maxDt);
    //console.log("maxDt==="+maxDt.getTime());
    
    var bDateCheck = false;
    if(selectedDt.getTime() >= minDt.getTime() && selectedDt.getTime() <= maxDt.getTime()){
    	//console.log("날짜 유효성 통과!");
    	bDateCheck = true;
    }else if(selectedDt.getTime() < minDt.getTime()){
    	alert("배송은 "+ min_dt + " 이후로 가능합니다.");
    	return;
    }else if(selectedDt.getTime() > maxDt.getTime()){
    	alert("배송은 "+ max_dt + " 이전 날짜만 가능합니다.");
    	return;
    }
	
	if(bDateCheck){
		$("#DLV_DUE_DT_"+prd_tmp_idx).val(year + "-" + month + "-" + day);
		$("#span_dlv_due_dt_"+prd_tmp_idx).html(year + "." + month + "." + day);
		
		//묶음 배송 일괄 처리
		var vdr_idx = $("#DLV_DUE_DT_"+prd_tmp_idx).data("vdr_idx");
		var dlv_bundle_yn = $("#DLV_DUE_DT_"+prd_tmp_idx).data("dlv_bundle_yn");
		if(dlv_bundle_yn == "Y"){
			$(".DLV_DUE_DT_"+vdr_idx+"_"+dlv_bundle_yn).val(year + "-" + month + "-" + day);
			$(".span_dlv_due_dt_"+vdr_idx+"_"+dlv_bundle_yn).html(year + "." + month + "." + day);
		}
		
		alert("저장되었습니다.");
		$("#shipDate_"+prd_tmp_idx).removeClass("in");
		$("#a_shipDate_"+prd_tmp_idx).removeClass("active");
	}
}

</script>

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
	var radioPayment = $(":radio[name='radioPayment']:checked").val();
	
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
		   	if($("#sp_card_cd1").val() == ""){
		   		alert("카드를 선택해주세요.");
		   		return;
		   	}
		   
		   	if($("input[name='sp_noint1']:checked").val() == "00"){//일시불or일반할부인 경우
		   		if($("input[name='sp_noint1']:checked").hasClass("interest")){//일반할부
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
		   	
		   	CRD_INF_IDX = $("#sp_card_cd1").find("option:selected").data("crd_inf_idx");
		   	CARD_REQ_TYPE = $("#sp_card_cd1 option:selected").data("req_type");
		   	$("#sp_card_cd").val($("#sp_card_cd1").val());
		   	$("#sp_noint").val($("input[name='sp_noint1']:checked").val());
		   	
		   }else if(radioPayment == "${Code.PAY_FOREIGN_CARD}"){//해외카드
			   if($("#sp_card_cd2").val() == ""){
			   		alert("카드를 선택해주세요.");
			   		return;
			   	}	
		   
			   CRD_INF_IDX = $("#sp_card_cd2").find("option:selected").data("crd_inf_idx");
			   	CARD_REQ_TYPE = $("#sp_card_cd2 option:selected").data("req_type");
			   	$("#sp_card_cd").val($("#sp_card_cd2").val());
			   	$("#sp_noint").val($("input[name='sp_noint2']:checked").val());
		   
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
	
	//실시간 계좌이체용 현금영수증 파라미터 셋팅
	$("#sp_cash_yn").val($("#EP_cash_yn").val());
    $("#sp_cash_issue_type").val($("#EP_cash_issue_type").val());
    $("#sp_cash_auth_type").val($("#EP_cash_auth_type").val());
    $("#sp_cash_auth_value").val($("#EP_cash_auth_value").val());
    
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
	
	$.ajax
    ({
        async : false,
        type : "POST",
        data : {"ORD_MST_CD" : ORD_MST_CD
        			, "radioPayment" : radioPayment
        			, "sp_noint" : $("#sp_noint").val() /* 무이자 여부 */
        			, "CRD_INF_IDX" : CRD_INF_IDX /* 카드사 IDX */
        		  },
        url : "<c:out value="${mobileSslDomain}" />/mobile/cart/paymentPrepare.do",
        success : function (data) 
        { 
        	if(data.result == 0){
        	    $('.LGD_FORM').remove();
        	    
	        	var formtag = '';
	        	
	        	//var input_type = 'text';
	        	var input_type = 'hidden';
	        	
	        	//공통 파라미터
	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="ORD_MST_PAY_PRC"                  id="ORD_MST_PAY_PRC"		value="'+ data.CART_PAYMENT_TOTAL + '">';<%-- 총 결제금액 --%>
	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CART_PAYMENT_DC_MILEAGE"                  id="CART_PAYMENT_DC_MILEAGE"		value="'+ data.CART_PAYMENT_DC_MILEAGE + '">';<%-- 총 사용 포인트 --%>
	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CART_PAYMENT_DC_COUPON"                  id="CART_PAYMENT_DC_COUPON"		value="'+ data.CART_PAYMENT_DC_COUPON + '">';<%-- 총 사용 쿠폰 --%>
	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="CART_PAYMENT_DC_CASHBAG"                  id="CART_PAYMENT_DC_CASHBAG"		value="'+ data.CART_PAYMENT_DC_CASHBAG + '">';<%-- 총 사용 캐쉬백 --%>
	        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="ORD_MST_ORD_TYPE"              id="ORD_MST_ORD_TYPE"		value="'+ "${Code.MEMBER_JOIN_TYPE_MOBILE}" + '">';<%-- 주문 매체 --%>
	        	
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
		        	
		        	if(radioPayment == "${Code.PAY_CARD}" || radioPayment == "${Code.PAY_FOREIGN_CARD}"){
		        		
		        		//공통 파라미터
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_tr_cd"                  id="sp_tr_cd"		value="">';<%-- 요청구분 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_pay_type"                  id="EP_pay_type"		value="'+ data.EP_pay_type + '">';<%-- 결제수단 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_tot_amt"                  id="EP_tot_amt"		value="'+ data.EP_tot_amt + '">';<%-- 총결제금액 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_currency"                  id="sp_currency"		value="00">';<%-- 통화코드[원화 : 00, 달러 : 01] --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_escrow_yn"                  id="EP_escrow_yn"		value="'+ data.EP_escrow_yn +'">';<%-- 에스크로 사용유무 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_complex_yn"                  id="EP_complex_yn"		value="N">';<%-- 복합결제 사용유무 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_order_no"                  id="sp_order_no"		value="'+ data.EP_order_no +'">';<%-- 가맹점 주문번호 --%>
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="product_nm"                  id="product_nm"		value="'+ rep_product_name +'">';<%-- 상품명 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_product_nm"                  id="sp_product_nm"		value="'+ rep_product_name +'">';<%-- 상품명 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_product_amt"                  id="sp_product_amt"		value="'+ data.EP_product_amt +'">';<%-- 상품금액 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_user_phone"                  id="sp_user_phone"		value="'+ $('#ORD_MST_HP1').val()+$('#ORD_MST_HP2').val()+$('#ORD_MST_HP3').val() +'">';<%-- 고객 휴대폰번호 --%>
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_mall_id"                  id="EP_mall_id"		value="'+ data.EP_mall_id + '">';<%-- 가맹점 mall id 캐쉬백 사용하려면 이것도 필요...!--%>
			        	
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_mall_id"                  id="sp_mall_id"		value="'+ data.EP_mall_id + '">';<%-- 가맹점 mall id --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_mall_nm"                  id="sp_mall_nm"		value="마켓플랜트">';<%-- 가맹점명 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_window_type"                  id="sp_window_type"		value="iframe">';<%-- 윈도우 타입(iframe/submit) --%>
		        		
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="user_mail"                  id="user_mail"		value="'+ $('#ORD_MST_MAIL').val() +'">';<%-- 구매자 이메일 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="user_phone2"                  id="user_phone2"		value="'+ $('#ORD_MST_HP1').val()+$('#ORD_MST_HP2').val()+$('#ORD_MST_HP3').val() +'">';<%-- 고객 휴대폰번호 --%>
		        		
		        		var reqType = "";
		        		/* var reqType = "1";
		        		var req_type = $("#sp_card_cd option:selected").data("req_type");
		        		
		        		if(req_type != "ISP"){
		        			reqType = "2";
		        		} */
		        		
		        		// 1. ISP / 안심클릭 구분
		        		// 2. ISP 파라미터 셋팅
		        		// 2. 안심클릭 파라미터 셋팅
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_vp_pgid"                  id="sp_vp_pgid"		value="A0042">';<%--[선택]ISP PGID --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_charset"                  id="sp_charset"		value="UTF-8">';<%-- charset --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_client_version"                  id="sp_client_version"		value="">';<%-- 모듈 버전 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_kmotion_useyn"                  id="sp_kmotion_useyn"		value="Y">';<%-- 국민 앱카드 결제화면 노출여부(Y:앱카드결제 노출) --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_buss_no"                  id="sp_buss_no"		value="">';<%-- [선택]가맹점 사업자번호 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_card_join_no"                  id="sp_card_join_no"		value="">';<%-- [선택]카드사 가맹점 번호 --%>
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_kvp_cardcode"                  id="sp_kvp_cardcode"		value="">';			<%-- [선택]KVP 카드정보 --%>        
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_kvp_sessionkey"                  id="sp_kvp_sessionkey"		value="">';		<%-- [선택]KVP 암호화키 --%>        
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_kvp_encdata"                  id="sp_kvp_encdata"		value="">';			<%-- [선택]KVP 암호화전문 --%>      
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_kvp_payset_flag"                  id="sp_kvp_payset_flag"		value="">';		<%-- [선택]KVP 포인트플래그 --%>    
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_kvp_using_point"                  id="sp_kvp_using_point"		value="">';		<%-- [선택]KVP 포인트 사용금액 --%> 
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vp_ret_save_point"                  id="EP_vp_ret_save_point"		value="">';	<%-- [선택]KVP 세이브 결제 유무 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_quota"                  id="EP_kvp_quota"		value="">';			<%-- [선택]KVP 할부개월 --%>        
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_kvp_noint"                  id="EP_kvp_noint"		value="">';			<%-- [선택]KVP 무이자여부 --%>      
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_card_prefix"                  id="sp_card_prefix"		value="">';		<%-- [선택]카드 BIN(6자리) --%>
		        		
		        		<%-- 카드결제종류(수정불가) --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_req_type"                  id="sp_req_type"		value="'+ reqType + '">';
		        		<%-- 신용카드 결제금액 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_card_amt"                  id="sp_card_amt"		value="'+ data.EP_tot_amt +'">';
		        		<%-- 할부개월 --%> 
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_install_period"                  id="sp_install_period"		value="">';
		        		
		        		<%-- 가맹점 필드 --%>
		        		/* formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define1"                  id="EP_user_define1"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define2"                  id="EP_user_define2"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define3"                  id="EP_user_define3"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define4"                  id="EP_user_define4"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define5"                  id="EP_user_define5"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_user_define6"                  id="EP_user_define6"		value="">'; */
		        		
		        		//MPI
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_return_url"                  id="sp_return_url"		value="'+ data.EP_return_url +'">';<%-- mpi 리턴 url --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_expire_date"                  id="EP_expire_date"		value="">';<%-- 유효기간 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_noint_yn"                  id="sp_noint_yn"		value="">';<%-- 무이자 여부 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_save_useyn"                  id="sp_save_useyn"		value="N">';<%-- 세이브 여부 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_lang_flag"                  id="EP_lang_flag"		value="KOR">';<%-- 언어 구분 --%>
		        		
		        		//MPI 응답 파라미터
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_res_cd"                  id="sp_res_cd"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_res_msg"                  id="sp_res_msg"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_ret_save_used"                  id="sp_ret_save_used"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_ret_save_kind"                  id="sp_ret_save_kind"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_card_no"                  id="sp_card_no"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_cavv"                  id="sp_cavv"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_eci"                  id="sp_eci"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_xid"                  id="sp_xid"		value="">';
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_cno"                  id="sp_cno"		value="">';
		        		
		        	}else if(radioPayment == "${Code.PAY_DEPOSIT}"){
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
		        		
		        		//무통장 입금
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_txtype"                  id="EP_vacct_txtype"		value="'+ data.EP_vacct_txtype +'">';<%-- 처리종류 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_amt"                  id="EP_vacct_amt"		value="'+ data.EP_tot_amt +'">';<%-- 결제금액 --%>
			        	<%-- formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bank_cd"                  id="EP_bank_cd"		value="'+ data.EP_bank_cd +'">';입금은행 코드 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_expire_date"                  id="EP_expire_date"		value="<c:out value="${EP_expire_date}"/>">';<%-- 만료일자 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_expire_time"                  id="EP_expire_time"		value="235959">';<%-- 만료시간 --%>
			        	
		        	}else if(radioPayment == "${Code.PAY_ESCROW}"){
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
		        		
		        		//에스크로
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_txtype"                  id="EP_vacct_txtype"		value="'+ data.EP_vacct_txtype +'">';<%-- 처리종류 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_amt"                  id="EP_vacct_amt"		value="'+ data.EP_tot_amt +'">';<%-- 결제금액 --%>
		        		
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_escr_type"                  id="EP_escr_type"		value="K">';<%-- 에스크로 타입 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bk_cnt"                  id="EP_bk_cnt"		value="'+ data.EP_bk_cnt +'">';<%-- 장바구니 건수 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bk_totamt"                  id="EP_bk_totamt"		value="'+ data.EP_product_amt +'">';<%-- 장바구니 총금액 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_bk_goodinfo"                  id="EP_bk_goodinfo"		value="'+ data.EP_bk_goodinfo +'">';<%-- 장바구니 정보 --%>
		        		
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="escrow_prd_no"                  id="escrow_prd_no"		value="'+ data.escrow_prd_no +'">';<%-- 장바구니 정보 1--%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="escrow_prd_amt"                  id="escrow_prd_amt"		value="'+ data.escrow_prd_amt +'">';<%-- 장바구니 정보 2--%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="escrow_prd_nm"                  id="escrow_prd_nm"		value="'+ data.escrow_prd_nm +'">';<%-- 장바구니 정보 3--%>
		        		
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_recv_nm"                  id="EP_recv_nm"		value="'+ $('#ORD_MST_ORD_NM').val() +'">';<%-- 구매자명(주문자) --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_recv_mob"                  id="EP_recv_mob"		value="'+ $('#ORD_MST_HP1').val() + $('#ORD_MST_HP2').val() + $('#ORD_MST_HP3').val() +'">';<%-- 구매자 휴대폰번호 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_recv_mail"                  id="EP_recv_mail"		value="'+ $('#ORD_MST_MAIL').val() +'">';<%-- 구매자 이메일 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_end_date"                  id="EP_vacct_end_date"		value="<c:out value="${EP_expire_date}"/>">';<%-- 만료일자 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_vacct_end_time"                  id="EP_vacct_end_time"		value="235959">';<%-- 만료시간 --%>
		        	}else if(radioPayment == "${Code.PAY_ACCOUNT}"){
		        		//계좌이체
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_tr_cd"                  id="sp_tr_cd"		value="">';<%-- 요청구분 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_pay_type"                  id="sp_pay_type"		value="'+ data.EP_pay_type + '">';<%-- 결제수단 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_tot_amt"                  id="sp_tot_amt"		value="'+ data.EP_tot_amt + '">';<%-- 총결제금액 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_currency"                  id="sp_currency"		value="00">';<%-- 통화코드[원화 : 00, 달러 : 01] --%>
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="EP_mall_id"                  id="EP_mall_id"		value="'+ data.EP_mall_id + '">';<%-- 가맹점 mall id 캐쉬백 사용하려면 이것도 필요...!--%>
			        	
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_mall_id"                  id="sp_mall_id"		value="'+ data.EP_mall_id + '">';<%-- 가맹점 mall id --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_mall_nm"                  id="sp_mall_nm"		value="마켓플랜트">';<%-- 가맹점명 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_order_no"                  id="sp_order_no"		value="'+ data.EP_order_no +'">';<%-- 가맹점 주문번호 --%>
		        		
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="product_nm"                  id="product_nm"		value="'+ rep_product_name +'">';<%-- 상품명 --%>
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_product_nm"                  id="sp_product_nm"		value="'+ rep_product_name +'">';<%-- 상품명 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_product_amt"                  id="sp_product_amt"		value="'+ data.EP_product_amt +'">';<%-- 상품금액 --%>
			        	formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_return_url"                  id="sp_return_url"		value="'+ data.EP_return_url +'">';<%-- mpi 리턴 url --%>
			        	
		        		formtag += '<input class="LGD_FORM" type="'+input_type+'" name="sp_charset"                  id="sp_charset"		value="UTF-8">';<%-- charset --%>
		        	}
		        	
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
	        	
	        	//-- 세션 처리
				$.ajax
			    ({
			        async : false,
			        type : "POST",
			        data : $('#LGD_PAYINFO').serializeArray(),
			        url : "<c:out value="${mobileSslDomain}" />/mobile/cart/paymentPrepareMobile.do",
			        success : function (data) 
			        { 
			        	if(radioPayment == "${Code.PAY_CARD}" || radioPayment == "${Code.PAY_FOREIGN_CARD}"){//신용카드인 경우
			        		f_card();
			        	}else if(radioPayment == "${Code.PAY_ACCOUNT}"){//계좌이체인 경우
			        		f_account_submit();
			        	}else if(radioPayment == "${Code.PAY_KAKAOPAY}"){//카카오페이
			        		getTxnId();
		        		}else{
			        		$("#LGD_PAYINFO").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/cart/payment.do", "method":"post", "target":"_self"}).submit();
			        	}
			        },
			        error : function (err)
			        {
			            alert("오류가 발생하였습니다.\n[" + err.status + "]");
			            window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
			        }
			    });
				//-- 세션 처리
        	}else if(data.result == -999){
        		alert(data.resultMsg);
        		location.replace("<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do");
        	}else if(data.result == -888){<%-- 결제금액 0 이하 --%>
            		alert(data.resultMsg);
        	}else{
        		alert(data.resultMsg);
        		callJavascriptNextPage('<c:out value="${mobileSslDomain}"/>/mobile/cart/cartlist.do','_self');
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
	
	// 무이자할부/일반할부 셀렉트 박스 선택시 라디오버튼 자동 체크
	$(document).on("click","#freeInterestList",function(){
		$("#monthly2").prop("checked",true);
	});
	$(document).on("click","#noFreeInterestList",function(){
		$("#monthly3").prop("checked",true);
	});
	
	// 일시불/무이자/일반할부 선택시 일반할부 추가설명 show/hide
	$(document).on("change","input[name=sp_noint1]",function(){
		if($(this).data("desc_yn") == "N"){
			//부분무이자 설명 remove
			$("#divInterest").hide();
		}else{
			$("#divInterest").show();
		}
	});
	
	// 결제인증결과
    payment_return = function(LGD_RESPCODE, LGD_RESPMSG, LGD_PAYKEY)
    {
        if (LGD_RESPCODE == "0000") 
        {
            document.getElementById("LGD_PAYKEY").value = LGD_PAYKEY;
            $("#LGD_PAYINFO").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/cart/payment.do", "method":"post", "target":"_self"}).submit();
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
	$(document).on("click","input[name=dupCoupon]",function(){
		var thisValue = $(this).val();
		var thisText = $(this).data("text");
		$("select.select_prd_cpn").each(function(){
			$(this).val(thisValue);
			$(this).prev().html(thisText);
		});
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 전체 적용가능 쿠폰 선택시
	$(document).on("change","input[name=dupCoupon]",function(){
		var thisValue = $(this).val();
		var thisText = $(this).data("text");
		$("select.select_prd_cpn").each(function(){
			$(this).val(thisValue);
			$(this).prev().html(thisText);
		});
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 상품 쿠폰 선택시
	$(document).on("change","select.select_prd_cpn",function(){
		var $this = $(this);
		var isPass = true;
		/* $("select.select_prd_cpn").each(function(){
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
			$this.prev().html("쿠폰을 선택해주세요.");
		} */
		
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 배송비 쿠폰 선택시
	$(document).on("change",".select_dlv_cpn",function(){
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
			$this.prev().html("쿠폰을 선택해주세요.");
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
    $(document).on("change", "#emailDomainSelectbox", function () {
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
    $(document).on("change", "#sp_card_cd1", function () {
        var crd_inf_idx = $(this).find("option:selected").data("crd_inf_idx");
        
        $(".interestList").html("<option value=\"\">선택</option>").change();
        
        //일시불로 리셋
		$("#sp_noint1").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
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
        		$("#sp_point_useyn").prop("checked",true).parent().addClass("on");
            	$("#sp_point_useyn1").prop("checked",false).parent().removeClass("on");
        		$("#li_samsung_pnt").hide();
        	}
        	
        	$.ajax({
        		type:"post",
        		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/getCardInstallmentListAjax.do",
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
        					$("#"+interestListId).append(html).change();
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
			$("#freeInterestListLabel").hide();
		}else{
			$("#freeInterestListLabel").show();
		}
		
		if(noFreeCnt === 0){
			$("#noFreeInterestListLabel").hide();
		}else{
			$("#noFreeInterestListLabel").show();
		}
    });
	</c:if>
	
	// 일반할부 선택시 해당 상세 보여주기
	$(document).on("change" ,"#noFreeInterestList", function(){
		var descHtml = "";
		if($(this).val() != ""){
			var desc = $(this).find("option:selected").data("desc");
			if(desc != null){
				descHtml = "<p class=\"message notice-c dotum desc\" id=\"noFreeDesc\">"+ desc +"</p>";
			}
		}
		$("#noFreeDesc").remove();
		$("#divInterest").append(descHtml);
		
		if(descHtml == ""){
			$("#divInterest").hide();
		}else{
			$("#divInterest").show();
		}
	});
});

//LG UPLUS iframe
function launchCrossPlatform(){
	lgdwin = openXpay(document.getElementById('LGD_PAYINFO'), '${CST_PLATFORM}', 'iframe', null, "", "");
}

//결제수단별 안내
function controlPaymentInfo(){
	$('.pay-way').hide();
	$('.pay-way_'+$(':radio[name="radioPayment"]:checked').val()).show();
}

// 상품상세 호출
function goProductView(prdCd){
	window.open("<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd="+prdCd, "_blank");
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
	$("input[name=dupCoupon]").prop("checked",false).parent().removeClass("on");
	$("select.select_prd_cpn").each(function(){
		$(this).val("");
		$(this).click();
		$(this).prev().html("쿠폰을 선택해주세요.");
	});
}

//쿠폰할인금액 계산
function calculateCoupon(){
	var cpn_tot_dc_amt = 0;
	$("select.select_prd_cpn").each(function(){
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
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/checkCashBagPointAjax.do",
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
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/prdCpnDiscountAjax.do",
		data : $("#LGD_PAYINFO").serialize(),
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "Y"){
				$("#span_prd_cpn_tot_dc_amt_real").html(setComma(data.prd_cpn_tot_dc_amt_real));//상품 쿠폰 총 할인금액
				$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
				$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
				$("#span_cart_total2").html(setComma(data.cart_total));//최종결제금액
				
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
	$("#discount1").removeClass("in");
	$("#discount1Atag").removeClass("active");
}

//배송비 쿠폰 사용시 금액 계산
function dlvCpnDiscountAjax(){
	$.ajax({
		type : "post",
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/dlvCpnDiscountAjax.do",
		data : $("#LGD_PAYINFO").serialize(),
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "Y"){
				$("#span_dlv_cpn_tot_dc_amt_real").html(setComma(data.dlv_cpn_tot_dc_amt_real));//배송비 쿠폰 총 할인금액
				$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
				$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
				$("#span_cart_total2").html(setComma(data.cart_total));//최종결제금액
				
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
	$("#discount2").removeClass("in");
	$("#discount2Atag").removeClass("active");
}

//캐쉬백 사용시 금액 계산
function cashbagDiscountAjax(toUseCashbag){
	var cashbagRemainPoint = $("#cashbagRemainPoint").val();
	$.ajax({
		type : "post",
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/cashbagDiscountAjax.do",
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
			$("#span_cart_total2").html(setComma(data.cart_total));//최종결제금액
			
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
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/mileageDiscountAjax.do",
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
			$("#span_cart_total2").html(setComma(data.cart_total));//최종결제금액
			
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
		url : "<c:out value="${mobileSslDomain}" />/mobile/cart/addDlvChargeAjax.do",
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
				
				//모바일에서만 필요한 최종결제금액
				$("#span_cart_total2").html(setComma(data.cart_total));//최종결제금액
				
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
	$("#radioPayment_"+pay_idx).prop("checked",true);
	$("#radioPayment_"+pay_idx).trigger("change");
	$("#paymentBtn_"+pay_idx).siblings().removeClass("btn_blk777");
	$("#paymentBtn_"+pay_idx).siblings().addClass("btn_white");
	$("#paymentBtn_"+pay_idx).removeClass("btn_white");
	$("#paymentBtn_"+pay_idx).addClass("btn_blk777");
}

//카드사 리셋(금액에 따라 할부 가능 개월수가 달라지기 때문에 결제금액 변동시마다 호출한다.)
function cardListReset(){
	
	//카드종류 리셋
	$("#sp_card_cd1").val("");
	
	<%-- 장기할부 아닌 경우 --%>
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
		//일시불로 리셋
		$("#sp_noint1").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
		//무이자할부/일반할부 목록 리셋
		$(".interestList").html("<option value=\"\">선택</option>").change();
		$("#divInterest").hide();
    </c:if>
    
    <%-- 장기할부인 경우 --%>
    <c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
   	 	//장기할부인 경우 카드 목록 가져오기
   	 	$.ajax({
			type:"post",
			url : "<c:out value="${mobileSslDomain}" />/mobile/cart/getCardListAjax.do",
			data : {"ORD_TMP_LNG_DIV" : "${cartlist[0].ORD_TMP_LNG_DIV}", "cart_total" : $("#CART_TOTAL").val()},
			dataType : "json",
			async : false,
			success : function(data){
				$("#sp_card_cd1").html("<option value=\"\">선택</option>");
		        
				if(data.result > 0){
					$.each(data.cardList, function(key, item){
						var htmlStr = "";
						htmlStr += "<option value=\""+ item.CRD_INF_CD_NO +"\" ";
						htmlStr += "data-req_type=\""+ item.CRD_INF_PAY +"\" ";
						htmlStr += "data-crd_inf_idx=\""+ item.CRD_INF_IDX +"\" >";
						htmlStr += item.CRD_INF_NM;
						htmlStr += "</option>";
						
						$("#sp_card_cd1").append(htmlStr);
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