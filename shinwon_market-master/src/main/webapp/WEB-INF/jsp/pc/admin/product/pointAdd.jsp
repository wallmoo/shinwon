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

            <h2 class="title"><span>포인트추가적립률관리</span></h2>

            <div class="clearfix">

                <!-- https://github.com/jzaefferer/jquery-treeview -->
                <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

            <div id="main_con" style="float: left; padding: 10px;">
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
                                        <th>GINNASIX</th>
                                        <td>
                                            <div class="point_inp">
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button primary goCategoryMbAdd">+<span></span></a></p>
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button goCategoryPcDelete"><span>-</span></a></p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>iCONOQ</th>
                                        <td>
                                            <div class="point_inp">
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button primary goCategoryMbAdd"><span>+</span></a></p>
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button goCategoryPcDelete"><span>-</span></a></p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>SIEG</th>
                                        <td>
                                            <div class="point_inp">
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button primary goCategoryMbAdd"><span>+</span></a></p>
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button goCategoryPcDelete"><span>-</span></a></p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>FAHRENHEIT</th>
                                        <td>
                                            <div class="point_inp">
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button primary goCategoryMbAdd"><span>+</span></a></p>
                                                <p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <a href="#none" class="button goCategoryPcDelete"><span>-</span></a></p>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="section-button"><!-- section-button -->
                                <div class="wrap text-center">
                                    <a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
                                </div>
                            </div>
                        </div><!-- // col list -->
                    </form>
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
$(document).ready (function () {
            $('.btnAdd').click (function () {
                    $('.point_inp').append (
                            '<p>할인율 : <input type="text" name="txt" placeholder="0"> % ~ <input type="text" name="txt" placeholder="19"> % 이하 <input type="text" name="txt" placeholder="5"> % 포인트 적립 <input type="button" class="btnAdd" value="-"></p>'
                    ); // end append
                    $('.btnRemove').on('click', function () {
                            $(this).prev().remove (); // remove the textbox
                            $(this).next ().remove (); // remove the <br>
                            $(this).remove (); // remove the button
                    });
            }); // end click
    }); // end ready
//-->
</script>

</body>
</html>
