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

            <h2 class="title"><span>컬러칩 등록</span></h2>

            <h3 class="title"><span>등록</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
                    <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
            </form>
            <form name="frm" id="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>컬러칩 코드<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text large" name="" value="" placeholder="컬러칩 코드 입력">
                            </td>
                        </tr>
                        <tr>
                            <th><span>컬러칩 명<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text large" name="" value="" placeholder="컬러칩 코드 입력">
                            </td>
                        </tr>
                        <tr>
                            <th><span>메모사항<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text xlarge" name="" value="" placeholder="메모사항 입력">
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>사용설정<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" id="BRD_INQ_USE_YN_A" name="BRD_INQ_USE_YN" class="radio"  value="Y" checked="checked"/>
                                <label for="BRD_INQ_USE_YN_A">사용</label>
                                <input type="radio" id="BRD_INQ_USE_YN_B" name="BRD_INQ_USE_YN"class="radio"  value="N" />
                                <label for="BRD_INQ_USE_YN_B">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>


            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->
            </form>

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
