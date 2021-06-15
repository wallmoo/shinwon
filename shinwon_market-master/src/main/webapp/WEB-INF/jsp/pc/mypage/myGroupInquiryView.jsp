<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
	
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
		    <div id="breadcrumb" class="wrap">
		        <div class="holder">
		            <span>홈</span>
		            <span class="gt">&gt;</span>
		            <span>MYPAGE</span>
		            <span class="gt">&gt;</span>
		            <strong class="warning">단체주문 문의</strong>
		        </div>
		    </div>
	    </div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->
			
			<%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>

			<div id="internal"><!-- internal -->

            <h4 class="title"><!-- title -->
                <span>단체주문 문의</span>
                <small class="desc">
                 	고객님께서 단체주문 문의로 문의하신 내역입니다.
                </small>
            </h4><!-- // title -->

            <h5 class="title"><span class="large">단체주문 문의 내용</span></h5>
            
            <form id="frm" name="frm">
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
		        <input type="hidden" name="grpInqIdx" id="grpInqIdx" value="<c:out value="${row.GRP_INQ_IDX }"/>"/>
		        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		        <input type="hidden" name="totalCount" value="<c:out value="${commandMap.totalCount }"/>"/>
		        <input type="hidden" name="pageStatus" value=""/>
	        	<double-submit:preventer/>                
	            <table class="bbs-view core fixed" cellspacing="0"><!-- bbs-view -->
		            <caption></caption>
		            <colgroup>
		                <col style="width: 145px;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th><span>등록일</span></th>
		                    <td>
		                        <ui:formatDate value="${row.GRP_INQ_REG_DT }" pattern="yyyy.MM.dd"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>상품코드</span></th>
		                    <td>
		                    	<c:choose>
				            		<c:when test="${not empty row.GRP_PRD_MST_CD }">
				            			<strong class="warning"><c:out value="${row.GRP_PRD_MST_CD }"/></strong>
				            		</c:when>
				            		<c:otherwise>
				            			-
				            		</c:otherwise>
			            		</c:choose>
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>주문수량</span></th>
		                    <td>
		                    	<fmt:formatNumber value="${row.GRP_INQ_WANT_CNT }" groupingUsed="true" />개
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>단체명</span></th>
		                    <td>
		                    	<c:out value="${row.GRP_INQ_GRP_NM}"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>담당자명</span></th>
		                    <td>
		                    	<c:out value="${row.GRP_INQ_CUSTOMER_NM}"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th><span>내용</span></th>
		                    <td>
		                       <ui:replaceLineBreak content="${row.GRP_INQ_CONTENTS}"/>
		                    </td>
		                </tr>
		                <c:forEach items="${fileList}" var="fileRow" varStatus="i">	
			                <c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'U' }">
				                <tr>
				                    <th><span>첨부파일</span></th>
				                    <td>
				                    	<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
					                    	<strong class="warning"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></strong>
					                    </a>
				                    </td>
				                </tr>
			                </c:if>
			           </c:forEach>
		            </tbody>
	            </table><!-- // bbs-view -->
	       </form>

           <h5 class="title"><span class="large">답변내용</span></h5>
           
           <form id="replyFrm" name="replyFrm">
			   <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
		       <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>               
               <table class="bbs-view core fixed" cellspacing="0"><!-- bbs-view -->
	               <caption></caption>
	               <colgroup>
	                   <col style="width: 145px;" />
	                   <col style="width: auto;" />
	               </colgroup>
	               <tbody>
	                   <tr>
	                       <th><span>답변상태</span></th>
	                       <td>
	                       		<c:if test="${row.GRP_INQ_REPLY_YN eq 'N' }">
				            		답변미완료
				            	</c:if>
				            	<c:if test="${row.GRP_INQ_REPLY_YN eq 'Y' }">
				            		답변완료
				            	</c:if>
	                       </td>
	                   </tr>
	                   <c:if test="${row.GRP_INQ_REPLY_YN eq 'Y' }">
		                   <tr>
		                       <th><span>답변내용</span></th>
		                       <td>
		                          <ui:replaceLineBreak content="${row.GRP_INQ_REPLY_CONTENTS}"/>
		                       </td>
		                   </tr>
		               </c:if>
		               <c:forEach items="${fileList}" var="fileRow" varStatus="i">	
			                <c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'A' }">
				                <tr>
				                    <th><span>첨부파일</span></th>
				                    <td>
				                    	<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
					                    	<strong class="warning"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></strong>
					                    </a>
				                    </td>
				                </tr>
			                </c:if>
			           </c:forEach>
	               </tbody>
               </table><!-- // bbs-view -->
           </form>

           <div class="section-button"><!-- section button -->
                <a href="javascript:;" id="goList" class="button info large"><span>목록</span></a>
           </div><!-- // section button -->

           <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

           </div><!-- internal -->
           	
		   <!-- 파일 다운로드용 폼 -->
		   <form name="fileForm" id="fileForm">
		        <input type="hidden" name="CMM_FLE_IDX" value="" />
		        <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
		        <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
		   </form>
						
           </div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
	$(function()
	{
		//목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myGroupInquiryList.do", "target":"_self", "method":"post"}).submit();
		});
		
		// 파일 다운로드
		$('.file-list-title').on("click", function(){
	        var $fileForm = $("#fileForm");
	        var $this = $(this);
	        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
	        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
	        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
	        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
	    });
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>