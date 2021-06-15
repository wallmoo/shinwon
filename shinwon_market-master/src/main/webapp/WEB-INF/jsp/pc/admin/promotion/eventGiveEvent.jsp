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

            <h2 class="title"><span>이벤트 당첨자 관리</span></h2>

            <div class="tab-list"><!-- tab -->
               <ul class="tab">
                  <li><a href="#none">당첨자 선정 이벤트</a></li>
                  <li class="in"><a href="#">즉시 지급 이벤트</a></li>
               </ul>
            </div><!-- // tab -->

            <h3 class="title"><span>검색</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>이벤트 기간</span></th>
                            <td colspan="3">
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
                        <tr><!-- row -->
                            <th><span>이벤트 유형</span></th>
                            <td>
                                <select class="select">
                                    <option value="">전체</option>
                                    <option value="">럭키드로우</option>
                                    <option value="">응원하기</option>
                                    <option value="">투표</option>
                                </select>
                            </td>
                            <th><span>이벤트명</span></th>
                            <td>
                                <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text large" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>진행여부</span></th>
                            <td colspan="3">
                                <input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">진행</label>
                                <input type="radio" id="stateC" name="" class="radio"  value="N" />
                                <label for="stateC">종료</label>
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

                <h3 class="title"><span>목록</span></h3>

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                        <span class="pages">
                            (총 <strong class="em">1</strong>건, 1 of 1 page)
                        </span>
                    </div>

                    <!--<div class="col-1-2 text-right">
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div> -->
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 12%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                        <col style="width: 8%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>이벤트 유형</th>
                            <th>이벤트 명</th>
                            <th>이벤트 기간</th>
                            <th>진행여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>럭키드로우</td>
                            <td><a href="#">선물이 하늘에서 비처럼 내려와!</a></td>
                            <td>2019-11-02 ~ 2019-12-02</td>
                            <td>진행</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>응원하기</td>
                            <td><a href="#">지나식스의 새로운 신상품은?</a></td>
                            <td>2019-11-02 ~ 2019-12-02</td>
                            <td>종료</td>
                        </tr>
                        </tbody>
                </table>
                </form>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
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
