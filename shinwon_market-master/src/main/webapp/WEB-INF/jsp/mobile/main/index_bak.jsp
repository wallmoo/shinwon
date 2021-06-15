<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<script src="<c:out value="${cdnDomain}" />/mobile/js/main.js"></script><!-- 메인 js -->
</head>

<body class="page-main"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">
		
		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
			<!-- #hd_nav S -->
			<nav id="hd_nav" class="_hd_fix hd_nav">
				<ul class="ct mn_list">    
					<li class="on"><a href="/"><span>홈</span></a></li>
					<li><a href="javascript:void(0)"><span>쇼핑기획전</span></a></li>
					<li><a href="javascript:void(0)"><span>이벤트</span></a></li>
					<li><a href="javascript:void(0)"><span>e매거진</span></a></li>
					<li><a href="javascript:void(0)"><span>베스트20</span></a></li>
					<li><a href="javascript:void(0)"><span>공기청정기</span></a></li>
				</ul>
			</nav>
			<!-- #hd_nav E -->
	
			<!-- .main_con_box S -->
			<article id="main_con_box" class="main_con_box">
				<!-- 홈 S -->
				<div>
					<!-- .home_sec S -->
					<div class="home_sec">
						<!-- .weather_d S -->
						<section class="weather_d">
							<span class="blind">날씨별 상품 추천 섹션</span>
							<div class="msg">
								<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }" />/mobile/product/productDateList.do','_self');"  class="btn_weather">내 위치 기상정보에 맞는 추천상품 보기<i class="ar"></i></a>
							</div>
		
							<div class="weather">
								<p class="do">
									<img src="<c:out value="${cdnDomain }" />/mobile/img/main/ico_we_01.png" alt="맑음" />
									<strong id="temperTxt"><c:out value="${areaResultMap.CTY_WTH_CTM }" />°</strong>
								</p>
								<p class="add">
									<span id="locTxt"><c:out value="${areaResultMap.TODAY}" />&nbsp;<c:out value="${areaResultMap.CTY_GGU_NM }" /></span>
									<a href="<c:out value="${mobileDomain }" />/mobile/product/productDateList.do" target="_self"><strong>오늘 꼭 필요한 아이템</strong></a>
								</p>
								<div class="btn_box">
									<a href="javascript:void(0)" class="btn_gps"><span class="ir">GPS설정</span></a>
									<a href="javascript:void(0)" class="btn_close"><span class="ir">날씨 섹션 닫기</span></a>
								</div>
							</div>
						</section>
						<!--// .weather_d E -->
						<!-- .main_slider S -->
						<section class="main_slider">
							<span class="blind">메인 슬라이드 배너 센셕</span>
							<ul class="slider no_swip">
								<c:if test="${not empty MainProBannerList }">
									<c:forEach var="MainProBannerList" items="${MainProBannerList }" varStatus="i">
										<li>
										<c:choose>
											<c:when test="${MainProBannerList.BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" style="background-color:<c:out value="${MainProBannerList.BNR_MST_HEX_CD}" />">
												<img src="<c:out value="${cdnDomain}" /><c:out value="${MainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${MainProBannerList.CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainProBannerList.CMN_FLE_ALT_TXT}" />" />
												</a>	
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainProBannerList.BNR_MST_URL}" />" target="<c:out value="${MainProBannerList.BNR_MST_TGT_TARGET}" />" style="background-color:<c:out value="${MainProBannerList.BNR_MST_HEX_CD}" />">
												<img src="<c:out value="${cdnDomain}" /><c:out value="${MainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${MainProBannerList.CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainProBannerList.CMN_FLE_ALT_TXT}" />" />
												</a>
											</c:otherwise>
										</c:choose>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</section>
						<!--// .main_slider E -->
		
						<!-- .main_emagazin S -->
						<section class="main_emagazin web">
							<span class="blind">메인 e매거진 센셕</span>
							<h2>스마트 라이프를 위한 e매거진</h2>
							<ul class="list">
								<c:if test="${not empty listProductGuideList }">
									<c:forEach var="listProductGuideList" items="${listProductGuideList }" varStatus="status">
										<li class="<c:out value="${listProductGuideList.MGZ_MST_CTG_CLASS }" />">
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />','_self');">
												<span class="img_d" style="background:url(<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>) center center no-repeat;background-size:cover;">
													<img src="<c:out value="${cdnDomain }" />/mobile/img/main/msk_mgz.png" alt="매거진 사진" />
												</span>
												<strong><c:out value="${listProductGuideList.MGZ_MST_CTG_NM }" /></strong>
												<span><c:out value="${fn:length(listProductGuideList.MGZ_MST_TITLE_2) > 30? fn:substring(listProductGuideList.MGZ_MST_TITLE_2,0,30) : listProductGuideList.MGZ_MST_TITLE_2}" /></span>
											</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</section>
						
						<section class="main_emagazin app">
							<span class="blind">메인 e매거진 센셕</span>
							<h2>스마트 라이프를 위한 e매거진</h2>
							<ul class="list">
								<c:if test="${not empty listProductGuideList }">
									<c:forEach var="listProductGuideList" items="${listProductGuideList }" varStatus="status">
										<li class="<c:out value="${listProductGuideList.MGZ_MST_CTG_CLASS }" />">
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />','_self');">
												<span class="img_d" style="background:url(<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>) center center no-repeat;background-size:cover;">
													<img src="<c:out value="${cdnDomain }" />/mobile/img/main/msk_mgz.png" alt="매거진 사진" />
												</span>
												<strong><c:out value="${listProductGuideList.MGZ_MST_CTG_NM }" /></strong>
												<span><c:out value="${fn:length(listProductGuideList.MGZ_MST_TITLE_2) > 30? fn:substring(listProductGuideList.MGZ_MST_TITLE_2,0,30) : listProductGuideList.MGZ_MST_TITLE_2}" /></span>
											</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</section>
						<!--// .main_emagazin E -->
						
						
						
						<!-- .main_oneday S -->
						<c:if test="${not empty mainOneDaySaleInfo }">
						<input type="hidden" name="promotionOneSdDt" id="promotionOneSdDt" value="<c:out value="${mainOneDaySaleInfo.ONE_DAY_ST_DT}" /><c:out value="${mainOneDaySaleInfo.ONE_DAY_ST_HH}" /><c:out value="${mainOneDaySaleInfo.ONE_DAY_ST_MM}" />" />
						<input type="hidden" name="promotionOneEdDt" id="promotionOneEdDt" value="<c:out value="${mainOneDaySaleInfo.ONE_DAY_ST_DT}" /><c:out value="${mainOneDaySaleInfo.ONE_DAY_ED_HH}" /><c:out value="${mainOneDaySaleInfo.ONE_DAY_ED_MM}" />" />
						<input type="hidden" name="promotionOneEdYY" id="promotionOneEdYY" value="<c:out value="${mainOneDaySaleInfo.ONE_DAY_ST_DT}" />" />
						<input type="hidden" name="promotionOneEdHH" id="promotionOneEdHH" value="<c:out value="${mainOneDaySaleInfo.ONE_DAY_ED_HH}" />" />
						<input type="hidden" name="promotionOneEdMM" id="promotionOneEdMM" value="<c:out value="${mainOneDaySaleInfo.ONE_DAY_ED_MM}" />" />
						<section class="main_oneday">
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${mainOneDaySaleInfo.PRD_MST_CD }" />&oneDayIdx=<c:out value="${mainOneDaySaleInfo.ONE_DAY_IDX }" />','_self');">
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
											<c:out value="${fn:length(mainOneDaySaleInfo.ONE_DAY_NM) > 70 ? fn:substring(mainOneDaySaleInfo.ONE_DAY_NM,0,70) : mainOneDaySaleInfo.ONE_DAY_NM}" />
										</span>
										<strong class="tx_price"><fmt:formatNumber value="${mainOneDaySaleInfo.PRD_MST_ERP_PRC }" groupingUsed="true" /></strong>
									</span>
								</i>
								<img data-original="<c:out value="${cdnDomain}" />/<c:out value="${mainOneDaySaleInfo.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품사진" />
							</a>
						</section>
						</c:if>
						<!--// .main_oneday E -->
						
						<!-- .main_timeSale S -->
						<c:if test="${not empty mainTimeSaleInfo }">
							<input type="hidden" name="promotionTimeSdDt" id="promotionTimeSdDt" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ST_DT}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ST_HH}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ST_MM}" />" />
							<input type="hidden" name="promotionTimeEdDt" id="promotionTimeEdDt" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_DT}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ED_HH}" /><c:out value="${mainTimeSaleInfo.TIM_SAL_ED_MM}" />" />
							<input type="hidden" name="promotionTimeEdYY" id="promotionTimeEdYY" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_DT}" />" />
							<input type="hidden" name="promotionTimeEdHH" id="promotionTimeEdHH" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_HH}" />" />
							<input type="hidden" name="promotionTimeEdMM" id="promotionTimeEdMM" value="<c:out value="${mainTimeSaleInfo.TIM_SAL_ED_MM}" />" />
						<section class="main_timeSale">
							<dl>
								<dt class="ti"><span class="blind">온라인 단독! <strong>타임세일</strong></span></dt>
								<dd class="tx_time">
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
								</dd>
								<dd class="pr_info">
									<span class="blind">타임세일 정보</span>
									<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${mainTimeSaleInfo.PRD_MST_CD }" />&salIdx=<c:out value="${mainTimeSaleInfo.TIM_SAL_IDX }" />','_self');" >
										<div class="img_pr"><img data-original="<c:out value="${cdnDomain}" />/<c:out value="${mainTimeSaleInfo.PRD_IMAGE}" />" alt="<c:out value="${mainTimeSaleInfo.PRD_IMAGE_ALT}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품사진"  /></div>
									</a>
									
									<div class="tx_box">
										<strong class="ti">
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${mainTimeSaleInfo.PRD_MST_CD }" />&salIdx=<c:out value="${mainTimeSaleInfo.TIM_SAL_IDX }" />','_self');" >
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
												<br/>
												<c:out value="${mainTimeSaleInfo.TIM_SAL_NM }" />
											</a>
										</strong>
										<p>
											<span class="tx_ti">판매가</span>
											<strong class="tx"><fmt:formatNumber value="${mainTimeSaleInfo.PRD_MST_ERP_PRC }" groupingUsed="true" /><span>원</span></strong>
										</p>
										<p class="tx_emp">
											<strong class="tx_ti">게릴라가</strong>
											<strong class="tx"><fmt:formatNumber value="${mainTimeSaleInfo.PRD_MST_PRC }" groupingUsed="true" /><span>원</span></strong>
										</p>
										<p>
											<span class="tx_ti">선착순 구매수량</span>
											<strong class="tx"><fmt:formatNumber value="${mainTimeSaleInfo.PRD_MST_SEL_CNT }" groupingUsed="true" /><span>개</span></strong>
										</p>
										<p>
											<span class="tx_ti">남은수량</span>
											<strong class="tx"><fmt:formatNumber value="${mainTimeSaleInfo.TIM_SAL_PRD_CNT }" groupingUsed="true" /><span>개</span></strong>
										</p>
									</div>
								</dd>
							</dl>
						</section>
						</c:if>
						<!-- .main_timeSale E -->
						
						<!-- .main_trend S -->
						<section class="main_trend">
							<span class="blind">메인 트랜드이슈 센셕</span>
							<h2 class="ti">
								<span class="blind">TREND ISSUE</span>
							</h2>
							<ul class="slider">
								<!-- 리스트1개 S -->
								<c:if test="${fn:length(MainTrandAPrdBannerList) == 5 && (not empty MainTrandABannerList && not empty MainTrandAThemeBannerList)}">
									<li>
										<h3>
											<c:choose>
												<c:when test="${MainTrandABannerList[0].BNR_MST_TGT eq 'D' }">
													<a href="javascript:void(0)" >
												</c:when>
												<c:otherwise>
													<a href="<c:out value="${MainTrandABannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandABannerList[0].BNR_MST_TGT_TARGET}" />" >
												</c:otherwise>
											</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandABannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandABannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandABannerList[0].CMN_FLE_ALT_TXT}" />"  />
										</h3>
										<ul class="ui-grid-a list">
										<c:set var="numIdx" value="1" />
										<c:forEach var="row" items="${MainTrandAPrdBannerList }" varStatus="i">
											<c:if test="${numIdx == 1 || numIdx == 3 || numIdx == 4}">
												<li class="ui-block-a">
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />','_self');" >
														<span class="tx_img"><img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" /></span>
														<span class="tx_ti">
															<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
														</span>
													</a>
												</li>
											</c:if>
											<c:if test="${numIdx == 2 || numIdx == 5}">
												<li class="ui-block-b">
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />','_self');" >
														<span class="tx_img"><img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" /></span>
														<span class="tx_ti">
															<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
														</span>
													</a>
												</li>
											</c:if>
											<c:if test="${numIdx == 3}">
												<li class="ui-block-b li_bn"><!--배너사진만있을때-->
													<c:choose>
														<c:when test="${MainTrandAThemeBannerList[0].BNR_MST_TGT eq 'D' }">
															<a href="javascript:void(0)" >
														</c:when>
														<c:otherwise>
															<a href="<c:out value="${MainTrandAThemeBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandAThemeBannerList[0].BNR_MST_TGT_TARGET}" />" >
														</c:otherwise>
													</c:choose>
														<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandAThemeBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandAThemeBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandAThemeBannerList[0].CMN_FLE_ALT_TXT}" />"  />
													</a>
												</li>
											</c:if>
										<c:set var="numIdx" value="${numIdx + 1 }" />
										</c:forEach>
										</ul>
									</li>
								</c:if>
								<!--// 리스트1개 E -->
								<!-- 리스트2개 S -->
								<c:if test="${fn:length(MainTrandBPrdBannerList) == 5 && (not empty MainTrandBBannerList && not empty MainTrandBThemeBannerList)}">
									<li>
										<h3>
											<c:choose>
												<c:when test="${MainTrandBBannerList[0].BNR_MST_TGT eq 'D' }">
													<a href="javascript:void(0)" >
												</c:when>
												<c:otherwise>
													<a href="<c:out value="${MainTrandBBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandBBannerList[0].BNR_MST_TGT_TARGET}" />" >
												</c:otherwise>
											</c:choose>
											<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandBBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandBBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandBBannerList[0].CMN_FLE_ALT_TXT}" />" />
										</h3>
										<ul class="ui-grid-a list">
										<c:set var="numIdx" value="1" />
										<c:forEach var="row" items="${MainTrandBPrdBannerList }" varStatus="i">
											<c:if test="${numIdx == 1 || numIdx == 3 || numIdx == 4}">
												<li class="ui-block-a">
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />','_self');" >
														<span class="tx_img"><img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" /></span>
														<span class="tx_ti">
															<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
														</span>
													</a>
												</li>
											</c:if>
											<c:if test="${numIdx == 2 || numIdx == 5}">
												<li class="ui-block-b">
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />','_self');" >
														<span class="tx_img"><img src="<c:out value="${cdnDomain}" />/<c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT}" />" /></span>
														<span class="tx_ti">
															<ui:replaceLineBreak content="${fn:length(row.DSP_MST_TXT_2) > 40 ? fn:substring(row.DSP_MST_TXT_2,0,40) : row.DSP_MST_TXT_2}"/>
														</span>
													</a>
												</li>
											</c:if>
											<c:if test="${numIdx == 3}">
												<li class="ui-block-b li_bn"><!--배너사진만있을때-->
													<c:choose>
														<c:when test="${MainTrandBThemeBannerList[0].BNR_MST_TGT eq 'D' }">
															<a href="javascript:void(0)" >
														</c:when>
														<c:otherwise>
															<a href="<c:out value="${MainTrandBThemeBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainTrandBThemeBannerList[0].BNR_MST_TGT_TARGET}" />" >
														</c:otherwise>
													</c:choose>
														<img src="<c:out value="${cdnDomain}" /><c:out value="${MainTrandBThemeBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainTrandBThemeBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${MainTrandBThemeBannerList[0].CMN_FLE_ALT_TXT}" />" />
													</a>
												</li>
											</c:if>
										<c:set var="numIdx" value="${numIdx + 1 }" />
										</c:forEach>
										</ul>
									</li>
								</c:if>
								<!--// 리스트2개 E -->
							</ul>
						</section>
						<!--// .main_trend E -->
						
						<!-- .main_theme S -->
						<section class="main_theme">
							<span class="blind">메인 프라이스킹 서비스 센셕</span>
							<h2>프라이스킹 서비스</h2>
	
							<ul class=" list">
								
								<li class=" li_single">
									<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/themecategory/singleMain.do','_self');">
										<span class="ir">
											<strong>싱글 서비스 <i>go</i></strong>
											<span>이젠 독립하셔야죠?<br/>당신의 화려하고 당당한 싱글라이프</span>
										</span>
									</a>
								</li>
								<li class=" li_cleanking">
									<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/themecategory/cleankingMain.do','_self');">
										<span class="ir">
											<strong>홈케어 서비스 <i>go</i></strong>
											<span>홈케어의 모든 것!<br/>전문가의 프리이엄 홈케어 서비스</span>
										</span>
									</a>
								</li>
								<li class=" li_wedding">
									<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/themecategory/weddingMain.do','_self');" >
										<span class="ir">
											<strong>웨딩 서비스 <i>go</i></strong>
											<span>결혼하세요? <br/>당신의 설레이고 행복한 결혼. </span>
										</span>
									</a>
								</li>
							</ul>
						</section>
						<!--// .main_theme E -->
						
						<!-- .main_recommend S -->
						<section class="main_recommend">
							<span class="blind">메인 MD’s Pick 센셕</span>
							<h2>MD’s Pick</h2>
							<c:if test="${not empty MainMdPickBannerList1 && fn:length(MainMdPickProductList1) == 3 }">
								<ul class="ui-grid-a ul_st01">
									<li class="ui-block-a li_title"><!-- 리스트 타이틀 -->
										<c:choose>
											<c:when test="${MainMdPickBannerList1[0].BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" style="background:<c:out value="${MainMdPickBannerList1[0].BNR_MST_HEX_CD}" /> url(<c:out value="${cdnDomain}" /><c:out value="${MainMdPickBannerList1[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainMdPickBannerList1[0].CMM_FLE_SYS_NM}" />) center center no-repeat;    background-size: cover;"></a>
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainMdPickBannerList1[0].BNR_MST_URL}" />" target="<c:out value="${MainMdPickBannerList1[0].BNR_MST_TGT_TARGET}" />" style="background:<c:out value="${MainMdPickBannerList1[0].BNR_MST_HEX_CD}" /> url(<c:out value="${cdnDomain}" /><c:out value="${MainMdPickBannerList1[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainMdPickBannerList1[0].CMM_FLE_SYS_NM}" />) center center no-repeat;    background-size: cover;"></a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:set var="num" value="1" />
									<c:forEach var="mdPrdRow" items="${MainMdPickProductList1 }" varStatus="i">
										<li <c:out value="${num == 2 ? 'class=ui-block-a' : 'class=ui-block-b'}" />>
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${mdPrdRow.PRD_MST_CD }" />','_self');">
												<span class="tx_img"><img data-original="<c:out value="${cdnDomain}" />/<c:out value="${mdPrdRow.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${mdPrdRow.PRD_IMAGE_ALT}" />" /></span>
												<span class="tx_ti">
													<c:choose>
														<c:when test="${mdPrdRow.PRD_MST_BRAND_NM ne null && mdPrdRow.PRD_MST_ERP_CD ne null }">
															[<c:out value="${mdPrdRow.PRD_MST_BRAND_NM}" />/<c:out value="${mdPrdRow.PRD_MST_ERP_CD}" />]
														</c:when>
														<c:otherwise>
															<c:if test="${mdPrdRow.PRD_MST_BRAND_NM ne null }">
																[<c:out value="${mdPrdRow.PRD_MST_BRAND_NM}" />]	
															</c:if>
															<c:if test="${mdPrdRow.PRD_MST_ERP_CD ne null }">
																[<c:out value="${mdPrdRow.PRD_MST_ERP_CD}" />]	
															</c:if>
														</c:otherwise>
													</c:choose>
													<br>
													<c:out value="${fn:length(mdPrdRow.DSP_MST_TXT) > 16 ? fn:substring(mdPrdRow.DSP_MST_TXT,0,16) : mdPrdRow.DSP_MST_TXT}" />
												</span>
												<c:choose>
													<c:when test="${mdPrdRow.PRD_NOW_DST_POINT > 0 || mdPrdRow.PRD_CPN_DST_POINT > 0}">
														<c:choose>
															<c:when test="${mdPrdRow.PRD_CPN_DST_POINT > 0 }">
																<strong class="tx_price"><strong class="co_blue"><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>
															</c:when>
															<c:otherwise>
																<strong class="tx_price"><strong class="co_red"><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<strong class="tx_price"><strong><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
													</c:otherwise>
												</c:choose>
											</a>
										</li>
									<c:set var="num" value="${num + 1 }" />
									</c:forEach>
								</ul>
							</c:if>
							<c:if test="${not empty MainMdPickBannerList2 && fn:length(MainMdPickProductList2) == 3 }">
								<ul class="ui-grid-a ul_st02">
									<c:set var="num" value="1" />
									<c:forEach var="mdPrdRow" items="${MainMdPickProductList2 }" varStatus="i">
										<li <c:out value="${num mod 3 == 0 ? 'class=ui-block-b' : 'class=ui-block-a'}" />>
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${mdPrdRow.PRD_MST_CD }" />','_self');">
												<span class="tx_img"><img data-original="<c:out value="${cdnDomain}" />/<c:out value="${mdPrdRow.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${mdPrdRow.PRD_IMAGE_ALT}" />" /></span>
												<span class="tx_ti">
													<c:choose>
														<c:when test="${mdPrdRow.PRD_MST_BRAND_NM ne null && mdPrdRow.PRD_MST_ERP_CD ne null }">
															[<c:out value="${mdPrdRow.PRD_MST_BRAND_NM}" />/<c:out value="${mdPrdRow.PRD_MST_ERP_CD}" />]
														</c:when>
														<c:otherwise>
															<c:if test="${mdPrdRow.PRD_MST_BRAND_NM ne null }">
																[<c:out value="${mdPrdRow.PRD_MST_BRAND_NM}" />]	
															</c:if>
															<c:if test="${mdPrdRow.PRD_MST_ERP_CD ne null }">
																[<c:out value="${mdPrdRow.PRD_MST_ERP_CD}" />]	
															</c:if>
														</c:otherwise>
													</c:choose>
													<br>
													<c:out value="${fn:length(mdPrdRow.DSP_MST_TXT) > 16 ? fn:substring(mdPrdRow.DSP_MST_TXT,0,16) : mdPrdRow.DSP_MST_TXT}" />
												</span>
												<c:choose>
													<c:when test="${mdPrdRow.PRD_NOW_DST_POINT > 0 || mdPrdRow.PRD_CPN_DST_POINT > 0}">
														<c:choose>
															<c:when test="${mdPrdRow.PRD_CPN_DST_POINT > 0 }">
																<strong class="tx_price"><strong class="co_blue"><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>
															</c:when>
															<c:otherwise>
																<strong class="tx_price"><strong class="co_red"><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<strong class="tx_price"><strong><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
													</c:otherwise>
												</c:choose>
											</a>
										</li>
										<c:if test="${num == 1 }">
											<li class="ui-block-b li_title"><!-- 리스트 타이틀 -->
												<c:choose>
													<c:when test="${MainMdPickBannerList2[0].BNR_MST_TGT eq 'D' }">
														<a href="javascript:void(0)" style="background:<c:out value="${MainMdPickBannerList2[0].BNR_MST_HEX_CD}" /> url(<c:out value="${cdnDomain}" /><c:out value="${MainMdPickBannerList2[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainMdPickBannerList2[0].CMM_FLE_SYS_NM}" />) center center no-repeat;    background-size: cover;"></a>
													</c:when>
													<c:otherwise>
														<a href="<c:out value="${MainMdPickBannerList2[0].BNR_MST_URL}" />" target="<c:out value="${MainMdPickBannerList2[0].BNR_MST_TGT_TARGET}" />" style="background:<c:out value="${MainMdPickBannerList2[0].BNR_MST_HEX_CD}" /> url(<c:out value="${cdnDomain}" /><c:out value="${MainMdPickBannerList2[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainMdPickBannerList2[0].CMM_FLE_SYS_NM}" />) center center no-repeat;    background-size: cover;"></a>
													</c:otherwise>
												</c:choose>
											</li>
										</c:if>
									<c:set var="num" value="${num + 1 }" />
									</c:forEach>
								</ul>
							</c:if>
							<c:if test="${not empty MainMdPickBannerList3 && fn:length(MainMdPickProductList3) == 3 }">
								<ul class="ui-grid-a ul_st03">
									<li class="ui-block-a li_title"><!-- 리스트 타이틀 -->
										<c:choose>
											<c:when test="${MainMdPickBannerList3[0].BNR_MST_TGT eq 'D' }">
												<a href="javascript:void(0)" style="background:<c:out value="${MainMdPickBannerList3[0].BNR_MST_HEX_CD}" /> url(<c:out value="${cdnDomain}" /><c:out value="${MainMdPickBannerList3[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainMdPickBannerList3[0].CMM_FLE_SYS_NM}" />) center center no-repeat;    background-size: cover;"></a>
											</c:when>
											<c:otherwise>
												<a href="<c:out value="${MainMdPickBannerList3[0].BNR_MST_URL}" />" target="<c:out value="${MainMdPickBannerList3[0].BNR_MST_TGT_TARGET}" />" style="background:<c:out value="${MainMdPickBannerList3[0].BNR_MST_HEX_CD}" /> url(<c:out value="${cdnDomain}" /><c:out value="${MainMdPickBannerList3[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainMdPickBannerList3[0].CMM_FLE_SYS_NM}" />) center center no-repeat;    background-size: cover;"></a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:set var="num" value="1" />
									<c:forEach var="mdPrdRow" items="${MainMdPickProductList3 }" varStatus="i">
										<li <c:out value="${num == 2 ? 'class=ui-block-a' : 'class=ui-block-b'}" />>
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${mdPrdRow.PRD_MST_CD }" />','_self');">
												<span class="tx_img"><img data-original="<c:out value="${cdnDomain}" />/<c:out value="${mdPrdRow.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${mdPrdRow.PRD_IMAGE_ALT}" />" /></span>
												<span class="tx_ti">
													<c:choose>
														<c:when test="${mdPrdRow.PRD_MST_BRAND_NM ne null && mdPrdRow.PRD_MST_ERP_CD ne null }">
															[<c:out value="${mdPrdRow.PRD_MST_BRAND_NM}" />/<c:out value="${mdPrdRow.PRD_MST_ERP_CD}" />]
														</c:when>
														<c:otherwise>
															<c:if test="${mdPrdRow.PRD_MST_BRAND_NM ne null }">
																[<c:out value="${mdPrdRow.PRD_MST_BRAND_NM}" />]	
															</c:if>
															<c:if test="${mdPrdRow.PRD_MST_ERP_CD ne null }">
																[<c:out value="${mdPrdRow.PRD_MST_ERP_CD}" />]	
															</c:if>
														</c:otherwise>
													</c:choose>
													<br>
													<c:out value="${fn:length(mdPrdRow.DSP_MST_TXT) > 16 ? fn:substring(mdPrdRow.DSP_MST_TXT,0,16) : mdPrdRow.DSP_MST_TXT}" />
												</span>
												<c:choose>
													<c:when test="${mdPrdRow.PRD_NOW_DST_POINT > 0 || mdPrdRow.PRD_CPN_DST_POINT > 0}">
														<c:choose>
															<c:when test="${mdPrdRow.PRD_CPN_DST_POINT > 0 }">
																<strong class="tx_price"><strong class="co_blue"><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>
															</c:when>
															<c:otherwise>
																<strong class="tx_price"><strong class="co_red"><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<strong class="tx_price"><strong><fmt:formatNumber value="${mdPrdRow.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></strong>																			
													</c:otherwise>
												</c:choose>
											</a>
										</li>
									<c:set var="num" value="${num + 1 }" />
									</c:forEach>
								</ul>
							</c:if>
						</section>
						<!--// .main_recommend E -->
		
						<!-- .main_banner S -->
						<c:if test="${not empty MainBottomEventBannerList }">
							<section class="main_banner">
								<span class="blind">메인 배너 센셕</span>
								<c:choose>
									<c:when test="${MainBottomEventBannerList[0].BNR_MST_TGT eq 'D' }">
										<a href="javascript:void(0)">
									</c:when>
									<c:otherwise>
										<a href="<c:out value="${MainBottomEventBannerList[0].BNR_MST_URL}" />" target="<c:out value="${MainBottomEventBannerList[0].BNR_MST_TGT_TARGET}" />" >
									</c:otherwise>
								</c:choose>
								<img data-original="<c:out value="${cdnDomain}" /><c:out value="${MainBottomEventBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${MainBottomEventBannerList[0].CMM_FLE_SYS_NM}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${MainBottomEventBannerList[0].CMN_FLE_ALT_TXT}" />" />
								</a>
							</section>
						</c:if>
						<!--// .main_banner E -->
					</div>
				</div>
				<!--// 홈 E -->
				<!-- 쇼핑기획전 S -->
				<div>
					<section class="main_exhibi">
						<span class="blind">메인에 쇼핑기획전 센셕</span>
						<c:if test="${not empty listMenuCategory }">
							<div class="sel_box">
								<label for="sel_exTy" class="sel_box_st0">
									<select id="searchPlan" name="searchPlan" onchange="getSearchPlan(this.value);">
										<option value="">전체</option>
										<c:forEach var="listMenuCategory" items="${listMenuCategory}" varStatus="Status">
											<option value="<c:out value="${listMenuCategory.PRD_CTG_IDX }" />" <ui:select v="${listMenuCategory.PRD_CTG_IDX}" t="${commandMap.searchPlnMstCtg }" g="selected"/>><c:out value="${listMenuCategory.PRD_CTG_NM }" /></option>
										</c:forEach>
									</select>
								</label>
							</div>
						</c:if>
						<ul class="list _scroll_list_ck">
							<c:choose>
								<c:when test="${not empty planList }">
									<c:forEach var="planList" items="${planList }" varStatus="i">
										<li>
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value="${planList.PLN_MST_IDX }" />','_self');" >
												<img data-original="<c:out value="${cdnDomain}" /><c:out value="${planList.CMM_FLE_ATT_PATH}" /><c:out value="${planList.CMM_FLE_SYS_NM}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" height=225 alt="<c:out value="${planList.CMN_FLE_ALT_TXT}" />" />
												<strong class="tx_ti"><c:out value="${fn:length(planList.PLN_MST_TITLE) > 30 ? fn:substring(planList.PLN_MST_TITLE,0,30) : planList.PLN_MST_TITLE}" /></strong>
											</a>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="no_list">
										<span>진행중인 기획전이 없습니다.</span>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</section>
				</div>
				<!--// 쇼핑기획전 E -->
	
				<!-- 이벤트 S -->
				<div>
					<section class="main_event">
						<nav>
							<a href="<c:out value="${mobileDomain }"/>/mobile/event/eventMain.do" target="_self" class="mn_0"><strong>이벤트</strong></a>
							<a href="<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do" target="_self" class="mn_1"><strong>회원혜택</strong></a>
							<a href="<c:out value="${mobileDomain }"/>/mobile/event/couponBenefit.do" target="_self" class="mn_2"><strong>쿠폰혜택</strong></a>
							<a href="<c:out value="${mobileDomain }"/>/mobile/event/cardBenefit.do" target="_self" class="mn_3"><strong>카드혜택</strong></a>
						</nav>
						<c:if test="${not empty mainEventPmtionList }">
						<header class="slider">
							<ul>
								<c:forEach var="row" items="${mainEventPmtionList }" varStatus="i">
									<li>
										<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM}" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
										</a>
									</li>	
								</c:forEach>
							</ul>
						</header>
						</c:if>
						<div class="dang_d">
							<a href="<c:out value="${mobileDomain }"/>/mobile/customer/eventWinList.do" target="_self">
								<strong>이벤트 당첨자발표</strong>
								<span>응모한 이벤트 당첨자 확인하세요!<i class="ico_ar"></i></span>
							</a>
						</div>
						<dl class="event_ing">
							<c:if test="${not empty mainEventCardList }">
								<dt>
									<h3><strong>이달의 카드 혜택</strong></h3>
									<hr class="hr_4px_st0" />
								</dt>
								<dd>
									<a href="<c:out value="${mainEventCardList[0].BNR_MST_URL}" />" target="<c:out value="${mainEventCardList[0].BNR_MST_TGT_TARGET}" />">
										<img data-original="<c:out value="${cdnDomain}" /><c:out value="${mainEventCardList[0].CMM_FLE_ATT_PATH}" /><c:out value="${mainEventCardList[0].CMM_FLE_SYS_NM}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" src="" alt="<c:out value="${mainEventCardList[0].CMN_FLE_ALT_TXT}" />" />
									</a>
								</dd>
							</c:if>
							<dt>
								<h3><strong>신규가입혜택</strong></h3>
								<hr class="hr_4px_st0" />
							</dt>
							<dd>
								<a href="<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do" target="_self">
									<img data-original="<c:out value="${cdnDomain}" />/mobile/img/main/img_ev_test2.jpg" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="신규가입혜택" />
								</a>
							</dd>
							<c:if test="${not empty mainEventNewList }">
								<dt class="tx_li2">
									<h3><strong>이벤트 참여하고<br/>다양한 혜택을 받아보세요</strong></h3>
									<hr class="hr_4px_st0" />
								</dt>
								<dd>
									<c:forEach var="row" items="${mainEventNewList }" varStatus="i">
										<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM}" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
											<strong class="tx_ti"><c:out value="${row.BNR_MST_TITLE}" /></strong>
											<span class="tx_tyNdate">
												<strong><c:out value="${row.BNR_MST_SUB_TITLE}" /></strong>
												<!-- <span>2015.11.01 ~ 2015.11.31</span> -->
											</span>
										</a>
									</c:forEach>
								</dd>
							</c:if>
							<c:if test="${not empty mainEventOtherList }">
								<dt class="blind">카드할인 이벤트</dt>
								<dd class="dd_card">
									<c:forEach var="row" items="${mainEventOtherList }" varStatus="i">
										<a href="<c:out value="${row.BNR_MST_URL}" />" target="<c:out value="${row.BNR_MST_TGT_TARGET}" />">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM}" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT}" />" />
										</a>
									</c:forEach>
								</dd>
							</c:if>
						</dl>
					</section>
				</div>
				<!--// 이벤트 E -->
	
				<!-- e매거진 S -->
				<div>				
					<section class="main_ezin">
						<header>
							<h2>
								<strong class="blind">e매거진</strong>
								<span class="blind">똑똑한 습관, 프라이스킹 쇼핑백서</span>
							</h2>
							<nav class="ui-grid-c">
								<a href="javascript:void(0);" target="_self" class="ui-block-a on"><strong>전체</strong></a>
								<a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineMain.do?MGZ_MST_CTG=2014" target="_self" class="ui-block-b"><strong>라이프가이드</strong></a>
								<a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineMain.do?MGZ_MST_CTG=2015" target="_self" class="ui-block-c"><strong>구매가이드</strong></a>
								<a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineMain.do?MGZ_MST_CTG=2016" target="_self" class="ui-block-d"><strong>상품리뷰</strong></a>
								<a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineMain.do?MGZ_MST_CTG=2017" target="_self" class="ui-block-a"><strong>상품뉴스</strong></a>
								<%-- <a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineList.do?MGZ_MST_CTG=2018" target="_self" class="ui-block-b"><strong>Stuff</strong></a> --%>
								<a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineMain.do?MGZ_MST_CTG=2279" target="_self" class="ui-block-c"><strong>테마</strong></a>
							</nav>
							<i class="ico_bg" style="background:url(http://www.etland.co.kr/etlandbo/product/images/2620EZine.jpg) center center no-repeat;background-size: cover;"></i>
						</header>
						<ul class="list_d">
							<c:if test="${not empty listProductGuideList2 }">
								<c:forEach var="listProductGuideList" items="${listProductGuideList2 }" varStatus="status">
									<c:choose>
										<c:when test="${listProductGuideList.MGZ_MST_CTG ne '2017' }">
											<li class="img_st">
												<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />','_self');">
													<i class="<c:out value="${listProductGuideList.MGZ_MST_CTG_CLASS }" />"><span><c:out value="${listProductGuideList.MGZ_MST_CTG_NM }" /></span></i>
													<img data-original="<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif"  alt="<c:out value="${listProductGuideList.CMN_FLE_ALT_TXT }" />" />
													<strong class="tx_ti"><c:out value="${listProductGuideList.MGZ_MST_TITLE}" /></strong>
													<span class="tx_con"><c:out value="${listProductGuideList.MGZ_MST_CPY}" /></span>
												</a>
											</li>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${listProductGuideList.MGZ_MST_KID ne 'T' }">
													<li class="img_st">
														<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />','_self');">
															<i class="ico_prNew"><span>상품뉴스</span></i>
															<img data-original="<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif"  alt="<c:out value="${listProductGuideList.CMN_FLE_ALT_TXT }" />" />
															<strong class="tx_ti"><c:out value="${listProductGuideList.MGZ_MST_TITLE}" /></strong>
															<span class="tx_con"><c:out value="${listProductGuideList.MGZ_MST_CPY}" /></span>
														</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="tx_st">
														<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />','_self');">
															<i class="ico_prNew"><span>상품뉴스</span></i>
															<strong class="tx_ti"><c:out value="${listProductGuideList.MGZ_MST_TITLE}" /></strong>
															<span class="tx_con">
																<c:choose>
																	<c:when test="${fn:length(listProductGuideList.MGZ_MST_CTS) > 180 }">
																		<ui:replaceLineBreak content="${fn:substring(fn:replace(fn:replace(listProductGuideList.MGZ_MST_CTS,'<p>',''),'</p>',''),0,180) }"/>...
																	</c:when>
																	<c:otherwise>
																		<ui:replaceLineBreak content="${fn:replace(fn:replace(listProductGuideList.MGZ_MST_CTS,'<p>',''),'</p>','') }"/>
																	</c:otherwise>
																</c:choose>
															</span>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</ul>
					</section>
				</div>
				<!--// e매거진 E -->
				<!-- 베스트20 S -->
				<div>
					<section class="main_best20">
						<header>
							<h2>
								<strong class="blind">실시간 베스트 20</strong>
								<span class="blind">BEST PRODUCT</span>
							</h2>
						</header>
						<nav class="ui-grid-b">
							<c:if test="${not empty listMenuCategory }">
								<a href="javascript:getCateBest('');" class="ui-block-a <ui:select v="${commandMap.catPrdIdx}" t="" g="on"/>"><strong>전체</strong></a>
								<c:set var="num" value="1" />
								<c:forEach var="bestRow" items="${listMenuCategory }" varStatus="i">
									<c:if test="${num == 1 || num == 4 || num == 7}">
										<a href="javascript:getCateBest('<c:out value="${bestRow.PRD_CTG_IDX }" />');" class="ui-block-b <ui:select v="${bestRow.PRD_CTG_IDX}" t="${commandMap.catPrdIdx }" g="on"/>"><strong><c:out value="${bestRow.PRD_CTG_NM }" /></strong></a>
									</c:if>
									<c:if test="${num == 2 || num == 5 || num == 8}">
										<a href="javascript:getCateBest('<c:out value="${bestRow.PRD_CTG_IDX }" />');" class="ui-block-c <ui:select v="${bestRow.PRD_CTG_IDX}" t="${commandMap.catPrdIdx }" g="on"/>"><strong><c:out value="${bestRow.PRD_CTG_NM }" /></strong></a>
									</c:if>
									<c:if test="${num == 3 || num == 6 || num == 9}">
										<a href="javascript:getCateBest('<c:out value="${bestRow.PRD_CTG_IDX }" />');" class="ui-block-a <ui:select v="${bestRow.PRD_CTG_IDX}" t="${commandMap.catPrdIdx }" g="on"/>"><strong><c:out value="${bestRow.PRD_CTG_NM }" /></strong></a>
									</c:if>
								</c:forEach>
							</c:if>
						</nav>
						
						<dl class="tab_d">
							<dt class="tab_mn ui-grid-a">
								<a href="javascript:void(0)" class="ui-block-a on" data-tabcon="on_beast"><strong>온라인 베스트</strong></a>
								<a href="javascript:void(0)" class="ui-block-b" data-tabcon="off_beast"><strong>오프라인 매장 베스트</strong></a>
							</dt>
							<dd id="on_beast" class="tab_con">
								<ol>
									<c:choose>
										<c:when test="${not empty onLineListProduct }">
											<c:set var="bestNum" value="1" />
											<c:forEach var="onLineListProduct" items="${onLineListProduct }" varStatus="i">
												<li>
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${onLineListProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${commandMap.catIdx}" />','_self');" class="img_a">
														<c:choose>
															<c:when test="${bestNum < 10 }">
																<i class="ico_best0<c:out value="${bestNum }" />"><span class="blind">best <c:out value="${bestNum }" /></span></i>
															</c:when>
															<c:otherwise>
																<i class="ico_best<c:out value="${bestNum }" />"><span class="blind">best <c:out value="${bestNum }" /></span></i>
															</c:otherwise>
														</c:choose>
														<img data-original="<c:out value="${cdnDomain}" />/<c:out value="${onLineListProduct.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${onLineListProduct.PRD_IMAGE_ALT}" />" />
													</a>
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${onLineListProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${commandMap.catIdx}" />','_self');" class="tx_a">
														<i class="ico_box">
															<ui:replaceLineBreak content="${onLineListProduct.PRD_MST_ICON_LIST }"/>
														</i>
														<span class="tx_ti"><c:out value="${onLineListProduct.PRD_MST_NM }"/></span>
														<span class="tx_price">
															<strong><fmt:formatNumber value="${onLineListProduct.PRD_MST_PRICE }" groupingUsed="true" /></strong>
															<span class="tx_won">원</span>
														</span>
													</a>
												</li>
											<c:set var="bestNum" value="${bestNum + 1 }" />
											</c:forEach>
										</c:when>
										<c:otherwise>
											<li class="no_list">등록된 온라인 베스트 상품이 없습니다.</li>
										</c:otherwise>
									</c:choose>
								</ol>
							</dd>
							<dd id="off_beast" class="tab_con">
								<ol>
									<c:choose>
										<c:when test="${not empty offLineListProduct }">
											<c:set var="bestNum" value="1" />
											<c:forEach var="offLineListProduct" items="${offLineListProduct }" varStatus="i">
												<li>
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${offLineListProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${commandMap.catIdx}" />','_self');" class="img_a">
														<c:choose>
															<c:when test="${bestNum < 10 }">
																<i class="ico_best0<c:out value="${bestNum }" />"><span class="blind">best <c:out value="${bestNum }" /></span></i>
															</c:when>
															<c:otherwise>
																<i class="ico_best<c:out value="${bestNum }" />"><span class="blind">best <c:out value="${bestNum }" /></span></i>
															</c:otherwise>
														</c:choose>
														<img data-original="<c:out value="${cdnDomain}" />/<c:out value="${offLineListProduct.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${offLineListProduct.PRD_IMAGE_ALT}" />" />
													</a>
													<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${offLineListProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${commandMap.catIdx}" />','_self');" class="tx_a">
														<i class="ico_box">
															<ui:replaceLineBreak content="${offLineListProduct.PRD_MST_ICON_LIST }"/>
														</i>
														<span class="tx_ti"><c:out value="${offLineListProduct.PRD_MST_NM }"/></span>
														<span class="tx_price">
															<strong><fmt:formatNumber value="${offLineListProduct.PRD_MST_PRICE }" groupingUsed="true" /></strong>
															<span class="tx_won">원</span>
														</span>
													</a>
												</li>
											<c:set var="bestNum" value="${bestNum + 1 }" />
											</c:forEach>
										</c:when>
										<c:otherwise>
											<li class="no_list">등록된 온라인 베스트 상품이 없습니다.</li>
										</c:otherwise>
									</c:choose>
								</ol>
							</dd>
						</dl>
					</section>
				</div>
				<!--// 베스트20 E -->
				<!-- 공기청정기 S -->
				<div>
					<section class="main_airCl">
						<c:if test="${not empty mainCateBannerList }">
							<header>
								<a href="<c:out value="${mainCateBannerList[0].BNR_MST_URL}" />" target="<c:out value="${mainCateBannerList[0].BNR_MST_TGT_TARGET}" />">
									<img data-original="<c:out value="${cdnDomain}" /><c:out value="${mainCateBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${mainCateBannerList[0].CMM_FLE_SYS_NM}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" src="" alt="<c:out value="${mainCateBannerList[0].CMN_FLE_ALT_TXT}" />" />
								</a>
							</header>
						</c:if>
						<div class="sel_box">
							<label for="orderPick" class="sel_box_st0">
								<select id="orderPick" name="orderPick" onchange="getSearchPrd(this.value);">
									<option value="hit" <ui:select v="${commandMap.orderPickType}" t="hit" g="selected"/>>인기순</option>
									<option value="new" <ui:select v="${commandMap.orderPickType}" t="new" g="selected"/>>최신순</option>
								</select>
							</label>
						</div>
	
						<ul class="ui-grid-a list">
							<c:choose>
								<c:when test="${not empty cateListProduct }">
									<c:set var="cateNum" value="1" />
									<c:forEach var="cateListProduct" items="${cateListProduct }" varStatus="i">
										<li class="<c:out value="${cateNum % 2 == 0 ? 'ui-block-b' : 'ui-block-a' }"/> ">
											<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${cateListProduct.PRD_MST_CD }" />','_self');" class="_pg_link">
												<span class="tx_img"><img data-original="<c:out value="${cdnDomain}" /><c:out value="${cateListProduct.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="<c:out value="${cateListProduct.PRD_IMAGE_ALT}" />" /></span>
												<span class="tx_ti"><c:out value="${cateListProduct.PRD_MST_NM }"/></span>
												<strong class="tx_price">
													<fmt:formatNumber value="${cateListProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span>
													<c:if test="${cateListProduct.PRD_NOW_DST_POINT > 0}">
														<em class="discount">
															<span class="blind">할인률</span>
															<strong class="tx_num"><c:out value="${cateListProduct.PRD_NOW_DST_POINT}" /></strong>%
														</em>
													</c:if>
												</strong>
											</a>
										</li>
									<c:set var="cateNum" value="${cateNum + 1 }" />
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="no_list">등록된 상품이 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</section>
				</div>
				<!--// 공기청정기 E -->
			</article>
			<!--// .main_con_box E -->
			
				
	
			
			<!-- 메인 팝업 2016-03-18 -->
			<c:choose>
				<c:when test="${not empty listPopup }" >
					<c:forEach var="item" items="${listPopup }" varStatus="status">
						<c:if test="${item.POP_MST_TYP eq 'L' }">
							<div id="laypop_${item.POP_MST_IDX}" class="laypop2">
								<dl class="laypop_con" style="">
									<dt class="blind">이벤트 레이어 팝업</dt>
									<dd class="con_img">
										<a href="<c:out value="${item.POP_MST_LNK}" />" target="<c:out value="${item.POP_MST_MDE eq 'N' ? '_blank' : '_self' }"/>">
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
										<a href="javascript:mainPopupClose();" data-id="${item.POP_MST_IDX}" class="btn_close"><strong>닫기</strong></a>
									</dd>
								</dl>		
							</div>
						</c:if>
					</c:forEach>
				</c:when>
			</c:choose>				
			<!-- // 메인 팝업 2016-03-18 -->
	
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<form id="searchForm" name="searchForm">
<input type="hidden" name="catPrdIdx" id="catPrdIdx" value="<c:out value="${commandMap.catPrdIdx }" />" />
<input type="hidden" name="searchPlnMstCtg" id="searchPlnMstCtg" value="<c:out value="${commandMap.searchPlnMstCtg }" />" />
<input type="hidden" name="sectionState" id="sectionState" value="<c:out value="${commandMap.sectionState }" />" />
<input type="hidden" name="orderPickType" id="orderPickType" value="<c:out value="${commandMap.orderPickType }" />" />
</form>
<form id="popFrm" name="popFrm">
<input type="hidden" name="cPage" id="cPage" value="1"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount }" />"/>
</form>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
$(function(){
	//$.com.cate.util();
	//원데이특가
	if($("#promotionTimeEdYY").val() != "" && $("#promotionTimeEdYY").val() != undefined ){
		
		var edDate = $("#promotionTimeEdYY").val();
		var edYY = edDate.substr(0,4);
		var edMS = edDate.substr(4,2);
		var edDD = edDate.substr(6,2);
		
		var edHH = $("#promotionTimeEdHH").val();
		var edMM = $("#promotionTimeEdMM").val();
		
		//메인 JUST 1 DAY
		$.com.timeSale.showtime(edYY+"-"+edMS+"-"+edDD,edHH+":"+edMM+":00", '#tx_time');
	};
	//베스트20 카테고리별 이동
	getCateBest = function(CateIdx){
		$("#catPrdIdx").val(CateIdx);
		$("#sectionState").val(4);
		$("#searchForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/main/index.do", "target":"_self", "method":"post"}).submit();
	};
	
	//기획전 이동
	getSearchPlan = function(ctgIdx){
		$("#searchPlnMstCtg").val(ctgIdx);
		$("#sectionState").val(1);
		$("#searchForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/main/index.do", "target":"_self", "method":"post"}).submit();
	};
	
	//추천상품 이동
	getSearchPrd = function(orderType){
		$("#orderPickType").val(orderType);
		$("#sectionState").val(5);
		$("#searchForm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/main/index.do", "target":"_self", "method":"post"}).submit();
	};
	
	var sectionState = $("#sectionState").val();
	//해당 섹션이 있다면 섹션 유지
	if(sectionState != ""){
		$.com.main.hd_nav_xy('click', sectionState);
		$.com.main.swip_xy($('.mn_list li a'), sectionState, true);
	};
	
	//메인팝업 및 레이어 닫기
    $('.laypop2 .btn_close').on('click', function(e){
    	var todayDate = new Date();
	    var today = ""+(todayDate.getMonth()+1)+todayDate.getDate();
    	var popup_idx = $(this).data("id");
        var $this = $(this).parent("dd").parent("dl").parent("div");
        // 팝업 닫기전에 오늘하루 보지 않음 체크 
        if($this.find("input[id^=inp_today_]").is(":checked") == true )
        {
        	$.cookie("EtlandMainPopup_"+popup_idx+"_"+today, "Y", { path: '/', expires: 1 }  );
        }
        $('#laypop_'+popup_idx).hide();
    });
	
	// layer popup open
    <c:choose>
    <c:when test="${not empty listPopup }" >

    var todayDate = new Date();
    var today = ""+(todayDate.getMonth()+1)+todayDate.getDate();
    
    var popCtnW = Math.round($('.laypop_con').width()/2),
	popCtnH = Math.round($('.laypop_con').height()/2),
	winW = Math.round(window.innerWidth/2),
	winH = Math.round(window.innerHeight/2);
    
    <c:forEach var="item" items="${listPopup }" varStatus="status">
			var index = '<c:out value="${status.index}" />';
			var popMstTyp = '<c:out value="${item.POP_MST_TYP}" />';
			if ($.cookie("EtlandMainPopup_${item.POP_MST_IDX}_"+today)!="Y" ){
				$('#laypop_${item.POP_MST_IDX}').css({
    				display:'block'
    			});
				$('.laypop_con').css({'top' : winH+'px', 'left': winW+'px','marginLeft' : -popCtnW, 'marginTop' : -popCtnH});
    		}
    </c:forEach>
    </c:when>
    </c:choose>	
	
  //레이어 팝업(광고)
  //$.com.util.layPop('open', $('#layAd'));
  //새로고침? 위치찾아가야할때
<c:if test="${not empty commandMap.mainTabIndex}" >	  
  $(function(){
  	$.com.main.hd_nav_xy('click', <c:out value="${commandMap.mainTabIndex}" />);
  	$.com.main.swip_xy($('.mn_list li a'), <c:out value="${commandMap.mainTabIndex}" />, true);
  });
  </c:if>
});

 	$.com.win_scrollList = true;//스크롤 할거야~
 	function _return_scrollList(_idx, _reNum){
 		/*
 			_idx = 리스트감싸고있는 객체
 			_reNum = 리턴 몇번째넘어왔는지
 		*/
 		var totalCount = $("#totalCount").val();
 	    var addcPage = $("#cPage").val();
 	    var searchPlnMstCtg = $("#searchPlnMstCtg").val();
 	    totalCount = Math.ceil(totalCount / 10);
 	    
 	    if(_reNum < 2){
 			cPage = _reNum + 2;
 		}else{
 			cPage = parseInt(addcPage) + 1;
 		}
 	    $("#cPage").val(cPage);
 		
 		if(cPage <= totalCount){
 			$.ajax({
 	            async : false,
 	            type : "POST",
 	            data : { "cPage": cPage ,"searchPlnMstCtg" : searchPlnMstCtg},
 	            dataType : "html",
 	            url : "<c:out value="${mobileDomain}" />/mobile/main/planListAjax.do",
 	            success : function (data) 
 	            {
 	            	if(data != null)
 	    			{
 	            		
 	            		 _idx.append(data);
 	            		 _idx.find('img').lazyload();
 	    			}
 	    			else
 	    			{
 	    				alert("조회된 데이터가 없습니다.");
 	    			}
 	            },
 	            error : function (err)
 	            {
 	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
 	            }
 	    	});
 		}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
 	}
</script>


</body>
</html>