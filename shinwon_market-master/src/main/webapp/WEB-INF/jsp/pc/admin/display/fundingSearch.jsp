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

            <h2 class="title"><span>상품검색</span></h2>

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
                            <th><span>상품코드</span></th>
                            <td colspan="3">
                                <input type="text" class="text xlarge">
                            </td>
                        </tr>
                        <tr>
                            <th><span>상품명</span></th>
                            <td>
                              <input type="text" class="text xlarge" value=""/>
                            </td>
                            <th><span>상태</span></th>
                            <td class="text-left">
                                <select class="select">
                                    <option value="">전체</option>
                                    <option value="">판매중</option>
                                    <option value="">미판매</option>
                                    <option value="">품절상품</option>
                                    <option value="">일부품절상품</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>브랜드</span></th>
                            <td colspan="3">
                              <input type="text" class="text xlarge" value=""/>
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
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll"></th>
                            <th>타임스페셜제목</th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>일반(Tag가)</th>
                            <th>판매가</th>
                            <th>판매상태</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="3"><input type="checkbox" class="checkbox"></td>
                            <td rowspan="3">블랙몬스터</td>
                            <td><a href="#">GYOAX2504</a></td>
                            <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
                            <td><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
                            <td>9,999,999</td>
                            <td>4,999,999</td>
                            <td>판매중</td>
                            <td>2019-10-05</td>
                        </tr>
                        <tr>
                            <td class="border-left"><a href="#">GYOAX2504</a></td>
                            <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
                            <td><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
                            <td>9,999,999</td>
                            <td>4,999,999</td>
                            <td>판매중</td>
                            <td>2019-10-05</td>
                        </tr>
                        <tr>
                            <td class="border-left"><a href="#">GYOAX2504</a></td>
                            <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
                            <td><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
                            <td>9,999,999</td>
                            <td>4,999,999</td>
                            <td>판매중</td>
                            <td>2019-10-05</td>
                        </tr>
                    </tbody>
                </table>
                </form>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                    </div>
                </div><!-- // section pagination -->

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:self.close();" id="goList" class="button button-a"><span>취소</span></a>
                        <a href="javascript:;" class="button button-b primary"><span>선택</span></a>
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
