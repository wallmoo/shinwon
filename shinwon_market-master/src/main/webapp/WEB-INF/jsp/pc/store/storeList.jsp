<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<!-- Content -->
		<div id="container">
			<!-- .time_deals_wrap -->
			<c:choose>
				<c:when test="${not empty timeSalePopup }" >
					<div class="time_deals_wrap" id="timeSalePopup_${timeSalePopup.DSP_MST_IDX }"><!-- store 메인 (레이어)타임특가 팝업 2020-06-17 -->
						<div class="time_deals_inner">
							<div class="time_deals_top">
								<h2>타임특가</h2>
								<div class="time_box_wrap">
									<div class="time_box">
										<dl class="clearboth">
											<dt>남은 시간</dt>
											<dd id="timer" class="clearboth"></dd>
										</dl>
									</div>
								</div>
								<div class="time_bar">
									<span id="time_progress"></span>
								</div>
							</div>
							<div class="time_deals_bottom">
								<div class="goods_area">
									<a href="#" class="clearboth">
										<div class="thum_img">
											<img src="<c:out value="${cdnDomain }${timeSalePopup.PRD_IMAGE }"/>" alt="<c:out value="${timeSalePopup.PRD_IMAGE_ALT }"/>">
										</div>
										<div class="info">
											<div class="sort_tag_area clearboth">
												<span class="sort"><c:out value="${timeSalePopup.BND_MST_BRAND_NM}"/></span>
                                                <span class="tag"><c:out value="${timeSalePopup.TAG_MST_TITLE}"/></span>
											</div>
											<p class="goods_title"><c:out value="${timeSalePopup.PRD_MST_NM}"/></p>
											<div class="goods_cost_info">
												<span class="dc_before_cost">￦<c:out value="${timeSalePopup.PRD_MST_PRC}"/></span>
												<strong class="clearboth">
													<span class="goods_cost">￦<c:out value="${timeSalePopup.SALED_PRICE}"/></span>
		                                                             <em class="dc_percent"><c:out value="${timeSalePopup.TIM_PRD_MST_SALE_RATE}"/>%</em>
												</strong>
											</div>
										</div>
									</a>
									<div class="btn_wrap">
										<button type="button" id="today_close" class="btn_middle gray" data-idx="${timeSalePopup.DSP_MST_IDX }">오늘 그만 보기</button>
										<button type="button" class="btn_middle btn_time_deals_close">닫기</button>
									</div>
								</div>
							</div>
							<button type="button" class="btn_time_deals_close">닫기</button>
						</div>
					</div>
				</c:when>
			</c:choose>
			<!-- // .time_deals_wrap -->
			
			<!-- #store_visual_wrap -->
			<div id="store_visual_wrap">
				<!-- .store_visual -->
				<div class="store_visual">
					<div>
						<a href="#">
							<img src="/nas/cdn/PW/images/@temp/img_store_visual_01.jpg" alt="">
						</a>
					</div>
					<div>
						<a href="#">
							<img src="/nas/cdn/PW/images/@temp/img_store_visual_02.jpg" alt="">
						</a>
					</div>
				</div>
				<!-- // .store_visual -->
			</div>
			<!-- // #store_visual_wrap -->

			<h2 class="main_tit_h2">
				<strong>NOW DEALS</strong>
				<em>한정기간! 한정수량! 타임세일 상품을 소개합니다.</em>
			</h2>

			<!-- #store_hotdeal_visual_wrap -->
			<div id="store_hotdeal_visual_wrap">
				<!-- .store_hotdeal_visual -->
				<div class="store_hotdeal_visual">
					<div class="store_hotdeal_visual_inner">
						<div>
							<a href="#">
								<img src="/nas/cdn/PW/images/@temp/img_store_hotdeal_01.jpg" alt="">
							</a>
						</div>
						<div>
							<a href="#">
								<img src="/nas/cdn/PW/images/@temp/img_store_hotdeal_02.png" alt="">
							</a>
						</div>
						<div>
							<a href="#">
								<img src="/nas/cdn/PW/images/@temp/img_store_hotdeal_03.png" alt="">
							</a>
						</div>
						<div>
							<a href="#">
								<img src="/nas/cdn/PW/images/@temp/img_store_hotdeal_03.png" alt="">
							</a>
						</div>
					</div>
				</div>
				<!-- // .store_hotdeal_visual -->
			</div>
			<!-- // #store_hotdeal_visual_wrap -->

			<h2 class="main_tit_h2">
				<strong>NEW ITEM</strong>
				<em>반짝~반짝 빛나는 신상품을 소개합니다.</em>
			</h2>

			<!-- .new_goods_wrap -->
			<div class="new_goods_wrap">
				<div class="new_goods_list slide clearboth">
					<div>
						<span class="flag_video">video</span>
						<a href="#">
							<div class="img_thum_wrap">
								<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem01.jpg);"></div>
								<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem01_over.jpg);"></div>
								<ul class="color_list">
									<li><span style="background:#273b38;">color 01</span></li>
									<li><span style="background:#c7673e;">color 02</span></li>
									<li><span style="background:#6686ad;">color 03</span></li>
								</ul>
							</div>
							<div class="sort_tag_area clearboth">
								<span class="sort">SIEG</span>
								<span class="tag">#신상품</span>
							</div>
							<p class="goods_title">한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !</p>
							<div class="goods_cost_info">
								<span class="dc_before_cost">￦88,000</span>
								<strong class="clearboth">
									<span class="goods_cost">￦44,000</span>
									<em class="dc_percent">50%</em>
								</strong>
							</div>
						</a>
						<div class="btn_like_area">
							<button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
						</div>
					</div>
					<div>
						<span class="flag_video">video</span>
						<a href="#">
							<div class="img_thum_wrap">
								<div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem02.jpg);"></div>
								<div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem02_over.jpg);"></div>
								<ul class="color_list">
									<li><span style="background:#273b38;">color 01</span></li>
									<li><span style="background:#c7673e;">color 02</span></li>
									<li><span style="background:#6686ad;">color 03</span></li>
								</ul>
							</div>
							<div class="sort_tag_area clearboth">
								<span class="sort">SIEG</span>
								<span class="tag">#신상품</span>
							</div>
							<p class="goods_title">한정판매, 핫 템 !</p>
							<div class="goods_cost_info">
								<span class="dc_before_cost">￦88,000</span>
								<strong class="clearboth">
									<span class="goods_cost">￦44,000</span>
									<em class="dc_percent">50%</em>
								</strong>
							</div>
						</a>
						<div class="btn_like_area">
							<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
						</div>
					</div>
					<div>
						<span class="flag_video">video</span>
						<a href="#">
							<div class="img_thum_wrap">
								<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem03.jpg);"></div>
								<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem03_over.jpg);"></div>
								<ul class="color_list">
									<li><span style="background:#273b38;">color 01</span></li>
									<li><span style="background:#c7673e;">color 02</span></li>
									<li><span style="background:#6686ad;">color 03</span></li>
								</ul>
							</div>
							<div class="sort_tag_area clearboth">
								<span class="sort">SIEG</span>
								<span class="tag">#신상품</span>
							</div>
							<p class="goods_title">한정판매, 핫 템 !</p>
							<div class="goods_cost_info">
								<span class="dc_before_cost">￦88,000</span>
								<strong class="clearboth">
									<span class="goods_cost">￦44,000</span>
									<em class="dc_percent">50%</em>
								</strong>
							</div>
						</a>
						<div class="btn_like_area">
							<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
						</div>
					</div>
					<div>
						<span class="flag_video">video</span>
						<a href="#">
							<div class="img_thum_wrap">
								<div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem04.jpg);"></div>
								<div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem04_over.jpg);"></div>
								<ul class="color_list">
									<li><span style="background:#273b38;">color 01</span></li>
									<li><span style="background:#c7673e;">color 02</span></li>
									<li><span style="background:#6686ad;">color 03</span></li>
								</ul>
							</div>
							<div class="sort_tag_area clearboth">
								<span class="sort">SIEG</span>
								<span class="tag">#신상품</span>
							</div>
							<p class="goods_title">한정판매, 핫 템 !</p>
							<div class="goods_cost_info">
								<span class="dc_before_cost">￦88,000</span>
								<strong class="clearboth">
									<span class="goods_cost">￦44,000</span>
									<em class="dc_percent">50%</em>
								</strong>
							</div>
						</a>
						<div class="btn_like_area">
							<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
						</div>
					</div>
					<div>
						<span class="flag_video">video</span>
						<a href="#">
							<div class="img_thum_wrap">
								<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem01.jpg);"></div>
								<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem01_over.jpg);"></div>
								<ul class="color_list">
									<li><span style="background:#273b38;">color 01</span></li>
									<li><span style="background:#c7673e;">color 02</span></li>
									<li><span style="background:#6686ad;">color 03</span></li>
								</ul>
							</div>
							<div class="sort_tag_area clearboth">
								<span class="sort">SIEG</span>
								<span class="tag">#신상품</span>
							</div>
							<p class="goods_title">한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !</p>
							<div class="goods_cost_info">
								<span class="dc_before_cost">￦88,000</span>
								<strong class="clearboth">
									<span class="goods_cost">￦44,000</span>
									<em class="dc_percent">50%</em>
								</strong>
							</div>
						</a>
						<div class="btn_like_area">
							<button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
						</div>
					</div>
					<div>
						<span class="flag_video">video</span>
						<a href="#">
							<div class="img_thum_wrap">
								<div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem02.jpg);"></div>
								<div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem02_over.jpg);"></div>
								<ul class="color_list">
									<li><span style="background:#273b38;">color 01</span></li>
									<li><span style="background:#c7673e;">color 02</span></li>
									<li><span style="background:#6686ad;">color 03</span></li>
								</ul>
							</div>
							<div class="sort_tag_area clearboth">
								<span class="sort">SIEG</span>
								<span class="tag">#신상품</span>
							</div>
							<p class="goods_title">한정판매, 핫 템 !</p>
							<div class="goods_cost_info">
								<span class="dc_before_cost">￦88,000</span>
								<strong class="clearboth">
									<span class="goods_cost">￦44,000</span>
									<em class="dc_percent">50%</em>
								</strong>
							</div>
						</a>
						<div class="btn_like_area">
							<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
						</div>
					</div>
				</div>
			</div>
			<!-- // .new_goods_wrap -->

			<div class="gray_line"></div>

			<h2 class="main_tit_h2">
				<strong>SELLER PICKS</strong>
				<em>셀러가 추천하는 맞춤형 스타일! #시즌,  #LOOK, #트랜드 등 다양한 태그 기준의 상품을 추천합니다.</em>
			</h2>

			<!-- .seller_picks_wrap -->
			<div class="seller_picks_wrap">
				<div class="grid clearboth">
					<div class="grid_sizer"></div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_01.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>오늘 뭐 입고 나가지?오늘 뭐 입고 나가지?오늘 뭐 입고 나가지?오늘 뭐 입고 나가지?</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_02.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>여름 데일리 룩 여름 데일리 룩 여름 데일리 룩 여름 데일리 룩 여름 데일리 룩 여름 데일리 룩 여름 데일리 룩</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_03.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>신상 S/S 데일리 코디</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_04.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>감각적인 트렌드</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_05.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>오늘 뭐 입고 나가지?</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_06.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>여름 데일리 룩</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_07.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>오늘 뭐 입고 나가지?</dt>
							<dd>신상 S/S 데일리 코디</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
					<div class="grid_item">
						<div class="img_area">
							<img src="/nas/cdn/PW/images/@temp/img_store_sellerpick_08.png " alt="">
						</div>
						<div class="seller_info clearboth">
							<img src="/nas/cdn/PW/images/@temp/ico_seller.png" alt="">
							<span>STYLENANDA</span>
						</div>
						<dl class="goods_info">
							<dt>감각전인 트렌드</dt>
							<dd>산뜻한 하루를 만드는 룩!</dd>
						</dl>
						<ul class="tag_list">
							<li>#체크남방</li>
							<li>#반바지</li>
							<li>#뷔스티에</li>
							<li>#원피스</li>
						</ul>
						<div class="btn_area clearboth">
							<div class="btn_like_sellerhome_area clearboth">
								<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
								<a href="/pc/topseller/sellerroom/sellerroomHome.do">셀러홈으로 이동하기</a>
							</div>
							<button type="button" class="btn_social_sharing">공유하기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- // .seller_picks_wrap -->

			<div class="go_link_area">
				<a href="/pc/sellerpick/sellerPickList.do">셀러픽 바로가기</a>
			</div>

			<!-- .pink_bar_area -->
			<div class="pink_bar_area">
				<img src="/nas/cdn/PW/images/@temp/img_banner_store_main.png" alt="">
			</div>
			<!-- // .pink_bar_area -->

			<!-- .project_funding_wrap -->
			<div class="project_funding_wrap">
				<h2 class="main_tit_h2">
					<strong>PROJECT FUNDING</strong>
					<em>펀딩 목표를 달성하면, 좋은 제품을 저렴한 가격에 구매할 수 있는 기회!</em>
				</h2>
				<!-- .project_funding_list -->
				<!-- .new_goods_wrap -->
				<div class="new_goods_wrap new_item_wrap goods_list_wrap ">
					<ul class="goods_list clearboth">
                        <li>
                            <!-- .goods_info_wrap -->
                            <div class="goods_info_wrap">
                                <a href="/pc/funding/fundingList.do">
                                    <!-- .thum_colorinfo -->
                                        <!--
                                                D : 상품 리스트에서 체인지 애니메이션
                                                쎔네일을 감싸고 있는  div에 fader class를 붙여 줍니다.
                                                첫번째 이미지에 on클래스를 붙여 줍니다.
                                                이미지는 항상 2개로 나열 합니다.
                                        -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding01.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding02.png" alt="" class="">
                                                <!-- .colorinfobox -->
                                                <div class="color_info_box">
                                                        <!-- .colorlist -->
                                                        <ul class="colorlist clearboth">
                                                                <li><span class="goods_color_273b38">#273b38</span></li>
                                                                <li><span class="goods_color_c7673e">#c7673e</span></li>
                                                                <li><span class="goods_color_6686ad">#6686ad</span></li>
                                                        </ul>
                                                        <!-- // .colorlist -->
                                                </div>
                                                <!-- // .colorinfobox -->
                                        </div>
                                        <!-- // .thum_colorinfo -->
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                    <span class="sort">SIEG</span>
                                                    <span class="tag">#타임특가</span>
                                            </div>
                                            <p class="goods_title is-truncated" style="overflow-wrap: break-word;">스퀘어 스카프 토드백스퀘어 스카프... </p>
                                            <p class="goods_context is-truncated" style="overflow-wrap: break-word;">산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩... </p>
                                            <div class="goods_cost_info">
                                                    <span class="dc_before_cost">￦88,000</span>
                                                    <strong class="clearboth">
                                                            <span class="goods_cost">￦44,000</span>
                                                            <em class="dc_percent">50%</em>
                                                    </strong>
                                            </div>
                                            <div class="per_bar_wrap">
                                                    <p class="time">14:21:21 남음 <span>56%</span></p>
                                                    <div class="per_bar">
                                                            <span style="width:56%;">56%</span>
                                                    </div>
                                            </div>
                                        </div>
                                </a>
                                <div class="btn_area clearboth">
                                  <button type="button" class="btn_social_sharing">공유하기</button>
                                </div>
                            </div>
                            <!-- // .goods_info_wrap -->
                        </li>
                        <li>
                            <!-- .goods_info_wrap -->
                            <div class="goods_info_wrap">
                                <a href="#">
                                    <!-- .thum_colorinfo -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding02.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding03.png" alt="" class="">
                                                <!-- .colorinfobox -->
                                                <div class="color_info_box">
                                                        <!-- .colorlist -->
                                                        <ul class="colorlist clearboth">
                                                                <li><span class="goods_color_273b38">#273b38</span></li>
                                                                <li><span class="goods_color_c7673e">#c7673e</span></li>
                                                                <li><span class="goods_color_6686ad">#6686ad</span></li>
                                                        </ul>
                                                        <!-- // .colorlist -->
                                                </div>
                                                <!-- // .colorinfobox -->
                                        </div>
                                        <!-- // .thum_colorinfo -->
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                    <span class="sort">SIEG</span>
                                                    <span class="tag">#타임특가</span>
                                            </div>
                                            <p class="goods_title" style="overflow-wrap: break-word;">스퀘어 스카프 토드백</p>
                                            <p class="goods_context" style="overflow-wrap: break-word;">산뜻한 하루를 만드는 룩!  <br>  #체크남방 #반바지 #뷔스티에 #원피스</p>
                                            <div class="goods_cost_info">
                                                    <span class="dc_before_cost">￦88,000</span>
                                                    <strong class="clearboth">
                                                            <span class="goods_cost">￦44,000</span>
                                                            <em class="dc_percent">50%</em>
                                                    </strong>
                                            </div>
                                            <div class="per_bar_wrap">
                                                    <p class="time">14:21:21 남음 <span>56%</span></p>
                                                    <div class="per_bar">
                                                            <span style="width:56%;">56%</span>
                                                    </div>
                                            </div>
                                        </div>
                                </a>
                                <div class="btn_area clearboth">
                                  <button type="button" class="btn_social_sharing">공유하기</button>
                                </div>
                            </div>
                            <!-- // .goods_info_wrap -->
                        </li>
                        <li>
                            <!-- .goods_info_wrap -->
                            <div class="goods_info_wrap">
                                <a href="#">
                                    <!-- .thum_colorinfo -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding03.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding04.png" alt="" class="">
                                                <!-- .colorinfobox -->
                                                <div class="color_info_box">
                                                        <!-- .colorlist -->
                                                        <ul class="colorlist clearboth">
                                                                <li><span class="goods_color_273b38">#273b38</span></li>
                                                                <li><span class="goods_color_c7673e">#c7673e</span></li>
                                                                <li><span class="goods_color_6686ad">#6686ad</span></li>
                                                        </ul>
                                                        <!-- // .colorlist -->
                                                </div>
                                                <!-- // .colorinfobox -->
                                        </div>
                                        <!-- // .thum_colorinfo -->
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                    <span class="sort">SIEG</span>
                                                    <span class="tag">#타임특가</span>
                                            </div>
                                            <p class="goods_title" style="overflow-wrap: break-word;">스퀘어 스카프 토드백</p>
                                            <p class="goods_context" style="overflow-wrap: break-word;">산뜻한 하루를 만드는 룩!  <br>  #체크남방 #반바지 #뷔스티에 #원피스</p>
                                            <div class="goods_cost_info">
                                                    <span class="dc_before_cost">￦88,000</span>
                                                    <strong class="clearboth">
                                                            <span class="goods_cost">￦44,000</span>
                                                            <em class="dc_percent">50%</em>
                                                    </strong>
                                            </div>
                                            <div class="per_bar_wrap">
                                                    <p class="time">14:21:21 남음 <span>56%</span></p>
                                                    <div class="per_bar">
                                                            <span style="width:56%;">56%</span>
                                                    </div>
                                            </div>
                                        </div>
                                </a>
                                <div class="btn_area clearboth">
                                  <button type="button" class="btn_social_sharing">공유하기</button>
                                </div>
                            </div>
                            <!-- // .goods_info_wrap -->
                        </li>
                        <li>
                            <!-- .goods_info_wrap -->
                            <div class="goods_info_wrap">
                                <a href="#">
                                    <!-- .thum_colorinfo -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding04.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding01.png" alt="" class="">
                                                <!-- .colorinfobox -->
                                                <div class="color_info_box">
                                                        <!-- .colorlist -->
                                                        <ul class="colorlist clearboth">
                                                                <li><span class="goods_color_273b38">#273b38</span></li>
                                                                <li><span class="goods_color_c7673e">#c7673e</span></li>
                                                                <li><span class="goods_color_6686ad">#6686ad</span></li>
                                                        </ul>
                                                        <!-- // .colorlist -->
                                                </div>
                                                <!-- // .colorinfobox -->
                                        </div>
                                        <!-- // .thum_colorinfo -->
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                    <span class="sort">SIEG</span>
                                                    <span class="tag">#타임특가</span>
                                            </div>
                                            <p class="goods_title" style="overflow-wrap: break-word;">스퀘어 스카프 토드백</p>
                                            <p class="goods_context" style="overflow-wrap: break-word;">산뜻한 하루를 만드는 룩!  <br>  #체크남방 #반바지 #뷔스티에 #원피스</p>
                                            <div class="goods_cost_info">
                                                    <span class="dc_before_cost">￦88,000</span>
                                                    <strong class="clearboth">
                                                            <span class="goods_cost">￦44,000</span>
                                                            <em class="dc_percent">50%</em>
                                                    </strong>
                                            </div>
                                            <div class="per_bar_wrap">
                                                    <p class="time">14:21:21 남음 <span>56%</span></p>
                                                    <div class="per_bar">
                                                            <span style="width:56%;">56%</span>
                                                    </div>
                                            </div>
                                        </div>
                                </a>
                                <div class="btn_area clearboth">
                                  <button type="button" class="btn_social_sharing">공유하기</button>
                                </div>
                            </div>
                            <!-- // .goods_info_wrap -->
                        </li>
                    </ul>
				</div>
				<!-- // .new_goods_wrap -->
				<!-- // .project_funding_list -->
				<div class="go_link_area">
					<a href="/pc/funding/fundingList.do">펀딩 바로가기</a>
				</div>
			</div>
			<!-- // .project_funding_wrap -->

			<h2 class="main_tit_h2">
				<strong>S.STORY</strong>
				<em>신원만의 특별한 감성 컨텐츠를 혹안하세요.</em>
			</h2>

			<!-- .s_story_wrap -->
			<div class="s_story_wrap clearboth">
				<div class="s_story_left_area">
					<a href="/pc/event/eventList.do">
						<img src="/nas/cdn/PW/images/@temp/img_sstory_01.png" alt="">
						<dl>
							<dt>Event</dt>
							<dd>VIKI 2019 OUTER 20$ SALE</dd>
						</dl>
					</a>
				</div>
				<div class="s_story_right_area">
					<div class="s_story_right_top">
						<a href="#">
							<img src="/nas/cdn/PW/images/@temp/img_sstory_02.png" alt="">
							<dl>
								<dt>Seller's Shopping Routine</dt>
								<dd>신원의 TOP 셀러가 추천하는 쇼핑루틴을 경험하세요</dd>
							</dl>
						</a>
					</div>
					<div class="s_story_right_bottom clearboth">
						<a href="#">
							<img src="/nas/cdn/PW/images/@temp/img_sstory_03.png" alt="">
							<dl>
								<dt>Review</dt>
								<dd>베스트 리뷰에 도전하세요</dd>
							</dl>
						</a>
						<a href="/pc/member/joinMemType.do">
							<img src="/nas/cdn/PW/images/@temp/img_sstory_04.png" alt="">
							<dl>
								<dt>Join</dt>
								<dd>쑈윈도 APP 설치시 전품목 15% 할인</dd>
							</dl>
						</a>
					</div>
				</div>
			</div>
			<!-- // .s_story_wrap -->

		</div>
		<!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.cookie.js"></script>
