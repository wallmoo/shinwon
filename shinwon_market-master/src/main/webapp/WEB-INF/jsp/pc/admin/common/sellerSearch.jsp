<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style>
    .table-row.table-a th, .table-row.table-a td{text-align:center;}
</style>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">

            <h2 class="title"><span>셀러검색</span></h2>

                <!-- 탭부분 -->

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
                                <th><span>셀러명</span></th>
                                <td>
                                    <input type="text" class="text xlarge">
                                </td>
                                <th><span>입점사명</span></th>
                                <td>
                                    <input type="text" class="text xlarge">
                                </td>
                            </tr>
                            <tr>
                                <th><span>입점일</span></th>
                                <td colspan="3">
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
                            <select class="select">
                                <option value="">입점일순</option>
                            </select>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>셀러명</th>
                                <th>입점사명</th>
                                <th>입점일</th>
                                <th>상품등록 수</th>
                                <th>셀러픽등록 수</th>
                                <th>좋아요 수</th>
                                <th>판매율<br/>(배송중)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="#">입점MDA</a></td>
                                <td><a href="#">입점사 A</a></td>
                                <td>2019-11-11</td>
                                <td>312,412</td>
                                <td>15</td>
                                <td>15,658</td>
                                <td>35.3%<br/>(241)</td>
                            </tr>
                            <tr>
                                <td><a href="#">입점MDB</a></td>
                                <td><a href="#">입점사 B</a></td>
                                <td>2019-11-11</td>
                                <td>12,412</td>
                                <td>241</td>
                                <td>14,156,879</td>
                                <td>87.5%<br/>(412,312)</td>
                            </tr>
                            <tr>
                                <td><a href="#">입점MDC</a></td>
                                <td><a href="#">입점사 C</a></td>
                                <td>2019-11-11</td>
                                <td>3,412</td>
                                <td>254</td>
                                <td>662,145</td>
                                <td>43.1%<br/>(5,531)</td>
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

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goList" class="button large"><span>닫기</span></a>
                    </div>
                </div><!-- // section-button -->

        </div>
    </div>
</div>

<footer><!-- footer -->
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</footer><!-- // footer -->

<script src="http://bo.marketplanta.epasscni.com:8080/am/js/plugins.js" /></script>
<script src="http://bo.marketplanta.epasscni.com:8080/am/js/ui.js"></script>
<script src="http://bo.marketplanta.epasscni.com:8080/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {



});

</script>
</body>
</html>
