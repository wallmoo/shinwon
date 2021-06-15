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

            <h2 class="title"><span>O2O매장 목록</span></h2>

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
                            <th><span>키워드 검색</span></th>
                            <td colspan="3">
                                <select class="select" name="">
                                    <option>전체</option>
                                    <option>매장명</option>
                                    <option>전화번호 뒷자리</option>
                                </select>
                                <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text large" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>지역</span></th>
                            <td>
                                <select class="select" name="">
                                    <option>전체</option>
                                    <option>서울</option>
                                    <option>경기도</option>
                                    <option>인천</option>
                                    <option>강원도</option>
                                    <option>충청남도</option>
                                    <option>대전</option>
                                    <option>충청북도</option>
                                    <option>부산</option>
                                    <option>울산</option>
                                    <option>대구</option>
                                    <option>경상북도</option>
                                    <option>경상남도</option>
                                    <option>전라남도</option>
                                    <option>광주</option>
                                    <option>세종</option>
                                    <option>전라북도</option>
                                    <option>제주</option>
                                    <option>세종</option>
                                </select>
                            </td>
                            <th><span>사용설정</span></th>
                            <td>
                                <input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="" class="radio"  value="N" />
                                <label for="stateC">미사용</label>
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

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                        <span class="pages">
                            (총 <strong class="em">1</strong>건, 1 of 1 page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <a href="#none" id="productDelete" class="button small"><span>삭제</span></a>
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>지역</th>
                            <th>매장명</th>
                            <th>매장 운영시간</th>
                            <th>방문 가능시간</th>
                            <th>전화번호</th>
                            <th>위치</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>경기도</td>
                            <td class="text-left"><a href="#">엔터식스 동탄</a></td>
                            <td>11:00 ~ 20:00</td>
                            <td>11:00 ~ 20:00</td>
                            <td>031-123-5678</td>
                            <td><a href="javacript:;">지도보기</a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>광주</td>
                            <td class="text-left"><a href="#">광주모다</a></td>
                            <td>12:00 ~ 19:00</td>
                            <td>12:00 ~ 19:00</td>
                            <td>061-123-1234</td>
                            <td><a href="javacript:;">지도보기</a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>경기도</td>
                            <td class="text-left"><a href="#">현대백화점 강남</a></td>
                            <td>13:00 ~ 20:00</td>
                            <td>13:00 ~ 20:00</td>
                            <td>02-123-1234</td>
                            <td><a href="javacript:;">지도보기</a></td>
                        </tr>
                    </tbody>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
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
