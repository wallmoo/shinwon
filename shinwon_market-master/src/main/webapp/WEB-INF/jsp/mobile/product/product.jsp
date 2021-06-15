<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<!-- face book 공유용 metatag -->
<meta property="og:type" content="article" />
<meta property="og:title" content="${productInfo.PRD_MST_NM_MB }" />
<meta property="og:site_name" content="MarketPlant SHOPPINGMALL" /> 
<meta property="og:image" content="<c:out value='${cdnDomain}${productInfo.PRD_IMAGE}'/>" />
<meta property="og:url" content="<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=${productInfo.PRD_MST_CD}" />

</head>

<body class="page-detail"><!-- page-list -->
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<form name="cartForm" id="cartForm">
		<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${productInfo.PRD_MST_CD}" />" /><!-- 상품코드 -->
		<c:choose>
			<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo }">
				<input type="hidden" name="PRD_MST_PRICE" id="PRD_MST_PRICE" value="<c:out value="${productInfo.PRD_MST_PRC}" />" /><!-- 상품가격 -->
				<c:if test="${not empty productTimeSaleInfo }">
					<input type="hidden" name="promotionIdx" id="promotionIdx" value="<c:out value="${productTimeSaleInfo.TIM_SAL_IDX}" />" />
					<input type="hidden" name="promotionSdDt" id="promotionSdDt" value="<c:out value="${productTimeSaleInfo.TIM_SAL_ST_DT}" /><c:out value="${productTimeSaleInfo.TIM_SAL_ST_HH}" /><c:out value="${productTimeSaleInfo.TIM_SAL_ST_MM}" />" />
					<input type="hidden" name="promotionEdDt" id="promotionEdDt" value="<c:out value="${productTimeSaleInfo.TIM_SAL_ED_DT}" /><c:out value="${productTimeSaleInfo.TIM_SAL_ED_HH}" /><c:out value="${productTimeSaleInfo.TIM_SAL_ED_MM}" />" />
					<input type="hidden" name="promotionEdYY" id="promotionEdYY" value="<c:out value="${productTimeSaleInfo.TIM_SAL_ED_DT}" />" />
					<input type="hidden" name="promotionEdHH" id="promotionEdHH" value="<c:out value="${productTimeSaleInfo.TIM_SAL_ED_HH}" />" />
					<input type="hidden" name="promotionEdMM" id="promotionEdMM" value="<c:out value="${productTimeSaleInfo.TIM_SAL_ED_MM}" />" />
					<input type="hidden" name="promotionType" id="promotionType" value="time" />
				</c:if>
				<c:if test="${not empty productOneDayInfo }">
					<input type="hidden" name="promotionIdx" id="promotionIdx" value="<c:out value="${productOneDayInfo.ONE_DAY_IDX}" />" />
					<input type="hidden" name="promotionSdDt" id="promotionSdDt" value="<c:out value="${productOneDayInfo.ONE_DAY_ST_DT}" /><c:out value="${productOneDayInfo.ONE_DAY_ST_HH}" /><c:out value="${productOneDayInfo.ONE_DAY_ST_MM}" />" />
					<input type="hidden" name="promotionEdDt" id="promotionEdDt" value="<c:out value="${productOneDayInfo.ONE_DAY_ST_DT}" /><c:out value="${productOneDayInfo.ONE_DAY_ED_HH}" /><c:out value="${productOneDayInfo.ONE_DAY_ED_MM}" />" />
					<input type="hidden" name="promotionEdYY" id="promotionEdYY" value="<c:out value="${productOneDayInfo.ONE_DAY_ST_DT}" />" />
					<input type="hidden" name="promotionEdHH" id="promotionEdHH" value="<c:out value="${productOneDayInfo.ONE_DAY_ED_HH}" />" />
					<input type="hidden" name="promotionEdMM" id="promotionEdMM" value="<c:out value="${productOneDayInfo.ONE_DAY_ED_MM}" />" />
					<input type="hidden" name="promotionType" id="promotionType" value="one" />
				</c:if>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="PRD_MST_PRICE" id="PRD_MST_PRICE" value="<c:out value="${productInfo.PRD_MST_PRICE}" />" /><!-- 상품가격 -->
			</c:otherwise>
		</c:choose>
		<input type="hidden" name="TOT_PRD_MST_PRC" id="TOT_PRD_MST_PRC" value="0" /><!-- 계산 된 결제금액 -->
		<input type="hidden" name="PRD_MST_SEL_CNT" id="PRD_MST_SEL_CNT" value="<c:out value="${productInfo.PRD_MST_SEL_CNT}" />" /><!-- 상품 재고 -->
		<input type="hidden" name="MEM_CRT_DLV_GBN" id="MEM_CRT_DLV_GBN" value="2096" /><!-- 상품유형 -->
		<input type="hidden" name="PRD_MST_LNG_IST_MNT" id="PRD_MST_LNG_IST_MNT" value="<c:out value="${productInfo.PRD_MST_LNG_IST_MNT}" />" /><!-- 장기할부개월 -->
		<input type="hidden" name="PRD_MST_NM" id="PRD_MST_NM" value="<c:out value="${productInfo.PRD_MST_NM_MB }" />" /><!-- 상품명 -->
		<input type="hidden" name="couponType" id="couponType" />
		<input type="hidden" name="cateIdx" id="cateIdx" value="<c:out value="${commandMap.cateIdx }" />" />
		<input type="hidden" name="BRD_INQ_IDX" id="BRD_INQ_IDX" />
		<input type="hidden" name="viewType" id="viewType" />
		<input type="hidden" name="planIdx" id="planIdx" value="<c:out value="${commandMap.planIdx }" />" /><!-- 기획전 Idx -->
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>상품상세</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .pr_info_d S -->
		<dl class="pr_info_d">
			<dt>
				<%-- <div class="ico_box">
					<c:choose>
						<c:when test="${productInfo.PRD_MST_SEL_STATE eq 'T' }">
							<span class="ico_soldout"><span class="ir">soldout</span></span>
						</c:when>
						<c:otherwise>
							<ui:replaceLineBreak content="${productInfo.PRD_MST_ICON_LIST }"/>
						</c:otherwise>
					</c:choose>
				</div> --%>

				<h3 ><c:out value="${productInfo.PRD_MST_NM_MB }" /></h3>
				<h4 class="tx_doc">
					<c:out value="${productInfo.PRD_MST_NM_SUB }" />
				</h4>
			</dt>
			<dd class="dd_img">
				<span class="blind">상품사진 섹션</span>
				<a href="javascript:showProductDetail('img');" class="_pg_link btn_fullImg"><span class="blind">상품사진 풀사이즈로 보기</span></a>
				<div class="slider">
					<ul>
						<%-- <li><a href="javascript:void(0);" data-img="<c:out value="${cdnDomain}" />/<c:out value="${productInfo.PRD_IMAGE}" />"><img src="<c:out value="${cdnDomain}" />/<c:out value="${productInfo.PRD_IMAGE}" />" alt="<c:out value="${productInfo.PRD_IMAGE_ALT}" />" /></a></li> --%>
						<c:if test="${not empty listProductImages }">
							<c:forEach var="listProductImages" items="${listProductImages }" varStatus="i">
								<c:if test="${fn:indexOf(listProductImages.large,Code._NO_IMAGE_MB_DETAIL_) == -1 }">
									<li><a href="javascript:void(0);" data-img="<c:out value="${listProductImages.large}" />"><img src="<c:out value="${listProductImages.large}" />" alt="<c:out value="${listProductImages.alt}" />" /></a></li>
								</c:if>
							</c:forEach>
						</c:if>
					</ul>
					<i id="slider_num" class="slider_num">
						<span class="tx_this">1</span>
						<span>/</span>
						<span class="tx_all">1</span>
					</i>
				</div>
			</dd>
			<dd class="dd_score">
				<div>
					<strong class="tx_score"><span class="blind">평점</span><c:out value="${productReputation.REP_POINT}" /></strong>
					<strong class="tx_star">
						<i class="ico_star1"><i class="star_<c:out value="${productReputation.REP_POINT_GRD}" />"><span class="blind">별점 <c:out value="${productReputation.REP_POINT_GRD}" />점</span></i></i>
						<span class="tx_reNum">상품후기 (<fmt:formatNumber value="${productReputation.REP_CNT}" groupingUsed="true" />건)</span>
					</strong>
				</div>
			</dd>
			<dd class="dd_sns">
				<strong class="blind">sns 공유하기</strong>
				<a href="javascript:goProductKakaoStory();" class="ico_kakao"><span class="ir">kakaotalk 공유</span></a>
				<a href="javascript:goProductTwitter();" class="ico_tw"><span class="ir">twitter 공유</span></a>
				<a href="javascript:goProductFacebook();" class="ico_fb"><span class="ir">facebook 공유</span></a>
				<a href="javascript:goProductCopyClipBoard();" class="ico_url"><span class="ir">URL복사</span></a>
			</dd>
			
			
			<c:if test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
				<c:if test="${not empty productTimeSaleInfo }">
					<dd class="dd_timeSale">
						<strong class="ti"><span class="blind">온라인 단독! 게릴라세일</span></strong>
						<strong class="tx_ti">남은시간</strong>
						<span id="tx_time" class="tx_time">
							<span class="tx_day">1<em>DAY</em></span>
							<span>00</span><i>:</i><span>00</span><i>:</i><span>00</span>
						</span>
					</dd>
				</c:if>
				<c:if test="${not empty productOneDayInfo }">
					<dd class="dd_oneDay">
						<strong class="ti"><span class="blind">Only 1 Day</span></strong>
						<span class="tx_ti">남은시간</span>
						<span id="tx_time2" class="tx_time">
							<span class="tx_day">2<em>DAY</em></span>
							<span>00</span><i>:</i><span>00</span><i>:</i><span>00</span>
						</span>
					</dd>
				</c:if>
			</c:if>
			<dd class="dd_info_table">
				<table>
					<caption>상품상세에 판매가, 쿠폰적용가, 제휴카드혜택가, 카드 혜택, 포인트, OK캐시백, 배송비/배송정보, 브랜드, 상품번호/모델명, 구매수량으로 구성된 표</caption>
					<colgroup>
					<col style="width:120px" />
					<col />
					</colgroup>
					<tbody>
						<c:choose>
							<c:when test="${empty productTimeSaleInfo && empty productOneDayInfo }">
								<c:choose>
									<c:when test="${userInfo.MEM_MST_MEM_GBN eq '683' }">
										<!-- 판매가 S -->
										<tr class="tr_sel_prc">
											<th><strong class="ti">판매가</strong></th>
											<td>
												<strong class="price pr_sale"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
												<a href="javascript:getPrdEsmPop();" class="btn_sz_sm"><span>가격흥정</span></a>
											</td>
										</tr>
										<tr class="tr_immed_prc">
											<th><strong class="ti">기업할인가</strong></th>
											<td>
												<strong class="price"><fmt:formatNumber value="${productInfo.PRD_NOW_DST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${commandMap.PRD_CHL_TYPE eq '' }">
												<c:choose>
													<c:when test="${productInfo.PRD_NOW_DST_PRICE == 0 && productInfo.PRD_CPN_DST_PRICE == 0 && productInfo.PRD_BRD_CPN_CNT == 0}">
														<!-- 판매가 S -->
														<tr class="tr_sel_prc">
															<th><strong class="ti">판매가</strong></th>
															<td>
																<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																<a href="javascript:getPrdEsmPop();" class="btn_sz_sm"><span>할인해주세요</span></a>
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:if test="${productInfo.PRD_NOW_DST_PRICE > 0}">
															<tr class="tr_sel_prc">
																<th><strong class="ti">판매가</strong></th>
																<td>
																	<strong class="price pr_sale"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																	<a href="javascript:getPrdEsmPop();" class="btn_sz_sm"><span>할인해주세요</span></a>
																</td>
															</tr>
															<c:if test="${productInfo.PRD_NOW_DST_PRICE > 0}">
																<!-- 즉시할인가 S -->
																<tr class="tr_immed_prc">
																	<th>
																		<strong class="ti">즉시할인가</strong>
																		<a href="javascript:$.com.util.layPop('open', $('#nowCpnPrcLayer'));" class="ico_question"><i>?</i><span class="blind">즉시할인가 안내 보기</span></a>
																	</th>
																	<td>
																		<div class="yl_box">
																			<strong class="price"><fmt:formatNumber value="${productInfo.PRD_NOW_DST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																			<c:choose>
																				<c:when test="${productInfo.PRD_MST_MB_CPN_UNT eq 'R' }">
																					<span class="ico_selOff"><c:out value ="${productInfo.PRD_NOW_DST_POINT }" />% OFF</span>
																				</c:when>
																				<c:otherwise>
																					<span class="ico_selOff"><fmt:formatNumber value="${productInfo.PRD_MST_MB_CPN_PRC }" groupingUsed="true" />원 OFF</span>
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</td>
																</tr>
															</c:if>
														</c:if>
														<c:if test="${productInfo.PRD_CPN_DST_PRICE > 0 || productInfo.PRD_BRD_CPN_CNT > 0}">
															<c:if test="${productInfo.PRD_NOW_DST_PRICE < 1}">
																<tr class="tr_sel_prc">
																	<th><strong class="ti">판매가</strong></th>
																	<td>
																		<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																		<a href="javascript:getPrdEsmPop();" class="btn_sz_sm"><span>할인해주세요</span></a>
																	</td>
																</tr>
															</c:if>
															<c:if test="${productInfo.PRD_CPN_DST_PRICE > 0 && (productInfo.PRD_BRD_CPN_CNT > 0 || productInfo.PRD_BRD_CPN_CNT < 1) }">
																<!-- 쿠폰적용가 S -->
																<tr class="tr_cou_prc">
																	<th>
																		<strong class="ti">쿠폰적용가</strong>
																		<a href="javascript:$.com.util.layPop('open', $('#couponLayer'));" class="ico_question"><i>?</i><span class="blind">쿠폰적용가 안내 보기</span></a>
																	</th>
																	<td>
																		<strong class="price"><fmt:formatNumber value="${productInfo.PRD_CPN_DST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																		<a href="javascript:goPrdCoupon('<c:out value="${productInfo.PRD_MST_CD}"/>','one');" class="ico_coupon"><span>쿠폰다운로드</span></a>
																	</td>
																</tr>
															</c:if>
															<c:if test="${productInfo.PRD_BRD_CPN_CNT > 0 && productInfo.PRD_CPN_DST_PRICE < 1 }">
																<!-- 쿠폰적용가 S -->
																<tr class="tr_cou_prc">
																	<th>
																		<strong class="ti">쿠폰적용가</strong>
																		<a href="javascript:$.com.util.layPop('open', $('#couponLayer'));" class="ico_question"><i>?</i><span class="blind">쿠폰적용가 안내 보기</span></a>
																	</th>
																	<td>
																		<strong class="price pr_question">?</strong>
																		<a href="javascript:goPrdCoupon('<c:out value="${productInfo.PRD_MST_CD}"/>','all');" class="ico_coupon"><span>쿠폰다운로드</span></a>
																	</td>
																</tr>
															</c:if>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<!-- 판매가 S -->
												<tr class="tr_sel_prc">
													<th><strong class="ti">판매가</strong></th>
													<td>
														<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo }">
										<c:if test="${not empty productTimeSaleInfo }">
											<!-- 판매가 S -->
											<tr class="tr_sel_prc">
												<th><strong class="ti">게릴라가</strong></th>
												<td>
													<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
												</td>
											</tr>	
										</c:if>
										<c:if test="${not empty productOneDayInfo }">
											<!-- 판매가 S -->
											<tr class="tr_sel_prc">
												<th><strong class="ti">only 1 day가</strong></th>
												<td>
													<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
												</td>
											</tr>
										</c:if>
									</c:when>
									<c:otherwise>
										<!-- 판매가 S -->
										<tr class="tr_sel_prc">
											<th><strong class="ti">판매가</strong></th>
											<td>
												<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
												<a href="javascript:getPrdEsmPop();" class="btn_sz_sm"><span>할인해주세요</span></a>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<!-- 제휴카드혜택가 S -->
						<c:if test="${productInfo.PRD_MST_CRD_YN eq 'Y' }">
						<tr class="tr_card_pr">
							<th>
								<strong class="ti">제휴카드혜택가</strong>
								<a href="javascript:$.com.util.layPop('open', $('#layCardPr'));" class="ico_question"><i>?</i><span class="blind">제휴카드혜택가 안내 보기</span></a>
							</th>
							<td>
								<p class="card">
									<strong class="tx">삼성카드 <strong><fmt:formatNumber value="${samCardPrice }" groupingUsed="true" /><span class="tx_won">원</span></strong></strong>
									<strong class="tx">롯데카드 <strong><fmt:formatNumber value="${rotCardPrice }" groupingUsed="true" /><span class="tx_won">원</span></strong></strong>
								</p>
							</td>
						</tr>
						</c:if>
						<!-- 카드 혜택 S -->
						<tr class="tr_card_benefit">
							<th>
								<strong class="ti">카드 혜택</strong>
							</th>
							<td>
								<a href="javascript:$.com.util.layPop('open', $('#cardLayer') ,true);"><strong>카드혜택안내</strong></a>
							</td>
						</tr>
						<!-- 포인트 S -->
						<tr class="tr_mileage">
							<th>
								<strong class="ti">포인트</strong>
								<a href="javascript:$.com.util.layPop('open', $('#mileageLayer'));" class="ico_question"><i>?</i><span class="blind">포인트 안내 보기</span></a>
							</th>
							<td>
								<strong class="tx"><fmt:formatNumber value="${productInfo.PRD_MST_MIL }" groupingUsed="true" /><span class="tx_won">M</span></strong>
							</td>
						</tr>
						<!-- OK캐시백 S -->
						<tr class="tr_okCash">
							<th>
								<strong class="ti">OK캐시백</strong>
								<a href="javascript:$.com.util.layPop('open', $('#okCashLayer'));" class="ico_question"><i>?</i><span class="blind">OK캐시백 안내 보기</span></a>
							</th>
							<td>
								<strong class="tx"><fmt:formatNumber value="${productInfo.PRD_MST_CASH }" groupingUsed="true" /><span class="tx_won">크라운</span></strong>
							</td>
						</tr>
						<!-- 배송비/배송정보 S -->
						<tr class="tr_delivInfo">
							<th>
								<strong class="ti">배송비/배송정보</strong>
								<c:choose>
									<c:when test="${productInfo.PRD_MST_VDR_YN == 'Y' && productInfo.PRD_MST_VDR_IDX > 0 }">
										<a href="javascript:$.com.util.layPop('open', $('#basongLayer2'));" class="ico_question"><i>?</i><span class="blind">배송비/배송정보 안내 보기</span></a>
									</c:when>
									<c:otherwise>
										<a href="javascript:$.com.util.layPop('open', $('#basongLayer1'));" class="ico_question"><i>?</i><span class="blind">배송비/배송정보 안내 보기</span></a>
									</c:otherwise>
								</c:choose>
							</th>
							<td>
								<strong class="tx">
									<c:choose>
										<c:when test="${productInfo.PRD_MST_DLV_FEE > 0 }">
											<fmt:formatNumber value="${productInfo.PRD_MST_DLV_FEE }" groupingUsed="true" /><span class="tx_won">원</span>
										</c:when>
										<c:otherwise>
											무료
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${productInfo.PRD_MST_VDR_YN == 'Y' && productInfo.PRD_MST_VDR_IDX > 0  }">
											/파트너 직접배송
										</c:when>
										<c:otherwise>
											/프라이스킹 배송 
										</c:otherwise>
									</c:choose>
								<span class="ex_tx">(입금 확인 후 평균 1~2일 소요)</span></strong>
							</td>
						</tr>
						<!-- 브랜드 S -->
						<tr class="tr_brand">
							<th>
								<strong class="ti">브랜드</strong>
							</th>
							<td>
								<strong class="tx"><c:out value="${productInfo.PRD_MST_BRAND_NM }" /></strong>
								<a href="javascript:goSearch('<c:out value="${productInfo.PRD_MST_BRAND_NM }" />');" class="btn_sz_sm"><span>브랜드 상품보기</span></a>
							</td>
						</tr>
						<!-- 상품번호/모델명 S -->
						<tr class="tr_comNum">
							<th>
								<strong class="ti">상품번호</strong>
							</th>
							<td>
								<strong class="tx"><c:out value="${productInfo.PRD_MST_CD }" /></strong>
							</td>
						</tr>
						<!-- 구매수량 S -->
						<c:if test="${commandMap.optionMstEstCount eq 0 }">
						<input type="hidden" class="selectedPrdOpt_0" name="OPT_DTL_IDXs" value="0"/>
						<input type="hidden" name="PRD_DTL_PRCs" id="PRD_DTL_PRCs" value = "<c:out value="${productInfo.PRD_MST_PRICE}" />" />
						<input type="hidden" class="selectedPrdOpt_0" name="OPT_PRD_PRCs" value="0"/>
						<tr class="tr_amount">
							<th>
								<strong class="ti">구매수량</strong>
							</th>
							<td>
								<label for="inp_amount2" class="inp_amount _amounyt_ck">
									<span class="blind">구매수량 변경</span>
									<select id="REQUEST_CNT_0" name="REQUEST_CNT_0" data-role="none">
										<c:forEach begin="1" end="50" step="1" var="num">
											<option value="<c:out value="${num }" />"><c:out value="${num }" /></option>	
										</c:forEach>
									</select>
									<strong class="tx_num">1</strong>
									<a href="javascript:void(0)" id="dnPrdMstCnt" class="btn_valD"><i>-</i><span class="blind">구매수량 1 내리기</span></a>
									<a href="javascript:void(0)" id="upPrdMstCnt" class="btn_valU"><i>+</i><span class="blind">구매수량 1 올리기</span></a>
								</label>
							</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</dd>
			
			
			<c:if test="${not empty optionMstList }">
				<c:set var="optMstNum" value="1" />
				<c:forEach var="optionMstList" items="${optionMstList }" varStatus="status">
					<c:set var="subcnt" value="1" />
					<c:set var="optMstIdx" value="${optionMstList.PRD_OPT_IDX }" />

					<c:choose>
						<c:when test="${optMstNum == 1 }">
							<dd class="dd_option">
							<strong class="tx_ti"><c:out value="${optionMstList.PRD_OPT_EST_NM }" /></strong>
							<span class="tx_ex">(상품옵션을 선택해주세요)</span>
						</c:when>
						<c:otherwise>
							<c:if test="${optMstEstYn ne optionMstList.PRD_OPT_EST_YN }" >
								</dd>
								<dd class="dd_option">
								<strong class="tx_ti"><c:out value="${optionMstList.PRD_OPT_EST_NM }" /></strong>
								<span class="tx_ex">(추가구매를 원하시면 선택해주세요)</span>
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:set var="optMstEstYn" value="${optionMstList.PRD_OPT_EST_YN }" />
					<input type="hidden" name="PRD_OPT_EST_YN" id="PRD_OPT_EST_YN" value="<c:out value="${optionMstList.PRD_OPT_EST_YN }" />" />
					<c:if test="${not empty optionDtlList }">
						<div class="sel_box">
						<span class="sel_ti"><c:out value="${optionMstList.PRD_OPT_NM }" /></span>
						<label for="sel_co">
						<select id="getoptDtlCho" class="sel_chg">
							<c:forEach var="optionDtlList" items="${optionDtlList }" varStatus="status">
								<c:if test="${optionMstList.PRD_OPT_IDX eq optionDtlList.PRD_OPT_IDX }">
									<c:if test="${subcnt eq 1 }">
										<option value="">선택해주세요.</option>
									</c:if>
									<option value="<c:out value="${optionMstList.PRD_OPT_NM }" />^<c:out value="${optionDtlList.OPT_DTL_NM }" />^<c:out value="${optionDtlList.OPT_DTL_IDX }" />^<c:out value="${optionDtlList.OPT_DTL_ADD_PRC }" />^<c:out value="${optionDtlList.OPT_DTL_STK_CNT }" />^<c:out value="${optionMstList.PRD_OPT_EST_YN }" />^<c:out value="${optionMstList.PRD_OPT_CNT_YN }" />"><c:out value="${optionDtlList.OPT_DTL_ADD_PRC_NM }" /></option>
									<c:set var="subcnt" value="${subcnt + 1 }" />
								</c:if>
							</c:forEach>
						</select>
						</label>
						</div>
					</c:if>
					<c:if test="${optMstIdx ne optionMstList.PRD_OPT_IDX }">
						</dd>
					</c:if>
					<c:set var="optMstNum" value="${optMstNum + 1 }" />
				</c:forEach>
			</c:if>
			
			<!-- .dd_selList S -->
			<c:if test="${not empty optionMstList }">
			<dd class="dd_selList" id="applyOptionChoiceList" style="display:none;">
				
			</dd>
			</c:if>
			<!--// .dd_selList E -->
			<!-- .dd_totalArea S -->
			<c:if test="${commandMap.optionMstEstCount > 0 }">
			<dd class="dd_totalArea">
				<div>
					<span class="tx_ti">구매예정가</span>
					<strong class="tx_price">
						<strong id="addPrdMstPrcTxt">
							<c:choose>
								<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
									<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" />
								</c:otherwise>
							</c:choose>
						</strong><span class="tx_won">원</span>
						<a href="javascript:$.com.util.layPop('open', $('#sellPriceLayer'));" class="ico_question"><i>?</i><span class="blind">포인트 안내 보기</span></a>
					</strong>
				</div>
			</dd>
			</c:if>

			<c:if test="${productInfo.PRD_MST_LNG_DIV_YN eq 'Y'}">
				<!-- 장기할부안내 S -->
				<dd class="dd_longPlan">
					<div class="tx_ti">
						<strong class="ti">장기할부</strong>
						<a href="javascript:$.com.util.layPop('open', $('#longDivLayer'));" class="ico_question"><i>?</i><span class="blind">장기할부 안내 보기</span></a>
					</div>
	
					<div class="ra_box">
						<c:if test="${productInfo.PRD_MST_LNG_DIV_MNT1 > 0 }">
							<label for="MEM_CRT_LNG_DIV1">
								<input type="radio" name="MEM_CRT_LNG_DIV" id="MEM_CRT_LNG_DIV1" value="<c:out value="${productInfo.PRD_MST_LNG_DIV_MNT1 }" />" />
								<strong>
									<em><c:out value="${productInfo.PRD_MST_LNG_DIV_MNT1 }" /></em>개월 구매시 <em>월 청구예상금액 
										<span id="addPrdMstLngDivMnt1PrcTxt">
											<c:choose>
												<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
													<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" />
												</c:otherwise>
											</c:choose>
										</span>
									</em>원
								</strong>
							</label>
						</c:if>
						<c:if test="${productInfo.PRD_MST_LNG_DIV_MNT2 > 0 }">
							<label for="MEM_CRT_LNG_DIV2">
								<input type="radio" name="MEM_CRT_LNG_DIV" id="MEM_CRT_LNG_DIV2" value="<c:out value="${productInfo.PRD_MST_LNG_DIV_MNT2 }" />" />
								<strong>
									<em><c:out value="${productInfo.PRD_MST_LNG_DIV_MNT2 }" /></em>개월 구매시 <em>월 청구예상금액 
										<span id="addPrdMstLngDivMnt2PrcTxt">
											<c:choose>
												<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
													<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" />
												</c:otherwise>
											</c:choose>
										</span>
									</em>원
								</strong>
							</label>
						</c:if>
					</div>
				</dd>
			</c:if>
			<dd class="dd_btn">
				<c:choose>
					<c:when test="${productInfo.PRD_MST_SEL_STATE eq 'I'}">
						<div class="f">
						<c:choose>
							<c:when test="${productInfo.PRD_MST_IVB_YN eq 'Y' }">
								<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_red btn_purchase"><strong>상담예약</strong></a>
								<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_gre btn_cart"><strong>장바구니</strong></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_red btn_purchase"><strong>바로구매</strong></a>
								<c:if test="${commandMap.PRD_CHL_TYPE eq '' }">
									<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_gre btn_cart"><strong>장바구니</strong></a>
								</c:if>
							</c:otherwise>
						</c:choose>
							<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_keeping"><strong>키핑</strong></a>
						</div>
					</c:when>
					<c:otherwise>
						<div>
						<c:choose>
							<c:when test="${productInfo.PRD_MST_SEL_STATE eq 'T'}">
								<a href="javascript:void(0)" class="btn_red_l btn_soldout"><strong>SOLD OUT</strong></a>
								<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_keeping"><strong>키핑</strong></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" class="btn_gre_l btn_runout"><strong>일시품절</strong></a>
								<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_keeping"><strong>키핑</strong></a>
							</c:otherwise>
						</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
			</dd>
			<c:if test="${productInfo.PRD_MST_O2O_YN eq 'Y' || productInfo.PRD_MST_LNG_DIV_YN eq 'Y' }">
				<dd class="dd_getiMsg">
					<div>
					<c:if test="${productInfo.PRD_MST_SEL_STATE eq 'T' || productInfo.PRD_MST_SEL_STATE eq 'O' }">
						<c:if test="${productInfo.PRD_MST_O2O_YN eq 'Y'}">
							<strong>"겟잇나우로만 주문할 수 있습니다."</strong>
						</c:if>
					</c:if>
					<c:if test="${productInfo.PRD_MST_O2O_YN eq 'Y'}">
						<a href="javascript:getPrdStorePop();" class="btn_getItNow"><strong class="ir">겟잇나우로 구매</strong></a>
					</c:if>
					<c:if test="${productInfo.PRD_MST_LNG_DIV_YN eq 'Y'}">
						<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_LONG_INS_CD }" />');" class="btn_longInst"><strong class="ir">장기할부로 구매</strong></a>
					</c:if>
					</div>
				</dd>
			</c:if>
			<dd class="fixed_btnBox_b">
				<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_keeping"><strong>키핑</strong></a>
				<c:choose>
					<c:when test="${productInfo.PRD_MST_IVB_YN eq 'Y' }">
						<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_red btn_purchase"><strong>상담예약</strong></a>
						<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_gre btn_cart"><strong>장바구니</strong></a>
					</c:when>
					<c:otherwise>
						<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_red btn_purchase"><strong>바로구매</strong></a>
						<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_gre btn_cart"><strong>장바구니</strong></a>
					</c:otherwise>
				</c:choose>
			</dd>
			
		</dl>
		<!--// .pr_info_d E -->
		
		<!-- .pr_megazin S -->
		<section class="pr_megazin" data-role="collapsible-set">

			<div data-role="collapsible" data-collapsed="false" class="accordion_d">
				<h3><strong><i class="ico"></i>감성채널 e매거진</strong><i class="ico_ar"></i></h3>
				<dl class="accordion_con">
					<dt>상품 구매 가이드</dt>
					<dd class="pr_list">
						<c:choose>
							<c:when test="${not empty productBuyGuideList }">
								<ol class="ui-grid-a t_list">
								<c:set var="guNum" value="1" />
								<c:forEach var="productBuyGuideList" items="${productBuyGuideList }" varStatus="status">
									<li <c:out value="${guNum % 2 == 0 ? 'class=ui-block-b' : 'class=ui-block-a' }" />>
										<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${productBuyGuideList.MGZ_MST_IDX}" />','_self');" >
											<i><img src="<c:out value="${cdnDomain}${productBuyGuideList.CMM_FLE_ATT_PATH}${productBuyGuideList.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${productBuyGuideList.CMN_FLE_ALT_TXT }" />" /></i>
											<span class="tx_doc"><c:out value="${productBuyGuideList.MGZ_MST_TITLE}" /></span>
										</a>
									</li>
								<c:set var="guNum" value="${guNum + 1 }" />
								</c:forEach>
								</ol>
							</c:when>
							<c:otherwise>
								<ol class="o_list">
									<li>
										<a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineMain.do" target="_self">
											<i class="img_d"></i>
											<span>나의 카메라는 라이카다!<br/>하지만 잘쓰질않지..;</span>
											<strong class="btn_st">보러가기</strong>
										</a>
									</li>
								</ol>
							</c:otherwise>
						</c:choose>
					</dd>
					<dt>상품뉴스</dt>
					<dd class="pr_news">
						<c:choose>
							<c:when test="${not empty productNewList }">
								<c:forEach var="productNewList" items="${productNewList }" varStatus="status">
									<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${productNewList.MGZ_MST_IDX}" />','_self');" >
									<p>
										<strong>
											<c:choose>
												<c:when test="${fn:length(productNewList.MGZ_MST_MB_TITLE) > 36 }">
													<c:out value="${fn:substring(productNewList.MGZ_MST_MB_TITLE,0,36)}" />...
												</c:when>
												<c:otherwise>
													<c:out value="${productNewList.MGZ_MST_MB_TITLE}" />
												</c:otherwise>
											</c:choose>
										</strong>
										<span>
											<c:choose>
												<c:when test="${fn:length(productNewList.MGZ_MST_CPY) > 74 }">
													<c:out value="${fn:substring(productNewList.MGZ_MST_CPY,0,74) }" />...
												</c:when>
												<c:otherwise>
													<c:out value="${productNewList.MGZ_MST_CPY }" />
												</c:otherwise>
											</c:choose>	
										</span>
									</p>
									</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p class="no_list">
									<span>최신 뉴스가 없습니다.</span>
								</p>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${productInfo.CMM_FLE_SAVE_PATH ne null && productInfo.CMM_FLE_IDX ne null}">
								<a href="javascript:void(0);" id="fileDown" class="btn_red btn_guideDw" data-cmm_fle_text="<c:out value="${productInfo.CMM_FLE_ORG_NM }"/>" data-cmm_fle_idx="<c:out value="${productInfo.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${productInfo.CMM_FLE_SAVE_PATH }"/>">
								<strong>설치/사용 가이드 DOWNLOAD</strong><i class="ico_down"></i></a>
							</c:when>
							<c:otherwise>
								<p class="no_banner">
									<strong>찾아 헤매일 필요없는 <br/>
									설치/사용가이드를 무료로 배포합니다. <br/>
									조금만 기다려주세요~</strong>
								</p>
							</c:otherwise>
						</c:choose>
					</dd>
					<c:if test="${not empty productEmagazineRevList }">
					<dt>상품리뷰</dt>
					<dd class="pr_review">
						<ol class="ui-grid-a">
							<c:set var="kgNum" value="1" />
							<c:forEach var="productEmagazineRevList" items="${productEmagazineRevList }" varStatus="status">
								<li <c:out value="${kgNum == 1 ?  'class=ui-block-a' : 'class=ui-block-b'}"/>>
									<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${productEmagazineRevList.MGZ_MST_IDX}" />','_self');" >
										<img src="<c:out value="${cdnDomain}${productEmagazineRevList.MGZ_REV_IMG}"/>" alt="<c:out value="${productEmagazineRevList.CMN_FLE_ALT_TXT }" />" />
										<span><c:out value="${productEmagazineRevList.MGZ_MST_TITLE}" /></span>
									</a>
								</li>
							<c:set var="kgNum" value="${kgNum + 1 }" />
							</c:forEach>
						</ol>
					</dd>
					</c:if>
				</dl>
			</div>					
		</section>
		<!--// .pr_megazin E -->
		</form>
		<!-- .pr_info_con S -->
		<section class="pr_info_con">
			<dl id="tabs" class="tabs">
				<dt class="ui-grid-b tab_mn">
					<a href="javascript:void(0);" data-tabcon="dd_pr_info" class="ui-block-a on"><strong>상품상세설명</strong></a>
					<a href="javascript:void(0);" data-tabcon="dd_pr_review" class="ui-block-b"><strong>상품후기</strong></a>
					<a href="javascript:void(0);" data-tabcon="dd_pr_qna" class="ui-block-c"><strong>상품Q&A</strong></a>
				</dt>


				<!-- 상품상세설명 내용 S -->
				<dd id="dd_pr_info" class="dd_pr_info">
					<c:if test="${not empty productViewBannerList }">
						<c:forEach var="productViewBannerList" items="${productViewBannerList }" varStatus="i">
							<c:choose>
								<c:when test="${productViewBannerList.BNR_MST_TGT eq 'D' }">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productViewBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productViewBannerList.CMM_FLE_SYS_NM}" />" width="551" height="144" alt="<c:out value="${productViewBannerList.CMN_FLE_ALT_TXT}" />" />	
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${productViewBannerList.BNR_MST_URL}" />" target="<c:out value="${productViewBannerList.BNR_MST_TGT_TARGET}" />">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productViewBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productViewBannerList.CMM_FLE_SYS_NM}" />" width="551" height="144" alt="<c:out value="${productViewBannerList.CMN_FLE_ALT_TXT}" />" />
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
					<c:if test="${not empty productViewBannerBrandList }">
					<h3 class="ti">브랜드 공지</h3>
						<c:forEach var="productViewBannerBrandList" items="${productViewBannerBrandList }" varStatus="i">
							<c:choose>
								<c:when test="${productViewBannerBrandList.BNR_MST_TGT eq 'D' }">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productViewBannerBrandList.CMM_FLE_ATT_PATH}" /><c:out value="${productViewBannerBrandList.CMM_FLE_SYS_NM}" />" width="551" height="144" alt="<c:out value="${productViewBannerBrandList.CMN_FLE_ALT_TXT}" />" />	
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${productViewBannerBrandList.BNR_MST_URL}" />" target="<c:out value="${productViewBannerBrandList.BNR_MST_TGT_TARGET}" />">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productViewBannerBrandList.CMM_FLE_ATT_PATH}" /><c:out value="${productViewBannerBrandList.CMM_FLE_SYS_NM}" />" width="551" height="144" alt="<c:out value="${productViewBannerBrandList.CMN_FLE_ALT_TXT}" />" />
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
					<c:if test="${not empty productViewBannerMdList }">
					<h3 class="ti">MD 공지</h3>
						<c:forEach var="productViewBannerMdList" items="${productViewBannerMdList }" varStatus="i">
							<c:choose>
								<c:when test="${productViewBannerMdList.BNR_MST_TGT eq 'D' }">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productViewBannerMdList.CMM_FLE_ATT_PATH}" /><c:out value="${productViewBannerMdList.CMM_FLE_SYS_NM}" />" width="551" height="144" alt="<c:out value="${productViewBannerMdList.CMN_FLE_ALT_TXT}" />" />	
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${productViewBannerMdList.BNR_MST_URL}" />" target="<c:out value="${productViewBannerBrandList.BNR_MST_TGT_TARGET}" />" >
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productViewBannerMdList.CMM_FLE_ATT_PATH}" /><c:out value="${productViewBannerMdList.CMM_FLE_SYS_NM}" />" width="551" height="144" alt="<c:out value="${productViewBannerMdList.CMN_FLE_ALT_TXT}" />" />
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
					<c:if test="${productInfo.PRD_MST_VDR_DIY_CTS != null }">
					<h3 class="ti">파트너 공지</h3>
					<div class="partnerNt">
						<ui:replaceLineBreak content="${productInfo.PRD_MST_VDR_DIY_CTS }"/>
					</div>
					</c:if>

					<h3 class="ti">상품 상세 정보</h3>
					<ui:replaceLineBreak content="${productInfo.PRD_MST_MB_DTL_DSC }"/>

					
  
					

				</dd>
				<!--// 상품상세설명 내용 E -->
				<!-- 상품후기 내용 S -->
				<dd id="dd_pr_review" class="dd_pr_review">
					<strong class="tx_ti">상품후기 크라운 적립안내</strong>
					<div class="ui-grid-a mypoint">
						<p class="ui-block-a">
							<span>상품후기 작성 : <strong>200 C</strong>적립</span>
							<c:if test="${sessionUser.ROLE_USER eq 'user'}">
								<c:if test="${repCount > 0 }">
									<a href="javascript:productRevList('',1,'Y');" id="myRevButton" class="btn_gre"><strong>MY 상품후기만 보기</strong></a>
									<a href="javascript:productRevList();" id="allRevButton" style="display:none;" class="btn_gre"><strong>전체 상품후기만 보기</strong></a>
								</c:if>
							</c:if>
						</p>
						<p class="ui-block-b">
							<span>포토후기 작성 : <strong>500 C</strong>적립</span>
							<a href="javascript:goProductRevWrite();" class="btn_wht"><strong>상품후기작성</strong></a>
						</p>
					</div>

					<dl class="rev_list_d">
						<dt>
							<a href="javascript:productRevList();" class="on"><span>전체 (<em class="co_red" id="spanRepCnt"><fmt:formatNumber value="${productReputation.REP_CNT}" groupingUsed="true" /></em>건)</span></a>
							<a href="javascript:productRevList('PHOTO',1,'');"><span>포토후기 (<em class="co_red" id="spanPhotoCnt"><fmt:formatNumber value="${productReputation.PHOTO_CNT}" groupingUsed="true" /></em>건)</span></a>
							<a href="javascript:productRevList('TEXT',1,'');"><span>일반후기 (<em class="co_red" id="spanTextCnt"><fmt:formatNumber value="${productReputation.TEXT_CNT}" groupingUsed="true" /></em>건)</span></a>
						</dt>
						<dd class="list">
							<table>
								<caption></caption>
								<tbody id="applyProductReputationList">
									
								</tbody>
							</table>
							<!-- 페이징 S -->
							<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
							<input type="hidden" name="searchRevType" id="searchRevType" />
							<input type="hidden" name="searchMemId" id="searchMemId" />
							<div class="section-pagination" id="productReputationListPageDiv"><!-- section pagination -->
						</dd>
					</dl>
				</dd>
				<!--// 상품후기 내용 E -->
				<!-- 상품Q&A 내용 S -->
				<dd id="dd_pr_qna" class="dd_pr_qna">					
					<div class="btn_box">
						<c:if test="${sessionUser.ROLE_USER eq 'user'}">
							<c:if test="${qnaCount > 0 }">
								<a class="btn_gre" id="myQnaButton" href="javascript:productQnaList(1,'Y');"><span>MY 상품Q&A 보기</span></a>
								<a class="btn_gre" id="allQnaButton" style="display:none;" href="javascript:productQnaList(1,'');"><span>전체 상품 후기 보기</span></a>
							</c:if>
						</c:if>
						<a href="javascript:getPrdQnaForm();" class="btn_wht"><strong>상품Q&A 작성</strong></a>
					</div>
					<table>
						<caption></caption>
						<tbody id="applyProductQnaList">
						</tbody>
					</table>
					<!-- 페이징 S -->
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="searchQnaMemId" id="searchQnaMemId" />
					<div class="section-pagination" id="productQnaListPageDiv"><!-- section pagination -->
						
		            </div><!-- // section pagination -->
				</dd>
				<!--// 상품Q&A 내용 E -->
			</dl>
		</section>
		
		<!-- .pr_info_ind S -->
		<section class="pr_info_ind" data-role="collapsible-set">

			<div data-role="collapsible" data-collapsed="true" class="accordion_d">
				<h3><strong><i class="ico"></i>상품필수정보</strong><i class="ico_ar"></i></h3>
				
				<div class="acc_con_d ind_table">
					<strong class="tx_ti">전자상거래 등에서의 상품정보제공 고시에 따라 작성되었습니다.</strong>
					<table>
						<caption>상품 구매 가이드에 모델명, 전기용품, 정격전압/소비전력, 제조사, 제조국, 크기/무게, 품질보증기준, A/s책임자와 전화번호, 전기안전인증, 에너지 소비효율로 구성된 표</caption>
						<colgroup>
						<col style="width:126px" />
						<col />
						</colgroup>
						<tbody>
							<c:if test="${not empty productNfiInfo}">
								<c:set var="infIdx" value="0" />
								<c:forEach var="productNfiInfo" items="${productNfiInfo }" varStatus="status">
									<tr>
										<th><strong><c:out value="${productNfiInfo.PRD_NFI_INFO }" /></strong></th>
										<td>
											<c:out value="${PRD_MST_NFI_INF_ARY[infIdx] }" />
										</td>
									</tr>
								<c:set var="infIdx" value="${infIdx + 1 }" />
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>

			</div>					
		</section>
		<!--// .pr_info_ind E -->

		<!-- .pr_clm S -->
		<section class="pr_clm" data-role="collapsible-set">
			<div data-role="collapsible" data-collapsed="true" class="accordion_d">
				<h3><strong><i class="ico"></i>배송/교환/반품</strong><i class="ico_ar"></i></h3>
				<section class="pr_clm_depth2" data-role="collapsible-set">
					<div data-role="collapsible" data-collapsed="true" class="accordion_d">
						<h4 class="tit_depth2"><strong>배송안내</strong><i class="ico_plus"></i></h4>
							<div class="acc_con_d ind_table ind_table_v2">
								<table>
								<caption>배송지역, 배송비, 배송기간, 배송기사 설치제품으로 구성된 표</caption>
								<colgroup>
								<col style="width:110px">
								<col>
								</colgroup>
								<tbody>
									<tr>
										<th>배송지역</th>
										<td>
											<ul>
												<li>∙ 전국(일부 도서/산간지역 제외)</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>배송비</th>
										<td>
											<ul>
												<li>∙ 3만원 이상 무료(입점업체상품 제외)</li>
												<li>∙ 도서, 산간, 오지 일부지역 및 입점업체는 배송비가 추가될 수 있습니다.</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>배송기간</th>
										<td>
											<ul>
												<li>∙ 결제(입금)일로부터 2~5일 (주말제외) 도서/산간지역은 문의바랍니다.</li>
												<li>∙ 주말전이나 월말에 주문을 하신 경우 출고가 늦어져 1~2일 배송이 지연될 수 있음</li>
												<li>∙ 지정일배송을 원하실 경우 02-6925-1160로 상담바랍니다.</li>
												<li>∙ 제품생산일정 또는 주문폭주로  배송기간이 길어질 수 있으며,  이러한 경우엔 별도의 전화연락을 드립니다.</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>배송기사<br>설치제품</th>
										<td>
											<ul>
												<li>∙ 
													양문형/김치냉장고, 드럼세탁기, 대형tv등 
													연휴 및 공휴일에도 설치가능
													(단, 아래배송지역은 제품 주문 시 배송일정을 상담 바랍니다.)
												</li>
											</ul>
											<ol>
												<li>① 광역시를 제외한 군단위 지역</li>
												<li>② 강원도지역 (원주/춘천시는 정상배송)</li>
											</ol>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</section>
				<section class="pr_clm_depth2" data-role="collapsible-set">
					<div data-role="collapsible" data-collapsed="true" class="accordion_d">
						<h4 class="tit_depth2"><strong>교환/반품안내</strong><i class="ico_plus"></i></h4>
							<div class="acc_con_d ind_table ind_table_v2">
								<table>
								<caption>교환/반품이 가능한 경우, 교환/반품이 불가능한 경우로 구성된 표</caption>
								<colgroup>
								<col style="width:110px">
								<col>
								</colgroup>
								<tbody>
									<tr>
										<th>교환/반품이 가능한 경우</th>
										<td>
											<ul>
												<li>∙ 해당제조사의 A/S기사로부터 불량판정을 받았을 경우</li>
												<li>∙ 배송된 제품이 주문한 내용과 상이하거나 쇼핑몰內 제품정보와 상이한경우</li>
											</ul>
											<strong>※ 단순변심으로 인한 제품 반품시에는 관련 배송비 고객부담</strong>
											<ul>
												<li>∙ 택배 : 5,000원 / 배송기사 설치제품 : 제품에 따라 다름</li>
												<li>∙ 반품/교환은 상품 수령 후 7일 이내에 신청하실 수 있습니다.</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>교환/반품이 불가능한 경우</th>
										<td>
											<strong class="warning">다음 각 내용에 해당하는 경우에는 교환/반품이 불가능합니다.</strong>
											<ol>
												<li>① 제품을 설치 또는 사용하거나 상품의 가치가 훼손 (정품스티커 절개포함)된 경우</li>
												<li>② 제품특성상 제품포장(박스)개봉 / 훼손 또는 상품의 밀봉을 개봉한 경우</li>
												<li>③ 박스가 개봉되어 설치된 가전제품 및 컴퓨터제품</li>
												<li>④ 소비자의 부주의로 인한 제품 훼손시</li>
												<li>⑤ 제품수령 후 일주일 이상 경과한 경우</li>
												<li>⑥ 제품의 가치가 현저히 감소한 경우</li>
												<li>⑦ 상품의 구성품 중 일부가 누락되거나 파손된 경우</li>
											</ol>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</section>
				<section class="pr_clm_depth2" data-role="collapsible-set">
					<div data-role="collapsible" data-collapsed="true" class="accordion_d">
						<h4 class="tit_depth2"><strong>주문취소안내</strong><i class="ico_plus"></i></h4>
							<div class="acc_con_d ind_table ind_table_v2">
								<table>
								<caption>주문취소시 승인취소/환불 표</caption>
								<colgroup>
								<col style="width:110px">
								<col>
								</colgroup>
								<tbody>
									<tr>
										<th>주문취소시 승인취소/환불</th>
										<td>
											<ul>
												<li>∙ 카드결제일 경우 4~5일 후 승인취소, 단 국민카드는 7일 후 승인취소</li>
												<li>∙ 무통장 입금일 경우 5~10일 후 환불</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						<div>
					</div>
				</section>
				<section class="pr_clm_depth2" data-role="collapsible-set">
					<div data-role="collapsible" data-collapsed="true" class="accordion_d">
						<h4 class="tit_depth2"><strong>기타</strong><i class="ico_plus"></i></h4>
							<div class="acc_con_d ind_table ind_table_v2">
								<table>
								<caption>세금계산서 발행, 입점업체로 구성된 표</caption>
								<colgroup>
								<col style="width:110px">
								<col>
								</colgroup>
								<tbody>
									<tr>
										<th>세금계산서<br>발행</th>
										<td>
											<ul>
												<li>∙ 세금계산서는 현금구매시 현금영수증을 신청하시지 않으셨을 경우에만 가능</li>
												<li>∙ 카드결제시 카드명세서로 세금계산서를 대체하실 수 있습니다.</li>
												<li>∙ 입점업체 상품의 경우 해당 입점업체에서 별도로 세금계산서가 발급됩니다.</li>
												<li>∙ 세금계산서를 신청하실때는 팩스 02-713-6734로 사업자등록증 사본과 함께 주문번호, 고객명, 연락처,  이메일 주소를 함께 기재하셔서 보내신 후 쇼핑몰 고객센터 (02-6925-1160)로 전화해 주시기 바랍니다.</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>입점업체</th>
										<td>
											<ul>
												<li>∙ 상품 상세설명페이지에 '공급업체가' 표기된 상품은 입점업체 상품이며,  마켓플랜트와는 별개로 운영되므로,   제품 및 배송에 관한 모든 책임은  입점업체에 있습니다.입점업체상품의 세금계산서 발행은 입점업체에 직접 요청하셔야 합니다.)</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</section>
			</div>					
		</section>
		<!--// .pr_clm E -->
		<!--// .pr_info_con E -->

		<!-- .pr_reBest S -->
		<section class="pr_reBest">

			<div class="ui-grid-a tab_mn" id="menuViewTab">
				<a href="javascript:void(0);" data-tab_no="tab1" class="ui-block-a on">추천상품</a>
				<a href="javascript:void(0);" data-tab_no="tab2" class="ui-block-b">카테고리 BEST</a>
			</div>

			<div class="pr_list">
				<ul id="reBest_slider" class="product-list slider">
					
				</ul>
			</div>
		</section>
		<!--// .pr_reBest E -->
		
		<!-- .pr_exhibition S -->
		<section class="pr_exhibition">
			<dl>
				<dt>
					<strong>관련 기획전</strong>
					<a href="javascript:goPlan();" target="_self" class="btn_more">more</a>
				</dt>
				<dd>
					<c:choose>
						<c:when test="${not empty listPlan }">
							<c:set var="planNum" value="1" />
							<c:forEach var="listPlan" items="${listPlan }" varStatus="status">
								<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value="${listPlan.PLN_MST_IDX }" />','_self');" >
									<span><c:out value="${listPlan.PLN_MST_TITLE }" /></span>
									<c:if test="${listPlan.PLN_NEW_DAY < 8}">
										<i class="new"><span class="ir">새로운 글</span></i>
									</c:if>
								</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);"><span>관련 기획전이 없습니다</span></a>
						</c:otherwise>
					</c:choose>
				</dd>
			</dl>
		</section>
		<!--// .pr_exhibition E -->


		<!-- 즉시할인가 -->
		<!-- # S -->
		<section id="nowCpnPrcLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>즉시할인가</h2>
					<a href="javascript:$.com.util.layPop('close', $('#nowCpnPrcLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>즉시할인쿠폰이 적용된 금액이며, <br/>회원에 한해 자동 적용됩니다.</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- 포인트 안내 -->
		<!-- # S -->
		<section id="mileageLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>포인트 안내</h2>
					<a href="javascript:$.com.util.layPop('close', $('#mileageLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>상품금액 및 회원등급에 따라 <br/>
						적립되는 포인트로<br/>
						적립된 포인트는 <em class="co_red">상품 구매시 현금과 <br/>
						동일하게</em> 사용하실 수 있습니다.</p>
				</dd>
				<dd class="tx_list">
					<p>
						<span>상품 구매시 회원등급별로 적립율로 적립됩니다. </span>
						<span>최종결제금액에 따라 적립포인트는 변동될 수 있습니다. </span>
						<span>간편회원과 기업회원은 포인트가 적립되지 않습니다.</span>
						<span>당사 사정에 의해 변경될 수 있습니다.</span>
					</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- OK캐쉬백 포인트 안내 -->
		<!-- # S -->
		<section id="okCashLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>OK캐쉬백 포인트 안내</h2>
					<a href="javascript:$.com.util.layPop('close', $('#okCashLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>최종결제금액에 따라 0.24%의 비율로 <br/>
						OK캐쉬백 포인트로 적립되어 <br/>
						<em class="co_red">상품 구매 시 현금과 동일하게</em> <br/>
						사용하실 수 있습니다. 
					</p>
				</dd>
				<dd class="tx_list">
					<p>
						<span>최종결제금액에 따라 적립포인트는 변동될 수 있습니다. </span>
						<span>간편회원과 기업회원은 OK캐쉬백 포인트가 적립되지 않습니다. </span>
						<span>당사 사정에 의해 변경될 수 있습니다. </span>
					</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- 쿠폰적용가 -->
		<!-- # S -->
		<section id="couponLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>쿠폰적용가</h2>
					<a href="javascript:$.com.util.layPop('close', $('#couponLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>쿠폰을 다운로드 받아  <br/>
						결제 시  적용했을때의 적용가이며, <br/>
						회원에 한해 적용가능합니다.</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- 장기할부 결제 안내 -->
		<!-- # S -->
		<section id="longDivLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>무이자 장기할부 결제 안내</h2>
					<a href="javascript:$.com.util.layPop('close', $('#longDivLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_list">
					<p>
						<span>본 상품은 신용카드에 한하여 무이자 장기할부 결제가 가능하며, 동일한 할부 개월 혜택에 한하여 장바구니 통합 결제가 진행됩니다.</span>
						<span class="co_red">
							당월 기준 무이자 장기할부 결제 카드사 : 삼성카드, 롯데카드, 신한카드<br/>
							<c:if test="${not empty lngDivCardNms24 }">
						  	※ 24개월 : <c:out value="${lngDivCardNms24.CRD_INF_NM }"/><br/>
						  	</c:if>
						  	<c:if test="${not empty lngDivCardNms36 }">
						   	※ 36개월 : <c:out value="${lngDivCardNms36.CRD_INF_NM }"/>
						  	</c:if>
						</span>
						<span>장기할부 결제 정책은 당사 사정에 의해 변경될 수 있습니다.</span>
					</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- 프라이스킹 배송정보 -->
		<!-- # S -->
		<section id="basongLayer1" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>프라이스킹 배송정보</h2>
					<a href="javascript:$.com.util.layPop('close', $('#basongLayer1'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>
						<strong>본 상품은 배송지와 가까운 <br/>
						<strong class="co_red">물류센터</strong>에서 배송되는 상품입니다.</strong>
					</p>
					<br/>
					<p>물류재고 사정에 따라 일부 상품에 한해  배송기사가 <br/>직접 배송하거나, 택배로 발송될 수 있습니다.
					</p>
				</dd>
				<dd class="tx_list">
					<p>
						<span>주문시 희망배송일을 신청할 수 있습니다. <br/>(일부상품 제외)</span>
						<span>도서/산간지역의 경우 익일 배송이 불가능할 수 있으며, <br/>제주도는 <em class="co_red">추가배송비 5,000원</em>이 발생합니다.</span>
						<span>배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다. </span>
						<span>이 경우 별도로 연락을 드립니다.</span>
					</p>
					<strong class="tx_ti">배송비부과</strong>
					<p><span>상품 개별 배송비가 원칙이며, 묶음배송이 가능한 <br/>상품에 한해 묶음배송비가 적용됩니다.</span></p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- 파트너 배송정보 -->
		<!-- # S -->
		<section id="basongLayer2" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>파트너 배송정보</h2>
					<a href="javascript:$.com.util.layPop('close', $('#basongLayer2'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>
						<strong>본 상품은 <strong class="co_red">업체</strong>에서 배송되는 상품입니다.</strong>
					</p>
						<br/>
					<p>
						업체 배송정책에  따라  배송기사가 직접 배송하거나, 
						<br/>택배로 발송될 수 있습니다.
					</p>
				</dd>
				<dd class="tx_list">
					<strong class="tx_ti">업체직접배송</strong>
					<p>
						<span>업체 사정에 의해 상품수량이 부족하여 배송이 지연될 수 있습니다. </span>
						<span>도서/산간지역의 경우 익일 배송이 불가능할 수 있으며, <br/>
								제주도는 <em class="co_red">추가배송비 5,000원</em>이 발생합니다. 
						</span>
					</p>
					<strong class="tx_ti">업체택배배송</strong>
					<p>
						<span>택배 배송상품은 결제 후, 2~3일의 배송기간이 소요됩니다. </span>
						<span>배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다.</span>
					</p>
					<strong class="tx_ti">배송비부과</strong>
					<p>
						<span>상품 개별 배송비가 원칙이며, 묶음배송이 가능한 <br/>상품에 한해 묶음배송비가 적용됩니다.</span>
					</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->

		<!-- 구매예정금액 안내 -->
		<!-- # S -->
		<section id="sellPriceLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>구매예정금액 안내</h2>
					<a href="javascript:$.com.util.layPop('close', $('#sellPriceLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>
						<strong>구매예정금액 안내</strong><br/><br/>
						구매예정금액에는 <em class="co_red">배송비가 포함되어 있지 않습니다. </em><br/>
						결제시 조건에 따라 배송비가 추가될 수 있습니다.
					</p>
				</dd>
			</dl>
		</section>
		<!--//# E -->
		
		<!-- 제휴카드 혜택가안내 -->
		<!-- #layKeep S -->
		<section id="layCardPr" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>제휴카드 혜택가안내</h2>
					<a href="javascript:$.com.util.layPop('close', $('#layCardPr'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="tx_msg">
					<p>마켓플랜트 쇼핑몰과<br/> 제휴를 맺은 카드로
						카드 청구할인, 캐시백 등<br/> 다양한 혜택이 있습니다.</p>
				</dd>
			</dl>
		</section>
		<!--//#layKeep E -->
		
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
        
        <c:set var="c_card_div_type_free_interst_cnt" value="0"/>
        <c:forEach var="row" items="${cardEvenFreetList }" varStatus="i">
        	<c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST}">
        		<c:set var="c_card_div_type_free_interst_cnt" value="${c_card_div_type_free_interst_cnt + 1 }"/>
        	</c:if>
        </c:forEach>

		<!-- 카드혜택안내 -->
		<!-- # S -->
		<section id="cardLayer" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>카드혜택안내</h2>
					<a href="javascript:$.com.util.layPop('close', $('#cardLayer'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<!-- .dd_accordion S --->
				<dd class="dd_accordion">
					<div data-role="collapsible-set">
						<!-- 무이자 혜택 안내 S -->
						<div data-role="collapsible">
							<h3>무이자 혜택 안내<i></i></h3>
							<div class="acc_con">
								<c:choose>
									<c:when test="${not empty cardEvenFreetList }">
										<strong class="tx_ti"><strong class="co_red"><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월</strong> 무이자 혜택안내</strong>
		
										<table>
											<caption>카드혜택안내 팝업에 카드사, 포인트 적립내역으로 구성된 표</caption>
											<colgroup>
												<col style="width:120px" />
												<col />
											</colgroup>
											<tbody>
												<c:forEach var="row" items="${cardEvenFreetList }" varStatus="i">
													<c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST}">
														<tr>
															<th><span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></th>
															<td>
																<strong><c:out value="${row.DIV_DTL_PRC }" />만원 ↑</strong>
																<span>(<c:out value="${row.DIV_INF_MNT }" /> 개월 무이자 할부)</span>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${c_card_div_type_free_interst_cnt > 0 }">
											<br/>
											<strong class="tx_ti"><strong class="co_red"><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월</strong> 부분무이자/특별무이자 혜택안내</strong>
			
											<table>
												<caption>카드혜택안내 팝업에 카드사, 포인트 적립내역으로 구성된 표</caption>
												<colgroup>
													<col style="width:120px" />
													<col />
												</colgroup>
												<tbody>
													<c:forEach var="row" items="${cardEvenFreetList }" varStatus="i">
														<c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST}">
															<tr>
																<th><span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></th>
																<td>
																	<strong><c:out value="${row.DIV_DTL_PRC }" />만원 ↑</strong>
																	<span>(<c:out value="${row.DIV_INF_MNT }" /> 개월 무이자 할부)</span>
																	<c:forEach var="month" items="${fn:split(row.DIV_INF_MNT, ',')}" varStatus="monthStatus">
											                    		<span>${month }</span>개월 ${row.DIV_INF_GBN_NM }
											                    		<c:if test="${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index] ne '-' }">
											                    			(${fn:split(row.DIV_INF_NTC, '||')[monthStatus.index]})
											                    		</c:if>
											                    		<br/>
											                    	</c:forEach>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
										</c:if>
									</c:when>
									<c:otherwise>
										<span class="no_list">진행중인 신용카드 혜택이 없습니다.</span>	
									</c:otherwise>
								</c:choose>
							</div>

						</div>						
						<!--// 무이자 혜택 안내 E -->
						<!-- 할인혜택 안내 S -->
						<div data-role="collapsible">
							<h3>할인혜택 안내<i></i></h3>
							<div class="acc_con">
								
								<dl id="tab_d" class="tab_d" data-role="tabs" >
									<dt class="tab_mn">
										<ul>
											<li><a href="#tab_con_1" data-ajax="false"><span>청구할인</span></a></li>
											<li><a href="#tab_con_2" data-ajax="false"><span>캐쉬백</span></a></li>
											<li><a href="#tab_con_3" data-ajax="false"><span>포인트선할인</span></a></li>
										</ul>
									</dt>
									<!-- 청구할인 S-->
									<dd id="tab_con_1" class="tab_con">
										<c:choose>
											<c:when test="${c_promotion_charge_cnt gt 0 }">
												<table>
													<caption>카드혜택안내 팝업에 할인폐택안내에 청구할인안내. 카드사, 청구할인 안내로 구성된 표</caption>
													<colgroup>
														<col style="width:125px" />
														<col />
													</colgroup>
													<tbody>
														
														<c:forEach var="row" items="${cardPromotionList }">
															<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CHARGE }">
																<tr>
																	<th><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></th>
																	<td>
																		<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
						                                            		${row.PMT_CRD_SAL_PRC }%
						                                            	</c:if>
						                                            	<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
						                                            		${row.PMT_CRD_SAL_PRC }만원
						                                            	</c:if>
																		 ↑</strong>
																		<span>
																			청구할인, 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
			                                          							(~${row.END_DATE })
																		</span>
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</tbody>
												</table>
											</c:when>
											<c:otherwise>
												<span class="no_list">진행중인 신용카드 혜택이 없습니다.</span>
											</c:otherwise>
										</c:choose>
									</dd>
									<!-- 청구할인 E-->
									<!-- 캐쉬백 S-->
									<dd id="tab_con_2" class="tab_con">
										<c:choose>
                          					<c:when test="${c_promotion_cashbag_cnt gt 0 }">
												<table>
													<caption>카드혜택안내 팝업에 할인폐택안내에 캐쉬백안내. 카드사, 캐쉬백 안내로 구성된 표</caption>
													<colgroup>
														<col style="width:125px" />
														<col />
													</colgroup>
													<tbody>
														<c:forEach var="row" items="${cardPromotionList }">
															<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CASHBAG }">
																<tr>
																	<th><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></th>
																	<td>
																		<strong>${row.PMT_CRD_SML_PRC}만원 ↑</strong>
																		<span>
																			최소 <fmt:formatNumber value="${row.PMT_CRD_SML_PRC}" />만원 ~
							                                            	최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
									                                        (~${row.END_DATE })
																		</span>
																	</td>
																</tr>
		                                					</c:if>
		                                				</c:forEach>
													</tbody>
												</table>
											</c:when>
                                			<c:otherwise>
                                				<span class="no_list">진행중인 신용카드 혜택이 없습니다.</span>
                                			</c:otherwise>
                                		</c:choose>
									</dd>
									<!-- 캐쉬백 E-->
									<!-- 포인트할인 S-->
									<dd id="tab_con_3" class="tab_con">
										<p class="tx">
											<strong class="tx_ti"><strong class="co_red">포인트연계할부</strong> 서비스란 ?</strong>
											<span>
												사용금액만큼 선할인 받고 정해진 상환기간 동안 약정원금과 <br/>
												일부 이자를 적립형 카드 이용 실적에 따라 적립된 포인트(부족분은 <br/>
												현금) 로 상환해 나가는 서비스 입니다.
											</span>
										</p>
										<c:choose>
                            				<c:when test="${c_promotion_point_dc_cnt gt 0 }">
												<table>
													<caption>카드혜택안내 팝업에 할인폐택안내에 포인트할인안내. 카드사, 포인트할인 안내로 구성된 표</caption>
													<colgroup>
														<col style="width:125px" />
														<col />
													</colgroup>
													<tbody>
														<c:forEach var="row" items="${cardPromotionList }">
				                                			<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_DC }">
				                                				<tr>
																	<th><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></th>
																	<td>
																		<strong>${row.PMT_CRD_SML_PRC}만원 ↑</strong>
																		최소 <fmt:formatNumber value="${row.PMT_CRD_SML_PRC}" />만원 ~
								                                        최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC}" />만원
								                                        (~${row.END_DATE })
																	</td>
																</tr>
				                                			</c:if>
				                                		</c:forEach>
													</tbody>
												</table>
											</c:when>
		                                	<c:otherwise>
		                                		<span class="no_list">진행중인 신용카드 혜택이 없습니다.</span>
		                                	</c:otherwise>
		                                </c:choose>
									</dd>
									<!-- 포인트할인 E-->
								</dl>
							</div>

						</div>						
						<!--// 할인혜택 안내 E -->
						<!-- 포인트적립 안내 S -->
						<div data-role="collapsible" data-collapsed="false">
							<h3>포인트적립 안내<i></i></h3>
							<div class="acc_con">
								<strong class="tx_ti"><strong class="co_red"><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월</strong> 포인트 적립혜택 안내</strong>
								<c:choose>
                            		<c:when test="${c_promotion_point_save_cnt gt 0 }">
								<table>
									<caption>카드혜택안내 팝업에 카드사, 포인트 적립내역으로 구성된 표</caption>
									<colgroup>
										<col style="width:125px" />
										<col />
									</colgroup>
									<tbody>
										<c:forEach var="row" items="${cardPromotionList }">
											<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_SAVE }">
		                                		<tr>
													<th><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></th>
													<td>
														<strong>${row.PMT_CRD_SML_PRC}만원 ↑</strong>
														<span>
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
														</span>
													</td>
												</tr>
		                                	</c:if>
		                                </c:forEach>
									</tbody>
								</table>
								</c:when>
                                	<c:otherwise>
                                		<span class="no_list">진행중인 신용카드 혜택이 없습니다.</span>
                                	</c:otherwise>
                                </c:choose>
							</div>

						</div>	
						<!--// 포인트적립 안내 E -->
					</div>
				</dd>
				<!--// .dd_accordion E --->
			</dl>
		</section>
		<!--//# E -->
		<!-- #laypop S -->
		<%@ include file="/WEB-INF/jsp/mobile/product/productLayer.jsp" %>
		
		<!--// #laypop E -->
	</article>
	
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<!-- 파일 다운로드용 폼 -->
<form name="fileForm" id="fileForm">
     <input type="hidden" name="CMM_FLE_IDX" value=""/>
     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>

