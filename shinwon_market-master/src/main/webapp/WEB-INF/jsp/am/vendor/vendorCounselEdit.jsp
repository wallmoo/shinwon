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

                <h2 class="title"><span>입점문의관리</span></h2>

                
                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                    
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>"/>
                    <input type="hidden" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>"/>
                    <input type="hidden" name="searchManagerNm" value="<c:out value="${commandMap.searchManagerNm }"/>"/>
                </form>
                    
                <form id="frm" name="frm">
                    <input type="hidden" name="VDR_CST_IDX" id="VDR_CST_IDX" value="<c:out value="${row.VDR_CST_IDX }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                    
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>"/>
                    <input type="hidden" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>"/>
                    <input type="hidden" name="searchManagerNm" value="<c:out value="${commandMap.searchManagerNm }"/>"/>
                    <!-- <input type="hidden" id="removeFiles" name="removeFiles" value="" />파일삭제관련변수 -->

                    <h3 class="title"><span>상담정보</span></h3>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: 80%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>쇼핑몰 분류</th>
                                <td><c:out value="${row.VDR_CST_GUBUN }"/></td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td><c:out value="${row.VDR_CST_TITLE }"/></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                	<c:out value="${row.VDR_CST_CTS}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>업체명</th>
                                <td><c:out value="${row.VDR_CST_NM}"/></td> 
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
                                	<c:out value="${row.VDR_CST_BUSI1}"/>-
                                	<c:out value="${row.VDR_CST_BUSI2}"/>-
                                	<c:out value="${row.VDR_CST_BUSI3}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>담당자명</th>
                                <td><c:out value="${row.VDR_CST_MNG_NM }"/></td>
                            </tr>
                            <tr>    
                                <th>담당자 유선전화</th> 
                                <td>
                                    <c:if test="${not empty row.VDR_CST_TEL2 && not empty row.VDR_CST_TEL3 }">
                                        <c:out value="${row.VDR_CST_TEL1 }"/> -
                                        <c:out value="${row.VDR_CST_TEL2 }"/> -
                                        <c:out value="${row.VDR_CST_TEL3 }"/>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>담당자 휴대폰</th>                                      
                                <td>
                                    <c:if test="${not empty row.VDR_CST_HP2 && not empty row.VDR_CST_HP3 }">
                                        <c:out value="${row.VDR_CST_HP1 }"/> -
                                        <c:out value="${row.VDR_CST_HP2 }"/> -
                                        <c:out value="${row.VDR_CST_HP3 }"/>            
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>담당자 이메일</th>                                        
                                <td colspan="3"><c:out value="${row.VDR_CST_MAIL }"/></td>
                            </tr>
                            <tr>
                                <th>사이트 url</th>                                       
                                <td colspan="3">
                                	<a href="${row.VDR_CST_URL }" target="_blank"><c:out value="${row.VDR_CST_URL }"/></a>
                                </td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>                                       
                                <td colspan="3">
                                
									<c:forEach var="fileitem" items="${fileList }" varStatus="i">
										<a href="javascript:;"  class="file-list-title"
										data-cmm_fle_idx="<c:out value="${fileitem.CMM_FLE_IDX }"/>"  
										data-cmm_fle_save_path="<c:out value="${fileitem.CMM_FLE_SAVE_PATH }"/>"  title="${fileitem.CMM_FLE_ORG_NM }">
											<c:out value="${fileitem.CMM_FLE_ORG_NM }"/>
										</a>
										<!-- 
										<a href="<c:out value="${fileitem.CMM_FLE_SAVE_PATH}"/>" target="_blank" title="새 창 으로 열립니다.">
											<c:out value="${row.CMM_FLE_ORG_NM }"/>
										</a>
										 -->
									</c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <th>관리자 메모</th>                                     
                                <td colspan="3">
                                    <textarea rows="5" cols="30" name="VDR_CST_MEMO" id="VDR_CST_MEMO" maxlength="1000" class="textarea"><c:out value="${row.VDR_CST_MEMO}"/></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </form>
                    
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
                <!-- 파일 다운로드용 폼 -->
                <form name="fileForm" id="fileForm">
                     <input type="hidden" name="CMM_FLE_IDX" value=""/>
                     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
                     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
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

<script>    
$(function(){  
        
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorCounselList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 수정 이벤트
    $(document).on("click", "#goRegist", function () {
        if (confirm( "수정 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorCounselModify.do", "target":"_self", "method":"post"}).submit();
        }
    });
    
    // 파일 다운로드
    
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
    
    
});
</script>

</body>
</html>
