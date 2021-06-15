<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/businessTop.jsp" %>

		<!-- container -->
        <div id="container">
			<!-- .new_visual -->
			<div class="new_visual">
				<div class="center_wrap">
					<h2>SHOWINDOW</h2>
					<p>쑈윈도의 처음을 함께할 셀러를 모집합니다.</p>
					<a onclick="location.href='/pc/business/standingPointApplication.do'">입점신청 바로가기</a>
				</div>
			</div>
			<!-- // .new_visual -->

            <!-- .new_benefit -->
			<div class="new_benefit">
				<div class="center_wrap">
					<h3 class="ui_tit_h3">Benefit</h3>
					<p class="ui_tit_p">쑈윈도에서 드리는<br>기분좋은 혜택</p>
					<ul>
						<li>
							<span class="bg_benefit"></span>
							<dl>
								<dt>입점 · 등록수수료 0원</dt>
								<dd>입점 · 등록수수료 무료!</dd>
							</dl>
						</li>
						<li>
							<span class="bg_benefit"></span>
							<dl>
								<dt>컨텐츠 홍보 · 제작 지원!</dt>
								<dd>입접하시는 브랜드의 컨텐츠 제작과 홍보를 지원합니다.</dd>
							</dl>
						</li>
						<li>
							<span class="bg_benefit"></span>
							<dl>
								<dt>셀러룸 · 셀러피드 기능 제공</dt>
								<dd>브랜드 전용 셀러룸 · 피드 기능을 제공하여 셀러가 직접 다양한 컨텐츠를 자유롭게 노출할 수 있습니다.</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- // .new_benefit -->
			<!-- .new_service -->
			<div class="new_service">
				<div class="center_wrap">
					<h3 class="ui_tit_h3">Service</h3>
					<p class="ui_tit_p">주요 서비스</p>
					<div class="slider_wrap">
						<div class="slider_wrap mob_slide">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="img"><img src="/nas/cdn/CC/images/img_service_01.jpg" alt=""></div>
									</div>
									<div class="swiper-slide">
										<div class="img"><img src="/nas/cdn/CC/images/img_service_02.jpg" alt=""></div>
									</div>
									<div class="swiper-slide">
										<div class="img"><img src="/nas/cdn/CC/images/img_service_03.jpg" alt=""></div>
									</div>
									<div class="swiper-slide">
										<div class="img"><img src="/nas/cdn/CC/images/img_service_04.jpg" alt=""></div>
									</div>
								</div>
							</div>
						</div>
						<div class="t_area_wrap">
							<div class="t_area t_area_04 t_area_08">
								<p class="tit">다양한 브랜드 컨텐츠와<br><strong>#셀러들의 스타일 피드</strong></p>
								<p class="txt">컨텐츠와 셀러 피드로<br>맞춤 스타일/상품 제안</p>								
							</div>
							<div class="t_area t_area_05 t_area_09 active">
								<p class="tit"><strong>#TAG 기반</strong>의 <br>다양한 콘텐츠 구성</p>
								<p class="txt">피드 형식으로 회원이 설정한<br>#TAG와 관련 있는 콘텐츠 자동 노출</p>
							</div>
							<div class="t_area t_area_07">
								<p class="tit">브랜드의 제품과 스토리에<br>집중할 수 있는<strong>#펀딩</strong>제공</p>
								<p class="txt">브랜드와 쏘윈도간의 파트너쉽으로<br>다양한 펀딩 프로젝트 제공</p>
							</div>
							<div class="t_area t_area_06">
								<p class="tit"><strong>#영상 모델컷</strong>으로<br>정확한 제품정보 제공</p>
								<p class="txt">생동감 있는 모델컷으로 쑈윈도에서만<br>볼 수 있는 스타일링 영상 지원</p>
							</div>
						</div>
					</div>
					<div class="swiper-button">
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
					<script>
						$(window).on('load resize', function(){
							var width = $(window).width();
							if (width > 1230) {
								width = (width - 1200) / 2;
								$('.mob_slide').css('margin-right', -width);
							}
						});
						var swiper = new Swiper('.mob_slide .swiper-container', {
							slidesPerView: 'auto',
							spaceBetween: 30,
							initialSlide: 1,
							loop: true,
							roundLengths: true,
							navigation: {
								nextEl: '.swiper-button-next',
								prevEl: '.swiper-button-prev',
							},
							breakpointsInverse: true,
							breakpoints: {
								1230: {
									centeredSlides: false,
									slidesPerView: 'auto',
									spaceBetween: 30,
									initialSlide: 0,
									loop: true,
									roundLengths: true
								 },
								768: {
									slidesPerView: 'auto',
									centeredSlides: true,
									initialSlide: 0,
									loop: true
								},
								320:  {
									slidesPerView: 'auto',
									centeredSlides: true,
									spaceBetween: 15,
									initialSlide: 0,
								}
							},
							on: {
								slideChangeTransitionEnd: function(){
									conChange(this.activeIndex + 1);
								}
							}
						});
						function conChange(num){
							console.log(num);
							$('.t_area').removeClass('active');
							$('.t_area_0' + num).addClass('active');
						}
					</script>
				</div>
			</div>
			<!-- // .new_service -->
            <!-- // .new_service -->
			<!-- .new_interview -->
			<div class="new_interview">
				<div class="center_wrap">
					<h3 class="ui_tit_h3">Brand Show</h3>
					<p class="ui_tit_p">브랜드 쇼</p>
					<div class="branshow_slider_wrap">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="responsive-video">
										<iframe width="560" height="315" src="https://www.youtube.com/embed/lAGaya7_Rkg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
									<div class="interview_info cf">
										<dl>
											<dt class="cf"><strong>EYEEYE</strong><em>아이아이</em></dt>
											<dd>디자이너 계한희의 디렉팅으로 2016 S/S 시즌 런칭하는 브랜드 `EYEYE.`<br>화려하면서 위트있는 패턴과 심플한 실루엣의 믹스 앤 매치가 돋보이는 컨템포러리 여성브랜드입니다. 변형스타일의<br>데님의류와 다양한 기법의 디테일을 활용하여 YOUNG &amp; CHEERFUL 이미지를 재현합니다.</dd>
										</dl>
										<img src="/nas/cdn/CC/images/img_seller_neo.png" alt="아이아이사진" class="seller_img">
									</div>
								</div>
								<div class="swiper-slide">
									<div class="responsive-video">
										<iframe width="560" height="315" src="https://www.youtube.com/embed/iN08Cklv_d4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
									<div class="interview_info cf">
										<dl>
											<dt class="cf"><strong>EYEEYE</strong><em>아이아이</em></dt>
											<dd>디자이너 계한희의 디렉팅으로 2016 S/S 시즌 런칭하는 브랜드 `EYEYE.`<br>화려하면서 위트있는 패턴과 심플한 실루엣의 믹스 앤 매치가 돋보이는 컨템포러리 여성브랜드입니다. 변형스타일의<br>데님의류와 다양한 기법의 디테일을 활용하여 YOUNG &amp; CHEERFUL 이미지를 재현합니다.</dd>
										</dl>
										<img src="/nas/cdn/CC/images/img_seller_neo.png" alt="아이아이사진" class="seller_img">
									</div>
								</div>
								<div class="swiper-slide">
									<div class="responsive-video">
										<iframe src="https://player.vimeo.com/video/28665379" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
									</div>
									<div class="interview_info cf">
										<dl>
											<dt class="cf"><strong>EYEEYE</strong><em>아이아이</em></dt>
											<dd>디자이너 계한희의 디렉팅으로 2016 S/S 시즌 런칭하는 브랜드 `EYEYE.` 화려하면서 위트있는 패턴과 심플한 실루엣의 믹스 앤 매치가 돋보이는 컨템포러리 여성브랜드입니다. 변형스타일의 데님의류와 다양한 기법의 디테일을 활용하여 YOUNG &amp; CHEERFUL 이미지를 재현합니다.</dd>
										</dl>
										<img src="/nas/cdn/CC/images/img_seller_neo.png" alt="아이아이사진" class="seller_img">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-pagination"></div>
				<button type="button" class="btn_movie_prev">이전</button>
				<button type="button" class="btn_movie_next">다음</button>
				<script>
					$(function(){
						//var players = Array.from(document.querySelectorAll('.js-player')).map(p => new Plyr(p));
						//var players = Plyr.setup('.js-player');
						var swiper = new Swiper('.branshow_slider_wrap .swiper-container', {
							slidesPerView : 1,
							spaceBetween : 0,
							initialSlide : 0,
							roundLengths : true,
							pagination : {
								el : '.swiper-pagination',
								clickable: true
							},
							navigation : {
								nextEl : '.btn_movie_next',
								prevEl : '.btn_movie_prev'
							}
						});
					});
				</script>
			</div>
			<!-- // .new_interview -->
            
            <!-- .new_process -->
			<div class="new_process">
				<div class="center_wrap">
					<h3 class="ui_tit_h3">Procedure</h3>
					<p class="ui_tit_p">입점절차</p>
					<ul class="cf">
						<li>
							<dl>
								<dt><span>입점신청</span></dt>
								<dd>STEP 01</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><span>담당MD상담</span></dt>
								<dd>STEP 02</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><span>입점계약</span></dt>
								<dd>STEP 03</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><span>입점완료</span></dt>
								<dd>STEP 04</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><span>상품등록 및<br>운영</span></dt>
								<dd>STEP 05</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- // .new_process -->
        </div>
        <!-- //container -->
<%@ include file="/WEB-INF/jsp/pc/business/include/businessFooter.jsp" %>