<form name="searchForm" id="searchForm">
     <input type="hidden" name="query" id="query" />
     <input type="hidden" name="sectionState" id="sectionState" value="1" />
</form>

<form name="couForm" id="couForm">
     <input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value='${userInfo.MEM_MST_MEM_GBN }'/>"/>
</form>

<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="optionChoiceTemplate" type="text/x-jquery-tmpl">
<div>
	<div class="
	{{if optLen == 0 }}
		f
	{{/if}}
	optionDtl">
		<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value = "\${OPT_DTL_IDX}" />
		<input type="hidden" name="OPT_DTL_CNTs" id="OPT_DTL_CNTs" value = "\${OPT_DTL_STK_CNT}" />
		<input type="hidden" name="OPT_PRD_PRCs" id="OPT_PRD_PRCs" value = "\${OPT_PRD_PRC}" />
		<input type="hidden" name="PRD_OPT_EST_YNs" id="PRD_OPT_EST_YNs" value = "\${PRD_OPT_EST_YN}" />
		<input type="hidden" name="PRD_DTL_PRCs" id="PRD_DTL_PRCs" value = "0" />
		<strong class="tx_1">
		{{if PRD_OPT_EST_YN == 'Y'}}
			<i class="ico_v"></i>
		{{else}}
			<span class="co_blu">[선택]</span>
		{{/if}}
			{{html OPT_TITLE}}(\${OPT_DTL_ADD_PRC})
		</strong>
		<strong class="tx_2">
		{{if PRD_OPT_CNT_YN == 'Y'}}
			<label for="inp_amount2" class="inp_amount _amounyt_ck">
				<span class="blind">구매수량 변경</span>
				<select id="REQUEST_CNT_\${OPT_DTL_IDX}" name="REQUEST_CNT_\${OPT_DTL_IDX}" data-role="none">
					<c:forEach begin="1" end="50" step="1" var="num">
						<option value="<c:out value="${num }" />"><c:out value="${num }" /></option>	
					</c:forEach>
				</select>
				<strong class="tx_num">1</strong>
				<a href="javascript:void(0)" id="dnOptDtlCnt" class="btn_valD"><i>-</i><span class="blind">구매수량 1 내리기</span></a>
				<a href="javascript:void(0)" id="upOptDtlCnt" class="btn_valU"><i>+</i><span class="blind">구매수량 1 올리기</span></a>
			</label>
		{{else}}
			<input type="hidden" value="1" id="REQUEST_CNT_\${OPT_DTL_IDX}" name="REQUEST_CNT_\${OPT_DTL_IDX}" style="width:30px;" />
			<span class="tx_2">1개</span>
		{{/if}}
		</strong>
		<strong class="tx_3">
			\${OPT_PRD_PRICE}원
			<a href="javascript:void(0);" id="optionDtlDel" class="btn_del2"><span class="blind">현제 옵션 삭제</span></a>
		</strong>
	</div>
