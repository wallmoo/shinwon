<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>

<body class="page-cate">

<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<!-- #container S -->
	<article id="container" class="container sub_cateCon">
		<div class="contents"><!-- .contents S -->
			<div class="minW category_tit">
				<dl class="loc">
					<dt class="blind">현제 카테고리 경로</dt>
					<dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
					<c:if test="${not empty listCategoryPath }">
						<c:forEach var="listCategoryPath" items="${listCategoryPath }" varStatus="status">
							<c:choose>
								<c:when test="${listCategoryPath.PRD_CTG_LEVEL == 1}">
									<dd><a href="<c:out value="${frontDomain }"/>/pc/product/productMain.do?idx=<c:out value="${listCategoryPath.PRD_CTG_IDX }" />"><span>${listCategoryPath.PRD_CTG_NM}</span></a></dd>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${listCategoryPath.PRD_CTG_IDX == cateIdx }">
											<dd class="l"><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${listCategoryPath.PRD_CTG_IDX }" />"><span>${listCategoryPath.PRD_CTG_NM}</span></a></dd>
										</c:when>
										<c:otherwise>
											<dd><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${listCategoryPath.PRD_CTG_IDX }" />"><span>${listCategoryPath.PRD_CTG_NM}</span></a></dd>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</dl>
				<h3 class="no_li"><span class="tx">${middleCateName}</span></h3>
				
				<!-- .sub_cateList S -->
				<nav class="sub_cateList">
					<c:if test="${not empty listMenuSubCategory }">
						<c:set var="subCateNum" value="1" />
						<c:forEach var="listMenuSubCategory" items="${listMenuSubCategory}" varStatus="Status">
							<c:choose>
								<c:when test="${subCateNum  < 6  }">
									<a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${listMenuSubCategory.PRD_CTG_IDX }" />" <ui:select v="${listMenuSubCategory.PRD_CTG_IDX}" t="${cateIdx }" g="class=on"/> ><span><c:out value="${listMenuSubCategory.PRD_CTG_NM }" /></span></a>
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${listMenuSubCategory.PRD_CTG_IDX }" />" class="li_2 <ui:select v="${listMenuSubCategory.PRD_CTG_IDX}" t="${cateIdx }" g="on"/>"><span><c:out value="${listMenuSubCategory.PRD_CTG_NM }" /></span></a>
								</c:otherwise>
							</c:choose>
						<c:set var="subCateNum" value="${subCateNum + 1 }" />
						</c:forEach>
						<c:choose>
							<c:when test="${subCateNum  < 6  }">
								<c:if test="${(fn:length(listMenuSubCategory)) mod 5 ne 0 }">
									<c:forEach var="i" begin="1" end="${5 - ((fn:length(listMenuSubCategory)) mod 5)}">
										<a href="javascript:void(0)"><span></span></a>
									</c:forEach>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${(fn:length(listMenuSubCategory)) mod 5 ne 0 }">
									<c:forEach var="i" begin="1" end="${5 - ((fn:length(listMenuSubCategory)) mod 5)}">
										<i class="li_2"></i>
									</c:forEach>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:if>
				</nav>
				<!-- .sub_cateList E -->
			</div>
			<dl class="minW cate_best">
				<dt>
					<h3>Category Best</h3>
				</dt>
				<dd class="list">
					<ol>
						<c:choose>
							<c:when test="${not empty bestListProduct }">
								<c:set var="listNum" value="1" />
								<c:forEach var="listProduct" items="${bestListProduct }" varStatus="status">
									<li <c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT }">class="no_hover"</c:if>>
										<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || listProduct.PRD_MST_SEL_CNT == 0}">
											<i class="tx_soldout">
												<strong>일시품절</strong>
											</i>
										</c:if>
										<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT }">
											<i class="tx_soldout">
												<strong>품절</strong>
											</i>
										</c:if>
										<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${cateIdx}" />">
											<i class="ico_best0<c:out value="${listNum }"/>"><span class="blind">best 0<c:out value="${listNum }"/></span></i>
											<img src="<c:out value="${cdnDomain}" />/<c:out value="${listProduct.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${listProduct.PRD_IMAGE_ALT}" />" />
											<span class="ti"><c:out value="${fn:length(listProduct.PRD_MST_NM) > 46 ? fn:substring(listProduct.PRD_MST_NM,0,46) : listProduct.PRD_MST_NM }"/></span>
											<c:if test="${listProduct.PRD_MST_ERP_PRC > listProduct.PRD_MST_PRICE }">
												<strong class="pr_m"><strong><fmt:formatNumber value="${listProduct.PRD_MST_ERP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>	
											</c:if>
											<c:choose>
												<c:when test="${listProduct.PRD_NOW_DST_POINT > 0}">
													<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span></strong></strong>
												</c:when>
												<c:otherwise>
													<strong class="sel_m"><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span></strong>													
												</c:otherwise>
											</c:choose>
											<span class="star_box <c:if test="${listProduct.REP_CNT == 0 }">no_star</c:if>">
												<i class="ico_star3"><i class="star_<c:out value="${listProduct.REP_POINT_GRD }"/>"><span class="blind">별점 <c:out value="${listProduct.REP_POINT }"/>점</span></i></i>
												<strong class="re_num"><c:out value="${listProduct.REP_CNT }"/>개</strong>
											</span>
											<span class="ico_box">
												<ui:replaceLineBreak content="${listProduct.PRD_MST_ICON_LIST }"/>
											</span>
										</a>
										<div class="etc_btn">
											<a href="javascript:goProductView('<c:out value="${listProduct.PRD_MST_CD }" />');" class="f btn_zoom"><span class="ir">상품 크게보기</span></a>
											<a href="javascript:insertCart('<c:out value="${listProduct.PRD_MST_CD}" />','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="btn_cart"><span class="ir">상품 장바구니에 담기</span></a>
											<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD}" />&cateIdx=<c:out value="${cateIdx}" />" target="_blank"" class="btn_share"><span class="ir">상품 공유하기</span></a>
											<a href="javascript:insertKeeping('<c:out value="${listProduct.PRD_MST_CD}" />');" class="l btn_jjim"><span class="ir">상품 찜하기</span></a>
										</div>
									</li>
								<c:set var="listNum" value="${listNum + 1 }" />
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li class="no_list">등록된 카테고리 베스트가 없습니다.</li>
							</c:otherwise>
						</c:choose>
					</ol>
				</dd>
			</dl>
			<c:if test="${cateLvl == 2 }">
				<c:if test="${not empty listProductGuideList }">
					<hr class="line_1px"/>
		
					<!-- .pr_content S -->
					<dl class="pr_content">
						<dt class="minW"><h3><strong>상품 컨텐츠</strong></h3></dt>
						<dd class="minW">
							<div>
								<c:forEach var="listProductGuideList" items="${listProductGuideList }" varStatus="status">
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />" class="<c:out value="${listProductGuideList.MGZ_MST_CTG_BG_CLASS }" />">
										<i class="ico_msk"></i>
										<span class="thumb"><img src="<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${listProductGuideList.CMN_FLE_ALT_TXT }" />" /></span>
										<span><c:out value="${listProductGuideList.MGZ_MST_TITLE}" /></span>
										<strong class="<c:out value="${listProductGuideList.MGZ_MST_CTG_CLASS }" />"><c:out value="${listProductGuideList.MGZ_MST_CTG_NM }" /></strong>										
									</a>
								</c:forEach>
							</div>
						</dd>
					</dl>
					<!--// .pr_content E -->
				</c:if>
			</c:if>
			
			<div class="cate_bn">
				<h3 class="blind">카테고리 배너</h3>
				<c:if test="${not empty productMainBannerList }">
					<c:choose>
						<c:when test="${productMainBannerList[0].BNR_MST_TGT eq 'D' }">
							<a href="javascript:void(0)" style="background-color:<c:out value="${productMainBannerList[0].BNR_MST_HEX_CD}" />">
							<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${productMainBannerList[0].CMM_FLE_SYS_NM}" />" width="1020" height="200" alt="<c:out value="${productMainBannerList[0].CMN_FLE_ALT_TXT}" />" />
							</a>	
						</c:when>
						<c:otherwise>
							<a href="<c:out value="${productMainBannerList[0].BNR_MST_URL}" />" target="<c:out value="${productMainBannerList[0].BNR_MST_TGT_TARGET}" />" style="background-color:<c:out value="${productMainBannerList[0].BNR_MST_HEX_CD}" />">
							<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${productMainBannerList[0].CMM_FLE_SYS_NM}" />" width="1020" height="200" alt="<c:out value="${productMainBannerList[0].CMN_FLE_ALT_TXT}" />" />
							</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
			
			<!-- .listNtype S -->
			<div class="minW listNtype">
				<p class="tx_total"><strong>총 <span class="co_red" id="rowTotalCnt"><c:out value="${totalCount}" /></span>개</strong>의 상품이 있습니다.</p>
				<dl class="tab">
					<dt>
						<a href="javascript:searchProductList('hit',1);" class="on"><span>온라인 인기순</span></a>
						<a href="javascript:searchProductList('off',1);">
							<span>오프라인 인기순</span>
							<i class="ico_quest">
								<div class="lay_tx">
									<span class="blind">마켓플랜트 오프라인 매장에서 인기가 높은 상품순 입니다.</span>
								</div>
							</i>
						</a>
						<a href="javascript:searchProductList('new',1);"><span>최신순</span></a>
						<a href="javascript:searchProductList('dwn',1);"><span>낮은 가격순</span></a>
						<a href="javascript:searchProductList('up',1);"><span>높은 가격순</span></a>
					</dt>
					<!-- 상품리스트 S -->
					<form id="frm" name="frm">
					<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value = 0/>
					<dd class="tab_con list" style="display:block" id="main_con">
						<ol id="createSearchProductListTable">
							<c:choose>
								<c:when test="${not empty listProduct }">
									<c:set var="listNum" value="1" />
									<c:forEach var="listProduct" items="${listProduct }" varStatus="status">
										<li class="<c:out value="${listProduct.CLASS}" />" <c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT }">class="no_hover"</c:if>>
											<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || listProduct.PRD_MST_SEL_CNT == 0}">
												<i class="tx_soldout">
													<strong>일시품절</strong>
												</i>
											</c:if>
											<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT }">
												<i class="tx_soldout">
													<strong>품절</strong>
												</i>
											</c:if>
											<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${cateIdx}" />">
												<c:if test="${listProduct.PRD_MST_SIKR_ICON ne null }">
												<i class="<c:out value="${fn:split(listProduct.PRD_MST_SIKR_ICON,',')[0] }" />"><span class="blind"><c:out value="${fn:split(listProduct.PRD_MST_SIKR_ICON,',')[1] }" /></span></i>
												</c:if>
												<img src="<c:out value="${cdnDomain}" />/<c:out value="${listProduct.PRD_IMAGE}" />" class="thumb198" alt="<c:out value="${listProduct.PRD_IMAGE_ALT}" />" />
												<span class="ti"><c:out value="${fn:length(listProduct.PRD_MST_NM) > 46 ? fn:substring(listProduct.PRD_MST_NM,0,46) : listProduct.PRD_MST_NM }"/></span>
												<c:if test="${listProduct.PRD_MST_ERP_PRC > listProduct.PRD_MST_PRICE }">
												<strong class="pr_m"><strong><fmt:formatNumber value="${listProduct.PRD_MST_ERP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
												</c:if>
												<c:choose>
													<c:when test="${listProduct.PRD_NOW_DST_POINT > 0}">
														<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span></strong></strong>
													</c:when>
													<c:otherwise>
														<strong class="sel_m"><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span></strong>													
													</c:otherwise>
												</c:choose>
												<span class="star_box <c:if test="${listProduct.REP_CNT == 0 }">no_star</c:if>">
													<i class="ico_star3"><i class="star_<c:out value="${listProduct.REP_POINT_GRD }"/>"><span class="blind">별점 <c:out value="${listProduct.REP_POINT }"/>점</span></i></i>
													<strong class="re_num"><c:out value="${listProduct.REP_CNT }"/>개</strong>
												</span>
												<span class="ico_box">
													<ui:replaceLineBreak content="${listProduct.PRD_MST_ICON_LIST }"/>
												</span>
											</a>
											<div class="etc_btn">
												<a href="javascript:goProductView('<c:out value="${listProduct.PRD_MST_CD }" />');" class="f btn_zoom"><span class="ir">상품 크게보기</span></a>
												<a href="javascript:insertCart('<c:out value="${listProduct.PRD_MST_CD}" />','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="btn_cart"><span class="ir">상품 장바구니에 담기</span></a>
												<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD}" />&cateIdx=<c:out value="${cateIdx}" />" target="_blank"" class="btn_share"><span class="ir">상품 공유하기</span></a>
												<a href="javascript:insertKeeping('<c:out value="${listProduct.PRD_MST_CD}" />');" class="l btn_jjim"><span class="ir">상품 찜하기</span></a>
											</div>
										</li>
									<c:set var="listNum" value="${listNum + 1 }" />
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="no_list">등록 된 상품이 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ol>
						<!-- 페이징 S -->
						
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
						<input type="hidden" name="orderType" id="orderType" value="<c:out value="${commandMap.orderType }"/>" />
						<div class="section-pagination" id="createProductListPageDiv"><!-- section pagination -->
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			            </div><!-- // section pagination -->
			            <!-- 페이징 E -->
					</dd>
					</form>
					<!--// 상품리스트 E -->
					
				</dl>
				<form id="searchForm" name="searchForm">
				<input type="hidden" name="PRD_MST_SPC_IDX" id="PRD_MST_SPC_IDX" />
				<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" />
				<input type="hidden" name="oldSearchPrdMstMinPrice" id="oldSearchPrdMstMinPrice" value="<c:out value="${listProductPrice.PRD_MST_MIN_PRICE }" />" />
				<input type="hidden" name="oldSearchPrdMstMaxPrice" id="oldSearchPrdMstMaxPrice" value="<c:out value="${listProductPrice.PRD_MST_MAX_PRICE }" />" />
				<!-- 스마트 필터 S -->
				<article class="right_box">
					<select id="prdMstPageSize" class="sel_chg" >
						<option value="18">상품수 18개</option>
						<option value="36">상품수 36개</option>
					</select>
					<h4 class="smart_ti">
						스마트 필터
						<a href="javascript:void(0)" class="btn_reset"><span>원래대로</span></a>
					</h4>
					<dl class="smartF">
						<c:if test="${not empty listCategorySpec }">
							<c:forEach var="listCategorySpec" items="${listCategorySpec }" varStatus="status">
								<c:choose>
									<c:when test="${ listCategorySpec.SPC_MST_LEVEL eq 3}">
										<c:set var="num" value="0" />
										<dt><a href="javascript:void(0)"><c:out value="${listCategorySpec.SPC_MST_NM}" /></a></dt>
										<dd>
											<label for="searchPrdMstSpcAll_<c:out value="${listCategorySpec.SPC_MST_IDX}" />_<c:out value="${num}" />">
												<%-- <input type="checkbox" name="searchPrdMstSpcAll" id="searchPrdMstSpcAll_<c:out value="${listCategorySpec.SPC_MST_IDX}" />_<c:out value="${num}" />" checked=true value="<c:out value="${listCategorySpec.SPC_MST_IDX}" />"  />
												<span>All</span> --%>
											</label>
									</c:when>
									<c:otherwise>
											<label for="searchPrdMstSpc_<c:out value="${listCategorySpec.SPC_MST_UP_IDX}" />_<c:out value="${num}" />">
												<input type="checkbox" name="searchPrdMstSpc" id="searchPrdMstSpc_<c:out value="${listCategorySpec.SPC_MST_UP_IDX}" />_<c:out value="${num}" />" value="<c:out value="${listCategorySpec.SPC_MST_IDX}" />" />
												<span><c:out value="${listCategorySpec.SPC_MST_NM}" /></span>
											</label>
									</c:otherwise>
								</c:choose>
								<c:if test="${listCategorySpec.SPC_MST_IDX eq listCategorySpec.SPC_MST_UP_IDX }" >
									</dd>
								</c:if>
								<c:set var="num" value="${num + 1 }" />
							</c:forEach>
						</c:if>
						<dt><a href="javascript:void(0)">가격대별</a></dt>
						<dd class="dd_price">
							<label for="price_s" class="f">
								<input type="text" name="searchPrdMstMinPrice" id="searchPrdMstMinPrice" value="<c:out value="${commandMap.searchPrdMstMinPrice == '' || commandMap.searchPrdMstMinPrice == null ? listProductPrice.PRD_MST_MIN_PRICE : commandMap.searchPrdMstMinPrice }" />"  title="시작가격" />
								<strong>원~</strong>
							</label>
							<label for="price_e">
								<input type="text" name="searchPrdMstMaxPrice" id="searchPrdMstMaxPrice" value="<c:out value="${commandMap.searchPrdMstMaxPrice == '' || commandMap.searchPrdMstMaxPrice == null ? listProductPrice.PRD_MST_MAX_PRICE : commandMap.searchPrdMstMaxPrice }" />" title="마지막가격" />
								<strong>원</strong>
							</label>
						</dd>
					</dl>
					<div class="btn_box">
						<a href="javascript:fromReset();" class="btn_reset"><span>검색 초기화</span></a>
						<a href="javascript:#" id="searchPrdMstSpec" class="btn_sh"><span>상세검색</span></a>
					</div>
					<c:if test="${not empty listProductPlan}">				
					<h4 class="blind">카테고리 연관 기획전 배너</h4>
					<ul class="bn_list">
						<c:forEach var="listProductPlan" items="${listProductPlan }" varStatus="status">
							<li><a href="<c:out value="${frontDomain}"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${listProductPlan.PLN_MST_IDX}" />"><img src="<c:out value="${cdnDomain }"/><c:out value="${listProductPlan.CMM_FLE_SAVE_PATH }" />" alt="<c:out value="${listProductPlan.CMN_FLE_ALT_TXT }" />" width="233" height="106" /></a></li>
						</c:forEach>
					</ul>
					</c:if>
				</article>
				</form>
				<!--// 스마트 필터 E -->
			</div>
			<!--// .listNtype E -->
			<!-- #laypop S -->
			<%@ include file="/WEB-INF/jsp/pc/product/productLayer.jsp" %>
			<!--// #laypop E -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>

