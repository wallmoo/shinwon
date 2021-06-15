<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}"/>/pc/js/vivus.js"></script><!-- vivus js -->
</head>

<body class="page-popup"><!-- page-list -->
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">	
	<!-- #container S -->
	<article id="container" class="container simple_pop">
		<div class="contents"><!-- .contents S -->
			
			<ul>
				
				<li class="ti">
					<h2 class="tx_doc"><c:out value="${productInfo.PRD_MST_NM }" /></h2>
					<dl class="score">
						<dt class="blind">총평점, 상품후기</dt>
						<dd>
							<span class="tx_comment">상품후기 <span><fmt:formatNumber value="${productReputation.REP_CNT}" groupingUsed="true" /></span>건</span>
							<p>
								<span class="ti">총평점</span>
								<i class="ico_star_an"><i data-width="<c:out value="${productReputation.REP_POINT_GRD}" />"></i></i>
								<strong class="tx_num"><c:out value="${productReputation.REP_POINT}" /></strong>
							</p>							
						</dd>						
					</dl>
				</li>
				<li class="con">
					
					<form name="cartForm" id="cartForm">
					<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${productInfo.PRD_MST_CD}" />" /><!-- 상품코드 -->
					<input type="hidden" name="PRD_MST_PRICE" id="PRD_MST_PRICE" value="<c:out value="${productInfo.PRD_MST_PRICE}" />" /><!-- 상품가격 -->
					<input type="hidden" name="TOT_PRD_MST_PRC" id="TOT_PRD_MST_PRC" value="0" /><!-- 계산 된 결제금액 -->
					<input type="hidden" name="PRD_MST_SEL_CNT" id="PRD_MST_SEL_CNT" value="<c:out value="${productInfo.PRD_MST_SEL_CNT}" />" /><!-- 상품 재고 -->
					<input type="hidden" name="MEM_CRT_DLV_GBN" id="MEM_CRT_DLV_GBN" value="2096" /><!-- 상품유형 -->
					<input type="hidden" name="PRD_MST_LNG_IST_MNT" id="PRD_MST_LNG_IST_MNT" value="<c:out value="${productInfo.PRD_MST_LNG_IST_MNT}" />" /><!-- 장기할부개월 -->
					<input type="hidden" name="PRD_MST_NM" id="PRD_MST_NM" value="<c:out value="${productInfo.PRD_MST_NM }" />" /><!-- 상품명 -->
					<input type="hidden" name="openerType" id="openerType" value="list" /><!-- 오프너 타입 -->
					<input type="hidden" name="TOT_PRD_PRC" id="TOT_PRD_PRC" value="0" /><!-- 계산 된 상품 금액 -->
					<input type="hidden" name="PRD_PRC" id="PRD_PRC" value="<c:out value="${productInfo.PRD_MST_PRC }" />" />					
					
					<!-- .pr_detail S -->
					<fieldset class="pr_detail">
						<div class="pr_image">
							<dl class="img_box">
								<dt class="blind">상품이미지</dt>							
								<dd class="img"><img src="<c:out value="${cdnDomain}" />/<c:out value="${productInfo.PRD_IMAGE}" />" alt="<c:out value="${productInfo.PRD_IMAGE_ALT}" />" /></dd>
							</dl>								
						</div>
						<div class="pr_info"><!-- .pr_info S -->
							<ul class="info_list">
								<c:choose>
									<c:when test="${empty productTimeSaleInfo && empty productOneDayInfo }">
										<c:choose>
											<c:when test="${userInfo.MEM_MST_MEM_GBN eq '683' }">
												<li class="li_sel_prc">
													<span class="ti">판매가</span>
													<span class="selPrice"><strong class="pr"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /></strong><span class="tx_won">원</span></span>
													<a href="javascript:getPrdEsmPop();" class="btn_st3"><span>할인해주세요</span></a>
												</li>
												<li class="li_comMem_prc">
													<span class="ti">기업회원가</span>
													<strong class="price"><fmt:formatNumber value="${productInfo.PRD_NOW_DST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
												</li>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${productInfo.PRD_NOW_DST_PRICE == 0 && productInfo.PRD_CPN_DST_PRICE == 0 && productInfo.PRD_BRD_CPN_CNT == 0}">
														<li class="li_sel_prc">
															<span class="ti">판매가</span>
															<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
															<a href="javascript:getPrdEsmPop();" class="btn_st3"><span>할인해주세요</span></a>
														</li>
													</c:when>
													<c:otherwise>
														<c:if test="${productInfo.PRD_NOW_DST_PRICE > 0}">
															<li class="li_sel_prc">
																<span class="ti">판매가</span>
																<span class="selPrice"><strong class="pr"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /></strong><span class="tx_won">원</span></span>
																<a href="javascript:getPrdEsmPop();" class="btn_st3"><span>할인해주세요</span></a>
															</li>
															<c:if test="${productInfo.PRD_NOW_DST_PRICE > 0}">
																<li class="li_immed_prc">
																	<span class="ti">
																		즉시할인가
																		<a href="javascript:void(0);" class="ico_question"><span class="blind">즉시할인가 안내 보기</span></a>
																	</span>
																	<dl class="que_lay">
																		<dt class="que_ti">
																			<strong class="blind">즉시할인가 안내</strong>
																			<i class="ico_ar"></i>
																		</dt>
																		<dd class="que_con">
																			즉시할인쿠폰이 적용된 금액이며, <br/>회원에 한해 자동 적용됩니다.
																		</dd>									
																	</dl>
									
																	<strong class="price"><fmt:formatNumber value="${productInfo.PRD_NOW_DST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																	<span class="ico_selOff"><c:out value ="${productInfo.PRD_NOW_DST_POINT }" />% OFF</span>
																</li>
															</c:if>
														</c:if>
														<c:if test="${productInfo.PRD_CPN_DST_PRICE > 0 || productInfo.PRD_BRD_CPN_CNT > 0}">
															<c:if test="${productInfo.PRD_NOW_DST_PRICE < 1}">
																<li class="li_sel_prc">
																	<span class="ti">판매가</span>
																	<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																	<a href="javascript:getPrdEsmPop();" class="btn_st3"><span>할인해주세요</span></a>
																</li>
															</c:if>
															<c:if test="${productInfo.PRD_CPN_DST_PRICE > 0 && (productInfo.PRD_BRD_CPN_CNT > 0 || productInfo.PRD_BRD_CPN_CNT < 1) }">
																<li class="li_cou_prc">
																	<span class="ti">
																		쿠폰적용가
																		<a href="javascript:void(0);" class="ico_question"><span class="blind">쿠폰적용가 안내 보기</span></a>
																	</span>
																	<dl class="que_lay">
																		<dt class="que_ti">
																			<strong class="blind">쿠폰적용가 안내</strong>
																			<i class="ico_ar"></i>
																		</dt>
																		<dd class="que_con">
																			쿠폰을 다운로드 받아  결제 시<br/>
																			적용했을때의 적용가이며, <br/>
																			회원에 한해 적용가능합니다.
																		</dd>									
																	</dl>
									
																	<strong class="price"><fmt:formatNumber value="${productInfo.PRD_CPN_DST_PRICE }" groupingUsed="true" /><span class="tx_won">원</span></strong>
																	<a href="javascript:goPrdCoupon('<c:out value="${productInfo.PRD_MST_CD}"/>','one');" class="btn_st5 ico_coupon"><span>쿠폰다운로드</span></a>
																</li>
															</c:if>
															<c:if test="${productInfo.PRD_BRD_CPN_CNT > 0 && productInfo.PRD_CPN_DST_PRICE < 1 }">
																<li class="li_cou_prc">
																	<span class="ti">
																		쿠폰적용가
																		<a href="javascript:void(0);" class="ico_question"><span class="blind">쿠폰적용가 안내 보기</span></a>
																	</span>
																	<dl class="que_lay">
																		<dt class="que_ti">
																			<strong class="blind">쿠폰적용가 안내</strong>
																			<i class="ico_ar"></i>
																		</dt>
																		<dd class="que_con">
																			쿠폰을 다운로드 받아  결제 시<br/>
																			적용했을때의 적용가이며, <br/>
																			회원에 한해 적용가능합니다.
																		</dd>									
																	</dl>
									
																	<strong class="price pr_question">?</strong>
																	<a href="javascript:goPrdCoupon('<c:out value="${productInfo.PRD_MST_CD}"/>','all');" class="btn_st5 ico_coupon"><span>쿠폰다운로드</span></a>
																</li>
															</c:if>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<li class="li_sel_prc">
											<span class="ti">판매가</span>
											<strong class="price"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" /><span class="tx_won">원</span></strong>
											<a href="javascript:getPrdEsmPop();" class="btn_st3"><span>할인해주세요</span></a>
										</li>
									</c:otherwise>
								</c:choose>
								<li class="li_card_pr li_br">
									<span class="ti">
										제휴카드 혜택가
										<a href="javascript:void(0);" class="ico_question"><span class="blind">제휴카드 혜택사 안내 보기</span></a>
									</span>
									<dl class="que_lay">
										<dt class="que_ti">
											<strong>제휴카드 혜택사 안내</strong>
											<i class="ico_ar"></i>
										</dt>
										<dd class="que_con">
											마켓플랜트  쇼핑몰과 제휴를 <br>
											맺은 카드로 카드 청구할인, 캐쉬백 등 <br>
											다양한 혜택이 있습니다.
										</dd>									
									</dl>

									<p class="card">
										<span class="tx">마켓플랜트 삼성카드 <strong><fmt:formatNumber value="${samCardPrice }" groupingUsed="true" /><span class="tx_won">원</span></strong></span>
										<span class="tx">마켓플랜트 롯데카드 <strong><fmt:formatNumber value="${rotCardPrice }" groupingUsed="true" /><span class="tx_won">원</span></strong></span>
									</p>
								</li>
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
								<li class="li_card_benefit">
								<span class="ti">카드 혜택</span>
								<p class="icoBox">
									<ui:replaceLineBreak content="${productInfo.PRD_MST_CRD_ICON }"/>
								</p>
								<!-- .que_box S -->
								<div class="que_box">
									<c:if test="${not empty cardEvenFreetList }">
									<dl class="que_lay"><!-- 무이자할부 S -->
										<dt class="que_ti">
											<strong class="blind">무이자할부혜택안내 레이어</strong>
											<i class="ico_ar"></i>
										</dt>
										<dd class="que_con">
											<p class="tx_list">
												<strong><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월 무이자 혜택안내</strong>
												<span><i>*</i> 무이자 할부는 결제 금액 기준으로 적용됩니다.</span>
												<span><i>*</i> 일부 개월수 제외 (주문서에서 확인가능)</span>
											</p>
											<table>
												<caption>카드사, 금액대별 무이자로 구성된 표</caption>
												<colgroup>
												<col style="width:130px" />
												<col />
												</colgroup>
												<tbody>
													<c:forEach var="row" items="${cardEvenFreetList }" varStatus="i">
														<c:if test="${row.DIV_INF_GBN eq Code.CARD_DIV_TYPE_FREE_INTEREST}">
															<tr>
																<td class="f"><span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></td>
																<td class="l">
																	<strong><c:out value="${row.DIV_DTL_PRC }" />만원 ↑</strong>
																	<span>(<c:out value="${row.DIV_INF_MNT }" /> 개월 무이자 할부)</span>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</tbody>
											</table>
											<c:if test="${c_card_div_type_free_interst_cnt > 0 }">
												<p class="tx_list">
													<strong><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월 부분이자/특별무이자 혜택안내</strong>
												</p>
												<table>
													<caption>카드사, 금액대별 무이자로 구성된 표</caption>
													<colgroup>
													<col style="width:130px" />
													<col />
													</colgroup>
													<tbody>
														<c:forEach var="row" items="${cardEvenFreetList }" varStatus="i">
															<c:if test="${row.DIV_INF_GBN ne Code.CARD_DIV_TYPE_FREE_INTEREST}">
																<tr>
																	<td class="f"><span class="card card-${row.DIV_DTL_CD}"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></td>
																	<td class="l">
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
										</dd>									
									</dl><!-- 무이자할부 E -->
									</c:if>
									<!-- 할인혜택 S -->
									<dl class="que_lay">
										<dt class="que_ti">
											<strong class="blind">할인혜택 레이어</strong>
											<i class="ico_ar"></i>
										</dt>
										<dd class="que_con">
											<p class="tx_list">
												<strong><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월 무이자 혜택안내</strong>
											</p>

											<dl class="tab_box">
												<dt class="tab_mn">
													<a href="javascript:void(0)" data-tabcon="tab_con01" class="on"><span>청구할인</span></a>
													<a href="javascript:void(0)" data-tabcon="tab_con02"><span>캐쉬백</span></a>
													<a href="javascript:void(0)" data-tabcon="tab_con03"><span>포인트선할인</span></a>
												</dt>
												<dd id="tab_con01" class="tab_con">
													<table>
														<caption>청구할인에 카드사, 금액대별 무이자로 구성된 표</caption>
														<colgroup>
														<col style="width:130px" />
														<col />
														</colgroup>
														<tbody>
															<c:choose>
                            									<c:when test="${c_promotion_charge_cnt gt 0 }">
                            										<c:forEach var="row" items="${cardPromotionList }">
		                                								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CHARGE }">
		                                									<tr>
																				<td class="f"><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></td>
																				<td class="l">
																					<strong>
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
                            									</c:when>
                            									<c:otherwise>
                            										<tr>
                            											<td colspan=2>진행중인 신용카드 혜택이 없습니다.</td>
                            										</tr>
                            									</c:otherwise>
                            								</c:choose>
														</tbody>
													</table>
												</dd>
												<dd id="tab_con02" class="tab_con">
													<table>
														<caption>캐쉬백에 카드사, 금액대별 무이자로 구성된 표</caption>
														<colgroup>
														<col style="width:130px" />
														<col />
														</colgroup>
														<tbody>
															<c:choose>
                            									<c:when test="${c_promotion_cashbag_cnt gt 0 }">
                            										<c:forEach var="row" items="${cardPromotionList }">
		                                								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_CASHBAG }">
		                                									<tr>
																				<td class="f"><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></td>
																				<td class="l">
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
                            									</c:when>
                            									<c:otherwise>
                            										<tr>
                            											<td colspan=2>진행중인 신용카드 혜택이 없습니다.</td>
                            										</tr>
                            									</c:otherwise>
                            								</c:choose>
														</tbody>
													</table>
												</dd>
												<dd id="tab_con03" class="tab_con">
													<table>
														<caption>포인트선할인에 카드사, 금액대별 무이자로 구성된 표</caption>
														<colgroup>
														<col style="width:130px" />
														<col />
														</colgroup>
														<tbody>
															<c:choose>
                            									<c:when test="${c_promotion_point_dc_cnt gt 0 }">
                            										<c:forEach var="row" items="${cardPromotionList }">
		                                								<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_DC }">
		                                									<tr>
																				<td class="f"><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></td>
																				<td class="l">
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
                            									</c:when>
                            									<c:otherwise>
                            										<tr>
                            											<td colspan=2>진행중인 신용카드 혜택이 없습니다.</td>
                            										</tr>
                            									</c:otherwise>
                            								</c:choose>
														</tbody>
													</table>
												</dd>
											</dl>

										</dd>									
									</dl><!-- 할인혜택 E -->

									<!-- 포인트적립 S -->
                            		<c:if test="${c_promotion_point_save_cnt gt 0 }">
										<dl class="que_lay">
											<dt class="que_ti">
												<strong class="blind">포인트적립 레이어</strong>
												<i class="ico_ar"></i>
											</dt>
											<dd class="que_con">
												<p class="tx_list">
													<strong><c:out value="${cardEvenFreetList[0].THIS_MONTH }" />월 무이자 혜택안내</strong>
												</p>
												<table>
													<caption>카드사, 금액대별 포인트적립으로 구성된 표</caption>
													<colgroup>
													<col style="width:130px" />
													<col />
													</colgroup>
													<tbody>
														<c:forEach var="row" items="${cardPromotionList }">
		                                					<c:if test="${row.CRD_PMT_GBN eq Code.CARD_EVENT_TYPE_POINT_SAVE }">
		                                						<tr>
																	<td class="f"><span class="card card-${row.PMT_CRD_IDX }"><em class="blind"><c:out value="${row.CARD_NM }"/></em></span></td>
																	<td class="l">
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
											</dd>									
										</dl><!-- 포인트적립 E -->
									</c:if>
								</div>
								<!--// .que_box E -->
							</li>
							<c:if test="${userInfo.MEM_MST_MEM_GBN ne '683' }">
									<li class="li_mileage">
										<span class="ti">
											포인트
											<a href="javascript:void(0);" class="ico_question"><span class="blind">포인트 안내 보기</span></a>
										</span>
										<dl class="que_lay">
											<dt class="que_ti">
												<strong>포인트</strong>
												<i class="ico_ar"></i>
											</dt>
											<dd class="que_con">
												상품금액 및 회원등급에 따라 적립되는 포인트로<br/>
												적립된 포인트는 상품 구매시 현금과 동일하게 <br/>
												사용하실 수 있습니다.<br/><br/>
												<p class="tx_list">
													<span><i>-</i> 상품 구매시 회원등급별로 적립율로 적립됩니다.</span>
													<span><i>-</i> 최종결제금액에 따라 적립포인트는 변동될 수 있습니다.</span>
													<span><i>-</i> 간편회원과 기업회원은 포인트가 적립되지 않습니다.</span>
													<span><i>-</i> 당사 사정에 의해 변경될 수 있습니다.</span>
												</p>
											</dd>									
										</dl>
		
										<span class="tx"><fmt:formatNumber value="${productInfo.PRD_MST_MIL }" groupingUsed="true" /><span class="tx_won">P</span></span>
									</li>
									<li class="li_okCash">
										<span class="ti">
											OK캐시백
											<a href="javascript:void(0);" class="ico_question"><span class="blind">OK캐시백 안내 보기</span></a>
										</span>
										<dl class="que_lay">
											<dt class="que_ti">
												<strong>OK캐시백 안내</strong>
												<i class="ico_ar"></i>
											</dt>
											<dd class="que_con">
												최종결제금액에 따라 0.24%의 비율로 OK캐쉬백 <br/>
												포인트로 적립되어 상품 구매 시 현금과 동일하게 <br/>
												사용하실 수 있습니다. <br/><br/>
												<p class="tx_list">
													<span><i>-</i> 최종결제금액에 따라 적립포인트는 변동될 수 있습니다. </span>
													<span><i>-</i> 간편회원과 기업회원은 OK캐쉬백 포인트가 적립되지 않습니다. </span>
													<span><i>-</i> 당사 사정에 의해 변경될 수 있습니다.</span>
												</p>
											</dd>									
										</dl>
		
										<span class="tx"><fmt:formatNumber value="${productInfo.PRD_MST_CASH }" groupingUsed="true" /><span class="tx_won">포인트</span></span>
									</li>
								</c:if>
								<c:choose>
									<c:when test="${productInfo.PRD_MST_VDR_YN eq 'Y' }">
										<li class="li_delivInfo li_br">
											<span class="ti">
												배송비/배송정보
												<a href="javascript:void(0);" class="ico_question"><span class="blind">배송비/배송정보 안내 보기</span></a>
											</span>
											<dl class="que_lay">
												<dt class="que_ti">
													<strong>파트너 배송정보</strong>
													<i class="ico_ar"></i>
												</dt>
												<dd class="que_con">
													<p class="tx_list">
														본 상품은 업체에서 배송되는 상품입니다. <br/>
														업체 배송정책에  따라  배송기사가 직접 배송하거나, 택배로<br/>
														발송될 수 있습니다.
													</p>
			
													<hr />
			
													<p class="tx_list">
														<strong>업체직접배송</strong>
														<span><i>-</i> 업체 사정에 의해 상품수량이 부족하여 배송이 지연될 <br/>수 있습니다.</span>
														<span><i>-</i> 도서/산간지역의 경우 익일 배송이 불가능할 수 있으며, <br/> 제주도는 추가배송비 5,000원이 발생합니다. </span>
														<span><i>-</i> 배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다. <br/>   이 경우 별도로 연락을 드립니다.</span>
													</p>
			
													<hr />
			
													<p class="tx_list">
														<strong>업체택배배송</strong>
														<span><i>-</i> 택배 배송상품은 결제 후, 2~3일의 배송기간이 소요됩니다. </span>
														<span><i>-</i> 배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다. </span>
													</p>
			
													<hr />
			
													<p class="tx_list">
														<strong>배송비부과</strong>
														<span><i>-</i> 상품 개별 배송비가 원칙이며, 묶음배송이 가능한 상품에 <br/>한해 묶음배송비가 적용됩니다. </span>
													</p>
												</dd>									
											</dl>
			
											<span class="tx">
												<c:choose>
													<c:when test="${productInfo.PRD_MST_DLV_FEE > 0 }">
														<fmt:formatNumber value="${productInfo.PRD_MST_DLV_FEE }" groupingUsed="true" /><span class="tx_won">원</span>
													</c:when>
													<c:otherwise>
														무료
													</c:otherwise>
												</c:choose>
												/파트너 직접 배송  
											</span>
										</li>
									</c:when>
									<c:otherwise>
										<li class="li_delivInfo li_br">
											<span class="ti">
												배송비/배송정보
												<a href="javascript:void(0);" class="ico_question"><span class="blind">배송비/배송정보 안내 보기</span></a>
											</span>
											<dl class="que_lay">
												<dt class="que_ti">
													<strong> 배송정보 안내</strong>
													<i class="ico_ar"></i>
												</dt>
												<dd class="que_con">
													본 상품은 배송지와 가까운 마켓플랜트 물류센터에서 배송되는 <br/>
													상품입니다. 물류재고 사정에 따라 일부 상품에 한해 <br/>
													배송기사가 직접 배송하거나, 택배로 발송될 수 있습니다.  <br/><br/>
													<p class="tx_list">
														<span><i>-</i> 주문시 희망배송일을 신청할 수 있습니다.  (일부상품 제외)</span>
														<span><i>-</i> 도서/산간지역의 경우 익일 배송이 불가능할 수 있으며, <br/>   제주도는 추가배송비 5,000원이 발생합니다. </span>
														<span><i>-</i> 배송지역에 따라 배송이 불가능한 상품이 있을 수 있습니다. <br/>   이 경우 별도로 연락을 드립니다.</span>
													</p>
			
													<hr />
			
													<p class="tx_list">
														<strong>배송비 부과</strong>
														<span><i>-</i> 상품 개별 배송비가 원칙이며, 묶음배송이 가능한 상품에<br/>   한해 묶음배송비가 적용됩니다.</span>
													</p>
												</dd>									
											</dl>
			
											<span class="tx">
												<c:choose>
													<c:when test="${productInfo.PRD_MST_DLV_FEE > 0 }">
														<fmt:formatNumber value="${productInfo.PRD_MST_DLV_FEE }" groupingUsed="true" /><span class="tx_won">원</span>
													</c:when>
													<c:otherwise>
														무료
													</c:otherwise>
												</c:choose>
												/ 배송 
											</span>
										</li>
									</c:otherwise>
								</c:choose>
								<li class="li_brand">
									<span class="ti">브랜드</span>
									<span class="tx"><c:out value="${productInfo.PRD_MST_BRAND_NM }" /> <a href="javascript:void(0);" class="btn_st3"><span>브랜드 상품보기</span></a></span>
								</li>
								<li class="li_comNum li_br">
									<span class="ti">상품번호</span>
									<span class="tx"><c:out value="${productInfo.PRD_MST_CD }" /></span>
								</li>
								<c:if test="${commandMap.optionMstEstCount eq 0 }">
									<input type="hidden" class="selectedPrdOpt_0" name="OPT_DTL_IDXs" value="0"/>
									<input type="hidden" name="PRD_DTL_PRCs" id="PRD_DTL_PRCs" value = "<c:out value="${productInfo.PRD_MST_PRICE}" />" />
									<input type="hidden" class="selectedPrdOpt_0" name="OPT_PRD_PRCs" value="0"/>
									<li class="li_amount">
										<span class="ti">구매수량</span>
										<label for="inp_amount" class="inp_amount">
											<input type="text" value="1" id="REQUEST_CNT_0" name="REQUEST_CNT_0"  maxlength=4 />
											<a href="javascript:;" id="upPrdMstCnt" class="btn_valU"><span class="blind">구매수량 1 올리기</span></a>
											<a href="javascript:;" id="dnPrdMstCnt" class="btn_valB"><span class="blind">구매수량 1 내리기</span></a>
										</label>
									</li>
								</c:if>
								<c:if test="${not empty optionMstList }">
									<c:set var="optMstNum" value="1" />
									<c:forEach var="optionMstList" items="${optionMstList }" varStatus="status">
										<c:set var="subcnt" value="1" />
										<c:set var="optMstIdx" value="${optionMstList.PRD_OPT_IDX }" />
										<c:if test="${subcnt == 1 }">
											<li class="li_option">
										</c:if>
										<c:choose>
											<c:when test="${optMstNum == 1 }">
												<span class="ti"><c:out value="${optionMstList.PRD_OPT_EST_NM }" /></span>
												<p class="tx_ex">상품옵션을 선택해주세요.</p>
											</c:when>
											<c:otherwise>
												<c:if test="${optMstEstYn ne optionMstList.PRD_OPT_EST_YN }" >
													<span class="ti"><c:out value="${optionMstList.PRD_OPT_EST_NM }" /></span>
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
											</li>
										</c:if>
										<c:set var="optMstNum" value="${optMstNum + 1 }" />
									</c:forEach>
								</c:if>
								<c:if test="${not empty optionMstList }">
								<li class="li_selList" id="applyOptionChoiceList" style="display:none;">
									
								</li>
								</c:if>
								<c:if test="${commandMap.optionMstEstCount > 0 }">
								<li class="li_totalArea">
									<span class="tx">구매예정가</span>
									<strong><span id="addPrdMstPrcTxt">
									<c:choose>
										<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
											<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" />
										</c:otherwise>
									</c:choose>
									</span><span class="tx_won">원</span></strong>
								</li>
								</c:if>
								<c:if test="${productInfo.PRD_MST_SEL_STATE eq 'T' || productInfo.PRD_MST_SEL_STATE eq 'O' }">
								<c:if test="${productInfo.PRD_MST_O2O_YN eq 'Y'}">
								<li class="li_getiMsg">
									<span>겟잇나우로만 주문할 수 있습니다.</span>
								</li>
								</c:if>
								</c:if>
								<c:if test="${productInfo.PRD_MST_LNG_DIV_YN eq 'Y'}">
								<li class="li_longAllo">
									<span class="ti">								
										장기할부 안내
										<a href="javascript:void(0);" class="ico_question"><span class="blind">장기할부 안내 보기</span></a>
									</span>
									<dl class="que_lay">
										<dt class="que_ti">
											<strong>장기할부 안내</strong>
											<i class="ico_ar"></i>
										</dt>
										<dd class="que_con">
											<p class="tx_list">
												<span>본 상품은 신용카드에 한하여 무이자 장기할부 결제가<br/>
												가능하며, 동일한 할부 개월 혜택에 한하여 장바구니 <br/>
												통합 결제가 진행됩니다.</span><br/>
	
												<span class="co_red"><i>-</i> 당월 기준 무이자 장기할부 결제 카드사 <br/>
												   : 삼성카드, 롯데카드, 신한카드<br/>
												   <c:if test="${not empty lngDivCardNms24 }">
												     ※ 24개월 : <c:out value="${lngDivCardNms24.CRD_INF_NM }"/><br/>
												   </c:if>
												   <c:if test="${not empty lngDivCardNms36 }">
												     ※ 36개월 : <c:out value="${lngDivCardNms36.CRD_INF_NM }"/>
												   </c:if>
												</span><br/>
	
												<span><i>-</i> 장기할부 결제 정책은 당사 사정에 의하여 변경될 수 있습니다.</span>
											</p>
	
										</dd>									
									</dl>
	
									<div class="inp_box">
										<c:if test="${productInfo.PRD_MST_LNG_DIV_MNT1 ne 0 }">
											<label for="MEM_CRT_LNG_DIV1" class="js-radio inp_radio">
												<input type="radio" name="MEM_CRT_LNG_DIV" id="MEM_CRT_LNG_DIV1" value="<c:out value="${productInfo.PRD_MST_LNG_DIV_MNT1 }" />" />
												<span><strong class="co_red"><c:out value="${productInfo.PRD_MST_LNG_DIV_MNT1 }" /></strong>개월 구매시 월 청구예상금액 
												<strong class="co_red" id="addPrdMstLngDivMnt1PrcTxt">
													<c:choose>
														<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
															<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />
														</c:when>
														<c:otherwise>
															<fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" />
														</c:otherwise>
													</c:choose>
												</strong>원</span>
											</label>
										</c:if>
										<c:if test="${productInfo.PRD_MST_LNG_DIV_MNT2 ne 0 }">
										<label for="MEM_CRT_LNG_DIV2" class="l js-radio inp_radio">
											<input type="radio" name="MEM_CRT_LNG_DIV" id="MEM_CRT_LNG_DIV2" value="<c:out value="${productInfo.PRD_MST_LNG_DIV_MNT2 }" />" />
											<span><strong class="co_red"><c:out value="${productInfo.PRD_MST_LNG_DIV_MNT2 }" /></strong>개월 구매시 월 청구예상금액 
											<strong class="co_red" id="addPrdMstLngDivMnt2PrcTxt">
												<c:choose>
													<c:when test="${not empty productTimeSaleInfo || not empty productOneDayInfo}">
														<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />
													</c:when>
													<c:otherwise>
														<fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" />
													</c:otherwise>
												</c:choose>
											</strong>원</span>
										</label>
										</c:if>
									</div>
								</li>
								</c:if>
								<li class="li_btnBox2">
									<c:choose>
										<c:when test="${commandMap.esmCart eq 'T' }">
											<a href="javascript:inertEsmCart('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_st2 btn_blk555 f"><strong>견적담기</strong></a>
										</c:when>
										<c:when test="${commandMap.esmCart eq 'theme' }">
											<a href="javascript:optChoice('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_st2 btn_blk555 f"><strong>옵션선택</strong></a>
										</c:when>
										<c:when test="${productInfo.PRD_MST_SEL_STATE eq 'I'}">
											<c:choose>
												<c:when test="${productInfo.PRD_MST_IVB_YN eq 'Y' }">
													<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_st2 btn_rd f"><strong>상담예약</strong></a>
													<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_st2 btn_blk555"><strong>장바구니</strong></a>
												</c:when>
												<c:otherwise>
													<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_st2 btn_rd f"><strong>바로구매</strong></a>
													<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_NORMAL_CD }" />');" class="btn_st2 btn_blk555"><strong>장바구니</strong></a>
												</c:otherwise>
											</c:choose>
											<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_st2 btn_rd_l"><i class="ico_keep"></i><strong>키핑</strong></a>
											<!-- <a href="javascript:void(0)" class="btn_st2 btn_white l"><i class="ico_chat"></i><span>채팅상담</span></a> -->
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${productInfo.PRD_MST_SEL_STATE eq 'T'}">
													<a href="javascript:void(0)" class="btn_st4 btn_rd"><i class="ico_chat"></i><span>SOLD OUT</span></a>
													<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_st2 btn_rd_l"><i class="ico_keep"></i><strong>키핑</strong></a>
													<!-- <a href="javascript:void(0)" class="btn_st2 btn_white l"><i class="ico_chat"></i><span>채팅상담</span></a> -->
												</c:when>
												<c:otherwise>
													<a href="javascript:void(0)" class="btn_st4 btn_blk f"><i class="ico_chat"></i><span>일시품절</span></a>
													<a href="javascript:insertKeeping('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_st2 btn_rd_l"><i class="ico_keep"></i><strong>키핑</strong></a>
													<!-- <a href="javascript:void(0)" class="btn_st2 btn_white l"><i class="ico_chat"></i><span>채팅상담</span></a> -->
												</c:otherwise>
											</c:choose>
										
										</c:otherwise>
									</c:choose>
								</li>
								<li class="li_banner">
									<c:if test="${productInfo.PRD_MST_O2O_YN eq 'Y'}">
										<a href="javascript:getPrdStorePop();"><img src="<c:out value="${cdnDomain}"/>/pc/img/btn/btn_getitNow_s.jpg" alt="Get it NOW 온라인에서 구매하고 매장에서 찾아요! 겟잇나우로 구매"></a>
									</c:if>
									<c:if test="${productInfo.PRD_MST_LNG_DIV_YN eq 'Y'}">
										<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_LONG_INS_CD }" />');"><img src="<c:out value="${cdnDomain}"/>/pc/img/btn/btn_plan_s.jpg" alt="장기할부NOW 경제적 부담은 줄이고 생활의 편의를 누려라! 장기할부로 구매"></a>
									</c:if>
									<a href="javascript:goProductDetail('<c:out value="${productInfo.PRD_MST_CD}" />');" class="btn_dtPg"><strong>상품상세보기</strong></a>
								</li>
							</ul>

						</div><!--// .pr_info E -->
					</fieldset>
					</form>
					<!--// .pr_detail E -->
				</li>
			</ul>
		<!-- #laypop S -->
		<%@ include file="/WEB-INF/jsp/pc/product/productLayer.jsp" %>
		<!--// #laypop E -->
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