</div>
</script>
<script id="productReputationListTemplate" type="text/x-jquery-tmpl">
<tr class="tr_ti" tabindex="0">
	<td class="al">
		<i class="ico_star0"><i class="star_\${PRD_REV_SCORE_GRD}"><span class="ir">별점 ${PRD_REV_SCORE_STAR}점</span></i></i>
		{{if PRD_REV_CHN_GBN == "M"}}
			<i class="ico_mobile"><span class="blind">모바일에서 등록</span></i>
		{{/if}}
		<a href="javascript:void(0);">\${PRD_REV_TITLE}
		{{if REP_IMG != null && REP_IMG != ""}}
			<i class="ico_photo"><span class="blind">포토후기</span></i>
		{{/if}}
		</a>
	</td>
</tr>
<tr id="productRevList_\${PRD_REV_IDX}" class="tr_con" tabindex="0">
	<td>
		<div>
			<span class="tx_idNdate">\${PRD_REV_REG_ID}/\${PRD_REV_REG_DT}</span>
			<p><ui:replaceLineBreak content="\${PRD_REV_CONTENTS }"/><br/>
			</p>
			{{if REP_IMG != null && REP_IMG != ""}}
				<img src="<c:out value="${cdnDomain}" />\${REP_IMG}"/>
			{{/if}}
		</div>
	</td>
