<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-thema">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>웨딩</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .wedding_main S -->
		<section class="single_main wedding_main">
			<div class="wedding_mv">
				<img src="<c:out value="${cdnDomain}" />/mobile/img/thema/img_wedding_title.jpg" alt="결혼하세요." />
				<!-- iframe src="https://player.vimeo.com/video/149854253?autoplay=1&loop=1&title=0&byline=0&portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe-->
			</div>

			<nav class="ui-grid-a thema_nav _hd_fix">
				<a href="#guide_d" class="ui-block-a on"><strong>웨딩 가이드북</strong></a>
				<a href="#package_d" class="ui-block-b"><strong>웨딩 맞춤 패키지</strong></a>
			</nav>

			<!-- .tab_mn S -->
			<dl id="guide_d" class="tab_mn guide_d">
				<dt>
					<h3>
						<span>Wedding GuideBook</span>
						<strong>웨딩 가이드북</strong>
					</h3>
				</dt>
				<dd>					
					<div data-role="collapsible-set">
						<c:forEach items="${guide2DepList}" var="grow" varStatus="gsta">
						<c:set var="cnt" value="0" />
						<div data-role="collapsible">
							<h4 id="h4Id<c:out value="${gsta.count }" />"><c:out value="${grow.CMN_COM_NM }" /><i></i></h4>
							<ul>
								<c:forEach items="${guide3DepList }" var="row" varStatus="sta">
								<c:if test="${grow.CMN_COM_IDX eq row.CMN_COM_UP_IDX }">
								<li><a href="javascript:void(0);" onclick="goDetail('<c:out value="${grow.CMN_COM_UP_IDX }" />', '<c:out value="${grow.CMN_COM_IDX }" />', '<c:out value="${row.CMN_COM_IDX }" />'); return false;" class="_pg_link" ><c:out value="${row.CMN_COM_NM }" /></a></li>
								
								<c:set var="cnt" value="${cnt + 1 }" />
								</c:if>
								</c:forEach>
								<c:if test="${cnt eq 0}">
								<script type="text/javascript">
									$("#h4Id<c:out value="${gsta.count }" />").html('<c:out value="${grow.CMN_COM_NM }" />');
								</script>
								</c:if>
							</ul>
						</div>
						</c:forEach>
					</div>
				</dd>
			</dl>
			<!--// .tab_mn E -->
			<!-- .package_d S -->
			<dl id="package_d" class="package_d">
				<dt>
					<h3>
						<span>Wedding Package</span>
						<strong>웨딩 맞춤 패키지</strong>
					</h3>
					<ul class="ui-grid-a mn">
						<li class="ui-block-a">
							<a href="javascript:void(0)" class="on"><img src="<c:out value="${cdnDomain }" />/mobile/img/thema/img_wedding_1.png" alt="알뜰한 300만원대"></a>
						</li>
						<li class="ui-block-b">
							<a href="javascript:void(0)"><img src="<c:out value="${cdnDomain }" />/mobile/img/thema/img_wedding_2.png" alt="실속있는 500만원대" /></a>
						</li>
						<li class="ui-block-a">
							<a href="javascript:void(0)"><img src="<c:out value="${cdnDomain }" />/mobile/img/thema/img_wedding_3.png" alt="합리적인 800만원대" /></a>
						</li>
						<li class="ui-block-b">
							<a href="javascript:void(0)"><img src="<c:out value="${cdnDomain }" />/mobile/img/thema/img_wedding_4.png" alt="프리미엄 1000만원대" /></a>
						</li>
					</ul>
				</dt>
				<form method="post" name="frm" id="frm">
				<input type="hidden" name="tabIdx" id="tabIdx" value="300Product" />
				<input type="hidden" name="PRD_MST_CDs" id="PRD_MST_CDs" value="" />
				<input type="hidden" name="ESM_MST_TYPE" id="ESM_MST_TYPE" value="1815" />
				<dd class="pr_list" id="300Product">
					<strong>
						<strong>300</strong><span>만원대</span>
						<span class="tx_sub"><span class="ir">Wedding SHOW ROOM</span></span>
					</strong>
					<ul class="ui-grid-a">
					<c:set var="classNm" value="" />
					<c:set var="totPrice" value="0" />
					<c:set var="realTotPrice" value="0" />
					<c:forEach items="${product300List }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${sta.count mod 2 eq 1 }">
								<c:set var="classNm" value="a" />			
							</c:when>
							<c:otherwise>
								<c:set var="classNm" value="b" />
							</c:otherwise>
						</c:choose>
						<li class="ui-block-<c:out value="${classNm }" />" >
							<label for="chk_pr_<c:out value="${sta.count}" />" id="chk_pr_<c:out value="${sta.count}" />" style="display:none;">
								<input type="checkbox" name="chk_prs" id="chk_pr_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_ERP_DSP_PRC }" />" data-prc="<c:out value="${row.PRD_MST_DSP_PRC }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> style="display:none;"  />
							</label>
							<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
							<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" style="display:none;" >옵션필수선택상품</i>
							</c:if>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');" class="_pg_link" target="_blank">
								<span class="tx_img"><img data-original="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
								<span class="tx_ti"><c:out value="${row.PRD_MST_NM}" /></span>
								<strong class="tx_org" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>>
									<fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /><span>원</span>
								</strong>
								<c:choose>
									<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
										<strong class="tx_price">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:when>
									<c:otherwise>
										<strong class="tx_price co_red">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:otherwise>
								</c:choose>
							</a>
							<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_DSP_PRC }"/>" style="display:none;">
								<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
								<a href="javascript:optlayer('<c:out value="${row.PRD_MST_CD }" />', '<c:out value="${row.PRD_MST_DSP_PRC }"/>');" class="btn_opt">
									<span>옵션선택</span>
								</a>
								</c:if>
							</div>
						</li>
						
						<c:set var="totPrice" value="${totPrice + row.PRD_MST_ERP_DSP_PRC }" />
						<c:set var="realTotPrice" value="${realTotPrice + row.PRD_MST_DSP_PRC }" />
						
					</c:forEach>						
					</ul>
				</dd>
				
				<dd class="pr_list" id="500Product" style="display:none;">
					<strong>
						<strong>500</strong><span>만원대</span>
						<span class="tx_sub"><span class="ir">Wedding SHOW ROOM</span></span>
					</strong>
					
					
					<ul class="ui-grid-a">
						<c:forEach items="${product500List }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${sta.count mod 2 eq 1 }">
								<c:set var="classNm" value="a" />			
							</c:when>
							<c:otherwise>
								<c:set var="classNm" value="b" />
							</c:otherwise>
						</c:choose>
						<li class="ui-block-<c:out value="${classNm }" />" >
							<label for="chk_pr_<c:out value="${sta.count}" />" id="chk_pr_<c:out value="${sta.count}" />" style="display:none;" >
								<input type="checkbox" name="chk_prs" id="chk_pr_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_ERP_DSP_PRC }" />" data-prc="<c:out value="${row.PRD_MST_DSP_PRC }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if>  style="display:none;" />
							</label>
							<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
							<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" style="display:none;">옵션필수선택상품</i>
							</c:if>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');" class="_pg_link" target="_blank">
								<span class="tx_img"><img data-original="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
								<span class="tx_ti"><c:out value="${row.PRD_MST_NM}" /></span>
								<strong class="tx_org" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>>
									<fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /><span>원</span>
								</strong>
								<c:choose>
									<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
										<strong class="tx_price">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:when>
									<c:otherwise>
										<strong class="tx_price co_red">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:otherwise>
								</c:choose>
							</a>
							<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" style="display:none;">
								<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
								<a href="javascript:optlayer('<c:out value="${row.PRD_MST_CD }" />', '<c:out value="${row.PRD_MST_DSP_PRC }"/>');" class="btn_opt">
									<span>옵션선택</span>
								</a>
								</c:if>
							</div>
						</li>
					</c:forEach>
					</ul>
				</dd>
				
				<dd class="pr_list" id="800Product" style="display:none;">
					<strong>
						<strong>800</strong><span>만원대</span>
						<span class="tx_sub"><span class="ir">Wedding SHOW ROOM</span></span>
					</strong>
					
					
					<ul class="ui-grid-a">
						<c:forEach items="${product800List }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${sta.count mod 2 eq 1 }">
								<c:set var="classNm" value="a" />			
							</c:when>
							<c:otherwise>
								<c:set var="classNm" value="b" />
							</c:otherwise>
						</c:choose>
						<li class="ui-block-<c:out value="${classNm }" />" >
							<label for="chk_pr_<c:out value="${sta.count}" />" id="chk_pr_<c:out value="${sta.count}" />" style="display:none;">
								<input type="checkbox" name="chk_prs" id="chk_pr_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_ERP_DSP_PRC }" />" data-prc="<c:out value="${row.PRD_MST_DSP_PRC }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if>  style="display:none;" />
							</label>
							<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
							<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" style="display:none;">옵션필수선택상품</i>
							</c:if>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');" class="_pg_link" target="_blank">
								<span class="tx_img"><img data-original="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
								<span class="tx_ti"><c:out value="${row.PRD_MST_NM}" /></span>
								<strong class="tx_org" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>>
									<fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /><span>원</span>
								</strong>
								<c:choose>
									<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
										<strong class="tx_price">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:when>
									<c:otherwise>
										<strong class="tx_price co_red">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:otherwise>
								</c:choose>
							</a>
							<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" style="display:none;">
								<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
								<a href="javascript:optlayer('<c:out value="${row.PRD_MST_CD }" />', '<c:out value="${row.PRD_MST_DSP_PRC }"/>');" class="btn_opt">
									<span>옵션선택</span>
								</a>
								</c:if>
							</div>
						</li>
					</c:forEach>	
					</ul>
				</dd>
				
				<dd class="pr_list" id="1000Product" style="display:none;">
					<strong>
						<strong>1,000</strong><span>만원대</span>
						<span class="tx_sub"><span class="ir">Wedding SHOW ROOM</span></span>
					</strong>
					
					
					<ul class="ui-grid-a">
						<c:forEach items="${product1000List }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${sta.count mod 2 eq 1 }">
								<c:set var="classNm" value="a" />			
							</c:when>
							<c:otherwise>
								<c:set var="classNm" value="b" />
							</c:otherwise>
						</c:choose>
						<li class="ui-block-<c:out value="${classNm }" />" >
							<label for="chk_pr_<c:out value="${sta.count}" />" id="chk_pr_<c:out value="${sta.count}" />" style="display:none;">
								<input type="checkbox" name="chk_prs" id="chk_pr_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_ERP_DSP_PRC }" />" data-prc="<c:out value="${row.PRD_MST_DSP_PRC }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> style="display:none;" />
							</label>
							<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
							<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" style="display:none;">옵션필수선택상품</i>
							</c:if>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');" class="_pg_link" target="_blank">
								<span class="tx_img"><img data-original="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
								<span class="tx_ti"><c:out value="${row.PRD_MST_NM}" /></span>
								<strong class="tx_org" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>>
									<fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /><span>원</span>
								</strong>
								<c:choose>
									<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
										<strong class="tx_price">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:when>
									<c:otherwise>
										<strong class="tx_price co_red">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:otherwise>
								</c:choose>
							</a>
							<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" style="display:none;">
								<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
								<a href="javascript:optlayer('<c:out value="${row.PRD_MST_CD }" />', '<c:out value="${row.PRD_MST_DSP_PRC }"/>');" class="btn_opt">
									<span>옵션선택</span>
								</a>
								</c:if>
							</div>
						</li>
					</c:forEach>
					</ul>
				</dd>
				</form>
				
				<dd class="pr_gift" id="300Banner">
					<c:forEach items="${banner300 }" var="row" varStatus="sta">
					<img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="사은품 비파 헬싱키 스피커" />
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 추가 마일리지 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 신세계 상품권 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					</c:forEach>
				</dd>
				
				<dd class="pr_gift" id="500Banner" style="display:none;">
					<c:forEach items="${banner500 }" var="row" varStatus="sta">
					<img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="사은품 비파 헬싱키 스피커" />
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 추가 마일리지 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 신세계 상품권 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					</c:forEach>
				</dd>
				
				<dd class="pr_gift" id="700Banner" style="display:none;">
					<c:forEach items="${banner700 }" var="row" varStatus="sta">
					<img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="사은품 비파 헬싱키 스피커" />
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 추가 마일리지 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 신세계 상품권 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					</c:forEach>
				</dd>
				
				<dd class="pr_gift" id="1000Banner" style="display:none;">
					<c:forEach items="${banner1000 }" var="row" varStatus="sta">
					<img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="사은품 비파 헬싱키 스피커" />
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 추가 마일리지 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					<p>
						<i></i>
						<span class="tx_ti">패키지 구매 시 신세계 상품권 적립</span>
						<strong class="tx_price"><strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /></strong>
							<span class="tx_won">원</span>
						</strong>
					</p>
					</c:forEach>
				</dd>
				
				<div id="optlayer"></div>
				
				<dd class="total_prc">
					<dl>
						<dt class="blind">선택한 상품 가격비교</dt>
						<dd class="org_prc">
							<strong class="ti">일반구매 상품금액</strong>
							<strong class="tx_price"><strong><fmt:formatNumber value="${totPrice }" groupingUsed="true" /></strong><span class="tx_won">원</span></strong>
						</dd>
						<dd class="pkg_prc">
							<strong class="ti">웨딩킹 패키지금액</strong>
							<strong class="tx_price"><strong><fmt:formatNumber value="${realTotPrice }" groupingUsed="true" /></strong><span class="tx_won">원</span></strong>
							<strong class="tx_save">절약된 금액 : <strong><fmt:formatNumber value="${totPrice - realTotPrice }" groupingUsed="true" /></strong>원</strong>
						</dd>
					</dl>
				</dd>
				<dd class="tx_guide">
					<strong>
						웨딩킹은 고객님의 행복한 웨딩 준비를 함께 하기 위하여<br> 
						MD에게 견적을 요청하시면 더욱 알찬 혜택을 제공합니다.
					</strong>
					<span>
						견적서에서 원하시는 상품을 추가로 담아<br> 
						견적을 신청하실 수도 있습니다. 
					</span>
				</dd>
				<dd class="btn_box" >
					
				</dd>
			</dl>
			<!--// .package_d E -->
		</section>
		<!--// .wedding_main E -->
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>
$.com.thema = $.com.thema || {
	tab: function(){
		//테마 nav
		var _nav = $('.thema_nav'),
			_nav_a = _nav.children('a');
		_nav_a.on('click', function(e){
			e.preventDefault();
			var _this = $(this),
				_id = _this.attr('href'),
				_top = $(_id).offset().top,
				_nav_h = _nav.outerHeight(true)

			_this.addClass('on').siblings().removeClass('on');
			$('body').scrollTop(_top-_nav_h);
		});

		//패키지
		$('.package_d dt a').on('click', function(){
			var _this = $(this),
				_idx = _this.parent().index();
			_this.addClass('on').parent().siblings().children('a').removeClass('on');
			
			var id = "";
			
			if(_idx == 0){
				id = "300Product";
				$("#300Product").show();
				$("#500Product").hide();
				$("#800Product").hide();
				$("#1000Product").hide();
				$("#300Banner").show();
				$("#500Banner").hide();
				$("#800Banner").hide();
				$("#1000Banner").hide();
			}else if(_idx == 1){
				id = "500Product";
				$("#300Product").hide();
				$("#500Product").show();
				$("#800Product").hide();
				$("#1000Product").hide();
				$("#300Banner").hide();
				$("#500Banner").show();
				$("#800Banner").hide();
				$("#1000Banner").hide();
			}else if(_idx == 2){
				id = "800Product";
				$("#300Product").hide();
				$("#500Product").hide();
				$("#800Product").show();
				$("#1000Product").hide();
				$("#300Banner").hide();
				$("#500Banner").hide();
				$("#800Banner").show();
				$("#1000Banner").hide();
			}else if(_idx == 3){
				id = "1000Product";
				$("#300Product").hide();
				$("#500Product").hide();
				$("#800Product").hide();
				$("#1000Product").show();
				$("#300Banner").hide();
				$("#500Banner").hide();
				$("#800Banner").hide();
				$("#1000Banner").show();
			}
			//console.log('[300, 500, 800, 1000] / '+_idx);
			$.com.thema.total_prc(id);
			$.com.thema.pr_list_h();
			$("#tabIdx").val(id);
		});
	},
	total_prc: function(id){
		
		//돈계산 해줄게
		if(id == ""){
			id = "300Product";
		}
		var _list = $('#'+id +' ul li'),
			_total = $('.package_d'),
			_org_prc = _total.find('.org_prc .tx_price strong'),
			_pkg_prc = _total.find('.pkg_prc .tx_price strong'),
			_save_prc = _total.find('.pkg_prc .tx_save strong'),
			_tt_org = 0,
			_tt_prc = 0;
		
		_list.find('input[type="checkbox"]').off('click').on('click', function(){
			var _this = $(this),
			_prent = _this.parent(),
			_idx = _prent.index();

			var sell_state 	= _this.data("sell_state");
			var opt_est_cnt = _this.data("opt_est_cnt");
			
			//if(this.checked){
			
			if(sell_state == "O"){
				alert("품절 상품입니다.");
				return false;
			}
			
			if(opt_est_cnt > 0){
				alert("필수 옵션 상풉입니다.");
				return false;
			}
			//}else{
				
			//}
			
			$.com.thema.total_prc(id);
		});

		$.each(_list, function(i){
			var _this = $(this),
				_chk = _this.find('input[type="checkbox"]');

			if(!_chk.is(':checked')) return;
			
			var	_pr_org = _chk.data('org'),
				_pr_prc = _chk.data('prc');
			
			_tt_org += _pr_org;
			_tt_prc += _pr_prc;
		});
		
		String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
		_org_prc.text(String(_tt_org).number_format());
		_pkg_prc.text(String(_tt_prc).number_format());
		_save_prc.text(String((_tt_org-_tt_prc)).number_format());
	},
	pr_list_h: function(){
		var _li = $('#package_d .pr_list .ui-grid-a > li'),
			_h = 0;
		_li.height('');
		$.each(_li, function(i){
			var _this_h = $(this).height();
			if(_h < _this_h) _h = _this_h;
		});
		_li.height(_h);
	}//pr_list_h: function(){
};

