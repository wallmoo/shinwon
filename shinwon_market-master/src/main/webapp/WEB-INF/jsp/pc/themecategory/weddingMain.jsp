<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-theme">

<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->

			<!-- .wedding_d S -->
			<section class="wedding_d">
				
				<!-- .search S -->
				<div class="search">
					<form method="post" name="sFrm" id="sFrm" action="" >
					<input type="hidden" name="cPage" id="cPage" value="" />
					<input type="hidden" name="searchMgzMstThmCtg1" value="2251" />
					<input type="hidden" name="searchMgzMstThmCtg2" id="searchMgzMstThmCtg2" value="" />
					<input type="hidden" name="searchMgzMstThmCtg3" id="searchMgzMstThmCtg3" value="" />
					<input type="hidden" name="CMN_COM_IDX" id="CMN_COM_IDX" value= "" />
					<input type="hidden" name="startCount"value="0">
					<input type="hidden" name="collection" value="thema">
					<dl>
						<dt>
							<div class="blind">
								<strong>Your Sweet Wedding</strong>
								<h2>결혼하세요?</h2>
								<h3>시간은 없고, 뭘 구입해야 할지 고민중이시라면<br/>마켓플랜트 웨딩킹에서 척척 해결하세요~</h3>
							</div>
						</dt>
						
						<dd>
							<label for="inp_search">
								<input type="text" id="inp_search" name="searchKeyword" placeholder="Wedding plan의 모든 것! 키워드로 검색하세요" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
						
					</dl>
					</form>
					<i class="msk_gr"></i>
					<iframe src="https://player.vimeo.com/video/161427096?autoplay=1&loop=1&title=0&byline=0&portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
				</div>
				<!-- .search E -->
				<!-- .search_list S -->
				<div class="search_list">
					
				</div>
				<!-- .search_list E -->
				<form name="gfrm" id="gfrm">
				    <input type="hidden" id="MGZ_MST_IDX" name="MGZ_MST_IDX" value="" />
				</form>
				<!-- .guideBook S -->
				<dl class="guideBook">
					<dt class="dt_tab">
						<a href="javascript:void(0)" class="on"><span>웨딩 가이드북</span></a>
						<a href="javascript:void(0)"><span>웨딩 맞춤 패키지</span></a>
					</dt>
					<dd class="line_list">
						<ol class="minW">
							<c:forEach items="${guide2DepList}" var="grow" varStatus="gsta">
							<li class="li_<c:out value="${gsta.count }" />" data-cmn_com_idx="<c:out value="${grow.CMN_COM_IDX }"/>" >
								<i class="ico_point">
									<i class="img_ov"></i>
									<i class="img_de"></i>
								</i>
								<strong><c:out value="${grow.CMN_COM_NM }" /></strong>
								<dl>
									<a href="javascript:void(0)" data-mgz_mst_thm_ctg2="<c:out value="${grow.CMN_COM_IDX }"/>"  id="2depth" ><dt><i class="ico_ar"></i><c:out value="${grow.CMN_COM_NM }" /></dt></a>
									<dd>
									</dd>
								</dl>
							</li>
							</c:forEach>
						</ol>
					</dd>
				</dl>
				<!-- .guideBook E -->

				<!-- .package S -->
				<dl class="package">
					<dt class="dt_tab">
						<a href="javascript:void(0)"><span>웨딩 가이드북</span></a>
						<a href="javascript:void(0)" class="on"><span>웨딩 맞춤 패키지</span></a>
						<i class="bg_mask"></i>

						<span class="ti">
							<span class="blind">예산별 고민없는 <strong>웨딩킹의 가격대별 패키지</strong><br/>
							MD와 가격흥정은 덤으로~</span>
						</span>							
					</dt>
					<dd class="minW tab_mn">
						<a href="javascript:void(0)" class="f mn_01">
							<strong class="ti"><span class="blind">알뜰한 300만원대</span></strong>
							<span class="tx">
								딱! 필요한 것만<br/>쏙쏙 골라서 사야지~
								<span class="blind">Wedding Day</span>
							</span>
							<span class="tr">
								<i class="front"></i>
								<i class="back"></i>
							</span>
						</a>
						<a href="javascript:void(0)" class="mn_02">
							<strong class="ti"><span class="blind">실속있는 500만원대</span></strong>
							<span class="tx">
								필요한 것에만<br/>집중하는 것이 현명해~
								<span class="blind">Wedding Day</span>
							</span>
							<span class="tr">
								<i class="front"></i>
								<i class="back"></i>
							</span>
						</a>
						<a href="javascript:void(0)" class="mn_03">
							<strong class="ti"><span class="blind">합리적인 800만원대</span></strong>
							<span class="tx">
								이 정도는<br/>투자해야 만족하지~
								<span class="blind">Wedding Day</span>
							</span>
							<span class="tr">
								<i class="front"></i>
								<i class="back"></i>
							</span>
						</a>
						<a href="javascript:void(0)" class="l mn_04">
							<strong class="ti"><span class="blind">프리미엄 1000만원대</span></strong>
							<span class="tx">
								디자인과 기능<br/>모두 포기하지 않아~ 
								<span class="blind">Wedding Day</span>
							</span>
							<span class="tr">
								<i class="front"></i>
								<i class="back"></i>
							</span>
						</a>
					</dd>
				</dl>
				<form method="post" name="frm" id="frm">
				<input type="hidden" name="tabIdx" id="tabIdx" value="0" />
				<input type="hidden" name="PRD_MST_CDs" id="PRD_MST_CDs" value="" />
				<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="0" />
				<input type="hidden" name="ESM_MST_TYPE" id="ESM_MST_TYPE" value="1815" />
				<div class="minW package_con tab_1">
					<i class="ico_ar"></i>
					<a href="javascript:void(0)" class="btn_close"><span class="ir">닫기</span></a>
					<div class="sec_ti">
						<h3 class="ti_300"><span class="ir">300만원대</span></h3>
						<span class="tx"><span class="ir">Wedding SHOW ROOM</span></span>
					</div>
					
					<c:set var="classNm" value="" />
					<c:set var="totPrice" value="0" />
					<c:set var="realTotPrice" value="0" />
					<c:set var="prListNum" value="0" />
					<div class="pr_list" id="pr_list_0">
						<ol>
							<c:forEach items="${product300List }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> ></label>
								<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
								<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" >옵션필수선택상품</i>
								</c:if>
								<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />" target="_blank">
									<img src="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" alt="상품사진">
									<span class="ti"><c:out value="${row.PRD_MST_NM}" /></span>
									<strong class="pr_m" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
									
									<c:choose>
										<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
											<strong class="sel_m"><strong><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
										</c:when>
										<c:otherwise>
											<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
										</c:otherwise>
									</c:choose>									
								</a>
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_DSP_PRC }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a>
									</c:if>
								</div>
							</li>
							<c:set var="prListNum" value="${sta.count }" />
							</c:forEach>
							
							<c:if test="${prListNum mod 4 != 0 }">
							<c:forEach begin="1" end="${4 - (prListNum mod 4 ) }" varStatus="sta">
								<li <c:if test="${sta.last }">class="l"</c:if> ></li>
							</c:forEach>
							</c:if>
						</ol>
					</div>
					
					<div class="pr_list" id="pr_list_1">
						<ol>
							<c:forEach items="${product500List }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> ></label>
								<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
								<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" >옵션필수선택상품</i>
								</c:if>
								<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />" target="_blank">
									<img src="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" alt="상품사진">
									<span class="ti"><c:out value="${row.PRD_MST_NM}" /></span>
									
									<strong class="pr_m" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
									
									<c:choose>
										<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
											<strong class="sel_m"><strong><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
										</c:when>
										<c:otherwise>
											<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
										</c:otherwise>
									</c:choose>									
								</a>
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_DSP_PRC }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a>
									</c:if>
								</div>
							</li>
							
							<c:set var="prListNum" value="${sta.count }" />
							</c:forEach>
							
							<c:if test="${prListNum mod 4 != 0 }">
							<c:forEach begin="1" end="${4 - (prListNum mod 4 ) }" varStatus="sta">
								<li <c:if test="${sta.last }">class="l"</c:if> ></li>
							</c:forEach>
							</c:if>
						</ol>
					</div>
					
					<div class="pr_list" id="pr_list_2" >
						<ol>
							<c:forEach items="${product800List }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> ></label>
								<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
								<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" >옵션필수선택상품</i>
								</c:if>
								<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />" target="_blank">
									<img src="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" alt="상품사진">
									<span class="ti"><c:out value="${row.PRD_MST_NM}" /></span>
									
									<strong class="pr_m" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
									
									<c:choose>
										<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
											<strong class="sel_m"><strong><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
										</c:when>
										<c:otherwise>
											<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
										</c:otherwise>
									</c:choose>
								</a>
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_DSP_PRC }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a>
									</c:if>
								</div>
							</li>
							
							<c:set var="prListNum" value="${sta.count }" />
							</c:forEach>
							
							<c:if test="${prListNum mod 4 != 0 }">
							<c:forEach begin="1" end="${4 - (prListNum mod 4 ) }" varStatus="sta">
								<li <c:if test="${sta.last }">class="l"</c:if> ></li>
							</c:forEach>
							</c:if>
						</ol>
					</div>
					
					<div class="pr_list" id="pr_list_3">
						<ol>
							<c:forEach items="${product1000List }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> ></label>
								<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
								<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" >옵션필수선택상품</i>
								</c:if>
								<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />" target="_blank">
									<img src="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" alt="상품사진">
									<span class="ti"><c:out value="${row.PRD_MST_NM}" /></span>
									
									<strong class="pr_m" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
									<c:choose>
										<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
											<strong class="sel_m"><strong><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
										</c:when>
										<c:otherwise>
											<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
										</c:otherwise>
									</c:choose>									
								</a>
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_DSP_PRC }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a>
									</c:if>
								</div>
							</li>
							<c:set var="prListNum" value="${sta.count }" />
							</c:forEach>
							
							<c:if test="${prListNum mod 4 != 0 }">
							<c:forEach begin="1" end="${4 - (prListNum mod 4 ) }" varStatus="sta">
								<li <c:if test="${sta.last }">class="l"</c:if> ></li>
							</c:forEach>
							</c:if>
						</ol>
					</div>
					
					
					<div class="gifts" id="gifts_0">
						<c:forEach items="${banner300 }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${row.BNR_MST_TGT eq 'C' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>
							</c:when>
							<c:when test="${row.BNR_MST_TGT eq 'N' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" target="_blank"><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:when>
							<c:otherwise>
						<a href="javascript:void(0)" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:otherwise>
						</c:choose>
						<div class="saving">
							<i class="ico_plus"></i>
							<ol class="list">
								<li>
									<span>패키지 구매 시 추가 마일리지 적립</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /><span>원</span></strong>
								</li>
								<li class="l">
									<span>패키지 구매 시 신세계 상품권 증정</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /><span>원</span></strong>
								</li>
							</ol>
						</div>
						</c:forEach>
					</div>
					
					<div class="gifts" id="gifts_1">
						<c:forEach items="${banner500 }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${row.BNR_MST_TGT eq 'C' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>
							</c:when>
							<c:when test="${row.BNR_MST_TGT eq 'N' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" target="_blank"><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:when>
							<c:otherwise>
						<a href="javascript:void(0)" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:otherwise>
						</c:choose>
						<div class="saving">
							<i class="ico_plus"></i>
							<ol class="list">
								<li>
									<span>패키지 구매 시 추가 마일리지 적립</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /><span>원</span></strong>
								</li>
								<li class="l">
									<span>패키지 구매 시 신세계 상품권 증정</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /><span>원</span></strong>
								</li>
							</ol>
						</div>
						</c:forEach>
					</div>
					
					<div class="gifts" id="gifts_2">
						<c:forEach items="${banner800 }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${row.BNR_MST_TGT eq 'C' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>
							</c:when>
							<c:when test="${row.BNR_MST_TGT eq 'N' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" target="_blank"><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:when>
							<c:otherwise>
						<a href="javascript:void(0)" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:otherwise>
						</c:choose>
						<div class="saving">
							<i class="ico_plus"></i>
							<ol class="list">
								<li>
									<span>패키지 구매 시 추가 마일리지 적립</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /><span>원</span></strong>
								</li>
								<li class="l">
									<span>패키지 구매 시 신세계 상품권 증정</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /><span>원</span></strong>
								</li>
							</ol>
						</div>
						</c:forEach>
					</div>
					
					<div class="gifts" id="gifts_3">
						<c:forEach items="${banner1000 }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${row.BNR_MST_TGT eq 'C' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>
							</c:when>
							<c:when test="${row.BNR_MST_TGT eq 'N' }">
						<a href="<c:out value="${frontDomain }${row.BNR_MST_URL }" />" class="img_banner" target="_blank"><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:when>
							<c:otherwise>
						<a href="javascript:void(0)" class="img_banner" ><img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }" />" alt="배너" /></a>							
							</c:otherwise>
						</c:choose>
						<div class="saving">
							<i class="ico_plus"></i>
							<ol class="list">
								<li>
									<span>패키지 구매 시 추가 마일리지 적립</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_MIL_ADD }" groupingUsed="true" /><span>원</span></strong>
								</li>
								<li class="l">
									<span>패키지 구매 시 신세계 상품권 증정</span>
									<strong><fmt:formatNumber value="${row.BNR_MST_GFT }" groupingUsed="true" /><span>원</span></strong>
								</li>
							</ol>
						</div>
						</c:forEach>
					</div>
					
					
					<dl class="total_price">
						<dt>
							<i class="ico_ar_b"></i>
							<strong>패키지 주문 금액</strong>
						</dt>
						<dd class="prc">
							<div class="all">
								<span class="ti">일반 구매 금액</span>
								<strong class="money"><strong>0</strong><span class="tx_won">원</span></strong>
									
							</div>
							<div class="pk">
								<span class="ti">웨딩킹 패키지 금액</span>
								<strong class="money"><strong>0</strong><span class="tx_won">원</span></strong>
								
							</div>
							<div class="save">
								<strong>0</strong>
								<span>원을 절약 하셨습니다.</span>
							</div>
						</dd>
						<dd class="tip">
							<p>웨딩킹은 고객님의 행복한 웨딩 준비를 함께 하기 위하여 MD에게 견적을 요청하시면<br/>더욱 알찬 혜택을 제공합니다.</p>
							<span class="ico_tip">견적서에서 원하시는 상품을 추가로 담아 견적을 신청하실 수도 있습니다. </span>

							<a href="javascript:void(0)" id="goEstimateBtn">
								<strong>MD에게 견적상담 요청하기</strong>
							</a>
						</dd>
					</dl>

				</div>
				<!-- .package E -->
				
			</section>
			<!-- .wedding_d E -->
			
		


		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
    	
