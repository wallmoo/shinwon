<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top01.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="store_main">
                	<!-- 2020-06-22 타임 플로팅 레이어 팝업 -->
					<c:choose>
						<c:when test="${not empty timeSalePopup }" >
							<div id="lay_mask"></div><!-- 마스크로 띄워질 Div -->
							<div id="timeSalePopup_${timeSalePopup.DSP_MST_IDX }" class="pop_layer pop_timesale"><!-- store 메인 (레이어)타임특가 팝업 2020-06-17 -->
								<div class="pop_wrap">
									<div class="pop_container">
										<div class="goods_list square view"> <!-- 상세인 경우 view 추가 -->
											<div class="thum_img">
												<img src="<c:out value="${cdnDomain }${timeSalePopup.PRD_IMAGE }"/>" alt="<c:out value="${timeSalePopup.PRD_IMAGE_ALT }"/>">
											</div>
											<div class="thum_info_txt">
												<div class="sort_tag_area clearboth">
													<span class="sort"><c:out value="${timeSalePopup.BND_MST_BRAND_NM}"/></span>
	                                                <span class="tag"><c:out value="${timeSalePopup.TAG_MST_TITLE}"/></span>
												</div>
												<p class="goods_title"><c:out value="${timeSalePopup.PRD_MST_NM}"/></p>
												<div class="goods_cont_wp">
						                            <div class="goods_cost_info">
						                                <span class="dc_before_cost">￦<c:out value="${timeSalePopup.PRD_MST_PRC}"/></span>
						                                <div class="dc_after_cost">
						                                    <span class="dc_percent"><strong><c:out value="${timeSalePopup.TIM_PRD_MST_SALE_RATE}"/></strong>%</span>
						                                    <span class="goods_cost"><strong><c:out value="${timeSalePopup.SALED_PRICE}"/></strong>원</span>
						                                </div>
						                            </div>
						                        </div>
											</div>
										</div>
										<div class="btn_area dual">
											<button type="button" class="btn" id="today_close" data-idx="${timeSalePopup.DSP_MST_IDX }">오늘 그만 보기</button>
											<button type="button" class="btn" onclick="toggleLayer($('#timeSalePopup_${timeSalePopup.DSP_MST_IDX }'), 'off');">닫기</button>
										</div>
									</div><!-- //pop_container -->
								</div><!-- //pop_wrap -->
							</div><!-- //pop_layer -->
						</c:when>
					</c:choose>
					<!-- //popup -->

                    <div class="slider_wrap store_top">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_01.jpg" alt=""></a></div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.store_top .swiper-container', {
                            slidesPerView : 1,
                            spaceBetween: 0,
                            initialSlide: 0,
                            roundLengths: true,
                            pagination: {
                                el: '.swiper-pagination',
                            }
                        });
                    </script>

                    <div class="title_wp">
                        <p class="ct_title">NOW DEALS</p>
                    </div>
                    <div class="slider_wrap store_deals">
                        <div class="swiper-container no_paging">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_02.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_02.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_02.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_02.jpg" alt=""></a></div>
                                <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_store_visual_02.jpg" alt=""></a></div>
                            </div>
                            <!-- <div class="swiper-pagination"></div> -->
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.store_deals .swiper-container', {
                            slidesPerView : 1.48,
                            spaceBetween: 8,
                            initialSlide: 0,
                            roundLengths: true,
                            // pagination: {
                            //     el: '.swiper-pagination',
                            // }
                        });
                    </script>

                    <div class="title_wp">
                        <p class="ct_title">NEW ITEM</p>
                    </div>
                    <div class="slider_wrap slider_item new_item">
                        <div class="swiper-container no_paging">
                            <div class="swiper-wrapper goods_list">
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_store_visual_03.jpg" alt="블랴 불려"> <!-- 0323 수정-->
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">SIEG</span>
                                                <span class="tag">#타임세일</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">SIEG</span>
                                                <span class="tag">#타임세일</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">SIEG</span>
                                                <span class="tag">#타임세일</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">SIEG</span>
                                                <span class="tag">#타임세일</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">SIEG</span>
                                                <span class="tag">#타임세일</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">SIEG</span>
                                                <span class="tag">#타임세일</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.new_item .swiper-container', {
                            slidesPerView : 2.05,
                            spaceBetween: 8,
                            initialSlide: 0,
                            roundLengths: true
                        });
                    </script>

                    <div class="title_wp">
                        <p class="ct_title">SELLER PICK</p>
                    </div>
                    <ul class="goods_list">
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#셀러피드</span>
                                    </div>
                                    <p class="goods_title">고민없는 선택 데일리 백</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_context">돔바의 어글리 슈즈 라운드업은 5cm의 굽을 가지고 있지만 편안한 착화감을 선물하는 반전 매력의 주인공이...</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_saler">셀러홈으로 이동하기</button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#셀러피드</span>
                                    </div>
                                    <p class="goods_title">고민없는 선택 데일리 백</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_context">돔바의 어글리 슈즈 라운드업은 5cm의 굽을 가지고 있지만 편안한 착화감을 선물하는 반전 매력의 주인공이...</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_saler">셀러홈으로 이동하기</button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#셀러피드</span>
                                    </div>
                                    <p class="goods_title">고민없는 선택 데일리 백</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_context">돔바의 어글리 슈즈 라운드업은 5cm의 굽을 가지고 있지만 편안한 착화감을 선물하는 반전 매력의 주인공이...</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_saler">셀러홈으로 이동하기</button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#셀러피드</span>
                                    </div>
                                    <p class="goods_title">고민없는 선택 데일리 백</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_context">돔바의 어글리 슈즈 라운드업은 5cm의 굽을 가지고 있지만 편안한 착화감을 선물하는 반전 매력의 주인공이...</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_saler">셀러홈으로 이동하기</button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                    </ul>

                    <div class="banner_one">
                        <a href="#n" class="banner"><img src="/nas/cdn/MW/images/_temp/img_temp_banner2.jpg" alt=""></a>
                    </div>

                    <div class="title_wp">
                        <p class="ct_title">PROJECT FUNDING</p>
                    </div>
                    <div class="slider_wrap slider_item project_funding ">
                        <div class="swiper-container no_paging">
                            <div class="swiper-wrapper goods_list">
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <span class="flag_funding">펀딩</span>
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">NIKE</span>
                                                <span class="tag">#펀딩</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="per_bar_wrap funding">
                                                <span class="per">60% 달성</span>
                                                <p class="time">14h : 21m : 21s 남음</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_sharing">공유하기</button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <span class="flag_funding">펀딩</span>
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">NIKE</span>
                                                <span class="tag">#펀딩</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="per_bar_wrap funding">
                                                <span class="per">60% 달성</span>
                                                <p class="time">14h : 21m : 21s 남음</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_sharing">공유하기</button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <span class="flag_funding">펀딩</span>
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">NIKE</span>
                                                <span class="tag">#펀딩</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="per_bar_wrap funding">
                                                <span class="per">60% 달성</span>
                                                <p class="time">14h : 21m : 21s 남음</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_sharing">공유하기</button>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="thum_img">
                                            <span class="flag_funding">펀딩</span>
                                            <img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt="블랴 불려">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="sort">NIKE</span>
                                                <span class="tag">#펀딩</span>
                                            </div>
                                            <p class="goods_title">플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스 플라워 패턴 백 포인트 컬러 원피스</p>
                                            <div class="goods_cont_wp">
                                                <div class="goods_cost_info">
                                                    <span class="dc_before_cost">1,000,000</span>
                                                    <div class="dc_after_cost">
                                                        <span class="dc_percent"><strong>50</strong>%</span>
                                                        <span class="goods_cost"><strong>500,000</strong>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="per_bar_wrap funding">
                                                <span class="per">60% 달성</span>
                                                <p class="time">14h : 21m : 21s 남음</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_sharing">공유하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.project_funding .swiper-container', {
                            slidesPerView : 1.34,
                            spaceBetween: 8,
                            initialSlide: 0,
                            roundLengths: true
                        });
                    </script>

                    <div class="banner_wp">
                        <a href="#n" class="banner"><img src="/nas/cdn/MW/images/_temp/img_store_banner1.jpg" alt=""></a>
                        <div class="banner_bx">
                            <a href="#n" class="banner"><img src="/nas/cdn/MW/images/_temp/img_store_banner2.jpg" alt=""></a>
                            <a href="#n" class="banner"><img src="/nas/cdn/MW/images/_temp/img_store_banner3.jpg" alt=""></a>
                        </div>
                        <a href="#n" class="banner"><img src="/nas/cdn/MW/images/_temp/img_store_banner4.jpg" alt=""></a>
                    </div>

                </div>




            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.cookie.js"></script>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
    $(".set_tag").mCustomScrollbar({
        axis:"x",
        advanced:{
            autoExpandHorizontalScroll:true
        }
    });
    
    toggleLayer($('#timeSalePopup_${timeSalePopup.DSP_MST_IDX}'), 'on');
    
	//타임특가 오늘하루그만보기
	$('#today_close').on('click', function(){
	    var todayDate = new Date();
	    var midnight = new Date(todayDate.getFullYear(), todayDate.getMonth(), todayDate.getDate(), 23, 59, 59);
		var idx = $(this).data("idx");
		
		$.cookie("TimeSalePopup_"+idx , "Y" ,{ path: '/', expires: midnight });	

		if ($('.pop_timesale').is(':visible')) {
			toggleLayer($('#timeSalePopup_${timeSalePopup.DSP_MST_IDX}'), 'off');
		}
	});
	
	$(function(){
		
		<c:choose>
			<c:when test="${not empty timeSalePopup }" >
				if($.cookie("TimeSalePopup_${timeSalePopup.DSP_MST_IDX}") == "Y"){
					$("#timeSalePopup_${timeSalePopup.DSP_MST_IDX}").hide();
				}
				else{
					var now = new Date().getTime(); 
					var edDate = new Date('${timeSalePopup.TIM_SAL_END_TIME}').getTime(); // 전시종료시간
					
					var RemainDate = edDate - now; // 타이머
					
					var timer = setInterval(function() {
						var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
						var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
						var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
						
						if (hours < 10) hours = "0" + hours;
						if (miniutes < 10) miniutes = "0" + miniutes;
					    if (seconds < 10) seconds = "0" + seconds;
					    
						m = hours + ":" +  miniutes + ":" + seconds ;
						//document.getElementById("timer").innerHTML = m;
						
						if (RemainDate < 0) {      
						    clearInterval(tid);
						}else{
							RemainDate = RemainDate - 1000;
						}
					}, 1000);	
				}
				
			</c:when>
		</c:choose>
	});
	
</script>