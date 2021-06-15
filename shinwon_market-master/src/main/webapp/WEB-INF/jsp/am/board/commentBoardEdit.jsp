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

                <h2 class="title"><span>상품후기</span></h2>

                <h3 class="title"><span>상세정보</span></h3>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                   <colgroup>
                        <col style="width: 15%;min-width:180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>상품코드 / 상품명</span></label></th>
                            <td colspan="4">
                                <a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
                                    <c:out value="${row.PRD_PRD_MST_CD }"/>
                                </a> /
                                <a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${row.PRD_PRD_MST_CD}&ADMIN=Y" target="_blank">
                                    <c:out value="${row.PRD_MST_NM }"/>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>작성자</span></label></th>
                            <td colspan="4">
                                <c:choose>
                                    <c:when test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
                                        <c:out value="${row.PRD_REV_REG_ID }"/> (<c:out value="${row.MEM_MST_MEM_NM }"/>)
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goView('<c:out value="${row.PRD_REV_REG_ID }" />');">
                                            <c:out value="${row.PRD_REV_REG_ID }"/> (<c:out value="${row.MEM_MST_MEM_NM }"/>)
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록일</span></label></th>
                            <td colspan="4">
                                <ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>평점</span></label></th>
                            <td colspan="4">
                                <c:out value="${row.PRD_REV_STAR }"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>만족도평가</span></label></th>
                            <th>사이즈</th>
                            <td>
                            	<c:if test="${row.PRD_REV_SIZE eq 'A' }">작아요</c:if>
	                            <c:if test="${row.PRD_REV_SIZE eq 'B' }">정사이즈</c:if>
	                            <c:if test="${row.PRD_REV_SIZE eq 'C' }">커요</c:if>
                            </td>
                            <th>컬러</th>
                            <td><c:out value="${row.PRD_REV_CLR =='A' ? '화면과 같아요' : '화면과 달라요' }"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>후기내용 </span></label></th>
                            <td colspan="4">
                                <c:if test="${row.PRD_REV_CHN_GBN eq 'M' }">
									<img alt="모바일에서 작성" src="<c:out value="${serverDomain }"/>/am/img/image_phone.png"/>
                                </c:if>
                                <c:if test="${row.CMM_FLE_CNT > 0 }">
									<img alt="이미지 포함" src="<c:out value="${serverDomain }"/>/am/img/image_photo.png"/>
                                </c:if>
                                <ui:replaceLineBreak content="${row.PRD_REV_CONTENTS }"/>
                            </td>
                        </tr>
                        
                        <tr>
                            <th><label class="label"><span>첨부이미지</span></label></th>
                            <td colspan="4">
                                <form name="fileForm" id="fileForm">
                                    <input type="hidden" name="CMM_FLE_IDX" value=""/>
                                    <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
                                    <input type="hidden" name="CMM_FLE_ORG_NM" value="" />

                                    <c:choose>
                                        <c:when test="${not empty fileList }">
                                            <c:forEach var="fileRow" items="${fileList }" varStatus="i">
                                                <img src="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }"/>
                                                <ui:replaceLineBreak content="${fileRow.CMM_FLE_DESC }"/>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
                <h3 class="title"><span>관리정보</span></h3>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdRevRegNm" value="<c:out value="${commandMap.searchPrdRevRegNm }"/>"/>
                    <input type="hidden" name="searchPrdRevRegId" value="<c:out value="${commandMap.searchPrdRevRegId }"/>"/>
                    <input type="hidden" name="searchPrdRevContents" value="<c:out value="${commandMap.searchPrdRevContents }"/>"/>
                    <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>"/>
                    <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                </form>

                <form id="frm" name="frm">
                    <input type="hidden" name="PRD_REV_IDX" value="<c:out value="${row.PRD_REV_IDX }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdRevRegNm" value="<c:out value="${commandMap.searchPrdRevRegNm }"/>"/>
                    <input type="hidden" name="searchPrdRevRegId" value="<c:out value="${commandMap.searchPrdRevRegId }"/>"/>
                    <input type="hidden" name="searchPrdRevContents" value="<c:out value="${commandMap.searchPrdRevContents }"/>"/>
                    <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>"/>
                    <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
	
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;min-width:180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>상태</span></label></th>
                                <td>
                                    <input type="radio" name="PRD_REV_USE_YN" id="stateA" class="radio" value="Y" <c:if test="${row.PRD_REV_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                    <label for="stateA">사용</label>
                                    <input type="radio" name="PRD_REV_USE_YN" id="stateB" class="radio" value="N" <c:if test="${row.PRD_REV_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                    <label for="stateB">미사용</label>
                                </td>
                            </tr>
                            <c:if test="${empty commandMap.searchVdrMstIdx }"><%-- SB일 경우 --%>
                            <tr>
                                <th><label class="label"><span>베스트리뷰</span></label></th>
                                <td>
                                    <input type="radio" name="PRD_REV_BST_YN" id="stateA1" class="radio" value="Y" <c:if test="${row.PRD_REV_BST_YN eq 'Y'}">checked="checked"</c:if>/>
                                    <label for="stateA1">사용</label>
                                    <input type="radio" name="PRD_REV_BST_YN" id="stateB1" class="radio" value="N" <c:if test="${row.PRD_REV_BST_YN eq 'N'}">checked="checked"</c:if>/>
                                    <label for="stateB1">미사용</label>
                                </td>
                            </tr>
                            </c:if>
                            <c:if test="${not empty row.PRD_REV_ADM_REG_ID}">
                                <tr>
                                    <th><label class="label"><span>수정일</span></label></th>
                                    <td>
                                        <c:out value="${row.PRD_REV_ADM_REG_ID }"/>(<c:out value="${row.PRD_REV_ADM_REG_NM}"/>) / <ui:formatDate value="${row.PRD_REV_ADM_REG_DT }" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table><!-- // table -->
                </form>
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goModify" class="button large primary"><span>저장</span></a>
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
    //상태 사용인 경우.. 표시안함
    if("${row.PRD_REV_USE_YN}" == "Y"){
        $(".nDiv").hide();
    }

    //상태 사용/미사용 변경
//  $(document).on("click", "input[name=PRD_REV_USE_YN]", function () {
//         var useYn = $(this).val();
//         if(useYn == "Y"){
//          $(".nDiv").hide();
//         }else if(useYn == "N"){
//          alert("미사용 설정 시 상품평이 노출되지 않으며\n사유를 반드시 입력하시기 바랍니다.");
//          $(".nDiv").show();
//         }
//     });

    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/commentBoardList.do", "target":"_self", "method":"post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goModify", function () {
        var PRD_REV_USE_YN = $("input[name=PRD_REV_USE_YN]:checked").val();
//      if(PRD_REV_USE_YN == "N"){
//          if($.trim($("#PRD_REV_ADM_CONTENTS").val()) == ""){
//              alert("미사용 설정사유를 입력해주십시오.");
//              $("#PRD_REV_ADM_CONTENTS").focus();
//              return;
//          }
//      }
        var $frm = $("#frm");
        if (confirm( "저장 하시겠습니까?")) {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/commentBoardModify.do", "target":"_self", "method":"post"}).submit();
        }
    });

    // 파일 다운로드
    $(document).on("click", "#fileForm .file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.text().trim());
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });

    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
        goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
});

//-->
</script>

</body>
</html>
