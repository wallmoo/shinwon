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

            <h3 class="title"><span>상세</span></h3>
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
                            <th rowspan="2"><span>공유대상</span></th>
                            <td>슈퍼관리자</td>
                        </tr>
                        <!-- 입점사 선택시 활성화 -->
                        <tr>
                            <td class="left">
                                <table class="table-row table-a" id="tableCategory">
                                    <colgroup>
                                        <col style="width: 10%;">
                                        <col style="width: auto;">
                                        <col style="width: 20%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>입점사명</th>
                                            <th>브랜드</th>
                                        </tr>
                                    </thead>
                                    <tbody id="applySpecCategoryList_P">
                                        <tr>
                                            <td>2</td>
                                            <td>입점사B</td>
                                            <td>브랜드B</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>입점사A</td>
                                            <td>브랜드A</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <!-- //입점사 선택시 활성화 -->
                        <tr>
                            <th><label class="label"><span>업무구분</span></label></th>
                            <td>이벤트</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목</span></label></th>
                            <td>2020 S/S 시즌 쿠폰 이벤트 업무 확인요청</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                퓨즈 담당자 김도영입니다. <br/>
                                2020 S/S 시즌을 맞이하여 쿠폰 이벤트를 진행하고자 합니다.<br/>
                                내용은 아래와 같습니다.<br/>
                                Fuz 브랜드 주문 시 10% 할인 쿠폰 제공<br/>
                                주문금액 제한 없음<br/>
                                위 프로모션 내용 확인 부탁드리며, 회신 기다리겠습니다.<br/>
                                감사합니다.<br/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>첨부파일</span></label></th>
                            <td>
                                <p><a href="javascript:;">WF7A1018.jpg</a></p>
                                <p><a href="javascript:;">WF7A1018.jpg</a></p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>작성자</span></label></th>
                            <td>immd(입점사담당자)</td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록일</span></label></th>
                            <td>2019-12-25 14:23:23</td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

            <h3 class="title"><span>답변하기</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>

            <form id="frm" name="frm" >
                <input type="hidden" name="BRD_INQ_IDX" value="4267"/>
                <input type="hidden" name="cPage" value=""/>
                <input type="hidden" name="searchStartDate" value=""/>
                <input type="hidden" name="searchEndDate" value=""/>
                <input type="hidden" name="searchRegNm" value=""/>
                <input type="hidden" name="searchRegId" value=""/>
                <input type="hidden" name="searchKeyword" value=""/>
                <input type="hidden" name="searchBrdInqReplyCd" value=""/>
                <input type="hidden" name="searchBrdInqUseYn" value=""/>
                <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value=""/>
                <input type="hidden" name="pageSize" value="20"/>
                <input type="hidden" name="searchPrdMstErpCd" value="" />

                <!-- 메일/SMS전송을 위한 정보 -->
                <input type="hidden" name="BRD_INQ_TYPE" value="Q"/><!-- 문의유형 -->
                <input type="hidden" name="BRD_INQ_REG_NM" value="김소영"/><!-- 문의자 이름 -->
                <input type="hidden" name="BRD_INQ_REG_ID" value="sosoworld2"/><!-- 문의자 ID -->
                <input type="hidden" name="BRD_INQ_EMAIL" value="@"/><!-- 메일 주소 -->
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>답변상태</span></label></th>
                            <td>
                                답변완료
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>답변내용<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea class="textarea xlarge" name="BRD_INQ_REPLY_CONTENTS" id="BRD_INQ_REPLY_CONTENTS" style="height: 500px; width:80%;">&lt;p&gt;다음주 입고 예정입니다.222&lt;/p&gt;</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>답변자</span></label></th>
                            <td>
                                admin(슈퍼관리자) / 2019.12.04 11:28:29
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
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
