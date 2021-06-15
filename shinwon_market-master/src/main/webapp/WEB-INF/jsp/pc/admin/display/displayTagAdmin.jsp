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

            <h2 class="title"><span>전시태그관리</span></h2>

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
                            <span class="folder">공통태그</span>
                            <ul style="display: block;">
                                <li class="closed"><span class="folder" data-idx="2351" data-level="3">회원가입</span></li>
                                <li class="closed"><span class="folder" data-idx="2352" data-level="3">OOTD 피드선택</span></li>
                                <li class="closed"><span class="folder" data-idx="2353" data-level="3">OOTD 등록</span></li>
                                <li class="closed"><span class="folder" data-idx="2353" data-level="3">OOTD 메인</span></li>
                                <li class="closed last"><span class="folder" data-idx="2354" data-level="3">STORE 메인</span></li>
                            </ul>
                        </li>
                        <li class="closed expandable">
                            <div class="hitarea closed-hitarea expandable-hitarea"></div>
                            <span class="folder">PC</span>
                        </li>
                    </ul>
            </div>

            <div id="main_con" style="float: left; padding: 10px;">
                <div class="contents-inner"><!-- contents-inner -->
                    <h3 class="title"><span>회원가입 - TAG 설정</span></h3>
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="text-left">(필수1개, 최대 제한없음)</div>
                        <div class="text-right">
                            <a href="javascript:goForm();" class="button small primary"><span>TAG 선택</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->
                    <form id="frm" name="frm">
                        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="2350">
                        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="">
                        <input type="hidden" id="DSP_MST_ENV" name="DSP_MST_ENV" value="P">
                        <input type="hidden" id="searchGubun" name="searchGubun" value="">

                        <div class="table-a"><!-- col list -->
                            <table class="table-row table-a">
                                <colgroup>
                                    <col style="width: 10%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>TAG<span style="color:red;display:inline-block;padding:0;">*</span></th>
                                    <td>
                                        <div class="field tag_list catagory_tag">
                                            <ul style="height:200px;overflow-y:scroll;">
                                                <li>#오버핏<button type="button" class="btn_del">X</button></li>
                                                <li>#신상품<button type="button" class="btn_del">X</button></li>
                                                <li>#빈티지<button type="button" class="btn_del">X</button></li>
                                                <li>#거울셀카<button type="button" class="btn_del">X</button></li>
                                                <li>#streetstyle<button type="button" class="btn_del">X</button></li>
                                                <li>#루즈핏<button type="button" class="btn_del">X</button></li>
                                                <li>#고상한<button type="button" class="btn_del">X</button></li>
                                                <li>#신상품1<button type="button" class="btn_del">X</button></li>
                                                <li>#가을신상<button type="button" class="btn_del">X</button></li>
                                                <li>#데일리룩<button type="button" class="btn_del">X</button></li>
                                                <li>#ootd<button type="button" class="btn_del">X</button></li>
                                                <li>#비오는날<button type="button" class="btn_del">X</button></li>
                                                <li>#상큼한<button type="button" class="btn_del">X</button></li>
                                                <li>#가을여행<button type="button" class="btn_del">X</button></li>
                                                <li>#오버핏1<button type="button" class="btn_del">X</button></li>
                                                <li>#신상품2<button type="button" class="btn_del">X</button></li>
                                                <li>#빈티지1<button type="button" class="btn_del">X</button></li>
                                                <li>#거울셀카1<button type="button" class="btn_del">X</button></li>
                                                <li>#streetstyle1<button type="button" class="btn_del">X</button></li>
                                                <li>#루즈핏1<button type="button" class="btn_del">X</button></li>
                                                <li>#고상한1<button type="button" class="btn_del">X</button></li>
                                                <li>#신상품3<button type="button" class="btn_del">X</button></li>
                                                <li>#가을신상<button type="button" class="btn_del">X</button></li>
                                                <li>#데일리룩1<button type="button" class="btn_del">X</button></li>
                                                <li>#ootd<button type="button" class="btn_del">X</button></li>
                                                <li>#비오는날1<button type="button" class="btn_del">X</button></li>
                                                <li>#상큼한<button type="button" class="btn_del">X</button></li>
                                                <li>#가을여행<button type="button" class="btn_del">X</button></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!-- // col list -->
                        <div class="section-button"><!-- section-button -->
                            <div class="wrap text-center">
                                <a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
                            </div>
                        </div>
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
$(function(){

});
//-->
</script>

</body>
</html>