</section>
<!--// #wrap E -->
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="optionChoiceTemplate" type="text/x-jquery-tmpl">
<p class="optionDtl">
	<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value = "\${OPT_DTL_IDX}" />
	<input type="hidden" name="OPT_DTL_CNTs" id="OPT_DTL_CNTs" value = "\${OPT_DTL_STK_CNT}" />
	<input type="hidden" name="OPT_PRD_PRCs" id="OPT_PRD_PRCs" value = "\${OPT_PRD_PRC}" />
	<input type="hidden" name="PRD_OPT_EST_YNs" id="PRD_OPT_EST_YNs" value = "\${PRD_OPT_EST_YN}" />
	<input type="hidden" name="PRD_DTL_PRCs" id="PRD_DTL_PRCs" value = "0" />
	<input type="hidden" name="OPT_PRCs" id="OPT_PRcs" value = "\${OPT_PRC}" />
	<span class="tx_1">
	{{if PRD_OPT_EST_YN == 'Y'}}
		<i class="ico_ch"><span class="ir">[선택]</span></i>
	{{/if}}
		{{html OPT_TITLE}}(\${OPT_DTL_ADD_PRC})
	</span>
	{{if PRD_OPT_CNT_YN == 'Y'}}
		<label for="inp_amount2" class="inp_amount">
			<span class="blind">구매수량 변경</span>
			<input type="text" value="1" id="REQUEST_CNT_\${OPT_DTL_IDX}" name="REQUEST_CNT_\${OPT_DTL_IDX}" style="width:30px;" maxlength=4 />
			<a href="javascript:void(0)" id="upOptDtlCnt" class="btn_valU"><span class="blind">구매수량 1 올리기</span></a>
			<a href="javascript:void(0)" id="dnOptDtlCnt" class="btn_valB"><span class="blind">구매수량 1 내리기</span></a>
		</label>
	{{else}}
		<input type="hidden" value="1" id="REQUEST_CNT_\${OPT_DTL_IDX}" name="REQUEST_CNT_\${OPT_DTL_IDX}" style="width:30px;" />
		<span class="tx_2">1개</span>
	{{/if}}
	<span class="tx_3">\${OPT_PRD_PRICE}원</span>
	<a href="javascript:;" id="optionDtlDel" class="btn_del2"><span class="blind">현제 옵션 삭제</span></a>