</tr>
</script>
<script id="productQnaListTemplate" type="text/x-jquery-tmpl">
<tr class="tr_ti" tabindex="0">
	<td>
		<div class="ti_d">
			{{if BRD_INQ_REPLY_CD != "Y"}}
				<i class="ico_gre">문의접수</i>
			{{else}}
				<i class="ico_red">답변완료</i>
			{{/if}}
			<span class="tx">{{html BRD_INQ_CONTENTS}}</span>
			<span class="tx_idNdate">\${BRD_INQ_REG_ID} / \${BRD_INQ_REG_DT}</span>
			{{if BRD_INQ_REPLY_CD != "Y"}}
				{{if BRD_INQ_REG_CHK_ID == MEM_LOG_ID}}
					<div class="btn_box">
						<a href="javascript:getPrdQnaForm(\${BRD_INQ_IDX});" class="btn_wht"><strong>수정</strong></a>
						<a href="javascript:productQnaDel(\${BRD_INQ_IDX});" class="btn_gre"><strong>삭제</strong></a>
					</div>
				{{/if}}
			{{/if}}
		</div>
	</td>
</tr>
{{if BRD_INQ_REPLY_CD == "Y"}}
<tr class="tr_con">
	<td>
		<div class="tx_d">
			<i class="ico_red ico_a">A</i>
			{{html BRD_INQ_REPLY_CONTENTS}}</p>
			<span class="tx_date">(답변일 : \${BRD_INQ_REPLY_DT})</span>
		</div>
	</td>