<script>
		$(function(){
			
			$('.store_visual').slick({
				dots : true,
				infinite: true,
				speed: 500,
				slidesToShow: 1,
				autoplay: true,
				autoplaySpeed: 3000,
				adaptiveHeight: true
			});
			$('.new_goods_list.slide').slick({
				dots : false,
				infinite: true,
				speed: 500,
				slidesToShow: 4,
				slidesToScroll: 1,
				autoplay: false,
				autoplaySpeed: 3000,
				adaptiveHeight: true,
				touchMove : false
			});
			$('.store_visual .slick-dots').wrap('<div class="slick-dots-wrap"></div>');

			$('.store_hotdeal_visual_inner').slick({
				infinite: true,
				slidesToShow: 3,
				slidesToScroll: 1,
				autoplay: true,
				cssEase: 'ease',
			});

			$('.seller_picks_wrap').imagesLoaded( function() {
				$('.grid').masonry({
					itemSelector: '.grid_item',
					columnWidth: '.grid_sizer',
					percentPosition: true,
					transitionDuration: '0.3s'
				});
			});

			var item_list_H = 0;
			$(window).on('load resize', function(){
				item_list_H = $('.new_item_list .thum_img_wrap').hiLow('max');
				$('.new_item_list .thum_img_wrap').css('height',item_list_H);
				$('.store_hotdeal_visual_inner').slick('resize');
			});

			$('.btn_time_deals_close').on('click', function(){
				if ($('.time_deals_wrap').is(':visible')) {
					$('.time_deals_wrap').fadeOut(500);
				}
			});
			
			//타임특가 오늘하루그만보기
			$('#today_close').on('click', function(){
			    var todayDate = new Date();
			    var midnight = new Date(todayDate.getFullYear(), todayDate.getMonth(), todayDate.getDate(), 23, 59, 59);
				var idx = $(this).data("idx");
				
				$.cookie("TimeSalePopup_"+idx , "Y" ,{ path: '/', expires: midnight });	

				if ($('.time_deals_wrap').is(':visible')) {
					$('#timeSalePopup_'+idx).fadeOut(500);
				}
			});
		});
		
		$(function(){
			
			<c:choose>
				<c:when test="${not empty timeSalePopup }" >
					if($.cookie("TimeSalePopup_${timeSalePopup.DSP_MST_IDX}") == "Y"){
						$("#timeSalePopup_${timeSalePopup.DSP_MST_IDX}").hide();
					}
					else{
						var now = new Date().getTime(); 
						var stDate = new Date('${timeSalePopup.TIM_SAL_START_TIME}').getTime(); // 전시시작시간
						var edDate = new Date('${timeSalePopup.TIM_SAL_END_TIME}').getTime(); // 전시종료시간
						
						var RemainDate = edDate - now; // 타이머
						
						var progress =  Math.floor(((now - stDate) / (edDate-stDate))*100) // 진행률
						document.getElementById("time_progress").innerHTML = progress+'%';
						
						var timeBar = document.getElementById("time_progress");
						timeBar.setAttribute('style','');
						timeBar.style.width = progress+'%';
						
						var timer = setInterval(function() {
							var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
							var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
							var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
							
							if (hours < 10) hours = "0" + hours;
							if (miniutes < 10) miniutes = "0" + miniutes;
						    if (seconds < 10) seconds = "0" + seconds;
						    
							m = hours + ":" +  miniutes + ":" + seconds ;
							document.getElementById("timer").innerHTML = m;
							
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
