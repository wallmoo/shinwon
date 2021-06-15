<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<title>쑈윈도 |대카테고리</title>
<!-- Content -->
    <div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">  
                <h2 class="pg_tit">${CMN_COM_NM}</h2>
            </div>
            <!--// Title -->

            <div class="sub_content product">

                <!-- 여성 대카테고리(상단) -->
                <div class="top_banner">
                    <ul>
 						<c:forEach var="bannerList" items="${topBannerList }" varStatus="i">
 							<c:set var="href_var" value="javascript:void(0);"></c:set>
 							<c:if test="${bannerList.BNR_MST_TGT_TARGET ne 'none' }">
 								<c:set var="href_var" value="${bannerList.BNR_MST_URL }"></c:set>
 							</c:if>
		                	<li>
		                		<a href="${href_var }" <c:if test="${bannerList.BNR_MST_TGT_TARGET ne 'none' }">target="${bannerList.BNR_MST_TGT_TARGET }"</c:if>>
		                			<img src="${cdnDomain}${bannerList.CMM_FLE_ATT_PATH}${bannerList.CMM_FLE_SYS_NM }" alt="${bannerList.CMN_FLE_ALT_TXT }">
	                			</a>
		                    </li> 
	                    </c:forEach>
                    </ul>
                </div>
                `
                <div class="product_category">
                    <ul>
 						<c:forEach var="menuList" items="${categoryList }" varStatus="status">
		                	<li>
		                		<a href="${menuList.BNR_MST_URL}" target="${menuList.BNR_MST_TGT_TARGET }">
                                    <em style="background-image:url(${cdnDomain}${menuList.CMM_FLE_ATT_PATH}${menuList.CMM_FLE_SYS_NM });"></em>
                                    <span>${menuList.BNR_MST_TITLE}</span>
                                </a>
		                	</li>
	                    </c:forEach>
                    </ul>
                </div>
                
                <div class="event_video_banner">
                    <div class="inner">
                        <div class="event_video">
                            <div id="player" class="js-player"  data-plyr-provider="${movieType}"  data-plyr-embed-id="${movie.BNR_MST_URL }"></div>
                            <!-- <div id="player" class="js-player" data-plyr-provider="vimeo" data-plyr-embed-id="76979871"></div> -->
                        </div>
                              
							                        
                        <div class="event_banner">
                            <!-- SWIPER -->
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
			 						<c:forEach var="eventlist" items="${bannerList }" varStatus="status">
					                	<div class="swiper-slide">
					                		<a href="${eventlist.BNR_MST_URL }" role="button" target="${eventlist.BNR_MST_TGT_TARGET }">
					                			<img src="${cdnDomain}${eventlist.CMM_FLE_ATT_PATH}${eventlist.CMM_FLE_SYS_NM }" alt="${eventlist.CMN_FLE_ALT_TXT }" />
					                		</a>
					                	</div>
				                    </c:forEach>
                                </div>
                                <div class="swiper-controller">
                                    <!-- Add Arrows -->
                                    <div class="swiper-button">
                                        <div class="swiper-button-prev"></div>
                                        <div class="swiper-button-next"></div>
                                    </div>
                                    <!-- Add Pagination -->
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
                            <!-- //SWIPER -->
                        </div>
                    </div>
                    <!--//여성 대카테고리(상단) -->
                </div>
         
                <!-- 여성 대카테고리(중단) -->
                <div class="category_tab">
                    <div class="product">
                        <div class="tit-area">
                            <h3 class="tits2">TOP SELLER</h3>
                        </div>
                        <div class="txtab_wrap">
                            <ul class="txtab">
			 					<c:forEach var="topseller" items="${tabList}" varStatus="status">
			 						<c:if test="${topseller.DSP_TAB_TYP eq 'T' }">
			 							<li><a href="#topseller_${topseller.DSP_TAB_IDX }">${topseller.DSP_TAB_NM }</a></li>
			 						</c:if>
					                
				                </c:forEach>
                            </ul>
                            
		 					<c:forEach var="topseller" items="${tabList }" varStatus="status">
		 						<c:if test="${topseller.DSP_TAB_TYP eq 'T' }">
	                  			<div class="tab_cont" id="topseller_${topseller.DSP_TAB_IDX }">
	                                <!-- .new_goods_wrap -->
	                                <div class="new_goods_wrap new_item_wrap">
	                                    <ul class="new_goods_list new_item_list clearboth">
	                                    	<c:forEach var="topselleritem" items="${catProductList }" varStatus="status">
	                                    		<c:if test="${topselleritem.DSP_TAB_IDX eq  topseller.DSP_TAB_IDX}">
	                                    		
		                                        <li>
		                                        	<c:if test="${topselleritem.PRD_MST_LIVE_ON_YN eq 'Y' }">
		                                        		<span class="flag_video">video</span>
		                                        	</c:if>
		                                            
		                                            <a href="/pc/product/productView.do?PRD_MST_CD=${topselleritem.PRD_MST_CD}" target="_blank">
		                                                <div class="img_thum_wrap">
		                                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${topselleritem.PRD_IMAGE});"></div>
		                                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${topselleritem.PRD_ROLL_OVER_IMG});"></div>
		                                                    <ul class="color_list">
		                                                    	<c:forEach var="topselleritemcolors" items="${topselleritem.CNT_PRD_COLOR }" varStatus="status">
		                                                    		<li><span style="background:${topselleritemcolors.CNT_PRD_COLOR };">${topselleritemcolors.CMN_COM_NM }</span></li>
		                                                    	</c:forEach>
		                                                    </ul>
		                                                </div>
		                                                <div class="sort_tag_area clearboth">
		                                                    <span class="sort">${topselleritem.BND_MST_BRAND_NM }</span>
		                                                    <span class="tag">${topselleritem.TAG_MST_TITLE }</span>
		                                                </div>
		                                                <p class="goods_title">${topselleritem.PRD_MST_NM }</p>
		                                                 <div class="goods_cost_info">
		                                                    <span class="dc_before_cost">
		                                                    	<fmt:formatNumber value="${topselleritem.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" />
		                                                    </span>
		                                                    <strong class="clearboth">
		                                                        <span class="goods_cost">
		                                                        	<fmt:formatNumber value="${topselleritem.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" />
		                                                        </span>
		                                                        <em class="dc_percent"><fmt:formatNumber value="${topselleritem.DISCOUNT_RATE }" type="percent" groupingUsed="false" /></em>
		                                                    </strong>
		                                                </div>
                  
		                                            </a>
		                                            <div class="btn_like_area">
		                                                <button type="button" class="btn-like ${topselleritem.MY_LIKE eq 'Y' ? 'on' : ''}" title="좋아요"
		                                                	onclick="likeBtnEvent($(this), '${topselleritem.PRD_MST_CD}', 'TYPE_PRODUCT')"><span>${topselleritem.LIKE_COUNTS }</span></button>
		                                            </div>
		                                        </li>
	                                    		
	                                    		</c:if>

	                                    	</c:forEach>
	                                    </ul>
	                                </div>
	                            </div>
	                            </c:if>
			                </c:forEach>
                        </div>
                    </div>
                    <div class="keyword">
                        <div class="tit-area">
                            <h3 class="tits2">TREND KEYWORD</h3>
                            <ol>
			 					<c:forEach var="trends" items="${rankCategory }" varStatus="status">
					                <li><p class="kbx"><span class="num">${status.index + 1 }.</span><a href="/pc/product/productList.do?idx=${trends.PRD_CTG_IDX }">${trends.PRD_CTG_NM }</a></p></li>
				                </c:forEach>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="category_tab">
                    <div class="product">
                        <div class="tit-area">
                            <h3 class="tits2">NEW PRODUCT</h3>
                        </div>
                        <div class="txtab_wrap">
                        	
                            <ul class="txtab">
			 					<c:forEach var="newproduct" items="${tabList}" varStatus="status">
			 						<c:if test="${newproduct.DSP_TAB_TYP eq 'N' }">
			 							<li><a href="#newproduct_${newproduct.DSP_TAB_IDX }">${newproduct.DSP_TAB_NM }</a></li>
			 						</c:if>        
				                </c:forEach>

                            </ul>
		 					<c:forEach var="topseller" items="${tabList }" varStatus="status">
		 						<c:if test="${topseller.DSP_TAB_TYP eq 'N' }">
		 						
	                  			<div class="tab_cont" id="newproduct_${topseller.DSP_TAB_IDX }">
	                                <!-- .new_goods_wrap -->
	                                <div class="new_goods_wrap new_item_wrap">
	                                    <ul class="new_goods_list new_item_list clearboth">
	                                    	<c:forEach var="newproductitem" items="${catProductList }" varStatus="status">
	                                    		<c:if test="${newproductitem.DSP_TAB_IDX eq  topseller.DSP_TAB_IDX}">
		                                        <li>
		                                        	<c:if test="${newproductitem.PRD_MST_LIVE_ON_YN eq 'Y' }">
		                                        		<span class="flag_video">video</span>
		                                        	</c:if>
		                                            <a href="/pc/product/productView.do?PRD_MST_CD=${newproductitem.PRD_MST_CD}" target="_blank">
		                                                <div class="img_thum_wrap">
		                                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${newproductitem.PRD_IMAGE});"></div>
		                                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${newproductitem.PRD_ROLL_OVER_IMG});"></div>
		                                                    <ul class="color_list">
		                                                    	<c:forEach var="topselleritemcolors" items="${newproductitem.CNT_PRD_COLOR }" varStatus="status">
		                                                    		<li><span style="background:${topselleritemcolors.CNT_PRD_COLOR };">${topselleritemcolors.CMN_COM_NM }</span></li>
		                                                    	</c:forEach>
		                                                    </ul>
		                                                </div>
		                                                <div class="sort_tag_area clearboth">
		                                                    <span class="sort">${newproductitem.BND_MST_BRAND_NM }</span>
		                                                    <span class="tag">${newproductitem.TAG_MST_TITLE }</span>
		                                                </div>
		                                                <p class="goods_title">${newproductitem.PRD_MST_NM }</p>
		                                                 <div class="goods_cost_info">
		                                                    <span class="dc_before_cost">
		                                                    	<fmt:formatNumber value="${newproductitem.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" />
		                                                    </span>
		                                                    <strong class="clearboth">
		                                                        <span class="goods_cost">
		                                                        	<fmt:formatNumber value="${newproductitem.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" />
		                                                        </span>
		                                                        <em class="dc_percent"><fmt:formatNumber value="${newproductitem.DISCOUNT_RATE }" type="percent" groupingUsed="false" /></em>
		                                                    </strong>
		                                                </div>
                  
		                                            </a>
		                                            <div class="btn_like_area">
		                                                <button type="button" class="btn-like ${newproductitem.MY_LIKE eq 'Y' ? 'on' : ''}" title="좋아요"
		                                                	onclick="likeBtnEvent($(this), '${newproductitem.PRD_MST_CD}', 'TYPE_PRODUCT')"><span>${newproductitem.LIKE_COUNTS }</span></button>
		                                            </div>
		                                        </li>
	                                       	 	</c:if>
	                                    	</c:forEach>
	                                    </ul>
	                                </div>
	                                <!-- // .new_goods_wrap -->
	                            </div>
	                            </c:if>
			                </c:forEach>
			                
                        </div>
                    </div>
                    <div class="keyword">
                        <div class="tit-area">
                            <h3 class="tits2">POWER BRAND</h3>
                            <ol>
			 					<c:forEach var="brands" items="${rankBrand }" varStatus="status">
					                <li><p class="kbx"><span class="num">${status.index + 1 }.</span><a href="/pc/brand/brandView.do?BND_MST_IDX=${brands.PRD_MST_BRD_IDX }">${brands.BND_MST_BRAND_NM }</a></p></li>
				                </c:forEach>
                            </ol>
                        </div>
                    </div>
                </div>
                <!--//여성 대카테고리(중단) -->

                <!-- 여성 대카테고리(하단) -->
                <div class="by_tag">
                    <div class="tit-area" style="background-image:url(${cdnDomain}${eventlist.CMM_FLE_ATT_PATH}${eventlist.CMM_FLE_SYS_NM })">
                        <h3 class="tits2">${tagBanner.BNR_MST_TITLE }</h3>
                    </div>
                    <div class="tag_list">
                        <ul>
                       		<c:forEach var="tags" items="${tagList }" varStatus="status">
                       			<li>${tags.TAG_MST_TITLE }</li>
			                </c:forEach>
                        </ul>
                    </div>
                </div>
                
                
                <div class="ootd_main">
                    <div class="list">
                        <div id="contents_list_wrapper" class="grid">
                            <div class="grid_sizer"></div>
                        </div>
                    </div><!-- //list-->
                </div>
                <!--여성 대카테고리(하단) -->
            </div>
        </div>
    </div>
    <input type="hidden" id="PRD_CTG_IDX" value="${PRD_CTG_IDX }"/>
    <input type="hidden" id="TAG_DSP_IDX" value="${TAG_DSP_IDX }"/>

     
    <script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
    
<!-- 기획전 템플릿 -->
<script type="text/template" id="c_plan_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx"><img src="${cdnDomain }\${CMM_FLE_SAVE_PATH }" alt="\${CMN_FLE_ALT_TXT }"></div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE }</span></div>
        <p class="title">\${PLN_MST_TITLE }</p>
        <p class="date">\${TARGET_DATE }</p>
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${PLN_MST_IDX}', 'TYPE_PLAN')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<!-- 타임특가 템플릿 -->
<script type="text/template" id="c_time_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="#">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="time_\${TIM_SAL_IDX}" class="color_list">
            </ul> 
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 
        <div class="per_bar_wrap remain_timer" data-starttime="\${TIM_SAL_ST}" data-finishtime="\${TIM_SAL_ED}">
            <p class="time">--:--:-- 남음</p><span class="percent_label">0%</span>
            <div class="per_bar">
                <span style="width:0%;" class="percent_label">0%</span>
            </div>
        </div>
    </a>
</div>
</script>

<!-- 신상품 템플릿 -->
<script type="text/template" id="c_new_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="new_\${DSP_MST_IDX}" class="color_list">
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
  
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 

    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${DSP_MST_IDX}', 'TYPE_NEW_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<!-- 고정배너 템플릿 -->
<script type="text/template" id="c_banner_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx"><img src="${cdnDomain }\\${CMM_FLE_SAVE_PATH}" alt="\${CMN_FLE_ALT_TXT}"></div>
    </a>
</div>
</script>
                
<!-- 이벤트 템플릿 -->
<script type="text/template" id="c_event_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx"><img src="${cdnDomain }\${CMM_FLE_SAVE_PATH}" alt="\${CMN_FLE_ALT_TXT}"></div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${EVT_MST_TITLE}</p>
    </a>
</div>
</script>

<!-- 셀러픽 템플릿 -->
<script type="text/template" id="c_pick_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx size1"><img src="${cdnDomain }\${IMAGE_02}" alt="IMAGE"></div>
        <div class="saler">
            <span class="pic"><img src="${cdnDomain }\${IMAGE_01}" alt="IMAGE"></span>
            <span class="name">\${VDR_MST_NM}</span>
        </div>
        <p class="title">\${CNT_MST_TITLE}</p>
        <p class="msg">\${CNT_MST_DESC}</p>
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${CNT_MST_IDX}', 'TYPE_SELLER_PICK')">\${LIKE_COUNTS }</a>
        <a href="#n" class="home">셀러룸 이동</a>
        <a href="#n" class="share">공유하기</a>
    </div>
</div>
</script>

<!-- OOTD 템플릿 -->
<script type="text/template" id="c_ootd_template"> 
<div class="grid_item">
    <a href="/pc/ootd/ootdView.do?CNT_MST_IDX=\${CNT_MST_IDX}" target="_blank">
        <div class="visual_bx size1"><img src="${cdnDomain }\${IMAGE_01}" alt="IMAGE"></div>
        <div class="saler">
            <span class="pic"><img src="${cdnDomain }\${MEM_MST_PRF_IMG}" alt="IMAGE"></span>
            <span class="name">\${VDR_MST_NM}</span>
        </div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${CNT_MST_TITLE}</p>
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${CNT_MST_IDX}', 'TYPE_OOTD')">\${LIKE_COUNTS }</a>
        <a href="#n" class="cmt">\${COMMENT_CNT}</a>
        <a href="#n" class="share">공유하기</a>
    </div>
    <ul id="ootd_\${CNT_MST_IDX}" class="pro_list">
    </ul>
</div>
</script>

<!-- 하울영상 템플릿 -->
<script type="text/template" id="c_haul_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx video"><img src="\${PRD_MST_URL}" alt=""></div>
        <div class="tg_bx"><span class="flag">\${BND_MST_BRAND_NM}</span><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${PRD_MST_NM}</p>
    </a>
    <div class="etc">
        <a href="#n" class="like \${LIKE_CLS}"
			onclick="likeBtnEvent($(this), '\${DSP_MST_IDX}', 'TYPE_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<!-- 베스트리뷰 템플릿 -->
<script type="text/template" id="c_best_template"> 
<div class="grid_item">
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank">
        <div class="visual_bx size2"><img src="${cdnDomain }\${REV_IMAGE}" alt="\${PRD_IMAGE_ALT}"></div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${PRD_REV_TITLE}</p>
    </a>
    <ul class="pro_list">
        <li>
            <a href="#">
                <div class="pro"><img src="${cdnDomain }\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></div>
                <div class="if">
                    <p class="tit">\${PRD_MST_NM}</p>
                    <p class="pri_bx"><span class="pri cur-number-format">\${PRD_NOW_DST_PRICE}</span><span class="per">\${PRD_DST_PERCENT}%</span></p>
                </div>
            </a>
        </li>
    </ul>
</div>
</script>


<!-- 펀딩 템플릿 -->
<script type="text/template" id="c_fund_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="#">
        <div class="img_thum_wrap">
            <div class="img_thum_inner" style="background-image:url(../../images/@temp/newitem04.jpg);"></div>
            <div class="img_thum_inner" style="background-image:url(../../images/@temp/newitem04_over.jpg);"></div>
            <ul class="color_list">
                <li><span style="background:#273b38;">color 01</span></li>
                <li><span style="background:#c7673e;">color 02</span></li>
                <li><span style="background:#6686ad;">color 03</span></li>
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">SIEG</span>
            <span class="tag">#펀딩</span>
        </div>
        <p class="goods_title">스퀘어 스카프 토드백</p>
        <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost">￦88,000</span>
            <strong class="clearboth">
                <span class="goods_cost">￦44,000</span>
                <em class="dc_percent">50%</em>
            </strong>
        </div>
        <div class="per_bar_wrap">
            <p class="time">14:21:21 남음 <span>60%</span></p>
            <div class="per_bar">
                <span style="width:60%;">60%</span>
            </div>
        </div>
    </a>
    <div class="etc">
        <a href="#n" class="share">공유하기</a>
    </div>
</div>
</script>

<!-- 탑셀러상품 템플릿 -->
<script type="text/template" id="c_top_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="top_\${DSP_MST_IDX}" class="color_list">
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${DSP_MST_IDX}', 'TYPE_NEW_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>


    <!--// Content -->
    <script>
    $(document).ready(function(){
    	eventBnrSwipe(); //이벤트&기획전 관련배너 스와이프 호출
    	
        $(window).on('resize', function(){
            item_list_H = $('.new_item_list .thum_img_wrap').hiLow('max');
            $('.new_item_list .thum_img_wrap').css('height',item_list_H);
    	});


        var renderRemainTimer = function() {
        	$('.remain_timer').each(function(){
        		
        		//new Date("Jan 5, 2021 15:37:25").getTime();
        		var $targetElem = $(this);
        		if($targetElem.attr('data-execute') != 'Y') {
        			
              		$(targetElem).attr('data-execute', 'Y');
            		
            		var startTime = $targetElem.attr('data-starttime');
            		var finishTime = $targetElem.attr('data-finishtime');
            		    		
            		//console.log(startTime + ", " + finishTime);
            		//yyyymmddhhmmss
            		var curFinishDateTime = new Date(finishTime.slice(0, 4), finishTime.slice(4, 6) - 1, finishTime.slice(6, 8),
            				//finishTime.slice(8, 10), finishTime.slice(10, 12), finishTime.slice(12, 14)).getTime();
            				finishTime.slice(8, 10), finishTime.slice(10, 12), '00').getTime();
            		
            		var curStartDateTime = new Date(startTime.slice(0, 4), startTime.slice(4, 6) - 1, startTime.slice(6, 8),
            				//startTime.slice(8, 10), startTime.slice(10, 12), startTime.slice(12, 14)).getTime();
            				startTime.slice(8, 10), startTime.slice(10, 12), '00').getTime();
            		
            		var curDistance = curFinishDateTime - curStartDateTime;
            		
            		var $targetTimeTxt = $('.time', $targetElem);
            		var $targetProgress = $('.per_bar span', $targetElem);
            		var $targetPercent = $('.percent_label', $targetElem);
            		
            	    var x = setInterval(function() {

                   	  	// Get today's date and time
                   	  	var now = new Date().getTime();

                   	  	// Find the distance between now and the count down date
                   	  	var distance = curFinishDateTime - now;

                   	  	// Time calculations for days, hours, minutes and seconds
                   	  	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                   	  	var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                   	 	if(hours < 10) hours = '0' + hours;
                   	  	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                   	 	if(minutes < 10) minutes = '0' + minutes;
                   	  	var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                   	  	if(seconds < 10) seconds = '0' + seconds;

                   	  	// If the count down is finished, write some text
                   	  	if (distance < 0) {
                   	  		clearInterval(x);
                   	 		$targetTimeTxt.text('00:00:00');
                   	 		$targetProgress.css('width', '0%');
                   	 	$targetPercent.text('0%');
        				} else {
        					$targetTimeTxt.text(hours + ':' + minutes + ':' + seconds);
        					var curPercent = Math.floor(distance / curDistance * 100);
                   	 		$targetProgress.css('width', curPercent + '%');
                   	 		$targetPercent.text( curPercent + '%');
        				}
                   }, 1000);
        			
        		}
  
        	});
        };
    
        ///////////// CALCULATE REMAIN TIME //////////////
   
        
        ///////////// CONTENTS LIST PROCESS //////////////
        
        var isLastData = false;
		
  		var lastKeyIndex = -1;
		var contentFirstListKeys = ['planList', 'timeList', 'newList','bannerList','eventList','pickList','ootdList','haulList', 'bannerList','bestList','fundList','topList'];
		var $wrapperElem = $("#contents_list_wrapper");
		
        var CONTENT_LIST_INFO = {
        	tag_bnd_id : $('#TAG_DSP_IDX').val(),
        	planOffset : 1,
        	timeOffset : 1,
        	newOffset : 1,
        	eventOffset : 1,
        	pickOffset : 1,
        	ootdOffset : 1,
        	haulOffset : 1,
        	bestOffset : 1,
        	fundOffset : 1,
        	topOffset : 1,
        	bannerOffset : 1
        };

        var renderCurrentUI = function(pData) {
        	
        	while(true) {
        		lastKeyIndex++;
        		if(lastKeyIndex >= contentFirstListKeys.length) lastKeyIndex = 0;
        		
        		var curKey = contentFirstListKeys[lastKeyIndex];
        		
        		if(pData[curKey].length > 0) {
        			
        			var templateID = curKey.replace("List", "");
        			var curDataList = pData[curKey][0];
        			$('#c_' + templateID + '_template').tmpl(curDataList).appendTo($wrapperElem);
        			
        			if(templateID == 'time' || templateID == 'new' || templateID == 'top') {
        				var liHTML = '<li><span style="background:{colorvalue};">{colorname}</span></li>';
        				var fullHTML = '';
        				for(var i = 0; i < curDataList.CNT_PRD_COLOR.length ; i ++) {
        					var curColorInfo = curDataList.CNT_PRD_COLOR[i];
        					fullHTML += liHTML.replace('{colorvalue}', curColorInfo.CNT_PRD_COLOR)
        										.replace('{colorname}', curColorInfo.CMN_COM_NM);
        				}
        				var curIDX = '';
        				if(templateID == 'time' ) curIDX = curDataList.TIM_SAL_IDX;
        				else if(templateID == 'new' ) curIDX = curDataList.DSP_MST_IDX;
        				else if(templateID == 'top' ) curIDX = curDataList.DSP_MST_IDX;
        				$('#' + templateID + '_' + curIDX).append(fullHTML);
        				
        				if(templateID == 'time')
        					renderRemainTimer();
        			} else if (templateID == 'ootd') {
        				var cdnDomain = '<c:out value="${cdnDomain}"/>';
            	        var liHTML = '';
            	        liHTML += '<li>';
            	        liHTML += '    <a href="/pc/product/productView.do?PRD_MST_CD={PRD_MST_CD}" target="_blank">';
            	        liHTML += '        <div class="pro"><img src="{image}" alt="{alt}"></div>';
            	        liHTML += '        <div class="if">';
            	        liHTML += '            <p class="tit">{title}</p>';
            	        liHTML += '            <p class="pri_bx">';
            	        liHTML += '                <span class="pri cur-number-format">{price}</span>';
            	        liHTML += '                <span class="per">{percent} %</span>';
            	        liHTML += '            </p>';
            	        liHTML += '        </div>';
            	        liHTML += '    </a>';
            	        liHTML += '</li>';
        				var fullHTML = '';
        				for(var i = 0; i < curDataList.DTL_LIST.length ; i ++) {
        					var curDtlInfo = curDataList.DTL_LIST[i];
        					fullHTML += liHTML.replace('{image}', cdnDomain + '/'+ curDtlInfo.PRD_IMAGE)
        										.replace('{title}', curDtlInfo.PRD_MST_NM)
        										.replace('{PRD_MST_CD}', curDtlInfo.PRD_MST_CD)
        										.replace('{alt}', curDtlInfo.PRD_IMAGE_ALT)
        										.replace('{price}', curDtlInfo.PRD_MST_PRICE)
        										.replace('{percent}', curDtlInfo.PRD_DST_PERCENT);
        				}
        				
        				$('#' + templateID + '_' + curDataList.CNT_MST_IDX).append(fullHTML);
        			}
  
        			pData[curKey].splice(0, 1);
        			break;
        		}
        	}
        }
        
        var renderContentsUI = function(pData){
        	
        	var totalLength = pData.count * 1;
     
        	for(var i = 0; i < totalLength; i++) {
        		renderCurrentUI(pData.list);
        	}
 
        	isLastData = totalLength == 0 ? true : false;

        	for (var key in pData.offset) {
        		if(CONTENT_LIST_INFO[key]) 
        			CONTENT_LIST_INFO[key] = pData.offset[key]
        	}
        	
            $('.grid').masonry({
                itemSelector: '.grid_item',
                columnWidth: '.grid_sizer',
                percentPosition: true,
                transitionDuration: '0.3s'
        	});
           
            ResetCurrencyNumberFormat();
            $('.grid').masonry('reloadItems');
        }
        
        var isAjaxing = false;
        var funcGetContentsList = function(){
			if(isAjaxing == false && isLastData == false) {
				isAjaxing = true;
				
	        	$.ajax({
	        		type	: "POST",
	        		url		: "/pc/contents/contentListAjax.do",
	        		dataType: "json",
	        		data	: CONTENT_LIST_INFO,
	        		success : function(data) {
	        			renderContentsUI(data);
	        		}, error : function(err) {
	        			alert("요청 실패");
	        		}, complete : function() {
	        			isAjaxing = false;   
	        	    }
	        	});
			}

        };
        
        funcGetContentsList();
        
    	$(window).scroll(function(){
    		var maxHeight = $(document).height();
    		var currentScroll = $(window).scrollTop() + $(window).height();
    		if(maxHeight <= currentScroll){
    			funcGetContentsList();
    		}
    	});
    });
    </script>
     <script>

	 $(document).ready(function(){
		 setPlayerData("${movie.BNR_MST_URL }");
	 });
	 function setPlayerData(moveUrl){
		  var provider = null;
		  var moveId = null;
		  if(moveUrl.indexOf("https://youtu.be/")>-1){
			  provider = "youtube";
			  moveId = moveUrl.substring("https://youtu.be/".length);
		  }
		  else if(moveUrl.indexOf("https://vimeo.com/")>-1){
			  provider = "vimeo";
			  moveId =  moveUrl.substring("https://vimeo.com/".length);
		  }
		  $("#player").data("plyr-provider", provider);
		  $("#player").data("plyr-embed-id", moveId);
	 }
	
	 </script>  
    
    
    <%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>