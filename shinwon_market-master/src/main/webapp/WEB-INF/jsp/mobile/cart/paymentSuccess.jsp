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
            <h2>주문완료</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="order-step"><!-- order-step -->
            <ol class="ui-grid-b">
                <li class="ui-block-a"><i class="cart"><!-- icon --></i><strong>장바구니</strong></li>
                <li class="ui-block-b"><i class="order"><!-- icon --></i><strong>주문서/결제</strong></li>
                <li class="ui-block-c active"><i class="finish"><!-- icon --></i><strong>주문완료</strong><span class="blind">현재위치</span></li>
            </ol>
        </div><!-- // order-step -->

        <hr class="hr-a">

        <div class="order-finish"><!-- order-finish -->
        	<c:choose>
         		<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
         			<p class="result">&ldquo;상담예약이 정상적으로 완료되었습니다&rdquo;</p>
         		</c:when>
         		<c:otherwise>
         			<p class="result">&ldquo;주문이 정상적으로 완료되었습니다&rdquo;</p>
         		</c:otherwise>
         	</c:choose>

            <p class="message-a">
                <strong><c:out value="${orderPayInfo.ORD_MST_ORD_NM }"/></strong>님의 주문번호는 <span class="warning"><c:out value="${commandMap.ORD_MST_CD}"/></span> 입니다.
            </p>

            <p class="message-b">
                주문내역은 MYLAND &gt; 쇼핑내역 &gt; 주문/배송조회에서<br />확인 가능합니다.
            </p>
        </div><!-- // order-finish -->

        <div class="order-sheet accordion product finish" data-role="collapsible-set"><!-- product -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong>주문상품정보</strong> (<c:out value="${fn:length(orderProductList)}"/>)
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <div class="cart-list-wrap"><!-- cart-list-wrap -->
                        <ul class="cart-list"><!-- cart-list -->
                            <c:forEach var="row" items="${orderProductList}">
                            	<li class="col"><!-- row -->
	                                <div class="item">
	                                    <a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');" class="link">
	                                        <span class="thumb"><img data-original="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${row.PRD_IMAGE_ALT}" /></span>
	                                        <span class="subject"><c:out value="${row.PRD_MST_NM}" /></span>
	                                    </a>
	                                    <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
	                                    	<div class="option">
				                                        옵션 :
												<c:if test="${not empty row.optionList}">
													<c:out value="${row.OPT_DTL_NM}" />
													<c:if test="${not empty row.subPrdList}">
														&nbsp;/&nbsp;
													</c:if>
												</c:if>
												
												<%-- 선택옵션 상품 리스트 --%>
												<c:if test="${not empty row.subPrdList}">
													<c:forEach var="subPrd" items="${row.subPrdList}" varStatus="i">
														${subPrd.OPT_DTL_NM}
														(
															<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
															</c:if>
														<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
														${i.last ? '' : '/&nbsp;'}	
													</c:forEach>
												</c:if>
		                                    </div>
	                                    </c:if>
	                                    <div class="amount">
	                                        <fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" />개
	                                    </div>
	                                    <p class="price-after">
	                                        <span class="blind">판매가</span><strong><fmt:formatNumber value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}" type="number" /></strong>원
	                                    </p>
	                                    
	                                    <c:choose>
										<c:when test="${not empty orderPayInfo.ORD_MST_PRE_CD 
											|| row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD
											|| row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD
											}"><%-- 재결제인 경우--%>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${row.ORD_PRD_DLV_BND_YN eq 'Y' and row.VDR_ROWNUM eq 1}">
													<p class="price-ship">
														<c:choose>
															<c:when test="${row.DLV_CHARGE eq 0}">
																<%-- 묶음배송비 and 추가배송비 모두 0인 경우 --%>
																<span>무료배송</span>
															</c:when>
															<c:otherwise>
																<span>
																<fmt:formatNumber value="${row.DLV_CHARGE}" type="number" />원
																</span>
															</c:otherwise>
														</c:choose>
														<span>(도서,산간제외)</span>
													</p>
												</c:when>
												<c:when test="${row.ORD_PRD_DLV_BND_YN eq 'N'}">
													<p class="price-ship">
														<c:choose>
															<c:when test="${row.DLV_CHARGE eq 0}">
																<%-- 묶음배송비 and 추가배송비 모두 0인 경우 --%>
																<span>무료배송</span>
															</c:when>
															<c:otherwise>
																<span>
																<fmt:formatNumber value="${row.DLV_CHARGE}" type="number" />원
																</span>
															</c:otherwise>
														</c:choose>
														<span>(도서,산간제외)</span>
													</p>
												</c:when>
											</c:choose>
										</c:otherwise>
										</c:choose>
										
										<c:choose>
		                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_NORMAL_CD }">
		                        				<c:if test="${row.ORD_PRD_VDR_IDX gt 0}">
		                        					<p class="ship-office partner">
				                                        	파트너 배송
				                                    </p>
		                        				</c:if>
		                        				<c:if test="${row.ORD_PRD_VDR_IDX lt 0}">
		                        					<p class="ship-office price-king">
				                                        	프라이스킹 배송
				                                    </p>
		                        				</c:if>
		                        			</c:when>
		                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
		                        				<p class="ship-office get-it-now">
			                                        	겟잇나우
			                                    </p>
		                        			</c:when>
		                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
		                        				<p class="ship-office clean-king">
			                                        	무형배송
			                                    </p>
		                        			</c:when>
		                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD }">
		                        				<p class="ship-office long-monthly">
			                                        	장기할부배송
			                                    </p>
		                        			</c:when>
		                        		</c:choose>
	                                </div>
	                            </li><!-- // row -->
                            </c:forEach>
                        </ul><!-- // cart-list -->
                    </div><!-- // cart-list-wrap -->
                    
                    <c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
	                    <div class="frame-a">
	                        <p class="warning">
	                            	클린킹 상품은 온라인 주문만 가능하고, 취소 및 환불은 불가능합니다. 취소 및 환불 관련 문의는 <strong>클린킹 고객센터 080-400-8000</strong>으로 연락주시기 바랍니다.
	                        </p>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div><!-- // product -->

		<c:if test="${not empty requestedGiftList}">	
	        <div class="order-sheet accordion free-gift finish" data-role="collapsible-set"><!-- free-gift -->
	            <div class="section" data-role="collapsible" data-collapsed="false">
	                <h3>
	                    <strong>사은품정보</strong>
	                    (<c:out value="${fn:length(requestedGiftList)}"/>)
	                    <i><!-- icon --></i>
	                </h3>
	
	                <div class="toggle-box">
	                    <ul class="free-gift-list"><!-- free-gift-list -->
	                    	<c:forEach var="gift" items="${requestedGiftList}" varStatus="i">
	                    		<li class="ct col">
		                            <span class="thumb">
		                            	<c:if test="${gift.GFT_MST_PRD_TYPE eq 'P' }">
			                           		<%-- 상품 이미지 --%>
			                           		<img data-original="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="<c:out value="${gift.PRD_IMAGE_ALT}"/>" />
			                           	</c:if>
			                           	<c:if test="${gift.GFT_MST_PRD_TYPE ne 'P' }">
			                           		<%-- 파일 등록 --%>
			                           		<img data-original="<c:out value="${cdnDomain }${gift.CMM_FLE_ATT_PATH}${gift.CMM_FLE_SYS_NM}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="<c:out value="${gift.CMN_FLE_ALT_TXT}"/>" />
			                           	</c:if>
		                            </span>
		                            <div class="core">
		                                <strong class="subject"><c:out value="${gift.GFT_MST_NAME}"/></strong>
		                            </div>
		                        </li>
	                    	</c:forEach>
	                    </ul><!-- // free-gift-list --> 
	                </div>      
	            </div>
	        </div><!-- // free-gift -->
        </c:if>

        <div class="order-sheet accordion orderer finish" data-role="collapsible-set"><!-- orderer -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong>주문고객정보 확인</strong>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <ul class="form-a view">
                        <li>
                            <div class="tit">주문하시는 분</div>
                            <div class="field">
                                <c:out value="${orderPayInfo.ORD_MST_ORD_NM }" />
                            </div>
                        </li>
                        <li>
                            <div class="tit">휴대폰번호</div>
                            <div class="field">
                                <c:out value="${orderPayInfo.ORD_MST_HP1 }" />-<c:out value="${orderPayInfo.ORD_MST_HP2 }" />-<c:out value="${orderPayInfo.ORD_MST_HP3 }" />
                            </div>
                        </li>
                        <li>
                            <div class="tit">이메일 주소</div>
                            <div class="field">
                                <c:out value="${orderPayInfo.ORD_MST_MAIL }" />
                            </div>
                        </li>
                    </ul>
                </div>      
            </div>
        </div><!-- // orderer -->

		<c:choose>
			<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
				<div class="order-sheet accordion pickup" data-role="collapsible-set"><!-- pickup -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>겟잇나우 픽업정보</strong>
		                    <strong class="warning"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/> </strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">방문매장</div>
		                            <div class="field">
		                                <p>
		                                    <a href="javascript:;"><strong class="primary"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/></strong></a>
		                                </p>
		                                <p class="mt10">
				                                    평일 -
				                        	<c:choose>
				                        		<c:when test="${getItNowShopInfo.SHP_MST_WEK_DAY_GBN eq 'H'}">
				                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_MM }"/>
				                        			~
				                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_MM }"/>
				                        		</c:when>
				                        		<c:otherwise>
				                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_TXT }"/>
				                        		</c:otherwise>
				                        	</c:choose>
				                        	주말 -
				                        	<c:choose>
				                        		<c:when test="${getItNowShopInfo.SHP_MST_WEK_END_GBN eq 'H'}">
				                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_MM }"/>
				                        			~
				                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_MM }"/>
				                        		</c:when>
				                        		<c:otherwise>
				                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_TXT }"/>
				                        		</c:otherwise>
				                        	</c:choose>
		                                </p>
		                                <p class="mt10">
		                                    	연락처 : <c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>
		                                </p>
		                                <p class="mt10">
		                                    <a href="javascript:getItNowShopInfoPopup('${getItNowShopInfo.SHP_MST_IDX }');" class="button small"><span>매장위치확인</span></a>
		                                </p>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">방문예정일</div>
		                            <div class="field">
		                                <strong><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowShopInfo.ORD_GET_PKU_DT }"/></strong>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">방문예정시간</div>
		                            <div class="field">
		                                <strong><c:out value="${getItNowShopInfo.ORD_GET_PKU_HH }"/></strong>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">수령인정보</div>
		                            <div class="field">
		                                <p>
		                                    <span id="spanOrdGetNm"><c:out value="${getItNowShopInfo.ORD_GET_NM }"/></span><br />
		                                    <span id="spanOrdGetTel"><c:out value="${getItNowShopInfo.ORD_GET_TEL1 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL2 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL3 }"/></span>
		                                </p>
		                                <p>
		                                    <a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="button small"><span>수령인정보 수정</span></a>
		                                </p>
		                            </div>
		                        </li>
		                    </ul>
		
		                    <div class="padder mt20">
		                        <ul class="list primary">
		                            <li>수령인에게 주문정보가 문자로 발송됩니다. (상품 가격은 노출되지 않습니다.)</li>
		                            <li>상품준비 완료 문자를 받으신 후 매장에 방문해 주세요</li>
		                            <li><span class="warning">매장 방문 시 문자메시지와 신분증을 꼭 지참해 주세요.</span></li>
		                        </ul>
		                    </div>
		
		                    <div class="section-button mb20"><!-- section-button -->
		                        <a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="button full"><span>교환권 발송 </span></a>
		                    </div><!-- // section-button -->
		                </div>      
		            </div>
		        </div><!-- // pickup -->
			</c:when>
			<c:otherwise>
				<div class="order-sheet accordion ship-address finish" data-role="collapsible-set"><!-- ship-address -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>배송정보 확인</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">받으시는 분</div>
		                            <div class="field">
		                               <span id="span_dlv_nm"><c:out value="${orderDeliveryInfo.ORD_DLV_NM }" /></span>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">휴대폰 번호</div>
		                            <div class="field">
		                                <span  id="span_hp"><c:out value="${orderDeliveryInfo.ORD_DLV_HP1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }" /></span>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">전화번호</div>
		                            <div class="field">
		                                <span  id="span_tel"><c:out value="${orderDeliveryInfo.ORD_DLV_TEL1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }" /></span>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">주소</div>
		                            <div class="field">
		                                <p>
		                                    <span class="blind">우편번호</span>
		                                    <span id="span_zipcd">[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />]</span>
		                                </p>
		                                <p>
		                                    <span class="blind">도로명 주소</span>
		                                    <span id="span_dro"><c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }" /></span>
		                                </p>
		                                <p>
		                                    <span class="blind">지번주소</span>
		                                    <span id="span_jbn"><c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2 }" /></span>
		                                </p>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">
		                            <c:choose>
			           				<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
			           					유의사항
			           				</c:when>
			           				<c:otherwise>
			           					 배송유의사항
			           				</c:otherwise>
			           				</c:choose>
		                            </div>
		                            <div class="field">
		                                <span id="span_desc"><c:out value="${orderDeliveryInfo.ORD_DLV_MSG }" /></span>
		                            </div>
		                        </li>
		                    </ul>
		                    <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y'}">	
		                    	<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
				                    <div class="section-button"><!-- section-button -->
				                        <a href="javascript:goDeliveryModify();" class="button full _pg_link"><span>배송지 정보 수정</span></a>
				                    </div><!-- // section-button -->
			                    </c:if>
		                    </c:if>
		                </div>      
		            </div>
		        </div><!-- // ship-address -->
			</c:otherwise>	
		</c:choose>
		
		<%---------------------------------------------------------------- 매장위치 확인 팝업 시작 ------------------------------------------------%>
        <section id="shopInfo" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #shopInfo -->
        </section><!-- // #shopInfo -->
        <%---------------------------------------------------------------- 매장위치 확인 팝업 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 배송지 정보 수정 팝업 시작 ------------------------------------------------%>
        <section id="shipModify" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #shipModify -->
        <form id="dlvFrm" name="dlvFrm">
			<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
        	<dl class="ui-content">
			   <dt>
			       <h2>배송지 정보 수정</h2>
			       <a href="javascript:$.com.util.layPop('close', $('#shipModify'), true)" class="btn_close"><span class="blind">팝업 닫기</span></a>
			   </dt>
			   <dd class="dd_con_d">
			
			       <div class="ship-address">
			       	   <c:if test="${not empty sessionUser.MEM_MST_MEM_ID }">
				           <div class="apply"><!-- apply -->
				               <a href="#addressLately" class="button small address-view"><span>최근 배송지</span></a>
				               <a href="#addressMy" class="button small address-view"><span>나의 주소록</span></a>
				               <a href="javascript:;" id="resetDlvInfo" class="button small"><span>새로운 주소</span></a>
				           </div><!-- // apply -->
			           </c:if>
			
			           <div id="addressLately" class="address-info address-list recent-address-list"><!-- address-info -->
			               <p>
			                   <strong>최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요</strong>
			               </p>
			               <p class="desc">
			                   <span class="small">(최대 5개 까지 제공)</span>
			               </p>
			
			               <table>
			               <caption>받으시는 분, 주소/휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
			               <colgroup>
			                   <col style="width: 25%;" />
			                   <col style="width: auto;" />
			                   <col style="width: 10%;" />
			               </colgroup>
			               <thead>
			                   <tr>
			                       <th scope="col">받으시는 분</th>
			                       <th scope="col">주소/휴대폰/전화번호</th>
			                       <th scope="col">선택</th>
			                   </tr>
			               </thead>
			               <tbody>
			                   <c:choose>
			                   		<c:when test="${not empty recentDlvList}">
			                   			<c:forEach var="row" items="${recentDlvList}" varStatus="i" >
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_NM" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_NM }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_ZIP_CDE5" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_DRO_ADR1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_DRO_ADR2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_JBN_ADR1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_JBN_ADR2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_HP1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_HP2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_HP3" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP3 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_TEL1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_TEL2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_TEL3" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL3 }"/>"/>
			                   				
			                   				<tr>
						                       <td><c:out value="${row.ORD_DLV_NM }"/></td>
						                       <td class="text-left">
						                           <p><span class="blind">우편번호</span>[<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>]</p>
						                           <p><span class="blind">도로명 주소</span><c:out value="${row.ORD_DLV_DRO_ADR1 }"/><c:out value="${row.ORD_DLV_DRO_ADR2 }"/></p>
						                           <p><span class="blind">지번 주소</span><c:out value="${row.ORD_DLV_JBN_ADR1 }"/><c:out value="${row.ORD_DLV_JBN_ADR2 }"/></p>
						                           <p>
						                               <span class="blind">휴대폰</span><c:out value="${row.ORD_DLV_HP1 }"/>-<c:out value="${row.ORD_DLV_HP2 }"/>-<c:out value="${row.ORD_DLV_HP3 }"/> / 
						                               <c:if test="${not empty row.ORD_DLV_TEL1 }">
						                               <span class="blind">전화번호</span><c:out value="${row.ORD_DLV_TEL1 }"/>-<c:out value="${row.ORD_DLV_TEL2 }"/>-<c:out value="${row.ORD_DLV_TEL3 }"/>
						                               </c:if>
						                           </p>
						                       </td>
						                       <td>
						                           <input type="radio" id="recentDlvRadio_${i.index }" name="recent_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.ORD_DLV_NM }"/> 배송지" />
						                       </td>
						                   </tr>
			                   			</c:forEach>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<tr>
					                       <td colspan="3">
					                           <p class="no-more">
					                               	최근 배송지가 없습니다.
					                           </p>
					                       </td>
					                   </tr>
			                   		</c:otherwise>
			                   	</c:choose>
			               </tbody>
			               </table>
			
			               <c:if test="${not empty recentDlvList}">
				               <div class="action">
				                   <a href="javascript:applyDlv('recent');" class="button primary"><span>선택 주소 사용</span></a>
				               </div>
				            </c:if>
			           </div><!-- // address-info -->
			
			           <div id="addressMy" class="address-info address-list my-address-list"><!-- address-info -->
			               <p>
			                   <strong>배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.<br />
			                   나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, 마이페이지 &gt; 배송지관리에서 등록/수정 가능합니다.</strong>
			               </p>
			
			               <table>
			               <caption>받으시는 분, 주소/휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
			               <colgroup>
			                   <col style="width: 25%;" />
			                   <col style="width: auto;" />
			                   <col style="width: 10%;" />
			               </colgroup>
			               <thead>
			                   <tr>
			                       <th scope="col">받으시는 분</th>
			                       <th scope="col">주소/휴대폰/전화번호</th>
			                       <th scope="col">선택</th>
			                   </tr>
			               </thead>
			               <tbody>
			                   <c:choose>
			                   		<c:when test="${not empty myDlvList}">
			                   			<c:forEach var="row" items="${myDlvList}" varStatus="i" >
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_NM" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_RCV_NM }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_ZIP_CDE5" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_DRO_ADR1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_DRO_ADR2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_JBN_ADR1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_JBN_ADR2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_HP1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_HP2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_HP3" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP3 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_TEL1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL1 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_TEL2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL2 }"/>"/>
			                   				<input type="hidden" data-target_dlv_id="ORD_DLV_TEL3" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL3 }"/>"/>
			                   				
			                   				<tr>
						                       <td><c:out value="${row.MEM_DLV_RCV_NM }"/></td>
						                       <td class="text-left">
						                           <p><span class="blind">우편번호</span>[[<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>]</p>
						                           <p><span class="blind">도로명 주소</span><c:out value="${row.MEM_DLV_DRO_ADR1 }"/><c:out value="${row.MEM_DLV_DRO_ADR2 }"/></p>
						                           <p><span class="blind">지번 주소</span><c:out value="${row.MEM_DLV_JBN_ADR1 }"/><c:out value="${row.MEM_DLV_JBN_ADR2 }"/></p>
						                           <p>
						                               <span class="blind">휴대폰</span><c:out value="${row.MEM_DLV_HP1 }"/>-<c:out value="${row.MEM_DLV_HP2 }"/>-<c:out value="${row.MEM_DLV_HP3 }"/> / 
						                               <span class="blind">전화번호</span>
						                               <c:if test="${not empty row.MEM_DLV_TEL1 }">
						                               		<c:out value="${row.MEM_DLV_TEL1 }"/>-<c:out value="${row.MEM_DLV_TEL2 }"/>-<c:out value="${row.MEM_DLV_TEL3 }"/>
						                               </c:if>
						                           </p>
						                       </td>
						                       <td>
						                           <input type="radio" id="myDlvRadio_${i.index }" name="my_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.MEM_DLV_NM }"/> 배송지" />
						                       </td>
						                   </tr>
			                   			</c:forEach>
			                   		</c:when>
			                  			<c:otherwise>	
			                  				<tr>
					                       <td colspan="3">
					                           <p class="no-more">
					                              	주소록이 없습니다.
					                           </p>
					                       </td>
					                   </tr>
			               			</c:otherwise>
			                    </c:choose>
			               </tbody>
			               </table>
			
			               <c:if test="${not empty myDlvList}">
				                <div class="action">
				                    <a href="javascript:applyDlv('my');" class="button primary"><span>선택 주소 사용</span></a>
				                </div>
			                </c:if>
			           </div><!-- // address-info -->
			
			           <div class="address-info address-form in"><!-- address-info -->
			               <ul class="form-a dlvForm">
			                   <li class="name">
			                       <div class="tit">
			                           <label for="ORD_DLV_NM">받으시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
			                       </div>
			                       <div class="field">
			                       		<input type="text" id="ORD_DLV_NM" name="ORD_DLV_NM" class="text small" title="받으시는 분" maxlength="20" value="<c:out value="${orderDeliveryInfo.ORD_DLV_NM }"/>"/>
			                       </div>
			                   </li>
			                   <li class="tel">
			                       <div class="tit">
			                           <label for="ORD_DLV_HP1">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
			                       </div>
			                       <div class="field">
			                           <label for="ORD_DLV_HP1" class="sel_box_st0">
			                               <select id="ORD_DLV_HP1" name="ORD_DLV_HP1" class="select" title="휴대폰 번호 앞자리">
			                                   <option value="">선택</option>
							                    <c:if test="${not empty hpCodeList }">
							                         <c:forEach var="hpRow" items="${hpCodeList }">
							                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
							                         </c:forEach>
							                     </c:if>
			                               </select>
			                           </label>
			                           -
					                   <input type="number" id="ORD_DLV_HP2" name="ORD_DLV_HP2" class="text small number" title="휴대폰 번호 중간자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }"/>"/>
					                   -
					                   <input type="number" id="ORD_DLV_HP3" name="ORD_DLV_HP3" class="text small number" title="휴대폰 번호 뒷자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }"/>"/>
			                       </div>
			                   </li>
			                   <li class="tel">
			                       <div class="tit">
			                           <label for="ORD_DLV_TEL1">전화번호</label>
			                       </div>
			                       <div class="field">
			                           <label for="ORD_DLV_TEL1" class="sel_box_st0">
			                               <select id="ORD_DLV_TEL1" class="select" name="ORD_DLV_TEL1" title="전화 번호 앞자리">
			                                   <option value="">선택</option>
							                    <c:if test="${not empty telCodeList }">
							                         <c:forEach var="telRow" items="${telCodeList }">
							                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
							                         </c:forEach>
							                     </c:if>
			                               </select>
			                           </label>
			                           -
					                   <input type="number" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" class="text small number" title="전화 번호 중간자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }"/>"/>
					                   -
					                   <input type="number" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" class="text small number" title="전화 번호 뒷자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }"/>"/>
			                       </div>
			                   </li>
			                   <li class="address">
			                       <div class="tit">
			                           <label for="ORD_DLV_ZIP_CDE5">주소<span class="essential"><em class="blind">필수입력</em></span></label>
			                       </div>
			                       <div class="field">
			                           <p class="zip">
			                               <input type="text" id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" class="text" title="우편번호" maxlength="5" value="<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }"/>" readonly="readonly">
			                               <!-- <a href="javascript:;" class="button small search-zipcode"
			                                data-post1_id="ORD_DLV_ZIP_CDE6_1"
					                    	data-post2_id="ORD_DLV_ZIP_CDE6_2"
					                    	data-addr1_id="ORD_DLV_JBN_ADR1"
					                    	data-addr2_id="ORD_DLV_JBN_ADR2"
					                    	data-new_post_id="ORD_DLV_ZIP_CDE5"
					                    	data-new_addr1_id="ORD_DLV_DRO_ADR1"
					                    	data-new_addr2_id="ORD_DLV_DRO_ADR2"
					                    	data-opener_fn="getAddDlvCharge"
			                               ><span>우편번호 찾기</span></a> -->
			                               <a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true);" id="zipCheck" class="button small"><span>우편번호 찾기</span></a>
			                           </p>
			                           <p>
			                           		<input type="text" name="ORD_DLV_DRO_ADR1" id="ORD_DLV_DRO_ADR1" class="text" title="도로명 주소" placeholder="도로명 주소" readonly="readonly" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }"/>"/>
			                           </p>
			                           <p>
			                               <input type="text" name="ORD_DLV_JBN_ADR1" id="ORD_DLV_JBN_ADR1" class="text" title="지번 주소" placeholder="지번 주소" <%-- readonly="readonly" --%> value="<c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }"/>"/>
			                           </p>
			                           <p>
			                           	   <input type="text" name="ORD_DLV_DRO_ADR2" id="ORD_DLV_DRO_ADR2" class="text" title="이하 주소" placeholder="이하 주소" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }"/>"/>
			                           </p>
			                       </div>
			                   </li>
			                    <%-- [BEGIN] 우편번호 api 스크립트 --%>
								<%-- <%@ include file="/WEB-INF/jsp/mobile/include/zipcode.jsp" %> --%>
								<%-- [END] 우편번호 api 스크립트 --%>
			                   <li class="message">
			                       <div class="tit">
			                           <label for="ORD_DLV_MSG">배송유의사항</label>
			                       </div>
			                       <div class="field">
			                           <p>
			                           		<label for="dlvMessage" class="sel_box_st0" title="배송 메세지 선택">
					                       	   	<select id="dlvMessage" class="select" title="배송 메세지 선택">
			                                        <option value="">메세지를 선택해주세요.</option>
			                                        <c:if test="${not empty dlvMsgList }">
					                                    <c:forEach var="row" items="${dlvMsgList }">
					                                        <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
					                                    </c:forEach>
					                                    <option value="0">매세지 직접입력</option>
					                                </c:if>
			                                    </select>
		                                    </label>
			                           		<input type="text" class="text" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능" value="<c:out value="${orderDeliveryInfo.ORD_DLV_MSG }"/>" <c:if test="${empty orderDeliveryInfo.ORD_DLV_MSG }">style="display:none;"</c:if>/>
			                           </p>
			                           <p class="desc">
			                               	택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다. 
			                           </p>
			                       </div>
			                   </li>
			               </ul>
			               
			               <div class="section-button mb20"><!-- section-button -->
			                   <a href="javascript:goDlvSubmit();" class="button warning"><span>확인</span></a>
			                   <a href="javascript:$.com.util.layPop('close', $('#shipModify'), true);" class="button primary"><span>취소</span></a>
			               </div><!-- // section-button -->
			                            
			           </div><!-- // address-info -->
			        </div>
			    </dd>
			</dl>
		</form>
        </section><!-- // #shipModify -->
        <%---------------------------------------------------------------- 배송지 정보 수정 팝업 끝 ------------------------------------------------%>
        
        <%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 시작 ------------------------------------------------%>
		<section id="couponDispatch" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #couponDispatch -->
			<form id="getDlvFrm" name="getDlvFrm" method="post">
			<input type="hidden" name="ORD_MST_CD" value="<c:out value="${getItNowShopInfo.ORD_MST_CD}"/>"/>
			<input type="hidden" name="ORD_MST_ORD_NM" value="<c:out value="${getItNowShopInfo.ORD_MST_ORD_NM}"/>"/>
			<input type="hidden" name="ORD_MST_ORD_DT" value="<c:out value="${getItNowShopInfo.ORD_MST_ORD_DT}"/>"/>
			<input type="hidden" name="SHP_MST_NM" value="<c:out value="${getItNowShopInfo.SHP_MST_NM}"/>"/>
			<input type="hidden" name="SHP_MST_TEL" value="<c:out value="${getItNowShopInfo.SHP_MST_TEL}"/>"/>
			<input type="hidden" name="ORD_GET_TIK" value="<c:out value="${getItNowShopInfo.ORD_GET_TIK}"/>"/>
			
            <dl class="ui-content">
                <dt>
                    <h2>교환권발송</h2>
                    <a href="javascript:$.com.util.layPop('close', $('#couponDispatch'), true)" class="btn_close"><span class="blind">팝업 닫기</span></a>
                </dt>
                <dd class="dd_con_d">

                    <div class="padder mt20">
                        <ul class="list primary">
                            <li>교환권은 최대 2회까지만 발송할 수 있습니다.</li>
                            <li>문자메시지에 상품가격은 노출되지 않습니다.</li>
                        </ul>
                        <p class="mt20">
                            <strong class="warning large">남은 발송 횟수 <span id="spanRemainSmsCnt"><c:out value="${getItNowShopInfo.ORD_GET_SMS_CNT}"/></span>/2회</strong>
                        </p>
                    </div>

                    <div class="coupon-dispatch mt10"><!-- coupon-dispatch -->
                        <h3>보내시는 분</h3>
                        <div class="padder">
                            <ul>
                                <li><span class="blind">보내시는 분 성명</span><c:out value="${getItNowShopInfo.ORD_MST_ORD_NM }"/></li>
                                <li><span class="blind">보내시는 분 연락처</span><c:out value="${getItNowShopInfo.ORD_MST_HP1 }"/>-<c:out value="${getItNowShopInfo.ORD_MST_HP2 }"/>-<c:out value="${getItNowShopInfo.ORD_MST_HP3 }"/></li>
                            </ul>
                        </div>
                    </div><!-- // coupon-dispatch -->

                    <div class="coupon-dispatch"><!-- coupon-dispatch -->
                        <h3>받으시는 분</h3>
                        <div class="action">
                        	<input id="ORD_GET_GBN_0" class="radio" type="radio" name="ORD_GET_GBN" value="0" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '0'}">checked="checked"</c:if> style="display: none;"/><%-- 본인수령 --%>
                    		<input id="ORD_GET_GBN_1" class="radio" type="radio" name="ORD_GET_GBN" value="1" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '1'}">checked="checked"</c:if> style="display: none;"/><%-- 타인수령 --%>
                            <a href="javascript:chageGetGbn('0');" id="ORD_GET_GBN_BTN_0" class="button ${getItNowShopInfo.ORD_GET_GBN eq '0' ? 'warning' : ''} small"><span>본인수령</span></a>
                            <a href="javascript:chageGetGbn('1');" id="ORD_GET_GBN_BTN_1" class="button ${getItNowShopInfo.ORD_GET_GBN eq '1' ? 'warning' : ''} small"><span>타인수령</span></a>
                        </div>
                        <div class="padder">
                            <ul>
                            	<li id="p_ordGetRlt" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '0'}">style="display: none;"</c:if>>
                                    <label for="ORD_GET_RLT" class="sel_box_st0">
                                        <select id="ORD_GET_RLT" name="ORD_GET_RLT" class="select" title="주문하신 분과의 관계">
                                            <option value="">주문자와의 관계</option>
				                             <c:if test="${not empty getItNowReceiverList }">
					                              <c:forEach var="row" items="${getItNowReceiverList }">
					                                  <option value="<c:out value="${row.CMN_COM_ETC1 }"/>" <c:if test="${getItNowShopInfo.ORD_GET_RLT eq row.CMN_COM_ETC1}">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
					                              </c:forEach>
				                              </c:if>
                                        </select>
                                    </label>
                                </li>
                                <li>
                                    <label for="ORD_GET_NM" class="blind">받으시는 분 성명</label>
                                    <input type="text" id="ORD_GET_NM" name="ORD_GET_NM" class="text" maxlength="15" value="${getItNowShopInfo.ORD_GET_NM }">
                                </li>
                                <li class="tel">
                                    <label for="ORD_GET_TEL1" class="sel_box_st0">
                                        <select id="ORD_GET_TEL1" name="ORD_GET_TEL1" class="select" title="받으시는 분 휴대폰 번호 앞자리">
                                            <option value="">선택</option>
										    <c:if test="${not empty hpCodeList }">
											 <c:forEach var="hpRow" items="${hpCodeList }">
											     <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${getItNowShopInfo.ORD_GET_TEL1 eq hpRow.CMN_COM_NM}">selected="selected"</c:if> ><c:out value="${hpRow.CMN_COM_NM }"/></option>
											 </c:forEach>
										     </c:if>
                                        </select>
                                    </label> -
                                    <input type="number" class="text number" id="ORD_GET_TEL2" name="ORD_GET_TEL2" maxlength="4" title="받으시는 분 휴대폰 번호 중간자리" value="${getItNowShopInfo.ORD_GET_TEL2 }"/> -
                                    <input type="number" class="text number" id="ORD_GET_TEL3" name="ORD_GET_TEL3" maxlength="4" title="받으시는 분 휴대폰 번호 끝자리" value="${getItNowShopInfo.ORD_GET_TEL3 }"/>
                                </li>
                            </ul><!-- // 본인 수령 -->
                        </div>
                    </div><!-- // coupon-dispatch -->

                    <div class="coupon-dispatch"><!-- coupon-dispatch -->
                    	<%-- 대표 상품명 설정 --%>
			            <c:if test="${ fn:length(orderProductList) gt 1 }">
			            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM} 외 ${ fn:length(orderProductList) - 1 }건"/>
			            </c:if>
			            <c:if test="${ fn:length(orderProductList) eq 1 }">
			            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM}"/>
			            </c:if>
                        <h3>주문상품</h3>
                        <div class="cart-list-wrap"><!-- cart-list-wrap -->
                            <ul class="cart-list"><!-- cart-list -->
                            	<c:forEach var="row" items="${orderProductList}" varStatus="i">
                            		<li class="col"><!-- row -->
	                                    <div class="item">
	                                        <a href="javascript:;" class="link">
	                                            <span class="thumb"><img data-original="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${row.PRD_IMAGE_ALT}" /></span>
	                                            <span class="subject"><c:out value="${row.PRD_MST_NM}" /></span>
	                                        </a>
	                                        <c:if test="${empty row.ORD_PRD_ORG_IDX}" >
				                                <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
													<div class="option">
														옵션 :
														<c:if test="${not empty row.optionList}">
															<c:out value="${row.OPT_DTL_NM}" />
															<c:if test="${not empty row.subPrdList}">
																&nbsp;/&nbsp;
															</c:if>
														</c:if>
														
														<%-- 선택옵션 상품 리스트 --%>
														<c:if test="${not empty row.subPrdList}">
															<c:forEach var="subPrd" items="${row.subPrdList}" varStatus="i">
																${subPrd.OPT_DTL_NM}
																(
																	<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																		+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																	</c:if>
																<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
																${i.last ? '' : '/&nbsp;'}	
															</c:forEach>
														</c:if>
													</div>
												</c:if>
											</c:if>
	                                        <div class="amount">
	                                            <fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" />개
	                                        </div>
	                                    </div>
	                                </li><!-- // row -->
                            	</c:forEach>
                            </ul><!-- // cart-list -->
                        </div><!-- // cart-list-wrap -->
                    </div><!-- // coupon-dispatch -->

                    <div class="section-button mb20"><!-- section-button -->
                        <a href="javascript:sendGetItNowTicket();" class="button warning full"><span>교환권발송</span></a>
                    </div><!-- // section-button -->
                </dd>
            </dl>
            </form>
        </section><!-- // #couponDispatch -->
        <%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 끝 ------------------------------------------------%>
		
		<c:choose>
      		<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
      			<div class="order-sheet accordion payment-way finish" data-role="collapsible-set"><!-- payment-way -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>상담예약 정보 확인</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">상담예약 일시</div>
		                            <div class="field">
		                                <ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/>
		                            </div>
		                        </li>
		                      </ul>
		                  </div>
		              </div>
		         </div>
      		</c:when>
      		<c:otherwise>
      			<div class="order-sheet accordion payment-way finish" data-role="collapsible-set"><!-- payment-way -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>결제정보 확인</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">결제일시</div>
		                            <div class="field">
		                                <c:choose>
		                            		<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE }">
		                            			<ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<c:if test="${orderPayInfo.ORD_MST_PAY_DT eq '00000000000000' }">
				                            		-
				                            	</c:if>
				                            	<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' }">
				                            		<ui:formatDate value="${orderPayInfo.PAY_MST_PAYDATE}" pattern="yyyy.MM.dd HH:mm:ss"/>
				                            	</c:if>
		                            		</c:otherwise>
		                            	</c:choose>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">결제방법</div>
		                            <div class="field">
		                                <c:choose>
						                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD }"><%-- 신용카드 --%>
						                    	<p>신용카드</p>
							                    <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></p>
												<p><c:out value="${orderPayInfo.PAY_MST_KICC_ACQUIRER_NM }" /> (<c:out value="${orderPayInfo.MASKING_KICC_CARD_NO}" />)</p>
												<p>
												<c:choose>
												    <c:when test="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD eq '00' }">
													     일시불
												    </c:when>
												    <c:otherwise>
													<c:if test="${orderPayInfo.PAY_MST_KICC_NOINT eq '02' }">
														무이자
													</c:if>
													할부
													<fmt:formatNumber value="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD}" type="number" pattern="0" />
													개월
												    </c:otherwise>
												</c:choose>
												</p>
												<%-- <p class="mt20"><a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '01');" class="btn_st1 btn_blk777 large"><span>신용카드 영수증 보기</span></a></p> --%>
						                    </c:when>
						                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }"><%-- 카카오페이 --%>
						                    	<p>신용카드</p>
							                    <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KAKAO_AUTHCODE }" /></p>
												<p><c:out value="${orderPayInfo.PAY_MST_KAKAO_CARDNAME }" /> ( <c:out value="${orderPayInfo.MASKING_KAKAO_CARD_NO}" /> )</p>
												<p>
												<c:choose>
												    <c:when test="${orderPayInfo.PAY_MST_KAKAO_CARDQUOTA eq '00' }">
													     일시불
												    </c:when>
												    <c:otherwise>
													할부
													<fmt:formatNumber value="${orderPayInfo.PAY_MST_KAKAO_CARDQUOTA}" type="number" pattern="0" />
													개월
												    </c:otherwise>
												</c:choose>
												</p>
												<%-- <p class="mt20"><a href="javascript:printKakaoReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />');" class="btn_st1 btn_blk777 large"><span>신용카드 영수증 보기</span></a></p> --%>
						                    </c:when>
						                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_PAYNOW }"><%-- 페이나우 --%>
						                    	<p>신용카드</p>
							                    <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_FINANCEAUTHNUM }" /></p>
												<p><c:out value="${orderPayInfo.PAY_MST_FINANCENAME }" /> ( <c:out value="${fn:substring(orderPayInfo.PAY_MST_CARDNUM,0,4) }" />-<c:out value="${fn:substring(orderPayInfo.PAY_MST_CARDNUM,4,8) }" />-****-**** )</p>
												<p>
												<c:choose>
												    <c:when test="${orderPayInfo.PAY_MST_CARDINSTALLMONTH eq '00' }">
													     일시불
												    </c:when>
												    <c:otherwise>
													할부
													<fmt:formatNumber value="${orderPayInfo.PAY_MST_CARDINSTALLMONTH}" type="number" pattern="0" />
													개월
												    </c:otherwise>
												</c:choose>
												</p>
												<!-- <p class="mt20"><a href="javascript:printCardReceipt();" class="btn_st1 btn_blk777 large"><span>신용카드 영수증 보기</span></a></p> -->
						                    </c:when>
						                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}"><%-- 무통장 or 에스크로 --%>
						                    	<p>${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT ? '가상계좌' : '에스크로' }</p>
						                        <c:choose>
						                            <c:when test="${orderPayInfo.ORD_MST_PAY_DT eq '00000000000000' }"><%-- 결제일시가 없는 경우 입금미확인 --%>
						                                <p><span class="warning">입금미확인</span></p>
						                                <p>입금계좌 : [<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" />] <c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO }" /></p>
						                                <p>입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></p>
						                            </c:when>
						                            <c:otherwise>
						                            	<p><span class="warning">입금완료</span></p>
						                                <p>입금계좌 : [<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" />] <c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO }" /></p>
						                                <p>입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></p>
						                                <p>입금자명 : <c:out value="${orderPayInfo.ORD_MST_DPS_NM }" /></p>
						                            </c:otherwise>
						                        </c:choose>
						                        <%-- <c:if test="${orderPayInfo.ORD_MST_CSH_RCP eq 'Y' }">
						                        	<p class="mt20"><a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '03');" class="btn_st1 btn_blk777 large"><span>현금영수증 영수증 보기</span></a></p>
						                        </c:if> --%>
						                    </c:when>
						                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
						                    	<p>실시간계좌이체</p>
				                                <p><c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" /></p>
				                                <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></p>
				                                <%-- <c:if test="${orderPayInfo.ORD_MST_CSH_RCP eq 'Y' }">
				                                	<p class="mt20"><a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '02');" class="btn_st1 btn_blk777 large"><span>현금영수증 영수증 보기</span></a></p>
				                                </c:if> --%>
						                    </c:when>
						                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}"><%-- 전액 포인트/쿠폰/크라운 결제 --%>
						                    	<p>포인트</p>
						                    </c:when>
			                            </c:choose>
		                            </div>
		                        </li>
		                        <c:choose>
									<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD
															or empty userInfo
															or userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE
															or userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE
									}">
									</c:when>
									<c:otherwise>
										<li>
				                            <div class="tit">적립 예정<br />포인트</div>
				                            <div class="field">
				                                <fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_MIL}" type="number"/> P
				                            </div>
				                        </li>
				                        <li>
				                            <div class="tit">적립 예정<br />OK캐쉬백 포인트</div>
				                            <div class="field">
				                                <fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_OCB}" type="number"/> 포인트 
				                                <c:if test="${orderPayInfo.TOT_ORD_SAV_OCB gt 0}">
				                            		(<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>-****-****) 
				                            	</c:if>
				                            </div>
				                        </li>
									</c:otherwise>
								</c:choose>
		                    </ul>
		                </div>      
		            </div>
		        </div><!-- // payment-way -->
      		</c:otherwise>
      	</c:choose>

        <div class="order-sheet accordion price finish" data-role="collapsible-set"><!-- price -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong class="core warning">최종 결제 금액</strong>
                    <strong class="price warning"><span><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></span>원</strong>
                    <c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
                    	<strong class="monthly small">(실제 월 청구금액 <span id="span_expected_lng_prc"><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC/orderPayInfo.ORD_MST_LNG_DIV}" type="number" pattern="###,###"/></span>원)</strong>
                    </c:if>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <ul class="form-a">
                        <li>
                            <div class="tit">총 주문상품금액</div>
                            <div class="field">
                            	<c:choose>
                            		<c:when test="${not empty orderPayInfo.ESM_MST_IDX }">
                            			<strong class="large">-</strong>
                            		</c:when>
                            		<c:otherwise>
                            			<strong class="large"><fmt:formatNumber value="${orderProductList[0].SUM_PRODUCT_PRICE}" type="number"/></strong>원
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                        </li>
                        <li>
                            <div class="tit">즉시할인</div>
                            <div class="field">
                                <span class="warning"><strong class="large">-<fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE}" type="number"/></strong>원</span>
                            </div>
                        </li>
                        <li>
                            <div class="tit">추가할인</div>
                            <div class="field">
                                <span class="warning"><strong class="large">-<fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG + orderPayInfo.ORD_MST_DC_CPN + orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/></strong>원</span>
                            </div>
                        </li>
                        <li>
                            <div class="tit">배송비</div>
                            <div class="field">
                                <strong class="large">+<fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG - orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/></strong>원
                            </div>
                        </li>
                        <c:if test="${orderProductList[0].SUM_DLV_ADD_CHARGE gt 0}">
	                        <li>
	                            <div class="tit">추가배송비</div>
	                            <div class="field">
	                                <strong class="large">+<fmt:formatNumber value="${orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/></strong>원
	                            </div>
	                        </li>
                        </c:if>
                    </ul>
                    <div class="section-button"><!-- section-button -->
                        <div class="ui-grid-a">
                            <div class="ui-block-a">
                                <a href="<c:out value="${mobileDomain}" />/mobile/main/index.do" target="_self" class="button full"><span>쇼핑 계속하기</span></a>
                            </div>
                            <div class="ui-block-b">
                                 <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');" class="button primary full"><span>주문내역조회</span></a>
                            </div>
                        </div>
                    </div><!-- // section-button -->
                </div>      
            </div>
        </div><!-- // price -->
			
	</article>
	<!--// #container E -->

	<%-- 배송지 정보 수정 팝업 폼 --%>
	<form name="deliveryForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
	
	<%-- 겟잇나우 교환권 발송 팝업 폼 --%>
	<form name="getItNowForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
	
	<%-- 우편번호 레이어 --%>
	<%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->

