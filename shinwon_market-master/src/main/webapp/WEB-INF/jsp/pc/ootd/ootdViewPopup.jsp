<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div class="sub_content">
                <!-- layer -->
                <div id="layer_img_detail" class="layer pro_detail">
                    <div class="layer_content">
                        <!-- Swiper -->
                        <div class="gallery_wp">
                            <div class="swiper-container gallery-top">
                                <div class="swiper-wrapper">
                                    <c:if test="${not empty fileList}">
									<c:forEach var="imgrow" items="${fileList }" varStatus="status">
										<div class="swiper-slide"><img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"></div>
									</c:forEach>
								</c:if>
                                </div>
                            </div>
                            <div class="swiper-container gallery-thumbs">
                                <div class="swiper-wrapper">
                                	<c:if test="${not empty fileList}">
                                		<c:forEach var="imgrow" items="${fileList }" varStatus="status">
                                    		<a href="#n" class="swiper-slide"><img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"></a>
                                    	</c:forEach>
									</c:if>
                                </div>
                            </div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next swiper-button-white"></div>
                            <div class="swiper-button-prev swiper-button-white"></div>
                            <!-- Initialize Swiper -->
                            <script>
                                var galleryThumbs = new Swiper('.gallery-thumbs', {
                                    spaceBetween: 2,
                                    slidesPerView: 6,
                                    freeMode: true,
                                    watchSlidesVisibility: true,
                                    watchSlidesProgress: true,
                                });
                                var galleryTop = new Swiper('.gallery-top', {
                                    spaceBetween: 0,
                                    navigation: {
                                        nextEl: '.swiper-button-next',
                                        prevEl: '.swiper-button-prev',
                                    },
                                    thumbs: {
                                        swiper: galleryThumbs
                                    }
                                });
                            </script>
                            
                        </div>
                        <!-- //Swiper -->
                    </div>
                    <a href="#none" class="btn_layer_close type02">레이어 닫기</a>
                </div>
                <!-- //layer -->
            </div>
         
