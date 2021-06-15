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

            <h2 class="title"><span>입점사업무공유관리</span></h2>

            <h3 class="title"><span>등록</span></h3>
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
                            <th rowspan="2"><span>공유대상<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="radio" id="stateA" name="" class="radio" checked="checked" value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="" class="radio"  value="Y" />
                                <label for="stateB">입점사 선택</label>
                            </td>
                        </tr>
                        <!-- 입점사 선택시 활성화 -->
                        <tr>
                            <td class="left">
                                <div id="divCategory"><!-- 스펙 -->
                                    <div class="grid section-button-search"><!-- section button -->
                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
                                        <a id="goCategoryPopup" href="javascript:specRegistPopup('P');" class="button button-b small" title="새 창 으로 열립니다."><span>입점사 검색</span></a>
                                    </div><!-- // section button -->

                                    <table class="table-row table-a" id="tableCategory">
                                        <colgroup>
                                            <col style="width: 8%;">
                                            <col style="width: 8%;">
                                            <col style="width: auto;">
                                            <col style="width: 20%;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" class="checkbox checkAllSpec_P"></th>
                                                <th>NO</th>
                                                <th>입점사명</th>
                                                <th>브랜드</th>
                                            </tr>
                                        </thead>
                                        <tbody id="applySpecCategoryList_P">
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>3</td>
                                                <td>입점사C</td>
                                                <td>브랜드C</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>2</td>
                                                <td>입점사B</td>
                                                <td>브랜드B</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>1</td>
                                                <td>입점사A</td>
                                                <td>브랜드A</td>
                                            </tr>
                                            <tr id="specCategoryNodata_P"><!-- row -->
                                                <td colspan="4">입점사를 선택해 주세요.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div><!-- // 스펙 -->
                            </td>
                        </tr>
                        <!-- //입점사 선택시 활성화 -->
                        <tr>
                            <th><label class="label"><span>업무구분<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select">
                                    <option value="">선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" class="text xlarge" name="" value="">
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea name="name" rows="8" cols="80"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th rowspan="2"><label class="label"><span>첨부파일<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <p>
                                    <a href="javascript:;">WF7A1018.jpg</a>
                                    <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="del" value="Y" checked = "checked" />
                                    <label for="del" >삭제</label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table id="fileView" style="width:50%;">
                                    <tbody>
                                        <tr>
                                            <td id="defaultFile">
                                                <input type="file" name="file" id="files[0]" class="file" value=""></td>
                                                <td>
                                                <input type="button" name="addFile" id="addFile" value="+">
                                                <input type="button" id="delFileData" value="파일 지우기">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <small class="desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf</small>
                                <small class="desc">* 업로드 용량 : 20MB</small>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
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
