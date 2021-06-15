<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="event_detail">
                    <div class="title_wp">
                        <p class="ct_title">이제 쇼핑은 신동구매로!</p>
                    </div>
                    <div class="event_img">
                        <img src="/nas/cdn/MW/images/_temp/img_event_lucky.jpg" alt="">
                    </div>
                    <div class="tit_wp">
                        <p class="ct_tit">이달의 신동구매 상품</p>
                    </div>
                    <div class="description_bx">
                        <dl>
                            <dt>기간</dt><dd>2019-11-04 ~ 2019-11-10</dd>
                            <dt>쿠폰발급</dt><dd>2019-11-11</dd>
                            <dt>구매기간</dt><dd>2019-11-13</dd>
                        </dl>
                    </div>

                    <div class="event_detail_slide">
                        <p class="title">조던 “Why Not?” ZERO.2 SE PF</p>
                        <div class="slider_wrap">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt=""></a></div>
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt=""></a></div>
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt=""></a></div>
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt=""></a></div>
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt=""></a></div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="part_in_wrap">
                        <div class="graph_area">
                            <div class="graph">
                                <span class="bar" style="width:50%;">50%</span>
                            </div>
                            <p class="label l1"><span>참여인원</span><span>할인율</span></p>
                            <p class="label l2"><span>100명</span><span class="on">15%</span></p>
                            <p class="label l3"><span>300명</span><span>30%</span></p>
                            <p class="label l4"><span>800명</span><span>55%</span></p>
                        </div>
                        <div class="btn_area">
                            <button type="button" class="btn ok">신동구매 신청</button>
                        </div>
                        <div class="share_bx">
                            <p class="tit"><span>189명</span> 신동구매 신청중</p>
                            <p class="txt">소문내고 최대 55% 할인받으세요!</p>
                            <a href="#n" class="b_share">공유하기</a>
                        </div>
                    </div>


                    <div class="tit_wp">
                        <p class="ct_tit">신동구매 참여별 할인혜택</p>
                    </div>
                    <div class="tb_row line_st">
                        <table>
                            <caption>신동구매 참여별 할인혜택 : 참여 달성구간, 할인혜택 표입니다.</caption>
                            <colgroup>
                                <col style="width:100px;" />
                                <col />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">참여 달성구간</th>
                                    <th scope="col" class="ac">할인혜택</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>100명</strong></td>
                                    <td>15% 할인쿠폰 지급</td>
                                </tr>
                                <tr>
                                    <td><strong>300명</strong></td>
                                    <td>30% 할인쿠폰 지급</td>
                                </tr>
                                <tr>
                                    <td><strong>800명</strong></td>
                                    <td>55% 할인쿠폰 지급</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tit_wp">
                        <p class="ct_tit">신동구매는 어떻게?</p>
                        <p class="ct_txt">선택한 #태그 기준으로 상품 및 컨텐츠를 추천해드립니다. </p>
                    </div>
                    <div class="step_bx">
                        <ul>
                            <li>
                                <span class="step">STEP 1</span>
                                <p class="txt">할인받아 신동구매 상품을 구매하고 싶다면, 신청기간동안 [신동구매 신청] 버튼을 탭하여 신동구매에 참여해주세요.</p>
                            </li>
                            <li>
                                <span class="step">STEP 2</span>
                                <p class="txt">신청기간이 종료된 다음 날 신청 완료된 인원 수에 따라 할인쿠폰이 일괄 지급됩니다. ‘마이페이지‘, ‘알림톡’ 에서 쿠폰을 확인해주세요.</p>
                            </li>
                            <li>
                                <span class="step">STEP 3</span>
                                <p class="txt">할인쿠폰이 지급되는 시점부터 구매기간동안 할인쿠폰을 적용하여 신동구매 상품을 구매할 수 있습니다. 신동구매 상품판매 일정을 꼭 확인해주세요.</p>
                            </li>
                        </ul>
                    </div>
                    <div class="event_caution_wrap">
                        <img src="/nas/cdn/MW/images/_temp/img_event_red.jpg" alt="">
                    </div>
                    <div class="btn_area">
                        <button type="button" class="btn black">목록</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
        
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script type="text/javascript">
      var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1.1,
        spaceBetween: 5,
        initialSlide: 0,
        roundLengths: true,
        pagination: {
          el: '.swiper-pagination',
        }
      });
  </script>