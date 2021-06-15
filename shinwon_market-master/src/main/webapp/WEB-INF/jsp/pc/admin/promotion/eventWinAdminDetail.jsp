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

            <h2 class="title"><span>이벤트 당첨자 관리</span></h2>

            <h3 class="title"><span>상세정보</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
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
                            <th><label class="label"><span>이벤트 유형</span></label></th>
                            <td>
                                럭키드로우
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>이벤트명</span></label></th>
                            <td>
                                선물이 하늘에서 비처럼 내려와!
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>이벤트기간</span></label></th>
                            <td>
                                2019-11-02 ~ 2019-12-05
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>발표일</span></label></th>
                            <td>
                                2019-12-05
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>진행여부</span></label></th>
                            <td>
                                종료
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>응모자수</span></label></th>
                            <td>
                                123,654,987
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>당첨자수</span></label></th>
                            <td>
                                10/50 <a href="#">[당첨자 확인]</a>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

            <h3 class="title"><span>응모현황&당첨자 선정</span></h3>

            <form id="frm" name="frm">
               <input type="hidden" name="PLN_MST_IDX" value="" />
                <input type="hidden" name="cPage" value="" />
                <input type="hidden" name="searchPlnMstShopType" value="" />
                <input type="hidden" name="searchPlnMstTitle" value="" />
                <input type="hidden" name="searchPlnMstStDt" value="2020-01-21" />
                <input type="hidden" name="searchPlnMstEdDt" value="2020-01-21" />
                <input type="hidden" name="searchPlnMstStatus" value="" />
                <input type="hidden" name="searchPlnMstUseYn" value="" />

                <form id="searchForm" name="searchForm" style="margin-bottom:10px;">
                    <input type="hidden" name="pageSize" value="" />
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>회원정보 검색</span></th>
                                <td>
                                    <select class="select">
                                        <option value="">전체</option>
                                        <option value="">아이디</option>
                                        <option value="">회원이름</option>
                                        <option value="">휴대폰</option>
                                    </select>
                                    <input type="text" value="" class="text large">
                                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="grid section-button-list" style="margin-top:20px;"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                        <span class="pages">
                            (총 <strong class="em">1</strong>건, 1 of 1 page)
                        </span>
                    </div>

                    <div class="col-1-2 text-right">
                        <select class="select" name="">
                            <option value="">전체</option>
                            <option value="">회원등급 높은순</option>
                            <option value="">주문건수 많은순</option>
                            <option value="">후기등록수 많은순</option>
                        </select>
                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        <a href="#none" id="" class="button small primary"><span>자동선정</span></a>
                        <a href="#none" id="" class="button small primary"><span>수동선정</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b mt10"><!-- table -->
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                        <col style="width: auto;" />
                        <col style="width: 12%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>NO</th>
                            <th>참여경로</th>
                            <th>회원정보</th>
                            <th>회원등급</th>
                            <th>주문건수</th>
                            <th>후기등록수</th>
                            <th>휴대폰</th>
                            <th>경품명</th>
                            <th>응모일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>PC</td>
                            <td><a href="#">김도영<br/>(asvqw1234)</a></td>
                            <td>LV1</td>
                            <td>150</td>
                            <td>50</td>
                            <td>010-1234-5678</td>
                            <td>럭키드로우 상품A</td>
                            <td>2020-01-05</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>PC</td>
                            <td><a href="#">김도영<br/>(asvqw1234)</a></td>
                            <td>LV1</td>
                            <td>150</td>
                            <td>50</td>
                            <td>010-1234-5678</td>
                            <td>럭키드로우 상품A</td>
                            <td>2020-01-05</td>
                        </tr>
                        </tbody>
                </table>
                </form>

                <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                    </div>
                </div><!-- // section pagination -->

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
