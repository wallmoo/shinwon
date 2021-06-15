<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

        <div class="container">

            <h2 class="title"><span>채널 ON</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>등록일</span></th>
                            <td colspan="5">
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" name="searchPlnMstStDt" value="2020-01-21" readonly="readonly" data-target-end="#searchPlnMstEdDt"> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" name="searchPlnMstEdDt" value="2020-01-21" readonly="readonly" data-target-start="#searchPlnMstStDt">
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><span>키워드</span></th>
                            <td>
                              <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text large" value=""/>
                            </td>
                            <th><span>채널</span></th>
                            <td>
                                <input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">PC</label>
                                <input type="radio" id="stateC" name="" class="radio"  value="N" />
                                <label for="stateC">MOBILE</label>
                            </td>
                            <th><span>전시상태</span></th>
                            <td>
                                <input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">전시</label>
                                <input type="radio" id="stateC" name="" class="radio"  value="N" />
                                <label for="stateC">미전시</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>유형</span></th>
                            <td>
                              <select class="select">
                                    <option>선택</option>
                              </select>
                            </td>
                            <th><span>시즌</span></th>
                            <td colspan="3">
                                <select class="select">
                                    <option>선택</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="#none" id="search" class="button small primary"><span>검색</span></a>
            </div>

            <form id="frm" name="frm">
               <input type="hidden" name="PLN_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="" />
                <input type="hidden" name="searchPlnMstShopType" value="" />
                <input type="hidden" name="searchPlnMstTitle" value="" />
                <input type="hidden" name="searchPlnMstStDt" value="2020-01-21" />
                <input type="hidden" name="searchPlnMstEdDt" value="2020-01-21" />
                <input type="hidden" name="searchPlnMstStatus" value="" />
                <input type="hidden" name="searchPlnMstUseYn" value="" />

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                        <span class="pages">
                            (총 <strong class="em">1</strong>건, 1 of 1 page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: auto;" />
                        <col style="width: 5%;" />
                        <col style="width: 15%;" />
                        <col style="width: 20%;" />
                        <col style="width: 5%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>채널</th>
                            <th>유형</th>
                            <th>영상제목</th>
                            <th>상품수</th>
                            <th>등록일</th>
                            <th>전시기간</th>
                            <th>전시여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>상단</td>
                            <td>전체</td>
                            <td>여성</td>
                            <td class="text-left"><a href="#">가을을 열어보다...</a></td>
                            <td>10</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>2019-01-02 12:00 ~ 2019-01-30 18:00</td>
                            <td>
                                <select class="select">
                                    <option value="">전시</option>
                                    <option value="">미전시</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>전체</td>
                            <td>남성</td>
                            <td class="text-left"><a href="#">2019 SIEG 가을신상 하울</a></td>
                            <td>10</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>2019-01-02 12:00 ~ 2019-01-30 18:00</td>
                            <td>
                                <select class="select">
                                    <option value="">전시</option>
                                    <option value="">미전시</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>전체</td>
                            <td>라이프</td>
                            <td class="text-left"><a href="#">GINNASIX 2019FW</a></td>
                            <td>10</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>2019-01-02 12:00 ~ 2019-01-30 18:00</td>
                            <td>
                                <select class="select">
                                    <option value="">전시</option>
                                    <option value="">미전시</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>전체</td>
                            <td>뷰티</td>
                            <td class="text-left"><a href="#">파렌하이트 2019 F/W</a></td>
                            <td>10</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>2019-01-02 12:00 ~ 2019-01-30 18:00</td>
                            <td>
                                <select class="select">
                                    <option value="">전시</option>
                                    <option value="">미전시</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>전체</td>
                            <td>여성</td>
                            <td class="text-left"><a href="#">VIKI 2019 S/S Campaign Trip Inside</a></td>
                            <td>10</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>2019-01-02 12:00 ~ 2019-01-30 18:00</td>
                            <td>
                                <select class="select">
                                    <option value="">전시</option>
                                    <option value="">미전시</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                </table>
                </form>

                <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                </div><!-- // section button -->

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                    </div>
                </div><!-- // section pagination -->

        </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){

});
//-->
</script>

</body>
</html>
