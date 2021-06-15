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

            <h2 class="title"><span>채널ON</span></h2>

            <h3 class="title"><span>등록</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
                    <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
            </form>
            <form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value=""/>
                    <input type="hidden" name="searchPlnMstShopType" value=""/>
                    <input type="hidden" name="searchPlnMstTitle" value=""/>
                    <input type="hidden" name="searchPlnMstStDt" value="2020-01-23"/>
                    <input type="hidden" name="searchPlnMstEdDt" value="2020-01-23"/>
                    <input type="hidden" name="searchPlnMstStatus" value=""/>
                    <input type="hidden" name="searchPlnMstUseYn" value=""/>
                    <input type="hidden" name="pageSize" value="20" />
                    <input type="hidden" name="rownum" value="0"/>
            </form>

            <form name="frm" id="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>작성자</span></label></th>
                            <td>
                                admin(슈퍼관리자)
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>채널</span></label></th>
                            <td>
                                <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="PLN_MST_CHANNEL_PC_YN" value="Y" checked = "checked" /><label for="PLN_MST_CHANNEL_PC_YN" > PC</label>
                                <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_MOBILE_YN" id="PLN_MST_CHANNEL_MOBILE_YN" value="Y" checked = "checked"/><label for="PLN_MST_CHANNEL_MOBILE_YN" > MOBILE</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT" value="<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
                                <select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH">
                                    <c:forEach begin="0" end="23" varStatus="i">
                                        <option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
                                            <c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
                                        </option>
                                    </c:forEach>
                                </select> 시
                                <select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM">
                                    <c:forEach begin="0" end="59" varStatus="i">
                                        <option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_MM }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
                                            <c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
                                        </option>
                                    </c:forEach>
                                </select> 분 ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" id="BNR_MST_ED_DT" name="BNR_MST_ED_DT"  readonly="readonly" data-target-start="#BNR_MST_ST_DT" value="<ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy-MM-dd"/>"/>
                                <select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH">
                                    <c:forEach begin="0" end="23" varStatus="i">
                                        <option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ED_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
                                            <c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
                                        </option>
                                    </c:forEach>
                                </select> 시
                                <select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM">
                                    <c:forEach begin="0" end="59" varStatus="i">
                                        <option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ED_MM }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
                                            <c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
                                        </option>
                                    </c:forEach>
                                </select> 분
                                <a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
                                <a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>전시여부</span></label></th>
                            <td>
                                <input type="radio" name="PLN_MST_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
                                <label for="stateA">전시</label>
                                <input type="radio" name="PLN_MST_USE_YN" id="stateB" class="radio" value="N" />
                                <label for="stateB">미전시</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>유형<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select" name="">
                                    <option>선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>시즌<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select" name="">
                                    <option>선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>영상 제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                  <input type="text" name="PLN_MST_TITLE" id="PLN_MST_TITLE" class="text xlarge"/>
                            </td>
                        </tr>
                        <tr>
                            <th>상단 영상 안내 문구</th>
                            <td><textarea cols="50" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>PC 상단 영상 썸네일</span></label></th>
                            <td>
                                <div id="multiFile1-list">
                                </div>
                                <!-- 수정시 노출 -->
                                <p><a href="javascript:;">WF7A1018.jpg</a>
                                <input type="checkbox" class="checkbox" name="PLN_MST_CHANNEL_PC_YN" id="del" value="Y" checked = "checked" /><label for="del" >삭제</label></p>
                                <!-- //수정시 노출 -->
                                <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text large pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:60%;"/> (0 / 20자)
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>MOBILE 상단 영상 썸네일 이미지</span></label></th>
                            <td>
                                <div id="multiFile3-list">
                                </div>
                                <input type="file" name="file2" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text large" placeholder="20자 이내로 입력하세요."  style="width:60%;"//> (0 / 20자)
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>URL<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text large" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <div id="multiFile1-list">
                                </div>
                                <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text large pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:60%;"/> (0 / 20자)
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <div id="multiFile3-list">
                                </div>
                                <input type="file" name="file2" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text large" placeholder="20자 이내로 입력하세요."  style="width:60%;"//> (0 / 20자)
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" class="radio" id="planType3" name="planType" checked="checked" onchange=changeDetailType(this.id) > <label for="planType3">이미지</label>
                                <input type="radio" class="radio" id="planType4" name="planType" onchange=changeDetailType(this.id)> <label for="planType4">에디터</label>
                                <input type="radio" class="radio" id="planType5" name="planType" onchange=changeDetailType(this.id)> <label for="planType5">스크립트</label>
                            </td>
                        </tr>

                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                    <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text large" placeholder="20자 이내로 입력하세요."  style="width:60%;"//> (0 / 20자)
                                    </p>
                                </td>
                            </tr>
                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file2" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" data-accept="img" />
                                    <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text large" placeholder="20자 이내로 입력하세요."  style="width:60%;"//> (0 / 20자)
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
                                     <textarea class="textarea xlarge" name="PLN_MST_PC_BANNER" id="PLN_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                     <iframe frameborder="0" scrolling="no" style="width: 100%; height: 549px;" src="/smartEditor/SmartEditor2Skin.html"></iframe>
                                </td>
                            </tr>


                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea name="name" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea name="name" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                        <tr><!-- row -->
                            <th><span class="in_block">태그</span> <a href="#none" class="button button-a small in_block">태그선택</a></th>
                            <td>
                                <p class="text-left">태그를 선택해주세요.</p>
                                <!-- 수정시 노출 -->
                                <ul class="tag_list">
                                    <li>#오버핏<button type="button" class="btn_del">X</button></li>
                                    <li>#신상품<button type="button" class="btn_del">X</button></li>
                                    <li>#빈티지<button type="button" class="btn_del">X</button></li>
                                    <li>#거울셀카<button type="button"  lass="btn_del">X</button></li>
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
                                <!-- //수정시 노출 -->
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->


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
                                    <th><label class="label"><span>관련 상품<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <div class="text-right">
                                            <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                                            <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                        </div>
                                        <table class="core">
                                            <colgroup>
                                                <col style="width: 5%;" />
                                                <col style="width: 8%;" />
                                                <col style="width: 10%;" />
                                                <col style="width: auto;" />
                                                <col style="width: 10%;" />
                                                <col style="width: 10%;" />
                                                <col style="width: 8%;" />
                                                <col style="width: 8%;" />
                                                <col style="width: 5%;" />
                                                <col style="width: 5%;" />
                                                <col style="width: 5%;" />
                                                <col style="width: 8%;" />
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" class="checkbox checkAll" /></th>
                                                    <th>상품코드</th>
                                                    <!-- 수정시 노출 -->
                                                    <th>이미지</th>
                                                    <!-- // 수정시 노출 -->
                                                    <th>상품명</th>
                                                    <th>브랜드</th>
                                                    <th>판매가</th>
                                                    <th>판매상태</th>
                                                    <th>전시순서</th>
                                                </tr>
                                            </thead>
                                            <tbody class="applyProductList">
                                                <tr>
                                                    <td><input type="checkbox" class="checkbox" /></td>
                                                    <td><a href="#">PYFAI4229</a></td>
                                                    <!-- 수정시 노출 -->
                                                    <td><span class="thumbnail_img"><img src="profile.jpg"></span></td>
                                                    <!-- // 수정시 노출 -->
                                                    <td><a href="#">[SIEG◆1212][30%쿠폰]브라운 스트레이트]</a></td>
                                                    <td>SIEG</td>
                                                    <td>4,999,999</td>
                                                    <td>판매중</td>
                                                    <td>
                                                        <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                                                        <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="8" class="text-center">상품을 검색해주세요.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div><!-- //section-form addFormCon -->
                    </div><!-- //id="product" -->
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