<script>
var sc_to = 0;
$(window).scroll(function(){
	sc_to = $(window).scrollTop(),
	sc_ck = win_h/2,
	sc_ck = sc_ck+sc_to;

	if(sc_ck >= $('.guideBook').offset().top && !$('.guideBook').hasClass('sc_ck')){
		$('.guideBook').addClass('sc_ck');
		weddings.guideBook();
	}
});
$(document).ready(function(){
	weddings.packages();
	if(ie != 7 && ie != 8){
		weddings.search();
		$(window).resize(weddings.search);
	}
	$('#inp_search').focus();
	
	$(document).on("click", ".ico_search", function(){
		if($("#inp_search").val == ""){
			alert("검색어를 입력하세요.");
			$('#inp_search').focus();
			return;
		}else{
			//weddings.goSearch(1);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/weddingSearch.do").submit();
		}
	});
	
	$(document).on("keydown", "#inp_search", function (e) {
        if(e.keyCode == 13){
            $(".ico_search").trigger("click");
            return false;
        }
    });
	
	$(document).on("click", ".btn_white", function(e){
		$("#inp_search").val("");
		$(".search_list").html("");
		
	});
	
	goPage = function (cPage){
		weddings.goSearch(cPage);
    };
    
    goView = function(idx){
    	$("#MGZ_MST_IDX").val(idx);
    	$("#gfrm").attr("action", "/pc/themecategory/themeConView.do").submit();
    };
    
    $(document).on("click", "#3depth", function(){
    	var cmn_com_idx = $(this).data("cmn_com_idx");
    	var mgz_mst_thm_ctg2 = $(this).data("mgz_mst_thm_ctg2");
    	var mgz_mst_thm_ctg3 = $(this).data("mgz_mst_thm_ctg3");
    	
    	$("#cPage").val(1);
    	$("#inp_search").val("");
    	$("#CMN_COM_IDX").val(cmn_com_idx);
    	$("#searchMgzMstThmCtg2").val(mgz_mst_thm_ctg2);
    	$("#searchMgzMstThmCtg3").val(mgz_mst_thm_ctg3);
		$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/weddingConList.do");
		$("#sFrm").submit();
	});
    
    $(document).on("click", "#2depth", function(){
    	var mgz_mst_thm_ctg2 = $(this).data("mgz_mst_thm_ctg2");
    	var cmn_com_idx = $(this).data("cmn_com_idx");
    	
    	$("#cPage").val(1);
    	$("#inp_search").val("");
    	$("#CMN_COM_IDX").val(cmn_com_idx);
    	$("#searchMgzMstThmCtg2").val(mgz_mst_thm_ctg2);
		$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/weddingConList.do");
		$("#sFrm").submit();
	});
    
    $(document).on("click", "#goEstimateBtn", function(){
    	
   	<c:choose>
		<c:when test="${commandMap.MEM_LOGIN_YN eq 'N'}">
			var url = location.href;
			url = encodeURIComponent(url);
	    	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
		</c:when>
		<c:otherwise>
		
		var id 		= $("#tabIdx").val();
		var _list 	= $('#pr_list_'+id +' ol li');
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
					$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/estimateProcess.do").submit();
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
    
    $(document).on("click", "#putBtn", function(){
    	var prd_mst_idx = $(this).data("prd_mst_cd");

   		if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
			goProductView(prd_mst_idx);
			return;
		}else{
			return;
		}
    	
    });
    
    goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd + '&esmCart=theme',"1030","900","no","productViewPopup");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
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
			_opt.html('<span><a href="javascript:void(0)" data-prd_mst_cd="'+ prdMstCd +'" id="putBtn" class="btn_opt">옵션선택</a></span>');
			_li.find('label').after('<i class="ico_pot_tx" id="pot_'+prdMstCd+'">옵션필수선택상품</i>');
			_li.find("label").removeClass("on");
			$("#inp_ck_"+ prdMstCd).attr("checked", false);
			price	= $("#inp_ck_"+ prdMstCd).data("org");
			sellPrice = $("#inp_ck_"+ prdMstCd).data("prc");
			
			_li.find('.pr_m strong').text(setComma(price));
			_li.find(".sel_m strong").text(setComma(sellPrice));
		}
		var tabIdx	= $("#tabIdx").val();
		weddings.pr_ck2('#pr_list_'+tabIdx+' label');
		theme.pkg_list_h();
	});
	
});

