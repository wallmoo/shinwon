<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<title>투표 이벤트</title>

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

            <!-- .event_vote_wrap -->
            <div class="event_vote_wrap">
                <div class="img_thum">
                    <img src="${cdnDomain}${imgList.get(1).FILE_NM}" alt="${imgList.get(1).CMN_FLE_ALT_TXT}">
                </div>
                <h4>${info.EVT_MST_PRD_NM}</h4>
                <p class="exp">${info.EVT_MST_MEMO}</p>

                <!-- .status_participation -->
                <div class="status_participation">
                
                    <!-- .top_tit -->
                    <div class="top_tit clearboth">
                        <dl class="clearboth">
                            <dt>참여인원</dt>
                            <dd>11,610명</dd>
                        </dl>
                        <dl class="clearboth">
                            <dt>참여기간 :</dt>
                            <dd>2019-11-01 ~ 2019-11-15</dd>
                        </dl>
                    </div>
                    <!-- // .top_tit -->

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
                        <span class="txt_02">할인율</span>
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

                <div class="img_thum">
                    <img src="${cdnDomain}${imgList.get(4).FILE_NM}" alt="${imgList.get(4).CMN_FLE_ALT_TXT}">
                </div>

                <h5>참여별 혜택</h5>
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

                <div class="img_thum">
                    <img src="${cdnDomain}${imgList.get(5).FILE_NM}" alt="${imgList.get(5).CMN_FLE_ALT_TXT}">
                </div>

                <div class="btn_wrap mt100">
                    <button type="button" class="btn_large ok">응원 하기 </button>
                </div>

                <div class="caution_img_area">
                    <img src="${cdnDomain}${imgList.get(6).FILE_NM}" alt="${imgList.get(6).CMN_FLE_ALT_TXT}">
                </div>

            </div>
            <!-- // .event_vote_wrap --> 

            <div class="btn_wrap mt100">
                <button type="button" class="btn_large">목록</button>
            </div>

        </div>
    </div>
    <!--// Content -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>