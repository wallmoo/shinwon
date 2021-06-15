<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="event_detail">
                    <div class="evnet_detail_visual">
                        <img src="/nas/cdn/MW/images/_temp/img_event_detail.jpg" alt="">
                        <div class="t_area bottom">
                            <p class="tit">에어조던 10레트로</p>
                            <p class="txt">부드러운 경량의 쿠셔닝이 특징인 에어 조던 10 레트로는 퍼포먼스에서 영감을 받은 편안함과 아이코닉한 에어조던의 디테일이 조화를 이룹니다.</p>
                        </div>
                    </div>
                    
                    <div class="part_in_wrap">
                        <div class="graph_area">
                            <dl>
                                <dt>참여인원 : </dt><dd class="t_red">11,610명</dd>
                                <dt>참여기간 : </dt><dd>2019-11-01 ~ 2019-11-15</dd>
                            </dl>
                            <div class="graph">
                                <span class="bar" style="width:50%;">50%</span>
                            </div>
                            <p class="label l1"><span>참여인원</span><span>할인율</span></p>
                            <p class="label l2"><span>100명</span><span class="on">15%</span></p>
                            <p class="label l3"><span>300명</span><span>30%</span></p>
                            <p class="label l4"><span>800명</span><span>55%</span></p>
                        </div>
                        <div class="btn_area">
                            <button type="button" class="btn ok">응원 하기</button>
                        </div>
                    </div>

                    <div class="event_detail_slide">
                        <p class="title">Why! 에어조던 10 레트로?</p>
                        <div class="slider_wrap">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt="">
                                            <p class="tit">Color sense</p>
                                            <p class="txt">에어조던 10 레트로는 다채롭고 밝은 색상으로 여러분들의 시선을 사로 잡습니다.</p>
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt="">
                                            <p class="tit">Color sense</p>
                                            <p class="txt">에어조던 10 레트로는 다채롭고 밝은 색상으로 여러분들의 시선을 사로 잡습니다.</p>
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="/nas/cdn/MW/images/_temp/img_event_slide.jpg" alt="">
                                            <p class="tit">Color sense</p>
                                            <p class="txt">에어조던 10 레트로는 다채롭고 밝은 색상으로 여러분들의 시선을 사로 잡습니다.</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>


                    <div class="tit_wp">
                        <p class="ct_tit">응원하기 참여별 혜택</p>
                    </div>
                    <div class="tb_row line_st">
                        <table>
                            <caption>응원하기 참여별 혜택 : 참여 달성구간, 할인혜택 표입니다.</caption>
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
                        <p class="ct_tit">응원하기는 어떻게?</p>
                        <p class="ct_txt">응원하기 신청에서 구매까지의 단계는 아래와 같습니다. </p>
                    </div>
                    <div class="step_bx">
                        <ul>
                            <li>
                                <span class="step">STEP 1</span>
                                <p class="txt">로그인 및 신청하기</p>
                            </li>
                            <li>
                                <span class="step">STEP 2</span>
                                <p class="txt">모집종료 및 입점 발표</p>
                            </li>
                            <li>
                                <span class="step">STEP 3</span>
                                <p class="txt">할인쿠폰으로 구매하기</p>
                            </li>
                            <li>
                                <span class="step">STEP 4</span>
                                <p class="txt">이쁘게 입고 뽐내기</p>
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