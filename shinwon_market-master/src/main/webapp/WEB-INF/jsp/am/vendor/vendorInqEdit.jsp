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

                <h2 class="title"><span>입점사문의사항</span></h2>

                <h3 class="title"><span>상세</span></h3>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width: 180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>입점업체</span></th>
                            <td>
                                <a href="javascript:goViewVendor('<c:out value="${row.SCM_VDR_MST_IDX }"/>');">
                                    <c:out value="${row.VDR_MST_NM }" />
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <th><span>작성자</span></th>
                            <td>
                                <c:out value="${row.SCM_INQ_REG_NM }" />(<c:out value="${row.SCM_INQ_REG_ID }"/>)
                            </td>
                        </tr>
                        <tr>
                            <th><span>등록일</span></th>
                            <td>
                                <ui:formatDate value="${row.SCM_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>문의유형</span></th>
                            <td>
                                <c:out value="${row.CMN_COM_NM }"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>주문번호</span></th>
                            <td>
                                <c:if test="${not empty row.SCM_ORD_MST_CD }">
                                    <a href="<c:out value="${serverDomain}"/>/am/order/orderPopup.do?ORD_MST_CD=<c:out value="${row.SCM_ORD_MST_CD}"/>" class="js-modal" data-width="1300" data-height="800" data-scroll="true" target="_blank" title="새 창 으로 열립니다.">
                                        <c:out value="${row.SCM_ORD_MST_CD }"/>
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th><span>제목</span></th>
                            <td>
                                <c:out value="${row.SCM_INQ_TITLE }"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>내용</span></th>
                            <td>
                                <ui:replaceLineBreak content="${row.SCM_INQ_CONTENTS }"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>첨부파일</span></th>
                            <td>
                                <form name="fileForm" id="fileForm">
                                    <input type="hidden" name="CMM_FLE_IDX" value=""/>
                                    <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
                                    <input type="hidden" name="CMM_FLE_ORG_NM" value="" />                    
                                
                                    <c:if test="${not empty fileList }">    
                                        <c:forEach var="fileRow" items="${fileList }" varStatus="i">
                                            <i class="icon-file"></i>
                                            <a href="#none" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
                                                <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                            </a>
                                        </c:forEach>    
                                    </c:if>
                                </form> 
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->

                <h3 class="title"><span>답변하기</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchScmInqReplyCd" value="<c:out value="${commandMap.searchScmInqReplyCd }"/>"/>                    
                    <input type="hidden" name="searchScmInqRegId" value="<c:out value="${commandMap.searchScmInqRegId }"/>"/>
                    <input type="hidden" name="searchScmInqRegNm" value="<c:out value="${commandMap.searchScmInqRegNm }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                </form>
                
                <form name="frm" id="frm">
                    <input type="hidden" name="SCM_INQ_IDX" value="<c:out value="${row.SCM_INQ_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchScmInqReplyCd" value="<c:out value="${commandMap.searchScmInqReplyCd }"/>"/>                    
                    <input type="hidden" name="searchScmInqRegId" value="<c:out value="${commandMap.searchScmInqRegId }"/>"/>
                    <input type="hidden" name="searchScmInqRegNm" value="<c:out value="${commandMap.searchScmInqRegNm }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                    
                    <!-- 메일/SMS전송을 위한 정보 -->
                    <input type="hidden" name="SCM_INQ_TYPE" value="<c:out value="${row.SCM_INQ_TYPE}"/>"/><!-- 문의유형 -->
                    <input type="hidden" name="SCM_INQ_REG_NM" value="<c:out value="${row.SCM_INQ_REG_NM}"/>"/><!-- 문의자 이름 -->
                    <input type="hidden" name="SCM_INQ_REG_ID" value="<c:out value="${row.SCM_INQ_REG_ID}"/>"/><!-- 문의자 ID -->
                       
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>상태 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <span>답변완료</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span>답변내용 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <textarea name="SCM_INQ_REPLY_CONTENTS" id="SCM_INQ_REPLY_CONTENTS" style="height: 500px;"><c:out value="${row.SCM_INQ_REPLY_CONTENTS }"/></textarea>
                                </td>
                            </tr>
                            <tr>
                            	<th><span>답변자</span></th>
                            	<td>
                            		${row.SCM_INQ_REPLY_ID }(${row.SCM_INQ_REPLY_NM }) / <ui:formatDate value="${row.SCM_INQ_REPLY_DT }" pattern="yyyy-MM-dd HH:mm:ss"/>
                            	</td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>
                
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
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
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 답변 처리 요청 validation rules 적용
    $("#smsForm").validate({
        rules: 
        { 
            SMS_HP1:{required:true, number:true},
            SMS_HP2:{required:true, number:true},
            SMS_HP3:{required:true, number:true}
        },
        messages :{
            SMS_HP1:{required:"핸드폰번호 첫 자리를 선택해 주십시오"},
            SMS_HP2:{required:"핸드폰번호 중간 자리를 선택해 주십시오"},
            SMS_HP3:{required:"핸드폰번호 끝 자리를 선택해 주십시오"}
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/vendor/vendorInqList.do", "target":"_self", "method":"post"}).submit();
    });
 
    
    // 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.text().trim());
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
        
    });
    
    // 입점업체 상세정보 팝업창 호출
    goViewVendor = function (vdrMstIdx) {
        popup("<c:out value="${serverDomain}" />/am/site/vendorManagerPopup.do?VDR_MST_IDX=" + vdrMstIdx, "1200", "700", "yes", "goVendorManagerPopup");
    };
    
});
</script>

</body>
</html>