<c:if test="${orderPayInfo.ORD_MST_ORD_ID ne '_GUEST_' }">
	<script language="JavaScript" src="/pc/global/xtractor/orderDummy.do?LOGIN_ID=${orderPayInfo.ORD_MST_ORD_ID }&ordMstCd=${orderPayInfo.ORD_MST_CD }">
	</script>
</c:if>

<script type="text/javascript">
$(function() {
	// 상품상세 호출
    goProductView = function (prdCd)
    {
    	document.location.href = "<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd="+prdCd;
    };
    
    // 배송지 수정 팝업
    goDeliveryModify = function(){
    	//var ORD_MST_CD = "${commandMap.ORD_MST_CD}";
    	//$("#shipModify").load("<c:out value="${mobileSslDomain}"/>/mobile/cart/deliveryModifyPopup.do?ORD_MST_CD="+ORD_MST_CD, function(){
    		$.com.util.layPop('open', $('#shipModify'), true);
    	//});
    }
    
 	// 겟잇나우 교환권 발송 팝업
    goGetItNowTicketSend = function(ordMstCd){
    	/* window.open("","getItNowTicketPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=650,scrollbars=yes');
    	document.getItNowForm.action = "<c:out value="${mobileSslDomain}"/>/mobile/cart/getItNowTicketPopup.do";
    	document.getItNowForm.ORD_MST_CD.value = ordMstCd;
    	document.getItNowForm.target = "getItNowTicketPop";
    	document.getItNowForm.submit(); */
    	$.com.util.layPop('open', $('#couponDispatch'), true);
    }
});

