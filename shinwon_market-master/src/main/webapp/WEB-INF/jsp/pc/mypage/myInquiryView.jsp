<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">1:1 문의 상세</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<form id="frm" name="frm">
					<input type="hidden" name="MEM_ADV_IDX" id="MEM_ADV_IDX" value="<c:out value="${commandMap.MEM_ADV_IDX }"/>"/>
					<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage }"/>">
										
						 <%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
						 
						<!-- //my_modify_top_wrap -->
						<div class="con_tit_wrap">
						    <h3 class="con_tit">문의내용</h3>
						</div>
						<div class="table_wrap mb90">
							<!-- <p class="required_txt"><span>필수입력사항</span></p> -->
							<table class="tb_row read"> <!-- read 추가 -->
								<caption>1:1 문의 상세 : 상담유형, 제목, 내용, 이메일, 휴대폰, 파일첨부 입력 표입니다.</caption>
								<colgroup>
									<col style="width:20%">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 상담유형
										</th>
										<td><c:out value="${row.MEM_ADV_QST_TYPE_NM }" /></td>
									</tr>
									<tr>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 제목
										</th>
										<td><c:out value="${row.MEM_ADV_TITLE }"/></td>
									</tr>
									<tr>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 내용
										</th>
										<%-- <td><ui:replaceLineBreak content="${row.MEM_ADV_CONTENTS}"/></td> --%>
										<td><c:out value="${row.MEM_ADV_CONTENTS }"/></td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td><c:out value="${row.MEM_ADV_MAIL }" /></td>
									</tr>
									<tr>
										<th scope="row">휴대폰</th>
										<td><c:out value="${row.MEM_TEL_NO }" /></td>
									</tr>
									<tr>
										<th scope="row">파일첨부</th>
										<td>
											<div class="attachment_list">
												<ul>
													<c:if test="${not empty fileList }">
														<c:forEach var="fileRow" items="${fileList}" varStatus="i">	
															<li>
																<a href="javascript:void(0)" id="fileIdx_<c:out value='${fileRow.CMM_FLE_IDX }'/>" class="file_name" title="파일 다운로드" data-cmm_fle_idx="<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_save_path="<c:out value='${fileRow.CMM_FLE_SAVE_PATH }'/>">
																	<em><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></em>
																</a>
																<span class="file_capacity"><c:out value="${fileRow.CMM_FLE_ATT_SIZE }" /></span>
																<button type="button" class="btn_attach_delete">
																	<em class="blind">첨부 파일 삭제</em>
																</button>
															</li>
														</c:forEach>
													</c:if>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- //table_wrap -->
				</form>

				<div class="con_tit_wrap">
				    <h3 class="con_tit">답변내용</h3>
				</div>

				<div class="table_wrap">
					<!-- <p class="required_txt"><span>필수입력사항</span></p> -->
					<table class="tb_row read">
						<caption>1:1 문의 상세 : 답변 상태 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<c:choose>
								<c:when test="${row.MEM_ADV_RPL_YN eq 'Y' }">
									<tr>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 답변상태
										</th>
										<td>
											<div class="txt_read">
												<ui:replaceLineBreak content="${row.MEM_ADV_RPL_CONTENTS}"/>
											</div>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th scope="row">답변상태</th>
										<td>
											<div class="txt_read">답변 준비중입니다.</div>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<div class="attention_list_wrap mt47">
					<ul>
						<li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
						<li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
						<li>답변 완료된 문의는 수정/삭제 하실 수 없습니다.</li>
					</ul>
				</div>

				<div class="btn_wrap">
					<button type="button" id="goDelete" class="btn_large delete">삭제</button>
					<button type="button" id="goList" class="btn_large">목록</button>
					<c:if test="${row.MEM_ADV_RPL_YN eq 'N' }">
						<button type="button" id="goEdit" class="btn_large ok">수정</button>
					</c:if>
				</div>
			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<form name="fileForm" id="fileForm">
	<input type="hidden" name="CMM_FLE_IDX" value="" />
	<input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	<input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>

<script>
$(function(){
	//목록
	$("#goList").on("click", function()
	{
		$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
	});
	
	//삭제
	$("#goDelete").on("click", function()
	{
		if(confirm("삭제하시겠습니까?"))
		{
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInquiryRemove.do", "target":"_self", "method":"post"}).submit();	
		}
	});
	
	//수정
	$("#goEdit").on("click", function()
	{
		$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInquiryEdit.do", "target":"_self", "method":"post"}).submit();
	});
	
	// 파일 다운로드
	$('.file_name').on("click", function(){
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});
</script>

