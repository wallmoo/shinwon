<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
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
                <li class="nth-child-2"><span class="icon order"><!-- icon --></span>STEP 02 <strong>주문서/결제</strong></li>
                <li class="nth-child-3 active"><span class="icon finish"><!-- icon --></span>STEP 03 <strong>주문완료</strong><span class="blind">현재위치</span></li>
            </ul><!-- // order-step -->

            <div class="order-finish"><!-- order-finish -->
                <div class="inner-a">
                    <div class="inner-b">
                    	<c:choose>
                    		<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
                    			<p class="result">&ldquo;상담예약이 정상적으로 완료되었습니다&rdquo;</p>
                    		</c:when>
                    		<c:otherwise>
                    			<p class="result">&ldquo;주문이 정상적으로 완료되었습니다&rdquo;</p>
                    		</c:otherwise>
                    	</c:choose>

                        <p class="message-a">
                            	<c:out value="${orderPayInfo.ORD_MST_ORD_NM }"/>님의   주문번호는 <span class="warning"><c:out value="${commandMap.ORD_MST_CD}"/></span> 입니다.
                        </p>

                        <p class="message-b">
                            	주문내역은 MYLAND>쇼핑내역>주문/배송조회에서 확인 가능합니다.
                        </p>
                    </div>
                </div>
            </div><!-- // order-finish -->

            <h3 class="title">주문상품정보 확인</h3>

            <table class="table-product"><!-- table-product -->
            <caption>상품/옵션 정보, 판매가, 수량, 즉시할인금액, 주문금액, 배송비, 배송방법으로 구성된 상품 목록입니다.</caption>
            <colgroup>
                <col style="width: auto;" />
                <col style="width: 11%;" />
                <col style="width: 6%;" />
                <col style="width: 10%;" />
                <col style="width: 11%;" />
                <col style="width: 10%;" />
                <col style="width: 12%;" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><span>상품/옵션 정보</span></th>
                    <th scope="col"><span>판매가</span></th>
                    <th scope="col"><span>수량</span></th>
                    <th scope="col"><span>즉시할인금액</span></th>
                    <th scope="col"><span>주문금액</span></th>
                    <th scope="col"><span>배송비</span></th>
                    <th scope="col"><span>배송방법</span></th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="row" items="${orderProductList}">
                <tr>
                    <td class="product">
                        <div class="item">
                            <div class="thumb">
                            	<a
									href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
									<img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>"
									class="thumb84" alt="${row.PRD_IMAGE_ALT}" />
								</a>	
                            </div>
                            <div class="core">
                                <p class="subject">
                                    <a
										href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
										<c:out value="${row.PRD_MST_NM}" />
									</a>
                                </p>
                                <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
									<div class="option dotum">
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
                            </div>
                        </div>
                    </td>
                    <td class="price">
                        <p><span><fmt:formatNumber value="${row.ORD_PRD_PRD_PRC + row.ORD_PRD_OPT_ADD_PRC}" type="number" /></span>원</p>
                        <%-- <c:if test="${row.SUM_SUB_OPTION_ADD_PRC gt 0}">
							<p>
								<span>옵션추가금:<fmt:formatNumber value="${row.SUM_SUB_OPTION_ADD_PRC}" type="number" /></span>원
							</p>
						</c:if> --%>
                    </td>
                    <td class="amount"><fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" /></td>
                    <td class="price">
                        <p><span><fmt:formatNumber value="${row.INSTANT_CPN_ORDER_PRICE}" type="number" /></span>원</p>
                    </td>
                    <td class="price">
                        <p><span><fmt:formatNumber value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}" type="number" /></span>원</p>
                    </td>
                    
                    <c:choose>
					<c:when test="${not empty orderPayInfo.ORD_MST_PRE_CD 
											|| row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD
											|| row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD
											}"><%-- 재결제인 경우 or 겟잇나우--%>
						<td class="ship">
							<p>
								-
							</p>
						</td>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${row.ORD_PRD_DLV_BND_YN eq 'Y' and row.VDR_ROWNUM eq 1}">
								<td class="ship" rowspan="${row.VDR_IDX_CNT}">
									<p>
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
										<span class="desc dotum">(도서,산간제외)</span>
									</p>
								</td>
							</c:when>
							<c:when test="${row.ORD_PRD_DLV_BND_YN eq 'N'}">
								<td class="ship">
									<p>
										<c:choose>
											<c:when test="${row.DLV_CHARGE eq 0 }">
												<%-- 묶음배송비 and 추가배송비 모두 0인 경우 --%>
												<span>무료배송</span>
											</c:when>
											<c:otherwise>
												<span>
												<fmt:formatNumber value="${row.DLV_CHARGE}" type="number" />원
												</span>
											</c:otherwise>
										</c:choose>
										<span class="desc dotum">(도서,산간제외)</span>
									</p>
								</td>
							</c:when>
						</c:choose>
					</c:otherwise>
					</c:choose>
                    
                    <td class="ship">
                        <p>
                        	<span>
                        		<c:choose>
                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_NORMAL_CD }">
                        				<c:if test="${row.ORD_PRD_VDR_IDX gt 0}">
                        					파트너배송
                        				</c:if>
                        				<c:if test="${row.ORD_PRD_VDR_IDX lt 0}">
                        					프라이스킹배송
                        				</c:if>
                        			</c:when>
                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
                        				겟잇나우
                        			</c:when>
                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
                        				무형배송
                        			</c:when>
                        			<c:when test="${row.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD }">
                        				장기할부배송
                        			</c:when>
                        		</c:choose>
                        	</span>
                        	<c:if test="${not empty row.ORD_PRD_DLV_DUE_DT and row.PRD_MST_DLV_DSN_YN eq 'Y'}">
                        		<span class="desc dotum">(지정일:<ui:formatDate value="${row.ORD_PRD_DLV_DUE_DT}" pattern="yyyy.MM.dd"/>)</span>
                        	</c:if>
                        </p>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
            </table><!-- // table-product -->

            <c:if test="${not empty requestedGiftList}">
				<h3 class="title">사은품 정보</h3>
				
				<div class="free-gift"><!-- free-gift -->
	                <ul class="ct item-list">
	                	<c:forEach var="gift" items="${requestedGiftList}" varStatus="i">
		                    <li class="item">
		                        <div class="module">
		                            <strong class="dotum title">[<c:out value="${gift.GFT_MST_NAME}"/>]</strong>
		                            <span class="thumb">
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
	            </div><!-- // free-gift -->
			</c:if>
			
			<c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
				<p class="message notice mt10">
	                클린킹 상품은 온라인 주문만 가능하고, 취소 및 환불은 불가능합니다.<br />
	                취소 및 환불 관련 문의는 <strong class="warning">클린킹 고객센터 080-400-8000</strong>으로 연락주시기 바랍니다.
	            </p>
            </c:if>

            <h3 class="title">주문고객 정보 확인</h3>

            <table class="table-c table-col table-view"><!-- table-c -->
            <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 테이블입니다.</caption>
            <colgroup>
                <col style="width: 140px;" />
                <col style="width: auto;" />
                <col style="width: 140px;" />
                <col style="width: auto;" />
                <col style="width: 140px;" />
                <col style="width: auto;" />
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">주문하시는 분 </th>
                    <td><c:out value="${orderPayInfo.ORD_MST_ORD_NM }" /></td>
                    <th scope="row">휴대폰 번호</th>
                    <td><c:out value="${orderPayInfo.ORD_MST_HP1 }" />-<c:out value="${orderPayInfo.ORD_MST_HP2 }" />-<c:out value="${orderPayInfo.ORD_MST_HP3 }" /></td>
                    <th scope="row">이메일 주소</th>
                    <td><c:out value="${orderPayInfo.ORD_MST_MAIL }" /></td>
                </tr>
            </tbody>
            </table><!-- // table-c -->

			<c:choose>
				<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
					<h3 class="title">겟잇나우 픽업정보 확인</h3>

		            <table class="table-c table-col table-view mt10"><!-- table-c -->
		            <caption>방문매장, 방문예정일, 방문예정시간, 전화번호, 주소, 배송유의사항으로 구성된 겟잇나우 픽업정보 테이블입니다.</caption>
		            <colgroup>
		                <col style="width: 140px;" />
		                <col style="width: auto;" />
		                <col style="width: 140px;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th scope="row">방문매장</th>
		                    <td colspan="3">
	                        	<c:out value="${getItNowShopInfo.SHP_MST_NM }"/>  
	                        	<span class="desc dotum">
		                        	영업시간 :
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
		                        	 / 
		                        	 연락처 : 
		                        	 <c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>
		                        </span>
		                        <a href="javascript:getItNowShopInfoPopup('${getItNowShopInfo.SHP_MST_IDX }');" class="btn_st0 btn_blk777 small"><span>매장위치 확인</span></a>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">방문예정일</th>
		                    <td><ui:formatDate pattern="yyyy.MM.dd" value="${getItNowShopInfo.ORD_GET_PKU_DT }"/></td>
		                    <th scope="row">방문예정시간</th>
		                    <td><c:out value="${getItNowShopInfo.ORD_GET_PKU_HH }"/></td>
		                </tr>
		                <tr>
		                    <th scope="row">수령인 정보</th>
		                    <td colspan="3">
		                       	 <span id="spanOrdGetNm"><c:out value="${getItNowShopInfo.ORD_GET_NM }"/></span> / 
		                       	 <span id="spanOrdGetTel"><c:out value="${getItNowShopInfo.ORD_GET_TEL1 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL2 }"/>-<c:out value="${getItNowShopInfo.ORD_GET_TEL3 }"/></span> 
		                        <a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="btn_st0 btn_blk777 small"><span>수령인 정보 수정</span></a>
		                        <a href="javascript:goGetItNowTicketSend('${orderPayInfo.ORD_MST_CD }');" class="btn_st0 btn_blk small"><span>교환권 발송</span></a>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">주의사항</th>
		                    <td colspan="3">
		                        <ul class="list list-a dotum desc">
		                            <li>수령인에게 주문정보가 문자로 발송됩니다. (상품 가격은 노출되지 않습니다.)</li>
		                            <li>상품준비 완료 문자를 받으신 후 매장에 방문해 주세요.</li>
		                            <li><span class="warning">매장 방문 시 문자메시지와 신분증을 꼭 지참해 주세요.</span></li>
		                        </ul>
		                    </td>
		                </tr>
		            </tbody>
		            </table><!-- // table-c -->
				</c:when>
				<c:otherwise>
					<h3 class="title">
						<c:choose>
           				<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
           					서비스 정보 확인
           				</c:when>
           				<c:otherwise>
           					 배송지 정보 확인
           				</c:otherwise>
           				</c:choose>
		               	 <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y'}">
		               	 	<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}"><%-- 겟잇나우/클린킹 배송 아닌 경우만 변경 가능--%>
		                		<a href="javascript:goDeliveryModify();" class="btn_st0 btn_blk777 small"><span>배송지 정보 수정</span></a>
		                	</c:if>
		                </c:if>
		            </h3>
		
		            <table class="table-c table-col table-view mt10"><!-- table-c -->
		            <caption>주문하시는 분, 휴대폰 번호, 이메일 주소로 구성된 주문고객정보 테이블입니다.</caption>
		            <colgroup>
		                <col style="width: 140px;" />
		                <col style="width: auto;" />
		                <col style="width: 140px;" />
		                <col style="width: auto;" />
		                <col style="width: 140px;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th scope="row">받으시는 분</th>
		                    <td><span  id="span_dlv_nm"><c:out value="${orderDeliveryInfo.ORD_DLV_NM }" /></span></td>
		                    <th scope="row">휴대폰 번호</th>
		                    <td><span  id="span_hp"><c:out value="${orderDeliveryInfo.ORD_DLV_HP1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }" /></span></td>
		                	<th scope="row"><span>전화번호</span></th>
		                    <td><span  id="span_tel"><c:out value="${orderDeliveryInfo.ORD_DLV_TEL1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }" /></span></td>
		                </tr>
		                <tr>
		                    <th scope="row">주소</th>
		                    <td colspan="5">
		                        <p>
		                            <span class="blind">도로명 주소</span>
		                            <span id="span_dro">
		                           	 	[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />] <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }" />
		                        	</span>
		                        </p>
		                        <p>
		                            <span class="blind">지번 주소</span>
		                            <span id="span_jbn">
		                        		[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />] <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2 }" />
		                        	</span>
		                        </p>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">
		                    	<c:choose>
		           				<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
		           					유의사항
		           				</c:when>
		           				<c:otherwise>
		           					 배송유의사항
		           				</c:otherwise>
		           				</c:choose>
		                    </th>
		                    <td colspan="5">
		                        <span id="span_desc"><c:out value="${orderDeliveryInfo.ORD_DLV_MSG }" /></span>
		                    </td>
		                </tr>
		            </tbody>
		            </table><!-- // table-c -->
				</c:otherwise>
			</c:choose>
            
            <c:choose>
           		<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
           			<div class="payment-info"><!-- payment-info -->
	                    <h3 class="title">상담예약 정보 확인</h3>
	
	                    <table class="table-c table-col table-view">
	                    <caption>상담예약일시로 구성된 상담예약 정보 확인 테이블입니다.</caption>
	                    <colgroup>
	                        <col style="width: 210px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row">상담예약일시</th>
	                            <td>
                           			<ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/>
	                            </td>
	                        </tr>
	                      </tbody>
	                     </table>
	                 </div>
           		</c:when>
           		<c:otherwise>
           			<div class="ct payment-box"><!-- payment-box -->
		                <div class="payment-info"><!-- payment-info -->
		                    <h3 class="title">결제 정보 확인</h3>
		
		                    <table class="table-c table-col table-view">
		                    <caption>결제일시, 결제방법, 적립 예정 포인트, 적립 예정 OK캐쉬백 포인트로 구성된 결제 정보 확인 테이블입니다.</caption>
		                    <colgroup>
		                        <col style="width: 210px;" />
		                        <col style="width: auto;" />
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th scope="row">결제일시</th>
		                            <td>
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
		                            </td>
		                        </tr>
		                        <tr>
		                            <th scope="row">결제방법</th>
		                            <td style="height: 237px;">
		                            <c:choose>
					                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}"><%-- 신용카드 --%>
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
											<p class="mt20"><a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '01');" class="btn_st1 btn_blk777 large"><span>신용카드 영수증 보기</span></a></p>
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
											<p class="mt20"><a href="javascript:printKakaoReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />');" class="btn_st1 btn_blk777 large"><span>신용카드 영수증 보기</span></a></p>
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
											<p class="mt20"><a href="javascript:printCardReceipt();" class="btn_st1 btn_blk777 large"><span>신용카드 영수증 보기</span></a></p>
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
					                        <c:if test="${orderPayInfo.ORD_MST_CSH_RCP eq 'Y' and orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' }">
					                        	<p class="mt20"><a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '03');" class="btn_st1 btn_blk777 large"><span>현금영수증 영수증 보기</span></a></p>
					                        </c:if>
					                    </c:when>
					                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
					                    	<p>실시간계좌이체</p>
			                                <p><c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" /></p>
			                                <p>승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></p>
			                                <c:if test="${orderPayInfo.ORD_MST_CSH_RCP eq 'Y' }">
			                                	<p class="mt20"><a href="javascript:printKiccReceipt('<c:out value="${orderPayInfo.PAY_MST_TID}" />', '02');" class="btn_st1 btn_blk777 large"><span>현금영수증 영수증 보기</span></a></p>
			                                </c:if>
					                    </c:when>
					                    <c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}"><%-- 전액 포인트/쿠폰/크라운 결제 --%>
					                    	<p>포인트</p>
					                    </c:when>
		                            </c:choose>
		                            </td>
		                        </tr>
		                        <%-- 기업/간편/비회원/클린킹 주문은 적립혜택 안나온다. --%>
		                        <c:choose>
									<c:when test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD
															or empty userInfo
															or userInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE
															or userInfo.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE
									}">
									</c:when>
									<c:otherwise>
										<tr>
				                            <th scope="row">적립 예정 포인트</th>
				                            <td><fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_MIL}" type="number"/> P</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">적립 예정 OK캐쉬백 포인트</th>
				                            <td>
				                            	<fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_OCB}" type="number"/> 포인트 
				                            	<c:if test="${orderPayInfo.TOT_ORD_SAV_OCB gt 0}">
				                            		(<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>-****-****) 
				                            	</c:if>
				                            </td>
				                        </tr>
									</c:otherwise>
								</c:choose>
		                    </tbody>
		                    </table>
		
		                </div><!-- // payment-info -->
		                            
		                <div id="paymentTotal" class="payment-total"><!-- payment-total -->   
		                    <div class="price-box">
		                        <h3>최종 결제금액 확인</h3>
		
		                        <ul>
		                            <li>               
		                                <h4>총 주문상품금액</h4>
		                                <c:choose>
		                            		<c:when test="${not empty orderPayInfo.ESM_MST_IDX }">
		                            			<span class="price"><strong>-</strong>원</span>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<span class="price"><strong><fmt:formatNumber value="${orderProductList[0].SUM_PRODUCT_PRICE}" type="number"/></strong>원</span>
		                            		</c:otherwise>
		                            	</c:choose>
		                            </li>
		                            <li>  
		                                <h4>즉시할인</h4>
		                                <span class="price"><strong>- <fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE}" type="number"/></strong>원</span>
		                            </li>
		                            <li>  
		                                <h4>추가할인</h4>
		                                <span class="price"><strong>- <fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG + orderPayInfo.ORD_MST_DC_CPN + orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/></strong>원</span>
		                            </li>
		                            <li>  
		                                <h4>배송비</h4>
		                                <span class="price"><strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG - orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/></strong>원</span>
		                            </li>
		                            <c:if test="${orderProductList[0].SUM_DLV_ADD_CHARGE gt 0}">
			                            <li>  
			                                <h4>추가배송비</h4>
			                                <span class="price"><strong><fmt:formatNumber value="${orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/></strong>원</span>
			                            </li>
		                            </c:if>
		                            <li class="final">  
		                                <h4>최종 결제금액</h4>
		                                <span class="price"><strong class="bg"><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></strong>원</span>
		                                <c:if test="${orderPayInfo.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
						            		<p>
							            		<span style="color:#fd1f27">(실제 월 청구예상금액<br/><span id="span_expected_lng_prc"><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC/orderPayInfo.ORD_MST_LNG_DIV}" type="number" pattern="###,###"/></span>원 x ${orderPayInfo.ORD_MST_LNG_DIV}개월)</span>
							            	</p>
						            	</c:if>
		                            </li>
		                        </ul>
		                    </div>
		                </div><!-- // payment-total -->
		
		            </div><!-- // payment-box -->
           		</c:otherwise>
           	</c:choose>

            <div class="section-button mt30"><!-- section-button -->
                <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="btn_st2 btn_blk777 xlarge"><span>쇼핑 계속하기</span></a>
                <a href="<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do" class="btn_st2 btn_rd xlarge"><span>주문내역조회</span></a>
            </div><!-- // section-button -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	<%-- kicc 영수증 출력용 폼 --%>
	<form name="kiccReceiptForm" method="get" action=""> 
		<input type="hidden" name="controlNo">
        <input type="hidden" name="payment">
	</form>
	
	<%-- 배송지 정보 수정 팝업 폼 --%>
	<form name="deliveryForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
	
	<%-- 겟잇나우 교환권 발송 팝업 폼 --%>
	<form name="getItNowForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>