//매장위치확인 팝업
function getItNowShopInfoPopup(shpMstIdx){
	$("#shopInfo").load("<c:out value="${mobileSslDomain}"/>/mobile/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx, function(){
		$.com.util.layPop('open', $('#shopInfo'), true);
	});
}
</script>

<%---------------------------------------------------------------- 배송지 정보 수정 팝업 script 시작 ------------------------------------------------%>
<script type="text/javascript">
$(function(){
	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#ORD_DLV_ZIP_CDE5').val(zip);
		$('#ORD_DLV_DRO_ADR1').val(doroAddr);
		$('#ORD_DLV_JBN_ADR1').val(jibunAddr);
	};
	
	//새로운 주소 체크시
	$(document).on("click","#resetDlvInfo",function(){
		var ordDlvMessage = $("#ORD_DLV_MSG").val();		
		$(".dlvForm").find("input").val("");
		$(".dlvForm").find("select").val("").change();
		$("#ORD_DLV_MSG").val(ordDlvMessage);
	});
	
	//배송 메세지 선택시
	$(document).on("change","#dlvMessage",function(){
		var thisValue = $(this).val();		
		if(thisValue === "0"){//직접입력
			$("#ORD_DLV_MSG").show();
			$("#ORD_DLV_MSG").val("");
		}else{
			$("#ORD_DLV_MSG").val(thisValue);
			$("#ORD_DLV_MSG").hide();
		}
	});
	
	 // 폼체크
    $("#dlvFrm").validate({
        rules: {
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
	 
	// 배송지 수정
	goDlvSubmit = function(){
		if($("#dlvFrm").valid()){
			if(confirm("배송지 정보를 수정하시겠습니까?")){
				var ORD_MST_CD = "${commandMap.ORD_MST_CD}"; //주문번호
				var ORD_DLV_ZIP_CDE5 = $("#ORD_DLV_ZIP_CDE5").val(); //새로운 우편번호
				
				$.ajax({
					type:"post",
					url : "<c:out value="${mobileSslDomain}" />/mobile/cart/orderDeliveryModifyProcAjax.do",
					data : $("#dlvFrm").serialize(),
					dataType : "json",
					async : false,
					success : function(data){
						//result가 0이상인 경우에만 성공
						if(data.result > 0){
							alert("수정되었습니다.");
							
							var dlv_nm = $("#ORD_DLV_NM").val();
							var hp = $("#ORD_DLV_HP1").val() + "-" + $("#ORD_DLV_HP2").val() + "-" + $("#ORD_DLV_HP3").val();
							var tel = $("#ORD_DLV_TEL1").val() + "-" + $("#ORD_DLV_TEL2").val() + "-" + $("#ORD_DLV_TEL3").val();
							var zipcd = "["+ ORD_DLV_ZIP_CDE5 + "]";
							var dro = $("#ORD_DLV_DRO_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var jbn = $("#ORD_DLV_JBN_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var desc = $("#ORD_DLV_MSG").val();
							
							$("#span_dlv_nm").html(dlv_nm);
							$("#span_hp").html(hp);
							$("#span_tel").html(tel);
							$("#span_zipcd").html(zipcd);
							$("#span_dro").html(dro);
							$("#span_jbn").html(jbn);
							$("#span_desc").html(desc);
							
							$.com.util.layPop('close', $('#shipModify'), true);
						}else{
							alert(data.resultMsg);
						}
					},
					error : function(err){
						alert("오류가 발생하였습니다.\n[" + err.status + "]");
					}
				});
			}
		}
	};
});

//선택한 배송지 적용
function applyDlv(dlv_type){
	var radio_idx = $("input[name="+ dlv_type +"_dlv_radio]:checked").val();
	
	$("."+ dlv_type +"_dlv_"+radio_idx).each(function(i, item){
		var target_dlv_id = $(this).data("target_dlv_id");
		$("#"+target_dlv_id).val($(this).val()).change();
	});
	
	$("."+dlv_type+"-address-list").removeClass("in");
}
</script>
<%---------------------------------------------------------------- 배송지 정보 수정 팝업 script 끝 ------------------------------------------------%>

<%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 script 시작 ------------------------------------------------%>
<script>
//수령정보 선택시
function chageGetGbn(idx){
	$("#ORD_GET_GBN_"+idx).prop("checked",true);
	$("#ORD_GET_GBN_BTN_"+idx).siblings().removeClass("warning");
	$("#ORD_GET_GBN_BTN_"+idx).addClass("warning");
	
	if(idx == '0'){
		$("#ORD_GET_NM").val("${getItNowShopInfo.ORD_MST_ORD_NM}");
		$("#ORD_GET_TEL1").val("${getItNowShopInfo.ORD_MST_HP1}");
		$("#ORD_GET_TEL2").val("${getItNowShopInfo.ORD_MST_HP2}");
		$("#ORD_GET_TEL3").val("${getItNowShopInfo.ORD_MST_HP3}");
		
		$("#ORD_GET_RLT").val("");
		$("#p_ordGetRlt").hide();
	}else{
		$("#ORD_GET_NM").val("${getItNowShopInfo.ORD_GET_NM}");
		$("#ORD_GET_TEL1").val("${getItNowShopInfo.ORD_GET_TEL1}");
		$("#ORD_GET_TEL2").val("${getItNowShopInfo.ORD_GET_TEL2}");
		$("#ORD_GET_TEL3").val("${getItNowShopInfo.ORD_GET_TEL3}");
		
		$("#ORD_GET_RLT").val("${getItNowShopInfo.ORD_GET_RLT}");
		$("#p_ordGetRlt").show();
	}
}

//교환권 발송하기
function sendGetItNowTicket(){
	
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
	
	if($("input[name=ORD_GET_GBN]:checked").val() == "1"){
		if($("#ORD_GET_RLT").val() == ""){
	   		alert("주문자와의 관계를 선택해주세요.");
	   		$("#ORD_GET_RLT").focus();
	   		return;
	   	}
	}
	
	if(confirm("발송하시겠습니까?")){
		var ORD_GET_NM = $("#ORD_GET_NM").val();
		var ORD_GET_TEL = $("#ORD_GET_TEL1").val() +"-"+ $("#ORD_GET_TEL2").val() +"-"+ $("#ORD_GET_TEL3").val();
		
		$.ajax({
			async : false,
			type : "POST",
			data : $("#getDlvFrm").serialize(),
			url : "<c:out value="${mobileSslDomain}" />/mobile/cart/sendGetItNowTicketAjax.do",
			success : function(data) {
				//result 1 성공 그외 실패
				alert(data.resultMsg);
				
				if(data.result > 0){
					$("#spanOrdGetNm").html(ORD_GET_NM);
					$("#spanOrdGetTel").html(ORD_GET_TEL);
					$("#spanRemainSmsCnt").html(data.ORD_GET_SMS_CNT);
					
					$.com.util.layPop('close', $('#couponDispatch'), true);
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
}
</script>
<%---------------------------------------------------------------- 겟잇나우 수령인 정보 수정 팝업 script 끝 ------------------------------------------------%>

</body>
</html>