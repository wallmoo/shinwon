<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-outlet"><!-- page class : page-outlet -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

		<div class="container container-a"><!-- container -->

			<div class="outer-wrap outer-wrap-a"><!-- outer-wrap -->
				<div class="wrap">
					<div class="breadcrumbs">
						<div class="breadcrumbs">
	                        <a href="<c:out value="${frontDomain}" />/pc/main/index.do" class="home"></a>
	                        <span><a href="#"><img src="<c:out value="${cdnDomain}" />/pc/img/common/breadcrumb_gt.png">OUTLET</a></span>
	                    </div>
                    </div>
				</div>
			
				<%-- <div class="grid-fix wrap">
				<c:choose>
				<c:when test="${not empty listOUTLET_B_A}">
				<c:set var="listNum" value="1" />
				<c:forEach var="item" items="${listOUTLET_B_A }" varStatus="status"> 
					<div class="col-1-3 <c:if test="${fn:length(listOUTLET_B_A) eq listNum }">last</c:if>">
						<div class="modlue">
						<c:if test="${not empty item.BNR_DTL_TARGET }" >
							<a href="${item.BNR_DTL_URL }" <c:if test="${item.BNR_DTL_TARGET eq 'N'}" >target="_blank" </c:if>><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" /></a>
						</c:if>
						<c:if test="${ empty item.BNR_DTL_TARGET}" >
							<img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" />
						</c:if>
						</div>
					</div>
				<c:set var="listNum" value="${listNum+1}" />
				</c:forEach>
				</c:when>
				</c:choose>
				</div> --%>
				
				<div id="slideEventTop" class="wrap"><!-- #slideEventTop -->
					<div class="swiper-container">
						<a href="javascript:;" class="swiper-nav prev"><span><em>이전 페이지</em></span></a>
						<div class="swiper-wrapper clearfix">
							<div class="swiper-slide"><a href="?productBrand=B"><img src="${cdnDomain}/pc/img/custom/brand_01.png" alt="BICLO"></a></div>
							<div class="swiper-slide"><a href="?productBrand=M"><img src="${cdnDomain}/pc/img/custom/brand_02.png" alt="mont-bell"></a></div>
							<div class="swiper-slide"><a href="?productBrand=S"><img src="${cdnDomain}/pc/img/custom/brand_03.png" alt="Skechers"></a></div>
							<div class="swiper-slide"><a href="?productBrand=P"><img src="${cdnDomain}/pc/img/custom/brand_04.png" alt="Prospecs"></a></div>
							<div class="swiper-slide"><a href="?productBrand=J"><img src="${cdnDomain}/pc/img/custom/brand_05.png" alt="Jack Wolfskin"></a></div>
							<div class="swiper-slide"><a href="?productBrand=B"><img src="${cdnDomain}/pc/img/custom/brand_01.png" alt="BICLO"></a></div>
							<div class="swiper-slide"><a href="?productBrand=M"><img src="${cdnDomain}/pc/img/custom/brand_02.png" alt="mont-bell"></a></div>
							<div class="swiper-slide"><a href="?productBrand=S"><img src="${cdnDomain}/pc/img/custom/brand_03.png" alt="Skechers"></a></div>
							<div class="swiper-slide"><a href="?productBrand=P"><img src="${cdnDomain}/pc/img/custom/brand_04.png" alt="Prospecs"></a></div>
							<div class="swiper-slide"><a href="?productBrand=J"><img src="${cdnDomain}/pc/img/custom/brand_05.png" alt="Jack Wolfskin"></a></div>
						</div>
						<a href="javascript:;" class="swiper-nav next"><span><em>다음 페이지</em></span></a>
					</div>
				</div><!-- // #slideEventTop  -->
			</div><!-- // outer-wrap-a -->
		</div>
		
		<c:choose>
		<c:when test="${not empty list_OUTLET_TOP || not empty list_OUTLET_NEW || not empty list_OUTLET_MD }">
		<!-- <div class="container container-b">container -->
			<div class="outer-wrap outer-wrap-b"><!-- outer-wrap -->
				<div id="slideTopSeller" class="wrap wrap-a"><!-- wrap -->
				<div class="cell-a"><!-- cell-a -->
					<div class="tab-list-front js-tab-front"><!-- tab-list-front -->
                        <ul class="tab">
                       		<li class="active"><a href="#slideListFrontB3" data-slide-wrapper="#slideListFrontB"><span>TOP SELLER</span></a></li>
                            <li><a href="#slideListFrontB1" data-slide-wrapper="#slideListFrontB"><span>FOCUS ITEM</span></a></li>
                            <li><a href="#slideListFrontB2" data-slide-wrapper="#slideListFrontB"><span>Q CHOICE</span></a></li>
                        </ul>
                    </div>
                    <div id="slideListFrontB" class="toggle-wrap"><!-- toggle-wrap -->
                    
                    	<div id="slideListFrontB3" class="list-front horizontal hide"><!-- list-front -->
                            <a href="javascript:;" class="swiper-nav prev"><span><em>이전 페이지</em></span></a>
                            <a href="javascript:;" class="swiper-nav next"><span><em>다음 페이지</em></span></a>

                            <div class="swiper-container">
                                <div class="swiper-wrapper" data-items="5"><!--  swiper-wrapper -->
                                <c:choose>
								<c:when test="${not empty list_OUTLET_TOP}">
								<c:forEach var="item" items="${list_OUTLET_TOP }" varStatus="status"> 
                                    <div class="swiper-slide">
                                        <div class="holder">
                                            <p class="thumb">
	                                            <c:choose>
													<c:when test="${item.ICON_BEST eq 'Y' }">
														<span class="sticker best"><span class="icon"><em>BEST</em></span></span>		
													</c:when>
													<c:when test="${item.ICON_BEST ne 'Y' && item.ICON_NEW eq 'Y'}">
														<span class="sticker new"><span class="icon"><em>NEW</em></span></span>
													</c:when>
												</c:choose>
	                                            <a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="<c:out value="${cdnDomain }${item.PRD_IMAGE }" />" alt="<c:out value="${item.PRD_MST_NM }" />" /></a>
                                            </p>
                                            <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                            <p class="name"><a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><ui:shortTitle title="${item.PRD_MST_NM }" /></a></p>
                                            <p class="price">
											<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
												<span class="price"><fmt:formatNumber value="${item.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" /></span></c:if>
												<span class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></span>
												<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
												<c:if test="${ item.PROD_PERAMT1 eq 0 }" >
													<span class="percent kor">(균일)</span>
					                            </c:if>   
					                            <c:if test="${ item.PROD_PERAMT1 > 0 }" >
					                            	<span class="percent">(${item.PROD_PERAMT1 }%<em>↓</em>)</span>
                                                </c:if>
                                            	</c:if>
                                            	
											</p>
                                        </div>
                                    </div>
                                </c:forEach>
                                </c:when>
                                </c:choose> 
                                </div><!-- // swiper-wrapper -->
                            </div>
                        </div><!-- // list-front -->

                        <div id="slideListFrontB1" class="list-front horizontal"><!-- list-front -->

                            <a href="javascript:;" class="swiper-nav prev"><span><em>이전 페이지</em></span></a>
                            <a href="javascript:;" class="swiper-nav next"><span><em>다음 페이지</em></span></a>

                            <div class="swiper-container">
                                <div class="swiper-wrapper" data-items="5"><!--  swiper-wrapper -->
                                <c:choose>
								<c:when test="${not empty list_OUTLET_NEW}">
								<c:forEach var="item" items="${list_OUTLET_NEW }" varStatus="status"> 
                                    <div class="swiper-slide">
                                        <div class="holder">
                                            <p class="thumb">
                                            	<c:choose>
													<c:when test="${item.ICON_BEST eq 'Y' }">
														<span class="sticker best"><span class="icon"><em>BEST</em></span></span>		
													</c:when>
													<c:when test="${item.ICON_BEST ne 'Y' && item.ICON_NEW eq 'Y'}">
														<span class="sticker new"><span class="icon"><em>NEW</em></span></span>
													</c:when>
												</c:choose>	
                                                <a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="<c:out value="${cdnDomain }${item.PRD_IMAGE }" />" alt="<c:out value="${item.PRD_MST_NM }" />" /></a>
                                            </p>
                                            <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                            <p class="name"><a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><ui:shortTitle title="${item.PRD_MST_NM }" /></a></p>
                                            <p class="price">
											<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
												<span class="price"><fmt:formatNumber value="${item.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" /></span></c:if>
												<span class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></span>
												<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
													<c:if test="${ item.PROD_PERAMT1 eq 0 }" >
														<span class="percent kor">(균일)</span>
						                            </c:if>   
						                            <c:if test="${ item.PROD_PERAMT1 > 0 }" >
						                            	<span class="percent">(${item.PROD_PERAMT1 }%<em>↓</em>)</span>
	                                                </c:if>
	                                            </c:if>
											</p>
                                        </div>
                                    </div>
                                </c:forEach>
                                </c:when>
                                </c:choose>                                   
                                </div><!-- // swiper-wrapper -->
                            </div>
                        </div><!-- // list-front -->

                        <div id="slideListFrontB2" class="list-front horizontal hide"><!-- list-front -->
                            <a href="javascript:;" class="swiper-nav prev"><span><em>이전 페이지</em></span></a>
                            <a href="javascript:;" class="swiper-nav next"><span><em>다음 페이지</em></span></a>

                            <div class="swiper-container">
                                <div class="swiper-wrapper" data-items="5"><!--  swiper-wrapper -->
								<c:choose>
								<c:when test="${not empty list_OUTLET_MD}">
								<c:forEach var="item" items="${list_OUTLET_MD }" varStatus="status"> 
                                    <div class="swiper-slide">
                                        <div class="holder">
                                            <p class="thumb">
                                            <c:choose>
												<c:when test="${item.ICON_BEST eq 'Y' }">
													<span class="sticker best"><span class="icon"><em>BEST</em></span></span>		
												</c:when>
												<c:when test="${item.ICON_BEST ne 'Y' && item.ICON_NEW eq 'Y'}">
													<span class="sticker new"><span class="icon"><em>NEW</em></span></span>
												</c:when>
											</c:choose>
                                                <a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="<c:out value="${cdnDomain }${item.PRD_IMAGE }" />" alt="<c:out value="${item.PRD_MST_NM }" />" /></a>
                                            </p>
                                            <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                            <p class="name"><a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><ui:shortTitle title="${item.PRD_MST_NM }" /></a></p>
                                            <p class="price">
											<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
												<span class="price"><fmt:formatNumber value="${item.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" /></span></c:if>
												<span class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></span>
												<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
												<c:if test="${ item.PROD_PERAMT1 eq 0 }" >
													<span class="percent kor">(균일)</span>
					                            </c:if>   
					                            <c:if test="${ item.PROD_PERAMT1 > 0 }" >
					                            	<span class="percent">(${item.PROD_PERAMT1 }%<em>↓</em>)</span>
                                                </c:if>
                                            	</c:if>
											</p>
                                        </div>
                                    </div>
                                </c:forEach>
                                </c:when>
                                </c:choose>
                                </div><!-- // swiper-wrapper -->
                            </div>
                        </div><!-- // list-front -->

                    </div><!-- // toggle-wrap -->
                   
                  </div><!-- // cell-a -->  
                    
                </div><!-- // wrap -->
			</div><!-- // outer-wrap -->
		<!-- </div>// container -->
		</c:when>
		</c:choose>
		
		<div class="container container-c"><!-- container -->
                	<a id="product_list"></a>
                	
            <div class="outer-wrap"><!-- outer-wrap -->

                <div class="wrap"><!-- wrap -->
                
                
                	<form id="frm" name="frm">
			    	<input type="hidden" id="idx" name="idx" value="<c:out value="${commandMap.idx }"/>" />
			        <input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			        <input type="hidden" id="pSort" name="pSort" value="<c:out value="${commandMap.pSort }"/>"/>
			        <input type="hidden" name="productBrand" value="<c:out value="${commandMap.productBrand }"/>"/>

                    <div class="grid-fix gutter list-combobox"><!-- grid fix -->
                        <div class="col-1-4">
                            <div class="module">
                                <select id="productCategory1" class="block large js-select" data-callback="filterCategory" title="1차 카테고리" >
                                    <c:choose>
				    				<c:when test="${not empty listMenuCategory['1']}">
				    				<c:forEach var="item" items="${listMenuCategory['1'] }" varStatus="status">     
                                    <option value="${item.PRD_CTG_IDX }" <c:if test="${commandMap.productCategory1 eq item.PRD_CTG_IDX}" >selected </c:if>>${item.PRD_CTG_NM }</option>
                                    </c:forEach>
                                    </c:when>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                        <div class="col-1-4">
                            <div class="module">
                                <select id="productCategory2" class="block large js-select" data-callback="filterCategory" title="2차 카테고리" >
                                    <c:choose>
				    				<c:when test="${not empty listMenuCategory['2']}">
				    				<c:if test="${ empty commandMap.productCategory2 }" >
				    				<option value="">전체</option>
				    				</c:if>
				    				<c:forEach var="item" items="${listMenuCategory['2'] }" varStatus="status">     
                                    <option value="${item.PRD_CTG_IDX }" <c:if test="${commandMap.productCategory2 eq item.PRD_CTG_IDX}" >selected </c:if>>${item.PRD_CTG_NM }</option>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    	<option value="">상위카테고리를 먼저 선택하세요.</option>                                    
                                    </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                        <div class="col-1-4">
                            <div class="module">
                                <select id="productCategory3" class="block large js-select" data-callback="filterCategory" title="3차카테고리">
                                    <c:choose>
				    				<c:when test="${not empty listMenuCategory['3']}">
				    				<c:if test="${ empty commandMap.productCategory3 }" >
				    				<option value="">전체</option>
				    				</c:if>
				    				<c:forEach var="item" items="${listMenuCategory['3'] }" varStatus="status">     
                                    <option value="${item.PRD_CTG_IDX }" <c:if test="${commandMap.productCategory3 eq item.PRD_CTG_IDX}" >selected </c:if>>${item.PRD_CTG_NM }</option>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    	<option value="">상위카테고리를 먼저 선택하세요.</option>                                    
                                    </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div> 
                        <div class="col-1-4">
                            <div class="module">
                                <select name="productPrice" class="block large js-select" title="가격대">
									<option value="">전체 상품 가격대별 정렬</option>
									<option value="0|100000" <c:if test="${commandMap.productPrice eq '0|100000'}" >selected </c:if>>10만원 미만</option>
									<option value="100000|200000" <c:if test="${commandMap.productPrice eq '100000|200000'}" >selected </c:if>>10만원 이상 20만원 미만</option>
									<option value="200000|300000" <c:if test="${commandMap.productPrice eq '200000|300000'}" >selected </c:if>>20만원 이상 30만원 미만</option>
									<option value="300000|400000" <c:if test="${commandMap.productPrice eq '300000|400000'}" >selected </c:if>>30만원 이상 40만원 미만</option>
									<option value="400000|500000" <c:if test="${commandMap.productPrice eq '400000|500000'}" >selected </c:if>>40만원 이상 50만원 미만</option>
									<option value="500000|1000000" <c:if test="${commandMap.productPrice eq '500000|1000000'}" >selected </c:if>>50만원 이상 100만원 미만</option>
									<option value="1000000|" <c:if test="${commandMap.productPrice eq '1000000|'}" >selected </c:if>>100만원 이상</option>
								</select>
                            </div>
                        </div>
                    </div><!-- grid fix -->

                    <div class="list-status"><!-- list status -->
                    
                        총
                        <strong>${paging.totalRecordCount }개</strong>
                        상품
                    </div><!-- // list status -->

                    <div class="grid-fix list-sort"><!-- list sort -->
                        <div class="col-1-2">
                            <div class="module">
                                <ul class="tab">
                                    <li<c:if test="${ empty commandMap.pSort || commandMap.pSort eq '1'}" > class="active"</c:if>><a href="javascript:goPageSort('1')"><span>판매인기순</span></a></li>
                                    <%-- <li<c:if test="${commandMap.pSort eq '2'}" > class="active"</c:if>><a href="javascript:goPageSort('2')"><span>신상품순</span></a></li> --%>
                                    <li<c:if test="${commandMap.pSort eq '5'}" > class="active"</c:if>><a href="javascript:goPageSort('5')"><span>추천(평점)순</span></a></li>
                                    <li<c:if test="${commandMap.pSort eq '3'}" > class="active"</c:if>><a href="javascript:goPageSort('3')"><span>높은가격순</span></a></li>
                                    <li<c:if test="${commandMap.pSort eq '4'}" > class="active"</c:if>><a href="javascript:goPageSort('4')"><span>낮은가격순</span></a></li>
                                    <li<c:if test="${commandMap.pSort eq '6'}" > class="active"</c:if>><a href="javascript:goPageSort('6')"><span>할인율높은순</span></a></li>
                                    <li<c:if test="${commandMap.pSort eq '7'}" > class="active"</c:if>><a href="javascript:goPageSort('7')"><span>상품코드순</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-1-2">
                            <div class="module combobox">
                            	<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="front" jsFunction="goPage"/>
                            </div>
                        </div>
                    </div><!-- // list sort -->


                    <div class="grid-fix list-product"><!-- list product -->
					<c:choose>
				    <c:when test="${not empty listOutlet}">
				    <c:forEach var="item" items="${listOutlet }" varStatus="status">                      
                        <div class="col-1-5"><!-- cell -->
                            <div class="module">
                            	<c:choose>
									<c:when test="${item.ICON_BEST eq 'Y' }">
										<span class="sticker best"><span class="icon"><em>BEST</em></span></span>		
									</c:when>
									<c:when test="${item.ICON_BEST ne 'Y' && item.ICON_NEW eq 'Y'}">
										<span class="sticker new"><span class="icon"><em>NEW</em></span></span>
									</c:when>
								</c:choose>
                                <div class="thumb">
                                    <a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="${cdnDomain }${item.PRD_IMAGE }" alt="${item.PRD_MST_NM }" /></a>
                                </div>
                                <p class="brand"><b><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></b><c:if test="${item.PRD_POINT_YN eq 'Y'}" ><span class="save">적립</span></c:if><c:if test="${item.PRD_COUPON_YN eq 'Y'}" ><span class="coupon">쿠폰</span></c:if></p>
                                <p class="name">
                                    <a href="/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><ui:shortTitle title="${item.PRD_MST_NM }" /></a>
                                </p>
                                <p class="price">
								<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
									<span class="price"><fmt:formatNumber value="${item.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" /></span></c:if>
									<span class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></span>
									<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
									<c:if test="${ item.PROD_PERAMT1 eq 0 }" >
										<span class="percent kor">(균일)</span>
					                </c:if>   
					                <c:if test="${ item.PROD_PERAMT1 > 0 }" >
					                	<span class="percent">(${item.PROD_PERAMT1 }%<em>↓</em>)</span>
                                    </c:if>
                                    </c:if>
                                    
								</p>
                            </div>
                            <div class="action">
                                <div class="pull-left">
                                    <a href="javascript:;" class="facebook" data-prd_cd="${item.PRD_MST_CD}" data-prd_nm="${item.PRD_MST_NM }" data-prd_brand="<ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/>" data-prd_img="${cdnDomain }${item.PRD_IMAGE }" data-id="0001"><span class="icon facebook"><em>페이스북으로 공유하기</em></span></a>
                                    <a href="javascript:;" class="twitter2" data-prd_cd="${item.PRD_MST_CD}" data-prd_nm="${item.PRD_MST_NM }" data-prd_brand="<ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/>" data-id="0001"><span class="icon twitter"><em>트위터로 공유하기</em></span></a>
                                </div>
                                <div class="pull-right">
									<a href="javascript:;" class="size" data-prdMstCd="${item.PRD_MST_CD}"><span class="icon size" title="SIZE"><em>SIZE</em></span></a>
									<div class="size-list">
									</div>
								</div>
                            </div>
                        </div><!-- // cell -->
					</c:forEach>
					</c:when>
					<c:otherwise>
					<div class="error-description border-bottom">
                        <p class="error-head">조회된 상품이 없습니다.</p>
                    </div>					
					</c:otherwise>
					</c:choose>
                    </div><!-- // list product -->

                    <div class="section-pagination"><!-- section pagination -->
					    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                    </div><!-- // section pagination -->
                    </form>
                    
                </div><!-- // wrap -->

            </div><!-- // outer-wrap -->

            <div class="bottom-spacer" aria-hidden="true"></div><!-- bottom spacer : container 닫는 태그 상단에 위치 -->
        </div><!-- // container -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
