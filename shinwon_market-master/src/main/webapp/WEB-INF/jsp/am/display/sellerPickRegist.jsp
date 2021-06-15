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

            <h2 class="title"><span>셀러픽관리</span></h2>

            <h3 class="title"><span>등록</span></h3>

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
                            <th><span>작성자</span></th>
                            <td>
                                <input type="text" name="" value="" disabled>
                                <a href="#none" class="button button-b small" title="새 창 으로 열립니다."><span>입점사 선택</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" class="text xlarge">
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>설명<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea cols="30" rows="10"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span>
                                <a href="#none" id="" class="button button-a small mt10">태그선택</a></label>
                            </th>
                            <td>
                                <ul class="tag_list tag_box" style="width:100%;">
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
                        <tr>
                            <th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <div id="multiFile1-list">
                                    <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                                    <c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
                                        <c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
                                        <c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>

                                        <i class="icon-file"></i>
                                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
                                            <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                        </a>
                                        <input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
                                        <label for="CMM_FLE_IDX_1">삭제</label>
                                    </c:if>
                                    </c:forEach>
                                </div>
                                <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>MOBIE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <div id="multiFile1-list">
                                    <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                                    <c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
                                        <c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
                                        <c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>

                                        <i class="icon-file"></i>
                                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
                                            <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                        </a>
                                        <input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
                                        <label for="CMM_FLE_IDX_1">삭제</label>
                                    </c:if>
                                    </c:forEach>
                                </div>
                                <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" class="radio" id="planType3" name="PLN_MST_DETAIL_TYPE" checked="checked" onchange=changeDetailType(this.id) value="I"> <label for="planType3">이미지</label>
                                <input type="radio" class="radio" id="planType4" name="PLN_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="E"> <label for="planType4">에디터</label>
                                <input type="radio" class="radio" id="planType5" name="PLN_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="S"> <label for="planType5">스크립트</label>
                            </td>
                        </tr>

                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                    <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB / 이미지 최대 10개 등록</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    </p>
                                </td>
                            </tr>
                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file2" id="multiFile5" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
                                    <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB / 이미지 최대 10개 등록</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text xlarge mobileImgFile" placeholder="20자 이내로 입력하세요."/>
                                    </p>
                                </td>
                            </tr>


                            <tr class="detailTypeEditor" style="display:none">
                                <th><label class="label"><span>PC 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="PLN_MST_PC_BANNER" id="PLN_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                     <iframe frameborder="0" scrolling="no" style="width: 100%; height: 549px;" src="/smartEditor/SmartEditor2Skin.html"></iframe>
                                </td>
                            </tr>
                            <tr class="detailTypeEditor" style="display:none">
                                <th><label class="label"><span>MOBILE 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="PLN_MST_MOBILE_BANNER" id="PLN_MST_MOBILE_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                     <iframe frameborder="0" scrolling="no" style="width: 100%; height: 549px;" src="/smartEditor/SmartEditor2Skin.html"></iframe>
                                </td>
                            </tr>


                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea name="PLN_MST_PC_SCRIPT" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea name="PLN_MST_MOBILE_SCRIPT" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>전시여부</span></th>
                                <td>
                                    <input type="radio" name="ANA_ITM_DPL_YN" id="stateA" class="radio" value="Y"/>
                                    <label for="stateA">전시</label>
                                    <input type="radio" name="ANA_ITM_DPL_YN" id="stateB" class="radio" value="N"/>
                                    <label for="stateB">미전시</label>
                                </td>
                            </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

            <div class="grid section-button-list">
            <h3 class="title"><span>상품구성</span></h3>
            </div>
            <div id="productBox">
                <div class="section-form addFormCon productSelectform" data-type="basic">
                    <input type="hidden" name="groupNum" class="groupNum" value="0"/>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>관련 상품</span></label></th>
                                <td>
                                    <div class="grid section-button-search left"><!-- section button -->
                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
                                        <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                    </div><!-- // section button -->
                                    <table class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 10%;" />
                                            <col style="width: 8%;" />
                                            <col style="width: auto;" />
                                            <col style="width: 10%;" />
                                            <col style="width: 15%;" />
                                            <col style="width: 10%;" />
                                            <col style="width: 8%;" />
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>상품코드</th>
                                                <th>이미지</th>
                                                <th>상품명</th>
                                                <th>브랜드</th>
                                                <th>판매가</th>
                                                <th>판매상태</th>
                                                <th>전시순서</th>
                                            </tr>
                                        </thead>
                                        <tbody class="applyProductList">
                                            <tr>
                                                <td><a href="javascript:;">PYFAI4229</a></td>
                                                <td><img src="" alt=""></td>
                                                <td><a href="javascript:;">[SIEG◆1212][30%쿠폰]브라운 스트레이트]</a></td>
                                                <td>SIEG</td>
                                                <td>4,999,999</td>
                                                <td>판매중</td>
                                                <td>
                                                    <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                                                    <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;">PYFAI4229</a></td>
                                                <td><img src="" alt=""></td>
                                                <td><a href="javascript:;">[SIEG◆1212][30%쿠폰]브라운 스트레이트]</a></td>
                                                <td>SIEG</td>
                                                <td>4,999,999</td>
                                                <td>품절상품</td>
                                                <td>
                                                    <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                                                    <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="javascript:;">PYFAI4229</a></td>
                                                <td><img src="" alt=""></td>
                                                <td><a href="javascript:;">[SIEG◆1212][30%쿠폰]브라운 스트레이트]</a></td>
                                                <td>SIEG</td>
                                                <td>4,999,999</td>
                                                <td>품절상품</td>
                                                <td>
                                                    <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                                                    <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div><!-- //section-form addFormCon -->
                </div><!-- //id="product" -->

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