var weddings = (function(){
	return{
		//상단 동영상
		search: function(){
			var _sh = $('.wedding_d .search'),
				_sh_h = _sh.height(),
				css_w = win_w - 710;
			if(win_w > 710) _sh.find('iframe').removeAttr('style').css({height:(_sh_h+css_w), marginTop:-(css_w/2)});
			else _sh.find('iframe').removeAttr('style').css({width:(win_w+Math.abs(css_w)), marginLeft:(css_w/2)});
		},//search: function(){
		goSearch : function(cPage){
			$("#cPage").val(cPage);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/weddingConList.do").submit();
		},
		//가이드북
		guideBook : function(){
			var guideBook = $('.guideBook .line_list'),
				_stp = guideBook.find('li'),
				eq_num = 0;

			for(var i=0; i<_stp.length; i++ ){
				setTimeout(function(){
					_stp.eq(eq_num).fadeIn();
					eq_num++;
				},i*150);
			}//for(var i=0; i<_stp.length; i++ ){
			
			_stp.on('mouseenter', function(){
				var _this = $(this),
					_idx = _this.index(),
					_img_ov = _this.find('.img_ov'),
					_sub_list = _this.find('dl'),
					_cmn_com_idx = $(this).data("cmn_com_idx");
				
					$.ajax({
						async : false,
						type : "POST",
						data : {"CMN_COM_UP_IDX" : _cmn_com_idx},
						url	 : "<c:out value="${frontDomain}" />/pc/themecategory/guide3DepListAjax.do",
						success : function(data) {
							var innerHtml	= "";
							$.each(data.list, function(i,item){  
								innerHtml	+= '<a href="javascript:void(0)" data-mgz_mst_thm_ctg3='+ item.CMN_COM_IDX +' data-mgz_mst_thm_ctg2='+ _cmn_com_idx + ' data-cmn_com_idx='+ item.CMN_COM_IDX+' id="3depth" ><span>' + item.CMN_COM_NM + '</span></a>';
			                });
							_this.find('dd').html(innerHtml);
						},
						error : function(err) {
							//alert("오류가 발생하였습니다.\n[" + err.status + "]");
							window.jquery
									|| console
											.log('오류가 발생하였습니다: ' + err.status);
						}
					});
				
				if(_img_ov.is(':animated')) return false;
				_img_ov.animate({opacity:'1',left:'0',top:'0',width:'100%',height:'100%'}, 200, function(){
					
					// 레이어
					var _a_lg = _sub_list.find('dd a').length;
					if(_a_lg > 0){
						_this.siblings().find('dl').hide();
						_sub_list.fadeIn();
					}
					//아이콘
					var _ico_lg = _img_ov.children().length;
					if(_ico_lg > 0){
						$.each(_img_ov.children(), function(i){
							var _this = $(this),
								_data_top = _this.data('top');

							$(this).animate({opacity:'1', top:_data_top}, 200*i);
						});
					}
				});

			}).on('mouseleave', function(){
				var _this = $(this),
					_idx = _this.index(),
					_img_ov = _this.find('.img_ov'),
					_sub_list = _this.find('dl');
				
				if(_idx == 0) return false;
				_sub_list.fadeOut();
				_img_ov.children().stop().animate({opacity:'0',left:'50%',top:'50%',width:'0',height:'0'}, 200, function(){
					_img_ov.children().removeAttr('style');
				});
				_img_ov.stop().animate({opacity:'0',left:'50%',top:'50%',width:'0',height:'0'}, 200, function(){
					_img_ov.removeAttr('style');
				});
			});
			
			
		},//guideBook = function(){
		pr_ck: function(_label){
			var all_pr = 0,
				pk_pr = 0,
				_pr_d = $('.wedding_d .package_con .total_price .prc')
				tx_all_pr = _pr_d.find('.all .money'),
				tx_pk_pr = _pr_d.find('.pk .money'),
				tx_save_pr = _pr_d.find('.save strong');
			
			$.each(_label, function(i){
				var _this = $(this);
				if( _this.hasClass('on') ){
					
					var _next = _this.next();
					all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
					pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
				}
			});
			
			String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
			tx_all_pr.text(String(all_pr).number_format());
			tx_pk_pr.text(String(pk_pr).number_format());
			tx_save_pr.text(String(all_pr-pk_pr).number_format());
		},//pr_ck: function(_label){
		
		pr_ck2: function(_label){
			var _label = $(_label);
			var all_pr = 0,
				pk_pr = 0,
				_pr_d = $('.wedding_d .package_con .total_price .prc')
				tx_all_pr = _pr_d.find('.all .money'),
				tx_pk_pr = _pr_d.find('.pk .money'),
				tx_save_pr = _pr_d.find('.save strong');
			
			$.each(_label, function(i){
				var _this = $(this);
				if( _this.hasClass('on') ){
										
					var _next = _this.next();
					all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
					pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
				}
			});
			String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
			tx_all_pr.text(String(all_pr).number_format());
			tx_pk_pr.text(String(pk_pr).number_format());
			tx_save_pr.text(String(all_pr-pk_pr).number_format());
		},//pr_ck2: function(_label){
			
		//웨딩 맞춤 패키지
		packages : function(){
			var _tab = $('.package .tab_mn a'),
				_tabCon = $('.package_con'),
				_recks = function(_idx){//계산
					var _list_d = _idx,
						_label = _list_d.find('label');

					_label.off('click').on('click', function(e){
						var _this = $(this),
							_prent = _this.parent(),
							_idx = _prent.index();

						var sell_state 	= _this.children('input').data("sell_state");
						var opt_est_cnt = _this.children('input').data("opt_est_cnt");
						
						if(sell_state == "O"){
							alert("품절 상품입니다.");
							return false;
						}
						if(opt_est_cnt > 0){
							alert("필수 옵션 상풉입니다.");
							return false;
						}
						if(_this.hasClass('on')) _this.removeClass('on').children('input').prop('checked', false);
						else _this.addClass('on').children('input').prop('checked', true);
						weddings.pr_ck(_label);
						return false;
					});

					/*function pr_ck(){
						var all_pr = 0,
							pk_pr = 0,
							_pr_d = $('.wedding_d .package_con .total_price .prc')
							tx_all_pr = _pr_d.find('.all .money'),
							tx_pk_pr = _pr_d.find('.pk .money'),
							tx_save_pr = _pr_d.find('.save strong');

						$.each(_label, function(){
							var _this = $(this);
							if( _this.hasClass('on') ){
								var _next = _this.next();
								all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
								pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
							}
						});
						String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
						tx_all_pr.text(String(all_pr).number_format());
						tx_pk_pr.text(String(pk_pr).number_format());
						tx_save_pr.text(String(all_pr-pk_pr).number_format());
					}//function pr_ck(){
						*/
					weddings.pr_ck(_label);
				};//_recks = function(){
			
			_tab.on('click', function(){
				var _this = $(this),
					_idx = _this.index(),
					_tabcon = $('#pr_list_'+_idx),
					_h3 = _tabCon.find('.sec_ti h3'),
					_h3_tx = ['300만원대','500만원대','800만원대','1000만원대'],
					_class = ['ti_300','ti_500','ti_800','ti_1000'];
				
				if(_tabCon.css('display') != 'block') _tabCon.show();
				$('.pr_list').hide();
				_tabcon.show();
				$('.gifts').hide();
				$('#gifts_' + _idx).show();
				
				if(!_this.hasClass('on')){
					_this.find('.tx').css('background-position', '0 0').animate({'background-position-y':'-350px'}, 300);
					_this.siblings().find('.tx').animate({'background-position-y':'0'}, 300, function(){
						$(this).removeAttr('style')
					});
				}
				
				if(ie == 7 || ie == 8 || ie == 9){
					_this.find('.tr .front').animate({top:'100%'}, 200);
					_this.addClass('on').siblings().removeClass('on').find('.tr .front').animate({top:'0'}, 200);
				}else{				
					_this.children('.tr').flip(true);
					_this.addClass('on').siblings().removeClass('on').children('.tr').flip(false);					
				}
				_tabCon.removeAttr('class').addClass('minW package_con tab_'+(_idx+1));
				_h3.removeAttr('class').addClass(_class[_idx]).children().text(_h3_tx[_idx]);
				
				_recks(_tabcon);
				$("#tabIdx").val(_idx);
			});//_tab.on('click', function(){
			if(ie != 7 && ie != 8 && ie != 9){
				_tab.children('.tr').flip({
					axis: "y", // y or x
					reverse: false, // true and false
					trigger: "click", // click or hover
					speed: 300
				});
			}
			_tab.first().trigger('click');
			_tabCon.find('.btn_close').on('click', function(){
				_tabCon.hide();
				if(ie == 7 || ie == 8 || ie == 9) _tab.find('.tr .front').animate({top:'0'}, 200);	
				else _tab.children('.tr').flip(false);
				
				_tab.removeClass('on').find('.tx').animate({'background-position-y':'0'}, 300, function(){
					$(this).removeAttr('style')
				});
			});

			//가이드북,패키지 탭
			$('.guideBook, .package').find('.dt_tab a').on('click', function(){
				var _this = $(this),
					_idx = _this.index();
				 $('html,body').animate({
					scrollTop: _idx == 0 ? $('.guideBook').offset().top : $('.package').offset().top
				}, 200);
			});
			
			$('.pr_list').hide();
			$('#pr_list_0').show();
			$('.gifts').hide();
			$('#gifts_0').show();
		},//packages : function(){
		pkg_list_h :function(){
			/*
				옵션 추가되면 리스트 높이 맞쳐줘요
			*/
			var _pr_list = $('.package_con .pr_list');
			$.each(_pr_list, function(){
				var _this = $(this),
					_h = 0;
				if(_this.css('display') == 'block'){
					$.each(_this.find('li'), function(){
						var _this = $(this);
						_this.css('height', '');
						var _this_h = _this.height();
						if(_h < _this_h) _h = _this_h;
					});
					_this.find('li').height(_h);
				}
			});

		}//pkg_list_h : function(){	
	}//return{
})();//var guideBooks = (function(){

