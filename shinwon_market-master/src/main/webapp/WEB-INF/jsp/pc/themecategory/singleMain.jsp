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

			<!-- .sing_d S -->
			<section class="sing_d">
				
				<!-- .search S -->
				<div class="search">
					<dl class="minW">
						<dt>
							<h3 class="blind">당신의 화려하고 당당한 싱글라이프!<strong>마켓플랜트 싱글킹</strong>이 도와드립니다.</h3>
						</dt>
						<form method="post" name="sFrm" id="sFrm">
						<input type="hidden" name="cPage" id="cPage" value="" />
						<input type="hidden" name="searchMgzMstThmCtg1" value="2252" />
						<input type="hidden" name="searchMgzMstThmCtg2" id="searchMgzMstThmCtg2" value="" />
						<input type="hidden" name="searchMgzMstThmCtg3" id="searchMgzMstThmCtg3" value="" />
						<input type="hidden" name="CMN_COM_IDX" id="CMN_COM_IDX" value= "" />
						<input type="hidden" name="startCount"value="0">
						<input type="hidden" name="collection" value="thema">
						<dd>
							<label for="inp_search">
								<input type="text" id="inp_search" name="searchKeyword" placeholder="single plan의 모든 것!  키워드로 검색하세요" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
						</form>
					</dl>
				</div>
				<!-- .search E -->
			
				<!-- .sing_guide S -->
				<dl class="sing_guide">
					<dt class="minW dt_tab">
						<a href="javascript:void(0)" class="f on"><span>싱글독립 가이드 북</span></a>
						<a href="javascript:void(0)" class="l"><span>싱글독립 패키지</span></a>
					</dt>
					<dd class="guide_con">
						<strong>싱글슈머</strong>
						<p>싱글족 가운데서도 자신이 원하는 것은 과감히 구매하는 가치지향적인 소비자 '포미(For me)족'이 <br/>늘어나고 있는데, 이들이 주거 환경 투자에 관심을 갖고 있다는 것이 관련업계의 설명이다.</p>
					</dd>
					<dd class="slide_list">
						<i class="ico_pp">
							<i class="ex_img"></i>
						</i>
						
						<div class="list_d">
							<ol class="ct">		
								<c:forEach items="${guide2DepList}" var="grow" varStatus="gsta">
									<c:set var="imgNo" value="1" />
									<c:set var="imgNo2" value="" />
									<c:set var="imgType" value="g" />
									<c:choose>
										<c:when test="${gsta.first }">
											<c:set var="no" value="1" />
											<c:set var="imgType" value="g" />
										</c:when>
										<c:otherwise>
											<c:set var="no" value="0" />
											<c:set var="imgNo2" value="${gsta.index }" />
											<c:set var="imgType" value="j" />
										</c:otherwise>
									</c:choose>
									<li class="li_ti">
										<a href="javascript:void(0)" data-mgz_mst_thm_ctg2="<c:out value="${grow.CMN_COM_IDX }"/>"  id="2depth"><img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_<c:out value="${gsta.index }" />0.png" alt="<c:out value="${grow.CMN_COM_NM }"/>"  /></a>
									</li>
									<c:forEach items="${guide3DepList}" var="row" varStatus="sta">
									<c:if test="${grow.CMN_COM_IDX eq row.CMN_COM_UP_IDX }">
									<c:choose>
										<c:when test="${sta.count mod 2 == 1 }">
											<c:set var="listNum" value="1" />
										</c:when>
										<c:otherwise>
											<c:set var="listNum" value="2" />
										</c:otherwise>
									</c:choose>
									<li class="li_st_<c:out value="${listNum }" />">
										<a href="javascript:void(0)" data-mgz_mst_thm_ctg3="<c:out value="${row.CMN_COM_IDX }"/>"  data-mgz_mst_thm_ctg2="<c:out value="${grow.CMN_COM_IDX }" />" data-cmn_com_idx="<c:out value="${CMN_COM_IDX}" />" id="3depth">
											<c:if test="${imgType eq 'j' }" >
											<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_<c:out value="${gsta.index }" /><c:out value="${imgNo }" />.jpg" alt="" />
											<span class="tx_d" style="background:#fafafa url('<c:out value="${cdnDomain}" />/pc/img/theme/tx_sing_<c:out value="${imgNo2}${no}" />.jpg') center center no-repeat">
											</c:if>
											<c:if test="${imgType eq 'g' }" >
											<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_<c:out value="${gsta.index }" /><c:out value="${imgNo }" />.png" alt="" />
											<span class="tx_d" style="background:#fafafa url('<c:out value="${cdnDomain}" />/pc/img/theme/tx_sing_<c:out value="${imgNo2}${no}" />.gif') center center no-repeat">
											</c:if>
												<i class="ico_ar"></i>
												<span class="blind">
													<strong class="tx_num"><fmt:formatNumber var="num" minIntegerDigits="2" value="${no}" /></strong>
													<span class="tx_ti"><c:out value="${row.CMN_COM_NM }" /></span>
												</span>
											</span>
										</a>
									</li>
									<c:set var="imgNo" value="${imgNo + 1 }" />
									<c:set var="no" value="${no +1 }" />
									</c:if>
									</c:forEach>
								</c:forEach>
							</ol>
						</div>
						<!-- .list_d E -->
					</dd>
				</dl>
				<!-- .sing_guide E -->

				<!-- .sing_package S -->
				<dl class="sing_package">
					<dt class="dt_tab">
						<a href="javascript:void(0)" class="f"><span>싱글독립 가이드 북</span></a>
						<a href="javascript:void(0)" class="l on"><span>싱글독립 패키지</span></a>
					</dt>

					<dd class="dd_tab_con">
						<strong class="ti">“내 맘대로 선택하는 가격대별 패키지!”</strong>
						<p class="tx">요즘 트랜드를 반영한 싱글슈머의 '핫'한 패키지 보고 원하는 것만 고르자~!<br/>원한다고 바로 구매하면 손해! MD와 가격흥정 필수!</p>

						<div class="package_tab">
							<a href="javascript:void(0)" class="f">
								<i class="ov">
									<span class="img_tx">
										<strong class="blind">알뜰 수머</strong>
										<span class="blind">가성비가 높고 기능에<br/>충실한 아이템으로 독립!</span>
									</span>
									<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_tab1_on.png" alt="" class="img_off" />
								</i>
								<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_tab1_off.png" alt="" class="img_off" />
							</a>
							<a href="javascript:void(0)">
								<i class="ov">
									<span class="img_tx">
										<strong class="blind">실속 슈머</strong>
										<span class="blind">나만의 스타일을 확실히<br/>고수하는 아이템으로 독립!</span>
									</span>
									<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_tab2_on.png" alt="" class="img_off" />
								</i>
								<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_tab2_off.png" alt="" class="img_off" />
							</a>
							<a href="javascript:void(0)" class="l">
								<i class="ov">
									<span class="img_tx">
										<strong class="blind">트렌드 슈머</strong>
										<span class="blind">트렌디한 디자인과 기술력을<br/>겸비한 아이템으로 독립!</span>
									</span>
									<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_tab3_on.png" alt="" class="img_off" />
								</i>
								<img src="<c:out value="${cdnDomain}" />/pc/img/theme/img_sing_tab3_off.png" alt="" class="img_off" />
							</a>
						</div>
					</dd>
					
				</dl>
				<!--// .sing_package E -->
				
				<form method="post" name="frm" id="frm">
				<input type="hidden" name="tabIdx" id="tabIdx" value="0" />
				<input type="hidden" name="PRD_MST_CDs" id="PRD_MST_CDs" value="" />
				<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="0" />
				<input type="hidden" name="ESM_MST_TYPE" id="ESM_MST_TYPE" value="1817" />
				<div class="minW package_con tab_1">
					<i class="ico_ar"></i>
					<a href="javascript:void(0)" class="btn_close"><span class="ir">닫기</span></a>
					<div class="sec_ti">
						<h3><span class="blind">알뜰 슈머</span></h3>
					</div>
					
					<c:set var="classNm" value="" />
					<c:set var="totPrice" value="0" />
					<c:set var="realTotPrice" value="0" />
					<c:set var="prListNum" value="0" />
					<div class="pr_list" id="pr_list_0">
						<ol>
							<c:forEach items="${productList1 }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />"  >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O' && row.PRD_MST_SEL_CNT > 0}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" data-prd_mst_sel_cnt="<c:out value="${row.PRD_MST_SEL_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O' && row.PRD_MST_SEL_CNT > 0}">checked data-opt_idx="0"</c:if> ></label>
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
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 && row.PRD_MST_SEL_CNT > 0}">
										<span><a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a></span>
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
							<c:forEach items="${productList2 }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O' && row.PRD_MST_SEL_CNT > 0}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" data-prd_mst_sel_cnt="<c:out value="${row.PRD_MST_SEL_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O' && row.PRD_MST_SEL_CNT > 0}">checked data-opt_idx="0"</c:if> ></label>
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
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<span><a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a></span>
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
					
					<div class="pr_list" id="pr_list_2">
						<ol>
							<c:forEach items="${productList3 }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O' && row.PRD_MST_SEL_CNT > 0}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" data-prd_mst_sel_cnt="<c:out value="${row.PRD_MST_SEL_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O' && row.PRD_MST_SEL_CNT > 0}">checked data-opt_idx="0"</c:if> ></label>
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
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<span><a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a></span>
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
						<c:forEach items="${banner1 }" var="row" varStatus="sta">
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
						<c:forEach items="${banner2 }" var="row" varStatus="sta">
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
						<c:forEach items="${banner3 }" var="row" varStatus="sta">
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
								<span class="ti">싱글 패키지 금액</span>
								<strong class="money"><strong>0</strong><span class="tx_won">원</span></strong>
								
							</div>
							<div class="save">
								<strong>0</strong>
								<span>원을 절약 하셨습니다.</span>
							</div>
						</dd>
						<dd class="tip">
							<p>싱글킹은 고객님의 행복한 웨딩 준비를 함께 하기 위하여 MD에게 견적을 요청하시면<br/>더욱 알찬 혜택을 제공합니다.</p>
							<span class="ico_tip">견적서에서 원하시는 상품을 추가로 담아 견적을 신청하실 수도 있습니다. </span>

							<a href="javascript:void(0)" id="goEstimateBtn">
								<strong>MD에게 견적상담 요청하기</strong>
							</a>
						</dd>
					</dl>

				</div>
				<!-- .package E -->
				
			</section>
			<!-- .sing_d E -->
			
		


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

$(document).ready(function(){
	sing.guideBook();
	sing.packages();
	$('#inp_search').focus();
	
	$(document).on("click", ".ico_search", function(){
		if($("#inp_search").val == ""){
			alert("검색어를 입력하세요.");
			$('#inp_search').focus();
			return;
		}else{
			//sing.goSearch(1);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleSearch.do").submit();
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
		sing.goSearch(cPage);
    };
    
    goView = function(idx){
    	$("#MGZ_MST_IDX").val(idx);
    	$("#gfrm").attr("action", "/pc/themecategory/singleConView.do").submit();
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
		$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleConList.do");
		$("#sFrm").submit();
	});
    
    $(document).on("click", "#2depth", function(){
    	var mgz_mst_thm_ctg2 = $(this).data("mgz_mst_thm_ctg2");
    	var cmn_com_idx = $(this).data("cmn_com_idx");
    	
    	$("#cPage").val(1);
    	$("#inp_search").val("");
    	$("#CMN_COM_IDX").val(cmn_com_idx);
    	$("#searchMgzMstThmCtg2").val(mgz_mst_thm_ctg2);
		$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleConList.do");
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
		sing.pr_ck2('#pr_list_'+tabIdx+' label');
		theme.pkg_list_h();
	});
	
});

var sing = (function(){
	return{
		//상단 동영상
		search: function(){
		},//search: function(){
		goSearch : function(cPage){
			//console.log("start");
			$("#cPage").val(cPage);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleConList.do").submit();
		},
		//가이드북
		guideBook : function(){
			var guideBook = $('.sing_guide .slide_list .list_d'),
				_ol = guideBook.find('ol'),
				_li = _ol.find('li'),
				_al_w = 0,//li 전체 넓이
				_scroll = 0,//현제 이동한 거리
				_mv_ck = false;//영역안에 올라왔는지
	
			$.each(_li, function(i){
				$(this).addClass('li_'+i);
				_al_w += $(this).outerWidth(true);
			});
			guideBook.on({
				mouseenter: function(){
					_mv_ck = true;
				}, 
				mouseleave: function(){
					_mv_ck = false;
				}
			}).find('ol').css({width:_al_w}).find('li:not(.li_ti)').on({
				mouseenter: function(){
					$(this).find('a > img').stop(true, true).animate({width:'100%', margin: 0}, 200);
				}, 
				mouseleave: function(){
					$(this).find('a > img').stop(true, true).animate({width:'110%', margin: '-5% 0 0 -5%'}, 200, function(){
						$(this).removeAttr('style');
					});
				}
			});

			$(window).on('mousewheel', function(e){
				if(_mv_ck && win_w < _al_w){
					
					var _wheel = e.originalEvent.wheelDelta;//휠 이동거리
						_ud = (_wheel > 0) ? true : false,//방향 true = 위 / false = 아래						
						_css = {};//적용할 css

					_scroll += _wheel;

					if(_scroll > 0) _scroll = 0;
					else if(_scroll < (win_w - _al_w)) _scroll = (win_w - _al_w)-50;//50은 우측 여백 값
					else ;e.preventDefault(); //e.preventDefault() 앞 세미콜론은 영역에 마우스 오버됐을때 위,아래 스크롤 안되도록 하기 위함 
					if(ie != 7 && ie != 8 && ie != 9) _css = {transform:'translateZ(0) translateX('+ _scroll+'px)'};
					else _css = {marginLeft:_scroll};
					_ol.css(_css);

					if(_scroll != 0) $('.sing_d .sing_guide .slide_list .ico_pp .ex_img').fadeOut();
					else $('.sing_d .sing_guide .slide_list .ico_pp .ex_img').fadeIn();
				}				
			});
	
			$(window).resize(function(){
				_ol.css({transform:'translateZ(0) translateX(0px)', marginLeft: 0});
			});
			
		},//guideBook = function(){
		pr_ck: function(_label){
			var all_pr = 0,
				pk_pr = 0,
				_pr_d = $('.sing_d .package_con .total_price .prc')
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
				_pr_d = $('.sing_d .package_con .total_price .prc')
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
			var _tab = $('.package_tab a'),
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
						var prd_mst_sel_cnt =_this.children('input').data("prd_mst_sel_cnt");
						
						if(prd_mst_sel_cnt <= 0){
							alert('재고가 없습니다.');
							return;
						}
						
						if(sell_state == "O"){
							alert("품절 상품입니다.");
							return false;
						}
						
						if(opt_est_cnt > 0){
							alert("필수 옵션 상풉입니다.");
							return false;
						}
						if(_this.hasClass('on')) _this.removeClass('on').children('input').attr('checked', false);
						else _this.addClass('on').children('input').attr('checked', true);
						
						var tabIdx	= $("#tabIdx").val();
						sing.pr_ck2('#pr_list_'+$.pkg_tab_idx+' label');
						return false;
					});
					
					//sing.pr_ck(_label);
				};//_recks = function(){
			
			$.each(_tab, function(i){
				$(this).addClass('li_'+i);
			});
			_tab.on('click', function(){
				var _this = $(this),
					_idx = _this.index(),
					_h3 = _tabCon.find('.sec_ti h3'),
					_h3_tx = ['<strong>알뜰슈머</strong><span>가성비가 높고 기능에 충실한 이이템으로 독립!</span>',
							  '<strong>실속슈머</strong><span>나만의 스타일을 확실히 고수하는 아이템으로 독립!</span>',
							  '<strong>트렌드슈머</strong><span>트렌디한 디자인과 기술력을 겸비한 아이템으로 독립!</span>'],
					_class = ['ti_1','ti_2','ti_3'];
				
				if(_tabCon.css('display') != 'block') _tabCon.show();
				$.pkg_tab_idx = _idx;
				//pr_list 열자
				_tabCon.find('.pr_list').eq(_idx).show().siblings('.pr_list').hide();
				sing.pkg_list_h();
				$("#tabIdx").val(_idx);
				
				if(!_this.hasClass('on')){
					_this.addClass('on').siblings('.on').removeClass('on').find('.img_tx').animate({top:'-30%'}, 200, function(){
						$(this).removeAttr('style').parent('.ov').animate({opacity:'0'}, 200, function(){
							$(this).removeAttr('style');
						});
					});
					
					_this.children('.ov').animate({opacity:'1'}, 200, function(){
						$(this).children('.img_tx').css('top','-30%').animate({top:'50%'}, 200);
					});
				}
				
				_tabCon.removeAttr('class').addClass('minW package_con tab_'+(_idx+1));
				_h3.removeAttr('class').addClass(_class[_idx]).children().html(_h3_tx[_idx]);
				
				var tabIdx	= $("#tabIdx").val();
				sing.pr_ck2('#pr_list_'+$.pkg_tab_idx+' label');
				_recks(_tabCon);
				//$.pkg_price_ck();
			});
			_tab.first().trigger('click');

			_tabCon.find('.btn_close').on('click', function(){
				_tabCon.hide();
				
				
				_tab.removeClass('on').find('.img_tx').animate({top:'-30%'}, 200, function(){
					$(this).removeAttr('style').parent('.ov').animate({opacity:'0'}, 200, function(){
						$(this).removeAttr('style');
					});
				});
			});

			//가이드북,패키지 탭
			$('.sing_guide, .sing_package').find('.dt_tab a').on('click', function(){
				var _this = $(this),
					_idx = _this.index();
				 $('html,body').animate({
					scrollTop: _idx == 0 ? $('.sing_guide').offset().top : $('.sing_package').offset().top
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
	
</script>

