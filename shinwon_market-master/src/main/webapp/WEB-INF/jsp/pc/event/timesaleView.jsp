<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>


<title>Insert title here</title>

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
                                            <!-- <div class="tooltip-area">
                                                <button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
                                                 TOOLTIP
                                                <div class="tooltip-layer left top">
                                                    <div class="tooltip-con">
                                                        <div class="list">
                                                            <ul>
                                                                <li>핏 가이드 툴팁</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                 //TOOLTIP
                                            </div> -->
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
                        <div class="product_inform">
                            <div class="indicator">
                                    <span style="width:60%;">60%</span>
                            </div>
                            <p class="time_txt">타임세일종료까지 <span>14:21:21</span> 남음 </p>
                            <div class="pro_top">
                                <p class="logo"><!--<img src="../../images/member/img_logo04.png" alt="VIKI">-->VIKI</p>
                                <span class="tag">#묶음상품</span>
                                <div class="ico_share">
                                    <div class="count_list"><button type="button" class="like on">481</button></div>
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
                            <div class="product_option ">
                                <div class="price clearboth">
                                    <p class="del">￦88,000</p>
                                    <strong class="sale">50%</strong>
                                    <em>￦44,000</em>
                                </div>
                                <!-- 임직원 로그인 시 : 임직원할인 제외상품 -->
                                <div class="price clearboth">
                                    <p class="del">￦88,000</p>
                                    <strong class="sale">50%</strong>
                                    <em>￦44,000</em>
                                    <p class="price_info">(임직원할인 제외상품)</p>
                                </div>
                                <!-- //임직원 로그인 시 : 임직원할인 제외상품 -->
                                <!-- 제휴사 로그인 시 : 제휴사할인 제외상품 -->
                                <div class="price clearboth">
                                    <p class="del">￦88,000</p>
                                    <strong class="sale">50%</strong>
                                    <em>￦44,000</em>
                                    <p class="price_info">(제휴사할인 제외상품)</p>
                                </div>
                                <!-- //제휴사 로그인 시 : 제휴사할인 제외상품 -->
                                <!-- 임직원 로그인 시 : 임직원 할인가 -->
                                <div class="price clearboth sale_price_con">
                                    <p class="del">￦88,000</p>
                                    <strong class="sale">50%</strong>
                                    <em>￦44,000</em>
                                    <div class="sale_price">
                                        <p class="del">￦88,000</p>
                                        <strong class="sale">70%</strong>
                                        <em><span>임직원 할인가</span><strong>￦26,400</strong></em>
                                    </div>
                                </div>
                                <!-- //임직원 로그인 시 : 임직원 할인가 -->
                                <!-- 제휴사 로그인 시 : 제휴사할인 상품 -->
                                <div class="price clearboth sale_price_con">
                                    <p class="del">￦88,000</p>
                                    <strong class="sale">50%</strong>
                                    <em>￦44,000</em>
                                    <div class="sale_price">
                                        <p class="del">￦88,000</p>
                                        <strong class="sale">70%</strong>
                                        <em><span>제휴사 할인가</span><strong>￦26,400</strong></em>
                                    </div>
                                </div>
                                <!-- //제휴사 로그인 시 : 제휴사할인 상품 -->
                                <div class="benefit">
                                    <ul>
                                        <li>
                                            <span>추가혜택</span>
                                            현대카드 결제시 3~6개월 무이자
                                            <button class="btn_arrow">자세히</button>
                                        </li>
                                        <li>
                                            <span>적립금</span>
                                            440원 (1%)
                                        </li>
                                        <!-- <li>
                                            <span>쿠폰혜택</span>
                                            신규 회원가입 10% 할인
                                            <button class="btn_arrow">쿠폰모두받기</button>
                                        </li> -->
                                        <li>
                                            <span>배송비</span>
                                            30,000원 이상 무료배송
                                            <!-- <div class="tooltip-area">
                                                <button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
                                                TOOLTIP
                                                <div class="tooltip-layer left top">
                                                    <div class="tooltip-con">
                                                        <div class="list">
                                                            <ul>
                                                                <li>배송 정책에 따른 배송정보 값 출력</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                //TOOLTIP
                                            </div> -->
                                        </li>
                                    </ul>
                                </div>
                                <div class="slt_option">
                                    <h3>옵션선택</h3>
                                    <div class="color_pick">
                                        <ul>
                                            <li class="atv">
                                                <input type="radio" id="color-1" name="color">
                                                <label for="color-1">
                                                    <span class="color" data-color="#071836" style="background-color:#071836">NAVY</span>
                                                </label>
                                            </li>
                                            <li>
                                                <input type="radio" id="color-2" name="color">
                                                <label for="color-2">
                                                    <span class="color" data-color="#40ba87" style="background-color:#40ba87">GREEN</span>
                                                </label>
                                            </li>
                                            <li>
                                                <input type="radio" id="color-3" name="color">
                                                <label for="color-3">
                                                    <span class="color" data-color="#febf4e" style="background-color:#febf4e">ORANGE</span>
                                                </label>
                                            </li>
                                            <li>
                                                <input type="radio" id="color-4" name="color">
                                                <label for="color-4" class="contrast">
                                                    <span class="color" data-color="#fee24e" style="background-color:#fee24e">YELLOW</span>
                                                </label>
                                            </li>
                                            <li>
                                                <input type="radio" id="color-5" name="color">
                                                <label for="color-5" class="contrast">
                                                    <span class="color" data-color="#fff5c7" style="background-color:#fff5c7">IVORY</span>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="size">
                                        <ul>
                                            <li><input type="radio" id="size-1" name="size" checked="checked"><label for="size-1">XS</label></li>
                                            <li><input type="radio" id="size-2" name="size"><label for="size-2">S</label></li>
                                            <li><input type="radio" id="size-3" name="size"><label for="size-3">M</label></li>
                                            <li><input type="radio" id="size-4" name="size"disabled="disable"><label for="size-4">L</label></li>
                                        </ul>
                                        <!-- <ul>
                                            <li><input type="radio" id="size-5" name="size" disabled="disable"><label for="size-5">XL</label></li>
                                            <li><input type="radio" id="size-6" name="size"><label for="size-6">XXL</label></li>
                                            <li><input type="radio" id="size-7" name="size"><label for="size-7">XXXL</label></li>
                                        </ul> -->
                                        <!-- <button class="btn_small">재입고 알림</button> -->
                                    </div>
                                    <div class="option">
                                        <span class="select">
                                            <select id="select1" title="옵션선택">
                                                <option selected="selected">옵션선택</option>
                                                <option>리스트</option>
                                                <option>리스트</option>
                                                <option>리스트</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="pick_set">
                                        <div class="quantity">
                                            <ul>
                                                <li>
                                                    <p class="tit">Champion - 액션 스타일 빅 로고 기모 후드 (PXEAD4073) / NAVY / XS / 02. 안감 기모 추가</p>
                                                    <div class="b_slct">
                                                        <button type="button" class="minus">-</button>
                                                        <input type="text" value="1">
                                                        <button type="button" class="plus">+</button>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- <div class="pickup_btn">
                                            <ul>
                                                <li><a href="#n">택배</a></li>
                                                <li><a href="#n" class="on">매장픽업</a></li>
                                            </ul>
                                        </div> -->
                                    </div>
                                    <!-- <div class="pickup_info">
                                        <p class="txt">픽업하실 매장과 일정을 선택하세요.</p>
                                        <button class="btn_small">매장선택</button>
                                    </div> -->
                                </div>
                                <div class="total_price clearboth">
                                    <span class="tit">총합계</span>
                                    <strong class="price">￦44,000</strong>
                                </div>
                                <div class="btn_wrap">
                                    <button class="btn_large">장바구니</button>
                                    <button class="btn_large ok">바로구매</button>
                                    <button class="btn_large w100p btn_black">임직원 구매</button>
                                    <button class="btn_large w100p btn_black">제휴사 구매</button>
                                </div>
                            </div>
                        </div><!-- //product_inform -->
                    </div><!-- // product_inner -->
                    <div class="product_review">
                        <h4 class="tit_review">리뷰 <span>(28)</span></h4>
                        <div class="point_wp">
                            <ul class="clearboth">
                                <li>
                                    <p class="tit">기본적립 포인트</p>
                                    <div class="pbx">
                                        <strong class="point"><span>500</span>P</strong>
                                        <p class="desc">일반리뷰 작성 시<br>500포인트 지급</p>
                                    </div>
                                    <div class="pbx">
                                        <strong class="point"><span>1,000</span>P</strong>
                                        <p class="desc">포토리뷰 작성 시<br>1,000포인트 지급</p>
                                    </div>
                                </li>
                                <li>
                                    <p class="tit">추가적립 포인트</p>
                                    <div class="pbx">
                                        <strong class="point"><span>200</span>P</strong>
                                        <p class="desc">선착순 3번째 작성 시<br>200포인트 지급</p>
                                    </div>
                                    <div class="pbx">
                                        <strong class="point"><span>10,000</span>P</strong>
                                        <p class="desc">베스트리뷰 선정 시<br>10,000포인트 지급</p>
                                    </div>
                                </li>
                            </ul>
                            <a href="#n" class="btn_review">리뷰작성</a>
                        </div>
                        <div class="rating_wp">
                            <dl class="rbx">
                                <dt>사이즈</dt>
                                <dd>정사이즈예요 <strong class="per">70%</strong></dd>
                            </dl>
                            <dl class="rbx">
                                <dt>컬러</dt>
                                <dd>화면과 같아요 <strong class="per">70%</strong></dd>
                            </dl>
                            <dl class="rbx">
                                <dt>요약</dt>
                                <dd>
                                    <strong class="point_score rate_04">4.0점</strong>
                                </dd>
                            </dl>
                        </div>
                        <div class="photo_riview">
                            <p class="pro_detail_tit">포토리뷰 모아보기</p>
                            <div class="gallery_slide">
                                <div class="swiper-container photo_review_thumbs">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_01.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_02.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_03.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_04.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_04.jpg" alt=""></div>
                                        <div class="swiper-slide"><img src="../../images/@temp/img_funding_view_04.jpg" alt=""></div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                </div>
                            </div>
                        </div>

                        <div class="all_review_wp">
                            <p class="pro_detail_tit">전체리뷰</p>
                            <div class="my_review_chk">
                                <input type="checkbox" id="my_review">
                                <label for="my_review"><span class="icon"></span>내가 등록한 리뷰</label>
                            </div>
                            <ul class="all_review_list">
                                <li>
                                    <div class="all_review_info_01 clearboth">
                                        <span class="star_05"></span>
                                        <strong>yh8901</strong>
                                        <em>2019-08-20</em>
                                    </div>
                                    <div class="all_review_info_02 clearboth">
                                        <dl>
                                            <dt>컬러 : </dt>
                                            <dd>베이지색, 더 어두워요</dd>
                                        </dl>
                                        <dl>
                                            <dt>사이즈 : </dt>
                                            <dd>95, 정사이즈에요.</dd>
                                        </dl>
                                        <span class="best">BEST</span>
                                    </div>
                                    <p class="review_txt">배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.<br>왔어요! 실문이 훨씬 이뻐요! 배송이 하루만에 왔어요!</p>
                                    <ul class="user_imgList clearboth">
                                        <li><img src="../../images/@temp/img_review_user_01.jpg" alt=""></li>
                                        <li><img src="../../images/@temp/img_review_user_02.jpg" alt=""></li>
                                        <li><a href="#" class="img_more"><img src="../../images/@temp/img_review_user_02.jpg" alt=""><span>+3</span></a></li>
                                    </ul>
                                    <div class="btn_wrap">
                                        <button class="btn_small gray">삭제</button>
                                        <button class="btn_small ">수정</button>
                                    </div>
                                </li>
                                <li>
                                    <div class="all_review_info_01 clearboth">
                                        <span class="star_05"></span>
                                        <strong>yh8901</strong>
                                        <em>2019-08-20</em>
                                    </div>
                                    <div class="all_review_info_02 clearboth">
                                        <dl>
                                            <dt>컬러 : </dt>
                                            <dd>베이지색, 더 어두워요</dd>
                                        </dl>
                                        <dl>
                                            <dt>사이즈 : </dt>
                                            <dd>95, 정사이즈에요.</dd>
                                        </dl>
                                    </div>
                                    <p class="review_txt">배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.<br>왔어요! 실문이 훨씬 이뻐요! 배송이 하루만에 왔어요!</p>
                                </li>
                                <li>
                                    <div class="all_review_info_01 clearboth">
                                        <span class="star_05"></span>
                                        <strong>yh8901</strong>
                                        <em>2019-08-20</em>
                                    </div>
                                    <div class="all_review_info_02 clearboth">
                                        <dl>
                                            <dt>컬러 : </dt>
                                            <dd>베이지색, 더 어두워요</dd>
                                        </dl>
                                        <dl>
                                            <dt>사이즈 : </dt>
                                            <dd>95, 정사이즈에요.</dd>
                                        </dl>
                                    </div>
                                    <p class="review_txt">배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.<br>왔어요! 실문이 훨씬 이뻐요! 배송이 하루만에 왔어요!</p>
                                </li>
                                <li>
                                    <div class="all_review_info_01 clearboth">
                                        <span class="star_05"></span>
                                        <strong>yh8901</strong>
                                        <em>2019-08-20</em>
                                    </div>
                                    <div class="all_review_info_02 clearboth">
                                        <dl>
                                            <dt>컬러 : </dt>
                                            <dd>베이지색, 더 어두워요</dd>
                                        </dl>
                                        <dl>
                                            <dt>사이즈 : </dt>
                                            <dd>95, 정사이즈에요.</dd>
                                        </dl>
                                    </div>
                                    <p class="review_txt">배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.<br>왔어요! 실문이 훨씬 이뻐요! 배송이 하루만에 왔어요!</p>
                                </li>
                                <li>
                                    <div class="all_review_info_01 clearboth">
                                        <span class="star_05"></span>
                                        <strong>yh8901</strong>
                                        <em>2019-08-20</em>
                                    </div>
                                    <div class="all_review_info_02 clearboth">
                                        <dl>
                                            <dt>컬러 : </dt>
                                            <dd>베이지색, 더 어두워요</dd>
                                        </dl>
                                        <dl>
                                            <dt>사이즈 : </dt>
                                            <dd>95, 정사이즈에요.</dd>
                                        </dl>
                                    </div>
                                    <p class="review_txt">배송이 하루만에 왔어요! 실물이 훨씬 이뻐요.<br>왔어요! 실문이 훨씬 이뻐요! 배송이 하루만에 왔어요!</p>
                                </li>
                            </ul>
                            <div class="pagination">
                                <span class="img_arrow first">
                                    <em class="blind">첫 페이지로 이동</em>
                                </span>
                                <span class="img_arrow prev">
                                    <em class="blind">이전 페이지로 이동</em>
                                </span>
                                <a href="#" class="num on">1</a>
                                <a href="#" class="num">2</a>
                                <a href="#" class="num">3</a>
                                <a href="#" class="num">4</a>
                                <a href="#" class="num">5</a>
                                <a href="#" class="num">6</a>
                                <a href="#" class="num">7</a>
                                <a href="#" class="num">8</a>
                                <span class="img_arrow next">
                                    <em class="blind">다음 페이지로 이동</em>
                                </span>
                                <span class="img_arrow last">
                                    <em class="blind">마지막 페이지로 이동</em>
                                </span>
                            </div>
                        </div>
                        <div class="tab_wrap anchor">
                            <ul class="tab n3">
                                <li><a href="javascript:;" onclick="fnMove_m_top('1')">상품상세</a></li>
                                <li><a href="javascript:;" onclick="fnMove_m_top('2')">교환/반품</a></li>
                                <li><a href="javascript:;" onclick="fnMove_m_top('3')">문의</a></li>
                            </ul>
                            <div class="tab_cont" id="tab_scroll_01">
                                <div class="goods_editor_wrap">
                                    editor area
                                </div>
                                <p class="pro_detail_tit mt50">상품정보</p>
                                <div class="table_wrap">
                                    <table class="tb_row">
                                        <caption>상품정보 : 제품소재, 색상, 치수, 제조자, 제조국, 시즌정보, 세탁방법 및 취급시 주의사항, 제조년원일, 품질보증기준, A/S 책임자와 전화번호, 수선불가 항목, 기타를 알 수 있는 표 입니다.</caption>
                                        <colgroup>
                                            <col style="width:20%">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">제품소재</th>
                                                <td>[겉 감] 폴리에스터 100%, [안 감] 폴리에스터 95%, [안 감] 폴리우레탄 5%</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">색상</th>
                                                <td>PIP</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">치수</th>
                                                <td>FRE</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">제조자</th>
                                                <td>(주)신원</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">제조국</th>
                                                <td>한국</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">시즌정보</th>
                                                <td>F/W</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">세탁방법 및 취급시 주의사항</th>
                                                <td>본 상품은 반드시 드라이크리닝 해주시기 바랍니다. (세탁 케어라벨 참조)</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">제조년원일</th>
                                                <td>2019년 9월</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">품질보증기준</th>
                                                <td>제품 이상 시 송정거래위원회 고시 소비자분쟁해결기준에 의거 보상합니다.</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">A/S 책임자와 전화번호</th>
                                                <td>(주)신원 1661-2585</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">수선불가 항목</th>
                                                <td>※ 소매기장 / 총장 / 밑단 수선등 디자인 변경불가 (리폼 불가)</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">기타</th>
                                                <td>※ 적용된 모든 엑세서리는 코디용 아이템 입니다.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="div_col02 clearboth">
                                    <div class="together_goods_view_area">
                                        <p class="pro_detail_tit">함게 본 상품</p>
                                        <ul class="clearboth">
                                            <li><a href="#"><img src="../../images/@temp/img_funding_together.jpg" alt=""></a></li>
                                            <li><a href="#"><img src="../../images/@temp/img_funding_together.jpg" alt=""></a></li>
                                            <li><a href="#"><img src="../../images/@temp/img_funding_together.jpg" alt=""></a></li>
                                        </ul>
                                    </div>
                                    <div class="together_goods_match_area">
                                        <p class="pro_detail_tit">함께 매치하기 좋은 상품</p>
                                        <ul class="clearboth">
                                            <li><a href="#"><img src="../../images/@temp/img_funding_together.jpg" alt=""></a></li>
                                            <li><a href="#"><img src="../../images/@temp/img_funding_together.jpg" alt=""></a></li>
                                            <li><a href="#"><img src="../../images/@temp/img_funding_together.jpg" alt=""></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="tab_cont" id="tab_scroll_02">
                                <p class="pro_detail_tit">교환/반품 안내</p>
                                <div class="table_wrap">
                                    <table class="tb_row">
                                        <caption>펀딩 상품정보 : 제품소재, 색상, 치수, 제조자, 제조국, 세탁방법 및 취급시 주의사항, 제조년원일, 품질보증기준, A/S 책임자와 전화번호, 수선불가 항목, 기타를 알 수 있는 표 입니다.</caption>
                                        <colgroup>
                                            <col style="width:20%">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">교환 및 반품이 가능한 경우</th>
                                                <td>
                                                    <ul class="bullet_tbl_minus">
                                                        <li>상품을 공급 받으신 날로부터 7일이내 단, 고객님의 임의수선등의 상품훼손으로 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.</li>
                                                        <li>공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된 경우에 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내</li>
                                                    </ul>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">교환 및 반품이 불가능한 경우</th>
                                                <td>
                                                    <ul class="bullet_tbl_minus">
                                                        <li>고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외 </li>
                                                        <li>고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (수선등).</li>
                                                        <li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</li>
                                                        <li>복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)</li>
                                                    </ul>
                                                    <p class="bullet_dangu">고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담 하셔야 합니다. (색상 교환, 사이즈 교환 등 포함)</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab_cont" id="tab_scroll_03">
                                <div class="pro_detail_tit_wp">
                                    <input type="checkbox" id="check-2">
                                    <label for="check-2" class="mr15"><span class="icon"></span>내가 등록한 문의</label>
                                    <div class="btn_right">
                                        <button class="btn_cont deep_puple">문의하기</button>
                                    </div>
                                </div>
                                <ul class="qna_replay_acc_list">
                                    <li>
                                         <button type="button" class="clearboth">
                                             <p class="fl">
                                                 <span class="qna_replay_stat ok">답변완료</span>
                                                 <span class="qna_subject">배송은 언제쯤 되나요?</span>
                                             </p>
                                             <p class="fr">
                                                 <span class="qna_auth">fjdkfu94</span>
                                                 <span class="qna_w_date">2019-09-22</span>
                                             </p>
                                         </button>
                                         <div class="qna_repla_detail">
                                             <dl class="q_text clearboth">
                                                 <dt>Q</dt>
                                                 <dd>배송은 언제쯤 되나요?<br>주문한 상품을 내일 입으려고 하는데, 아직 발송전이네요..<br>빨리 입고 싶어요..</dd>
                                             </dl>
                                             <dl class="a_text clearboth">
                                                 <dt>A</dt>
                                                 <dd>고객님,<br>많이 당황하셨어요??<br>결제내역은 확인 되었습니다.<br>주문 후 배송까지는 보통 1 ~ 3일이 소요됩니다.<span class="qna_replay_date">2019-09-22</span></dd>
                                             </dl>
                                         </div>
                                    </li>
                                    <li>
                                        <button type="button" class="clearboth">
                                            <p class="fl">
                                                <span class="qna_replay_stat">답변대기</span>
                                                <span class="qna_subject">오늘 주문했는데요, 배송은 언제쯤 되는건가요?</span>
                                            </p>
                                            <p class="fr">
                                                <span class="qna_auth">fjdkfu94</span>
                                                <span class="qna_w_date">2019-09-22</span>
                                            </p>
                                        </button>
                                        <div class="qna_repla_detail">
                                            <dl class="q_text clearboth">
                                                <dt>Q</dt>
                                                <dd>오늘 주문했는데요,<br>배송은 언제쯤 되는건가요. 빨리 받고 싶네요.<br>주말에 입을건데, 그냥 착불로 퀵 보내주실 수는 없나요??<br>회원정보에 기재된 연락처로 연락주세요!!</dd>
                                            </dl>
                                            <!-- D S : 내 글 일때 -->
                                            <div class="btn_wrap clearboth">
                                                <button class="btn_small gray">삭제</button>
                                                <button class="btn_small">수정</button>
                                            </div>
                                            <!-- D E : 내 글 일때 -->
                                        </div>
                                    </li>
                                    <li>
                                        <button type="button" class="clearboth">
                                            <p class="fl">
                                                <span class="qna_replay_stat ok">답변완료</span>
                                                <span class="qna_subject secret">비밀글 입니다.</span>
                                            </p>
                                            <p class="fr">
                                                <span class="qna_auth">오수발</span>
                                                <span class="qna_w_date">2019-09-22</span>
                                            </p>
                                        </button>
                                        <div class="qna_repla_detail">
                                            <dl class="q_text clearboth">
                                                <dt>Q</dt>
                                                <dd>배송은 언제쯤 되나요?<br>주문한 상품을 내일 입으려고 하는데, 아직 발송전이네요..<br>빨리 입고 싶어요..</dd>
                                            </dl>
                                            <dl class="a_text clearboth">
                                                <dt>A</dt>
                                                <dd>고객님,<br>많이 당황하셨어요??<br>결제내역은 확인 되었습니다.<br>주문 후 배송까지는 보통 1 ~ 3일이 소요됩니다.<span class="qna_replay_date">2019-09-22</span></dd>
                                            </dl>
                                        </div>
                                    </li>
                                    <li>
                                        <button type="button" class="clearboth">
                                            <p class="fl">
                                                <span class="qna_replay_stat ok">답변완료</span>
                                                <span class="qna_subject">배송은 언제쯤 되나요?</span>
                                            </p>
                                            <p class="fr">
                                                <span class="qna_auth">오수발</span>
                                                <span class="qna_w_date">2019-09-22</span>
                                            </p>
                                        </button>
                                        <div class="qna_repla_detail">
                                            <dl class="q_text clearboth">
                                                <dt>Q</dt>
                                                <dd>배송은 언제쯤 되나요?<br>주문한 상품을 내일 입으려고 하는데, 아직 발송전이네요..<br>빨리 입고 싶어요..</dd>
                                            </dl>
                                            <dl class="a_text clearboth">
                                                <dt>A</dt>
                                                <dd>고객님,<br>많이 당황하셨어요??<br>결제내역은 확인 되었습니다.<br>주문 후 배송까지는 보통 1 ~ 3일이 소요됩니다.<span class="qna_replay_date">2019-09-22</span></dd>
                                            </dl>
                                        </div>
                                    </li>
                                </ul>
                                <div class="pagination">
                                    <span class="img_arrow first">
                                        <em class="blind">첫 페이지로 이동</em>
                                    </span>
                                    <span class="img_arrow prev">
                                        <em class="blind">이전 페이지로 이동</em>
                                    </span>
                                    <a href="#" class="num on">1</a>
                                    <a href="#" class="num">2</a>
                                    <a href="#" class="num">3</a>
                                    <a href="#" class="num">4</a>
                                    <a href="#" class="num">5</a>
                                    <a href="#" class="num">6</a>
                                    <a href="#" class="num">7</a>
                                    <a href="#" class="num">8</a>
                                    <span class="img_arrow next">
                                        <em class="blind">다음 페이지로 이동</em>
                                    </span>
                                    <span class="img_arrow last">
                                        <em class="blind">마지막 페이지로 이동</em>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div><!-- //product_review -->
                </div>
            </div>
        </div>
    </div>
    <!--// Content -->



<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
	$(function(){
	    $('input').on('click',function(){
	        var li = $(this).parents('li');
	        li.addClass('atv').siblings().removeClass('atv');
	    })
	})


    $(function(){
        var galleryThumbs = new Swiper('.gallery-thumbs', {
            spaceBetween: 2,
            slidesPerView: 4,
            freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
        });
        var galleryTop = new Swiper('.gallery-top', {
            autoHeight: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            thumbs: {
                swiper: galleryThumbs
            }
        });
        var galleryPhoto = new Swiper('.photo_review_thumbs', {
            slidesPerView: 4,
            spaceBetween: 20,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    });
</script>>