<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

<script>
window.history.forward(); 
</script>

	<div id="container">
		<div id="content" class="content">
			
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">주문완료</h2>
			</div>
			<!--// Title -->
			<div class="sub_content">

				<div class="join_step w3">
					<ol>
						<li><span>STEP 01 <strong>장바구니</strong></span></li>
						<li><span>STEP 02 <strong>주문/결제</strong></span></li>
						<li class="on"><span>STEP 03 <strong>주문완료</strong></span></li>
					</ol>
				</div>

				<div class="complete_bx">
					<p class="txt">‘<strong>주문이 정상적으로 완료</strong>되었습니다.’</p>
					<p class="order_num">주문번호 <strong>
						<c:out value="${orderDeliveryInfo.ORD_ORD_MST_CD }"/>
					</strong></p>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">결제정보</h3><%-- ${orderPayInfo} --%>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>결제정보 : 결제금액, 결제방법 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">결제금액</th>
								<td><span class="pay_price">
								<c:out value="${orderPayInfo.PAY_MST_AMOUNT == null? orderPayInfo.ORD_MST_PAY_PRC : orderPayInfo.PAY_MST_AMOUNT}"/>
								 원</span></td>
							</tr>
							<tr>
								<th scope="row">결제방법 </th>
								<td>
									<ul class="txt_list">
										<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD}">
											<li>신용카드 : <c:out value="${orderPayInfo.PAY_MST_FINANCENAME}"/> <c:out value="${orderPayInfo.PAY_MST_PG_CARDNUM}"/></li>
											<li>승인번호 : <c:out value="${orderPayInfo.PAY_MST_FINANCEAUTHNUM}"/></li>
											<li>승인 일시 : <c:out value="${orderPayInfo.PAY_MST_PAYDATE}"/></li>
											<li>할부 : <c:out value="${orderPayInfo.PAY_MST_CARDINSTALLMONTH}"/></li>
											<li>
												<c:if test="${orderPayInfo.LGD_CARDNOINTYN eq 'Y'}">
													무이자할부
												</c:if>
											</li>
										</c:if>
										<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}">
											<li>실시간계좌이체 : <c:out value="${orderPayInfo.PAY_MST_FINANCENAME}"/> <c:out value="${orderPayInfo.PAY_MST_ACCOUNTNUM}"/></li>
											<!-- <li>승인번호 : <c:out value="${orderPayInfo.PAY_MST_FINANCEAUTHNUM}"/></li> -->
											<li>승인 일시 : <c:out value="${orderPayInfo.PAY_MST_PAYDATE}"/></li>
											
										</c:if>
										<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT}">
											<li>가상계좌 : <c:out value="${orderPayInfo.PAY_MST_FINANCENAME}"/>( <c:out value="${orderPayInfo.PAY_MST_ACCOUNTNUM}"/>  <c:out value="${orderPayInfo.PAY_MST_BUYER}"/> )</li>
											<!-- <li>승인번호 : <c:out value="${orderPayInfo.PAY_MST_FINANCEAUTHNUM}"/></li> -->
											<li>승인 일시 : <c:out value="${orderPayInfo.PAY_MST_PAYDATE}"/></li>

										</c:if>
										<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_HP}">
											<li>휴대폰 : <c:out value="${orderPayInfo.PAY_MST_FINANCENAME}"/> <c:out value="${orderPayInfo.PAY_MST_TELNO}"/></li>
											<!-- <li>승인번호 : <c:out value="${orderPayInfo.PAY_MST_FINANCEAUTHNUM}"/></li> -->
											<li>승인 일시 : <c:out value="${orderPayInfo.PAY_MST_PAYDATE}"/></li>
										</c:if>
										<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}">
											<li><c:out value="${orderPayInfo.ORD_MST_PAY_TYPE_NM}"/></li>											
										</c:if>
									</ul>
									${ORD_MST_PAY_TYPE }
									<c:if test="${ORD_MST_PAY_TYPE ne Code.PAY_DEPOSIT}">
										<script language="JavaScript" src="/nas/cdn/pc/js/receipt_link.js"></script>
										<button onclick="showReceiptByTID('<c:out value="${orderPayInfo.PAY_MST_MID}"/>', '<c:out value="${orderPayInfo.PAY_MST_TID}"/>', '<c:out value="${commandMap.LGD_HASHDATA}"/>')" class="btn_small mt20">영수증 보기</button>
									</c:if>
									<!-- 2020.16.21 영수증보기  -->
									<%-- <c:if test="${ORD_MST_PAY_TYPE ne Code.PAY_MILEAGE}">
										<script language="JavaScript" src="/nas/cdn/pc/js/receipt_link.js"></script>
										<button onclick="showReceiptByTID('<c:out value="${orderPayInfo.PAY_MST_MID}"/>', '<c:out value="${orderPayInfo.PAY_MST_TID}"/>', '<c:out value="${commandMap.LGD_HASHDATA}"/>')" class="btn_small mt20">영수증 보기</button>
									</c:if>  --%>
									<%-- <c:if test="${ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT}">
										<script language="JavaScript" src="http://pgweb.uplus.co.kr:7085/WEB_SERVER/js/receipt_link.js"></script>
										javascript:showCashReceipts('LGD_MID','LGD_OID','seqno','거래종류','test')
										<button onclick="showCashReceipts('<c:out value="${orderPayInfo.PAY_MST_MID}"/>', '<c:out value="${orderPayInfo.PAY_MST_TID}"/>', '<c:out value="${commandMap.LGD_HASHDATA}"/>')" class="btn_small mt20">현금 영수증 보기</button>
									</c:if>  --%>
								</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="con_tit_wrap">
					<h3 class="con_tit">배송지 정보</h3>
				</div>
				<div class="table_wrap">
					<table class="tb_row">
						<caption>배송지 정보 : 받으시는 분, 휴대폰 번호, 전화번호, 주소, 배송 유의사항 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:30%">
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">받으시는 분</th>
								<%-- <td colspan="3"><c:out value="${commandMap.ORD_MST_ORD_NM}"/></td> --%>
								<td colspan="3"><c:out value="${orderDeliveryInfo.ORD_DLV_NM}"/></td>
							</tr>
							<tr>
								<th scope="row">휴대폰 번호</th>
								<td><c:out value="${orderDeliveryInfo.ORD_DLV_HP1}"/>-<c:out value="${orderDeliveryInfo.ORD_DLV_HP2}"/>-<c:out value="${orderDeliveryInfo.ORD_DLV_HP3}"/></td>
								<th scope="row">전화번호</th>
								<td><c:out value="${orderDeliveryInfo.ORD_DLV_TEL1}"/>-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2}"/>-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3}"/></td>
								
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="3">
									<ul class="txt_list">
										<li>[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5}"/>] <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1}"/>, <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1}"/> <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2}"/></li>
									<%-- 	<li><!-- 우편번호 :  -->[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5}"/>]<li>
										<li><!-- 도로명 :   --><c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1}"/></li>
										<li><!-- 지번 :  --> <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1}"/></li>
										<li><!-- 상세주소:  --><c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2}"/></li> --%>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">배송 유의사항</th>
								<td colspan="3"><c:out value="${orderDeliveryInfo.ORD_DLV_MSG}"/></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap mt100">
					<button class="btn_large" id="goShoppingBtn">쇼핑 계속하기</button>
					<button class="btn_large ok" id="goMyOderListBtn">주문내역조회</button>
				</div>

			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script>
	
	$(function () {
		$("#goShoppingBtn").click(function () {
			location.href = "<c:out value = "${frontDomain}"/>/pc/main/index.do";
		})
		
		$("#goMyOderListBtn").click(function () {
			location.href = "<c:out value = "${serverSslDomain}"/>/pc/mypage/myShoppingInfo.do";
			
		})
	});
</script>