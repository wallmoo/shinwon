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

            <div class="container"><!-- container -->

                <h2 class="title"><span>리뷰어모집</span></h2>

                <div class="tab-list"><!-- tab -->
                    <ul class="tab">
                        <li><a href="#none" id="goBiasicEdit">모집관리</a></li>
                        <li><a href="javascript:;" id="goEntryList">응모자확인&당첨자 선정</a></li>
                        <!--  <li><a href="javascript:;" id="goWinnerList">당첨자 발표</a></li>-->
                        <li class="in"><a href="javascript:;" id="goReview">상품리뷰관리</a></li>
                    </ul>
                </div><!-- // tab -->

                <h3 class="title"><span>목록</span></h3>

                <form id="frm" name="frm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
                    <input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
                    <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
					<input type="hidden" name="searchExpMstStatus" value="<c:out value="${commandMap.searchExpMstStatus }"/>"/>
					
                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                            <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                        <c:if test="${not empty list }">
                            <div class="col-1-2 text-right">
                            <a href="#none;" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                            <a href="#none;" id="goApply" class="button small primary"><span>일괄수정</span></a>
                            </div>
                        </c:if>
                    </div><!-- // 목록 상단 버튼 -->

                </form>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 3%;" />
                        <col style="width: 5%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 8%;" />
                        <col style="width: 5%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll"/></th>
                            <th>NO</th>
                            <th>등록일</th>
                            <th>아이디</th>
                            <th>회원이름</th>
                            <th>휴대폰번호</th>
                            <th>리뷰제목</th>
                            <th>리뷰 URL</th>
                            <th>전시여부</th>
                            <th>베스트</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:set var="listNum" value="${paging.listNum}" />
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                                        <td><input type="checkbox" class="checkbox checkRow"  id="EXP_REV_IDX<c:out value="${i.index }"/>" name="EXP_REV_IDX_CHK" value="<c:out value="${row.EXP_REV_IDX }"/>" /></td>
                                        <td><c:out value="${listNum }"/></td>
                                        <td><ui:formatDate value="${row.EXP_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                        <td><c:out value="${row.MEM_MST_MEM_ID }"/></td>
                                        <td><c:out value="${row.MEM_MST_MEM_NM }"/></td>
                                        <td>
                                            <c:out value="${row.TEL_NO }"/>
                                            <input type="hidden" name="TEL_NO_SMS" id="TEL_NO_SMS<c:out value="${i.index }"/>" value="<c:out value="${row.TEL_NO_SMS }"/>" />
                                        </td>
                                        <td><c:out value="${row.EXP_REV_NM }"/></td>
                                        <td><a href="<c:out value="${row.EXP_REV_URL }"/>" target="_blank"><c:out value="${row.EXP_REV_URL }"/></a></td>
                                        <td>
                                            <select id="EXP_REV_USE_YN<c:out value="${i.index }"/>" name="EXP_REV_USE_YN" class="select EXP_REV_USE_YN"  data-rownum="<c:out value="${i.index }"/>">
                                                <option value="Y" <c:if test="${row.EXP_REV_USE_YN eq 'Y' }">selected="selected"</c:if>>전시</option>
                                                <option value="N" <c:if test="${row.EXP_REV_USE_YN eq 'N' }">selected="selected"</c:if>>미전시</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select id="EXP_REV_BST_YN<c:out value="${i.index }"/>" name="EXP_REV_BST_YN" class="select EXP_REV_BST_YN"  data-rownum="<c:out value="${i.index }"/>">
                                                <option value="Y" <c:if test="${row.EXP_REV_BST_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
                                                <option value="N" <c:if test="${row.EXP_REV_BST_YN eq 'N' }">selected="selected"</c:if>>N</option>
                                            </select>
                                        </td>
                                    </tr>
                                 <c:set var="listNum" value="${listNum-1}" />
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="10">등록된 리뷰가 없습니다.</td></tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

                <form name="excelForm" id="excelForm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
                </form>
                <form name="tabForm" id="tabForm">
                    <input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                </form>

            </div><!-- // container -->

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
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script>
$(function(){

    $.checkBoxSelect("checkAll", "checkRow");
    $(document).on("click", "#goEm", function (){
//      if($("input[name='EXP_REV_IDX_CHK']:checked").length == 0)
//      {
//          alert("EM 발송할 행을 선택하세요.");
//          return;
//      }
        if(confirm("리뷰등록 요청메일을 발송하시겠습니까?"))
        {
            $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerReviewMailSend.do", "target" : "_self", "method" : "get"}).submit();
        }
    });

    $(document).on("click", "#goLms", function (){
        var expRevBstYns = [];
        var expRevUseYns = [];
        var iCnt = 0;
        var PHONE_NO = "";
        if($("input[name='EXP_REV_IDX_CHK']:checked").length == 0)
        {
            alert("LMS 발송할 행을 선택하세요.");
            return;
        }
        else
        {
            $("input[name='EXP_REV_IDX_CHK']:checked").each(function(){
                var id = $(this).attr('id');
                var EXP_REV_IDX = $(this).val();
                id = id.replace('EXP_REV_IDX','');
                var TEMP = $("#TEL_NO_SMS"+id).val();
                if(TEMP!="")
                {
                    if(iCnt==0)PHONE_NO = TEMP;
                    else PHONE_NO = PHONE_NO+","+TEMP;
                }

                iCnt++;
            });

            popup("<c:out value="${serverDomain}" />/am/common/commonSmsPopup.do?PHONE_NO="+PHONE_NO, "500", "600", "yes", "commonSmsPopup");
        }

    });

    $(document).on("click", "#goApply", function (){
        var expRevIdxs = [];
        var expRevBstYns = [];
        var expRevUseYns = [];

        if($("input[name='EXP_REV_IDX_CHK']:checked").length == 0)
        {
            alert("저장할 행을 선택하세요.");
            return;
        }
        else
        {
            $("input[name='EXP_REV_IDX_CHK']:checked").each(function(){
                var id = $(this).attr('id');
                var EXP_REV_IDX = $(this).val();
                id = id.replace('EXP_REV_IDX','');
                var bstYn = $("#EXP_REV_BST_YN"+id).val();
                var useYn = $("#EXP_REV_USE_YN"+id).val();

                expRevIdxs[expRevIdxs.length] = EXP_REV_IDX;
                expRevBstYns[expRevBstYns.length] = bstYn;
                expRevUseYns[expRevUseYns.length] = useYn;

                $(this).prop("checked",false);
            });

            $.ajax({
                type: "post",
                url: "<c:out value="${serverDomain}"/>/am/marketing/kingerBestUpdateAjax.do",
                data: {"expRevIdxs[]": expRevIdxs, "expRevBstYns[]": expRevBstYns,  "expRevUseYns[]": expRevUseYns},
                async: false,
                success: function(data)
                {
                    if(data.result == "success" )
                    {
                        alert("처리 되었습니다.");
                        // getEventImageListAjax();
                        $("#search").trigger('click');
                    }
                },
                error : function (err)
                {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
                }
            });
        }
    });

    // 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goBasicEdit", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerEdit.do", "target":"_self", "method":"post"}).submit();
    });

    // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goWinnerList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerWinList.do", "target" : "_self", "method" : "get"}).submit();
    });

    $(document).on("click", "#goEventWinnerSelect", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerEntryWinnerSelect.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 리뷰 탭 클릭 이벤트
    $(document).on("click", "#goReview", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerReviewList.do", "target" : "_self", "method" : "get"}).submit();
    });

    $(document).on("click", "#goEntryList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerEntryList.do", "target" : "_self", "method" : "get"}).submit();
    });

    $(document).on("change", ".EXP_REV_BST_YN", function () {
        var rnum = $(this).data("rownum");
        $("#EXP_REV_IDX"+rnum).prop("checked",true);
    });

    $(document).on("change", ".EXP_REV_USE_YN", function () {
        var rnum = $(this).data("rownum");
        $("#EXP_REV_IDX"+rnum).prop("checked",true);
    });

    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSizeEntry']", function () {
        goPage(1);
    });

    // 페이지 이동
    goPage = function (cPage)
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPageEntry']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerReviewList.do", "target":"_self", "method":"post"}).submit();
    };

    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm");
        if($searchForm.valid())
        {
            $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
            $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerReviewList.do", "target":"_self", "method":"post"}).submit();
        }
    });

});
</script>

</body>
</html>
