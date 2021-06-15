<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<script type="text/javascript" src="/nas/cdn/pc/js/common.js"></script>
<title>쑈윈도 | 일반상품 상세</title>
<script>

	$(function(){
	    var galleryThumbs = new Swiper('.gallery-thumbs', {
	      spaceBetween: 2,
	      slidesPerView: 4,
	      freeMode: true,
	      watchSlidesVisibility: true,
	      watchSlidesProgress: true,
	    });
	    var galleryTop = new Swiper('.gallery-top', {
	      autoHeight: true,
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	      thumbs: {
	        swiper: galleryThumbs
	      }
	    });
	    var galleryPhoto = new Swiper('.photo_review_thumbs', {
	      slidesPerView: 4,
	      spaceBetween: 20,
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	  });
	
	$(function(){
	      $('input').on('click',function(){
	        var li = $(this).parents('li');
	        li.addClass('atv').siblings().removeClass('atv');
	      })
	})
	    
</script>

  <!-- Content -->
  <div id="container">
    <div id="content" class="content">

      <!-- LOCATION -->
      <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
      <!-- //LOCATION -->
      <!-- 
		"productBannerInfo":${productBannerInfo }
		"productReputation":${productReputation}
		"productInfo":${productInfo}
		"productNfiInfo":${productNfiInfo}
		"productEmagazineRevList":${productEmagazineRevList}
		"listProductImages":${listProductImages}
		"repCount":${repCount}
		"qnaCount":${qnaCount}
		"commandMap":${commandMap}
	 -->
		<input id="target_prd_name" type="hidden" value="${productInfo.PRD_MST_NM }"/>
		<input id="target_prd_code" type="hidden" value="${productInfo.PRD_MST_CD }"/>
		<input id="target_prd_ctg_idx" type="hidden" value="${commandMap.PRD_CTG_IDX }"/>
		<input id="target_prd_price" type="hidden" value="${productInfo.PRD_NOW_DST_PRICE }"/>
		<input id="target_prd_type" type="hidden" value="${productInfo.PRD_MST_TYPE }"/>
		 
      <div class="sub_content">
        <div class="product_wrap">
          <div class="product_inner">
            <div class="product_detail">
              <div class="gallery_slide">
              	<c:if test="${not empty productInfo.PRD_MST_URL }">
	                <a href="#" date-type="layer" date-id="layer_img_detail" class="btn_video">동영상보기</a>	<!--<c:out value="${movRow.PRD_MST_URL}" /><c:out value="${movRow.PRD_MST_NM}" />-->
              	</c:if>
                <div class="swiper-container gallery-top">
                  <div class="swiper-wrapper">
                  	<c:if test="${not empty listProductImages}">
                  		<c:forEach var="topProductImages" items="${listProductImages}" varStatus="i">
                    		<div class="swiper-slide"><img class="productImage" src="<c:out value="${topProductImages.large}"/>" alt="<c:out value="${topProductImages.alt}"/>"></div>
                    	</c:forEach>
                    </c:if> 
                  </div>
                </div>
                <div class="swiper-container gallery-thumbs">
                  <div class="swiper-wrapper">
                  	<c:if test="${not empty listProductImages}">
                  		<c:forEach var="topProductImages" items="${listProductImages}" varStatus="i">
                    		<div class="swiper-slide"><img src="<c:out value="${topProductImages.small}"/>" alt="<c:out value="${topProductImages.alt}"/>"></div>
                    	</c:forEach>
                  	</c:if>	
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
              </div>
              <!--
              <div class="fit_guide">
                <div class="top">
                  <div class="tit-area">
                    <div class="left">
                      <h3 class="tits2">핏 가이드</h3>
                    </div>
                  </div>
                  <div class="btn_wrap">
                  	<c:if test="${not empty commandMap.MEM_MST_MEM_ID}">
				     	<c:choose>
				         <c:when test = "${myFitInfoYN eq 'N'}">
				         	<button class="btn_small myfit-popup">마이핏등록</button>
				         </c:when>
				         <c:otherwise>
				         	<button class="btn_small myfit-popup">마이핏수정</button>
				         </c:otherwise>
				      	</c:choose>
					</c:if>
					<c:if test="${empty commandMap.MEM_MST_MEM_ID}">
						<button class="btn_small myfit-popup">마이핏등록</button>
					</c:if>
                  	
                  </div>
                </div>
                <table class="tb_col type02">
                  <caption>핏 가이드 - 사이즈, 어깨넓이, 가슴둘레, 소매길이, 전체길이 출력 표입니다.</caption>
                  <colgroup>
                  	<c:forEach var="myfitinfo" items="${myFitInfolist}" varStatus="i">
                    	<col style="width:auto">
                    </c:forEach>
                  </colgroup>
                  <thead>
                    <tr>
                    	<c:forEach var="myfitinfo" items="${myFitInfolist}" varStatus="i">
                    		<th scope="col">${myfitinfo.FIT_INFO_NM}</th>
                    	</c:forEach>
                    </tr>
                  </thead>
                  <tbody>
		         	<tr>
                 		<c:forEach var="myfitinfo" items="${myFitInfolist}" varStatus="status">
                   			<th scope="col" id="myfit_${myfitinfo.FIT_INFO_IDX}">${myfitinfo.MEM_FIT_VAL}</th>
                 		</c:forEach>
                	</tr>
                	
                  </tbody>
                </table>
              </div>
                -->
              <!-- .product_banner_zone -->
              <div class="product_banner_zone">
				<a href="javascript:void(0);"><img src="<c:out value="${cdnDomain}" />${productBannerInfo.IMG_THUMBNAIL}" alt="${productBannerInfo.CMN_FLE_ALT_TXT}"></a>
			  </div>
              <!-- // .product_banner_zone -->
            </div><!-- //product_detail -->
            <div class="product_inform">
				<div class="pro_top">
	                <p class="logo"><c:out value="${productInfo.PRD_MST_BRAND_NM }" /></p>
	                <span class="tag"><c:out value="${productInfo.TAG_MST_TITLE }" /></span>
	                <div class="ico_share">
	                  <div class="count_list">
	                  	<button type="button" onclick="likeBtnEvent($(this), '${productInfo.PRD_MST_CD}', 'TYPE_PRODUCT')" 
	                  			class="like ${productInfo.MY_LIKE eq 'Y' ? 'on' : ''}"><c:out value="${productInfo.LIKE_COUNTS }" /></button>
	                  </div>
	                  
	                  <div class="share_box">
	                    <button type="button" class="sns_share" date-type="layer" date-id="pop_share" title="레이어 팝업 열림">
	                      <em class="blind">공유</em>
	                    </button>
	                  </div>
	                  
	                </div>
              	</div>

              <div class="title">
                <h2><c:out value="${productInfo.PRD_MST_NM }"/></h2>
                <span>(<c:out value="${productInfo.PRD_MST_CD }"/>)</span>
              </div>
              <div class="product_option ">
                <div class="price clearboth">
           
                  <p class="del"><fmt:formatNumber value="${PRC_MASTER }" type="currency" currencySymbol="￦" groupingUsed="true" /></p>
                  <strong class="sale">${PRC_PERCENT}%
                  <%-- <fmt:formatNumber value="${PRC_PERCENT}" type="percent" groupingUsed="false" />--%>
                  </strong>
                  
                  <c:choose>
                  	<c:when test = "${productInfo.PRD_MST_EMP_USE_YN eq 'Y'}">
                    	<em>
                    		<span>임직원 할인가</span>
                    		<strong>
                    		<fmt:formatNumber value="${PRC_DSICOUNT }" type="currency" currencySymbol="￦" groupingUsed="true" />
                    		</strong>
                    	</em>
                  	</c:when>
                  	<c:when test = "${productInfo.PRD_MST_EMP_USE_YN eq 'N'}">
                  		<em><fmt:formatNumber value="${PRC_DSICOUNT }" type="currency" currencySymbol="￦" groupingUsed="true" /></em>
                  		<p class="price_info">(임직원할인 제외상품)</p>
                  	</c:when>
                  	<c:when test = "${productInfo.PRD_MST_PRT_USE_YN eq 'Y'}">
                    	<em>
							<span>제휴사 할인가</span>
	                    	<strong>
	                    	<fmt:formatNumber value="${PRC_DSICOUNT }" type="currency" currencySymbol="￦" groupingUsed="true" />
	                    	</strong>
	                    </em>
                  	</c:when>
                  	<c:when test = "${productInfo.PRD_MST_PRT_USE_YN eq 'N'}">
						<em><fmt:formatNumber value="${PRC_DSICOUNT }" type="currency" currencySymbol="￦" groupingUsed="true" /></em>
                  		<p class="price_info">(제휴사할인 제외상품)</p>
                  	</c:when>
                  	<c:otherwise>
                  		<em><fmt:formatNumber value="${PRC_DSICOUNT }" type="currency" currencySymbol="￦" groupingUsed="true" /></em>	
                  	</c:otherwise>
                  </c:choose>
                  
                  	<!-- 
					<c:choose>
				         <c:when test = "${productInfo.PRD_MST_EMP_USE_YN eq 'Y'}">
		                	<div class="sale_price">
		                    	<p class="del"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></p>
		                    	<strong class="sale">70%</strong>
		                    	<em>
		                    		<span>임직원 할인가</span>
		                    		<strong>
		                    		<fmt:formatNumber value="${productInfo.PRD_MST_EMP_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" />
		                    		</strong>
		                    	</em>
		                  	</div>
				         </c:when>
				         <c:when test = "${productInfo.PRD_MST_EMP_USE_YN eq 'N'}">
                    		<p class="price_info">(임직원할인 제외상품)</p>
				         </c:when>
				         <c:when test = "${productInfo.PRD_MST_PRT_USE_YN eq 'Y'}">
                  			<div class="sale_price">
                    			<p class="del"><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></p>
                    			<strong class="sale">70%</strong>
		                    	<em>
		                    		<span>제휴사 할인가</span>
		                    		<strong>
		                    		<fmt:formatNumber value="${productInfo.PRD_MST_PRT_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" />
		                    		</strong>
		                    	</em>
                  			</div>
				         </c:when>
				         <c:when test = "${productInfo.PRD_MST_PRT_USE_YN eq 'N'}">
                    		<p class="price_info">(제휴사할인 제외상품)</p>
				         </c:when>
				         <c:otherwise>

				         </c:otherwise>
				      </c:choose>
					-->
                </div>
   
                
                
                <div class="benefit">
                  <ul>
					<c:forEach var="benefitItems" items="${benefitList}" varStatus="status">
                   		<li>
                   			<span>추가혜택</span>
                      		<c:forEach var="benefitItemsDetail" items="${benefitItems.detailList}" varStatus="status">
                      			${benefitItemsDetail.BNF_DTL_NM}
                      		</c:forEach>
                      		
                      		<button class="btn_arrow">자세히</button>
                    	</li>
	                </c:forEach>
                   	<li>
                      <span>적립금</span>440원 (1%)
                    </li>
					<c:if test="${not empty couponInfo}">
	                    <li>
	                      <span>쿠폰혜택</span>${couponInfo.CPN_MST_TITLE}
	                      <button class="btn_arrow">쿠폰모두받기</button>
	                    </li>
					</c:if>

                   <li>
                      <span>배송비</span> 30,000원 이상 무료배송
                      <!-- <div class="tooltip-area">
                        <button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
                        TOOLTIP
                        <div class="tooltip-layer left top">
                          <div class="tooltip-con">
                            <div class="list">
                              <ul>
                                <li>배송 정책에 따른 배송정보 값 출력</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        //TOOLTIP
                      </div> -->
                    </li>
                  </ul>
                </div>
                
          
             
                <div class="slt_option">
                
   
              		<c:if test="${productInfo.PRD_MST_TYPE eq 'B'}">
            			<h3>상품선택</h3>
						<div class="option">
						<span class="select">
							<select id="bundle_prd_sel" title="상품선택">
	                      		<option selected="selected" value="">상품선택</option>
	                      		
	                      		<c:forEach var="productgroup" items="${productGroupInfoList}" varStatus="status">
	                      			<option value="${status.count}">${productgroup.productGroupInfo.PRD_MST_NM}</option>
	                      		</c:forEach>
							</select>
						</span>
						</div>
					</c:if>
				
				    <c:choose>
				         <c:when test = "${productInfo.PRD_MST_TYPE eq 'S' or productInfo.PRD_MST_TYPE eq 'B'}">
							
							
							<c:set var="g_color_index" value="0"/>
							<c:set var="g_size_index" value="0"/>
							
							<c:forEach var="productgroup" items="${productGroupInfoList}" varStatus="status">
		
								<div class="option_wrapper" data-seq="${status.count}">
				                  <h3>세트상품 ${status.count} - 옵션선택</h3>
				                  <input type="hidden" class="product_code" value="${productgroup.productGroupInfo.PRD_MST_CD}">
				                  <input type="hidden" class="product_name" value="${productgroup.productGroupInfo.PRD_MST_NM}">
				                  <input type="hidden" class="product_price" value="${productgroup.productGroupInfo.PRD_NOW_DST_PRICE}">
				                  <div class="color_pick">
				                    <ul>
				                    	<c:if test="${not empty productgroup.mustOptionList}">
				                    		
				                    		<c:set var="color_index" value="0"/>
				                    		<c:forEach var="iteminfo" items="${productgroup.mustOptionList }" varStatus="instatus">
				                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'C'}">
				                    			
				                    				<c:set var="color_index" value="${color_index + 1 }"/>
				                    				<c:set var="g_color_index" value="${g_color_index + 1 }"/>
				                    				
							                     	<li class="${color_index eq 1 ? 'atv' : ''}">
							                        <input type="radio" id="color-${g_color_index}" name="color${status.count}">
							                        <label for="color-${g_color_index}">
							                          	<span class="color" data-color="${iteminfo.COLOR_IDX}" style="background-color:<c:out value='${iteminfo.COLOR_VALUE }' />"><c:out value="${iteminfo.COLOR_CODE }" /></span>
							                        </label>
						                      		</li>
						                      	
				                    			</c:if>
	
				                      		</c:forEach>
				                      	</c:if>

				                    </ul>
				                  </div>
			                  
				                  <div class="size">
				                   
			                   		<c:if test="${not empty productgroup.mustSizeList}">
			                    		
			                    		<c:forEach var="entry" items="${productgroup.mustSizeList }" varStatus="entstatus">
				                    		<c:set var="close_ul" value="N"/>
				                    		<c:forEach var="iteminfo" items="${entry.value }" varStatus="instatus">
	
			                    				<c:set var="g_size_index" value="${g_size_index + 1 }"/>
			                    				
		                  						<c:if test="${instatus.index % 4 eq 0}">
			                    					<c:set var="close_ul" value="N"/>
			                    					<ul class="color-wrapper-cls color-wrapper-${status.count}-${entry.key}">
			                    				</c:if>

			                    				<li>
			                    					<input type="radio" value="${iteminfo.SIZE_IDX}" id="size-${g_size_index}" name="size-${status.count}-${entry.key}" ${instatus.index eq 0 ? 'checked' : ''}>
			                    					<label for="size-${g_size_index}">${iteminfo.SIZE_NM}</label>
			                    				</li>
	
			                    				<c:if test="${instatus.index % 4 eq 3}">
			                    					<c:set var="close_ul" value="Y"/>
			                    					</ul>
			                    				</c:if>	
		
				                      		</c:forEach>
				                      		
				                      		<c:if test="${close_ul ne 'Y'}">
				                   				</ul>
				                   			</c:if>
			                    		</c:forEach>

			                   		</c:if>
			                   		
			                   		
			                   <c:if test="${not empty defalutSizeList}">
		                   			<c:set var="size_index" value="-1"/>
		                   			
		                   			<c:forEach var="entry" items="${defalutSizeList }" varStatus="status">
		                   			
		                   				<c:set var="close_ul" value="N"/>
		                   				
		                   				<c:forEach var="entryValues" items="${entry.value }" varStatus="instatus">
		                   				
                  						<c:if test="${instatus.index % 4 eq 0}">
	                    					<c:set var="close_ul" value="N"/>
	                    					<ul class="color-wrapper-cls color-wrapper-${entry.key}">
	                    				</c:if>
				                    				
		                   				<c:set var="size_index" value="${size_index + 1 }"/>
	                    				<li>
	                    					<input type="radio" class="size-radio" value="${entryValues.SIZE_IDX}" id="size-${size_index}" name="size-${entry.key}" ${instatus.index eq 0 ? 'checked' : ''} test="${entryValues.OPT_STK_CNT}" <c:if test="${entryValues.OPT_STK_CNT <= 0}">disabled="disabled"</c:if>>
	                    					<label for="size-${size_index}">${entryValues.SIZE_NM}</label>
	                    				</li>
	                    				
	                    				<c:if test="${instatus.index % 4 eq 3}">
	                    					<c:set var="close_ul" value="Y"/>
	                    					</ul>
	                    				</c:if>	
		                   				</c:forEach>
		                   				
				                   		<c:if test="${close_ul ne 'Y'}">
			                   				</ul>
			                   			</c:if>
			                   			
		                   			</c:forEach>
		                   		</c:if>
		                   		
		                   		

				                  <button class="btn_small" onclick="javascript:goReInput('<c:out value="${productInfo.PRD_MST_CD }" />,<c:out value="${commandMap.PRD_CTG_IDX }" />');">재입고 알림</button>
				                  </div>
	                  				
	                  			 <div class="option">
				                    <span class="select">
				                      <select class="sel_option" title="옵션선택">
				                      		<option value="">옵션선택</option>
						                  	<c:choose>
							                  	<c:when test = "${fn:length(productgroup.addOptionList) eq 0}">
							                  		<option value="">선택안함</option>
							                  	</c:when>
							                  	<c:otherwise>
							                  		<c:forEach var="iteminfo" items="${productgroup.addOptionList }" varStatus="status">
						                      			<option value="${iteminfo.PRD_OPT_IDX }">${iteminfo.PRD_OPT_NM }</option>
						                        	</c:forEach>
							                  	</c:otherwise>
						                  	</c:choose>
				                      </select>
				                    </span>
				                  </div>
			                  
				                 </div>
							</c:forEach>

				         </c:when>
				         <c:otherwise>
				         	<div class="option_wrapper" data-seq="1">
			                  <h3>옵션선택</h3>
			                  <input type="hidden" class="product_code" value="${productInfo.PRD_MST_CD}">
				              <input type="hidden" class="product_name" value="${productInfo.PRD_MST_NM}">
				              <input type="hidden" class="product_price" value="${productInfo.PRD_NOW_DST_PRICE}">
				                  
			                  <div class="color_pick">
			                    <ul>
			                    	<c:if test="${not empty defalutOptionList}">
			                    		
			                    		<c:set var="color_index" value="0"/>
			                    	
			                    		<c:forEach var="iteminfo" items="${defalutOptionList }" varStatus="status">
			                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'C'}">
			                    				<c:set var="color_index" value="${color_index + 1 }"/>
						                     	<li class="${color_index eq 1 ? 'atv' : ''}">
						                        <input type="radio" id="color-${color_index}" name="color">
						                        <label for="color-${color_index}">
						                          	<span class="color" data-color="${iteminfo.COLOR_IDX}" style="background-color:<c:out value='${iteminfo.COLOR_VALUE }' />"><c:out value="${iteminfo.COLOR_CODE }" /></span>
						                        </label>
					                      		</li>
			                    			</c:if>
			                      		</c:forEach>
			                      	</c:if>
			                    </ul>
			                  </div>
			                  <div class="size">
		                   		<c:if test="${not empty defalutSizeList}">
		                   			<c:set var="size_index" value="-1"/>
		                   			
		                   			<c:forEach var="entry" items="${defalutSizeList }" varStatus="status">
		                   			
		                   				<c:set var="close_ul" value="N"/>
		                   				
		                   				<c:forEach var="entryValues" items="${entry.value }" varStatus="instatus">
		                   				
                  						<c:if test="${instatus.index % 4 eq 0}">
	                    					<c:set var="close_ul" value="N"/>
	                    					<ul class="color-wrapper-cls color-wrapper-1-${entry.key}">
	                    				</c:if>
				                    				
		                   				<c:set var="size_index" value="${size_index + 1 }"/>
	                    				<li>
	                    					<input type="radio" class="size-radio" value="${entryValues.SIZE_IDX}" id="size-${size_index}" name="size-${entry.key}" ${instatus.index eq 0 ? 'checked' : ''} <c:if test="${entryValues.OPT_STK_CNT <= 0}">disabled="disabled"</c:if>>
	                    					<label for="size-${size_index}">${entryValues.SIZE_NM}</label>
	                    				</li>
	                    				
	                    				<c:if test="${instatus.index % 4 eq 3}">
	                    					<c:set var="close_ul" value="Y"/>
	                    					</ul>
	                    				</c:if>	
		                   				</c:forEach>
		                   				
				                   		<c:if test="${close_ul ne 'Y'}">
			                   				</ul>
			                   			</c:if>
			                   			
		                   			</c:forEach>
		                   		</c:if>
			                   <button class="btn_small" onclick="javascript:goReInput('<c:out value="${productInfo.PRD_MST_CD }" />,<c:out value="${commandMap.PRD_CTG_IDX }" />');">재입고 알림</button>
			                  </div>
                  
			                  <div class="option">
			                    <span class="select">
			                      <select class="sel_option" title="옵션선택">
			                      		<option value="">옵션선택</option>
					                  	<c:choose>
						                  	<c:when test = "${fn:length(addOptionList) eq 0}">
						                  		<option value="">선택안함</option>
						                  	</c:when>
						                  	<c:otherwise>
						                  		<c:forEach var="iteminfo" items="${addOptionList }" varStatus="status">
					                      			<option value="${iteminfo.PRD_OPT_IDX }">${iteminfo.PRD_OPT_NM }</option>
					                        	</c:forEach>
						                  	</c:otherwise>
					                  	</c:choose>
			                      </select>
			                    </span>
			                  </div>
                  			
                  			</div>
				         </c:otherwise>
				     </c:choose>
				 
                  <div class="pick_set">                    
                    <div class="pickup_btn">
                      <ul>
                        <li><a href="#n"  class="on">택배</a></li>
                        <li><a href="#n">매장픽업</a></li>
                      </ul>
                    </div>
                    <div class="pickup_info_wp">
                      <div class="pickup_info">
                        <p class="txt">픽업하실 매장과 일정을 선택하세요.</p>
                        <button class="btn_small" data-type="layer" date-id="layer_store">매장선택</button>
                      </div>
                      <div class="pickup_info_list">
                        <dl>
                          <dt>픽업매장</dt>
                          <dd>VIKI 봉담점<br>경기도 화성시 봉담읍 삼천병마로 1047-2</dd>
                        </dl>
                        <dl>
                          <dt>연락처</dt>
                          <dd>023-143-1580</dd>
                        </dl>
                        <dl>
                          <dt>영업시간</dt>
                          <dd>12:00 ~ 21:30</dd>
                        </dl>
                        <dl>
                          <dt>픽업예정일</dt>
                          <dd>2019-08-26, 13:00 ~ 13:30</dd>
                        </dl>
                        <a href="#n" class="btn_pick_change">픽업정보변경</a>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="total_price clearboth">
                  <span class="tit">총합계</span>
                  <strong class="price">￦0</strong>
                </div>
                <div class="btn_wrap">
                  <button id="add_bucket_btn" class="btn_large">장바구니</button>
                  <button class="btn_large ok" id="instantBuyItem">바로구매</button>
                  <!--  
                  <button class="btn_large w100p btn_black">임직원 구매</button>
                  <button class="btn_large w100p btn_black">제휴사 구매</button>
                  -->
                </div>
              </div>
            </div><!-- //product_inform -->
          </div><!-- // product_inner -->
          <div class="product_review">
            <h4 class="tit_review" >리뷰 <span id="total_review_count">(${productReputation.REP_CNT })</span></h4>
            <div class="point_wp">
              <ul class="clearboth">
                <li>
                  <p class="tit">기본적립 포인트</p>
                  <div class="pbx">
                    <strong class="point"><span>500</span>P</strong>
                    <p class="desc">일반리뷰 작성 시<br>500포인트 지급</p>
                  </div>
                  <div class="pbx">
                    <strong class="point"><span>1,000</span>P</strong>
                    <p class="desc">포토리뷰 작성 시<br>1,000포인트 지급</p>
                  </div>
                </li>
                <li>
                  <p class="tit">추가적립 포인트</p>
                  <div class="pbx">
                    <strong class="point"><span>200</span>P</strong>
                    <p class="desc">선착순 3번째 작성 시<br>200포인트 지급</p>
                  </div>
                  <div class="pbx">
                    <strong class="point"><span>10,000</span>P</strong>
                    <p class="desc">베스트리뷰 선정 시<br>10,000포인트 지급</p>
                  </div>
                </li>
              </ul>
              <a href="javascript:void(0);" class="btn_review review-popup" data-mem="${commandMap.MEM_MST_MEM_ID}">리뷰작성</a>
            </div>
            <div class="rating_wp">
              <dl class="rbx">
                <dt>사이즈</dt>
                <dd>정사이즈예요 <strong class="per">${productReputation.SIZE_RATE }%</strong></dd>
              </dl>
              <dl class="rbx">
                <dt>컬러</dt>
                <dd>화면과 같아요 <strong class="per">${productReputation.COLOR_RATE }%</strong></dd>
              </dl>
              <dl class="rbx">
                <dt>요약</dt>
                <dd>
                	<fmt:parseNumber var="rep_point_num" value="${productReputation.REP_POINT}" integerOnly="true"></fmt:parseNumber>
                  <strong class="point_score rate_0${rep_point_num }">${productReputation.REP_POINT }점</strong>
                </dd>
              </dl>
            </div>
            
            <c:if test="${not empty productPhotoRevList}">
            
	            <div class="photo_riview">
	              <p class="pro_detail_tit">포토리뷰 모아보기</p>
	              <div class="gallery_slide">
	                <div class="swiper-container photo_review_thumbs">
	                  <div id="photo_review_list" class="swiper-wrapper">
                  		<c:forEach var="photoReviewRow" items="${productPhotoRevList }" varStatus="i">
                    		<div class="swiper-slide photoreview-popup" data-id="${photoReviewRow.PRD_REV_IDX}">
                    			<img src="<c:out value="${cdnDomain}" />${photoReviewRow.FILENM}" alt="${photoReviewRow.CMM_FLE_ATT_EXT}">
                    		</div>
                    	</c:forEach>
	                  </div>
	                  <div class="swiper-button-next"></div>
	                  <div class="swiper-button-prev"></div>
	                </div>
	              </div>
	            </div>
            
            </c:if>

            <div class="all_review_wp">
              <p class="pro_detail_tit">전체리뷰</p>
              <div class="my_review_chk">
              	<c:if test="${not empty commandMap.MEM_MST_MEM_ID}">
	                <input name="myRevButton" type="checkbox" id="my_review" >
	                <label for="my_review"><span class="icon"></span>내가 등록한 리뷰</label>
                </c:if>
              </div>
              <ul class="all_review_list">
              </ul>
              <div class="pagination" id="review_paging">
              </div>
            </div>
            
            <div class="tab_wrap anchor">
              
              <ul class="tab n3">
                <li class="on"><a href="javascript:;" class="moveTab" data-value="1">상품상세</a></li>
                <li><a href="javascript:;" class="moveTab" data-value="2">교환/반품</a></li>
                <li><a href="javascript:;" class="moveTab" data-value="3">문의</a></li>
              </ul>
              
              <script>
				$(".moveTab").on("click", function(){
					var seq = $(this).data("value");
					var offset = $("#tab_scroll_0" + seq).offset();
					offset.top = offset.top - 300;
					$('html, body').animate({scrollTop : offset.top}, 400);
					
					$(".tab.n3").find("li").removeClass("on");
					$(this).parent().addClass("on");
				});
				
				/* $("ul > li").click(function () {
					$(this).toggleClass("on");
				}); */
			</script>

              
              <div class="tab_cont" id="tab_scroll_01">
                <div >
                   ${productInfo.PRD_MST_PC_DTL_DSC }
                </div>
                <p class="pro_detail_tit mt50">상품정보</p>
                <div class="table_wrap">
                  <table class="tb_row">
                    <caption>상품정보 : 제품소재, 색상, 치수, 제조자, 제조국, 시즌정보, 세탁방법 및 취급시 주의사항, 제조년원일, 품질보증기준, A/S 책임자와 전화번호, 수선불가 항목, 기타를 알 수 있는 표 입니다.</caption>
                    <colgroup>
                      <col style="width:20%">
                      <col style="width:auto">
                    </colgroup>
                    <tbody>
                    <c:forEach var="nfiInfo" items="${productNfiInfo}" varStatus="i">
                      <c:set var="tempName">PRD_MST_NFI_INF${i.index+1}</c:set>
                      <tr>
                        <th scope="row">${nfiInfo.PRD_NFI_INFO}</th>
                        <td><c:out value="${productInfo[tempName]}"/></td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                    </c:forEach>
                    <!-- 
                      <tr>
                        <th scope="row">제품소재</th>
                        <td>[겉 감] 폴리에스터 100%, [안 감] 폴리에스터 95%, [안 감] 폴리우레탄 5%</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">색상</th>
                        <td>PIP</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">치수</th>
                        <td>FRE</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">제조자</th>
                        <td>(주)신원</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">제조국</th>
                        <td>한국</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">시즌정보</th>
                        <td>F/W</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">세탁방법 및 취급시 주의사항</th>
                        <td>본 상품은 반드시 드라이크리닝 해주시기 바랍니다. (세탁 케어라벨 참조)</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">제조년원일</th>
                        <td>2019년 9월</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">품질보증기준</th>
                        <td>제품 이상 시 송정거래위원회 고시 소비자분쟁해결기준에 의거 보상합니다.</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">A/S 책임자와 전화번호</th>
                        <td>(주)신원 1661-2585</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">수선불가 항목</th>
                        <td>※ 소매기장 / 총장 / 밑단 수선등 디자인 변경불가 (리폼 불가)</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>
                      <tr>
                        <th scope="row">기타</th>
                        <td>※ 적용된 모든 엑세서리는 코디용 아이템 입니다.</td>
                        <%-- <c:out value="${productNfiInfo.PRD_NFI_INFO }" /> --%>
                      </tr>-->
                    </tbody>
                  </table>
                </div>
                <div class="div_col02 clearboth">

                  <div class="together_goods_view_area">
                    <p class="pro_detail_tit">함게 본 상품</p>
                    <ul class="clearboth">
                    	<c:forEach var="tfInfo" items="${togetherProductList}" varStatus="i">
                    		<li><a href="/pc/product/productView.do?PRD_CTG_IDX=${tfInfo.PRD_CTG_IDX }&PRD_MST_CD=${tfInfo.PRD_MST_CD }">
                    			<img src="${cdnDomain}${tfInfo.PRD_IMAGE}" alt="${tfInfo.PRD_IMAGE_ALT}">
                    			</a>
                    		</li>
                    	</c:forEach>
                    </ul>
                  </div>

                  <div class="together_goods_match_area">
                    <p class="pro_detail_tit">함께 매치하기 좋은 상품</p>
                    <ul class="clearboth">
                    	<c:if test="${not empty productInfo.PRD_MST_RLT_CD1 }">
                    		<li><a href="/pc/product/productView.do?PRD_CTG_IDX=${productInfo.PRD_MST_RLT_CAT1 }&PRD_MST_CD=${productInfo.PRD_MST_RLT_CD1 }">
                    			<img src="${cdnDomain}${productInfo.RLT_PRD_IMAGE1}" alt="${productInfo.RLT_PRD_IMAGE_ALT1}">
                    			</a>
                    		</li>
                    	</c:if>
                    	<c:if test="${not empty productInfo.PRD_MST_RLT_CD2 }">
                    		<li><a href="/pc/product/productView.do?PRD_CTG_IDX=${productInfo.PRD_MST_RLT_CAT2 }&PRD_MST_CD=${productInfo.PRD_MST_RLT_CD2 }">
                    			<img src="${cdnDomain}${productInfo.RLT_PRD_IMAGE2}" alt="${productInfo.RLT_PRD_IMAGE_ALT2}">
                    			</a>
                    		</li>
                    	</c:if>
                    	<c:if test="${not empty productInfo.PRD_MST_RLT_CD3 }">
                    		<li><a href="/pc/product/productView.do?PRD_CTG_IDX=${productInfo.PRD_MST_RLT_CAT3 }&PRD_MST_CD=${productInfo.PRD_MST_RLT_CD3 }">
                    			<img src="${cdnDomain}${productInfo.RLT_PRD_IMAGE3}" alt="${productInfo.RLT_PRD_IMAGE_ALT3}">
                    			</a>
                    		</li>
                    	</c:if>
      
                    </ul>
                  </div>
                </div>
              </div>
              <div class="tab_cont" id="tab_scroll_02">
                <p class="pro_detail_tit">교환/반품 안내</p>
                <div class="table_wrap">
                  <table class="tb_row">
                    <caption>펀딩 상품정보 : 제품소재, 색상, 치수, 제조자, 제조국, 세탁방법 및 취급시 주의사항, 제조년원일, 품질보증기준, A/S 책임자와 전화번호, 수선불가 항목, 기타를 알 수 있는 표 입니다.</caption>
                    <colgroup>
                      <col style="width:20%">
                      <col style="width:auto">
                    </colgroup>
                    <tbody>
                      <tr>
                        <th scope="row">교환 및 반품이 가능한 경우</th>
                        <td>
                          <ul class="bullet_tbl_minus">
                            <li>상품을 공급 받으신 날로부터 7일이내 단, 고객님의 임의수선등의 상품훼손으로 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.</li>
                            <li>공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된 경우에 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내</li>
                          </ul>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">교환 및 반품이 불가능한 경우</th>
                        <td>
                          <ul class="bullet_tbl_minus">
                            <li>고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외 </li>
                            <li>고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (수선등).</li>
                            <li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</li>
                            <li>복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)</li>
                          </ul>
                          <p class="bullet_dangu">고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담 하셔야 합니다. (색상 교환, 사이즈 교환 등 포함)</p>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="tab_cont" id="tab_scroll_03">
                <div class="pro_detail_tit_wp clearboth">
					<c:if test="${not empty commandMap.MEM_MST_MEM_ID}">
                  		<input type="checkbox" id="check-2">
                  		<label for="check-2" class="mr15"><span class="icon"></span>내가 등록한 문의</label>
                  	</c:if>
                    <button type="button" class="btn_cont deep_puple inquiry_popup fr" data-mem="${commandMap.MEM_MST_MEM_ID}">문의하기</button>
                </div>
                <ul class="qna_replay_acc_list">
                </ul>
                <div class="pagination" id="qna_paging">
              	</div>
              </div>
            </div>
          </div><!-- //product_review -->
        </div>
      
				
		
      	<!-- ******************* MY FIT POPUP *************************-->
		<%@ include file="/WEB-INF/jsp/pc/product/myfitPopup.jsp" %>

      	<!-- ******************* STORE POPUP *************************-->
		<%@ include file="/WEB-INF/jsp/pc/product/storePopup.jsp" %>
	
      	<!-- ******************* REVIEW POPUP *************************-->
		<%@ include file="/WEB-INF/jsp/pc/product/reviewPopup.jsp" %>	
		
		<!-- ******************* INQUIRYPOPUP ******************* -->
		<%@ include file="/WEB-INF/jsp/pc/product/inquiryPopup.jsp" %>
		
		<!-- ******************* PHOTO REVIEW POPUP *************************-->
		<%@ include file="/WEB-INF/jsp/pc/product/photoReviewPopup.jsp" %>
		
		<!-- ******************* PHOTO REVIEW POPUP *************************-->
		<%@ include file="/WEB-INF/jsp/pc/product/videoPopup.jsp" %>
		
		<!-- ******************* SNS 공유하기 *************************-->
		<%@ include file="/WEB-INF/jsp/pc/common/share.jsp" %>
		
      </div>
    </div>
  </div>
  <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script>

	
	function fn_paging(curPage) {
		location.href = "/board/boardList.do?curPage=" + curPage;
	}

	$(function(){
	    $('input').on('click',function(){
	      var li = $(this).parents('li');
	      li.addClass('atv').siblings().removeClass('atv');
	    });
	  });
	
	var reviewListRender = function(response){
		console.log(response);
	}
	
	
	$(document).ready(function(){
		var title = $('.title').text().trim();
		var image = $($('.productImage')[0]).attr('src');
		var tagArray = $('.tag');
		var description = $('.logo').text().trim();
		for(var i=0;i<tagArray.length;i++){
			description += ' ' + $(tagArray[i]).text().trim();
		}
		setKakaoData(title,description,image);
	});
	
	// 상품수량 증가
	$(document).on("click","#upPrdMstCnt",function(){
		var prdMstSelCnt = $("#PRD_MST_SEL_CNT").val();	//상품재고
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
	
		if(parseInt(prdMstSelCnt) < parseInt(buyPrdCnt) + 1){
			alert("해당 상품 재고["+prdMstSelCnt+"] 입니다.");
		}else{
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) + 1);	//수량 증가
		}
		
		setTotalPrice();
	});
	
	//재입고알림
	goReInput = function(prdCd,prdCtx){
		var con_ReInput = confirm("재입고알림 요청 하시겠습니까?.");	
		if(con_ReInput == true){
			$.ajax({
				type: "get",
				url: "<c:out value="${serverDomain}"/>/pc/mypage/reInputAjax.do",
				data: {"PRD_MST_CD": prdCd ,"PRD_CTG_IDX":prdCtx},
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
				      	alert("재입고알림 요청 하였습니다");
						document.location.reload(true);
					}
				},
				error : function (err)
				{
			      	alert("오류가 발생하였습니다.\n[" + err.status + "]");
				}
			});		
		}
	};

	// 상품수량 감소
	$(document).on("click","#dnPrdMstCnt",function(){
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
	
		if(parseInt(buyPrdCnt) - 1 < 1){
			alert("상품의 최하 수량은 1 입니다.");
			$("#REQUEST_CNT_0").val(1);
		}else{
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) - 1);	//수량 감소
		}
		
		setTotalPrice();
	});
	
	//리뷰작성
	goProductRevWrite = function(){
    	var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
		if(memId == ""){
			var url = "<c:out value="${frontDomain}"/>/pc/mypage/myWritableProductCommentList.do";
			url = encodeURIComponent(url);
        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
        	return;
		}else{
			$("#cartForm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myWritableProductCommentList.do", "target":"_self", "method":"post"}).submit();
		}
    };
    
  	//내가 등록한 리뷰 클릭시 로그인여부
  	$("span[name='myRevButton']").on("click", function(){
	if(searchQnaMemId == "Y"){
		var memId = "<c:out value="${commandMap.MEM_CRT_SES_ID}" />";
		if(memId == ""){
			var url = location.href;
			url = encodeURIComponent(url);
        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
        	return;
			}
		}
  	})
  	


  	/**********************  PAGING PROCESS **********************/
	var pageFirstHTML = '';
	pageFirstHTML += '<span class="img_arrow first page-cls" data-page="{value}">';
	pageFirstHTML += '	<em class="blind">첫 페이지로 이동</em>';
	pageFirstHTML += '</span>';
  	var pagePrevHTML = '';
  	pagePrevHTML += '<span class="img_arrow prev page-cls" data-page="{value}">';
  	pagePrevHTML += '	<em class="blind">이전 페이지로 이동</em>';
  	pagePrevHTML += '</span>';
  	var pageNumHTML = '<a href="javascript:void(0);" class="num  page-cls {on}" data-page="{value}">{value}</a>';
	var pageLastHTML = '';
	pageLastHTML += '<span class="img_arrow next  page-cls" data-page="{value}">';
	pageLastHTML += '	<em class="blind">다음 페이지로 이동</em>';
	pageLastHTML += '</span>';
  	var pageNextHTML = '';
  	pageNextHTML += '<span class="img_arrow last  page-cls" data-page="{value}">';
  	pageNextHTML += '	<em class="blind">마지막 페이지로 이동</em>';
  	pageNextHTML += '</span>';	 
  	
    
	var doPaging = function(current, total){
		var list = [];
		var pageLimit = 10;
		var upperLimit, lowerLimit;
		var currentPage = lowerLimit = upperLimit = Math.min(current, total);

		for (var b = 1; b < pageLimit && b < total;) {
		    if (lowerLimit > 1 ) {
		        lowerLimit--; b++; 
		    }
		    if (b < pageLimit && upperLimit < total) {
		        upperLimit++; b++; 
		    }
		}

		for (var i = lowerLimit; i <= upperLimit; i++) {
			/*
		    if (i == currentPage){
		    	list.push("["+i+"]");
		    }
		    else{
		    	list.push(i);
		    }
			*/
		    list.push(i);
		}
		console.log(list);
		return list;
	}
	
	var renderPagination = function($pageElem, pTotCount, pPage, pCallback) {
		var totalPages = Math.ceil(pTotCount / 5);
		var pagination = doPaging(pPage, totalPages);
		$pageElem.empty();
		
		if(pPage > 1) {
			$pageElem.append( pageFirstHTML.replace(/{value}/ig, 1));
			$pageElem.append( pagePrevHTML.replace(/{value}/ig, pPage - 1));
		}
		
		for(var i = 0 ; i < pagination.length; i ++) {
			$pageElem.append( pageNumHTML.replace(/{value}/ig, pagination[i])
									.replace('{on}', pagination[i] == pPage ? 'on' : '')
							);
		}
		
		if(pPage < totalPages) {
			$pageElem.append( pageLastHTML.replace(/{value}/ig, totalPages));
			$pageElem.append( pageNextHTML.replace(/{value}/ig, pPage + 1));
		}
		
		$('.page-cls', $pageElem).off('click').on('click', function(){
			var curPage = $(this).attr('data-page');
			pCallback(curPage);
		});
	}
	
