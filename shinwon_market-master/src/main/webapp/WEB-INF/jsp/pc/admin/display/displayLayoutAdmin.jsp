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

            <h2 class="title"><span>전시레이아웃관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <input type="hidden" name="PRD_CTG_ENV" id="PRD_CTG_ENV" value="P" />
            <br/>
            <div class="clearfix">

                <!-- https://github.com/jzaefferer/jquery-treeview -->
                <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

                <div style="float: left; margin-right: 5px; padding: 10px 20px 10px 10px; border: solid 1px #ccc;">
                    <ul id="browser" class="filetree treeview-famfamfam treeview">
                        <li class="closed collapsable">
                            <div class="hitarea closed-hitarea collapsable-hitarea"></div>
                            <span class="folder">STORE</span>
                        </li>
                    </ul>
            </div>

            <div id="main_con" style="float: left; padding: 10px;"><div class="contents-inner"><!-- contents-inner -->

                <h3 class="title"><span>STORE</span></h3>
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="text-left">*상단 배너는 고정이며, 사용여부 및 순서 변경 불가합니다.</div>
                    <div class="text-right">
                        <a href="javascript:;" class="button small primary"><span>저장</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->
                <table class="table-col table-b">
                    <colgroup>
                        <col style="width: 7%;">
                        <col style="width: auto;">
                        <col style="width: 20%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>영역명</th>
                            <th>사용여부</th>
                            <th>전시순서</th>
                        </tr>
                    </thead>
                    <tbody class="sort-target">
                    <tr>
                        <td>1</td>
                        <td>NOW DEALS(나우딜)</td>
                        <td>
                            <input type="radio" class="radio" name="front_inp" checked="checked">
                            <label>사용</label>
                            <input type="radio" class="radio" name="front_inp">
                            <label>미사용</label>
                        </td>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>NEW ITEM(뉴아이템)</td>
                        <td>
                            <input type="radio" class="radio" name="front_inp" checked="checked">
                            <label>사용</label>
                            <input type="radio" class="radio" name="front_inp">
                            <label>미사용</label>
                        </td>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>SELLER PICKS(셀러픽)</td>
                        <td>
                            <input type="radio" class="radio" name="front_inp" checked="checked">
                            <label>사용</label>
                            <input type="radio" class="radio" name="front_inp">
                            <label>미사용</label>
                        </td>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>BANNER(띠배너)</td>
                        <td>
                            <input type="radio" class="radio" name="front_inp" checked="checked">
                            <label>사용</label>
                            <input type="radio" class="radio" name="front_inp">
                            <label>미사용</label>
                        </td>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>PROJECT FUNDING(펀딩)</td>
                        <td>
                            <input type="radio" class="radio" name="front_inp" checked="checked">
                            <label>사용</label>
                            <input type="radio" class="radio" name="front_inp">
                            <label>미사용</label>
                        </td>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>S.STORY(에스스토리)</td>
                        <td>
                            <input type="radio" class="radio" name="front_inp" checked="checked">
                            <label>사용</label>
                            <input type="radio" class="radio" name="front_inp">
                            <label>미사용</label>
                        </td>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <form id="frm" name="frm">
                <input type="hidden" name="BNR_MST_IDX" value="">
                <input type="hidden" name="cPage" value="">
                <input type="hidden" name="searchBnrMstTitle" value="">
                <input type="hidden" name="searchType" value="">
                <input type="hidden" name="searchStartDate" value="">
                <input type="hidden" name="searchEndDate" value="">
                <input type="hidden" name="searchBnrMstUseYn" value="">
                <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="2350">
                <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="">

                <input type="hidden" id="searchGubun" name="searchGubun" value="P">

                </form>
                </div><!-- // contents-inner -->
                </div>

            </div>

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
