<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

    <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="event_winner_detail">
                    <div class="event_img">
                        <img src="/nas/cdn/MW/images/_temp/img_event_lucky.jpg" alt="">
                    </div>
                    <div class="slider_wrap event_winner_slide">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="img"><img src="/nas/cdn/MW/images/_temp/img_event_winner_temp.jpg" alt=""></div>
                                        <div class="tit">쑈윈도50%쿠폰쑈윈도50 %쿠폰쑈윈도50%쿠폰신 원몰50%쿠폰쑈윈도50% 쿠폰</div>
                                        <p class="txt"><strong>615</strong> 명 응모 </p>
                                        <div class="b_area">
                                            <button type="button" class="btn mid ok full">응모하기</button>
                                        </div>
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="img"><img src="/nas/cdn/MW/images/_temp/img_event_winner_temp.jpg" alt=""></div>
                                        <div class="tit">쑈윈도50%쿠폰쑈윈도50 %쿠폰쑈윈도50%쿠폰신 원몰50%쿠폰쑈윈도50% 쿠폰</div>
                                        <p class="txt"><strong>615</strong> 명 응모 </p>
                                        <div class="b_area">
                                            <button type="button" class="btn mid ok full">응모하기</button>
                                        </div>
                                    </a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div class="img"><img src="/nas/cdn/MW/images/_temp/img_event_winner_temp.jpg" alt=""></div>
                                        <div class="tit">쑈윈도50%쿠폰쑈윈도50 %쿠폰쑈윈도50%쿠폰신 원몰50%쿠폰쑈윈도50% 쿠폰</div>
                                        <p class="txt"><strong>615</strong> 명 응모 </p>
                                        <div class="b_area">
                                            <button type="button" class="btn mid ok full">응모하기</button>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="event_caution_wrap">
                    <img src="/nas/cdn/MW/images/_temp/img_event_red.jpg" alt="">
                </div>
                <div class="btn_area dual">
                    <button type="button" class="btn black">목록</button>
                    <button type="button" class="btn ok">당첨확인</button>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>    
<script type="text/javascript">
      var swiper = new Swiper('.event_winner_slide .swiper-container', {
          slidesPerView: 1.89,
          spaceBetween: 30,
          centeredSlides: true
      });
  </script>