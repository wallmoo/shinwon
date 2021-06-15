<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<script src="<c:out value="${serverDomain}" />/am/js/admin/common.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal"><!-- modal -->

		<div class="modal-wrapper"><!-- modal-wrapper -->

			<div class="modal-inner"><!-- modal-inner -->

			<h2 class="title"><span>회원정보</span></h2>

				<%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>

				<%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
				<!-- // table -->
				<h3 class="title col-1-2 text-left"><span>기본정보 </span></h3>
				<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
					<div class="text-right">
					   <c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'N'   }">
						  <a href="#none" id="tmpPasswordSend" class="button small"><span>임시비밀번호 발송</span></a>
					   </c:if>						
					</div>
				</div>
				<form id="frm" name="frm">
					<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }" />" />
					<input type="hidden" name="MEM_MST_MEM_NM" value="<c:out value="${memberInfo.MEM_MST_MEM_NM }" />" />
					<input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
					<input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${memberInfo.MEM_MST_REG_DT }"/>"/>
					<input type="hidden" name="MEM_MST_TEL1" value="<c:out value="${memberInfo.MEM_MST_TEL1 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL2" value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL3" value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>"/>
					<input type="hidden" name="MEM_MST_HP1" value="<c:out value="${memberInfo.MEM_MST_HP1 }"/>"/>
					<input type="hidden" name="MEM_MST_HP2" value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>"/>
					<input type="hidden" name="MEM_MST_HP3" value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>"/>
					<input type="hidden" name="MEM_MST_ZIP_CDE5" value="<c:out value="${memberInfo.MEM_MST_ZIP_CDE5 }"/>"/>
					<input type="hidden" name="MEM_MST_JBN_ADR1" value="<c:out value="${memberInfo.MEM_MST_JBN_ADR1 }"/>"/>
					<input type="hidden" name="MEM_MST_DRO_ADR1" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR1 }"/>"/>
					<input type="hidden" name="MEM_MST_ADR2" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR2 }"/>"/>
					<input type="hidden" name="MEM_MST_MAIL" value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>"/>
					<input type="hidden" name="TRM_YN0007" id="TRM_YN0007" value="<c:out value="${memberInfo.S_ELEC_YN }"/>"/>
					<input type="hidden" name="TRM_YN0008" id="TRM_YN0008" value="<c:out value="${memberInfo.LG_YN }"/>"/>
					<input type="hidden" name="RST_YN" value="<c:out value="${memberInfo.RST_YN }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="searchTab" value="warning"/>
					
                    <input type="hidden" name="PRV_OOTD_TYPE"  id="PRV_OOTD_TYPE"  value=""/>					
					<input type="hidden" name="PRV_OOTD_IDX"   id="PRV_OOTD_IDX"   value=""/>
					<input type="hidden" name="PRV_OOTD_ST_DT" id="PRV_OOTD_ST_DT" value=""/>
					<input type="hidden" name="PRV_OOTD_ED_DT" id="PRV_OOTD_ED_DT" value=""/>					
					
                    <input type="hidden" name="PRV_REVIEW_TYPE"  id="PRV_REVIEW_TYPE"  value=""/>					
					<input type="hidden" name="PRV_REVIEW_IDX"   id="PRV_REVIEW_IDX"   value=""/>
					<input type="hidden" name="PRV_REVIEW_ST_DT" id="PRV_REVIEW_ST_DT" value=""/>
					<input type="hidden" name="PRV_REVIEW_ED_DT" id="PRV_REVIEW_ED_DT" value=""/>					
					
                    <input type="hidden" name="PRV_PRD_USE"  id="PRV_PRD_USE"  value=""/>	
					
					<input type="hidden" id="currentRowNum" value="1" />

					<table class="table-row table-a"><!-- table -->
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr>
								<c:choose>
									<c:when test="${not empty memberInfo.MEM_MST_MEM_GRD }">
										<th><span>회원분류/회원등급</span></th>
										<td colspan="3">
											<c:out value="${memberInfo.MEM_MST_MEM_GBN_NM }"/> / <c:out value="${memberInfo.MEM_MST_MEM_GRD }"/>
											<c:if test="${memberInfo.RST_YN eq 'Y' }">
												<span style="color:red;">(휴)</span>
											</c:if>
										</td>
									</c:when>
									<c:otherwise>
										<th><span>회원분류 <i class="require"><em>필수입력</em></i></span></th>
										<td colspan="3">
											<c:out value="${memberInfo.MEM_MST_MEM_GBN_NM }"/>
											<c:if test="${memberInfo.RST_YN eq 'Y' }">
												<span style="color:red;">(휴)</span>
											</c:if>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<th><span>아이디/이름/성별</span></th>
								<td>
									<c:out value="${memberInfo.MEM_MST_MEM_ID }"/> /
									<c:out value="${memberInfo.MEM_MST_MEM_NM }"/> /
									<c:choose>
										<c:when test="${not empty memberInfo.MEM_MST_SEX }">
											<c:out value="${memberInfo.MEM_MST_SEX eq 'M' ? '남자' : '여자' }"/>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<th><span>가입일</span></th>
								<td>
									<ui:formatDate value="${fn:trim(memberInfo.MEM_MST_REG_DT)}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<th><span>주소</span></th>
								<td colspan="3">
									<c:if test="${!empty deliveryInfo }">
										[<c:out value="${deliveryInfo.MEM_DLV_ZIP_CDE5}"/>]&nbsp;&nbsp;<c:out value="${deliveryInfo.MEM_DLV_DRO_ADR1 }"/>&nbsp;<c:out value="${deliveryInfo.MEM_DLV_DRO_ADR2 }"/>
									</c:if>
									<c:if test="${empty deliveryInfo }">
										기본 주소지 없음
									</c:if>
								</td>
							</tr>
							<tr>
								<th><span>이메일</span></th>
								<td><c:out value="${memberInfo.MEM_MST_MAIL }"/></td>
								<th><span>일반전화/휴대전화</span></th>
								<td>
									<c:choose>
										<c:when test="${not empty memberInfo.MEM_MST_TEL2 && not empty memberInfo.MEM_MST_TEL3 }">
											<c:out value="${memberInfo.MEM_MST_TEL1 }"/> -
											<c:out value="${memberInfo.MEM_MST_TEL2 }"/> -
											<c:out value="${memberInfo.MEM_MST_TEL3 }"/>
										</c:when>
										<c:otherwise>일반전화 없음</c:otherwise>
									</c:choose>
									<span> / </span>
									<c:if test="${not empty memberInfo.MEM_MST_HP2 && not empty memberInfo.MEM_MST_HP3 }">
										<c:out value="${memberInfo.MEM_MST_HP1 }"/> -
										<c:out value="${memberInfo.MEM_MST_HP2 }"/> -
										<c:out value="${memberInfo.MEM_MST_HP3 }"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<th><span>정보수신여부</span></th>
								<td colspan="3">
									<span>SMS수신 : </span>
									<select class="select" name="TRM_YN0001" id="SMS_YN">
										<option value="Y" <c:if test="${memberInfo.SMS_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
										<option value="N" <c:if test="${memberInfo.SMS_YN eq 'N' }">selected="selected"</c:if>>N</option>
									</select>
									<span>텔레마케팅 수신 : </span>
									<select class="select" name="TRM_YN0002" id="TM_YN">
										<option value="Y" <c:if test="${memberInfo.TM_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
										<option value="N" <c:if test="${memberInfo.TM_YN eq 'N' }">selected="selected"</c:if>>N</option>
									</select>
									<span>DM : </span>
									<select class="select" name="TRM_YN0003" id="DM_YN">
										<option value="Y" <c:if test="${memberInfo.DM_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
										<option value="N" <c:if test="${memberInfo.DM_YN eq 'N' }">selected="selected"</c:if>>N</option>
									</select>
								    <span>이메일 수신</span>
									<select class="select" name="TRM_YN0004" id="EMAIL_YN">
										<option value="Y" <c:if test="${memberInfo.EMAIL_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
										<option value="N" <c:if test="${memberInfo.EMAIL_YN eq 'N' }">selected="selected"</c:if>>N</option>
									</select>									
									<span>영리목적 광고</span>
									<select class="select" name="TRM_YN0005" id="AD_YN">
										<option value="Y" <c:if test="${memberInfo.AD_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
										<option value="N" <c:if test="${memberInfo.AD_YN eq 'N' }">selected="selected"</c:if>>N</option>
									</select>
									<span>카카오톡</span>
									<select class="select" name="TRM_YN0006" id="KAKO_YN">
										<option value="Y" <c:if test="${memberInfo.KAKAO_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
										<option value="N" <c:if test="${memberInfo.KAKAO_YN eq 'N' }">selected="selected"</c:if>>N</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>스타일정보</span></th>
								<td colspan="3"><c:out value="${memberInfo.MEM_MST_STY_HEIGHT }"/> CM / <c:out value="${memberInfo.MEM_MST_STY_WEIGHT }"/> kg / <c:out value="${memberInfo. MEM_MST_STY_JOB }"/></td>
							</tr>
							
							<c:if test="${ memberInfo.RST_YN  ne 'Y'   }">
								<tr>
									<th><span>최근접속일</span></th>
									<td><ui:formatDate value="${memberInfo.MEM_MST_LST_LGI_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
									<th><span>최종변경일/처리자</span></th>
									<td>
										<c:if test="${not empty memberInfo.MEM_MST_UPD_DT && not empty memberInfo.MEM_MST_UPD_ID }">
											<ui:formatDate value="${memberInfo.MEM_MST_UPD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/> / <c:out value="${memberInfo.MEM_MST_UPD_ID }"/>
											<c:if test="${memberInfo.MEM_MST_UPD_ID ne 'SYSTEM-BATCH' }">(<c:out value="${not empty memberInfo.MEM_MST_UPD_NM ? memberInfo.MEM_MST_UPD_NM : memberInfo.MEM_MST_MEM_NM }"/>)</c:if>
										</c:if>
									</td>
								</tr>							
							</c:if>
							<c:if test="${ memberInfo.RST_YN  eq 'Y'   }">
								<tr>
									<th><span>휴면처리일</span></th>
									<td><ui:formatDate value="${memberInfo.MEM_MST_RST_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
									<th><span>최종변경일/처리자</span></th>
									<td>
										<c:if test="${not empty memberInfo.MEM_MST_UPD_DT && not empty memberInfo.MEM_MST_UPD_ID }">
											<ui:formatDate value="${memberInfo.MEM_MST_UPD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/> / <c:out value="${memberInfo.MEM_MST_UPD_ID }"/>
											<c:if test="${memberInfo.MEM_MST_UPD_ID ne 'SYSTEM-BATCH' }">(<c:out value="${not empty memberInfo.MEM_MST_UPD_NM ? memberInfo.MEM_MST_UPD_NM : memberInfo.MEM_MST_MEM_NM }"/>)</c:if>
										</c:if>
									</td>
								</tr>							
							
							</c:if>							

							<tr>
								<th><span>태그선택 정보</span></th>
								<td colspan="3">
									<c:forEach var="tag" items="${tagList }" varStatus="i">
										<c:out value="${tag.TAG_MST_TITLE }"/>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->

				</form>

				<h3 class="title"><span>선택정보</span></h3>

				<table cellspacing="0" class="table-row table-a">
					<colgrou\p>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup>
					<tbody>
						<tr>
							<th><span>생년월일</span></th>
							<td colspan="3"><ui:formatDate value="${memberInfo.MEM_IPN_BIR }" pattern="yyyy.MM.dd"/></td>
						</tr>
					</tbody>
				</table>

                <c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'N'   }">

				<!-- 회원관리에서만 노출 / 탈퇴회원 비노출 -->
				<h3 class="title"><span>특정권한 정보</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col style="width:23px;">
						<col style="width:15%;">
						<col style="width:auto;">
						<col style="width:30%;">
					</colgroup>
					<tbody>
						<thead>
							<tr>
								<th><input type="checkbox" class="checkbox checkAll"></th>
								<th>특정권한 회원</th>
								<th>해당상품</th>
								<th>사용기간</th>
							</tr>
						</thead>
						<tbody id="BPrdList"> 
							<c:if test="${ empty previlegeList}">
								<tr>
									<td class="checkInp"><input type="checkbox" class="checkbox" name="chkActive" /></td>
									<td class="text-left txt_line1">
										리뷰어회원
										<a href="javascript:addRowInfo( );" class="button small primary">
											<span>+ 추가</span>
										</a>
									</td>
									<td class="al">
										<a href="javascript:searchReviewEventPopup('1');  " class="button small"><span>리뷰이벤트 선택</span></a>
										<a href="javascript:searchProductPopup('1');      " class="button small"><span>상품 검색</span></a>
										<input type='hidden'   name='B_TYPE'        id='B_TYPE_1'        value='NEW' />
                                        <input type='hidden'   name='B_EXP_MST_CD'  id='B_EXP_MST_CD_1'  value='' />										
										<input type='hidden'   name='B_PRD_MST_CD'  id='B_PRD_MST_CD_1'  value='' />
										<input type='hidden'   name='B_PRD_MST_NM'  id='B_PRD_MST_NM_1'  value='' />
										<input type='hidden'   name='B_SPC_PRV_IDX' id='B_SPC_PRV_IDX_1' value='' />
										<span id='span_info_1' style='display:none;' > ( <input type="checkbox" name="chkDelPrd" id="CHKDEL_1"  value='' ><label for="CHKDEL_1">삭제</label><span id='PRD_MST_INFO_1' style="display: inline-block;" ></span>)</span>
									</td>
									<td>
										<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text"  class="text date small"  id="PRD_MST_ICN_ST_DT_1" name="PRD_MST_ICN_ST_DT" value="${previlege.MEM_SPC_PRV_BG_DT}" readonly="readonly" data-target-end="#PRD_MST_ICN_ED_DT_1">
										  ~
										<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text"  class="text date small" id="PRD_MST_ICN_ED_DT_1" name="PRD_MST_ICN_ED_DT" value="${previlege.MEM_SPC_PRV_EXP_DT}" readonly="readonly" data-target-start="#PRD_MST_ICN_ST_DT_1">
									</td>
								</tr>
							</c:if>
							<c:forEach var="previlegeList" items="${previlegeList}" varStatus="i">
								<tr>
									<td class="checkInp"><input type="checkbox" class="checkbox"  name="chkActive" value='' /></td>
									<td class="text-left txt_line1">
										리뷰어회원
										<c:if test="${i.first}">
											<a href="javascript:addRowInfo( );" class="button small primary">
												<span>+ 추가</span>
											</a>
										</c:if>
									</td>
									<td class="al" >
										<a href="javascript:searchReviewEventPopup('A${i.count}');" class="button small"><span>리뷰이벤트 선택</span></a>
										<a href="javascript:searchProductPopup('A${i.count}');    " class="button small"><span>상품 검색</span></a>
										<input type='hidden'   name='B_TYPE'            id='B_TYPE_A${i.count}'          value='UPD' />
                                        <input type='hidden'   name='B_EXP_MST_CD'      id='B_EXP_MST_CD_A${i.count}'    value='${previlegeList.EVT_MST_IDX}'    />										
										<input type='hidden'   name='B_PRD_MST_CD'      id='B_PRD_MST_CD_A${i.count}'    value='${previlegeList.PRD_MST_CD}'    />
										<input type='hidden'   name='B_PRD_MST_NM'      id='B_PRD_MST_NM_A${i.count}'    value='${previlegeList.PRD_MST_NM}'    />
										<input type='hidden'   name='B_SPC_PRV_IDX'     id='B_SPC_PRV_IDX_A${i.count}'   value='${previlegeList.MEM_SPC_PRV_IDX}' />
										<c:if test="${null ne previlegeList.PRD_MST_CD}">
											(
											<input type="checkbox" name="chkDelPrd" id="${previlegeList.CHILD.PRD_MST_CD}">
											<label for="${previlegeList.CHILD.PRD_MST_CD}">삭제</label>
											<span id='PRD_MST_INFO_A${i.count}'  style="display: inline-block;" >${previlegeList.PRD_MST_CD} ${previlegeList.PRD_MST_NM}</span>
											)
										</c:if>
									</td>
									
									<td>
										<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text date small" id="PRD_MST_ICN_ST_DT_1" name="PRD_MST_ICN_ST_DT" value="<ui:formatDate value="${fn:trim(previlegeList.MEM_SPC_PRV_BG_DT)}" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-end="#PRD_MST_ICN_ED_DT1">
										  ~
										<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text date small" id="PRD_MST_ICN_ED_DT_1" name="PRD_MST_ICN_ED_DT" value="<ui:formatDate value="${fn:trim(previlegeList.MEM_SPC_PRV_EXP_DT)}" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-start="#PRD_MST_ICN_ST_DT_1">

									</td>
								</tr>
							</c:forEach>

							<tr>
								<td class="checkInp"><input type="checkbox" class="checkbox" id="chkReview"   value='${previlege.IDX_REVIE}'  /></td>
								<td class="text-left txt_line1">
									특정리뷰회원
								</td>
								<td class="al">
									전체
								</td>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text date small" id="PRD_MST_ICN_ST_DT_RV" name="PRD_MST_ICN_ST_DT_RV" value="<ui:formatDate value="${fn:trim(previlege.MEM_SPC_PRV_BG_DT_REVIE)}" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-end="#PRD_MST_ICN_ED_DT_RV">
									  ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text date small" id="PRD_MST_ICN_ED_DT_RV" name="#PRD_MST_ICN_ED_DT_RV" value="<ui:formatDate value="${fn:trim(previlege.MEM_SPC_PRV_EXP_DT_REVIE)}" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-start="#PRD_MST_ICN_ST_DT_RV">
								</td>
							</tr>
							
							

							<tr>
								<td class="checkInp"><input type="checkbox" class="checkbox" id="chkOOTD"  value='${previlege.IDX_OOTD}' /></td> <!--  OOTD idex값 넣기 -->
								<td class="text-left txt_line1">
									특정OOTD회원
								</td>
								<td class="al">
									전체
								</td>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text date small" id="PRD_MST_ICN_ST_DT_OOTD" name="PRD_MST_ICN_ST_DT_OOTD" value="<ui:formatDate value="${fn:trim(previlege.MEM_SPC_PRV_BG_DT_OOTD)}" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-end="#PRD_MST_ICN_ED_DT_OOTD">
									  ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text date small" id="PRD_MST_ICN_ED_DT_OOTD" name="PRD_MST_ICN_ED_DT_OOTD" value="<ui:formatDate value="${fn:trim(previlege.MEM_SPC_PRV_EXP_DT_OOTD)}" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-start="#PRD_MST_ICN_ST_DT_OOTD">
								</td>
							</tr>
					</tbody>
				</table>
				<!-- //회원관리에서만 노출 / 탈퇴회원 비노출 -->
                </c:if>
                
				<h3 class="title"><span>탈퇴정보</span></h3>

				<table cellspacing="0" class="table-row table-a">
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup>
					<tbody>
						<tr>
							<th><span>회원탈퇴사유</span></th>
							<td>
							    <c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'N'   }">
							      -
							    </c:if>
							    <c:if test="${ memberInfo.MEM_MST_LEV_YN  ne 'N'   }">
							      <c:out value="${memberInfo.MEM_MST_LEV_RSN_CD_NM }"/>
							    </c:if>							    
							</td>
							<th><span>탈퇴일</span></th>
							<td>
							    <c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'N'   }">
							      -
							    </c:if>
							    <c:if test="${ memberInfo.MEM_MST_LEV_YN  ne 'N'   }">
							      <ui:formatDate value="${fn:trim(memberInfo.MEM_MST_LEV_DT)}" pattern="yyyy-MM-dd HH:mm"/>
							    </c:if>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<button type="button" id="goSave" class="button small primary"><span>저장</span></button>
					</div>
				</div>
					


                <!-- 
				<c:if test="${memberInfo.MEM_MST_LEV_YN eq 'N' }">
					<div class="section-button">
						<div class="wrap text-center">
							<a href="#none;" id="goRegist" class="button"><span>저장</span></a>
						</div>
					</div>
				</c:if>
				 -->

			</div><!-- //modal-inner -->

		</div><!-- //modal-wrapper -->

	</div><!-- //modal -->
	

