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

            <h2 class="title"><span>GNB관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <input type="hidden" name="PRD_CTG_ENV" id="PRD_CTG_ENV" value="P" />
            <br/>
            <div class="clearfix">

                <!-- https://github.com/jzaefferer/jquery-treeview -->
                <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

                <div style="float:left; width: 20%;">
                <div style="margin-right: 5px; padding: 10px 20px 10px 10px; border: solid 1px #ccc; min-height: 600px; margin-bottom: 20px;">
                    <a href="javascript:;" id="rootCategory" class="button small primary"><span>카테고리관리</span></a>
                <ul id="browser" class="filetree treeview-famfamfam treeview">
                    <li class="closed collapsable">
                        <div class="hitarea closed-hitarea collapsable-hitarea"></div>
                        <span class="folder">스페셜</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">펀딩</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">기획전</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">이벤트</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">셀러픽</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">BRAND</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">TOP SELLER</span>
                    </li>
                    <li class="closed expandable">
                        <div class="hitarea closed-hitarea expandable-hitarea"></div>
                        <span class="folder">라이브 ON</span>
                    </li>
                    <li class="closed expandable lastExpandable">
                        <div class="hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"></div>
                        <span class="folder">채널 ON</span>
                    </li>
                </ul>
            </div>

                <p style="float:left;">
                    <a href="javascript:registPopup();" id="categoryAdd" class="button small primary" title="팝업으로 열립니다."><span>하위 카테고리추가</span></a>
                </p>
            </div>

            <div id="main_con" style="float: left; padding: 10px;">
                <div class="contents-inner"><!-- contents-inner -->
                    <h3 class="title"><span>카테고리 상세</span></h3>


                    <form id="frm" name="frm">
                        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="2350">
                        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="">
                        <input type="hidden" id="DSP_MST_ENV" name="DSP_MST_ENV" value="P">
                        <input type="hidden" id="searchGubun" name="searchGubun" value="">

                        <div class="table-a"><!-- col list -->
                            <table class="table-row table-a">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody >
                                    <tr>
                                        <th>하위 카테고리 수</th>
                                        <td>9</td></tr>
                                    <tr>
                                        <th>하위 카테고리 정렬</th>
                                        <td id="tdSortHeight">
                                            <small class="desc">* 하위카테고리를 순서를 변경하실 수 있습니다.</small>
                                            <br>
                                            <ul style="width:300px;">
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    스페셜[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3411">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    펀딩[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3440">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    기획전[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3441">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    이벤트[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3411">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    셀러픽[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3440">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    BRAND[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3441">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    TOP SELLER[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3411">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    라이브 ON[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3440">
                                                </li>
                                                <li style="padding: 5px 10px;margin-top:2px;">
                                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                    <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                                    채널 ON[사용]<input type="hidden" name="PRD_CTG_IDXs" value="3441">
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table-row table-a">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>카테고리 ID</th>
                                        <td>3389</td>
                                    </tr>
                                    <tr>
                                        <th>현재 위치</th>
                                        <td>스페셜</td>
                                    </tr>
                                    <tr>
                                        <th>카테고리명</th>
                                        <td><input type="text" name="" value=""> <span style="color:red">* 20bye제한</span></td>
                                    </tr>
                                    <tr><!-- row -->
                                        <th>카테고리 사용여부</th>
                                        <td>
                                            <label><input type="radio" class="radio" id="PRD_CTG_USE_YN1" name="PRD_CTG_USE_YN" value="Y">사용</label>
                                            <label><input type="radio" class="radio" id="PRD_CTG_USE_YN2" name="PRD_CTG_USE_YN" value="N" checked="">미사용</label>
                                        </td>
                                    </tr>
                                    <tr><!-- row -->
                                        <th>프론트 노출여부</th>
                                        <td>
                                            <label><input type="radio" class="radio" id="PRD_CTG_DSP_YN1" name="PRD_CTG_DSP_YN" value="Y">사용</label>
                                            <label><input type="radio" class="radio" id="PRD_CTG_DSP_YN2" name="PRD_CTG_DSP_YN" value="N" checked="">미사용</label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- // col list -->
                    </form>
                </div>
            </div>

            </div>

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
