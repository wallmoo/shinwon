<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="event_detail">
                    <div class="evnet_detail_visual">
                        <img src="/nas/cdn/MW/images/content/event/img_attendance.jpg" alt="">
                    </div>
                    <div class="event_calendar">
                        <div class="table">
                            <table>
                                <caption>출석체크 달력</caption>
                                <colgroup>
                                    <col style="widht:15px;">
                                    <col style="widht:14px;">
                                    <col style="widht:14px;">
                                    <col style="widht:14px;">
                                    <col style="widht:14px;">
                                    <col style="widht:14px;">
                                    <col style="widht:15px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col" class="sun">SUN</th>
                                        <th scope="col">MON</th>
                                        <th scope="col">TUE</th>
                                        <th scope="col">WED</th>
                                        <th scope="col">THU</th>
                                        <th scope="col">FRI</th>
                                        <th scope="col" class="sat">SAT</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td><a href="#n" class="on"><span>1</span></a></td>
                                        <td><a href="#n" class="on"><span>2</span></a></td>
                                        <td><a href="#n" class="on"><span>3</span></a></td>
                                        <td><a href="#n" onclick="toggleLayer($('#pop_event_info'), 'on');"><span>4</span></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#n"><span>5</span></a></td>
                                        <td><a href="#n"><span>6</span></a></td>
                                        <td><a href="#n"><span>7</span></a></td>
                                        <td><a href="#n"><span>8</span></a></td>
                                        <td><a href="#n"><span>9</span></a></td>
                                        <td><a href="#n"><span>10</span></a></td>
                                        <td><a href="#n"><span>11</span></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#n"><span>12</span></a></td>
                                        <td><a href="#n"><span>13</span></a></td>
                                        <td><a href="#n"><span>14</span></a></td>
                                        <td><a href="#n"><span>15</span></a></td>
                                        <td><a href="#n"><span>16</span></a></td>
                                        <td><a href="#n"><span>17</span></a></td>
                                        <td><a href="#n"><span>18</span></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#n"><span>19</span></a></td>
                                        <td><a href="#n"><span>20</span></a></td>
                                        <td><a href="#n"><span>21</span></a></td>
                                        <td><a href="#n"><span>22</span></a></td>
                                        <td><a href="#n"><span>23</span></a></td>
                                        <td><a href="#n"><span>24</span></a></td>
                                        <td><a href="#n"><span>25</span></a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#n"><span>26</span></a></td>
                                        <td><a href="#n"><span>27</span></a></td>
                                        <td><a href="#n"><span>28</span></a></td>
                                        <td><a href="#n"><span>29</span></a></td>
                                        <td><a href="#n"><span>30</span></a></td>
                                        <td><a href="#n"><span>31</span></a></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="t_info">
                            <p>* 마지막날까지 빠짐없이 출석체크를 모두 하신 회원님께 스페셜 쿠폰이 지급됩니다.</p>
                        </div>
                        <div class="btn_area">
                            <button type="button" class="btn ok">출석체크</button>
                        </div>
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