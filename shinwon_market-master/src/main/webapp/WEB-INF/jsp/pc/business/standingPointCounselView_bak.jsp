<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>

<c:set var="mail2" value="${fn:split(row.VDR_CST_MAIL,'@')[1]}" />
<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<form id="frm" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="VDR_CST_IDX" id="VDR_CST_IDX" value="<c:out value="${row.VDR_CST_IDX}" />" />
        <double-submit:preventer/>		
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">입점 상담신청</h2>
					</div>
					
					<dl class="minW counsel_ask">
						<dt>
							<strong>입점 상담신청</strong>
							<span class="tx_ex"><i class="co_red">*</i> 표시된 항목은 필수 입력 사항입니다.</span>
						</dt>
						<dd id="dd_inpForm" class="dd_inpForm">
							<table>
								<caption>입점 상담신청에 대표상품군, 담당자명, 연락처, 휴대폰번호, 팩스번호, 담당자 이메일, 입점신청요약, 입점신청내용, 판매희망채널, 현대 유통방법, 홈페이지, 비고, 관련서류로 구성된 표</caption>
								<colgroup>
									<col style="width:140px" />
									<col style="width:339px" />
									<col style="width:140px" />
									<col style="width:339px" />
								</colgroup>
								<tbody>
									<tr>
										<th>상태</th>
										<td>
											<c:out value="${row.VDR_CST_GBN_NM}" />
										</td>									
										<th>대표상품군</th>
										<td class="td_represent">
											<c:out value="${row.PRD_CTG_UP_NM}" /> &gt; <c:out value="${row.PRD_CTG_NM}" />
										</td>
									</tr>
									<tr>
										<th>담당자명</th>
										<td class="td_personName">
											<c:out value="${row.VDR_CST_MNG_NM}" />
										</td>
										<th>전화</th>
										<td class="td_tel">
											<c:out value="${row.VDR_CST_TEL1}" />
											<span class="ico_tx">-</span>
											<c:out value="${row.VDR_CST_TEL2}" />
											<span class="ico_tx">-</span>
											<c:out value="${row.VDR_CST_TEL3}" />
										</td>
									</tr>
									<tr>
										<th>휴대폰번호</th>
										<td class="td_phone">
											<c:out value="${row.VDR_CST_HP1}" />
											<span class="ico_tx">-</span>
											<c:out value="${row.VDR_CST_HP2}" />
											<span class="ico_tx">-</span>
											<c:out value="${row.VDR_CST_HP3}" />
										</td>
										<th>팩스번호</th>
										<td class="td_fax">
											<c:if test="${!empty row.VDR_CST_FAX1 and !empty row.VDR_CST_FAX2 and !empty row.VDR_CST_FAX3} }">
												<c:out value="${row.VDR_CST_FAX1}" />
												<span class="ico_tx">-</span>
												<c:out value="${row.VDR_CST_FAX2}" />
												<span class="ico_tx">-</span>
												<c:out value="${row.VDR_CST_FAX3}" />
											</c:if>
										</td>
									</tr>
									<tr>
										<th>담당자 이메일</th>
										<td colspan="3" class="td_email"><c:out value="${row.VDR_CST_MAIL}"/></td>
									</tr>
									<tr>
										<th>입점신청요약</th>
										<td colspan="3" class="td_askTx">
											<div class="f inp_box">
												<c:out value="${row.VDR_CST_SUM}"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>입점신청내용</th>
										<td colspan="3">	
											<ui:replaceLineBreak content="${row.VDR_CST_CTS}"/>
										</td>
									</tr>								
									<tr>
										<th>판매희망채널</th>
										<td colspan="3">
											<c:out value="${row.VDR_CST_ON_OFF_NM}"/>
										</td>
									</tr>
									<tr>
										<th>현재 유통방법 </th>
										<td colspan="3">
											<c:out value="${resultDtbNm}"/>
										</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td colspan="3" class="td_homepg">
											http://<c:out value="${row.VDR_CST_URL}"/>
										</td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3" class="td_msg">
											<c:out value="${row.VDR_CST_ETC}"/>
										</td>
									</tr>
									<tr>
										<th>관련서류</th>
										<td colspan="3" id="td_file" class="td_file">
											상품제안서 :
											<c:if test="${not empty fileList }">
												<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
													<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'S'}">
														<i class="icon-file"></i>
		                           						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
		                                        			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
			                                    		</a>	
													</c:if>
												</c:forEach>
											</c:if>
											<br/>
											회사소개서 :
											<c:if test="${not empty fileList }">
												<c:forEach items="${fileList}" var="fileRow" varStatus="i">
													<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'I'}">	
														<i class="icon-file"></i>
			                          					<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
			                                       			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
			                                    		</a>	
		                                    		</c:if>
												</c:forEach>
											</c:if>
											<br/>
											제품인증서(해당상품만) :
											<c:if test="${not empty fileList }">
												<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
													<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'C'}">
														<i class="icon-file"></i>
		                           						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
		                                        			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
			                                    		</a>	
													</c:if>
												</c:forEach>
											</c:if>												
										</td>
									</tr>
									<tr>
										<th>등록일</th>
										<td colspan="3" class="td_homepg">
											<c:out value="${row.VDR_CST_REG_DT}"/>
										</td>
									</tr>									
								</tbody>
							</table>						
						</dd>
						<dd class="dd_btn">
							<c:if test="${row.VDR_CST_GBN_NM eq '접수중'}">
								<a href="javascript:goDel();" class="btn_red"><span>삭제</span></a>
								<a href="javascript:goModify();" class="btn_red"><span>수정</span></a>
							</c:if>
							<a href="javascript:goList();" class="btn_gre"><span>목록</span></a>
						</dd>
					</dl>
				</section>
				<!--// .sub_lay E -->
	
			</div> <!--// .contents E -->
		</article>
		</form>
		
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

  <!-- 파일 다운로드용 폼 -->
  <form name="fileForm" id="fileForm">
       <input type="hidden" name="CMM_FLE_IDX" value="" />
       <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
       <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
  </form>
<script>

	$(function(){
		
		var $frm = $("#frm");
 		
	    goModify = function () {
             $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointCounselEdit.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    goDel = function(){
	    	if(confirm( "정말로 삭제하시겠습니까?")) {
	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointCounselRemove.do", "target":"_self", "method":"post"}).submit();
            }	    	
	    };	    
	    
	    goList = function(){
	    	$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointCounselList.do", "target":"_self", "method":"post"}).submit();	 			
	    };
	    
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
</script>
</body>
</html>