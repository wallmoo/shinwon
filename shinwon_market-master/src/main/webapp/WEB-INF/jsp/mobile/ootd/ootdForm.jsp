<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">

                    <!-- 0323 기존 마크업
                    <div class="tit_wp">
                        <p class="ct_tit"><em class="must">필수</em>사진 등록
                            <span class="help_wp">
                                <a href="#n">도움말</a>
                            </span>
                        </p>
                        <div class="right">
                            <p class="t_amount">(2/10)</p>
                        </div>
                    </div> -->
                    <!-- S: 0323 툴팁수정 -->
                    <div class="tit_wp">
                        <p class="ct_tit"><em class="must">필수</em>사진 등록</p>
                        <div class="help_wp">
                            <a href="#n"><span>도움말</span></a>
                            <div class="tooltip_layer">
                                <div class="tooltip_con">
                                    <ul class="dot_list">
                                        <li>OOTD에 등록할 사진을 설정할 수 있습니다.</li>
                                        <li>OOTD 사진은 최대 10장까지 등록할 수 있으며, 첫 번째 등록한 사진이 대표 썸네일로 자동 설정됩니다.</li>
                                        <li>png, jpg 포멧의 이미지 파일을 최대 10MB까지 등록할 수 있습니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//E: 0323 툴팁수정 -->

                    <div class="slider_wrap picture_register">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt=""><a href="#" class="b_del">삭제</a></div>
                                <div class="swiper-slide"><img src="/nas/cdn/MW/images/_temp/img_timesale.png" alt=""><a href="#" class="b_del">삭제</a></div>
                                <div class="swiper-slide"><a href="#" class="b_more">추가</a></div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>

                    <div class="tit_wp">
                        <p class="ct_tit"><em class="must">필수</em>정보 입력</p>
                    </div>
                    <div class="writeWrap">
                        <div class="name">제목</div>
                        <div class="form">
                            <input type="text" title="제목 입력" placeholder="제목 입력(50자)">
                        </div>
                        <div class="name">내용</div>
                        <div class="form">
                            <textarea class="high" title="내용 입력" placeholder="내용 입력(200자)"></textarea>
                        </div>
                    </div>


                    <!-- 0323 S:태그 등록시 노출 케이스 -->
                    <div class="tit_wp">
                        <p class="ct_tit"><em class="must">필수</em>태그 설정</p>
                    </div>
                    <div class="set_tag scroll_none">
                        <span class="tag"><em>#여친룩</em><a href="#n" class="del">삭제</a></span>
                        <span class="tag"><em>#여행코디</em><a href="#n" class="del">삭제</a></span>
                        <span class="tag"><em>#패션그램</em><a href="#n" class="del">삭제</a></span>
                        <span class="tag"><em>#청순한</em><a href="#n" class="del">삭제</a></span>
                        <span class="tag"><em>#OOTD</em><a href="#n" class="del">삭제</a></span>
                    </div>
                    <div class="btn_area">
                        <button type="button" class="btn ok">태그선택</button>
                    </div>
                    <!--//E:태그 등록시 노출 케이스 -->
                    <!-- 0323 S: 태그 미등록시 안내 문구 노출 -->
                    <div class="tit_wp">
                        <p class="ct_tit"><em class="must">필수</em>태그 설정</p>
                    </div>
                    <div class="set_tag_wrap">
                        <div class="no_data">
                            <p>태그를 선택해 주세요.</p>
                        </div>
                        <div class="btn_area">
                            <button type="button" class="btn ok">태그선택</button>
                        </div>
                    </div>
                    <!--//E: 태그 미등록시 안내 문구 노출 -->

                    <!-- 0323 기존 마크업
                    <div class="tit_wp">
                        <p class="ct_tit">희망태그 설정
                            <span class="help_wp">
                                <a href="#n">도움말</a>
                            </span>
                        </p>
                    </div> -->
                    <!-- S: 0323 툴팁수정 -->
                    <div class="tit_wp">
                        <p class="ct_tit">희망태그 설정</p>
                        <div class="help_wp">
                            <a href="#n"><span>도움말</span></a>
                            <div class="tooltip_layer">
                                <div class="tooltip_con">
                                    <ul class="dot_list">
                                        <li>태그로 등록하고 싶은 정보를 입력해 주세요. (#요즘감성, #유행어입력 등)</li>
                                        <li>희망태그는 OOTD 노출 시 실제 검색 태그에 포함되지 않으며, 타 회원님들의 요청 빈도를 감안하여 추후 반영될 예정입니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//E: 0323 툴팁수정 -->

                    <div class="hopetag_set mg_reset">
                        <textarea title="희망태그 입력" placeholder="희망태그 입력"></textarea>
                    </div>

                    <!-- 0323 기존 마크업
                    <div class="tit_wp">
                        <p class="ct_tit">등록 가능한 상품(선택)
                            <span class="help_wp">
                                <a href="#n">도움말</a>
                            </span>
                        </p>
                    </div> -->
                    <!-- S: 0323 툴팁수정 -->
                    <div class="tit_wp">
                        <p class="ct_tit">등록 가능한 상품(선택)</p>
                        <div class="help_wp">
                            <a href="#n"><span>도움말</span></a>
                            <div class="tooltip_layer">
                                <div class="tooltip_con">
                                    <ul class="dot_list">
                                        <li>판매중인 상품을 검색하여 OOTD 상품으로 등록하실 수 있습니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//E: 0323 툴팁수정 -->

                    <div class="goods_select_list">
                        <ul class="mCustomScrollbar">
                            <li>
                                <div class="prod_info">
                                    <div class="pic"><img src="/nas/cdn/MW/images/_temp/img_order_prod.jpg" alt=""></div>
                                    <div class="prod_cont">
                                        <p class="logo"><span>SI</span><span>#펀딩</span></p>
                                        <p class="tit">언발 셔링 잔체크 미디 스커트 </p>
                                    </div>
                                </div>
                                <input type="checkbox" title="선택">
                            </li>
                            <li>
                                <div class="prod_info">
                                    <div class="pic"><img src="/nas/cdn/MW/images/_temp/img_order_prod.jpg" alt=""></div>
                                    <div class="prod_cont">
                                        <p class="logo"><span>SI</span><span>#펀딩</span></p>
                                        <p class="tit">언발 셔링 잔체크 미디 스커트 </p>
                                    </div>
                                </div>
                                <input type="checkbox" title="선택">
                            </li>
                            <li>
                                <div class="prod_info">
                                    <div class="pic"><img src="/nas/cdn/MW/images/_temp/img_order_prod.jpg" alt=""></div>
                                    <div class="prod_cont">
                                        <p class="logo"><span>SI</span><span>#펀딩</span></p>
                                        <p class="tit">언발 셔링 잔체크 미디 스커트 </p>
                                    </div>
                                </div>
                                <input type="checkbox" title="선택">
                            </li>
                            <li>
                                <div class="prod_info">
                                    <div class="pic"><img src="/nas/cdn/MW/images/_temp/img_order_prod.jpg" alt=""></div>
                                    <div class="prod_cont">
                                        <p class="logo"><span>SI</span><span>#펀딩</span></p>
                                        <p class="tit">언발 셔링 잔체크 미디 스커트 </p>
                                    </div>
                                </div>
                                <input type="checkbox" title="선택">
                            </li>
                            <li>
                                <div class="prod_info">
                                    <div class="pic"><img src="/nas/cdn/MW/images/_temp/img_order_prod.jpg" alt=""></div>
                                    <div class="prod_cont">
                                        <p class="logo"><span>SI</span><span>#펀딩</span></p>
                                        <p class="tit">언발 셔링 잔체크 미디 스커트 </p>
                                    </div>
                                </div>
                                <input type="checkbox" title="선택">
                            </li>
                        </ul>
                    </div>
                    <div class="gray_bx">
                        <p class="tit">유의사항</p>
                        <ul class="dot_list">
                            <li>OOTD는 패션 정보를 공유하는 커뮤니티 공간입니다.<br>적절하지 않은 콘텐츠를 등록하실 경우 서비스 이용약관에 따라 사전 경고없이 게시물이 삭제될 수 있습니다.</li>
                        </ul>
                    </div>
                    <div class="btn_area dual">
                        <button type="button" class="btn gray">취소</button>
                        <button type="button" class="btn ok">등록</button>
                    </div>

                </div>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
      var swiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 5,
        initialSlide: 0,
        roundLengths: true,
        pagination: {
          el: '.swiper-pagination',
        }
      });


      function b_more(){
          var moreW =$('.picture_register .b_more').parents('.swiper-slide').outerWidth();
          $('.picture_register .b_more').height(moreW - 2);
      }b_more()

      $(window).resize(function(event) {
        b_more();
      });
    </script>
