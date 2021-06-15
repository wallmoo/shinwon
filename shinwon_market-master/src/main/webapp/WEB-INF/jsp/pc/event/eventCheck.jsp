<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<title>쑈윈도 | 이벤트 | 출석체크</title>


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
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">이벤트</h2>
            </div>
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl">${info.EVT_MST_TITLE}</h3>
            </div>
            <!-- .event_calrender -->
            <div class="event_calrender" style="background-image:url(../../images/@temp/bg_event_calrender.jpg);">
                <!-- .tbl_event_calrender -->
                <div class="tbl_event_calrender">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>SUN</th>
                                <th>MON</th>
                                <th>TUE</th>
                                <th>WED</th>
                                <th>THU</th>
                                <th>FRI</th>
                                <th>SAT</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="cell">
                                        
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">1</span>
                                        <input type="checkbox" name="attendance" id="day_1">
                                        <label for="day_1">1</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">2</span>
                                        <input type="checkbox" name="attendance" id="day_2">
                                        <label for="day_2">2</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">3</span>
                                        <input type="checkbox" name="attendance" id="day_3">
                                        <label for="day_3">3</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">4</span>
                                        <input type="checkbox" name="attendance" id="day_4">
                                        <label for="day_4">4</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt sun">5</span>
                                        <input type="checkbox" name="attendance" id="day_5">
                                        <label for="day_5">5</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">6</span>
                                        <input type="checkbox" name="attendance" id="day_6">
                                        <label for="day_6">6</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">7</span>
                                        <input type="checkbox" name="attendance" id="day_7">
                                        <label for="day_7">7</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">8</span>
                                        <input type="checkbox" name="attendance" id="day_8">
                                        <label for="day_8">8</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">9</span>
                                        <input type="checkbox" name="attendance" id="day_9">
                                        <label for="day_9">9</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">10</span>
                                        <input type="checkbox" name="attendance" id="day_10">
                                        <label for="day_10">10</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">11</span>
                                        <input type="checkbox" name="attendance" id="day_11">
                                        <label for="day_11">11</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt sun">12</span>
                                        <input type="checkbox" name="attendance" id="day_12">
                                        <label for="day_12">12</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">13</span>
                                        <input type="checkbox" name="attendance" id="day_13">
                                        <label for="day_13">13</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">14</span>
                                        <input type="checkbox" name="attendance" id="day_14">
                                        <label for="day_14">14</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">15</span>
                                        <input type="checkbox" name="attendance" id="day_15">
                                        <label for="day_15">15</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">16</span>
                                        <input type="checkbox" name="attendance" id="day_16">
                                        <label for="day_16">16</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">17</span>
                                        <input type="checkbox" name="attendance" id="day_17">
                                        <label for="day_17">17</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">18</span>
                                        <input type="checkbox" name="attendance" id="day_18">
                                        <label for="day_18">18</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt sun">19</span>
                                        <input type="checkbox" name="attendance" id="day_19">
                                        <label for="day_19">19</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">20</span>
                                        <input type="checkbox" name="attendance" id="day_20">
                                        <label for="day_20">20</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">21</span>
                                        <input type="checkbox" name="attendance" id="day_21">
                                        <label for="day_21">21</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">22</span>
                                        <input type="checkbox" name="attendance" id="day_22">
                                        <label for="day_22">22</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">23</span>
                                        <input type="checkbox" name="attendance" id="day_23">
                                        <label for="day_23">23</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">24</span>
                                        <input type="checkbox" name="attendance" id="day_24">
                                        <label for="day_24">24</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">25</span>
                                        <input type="checkbox" name="attendance" id="day_25">
                                        <label for="day_25">25</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt sun">26</span>
                                        <input type="checkbox" name="attendance" id="day_26">
                                        <label for="day_26">26</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">27</span>
                                        <input type="checkbox" name="attendance" id="day_27">
                                        <label for="day_27">27</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">28</span>
                                        <input type="checkbox" name="attendance" id="day_28">
                                        <label for="day_28">28</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">29</span>
                                        <input type="checkbox" name="attendance" id="day_29">
                                        <label for="day_29">29</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">30</span>
                                        <input type="checkbox" name="attendance" id="day_30">
                                        <label for="day_30">30</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="day_txt">31</span>
                                        <input type="checkbox" name="attendance" id="day_31">
                                        <label for="day_31">31</label>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">

                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- // .tbl_event_calrender -->
            </div>
            <!-- // .event_calrender -->
            <div class="caution_img_area">
                <img src="../../images/@temp/img_cause_3.png" alt="">
            </div>
            <div class="btn_wrap event">
                <button type="button" class="btn_large">목록</button>
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>
    <!--// Content -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>