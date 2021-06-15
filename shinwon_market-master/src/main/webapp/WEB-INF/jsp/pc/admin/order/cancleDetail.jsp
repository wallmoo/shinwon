<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style>
    .table-row.table-a th, .table-row.table-a td{text-align:center;}
</style>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">

            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>취소상세</span></h3>
            </div><!-- // push-guide -->

            <form id="frm" name="frm">
			    <input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD}"/>"/>
			    <input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="<c:out value="${commandMap.STATE}"/>"/>
			    <input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value=""/>
		        <input type="hidden" name="ORD_PRD_IDX" value="${commandMap.ORD_PRD_IDXs }"/>
		        <input type="hidden" name="ORD_PG_TYPE" value="LG"/>

	        	<h4 class="title"><span><c:out value="${title2}"/></span></h4>

		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <c:if test="${commandMap.STATE eq Code.OST_BACK }">
							<col style="width: 4%;" />
						</c:if>
						<col style="width: 8%;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 7%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
		            </colgroup>
		            <thead>
					<tr>
						<th>상품유형</th>
                        <th>이미지</th>
						<th>상품/옵션정보</th>
						<th>상품가격</th>
						<th>수량</th>
						<th>배송비</th>
						<th>배송구분</th>
						<th>브랜드</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderProductList}" var="data" varStatus="i">
						<tr>
							<td>
								<c:out value="${data.PRD_MST_TYPE eq 'G' ? '일반' : '패키지'}" />
							</td>
                            <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
		                    <td class="subject" style="text-align:left;">
		                        <p>
		                        	<c:choose>
										<c:when test="${data.ORD_PRD_OPT_DTL_IDX gt 0}">
											<c:if test="${not empty data.OPT_DTL_ERP_CD}">
												<span class="block name"><c:out value="${data.OPT_DTL_ERP_CD}"/></span>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${not empty data.PRD_MST_ERP_CD}">
												<span class="block name"><c:out value="${data.PRD_MST_ERP_CD}"/></span>
											</c:if>
										</c:otherwise>
									</c:choose>

	                                <span class="block name"><c:out value="${data.ORD_PRD_MST_CD }" /></span>
	                                <span class="block desc"><c:out value="${data.PRD_MST_NM }" /></span>
	                                <c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0}" >
										<span class="block size"><c:out value="${data.OPT_DTL_NM }" /></span>
									</c:if>
		                        </p>
		                    </td>
							<td><fmt:formatNumber value="${data.ORD_PRD_PRD_PRC}" type="number"/></td>
							<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>

							<c:choose>
								<c:when test="${data.ORD_PRD_DLV_BND_YN eq 'Y' and data.VDR_ROWNUM eq 1}">
		                          	<td rowspan="${data.VDR_IDX_CNT}">
		                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_BND_CAG + data.ORD_PRD_DLV_ADD_CAG}" type="number"/>
		                     	  	</td>
		                        </c:when>
		                        <c:when test="${data.ORD_PRD_DLV_BND_YN ne 'Y'}">
		                          	<td>
		                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_CAG + data.ORD_PRD_DLV_ADD_CAG}" type="number"/>
		                     	  	</td>
		                        </c:when>
	                        </c:choose>
							<td>
								일반택배
							</td>
							<td>
						    	<c:out value="${data.ORD_PRD_ORD_STATE_NM}"/>
							</td>
						</tr>
					</c:forEach>
					</tbody>
		        </table><!-- // table -->

		    	<h4 class="title"><span>결제정보</span></h4>

		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
                        <col style="width: auto;" />
		            </colgroup>
		            <thead>
						<tr>
							<th>주문금액</th>
							<th>할인쿠폰</th>
							<th>프로모션할인</th>
							<th>통합포인트</th>
							<th>E포인트</th>
							<th>배송비</th>
							<th>결제금액</th>
							<th>결제수단</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<fmt:formatNumber value="${orderPayInfo.ORD_MST_ORD_PRC}" type="number"/>
							</td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_CPN}" type="number"/></td>
							<td>1,000</td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/></td>
							<td>100,000</td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG}" type="number"/></td>
							<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></td>
							<td>
						    	<c:out value="${orderPayInfo.ORD_MST_PAY_TYPE_NM}"/>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

	    		<h4 class="title"><span>취소사유</span></h4>

		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>사유</span></th>
							<td style="text-align : left;">
			                        <c:if test="${not empty codes.ORDER_CANCEL_RETURN_REASON }">
			                            <c:forEach var="row" items="${codes.ORDER_CANCEL_RETURN_REASON }">
			                            	<c:if test="${orderProductList[0].ORDER_REASON_IDX eq row.CMN_COM_IDX}">
			                            		<c:out value="${row.CMN_COM_NM }"/>
			                            	</c:if>
			                            </c:forEach>
			                        </c:if>
							</td>
						</tr>
						<tr>
							<th><span>상세사유</span></th>
							<td style="text-align : left;">
								<c:out value="${orderProductList[0].ORDER_REASON_DESC }"/>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

				<h4 class="title"><span>환불정보</span></h4>

				<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
						<col style="width: 20%;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>결제수단</th>
							<th>환불 받을 금액</th>
							<th>환불방법</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:choose>
								<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD || orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD }">
									<td>신용카드</td>
									<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td>
									<td>신용카드 승인취소(<c:out value="${orderPayInfo.PAY_MST_KICC_ACQUIRER_NM }"/>)</td>
								</c:when>
								<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }">
									<td>카카오페이</td>
									<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td>
									<td>신용카드 승인취소(<c:out value="${orderPayInfo.PAY_MST_KAKAO_CARDNAME }"/>)</td>
								</c:when>
								<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT }">
									<td>계좌이체<br/>(PG입금 계좌)</td>
									<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td>
									<td>계좌이체 승인취소(<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }"/>)</td>
								</c:when>
								<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW }">
									<td>PG입금불가능한 계좌<br/>OR<br/>가상계좌(무통장)</td>
									<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/>원</td>
									<td style="text-align: left;">
										<%-- 환불계좌 수정은 주문취소시에는 결제완료/배송준비중 상태에서만 뜨고, 반품접수, 반품완료인 경우에는 항상 뜬다. --%>
										<table class="core">
											<colgroup>
												<col style="width: 20%;" />
												<col style="width: auto;" />
											</colgroup>
											<thead>
												<tr>
													<th>환불방식</th>
													<td style="text-align: left;">
														<span style="margin-left: 10px;">무통장입금</span>
													</td>
												</tr>
												<tr>
													<th>환불은행</th>
													<td style="text-align: left;">
														<span style="margin-left: 10px;">
															<select class="select" name="ORD_MST_RFD_CD" id="ORD_MST_RFD_CD">
			                                                	<option value="">선택</option>
																<c:forEach var="item" items="${depositBankList }">
																	<option value="${item.CMN_COM_ETC1 }" <c:if test="${item.CMN_COM_ETC1 eq orderPayInfo.ORD_MST_RFD_CD }">selected="selected"</c:if>>${item.CMN_COM_NM }</option>
																</c:forEach>
			                                                </select>
														</span>
													</td>
												</tr>
												<tr>
													<th>계좌번호</th>
													<td style="text-align: left;">
														<span style="margin-left: 10px;">
															<input type="text" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" value="<c:out value="${orderPayInfo.ORD_MST_RFD_ACT }"/>"/>
														</span>
													</td>
												</tr>
												<tr>
													<th>예금주명</th>
													<td style="text-align: left;">
														<span style="margin-left: 10px;">
															<input type="text" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" value="<c:out value="${orderPayInfo.ORD_MST_RFD_HDR }"/>"/>
														</span>
													</td>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<span style="color: red;">*관리팀에서 현금 환불 후 [환불관리]에서 환불상태를 변경해주셔야 합니다.</span>
									</td>
								</c:when>
								<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE }">
									<td>포인트</td>
									<td><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/>원</td>
									<td>포인트 환원</td>
								</c:when>
							</c:choose>
						</tr>
					</tbody>
		        </table><!-- // table -->

                <h4 class="title"><span>메모</span></h4>

		    	<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 15%;" />
						<col style="width: auto;" />
		            </colgroup>
					<tbody>
						<tr>
							<th><span>메모 이력</span></th>
							<td>
                                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                		            <colgroup>
                		                <col style="width: 15%;" />
                						<col style="width: auto;" />
                		            </colgroup>
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>메모 내용 / 첨부파일</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                					<tbody>
                						<tr>
                							<td>3</td>
                                            <td>
                                                <p class="clearboth">
                                                    <span class="fl_left">포인트 환불 안내 하였음</span>
                                                    <a href="#none" id="" class="button button-a small fl_right"><span>삭제</span></a>
                                                </p>
                                            </td>
                                            <td>admin (홍길동)</td>
                                            <td>2019-01-02 09:23:12</td>
                						</tr>
                                        <tr>
                							<td>2</td>
                                            <td>
                                                <div class="clearboth">
                                                    <p class="fl_left text-left">결제 취소가 되지 않는다고 재문의<br/><a href="#">WF7A1018.jpg</a></p>
                                                    <a href="#none" id="" class="button button-a small fl_right"><span>삭제</span></a>
                                                </div>
                                            </td>
                                            <td>admin (홍길동)</td>
                                            <td>2019-01-02 09:23:12</td>
                						</tr>
                                        <tr>
                							<td>2</td>
                                            <td>
                                                <div class="clearboth">
                                                    <p class="fl_left text-left">회원이 취소 신청하였음</p>
                                                    <a href="#none" id="" class="button button-a small fl_right"><span>삭제</span></a>
                                                </div>
                                            </td>
                                            <td>admin (홍길동)</td>
                                            <td>2019-01-02 09:23:12</td>
                						</tr>
                					</tbody>
                		        </table><!-- // table -->
							</td>
						</tr>
						<tr>
							<th><span>메모 내용</span></th>
							<td>
								<textarea rows="8" cols="80"></textarea>
							</td>
						</tr>
                        <tr>
							<th><span>첨부파일</span></th>
							<td class="text-left">
                                <input type="text" class="large" disabled>
								<input type="file" id="fileUpload" class="file_inp" value="파일첨부">
								<label for="fileUpload" class="button small btn_file_upload primary">파일첨부</label>
                                <a href="javascript:addCardDiv2('\${NUM}')"class="button button-a small"><span>+</span></a>
								<a href="#none" id="" class="button small"><span>파일지우기</span></a> <br />
								<small style="margin-left:10px;color:red;">업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf * 업로드 용량 : 20MB </small>
							</td>
						</tr>
					</tbody>
		        </table><!-- // table -->

		    </form>


		    <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="javascript:save();" class="button button-b primary"><span>저장</span></a>
                    <a href="javascript:self.close();" id="goList" class="button button-a"><span>취소</span></a>
                </div>
            </div><!-- // section-button -->

        </div>
    </div>
</div>

<footer><!-- footer -->
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</footer><!-- // footer -->

<script src="http://bo.marketplanta.epasscni.com:8080/am/js/plugins.js" /></script>
<script src="http://bo.marketplanta.epasscni.com:8080/am/js/ui.js"></script>
<script src="http://bo.marketplanta.epasscni.com:8080/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {



});

</script>
</body>
</html>
