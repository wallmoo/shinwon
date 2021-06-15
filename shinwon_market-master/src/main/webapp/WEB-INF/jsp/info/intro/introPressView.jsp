<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-about">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>보도자료</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>보도자료</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
        <div id="contents"><!-- #contents -->
            <h3 class="title">보도자료</h3>
                            
            <table class="bbs-view" border="0" cellpadding="0" cellspacing="0"><!-- bbs-view -->
            <caption>제목, 등록일, 조회수, 첨부파일로 구성된 공지사항 게시글 상세테이블 입니다.</caption>
            <colgroup>
                <col style="width: 120px;" />
                <col style="width: auto;" />
            </colgroup>
            <thead>
                <tr>
                    <th colspan="2">
                        <span class="semantic">제목</span>
                        <c:out value="${row.PRS_RLS_TITLE}" /><c:if test="${row.NEWMARK eq 'Y' }" ><i class="ico_new"><span class="blind">new</span></i></c:if>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center">
                        <span class="semantic">등록일</span>
                        <c:out value="${row.PRS_RLS_REG_DT}" />
                    </td>
                    <td class="text-right">조회수 <c:out value="${row.PRS_RLS_READ_CNT}" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="holder">
                             <ui:replaceLineBreak content="${row.PRS_RLS_CONTENTS}"/> 
                        </div>
                    </td>
                </tr>
                <c:if test="${not empty fileList}">
                <tr>
                    <th scope="row"><span>첨부파일</span></th>
                    <td>
                    	<c:forEach var="fileRow" items="${fileList }" varStatus="i">
                    		<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
			               		<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
	 		               	</a>
                        </c:forEach>
                    </td>
                </tr>
                </c:if>
            </tbody>
            </table><!-- // bbs-view -->

            <div class="section-button text-right"><!-- section-button -->
                <a href="<c:out value="${brandDomain}"/>/info/intro/introPress.do?cPage=<c:out value="${commandMap.cPage}"/>" class="button primary"><span>목록</span></a>
            </div><!-- // section-button -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<form name="fileForm" id="fileForm">
	<input type="hidden" name="CMM_FLE_IDX" value=""/>
    <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
    <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>

<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script>
$(document).on("click", ".file-list-title", function () {
    var $fileForm = $("#fileForm");
    var $this = $(this);
    $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
    $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
    $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
    $fileForm.attr({"action":"<c:out value="${brandDomain}"/>/info/intro/introFileDownload.do", "target":"_self", "method":"post"}).submit();
});
</script>

</body>
</html>