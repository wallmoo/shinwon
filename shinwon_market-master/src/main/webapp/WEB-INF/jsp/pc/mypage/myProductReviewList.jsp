<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">상품 리뷰</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="top_point">
					<div class="point_txt">
						<span>적립 예상 포인트 <em class="purple">2,000p</em></span>
					</div>
					<div class="point_list">
						<ul class="clearboth">
							<li>
								<span class="txt">상품 리뷰 작성하면 300p ~ 500p 적립</span>
							</li>
							<li>
								<span class="txt">포토 리뷰 작성하면 1,000p 적립</span>
							</li>
						</ul>
					</div>
				</div>
				<!-- //top_point -->

				<div class="tab_wrap fix">
				    <ul class="tab n2">
				        <li><a href="#tab1">작성 가능한 상품 리뷰</a></li>
				        <li><a href="#tab2">작성한 상품 리뷰</a></li>
				    </ul>
				    <div class="tab_cont" id="tab1">
				    	<h4 class="blind">작성 가능한 상품 리뷰</h4>
				    	<div class="relation_list like fix mb100">
							<ul class="clearboth">
								<li>
									<div class="inner">
										<a href="#" class="relation_thumb">
											<img src="/nas/cdn/PW/images/@temp/img_temp_bag.jpg" alt="관련 상품">
										</a>
										<div class="relation_info">
											<div class="tag_box">
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#신상품</a>
											</div>
											<a href="#" class="item_name">한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !</a>
											<a href="#" class="num code">123456789A</a>
											<span class="num date">주문일 2019-09-30</span>
											<span class="num date">구매확정일 2019-11-01</span>
											<a href="#" class="btn order review size">상품 리뷰</a>
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
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#신상품</a>
											</div>
											<a href="#" class="item_name">한정판매, 핫 템 !</a>
											<a href="#" class="num code">123456789A</a>
											<span class="num date">주문일 2019-09-30</span>
											<span class="num date">구매확정일 2019-11-01</span>
											<a href="#" class="btn order review size">상품 리뷰</a>
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
												<a href="#" class="brand">SIEG</a>
												<a href="#" class="hash_tag">#신상품</a>
											</div>
											<a href="#" class="item_name">한정판매, 핫 템 !</a>
											<a href="#" class="num code">123456789A</a>
											<span class="num date">주문일 2019.09.30</span>
											<span class="num date">구매확정일 2019.11.01</span>
											<a href="#" class="btn order review size">상품 리뷰</a>
										</div>
									</div>
								</li>
								<li class="no_data">
									<div class="box">
										<span class="txt">작성 가능한 상품 리뷰가 없습니다.</span>
									</div>
								</li>
							</ul>
						</div>

						<div class="pagination">
							<span class="img_arrow first">
								<em class="blind">첫 페이지로 이동</em>
							</span>
							<span class="img_arrow prev">
								<em class="blind">이전 페이지로 이동</em>
							</span>
							<a href="#" class="num on">1</a>
							<a href="#" class="num">2</a>
							<a href="#" class="num">3</a>
							<a href="#" class="num">4</a>
							<a href="#" class="num">5</a>
							<a href="#" class="num">6</a>
							<a href="#" class="num">7</a>
							<a href="#" class="num">8</a>
							<span class="img_arrow next">
								<em class="blind">다음 페이지로 이동</em>
							</span>
							<span class="img_arrow last">
								<em class="blind">마지막 페이지로 이동</em>
							</span>
						</div>
						<!-- //pagination -->

				    </div>
					<!-- //tab1 -->

				    <div class="tab_cont" id="tab2">
				    	<h4 class="blind">작성한 상품 리뷰</h4>
				    	<div class="review_box_wrap">
				    		<div class="product_sec">
				    			<a href="#n" class="tit">[신원] VIKI 플리츠 배색 니트 스커트(TYSCI297)</a>
				    			<div class="box_wrap clearboth">
				    				<a href="#n" class="img">
				    					<img src="/nas/cdn/PW/images/@temp/img_temp_product.jpg" alt="상품 이미지">
				    				</a>
				    				<div class="satisfy">
				    					<dl class="satisfy_result mb3 clearboth">
				    						<dt>사이즈</dt>
				    						<dd>90, 작아요</dd>
				    					</dl>
				    					<dl class="satisfy_result clearboth">
				    						<dt>컬러</dt>
				    						<dd>블랙, 화면과 같아요</dd>
				    					</dl>
				    				</div>
				    			</div>
				    		</div>
				    		<div class="modify_sec">
								<div class="modify_box1">
									<dl class="satisfy_check fix clearboth">
			    						<dt class="none">만족도</dt>
			    						<dd>
			    							<span class="point_score rate_03">3점</span>
			    						</dd>
			    					</dl>
			    					<span class="score purple">3.0점</span>
								</div>

								<div class="modify_box2">
									<div class="detail_box on">
										<div class="txt_review">
											<p>성탄절 선물로 두 조카들에게 주려고 주문했는데 생각보다 도착이 빠르고 비교적 상품포장도 만족스러워서 좋았습니다. 앞으로도 자주 이용해야 되겠습니다. 감사합니다.</p>
										</div>
										<div class="img_review">
											<ul class="clearboth">
												<li><a href="#n"><img src="/nas/cdn/PW/images/@temp/img_temp_review1.jpg" alt="후기 등록 이미지"></a></li>
												<li><a href="#n"><img src="/nas/cdn/PW/images/@temp/img_temp_review2.jpg" alt="후기 등록 이미지"></a></li>
												<li class="more"><a href="#n"><img src="/nas/cdn/PW/images/@temp/img_temp_review1.jpg" alt="후기 등록 이미지"><span>+3</span></a></li>
											</ul>
										</div>
									</div>
								</div>

								<div class="btn_box">
									<button type="button" class="btn_modify">수정</button>
									<button type="button" class="btn_delete">삭제</button>
								</div>
								<p class="date">2019-09-22</p>
				    		</div>
				    		<!-- //modify_sec -->
				    	</div>
				    	<!-- //review_box_wrap -->

				    	<div class="review_box_wrap">
				    		<div class="product_sec">
				    			<a href="#n" class="tit">[신원] VIKI 플리츠 배색 니트 스커트(TYSCI297)</a>
				    			<div class="box_wrap clearboth">
				    				<a href="#n" class="img">
				    					<img src="/nas/cdn/PW/images/@temp/img_temp_product.jpg" alt="상품 이미지">
				    				</a>
				    				<div class="satisfy">
				    					<dl class="satisfy_result mb3 clearboth">
				    						<dt>사이즈</dt>
				    						<dd>90, 작아요</dd>
				    					</dl>
				    					<dl class="satisfy_result clearboth">
				    						<dt>컬러</dt>
				    						<dd>블랙, 화면과 같아요</dd>
				    					</dl>
				    				</div>
				    			</div>
				    		</div>
				    		<div class="modify_sec">
								<div class="modify_box1">
									<dl class="satisfy_check fix clearboth">
			    						<dt class="none">만족도</dt>
			    						<dd>
			    							<span class="point_score rate_05">5점</span>
			    						</dd>
			    					</dl>
			    					<span class="score purple">5.0점</span>
			    					<span class="best">BEST</span>
								</div>

								<div class="modify_box2">
									<div class="detail_box on">
										<div class="txt_review">
											<p>성탄절 선물로 두 조카들에게 주려고 주문했는데 생각보다 도착이 빠르고 비교적 상품포장도 만족스러워서 좋았습니다. 앞으로도 자주 이용해야 되겠습니다. 감사합니다.</p>
										</div>
										<div class="img_review">
											<ul class="clearboth">
												<li><a href="#n"><img src="/nas/cdn/PW/images/@temp/img_temp_review1.jpg" alt="후기 등록 이미지"></a></li>
												<li><a href="#n"><img src="/nas/cdn/PW/images/@temp/img_temp_review2.jpg" alt="후기 등록 이미지"></a></li>
												<li class="more"><a href="#n"><img src="/nas/cdn/PW/images/@temp/img_temp_review1.jpg" alt="후기 등록 이미지"><span>+3</span></a></li>
											</ul>
										</div>
									</div>
								</div>

								<div class="btn_box">
									<button type="button" class="btn_modify">수정</button>
									<button type="button" class="btn_delete">삭제</button>
								</div>
								<p class="date">2019-09-22</p>
				    		</div>
				    		<!-- //modify_sec -->
				    	</div>
				    	<!-- //review_box_wrap -->

				    	<div class="review_box_wrap">
				    		<div class="no_data">
								<div class="box">
									<span class="txt">등록한 상품 리뷰가 없습니다.</span>
								</div>
							</div>
				    	</div>
				    	<!-- //review_box_wrap -->



				    	<div class="pagination mt100">
							<span class="img_arrow first">
								<em class="blind">첫 페이지로 이동</em>
							</span>
							<span class="img_arrow prev">
								<em class="blind">이전 페이지로 이동</em>
							</span>
							<a href="#" class="num on">1</a>
							<a href="#" class="num">2</a>
							<a href="#" class="num">3</a>
							<a href="#" class="num">4</a>
							<a href="#" class="num">5</a>
							<a href="#" class="num">6</a>
							<a href="#" class="num">7</a>
							<a href="#" class="num">8</a>
							<span class="img_arrow next">
								<em class="blind">다음 페이지로 이동</em>
							</span>
							<span class="img_arrow last">
								<em class="blind">마지막 페이지로 이동</em>
							</span>
						</div>
						<!-- //pagination -->

				    </div>
				    <!-- //tab2 -->
				</div>
				<!-- //tab_wrap -->

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>