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

            <h2 class="title"><span>마이핏관리</span></h2>

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
                            <th><span>카테도리 선택<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <select class="select" name="">
                                    <option>1차 카테고리 선택</option>
                                </select>
                                <select class="select" name="">
                                    <option>2차 카테고리 선택</option>
                                </select>
                                <select class="select" name="">
                                    <option>3차 카테고리 선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>항목 분류 선택<i class="require"><em>필수입력</em></i></span></th>
                            <td>
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
                            <th><label class="label"><span>썸네일<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <table id="fileView" style="width:50%;">
                                    <tbody>
                                        <tr>
                                            <!-- 수정시 노출 -->
                                            <p><a href="javascript:;">WF7A1018.jpg</a>
                                            <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="del" value="Y" checked = "checked" /><label for="del" >삭제</label></p>
                                            <!-- //수정시 노출 -->
                                            <td id="defaultFile">
                                                <input type="file" name="file" id="files[0]" class="file" value="">
                                                <small style="margin-left:10px;">(이미지 사이즈: ? )</small>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>예시 IMG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <table id="fileView" style="width:50%;">
                                    <tbody>
                                        <tr>
                                            <!-- 수정시 노출 -->
                                            <p><a href="javascript:;">WF7A1018.jpg</a>
                                            <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="del" value="Y" checked = "checked" /><label for="del" >삭제</label></p>
                                            <!-- //수정시 노출 -->
                                            <td id="defaultFile">
                                                <input type="file" name="file" id="files[0]" class="file" value="">
                                                <small style="margin-left:10px;">(이미지 사이즈: ? )</small>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>입력정보<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="checkbox"><label for="">총길이</label>
                                <input type="checkbox"><label for="">어깨넓이</label>
                                <input type="checkbox"><label for="">가슴둘레</label>
                                <input type="checkbox"><label for="">소매길이</label>
                                <input type="checkbox"><label for="">허리둘레</label>
                                <input type="checkbox"><label for="">힙둘레</label>
                                <input type="checkbox"><label for="">허벅지둘레</label>
                                <input type="checkbox"><label for="">밑단둘레</label>
                                <input type="checkbox"><label for="">밑위길이</label>
                                <input type="checkbox"><label for="">총높이</label>
                                <input type="checkbox"><label for="">앞굽높이</label>
                                <input type="checkbox"><label for="">뒷굽높이</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>사용설정<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" id="BRD_INQ_USE_YN_A" name="BRD_INQ_USE_YN" class="radio"  value="Y" checked="checked"/>
                                <label for="BRD_INQ_USE_YN_A">사용</label>
                                <input type="radio" id="BRD_INQ_USE_YN_B" name="BRD_INQ_USE_YN"class="radio"  value="N" />
                                <label for="BRD_INQ_USE_YN_B">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>


            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

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
