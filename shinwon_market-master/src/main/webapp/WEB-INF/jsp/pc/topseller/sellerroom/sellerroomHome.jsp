<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<!-- Content -->
    <div id="container">
        <div id="content" class="content">
            
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

			
            S : 콘텐츠 시작

            ***************************************************************************** -->

		   	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_wrap clearboth">
        	</c:if>
        	
            <%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>

        	
        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_right">
        	</c:if>
        	
            <!-- .special_visual_wrap -->
            <div class="special_visual_wrap topseller">
                <div class="special_visual">
     	            <c:forEach var="infoRow" items="${topBanner }">
     	            	<a href="${infoRow.BNR_MST_URL }" target="_blank"><img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }"></a>
 	                </c:forEach>
                </div>
            </div>
            <!-- // .special_visual_wrap -->
            
          


            <div class="sub_content product">
            
                <!-- 기획전 -->            
	        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'A' }">
	        	
	                <div class="planning_visual_wrap">
	                    <div class="tit-area">
	                        <h3 class="tits2">기획전</h3>
	                    </div>
	                    <div class="planning_visual slick_vusual">
	                    	<c:forEach var="infoRow" items="${planBanner }">
	                        <div>
	                            <div class="planning_img">
	                            	<a href="${infoRow.BNR_MST_URL }" target="_blank" class="img"><img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }"></a>
	                            </div>
	                            <div class="seller_goods_imgs">
	                            	<c:forEach var="prdRow" items="${infoRow.products }"  varStatus="i" >
	                            	    <c:if test="${i.first}">
	                            		<a href="/pc/product/productView.do?PRD_MST_CD=${prdRow.PRD_MST_CD}" target="_blank" class="img">
		                                    <img src="${cdnDomain }${prdRow.PRD_IMAGE }" alt="${infoRow.PRD_IMAGE_ALT }">
		                                    <ul class="color_list">
		                                    	<c:forEach var="prdRow" items="${prdRow.CNT_PRD_COLOR }">
		                                    		<li><span style="background:${prdRow.CNT_PRD_COLOR };">${prdRow.CMN_COM_NM }</span></li>  
		                                    	</c:forEach>
		                                    </ul>
		                                </a>
	                            	    </c:if>		                                
	                            	</c:forEach>
	                            </div>
	                        </div>
	                    	</c:forEach>
	                    </div>
	                </div>	        	
	        	
	        	
	        	</c:if>
	        	
	        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
                        <div class="planning_visual_wrap">
                            <div class="tit-area">
                                <h3 class="tits2">기획전[B]</h3>
                            </div>
                            <div class="planning_visual_bx clearboth slick_vusual">
                                <div class="planning_visual_left" id="planning_visual_left">
                                    <c:forEach var="infoRow" items="${planBanner }">
		                                <div data-key="visual_left_${infoRow.BNR_MST_SRT}"><a href="${infoRow.BNR_MST_URL }" target="_blank" class="img"><img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }"></a></div>                                    
                                    </c:forEach>
                                </div>
	                            <c:forEach var="infoRow" items="${planBanner }">
		                            <div class="planning_visual_right slick_vusual" data-key="visual_left_${infoRow.BNR_MST_SRT}">
	                                  <c:forEach var="prdRow" items="${infoRow.products }">
	                                    <div>
	                                       <a href="/pc/product/productView.do?PRD_MST_CD=${prdRow.PRD_MST_CD}" target="_blank" class="img">
	                                          <img src="${cdnDomain }${prdRow.PRD_IMAGE }" alt="${infoRow.PRD_IMAGE_ALT }">
	                                       </a>
	                                    </div>                                                              
		                              </c:forEach>
		                            </div>
	                            </c:forEach>
                            </div>

                        </div>   
	        	</c:if>	        	              
                <!-- // 기획전 -->
                
                
                            

                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
                <!-- #TAG -->
                <div class="by_tag">
                    <div class="tit-area">
                        <h3 class="tits2">#by trend</h3>
                    </div>
                 
			    	<c:choose>
			        	<c:when test = "${not empty bytrendBanner }">
			        		<div class="tag_list" style="background-image:url('${cdnDomain }${bytrendBanner.FILE_NM }')">
			         	</c:when>
			         	<c:otherwise>
			         		<div class="tag_list">
			         	</c:otherwise>
			      	</c:choose>
    
                        <ul>
                        	<c:forEach var="infoRow" items="${tagList }">
                        		<li>${infoRow.TAG_MST_TITLE}</li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- // #TAG --> 
                
				<!-- .new_goods_wrap -->
                <div class="new_goods_wrap mt55">
                    <ul class="new_goods_list clearboth">
                    	<c:forEach var="infoRow" items="${bytrendProds }">
                        <li>
                            <!-- <span class="flag_video">video</span> -->
                            <a href="/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target='_blank'>
                                <div class="img_thum_wrap">
                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_IMAGE });"></div>
                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_ROLL_OVER_IMG });"></div>
                                    <ul class="color_list">
                                    	<c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
	                                    	<li><span style="background:${colorRow.CNT_PRD_COLOR };">${colorRow.CMN_COM_NM }</span></li>  
	                                    </c:forEach>
                                    </ul>
                                </div>
                                <div class="sort_tag_area clearboth">
                                    <span class="sort">${infoRow.BND_MST_BRAND_NM }</span>
                                    <span class="tag">${infoRow.TAG_MST_TITLE }</span>
                                </div>
                                <p class="goods_title">${infoRow.PRD_MST_NM }</p>
                                <div class="goods_cost_info">
                                    <span class="dc_before_cost"><fmt:formatNumber value="${infoRow.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
                                    <strong class="clearboth">
                                        <span class="goods_cost"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
                                        <em class="dc_percent"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_POINT }" type="percent" groupingUsed="false" /></em>
                                    </strong>
                                </div>
                            </a>
                            <div class="btn_like_area">
                                <button type="button" onclick="javascript:likeBtnEvent($(this), '${infoRow.PRD_MST_CD }', 'TYPE_PRODUCT')"
                                		class="btn-like ${infoRow.LIKE_CLS }" title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>
                            </div>
                        </li>
                    	</c:forEach>
                    </ul>
                </div>
                <!-- // .new_goods_wrap -->                
                
                
                </c:if>
                
                
                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'A' }">
                

                <!-- 셀러픽 -->
                <div class="goods_list_wrap seller_pick">
                    <!-- .title_exp_area -->
                    <div class="title_exp_area clearboth mb45">
                        <h3 class="fl">셀러픽</h3>
                    </div>
                    <!-- // .title_exp_area -->
                    <ul class="goods_list clearboth">
                    	<c:forEach var="infoRow" items="${sellerpickBanner }">
                    	
                        <li>
                            <!-- .goods_info_wrap -->
                            <div class="goods_info_wrap">
                                <a href="#">
                                    <!-- .thum_colorinfo -->
                                    <div class="thum_color_info">
                                    	<img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }">
                                    </div>
                                    <!-- // .thum_colorinfo -->
                                </a>
                                <div class="saler_cont">
                                    <div class="saler">
                                        <span class="pic">
                                        	<img src="${cdnDomain }${infoRow.PROFILE_IMG }" alt="${infoRow.CMN_FLE_ALT_TXT }">
                                        </span>
                                        <span class="name">${infoRow.BND_MST_SEL_NM }</span>
                                    </div>
                                    <p class="title">${infoRow.BNR_MST_TITLE }</p>
                                    <p class="msg">${infoRow.BNR_MST_DESC }</p>
                                </div>
                                <div class="btn_like_area">
                                    <button type="button" class="btn-like ${infoRow.LIKE_CLS }" 
                                     onclick="javascript:likeBtnEvent($(this), '${bottomBannerRow.VDR_MST_IDX }', 'TYPE_TOP_SELLER')"
                                     title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>
                                     
                                    <!-- <button type="button" class="btn-home"><span class="blind">셀러룸 이동</span></button> -->
                                </div>
                            </div>
                            <!-- // .goods_info_wrap -->
                        </li>
                        
                    	</c:forEach>
                    </ul>
                   
                    <div class="btn_wrap">
                        <button onclick="goPage()" class="btn_large">바로가기</button>
                    </div>
                    
                </div>
                <!-- //셀러픽 -->                
                
                
                </c:if>                   


                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
                
                
                        <!-- 셀러픽 -->
                        <div class="seller_pick2_swiper_wp">
                            <div class="tit-area">
                                <h3 class="tits2">셀러픽</h3>
                            </div>
                            <div class="swiper-container seller_pick2_swiper">
                                <div class="swiper-wrapper">
                                    <!--  FOR문 시작  sellerpickBanner --> 
                                    <c:forEach var="sellerPick" items="${sellerpickBanner }">

                                    <div class="swiper-slide">
                                        <div class="seller_img">
                                            <img src="<c:out value="${cdnDomain}" />${sellerPick.CMM_FLE_ATT_PATH}${sellerPick.CMM_FLE_SYS_NM}"    ALT='${sellerPick.CMN_FLE_ALT_TXT}' />
                                        </div>
                                        <div class="seller_area">
                                            <div class="seller_info_wrap clearboth">
                                                <div class="seller_info_thum">
                                                    <img src="<c:out value="${cdnDomain}" />${sellerPick.SELLER_IMG}"  ALT='${sellerPick.CMN_FLE_ALT_TXT}' />    
                                                </div>
                                                <span class="seller_name">${sellerPick.BND_MST_SEL_NM}</span>
                                            </div>
                                            <p class="subject">${sellerPick.CNT_MST_TITLE}</p>
                                            <span class="txt">${sellerPick.CNT_MST_DESC} </span>
                                            <div class="tag_area clearboth">
                                                ${sellerPick.TAG_MST_TITLE}
                                            </div>
                                            <div class="btn_area clearboth">
                                                <div class="btn_like_sellerhome_area clearboth">
                                                    <button type="button" class="btn-like  <c:if test="${sellerPick.MY_LIKE eq 'Y' }"> on</c:if>" onclick="javascript:likeBtnEvent( $(this) , '${sellerPick.CNT_MST_IDX}' , 'TYPE_SELLER_PICK' )"     title="좋아요"><span>${sellerPick.LIKE_COUNTS}</span></button>
                                                    <a href="javascript:goSellerRoomPage( '${sellerPick.CNT_MST_IDX}' )">셀러홈으로 이동하기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>                                    
                                    <!--  //FOR문 시작 -->
                                    
                                </div>
                                <!-- Add Pagination -->
                                <div class="swiper-pagination"></div>
                            </div>
                            <div class="btn_wrap">
                                <button class="btn_large" id="btn_sellerRoom_Go">바로가기</button>
                            </div>
                        </div>
                        <!-- //셀러픽 -->                
                
                
                </c:if>

                        
                        
                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
                <!-- 띠배너 -->
                <div class="one_banner_wrap">
                	<c:forEach var="infoRow" items="${strBanner }">
                		<a href="${infoRow.BNR_MST_URL }" target="_blank"><img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }"></a>
                	</c:forEach>
                </div>
                <!-- // 띠배너 -->              
                </c:if>

                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'A' }">

                <!-- #TAG -->
                <div class="by_tag">
                    <div class="tit-area">
                        <h3 class="tits2">#by trend</h3>
                    </div>
                 
			    	<c:choose>
			        	<c:when test = "${not empty bytrendBanner }">
			        		<div class="tag_list" style="background-image:url('${cdnDomain }${bytrendBanner.FILE_NM }')">
			         	</c:when>
			         	<c:otherwise>
			         		<div class="tag_list">
			         	</c:otherwise>
			      	</c:choose>
    
                        <ul>
                        	<c:forEach var="infoRow" items="${tagList }">
                        		<li>${infoRow.TAG_MST_TITLE}</li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
                
				<!-- .new_goods_wrap -->
                <div class="new_goods_wrap mt55">
                    <ul class="new_goods_list clearboth">
                    	<c:forEach var="infoRow" items="${bytrendProds }">
                        <li>
                            <!-- <span class="flag_video">video</span> -->
                            <a href="/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target='_blank'>
                                <div class="img_thum_wrap">
                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_IMAGE });"></div>
                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_ROLL_OVER_IMG });"></div>
                                    <ul class="color_list">
                                    	<c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
	                                    	<li><span style="background:${colorRow.CNT_PRD_COLOR };">${colorRow.CMN_COM_NM }</span></li>  
	                                    </c:forEach>
                                    </ul>
                                </div>
                                <div class="sort_tag_area clearboth">
                                    <span class="sort">${infoRow.BND_MST_BRAND_NM }</span>
                                    <span class="tag">${infoRow.TAG_MST_TITLE }</span>
                                </div>
                                <p class="goods_title">${infoRow.PRD_MST_NM }</p>
                                <div class="goods_cost_info">
                                    <span class="dc_before_cost"><fmt:formatNumber value="${infoRow.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
                                    <strong class="clearboth">
                                        <span class="goods_cost"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
                                        <em class="dc_percent"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_POINT }" type="percent" groupingUsed="false" /></em>
                                    </strong>
                                </div>
                            </a>
                            <div class="btn_like_area">
                                <button type="button" onclick="javascript:likeBtnEvent($(this), '${infoRow.PRD_MST_CD }', 'TYPE_PRODUCT')"
                                		class="btn-like ${infoRow.LIKE_CLS }" title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>                                		
                                		
                            </div>
                        </li>
                    	</c:forEach>
                    </ul>
                </div>
                <!-- // .new_goods_wrap -->                
                
                
                </c:if>                

                <!-- // #TAG -->
                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'A' }">
                <!-- 띠배너 -->
                <div class="one_banner_wrap">
                	<c:forEach var="infoRow" items="${strBanner }">
                		<a href="${infoRow.BNR_MST_URL }" target="_blank"><img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }"></a>
                	</c:forEach>
                </div>
                <!-- // 띠배너 -->
                </c:if>                  
                
                



                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'A' }">
           

                              

                <!-- 신상품, 주간베스트 TAB -->
                <div class="tab_wrap type02 fix mt200">
                    <ul class="tab n2 ">
                        <li><a href="#tab1">신상품</a></li>
                        <li><a href="#tab2">주간베스트</a></li>
                    </ul>
                    <div class="tab_cont" id="tab1">
                        <h4 class="blind">신상품</h4>
                        <div class="item_slide slick_vusual">
                        	<c:forEach var="infoRow" items="${newProds }" varStatus="status">
                        		<c:if test="${status.index % 5 eq 0}">
                        			<div>
                        		</c:if>
                        		
                        			<div class="img">
                        			
                                    <a href="/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target="_blank">
                                        <img src="${cdnDomain }${infoRow.PRD_IMAGE }" alt="${infoRow.PRD_IMAGE_ALT }">
                                        <ul class="color_list">
                                           <c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
	                                    		<li><span style="background:${colorRow.CNT_PRD_COLOR };">${colorRow.CMN_COM_NM }</span></li>  
	                                    	</c:forEach>
                                        </ul>
                                    </a>
                                	</div>
                                
                        		<c:if test="${status.index % 5 eq 4 or status.last eq true}">
                        			</div>
                        		</c:if>
                        	</c:forEach>
                        </div>
                    </div>
                    <div class="tab_cont" id="tab2">
                        <h4 class="blind">주간베스트</h4>
                        <div class="item_slide slick_vusual">
                        	<c:forEach var="infoRow" items="${bestProds }" varStatus="status">
                        		<c:if test="${status.index % 5 eq 0}">
                        			<div>
                        		</c:if>
                        		
                        			<div class="img">
                                    <a href="/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target="_blank">
                                        <img src="${cdnDomain }${infoRow.PRD_IMAGE }" alt="${infoRow.PRD_IMAGE_ALT }">
                                        <ul class="color_list">
                                           <c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
	                                    		<li><span style="background:${colorRow.CNT_PRD_COLOR };">${colorRow.CMN_COM_NM }</span></li>  
	                                    	</c:forEach>
                                        </ul>
                                    </a>
                                	</div>
                                
                        		<c:if test="${status.index % 5 eq 4 or status.last eq true}">
                        			</div>
                        		</c:if>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <!-- //신상품, 주간베스트 TAB -->
                </c:if>
                
                <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
                
                        <!-- 신상품, 주간베스트 TAB -->
                        <div class="tab_wrap type02 fix mt200">
                            <ul class="tab n2 ">
                                <li><a href="#tab1">신상품</a></li>
                                <li><a href="#tab2">주간베스트</a></li>
                            </ul>
                            <div class="tab_cont" id="tab1">
                                <h4 class="blind">신상품</h4>
                                
                                <!-- .new_goods_wrap -->
                                <div class="new_goods_wrap">
                                    <ul class="new_goods_list new_goods_list3 clearboth">
				                    	<c:forEach var="infoRow" items="${newProds }">
				                        <li>
				                            <!-- <span class="flag_video">video</span> -->
				                            <a href="/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target='_blank'>
				                                <div class="img_thum_wrap">
				                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_IMAGE });"></div>
				                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_ROLL_OVER_IMG });"></div>
				                                    <ul class="color_list">
				                                    	<c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
					                                    	<li><span style="background:${colorRow.CNT_PRD_COLOR };">${colorRow.CMN_COM_NM }</span></li>  
					                                    </c:forEach>
				                                    </ul>
				                                </div>
				                                <div class="sort_tag_area clearboth">
				                                    <span class="sort">${infoRow.BND_MST_BRAND_NM }</span>
				                                    <span class="tag">${infoRow.TAG_MST_TITLE }</span>
				                                </div>
				                                <p class="goods_title">${infoRow.PRD_MST_NM }</p>
				                                <div class="goods_cost_info">
				                                    <span class="dc_before_cost"><fmt:formatNumber value="${infoRow.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
				                                    <strong class="clearboth">
				                                        <span class="goods_cost"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
				                                        <em class="dc_percent"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_POINT }" type="percent" groupingUsed="false" /></em>
				                                    </strong>
				                                </div>
				                            </a>
				                            <div class="btn_like_area">
				                                <button type="button" onclick="javascript:likeBtnEvent($(this), '${infoRow.PRD_MST_CD }', 'TYPE_PRODUCT')"
				                                		class="btn-like ${infoRow.LIKE_CLS }" title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>
				                                		
				                                		
				                                		
				                                		
				                            </div>
				                        </li>
				                    	</c:forEach>                                    

                                    </ul>
                                </div>
                                <!-- // .new_goods_wrap -->
                            </div>
                            <div class="tab_cont" id="tab2">
                                <h4 class="blind">주간베스트</h4>
                                <!-- .new_goods_wrap -->
                                <div class="new_goods_wrap">
                                    <ul class="new_goods_list new_goods_list3 clearboth">
				                    	<c:forEach var="infoRow" items="${bestProds }">
				                        <li>
				                            <!-- <span class="flag_video">video</span> -->
				                            <a href="/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target='_blank'>
				                                <div class="img_thum_wrap">
				                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_IMAGE });"></div>
				                                    <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${infoRow.PRD_ROLL_OVER_IMG });"></div>
				                                    <ul class="color_list">
				                                    	<c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
					                                    	<li><span style="background:${colorRow.CNT_PRD_COLOR };">${colorRow.CMN_COM_NM }</span></li>  
					                                    </c:forEach>
				                                    </ul>
				                                </div>
				                                <div class="sort_tag_area clearboth">
				                                    <span class="sort">${infoRow.BND_MST_BRAND_NM }</span>
				                                    <span class="tag">${infoRow.TAG_MST_TITLE }</span>
				                                </div>
				                                <p class="goods_title">${infoRow.PRD_MST_NM }</p>
				                                <div class="goods_cost_info">
				                                    <span class="dc_before_cost"><fmt:formatNumber value="${infoRow.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
				                                    <strong class="clearboth">
				                                        <span class="goods_cost"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
				                                        <em class="dc_percent"><fmt:formatNumber value="${infoRow.PRD_NOW_DST_POINT }" type="percent" groupingUsed="false" /></em>
				                                    </strong>
				                                </div>
				                            </a>
				                            <div class="btn_like_area">
				                                <button type="button" onclick="javascript:likeBtnEvent($(this), '${infoRow.PRD_MST_CD }', 'TYPE_PRODUCT')"
				                                		class="btn-like ${infoRow.LIKE_CLS }" title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>
				                            </div>
				                        </li>
				                    	</c:forEach>
                                     
                                    </ul>
                                </div>
                                <!-- // .new_goods_wrap -->
                            </div>
                        </div>
                        <!-- //신상품, 주간베스트 TAB -->
                
                
                </c:if>    
            </div>

       	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
				</div>
				<!-- //Right Wrapper -->
        	</div>
        	<!-- //All Wrapper -->
       	</c:if>


        </div>
    </div>
    <!--// Content -->

