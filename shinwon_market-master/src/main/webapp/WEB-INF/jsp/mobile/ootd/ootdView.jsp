<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="ootd_detail">
                    <!-- OOTD게시물상세 -->
                    <div class="goods_img_wp">
                        <div class="slider_wrap">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_ootd_detail.jpg" alt=""></a></div>
                                    <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_ootd_detail.jpg" alt=""></a></div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                    <div class="goods_content">
                        <div class="saler">
                            <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                            <span class="name">가디패피당</span>
                        </div>
                        <p class="title">동남아 여름나라에서 놀기 좋은 #OOTD! Feat. 여행 가는 날</p>
                        <p class="term">2020-01-16  13:40:20</p>
                        <p class="context">코타키나발루 여행 출발하기 전 착샷 공유합니다.<br>
                        원래 예쁜 블라우스를 입으려 했으나 폭우 수준의 비로
                        인해 급 티셔츠로 변경!<br>
                        그래도 은근 상큼(?) 하죠???
                        </p>
                        <div class="sort_tag_area mCustomScrollbar">
                            <!-- 0323 태그 노출 영역 수정 -->
                            <a href="../common/SWMWCM01.html" class="tag">#가디건</a>
                            <a href="../common/SWMWCM02.html" class="tag">#올블랙</a>
                            <a href="../common/SWMWCM02.html" class="tag">#따듯한재질</a>
                            <a href="../common/SWMWCM02.html" class="tag">#코듀로이</a>
                        </div>
                        <div class="btn_post">
                            <button type="button" class="btn mid gray">삭제</button>
                            <button type="button" class="btn mid black">수정</button>
                        </div>
                    </div>
                    <div class="btn_goods_area">
                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                        <button type="button" class="btn_comment" title="코멘트"><span>920</span></button>
                    </div>
                    <!-- //OOTD게시물상세 -->
                    <!-- 댓글영역 -->
                    <div class="reply_write">
                        <div class="write">
                            <textarea title="댓글 입력" placeholder="댓글 입력"></textarea>
                            <div class="btn_write">
                                <button type="button" class="btn mid black">등록</button>
                            </div>
                        </div>
                    </div>
                    <div class="reply_list_wp">
                        <div class="reply_list">
                            <ul>
                                <li>
                                    <div class="writer">
                                        <p class="name">BLOOMS LONDON</p>
                                        <p class="date">2019-08-20 <span>06:05:20</span></p>
                                    </div>
                                    <div class="txt">
                                        우와~~ 너무 예뻐요 ;) 나도 살래 ~ 따라할랭 ~ ~
                                    </div>
                                    <div class="btn_box">
                                        <button type="button" class="btn_reply">답글달기</button>
                                    </div>
                                </li>
                                <li>
                                    <div class="writer">
                                        <p class="name">윤지여이이이</p>
                                        <p class="date">2019-08-20 <span>06:05:20</span></p>
                                    </div>
                                    <div class="txt">
                                        따라하기 2
                                    </div>
                                    <div class="btn_box">
                                        <button type="button" class="btn_reply">답글달기</button>
                                    </div>
                                    <ul>
                                        <li class="me">
                                            <div class="writer">
                                                <p class="name">최성히이이잉</p>
                                                <p class="date">2019-08-20 <span>06:05:20</span></p>
                                            </div>
                                            <div class="txt">
                                                왜 따라하려고 하죠? 사람들은 각자의 개성이 있는건데???
                                            </div>
                                            <div class="btn_box">
                                                <button type="button" class="btn_delete">삭제</button>
                                                <button type="button" class="btn_modify">수정</button>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="writer">
                                                <p class="name">지나가는선비</p>
                                                <p class="date">2019-08-20 <span>06:05:20</span></p>
                                            </div>
                                            <div class="txt">
                                                진지충이시네욜 !!
                                            </div>
                                        </li>
                                        <li class="me">
                                            <div class="write">
                                                <textarea title="댓글 입력" placeholder="댓글 입력"></textarea>
                                                <div class="btn_write">
                                                    <button type="button" class="btn mid black">등록</button>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="writer">
                                        <p class="name">차위처어어엉</p>
                                        <p class="date">2019-08-20 <span>06:05:20</span></p>
                                    </div>
                                    <div class="txt">
                                        너무 예뻐요 ~ 내 스타일 ♥ 제 OOTD도 구경오세요~
                                    </div>
                                    <div class="btn_box">
                                        <button type="button" class="btn_reply">답글달기</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="more_area">
                        <button type="button" class="btn_more"><span>더보기</span></button>
                    </div>
                    <!-- //댓글영역 -->

                    <div class="tit_wp">
                        <h3 class="ct_tit">회원이 구매한 상품</h3>
                    </div>
                    <ul class="goods_list dual">
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <span class="flag_video">video</span>
                                    <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#탑셀러상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 원피스</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#탑셀러상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 원피스</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div><!-- //ootd_detail -->
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
        $(".goods_content .sort_tag_area").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true,
                updateOnImageLoad: false
            }
        });
      var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        initialSlide: 0,
        roundLengths: true,
        pagination: {
          el: '.swiper-pagination',
        }
      });
    </script>