<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="SearchProductListTemplate" type="text/x-jquery-tmpl">
<li class="\${CLASS} 
		{{if PRD_MST_SEL_STATE == 'O' || PRD_MST_SEL_STATE == 'T'}}
			no_hover
		{{/if}}
		">
		{{if PRD_MST_SEL_STATE == 'O' || PRD_MST_SEL_CNT == 0}}
			<i class="tx_soldout">
				<strong>일시품절</strong>
			</i>
		{{/if}}
		{{if PRD_MST_SEL_STATE == 'T'}}
			<i class="tx_soldout">
				<strong>품절</strong>
			</i>
		{{/if}}
		<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&cateIdx=<c:out value="${cateIdx}" />">
		<i class="\${PRD_MST_SIKR_ICON}"><span class="blind">\${PRD_MST_SIKR_ICON_NM}</span></i>
		<img src="\${PRD_IMAGE}" class="thumb198" alt="\${PRD_IMAGE_ALT}" />
		<span class="ti">\${PRD_MST_NM}</span>
		{{if PRD_MST_ERP_DSP_PRC > PRD_MST_PRICE}}
		<strong class="pr_m"><strong>\${PRD_MST_ERP_DSP_PRC}</strong><span>원</span></strong>
		{{/if}}
		{{if PRD_NOW_DST_POINT > 0}}
			<strong class="sel_m"><strong class="co_red">\${PRD_MST_PRICE}<span>원</span></strong></strong>
		{{else}}
			<strong class="sel_m">\${PRD_MST_PRICE}<span>원</span></strong>
		{{/if}}
		<span class="star_box \${REP_CLASS}">
			<i class="ico_star3"><i class="star_\${REP_POINT_GRD}"><span class="blind">별점 \${REP_POINT}점</span></i></i>
			<strong class="re_num">\${REP_CNT}개</strong>
		</span>
		<span class="ico_box">
			{{if PRD_NEW_ICO < 30}}
				<span class="ico_new"><span class="ir">NEW</span></span>
			{{/if}}
			{{if PRD_MST_PC_CPN_PRC > 0}}
				<span class="ico_sale"><span class="ir">즉시할인</span></span>
			{{/if}}
			{{if PRD_MST_COU_CNT > 0}}
				<span class="ico_coupon"><span class="ir">쿠폰할인</span></span>
			{{/if}}
			{{if PRD_MST_GFT_CNT > 0}}
				<span class="ico_gift"><span class="ir">사은품</span></span>
			{{/if}}
			{{if PRD_MST_DLV_FEE == 0}}
				<span class="ico_free"><span class="ir">무료배송</span></span>
			{{/if}}
			{{if PRD_MST_CRD_CNT > 0}}
				<span class="ico_card"><span class="ir">카드할인</span></span>
			{{/if}}
			{{if PRD_MST_LNG_DIV_YN == 'Y'}}
				<span class="ico_plan"><span class="ir">장기할부</span></span>
			{{/if}}
			{{if PRD_MST_O2O_YN == 'Y'}}
				<span class="ico_getNew"><span class="ir">겟잇나우</span></span>
			{{/if}}
		</span>
	</a>
	<div class="etc_btn">
		<a href="javascript:goProductView('<c:out value="\${PRD_MST_CD }" />');" class="f btn_zoom"><span class="ir">상품 크게보기</span></a>
		<a href="javascript:insertCart('<c:out value="\${PRD_MST_CD}" />','<c:out value="\${PRD_MST_OPT_EST_CNT}" />');" class="btn_cart"><span class="ir">상품 장바구니에 담기</span></a>
		<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="\${PRD_MST_CD}" />&cateIdx=<c:out value="${cateIdx}" />" target="_blank" class="btn_share"><span class="ir">상품 공유하기</span></a>
		<a href="javascript:insertKeeping('<c:out value="\${PRD_MST_CD}" />');" class="l btn_jjim"><span class="ir">상품 찜하기</span></a>
	</div>