$(document).on('scroll', function(){
	//console.log($.com.scroll_num);
	var _aaa = $('#package_d').offset().top,
		_bbb = $('.thema_nav');
	if($.com.scroll_num <= _aaa) _bbb.children().first().addClass('on').siblings().removeClass('on');
	else _bbb.children().last().addClass('on').siblings().removeClass('on');
});

$(document).ready(function(){
	$.com.thema.tab();
	$.com.thema.total_prc("300Product");
	$.com.thema.pr_list_h();
	
	$("#goEstimateBtn").click(function() {
		
	<c:choose>
		<c:when test="${commandMap.MEM_LOGIN_YN eq 'N'}">
			var url = location.href;
			url = encodeURIComponent(url);
			
			if(appType){
				callJavascriptLoginUrl(url); //app 로그인 연동
			}else{
				url = encodeURIComponent(url);
	        	location.target = "_self";
	        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
			}
		</c:when>
		<c:otherwise>
		
		var id 		= $("#tabIdx").val();
		var _list 	= $('#'+id +' ul li');
		var chk		= [];
		var _len	= 0;
		
		if(_list.length > 0){
			
			$.each(_list, function(i){
				var _this = $(this),
				_chk = _this.find('input[type="checkbox"]');
				
				if(!_chk.is(':checked')) return;
				var _span			= _chk.parents('li').find('.opt > span'),
				_prd_dtl_price	= 0,
				_opt_idx		= 0,
				_prd_mst_cd		= '',
				_prd_opt_cnt	= 1,
				_opt_est_yn		= 'N';
			
				// _span 길이가 없다면 옵션이 없다는 거. 기본 값 세팅
				if(_span.length > 0){
					
					$.each(_span, function(){
						
						var _this = $(this),
						_prd_dtl_price	= _this.data('prd_dtl_price'),
						_opt_idx		= _this.data('opt_idx'),
						_prd_opt_cnt	= _this.data('opt_cnt'),
						_opt_est_yn		= _this.data('opt_est_yn');
						chk.push(_chk.val() + '^' + _prd_dtl_price + '^' + _opt_idx + '^' + _prd_opt_cnt + '^' + _opt_est_yn);
					});
				}else{
					chk.push(_chk.val() + '^' + _prd_dtl_price + '^' + _opt_idx + '^' + _prd_opt_cnt + '^' + _opt_est_yn);
				}

				_len++;
			});
			
			if(_len > 0){
				if(confirm(_len + "개의 제품이 선택되었습니다.\nMD 추가 혜택 상담을 받으시겠습니까?")){
					$("#PRD_MST_CDs").val(chk);
					$("#frm").attr("action", "<c:out value="${mobileDomain}" />/mobile/themecategory/estimateProcess.do").submit();
				}
			}else{
				alert("선택된 상품이 없습니다.");
				return;
			}
			
		}else{
			alert("상품이 없습니다.");
			return;
		}
		
		</c:otherwise>
	</c:choose>
	});
	
	goDetail		= function(a,b,c){
		var url = "<c:out value="${mobileDomain}" />/mobile/themecategory/weddingConList.do?MGZ_MST_THM_CTG1=" + a + "&MGZ_MST_THM_CTG2=" + b + "&MGZ_MST_THM_CTG3="+ c;
		callJavascriptNextPage(url, '');
	};
	
	//optDel		= function(){
	$(document).on("click", "#optDel", function(){		
		var chk = false,
			_this = $(this),
			_opt = _this.parents('.opt'),
			_li	= _this.parents('li');
	
		
		var _span			= _this.parent('span'),
			_opt_est_yn		= _span.data('opt_est_yn'),
			_prd_dtl_price	= _span.data('prd_dtl_price');
		
		var prdMstCd		= _opt.data('prd_mst_cd');
		var prdPrice		= _opt.data('prd_mst_price');

		var mPrice			= 0;
		
		if(_opt_est_yn == 'Y'){
			mPrice			= _prd_dtl_price - prdPrice;
		}else{
			mPrice			= _prd_dtl_price;
		}
		
		var price			= _li.find('.pr_m strong').text().replace(/,/gi,'');
		var sellPrice		= _li.find(".sel_m strong").text().replace(/,/gi,'');
		
		_li.find('.pr_m strong').text(setComma(price - mPrice));
		_li.find(".sel_m strong").text(setComma(sellPrice - mPrice));
		_span.remove();
		
		$.each(_opt.find('span'), function(i){
			if( $(this).data('opt_est_yn') == 'Y') chk = true;  
		});
		
		if(!chk){
			_opt.html('<a href="javascript:optlayer(\'' + prdMstCd + '\', \'' + prdPrice + '\')"  class="btn_opt"><span>옵션선택</span></a>');
			_li.find('.ui-checkbox').after('<i class="ico_pot_tx" id="pot_'+prdMstCd+'">옵션필수선택상품</i>');
			$("#chk_pr_"+ prdMstCd).attr("checked", false);
			price	= $("#chk_pr_"+ prdMstCd).data("org");
			sellPrice = $("#chk_pr_"+ prdMstCd).data("prc");
			
			_li.find('.pr_m strong').text(setComma(price));
			_li.find(".sel_m strong").text(setComma(sellPrice));
		}
		var tabIdx	= $("#tabIdx").val();
		$.com.thema.total_prc(tabIdx);
	});
	
});
</script>
<%@ include file="/WEB-INF/jsp/mobile/include/productOptPop.jsp" %>
