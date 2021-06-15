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

            <h2 class="title"><span>회원등급 등록</span></h2>

            <h3 class="title"><span>기본설정</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>회원등급 명<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <select class="select">
                                    <option>선택</option>
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>회원등급 설명</span></th>
                            <td>
                                <input type="text" class="text xlarge" placeholder="회원등급 설명"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>구매금액 조건<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text" value=""/> 이상 ~ <input type="text" class="text" value=""/>
                                / <input type="text" class="text large" value=""/>
                            </td>
                        </tr>
                        <!-- 상세/수정에만 노출 -->
                        <tr>
                            <th><span>사용여부</span></th>
                            <td>
                                <input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="" class="radio"  value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                        <!-- // 상세/수정에만 노출 -->
                    </tbody>
                </table><!-- // table -->
            </form>

            <h3 class="title"><span>혜택설</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>추가할인</span></th>
                            <td>
                                <input type="text" class="text large"/> %
                            </td>
                        </tr>
                        <tr>
                            <th><span>E포인트</span></th>
                            <td>
                                <input type="text" class="text large"/> P 지급
                            </td>
                        </tr>
                        <tr>
                            <th><span>APP전용 E포인트</span></th>
                            <td>
                                <input type="text" class="text large"/> P 지급
                            </td>
                        </tr>
                        <tr>
                            <th><span>생일기념 E포인트</span></th>
                            <td>
                                <input type="text" class="text large"/> P 지급
                            </td>
                        </tr>
                        <tr>
                            <th><span>추가 적립포인트</span></th>
                            <td>
                                <input type="text" class="text large"/> %
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>
            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->
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
