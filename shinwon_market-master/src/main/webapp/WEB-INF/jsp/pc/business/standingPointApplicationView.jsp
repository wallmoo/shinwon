<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<form id="frm" name="frm" method="post">
		<input type="hidden" id="VDR_REQ_IDX" name="VDR_REQ_IDX" value="<c:out value="${row.VDR_REQ_IDX}" />"/>
        <double-submit:preventer/>		
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">입점 신청서</h2>
					</div>
					
					<dl class="minW counsel_ask">
						<dt>
							<strong>입점 신청서 확인</strong>
						</dt>
						<dd class="dd_inpForm">
							<table>
								<caption>입점 신청서 작성에 구분, 업체명, 대표자명, 사업자구분, 법인등록번호, 사업장주소, 세금계산서 담당 이메일, 업태/업종(종목), 전화, 팩스번호, 은행명, 계좌번호, 예금주 으로 구성된 표</caption>
								<colgroup>
									<col style="width:140px" />
									<col style="width:339px" />
									<col style="width:140px" />
									<col style="width:339px" />
								</colgroup>
								<tbody>
									<tr>
										<th>구분</th>
										<td colspan="3" class="td_">
											<i class="ico_contr"><strong>승인</strong></i>
										</td>
									</tr>
									<tr>
										<th>업체명 </th>
										<td class="td_comName"><c:out value="${row.VDR_REQ_NM}" /></td>
										<th>대표자명 </th>
										<td class="td_ceoName"><c:out value="${row.VDR_REQ_CEO_NM}" /></td>
									</tr>
									<tr>
										<th>사업자구분 </th>
										<td class="td_comType"><c:out value="${row.VDR_REQ_TYPE}" /></td>
										<th>법인등록번호</th>
										<td class="td_regNum">
											<c:out value="${row.VDR_REQ_JRD_NO1 }" />
											<span class="ico_tx">-</span>
											<c:out value="${row.VDR_REQ_JRD_NO2 }" />
										</td>
									</tr>
									<tr>
										<th>사업장주소 </th>
										<td colspan="3" class="td_comAdd">
											<div class="f inp_box">
												<c:out value="${row.VDR_REQ_POST5 }"/>
											</div>
											<div class="inp_box">
												<label for="VDR_REQ_DR_ADDR1">
													<c:out value="${row.VDR_REQ_DR_ADDR1 }"/>
												</label>
												<label for="VDR_REQ_DR_ADDR2">
													<c:out value="${row.VDR_REQ_DR_ADDR2 }"/>
												</label>
											</div>
											<div class="l inp_box">
												<label for="VDR_REQ_JB_ADDR1">
													<c:out value="${row.VDR_REQ_JB_ADDR1 }"/>
												</label>
												<label for="VDR_REQ_JB_ADDR2">
													<c:out value="${row.VDR_REQ_JB_ADDR2 }"/>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>세금계산서<br/>담당 이메일 </th>
										<td colspan="3" class="td_email">
											<div class="inp_box">
												<c:out value="${row.VDR_REQ_MAIL }"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>업태/업종(종목) </th>
										<td colspan="3" class="td_busines">
											<div class="inp_box">
												<c:out value="${row.VDR_REQ_BUSI_CDT}"/>
												<span class="ico_tx">/</span>
												<c:out value="${row.VDR_REQ_BUSI_TYPE}"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>전화 </th>
										<td class="td_tel">
											<div class="inp_box">
												<label for="VDR_REQ_TEL1" class="">
													<c:out value="${row.VDR_REQ_TEL1}"/>													
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_TEL2">
													<c:out value="${row.VDR_REQ_TEL2}"/>
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_TEL3">
													<c:out value="${row.VDR_REQ_TEL3}"/>
												</label>
											</div>
										</td>
										<th>팩스번호 </th>
										<td class="td_fax">
											<div class="inp_box">
												<label for="VDR_REQ_FAX1" class="">
													<c:out value="${row.VDR_REQ_FAX1}"/>
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_FAX2">
													<c:out value="${row.VDR_REQ_FAX2}"/>
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_FAX3">
													<c:out value="${row.VDR_REQ_FAX3}"/>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>은행명 </th>
										<td class="td_bank">
											<div class="inp_box">
												<c:out value="${row.VDR_REQ_BANK_CD_NM}"/>
											</div>
										</td>
										<th>계좌번호 </th>
										<td class="td_accNum">
											<div class="inp_box">
												<label for="VDR_REQ_ACT_NO">
													<c:out value="${row.VDR_REQ_ACT_NO}"/>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>예금주 </th>
										<td colspan="3" class="td_accHolder">
											<div class="inp_box">
												<label for="VDR_REQ_ACT_HDR">
													<c:out value="${row.VDR_REQ_ACT_HDR}"/>
												</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>						
						</dd>
						<!-- <dd class="dd_btn">
							<a href="javascript:goList();" class="btn_red"><span>확인</span></a>
						</dd> -->
					</dl>
				</section>
				<!--// .sub_lay E -->
	
			</div><!--// .contents E -->
		</article>		
		</form>
		
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

<script>

	$(function(){
	    
	    goList = function(){
 			location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
	    };
	    
	});
</script>
</body>
</html>