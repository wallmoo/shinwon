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
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
			<div class="minW category_tit">
				<dl class="loc">
					<dt class="blind">현제 카테고리 경로</dt>
					<dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
					<dd><a href="javascript:void(0)"><c:out value="${topCateName }" /></a></dd>
				</dl>
				<h3><span class="tx"><i class="ico_point_l"></i><c:out value="${topCateName }" /><i class="ico_point_r"></i></span></h3>
			</div>
			
			<!-- .slideNcate S -->
			<dl class="slideNcate">
				<dt class="blind">카테고리 이벤트배너 및 서브 카테고리</dt>
				<dd class="slider">
					<div class="bn_list">
						<c:if test="${not empty productMainProBannerList }">
							<c:forEach var="productMainProBannerList" items="${productMainProBannerList }" varStatus="i">
								<c:choose>
									<c:when test="${productMainProBannerList.BNR_MST_TGT eq 'D' }">
										<li style="background-color:<c:out value="${productMainProBannerList.BNR_MST_HEX_CD}" />">
											<a href="javascript:void(0)">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productMainProBannerList.CMM_FLE_SYS_NM}" />" width="1020" height="364" alt="<c:out value="${productMainProBannerList.CMN_FLE_ALT_TXT}" />" />
											</a>	
										</li>
									</c:when>
									<c:otherwise>
										<li style="background-color:<c:out value="${productMainProBannerList.BNR_MST_HEX_CD}" />">
											<a href="<c:out value="${productMainProBannerList.BNR_MST_URL}" />" target="<c:out value="${productMainProBannerList.BNR_MST_TGT_TARGET}" />" >
											<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productMainProBannerList.CMM_FLE_SYS_NM}" />" width="1020" height="364" alt="<c:out value="${productMainProBannerList.CMN_FLE_ALT_TXT}" />" />
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</div>
				</dd>
				<dd class="sub_lnb">
					<ol>
						<c:if test="${not empty CategorySubMenuList }">
							<c:set var="cateIdxNum" value="0" />
							<c:set var="cateLev3" value="0" />
							<c:forEach var="CateMenu" items="${CategorySubMenuList}" varStatus="Status">
									<c:if test="${cateIdxNum ne 0 && CateMenu.PRD_CTG_UP_IDX ne cateIdxNum }" >
												</dd>
											</dl>
										</li>
									</c:if>
								<c:choose>
									<c:when test="${CateMenu.PRD_CTG_LEVEL == 2}">
										<c:set var="cateLev3" value="0" />
										<c:set var="cateIdxNum" value="${CateMenu.PRD_CTG_IDX }" />
										<li>
										<a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${CateMenu.PRD_CTG_IDX }" />" class="stp_1 "><i class="ico_<c:out value="${CateMenu.PRD_CTG_IDX }" />"></i><span><c:out value="${CateMenu.PRD_CTG_NM }" /></span></a>
										<dl class="sub_mn">
											<dt>
												<strong><c:out value="${CateMenu.PRD_CTG_NM }" /></strong>
											</dt>
											<dd>
									</c:when>
									<c:otherwise>
										<c:if test="${cateLev3 == 0 }">
											<i></i>
										</c:if>
										<a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${CateMenu.PRD_CTG_IDX }" />"><span><c:out value="${CateMenu.PRD_CTG_NM }" /></span></a>
										<c:set var="cateLev3" value="${cateLev3 + 1 }" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</ol>
				</dd>
			</dl>
			<!--// .slideNcate E -->
			<!-- .hotKey S -->
			<dl class="minW hotKey">
				<dt><strong><span class="ir">핫 이슈 키워드</span></strong></dt>
				<dd class="list">
					<c:if test="${not empty productMainHotBannerList }">
						<c:set var="num" value="1" />
						<c:forEach var="productMainHotBannerList" items="${productMainHotBannerList }" varStatus="i">
							<c:choose>
								<c:when test="${productMainHotBannerList.BNR_MST_TGT eq 'D' }">
									<a href="javascript:void(0)" <c:if test="${num == 1 }">class="f"</c:if> <c:if test="${num == 6 }">class="l"</c:if>>
									<span><c:out value="${productMainHotBannerList.BNR_MST_TITLE}" /></span>
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainHotBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productMainHotBannerList.CMM_FLE_SYS_NM}" />" width="82" height="82" alt="<c:out value="${productMainHotBannerList.CMN_FLE_ALT_TXT}" />" />
									</a>	
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${productMainHotBannerList.BNR_MST_URL}" />" target="<c:out value="${productMainHotBannerList.BNR_MST_TGT_TARGET}" />" <c:if test="${num == 1 }">class="f"</c:if> <c:if test="${num == 6 }">class="l"</c:if>>
									<span><c:out value="${productMainHotBannerList.BNR_MST_TITLE}" /></span>
									<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainHotBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productMainHotBannerList.CMM_FLE_SYS_NM}" />" width="82" height="82" alt="<c:out value="${productMainHotBannerList.CMN_FLE_ALT_TXT}" />" />
									</a>
								</c:otherwise>
							</c:choose>
							<c:set var="num" value="${num + 1 }" />
						</c:forEach>
					</c:if>
					<hr class="bg_line_5px_l" />
				</dd>
			</dl>
			<!--// .hotKey E -->
			<form name="frm" id="frm">
			<!-- .cate_best S -->
			<dl class="minW cate_best">
				<dt>
					<h3>Category Best</h3>
					<p class="list_type">
						<a href="javascript:void(0);" data-order_type="hit" class="f on"><span>인기순</span></a>
						<a href="javascript:void(0);" data-order_type="new" class="l"><span>최신순</span></a>
					</p>
				</dt>
				<dd class="list">
					<div class="slider" id="createSearchProductListTable">
						<!-- 1번리스트 S -->
						<!-- 1번리스트 E -->
					</div>
				</dd>
			</dl>
			</form>
			<!--// .cate_best E -->
			<c:if test="${not empty listProductGuideList }">
				<!-- .pr_content S -->
				<dl class="pr_content">
					<dt class="minW"><h3>스마트라이프를 위한 e매거진</h3></dt>
					<dd class="minW">
						<div>
							<c:forEach var="listProductGuideList" items="${listProductGuideList }" varStatus="status">
								<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${listProductGuideList.MGZ_MST_IDX }" />" class="<c:out value="${listProductGuideList.MGZ_MST_CTG_BG_CLASS }" />">
									<i class="ico_msk"></i>
									<c:if test="${listProductGuideList.MGZ_MST_KID eq 'M' }">
										<i class="ico_mv"></i>
									</c:if>
									<span class="thumb"><img src="<c:out value="${cdnDomain}${listProductGuideList.CMM_FLE_ATT_PATH}${listProductGuideList.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${listProductGuideList.CMN_FLE_ALT_TXT }" />" /></span>
									<span><c:out value="${fn:length(listProductGuideList.MGZ_MST_TITLE_2) > 30 ? fn:substring(listProductGuideList.MGZ_MST_TITLE_2,0,30) : listProductGuideList.MGZ_MST_TITLE_2 }" /></span>
									<strong class="<c:out value="${listProductGuideList.MGZ_MST_CTG_CLASS }" />"><c:out value="${listProductGuideList.MGZ_MST_CTG_NM }" /></strong>
								</a>
							</c:forEach>
						</div>
					</dd>
				</dl>
				<!--// .pr_content E -->
			</c:if>
			
			<!-- .lets_bn S -->
			<div class="cate_bn">
				<h3 class="blind">Let`s Play 배너</h3>
				<c:if test="${not empty productMainLetBannerList }">
					<c:choose>
						<c:when test="${productMainLetBannerList[0].BNR_MST_TGT eq 'D' }">
							<a href="javascript:void(0)" class="no_link" style="background-color:<c:out value="${productMainLetBannerList[0].BNR_MST_HEX_CD}" />">
							<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainLetBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${productMainLetBannerList[0].CMM_FLE_SYS_NM}" />" alt="<c:out value="${productMainLetBannerList[0].CMN_FLE_ALT_TXT}" />" />
							</a>	
						</c:when>
						<c:otherwise>
							<a href="<c:out value="${productMainLetBannerList[0].BNR_MST_URL}" />" target="<c:out value="${productMainLetBannerList[0].BNR_MST_TGT_TARGET}" />" style="background-color:<c:out value="${productMainLetBannerList[0].BNR_MST_HEX_CD}" />">
							<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainLetBannerList[0].CMM_FLE_ATT_PATH}" /><c:out value="${productMainLetBannerList[0].CMM_FLE_SYS_NM}" />"  alt="<c:out value="${productMainLetBannerList[0].CMN_FLE_ALT_TXT}" />" />
							</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
			<!--// .lets_bn E -->

			<!-- .cate_bn S -->
			<div class="cate_bn">
				<h3 class="blind">카테고리 배너</h3>
				<c:if test="${not empty productMainBannerList }">
					<c:choose>
						<c:when test="${productMainBannerList[0].BNR_MST_TGT eq 'D' }">
							<a href="javascript:void(0)" class="no_link" style="background-color:<c:out value="${productMainBannerList[0].BNR_MST_HEX_CD}" />">
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
			<!--// .cate_bn E -->

			<!-- .pr_review S -->
			<c:if test="${fn:length(listProductRev) > 3 }">
				<div class="pr_review">
					<h3>
						<span class="ir">
							<span>상품후기</span>
							<strong>진짜 써보니 어때?</strong>
						</span>					
					</h3>
					<ol>
						<c:if test="${not empty listProductRev }">
							<c:forEach var="listProductRev" items="${listProductRev }" varStatus="status">
								<li>
									<a href="javascript:void(0)">
										<img src="<c:out value="${cdnDomain}" /><c:out value="${listProductRev.PRD_REV_IMG}" />" alt="<c:out value="${listProductRev.CMN_FLE_ALT_TXT}" />" />
										<span class="ico_star_box">
											<i class="ico_star4"><i class="star_<c:out value="${listProductRev.PRD_REV_SCORE_STAR_GRD}" />"></i></i>
											<strong class="re_num"><span class="blind">별점</span><c:out value="${listProductRev.REP_POINT}" /> <span class="blind">점</span></strong>
										</span>
										<span class="tx_con">
											<c:choose>
												<c:when test="${fn:length(listProductRev.PRD_REV_CONTENTS) > 40 }">
													<c:out value="${fn:substring(listProductRev.PRD_REV_CONTENTS,0,40) }" />...
												</c:when>
												<c:otherwise>
													<ui:replaceLineBreak content="${listProductRev.PRD_REV_CONTENTS }"/>
												</c:otherwise>
											</c:choose>
										</span>
										<span class="tx_prTi">
											<c:if test="${listProductRev.PRD_MST_ERP_CD ne null || listProductRev.PRD_MST_BRAND_NM ne null}">
												[<c:if test="${listProductRev.PRD_MST_ERP_CD ne null}"><c:out value="${listProductRev.PRD_MST_ERP_CD }" /></c:if>
												<c:choose>
													<c:when test="${listProductRev.PRD_MST_ERP_CD ne null && listProductRev.PRD_MST_BRAND_NM ne null}">
														/<c:out value="${listProductRev.PRD_MST_BRAND_NM }" />
													</c:when>
													<c:otherwise>
														<c:if test="${listProductRev.PRD_MST_BRAND_NM ne null}" >
															<c:out value="${listProductRev.PRD_MST_BRAND_NM }" />
														</c:if>
													</c:otherwise>
												</c:choose>]
											</c:if>
											<c:choose>
												<c:when test="${fn:length(listProductRev.PRD_MST_NM) > 50 }">
													<c:out value="${fn:substring(listProductRev.PRD_MST_NM,0,50) }" />
												</c:when>
												<c:otherwise>
													<c:out value="${listProductRev.PRD_MST_NM }" />
												</c:otherwise>
											</c:choose>
										</span>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</ol>
				</div>
			</c:if>
			<!--// .pr_review E -->
			
			<c:if test="${not empty listProductPlan}">
				<!-- .sh_exhbt S -->
				<dl class="minW sh_exhbt">
					<dt><h3>쇼핑 기획전</h3></dt>
					<dd>
						<c:set var="planNum" value="1" />
						<c:forEach var="listProductPlan" items="${listProductPlan }" varStatus="status">
							<c:choose>
								<c:when test="${planNum == 1 || planNum == 4 }">
									<a href="<c:out value="${frontDomain }"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${listProductPlan.PLN_MST_IDX }" />" class="f">
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${planNum mod 3 == 0 }">
											<a href="<c:out value="${frontDomain }"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${listProductPlan.PLN_MST_IDX }" />" class="l">
										</c:when>
										<c:otherwise>
											<a href="<c:out value="${frontDomain }"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${listProductPlan.PLN_MST_IDX }" />">
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<img src="<c:out value="${cdnDomain }"/><c:out value="${listProductPlan.CMM_FLE_SAVE_PATH }" />" alt="<c:out value="${listProductPlan.CMN_FLE_ALT_TXT }" />" width="328" height="205" />
							<strong class="ti">
								<c:choose>
									<c:when test="${fn:length(listProductPlan.PLN_MST_TITLE) > 19 }">
										<c:out value="${fn:substring(listProductPlan.PLN_MST_TITLE,0,18) }" />...
									</c:when>
									<c:otherwise>
										<c:out value="${listProductPlan.PLN_MST_TITLE }" />
									</c:otherwise>
								</c:choose>
							</strong>
							<span class="tx_date"><c:out value="${listProductPlan.PLN_MST_ST_DT }" /> ~ <c:out value="${listProductPlan.PLN_MST_ED_DT }" /></span>
							</a>
						<c:set var="planNum" value="${planNum + 1 }" />
						</c:forEach>
					</dd>
				</dl>
				<!--// .sh_exhbt E -->
			</c:if>
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
			<i class="tx_soldout2">
				<strong>품절</strong>
			</i>
		{{/if}}
		<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&cateIdx=<c:out value="${cateIdx}" />">
		<img src="\${PRD_IMAGE}" class="thumb198" alt="\${PRD_IMAGE_ALT}" />
		<i class="\${PRD_MST_SIKR_ICON}"><span class="blind">\${PRD_MST_SIKR_ICON_NM}</span></i>
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
			<i class="ico_star2"><i class="star_\${REP_POINT_GRD}"><span class="blind">별점 \${REP_POINT}점</span></i></i>
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
$(document).ready(function(){
	
	//첫번째 슬라이드
	var slideNcate = $('.slideNcate .bn_list');
	//console.log(slideNcate.length);
	slideNcate.bxSlider({
		controls:false,
		captions: true,
		auto: true,
		onSliderLoad:function(){//start
		},
		onSlideBefore:function($slideElement, oldIndex, newIndex){//play idx
		}
	});

	//슬라이드위 sub_lnb
	var sub_lnb = $('.sub_lnb');
	sub_lnb.on('mouseleave',function(){
		sub_lnb.data('one', false);
	}).find('li').on('mouseenter', function(){
		var _this = $(this),
			_this_h = _this.outerHeight(true),
			_lng_offTop = sub_lnb.offset().top,
			_this_offTop = _this.offset().top,
			_cssTop = (_this_offTop - _lng_offTop) + (_this_h/2),
			_sub_mn = _this.children('dl');
		
		_this.addClass('on').siblings().removeClass('on');
		if(sub_lnb.data('one') != true){
			if (sub_lnb.data('one')) sub_lnb.attr('data-one', true);
            else sub_lnb.data('one', true);
			_sub_mn.show().animate({opacity:1,left:'100%'},200);
		}else{
			_sub_mn.show().css({opacity:1,left:'100%'});
		}
		
		_this.find('dd i').css({top:_cssTop});
	}).on('mouseleave',function(){
		var _this = $(this),
			_sub_mn = _this.children('dl');
		_this.removeClass('on');
		_sub_mn.css({opacity:0,left:'90%'}).hide();
	});
	
	//Category Best slider
	var cate_best_opt = {
		controls:false,
		captions: true,
		auto: false,
		onSliderLoad:function(){//start
		},
		onSlideBefore:function($slideElement, oldIndex, newIndex){//play idx
		}
	},
	cate_best = null;

	$('.cate_best dt .list_type a').on('click',function(){
		var _this = $(this),
			_idx = _this.index();
		_this.addClass('on').siblings().removeClass('on');
		
		var ordertype = $(this).data('order_type');
		searchProductList(ordertype, true);
	});
	
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
	searchProductList = function(orderType,clickType){
		var cateIdx = "<c:out value="${cateIdx}" />";
		var cPage = 1;
		
		if(clickType){
			$("#createSearchProductListTable").find('ul').remove();
		}
		if(cateIdx != ""){
			$.ajax({
	            async : false,
	            type : "POST",
	            data : { 
	            		"cateIdx": cateIdx 
	            		, "orderType": orderType 
	            		, "cPage": cPage 
	            	   },
	            url : "<c:out value="${frontDomain}" />/pc/product/productMainListAjax.do",
	            success : function (data) 
	            {
	            	
	            	if(data.listProduct != null)
	    			{
	    				var ulPrdId = "";
	    				
	    				$.each(data.listProduct, function(index,item)
	    				{
	    					var obj = new Object();
	    					
	    					obj.PRD_MST_CD = item.PRD_MST_CD;
	    					if(item.PRD_MST_NM.length >40){
	    						obj.PRD_MST_NM = item.PRD_MST_NM.substring(0,40);
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
	    					
	    					if(index == 3 || index == 11){
	    						obj.CLASS = "l";
	    					}else if( (index > 3 && index < 8) || (index > 11 && index == 15) ){
	    						obj.CLASS = "li_2";
	    					}else{
	    						obj.CLASS = "";
	    					}
	    					
	    					obj.PRD_MST_ERP_DSP_PRC = setComma(item.PRD_MST_ERP_PRC);
	    					obj.PRD_MST_ERP_DSP_PRC2 = item.PRD_MST_ERP_PRC;
	    					
	    					obj.PRD_MST_PRICE = setComma(item.PRD_MST_PRICE);
	    					obj.INDEX = index + 1;
	    					
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
	    					
	    					
	    					if(obj.INDEX == 1 || obj.INDEX == 9){
	    						ulPrdId = "ProductList_"+index;
	    					}
	    					
	    					if(ulPrdId != ""){
	    						if(obj.INDEX == 1 || obj.INDEX == 9){
	    							$("#createSearchProductListTable").append("<ul id=\""+ulPrdId+"\">");	
	    						}
	    					}
	    					$( "#SearchProductListTemplate" ).tmpl( obj ).appendTo($("#"+ulPrdId));
	    					
	    					
	    				});
	    				
	    			}
	    			else
	    			{
	    				//alert("조회된 데이터가 없습니다.");
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
		if(clickType) cate_best.destroySlider();//해제
		cate_best = $('.cate_best dd.list .slider').bxSlider(cate_best_opt);//실행
	};
	
	searchProductList("hit",false);
	
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
				window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
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
            //console.log('키핑하기 연동 오류가 발생하였습니다: ' + err.status);
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