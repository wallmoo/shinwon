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

            <h2 class="title"><span>펀딩</span></h2>

            <div class="tab-list"><!-- tab -->
                <ul class="tab">
                    <li><a href="#none">정보관리</a></li>
                    <li class="in"><a href="javascript:;" id="goEntryList">일정관리</a></li>
                </ul>
            </div><!-- // tab -->

            <h3 class="title"><span>일정관리</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>펀딩기간</span></th>
                            <td>
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="searchPlnMstStDt" name="searchPlnMstStDt" value="2020-01-21"   readonly="readonly" data-target-end="#searchPlnMstEdDt"/> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="searchPlnMstEdDt" name="searchPlnMstEdDt" value="2020-01-21"  readonly="readonly" data-target-start="#searchPlnMstStDt"/>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <h3 class="title"><span>일정추가</span></h3>

            <form id="searchForm2" name="searchForm">
                <input type="hidden" name="pageSize" value="" />
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>일정추가</span></th>
                            <td>
                                <div id="divCategory"><!-- 스펙 -->
                                    <div class="grid section-button-search"><!-- section button -->
                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
                                        <a id="goCategoryPopup" href="javascript:specRegistPopup('P');" class="button button-b small" title="새 창 으로 열립니다."><span>일정추가</span></a>
                                    </div><!-- // section button -->

                                    <table class="table-row table-a" id="tableCategory">
                                        <colgroup>
                                            <col style="width: 5%;" />
                                            <col style="width: auto;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th style="padding-left:0;text-align:center;"><input type="checkbox"></th>
                                                <td>
                                                   <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                                   <input type="text" class="text"  name="searchPlnMstStDt" value="2020-01-21"   readonly="readonly" data-target-end="#searchPlnMstEdDt"/> ~
                                                   <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                                   <input type="text" class="text"  name="searchPlnMstEdDt" value="2020-01-21"  readonly="readonly" data-target-start="#searchPlnMstStDt"/>
                                                   <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                                   <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                                   <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                                   <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                                    <a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                                                    <input type="checkbox" id="openCheck" ><label for="openCheck">오픈예정</label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <h3 class="title"><span>알림신청 회원 목록</span></h3>

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
                        <col style="width: 8%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>알림신청일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>오수*</td>
                            <td>dhtndud</td>
                            <td>2019-12-25 11:20:15</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>김도*</td>
                            <td>rlaehdud</td>
                            <td>2019-12-25 11:20:15</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>김문*</td>
                            <td>rlaanswn</td>
                            <td>2019-12-25 11:20:15</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>김동*</td>
                            <td>rlaehddn</td>
                            <td>2019-12-25 11:20:15</td>
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

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
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