<!--// #wrap E -->
<%-- <script type="text/javaScript" src="<c:out value="${commandMap.LGD_RECEIPT_SCRIPTURL}" />"></script> --%>

<c:if test="${orderPayInfo.ORD_MST_ORD_ID ne '_GUEST_' }">
	<script language="JavaScript" src="/pc/global/xtractor/orderDummy.do?LOGIN_ID=${orderPayInfo.ORD_MST_ORD_ID }&ordMstCd=${orderPayInfo.ORD_MST_CD }">
	</script>
</c:if>

<script type="text/javascript">
var CST_PLATFORM = "<c:out value="${commandMap.CST_PLATFORM }" />";
$(function() {
	// 현금영수증 출력(LG)
    printCashReceipt = function (type)
    {
        var LGD_MID = "<c:out value="${orderPayInfo.PAY_MST_MID }" />";
        var LGD_OID = "<c:out value="${orderPayInfo.PAY_MST_OID }" />";
        var LGD_SEQNO = "<c:out value="${orderPayInfo.PAY_MST_CASSEQNO }" />";
        
        showCashReceipts(LGD_MID, LGD_OID, LGD_SEQNO, type, CST_PLATFORM);
    }; 
    
	// 신용카드영수증 출력(LG)
    printCardReceipt = function ()
    {
        var LGD_MID = "<c:out value="${orderPayInfo.PAY_MST_MID }" />";
    	var LGD_TID = "<c:out value="${orderPayInfo.PAY_MST_TID }" />";
    	var LGD_HASHDATA = "<c:out value="${commandMap.LGD_HASHDATA }" />";	//"<c:out value="${orderPayInfo.PAY_MST_HASHDATA }" />";

    	showReceiptByTID(LGD_MID, LGD_TID, LGD_HASHDATA);
    };
    
     /*
	카드 영수증 팝업 출력(카카오페이)
	@param tid: 거래 아이디
	*/
    printKakaoReceipt = function (tid)
   	{
		var status =
		"toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
		var url = "https://mms.cnspay.co.kr/trans/retrieveIssueLoader.do?TID="+tid+"&type=0";
		window.open(url,"popupIssue",status);
	}
    
	// 상품상세 호출
    goProductView = function (prdCd)
    {
    	document.location.href = "<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd="+prdCd;
    };
    
    // KICC 거래내역  영수증 팝업
    printKiccReceipt = function (controlNo, payment)
    {
    	var url = "http://testoffice.easypay.co.kr/receipt/ReceiptBranch.jsp";
    	if(CST_PLATFORM != "test"){
    		url = "https://office.easypay.co.kr/receipt/ReceiptBranch.jsp"; 
    	}
    	window.open("","MEMB_POP_RECEIPT", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=450,height=700');
    	document.kiccReceiptForm.action = url;
    	document.kiccReceiptForm.controlNo.value = controlNo;
    	document.kiccReceiptForm.payment.value = payment;
    	document.kiccReceiptForm.target = "MEMB_POP_RECEIPT";
    	document.kiccReceiptForm.submit();
    };
    
    // 배송지 수정 팝업
    goDeliveryModify = function(){
    	var ORD_MST_CD = "${commandMap.ORD_MST_CD}";
    	window.open("","deliveryModifyPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=550,scrollbars=yes');
    	document.deliveryForm.action = "<c:out value="${serverSslDomain}"/>/pc/cart/deliveryModifyPopup.do";
    	document.deliveryForm.ORD_MST_CD.value = ORD_MST_CD;
    	document.deliveryForm.target = "deliveryModifyPop";
    	document.deliveryForm.submit();
    }
    
 	// 겟잇나우 교환권 발송 팝업
    goGetItNowTicketSend = function(ordMstCd){
    	window.open("","getItNowTicketPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=650,scrollbars=yes');
    	document.getItNowForm.action = "<c:out value="${serverSslDomain}"/>/pc/cart/getItNowTicketPopup.do";
    	document.getItNowForm.ORD_MST_CD.value = ordMstCd;
    	document.getItNowForm.target = "getItNowTicketPop";
    	document.getItNowForm.submit();
    }
});

//매장위치확인 팝업
function getItNowShopInfoPopup(shpMstIdx){
	window.open("<c:out value="${serverSslDomain}"/>/pc/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx,"getItNowShopInfoPopup", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=500,height=550,scrollbars=yes');
}
</script>
</body>
</html>	