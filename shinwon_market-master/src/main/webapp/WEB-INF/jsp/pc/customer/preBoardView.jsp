<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
	
	<div class="container breadcrumb-wrap"><!-- breadcrumb -->
        <div id="breadcrumb" class="wrap">
            <div class="holder">
                <span>홈</span>
                <span class="gt">&gt;</span>
                <strong class="warning">${commandMap.BRD_MST_TYPE eq 'N' ? '일반게시판' : '이미지게시판'} 미리보기</strong>
            </div>
        </div>
    </div><!-- // breadcrumb -->

	<div class="container visual-wrap"><!-- visual -->
	    <div class="wrap">
	        <img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_helpdesk.png" alt="" />
	    </div>
	</div><!-- // visual -->


	<div class="container"><!-- container -->
	<div class="wrap"><!-- wrap -->

	<div id="lnb"><!-- lnb -->
	    <ul class="reset">
	        <li class="active"><a href="javascript:;">${commandMap.BRD_MST_TYPE eq 'N' ? '일반게시판' : '이미지게시판'} 미리보기</a></li>
	    </ul>
	</div><!-- // lnb -->

	<div id="internal"><!-- internal -->
	
	<h3 class="title"><span>${commandMap.BRD_MST_TYPE eq 'N' ? '일반게시판' : '이미지게시판'} 미리보기</span></h3>

	<table class="bbs-view fixed" cellspacing="0"><!-- bbs-view -->
		<caption></caption>
		<colgroup>
			<col style="width: 145px;" />
			<col style="width: auto;" />
			<col style="width: 145px;" />
			<col style="width: auto;" />
	    </colgroup>
	    <tbody>
	        <tr>
	            <th><span>제목</span></th>
	            <td colspan="3">
	                <c:out value="${row.BRD_DTL_TITLE }"/>
	            </td>
	        </tr>
	        <tr>
	            <th><span>등록일</span></th>
	            <td>
	               <ui:formatDate value="${row.BRD_DTL_REG_DT }" pattern="yyyy.MM.dd"/>
	            </td>
	            <th><span>조회수</span></th>
	            <td>
	               <fmt:formatNumber value="${row.BRD_DTL_READ_CNT}" groupingUsed="true"/>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="4">
	                <div class="holder">
	                    <c:out value="${row.BRD_DTL_CONTENTS}" escapeXml="false"/>
	                </div>
	            </td>
	        </tr>
	        <c:if test="${not empty fileList }">
                <div class="bbs-view-attatch"><!-- bbs-view-attatch -->
	                <c:forEach items="${fileList}" var="fileRow" varStatus="i">	
			        <tr>
			            <th><span>첨부파일</span></th>
			            <td colspan="3">
			                <a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
		                    <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
			            </td>
			        </tr>
			        </c:forEach>
		        </div>
	        </c:if>
	    </tbody>
    </table><!-- // bbs-view -->

    <table class="bbs-view-nav" cellspacing="0"><!-- bbs-view-nav -->
    <tbody>
        <tr class="prev">
            <th><span>이전글</span></th>
            <td class="subject">
            	<c:choose>
                  		<c:when test="${not empty row.PRE_TITLE_IDX}">
                  			<a href="javascript:;" class="subject2" data-brd_dtl_idx="<c:out value="${row.PRE_TITLE_IDX }"/>" data-brd_dtl_top_yn="${row.BRD_DTL_TOP_YN}"><c:out value="${row.PRE_TITLE }"/></a>
                  		</c:when>
                  		<c:otherwise>
                  			<c:out value="${empty row.PRE_TITLE_IDX ? '이전 글이 없습니다.' : row.PRE_TITLE }"/>
                  		</c:otherwise>
                  	</c:choose>
            </td>
        </tr>
        <tr class="next">
            <th><span>다음글</span></th>
            <td class="subject">
            	<c:choose>
                  		<c:when test="${not empty row.NEXT_TITLE_IDX}">
                  			<a href="javascript:;" class="subject2" data-brd_dtl_idx="<c:out value="${row.NEXT_TITLE_IDX }"/>" data-brd_dtl_top_yn="${row.BRD_DTL_TOP_YN}"><c:out value="${row.NEXT_TITLE }"/></a>
                  		</c:when>
                  		<c:otherwise>
                  			<c:out value="${empty row.NEXT_TITLE_IDX ? '다음 글이 없습니다.' : row.NEXT_TITLE }"/>
                  		</c:otherwise>
                  	</c:choose>
            </td>
        </tr>
    </tbody>
    </table><!-- // bbs-view-nav -->
    
    <c:if test="${row.BRD_MST_REPLY_YN eq 'Y' }">
    	<div class="bbs-status"><!-- bbs-status -->
			<div class="page">
			    <strong class="xlarge primary">댓글 : <fmt:formatNumber value="${empty totalCount ? '0' : totalCount }" groupingUsed="true"/>개</strong>
			</div>
		</div><!-- // bbs-status -->
	
		<form name="replyFrm" id="replyFrm">
			<input type="hidden" name="BRD_MST_IDX" value="<c:out value="${commandMap.BRD_MST_IDX }"/>"/> 
			<input type="hidden" name="BRD_DTL_IDX" value="${row.BRD_DTL_IDX }"/>
			<input type="hidden" name="BRD_REPLY_DISPLAY_YN"/>
			<input type="hidden" name="BRD_DTL_TOP_YN" value="${row.BRD_DTL_TOP_YN}" />
			<input type="hidden" name="BRD_MST_TYPE" value="<c:out value="${commandMap.BRD_MST_TYPE }"/>"/>
			<input type="hidden" name="pPage" value="<c:out value="${commandMap.pPage }"/>"/>
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			<double-submit:preventer/>
			<div class="comment-write"><!-- comment-write -->
				<textarea class="textarea" name="BRD_REPLY_CONTENTS" id="BRD_REPLY_CONTENTS" placeholder="${empty sessionUser.MEM_MST_MEM_ID ? ' 로그인 후 댓글 작성이 가능합니다.' : '내용은 최대 500byte까지 작성할 수 있습니다.'}" onkeyup="getStrByte(this,'#byte', 500, 3);" style="width:590px;"></textarea>
			    <p class="reset mt5">(<span id="byte">0</span>/500 byte)</p>                    
			    <a href="javascript:;" id="replyRegist" class="button warning"><span>저장</span></a>
			</div><!-- // comment-write -->
		</form>
	
		<div class="comment-list"><!-- comment-list -->
			<ul class="reset">
			    <c:choose>
					<c:when test="${not empty replyList }">
						<c:forEach var="replyRow" items="${replyList }" varStatus="i">
							<li>
								<ui:replaceLineBreak content="${replyRow.BRD_REPLY_CONTENTS }"/>
								<div class="desc">
								    <span class="author info">
							    	<c:out value="${fn:substring(replyRow.BRD_REPLY_REG_ID,0,(fn:length(replyRow.BRD_REPLY_REG_ID)-4))}" />****
								</span>
								<span class="pipe">|</span>
								<span class="date info"><ui:formatDate value="${replyRow.BRD_REPLY_REG_DT }" pattern="yyyy.MM.dd"/></span>
							    </div>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<li>
						댓글이 없습니다.
					</li>
					</c:otherwise>
				</c:choose>
		    </ul>
		</div><!-- // comment-list -->
	
		<div class="section-pagination"><!-- section pagination -->
			<ui:frontpaging paging="${replyPaging }" jsFunction="goReplyPage" />
		</div><!-- // section pagination -->
    </c:if>

	<div class="section-button"><!-- section button -->
	    <a href="javascript:;" id="goList" class="button info large"><span>목록</span></a>
	</div><!-- // section button -->

	<form id="frm" name="frm">
		<input type="hidden" name="BRD_DTL_IDX" value="" />
		<input type="hidden" name="BRD_DTL_TOP_YN" value="${row.BRD_DTL_TOP_YN}" />
		<input type="hidden" name="BRD_MST_IDX" value="<c:out value="${commandMap.BRD_MST_IDX }"/>"/>  
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		<input type="hidden" name="BRD_MST_TYPE" value="<c:out value="${commandMap.BRD_MST_TYPE }"/>"/>
	</form>   
            
    <!-- 파일 다운로드용 폼 -->
	<form name="fileForm" id="fileForm">
	     <input type="hidden" name="CMM_FLE_IDX" value=""/>
	     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	</form>

	</div><!-- internal -->
	
	</div><!-- wrap -->
	</div><!-- // container -->
	
	<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>
	
	</div><!-- // inner -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