</tr>
{{/if}}
</script>
<script>

$.com.detail = $.com.detail || {
	slider : function(){

		//슬라이드
		var _idx = $('.pr_info_d .dd_img .slider > ul'),
			_num = $('#slider_num'),
			_idx_opt = {
				preloadImages: 'visible',
				pager: false,
				controls: false,
				captions: true,
				auto: false,
				autoControls: false,
				adaptiveHeight: true,
				onSlideBefore: function($slideElement, oldIndex, newIndex){
					_num.children('.tx_this').text(newIndex+1);
				}
			};

		if(_idx.children().length > 1){
			_num.children('.tx_all').text(_idx.children().length);
			_idx.bxSlider(_idx_opt);
		}
	},//slider : function(){
	slider2 : function(){

		//슬라이드		
		$.detail_idx = $.detail_idx || $('#reBest_slider');
        $.detail_opt = $.detail_opt || {
            minSlides: 2,
            maxSlides: 2,
            pager: false,
            controls: true,
            captions: true,
            auto: false,
            slideWidth: $(window).width()/2,
            adaptiveHeight: true,
            nextText: '<span class="blind">다음 슬라이드</span>',
            prevText: '<span class="blind">이전 슬라이드</span>'
        };
		if(!$.detail_idx.data('one')) $.detail_idx.attr('data-one', true);
        $.detail_idx.bxSlider( $.detail_opt );
	},//slider2 : function(){
	showtime: function(_date, _time, _idx){
		//타임세일
		var arrDate = _date.split("-"),
			arrTime = _time.split(":"),
			arrMonth = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),

			now = new Date(),
			nYear = now.getFullYear(),
			nMonth = now.getMonth(),
			nDay = now.getDate(),
			nHour = now.getHours(),
			nMin = now.getMinutes(),
			nSec = now.getSeconds(),

			strnow = arrMonth[nMonth] + " " + nDay + ", " + nYear + " " + nHour + ":" + nMin + ":" + nSec,
			strfuture = arrMonth[arrDate[1] - 1] + " " + arrDate[2] + ", " + arrDate[0] + " " + arrTime[0] + ":" + arrTime[1] + ":" + arrTime[2],
			d_date = Date.parse(strfuture) - Date.parse(strnow);

		d_day = Math.floor(d_date / 86400000);
		d_hour = Math.floor((d_date % 86400000) / 3600000);
		d_min = Math.floor(((d_date % 86400000) % 3600000) / 60000);
		d_sec = Math.floor((((d_date % 86400000) % 3600000) % 60000) / 1000);

		function html_chg(_num){
			var _nums = String(_num),
				_lg = _nums.length;
			if(_lg == 1) _nums = '0'+_nums;
			
			return _nums;
		}

		var _html_d = '';
		if(d_day <= -1){
			//종료
			_html_d = '<span>00</span><i>:</i><span>00</span><i>:</i><span>00</span>';
			$(_idx).html(_html_d);
			//com.timeSale.stopclock();
			return false;
		}else{
			
			//진행중
			//일
			if(d_day > 0) _html_d += '<span class="tx_day">'+d_day+'<em>DAY</em></span>';

			//시간
			if(d_hour > 0) _html_d += '<span>'+html_chg(d_hour)+'</span><i>:</i>';
			else _html_d += '<span>00</span><i>:</i>';
			
			//분
			if(d_min > 0) _html_d += '<span>'+html_chg(d_min)+'</span><i>:</i>';
			else _html_d += '<span>00</span><i>:</i>';
			
			//초
			if(d_sec > 0) _html_d += '<span>'+html_chg(d_sec)+'</span>';
			else _html_d += '<span>00</span>';
			
			$(_idx).html(_html_d);
		}		
		
		setTimeout("$.com.detail.showtime('"+_date+"','"+_time+"','"+_idx+"')", 1000);		
	},//showtime: function(_date, _time, _idx){
	acc: function(){
		//상품후기 > 리스트
		var _rev_tr = $('.dd_pr_review .rev_list_d .list .tr_ti');
		
		_rev_tr.off('click').on('click', function(){
			var _this = $(this);
			if(_this.hasClass('open')) _this.removeClass('open').next().hide();
			else _this.addClass('open').next().show();
		});

		//상품Q&A > 리스트
		var _qna_tr = $('.dd_pr_qna table .tr_ti');
		
		_qna_tr.off('click').on('click', function(){
			var _this = $(this);
			if(_this.hasClass('open')) _this.removeClass('open').next('.tr_con').hide();
			else _this.addClass('open').next('.tr_con').show();
		});
	}
};//$.com.detail



