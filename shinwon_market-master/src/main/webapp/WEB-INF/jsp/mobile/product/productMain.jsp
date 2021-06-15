<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top01.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="slider_wrap big_cate">
                    <div class="swiper-container no_paging">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><a href="/mobile/product/productMain.do"><img src="/nas/cdn/MW/images/_temp/img_visual_01.png" alt=""></a></div>
                            <div class="swiper-slide"><a href="/mobile/product/productMain.do"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt=""></a></div>
                            <div class="swiper-slide"><a href="/mobile/product/productMain.do"><img src="/nas/cdn/MW/images/_temp/img_visual_01.png" alt=""></a></div>
                            <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_visual_02.png" alt=""></a></div>
                            <div class="swiper-slide"><a href="#"><img src="/nas/cdn/MW/images/_temp/img_visual_01.png" alt=""></a></div>
                        </div>
                    </div>
                </div>
                <script>
                    var swiper = new Swiper('.big_cate .swiper-container', {
                        slidesPerView : 1.1,
                        spaceBetween: 10,
                        initialSlide: 0,
                        roundLengths: true
                    });
                </script>
                <div class="slider_wrap cicle_link_list">
                    <div class="swiper-container no_paging">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <a href="/mobile/product/productList.do">
                                    <img src="/nas/cdn/MW/images/_temp/img_cicle_link_01.png" alt="" class="cat_img">
                                    <span>TOP</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="/mobile/product/productList.do">
                                    <img src="/nas/cdn/MW/images/_temp/img_cicle_link_02.png" alt="" class="cat_img">
                                    <span>OUTER</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="/mobile/product/productList.do">
                                    <img src="/nas/cdn/MW/images/_temp/img_cicle_link_03.png" alt="" class="cat_img">
                                    <span>PANTS</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="/mobile/product/productList.do">
                                    <img src="/nas/cdn/MW/images/_temp/img_cicle_link_04.png" alt="" class="cat_img">
                                    <span>SKIRT</span>
                                </a>
                            </div>
                            <div class="swiper-slide">
                                <a href="/mobile/product/productList.do">
                                    <img src="/nas/cdn/MW/images/_temp/img_cicle_link_05.png" alt="" class="cat_img">
                                    <span>SCARF / MUFFLE SCARF / MUFFLE SCARF / MUFFLE</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    var swiper = new Swiper('.cicle_link_list .swiper-container', {
                        slidesPerView : 4.5,
                        spaceBetween: 12,
                        initialSlide: 0,
                        roundLengths: true
                    });
                </script>
                <div class="category_big">
                    <div class="list_title_option cf">
                        <select name="list_option" id="list_option">
                            <option value="1">조회순</option>
                            <option value="2">판매순</option>
                            <option value="3">리뷰순</option>
                        </select>
                    </div>
                    <div class="hr_line"></div>
                    <ul class="goods_list dual">
                        <li>
                            <a href="/mobile/product/productMain.do" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_01.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="/mobile/product/productMain.do" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_01.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_01.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                    </ul>
                    <div class="banner_area">
                        <a href="#"><img src="/nas/cdn/MW/images/_temp/img_temp_banner_01.jpg" alt="10% January Coupon"></a>
                    </div>
                    <ul class="goods_list dual">
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_01.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_01.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                        <li>
                            <a href="#" class="cf">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_category_webzine_02.png" alt="">
                                    <span class="ranking">01</span>
                                    <span class="flag_video">video</span>
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#신상품</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 겨울 한정 판매 봄을 맞이하는 여성스러운</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
