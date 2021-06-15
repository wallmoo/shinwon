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
                    <li class="in"><a href="#none">정보관리</a></li>
                    <li><a href="javascript:;" id="goEntryList">일정관리</a></li>
                </ul>
            </div><!-- // tab -->

            <h3 class="title"><span>기본정보</span></h3>
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
                            <th><label class="label"><span>펀딩 상품<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" class="text" id="PRD_MST_CD" name="PRD_MST_CD" readonly="">&nbsp;
                                <input type="text" class="text large" id="PRD_MST_NM" name="PRD_MST_NM" readonly="">
                                <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>펀딩상품명<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" class="text large" style="width:35%" name="" value="" maxlength="20"> (20자 이내)
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>펀딩설명<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text " class="text large" name="" value="" maxlength="50" style="width:50%"> (50자 이내)
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>목표수량<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="" value=""> 개
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>최대수량<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="" value=""> 개
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="" class="radio"  value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

            <h3 class="title"><span>펀딩가격</span></h3>
            <form name="frmProductPlanPopup" method="post">
                    <input type="hidden" name="searchPrdMstCd" />
            </form>

            <form name="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" name="PLN_PRD_CTG_TOP_NM" value="" />

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>일반가<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="" value="" disabled>
                            </td>
                            <th><label class="label"><span>할인율<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select">
                                    <option value="">정율(%)</option>
                                </select>
                                <input type="text" name="" value="">
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>판매가</span></label></th>
                            <td colspan="3">
                                <input type="text" name="" value="" disabled>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

            <h3 class="title"><span>태그설정</span></h3>

            <form name="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" name="PLN_PRD_CTG_TOP_NM" value="" />

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <ul class="tag_list tag_box">
                                    <li>#오버핏<button type="button" class="btn_del">X</button></li>
                                    <li>#신상품<button type="button" class="btn_del">X</button></li>
                                    <li>#빈티지<button type="button" class="btn_del">X</button></li>
                                    <li>#거울셀카<button type="button" class="btn_del">X</button></li>
                                    <li>#streetstyle<button type="button" class="btn_del">X</button></li>
                                    <li>#루즈핏<button type="button" class="btn_del">X</button></li>
                                    <li>#고상한<button type="button" class="btn_del">X</button></li>
                                    <li>#신상품1<button type="button" class="btn_del">X</button></li>
                                    <li>#가을신상<button type="button" class="btn_del">X</button></li>
                                    <li>#데일리룩<button type="button" class="btn_del">X</button></li>
                                    <li>#ootd<button type="button" class="btn_del">X</button></li>
                                    <li>#비오는날<button type="button" class="btn_del">X</button></li>
                                    <li>#상큼한<button type="button" class="btn_del">X</button></li>
                                    <li>#가을여행<button type="button" class="btn_del">X</button></li>
                                    <li>#오버핏1<button type="button" class="btn_del">X</button></li>
                                    <li>#신상품2<button type="button" class="btn_del">X</button></li>
                                    <li>#빈티지1<button type="button" class="btn_del">X</button></li>
                                    <li>#거울셀카1<button type="button" class="btn_del">X</button></li>
                                    <li>#streetstyle1<button type="button" class="btn_del">X</button></li>
                                    <li>#루즈핏1<button type="button" class="btn_del">X</button></li>
                                    <li>#고상한1<button type="button" class="btn_del">X</button></li>
                                    <li>#신상품3<button type="button" class="btn_del">X</button></li>
                                    <li>#가을신상<button type="button" class="btn_del">X</button></li>
                                    <li>#데일리룩1<button type="button" class="btn_del">X</button></li>
                                    <li>#ootd<button type="button" class="btn_del">X</button></li>
                                    <li>#비오는날1<button type="button" class="btn_del">X</button></li>
                                    <li>#상큼한<button type="button" class="btn_del">X</button></li>
                                    <li>#가을여행<button type="button" class="btn_del">X</button></li>
                                </ul>
                                <div class="section-button btn_Regist"><!-- section button -->
                                    <a href="#none" id="goRegist" class="button button-b"><span>선택</span></a>
                                </div><!-- // section button -->
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>대표 TAG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select">
                                    <option value="">선택</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

            <h3 class="title"><span>추가옵션</span></h3>

            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 15%; min-width:180px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>추가옵션</th>
                        <td class="left">
                            <div id="divCategory"><!-- 옵션 -->
                                <!-- section button -->
                                <!-- <div class="grid section-button-search">
                                    <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
                                    <a id="goProductOption" class="button button-b small" title="옵션추가"><span>옵션추가</span></a>
                                </div> -->
                                <!-- // section button -->

                                <table class="table-row table-a" id="tableCategory">
                                    <colgroup>
                                        <col style="width: auto;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>옵션명</th>
                                            <th>사용</th>
                                        </tr>
                                    </thead>
                                    <tbody id="applyproductOptionList">
                                        <tr>
                                            <td><input type="text"></td>
                                            <td>
                                                <select class="select small" name="">
                                                    <option>사용</option>
                                                    <option>미사용</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div><!-- // 옵션 -->
                        </td>
                    </tr>
                </tbody>
            </table>

            <h3 class="title"><span>펀딩기간</span></h3>
            <form id="searchForm2" name="searchForm">
                <input type="hidden" name="pageSize" value="">
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>기간<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               <input type="text" class="text" name="searchPlnMstStDt" value="2020-01-21" readonly="readonly" data-target-end="#searchPlnMstEdDt"> ~
                               <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                               <input type="text" class="text" name="searchPlnMstEdDt" value="2020-01-21" readonly="readonly" data-target-start="#searchPlnMstStDt">
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <h3 class="title"><span>함께 매치하기 좋은 상품</span></h3>

            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 15%; min-width:180px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>함께 매치하기 좋은 상품</th>
                        <td class="left">
                            <div>
                                <input type="text" class="text" id="PRD_MST_NM" name="PRD_MST_NM" style="width:50%" readonly="">
                                <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품찾기</span></a> <a href="#none" class="button primary goCategoryMbAdd"><span>+</span></a> <a href="#none" class="button goCategoryPcDelete"><span>상품지우기</span></a>
                            </div>
                            <div class="mt10">
                                <input type="text" class="text" id="PRD_MST_NM" name="PRD_MST_NM" style="width:50%" readonly="">
                                <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품찾기</span></a> <a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
                            </div>
                            <div class="mt10">
                                <input type="text" class="text" id="PRD_MST_NM" name="PRD_MST_NM" style="width:50%" readonly="">
                                <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품찾기</span></a> <a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>

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