$(document).ready(function(){
	//$.com.util.amounyt();//구매수량 올려요
	$.com.util.tab($('.tab_mn'), 0, true);//상품상세설명, 상품후기, 상품Q&A || 추천상품, 카테고리 best

	$.com.detail.slider();
	$.com.detail.acc();//상품후기 > 리스트
	
	
});
function _return_tab(_tab_mn, _idx){
	var _pr_reBest = _tab_mn.parents('.pr_reBest').length,
		_pr_info_con = _tab_mn.parents('#tabs').length;
	
	if(_pr_reBest){//추천상품, 카테고리 best
		console.log('추천상품, 카테고리 best');
		
		$.detail_idx = $.detail_idx || $('#reBest_slider');
		if($.detail_idx.data('one')){
			console.log('--지워');
			$.detail_idx.destroySlider();
		}
		if(!_idx){
			console.log('--추천');
			$.detail_idx.html('');
			/*console.log('html');
			$.detail_idx.html(_test_html);
			console.log('slider');
			$.com.detail.slider2();*/
		}else{
			
			console.log('--best');
			console.log('html');
			//$.detail_idx.html(_test_html);
			console.log('slider');
			$.com.detail.slider2();
		}
	}	
	else if(_pr_info_con){//상품상세설명, 상품후기, 상품Q&A
		//console.log('상품상세설명, 상품후기, 상품Q&A');	
	}

	//console.log('_idx = '+_idx);
};


$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
	*/
	
	if(_reNum <= 2){
		var _list_html = _idx.html();
		//리스트 추가!
		_idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
		//console.log('_reNum = '+_reNum);
	}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
}