//theme.pkg_list_h();
//theme.pr_ck();
//theme.pr_ck2();

var theme = {
	pkg_list_h :function(){
		/*
			옵션 추가되면 리스트 높이 맞쳐줘요
		*/
		var _pr_list = $('.package_con .pr_list');
		$.each(_pr_list, function(){
			var _this = $(this),
				_h = 0;
			if(_this.css('display') == 'block'){
				$.each(_this.find('li'), function(){
					var _this = $(this);
					_this.css('height', '');
					var _this_h = _this.height();
					if(_h < _this_h) _h = _this_h;
				});
				_this.find('li').height(_h);
			}
		});

	},//pkg_list_h : function(){	
	pr_ck: function(_label){
		var all_pr = 0,
			pk_pr = 0,
			_pr_d = $('.wedding_d .package_con .total_price .prc')
			tx_all_pr = _pr_d.find('.all .money'),
			tx_pk_pr = _pr_d.find('.pk .money'),
			tx_save_pr = _pr_d.find('.save strong');
		
		$.each(_label, function(i){
			var _this = $(this);
			if( _this.hasClass('on') ){
				
				var _next = _this.next();
				all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
				pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
			}
		});
		String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
		tx_all_pr.text(String(all_pr).number_format());
		tx_pk_pr.text(String(pk_pr).number_format());
		tx_save_pr.text(String(all_pr-pk_pr).number_format());
	},//pr_ck: function(_label){
	
	pr_ck2: function(_label){
		var _label = $(_label);
		var all_pr = 0,
			pk_pr = 0,
			_pr_d = $('.wedding_d .package_con .total_price .prc')
			tx_all_pr = _pr_d.find('.all .money'),
			tx_pk_pr = _pr_d.find('.pk .money'),
			tx_save_pr = _pr_d.find('.save strong');
		
		$.each(_label, function(i){
			var _this = $(this);
			if( _this.hasClass('on') ){
									
				var _next = _this.next();
				all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
				pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
			}
		});
		String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
		tx_all_pr.text(String(all_pr).number_format());
		tx_pk_pr.text(String(pk_pr).number_format());
		tx_save_pr.text(String(all_pr-pk_pr).number_format());
	}//pr_ck2: function(_label){
}
	
//이거이거 나중에 이름 바꺼서 하든 해주세요.
//MD 추가혜택 견적상담 받기
function test(){
	var _list_d = $('.pr_list'),
		_label = _list_d.find('label'),
		_re = [];
	
	$.each(_label, function(i){
		var _this = $(this);
		if(_this.hasClass('on')){
			var _idx = _this.parent().index();
			_re.push(_idx);
		}
	});
	//console.log(_re);
	
}
</script>