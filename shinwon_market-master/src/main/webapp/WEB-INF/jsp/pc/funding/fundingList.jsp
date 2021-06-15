<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>Insert title here</title>

<script>

    $(function(){
        $('.funding_slide_banner_01').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            adaptiveHeight: true,
            arrows: false,
            fade: true,
            cssEase: 'linear',
            pauseOnFocus: false,
            pauseOnHover: false
        });
        $('.funding_slide_banner_02').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 5000,
            adaptiveHeight: true,
            arrows: false,
            fade: true,
            cssEase: 'linear',
            pauseOnFocus: false,
            pauseOnHover: false
        });
        $('.funding_slide_banner_wrap .slick-dots').wrap('<div class="slick-dots-wrap clearboth"></div>');
        $('.slick-dots-wrap').append('<button type="button" class="slider-stop">정지</button><button type="button" class="slider-play">시작</button>');
        $('.slider-stop').on('click', function(){
            var _thisSlider = $(this).parent().parent();
            _thisSlider.slick('slickPause');
            _thisSlider.find('.slider-stop').css('display','none');
            _thisSlider.find('.slider-play').css('display','inline').focus();
        });
        $('.slider-play').on('click', function(){
            var _thisSlider = $(this).parent().parent();
            _thisSlider.slick('slickPlay');
            _thisSlider.find('.slider-play').css('display','none');
            _thisSlider.find('.slider-stop').css('display','inline').focus();
        });
        $(window).on('load resize', function(){
            var funding_slide_h = $('.funding_slide_banner_wrap').height();
            console.log(funding_slide_h);
            $('.funding_mov_inner').css('height',funding_slide_h);
        });
    });
</script>

<!-- Content -->
<div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">펀딩</h2>
            </div>
            <!--// Title -->

            <!-- .funding_top_area -->
            <div class="funding_top_area clearboth">
                <div class="funding_mov">
                    <div class="funding_mov_inner">
                        <!-- YOUTUBE VIDEO -->
                        <div class="ev_video" data-video="BGrY85i-skk" style="background-image:url(/nas/cdn/PW/images/@temp/img_mov_02.png)">
                            <span class="ev_play"></span>
                        </div>
                        <!--//YOUTUBE VIDEO -->
                    </div>
                </div>
                <div class="funding_slide_banner_wrap clearboth">
                    <div class="funding_slide_banner_01">
                        <div>
                            <a href="/pc/funding/fundingView.do" class="slide_item">
                                <img src="/nas/cdn/PW/images/@temp/img_funding_01.png" alt="">
                                <span class="txt">01 코펜하겐 라이징<br>스니커즈</span>
                            </a>
                        </div>
                        <div>
                            <a href="/pc/funding/fundingView.do" class="slide_item">
                                <img src="/nas/cdn/PW/images/@temp/img_funding_01.png" alt="">
                                <span class="txt">02 코펜하겐 라이징<br>스니커즈</span>
                            </a>
                        </div>
                    </div>
                    <div class="funding_slide_banner_02">
                        <div>
                            <a href="/pc/funding/fundingView.do" class="slide_item">
                                <img src="/nas/cdn/PW/images/@temp/img_funding_01.png" alt="">
                                <span class="txt">01 영국 해리티지 브랜드<br>컹골의 10FW</span>
                            </a>
                        </div>
                        <div>
                            <a href="#" class="slide_item">
                                <img src="/nas/cdn/PW/images/@temp/img_funding_01.png" alt="">
                                <span class="txt">02 영국 해리티지 브랜드<br>컹골의 10FW</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // .funding_top_area -->

            <!-- .tabmenuWrap -->
            <div class="tabmenuWrap">
                <ul class="tabmenu_list cf">
                    <li class="on"><a href="#">진행중</a></li>
                    <li><a href="/pc/funding/fundingIntended.do">오픈예정</a></li>
                    <li><a href="#">종료</a></li>
                </ul>
            </div>
            <!-- // .tabmenuWrap -->

            <!-- .sub_content -->
            <div class="sub_content funding">
                <div class="top_title_select_area clearboth">
                  <span class="select">
                      <select id="select1" title="">
                          <option selected="selected">최근등록순</option>
                          <option>가격 낮은순</option>
                          <option>가격 높은순</option>
                          <option>판매량 많은순</option>
                      </select>
                  </span>
                </div>

                <div class="goods_list_wrap goods_funding">
                    <!-- .goods_list -->
                    <ul class="goods_list clearboth">
                        <li>
                            <!-- .goods_info_wrap -->
                            <div class="goods_info_wrap">
                                <a href="/pc/funding/fundingView.do">
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
                                                <img src="/nas/cdn/PW/images/@temp/img_funding02.png" alt="">
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
                                            <p class="goods_title">스퀘어 스카프 토드백스퀘어 스카프 토드백스퀘어 스카프 토드백스퀘어 스카프 토드백스퀘어 스카프 토드백스퀘어 스카프 토드백스퀘어 스카프 토드백스퀘어 스카프 토드백</p>
                                            <p class="goods_context">산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스 산뜻한 하루를 만드는 룩! #체크남방 #반바지 #뷔스티에 #원피스</p>
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
                                <a href="/pc/funding/fundingView.do">
                                    <!-- .thum_colorinfo -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding02.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding03.png" alt="">
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
                                            <p class="goods_title">스퀘어 스카프 토드백</p>
                                            <p class="goods_context">산뜻한 하루를 만드는 룩!<br />#체크남방 #반바지 #뷔스티에 #원피스</p>
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
                                <a href="/pc/funding/fundingView.do">
                                    <!-- .thum_colorinfo -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding03.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding04.png" alt="">
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
                                            <p class="goods_title">스퀘어 스카프 토드백</p>
                                            <p class="goods_context">산뜻한 하루를 만드는 룩!<br />#체크남방 #반바지 #뷔스티에 #원피스</p>
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
                                <a href="/pc/funding/fundingView.do">
                                    <!-- .thum_colorinfo -->
                                        <div class="thum_color_info fader">
                                            <span class="flag_video">video</span>
                                                <img src="/nas/cdn/PW/images/@temp/img_funding04.png" alt="" class="on">
                                                <img src="/nas/cdn/PW/images/@temp/img_funding01.png" alt="">
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
                                            <p class="goods_title">스퀘어 스카프 토드백</p>
                                            <p class="goods_context">산뜻한 하루를 만드는 룩!<br />#체크남방 #반바지 #뷔스티에 #원피스</p>
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
                    <!-- // .goods_list -->
                </div>
            </div>
            <!-- // .sub_content -->

            <div class="sub_content funding null">
                <p>현제 진행중인 펀딩상품이 없습니다.</p>
            </div>
        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>



