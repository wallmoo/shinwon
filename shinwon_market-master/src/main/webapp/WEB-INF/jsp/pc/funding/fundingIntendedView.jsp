<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>Insert title here</title>

<script>
    $(function(){
        $('.thum_list li a').on('click', function(){
            var address = $(this).children('img');
            $('#zomm_img img').attr('src',address.attr('src')).attr('alt',address.attr('alt'));
            $(this).parent().addClass('on').siblings().removeClass('on');
        });
    });
</script>


<!-- Content -->
    <div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <div class="sub_content">
                <div class="product_wrap">
                    <div class="product_inner">
                        <div class="product_detail">
                            <div class="gallery_slide">
                                <button class="btn_video">동영상보기</button>
                                <div class="swiper-container gallery-top">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_01.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_02.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_03.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_04.jpg" alt=""></div>
                                    </div>
                                </div>
                                <div class="swiper-container gallery-thumbs">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_01.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_02.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_03.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_04.jpg" alt=""></div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                </div>
                            </div>
                            <div class="fit_guide">
                                <div class="top">
                                    <div class="tit-area">
                                        <div class="left">
                                            <h3 class="tits2">핏 가이드</h3>
                                        </div>
                                    </div>
                                    <div class="btn_wrap">
                                        <!-- 로그인시(미등록상태) -->
                                        <button class="btn_small">마이핏등록</button>
                                        <!-- 로그인시(등록상태) -->
                                        <button class="btn_small">마이핏수정</button>
                                    </div>
                                </div>
                                <table class="tb_col type02">
                                    <caption>핏 가이드 - 사이즈, 어깨넓이, 가슴둘레, 소매길이, 전체길이 출력 표입니다.</caption>
                                    <colgroup>
                                        <col style="width:20%">
                                        <col style="width:20%">
                                        <col style="width:20%">
                                        <col style="width:20%">
                                        <col style="width:auto">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">사이즈</th>
                                            <th scope="col">어깨넓이</th>
                                            <th scope="col">가슴둘레</th>
                                            <th scope="col">소매길이</th>
                                            <th scope="col">전체길이</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- 로그인시(미등록상태) -->
                                        <tr class="my">
                                          <td>마이 핏</td>
                                          <td colspan="4" class="fit_no_info">등록된 정보가 없습니다.</td>
                                        </tr>
                                        <!-- //로그인시(미등록상태) -->

                                        <!-- 로그인시(등록상태) -->
                                        <tr class="my">
                                          <td>마이 핏</td>
                                          <td>40</td>
                                          <td>93</td>
                                          <td>59.5</td>
                                          <td>68</td>
                                        </tr>
                                        <!-- //로그인시(등록상태) -->

                                        <!-- <tr>
                                          <td>95</td>
                                          <td>43</td>
                                          <td>95</td>
                                          <td>60.5</td>
                                          <td>70</td>
                                        </tr>
                                        <tr>
                                          <td>100</td>
                                          <td>45</td>
                                          <td>103</td>
                                          <td>62.5</td>
                                          <td>72</td>
                                        </tr>
                                        <tr>
                                          <td>105</td>
                                          <td>47</td>
                                          <td>108</td>
                                          <td>64.5</td>
                                          <td>74</td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- .product_banner_zone -->
                            <div class="product_banner_zone">
                                <a href="#"><img src="../../images/@temp/img_product_banner.jpg" alt="배너 블랴 블랴"></a>
                            </div>
                            <!-- // .product_banner_zone -->
                        </div><!-- //product_detail -->
                        <div class="product_inform soon">
                            <div class="pro_btn">
                                <button class="btn_large btn_funding">펀딩시작 알림</button>
                            </div>
                            <div class="pro_top">
                                <p class="logo">VIKI</p>
                                <span class="tag">#신상품</span>
                                <div class="ico_share">
                                    <div class="share_box">
                                        <button type="button" class="sns_share">
                                            <em class="blind">공유</em>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="title">
                                <h2>액션 스타일 빅 로고 기모 후드 블랙</h2>
                                <span>(PXEAD4073)</span>
                            </div>
                            <div class="bar_black">
                                <dl class="clearboth">
                                    <dt>오픈까지 남은시간</dt>
                                    <dd>03 : 24 : 51</dd>
                                </dl>
                            </div>
                            <div class="bar_black">
                                <dl class="clearboth">
                                    <dt>오픈예정일</dt>
                                    <dd>2019.10.22</dd>
                                </dl>
                            </div>
                        </div><!-- //product_inform -->
                    </div><!-- // product_inner -->
                </div>
            </div>
 
        </div>
    </div>
    <!--// Content -->

    
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>