$(document).ready(function () {
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/outlet/outlet.do#product_list", "target":"_self", "method":"get"}).submit();
	};

	goPageSort = function (pSort) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='pSort']").val(pSort);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/outlet/outlet.do#product_list", "target":"_self", "method":"get"}).submit();
	};
	

	$("a.size").hover(
		function(){
			
		    var url = "<c:out value="${frontDomain}"/>/pc/product/productSize.do";
		    var data = new Object();
			data.prdCd = $(this).attr('data-prdCd');
		    $obj = $(this).parent().find("div.size-list");
		    $obj.empty();
			$obj.load(url, data, function () {    });
			
		}, 
		function(){			
		} );
});

/**
 * 전시상품 사이즈보기
 */
function viewSize( aObj, prdCd){

    var url = "<c:out value="${frontDomain}"/>/pc/brand/productSize.do";
    var data = new Object();
    data.prdCd = prdCd;
    $(aObj).after("<div id='size' class='size'>&nbsp;</div>");
	$(aObj).load(url, data, function () {    });
}

//<![CDATA[
// 리스트 카테고리 선택시 동작하는 함수

var filterCategory = function(param) {
	
	var $frm = $("#frm");
	$frm.find("input[id='cPage']").val('1');
	
	if (param.value =="10")
		param.value = "24";
	if (param.value != "")
		$frm.find("input[id='idx']").val(param.value);
	$frm.find("select[name=productPrice]").val("");
	
	switch($("#productCategory1  option:selected").val()){
		case "10" :
			$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/brand/brand.do#product_list", "target":"_self", "method":"get"}).submit();
			break;
		case "9":
			$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/outlet/outlet.do#product_list", "target":"_self", "method":"get"}).submit();
			break;
		default :
			$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do#product_list", "target":"_self", "method":"get"}).submit();
	}
};

$(document).on("change", "select[name=productPrice]", function (){
	var $frm = $("#frm");
	$frm.find("input[id='cPage']").val('1');
	$frm.attr({"action":"#product_list", "target":"_self", "method":"get"}).submit();
});
	    


// 리스트 아이템 조회 개수 선택시 동작하는 함수
var filterItems = function(param) {
	var $frm = $("#frm");
   	$frm.find("input[id='cPage']").val('1');	
	$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/outlet/outlet.do#product_list", "target":"_self", "method":"get"}).submit();
};

// sns share
var snsShare = function(param) {
    alert('snsShare(param) - service:' + param.service + ' / id:' + param.id);
};

//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>