<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>공지사항</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>

            <div id="body"><!-- #body -->

                <h3 class="title">공지사항</h3> 
                            
                <table class="bbs-view"><!-- bbs-view -->
                <caption>제목, 등록일, 조회수, 첨부파일로 구성된 공지사항 게시글 상세테이블 입니다.</caption>
                <colgroup>
                    <col style="width: 120px;" />
                    <col style="width: auto;" />
                    <col style="width: 120px;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span>제목</span></th>
                        <td colspan="3">
                            <c:out value="${row.BRD_NTS_TITLE }"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>등록일</span></th>
                        <td>
                           <ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy-MM-dd"/>
                        </td>
                        <th scope="row"><span>조회수</span></th>
                        <td>
                           <fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="holder">
                                <c:out value="${row.BRD_NTS_CONTENTS}" escapeXml="false"/>
                            </div>
                        </td>
                    </tr>
                    <c:if test="${not empty fileList }">
                    	<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
		                    <tr>
		                        <th scope="row"><span>첨부파일</span></th>
		                        <td colspan="3">
		                            <a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></a>
		                        </td>
		                    </tr>
                    	</c:forEach>
                    </c:if>
                </tbody>
                </table><!-- // bbs-view -->

                <div class="section-button ar"><!-- section-button -->
                    <a href="javascript:;" class="btn_st1 btn_blk777" id="goList" ><span>목록</span></a>
                </div><!-- // section-button -->
                
            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	
	<form id="frm" name="frm">
		<input type="hidden" name="BRD_NTS_IDX" value="" />
		<input type="hidden" name="BRD_NTS_TOP_YN" value="${row.BRD_NTS_TOP_YN}" />
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
	</form>   
            
    <!-- 파일 다운로드용 폼 -->
	<form name="fileForm" id="fileForm">
	     <input type="hidden" name="CMM_FLE_IDX" value=""/>
	     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	</form>
	
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
	$(function(){
		//목록
		$(document).on("click","#goList",function(){
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/noticeBoardList.do", "target":"_self", "method":"get"}).submit();
		});
		
		
		// 파일 다운로드
	    $(document).on("click", ".file-list-title", function (){
	        var $fileForm = $("#fileForm");
	        var $this = $(this);
	        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
	        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
	        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
	        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"get"}).submit();
	    });
	});
</script>

<!--  <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>-->
</html>