</p>
</script>
<script type="text/javascript">

$(function(){
	//말풍선
	var _info = $('.pr_info .info_list > li'),
		info_lay = _info.children('.que_lay'),//타이틀에 말풍선
		card_benefit_ico = $('.pr_info .info_list .li_card_benefit .icoBox span'),
		benefit_lays = _info.find('.que_box .que_lay');//카드혜택안에 말풍선
	
	//타이틀 말풍선
	$.each(info_lay, function(){
		var _this = $(this);
		_this.prev('.ti').on('mouseenter', function(){
			_this.show();
		}).on('mouseleave', function(){
			_this.hide();
		});
	});

	//tab
	com.tab($('.li_card_benefit .que_lay .tab_mn'), 0);//레이어팝업안에 tab(카드 혜택 > 할인혜택)

	//카드혜택 말풍선
	var _enter_db = [0, 0],
		_thisLay, _setCl;
	card_benefit_ico.on({
		mouseenter : function(){
			var _this = $(this),
				_idx = _this.data('idx'),
				_x = _this.offset().top,
				_h = _this.outerHeight(true),
				_parent = _this.parent(),
				_p_x = _parent.offset().top,
				_que_x = benefit_lays.parent().offset().top,
				
				_css_top = (_p_x-_que_x)+(_h+(_x-_p_x))+2;
			
			_enter_db[0] = 1;
			benefit_lays.hide();
			_thisLay = benefit_lays.eq(_idx);

			//레이어
			_thisLay.show().css({position:'absolute', top: _css_top});
			_thisLay.on({
				mouseenter : function(){
					_enter_db[1] = 1;
				},
				mouseleave : function(){
					_enter_db[1] = 0;
					_closeLay(_thisLay);
				}
			});
		},
		mouseleave : function(){
			_enter_db[0] = 0;
			_closeLay(_thisLay);			
		}
		
	});
	function _closeLay(_idx){//_idx = 닫아야하는 레이어
		if(_setCl != undefined) clearTimeout(_setCl);

		_setCl = setTimeout(function(){
			if($.inArray(1, _enter_db) == -1) _idx.hide();
		}, 200);		
	}
	
	//별점
	var _ico_star = $('.ico_star_an'),
		_ico_star_ch = _ico_star.children(),
		data_width = _ico_star_ch.data('width'),
		css_width = 0;

	switch(data_width){
		case 00 : css_width = 0;
				  break;
		case 05 : css_width = 8;
				  break;
		case 1 : css_width = 16;
				  break;
		case 15 : css_width = 25;
				  break;
		case 2 : css_width = 33;
				  break;
		case 25 : css_width = 42;
				  break;
		case 3 : css_width = 50;
				  break;
		case 35 : css_width = 60;
				  break;
		case 4 : css_width = 68;
				  break;
		case 45 : css_width = 77;
				  break;
		case 5 : css_width = 85;
				  break;
	}
	_ico_star_ch.width(0).animate({width: css_width}, 1500);
	
	$(document).on("click","select[id=getoptDtlCho]" , function(){
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
			
			var prdMstPrc 	= $("#PRD_MST_PRICE").val();
			var prdPrc		= $("#PRD_PRC").val();
			
			if(!isbreak){
				obj = new Object();
				obj.PRD_OPT_NM = myArray[0];	//옵션 마스터 옵션명
				obj.OPT_DTL_NM = myArray[1];	//옵션 상세터 옵션명
				obj.OPT_DTL_IDX = myArray[2];	//옵션 상세 Idx
				obj.OPT_DTL_ADD_PRC = myArray[3];	//옵션 추가가격
				obj.OPT_DTL_STK_CNT = myArray[4];	//옵션 수량
				
				obj.PRD_OPT_EST_YN = myArray[5];	//필수옵션 Y / 선택옵션 N
				obj.PRD_OPT_CNT_YN = myArray[6];	//수량선택옵션 Y / 선택옵션 N
				var prdOptPrice = 0;
				var prdOptPrc	= 0;
				
				if(obj.PRD_OPT_EST_YN == "Y"){
					obj.OPT_TITLE = obj.PRD_OPT_NM + ":" + obj.OPT_DTL_NM;
					prdOptPrice = parseInt(prdMstPrc) + parseInt(obj.OPT_DTL_ADD_PRC);
					prdOptPrc	= parseInt(prdPrc) + parseInt(obj.OPT_DTL_ADD_PRC);
				}else{
					obj.OPT_TITLE = "<span class=\"co_blue\">[선택]</span>" + obj.PRD_OPT_NM + ":" + obj.OPT_DTL_NM;
					prdOptPrice = parseInt(obj.OPT_DTL_ADD_PRC);
					prdOptPrc	= parseInt(obj.OPT_DTL_ADD_PRC);
				}
				
				obj.OPT_PRD_PRICE = setComma(prdOptPrice);
				obj.OPT_PRD_PRC = prdOptPrice;
				obj.OPT_PRC		= prdOptPrc;
				
				if(obj.OPT_DTL_STK_CNT < 1){
					alert("해당 옵션은 재고가 없습니다.");
					return false;
				}
				
				arrayObj.push(obj); //만들어진  object를 배열에 추가
	
				$( "#optionChoiceTemplate" ).tmpl( arrayObj ).appendTo( "#applyOptionChoiceList" );
				setTotalPrice(); //금액 계산
			}
		}
	});
	//옵션 삭제
	$(document).on("click","#optionDtlDel",function(){
		var $this = $(this).parent(".optionDtl");
		$this.remove();
		if($("#applyOptionChoiceList").find(".optionDtl").length == 0){
			$("#applyOptionChoiceList").hide();
		}
		setTotalPrice();
	});
	//옵션수량 증가
	$(document).on("click","#upOptDtlCnt",function(){
		
		var $this = $(this).parent("label").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("input[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("input[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		var $optDtlCnt = $this.find("input[name=OPT_DTL_CNTs]").val();	//재고
		if($optDtlCnt < parseInt($optUpCnt) + 1){
			alert("옵션의 재고수량은 총["+$optDtlCnt+"] 입니다.");
			return;
		}else{
			$optUpObj.val(parseInt($optUpCnt) + 1);
		}
		setTotalPrice();
	});
	//옵션수량 감소
	$(document).on("click","#dnOptDtlCnt",function(){
		var $this = $(this).parent("label").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("input[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("input[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		
		if($optUpObj.val() - 1 < 1){
			alert("옵션의 최하 수량은 1입니다.");
			$optUpObj.val(1);
		}else{
			$optUpObj.val(parseInt($optUpCnt) - 1);
		}
		setTotalPrice();
	});
	$(document).on("focusout","input[name^=REQUEST_CNT]",function(){
		var $this = $(this).parent("label").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("input[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("input[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		var $optDtlCnt = $this.find("input[name=OPT_DTL_CNTs]").val();	//재고
		
		if($optUpObj.val() < 1){
			alert("옵션의 최하 수량은 1 입니다.");
			$optUpObj.val(1);
		}else if($optDtlCnt < parseInt($optUpCnt)){
			alert("옵션의 재고수량은 총["+$optDtlCnt+"] 입니다.");
			$optUpObj.val(1);
		}
		setTotalPrice();
		
	});
	//주 상품수량 증가
	$(document).on("click","#upPrdMstCnt",function(){
		var prdMstSelCnt = $("#PRD_MST_SEL_CNT").val();	//상품재고
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량

		if(parseInt(prdMstSelCnt) < parseInt(buyPrdCnt) + 1){
			alert("해당 상품 재고["+prdMstSelCnt+"] 입니다.");
		}else{
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) + 1);	//수량 증가
		}
		
		setTotalPrice();
	});
	//주 상품수량 감소
	$(document).on("click","#dnPrdMstCnt",function(){
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량

		if(parseInt(buyPrdCnt) - 1 < 1){
			alert("상품의 최하 수량은 1 입니다.");
			$("#REQUEST_CNT_0").val(1);
		}else{
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) - 1);	//수량 감소
		}
		
		setTotalPrice();
	});
	//주 상품수량 임의변경
	$(document).on("focusout","#REQUEST_CNT_0",function(){
		var prdMstSelCnt = $("#PRD_MST_SEL_CNT").val();	//상품재고
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
		
		if(parseInt(prdMstSelCnt) < parseInt(buyPrdCnt)){
			alert("해당 상품 재고["+prdMstSelCnt+"] 입니다.");
			$("#REQUEST_CNT_0").val(1);
		}else if(parseInt(buyPrdCnt) < 1){
			alert("상품의 최하 수량은 1 입니다.");
			$("#REQUEST_CNT_0").val(1);
		}
		
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
		var prdPrc = <c:out value="${productInfo.PRD_MST_PRC}" />;
		var totPrice	= 0;
		var addPrc		= 0;
		var sumPrc		= 0;
		
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
			optSelCnt = $("input[name=REQUEST_CNT_"+optDtlIdx+"]").val();	//해당 옵션의 선택 수량
			optPrc		= $("input[name=OPT_PRCs]").eq(idx).val();			
			
			if(buyPrdCnt > 0){//옵션 마스터의 필수옵션이 없을 때(주 상품 수량)
				if(idx == 0){
					addPirce = parseInt(prdMstPrc) * parseInt(buyPrdCnt);
					addPrc	= parseInt(prdPrc) * parseInt(buyPrdCnt);
				}else{
					addPirce = parseInt(optPrdPrc) * parseInt(optSelCnt);
					addPrc	= parseInt(optPrc) * parseInt(optSelCnt);
				}
			}else{
				addPirce = parseInt(optPrdPrc) * parseInt(optSelCnt);
				addPrc	=  parseInt(optPrc) * parseInt(optSelCnt);
			}
			
			prdDtlPrcs.val(addPirce);
			sumPrc	+= addPrc;
		});

		//옵션에 가격 총 계산
		$("input[name=PRD_DTL_PRCs]").each(function(){
			totPrdPrice = parseInt(totPrdPrice) + parseInt($(this).val());
			totPrice	= sumPrc;
		});
		
		if(totPrdPrice == 0){
			totPrdPrice = prdMstPrc;
			totPrice	= prdPrc;
		}else{
			if(prdOptEstCnt < 1 && buyPrdCnt < 1){//선택한 옵션의 필수 옵션 여부
				totPrdPrice = parseInt(prdMstPrc) + parseInt(totPrdPrice);
				totPrice	= parseInt(prdPrc) + parseInt(sumPrc);
			}
		}
		
		//무이자 금액 계산
		var DsCntPrice1 = Math.round(parseInt(totPrdPrice) / 24);
		var DsCntPrice2 = Math.round(parseInt(totPrdPrice) / 36);

		$("#TOT_PRD_MST_PRC").val(totPrdPrice);	//결제금액 input
		$("#TOT_PRD_PRC").val(totPrice);	//결제금액 input
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
		
		var crtMemCrtDlvGbn = memCrtDlvGbn == "" ? 2096 : memCrtDlvGbn;
		
		if(memCrtDlvGbn == "2099"){
			if($(':input:radio[name=MEM_CRT_LNG_DIV]:checked').length == 0){
				alert("장기할부로 구매 시 무이자 개월수를 선택 해주셔야 합니다.");
				$(':input:radio[name=MEM_CRT_LNG_DIV]').eq(0).focus();
				return;
			}
			
			if(memId == ""){
				opener.simpleGoLogin();
	        	self.close();
	        	return;
			}
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
				alert("필수 옵션을 선택해주세요.");
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
	            url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
	            success : function (data) 
	            { 
	            	// 1 : 장바구니 등록 성공
	            	switch(data.result){
	            	case 1:
	            		$("#topCartCnt").html(data.cartCnt);
	            		if($("#MEM_CRT_DLV_GBN").val() == 2099){
	            			$("#mntText").html($(':input:radio[name=MEM_CRT_LNG_DIV]:checked').val());
	            			com.laypop('show',0,'laypopMnt');//팝업 show
	            		}else if($("#MEM_CRT_DLV_GBN").val() == 2098){//클린킹
	            			com.laypop('show',0,'laypopCleanKing');//팝업 show
	            		}else{
	            			com.laypop('show',0,'laypopCart');//팝업 show
	            		}
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
	setPaymentData = function()
	{
		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
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
				alert("필수 옵션을 선택해주세요.");
				cartResult = false;
				return;
			}
		}
		//구매예정가 금액 다시 계산
		setTotalPrice();
		if(cartResult){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : $("#cartForm").serialize(),
	            url : "<c:out value="${frontDomain}" />/pc/cart/insertDirectPurchaseAjax.do",
	            success : function (data) 
	            { 
					switch (data.result) {
					case 1:
						$('#cartForm').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
						$('#cartForm').attr("method","post");
						<c:choose>
						<%-- 1. 비회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
						//$('#paymentform').attr('action','<c:out value="${serverDomain}" />/pc/cart/cartLogin.do').submit();
						opener.simplePayCart(data.ORD_MST_CD);
			        	self.close();
						</c:when>
						<%-- 2. 회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'user'}">
						opener.parent.name = opener.parent.name || "opener_parent"; 
						$('#cartForm').attr({"action":"<c:out value="${serverDomain}" />/pc/cart/cartpayment.do","target":opener.parent.name}).submit();
						self.close();
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
	
	// 관심등록
	insertKeeping = function(prdMstCd){
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"PRD_MST_CD" : prdMstCd
			},
			url : "<c:out value="${frontDomain}" />/pc/cart/insertInterestProductAjax.do",
			success : function(data) {
				var result = data.result;//0:로그인 필요 1:성공 -1:실패
				if(result == 0){
					//if(confirm(data.resultMsg)){
					var url = opener.location.href;
					url = encodeURIComponent(url);
		        	window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
		        	self.close();
					//}
				}else{
					com.laypop('show',0,'laypopKeeping');//팝업 show
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
        	window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
        	return;
		}else{
			//self.close();
			popup('',"711","584","no","_ProductStorePopup");
	 		$("#cartForm").attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductStorePopup.do", "target":"popup_ProductStorePopup", "method":"post"}).submit();
		}
    };
	
	goProductDetail = function(prdMstCd){
		opener.location.href = "<c:out value="${frontDomain}" />/pc/product/product.do?prdMstCd="+prdMstCd;
		self.close();
	};
	
	// 견적 장바구니 담기
	inertEsmCart = function(memCrtDlvGbn){

		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		var crtMemCrtDlvGbn = memCrtDlvGbn == "" ? 2096 : memCrtDlvGbn;
		
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
				alert("필수 옵션은 필수입니다.");
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
	            url : "<c:out value="${frontDomain}" />/pc/product/insertEsmCartAjax.do",
	            success : function (data){
	            	alert("성공했습니다.");
	            	opener.goMyEsmList();
	            	self.close();
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
	
	optChoice	= function(memCrtDlvGbn){

		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		var crtMemCrtDlvGbn = memCrtDlvGbn == "" ? 2096 : memCrtDlvGbn;
		
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
				alert("필수 옵션을 선택해주세요.");
				cartResult = false;
				return;
			}
		}

		if(cartResult){
			var _list			= $('.optionDtl');
			
			var opt_dtl_idxs	= "";
			var prd_dtl_prcs	= "";
			var opt_cnt			= "";
			var opt_text		= "";
			var chk				= $(opener.document).find("#inp_ck_<c:out value="${productInfo.PRD_MST_CD}" />");
			var opt				= $(opener.document).find("#opt_<c:out value="${productInfo.PRD_MST_CD}" />");
			var li				= $(opener.document).find("#li_<c:out value="${productInfo.PRD_MST_CD}" />");
			var optIcon			= $(opener.document).find("#pot_<c:out value="${productInfo.PRD_MST_CD}" />");
			
			$.each(_list, function(i){
				
				var	_this = $(this);	
				//console.log(_this);
					_OPT_DTL_IDXs	= _this.find('#OPT_DTL_IDXs').val(),
					_PRD_DTL_PRCs	= _this.find('#PRD_DTL_PRCs').val(),
					_REQUEST_CNT	= _this.find("#REQUEST_CNT_" + _OPT_DTL_IDXs).val(),
					_PRD_OPT_EST_YNs= _this.find("#PRD_OPT_EST_YNs").val(),
					_OPT_TEXT		= _this.find(".tx_1").text();
				
				li.find("label").addClass("on");
				chk.attr("checked", true);
				
				opt_text			+= '<span class="tx_opt" data-prd_dtl_price="'+ _PRD_DTL_PRCs +'" data-opt_idx="'+ _OPT_DTL_IDXs +'" data-prd_mst_cd="<c:out value="${productInfo.PRD_MST_CD}" />" data-opt_cnt="'+ _REQUEST_CNT + '" data-opt_est_yn="' + _PRD_OPT_EST_YNs + '" >' + _OPT_TEXT + '<a href="javascript:void(0);" id="optDel"><i class="ico_del"><span class="blind">옵션삭제</span></i></a></span>';
			
			});
			
			opt.html(opt_text);
			optIcon.remove();
			var TOT_PRD_MST_PRC = $("#TOT_PRD_MST_PRC").val();
			var TOT_PRD_PRC		= $("#TOT_PRD_PRC").val();
			var tabIdx			= $(opener.document).find("#tabIdx").val();
			
			li.find(".pr_m strong").text(setComma(TOT_PRD_PRC));
			li.find(".sel_m strong").text(setComma(TOT_PRD_MST_PRC));
			opener.theme.pr_ck($(opener.document).find('#pr_list_'+tabIdx+' label'));
			opener.theme.pkg_list_h();
			
			self.close();
			
		}else{
			alert("예상 외 오류가 발생 하였습니다.\n다시 시도해주세요.");
			return;
		}
    };
	
	//쿠폰 다운로드 팝업
    goPrdCoupon = function(prdMstCd,dwnType){
    	
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
    	var memGbn = "<c:out value="${userInfo.MEM_MST_MEM_GBN}" />";
    	var ememType = "<c:out value="${Code.MEMBER_TYPE_SIMPLE}" />";
    	
    	if(memId == ""){
			var url = opener.location.href;
			url = encodeURIComponent(url);
        	window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
        	self.close();
        	return;
		}else{
			if(memGbn == ememType){
				if(confirm("마켓플랜트  통합회원 전용혜택입니다.\n통합회원으로 전환하시겠습니까?")){
					opener.$('#couForm').attr({'action':'<c:out value="${serverDomain}" />/pc/manager/changeOnlineMemCert.do','method':'post'}).submit();	
				}
			}else{
				$("#couponType").val(dwnType);
				popup('',"520","400","no","_Product"+dwnType+"CpnPopup");
		 		$("#cartForm").attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductCpnPopup.do", "target":"popup_Product"+dwnType+"CpnPopup", "method":"post"}).submit();
			}
		}
    };
    
  	//장바구니 이동
	goCartList = function(){
		opener.$('#_blank_form').attr({'action':'<c:out value="${serverDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();
		self.close();
	};
	
	//나의 키핑상품 이동
	goMyKeeping = function(){
		opener.$('#_blank_form').attr({'action':'<c:out value="${serverDomain}" />/pc/mypage/myKeepProductList.do','method':'get'}).submit();
		self.close();
	};
	
	setTotalPrice();
}); //function

</script>
</html>