<form id="pageForm" name="pageForm">
	<input type="hidden" id="VDR_MST_IDX" name="VDR_MST_IDX" value="${sellerInfo.VDR_MST_IDX }">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
    $(function(){
        $('.special_visual').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            adaptiveHeight: true
        });
        $('.planning_visual').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            adaptiveHeight: true,
            arrows: false
        });
        $('.item_slide').slick({
            dots : true,
            infinite: true,
            cssEase: 'linear',
            autoplay: false,
            slidesToShow: 1,
            arrows: true
        });

        $('.tab a').on('click',function(){
            $('.item_slide').slick('refresh');
            setTimeout(function(){
                img_hover();
            },1)
        })
        img_hover();
        
    });
    
    img_hover = function(){
        $('.item_slide a, .seller_goods_imgs a').on('mouseenter focusin', function(){
            var slideImg = $(this).find('img');
            slideImg.attr("src", slideImg.attr("src").replace(".jpg", "_on.jpg"));
        }).on('mouseleave focusout', function(){
            var slideImg = $(this).find('img');
            slideImg.attr("src", slideImg.attr("src").replace("_on.jpg", ".jpg"));
        });
    }

    goPage = function(){
		var pageForm = $("#pageForm");
    	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/sellerroomSellerPickList.do", "target":"_self", "method":"post"}).submit();
    }
    
    
    
    

