<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->  
		<div class="section-title _hd_fix">
            <h2>보도자료</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>마켓플랜트 의 보도자료입니다.</li>
            </ul>
        </div>

        <h3 class="bbs-title report-title mt20"><c:if test="${row.PRS_RLS_TOP_YN eq 'Y'}">[공지]</c:if><c:out value="${row.PRS_RLS_TITLE}" /></h3>
  
        <div class="ct bbs-desc report-desc"><!-- bbs-desc -->
            <div class="fl date">
                <span class="blind">등록 날짜</span> <c:out value="${row.PRS_RLS_REG_DT}" />
            </div>
            <div class="fr hit">
                조회수 <c:out value="${row.PRS_RLS_READ_CNT}" />
            </div>
        </div><!-- // bbs-desc -->

        <div class="padder bbs-view mt15"><!-- bbs-view -->
             ${row.PRS_RLS_CONTENTS}
        </div><!-- // bbs-view -->
		<c:if test="${not empty fileList}">
	        <div class="bbs-file mt15"><!-- bbs-file -->
	            <span class="blind">첨부파일</span>
	            <c:forEach var="fileRow" items="${fileList }" varStatus="i">
	            <a href="<c:out value="${cdnDomain}" /><c:out value="${fileRow.CMM_FLE_ATT_PATH}" /><c:out value="${fileRow.CMM_FLE_SYS_NM}" />" download data-ajax="false"><c:out value="${fileRow.CMM_FLE_ORG_NM}"/></a>
	            </c:forEach>
	        </div><!-- // bbs-file -->
        </c:if>

        <div class="section-button"><!-- section-button -->
            <a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPress.do" class="button"><span>목록</span></a>
        </div><!-- // section-button -->
        
	</article>
	<!--// #container E -->


<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<script>
$(document).on("click", ".file-list-title", function () {
    var $fileForm = $("#fileForm");
    var $this = $(this);
    $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
    $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
    $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
    $fileForm.attr({"action":"<c:out value="${mobileBrandDomain}"/>/info/intro/introFileDownload.do", "target":"_self", "method":"post"}).submit();
});
</script>

</body>
</html>