$(function(){
	//목록
	$(document).on("click","#goList",function()
	{
		if("${commandMap.BRD_MST_TYPE}" == "N")
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/preBoardList.do", "target":"_self", "method":"get"}).submit();	
		}
		else
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/preImageBoardList.do", "target":"_self", "method":"get"}).submit();
		}
	});
	
	// 제목 a Tag 클릭 이벤트
    $(document).on("click", ".subject2", function () 
    {
        var $frm = $("#frm");
        $frm.find("input[name='BRD_DTL_IDX']").val($(this).data("brd_dtl_idx"));
        $frm.find("input[name='BRD_DTL_TOP_YN']").val($(this).data("brd_dtl_top_yn"));
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/preBoardView.do", "target":"_self", "method":"get"}).submit();
    });
	
	// 파일 다운로드
    $(document).on("click", ".file-list-title", function () 
    {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"get"}).submit();
    });
	
	// 댓글 저장 
    $("#replyRegist").on("click",function()
		{
			if("${sessionUser.MEM_MST_MEM_ID}" == "")
			{
				alert("로그인 후 댓글 작성이 가능합니다.");
				return;
			}
			if($("#BRD_REPLY_CONTENTS").val() == "")
			{
				alert("댓글을 입력해주세요.");
				$("#BRD_REPLY_CONTENTS").focus();
				return;
			}
			if(confirm("댓글을 등록하시겠습니까?"))
			{
				$("#replyFrm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/preReplyRegist.do","target":"_self","method":"post"}).submit();			
			}
		});
	
 	// 댓글 페이지 이동
    goReplyPage = function (pPage) 
    {
        var $frm = $("#replyFrm");
        $frm.find("input[name='pPage']").val(pPage);
        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/preBoardView.do", "target":"_self", "method":"get"}).submit();
    };
});
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>