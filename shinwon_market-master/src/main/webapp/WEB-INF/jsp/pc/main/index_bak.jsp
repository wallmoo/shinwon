<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-main">

<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
	<div id="mainPop"><!-- 메인 팝업 2016-03-18 -->
		<c:choose>
			<c:when test="${not empty listPopup }" >
				<c:forEach var="item" items="${listPopup }" varStatus="status">
					<c:if test="${item.POP_MST_TYP eq 'L' }">
						<div id="laypop_${item.POP_MST_IDX}" class="laypop2">
							<dl class="laypop_con" style="">
								<dt class="blind">이벤트 레이어 팝업</dt>
								<dd class="con_img">
									<a href="javascript:popupLNK('<c:out value="${item.POP_MST_LNK}" />','<c:out value="${item.POP_MST_MDE}" />','l','<c:out value="${item.POP_MST_IDX}" />');">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${item.CMM_FLE_SAVE_PATH}" />" alt="<c:out value="${item.POP_MST_IMG_TXT}" />" />
									</a>
									<!-- <div class="blind">
										모든 상품 배송비가 공짜
										전상품 무료배송 이벤트
									</div> -->
								</dd>
								<dd class="dd_btn">
									<c:if test="${item.POP_MST_DAY_YN eq 'Y' }" >
										<label for="inp_today_${item.POP_MST_IDX}">
											<input type="checkbox" name="inp_today_${item.POP_MST_IDX}" id="inp_today_${item.POP_MST_IDX}" />
											<span>오늘 하루 보지 않기</span>			
										</label>
									</c:if>
									<a href="javascript:vold();" data-type="l" data-id="${item.POP_MST_IDX}" class="btn_close"><strong>닫기</strong></a>
								</dd>
							</dl>		
						</div>
					</c:if>
				</c:forEach>
			</c:when>
		</c:choose>				
	</div><!-- // 메인 팝업 2016-03-18 -->
	
	
	             
	<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
			
			<!-- .main_slider S -->
			<section class="main_slider">
				<strong class="blind">메인 배너슬라이드 섹션</strong>
				<div class="bn_list">
					<ol class="slider"><!-- slider S -->
						<c:if test="${not empty MainProBannerList }">
							<c:forEach var="MainProBannerList" items="${MainProBannerList }" varStatus="i">
								<li style="background-color:<c:out value="${MainProBannerList.BNR_MST_HEX_CD}" />">
								<c:choose>
									<c:when test="${MainProBannerList.BNR_MST_TGT eq 'D' }">
										<a href="javascript:void(0)" class="no_link" >
										<img src="<c:out value="${cdnDomain}" /><c:out value="${MainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${MainProBannerList.CMM_FLE_SYS_NM}" />" width="1020" height="464" alt="<c:out value="${MainProBannerList.CMN_FLE_ALT_TXT}" />" />
										</a>	
									</c:when>
									<c:otherwise>
										<a href="<c:out value="${MainProBannerList.BNR_MST_URL}" />" target="<c:out value="${MainProBannerList.BNR_MST_TGT_TARGET}" />" >
										<img src="<c:out value="${cdnDomain}" /><c:out value="${MainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${MainProBannerList.CMM_FLE_SYS_NM}" />" width="1020" height="464" alt="<c:out value="${MainProBannerList.CMN_FLE_ALT_TXT}" />" />
										</a>
									</c:otherwise>
								</c:choose>
								</li>
							</c:forEach>
						</c:if>
					</ol><!-- slider E -->
				</div>
			</section>
			<!--// .main_slider E -->
			<!-- .main_eMagazine S 고객 리뷰때문에 잠시 주석 2016-08-29-->
			<%-- <section class="main_eMagazine">
				<strong class="blind">메인 e매거진 섹션</strong>
				<c:if test="${not empty listProductGuideList }">
					<c:forEach var="listProductGuideList" items="${listProductGuideList }" varStatus="status">
						<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />" class="<c:out value="${listProductGuideList.MGZ_MST_CTG_BG_CLASS }" />">
							<i class="ico_msk"></i>
							<c:if test="${listProductGuideList.MGZ_MST_KID eq 'M' }">
								<i class="ico_mv"></i>
							</c:if>
							<span class="thumb"><img src="<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${listProductGuideList.CMN_FLE_ALT_TXT }" />" /></span>
							<span><c:out value="${fn:length(listProductGuideList.MGZ_MST_TITLE_2) > 28 ? fn:substring(listProductGuideList.MGZ_MST_TITLE_2,0,28) : listProductGuideList.MGZ_MST_TITLE_2 }" /></span>
							<strong class="<c:out value="${listProductGuideList.MGZ_MST_CTG_CLASS }" />"><c:out value="${listProductGuideList.MGZ_MST_CTG_NM }" /></strong>
						</a>
					</c:forEach>
				</c:if>
			</section> --%>
			<!--// .main_eMagazine E -->
			<!-- .main_exhibi S -->
			<c:if test="${fn:length(MainPlenEventBannerList) > 4 }">
				<section class="minW main_exhibi">
					<strong class="blind">메인 복합기획전 섹션</strong>
					
					<div class="oneDay_st">
						<c:if test="${not empty mainOneDaySaleInfo }">
							<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${mainOneDaySaleInfo.PRD_MST_CD }" />&oneDayIdx=<c:out value="${mainOneDaySaleInfo.ONE_DAY_IDX }" />" >
								<i class="msk">
									<i class="ico_point"></i>
									<strong class="ti">Only 1 Day</strong>
									<span class="pr_info">
										<span class="tx_ti">
											<c:choose>
												<c:when test="${mainOneDaySaleInfo.PRD_MST_BRAND_NM ne null && mainOneDaySaleInfo.PRD_MST_CPS_MDL ne null }">
													[<c:out value="${mainOneDaySaleInfo.PRD_MST_BRAND_NM}" />/<c:out value="${mainOneDaySaleInfo.PRD_MST_CPS_MDL}" />]
												</c:when>
												<c:otherwise>
													<c:if test="${mainOneDaySaleInfo.PRD_MST_BRAND_NM ne null }">
														[<c:out value="${mainOneDaySaleInfo.PRD_MST_BRAND_NM}" />]	
													</c:if>
													<c:if test="${mainOneDaySaleInfo.PRD_MST_CPS_MDL ne null }">
														[<c:out value="${mainOneDaySaleInfo.PRD_MST_CPS_MDL}" />]	
													</c:if>
												</c:otherwise>
											</c:choose>
											<br/>
											<c:out value="${fn:length(mainOneDaySaleInfo.ONE_DAY_NM) > 50 ? fn:substring(mainOneDaySaleInfo.ONE_DAY_NM,0,50) : mainOneDaySaleInfo.ONE_DAY_NM}" />
										</span>
										<strong class="tx_price"><fmt:formatNumber value="${mainOneDaySaleInfo.PRD_MST_PRC }" groupingUsed="true" /></strong>
									</span>
								</i>						
								<img src="<c:out value="${cdnDomain}" />/<c:out value="${mainOneDaySaleInfo.PRD_IMAGE}" />" alt="<c:out value="${mainOneDaySaleInfo.PRD_IMAGE_ALT}" />" />
							</a>
						</c:if>
					</div>
	
					<div class="slider"><!-- slider S -->
						<c:set var="bNum" value="1" />
						<c:set var="showCnt" value="${fn:length(MainPlenEventBannerList) }" />
						<c:forEach var="row" items="${MainPlenEventBannerList}" varStatus="i">
							<c:if test="${showCnt > 4 }">
								<c:if test="${bNum == 1 }">
								<ul class="ul_st1">
									<li class="f st_b">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_LARGE}" />" width="325" height="325" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
											<strong class="ti"><c:out value="${fn:length(row.BNR_MST_TITLE) > 22 ? fn:substring(row.BNR_MST_TITLE,0,22) : row.BNR_MST_TITLE}" /></strong>
											<span class="tx"><c:out value="${fn:length(row.BNR_MST_SUB_TITLE) > 26 ? fn:substring(row.BNR_MST_SUB_TITLE,0,26) : row.BNR_MST_SUB_TITLE}" /></span>
										</a>
									</li>
								</c:if>
								<c:if test="${bNum == 2 }">
									<li class="st_s">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_SMALL}" />" width="325" height="210" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
											<strong class="ti"><c:out value="${fn:length(row.BNR_MST_TITLE) > 26 ? fn:substring(row.BNR_MST_TITLE,0,26) : row.BNR_MST_TITLE}" /></strong>
											<span class="tx"><c:out value="${fn:length(row.BNR_MST_SUB_TITLE) > 26 ? fn:substring(row.BNR_MST_SUB_TITLE,0,26) : row.BNR_MST_SUB_TITLE}" /></span>
										</a>
									</li>
									<li class="l oneDay_st"></li>
								</c:if>
								<c:if test="${bNum == 3 }">
									<li class="f li_2 st_s">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_SMALL}" />" width="325" height="210" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
											<strong class="ti"><c:out value="${fn:length(row.BNR_MST_TITLE) > 26 ? fn:substring(row.BNR_MST_TITLE,0,26) : row.BNR_MST_TITLE}" /></strong>
											<span class="tx"><c:out value="${fn:length(row.BNR_MST_SUB_TITLE) > 26 ? fn:substring(row.BNR_MST_SUB_TITLE,0,26) : row.BNR_MST_SUB_TITLE}" /></span>
										</a>
									</li>
								</c:if>
								<c:if test="${bNum == 4 }">
									<li class="li_2 st_b">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_LARGE}" />" width="325" height="325" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
											<strong class="ti"><c:out value="${fn:length(row.BNR_MST_TITLE) > 26 ? fn:substring(row.BNR_MST_TITLE,0,26) : row.BNR_MST_TITLE}" /></strong>
											<span class="tx"><c:out value="${fn:length(row.BNR_MST_SUB_TITLE) > 26 ? fn:substring(row.BNR_MST_SUB_TITLE,0,26) : row.BNR_MST_SUB_TITLE}" /></span>
										</a>
									</li>
								</c:if>
								<c:if test="${bNum == 5 }">
									<li class="l li_2 st_s">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_SMALL}" />" width="325" height="210" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
											<strong class="ti"><c:out value="${fn:length(row.BNR_MST_TITLE) > 26 ? fn:substring(row.BNR_MST_TITLE,0,26) : row.BNR_MST_TITLE}" /></strong>
											<span class="tx"><c:out value="${fn:length(row.BNR_MST_SUB_TITLE) > 26 ? fn:substring(row.BNR_MST_SUB_TITLE,0,26) : row.BNR_MST_SUB_TITLE}" /></span>
										</a>
									</li>
								</ul>	
								</c:if>
							</c:if>
							<c:choose>
								<c:when test="${bNum mod 5 == 0 }">
									<c:set var="bNum" value="1" />
									<c:set var="showCnt" value="${showCnt - 5 }" />
								</c:when>
								<c:otherwise>
									<c:set var="bNum" value="${bNum + 1 }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div><!-- slider E -->
				</section>
			</c:if>
			<!--// .main_exhibi E -->
			<!-- .main_timeSale S -->
			<c:if test="${not empty mainTimeSaleInfo }">
				<input type="hidden" name="promotionSdDt" id="promotionSdDt" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ST_DT}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ST_HH}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ST_MM}" />" />
				<input type="hidden" name="promotionEdDt" id="promotionEdDt" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_DT}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ED_HH}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ED_MM}" />" />
				<input type="hidden" name="promotionEdYY" id="promotionEdYY" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_DT}" />" />
				<input type="hidden" name="promotionEdHH" id="promotionEdHH" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_HH}" />" />
				<input type="hidden" name="promotionEdMM" id="promotionEdMM" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_MM}" />" />
				<section class="minW main_timeSale" tabindex="0" onclick="location.href='<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${mainTimeSaleInfo.PRD_MST_CD }" />&salIdx=<c:out value="${mainTimeSaleInfo.TIM_SAL_IDX }" />'">
					<strong class="blind">메인 타임세일 섹션</strong>
					<dl class="time_lay">
						<dt class="blind">
							<span>온라인 단독</span><strong>타임세일</strong>
						</dt>
						<dd class="pr_img">
							<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${mainTimeSaleInfo.PRD_MST_CD }" />&salIdx=<c:out value="${mainTimeSaleInfo.TIM_SAL_IDX }" />" >
							<img src="<c:out value="${cdnDomain}" />/<c:out value="${mainTimeSaleInfo.PRD_IMAGE}" />" alt="<c:out value="${mainTimeSaleInfo.PRD_IMAGE_ALT}" />" /></a>
						</dd>
						<dd class="sale_info">
							<div class="tx_time">
								<strong class="tx_ti"><span class="blind">타임세일</span>남은시간</strong>
								<p id="tx_time">								
									<strong>0</strong>
									<strong>0</strong>
									<span>:</span>
									<strong>0</strong>
									<strong>0</strong>
									<span>:</span>
									<strong>0</strong>
									<strong>0</strong>
									<i></i>
								</p>
							</div>
							<span class="blind">타임세일 상품정보</span>
							<dl class="pr_info">
								<dt>
									<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${mainTimeSaleInfo.PRD_MST_CD }" />&salIdx=<c:out value="${mainTimeSaleInfo.TIM_SAL_IDX }" />"" >
										<c:choose>
											<c:when test="${mainTimeSaleInfo.PRD_MST_BRAND_NM ne null && mainTimeSaleInfo.PRD_MST_CPS_MDL ne null }">
												[<c:out value="${mainTimeSaleInfo.PRD_MST_BRAND_NM}" />/<c:out value="${mainTimeSaleInfo.PRD_MST_CPS_MDL}" />]
											</c:when>
											<c:otherwise>
												<c:if test="${mainTimeSaleInfo.PRD_MST_BRAND_NM ne null }">
													[<c:out value="${mainTimeSaleInfo.PRD_MST_BRAND_NM}" />]	
												</c:if>
												<c:if test="${mainTimeSaleInfo.PRD_MST_CPS_MDL ne null }">
													[<c:out value="${mainTimeSaleInfo.PRD_MST_CPS_MDL}" />]	
												</c:if>
											</c:otherwise>
										</c:choose>
										<br/><c:out value="${mainTimeSaleInfo.TIM_SAL_NM }" />
									</a>
								</dt>
								<dd>
									<p class="sel_pr">
										<span class="tx_ti">판매가</span>
										<strong class="tx_price"><fmt:formatNumber value="${mainTimeSaleInfo.PRD_MST_ERP_PRC }" groupingUsed="true" /><span>원</span></strong>
										
									</p>
									<p class="guer_pr">
										<span class="tx_ti">게릴라가</span>
										<strong class="tx_price"><fmt:formatNumber value="${mainTimeSaleInfo.PRD_MST_PRC }" groupingUsed="true" /><span>원</span></strong>
										
									</p>
									<p class="amount">
										<span class="tx_ti">선착순 구매수량</span>
										<strong class="tx_num"><fmt:formatNumber value="${mainTimeSaleInfo.PRD_MST_SEL_CNT }" groupingUsed="true" /><span>개</span></strong>									
									</p>
									<c:if test="${mainTimeSaleInfo.TIM_SAL_PRD_CNT > 0 }">
										<p class="amount">
											<span class="tx_ti">남은 수량</span>
											<strong class="tx_num"><fmt:formatNumber value="${mainTimeSaleInfo.TIM_SAL_PRD_CNT }" groupingUsed="true" /><span>개</span></strong>
										</p>
									</c:if>
								</dd>
							</dl>
						</dd>
					</dl>
				</section>
			</c:if>
			<!--// .main_timeSale E -->

			<!-- .main_best S -->
			<section class="minW main_best">
				<strong class="blind">메인 베스트상품 섹션</strong>
				<dl>
					<dt class="ti"><strong>Best Product</strong></dt>
					<dd class="list">
						<div class="slider"><!-- slider S -->
							<c:choose>
								<c:when test="${not empty MainBestItmList }">
									<c:forEach begin="0" end="${fn:length(MainBestItmList) }" step="1" var="Idx">
										<c:set var="num" value="1" />
										<c:if test="${not empty MainBestItmList[Idx] }">
											<ul>
											<c:forEach var="bestRow" items="${MainBestItmList[Idx]}" varStatus="i">
													<li <c:if test="${num == 1}">class="f"</c:if> <c:if test="${num == 4}">class="l"</c:if>>
														<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${bestRow.PRD_MST_CD }" />">
															<c:if test="${sessionUser.MEM_MST_MEM_GBN ne '683' }">
																<c:if test="${bestRow.PRD_NOW_DST_POINT > 0 && bestRow.PRD_CPN_DST_POINT eq 0}">
																	<i class="ico_sale"><span><c:out value="${bestRow.PRD_NOW_DST_POINT}" />%</span></i>
																</c:if>
																<c:if test="${bestRow.PRD_CPN_DST_POINT > 0}">
																	<i class="ico_coupon"><span class="ir">쿠폰</span></i>
																</c:if>
															</c:if>
															<img src="<c:out value="${cdnDomain}" />/<c:out value="${bestRow.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${bestRow.PRD_IMAGE_ALT}" />" />
															<span class="ti">
																<c:choose>
																	<c:when test="${bestRow.PRD_MST_BRAND_NM ne null && bestRow.PRD_MST_CPS_MDL ne null }">
																		[<c:out value="${bestRow.PRD_MST_BRAND_NM}" />/<c:out value="${bestRow.PRD_MST_CPS_MDL}" />]
																	</c:when>
																	<c:otherwise>
																		<c:if test="${bestRow.PRD_MST_BRAND_NM ne null }">
																			[<c:out value="${bestRow.PRD_MST_BRAND_NM}" />]	
																		</c:if>
																		<c:if test="${bestRow.PRD_MST_CPS_MDL ne null }">
																			[<c:out value="${bestRow.PRD_MST_CPS_MDL}" />]	
																		</c:if>
																	</c:otherwise>
																</c:choose>
																<br>
																<c:out value="${bestRow.DSP_MST_TXT}" />
															</span>
															<c:choose>
																<c:when test="${(bestRow.PRD_NOW_DST_POINT > 0 || cleanRow.PRD_CPN_DST_POINT > 0) && sessionUser.MEM_MST_MEM_GBN ne '683'}">
																	<c:choose>
																		<c:when test="${bestRow.PRD_CPN_DST_POINT > 0 }">
																			<strong class="pr_m"><strong class="co_blue"><fmt:formatNumber value="${bestRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span class="co_blue">원</span></strong>
																		</c:when>
																		<c:otherwise>
																			<strong class="pr_m"><strong class="co_red"><fmt:formatNumber value="${bestRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<strong class="pr_m"><strong><fmt:formatNumber value="${bestRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
																</c:otherwise>
															</c:choose>
														</a>
													</li>
											<c:set var="num" value="${num + 1 }" />	
											</c:forEach>
											</ul>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<ul>
										<li>베스트 상품이 없습니다.</li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div><!-- slider E -->
					</dd>
				</dl>
			</section>
			<!--// .main_best E -->

			<!-- .main_exhibiBn S -->
			<section class="main_exhibiBn">
				<strong class="blind">메인 기획전배너 섹션</strong>
				<c:if test="${not empty MainReNewBannerList }">
					<c:forEach var="MainReNewBannerList" items="${MainReNewBannerList }" varStatus="i">
						<c:choose>
							<c:when test="${MainReNewBannerList.BNR_MST_TGT eq 'D' }">
								<a href="javascript:void(0)" class="no_link" style="background-color:<c:out value="${MainReNewBannerList.BNR_MST_HEX_CD}" />">
								<img src="<c:out value="${cdnDomain}" /><c:out value="${MainReNewBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${MainReNewBannerList.CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainReNewBannerList.CMN_FLE_ALT_TXT}" />" />
								</a>	
							</c:when>
							<c:otherwise>
								<a href="<c:out value="${MainReNewBannerList.BNR_MST_URL}" />" target="<c:out value="${MainReNewBannerList.BNR_MST_TGT_TARGET}" />" style="background-color:<c:out value="${MainReNewBannerList.BNR_MST_HEX_CD}" />">
								<img src="<c:out value="${cdnDomain}" /><c:out value="${MainReNewBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${MainReNewBannerList.CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainReNewBannerList.CMN_FLE_ALT_TXT}" />" />
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</section>
			<!--// .main_exhibiBn E -->

			<!-- .main_trend S -->
			<section class="main_trend">
				<strong class="blind">메인 트렌드이슈 섹션</strong>
				<div class="minW">
					<div class="slider"><!-- slider S -->
						<c:if test="${fn:length(MainTrandAPrdBannerList) == 5 && (not empty MainTrandABannerList && not empty MainTrandAThemeBannerList)}">
							<ul>
							<c:set var="numIdx" value="1" />
							<c:forEach var="row" items="${MainTrandAPrdBannerList }" varStatus="i">
								<c:if test="${numIdx == 1 || numIdx == 3 }">
									<li class="f">
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />">
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" />
											<span class="tx">
												<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
											</span>
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 1}">
									<li class="li_st_1">
										<c:choose>
											<c:when test="${MainTrandABannerList[0].BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainTrandABannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandABannerList[0].BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandABannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandABannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandABannerList[0].CMN_FLE_ALT_TXT}" />" width=508 height=278 />
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 2 || numIdx == 5 }">
									<li class="l">
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />">
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" />
											<span class="tx">
												<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
											</span>
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 4}">
									<li class="li_st_2">
										<c:choose>
											<c:when test="${MainTrandAThemeBannerList[0].BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainTrandAThemeBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandAThemeBannerList[0].BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandAThemeBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandAThemeBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandAThemeBannerList[0].CMN_FLE_ALT_TXT}" />" width=254 height=278 />
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 4 }">
									<li>
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />">
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" />
											<span class="tx">
												<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
											</span>
										</a>
									</li>
								</c:if>
							<c:set var="numIdx" value="${numIdx + 1 }" />
							</c:forEach>
								<c:if test="${not empty MainTrandALeftBannerList }">
									<li class="bg_img_l">
										<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandALeftBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandALeftBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandALeftBannerList[0].CMN_FLE_ALT_TXT}" />" />
									</li>
								</c:if>
								<c:if test="${not empty MainTrandARightBannerList }">
									<li class="bg_img_r">
										<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandARightBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandARightBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandARightBannerList[0].CMN_FLE_ALT_TXT}" />" />
									</li>
								</c:if>
							</ul>
						</c:if>
						<!-- 트렌드B 내용 -->
						<c:if test="${fn:length(MainTrandBPrdBannerList) == 5 && (not empty MainTrandBBannerList && not empty MainTrandBThemeBannerList)}">
							<ul>
							<c:set var="numIdx" value="1" />
							<c:forEach var="row" items="${MainTrandBPrdBannerList }" varStatus="i">
								<c:if test="${numIdx == 1 || numIdx == 3 }">
									<li class="f">
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />">
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" />
											<span class="tx">
												<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
											</span>
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 1}">
									<li class="li_st_1">
										<c:choose>
											<c:when test="${MainTrandBBannerList[0].BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainTrandBBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandBBannerList[0].BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandBBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandBBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandBBannerList[0].CMN_FLE_ALT_TXT}" />" width=508 height=278 />
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 2 || numIdx == 5 }">
									<li class="l">
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />">
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" />
											<span class="tx">
												<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
											</span>
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 4}">
									<li class="li_st_2">
										<c:choose>
											<c:when test="${MainTrandBThemeBannerList[0].BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" class="no_link">
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainTrandBThemeBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandBThemeBannerList[0].BNR_MST_TGT_TARGET}" />" >
											</c:otherwise>
										</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandBThemeBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandBThemeBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandBThemeBannerList[0].CMN_FLE_ALT_TXT}" />" width=254 height=278 />
										</a>
									</li>
								</c:if>
								<c:if test="${numIdx == 4 }">
									<li>
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />">
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" />
											<span class="tx">
												<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
											</span>
										</a>
									</li>
								</c:if>
							<c:set var="numIdx" value="${numIdx + 1 }" />
							</c:forEach>
								<c:if test="${not empty MainTrandBLeftBannerList }">
									<li class="bg_img_l">
										<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandBLeftBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandBLeftBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandBLeftBannerList[0].CMN_FLE_ALT_TXT}" />" />
									</li>
								</c:if>
								<c:if test="${not empty MainTrandBRightBannerList }">
									<li class="bg_img_r">
										<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandBRightBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandBRightBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandBRightBannerList[0].CMN_FLE_ALT_TXT}" />" />
									</li>
								</c:if>
							</ul>
						</c:if>
					</div><!-- slider E -->
				</div>
			</section>
			<!--// .main_trend E -->

			<!-- .main_service S -->
			<section class="minW main_service">
				<strong class="blind">메인 서비스별 섹션</strong>
				<dl>
					<dt>
						<strong>마켓플랜트 서비스</strong>
					</dt>
					<dd class="tab_mn">
						<a href="javascript:prdPriceKingBannerList('<c:out value="${Code.PC_MANIN_THEME_CLEAN_BANNER}" />');" class="mn_01" data-priceidx="<c:out value="${Code.PC_MANIN_THEME_CLEAN_BANNER}" />"><span>서비스1</span></a>
						<%-- <a href="javascript:prdPriceKingBannerList('<c:out value="${Code.PC_MANIN_THEME_GETITNOW_BANNER}" />');" class="mn_02 "><span>겟잇나우</span></a> --%>
						<a href="javascript:prdPriceKingBannerList('<c:out value="${Code.PC_MANIN_THEME_WEDDING_BANNER}" />');" class="mn_03" data-priceidx="<c:out value="${Code.PC_MANIN_THEME_WEDDING_BANNER}" />"><span>서비스2</span></a>
						<a href="javascript:prdPriceKingBannerList('<c:out value="${Code.PC_MANIN_THEME_SINGLE_BANNER}" />');" class="mn_04" data-priceidx="<c:out value="${Code.PC_MANIN_THEME_SINGLE_BANNER}" />"><span>서비스3</span></a>
						<%-- <a href="javascript:prdPriceKingBannerList('<c:out value="${Code.PC_MANIN_THEME_LNG_BANNER}" />');" class="mn_05"><span>장기할부</span></a> --%>
						<!-- <a href="javascript:void(0)" class="mn_05"><span>장기할부</span><i class="ico_coming"><span class="blind">comingsoon</span></i></a> -->
						<%-- <a href="javascript:prdPriceKingBannerList('<c:out value="${Code.PC_MANIN_THEME_HEALTH_BANNER}" />');" class="mn_06"><span>건강</span></a> --%>
						<!-- <a href="javascript:void(0)" class="mn_06"><span>건강</span><i class="ico_coming"><span class="blind">comingsoon</span></i></a> -->
					</dd>
					<dd class="tab_con">
						<p>
							<i class="ico_ar"></i>
							<strong>마켓플랜트<br/>서비스</strong>
							<span>
								마켓플랜트 서비스는 다르다!
							</span>
						</p>
						<div id="mainPriceKingBanner">
						<c:choose>
							<c:when test="${not empty MainCleanProductList }">
								<ul>
									<c:set var="num" value="1" />
									<c:forEach var="cleanRow" items="${MainCleanProductList }" varStatus="i">
										<li <c:if test="${num == 1}">class="f"</c:if> <c:if test="${num == 4}">class="l"</c:if>>
											<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${cleanRow.PRD_MST_CD }" />">
												<c:if test="${sessionUser.MEM_MST_MEM_GBN ne '683' }">
													<c:if test="${cleanRow.PRD_NOW_DST_POINT > 0 && cleanRow.PRD_CPN_DST_POINT eq 0}">
														<i class="ico_sale"><span><c:out value="${cleanRow.PRD_NOW_DST_POINT}" />%</span></i>
													</c:if>
													<c:if test="${cleanRow.PRD_CPN_DST_POINT > 0}">
														<i class="ico_coupon"><span class="ir">쿠폰</span></i>
													</c:if>
												</c:if>
												<img src="<c:out value="${cdnDomain}" />/<c:out value="${cleanRow.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${cleanRow.PRD_IMAGE_ALT}" />" />
												<span class="ti">
													<c:choose>
														<c:when test="${cleanRow.PRD_MST_BRAND_NM ne null && cleanRow.PRD_MST_CPS_MDL ne null }">
															[<c:out value="${cleanRow.PRD_MST_BRAND_NM}" />/<c:out value="${cleanRow.PRD_MST_CPS_MDL}" />]
														</c:when>
														<c:otherwise>
															<c:if test="${cleanRow.PRD_MST_BRAND_NM ne null }">
																[<c:out value="${cleanRow.PRD_MST_BRAND_NM}" />]	
															</c:if>
															<c:if test="${cleanRow.PRD_MST_CPS_MDL ne null }">
																[<c:out value="${cleanRow.PRD_MST_CPS_MDL}" />]	
															</c:if>
														</c:otherwise>
													</c:choose>
														<br>
													<c:out value="${cleanRow.DSP_MST_TXT}" />
												</span>
												<c:choose>
													<c:when test="${(cleanRow.PRD_NOW_DST_POINT > 0 || cleanRow.PRD_CPN_DST_POINT > 0) && sessionUser.MEM_MST_MEM_GBN ne '683'}">
														<c:choose>
															<c:when test="${cleanRow.PRD_CPN_DST_POINT > 0 }">
																<strong class="pr_m"><strong class="co_blue"><fmt:formatNumber value="${cleanRow.PRD_CPN_DST_PRICE }" groupingUsed="true" /></strong><span class="co_blue">원</span></strong>
															</c:when>
															<c:otherwise>
																<strong class="pr_m"><strong class="co_red"><fmt:formatNumber value="${cleanRow.PRD_NOW_DST_PRICE }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<strong class="pr_m"><strong><fmt:formatNumber value="${cleanRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
													</c:otherwise>
												</c:choose>
											</a>
										</li>
									<c:set var="num" value="${num + 1 }" />	
									</c:forEach>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li class="no_list">
										등록된 상품이 없습니다.
									</li>
								</ul>
							</c:otherwise>
						</c:choose>
						</div>
					</dd>
				</dl>
			</section>
			<!--// .main_service E -->

			<!-- .main_recommend S -->
			<section class="minW main_recommend">
				<strong class="blind">메인 추천상품 섹션</strong>
				<h2>MD’S PICK</h2>
				<ul class="tab_d">
					<li class="tab_mn">
						<c:if test="${not empty MainMdPickIconList }">
							<c:forEach begin="0" end="${fn:length(MainMdPickIconList) }" step="1" var="Idx">
								<c:forEach var="row" items="${MainMdPickIconList[Idx] }" varStatus="i">
									<a href="javascript:prdMdPickProductList('<c:out value="${Code.PC_MAIN_MD_PICK_PRD_ARY[Idx]}" />');" class="<c:if test="${Idx == 0}">f on</c:if> <c:if test="${Idx == 5}">l</c:if> mn_0${Idx + 1 }" data-pickidx="<c:out value="${Code.PC_MAIN_MD_PICK_PRD_ARY[Idx]}" />" data-change_large="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_SMALL}" />" data-change_small="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM_LARGE}" />">
									<img  src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${Idx == 0 ? row.CMM_FLE_SYS_NM_LARGE : row.CMM_FLE_SYS_NM_SMALL}" />"  alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
									<span><c:out value="${row.BNR_MST_TITLE}" /></span>
									</a>
								</c:forEach>
							</c:forEach>
						</c:if>
					</li>
					<li class="tab_con" id="mainMdPickProductList">
						<c:choose>
							<c:when test="${not empty MainMdPickProductList && fn:length(MainMdPickProductList)  == 4}">
								<ul>
									<c:set var="num" value="1" />
									<c:forEach var="mdPickRow" items="${MainMdPickProductList }" varStatus="i">
										<li <c:if test="${num == 1}">class="f"</c:if> <c:if test="${num == 4}">class="l"</c:if>>
											<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${mdPickRow.PRD_MST_CD }" />">
												<img src="<c:out value="${cdnDomain}" />/<c:out value="${mdPickRow.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${mdPickRow.PRD_IMAGE_ALT}" />" />
												<span class="ti">
													<c:choose>
														<c:when test="${mdPickRow.PRD_MST_BRAND_NM ne null && mdPickRow.PRD_MST_ERP_CD ne null }">
															[<c:out value="${mdPickRow.PRD_MST_BRAND_NM}" />/<c:out value="${mdPickRow.PRD_MST_ERP_CD}" />]
														</c:when>
														<c:otherwise>
															<c:if test="${mdPickRow.PRD_MST_BRAND_NM ne null }">
																[<c:out value="${mdPickRow.PRD_MST_BRAND_NM}" />]	
															</c:if>
															<c:if test="${mdPickRow.PRD_MST_ERP_CD ne null }">
																[<c:out value="${mdPickRow.PRD_MST_ERP_CD}" />]	
															</c:if>
														</c:otherwise>
													</c:choose>
														<br>
													<c:out value="${mdPickRow.DSP_MST_TXT}" />
												</span>
												<c:choose>
													<c:when test="${(mdPickRow.PRD_NOW_DST_POINT > 0 || mdPickRow.PRD_CPN_DST_POINT > 0) && sessionUser.MEM_MST_MEM_GBN ne '683'}">
														<c:choose>
															<c:when test="${mdPickRow.PRD_CPN_DST_POINT > 0 }">
																<strong class="pr_m"><strong class="co_blue"><fmt:formatNumber value="${mdPickRow.PRD_CPN_DST_PRICE }" groupingUsed="true" /></strong><span class="co_blue">원</span></strong>
															</c:when>
															<c:otherwise>
																<strong class="pr_m"><strong class="co_red"><fmt:formatNumber value="${mdPickRow.PRD_NOW_DST_PRICE }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<strong class="pr_m"><strong><fmt:formatNumber value="${mdPickRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
													</c:otherwise>
												</c:choose>
											</a>
										</li>
									<c:set var="num" value="${num + 1 }" />	
									</c:forEach>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li class="no_list">
										등록된 상품이 없습니다.
									</li>
								</ul>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</section>
			<!--// .main_recommend E -->

			<!-- .main_imgBn S -->
			<c:if test="${not empty MainBottomEventBannerList }">
				<section class="minW main_imgBn">
					<strong class="blind">메인 배너 섹션</strong>
						<c:choose>
							<c:when test="${MainBottomEventBannerList[0].BNR_MST_TGT eq 'D' }">
								<a href="javascript:void(0)" class="no_link">
							</c:when>
							<c:otherwise>
								<a href="<c:out value="${MainBottomEventBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainBottomEventBannerList[0].BNR_MST_TGT_TARGET}" />">
							</c:otherwise>
						</c:choose>
						<img src="<c:out value="${cdnDomain}" /><c:out value="${MainBottomEventBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainBottomEventBannerList[0].CMM_FLE_SYS_NM}" />" width="1920" height="190" alt="<c:out value="${MainBottomEventBannerList[0].CMN_FLE_ALT_TXT}" />" />
						</a>
				</section>
			</c:if>
			<!--// .main_imgBn E -->

			<!-- .main_customer S -->
			<section class="minW main_customer">
				<strong class="blind">메인 공지사항, CS CENTER, STORE 섹션</strong>
				<!-- .notice S -->
				<dl class="notice">
					<dt class="ti">
						<strong>공지사항</strong>
						<a href="<c:out value="${frontDomain }"/>/pc/customer/noticeBoardList.do" class="btn_more"><span>more</span></a>
					</dt>
					<dd class="list">
						<c:choose>
							<c:when test="${not empty noticeList }">
								<c:forEach var="list" items="${noticeList }" varStatus="i">
									<a href="<c:out value="${frontDomain }"/>/pc/customer/noticeBoardView.do?BRD_NTS_IDX=<c:out value="${list.BRD_NTS_IDX }" />&BRD_NTS_TOP_YN=N"><span><i>ㆍ</i>
									<c:choose>
										<c:when test="${fn:length(list.BRD_NTS_TITLE) > 26 }">
											<c:out value="${fn:substring(list.BRD_NTS_TITLE,0,26) }" />...
										</c:when>
										<c:otherwise>
											<c:out value="${list.BRD_NTS_TITLE }" />
										</c:otherwise>
									</c:choose>
									</span></a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)"><span><i>ㆍ</i>등록된 공지사항이 없습니다.</span></a>
							</c:otherwise>
						</c:choose>
					</dd>
					<dd class="btn">
						<a href="<c:out value="${frontDomain }"/>/pc/product/myEstimateMain.do" class="f"><img src="<c:out value="${cdnDomain}" />/pc/img/main/img_main_bn0.jpg" alt="맞춤견적" /></a>
						<a href="<c:out value="${frontDomain }"/>/pc/product/estimateMain.do"><img src="<c:out value="${cdnDomain}" />/pc/img/main/img_main_bn1.jpg" alt="대량견적" /></a>
						<%
						//B2B링크 외부내부다름
						String thisRemoteIp = "";
		            	thisRemoteIp = request.getRemoteAddr();
		            	if(thisRemoteIp != null && !"".equals(thisRemoteIp)){
		            		if(thisRemoteIp.indexOf("220.71.52.218") > -1){
		            	%>
		            	<a href="javascript:;" target="_blank" class="l"><img src="<c:out value="${cdnDomain}" />/pc/img/main/img_main_bn2.jpg" alt="마켓플랜트B2B" /></a>
		            	<% 
		            		}else{
		            	%>
						<a href="javascript:;" target="_blank" class="l"><img src="<c:out value="${cdnDomain}" />/pc/img/main/img_main_bn2.jpg" alt="마켓플랜트B2B" /></a>
						<%
		            		}
		            	}
						%>
					</dd>
				</dl>
				<!--// .notice E -->
				<!-- .cs S -->
				<div class="cs">
					<dl class="fl">
						<dt class="ti">
							<strong>쇼핑몰 고객센터</strong>
						</dt>
						<dd>
							<strong>1500-0000</strong>
							<p>
								<span>평일 09:00 ~ 18:00</span>
								<span>토요일 10:00 ~ 14:00</span>
								
							</p>
						</dd>
					</dl>
					<dl class="fr">
						<dt class="ti">
							<strong>지점 고객센터</strong>
						</dt>
						<dd>
							<strong>02-6925-1160</strong>
							<p>
								<span>평일 09:30 ~ 18:30</span>
								<span>주말 09:30 ~ 17:30</span>
								
							</p>
						</dd>
					</dl>
					<img src="<c:out value="${cdnDomain }"/>/pc/img/main/img_main_bn3.jpg" alt="카드 이벤트" usemap="#cardMap" />
					<map name="cardMap">
					  <area shape="rect" coords="1,2,220,102" href="<c:out value="${frontDomain }"/>/pc/event/cardBenefit.do" title="[삼성카드] 7%청구할인, 3%포인트 적립">
					  <area shape="rect" coords="220,3,437,103" href="<c:out value="${frontDomain }"/>/pc/event/cardBenefit.do" title="[롯데카드] 25만원 청구할인, 5% 포인트 적립">
					</map>
				</div>
				<!--// .cs E -->
				
				<!-- .store S -->
				<dl class="store">
					<dt class="ti">
						<strong>쇼핑몰 지점찾기</strong>
					</dt>
					<dd class="con">
						<a href="javascript:;" target="_blank"><img src="<c:out value="${cdnDomain }"/>/pc/img/main/img_main_bn5.jpg" alt="가까운 지점을 찾아보세요!" /></a>
					</dd>
				</dl>
				<!--// .store E -->
				
			</section>
			<!--// .main_customer E -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>
<!-- 팝업용 -->
<form name="popupForm" id="popupForm">
     <input type="hidden" name="POP_MST_IDX" id="POP_MST_IDX" />
</form>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<script src="<c:out value="${frontDomain}"/>/fr/js/min/plugin.min.js"></script>
<script src="<c:out value="${frontDomain}"/>/fr/js/min/app.min.js"></script>
<script src="<c:out value="${frontDomain}"/>/fr/js/min/module.min.js"></script>
<script src="<c:out value="${frontDomain}"/>/fr/js/min/mall.min.js"></script>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
var PickIdx = "";
var priceidx = "";
com.main = {
	slider : function(){
		//메인 slider
		var _main_slider = $('.main_slider .slider'),
			_main_opt = {
				mode: 'fade', 
				preloadImages: 'visible',
				controls: false,
				captions: true,
				auto: true,
				autoControls: true
			};
		if(_main_slider.children().length > 1){
			_main_slider.bxSlider(_main_opt); 
			$('.main_slider .bx-pager-item a').click(function(e){
				var i = $(this).parent().index();
				_main_slider.goToSlide(i);
				_main_slider.stopAuto();
				restart = setTimeout(function(){
					_main_slider.startAuto();
					},500);
				return false;
			});
		}
		
		//복합기획전
		var _exhibi_slider = $('.main_exhibi .slider'),
			_exhibi_opt = {
				mode: 'fade', 
				preloadImages: 'visible',
				controls: false,
				captions: true,
				auto: false,
				infiniteLoop: false,
				hideControlOnEnd: true,
				randomStart:true
			};
		if(2 <= _exhibi_slider.children().length) _exhibi_slider.bxSlider(_exhibi_opt);

		//베스트상품
		var _best_slider = $('.main_best .slider'),
			_best_opt = {
				mode: 'fade', 
				preloadImages: 'visible',
				controls: false,
				captions: true,
				auto: false,
				infiniteLoop: false,
				hideControlOnEnd: true,
				randomStart:true
			};
// 		_best_slider.bxSlider(_best_opt);

		//트렌드이슈
		var _trend = $('.main_trend'),
			_trend_slider = _trend.find('.slider'),
			_trend_opt = {
				mode: 'fade',
				preloadImages: 'visible',
				controls: false,
				captions: true,
				auto: false,
				infiniteLoop: false,
				hideControlOnEnd: true,
				randomStart:true
			};
// 		_trend_slider.bxSlider(_trend_opt);
	},//slider : function(){
	tab: function(){
		// 서비스, 추천상품
		/*
			_section = true(), false(추천상품)
			_idx = 메뉴 몇번째
		*/

		$('.main_service, .main_recommend').find('.tab_mn a').on('click', function(){
			var _this = $(this),
				_idx = _this.index(),
				_section = _this.parents('.main_service').length ? true : false,
				_set_com = function(){
					_this.children('.ico_coming').animate({opacity:0,marginTop:'-10px'}, 200, function(){
						$(this).removeAttr('style');
					});
				};

			//comingsoon 체크
			if(_this.children('.ico_coming').length){
				
				//내가 누른거 말고 다른거 icon 떠있으면 닫아라
				var _sibling_ico = _this.siblings().children('.ico_coming');
				if(_sibling_ico.css('opacity') != 0) _sibling_ico.removeAttr('style');

				_this.children('.ico_coming').animate({opacity:1,marginTop:'-22px'}, 200, function(){
					clearTimeout(_set_com);
					setTimeout(_set_com, 3000);
				});
				return false;
			}

			if(_section){
				_this.addClass('on').animate({width:'auto'}, 200, function(){
					$(this).removeAttr('style');
				}).siblings('.on').animate({width:0}, 200, function(){
					$(this).removeClass('on');
				}); 
			}else _this.addClass('on').siblings().removeClass('on');
			
			//추천상품
			if(!_section){
				var changeSmall = $(this).data("change_small");
				var _img = _this.children('img'),
					_src = _img.attr('src'),
					_on = _src.replace(/_off/gi, '_on');
				_img.attr('src', changeSmall);
				
				$.each(_this.siblings(), function(){
					var changeLarge = $(this).data("change_large");
					$(this).children('img');
					var _sib_img = $(this).children('img'),
						_sib_src = _sib_img.attr('src'),
						_sib_off = _sib_src.replace(/_on/gi, '_off');
					_sib_img.attr('src', changeLarge);
				});
				
			}else{
			//
				var _tx_db = [
						{
							ti :'마켓플랜트<br/>서비스',
							tx :'마켓플랜트 서비스는 다르다!'
						},
						/*
						{
							ti :'겟잇나우<br/>서비스',
							tx :'오늘 당장 필요한 상품!<br/> 온라인에서 구매하고,<br/> 집앞 매장에서 픽업하자!'
						},*/
						{
							ti :'마켓플랜트<br/>서비스',
							tx :'마켓플랜트 서비스는 다르다!'
						},
						{
							ti :'마켓플랜트<br/>서비스',
							tx :'마켓플랜트 서비스는 다르다!'
						}/*,
						{
							ti :'장기할부<br/>서비스',
							tx :'무이자 36개월!<br/> 갖고싶었지만 망설였던<br/> 가전을 부담없이 갖자!'
						},
						{
							ti : '건강<br/>서비스',
							tx : '내몸의 애프터서비스!<br/> 이젠 스스로하자.<br/> 건강에 대한 모든 지식백서.'
						}*/
					],
					_thisCon = _this.parent('.tab_mn').next('.tab_con'),
					_con_ti = _thisCon.find('p strong'),
					_con_tx = _thisCon.find('p span');
				
				_thisCon.removeAttr('class').addClass('tab_con st_con_'+_idx);
				_con_ti.html(_tx_db[_idx].ti);
				_con_tx.html(_tx_db[_idx].tx);
			}

//			console.log(_section+' / '+_idx);
		});
		// 탭 메뉴 랜덤 노출
		var idxRan = function(selector){ // 랜덤 난수 생성(탭 메뉴 개수: 최대값)
			var count = $(selector).length,
				idx = Math.floor(Math.random() * count);
				return idx;
		},
			idx = idxRan('.main_service .tab_mn>a'),
			tx_db = [
				{
					ti :'마켓플랜트<br/>서비스',
					tx :'마켓플랜트 서비스는 다르다!'
				},
				/* 2016.05.12 겟잇나우 서비스 숨김처리
				{
					ti :'겟잇나우<br/>서비스',
					tx :'오늘 당장 필요한 상품!<br/> 온라인에서 구매하고,<br/> 집앞 매장에서 픽업하자!'
				},
				*/
				{
					ti :'마켓플랜트<br/>서비스',
					tx :'마켓플랜트 서비스는 다르다!'
				},
				{
					ti :'마켓플랜트<br/>서비스',
					tx :'마켓플랜트 서비스는 다르다!'
				}
				/*,
				
				{
					ti :'장기할부<br/>서비스',
					tx :'무이자 36개월!<br/> 갖고싶었지만 망설였던<br/> 가전을 부담없이 갖자!'
				},
				{
					ti : '건강<br/>서비스',
					tx : '내몸의 애프터서비스!<br/> 이젠 스스로하자.<br/> 건강에 대한 모든 지식백서.'
				}*/
			],
			tabCon = $('.main_service .tab_con'),
			con_ti = tabCon.find('p strong'),
			con_tx = tabCon.find('p span'),
			tabMn = $('.main_service .tab_mn>a').eq(idx);
			
			tabMn.addClass('on');
			tabCon.addClass('tab_con st_con_'+idx);
			con_ti.html(tx_db[idx].ti);
			con_tx.html(tx_db[idx].tx);
			priceidx = tabMn.data("priceidx");
		
		//MD'S PICK  탭 메뉴 랜덤 노출
		idx = idxRan('.main_recommend .tab_mn>a'),
		tabMn = $('.main_recommend  .tab_mn>a').eq(idx);
		var changeSmall = tabMn.data("change_small");
		PickIdx = tabMn.data("pickidx");
		
		var img = tabMn.children('img'),
			src = img.attr('src'),
			on = src.replace(/_off/gi, '_on');
			img.attr('src', changeSmall);
		
		$.each(tabMn.siblings(), function(){
			var changeLarge = $(this).data("change_large");
			$(this).children('img');
			var sib_img = $(this).children('img'),
				sib_src = sib_img.attr('src'),
				sib_off = sib_src.replace(/_on/gi, '_off');
			sib_img.attr('src', changeLarge);
		});
		tabMn.addClass('on').siblings().removeClass('on');
		
	}//tab : function(){
	
};
//타임세일
com.timeSale = {
	showtime: function(_date, _time, _idx){
		//console.log(3);
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
				_lg = _nums.length,
				_html = '';
			if(_lg == 1) _nums = '0'+_nums;
			
			var _split = _nums.split('');
			for ( var i in _split ){
				_html += _split[i];
			}
			return _html;
		}

		var _html_d = '';
		if(d_day <= -1){
			//종료
			_html_d = '<strong>0</strong><strong>0</strong><span>:</span><strong>0</strong><strong>0</strong><span>:</span><strong>0</strong><strong>0</strong>';
			$(_idx).html(_html_d);
			//com.timeSale.stopclock();
			return false;
		}else{
			
			//진행중
			//일
			if(d_day > 0) _html_d += '<strong class="d_day">'+d_day+'<span>DAY</span></strong>';

			//시간
			if(d_hour > 0) _html_d += '<strong>'+html_chg(d_hour)+'</strong><span>:</span>';
			else _html_d += '<strong>00</strong><span>:</span>';
			
			//분
			if(d_min > 0) _html_d += '<strong>'+html_chg(d_min)+'</strong><span>:</span>';
			else _html_d += '<strong>00</strong><span>:</span>';
			
			//초
			if(d_sec > 0) _html_d += '<strong>'+html_chg(d_sec)+'</strong>';
			else _html_d += '<strong>00</strong>';
			
			$(_idx).html(_html_d+'<i class="ico"></i>');
		}		
		
		setTimeout("com.timeSale.showtime('"+_date+"','"+_time+"','"+_idx+"')", 1000);		
	}
};
var areaCheck = '<c:out value="${!areaCheck}" />';
com.main.slider();
com.main.tab();
if(!areaCheck){
	com.gps();
}

$(function(){
	
    //타임세일
	if($("#promotionEdYY").val() != "" && $("#promotionEdYY").val() != undefined ){
		
		var edDate = $("#promotionEdYY").val();
		var edYY = edDate.substr(0,4);
		var edMS = edDate.substr(4,2);
		var edDD = edDate.substr(6,2);
		
		var edHH = $("#promotionEdHH").val();
		var edMM = $("#promotionEdMM").val();
		com.timeSale.showtime(edYY+"-"+edMS+"-"+edDD,edHH+":"+edMM+":00", '#tx_time');	
	};
	
    // 상품 리스트
    prdPriceKingBannerList = function(cmmIdx){
    	if(cmmIdx != "2733"){
    		$("#mainPriceKingBanner").load("<c:out value="${frontDomain}" />/pc/main/mainProductDisplayListAjax.do", {"cmmIdx":cmmIdx ,"rnum":4,"type":"cl" });
    	}
    };
    
 	 // 상품 리스트
    prdMdPickProductList = function(cmmIdx){
    	$("#mainMdPickProductList").load("<c:out value="${frontDomain}" />/pc/main/mainProductDisplayListAjax.do", {"cmmIdx":cmmIdx ,"rnum":5,"type":"md" });
    };
    
    // layer popup open
    <c:choose>
    <c:when test="${not empty listPopup }" >

    var todayDate = new Date();
    var today = ""+(todayDate.getMonth()+1)+todayDate.getDate();
    
    <c:forEach var="item" items="${listPopup }" varStatus="status">
			var index = '<c:out value="${status.index}" />';
			var popMstTyp = '<c:out value="${item.POP_MST_TYP}" />';
			
			if ($.cookie("MarketPlantMainPopup_${item.POP_MST_IDX}_"+today)!="Y" ){
				if(popMstTyp == "L"){
					$('#laypop_${item.POP_MST_IDX}').css({
	    				display:'block',
	    				left:'${item.POP_MST_X}px',
	    				top:'${item.POP_MST_Y}px',
	    				width:'${item.POP_MST_W}',
	    				height:'${item.POP_MST_H}'
	    			});
				}else{
					$("#POP_MST_IDX").val('${item.POP_MST_IDX}');
					popupXY('',"${item.POP_MST_W}","${item.POP_MST_H}","${item.POP_MST_X}","${item.POP_MST_Y}",130,"no","_MainPopup_${item.POP_MST_IDX}");
					$("#popupForm").attr({"action":"<c:out value="${frontDomain}" />/pc/main/mainPopupInfo.do", "target":"popup_MainPopup_${item.POP_MST_IDX}", "method":"post"}).submit();
				}
    		}
    </c:forEach>
    </c:when>
    </c:choose>	

    prdPriceKingBannerList(priceidx);//클린킹 실행
    prdMdPickProductList(PickIdx);//md픽 실행
    
});
</script>
</body>
</html>