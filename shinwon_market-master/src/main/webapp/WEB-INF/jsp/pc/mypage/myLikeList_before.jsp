<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">좋아요 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
			
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<div class="tab_wrap">
					<ul class="tab n6">
						<li><a href="#tab1">상품(<c:out value = "${productLikeCount}"></c:out>)</a></li>
						<li><a href="#tab2">셀러(<c:out value = "${topSellerLikeCount}"></c:out>)</a></li>
						<li><a href="#tab3">셀러픽(<c:out value = "${sellerPickLikeCount}"></c:out>)</a></li>
						<li><a href="#tab4">OOTD(<c:out value = "${ootdLikeCount}"></c:out>)</a></li>
						<li><a href="#tab5">채널ON(<c:out value = "${channelOnLikeCount}"></c:out>)</a></li>
						<li><a href="#tab6">기획전(<c:out value = "${planLikeCount}"></c:out>)</a></li>
					</ul>
					<div class="tab_cont" id="tab1">
						<h4 class="blind">상품</h4>
						<!-- .new_goods_wrap -->
						<div class="new_goods_wrap like">
								<ul class="new_goods_list new_goods_list3 clearboth">
										<li>
												<!-- <span class="flag_video">video</span> -->
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
														<!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
														<div class="goods_cost_info">
																<span class="dc_before_cost">￦88,000</span>
																<strong class="clearboth">
																		<span class="goods_cost">￦44,000</span>
																		<em class="dc_percent">50%</em>
																</strong>
														</div>
														<!-- <div class="per_bar_wrap">
																<p class="time">14:21:21 남음 <span>60%</span></p>
																<div class="per_bar">
																		<span style="width:60%;">60%</span>
																</div>
														</div> -->
												</a>
												<div class="btn_like_area">
														<button type="button" class="btn-like on" title="좋아요"><span>100</span></button>
												</div>
										</li>
										<li>
												<!-- <span class="flag_video">video</span> -->
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
														<!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
														<div class="goods_cost_info">
																<span class="dc_before_cost">￦88,000</span>
																<strong class="clearboth">
																		<span class="goods_cost">￦44,000</span>
																		<em class="dc_percent">50%</em>
																</strong>
														</div>
														<!-- <div class="per_bar_wrap">
																<p class="time">14:21:21 남음 <span>60%</span></p>
																<div class="per_bar">
																		<span style="width:60%;">60%</span>
																</div>
														</div> -->
												</a>
												<div class="btn_like_area">
														<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
												</div>
										</li>
										<li>
												<!-- <span class="flag_video">video</span> -->
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
														<!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
														<div class="goods_cost_info">
																<span class="dc_before_cost">￦88,000</span>
																<strong class="clearboth">
																		<span class="goods_cost">￦44,000</span>
																		<em class="dc_percent">50%</em>
																</strong>
														</div>
														<!-- <div class="per_bar_wrap">
																<p class="time">14:21:21 남음 <span>60%</span></p>
																<div class="per_bar">
																		<span style="width:60%;">60%</span>
																</div>
														</div> -->
												</a>
												<div class="btn_like_area">
														<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
												</div>
										</li>
										<li>
												<!-- <span class="flag_video">video</span> -->
												<a href="#">
														<div class="img_thum_wrap">
																<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem04.jpg);"></div>
																<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem04_over.jpg);"></div>
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
														<!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
														<div class="goods_cost_info">
																<span class="dc_before_cost">￦88,000</span>
																<strong class="clearboth">
																		<span class="goods_cost">￦44,000</span>
																		<em class="dc_percent">50%</em>
																</strong>
														</div>
														<!-- <div class="per_bar_wrap">
																<p class="time">14:21:21 남음 <span>60%</span></p>
																<div class="per_bar">
																		<span style="width:60%;">60%</span>
																</div>
														</div> -->
												</a>
												<div class="btn_like_area">
														<button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
												</div>
										</li>
										<li>
												<!-- <span class="flag_video">video</span> -->
												<a href="#">
													<div class="img_thum_wrap">
															<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem05.jpg);"></div>
															<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem05_over.jpg);"></div>
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
														<!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
														<div class="goods_cost_info">
																<span class="dc_before_cost">￦88,000</span>
																<strong class="clearboth">
																		<span class="goods_cost">￦44,000</span>
																		<em class="dc_percent">50%</em>
																</strong>
														</div>
														<!-- <div class="per_bar_wrap">
																<p class="time">14:21:21 남음 <span>60%</span></p>
																<div class="per_bar">
																		<span style="width:60%;">60%</span>
																</div>
														</div> -->
												</a>
												<div class="btn_like_area">
														<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
												</div>
										</li>
										<li>
												<!-- <span class="flag_video">video</span> -->
												<a href="#">
														<div class="img_thum_wrap">
																<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem06.jpg);"></div>
																<div class="img_thum_inner crop" style="background-image:url(/nas/cdn/PW/images/@temp/newitem06_over.jpg);"></div>
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
														<!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
														<div class="goods_cost_info">
																<span class="dc_before_cost">￦88,000</span>
																<strong class="clearboth">
																		<span class="goods_cost">￦44,000</span>
																		<em class="dc_percent">50%</em>
																</strong>
														</div>
														<!-- <div class="per_bar_wrap">
																<p class="time">14:21:21 남음 <span>60%</span></p>
																<div class="per_bar">
																		<span style="width:60%;">60%</span>
																</div>
														</div> -->
												</a>
												<div class="btn_like_area">
														<button type="button" class="btn-like" title="좋아요"><span>480</span></button>
												</div>
										</li>
								</ul>
						</div>
						<!-- // .new_goods_wrap -->
					</div>
					<!-- //tab1 -->

					<div class="tab_cont" id="tab2">
						<h4 class="blind">셀러</h4>
						<div class="relation_list like">
							<ul class="clearboth">
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>뷰티천국</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#">
												<span class="text">뭐입을지 모르겠다면? <br>지금 뷰티천국으로 고고싱</span>
											</a>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<button type="button" class="home">셀러홈가기</button>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>뷰티천국</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#">
												<span class="text">뭐입을지 모르겠다면? <br>지금 뷰티천국으로 고고싱</span>
											</a>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<button type="button" class="home">셀러홈가기</button>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>뷰티천국</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#">
												<span class="text">뭐입을지 모르겠다면? <br>지금 뷰티천국으로 고고싱</span>
											</a>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<button type="button" class="home">셀러홈가기</button>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>뷰티천국</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#">
												<span class="text">뭐입을지 모르겠다면? <br>지금 뷰티천국으로 고고싱</span>
											</a>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<button type="button" class="home">셀러홈가기</button>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>뷰티천국</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#">
												<span class="text">뭐입을지 모르겠다면? <br>지금 뷰티천국으로 고고싱</span>
											</a>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<button type="button" class="home">셀러홈가기</button>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>뷰티천국</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#">
												<span class="text">뭐입을지 모르겠다면? <br>지금 뷰티천국으로 고고싱</span>
											</a>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<button type="button" class="home">셀러홈가기</button>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- //tab2 -->

					<div class="tab_cont" id="tab3">
						<h4 class="blind">셀러픽</h4>
						<div class="relation_list like">
							<ul class="clearboth">
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#" class="item_name">Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용</a>
											<span class="item_txt">예쁜옷, 코디 봄, 여름, 가을, 겨울코디 핫한 패션, 브랜드, 할인정보 (뷔스티에, 니트, 치마, 맨투맨, 투피스, 슬랙스..)<br>#체크남방 #반바지 #뷔스티에 #원피스</span>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="product">282</span>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">예쁜옷, 코디 봄, 여름, 가을, 겨울코디 핫한 패션, 브랜드, 할인정보 (뷔스티에, 니트, 치마, 맨투맨, 투피스, 슬랙스..)<br>#체크남방 #반바지 #뷔스티에 #원피스</span>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="product">282</span>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">예쁜옷, 코디 봄, 여름, 가을, 겨울코디 핫한 패션, 브랜드, 할인정보 (뷔스티에, 니트, 치마, 맨투맨, 투피스, 슬랙스..)<br>#체크남방 #반바지 #뷔스티에 #원피스</span>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="product">282</span>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">예쁜옷, 코디 봄, 여름, 가을, 겨울코디 핫한 패션, 브랜드, 할인정보 (뷔스티에, 니트, 치마, 맨투맨, 투피스, 슬랙스..)<br>#체크남방 #반바지 #뷔스티에 #원피스</span>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="product">282</span>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">예쁜옷, 코디 봄, 여름, 가을, 겨울코디 핫한 패션, 브랜드, 할인정보 (뷔스티에, 니트, 치마, 맨투맨, 투피스, 슬랙스..)<br>#체크남방 #반바지 #뷔스티에 #원피스</span>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="product">282</span>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="relation_info">
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">예쁜옷, 코디 봄, 여름, 가을, 겨울코디 핫한 패션, 브랜드, 할인정보 (뷔스티에, 니트, 치마, 맨투맨, 투피스, 슬랙스..)<br>#체크남방 #반바지 #뷔스티에 #원피스</span>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="product">282</span>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- //tab3 -->

					<div class="tab_cont" id="tab4">
						<h4 class="blind">OOTD</h4>
						<div class="relation_list like">
							<ul class="clearboth">
								<!-- item -->
								<li> <!-- thumb-list 노출 클래스 true 추가 -->
									<div class="inner">
										<div class="relation_thumb">
											<a href="#">
												<img src="/nas/cdn/PW/images/@temp/img_temp_manage_ootd1.jpg" alt="OOTD 이미지">
											</a>
										</div>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="thumb-txt">
											<div class="sort">
												<a href="#" class="tag">#기획전</a>
											</div>
											<div class="tit">
												<a href="#">Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용</a>
											</div>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="reply">481</span>
												</li>
											</ul>
										</div>

										<div class="thumb-list">
											<ul>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>
								<!-- //item -->

								<!-- item -->
								<li>
									<div class="inner">
										<div class="relation_thumb">
											<a href="#">
												<img src="/nas/cdn/PW/images/@temp/img_temp_manage_ootd2.jpg" alt="OOTD 이미지">
											</a>
										</div>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="thumb-txt">
											<div class="sort">
												<a href="#" class="tag">#기획전</a>
											</div>
											<div class="tit">
												<a href="#">Basic 셔츠의 활용</a>
											</div>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="reply">481</span>
												</li>
											</ul>
										</div>

										<div class="thumb-list">
											<ul>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
											</ul>
										</div>
									</div>

								</li>
								<!-- //item -->

								<!-- item -->
								<li> <!-- thumb-list 노출 클래스 true 추가 -->
									<div class="inner">
										<div class="relation_thumb">
											<a href="#">
												<img src="/nas/cdn/PW/images/@temp/img_temp_manage_ootd1.jpg" alt="OOTD 이미지">
											</a>
										</div>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="thumb-txt">
											<div class="sort">
												<a href="#" class="tag">#기획전</a>
											</div>
											<div class="tit">
												<a href="#">Basic 셔츠의 활용</a>
											</div>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="reply">481</span>
												</li>
											</ul>
										</div>

										<div class="thumb-list">
											<ul>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
											</ul>
										</div>
									</div>

								</li>
								<!-- //item -->

								<!-- item -->
								<li>
									<div class="inner">
										<div class="relation_thumb">
											<a href="#">
												<img src="/nas/cdn/PW/images/@temp/img_temp_manage_ootd2.jpg" alt="OOTD 이미지">
											</a>
										</div>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="thumb-txt">
											<div class="sort">
												<a href="#" class="tag">#기획전</a>
											</div>
											<div class="tit">
												<a href="#">Basic 셔츠의 활용</a>
											</div>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="reply">481</span>
												</li>
											</ul>
										</div>

										<div class="thumb-list">
											<ul>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
											</ul>
										</div>
									</div>

								</li>
								<!-- //item -->

								<!-- item -->
								<li> <!-- thumb-list 노출 클래스 true 추가 -->
									<div class="inner">
										<div class="relation_thumb">
											<a href="#">
												<img src="/nas/cdn/PW/images/@temp/img_temp_manage_ootd1.jpg" alt="OOTD 이미지">
											</a>
										</div>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="thumb-txt">
											<div class="sort">
												<a href="#" class="tag">#기획전</a>
											</div>
											<div class="tit">
												<a href="#">Basic 셔츠의 활용</a>
											</div>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="reply">481</span>
												</li>
											</ul>
										</div>

										<div class="thumb-list">
											<ul>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
											</ul>
										</div>
									</div>

								</li>
								<!-- //item -->

								<!-- item -->
								<li>
									<div class="inner">
										<div class="relation_thumb">
											<a href="#">
												<img src="/nas/cdn/PW/images/@temp/img_temp_manage_ootd2.jpg" alt="OOTD 이미지">
											</a>
										</div>

										<div class="portrait_wrap clearboth">
											<div class="portrait">
												<img src="/nas/cdn/PW/images/@temp/img_temp_por.jpg" alt="개인화 이미지">
											</div>
											<div class="name">
												<span>STYLENANDA</span>
											</div>
										</div>

										<div class="thumb-txt">
											<div class="sort">
												<a href="#" class="tag">#기획전</a>
											</div>
											<div class="tit">
												<a href="#">Basic 셔츠의 활용</a>
											</div>
											<ul class="count_list clearboth">
												<li>
													<button type="button" class="like">481</button>
												</li>
												<li>
													<span class="reply">481</span>
												</li>
											</ul>
										</div>

										<div class="thumb-list">
											<ul>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
												<li>
													<div class="s-thumb-img">
														<a href="#">
															<img src="/nas/cdn/PW/images/@temp/img_main_s_item.jpg" alt="">
														</a>
													</div>
													<div class="s-thumb-txt">
														<div class="tit">
															<a href="#">컬러 스트라이프 골지 원피스 (BWOCX4912)</a>
														</div>
														<div class="price"><em>￦44,000</em><strong class="sale">50%</strong></div>
													</div>
												</li>
											</ul>
										</div>
									</div>

								</li>
								<!-- //item -->



							</ul>
						</div>
					</div>
					<!-- //tab4 -->

					<div class="tab_cont" id="tab5">
						<h4 class="blind">채널ON</h4>
						<div class="relation_list like">
							<ul class="clearboth">
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb video">
											<img src="/nas/cdn/PW/images/@temp/img_video.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#가을신상</a>
											</div>
											<a href="#" class="item_name">2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울2019 SIEG 가을신상 하울</a>
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb video">
											<img src="/nas/cdn/PW/images/@temp/img_video.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#가을신상</a>
											</div>
											<a href="#" class="item_name">2019 SIEG 가을신상 하울</a>
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb video">
											<img src="/nas/cdn/PW/images/@temp/img_video.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#가을신상</a>
											</div>
											<a href="#" class="item_name">2019 SIEG 가을신상 하울</a>
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb video">
											<img src="/nas/cdn/PW/images/@temp/img_video.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#가을신상</a>
											</div>
											<a href="#" class="item_name">2019 SIEG 가을신상 하울</a>
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb video">
											<img src="/nas/cdn/PW/images/@temp/img_video.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#가을신상</a>
											</div>
											<a href="#" class="item_name">2019 SIEG 가을신상 하울</a>
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb video">
											<img src="/nas/cdn/PW/images/@temp/img_video.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#가을신상</a>
											</div>
											<a href="#" class="item_name">2019 SIEG 가을신상 하울</a>
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- //tab5 -->

					<div class="tab_cont" id="tab6">
						<h4 class="blind">기획전</h4>
						<div class="relation_list like">
							<ul class="clearboth">
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<!-- <a href="#" class="brand">SIEG</a> -->
												<a href="#" class="hash_tag">#기획전</a>
											</div>
											<a href="#" class="item_name">Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용Basic 셔츠의 활용</a>
											<span class="item_txt">2019-08-12~2019-08-25</span>
											<!-- <span class="price retail">￦88,000</span>
											<span class="price sale">￦44,000<em class="percent">50%</em></span> -->
											<!-- <div class="d-day">
												<div class="bar">
													<em style="width:50%;"></em>
												</div>
												<p class="desc"><strong>14:21:21</strong> 남음</p>
											</div> -->
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
												<!-- <button type="button" class="sns_share">
													<em class="blind">공유</em>
												</button> -->
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<!-- <a href="#" class="brand">SIEG</a> -->
												<a href="#" class="hash_tag">#기획전</a>
											</div>
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">2019-08-12~2019-08-25</span>
											<!-- <span class="price retail">￦88,000</span>
											<span class="price sale">￦44,000<em class="percent">50%</em></span> -->
											<!-- <div class="d-day">
												<div class="bar">
													<em style="width:50%;"></em>
												</div>
												<p class="desc"><strong>14:21:21</strong> 남음</p>
											</div> -->
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
												<!-- <button type="button" class="sns_share">
													<em class="blind">공유</em>
												</button> -->
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<!-- <a href="#" class="brand">SIEG</a> -->
												<a href="#" class="hash_tag">#기획전</a>
											</div>
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">2019-08-12~2019-08-25</span>
											<!-- <span class="price retail">￦88,000</span>
											<span class="price sale">￦44,000<em class="percent">50%</em></span> -->
											<!-- <div class="d-day">
												<div class="bar">
													<em style="width:50%;"></em>
												</div>
												<p class="desc"><strong>14:21:21</strong> 남음</p>
											</div> -->
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
												<!-- <button type="button" class="sns_share">
													<em class="blind">공유</em>
												</button> -->
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<!-- <a href="#" class="brand">SIEG</a> -->
												<a href="#" class="hash_tag">#기획전</a>
											</div>
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">2019-08-12~2019-08-25</span>
											<!-- <span class="price retail">￦88,000</span>
											<span class="price sale">￦44,000<em class="percent">50%</em></span> -->
											<!-- <div class="d-day">
												<div class="bar">
													<em style="width:50%;"></em>
												</div>
												<p class="desc"><strong>14:21:21</strong> 남음</p>
											</div> -->
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
												<!-- <button type="button" class="sns_share">
													<em class="blind">공유</em>
												</button> -->
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<!-- <a href="#" class="brand">SIEG</a> -->
												<a href="#" class="hash_tag">#기획전</a>
											</div>
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">2019-08-12~2019-08-25</span>
											<!-- <span class="price retail">￦88,000</span>
											<span class="price sale">￦44,000<em class="percent">50%</em></span> -->
											<!-- <div class="d-day">
												<div class="bar">
													<em style="width:50%;"></em>
												</div>
												<p class="desc"><strong>14:21:21</strong> 남음</p>
											</div> -->
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
												<!-- <button type="button" class="sns_share">
													<em class="blind">공유</em>
												</button> -->
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<!-- <a href="#" class="brand">SIEG</a> -->
												<a href="#" class="hash_tag">#기획전</a>
											</div>
											<a href="#" class="item_name">Basic 셔츠의 활용</a>
											<span class="item_txt">2019-08-12~2019-08-25</span>
											<!-- <span class="price retail">￦88,000</span>
											<span class="price sale">￦44,000<em class="percent">50%</em></span> -->
											<!-- <div class="d-day">
												<div class="bar">
													<em style="width:50%;"></em>
												</div>
												<p class="desc"><strong>14:21:21</strong> 남음</p>
											</div> -->
											<div class="share_box clearboth">
												<a href="#n" class="count_like">481</a>
												<!-- <button type="button" class="sns_share">
													<em class="blind">공유</em>
												</button> -->
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- //tab6 -->

				</div>
				<!-- //tab_wrap -->

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>