</script>
<script>
$(function(){

    $('.planning_visual_left').slick({
        dots : false,
        infinite: true,
        speed: 500,
        cssEase: 'linear',
        slidesToShow: 1,
        spaceBetween: 0,
        autoplay: false,
        adaptiveHeight: true,
        arrows: true
    });
    $('.planning_visual_right').slick({
        dots : false,
        infinite: true,
        speed: 500,
        cssEase: 'linear',
        slidesToShow: 2,
        spaceBetween: 40,
        autoplay: false,
        adaptiveHeight: true,
        arrows: true
    });
    //$('.slick-media').slick('unslick').slick('reinit');    
    var swiper = new Swiper('.seller_pick2_swiper', {
      slidesPerView: 'auto',
      spaceBetween: 40,
      loop: true,
      arrows: false,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
    });
    
    $('#planning_visual_left').on('click', 'button', function(){
    	var dataKey = $('#planning_visual_left').find('div.slick-active').find('[data-key]').attr('data-key')

    	$('.planning_visual_right').hide();
    	$('.planning_visual_right[data-key='+dataKey+']').show();
    	
    	$('.planning_visual_right').slick('unslick').slick({
            dots : false,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 2,
            spaceBetween: 40,
            autoplay: false,
            adaptiveHeight: true,
            arrows: true
        })    	
    })
    
    $('.planning_visual_right').hide();
    $('.planning_visual_right:eq(0)').show();

});
</script>
