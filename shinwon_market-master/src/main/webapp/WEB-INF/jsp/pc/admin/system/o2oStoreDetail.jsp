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

            <h2 class="title"><span>O2O매장 상세</span></h2>

            <h3 class="title"><span>상세</span></h3>

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
                            <th><span>매장명</span></th>
                            <td>엔터식스 동탄</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>지역</span></label></th>
                            <td>경기도</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>전화번호</span></label></th>
                            <td>02-1234-5678</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>매장주소</span></label></th>
                            <td>06654<br/>서울 영등포구 여의도동 56-9 나이키빌딩 1122호</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>구글지도 URL</span></label></th>
                            <td>https://goo.gl/maps/rDinLX73CrBvDZyF8 <a href="#none" id="productCopy" class="button small"><span>지도보기</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>매장 운영시간</span></label></th>
                            <td>11:00 ~ 20:00</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>방문 가능시간</span></label></th>
                            <td>2019-12-25 14:23:23</td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>

            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
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
