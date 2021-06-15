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

            <h2 class="title"><span>회원등급 목록</span></h2>

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
                    <div class="text-right">
                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 12%;" />
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 5%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>등급</th>
                            <th>등급설명</th>
                            <th>구매금액조건</th>
                            <th>추가할인</th>
                            <th>E포인트</th>
                            <th>App전용 E포인트</th>
                            <th>생일기념 E포인트</th>
                            <th>추가적립포인트</th>
                            <th>회원 수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="#">LV.6</a></td>
                            <td class="text-left">쑈윈도 가장 우수고객</td>
                            <td class="text-left">2년 이상 PLATINUM 유지</td>
                            <td>3.5%</td>
                            <td>20,000P</td>
                            <td>-</td>
                            <td>15,000P</td>
                            <td>2%</td>
                            <td><a href="#">2</a></td>
                        </tr>
                        <tr>
                            <td><a href="#">LV.5</a></td>
                            <td class="text-left">쑈윈도 최우수고객</td>
                            <td class="text-left">5,000,000 ~ </td>
                            <td>3%</td>
                            <td>10,000P</td>
                            <td>-</td>
                            <td>10,000P</td>
                            <td>1.5%</td>
                            <td><a href="#">31</a></td>
                        </tr>
                        <tr>
                            <td><a href="#">LV.4</a></td>
                            <td class="text-left">쑈윈도 우수고객</td>
                            <td class="text-left">1,000,000 ~ 4,999,999</td>
                            <td>2.5%</td>
                            <td>-</td>
                            <td>-</td>
                            <td>7,000P</td>
                            <td>1%</td>
                            <td><a href="#">85</a></td>
                        </tr>
                        <tr>
                            <td><a href="#">LV.3</a></td>
                            <td class="text-left">쑈윈도 감사고객</td>
                            <td class="text-left">500,000 ~ 999,999</td>
                            <td>2%</td>
                            <td>-</td>
                            <td>-</td>
                            <td>5,000P</td>
                            <td>0.5%</td>
                            <td><a href="#">210</a></td>
                        </tr>
                        <tr>
                            <td><a href="#">LV.3</a></td>
                            <td class="text-left">쑈윈도 감사고객</td>
                            <td class="text-left">50,000 ~ 499,999</td>
                            <td>1%</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td><a href="#">15,838</a></td>
                        </tr>
                        <tr>
                            <td><a href="#">LV.3</a></td>
                            <td class="text-left">쑈윈도 감사고객</td>
                            <td class="text-left">0 ~ 49,999</td>
                            <td>0.2%</td>
                            <td>5,000P</td>
                            <td>10,000P</td>
                            <td>-</td>
                            <td>-</td>
                            <td><a href="#">65,506</a></td>
                        </tr>
                    </tbody>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                    </div>
                </div><!-- // section pagination -->

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
