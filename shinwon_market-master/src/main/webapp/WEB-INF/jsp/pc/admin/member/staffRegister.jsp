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

            <h2 class="title"><span>임직원 목록</span></h2>

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
                            <th class="5"><span>가입일</span></th>
                            <td colspan="5">
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
                        <tr>
                            <th><span>회원등급</span></th>
                            <td>
                                <select class="select">
                                    <option>전체</option>
                                    <option>일반회원</option>
                                    <option>임원회원</option>
                                </select>
                            </td>
                            <th><span>아이디</span></th>
                            <td>
                                <input type="text" class="text xlarge" placeholder="아이디입력">
                            </td>
                            <th><span>이름</span></th>
                            <td>
                                <input type="text" class="text xlarge" placeholder="이름입력">
                            </td>
                        </tr>
                        <tr>
                            <th><span>휴대폰(뒤자리)</span></th>
                            <td>
                                <input type="text" class="text large" placeholder="4자리 입력">
                            </td>
                            <th><span>생년월일</span></th>
                            <td colspan="3">
                                <input type="text" class="text large" placeholder="YYYYMMDD(8자리)">
                            </td>
                        </tr>
                        <tr>
                            <th><span>특정권한</span></th>
                            <td colspan="5">
                                <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="PLN_MST_CHANNEL_PC_YN" value="Y" checked = "checked" /><label for="PLN_MST_CHANNEL_PC_YN" > 리뷰어회원</label>
                                <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_MOBILE_YN" id="PLN_MST_CHANNEL_MOBILE_YN" value="Y"/><label for="PLN_MST_CHANNEL_MOBILE_YN" > 특정리뷰회원</label>
                                <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_MOBILE_YN" id="PLN_MST_CHANNEL_MOBILE_YN" value="Y"/><label for="PLN_MST_CHANNEL_MOBILE_YN" > 특정OOTD회원</label>
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

                    <div class="col-1-2 text-right">
                        <a href="#none" id="" class="button small"><span>일반회원 전환</span></a>
                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 20%;" />
                        <col style="width: 15%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>일반회원 전환<input type="checkbox" class="checkbox checkAll" /></th>
                            <th>NO</th>
                            <th>아이디</th>
                            <th>회원이름</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>회원분류/회원등급</th>
                            <th>회원분류/회원등급임직원포인트</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="checkbox"/></td>
                            <td>1</td>
                            <td class="text-left"><a href="#">never11</a></td>
                            <td class="text-left"><a href="#">홍길*</a></td>
                            <td>남자</td>
                            <td>1975.05.11</td>
                            <td>임직원회원/일반회원</td>
                            <td>3,000,000p</td>
                            <td>2019.12.15</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"/></td>
                            <td>2</td>
                            <td class="text-left"><a href="#">tree1234</a></td>
                            <td class="text-left"><a href="#">홍길*</a></td>
                            <td>남자</td>
                            <td>1980.06.26</td>
                            <td>임직원회원/일반회원</td>
                            <td>2,500,000p</td>
                            <td>2019.12.15</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"/></td>
                            <td>3</td>
                            <td class="text-left"><a href="#">never11</a></td>
                            <td class="text-left"><a href="#">홍길*</a></td>
                            <td>남자</td>
                            <td>1975.05.11</td>
                            <td>임직원회원/일반회원</td>
                            <td>0p</td>
                            <td>2019.12.15</td>
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
