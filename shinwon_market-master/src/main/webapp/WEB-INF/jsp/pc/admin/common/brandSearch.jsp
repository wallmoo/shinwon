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

            <h2 class="title"><span>브랜드검색</span></h2>

                <!-- 탭부분 -->

                <h3 class="title"><span>검색</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="" />
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>브랜드명</span></th>
                                <td>
                                    <input type="text" class="text">
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
                    </div><!-- // 목록 상단 버튼 -->

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>브랜드코드</th>
                                <th>브랜드명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1658</td>
                                <td><a href="#">브랜드 A</a></td>
                            </tr>
                            <tr>
                                <td>1657</td>
                                <td><a href="#">브랜드 B</a></td>
                            </tr>
                            <tr>
                                <td>1656</td>
                                <td><a href="#">브랜드 C</a></td>
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