</li>
</script>

<script>
$(function(){
	
	//tab + 체크 + 리스트 길이체크해볼게여
	function list_ck(){
		var _list = $('.listNtype');
		_list.removeAttr('style');

		var	_smart = _list.find('.right_box'),
			_smart_h = _smart.height(),
			_tab_dt = _list.find('.tab dt a');		
		
		if(_list.outerHeight(true) < _smart_h) _list.height(_smart_h);

		
		if(_list.hasClass('one_ck')) return false;
		_list.addClass('one_ck');
		//tab
		_tab_dt.on('click', function(){
			_this = $(this);
			_this.addClass('on').siblings().removeClass('on');

			//list_ck();
		});
		//체크
		_smart.find('dt a').on('click', function(){
			var _this = $(this),
				_parent = _this.parent();
			_this.toggleClass('hide').parent().next().toggle();
		});
	}

	list_ck();
	
	//e매거진 slider
	var emagazine_d = $('.pr_content dd > div');
	emagazine_d.bxSlider({
		slideWidth: 172,
		minSlides: 1,
		maxSlides: 5,
		slideMargin: 30,
		pager:false,
		nextText:'<span class="ir">이전으로</span>',
		prevText:'<span class="ir">다음으로</span>'
	});
	
	//상품 리스트
	searchProductList = function(orderType,cPage,searchType){
		var cateIdx = "<c:out value="${cateIdx}" />";
		$("#orderType").val(orderType);
		if(cPage =="") cPage = 1;
		var prdMstPageSize = $("#prdMstPageSize").val();
		var searchSpcIdxs = "";
		var searchPrdMstMaxPrice = "";
		var searchPrdMstMinPrice = "";
		
		//상품의 스펙 및 가격 상세 검색
		if(searchType == "D" || cPage > 1){
			searchSpcIdxs = $("#PRD_MST_SPC_IDX").val();
			searchPrdMstMaxPrice = $("#searchPrdMstMaxPrice").val();
			searchPrdMstMinPrice = $("#searchPrdMstMinPrice").val();
		}else{
			//searchPrdMstMaxPrice = $("#searchPrdMstMaxPrice").val();
			//searchPrdMstMinPrice = $("#searchPrdMstMinPrice").val();
			$("input[id^=searchPrdMstSpc]").each(function(){
				$(this).prop("checked",false);
			});
			$("#searchPrdMstMaxPrice").val('');
			$("#searchPrdMstMinPrice").val('');
		}
		
		if(cateIdx != ""){
			$.ajax({
	            async : false,
	            type : "POST",
	            data : { 
	            		"cateIdx": cateIdx 
	            		, "orderType": orderType 
	            		, "cPage": cPage 
	            		, "pageSize": prdMstPageSize
	            		, "searchSpcIdxs": searchSpcIdxs
	            		, "searchPrdMstMaxPrice": searchPrdMstMaxPrice
	            		, "searchPrdMstMinPrice": searchPrdMstMinPrice
	            	   },
	            url : "<c:out value="${frontDomain}" />/pc/product/productListAjax.do",
	            success : function (data) 
	            {
	            	
	            	//최소가 최대가
	            	if(data.listProductPrice.PRD_MST_MIN_PRICE > 0){
	            		if($("#searchPrdMstMinPrice").val() == ""){
	            			$("#searchPrdMstMinPrice").val(data.listProductPrice.PRD_MST_MIN_PRICE);
	            		}
	            	}
	            	
	            	if(data.listProductPrice.PRD_MST_MAX_PRICE > 0){
	            		if($("#searchPrdMstMaxPrice").val() == ""){
	            			$("#searchPrdMstMaxPrice").val(data.listProductPrice.PRD_MST_MAX_PRICE);
	            		}
	            	}
	            	
	            	$("#rowTotalCnt").html(data.totalCount);
	            	
	            	if(data.listProduct != null)
	    			{
	    				var arrayObj = new Array();
	    				var runm = 1;
	    				$.each(data.listProduct, function(index,item)
	    				{
	    					var obj = new Object();
	    					
	    					obj.PRD_MST_CD = item.PRD_MST_CD;
	    					if(item.PRD_MST_NM.length > 46){
	    						obj.PRD_MST_NM = item.PRD_MST_NM.substring(0,46);	
	    					}else{
	    						obj.PRD_MST_NM = item.PRD_MST_NM;	
	    					}
	    					
	    					if(item.PRD_IMG_SYS_NM != ""){
	    						obj.PRD_IMAGE = "<c:out value="${cdnDomain}" />"+"/"+item.PRD_IMAGE;
	    						obj.PRD_IMAGE_ALT = item.PRD_IMAGE_ALT;
	    					}
	    					else{
	    						obj.PRD_IMG_PATH = "";
	    						obj.PRD_IMG_ALT_TEXT = "";
	    					}
	    					
	    					obj.PRD_IMG_URL_PATH = item.PRD_IMG_URL_PATH;
	    					obj.PRD_IMG_ALT_TEXT = item.PRD_IMG_ALT_TEXT;
	    					
	    					if(index == 0 || runm % 3 ==1){
	    						obj.CLASS = "f";
	    					}else if(runm % 3 == 0 ){
	    						obj.CLASS = "l";
	    					}else{
	    						obj.CLASS = "";
	    					}
	    					
	    					obj.PRD_MST_ERP_DSP_PRC = setComma(item.PRD_MST_ERP_PRC);
	    					
	    					obj.PRD_MST_PRICE = setComma(item.PRD_MST_PRICE);
	    					
	    					
	    					obj.PRD_MST_PC_CPN_PRC = item.PRD_MST_PC_CPN_PRC;
	    					obj.PRD_MST_COU_CNT = item.PRD_MST_COU_CNT;
	    					obj.PRD_MST_GFT_CNT = item.PRD_MST_GFT_CNT;
	    					obj.PRD_MST_DLV_FEE = item.PRD_MST_DLV_FEE;
	    					obj.PRD_MST_LNG_DIV_YN = item.PRD_MST_LNG_DIV_YN;
	    					obj.PRD_MST_O2O_YN = item.PRD_MST_O2O_YN;
	    					obj.PRD_MST_CRD_CNT = item.PRD_MST_CRD_CNT;
	    					obj.REP_POINT = item.REP_POINT;
	    					obj.REP_CNT = item.REP_CNT;
	    					obj.REP_POINT_GRD = item.REP_POINT_GRD;
	    					obj.PRD_NEW_ICO = item.PRD_NEW_ICO;
	    					obj.PRD_MST_OPT_EST_CNT = item.PRD_MST_OPT_EST_CNT;
	    					obj.PRD_MST_SEL_STATE = item.PRD_MST_SEL_STATE;
	    					obj.PRD_NOW_DST_POINT = item.PRD_NOW_DST_POINT;
	    					obj.PRD_MST_SEL_CNT = item.PRD_MST_SEL_CNT;
	    					if(obj.REP_CNT > 0){
	    						obj.REP_CLASS = "";
	    					}else{
	    						obj.REP_CLASS = "no_star";
	    					}

	    					if(item.PRD_MST_SIKR_ICON != null && item.PRD_MST_SIKR_ICON != ""){
	    						obj.PRD_MST_SIKR_ICON = item.PRD_MST_SIKR_ICON.split(",")[0];
	    						obj.PRD_MST_SIKR_ICON_NM = item.PRD_MST_SIKR_ICON.split(",")[1];
	    					}else{
	    						obj.PRD_MST_SIKR_ICON = "";
	    						obj.PRD_MST_SIKR_ICON_NM = "";
	    					}
	    					runm ++;
	    					arrayObj.push(obj);
	    				});
	    					$( "#createSearchProductListTable" ).html($( "#SearchProductListTemplate" ).tmpl( arrayObj ));
	    					$( "#createProductListPageDiv" ).html(data.page);
	    					list_ck();
	    					
	    			}
	    			else
	    			{
	    				$( "#createSearchProductListTable" ).html("<li class=\"no_list\">등록 된 상품이 없습니다.</li>");
	    			}
	            },
	            error : function (err)
	            {
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	            }
	        });
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
	
	
	// 페이지 이동
    goPage = function (cPage) 
    {
		var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        var orderType = $("#orderType").val();
        searchProductList(orderType,cPage);
    };
    
    //searchProductList('hit',1);
    
    //상품 페이지 사이즈 선택
    $(document).on("click", "#prdMstPageSize", function (){
    	var orderType = $("#orderType").val();
    	searchProductList(orderType,1);
    });
    
    fromReset = function(){
    	$("#searchForm").find("input").each(function(){
    		var $tag = $(this);
    		
    		if($tag.attr("name") != "searchPrdMstSpcAll"){
	    		switch($tag.attr("type"))
	    		{
	    			case "checkbox" : 
	    				$tag.prop("checked", false);
	    			case "text" : 
	    				$tag.val('');
	    		}
    		}
    	});
    };
    
    //스마트 필터 검색
    $(document).on("click", "#searchPrdMstSpec", function (){
    	var orderType = $("#orderType").val();
    	var spcAll = 0;
    	var chkResult = 0;
    	var priceResult = false;
    	var prd_mst_spc_Idx = "";
    	
    	/* $("input[name=searchPrdMstSpcAll]").each(function(){
    		if($(this).is(":checked") == false){
    			var idx = $(this).val();
    			$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
    				if($(this).is(":checked")){
    					chkResult = chkResult + 1;
    					if(prd_mst_spc_Idx == ""){
    						prd_mst_spc_Idx = $(this).val();
    					}else{
    						prd_mst_spc_Idx = prd_mst_spc_Idx +","+$(this).val();
    					}
    				}
    			});
    		}else{
    			spcAll = spcAll + 1;
    			var idx = $(this).val();
    			$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
   					if(prd_mst_spc_Idx == ""){
   						prd_mst_spc_Idx = $(this).val();
   					}else{
   						prd_mst_spc_Idx = prd_mst_spc_Idx +","+$(this).val();
    				}
    			});
    		}
    	}); */
    	
    	$("input[name=searchPrdMstSpc]").each(function(){
    		if($(this).is(":checked")){
    			chkResult = chkResult + 1;
    			if(prd_mst_spc_Idx == ""){
					prd_mst_spc_Idx = $(this).val();
				}else{
					prd_mst_spc_Idx = prd_mst_spc_Idx +","+$(this).val();
				}
    		}
    	});
    	
    	if($("#searchPrdMstMaxPrice").val() == "" && $("#searchPrdMstMinPrice").val() == ""){
    		priceResult = true;
    	}else{
    		if($("#searchPrdMstMaxPrice").val() <= $("#searchPrdMstMinPrice").val() ){
    			alert("최소가격과 최대가격 내의 구간으로 검색 가능합니다.");
    			return false;
    		}
    	}
    	
    	
    	if(chkResult == 0 && priceResult){
			alert("스마트 필터의 항목을 선택하시거나 가격검색을 등록 하셔야 합니다.");
			return;
		}
    	$("#PRD_MST_SPC_IDX").val(prd_mst_spc_Idx);

    	searchProductList(orderType,1,'D');
    });
    
    /* $(document).on("click", "input[name=searchPrdMstSpc]", function (){
    	var chkidx = 0;
    	var chkAllObj = $(this).parent("label").parent("dd").find("input[name=searchPrdMstSpcAll]");
    	var strArray = $(this).attr("id").split('_');
		var idx = strArray[strArray.length-2];
		var prtChkLen = $("input[id^=searchPrdMstSpc_"+idx+"]").length;
		
    	$("input[name=searchPrdMstSpc]").each(function(){
			if($(this).is(":checked")){
				chkidx = chkidx + 1;
			}
    	});
    	
    	if(chkidx == prtChkLen){
    		chkAllObj.prop("checked",true);
    		$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
    			$(this).prop("checked",false);
    		});
    	}
    	else if(chkidx > 0){
    		chkAllObj.prop("checked",false);
    	}
    }); */
    
    /* $(document).on("click","input[name=searchPrdMstSpcAll]", function(){
    	var strArray = $(this).attr("id").split('_');
		var idx = strArray[strArray.length-2];
		if($(this).is(":checked")){
			$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
				$(this).prop("checked",false);
	    	});
		}
    }); */
    
 	// 장바구니 담기
	insertCart = function(prdMstCd,prdMstOptEstCnt){
 		if(prdMstOptEstCnt > 0){
 			if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
 				goProductView(prdMstCd);
 				return;
 			}else{
 				return;
 			}
 		}
		$.ajax
        ({
            async : false,
            type : "POST",
            data : {
            			"PRD_MST_CD" : prdMstCd
            			,"OPT_DTL_IDXs" : 0
            			,"REQUEST_CNT_0" : 1
            			,"MEM_CRT_DLV_GBN" : 2096
            		},
            url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		$("#topCartCnt").html(data.cartCnt);
            		com.laypop('show',0,'laypopCart');//팝업 show
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
					if(confirm(data.resultMsg)){
						var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
					}
				}else{
					com.laypop('show',0,'laypopKeeping');//팝업 show
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
	
	//간편보기
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
 	
	//장바구니 이동
	goCartList = function(){
		$('#_blank_form').attr({'action':'<c:out value="${serverDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();	
	};
    
	//나의 키핑상품 이동
	goMyKeeping = function(){
		$('#_blank_form').attr({'action':'<c:out value="${serverDomain}" />/pc/mypage/myKeepProductList.do','method':'get'}).submit();	
	};
});

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
        url : "<c:out value="${frontDomain}" />/pc/global/xtractor/favoriteDummy.do",
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
        url : "<c:out value="${frontDomain}" />/pc/global/xtractor/sympathyDummy.do",
        success : function (data) 
        { 
        	//console.log('키핑하기 연동 성공: ');
        },
        error : function (err)
        {
           // console.log('키핑하기 연동 오류가 발생하였습니다: ' + err.status);
        }
	});
}

//간편보기 바로구매 버튼
function simplePayCart(ORD_MST_CD){
	var url = "<c:out value="${serverDomain}"/>/pc/cart/cartpayment.do?ORD_MST_CD=" + ORD_MST_CD;
	url = encodeURIComponent(url);
	window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
}

//간편보기 로그인 페이지 호출
function simpleGoLogin(){
	var url = location.href;
	url = encodeURIComponent(url);
	window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
}
</script>
</body>
</html>