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

            <h2 class="title"><span>OOTD 관리</span></h2>

            <h3 class="title"><span>등록정보</span></h3>
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
                            <td>Ididid(홍길동)</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록일</span></label></th>
                            <td>2019-01-02 09:23:12</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td><input type="text" name="PLN_MST_TITLE" id="PLN_MST_TITLE" class="text xlarge"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea name="VDR_DSP_CTS" id="VDR_DSP_CTS" cols="30" rows="10" class="textarea xlarge"></textarea>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span class="in_block">태그<i class="require"><em>필수입력</em></i></span> <a href="#none" class="button button-a small in_block">태그수정</a></th>
                            <td>
                                <ul class="tag_list">
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
                            <th><label class="label"><span>희망태그</span></label></th>
                            <td class="tag_textarea">
                                <textarea name="VDR_DSP_CTS" id="VDR_DSP_CTS" cols="30" rows="10" class="textarea xlarge"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록상품 <a href="#none" class="button button-a small">상품수정</a></span></label></th>
                            <td>
                                <table class="core">
                                    <colgroup>
                                        <col style="width: 10%;" />
                                        <col style="width: auto;" />
                                        <col style="width: 10%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>이미지</th>
                                            <th>상품정보</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody class="applyProductList">
                                        <tr>
                                            <td><img src="" alt=""></td>
                                            <td class="text-left">Basic Leather Jacket (GYJAI2181)</td>
                                            <td><a href="#none" class="button small goProductDelete"><span>삭제</span></a></td>
                                        </tr>
                                        <tr>
                                            <td><img src="" alt=""></td>
                                            <td class="text-left">골드 트리플버튼 스커트 (BWSAX2308)</td>
                                            <td><a href="#none" class="button small goProductDelete"><span>삭제</span></a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상태</span></label></th>
                            <td>
                                <input type="radio" name="PLN_MST_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
                                <label for="stateA">사용</label>
                                <input type="radio" name="PLN_MST_USE_YN" id="stateB" class="radio" value="N" />
                                <label for="stateB">미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>수정일</span></label></th>
                            <td>admin(슈퍼관리자) / 2019-01-02 09:23:12 </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->


                <div class="grid section-button-list">
                <h3 class="title"><span>OOTD 사진</span></h3>
                </div>
                <div id="productBox">
                    <div class="optional"><!--  optional -->
                        <ul class="list list-a">
                            <li>OOTD에 등록할 사진을 설정할 수 있습니다.</li>
                            <li>OOTD 사진은 최대 10장까지 등록할 수 있으며, 첫 번째 등록한 사진이 대표 썸네일로 자동 설정됩니다.</li>
                            <li>png, jpg 포멧의 이미지 파일을 최대 10MB까지 등록할 수 있습니다.</li>
                            <li>파일찾기를 통해 이미지 선택 후 “서버 업로드＂해야 사진이 정상적으로 업로드 되어 상세화면에 나타납니다.</li>
                        </ul>
                        <div class="img_upload">
                            <p><img src="http://bo.marketplanta.epasscni.com/am/img/blank.png" alt="" style="border:1px solid #ccc;width:100px;height:100px;"><button class="btn_del">X</button></p>
                            <p><img src="http://bo.marketplanta.epasscni.com/am/img/blank.png" alt="" style="border:1px solid #ccc;width:100px;height:100px;"><button class="btn_del">X</button></p>
                            <p><img src="http://bo.marketplanta.epasscni.com/am/img/blank.png" alt="" style="border:1px solid #ccc;width:100px;height:100px;"><button class="btn_del">X</button></p>
                        </div>
                        <!-- 다중 상품이미지 업로드 영역 -->
                        <div id="fine-uploader-gallery" class="mt10">
                            <div class="qq-uploader-selector qq-uploader qq-gallery" qq-drop-area-text="첨부할 파일을 드래그 하여 주십시오. ">
                                <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container qq-hide">
                                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
                            </div>
                            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone="" style="display: none;"></div>

                            <div class="qq-upload-button-selector qq-upload-button" style="position: relative; overflow: hidden; direction: ltr;">
                                <div>파일찾기</div>
                                <input qq-button-id="e62bc10e-7acd-4438-a68f-d01b11fa5196" title="file input" multiple="" type="file" name="upload" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0; height: 100%;">
                            </div>
                            <div class="qq-upload-button-selector qq-upload-button" style="margin-left: 10px;">
                                <div id="trigger-upload">서버 업로드</div>
                            </div>

                            <ul class="qq-upload-list-selector qq-upload-list" role="region" aria-live="polite" aria-relevant="additions removals"></ul>

                            <span class="qq-drop-processing-selector qq-drop-processing qq-hide">
                                <span>파일을 불러오는 중입니다.</span>
                                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
                            </span>

                            <dialog class="qq-alert-dialog-selector">
                                <div class="qq-dialog-message-selector"></div>
                                <div class="qq-dialog-buttons">
                                    <button type="button" class="qq-cancel-button-selector">닫기</button>
                                </div>
                            </dialog>

                            <dialog class="qq-confirm-dialog-selector">
                                <div class="qq-dialog-message-selector"></div>
                                <div class="qq-dialog-buttons">
                                    <button type="button" class="qq-cancel-button-selector">취소</button>
                                    <button type="button" class="qq-ok-button-selector">확인</button>
                                </div>
                            </dialog>

                            <dialog class="qq-prompt-dialog-selector">
                                <div class="qq-dialog-message-selector"></div>
                                <input type="text">
                                <div class="qq-dialog-buttons">
                                    <button type="button" class="qq-cancel-button-selector">취소</button>
                                    <button type="button" class="qq-ok-button-selector">확인</button>
                                </div>
                            </dialog>
                        </div>
                    </div>
                    <div id="product_image_hidden_inform"></div>

                    </div>
                    </div><!-- //id="product" -->
                </div>
            </form>
            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

            <h3 class="title"><span>댓글</span></h3>

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
                        <a href="#none" id="goForm" class="button small primary"><span>미사용처리</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 15%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>상태</th>
                            <th>답글 작성</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="checkbox" /></td>
                            <td class="text-left txt_line1">와~ 저도 빨리 다이어트 성공해서 구매 해야겠다!<br />혹시 구매하신 사이즈 정보 좀 알 수 있을까요?</td>
                            <td>Ididid(홍길동)</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>사용</td>
                            <td><a href="#none" class="button small"><span>답글작성</span></a></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox" /></td>
                            <td class="text-left txt_line1">↳ 55 사이즈에요! 참고로 157cm에 50kg 초반이에요 ^.^</td>
                            <td>abc123(현빈)</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>사용</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox" /></td>
                            <td class="text-left txt_line1">내가 좋아하는 블루체크!</td>
                            <td>abc123(현빈)</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>사용</td>
                            <td><a href="#none" class="button small"><span>답글작성</span></a></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox" /></td>
                            <td class="text-left txt_line1">어쩜 옷도, 모델도 너무 이쁘네요!!</td>
                            <td>zxcv(전지현)</td>
                            <td>2019-01-02 09:23:12 </td>
                            <td>미사용</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                    </div>
                </div><!-- // section pagination -->

                <div class="reply_box tag_textarea">
                    <textarea class="reply_textarea" rows="8" cols="80"></textarea>
                    <div class="section-button btn_Regist"><!-- section-button -->
                        <a href="#none" id="goRegist" class="button large primary"><span>댓글 등록</span></a>
                    </div><!-- // section-button -->
                </div>
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
