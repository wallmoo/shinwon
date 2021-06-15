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

            <h2 class="title"><span>제휴사 할인관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
            <input type="hidden" name="pageSize" value="">
            <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="">
            <input type="hidden" name="searchYn" value="Y">
            <input type="hidden" id="searchDetailY" name="searchDetailY" value="none">

            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: auto;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr><!-- row -->
                        <th><span>시즌</span></th>
                        <td>연도
                            <select class="select">
                                <option>전체</option>
                                <option>2020</option>
                                <option>2019</option>
                            </select>
                            시즌
                            <select class="select">
                                <option>전체</option>
                                <option>F/W</option>
                                <option>S/S</option>
                            </select>
                        </td>
                        <th><span>품목</span></th>
                        <td>
                            <select class="select">
                                <option>일반</option>
                                <option>액세서리</option>
                                <option>퍼</option>
                                <option>가죽</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table><!-- // table -->
        </form>
        <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
            <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
            <a href="javascript:search();" class="button small primary"><span>검색</span></a>
        </div>

            <div class="clearfix">

                <!-- https://github.com/jzaefferer/jquery-treeview -->
                <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

            <div id="main_con">
                <div class="contents-inner"><!-- contents-inner -->
                    <form id="frm" name="frm">
                        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="2350">
                        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="">
                        <input type="hidden" id="DSP_MST_ENV" name="DSP_MST_ENV" value="P">
                        <input type="hidden" id="searchGubun" name="searchGubun" value="">

                        <div class="table-a"><!-- col list -->
                            <table class="table-row table-a">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody >
                                    <tr>
                                        <th>2020 춘하</th>
                                        <td>
                                            <table class="table-row table-a">
                                                <colgroup>
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>GINNASIX</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>iCONIQ</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>MARKM</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                    <tr>
                                                        <th>BESTIBELLI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>VIKI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>SI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                    <tr>
                                                        <th>ISABEY</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>SIEG</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>FAHRENHEIT</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>2019 춘하</th>
                                        <td>
                                            <table class="table-row table-a">
                                                <colgroup>
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>GINNASIX</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>iCONIQ</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>MARKM</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                    <tr>
                                                        <th>BESTIBELLI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>VIKI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>SI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                    <tr>
                                                        <th>ISABEY</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>SIEG</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>FAHRENHEIT</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>2015 추동</th>
                                        <td>
                                            <table class="table-row table-a">
                                                <colgroup>
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                    <col style="width:15%;">
                                                    <col style="width:auto;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>GINNASIX</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>iCONIQ</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>MARKM</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                    <tr>
                                                        <th>BESTIBELLI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>VIKI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>SI</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                    <tr>
                                                        <th>ISABEY</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>SIEG</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                        <th>FAHRENHEIT</th>
                                                        <td><input type="text" name="txt" placeholder="0"> % 할인</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- // col list -->
                    </form>
                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
                        </div>
                    </div>
                </div>
            </div>

            </div>

            <p>

            </p>
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

//-->
</script>

</body>
</html>
