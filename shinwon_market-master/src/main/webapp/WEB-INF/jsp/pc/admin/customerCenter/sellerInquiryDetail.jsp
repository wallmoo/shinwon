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

            <h2 class="title"><span>셀러문의</span></h2>

            <h3 class="title"><span>문의내용</span></h3>
            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 20%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><label class="label"><span>셀러명</span></label></th>
                        <td>이루마</td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>작성자</span></label></th>
                        <td><a href="#">Ididid(홍길동)</a></td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>등록일</span></label></th>
                        <td>2019-01-02 09:23:12</td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>제목</span></label></th>
                        <td>사이즈 및 원단문의</td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>내용</span></label></th>
                        <td>털 소재가 양털이라구 되어있는데 맞나요? </td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>공개여부</span></label></th>
                        <td>비공개</td>
                    </tr>
                </tbody>
            </table><!-- // table -->

            <h3 class="title"><span>답변하기</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            <form id="searchForm" name="searchForm">
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
            </form>

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
                            <th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" id="BRD_INQ_USE_YN_A" name="BRD_INQ_USE_YN" class="radio"  value="Y" checked="checked"/>
                                <label for="BRD_INQ_USE_YN_A">사용</label>
                                <input type="radio" id="BRD_INQ_USE_YN_B" name="BRD_INQ_USE_YN"class="radio"  value="N" />
                                <label for="BRD_INQ_USE_YN_B">미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>답변상태<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                답변완료
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>답변내용<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea class="textarea xlarge" name="PLN_MST_PC_BANNER" id="PLN_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                 <iframe frameborder="0" scrolling="no" style="width: 100%; height: 549px;" src="/smartEditor/SmartEditor2Skin.html"></iframe>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>답변 요청일</span></label></th>
                            <td>
                                 <a id ="" class="button small"><span>답변 요청</span></a> (2019-01-02 09:23:12)
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>답변일</span></label></th>
                            <td>
                                admin(슈퍼관리자) / 2019-01-02 09:23:12
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
