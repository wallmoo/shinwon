<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="special_list">
                    <div class="slider_wrap">
                        <div class="swiper-container-02">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="movWrap" data-video="TzWIXvPMv0E" style="background-image:url(/nas/cdn/MW/images/_temp/img_visual_mov_01.png);">
                                        <button type="button" class="btn_mov_play">PLAY</button>
                                    </div>
                                    <a href="#" class="swiper-link"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt="블랴 블랴" class="thum"></a>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movWrap" data-video="TzWIXvPMv0E" style="background-image:url(/nas/cdn/MW/images/_temp/img_visual_mov_01.png);">
                                        <button type="button" class="btn_mov_play">PLAY</button>
                                    </div>
                                    <a href="#" class="swiper-link"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt="블랴 블랴" class="thum"></a>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movWrap" data-video="TzWIXvPMv0E" style="background-image:url(/nas/cdn/MW/images/_temp/img_visual_mov_01.png);">
                                        <button type="button" class="btn_mov_play">PLAY</button>
                                    </div>
                                    <a href="#" class="swiper-link"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt="블랴 블랴" class="thum"></a>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movWrap" data-video="TzWIXvPMv0E" style="background-image:url(/nas/cdn/MW/images/_temp/img_visual_mov_01.png);">
                                        <button type="button" class="btn_mov_play">PLAY</button>
                                    </div>
                                    <a href="#" class="swiper-link"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt="블랴 블랴" class="thum"></a>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movWrap" data-video="TzWIXvPMv0E" style="background-image:url(/nas/cdn/MW/images/_temp/img_visual_mov_01.png);">
                                        <button type="button" class="btn_mov_play">PLAY</button>
                                    </div>
                                    <a href="#" class="swiper-link"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt="블랴 블랴" class="thum"></a>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>

                    <div class="timesale_goods_list">
                        <ul class="goods_list">
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <img src="/nas/cdn/MW/images/_temp/img_special.png" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <p class="goods_title">곧 다가올 따듯한 봄의 색, 컨버스 지금 이 시간에 만나보세요</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <img src="/nas/cdn/MW/images/_temp/img_special.png" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <p class="goods_title">곧 다가올 따듯한 봄의 색, 컨버스 지금 이 시간에 만나보세요</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <img src="/nas/cdn/MW/images/_temp/img_special.png" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <p class="goods_title">곧 다가올 따듯한 봄의 색, 컨버스 지금 이 시간에 만나보세요</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
 <script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
        var swiper = new Swiper('.swiper-container-02', {
            slidesPerView : 1,
            spaceBetween: 0,
            initialSlide: 0,
            roundLengths: true,
            pagination: {
                el: '.swiper-pagination',
            }
        });
   </script>