<!--   <script src="<c:out value="${serverDomain}" />/am/js/admin.js"></script> -->
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>

<script>
var popup1 ;
$(function(){

	// 등록 이벤트
	$(document).on("click", "#goSave", function (){
		
        <c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'N'   }">

		// OOTD 체크 
		if ( $('#chkOOTD' ).is(":checked") ) {
			// 등록 수정처리 
			
			//시작일자 체크 
			if( $('#PRD_MST_ICN_ST_DT_OOTD').val() == '' || $('#PRD_MST_ICN_ST_DT_OOTD').val() == undefined ) {
				alert(" 특정OOTD회원 시작일을 입력하세요!");
				return false;
			}
			
			if( $('#PRD_MST_ICN_ED_DT_OOTD').val() == '' || $('#PRD_MST_ICN_ED_DT_OOTD').val() == undefined ) {
				alert(" 특정OOTD회원 종료일을 입력하세요!");
				return false;
			}
			
			var typeOOTD = $('#chkOOTD' ).val() == '' ? 'NEW' : 'UPD' ;
			
			$('#PRV_OOTD_TYPE' ).val( typeOOTD );  
			$('#PRV_OOTD_IDX'  ).val( $('#chkOOTD' ).val()               ) ;
			$('#PRV_OOTD_ST_DT').val( $('#PRD_MST_ICN_ST_DT_OOTD').val() ) ;
			$('#PRV_OOTD_ED_DT').val( $('#PRD_MST_ICN_ED_DT_OOTD').val() ) ;
			
		}else{
			// 삭제 처리 
			
			var typeOOTD = $('#chkOOTD' ).val() == '' ? '' : 'DEL' ;
			$('#PRV_OOTD_TYPE' ).val( typeOOTD );  
			$('#PRV_OOTD_IDX'  ).val( $('#chkOOTD' ).val()               ) ;
			$('#PRV_OOTD_ST_DT').val( $('#PRD_MST_ICN_ST_DT_OOTD').val() ) ;
			$('#PRV_OOTD_ED_DT').val( $('#PRD_MST_ICN_ED_DT_OOTD').val() ) ;			
			
		}
		
		// 특정리뷰  체크 		
		if ( $('#chkReview' ).is(":checked") ) {
			// 등록 수정처리 
			
			//시작일자 체크 
			if( $('#PRD_MST_ICN_ST_DT_RV').val() == '' || $('#PRD_MST_ICN_ST_DT_RV').val() == undefined ) {
				alert(" 특정리뷰회원  시작일을 입력하세요!");
				return false;
			}
			
			if( $('#PRD_MST_ICN_ED_DT_RV').val() == '' || $('#PRD_MST_ICN_ED_DT_RV').val() == undefined ) {
				alert(" 특정리뷰회원 종료일을 입력하세요!");
				return false;
			}
			
			var typeRevie = $('#chkReview' ).val() == '' ? 'NEW' : 'UPD' ;

			$('#PRV_REVIEW_TYPE' ).val( typeRevie );  
			$('#PRV_REVIEW_IDX'  ).val( $('#chkReview' ).val()           ) ;
			$('#PRV_REVIEW_ST_DT').val( $('#PRD_MST_ICN_ST_DT_RV').val() ) ;
			$('#PRV_REVIEW_ED_DT').val( $('#PRD_MST_ICN_ED_DT_RV').val() ) ;
			
		}else{
			// 삭제 처리
			
			var typeRevie = $('#chkOOTD' ).val() == '' ? '' : 'DEL' ;
			$('#PRV_REVIEW_TYPE' ).val( typeRevie );  
			$('#PRV_REVIEW_IDX'  ).val( $('#chkReview' ).val()           ) ;
			$('#PRV_REVIEW_ST_DT').val( $('#PRD_MST_ICN_ST_DT_RV').val() ) ;
			$('#PRV_REVIEW_ED_DT').val( $('#PRD_MST_ICN_ED_DT_RV').val() ) ;			
			
		}
		

		
		list = getAllAvailableReviewInfo( true );
		var WorkCount = getAllAvailableReviewInfoCount ( true );

		// 특정권한에 등록할 내용이 있고, 유효성에서 false난경우에 저장하지 않음 
		if ( WorkCount > 0 && list == false ) { return;}
		
		if (confirm("저장 하시겠습니까?")) {

			setAllAvailableReview( list );
			
			$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberPopupRegist.do", "target":"_self", "method":"post"}).submit();
		}
        </c:if>
        
        <c:if test="${ memberInfo.MEM_MST_LEV_YN  eq 'Y'   }">
		if (confirm("저장 하시겠습니까?")) {
			$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberPopupRegist.do", "target":"_self", "method":"post"}).submit();
		}        
        </c:if>        
        
        
	});
	
	
	setAllAvailableReview = function( dataList ){
		 
		  //var form = document.createElement("frm2");
		  var $form = $('#frm');
		  
		  for(var i=0;i<dataList.length;i++){
		      
		      $form.append('<input type="hidden" name="PRV_PRD_TYPE"  value="'+ dataList[i].TYPE               +'" />' );
		      $form.append('<input type="hidden" name="PRV_PRE_IDX"   value="'+ dataList[i].SPC_PRV_IDX        +'" />' );
		      $form.append('<input type="hidden" name="PRV_EXP_IDX"   value="'+ dataList[i].EXP_MST_CD         +'" />' );
		      $form.append('<input type="hidden" name="PRV_PRD_IDX"   value="'+ dataList[i].PRD_MST_CD         +'" />' );
		      $form.append('<input type="hidden" name="PRV_PRD_ST_DT" value="'+ dataList[i].MEM_SPC_PRV_BG_DT  +'" />' );
		      $form.append('<input type="hidden" name="PRV_PRD_ED_DT" value="'+ dataList[i].MEM_SPC_PRV_EXP_DT +'" />' );
		      $('#PRV_PRD_USE').val("Y");
		  }
		  
		  
		  if( dataList.length == 1 ) {
		      $form.append('<input type="hidden" name="PRV_PRD_TYPE"  value="dummy" />' );
		      $form.append('<input type="hidden" name="PRV_PRE_IDX"   value="dummy" />' );
		      $form.append('<input type="hidden" name="PRV_EXP_IDX"   value="dummy" />' );
		      $form.append('<input type="hidden" name="PRV_PRD_IDX"   value="dummy" />' );
		      $form.append('<input type="hidden" name="PRV_PRD_ST_DT" value="dummy" />' );
		      $form.append('<input type="hidden" name="PRV_PRD_ED_DT" value="dummy" />' );
		  }


	}
	
	
	function getAllAvailableReviewInfoCount(activeFlag){

		var vCount = 0 ;
		var pointList = $('#BPrdList').find('tr');
		
		for(var i=0;i<pointList.length;i++){
			var isActive = $(pointList[i]).find('input[name=chkActive]').is(":checked") ;
			var B_TYPE = $(pointList[i]).find('input[name=B_TYPE]').val();		
			var B_DeleteChk    = $(pointList[i]).find('input[name=chkDelPrd]').is(":checked") ? "Y" : "N";	
			var B_TYPE = $(pointList[i]).find('input[name=B_TYPE]').val();		
			var B_EXP_MST_CD = $(pointList[i]).find('input[name=B_EXP_MST_CD]').val();
			var B_PRD_MST_CD = $(pointList[i]).find('input[name=B_PRD_MST_CD]').val();
			var B_PRD_MST_NM = $(pointList[i]).find('input[name=B_PRD_MST_NM]').val();
			var B_SPC_PRV_IDX = $(pointList[i]).find('input[name=B_SPC_PRV_IDX]').val();			
			var B_DeleteChk    = $(pointList[i]).find('input[name=chkDelPrd]').is(":checked") ? "Y" : "N";
			var B_MEM_SPC_PRV_BG_DT  = $(pointList[i]).find('input[name=PRD_MST_ICN_ST_DT]').val();
			var B_MEM_SPC_PRV_EXP_DT = $(pointList[i]).find('input[name=PRD_MST_ICN_ED_DT]').val();
			var code = $(pointList[i]).find('input[type=checkbox]').val();
			if ( B_DeleteChk =='Y' ) {  B_TYPE = "DEL"; }
			if( B_TYPE =='NEW'  &&  B_PRD_MST_CD == '' ){continue;}
			if ( B_DeleteChk =='Y' ) {  B_TYPE = "DEL"; }			
			if( !isActive &&  B_TYPE =='UPD'    ){continue;}
			if($(pointList[i]).find('input[name=B_PRD_MST_CD]').val() == undefined ){continue;}		
			
			vCount = vCount + 1;

		}
		
		return vCount;
	}		
	
	
	function getAllAvailableReviewInfo(activeFlag){
		var list = [];
		var pointList = $('#BPrdList').find('tr');
		
		for(var i=0;i<pointList.length;i++){
			var isActive = $(pointList[i]).find('input[name=chkActive]').is(":checked") ;
			var B_TYPE = $(pointList[i]).find('input[name=B_TYPE]').val();		
			var B_DeleteChk    = $(pointList[i]).find('input[name=chkDelPrd]').is(":checked") ? "Y" : "N";	
			var B_TYPE = $(pointList[i]).find('input[name=B_TYPE]').val();		
			var B_EXP_MST_CD = $(pointList[i]).find('input[name=B_EXP_MST_CD]').val();
			var B_PRD_MST_CD = $(pointList[i]).find('input[name=B_PRD_MST_CD]').val();
			var B_PRD_MST_NM = $(pointList[i]).find('input[name=B_PRD_MST_NM]').val();
			var B_SPC_PRV_IDX = $(pointList[i]).find('input[name=B_SPC_PRV_IDX]').val();			
			var B_DeleteChk    = $(pointList[i]).find('input[name=chkDelPrd]').is(":checked") ? "Y" : "N";
			var B_MEM_SPC_PRV_BG_DT  = $(pointList[i]).find('input[name=PRD_MST_ICN_ST_DT]').val();
			var B_MEM_SPC_PRV_EXP_DT = $(pointList[i]).find('input[name=PRD_MST_ICN_ED_DT]').val();
			var code = $(pointList[i]).find('input[type=checkbox]').val();
			if ( B_DeleteChk =='Y' ) {  B_TYPE = "DEL"; }
			
			if( B_TYPE =='NEW'  &&  B_PRD_MST_CD == '' ){continue;}
			if ( B_DeleteChk =='Y' ) {  B_TYPE = "DEL"; }			
			if( !isActive &&  B_TYPE =='UPD'    ){continue;}
			if($(pointList[i]).find('input[name=B_PRD_MST_CD]').val() == undefined ){continue;}		
			
			if( B_MEM_SPC_PRV_BG_DT =='' || B_MEM_SPC_PRV_BG_DT == undefined ) { 
				alert(  '['+B_PRD_MST_NM + ']의 사용기간 시작일을 입력하세요!');  
				return false;
			}
			
			if( B_MEM_SPC_PRV_EXP_DT =='' || B_MEM_SPC_PRV_EXP_DT == undefined ) {
				alert(  '['+B_PRD_MST_NM + ']의 사용기간 종료일을 입력하세요!');
				return false;
			}			
			
			var obj = {
					TYPE: B_TYPE,
					CMN_CODE : 3626 , 
					SPC_PRV_IDX:B_SPC_PRV_IDX,
					EXP_MST_CD:B_EXP_MST_CD,
					PRD_MST_CD:B_PRD_MST_CD,
					PRD_MST_NM:B_PRD_MST_NM,
					DELETE_ROW:B_DeleteChk,
					MEM_SPC_PRV_BG_DT:B_MEM_SPC_PRV_BG_DT,
					MEM_SPC_PRV_EXP_DT:B_MEM_SPC_PRV_EXP_DT,
					chkBoxIs:$(pointList[i]).find('input[name=chkActive]').is(":checked") ,
					
			};
			
			list.push(obj);
		}
		
		return list;
	}	
	
	addRowInfo = function ( ){
		
		var vNum = $("#currentRowNum").val() *1  +1 ;
		$("#currentRowNum").val( vNum );

		addHtml = '';
		addHtml = addHtml + '	<tr>                                                                                                                                                                                                    ';
		addHtml = addHtml + '		<td class="checkInp"><input type="checkbox" class="checkbox" name="chkActive" /></td>                                                                                                                                ';
		addHtml = addHtml + '		<td class="text-left txt_line1">                                                                                                                                                                    ';
		addHtml = addHtml + '			리뷰어회원                                                                                                                                                                                          ';
		addHtml = addHtml + '			<a href="javascript:addRowInfo( );" class="button small primary">                                                                                                                                ';
		addHtml = addHtml + '				<span>+ 추가</span>                                                                                                                                                                           ';
		addHtml = addHtml + '			</a>                                                                                                                                                                                            ';
		addHtml = addHtml + '		</td>                                                                                                                                                                                               ';
		addHtml = addHtml + '		<td class="al">                                                                                                                                                                                     ';
		addHtml = addHtml + '			<a href="javascript:searchReviewEventPopup('+ vNum +');  " class="button small"><span>리뷰이벤트 선택</span></a>                                                                                            ';
		addHtml = addHtml + '			<a href="javascript:searchProductPopup('+ vNum +');      " class="button small"><span>상품 검색</span></a>                                                                                                ';
		addHtml = addHtml + '           <input type="hidden" name="B_TYPE"       id="B_TYPE_'+ vNum +'"       value="NEW" >										                                                                                    ';		
        addHtml = addHtml + '           <input type="hidden" name="B_EXP_MST_CD" id="B_EXP_MST_CD_'+ vNum +'" value="" >										                                                                                    ';
		addHtml = addHtml + '			<input type="hidden" name="B_PRD_MST_CD" id="B_PRD_MST_CD_'+ vNum +'" value="" >                                                                                                                           ';
		addHtml = addHtml + '			<input type="hidden" name="B_PRD_MST_NM" id="B_PRD_MST_NM_'+ vNum +'"" value="" >                                                                                                                           ';
		addHtml = addHtml + '			<input type="hidden" name="B_SPC_PRV_IDX" id="B_SPC_PRV_IDX_'+ vNum +'"" value="" >                                                                                                                           ';		
		addHtml = addHtml + '			<span id="span_info_'+ vNum +'" style="display:none;" > ( <input type="checkbox" name="chkDelPrd" id="CHKDEL_1"  value="" ><label for="CHKDEL_'+ vNum +'">삭제</label><span id="PRD_MST_INFO_'+ vNum +'"  style="display: inline-block;" ></span>)</span>';
		addHtml = addHtml + '		                                                                                                                                                                                                    ';
		addHtml = addHtml + '		</td>                                                                                                                                                                                               ';
		addHtml = addHtml + '		<td>                                                                                                                                                                                                ';
		addHtml = addHtml + '			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>                                                                                              ';
		addHtml = addHtml + '			<input type="text"  class="text date small"  id="PRD_MST_ICN_ST_DT_'+ vNum +'" name="PRD_MST_ICN_ST_DT" value="" readonly="readonly" data-target-end="#PRD_MST_ICN_ED_DT_'+ vNum +'">  ';
		addHtml = addHtml + '			  ~                                                                                                                                                                                             ';
		addHtml = addHtml + '			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>                                                                                              ';
		addHtml = addHtml + '			<input type="text"  class="text date small" id="PRD_MST_ICN_ED_DT_'+ vNum +'" name="PRD_MST_ICN_ED_DT" value="" readonly="readonly" data-target-start="#PRD_MST_ICN_ST_DT_'+ vNum +'">         ';
		addHtml = addHtml + '		</td>                                                                                                                                                                                               ';
		addHtml = addHtml + '	</tr>                                                                                                                                                                                                   ';     
		
		$('#BPrdList' ).prepend ( addHtml ) ;
		
	};

	
	// 상품검색 팝업창 호출
	searchProductPopup = function(item) {
		curId = item;
		Popup.center("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do?caller="+curId,"searchProduct" , "1200", "800", "yes" );

	};
	
	fnResultProduct = function(params, caller) {
		
		//console.log('caller' + caller );
		
		if(params.length != 1){
			alert('상품을 1개로 선택하여 주십시오.');
			return;
		}	
		
		//PREVIOUS DATA
		var allData = [];
		var prevData = $("#BPrdList tr");
		


		for(var i = 0; i < prevData.length; i++) {
			var $curElem = $(prevData[i]);  
			var obj = new Object();
			obj.PRD_MST_CD = $('input[name=B_PRD_MST_CD]', $curElem).val();
			obj.PRD_MST_NM = $('input[name=B_PRD_MST_NM]', $curElem).val();
			allData.push(obj); //만들어진  object를 배열에 추가
		}

		
		for(var i = 0 ; i < params.length; i++) {
			var curData = params[i];
			
			for(var k = 0 ; k < allData.length ; k++) {
				if(allData[k].PRD_MST_CD == curData.PRD_MST_CD) {
					//alert("[" + curData.PRD_MST_CD + "] 이미 선택된 상품입니다.");
					
					SearchProductPop.alertMsg("[" + curData.PRD_MST_CD + "] 이미 선택된 상품입니다.")
					return false;	
				}
			}
			
			allData.push(curData);
			$('#B_EXP_MST_CD_'+caller).val('' );
			$('#B_PRD_MST_CD_'+caller).val( curData.PRD_MST_CD );
			$('#B_PRD_MST_NM_'+caller).val( curData.PRD_MST_NM );
			$('#PRD_MST_INFO_'+caller).text(  curData.PRD_MST_CD  + ' ' + curData.PRD_MST_NM );
			$('#span_info_'+caller).show();
			$('#CHKDEL_'+caller).val( curData.PRD_MST_CD );
			
			
		}
	
		return true;
	}
	
	
	// 상품검색 팝업창 호출
	searchReviewEventPopup = function(item) {
		curId = item;
		Popup.center("<c:out value="${serverDomain}" />/am/member/reviewEventSelectPopup.do?caller="+curId,"searchEvent" , "900", "400", "yes" );

	};	
	
	
	fnResultReviewEvent = function(params, caller) {
		
		//PREVIOUS DATA
		var allDataExp = [];
		var prevDataExp = $("#BPrdList tr");

		for(var i = 0; i < prevDataExp.length; i++) {
			var $curElem = $(prevDataExp[i]);  
			var obj = new Object();
			obj.EXP_MST_CD = $('input[name="B_EXP_MST_CD"]', $curElem).val();
			allDataExp.push(obj); //만들어진  object를 배열에 추가

		}
		
		//for(var i = 0 ; i < params.length; i++) {
			var curDataExp = params;
			
			for(var k = 0 ; k < allDataExp.length ; k++) {

				
				if(allDataExp[k].EXP_MST_CD == curDataExp.EXP_MST_CD) {
					//alert("[" + curDataExp.EXP_MST_CD + "] 이미 선택된 이벤트입니다.");
					// 팝업창에서 경고발생!					
					popupEvt.alertMsg("[" + curDataExp.EXP_MST_CD + "] 이미 선택된 이벤트입니다.");
					return false;	
				}
			}
			
			allDataExp.push(curDataExp);
			
						
			$('#B_EXP_MST_CD_'+caller).val( curDataExp.EXP_MST_CD );			
			$('#B_PRD_MST_CD_'+caller).val( curDataExp.PRD_MST_CD );
			$('#B_PRD_MST_NM_'+caller).val( curDataExp.PRD_MST_NM );
			$('#PRD_MST_INFO_'+caller).text(  curDataExp.PRD_MST_CD  + ' ' + curDataExp.PRD_MST_NM );
			$('#span_info_'+caller).show();
			$('#CHKDEL_'+caller).val( curDataExp.PRD_MST_CD );
			
			
		//}
	
		return true;
	}	
	
	
});


$(document).ready(function () {
	

	

	var vPrv_OOTD = '${previlege.IDX_OOTD}';
	if ( vPrv_OOTD != '' ){
		$('#chkOOTD').attr( 'checked', 'checked');    
	}
	
    
	var vPrv_Review = '${previlege.IDX_REVIE}';
	if ( vPrv_Review != '' ){
		$('#chkReview').attr( 'checked', 'checked');    
	}
    
	    
});


</script>
</body>
</html>
