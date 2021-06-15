<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- .product_wrap -->
                <div class="product_wrap">
                    <div class="slider_wrap">
                        <p class="time_sale_bar cf">
                            <span>10월 22일 오픈예정</span>
                        </p>
                        <div class="swiper-container-detail">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide movWrap" data-video="TzWIXvPMv0E" style="background-image:url(/nas/cdn/MW/images/_temp/img_visual_mov_01.png);">
                                    <button type="button" class="btn_mov_play">PLAY</button>
                                </div>
                                <div class="swiper-slide"><img src="/nas/cdn/MW/images/_temp/img_goods_detail.png" alt=""></div>
                                <div class="swiper-slide"><img src="/nas/cdn/MW/images/_temp/img_goods_detail.png" alt=""></div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.swiper-container-detail', {
                            //autoHeight : true,
                            slidesPerView : 1,
                            spaceBetween: 0,
                            initialSlide: 0,
                            roundLengths: true,
                            pagination: {
                                el: '.swiper-pagination'
                            }
                        });
                        $(window).scroll(function(){
                            var sTop = $(this).scrollTop();
                            if (sTop >= 122) {
                                $('.time_sale_bar').addClass('fixed');
                            } else {
                                $('.time_sale_bar').removeClass('fixed');
                            }
                        });
                    </script>
                    <div class="product_inform">
                        <div class="pro_btn">
                            <button type="button" class="btn mid red full">펀딩시작 알림</button>
                        </div>
                        <div class="pro_top cf">
                            <p class="logo">VIKI</p>
                        </div>
                        <div class="title">
                            <h2>다크 네이비 티킹 스트라이프  더블 정장 자켓 </h2>
                        </div>
                        <div class="product_option">
                            <ul class="btn_link_social cf btn_only">
                                <!-- <li><button type="button" class="btn_like" title="좋아요"><span>1,004</span></button></li> -->
                                <li><button type="button" class="btn_social" title="좋아요"><span>공유하기</span></button></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- // .product_wrap -->

            </div>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
      var swiper = new Swiper('.funding_slide .swiper-container', {
        slidesPerView: 1.1,
        spaceBetween: 5,
        initialSlide: 0,
        roundLengths: true,
        pagination: {
          el: '.swiper-pagination',
        }
      });
  </script>
