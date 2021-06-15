<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<title>쑈윈도 | 이벤트 | 공동구매</title>

<script>
    $(function(){
        var mySwiper = new Swiper ('.swiper-container', {
            loop:true,
            autoplay: {
                delay: 4000,
            },
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            }
        });

        $(".swiper-container").mouseenter(function() {
            mySwiper.autoplay.stop();
        });

        $(".swiper-container").mouseleave(function() {
            mySwiper.autoplay.start();
        });
    });
</script>



<!-- Content -->
    <div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <div class="location">
                <ol class="clearboth">
                    <li><a href="#" class="home">홈</a></li>
                    <li class="active">
                        <a href="#">1Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">1Depth Menu 01</a></li>
                            <li><a href="#">1Depth Menu 02</a></li>
                            <li><a href="#">1Depth Menu 03</a></li>
                            <li><a href="#">1Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">2Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">2Depth Menu 01</a></li>
                            <li><a href="#">2Depth Menu 02</a></li>
                            <li><a href="#">2Depth Menu 03</a></li>
                            <li><a href="#">2Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">3Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">3Depth Menu 01</a></li>
                            <li><a href="#">3Depth Menu 02</a></li>
                            <li><a href="#">3Depth Menu 03</a></li>
                            <li><a href="#">3Depth Menu 04</a></li>
                        </ul>
                    </li>
                </ol>
            </div>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">이벤트</h2>
            </div>
            <!--// Title -->

            <!-- .pg_sub_tit_wrap -->
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl">${info.EVT_MST_TITLE}</h3>
            </div>
            <!-- // .pg_sub_tit_wrap -->
            <!-- .goods_buy09 -->
            <div class="goods_buy09">
                <div class="goods_buy09_img_area">
                	 <img src="${cdnDomain}${imgList.get(1).FILE_NM}" alt="${imgList.get(1).CMN_FLE_ALT_TXT}">
                </div>
                <!-- .goods_buy09_dev -->
                <div class="goods_buy09_dev">
                    <h4>이달의 신동구매 상품</h4>
                    <ul class="month_goods09_exp clearboth">
                        <li>
                            <dl>
                                <dt>기간</dt> 
                                <dd>${info.EVT_MST_ST_DT} ~ ${info.EVT_MST_ED_DT}</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>쿠폰발급</dt>
                                <dd>2019-10-01</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>구매기간</dt>
                                <dd>${info.EVT_MST_BUY_ST_DT} ~ ${info.EVT_MST_BUY_ED_DT}</dd>
                            </dl>
                        </li>
                    </ul>
                    <h5>${info.EVT_MST_PRD_NM}</h5>
                    <!-- .swiper_wrap -->
                    <div class="swiper_wrap">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                            	<c:forEach var="imgRow" items="${imgList}" varStatus="status">
                            		<c:if test="${status.index ge  4 and status.index le 8}">
                            			<div class="swiper-slide"><img src="${cdnDomain}${imgRow.FILE_NM}" alt="${imgRow.CMN_FLE_ALT_TXT}"></div>
                            		</c:if>
			                        
		                       	</c:forEach>
                            </div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <!-- // .swiper_wrap -->
                    <!-- .status_participation -->
                    <div class="status_participation">
                        <div class="tbl_prograss" data-col='1'>
                            <span class="txt_01">참여인원</span>
                            <span class="txt_02">할인율</span>
                            <ul class="clearboth">
                                <li>
                                    <dl>
                                        <dt>100명</dt>
                                        <dd>15%</dd>
                                    </dl>
                                </li>
                            </ul>
                            <div class="bar_wrap">
                                <span class="bar" style="width:25%;">25%</span>
                            </div>
                        </div>

                        <div class="tbl_prograss" data-col='2'>
                            <span class="txt_01">참여인원</span>
                            <span class="txt_02">할인혜택</span>
                            <ul class="clearboth">
                                <li>
                                    <dl class="move">
                                        <dt>100명</dt>
                                        <dd>15%</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt>300명</dt>
                                        <dd>35%</dd>
                                    </dl>
                                </li>
                            </ul>
                            <div class="bar_wrap">
                                <span class="bar" style="width:25%;">25%</span>
                            </div>
                        </div>

                        <div class="tbl_prograss" data-col='3'>
                            <span class="txt_01">참여인원</span>
                            <span class="txt_02">할인율</span>
                            <ul class="clearboth">
                                <li>
                                    <dl class="move">
                                        <dt>100명</dt>
                                        <dd>15%</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl class="move">
                                        <dt>300명</dt>
                                        <dd>30%</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt>800명</dt>
                                        <dd>55%</dd>
                                    </dl>
                                </li>
                            </ul>
                            <div class="bar_wrap">
                                <span class="bar" style="width:60%;">60%</span>
                            </div>
                        </div>
                    </div>
                    <!-- // .status_participation -->
                    <div class="btn_wrap mt100">
                        <button type="button" class="btn_large ok">신동구매 신청</button>
                    </div>
                    <!-- .share_box -->
                    <div class="share_box clearboth">
                        <dl>
                            <dt><strong>189명</strong> 신동구매 신청중</dt>
                            <dd>소문내고 최대 55% 할인받으세요!</dd>
                        </dl>
                        <button type="button" class="btn_share_circle">공유하기</button>
                    </div>
                    <!-- // .share_box -->
                    <h4>신동구매 참여별 할인혜택</h4>
                    <div class="table_wrap">
                        <table class="tb_col">
                            <caption>공동구매의 참여 달성구간, 할인혜택을 알 수 있는 표 입니다.</caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="width:70%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">참여 달성구간</th>
                                    <th scope="col">할인혜택</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="prdRow" items="${prdList}" varStatus="status">
                            		<tr>
                                    <td>${prdRow.EVT_PNT_VAL}명</td>
                                    <td>${prdRow.CPN_MST_TITLE}</td>
                                	</tr>
                            	</c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="goods_buy09_img_area mt100">
                    	 <img src="${cdnDomain}${imgList.get(9).FILE_NM}" alt="${imgList.get(9).CMN_FLE_ALT_TXT}">
                    </div>
                </div>
                <!-- //.goods_buy09_dev -->
            </div>
            <!-- // .goods_buy09 -->
            <div class="caution_img_area">
                <img src="/nas/cdn/PW/images/@temp/img_cause_5.png" alt="">
            </div>

            <div class="btn_wrap mt100">
                <button type="button" class="btn_large">목록</button>
            </div>

        </div>
    </div>
    <!--// Content -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>