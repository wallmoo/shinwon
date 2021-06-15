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

            <h2 class="title"><span>마이핏관리 목록</span></h2>

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
                            <th><span>항목 분류 선택</span></th>
                            <td colspan="3">
                                <select class="select" name="">
                                    <option>대분류 전체</option>
                                    <option>상의</option>
                                    <option>하의</option>
                                    <option>원피스</option>
                                    <option>아우터</option>
                                    <option>신발</option>
                                </select>
                                <!-- 대분류 상의 선택시 -->
                                <select class="select" name="">
                                    <option>중분류 전체</option>
                                    <option>남성 상의</option>
                                    <option>여성 하의</option>
                                </select>
                                <!-- //대분류 상의 선택시 -->
                                <!-- 대분류 하의 선택시 -->
                                <select class="select" name="">
                                    <option>중분류 전체</option>
                                    <option>남성 팬츠</option>
                                    <option>여성 팬츠</option>
                                </select>
                                <!-- //대분류 하의 선택시 -->
                                <!-- 대분류 원피스 선택시 -->
                                <select class="select" name="">
                                    <option>중분류 전체</option>
                                    <option>원피스</option>
                                </select>
                                <!-- //대분류 원피스 선택시 -->
                                <!-- 대분류 아우터 선택시 -->
                                <select class="select" name="">
                                    <option>중분류 전체</option>
                                    <option>남성 아우터</option>
                                    <option>여성 아우터</option>
                                </select>
                                <!-- //대분류 아우터 선택시 -->
                                <!-- 대분류 신발 선택시 -->
                                <select class="select" name="">
                                    <option>중분류 전체</option>
                                    <option>남성 슈즈</option>
                                    <option>여성 슈즈</option>
                                </select>
                                <!-- //대분류 신발 선택시 -->
                            </td>
                        </tr>
                        <tr>
                            <th><span>입력정보 선택</span></th>
                            <td>
                                <select class="select" name="">
                                    <option>전체</option>
                                    <option>총길이</option>
                                    <option>어깨넓이</option>
                                    <option>가슴둘레</option>
                                    <option>소매길이</option>
                                    <option>허리둘레</option>
                                    <option>힙둘레</option>
                                    <option>허벅지둘레</option>
                                    <option>밑단둘레</option>
                                    <option>밑위길이</option>
                                    <option>총높이</option>
                                    <option>앞굽높이</option>
                                    <option>뒵굽높이</option>
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

            <h3 class="title"><span>목록</span></h3>

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
                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>썸네일</th>
                            <th>대분류</th>
                            <th>중분류</th>
                            <th>입력정보</th>
                            <th>등록일</th>
                            <th>사용설정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><span class="thumbnail_img"><img src=""></span></td>
                            <td>상의</td>
                            <td>여성 상의</td>
                            <td class="text-left"><a href="#">총길이, 어깨넓이, 가슴둘레, 소매길이</a></td>
                            <td>2019-12-02 09:05:22</td>
                            <td>사용</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><span class="thumbnail_img"><img src=""></td>
                            <td>상의</td>
                            <td>여성 상의</td>
                            <td class="text-left"><a href="#">총길이, 어깨넓이, 가슴둘레, 소매길이</a></td>
                            <td>2019-12-02 09:05:22</td>
                            <td>미사용</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><span class="thumbnail_img"><img src=""></td>
                            <td>하의</td>
                            <td>남성 팬츠</td>
                            <td class="text-left"><a href="#">총길이, 허리둘레, 힙둘레, 허벅지둘레, 밑단둘레, 밑위길이</a></td>
                            <td>2019-12-02 09:05:22</td>
                            <td>사용</td>
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
