<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/myInquiryTop.jsp" %>
<!-- #container -->
        <div id="container">
        	<form id="frm" name="frm">
				<input type="hidden" name="MEM_ADV_IDX" id="MEM_ADV_IDX" value="<c:out value="${commandMap.MEM_ADV_IDX }"/>"/>
				<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage }"/>">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">
                    <div class="inquiry_bx">
                        <p class="sort"><c:out value="${row.MEM_ADV_QST_TYPE_NM }" /></p>
                        <p class="title"><c:out value="${row.MEM_ADV_TITLE }"/></p>
                        <p class="date"><ui:formatDate pattern="yyyy-MM-dd" value="${list.MEM_ADV_REG_DT }"/></p>
                        <div class="cont">
                            <div class="text">
                                <c:out value="${row.MEM_ADV_CONTENTS }"/>
                            </div>
                            <ul class="info">
                                <li><span class="tit">이메일</span><span class="txt"><c:out value="${row.MEM_ADV_MAIL }" /></span></li>
                                <li><span class="tit">휴대폰</span><span class="txt"><c:out value="${row.MEM_TEL_NO }" /></span></li>
                            </ul>
                            <ul class="info file">
                            	<c:if test="${not empty fileList }">
                            		<c:forEach var="fileRow" items="${fileList}" varStatus="i">
		                                <li>
		                                	<span class="tit">파일첨부</span><span class="txt" id="fileIdx_<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_idx="<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_save_path="<c:out value='${fileRow.CMM_FLE_SAVE_PATH }'/>">
		                                	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>(<c:out value="${fileRow.CMM_FLE_ATT_SIZE }" />MB)</span>
		                                </li>
                                	</c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="tit_wp">
                        <p class="ct_tit">답변내용</p>
                    </div>
                    <c:choose>
                    	<c:when test="${row.MEM_ADV_RPL_YN eq 'Y' }">
		                    <div class="answer_cont_bx">
		                        <ui:replaceLineBreak content="${row.MEM_ADV_RPL_CONTENTS}"/>
		                    </div>
                    	</c:when>
                    	<c:otherwise>
		                    <div class="answer_cont_bx">
		                        답변 준비중입니다.
		                    </div>
                    	</c:otherwise>
                    </c:choose>
                    
                    <ul class="dot_list2">
                        <li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
                        <li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
                        <li>답변 완료된 문의는 수정 하실 수 없습니다.</li>
                    </ul>
                    <div class="btn_area">
                        <button type="button" class="btn black" id="goList">목록</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
    <form name="fileForm" id="fileForm">
		<input type="hidden" name="CMM_FLE_IDX" value="" />
		<input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
		<input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	</form>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
        $(function () {
        	var $frm = $("#frm");
        	
			$("#goList").on("click", function () {
				$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/mobile/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
			})
			
		});
</script>