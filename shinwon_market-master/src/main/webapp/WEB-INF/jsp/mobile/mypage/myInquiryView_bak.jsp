<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>1:1문의</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	        <form name="frm" id="frm">
			<input type="hidden" name="MEM_ADV_IDX" id="MEM_ADV_IDX" value="<c:out value="${commandMap.MEM_ADV_IDX }" />" />
			<double-submit:preventer/>
	        <div class="qna-desc"><!-- qna-desc -->
	            <ul class="ct">
	            	<c:if test="${row.ORD_MST_CD ne null && row.ORD_MST_CD ne '' }">
	                <li>
	                    <span class="tit">주문번호 : </span>
	                    <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}"/>/mobile/mypage/myShoppingInfo.do?ORD_MST_CD=<c:out value="${row.ORD_MST_CD }" />','_self');" target="_blank"><c:out value="${row.ORD_MST_CD }" /></a>
	                </li>
	                </c:if>
	                <c:if test="${row.MEM_ADV_MDL_NO ne null && row.MEM_ADV_MDL_NO ne '' }">
	                <li>
	                    <span class="tit">상품코드 : </span>
	                    <a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain}"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.MEM_ADV_MDL_NO }" />','_self');" ><c:out value="${row.MEM_ADV_MDL_NO }" /></a>
	                </li>
	                </c:if>
	            </ul>
	            <p class="mt10">
	                <span class="blind">연락처</span><c:out value="${row.MEM_ADV_HPNO }" /> / 
	                <span class="blind">이메일</span><c:out value="${row.MEM_ADV_MAIL }" /> /
	                답변희망형태 : <c:out value="${row.MEM_ADV_MAIL_YN_NM }" />
	            </p>
	        </div><!-- qna-desc -->
	
	        <div class="qna-view"><!-- qna-view -->
	            <div class="col">
	                <div class="question">
	                    <i class="type"><span class="blind">질문</span></i>
	                    <p class="subject">
	                        <strong>[<c:out value="${row.MEM_ADV_QST_TYPE_UP_NM }" /> > <c:out value="${row.MEM_ADV_QST_TYPE_NM }" />]&nbsp;<c:out value="${row.MEM_ADV_TITLE }" /></strong>
	                    </p>
	                    <p class="mt10">
	                        <ui:replaceLineBreak content="${row.MEM_ADV_CONTENTS}"/>
	                    </p>
	                    <div class="ct desc">
	                        <div class="fr date">
	                            <ui:formatDate value="${row.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd"/>
	                            <span class="blind">에 작성</span>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="answer">
	                    <i class="type"><span class="blind">답변</span></i>
	                    <c:choose>
	                		<c:when test="${row.MEM_ADV_RPL_YN eq 'Y' }">
	                			<ui:replaceLineBreak content="${row.MEM_ADV_RPL_CONTENTS}"/>
	                		</c:when>
	                		<c:otherwise>
	                			답변 준비중입니다.
	                		</c:otherwise>
	                	</c:choose>
	                </div>
	            </div>
	        </div><!-- // qna-view -->
	
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
	                <li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
	                <li>답변 완료된 문의는 수정 하실 수 없습니다.</li>
	            </ul>
	        </div>
	            
	        <div class="section-button"><!-- section-button -->
	        	<c:if test="${row.MEM_ADV_RPL_YN eq 'N' }">
	            	<a href="javascript:;" id="goEdit" class="button warning"><span>수정</span></a>
	            </c:if>
	            <a href="javascript:;" id="goDelete" class="button primary"><span>삭제</span></a>
	            <!-- <a href="javascript:;" id="goList" class="button primary"><span>목록</span></a> -->
	        </div><!-- // section-button -->
			</form>
		</article>
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<form name="fileForm" id="fileForm">
     <input type="hidden" name="CMM_FLE_IDX" value="" />
     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>
<script type="text/javascript">
//<![CDATA[
$(function(){
	//목록
	$(document).on("click","#goList",function()
	{
		/* $("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit(); */
		callJavascriptLoginUrl('<c:out value="${mobileSslDomain}" />/mobile/mypage/myInquiryList.do','_self');
	});
	
	//삭제
	$(document).on("click","#goDelete",function()
	{
		if(confirm("삭제하시겠습니까?"))
		{
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryRemove.do", "target":"_self", "method":"post"}).submit();	
		}
	});
	
	//수정
	$(document).on("click","#goEdit",function()
	{
		$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryEdit.do", "target":"_self", "method":"post"}).submit();
	});

	// 파일 다운로드
	$('.file-list-title').on("click", function(){
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});
//]]>
</script>
</body>
</html>