$(function(){
	
	// 퀵메뉴에 나오는 최근 본 상품 관련 쿠키
	var recentPrdArr = [];
	if($.cookie('recentProductList') != null){
		var recentPrdArrTmp = $.cookie('recentProductList');
		recentPrdArr = recentPrdArrTmp.split(",");
		
		// 중복제거
		for(var i=0; i< recentPrdArr.length; i++){
			if(recentPrdArr[i] == "${commandMap.prdMstCd}"){
				recentPrdArr.splice(i, 1);	
			}
		}
	}
	
	recentPrdArr.unshift("${commandMap.prdMstCd}");
	// 맨뒤부터 지우기
	if(recentPrdArr.length > 10){
		recentPrdArr.splice(10, 1);
	}
	
	$.cookie('recentProductList',recentPrdArr,{ path: '/', expires: 30});
	
	//옵션추가
	$(document).on("change","select[id=getoptDtlCho]" , function(){
		var myArray;
		var obj;
		var arrayObj = new Array();
		if($(this).val() != ""){
			myArray = $(this).val().split('^');
			var isbreak = false;
			//이미 선택된 옵션인지 체크
			$("input[name=OPT_DTL_IDXs]").each(function(){
				if($(this).val() == myArray[2]){
					alert("이미 선택 된 옵션입니다.");
					isbreak = true;
					return false;
				}
			});
			$("#applyOptionChoiceList").show();
			
			var prdMstPrc = $("#PRD_MST_PRICE").val();
			if(!isbreak){
				obj = new Object();
				obj.PRD_OPT_NM = myArray[0];	//옵션 마스터 옵션명
				obj.OPT_DTL_NM = myArray[1];	//옵션 상세터 옵션명
				obj.OPT_DTL_IDX = myArray[2];	//옵션 상세 Idx
				obj.OPT_DTL_STK_CNT = myArray[4];	//옵션 수량
				
				if(myArray[3] > 0){
					obj.OPT_DTL_ADD_PRC = "+" + myArray[3];	//옵션 추가가격
				}else{
					obj.OPT_DTL_ADD_PRC = myArray[3];	//옵션 추가가격
				}
				
				obj.PRD_OPT_EST_YN = myArray[5];	//필수옵션 Y / 선택옵션 N
				obj.PRD_OPT_CNT_YN = myArray[6];	//수량선택옵션 Y / 선택옵션 N
				var prdOptPrice = 0;
				
				if(obj.PRD_OPT_EST_YN == "Y"){
					obj.OPT_TITLE = "<i class=\"ico_v\"></i>" + obj.PRD_OPT_NM + ":" + obj.OPT_DTL_NM;
					prdOptPrice = parseInt(prdMstPrc) + parseInt(obj.OPT_DTL_ADD_PRC);
				}else{
					obj.OPT_TITLE = "<span class=\"co_blu\">[선택]</span>" + obj.PRD_OPT_NM + ":" + obj.OPT_DTL_NM;
					prdOptPrice = parseInt(obj.OPT_DTL_ADD_PRC);
				}
				
				obj.OPT_PRD_PRICE = setComma(prdOptPrice);
				obj.OPT_PRD_PRC = prdOptPrice;
				
				if(obj.OPT_DTL_STK_CNT < 1){
					alert("해당 옵션은 재고가 없습니다.");
					return false;
				}
				obj.optLen = $("input[name=OPT_DTL_IDXs]").length;
				
				arrayObj.push(obj); //만들어진  object를 배열에 추가
	
				$( "#optionChoiceTemplate" ).tmpl( arrayObj ).appendTo( "#applyOptionChoiceList" );
				setTotalPrice(); //금액 계산
			}
		}
	});
	//옵션 삭제
	$(document).on("click","#optionDtlDel",function(){
		var $this = $(this).parent("strong").parent(".optionDtl");
		$this.remove();
		if($("#applyOptionChoiceList").find(".optionDtl").length == 0){
			$("#applyOptionChoiceList").hide();
		}
		setTotalPrice();
	});
	//옵션수량 증가
	$(document).on("click","#upOptDtlCnt",function(){
		
		var $this = $(this).parent("label").parent("strong").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		var $optDtlCnt = $this.find("input[name=OPT_DTL_CNTs]").val();	//재고
		var $optTxtNum = $this.find(".tx_num");
		
		if(parseInt($optUpCnt) + 1 > 50){
			alert("옵션 수량은 최대 50개 입니디.");
			$optTxtNum.text(parseInt(1));
			$optUpObj.val(parseInt(1));
			return false;
		}else{
			if($optDtlCnt < parseInt($optUpCnt) + 1){
				alert("옵션의 재고수량은 총["+$optDtlCnt+"] 입니다.");
				$optTxtNum.text(parseInt(1));
				$optUpObj.val(parseInt(1));
				return;
			}else{
				$optTxtNum.text(parseInt($optUpCnt) + 1);
				$optUpObj.val(parseInt($optUpCnt) + 1);
			}
		}
		
		setTotalPrice();
	});
	//셀렉트박스로 수량 증가 및 감소
	$(document).on("change","select[id^=REQUEST_CNT_]",function(){
		//필수,선택 옵션 수량 변경 일 때만
		if($(this).attr("name") != "REQUEST_CNT_0"){
			var $this = $(this).parent("label").parent("strong").parent(".optionDtl");
			var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
			var $optUpObj = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]");
			var $optUpCnt = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
			var $optDtlCnt = $this.find("input[name=OPT_DTL_CNTs]").val();	//재고
			var $optTxtNum = $this.find(".tx_num");
			
			if($optUpCnt > 50){
				alert("옵션 수량은 최대 50개 입니디.");
				$optTxtNum.text(parseInt(1));
				$optUpObj.val(parseInt(1));
				return false;
			}else{
				if($optDtlCnt < parseInt($optUpCnt) + 1){
					alert("옵션의 재고수량은 총["+$optDtlCnt+"] 입니다.");
					$optTxtNum.text(parseInt(1));
					$optUpObj.val(parseInt(1));
					return;
				}else{
					$optTxtNum.text(parseInt($optUpCnt));
					$optUpObj.val(parseInt($optUpCnt));
				}
			}
			
			setTotalPrice();
		}
	});
	//옵션수량 감소
	$(document).on("click","#dnOptDtlCnt",function(){
		
		var $this = $(this).parent("label").parent("strong").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		var $optTxtNum = $this.find(".tx_num");
		
		if($optUpObj.val() - 1 < 1){
			alert("최소 수량은 1 입니다.");
			$optUpObj.val(1);
		}else{
			$optTxtNum.text(parseInt($optUpCnt) - 1);
			$optUpObj.val(parseInt($optUpCnt) - 1);
		}
		setTotalPrice();
	});

	//주 상품수량 증가
	$(document).on("click","#upPrdMstCnt",function(){
		
		var prdMstSelCnt = $("#PRD_MST_SEL_CNT").val();	//상품재고
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
		var $this = $(this).parent("label").parent("td");
		var $optTxtNum = $this.find(".tx_num");
		if(parseInt(buyPrdCnt) + 1 > 50){
			alert("상품 수량은 최대 50개 입니디.");
			return false;
		}else{
			if(parseInt(prdMstSelCnt) < parseInt(buyPrdCnt) + 1){
				alert("해당 상품 재고["+prdMstSelCnt+"] 입니다.");
			}else{
				$optTxtNum.text(parseInt(buyPrdCnt) + 1);
				$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) + 1);	//수량 증가
			}
		}
		
		setTotalPrice();
	});
	//주 상품수량 감소
	$(document).on("click","#dnPrdMstCnt",function(){
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
		var $this = $(this).parent("label").parent("td");
		var $optTxtNum = $this.find(".tx_num");
		if(parseInt(buyPrdCnt) - 1 < 1){
			alert("최소 수량은 1 입니다.");
			$("#REQUEST_CNT_0").val(1);
		}else{
			$optTxtNum.text(parseInt(buyPrdCnt) - 1);
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) - 1);	//수량 감소
		}
		
		setTotalPrice();
	});
	//주 상품수량 셀렉트박스 변경
	$(document).on("change","#REQUEST_CNT_0",function(){
		var prdMstSelCnt = $("#PRD_MST_SEL_CNT").val();	//상품재고
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
		var $this = $(this).parent("label").parent("td");
		var $optTxtNum = $this.find(".tx_num");
		
		if(parseInt(buyPrdCnt) > 50){
			alert("옵션 수량은 최대 50개 입니디.");
			return;
		}else{
			if(parseInt(prdMstSelCnt) < parseInt(buyPrdCnt)){
				alert("해당 상품 재고["+prdMstSelCnt+"] 입니다.");
				$optTxtNum.text(parseInt(1));
				$("#REQUEST_CNT_0").val(1);	//수량 감소
				return;
			}else if(parseInt(buyPrdCnt) < 1){
				alert("최소 수량은 1 입니다.");
				$("#REQUEST_CNT_0").val(1);
				return;
			}
		}
		
		$optTxtNum.text(parseInt(buyPrdCnt));
		$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt));	//수량 감소
		
		setTotalPrice();
		
	});
	//구매금액 계산
	setTotalPrice = function(){
		var totPrdPrice = 0;
		var addPirce = 0;
		var optPrdPrc = 0;	//옵션 가격
		var optSelCnt = 0;
		var prdMstPrc = $("#PRD_MST_PRICE").val();
		var prdOptEstCnt = 0;
		var buyPrdCnt = $("#REQUEST_CNT_0").val() == undefined ? 0 : $("#REQUEST_CNT_0").val();	//구매 상품수량
		
		//필수옵션 여부(선택된 옵션중 필수 옵션 여부)
		$(".optionDtl").find("input").each(function(){
			if($(this).attr("name") == "PRD_OPT_EST_YNs" && $(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		var prdOptMstEstCnt = 0;
		//필수옵션 여부(옵션 선택 셀렉스박스)
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptMstEstCnt ++;
			}
		});
		
		//금액 계산
		$("input[name=PRD_DTL_PRCs]").each(function(idx){
			optPrdPrc = $("input[name=OPT_PRD_PRCs]").eq(idx).val();	//옵션가
			prdDtlPrcs = $("input[name=PRD_DTL_PRCs]").eq(idx);		//해당 옵션 선택에 대한 총 가격
			optDtlIdx = $("input[name=OPT_DTL_IDXs]").eq(idx).val();
			if($("select[name=REQUEST_CNT_"+optDtlIdx+"]").val() == undefined){
				optSelCnt = $("input[name=REQUEST_CNT_"+optDtlIdx+"]").val();	//해당 옵션의 선택 수량
			}else{
				optSelCnt = $("select[name=REQUEST_CNT_"+optDtlIdx+"]").val();	//해당 옵션의 선택 수량
			}

			if(buyPrdCnt > 0){//옵션 마스터의 필수옵션이 없을 때(주 상품 수량)
				if(idx == 0){
					addPirce = parseInt(prdMstPrc) * parseInt(buyPrdCnt);
				}else{
					addPirce = parseInt(optPrdPrc) * parseInt(optSelCnt);	
				}
			}else{
				addPirce = parseInt(optPrdPrc) * parseInt(optSelCnt);
			}
			prdDtlPrcs.val(addPirce);
		});

		//옵션에 가격 총 계산
		$("input[name=PRD_DTL_PRCs]").each(function(){
			totPrdPrice = parseInt(totPrdPrice) + parseInt($(this).val());
		});
		
		if(totPrdPrice == 0){
			totPrdPrice = prdMstPrc;
		}else{
			if(prdOptEstCnt < 1 && buyPrdCnt < 1){//선택한 옵션의 필수 옵션 여부
				totPrdPrice = parseInt(prdMstPrc) + parseInt(totPrdPrice);
			}
		}

		//무이자 금액 계산
		var DsCntPrice1 = Math.round(parseInt(totPrdPrice) / 24);
		var DsCntPrice2 = Math.round(parseInt(totPrdPrice) / 36);
		
		$("#TOT_PRD_MST_PRC").val(totPrdPrice);	//결제금액 input 
		if($("#addPrdMstLngDivMnt1PrcTxt")){ $("#addPrdMstLngDivMnt1PrcTxt").html(setComma(DsCntPrice1)); } //무이자 24개월
		if($("#addPrdMstLngDivMnt2PrcTxt")){ $("#addPrdMstLngDivMnt2PrcTxt").html(setComma(DsCntPrice2)); } //무이자 36개월
		
		$("#addPrdMstPrcTxt").html(setComma(totPrdPrice)); //결제금액 표시
	};
	
	// 장바구니 담기
	inertCart = function(memCrtDlvGbn){

		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
		
		if(memCrtDlvGbn == "2099"){
			if($(':input:radio[name=MEM_CRT_LNG_DIV]:checked').length == 0){
				alert("장기할부로 구매 시 무이자 개월수를 선택 해주셔야 합니다.");
				$(':input:radio[name=MEM_CRT_LNG_DIV]').eq(0).focus();
				return;
			}
			
			if(memId == ""){
				var url = location.href;
				if(appType){
					callJavascriptLoginUrl(url); //app 로그인 연동
				}else{
					url = encodeURIComponent(url);
		        	location.target = "_self";
		        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
				}
	        	return;
			}
		}
		
		var crtMemCrtDlvGbn = memCrtDlvGbn == "" ? 2096 : memCrtDlvGbn;
		
		//타임세일,원데이특가 시간 계산
		var proResult = getPromotionChk();

		if(proResult == false){
			alert("판매가 종료 되었습니다.");
			return;
		}
		
		$("#MEM_CRT_DLV_GBN").val(crtMemCrtDlvGbn);
		//옵션 수량 체크
		var optDtlIdx = 0;	//옵션키
		var optDtlCnt = 0;	//옵션수량
		$("input[name=OPT_DTL_IDXs]").each(function(idx){
			optDtlIdx = $(this).val();
			optDtlCnt = parseInt($("input[name=OPT_DTL_CNTs]").eq(idx).val());
			if(parseInt($("input[name=REQUEST_CNT_"+optDtlIdx+"]").val()) > optDtlCnt){
				alert("선택하신 옵션중 수량이 잘못된 옵션이 있습니다.");
				cartResult = false;
				return;
			}
		});
		
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		if(prdOptEstCnt > 0){
			$("input[name=PRD_OPT_EST_YNs]").each(function(){
				if($(this).val() == "Y"){
					prdOptEstYns ++;
				}
			});
			if(prdOptEstYns < 1){
				$("#alterMsg").html("필수 옵션을 선택해주세요.");
				$.com.util.layPop('open', $('#layPurc'))
				cartResult = false;
				return;
			}
		}

		if(cartResult){
			//구매예정가 금액 다시 계산
			setTotalPrice();
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : $("#cartForm").serialize(),
	            url : "<c:out value="${mobileDomain}" />/mobile/cart/insertCartAjax.do",
	            success : function (data) 
	            { 
	            	// 1 : 장바구니 등록 성공
	            	switch(data.result){
	            	case 1:
	            		$("#topCartCnt").html(data.cartCnt);
	            		if($("#MEM_CRT_DLV_GBN").val() == 2099){
	            			$("#mntText").html($(':input:radio[name=MEM_CRT_LNG_DIV]:checked').val());
	            			$.com.util.layPop('open', $('#layCart24'));
	            		}else if($("#MEM_CRT_DLV_GBN").val() == 2098){//클린킹
	            			$.com.util.layPop('open', $('#laypopCleanKing'));//팝업 show
	            		}else{
	            			$.com.util.layPop('open', $('#layCart'));
	            		}
	            		insertCartFavoriteDummy(prdMstCd);
	            		xtractorUpdateCookie('xtr_basket',prdMstCd);
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
		}else{
			alert("예상 외 오류가 발생 하였습니다.\n다시 시도해주세요.");
			return;
		}
		
	};
	
	// 결제 페이지로 이동 
	setPaymentData = function(crtMemCrtDlvGbn)
	{
		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		//타임세일,원데이특가 시간 계산
		var proResult = getPromotionChk();

		if(proResult == false){
			alert("판매가 종료 되었습니다.");
			return;
		}
		
		//옵션 수량 체크
		var optDtlIdx = 0;	//옵션키
		var optDtlCnt = 0;	//옵션수량
		$("input[name=OPT_DTL_IDXs]").each(function(idx){
			optDtlIdx = $(this).val();
			optDtlCnt = parseInt($("input[name=OPT_DTL_CNTs]").eq(idx).val());
			if(parseInt($("input[name=REQUEST_CNT_"+optDtlIdx+"]").val()) > optDtlCnt){
				alert("선택하신 옵션중 수량이 잘못된 옵션이 있습니다.");
				cartResult = false;
				return;
			}
		});
		
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		if(prdOptEstCnt > 0){
			$("input[name=PRD_OPT_EST_YNs]").each(function(){
				if($(this).val() == "Y"){
					prdOptEstYns ++;
				}
			});
			if(prdOptEstYns < 1){
				$("#alterMsg").html("필수 옵션을 선택해주세요.");
				$.com.util.layPop('open', $('#layPurc'))
				cartResult = false;
				return;
			}
		}
		//구매예정가 금액 다시 계산
		setTotalPrice();
		$("#MEM_CRT_DLV_GBN").val(crtMemCrtDlvGbn);
		if(cartResult){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : $("#cartForm").serialize(),
	            url : "<c:out value="${mobileDomain}" />/mobile/cart/insertDirectPurchaseAjax.do",
	            success : function (data) 
	            { 
					switch (data.result) {
					case 1:
						$('#cartForm').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
						$('#cartForm').attr("method","post");
						<c:choose>
						<%-- 1. 비회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
						//$('#paymentform').attr('action','<c:out value="${mobileSslDomain}" />/pc/cart/cartLogin.do').submit();
						var url = "<c:out value="${mobileSslDomain}"/>/mobile/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD+"&locationProtocol=<c:out value="${locationProtocol}"/>";
						if(appType){
							callJavascriptLoginUrl(url,'_self'); //app 로그인 연동
						}else{
							url = encodeURIComponent(url);
				        	location.target = "_self";
				        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
						}
						</c:when>
						<%-- 2. 회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'user'}">
						$('#cartForm').attr('action','<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do').submit();
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
	};
	
	//상품 리뷰 리스트
	productRevList = function(searchRevType,cPage,searchMemId){
		var prdMstCd = $("#PRD_MST_CD").val();
		var searchMemId = searchMemId == '' ? "N" : searchMemId;
		
		if(searchMemId == "Y"){
			$("#myRevButton").hide();
			$("#allRevButton").show();
		}else{
			$("#myRevButton").show();
			$("#allRevButton").hide();
		}
		
		//내가 쓴 상품리뷰 확인 시 로그인 여부
		if(searchMemId == "Y"){
			var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
			if(memId == ""){
				var url = location.href;
				url = encodeURIComponent(url);
				location.target = "_self";
	        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
	        	return;
			}
		}
		
		$("#applyProductReputationList").find("tr").remove();
		
		$("#searchRevType").val(searchRevType);
		$("#searchMemId").val(searchMemId);

		if(prdMstCd != ""){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : {"PRD_MST_CD" : prdMstCd , "searchRevType": searchRevType, "cPage": cPage , "searchMemId": searchMemId},
	            url : "<c:out value="${mobileDomain}" />/mobile/product/productRevListAjax.do",
	            success : function (data) 
	            { 
	            	$("#spanRepCnt").html(data.REP_CNT);
	            	$("#spanPhotoCnt").html(data.PHOTO_CNT);
	            	$("#spanTextCnt").html(data.TEXT_CNT);
	            	if(data.RevList != null)
	    			{
						var arrayObj = new Array();
	    				
	    				$.each(data.RevList, function(index,item)
	    				{
							var obj = new Object();
	    					
	    					obj.PRD_REV_TITLE = item.PRD_REV_TITLE;
	    					obj.PRD_REV_REG_ID = item.PRD_REV_REG_ID.substring(0,item.PRD_REV_REG_ID.length-3) + "***";
	    					obj.PRD_REV_REG_DT = item.PRD_REV_REG_DT_2;
    						obj.REP_IMG = item.REP_IMG;
    						obj.PRD_REV_SCORE_STAR = item.PRD_REV_SCORE_STAR;
    						obj.PRD_REV_SCORE_GRD = item.PRD_REV_SCORE_STAR_GRD;
							obj.ListNum = item.ListNum;
							obj.PRD_REV_IDX = item.PRD_REV_IDX;
							obj.PRD_REV_CONTENTS = item.PRD_REV_CONTENTS;
							obj.PRD_REV_CHN_GBN = item.PRD_REV_CHN_GBN;
	    					arrayObj.push(obj);
	    				});
	    				
	    				$( "#productReputationListTemplate" ).tmpl( arrayObj ).appendTo( "#applyProductReputationList" );
    					$( "#productReputationListPageDiv" ).html(data.page);
    					//Q&A + 리뷰
    	            	$.com.detail.acc();//상품후기 > 리스트
	    			}else{
	    				$( "#applyProductReputationList" ).html("<tr class=\"tr_noList\" tabindex=\"0\"><td>등록된 상품후기가 없습니다.</td></tr>");
	    				$( "#productReputationListPageDiv" ).html(data.page);
	    			}
	            	
	            },
	            error : function (err)
	            {
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	            }
			});
		}
	};
	
	productRevList('',1,'');
	
	// 페이지 이동
    goPage = function (cPage) 
    {
		var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        var searchRevType = $("#searchRevType").val();
        var searchMemId = $("#searchMemId").val();
        productRevList(searchRevType,cPage,searchMemId);
    };
    
    showRevDetail = function(prdRevIdx){
    	if(prdRevIdx != ""){
    		$("tr[id^=productRevList]").each(function(){
    			$(this).hide();
    		});
    		$("#productRevList_"+prdRevIdx).show();
    	}
    };
    
  	//상품 QNA 리스트
	productQnaList = function(cPage,searchQnaMemId){
		prdMstCd = $("#PRD_MST_CD").val();
		searchQnaMemId = searchQnaMemId == '' ? "N" : searchQnaMemId;
		
		if(searchQnaMemId == "Y"){
			$("#myQnaButton").hide();
			$("#allQnaButton").show();
		}else{
			$("#myQnaButton").show();
			$("#allQnaButton").hide();
		}
		
		//내가 쓴 상품 QnA 확인 시 로그인 여부
		if(searchQnaMemId == "Y"){
			var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
			if(memId == ""){
				var url = location.href;
				url = encodeURIComponent(url);
				location.target = "_self";
	        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
	        	return;
			}
		}
		
		$("#applyProductQnaList").find("tr").remove();
		
		$("#searchQnaMemId").val(searchQnaMemId);

		if(prdMstCd != ""){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : {"PRD_MST_CD" : prdMstCd , "cPage": cPage , "searchQnaMemId": searchQnaMemId},
	            url : "<c:out value="${mobileDomain}" />/mobile/product/productQnaListAjax.do",
	            success : function (data) 
	            { 
	            	if(data.QnaList != null)
	    			{
						var arrayObj = new Array();
	    				
	    				$.each(data.QnaList, function(index,item)
	    				{
							var obj = new Object();
							obj.BRD_INQ_IDX = item.BRD_INQ_IDX;
	    					obj.BRD_INQ_TITLE = item.BRD_INQ_CONTENTS.substring(0,20);
	    					obj.BRD_INQ_REG_ID = item.BRD_INQ_REG_ID.substring(0,item.BRD_INQ_REG_ID.length-3) + "***";
	    					obj.BRD_INQ_REG_DT = item.BRD_INQ_REG_DT;
    						obj.BRD_INQ_REPLY_CD_NM = item.BRD_INQ_REPLY_CD_NM;
    						obj.BRD_INQ_CONTENTS = item.BRD_INQ_CONTENTS;
							obj.ListNum = item.ListNum;
							obj.BRD_INQ_REG_CHK_ID = item.BRD_INQ_REG_ID;
							obj.MEM_LOG_ID = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
							obj.BRD_INQ_REPLY_CD = item.BRD_INQ_REPLY_CD;
							obj.BRD_INQ_REPLY_CONTENTS = item.BRD_INQ_REPLY_CONTENTS;
							obj.BRD_INQ_CHN_GBN = item.BRD_INQ_CHN_GBN;
							obj.BRD_INQ_REPLY_DT = item.BRD_INQ_REPLY_DT_2;

							arrayObj.push(obj);
	    				});
	    				
	    				$( "#productQnaListTemplate" ).tmpl( arrayObj ).appendTo( "#applyProductQnaList" );
    					$( "#productQnaListPageDiv" ).html(data.page);
    					//Q&A + 리뷰
    	            	$.com.detail.acc();//상품후기 > 리스트
	    			}else{
	    				$( "#applyProductQnaList" ).html("<tr class=\"tr_noList\" tabindex=\"0\"><td>등록된 상품Q&A가 없습니다. </td></tr>");
	    				$( "#productQnaListPageDiv" ).html(data.page);
	    			}
	            },
	            error : function (err)
	            {
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	            }
			});
		}
	};
	
	productQnaList(1,'');
	
	// 페이지 이동
    goPageQna = function (cPage) 
    {
		var $frm = $("#qnaFrm");
        $frm.find("input[name='cPage']").val(cPage);
        var searchQnaMemId = $("#searchQnaMemId").val();
        productQnaList(cPage,searchQnaMemId);
    };
    
    showQnaDetail = function(brdInqIdx){
    	if(brdInqIdx != ""){
    		$("tr[id^=productQnaList]").each(function(){
    			$(this).hide();
    		});
    		$("#productQnaList_"+brdInqIdx).show();
    	}
    };
    //상품 qna삭제
    productQnaDel = function(brdInqIdx){
    	if(brdInqIdx != ""){
    		if(confirm("삭제 하시겠습니까?")){
	    		$.ajax
		        ({
		            async : false,
		            type : "POST",
		            data : {"brdInqIdx": brdInqIdx},
		            url : "<c:out value="${mobileDomain}" />/mobile/product/productQnaDeleteAjax.do",
		            success : function (data) 
		            { 
		            	if(data.resultYn == "Y")
		    			{
							alert("삭제되었습니다.");
		    			}else{
		    				alert("삭제 중 오류가 발생하였습니다.\n다시 시도해주세요.");
		    			}
		            	productQnaList(1,'');
		            },
		            error : function (err)
		            {
		                alert("오류가 발생하였습니다.\n[" + err.status + "]");
		                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
		            }
				});
    		}
    	}else{
    		alert("필수값이 없습니다.\n다시 확인해주세요");
    		return;
    	}
    };
    
    getPrdQnaForm = function(brdInqIdx){
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
    	
		if(memId == ""){
			var url = location.href;
			url = encodeURIComponent(url);
			location.target = "_self";
        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
        	return;
		}else{
			$("#BRD_INQ_IDX").val(brdInqIdx);
	 		$("#cartForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/productQnaForm.do", "target":"_self", "method":"post"}).submit();
		}
    };
    
 	// sns kakostory
	goProductKakaoStory = function()
	{
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=<c:out value="${productInfo.PRD_MST_CD}" />";
		var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 

		if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
	    	callJavascriptOutlinkPage(url);
	    }else{
	    	var kakoStory = window.open("about:blank");
	    	kakoStory.location.href=url;
	    }
	};
	// sns Twitter
	goProductTwitter = function()
	{
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=<c:out value="${productInfo.PRD_MST_CD}" />";
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent("<c:out value="${productInfo.PRD_MST_NM_MB}" />");

		if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
			callJavascriptOutlinkPage(url+"&text="+text);
	    }else{
	    	var twitter = window.open("about:blank");
	    	twitter.location.href="https://twitter.com/share?url="+url+"&text="+text;
	    }
	};
	
	// sns facebook
	goProductFacebook = function() 
	{ 
	    var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=<c:out value="${productInfo.PRD_MST_CD}" />"; 
	    var text = encodeURIComponent("<c:out value="${productInfo.PRD_MST_NM_MB}" />");
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    
	    if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
	    	callJavascriptOutlinkPage(url);
	    }else{
	    	var faceBook = window.open("about:blank");
	    	faceBook.location.href=url;
	    }
	}; 
	
	// sns Pinterest
	goProductPinterest = function() 
	{ 
		var sImg = "<c:out value="${cdnDomain}"/>/<c:out value="${productInfo.PRD_IMG_ATT_PATH}" />/<c:out value="${productInfo.PRD_IMG_SYS_NM}" />";
	    var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=<c:out value="${productInfo.PRD_MST_CD}" />"; 
	    //var sImg = "http://image.etland.co.kr/etlandbo/product/images/1094709_M1.jpg";
	    //var paramUrl = "http://www.etland.co.kr/etland/servlet/fs.EtlandServlet_FS?tc=c.cmd.FSC_renew_shop_cmd&gb=CS_DTAL&PRD_CD=1093147";
	    var text = encodeURIComponent("<c:out value="${productInfo.PRD_MST_NM_MB}" />");
	    var url = 'http://www.pinterest.com/pin/create/button/?url='+encodeURIComponent(paramUrl)+"&amp;media="+encodeURIComponent(sImg)+"&amp;description="+encodeURIComponent(text);
	    window.open(url,'pinterest','toolbar=0,status=0,width=1024,height=800'); 
	    
	};
	// URL 복사
	goProductCopyClipBoard = function () {
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=${productInfo.PRD_MST_CD}"; 
		if(navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident") > -1) 
		{
			window.clipboardData.setData("Text", paramUrl);
			alert("클립보드에 복사되었습니다. Ctrl+V로 붙여넣어 사용하시면 됩니다.");
		} 
		else 
		{
			temp = prompt("브라우저 주소창의 URL을 복사해서 사용해주세요", paramUrl);
		}
		
	};
	
	// 파일 다운로드
    $(document).on("click", "#fileDown", function () 
    {
    	var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.data("cmm_fle_text"));
        $fileForm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/common/commonFileDownload.do", "target":"_self", "method":"get"}).submit();
    });
	
    goProductRevWrite = function(){
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
		if(memId == ""){
			var url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myWritableProductCommentList.do";
			url = encodeURIComponent(url);
			location.target = "_self";
        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
        	return;
		}else{
			$("#cartForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myWritableProductCommentList.do", "target":"_self", "method":"post"}).submit();
		}
    };
    //타임세일 , 원데이특가 시간 확인
    getPromotionChk = function(){
    	var proResult = true; 
    	var promotionIdx = $("#promotionIdx").val();	//프로모션 idx
		var promotionSdDt = $("#promotionSdDt").val();	//프로모션 시작날짜시간
		var promotionEdDt = $("#promotionEdDt").val();	//프로모션 종료날짜시간
		var promotionType = $("#promotionType").val();	//프로모션 타입
		
		var nowDate = new Date();
		
		var month = (nowDate.getMonth()+1)>9 ? (nowDate.getMonth()+1) : '0'+(nowDate.getMonth()+1);
		var day = nowDate.getDate()>9 ? nowDate.getDate() : '0'+nowDate.getDate();
		var year = nowDate.getFullYear();
		var hours = nowDate.getHours();
		var min = nowDate.getMinutes();
		
		var todayDay = year+month+day+hours+min;
		
		if(promotionIdx != "" && promotionIdx != undefined){
			if(promotionSdDt != "" && promotionEdDt != ""){
				if(promotionType == "time"){//타임세일
					if(todayDay >= promotionSdDt && promotionEdDt >= todayDay){
						proResult = true;
					}else{
						proResult = false;
					}
				}else{//원데이특가
					if(promotionEdDt > todayDay){
						proResult = true;
					}else{
						proResult = false;
					}
				}
			}else{
				proResult = false;
			}
		}
		return proResult;
    };
    
	// 관심등록
	insertKeeping = function(prdMstCd){
		//타임세일,원데이특가 시간 계산
		var proResult = getPromotionChk();

		if(proResult == false){
			alert("판매가 종료 되었습니다.");
			return;
		}
		
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"PRD_MST_CD" : prdMstCd
			},
			url : "<c:out value="${mobileDomain}" />/mobile/cart/insertInterestProductAjax.do",
			success : function(data) {
				var result = data.result;//0:로그인 필요 1:성공 -1:실패
				if(result == 0){
					if(confirm(data.resultMsg)){
						var url = location.href;
						url = encodeURIComponent(url);
						location.target = "_self";
			        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
					}
				}else{
					$.com.util.layPop('open', $('#layKeep'));
					insertKeepFavoriteDummy(prdMstCd);
					xtractorUpdateCookie('xtr_sympathy',prdMstCd);
				}
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	};
	//겟잇나우 상품구매 
	getPrdStorePop = function(){
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
    	
    	var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		var artMsg = "";
		if(prdMstCd == ""){
			artMsg = "필수 요소가 없습니다.\n다시 시도해주세요.";
			cartResult = false;
		}
		
		//옵션 수량 체크
		var optDtlIdx = 0;	//옵션키
		var optDtlCnt = 0;	//옵션수량
		$("input[name=OPT_DTL_IDXs]").each(function(idx){
			optDtlIdx = $(this).val();
			optDtlCnt = parseInt($("input[name=OPT_DTL_CNTs]").eq(idx).val());
			if(parseInt($("input[name=REQUEST_CNT_"+optDtlIdx+"]").val()) > optDtlCnt){
				artMsg = "선택하신 옵션중 수량이 잘못된 옵션이 있습니다.";
				cartResult = false;
				return;
			}
		});
		
		if(!cartResult){
			alert(artMsg);
			return;
		}
		
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		if(prdOptEstCnt > 0){
			$("input[name=PRD_OPT_EST_YNs]").each(function(){
				if($(this).val() == "Y"){
					prdOptEstYns ++;
				}
			});
			if(prdOptEstYns < 1){
				alert("필수 옵션을 선택해주세요.");
				cartResult = false;
				return;
			}
		}
    	
		if(memId == ""){
			var url = location.href;
			url = encodeURIComponent(url);
			location.target = "_self";
        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
        	return;
		}else{
	 		$("#cartForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductStore.do", "target":"_self", "method":"post"}).submit();
		}
    };
    
	if($("#promotionIdx").val() != "" && $("#promotionIdx").val() != undefined ){
		
		var edDate = $("#promotionEdYY").val();
		var edYY = edDate.substr(0,4);
		var edMS = edDate.substr(4,2);
		var edDD = edDate.substr(6,2);
		
		var edHH = $("#promotionEdHH").val();
		var edMM = $("#promotionEdMM").val();
		if($("#promotionType").val() == "time"){
			$.com.detail.showtime(edYY+"-"+edMS+"-"+edDD,edHH+":"+edMM+":00", '#tx_time');	
		}
		else{
			$.com.detail.showtime(edYY+"-"+edMS+"-"+edDD,edHH+":"+edMM+":00", '#tx_time2');
		}
	};
	
	//가격 흥정 
	getPrdEsmPop = function(){
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
    	
    	var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		var artMsg = "";
		if(prdMstCd == ""){
			artMsg = "필수 요소가 없습니다.\n다시 시도해주세요.";
			cartResult = false;
		}
		
		//옵션 수량 체크
		var optDtlIdx = 0;	//옵션키
		var optDtlCnt = 0;	//옵션수량
		$("input[name=OPT_DTL_IDXs]").each(function(idx){
			optDtlIdx = $(this).val();
			optDtlCnt = parseInt($("input[name=OPT_DTL_CNTs]").eq(idx).val());
			if(parseInt($("input[name=REQUEST_CNT_"+optDtlIdx+"]").val()) > optDtlCnt){
				artMsg = "선택하신 옵션중 수량이 잘못된 옵션이 있습니다.";
				cartResult = false;
				return;
			}
		});
		
		if($("input[name=OPT_DTL_IDXs]").length > 1){
			artMsg = "할인해주세요는 옵션 1개만 선택 하셔야 합니다.";
			cartResult = false;
		}
		
		if(!cartResult){
			alert(artMsg);
			return;
		}
		
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		if(prdOptEstCnt > 0){
			$("input[name=PRD_OPT_EST_YNs]").each(function(){
				if($(this).val() == "Y"){
					prdOptEstYns ++;
				}
			});
			if(prdOptEstYns < 1){
				alert("필수 옵션을 선택해주세요.");
				cartResult = false;
				return;
			}
		}
		
		if(memId == ""){
			var url = location.href;
			if(appType){
				callJavascriptLoginUrl(url); //app 로그인 연동
			}else{
				url = encodeURIComponent(url);
				location.target = "_self";
	        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
			}
        	return;
		}else{
	 		$("#cartForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductEsm.do", "target":"_self", "method":"post"}).submit();
		}
    };
    //쿠폰 다운로드 팝업
    goPrdCoupon = function(prdMstCd,dwnType){
    	
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
    	var memGbn = "<c:out value="${userInfo.MEM_MST_MEM_GBN}" />";
    	var ememType = "<c:out value="${Code.MEMBER_TYPE_SIMPLE}" />";
    	
    	if(memId == ""){
    		var url = location.href;
    		if(appType){
				callJavascriptLoginUrl(url); //app 로그인 연동
			}else{
				url = encodeURIComponent(url);
				location.target = "_self";
	        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
			}
        	return;
		}else{
			if(memGbn == ememType){
				if(confirm("마켓플랜트 통합회원 전용혜택입니다.\n통합회원으로 전환하시겠습니까?")){
					$('#couForm').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/manager/changeOnlineMemCert.do', "target":"_self",'method':'post'}).submit();	
				}
			}else{
				$("#couponType").val(dwnType);
		 		$("#cartForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/searchProductCpn.do", "target":"_self", "method":"post"}).submit();
			}
		}
    };
    //카테고리 베스트 상품 리스트
    prdCtgBestList = function(){
    	prdMstCd = $("#PRD_MST_CD").val(); 
    	catIdx = $("#cateIdx").val();
    	$("#reBest_slider").load("<c:out value="${mobileDomain}" />/mobile/product/productCategoryBestListAjax.do", {"PRD_MST_CD":prdMstCd , "catIdx":catIdx}, function(){
    		$.com.detail.slider2();
    	});
    };
    
 	// tab 변경 
	$("#menuViewTab").on("click", "a", function () {
 		
 		var this_tab_no = $(this).data('tab_no');
 		
 		$(this).parent().parent().find('a').each( function(i,item){
 			if( this_tab_no == $(item).data("tab_no") ){
 				$(item).addClass("on");	
 			}	
 			else{
 				$(item).removeClass("on");
 			}
 		});
 		
 		if(this_tab_no == "tab1"){

 		}else{
 			//prdCtgBestList();
 		}
 	});
 	
 	//장바구니 이동
	goCartList = function(){
		$.com.util.layPop('close', $('#layCart'));
 		callJavascriptNextPage('<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','_self');
	};
	
	//나의 키핑상품 이동
	goMyKeeping = function(){
		$.com.util.layPop('close', $('#layKeep'));
		callJavascriptLoginUrl('<c:out value="${mobileSslDomain}" />/mobile/mypage/myKeepProductList.do','_self');
	};
	
	goPlan = function(){
		$('#searchForm').attr({'action':'<c:out value="${mobileDomain}" />/mobile/main/index.do','method':'post' , "target":"_self"}).submit();
	};
	
	//1:1문의 이동
	goMyInquiryList = function(){
		var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
		var url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryList.do";
		if(memId == ""){
			if(appType){
				callJavascriptLoginUrl(url); //app 로그인 연동
			}else{
				url = encodeURIComponent(url);
				location.target = "_self";
	        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
			}
        	return;
		}else{
			/* location.href = url; */
			callJavascriptNextPage(url,'_self');
		}
	};
	//이미지 및 내용 상세 보기
	showProductDetail = function(viewType){
		$("#viewType").val(viewType);
		$('#cartForm').attr({'action':'<c:out value="${mobileDomain}" />/mobile/product/productSimpleView.do','method':'post' , "target":"_self"}).submit();	
	};
	
	//통합검색 브랜드 넘김
	goSearch = function(searchText){
		$searchForm = $("#searchForm");
		$("input[name=query]").val(searchText);
		$searchForm.attr({'action':'<c:out value="${frontDomain}" />/mobile/search/search.do','method':'post', "target":"_self"}).submit();	
	};
	
	setTotalPrice();
	
	xtractorUpdateCookie('xtr_view', $("#PRD_MST_CD").val())//상품조회 쿠키 생성
	
	//개인화 장바구니 연동
	function insertCartFavoriteDummy(prdMstCd){
		$.ajax
	    ({
	        async : false,
	        type : "GET",
	        data : {
	        			"PROD_ID" : prdMstCd
	        			,"LOGIN_ID" : "<c:out value="${sessionUser.MEM_MST_MEM_ID }"/>"
	        		},
	        url : "<c:out value="${mobileDomain}" />/pc/global/xtractor/favoriteDummy.do",
	        success : function (data) 
	        { 
	        	//console.log('장바구니 연동 성공: ');
	        },
	        error : function (err)
	        {
	            alert("오류가 발생하였습니다.\n[" + err.status + "]");
	            window.jquery || console.log('장바구니 연동 오류가 발생하였습니다: ' + err.status);
	        }
		});
	}

	//개인화 키핑 연동
	function insertKeepFavoriteDummy(prdMstCd){
		$.ajax
	    ({
	        async : false,
	        type : "GET",
	        data : {
	        			"PROD_ID" : prdMstCd
	        			,"LOGIN_ID" : "<c:out value="${sessionUser.MEM_MST_MEM_ID }"/>"
	        		},
	        url : "<c:out value="${mobileDomain}" />/pc/global/xtractor/sympathyDummy.do",
	        success : function (data) 
	        { 
	        	//console.log('키핑하기 연동 성공: ');
	        },
	        error : function (err)
	        {
	            //console.log('키핑하기 연동 오류가 발생하였습니다: ' + err.status);
	        }
		});
	}
	
	
});
</script>    