$( document ).ready(function() {
	var setPaymentData = function()
	{
		var data = setCartData();
		
		if(data){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : data,
	            url : "/pc/cart/insertDirectPurchaseAjax.do",
	            success : function (data) 
	            { 
	            	switch (data.result) {
	  					case 1:
	  						var f = document.createElement("form"); // form 엘리멘트 생성 
	  						f.setAttribute("method","post"); // method 속성을 post로 설정
	  						f.setAttribute("action","/pc/cart/cartpayment.do"); // submit했을 때 무슨 동작을 할 것인지 설정
	  						document.body.appendChild(f); // 현재 페이지에 form 엘리멘트 추가 

	  						var i = document.createElement("input"); // input 엘리멘트 생성 
	  						i.setAttribute("type","hidden"); // type 속성을 hidden으로 설정
	  						i.setAttribute("name","ORD_MST_CD"); // name 속성을 'm_nickname'으로 설정 
	  						i.setAttribute("value",data.ORD_MST_CD); // value 속성을 neilong에 담겨있는 값으로 설정 
	  						f.appendChild(i); // form 엘리멘트에 input 엘리멘트 추가 

	  						f.submit(); // form 태그 서브밋 실행

	  						
	  						//var url = "http://pc.marketplanta.epasscni.com/pc/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD;
	  						//var url = "/pc/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD;
	  						//url = encodeURIComponent(url);
	  			        	//window.open("http://pc.marketplanta.epasscni.com/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=http","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	  			        	//window.open("/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=http","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	  						
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
		}
	};
	
	
	/************** 장바구니 추가 *********************/
	var AddCartProcess = function(dataParam, pSuccessCB) {
       	$.ajax({
       		type	: "POST",
       		url		: "/pc/cart/insertCartAjax.do",
       		dataType: "json",
       		data	: dataParam,
       		success : function(data) {
       			console.log(data);
       			if(data.result == 1) {
       				pSuccessCB();
       			} else {
       				alert(data.resultMsg);
       			}
       		}, error : function(err) {
      			alert('something wrong');
       			console.log(err);
       		}
       	});
	}
	$('#instantBuyItem').on('click',setPaymentData);
	$('#add_bucket_btn').on('click', function(){
		AddCartProcess(setCartData(), function(){
			if (window.confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) { 
				location.href = "<c:out value="${frontDomain}"/>/pc/cart/cartlist.do";
			} else {
				alert('상품을 장바구니에 담았습니다.');
			}
			
		});
		
	});

	var setCartData = function(){
		
		var selParam = [];
		for(var i=0;i<SELECTED_PRD.length;i++){
			var obj = {};
			for (var prop in SELECTED_PRD[i]) {
				 obj[prop] = SELECTED_PRD[i][prop];
			}
			selParam.push(obj);
		}
		
		
		if(selParam.add_option_idx <= 0) {
			alert('옵션을 선택해주십시요.');
			return;
		}
		//if(!selParam){
		//	alert('선택한 상품이 없습니다.');
		//	return;
		//}
		
		var dataParam = { 
				MEM_CRT_DLV_GBN : 2096, 
				PRD_MST_O2O_YN : 'N',
				MEM_CRT_SLT_YN : 'N',
				PRODUCT : JSON.stringify(adaptParam(selParam)),
				PRD_MST_CD : $('#target_prd_code').val()
		};
		/*MEM_PRD_MST_CD : selParam.product_code,
				MEM_CRT_COLOR : selParam.color_code, 
				MEM_PRD_OPT_DTL_IDX : selParam.add_option,
				MEM_CRT_SIZE : selParam.size_code,
				MEM_CRT_CNT : selParam.product_count,
				*/
		return dataParam;
	}
	var adaptParam = function(selParam){
		var result = [];
		for(var index in selParam){
			var product = {};
			product.MEM_PRD_MST_CD = selParam[index].product_code;
			product.MEM_CRT_COLOR = selParam[index].color_code;
			product.MEM_PRD_OPT_DTL_IDX = selParam[index].add_option;
			product.MEM_CRT_SIZE = selParam[index].size_code;
			product.MEM_CRT_CNT = selParam[index].product_count;
			product.PRD_MST_TYPE = $(target_prd_type).val();
			product.PRD_MST_CD = '<c:out value="${productInfo.PRD_MST_CD }"/>';
			product.PRD_COLOR_VAL = selParam[index].color_label;
			product.PRD_SIZE_VAL = selParam[index].size_label;
			result.push(product);
		}
		return result;
	}
	var resetOptionUI = function() {
		//$( ".color_pick li" ).removeClass('atv');
		//$( ".color_pick li:first-child" ).addClass('atv');
		//$( ".size li" ).removeClass('atv');
		//$( ".size ul:first-child li:first-child" ).addClass('atv');
		//$(this).val('');
	};
	
	
	var getSelectedOptionData = function($pTargetElem){
		
		var selOptionData = {}
		
		var $selColElem= $('.color_pick .atv', $pTargetElem);
		if($selColElem.length > 0) {
			var $targetElem = $('span.color', $selColElem);
			var curColorInfo = $targetElem.attr('data-color');
			var curColorLabel = $targetElem.text();
			
			selOptionData['color_code'] = curColorInfo;
			selOptionData['color_label'] = curColorLabel;
		}
		
		var sizeWrapperID = 'color-wrapper-' + $pTargetElem.data('seq') + '-' + selOptionData['color_code'];
		
		var $sizeWrapperElem =  $('.' + sizeWrapperID, $pTargetElem);
		if($sizeWrapperElem.length > 0) {
			var $selSizeElem= $('li input:checked', $sizeWrapperElem);
			if($selSizeElem.length > 0) {
				var curSizeInfo = $selSizeElem.val();
				var curSizeLabel = $selSizeElem.parent().find('label').text().trim()

				selOptionData['size_code'] = curSizeInfo;
				selOptionData['size_label'] = curSizeLabel;
			}
		}

		
		return selOptionData;
	};
	
	var GetNumberFormat = function(pData){
	    if(pData==0) return 0;
  		 
   	    var reg = /(^[+-]?\d+)(\d{3})/;
   	    var n = (pData + '');
   	 
   	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
   	 
   	    return n;		
	}


	var SelItemHTML = '';
	SelItemHTML +='<li id="{id}">';
	SelItemHTML +='	<p class="tit">{title}</p>';
	SelItemHTML +='	<div class="b_slct">';
	SelItemHTML +='  	<button type="button" class="minus">-</button>';
	SelItemHTML +='  	<input type="text" value="1">';
	SelItemHTML +='  	<button type="button" class="plus">+</button>';
	SelItemHTML +='	</div>';
	SelItemHTML +='</li>';
		
	var TMP_ID_PREFIX = "SEL_TMP_";
	var TMP_ID_IDX = 0;
	var SELECTED_PRD = [];
	
	var CalculateAmount = function(){
		var curAmount = 0;
		for(var i=0;i<SELECTED_PRD.length;i++){
			curAmount += SELECTED_PRD[i].product_price * SELECTED_PRD[i].product_count;
		}
		
		
		$('.total_price .price').text('￦' + GetNumberFormat(curAmount * 1));
	}

    var RenderQuantityUI = function(pIndex){

    	var $pTargetElem = $('.option_wrapper[data-seq=' + pIndex + ']');
    	
    	if($pTargetElem.length > 0) {
    		var $curOptElem = $('.sel_option option:selected', $pTargetElem);
    		var curOptVal = $curOptElem.val();
    		var curSelectedIdx = $('.sel_option', $pTargetElem).prop('selectedIndex');
    		
    		var curOptTxt = curSelectedIdx <= 0 ? "" : $curOptElem.text();
    		var curInfo = getSelectedOptionData($pTargetElem);
    		var curPrdName = $('.product_name', $pTargetElem).val();
    		var curPrdCode = $('.product_code', $pTargetElem).val();
    		var curPrdPrice = $('.product_price', $pTargetElem).val();
    		//var curTmpID = TMP_ID_PREFIX + (++TMP_ID_IDX);
    		var curTmpID = TMP_ID_PREFIX + (pIndex);
    		var curTitle = curPrdName + "(" + curPrdCode + ")";
    		
    		if(curInfo.color_code) curTitle += " / " + curInfo.color_label;
    		if(curInfo.size_code) curTitle += " / " + curInfo.size_label;
    		
    		curTitle += " / " + curOptTxt;
    		
    		curInfo['product_code'] = curPrdCode;
    		curInfo['product_price'] = curPrdPrice;
    		curInfo['product_count'] = 1;
    		curInfo['add_option'] = curOptVal;
    		curInfo['add_option_idx'] = curSelectedIdx;
    		curInfo['id'] = curTmpID;
    		
    		
    		var filterData = SELECTED_PRD.filter(function(item){
    			return item.id == curTmpID;
    		});
    		if(filterData.length==0){
    			SELECTED_PRD.push(curInfo);
    		}
    		else{
    			SELECTED_PRD[SELECTED_PRD.indexOf(filterData[0])] = curInfo;
    		}
    		
    		var curHTML = SelItemHTML.replace('{id}', curTmpID)
    		.replace('{title}', curTitle);
    		
    		var $prevElem = $('.pick_set .quantity ul li[id="' + curTmpID + '"]');
    		
    		if($prevElem.length > 0) $prevElem.replaceWith(curHTML); 
    		else $('.pick_set .quantity ul').append(curHTML);
    		
    		CalculateAmount();
    		
    		$('.pick_set ul .b_slct button').off('click').on('click', function(){
    			var curID = $(this).closest('li').attr('id');
    			var $targetElem = $('input', $(this).closest('.b_slct'));
    			var product = SELECTED_PRD.filter(function(item){return item.id == curID})[0];
    			var curQuantity = product.product_count;
    			if($(this).hasClass('plus')) {
    				curQuantity++;
    			} else {
    				curQuantity--;
    				if(curQuantity < 0) curQuantity = 0;
    			}
    			product.product_count = curQuantity;
    			$targetElem.val(curQuantity);
    			
    			CalculateAmount();
    		});
     
    		//resetOptionUI();
    	}
    }
	
    var renderColorUI = function(pIndex){
    	var $pTargetElem = $('.option_wrapper[data-seq=' + pIndex + ']');
    	if($pTargetElem.length > 0) {
    		
    		var $selColElem= $('.color_pick .atv', $pTargetElem);
    		var curColorIdx
    		if($selColElem.length > 0) {
    			var $targetElem = $('span.color', $selColElem);
    			curColorIdx = $targetElem.attr('data-color');
    		}

    		$('.color-wrapper-cls', $pTargetElem).hide();
    		$('.color-wrapper-' + pIndex + '-' + curColorIdx, $pTargetElem).show();
    	}
    }
    
	$('.option_wrapper .sel_option').on('change', function(){
		var $wrapperElem = $(this).closest('.option_wrapper');
		RenderQuantityUI($wrapperElem.data('seq'));
	});
	
	//$("input:radio[name=size]").change(function() {
	//	var $wrapperElem = $(this).closest('.option_wrapper');
	//	RenderQuantityUI($wrapperElem.data('seq'));
	//});
	
	$('.size-radio').change(function(){
		var $wrapperElem = $(this).closest('.option_wrapper');
		RenderQuantityUI($wrapperElem.data('seq'));	
	});
	
	
	$("input:radio[name=color]").change(function() {
		var $wrapperElem = $(this).closest('.option_wrapper');
		RenderQuantityUI($wrapperElem.data('seq'));
		renderColorUI($wrapperElem.data('seq'))
	});
	
	
	if($('#target_prd_type').val() != 'B'){ //일반과 세트는 정해진 제품 무조건 구매해야함
		RenderQuantityUI(1);
		RenderQuantityUI(2);
		renderColorUI(1);
		renderColorUI(2);
	} else { //묶은은 원하는 상품 구매 가능
		$('.option_wrapper').hide();
		$('#bundle_prd_sel').on('change', function(){
			var selValue = $('#bundle_prd_sel option:selected').val();
			$('.option_wrapper').hide();
			$('.option_wrapper[data-seq='+ selValue + ']').show();
			if(selValue.length > 0) {
				RenderQuantityUI(selValue);
				renderColorUI(selValue);
			}
				
		});
	}


	
	$(document).on('click', 'ul.all_review_list .rv-delete', function(){
		var curRevID = $(this).attr('data-id');
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
	       		type	: "POST",
	       		url		: "/pc/product/productRevListAjax.do",
	       		dataType: "json",
	       		async: false,
	       		data	: {PRD_REV_IDX : curRevID},
	       		success : function(data) {
	       			location.href = '/pc/product/productView.do?PRD_CTG_IDX=' + $('#target_prd_ctg_idx').val() +'&PRD_MST_CD=' + $('#target_prd_code').val();
	       		}, error : function(err) {
	       			console.log(err);
	       		}
	       	});
		}
	});
	

	
	$('#my_review').on('change', function(){
		funcGetReviewList(1);	
	});
	funcGetReviewList(1);

	$('#check-2').on('change', function(){
		funcGetQnAList(1);
	});
	
	funcGetQnAList(1);
	
});

	/**********************  REVIEW PROCESS **********************/
	
	var renderPhotoReviewList = function(pData) {
		var $targetElem = $('#photo_review_list');
		var itemHTML = '<div class="swiper-slide"><img src="{image}" alt=""></div>';
		
		for(var i = 0 ; i < pData.length; i++) {
			var curHTML = itemHTML.replace('{image}', pData[i].FILE_NM);
			$targetElem.append(curHTML);	
		}
		
	};
	
	var funcGetPhotoReviewList = function(){
		var dataParam = { PRD_MST_CD : $('#target_prd_code').val()}
           	$.ajax({
           		type	: "POST",
           		url		: "/pc/product/productPhotoRevListAjax.do",
           		dataType: "json",
           		data	: dataParam,
           		success : function(data) {
           			renderPhotoReviewList(data);
           		}, error : function(err) {
           		}
           	});                			
	};
	
	
	var funcGetReviewList = function(pPage){
		
		$.ajax({
       		type	: "POST",
       		url		: "/pc/product/productRevListAjax.do",
       		dataType: "json",
       		data	: {PRD_MST_CD: $('#target_prd_code').val(), offset : pPage, IS_MY_REVIEW : $('#my_review').is(':checked') ? 'Y' : 'N'},
       		success : function(data) {
       			
       			renderReviewList(pPage, data);
       			
       		}, error : function(err) {
       			console.log(err);
       		}
       	});
	};
	
	
	var ReviewBestHTML = '<span class="best">BEST</span>';
	
	var ReviewImageItemHTML = '<li><img src="{image}" alt="{alt}"></li>';
	var ReviewImageMultHTML = '<li><a href="javascript:void(0);" class="img_more"><img src="{image}" alt="{alt}"><span>+{count}</span></a></li>'
	
	var ReviewImageHTML = '';
	ReviewImageHTML += '<ul class="user_imgList clearboth">';
	ReviewImageHTML += '{image_items}';
	ReviewImageHTML += '</ul>';
	
	var MyReviewHTML = '';
	MyReviewHTML += '<div class="btn_wrap">';
	MyReviewHTML += '	<button class="btn_small gray rv-delete" data-id="{id}">삭제</button>';
	MyReviewHTML += '	<button class="btn_small review-popup"  data-id="{id}">수정</button>';
	MyReviewHTML += '</div>';
	
	var ReviewItemHTML = "";
	ReviewItemHTML += '<li>';
	ReviewItemHTML += '	<div class="all_review_info_01 clearboth">';
	ReviewItemHTML += ' 		<span class="star_0{start_val}"></span>';
	ReviewItemHTML += '  		<strong>{id}</strong>';
	ReviewItemHTML += '  		<em>{date}</em>';
	ReviewItemHTML += '	</div>';
	ReviewItemHTML += '	<div class="all_review_info_02 clearboth">';
	ReviewItemHTML += '  		<dl>';
	ReviewItemHTML += '    		<dt>컬러 : </dt>';
	ReviewItemHTML += '    		<dd>{color_val}</dd>';
	ReviewItemHTML += '  		</dl>';
	ReviewItemHTML += '  		<dl>';
	ReviewItemHTML += '    		<dt>사이즈 : </dt>';
	ReviewItemHTML += '    		<dd>{size_val}</dd>';
	ReviewItemHTML += '  		</dl>';
	
	ReviewItemHTML += '{best_section}';
	
	ReviewItemHTML += '	</div>';
	
	ReviewItemHTML += '	<p class="review_txt">{text}</p>';
	
	ReviewItemHTML += '{image_section}';
	ReviewItemHTML += '{myreview_section}';
	ReviewItemHTML += '</li>';
		
	
	var ReviewImgBase = '<c:out value="${cdnDomain}" />';
	var renderReviewList = function(pPage, pData) {
		
		var $listElem = $('ul.all_review_list');
		$listElem.empty();
		
		for(var i = 0 ; i < pData.list.length; i ++) {
			var curData = pData.list[i];
			
			console.log(curData);
			var bestHTML = curData.PRD_REV_BST_YN == 'Y' ? ReviewBestHTML : '';
			
			var colorVal = '화면과 같아요';
			if (curData.PRD_REV_CLR == 'B') colorVal = '화면과 달라요';
			
			var sizeVal = '작아요';
			if (curData.PRD_REV_SIZE == 'B') colorVal = '정사이즈예요';
			else if (curData.PRD_REV_SIZE == 'C') colorVal = '커요';
			
			var imgHTML = '';
			var imgCount = curData.CMM_FLE_CNT * 1; 
			if( imgCount > 0) {
				var imgFullHTML = '';
				
				var maxImgCnt = imgCount > 2 ? 2 : imgCount;  
				for(var i = 0; i < maxImgCnt; i++) {
					var curImgData = curData.IMAGES[i];
					imgFullHTML += ReviewImageItemHTML.replace('{image}', ReviewImgBase + curImgData.FILENM)
														.replace('{alt}', curImgData.CMM_FLE_ATT_EXT);
				}
				
				if(imgCount > 3) {
					var curImgData = curData.IMAGES[2];
					imgFullHTML += ReviewImageMultHTML.replace('{image}', ReviewImgBase + curImgData.FILENM)
														.replace('{alt}', curImgData.CMM_FLE_ATT_EXT)
														.replace('{count}', imgCount - 3);
					
				} else if (imgCount == 3) {
					var curImgData = curData.IMAGES[2];
					imgFullHTML += ReviewImageItemHTML.replace('{image}', ReviewImgBase + curImgData.FILENM)
														.replace('{alt}', curImgData.CMM_FLE_ATT_EXT);					
				}
					
				imgHTML = ReviewImageHTML.replace('{image_items}', imgFullHTML);
			}
			
			var myrvHTML = '';
			if(curData.MY_REVIEW_YN == 'Y') {
				myrvHTML = MyReviewHTML.replace(/{id}/ig, curData.PRD_REV_IDX);
			}
			var curHTML = ReviewItemHTML.replace('{start_val}', curData.PRD_REV_STAR)
										.replace('{id}', curData.PRD_REV_REG_ID)
										.replace('{date}', curData.PRD_REV_REG_DT)
										.replace('{color_val}', colorVal)
										.replace('{size_val}', sizeVal)
										.replace('{text}', curData.PRD_REV_CONTENTS)
										
										.replace('{best_section}', bestHTML)
										.replace('{image_section}', imgHTML)
										.replace('{myreview_section}', myrvHTML);
			
			$listElem.append(curHTML);
		}
		
		var $pageElem = $('#review_paging');
		
		if(pData.tot_count > 0) {
			renderPagination($pageElem, pData.tot_count, pPage, function(curPage) {
				funcGetReviewList(curPage);	
			});
		}
	};



	/**********************  QnA PROCESS **********************/
	
	var qnaQuestionHTML = '';
	qnaQuestionHTML += '<dl class="q_text clearboth">';
	qnaQuestionHTML += '	<dt>Q</dt>';
	qnaQuestionHTML += '   	<dd>{contents}</dd>';
	qnaQuestionHTML += '</dl>';
  	
  	var qnaModHTML = '';
  	qnaModHTML += '<div class="btn_wrap clearboth">';
  	qnaModHTML += '	<button class="btn_small gray qna-delete" data-id="{id}">삭제</button>';
  	qnaModHTML += ' <button class="btn_small inquiry_popup" data-id="{id}">수정</button>';
  	qnaModHTML += '</div>';
  	
  	var qnaAnswerHTML = '';
  	qnaAnswerHTML += '<dl class="a_text clearboth">';
  	qnaAnswerHTML += '	<dt>A</dt>';
  	qnaAnswerHTML += '  		<dd>{contents}<span class="qna_replay_date">{date}</span></dd>';
  	qnaAnswerHTML += '</dl>';
	
	var qnaItemHTML = '';
	qnaItemHTML += '<li>';
	qnaItemHTML += '    <button type="button" class="clearboth" {disabled}>';
	qnaItemHTML += '		<p class="fl">';
	qnaItemHTML += '        	<span class="qna_replay_stat {ok}">{status}</span>';
	qnaItemHTML += '        	<span class="qna_subject {secret}">{title}</span>';
	qnaItemHTML += '      	</p>';
	qnaItemHTML += '      	<p class="fr">';
	qnaItemHTML += '        	<span class="qna_auth">{user}</span>';
	qnaItemHTML += '        	<span class="qna_w_date">{date}</span>';
	qnaItemHTML += '      	</p>';
	qnaItemHTML += '    </button>';
	qnaItemHTML += '    <div class="qna_repla_detail">';
	qnaItemHTML += '    {question_section}';
	qnaItemHTML += '    {mod_section}';
	qnaItemHTML += '    {answer_section}';
	qnaItemHTML += '    </div>';
	qnaItemHTML += '</li>';
	
	var renderQnAList = function(pPage, pData) {
		
		var $listElem = $('ul.qna_replay_acc_list');
		$listElem.empty();
		
		for(var i = 0 ; i < pData.list.length; i ++) {
			var curData = pData.list[i];
			
			var questionHTML = '';
			var modHTML = '';
			var answerHTML = '';
			var secretHTML = '';
			var disabledHTML = '';
			
			var statusCls = '';
			if(curData.BRD_INQ_REPLY_CD == 'Y') {
				statusCls = 'ok';
				answerHTML = qnaAnswerHTML.replace('{contents}', curData.BRD_INQ_REPLY_CONTENTS).replace('{date}', curData.BRD_INQ_REPLY_DT_2);
			}
			
			questionHTML = qnaQuestionHTML.replace('{contents}', curData.BRD_INQ_CONTENTS);
			
			if(curData.MY_QNA_YN == 'Y' && curData.BRD_INQ_REPLY_CD != 'Y') {
				modHTML = qnaModHTML.replace(/{id}/ig, curData.BRD_INQ_IDX);
			}
			
			if(curData.BRD_INQ_PUB_YN == 'N') {
				secretHTML = 'secret';
			}
			
			if(curData.BRD_INQ_PUB_YN != 'Y' && curData.MY_QNA_YN != 'Y') disabledHTML = 'disabled';
			
			console.log(curData);
				
			var curHTML = qnaItemHTML.replace('{status}', curData.BRD_INQ_REPLY_CD_NM)
										.replace('{ok}', statusCls)
										.replace('{title}', curData.BRD_INQ_TITLE)
										.replace('{user}', curData.BRD_INQ_REG_ID)
										.replace('{date}', curData.BRD_INQ_REG_DT_2)
										
										.replace('{question_section}', questionHTML)
										
										.replace('{mod_section}', modHTML)
										.replace('{answer_section}', answerHTML)
										.replace('{disabled}', disabledHTML)
										
										.replace(/{secret}/ig, secretHTML);
			
			
			$listElem.append(curHTML);
		}
		
		
		var $pageElem = $('#qna_paging');
		
		renderPagination($pageElem, pData.totCount, pPage, function(curPage) {
			funcGetQnAList(curPage);
		});
		
	    $('li button', $listElem).on('click', function(){
	        var childDiv = $(this).siblings('.qna_repla_detail');
	        if (childDiv.is(':visible')) {
	            childDiv.slideUp(300);
	        } else {
	            childDiv.slideDown(300);
	        }
	    });

	};
	
	$(document).on('click', 'ul.qna_replay_acc_list .qna-delete', function(){
		var curInqID = $(this).attr('data-id');
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
	       		type	: "POST",
	       		url		: "/pc/product/productQnaDeleteAjax.do",
	       		dataType: "json",
	       		async: false,
	       		data	: {brdInqIdx : curInqID},
	       		success : function(data) {
	       			alert('삭제 완료했습니다.')
	       			funcGetQnAList(1);
	       		}, error : function(err) {
	       			console.log(err);
	       		}
	       	});
		}
	});
	
	var funcGetQnAList = function(pPage){
		var dataParam = { PRD_MST_CD : $('#target_prd_code').val(), offset : pPage, searchQnaMemId : $('#check-2').is(':checked') ? 'Y' : 'N'}
	
       	$.ajax({
       		type	: "POST",
       		url		: "/pc/product/productQnaListAjax.do",
       		dataType: "json",
       		data	: dataParam,
       		success : function(data) {
       			renderQnAList(pPage, data);
       		}, error : function(err) {
       		}
       	});
	};
	
	
	
	
</script>