<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>


<!-- Content -->
	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">주문/배송상세</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				
				<!-- //my_modify_top_wrap -->
				
				<form id="frm" name="frm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>  
	                <%-- <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" /> --%>
		            <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
		            <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" />
		            <input type="hidden" id="searchCancelBack" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
		            <input type="hidden" id="searchState" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
	      		</form>

				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>주문/배송 상세조회 : 주문번호, 주문일 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%;">
							<col>
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td><c:out value="${orderPayInfo.ORD_MST_CD }"/></td>
								<th scope="row">주문일</th>
								<td><ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">주문상품 정보</h3>
					<div class="top_btn">
						<a href="#" class="btn order cancel">전체주문취소</a>
					</div>
				</div>
				<!-- S:배송상품 일때 -->
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>주문상품 정보 : 상품정보, 상품금액, 배송비, 판매자명, 진행상태 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:10%;">
							<col style="width:16%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">상품금액</th>
								<th scope="col">배송비</th>
								<th scope="col">판매자명</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${orderProductList }">
							<tr>
								<td>
									<div class="product_info clearboth">
										<div class="img">
											<a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');" class="product_thumb">
												<img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" alt="${row.PRD_IMAGE_ALT}" />
											</a>
										</div>
										<div class="txt">
											<!-- TODO 브랜드 이름 수정 -->
											<%-- <span class="brand"><c:out value="${row.PRD_MST_NM}" /></span> --%>
											<a href="javascript:goProductView('<c:out value="${row.ORD_MST_CD }" />');" class="item_name"><c:out value="${row.PRD_MST_NM }" /></a>
											<span class="item_info"><c:out value="${row.ORD_PRD_COLOR }" /> / <c:out value="${row.ORD_PRD_SIZE }" /> / <c:out value="${row.ORD_PRD_ORD_CNT }" />개</span>
										</div>
									</div>
								</td>
								<td>
									<span class="s_price"><fmt:formatNumber value="${row.ORD_PRD_PRD_PRC}" type="number"/>원</span>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.ORD_PRD_DLV_CAG ne 0 }">
											<c:out value="${row.ORD_PRD_DLV_CAG }"/>
										</c:when>
										<c:otherwise>
											무료배송
										</c:otherwise>
									</c:choose>
								</td>
								<td><c:out value="${row.VDR_MST_NM }" /></td>
								<td>
									<span class="order_state"><c:out value="${row.ORD_PRD_ORD_STATE_NM }" /></span>
									<c:if test="${row.ORD_PRD_ORD_STATE eq '405' or row.ORD_PRD_ORD_STATE eq '3022' }">
										<a href="#" class="btn order cancel">주문취소</a>
									</c:if>
									<c:if test="${row.ORD_PRD_ORD_STATE eq '407' }">
										<!-- TODO 배송중 택배사 정보 수정 -->
										<span class="order_delivery">(<c:out value="${row.DLV_CPN_NM }" />TEST택배<a href="javascript:goDeliveryView" class="btn_txt"><c:out value="${row.ORD_PRD_IVC_NO }" /><c:out value="${row.DLV_CPN_URL }"/>1234567</a>)</span>
									</c:if>
									<c:if test="${row.ORD_PRD_ORD_STATE eq '408' }">
										<a href="javascript:orderFix();" class="btn order confirm">구매확정</a>
										<a href="#" class="btn order confirm">교환신청</a>
										<a href="#" class="btn order confirm">반품신청</a>
									</c:if>
									<c:if test="${row.ORD_PRD_ORD_STATE eq '409' }">
										<a href="#" class="btn order review">상품후기</a>
										<a href="#" class="btn order review">후기보기</a>
									</c:if>
								</td>
								
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--//E:배송상품 일때 -->

				<c:if test="${not empty requestedGiftList}">
					<div class="con_tit_wrap mt95">
						<h3 class="con_tit">사은품 정보</h3>
					</div>
					<div class="table_wrap mb95">
						<table class="tb_col">
							<caption>사은품 정보 출력 표입니다.</caption>
							<colgroup>
								<col style="width:100%;">
							</colgroup>
							<tbody>
								<c:forEach var="gift" items="${requestedGiftList}" varStatus="i">
									<tr>
										<td>
										${gift}
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" alt="<c:out value="${gift.PRD_IMAGE_ALT}"/>">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>

				<div class="con_tit_wrap">
					<h3 class="con_tit">결제정보</h3>
				</div>
				<div class="table_wrap payment mb95">
					<table class="tb_col">
						<caption>결제정보 : 주문금액, 할인금액, 포인트 사용, 총 결제금액 출력 표입니다.</caption>
						<colgroup>
							<col style="width:290px;">
							<col style="width:290px;">
							<col style="width:290px;">
							<col style="width:*;">
						</colgroup>
						<thead>
							<c:if test="${not empty orderPayInfo }">
								<tr>
									<th scope="col">
										<p class="tit">주문금액</p>
										<p class="price"><fmt:formatNumber value="${orderPayInfo.TOT_ORD_PRD_PRD_PRC + orderPayInfo.ORD_MST_DLV_CAG }" type="number"/></strong> 원</p>
									</th>
									<th scope="col">
										<span class="minus">-</span>
										<p class="tit">할인금액</p>
										<p class="price"><strong><fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE + orderPayInfo.ORD_MST_DC_MLG + orderPayInfo.ORD_MST_DC_CPN + orderPayInfo.ORD_MST_DC_OCB_PIT}" type="number"/></strong> 원</p>
									</th>
									<th scope="col">
										<span class="minus">-</span>
										<p class="tit">포인트 사용</p>
										<p class="price"><strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/></strong> p</p>
									</th>
									<th scope="col" class="total">
										<span class="equal">=</span>
										<p class="tit">총 결제금액</p>
										<p class="price"><strong><fmt:formatNumber value="${orderPayInfo.ORD_MST_PAY_PRC}" type="number"/></strong> 원</p>
									</th>
								</tr>
							</c:if>
						</thead>
						
						<tbody>
							<c:if test="${not empty orderPayInfo }">
							<tr>
								<td>
									
									<ul class="pay_detail">
										<li><span class="tit">총 상품금액</span><span class="price"><fmt:formatNumber value="${orderPayInfo.TOT_ORD_PRD_PRD_PRC}" type="number"/> 원</span></li>
										<li><span class="tit">배송비</span><span class="price"><fmt:formatNumber value="${orderPayInfo.ORD_MST_DLV_CAG}" type="number"/> 원</span></li>
										<li>
											<c:if test="${orderProductList[0].SUM_DLV_ADD_CHARGE gt 0}">
											<span class="tit">도서산간 배송비</span><span class="price"><fmt:formatNumber value="${orderProductList[0].SUM_DLV_ADD_CHARGE}" type="number"/> 원</span>
											</c:if>
										</li>
									</ul>
								</td>
								<td>
									<ul class="pay_detail">
										<li><span class="tit">즉시할인</span><span class="price"><fmt:formatNumber value="${orderProductList[0].SUM_INSTANT_CPN_ORDER_PRICE}" type="number"/> 원</span></li>
										<!-- TODO 할인 상세정보 수정 -->
										<%-- <li><span class="tit">제휴사할인</span><span class="price">30,000 원</span></li>
										<li><span class="tit">상품할인쿠폰</span><span class="price"><fmt:formatNumber value="${c_prd_cpn_prc}" type="number"/> 원</span></li>
										<li><span class="tit">배송비쿠폰</span><span class="price"><fmt:formatNumber value="${c_dlv_cpn_prc}" type="number"/> 원</span></li>
										<li><span class="tit">프로모션 할인</span><span class="price">2,000 원</span></li> --%>
									</ul>
								</td>
								<td>
									<ul class="pay_detail">
										<!-- TODO 포인트 사용정보 수정 -->
										<%-- <li><span class="tit">통합포인트</span><span class="price"><fmt:formatNumber value="${orderPayInfo.ORD_MST_DC_MLG}" type="number"/> p</span></li>
										<li><span class="tit">E포인트</span><span class="price">10,000 p</span></li>
										<li><span class="tit">임직원포인트</span><span class="price">5,000 p</span></li> --%>
									</ul>
								</td>
								<td>
									<c:choose>
										<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_CARD or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}"><%-- 신용카드 --%>
											<ul class="pay_detail">
												<li><span class="txt">신용카드</span></li>
												<li><span class="txt"><c:out value="${orderPayInfo.PAY_MST_KICC_ACQUIRER_NM }" /> : ( <c:out value="${fn:substring(orderPayInfo.PAY_MST_KICC_CARD_NO,0,4) }" />-<c:out value="${fn:substring(orderPayInfo.PAY_MST_KICC_CARD_NO,4,8) }" />-****-**** )</span></li>
												<li><span class="txt">승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></span></li>
												<li><span class="txt">승인일시 : 2019-09-23 12:36:15</span></li>
												<li>
													<c:choose>
														<c:when test="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD eq '00' }">
															<span class="txt">일시불</span>
														</c:when>
														<c:otherwise>
															<span class="txt"><c:if test="${orderPayInfo.PAY_MST_KICC_NOINT eq '02' }">무이자</c:if>할부 <fmt:formatNumber value="${orderPayInfo.PAY_MST_KICC_INSTALL_PERIOD}" type="number" pattern="0" />개월</span>
														</c:otherwise>
													</c:choose>
												</li>
											</ul>
										</c:when>
										<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }"><%-- 카카오페이 --%>
											<ul class="pay_detail">
												<li><span class="txt">신용카드</span></li>
												<li><span class="txt"><c:out value="${orderPayInfo.PAY_MST_KAKAO_CARDNAME }" /> : ( <c:out value="${orderPayInfo.MASKING_KAKAO_CARD_NO}" /> )</span></li>
												<li><span class="txt">승인번호 : <c:out value="${orderPayInfo.PAY_MST_KAKAO_AUTHCODE }" /></span></li>
												<li><span class="txt">승인일시 : 2019-09-23 12:36:15</span></li>
												<li>
													<c:choose>
														<c:when test="${orderPayInfo.PAY_MST_KAKAO_CARDQUOTA eq '00' }">
															<span class="txt">일시불</span>
														</c:when>
														<c:otherwise>
															<span class="txt">할부<fmt:formatNumber value="${orderPayInfo.PAY_MST_KAKAO_CARDQUOTA}" type="number" pattern="0" />개월</span>
														</c:otherwise>
													</c:choose>
												</li>
											</ul>
										</c:when>
										<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}"><%-- 무통장 or 에스크로 --%>
											<ul class="pay_detail">
												<li><span class="txt">${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT ? '가상계좌' : '에스크로' }</span></li>
												<li>
													<c:choose>
														<c:when test="${orderPayInfo.ORD_MST_PAY_DT eq '00000000000000' }"><%-- 결제일시가 없는 경우 입금미확인 --%>
															<span class="txt">입금미확인</span>
															<span class="txt">입금계좌 : [<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" />] <c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO }" /></span>
															<span class="txt">입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></span>
														</c:when>
														<c:otherwise>
															<span class="txt">입금완료</span>
															<span class="txt">입금계좌 : [<c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" />] <c:out value="${orderPayInfo.PAY_MST_KICC_ACCOUNT_NO }" /></span>
															<span class="txt">입금만료일 : <ui:formatDate value="${orderPayInfo.PAY_MST_KICC_EXPIRE_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></span>
															<span class="txt">입금자명 : <c:out value="${orderPayInfo.ORD_MST_DPS_NM }" /></span>
														</c:otherwise>
													</c:choose>
												</li>
											</ul>
										</c:when>
										<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
											<ul class="pay_detail">
												<li><span class="txt">실시간 계좌이체</span></li>
												<li>
													<span class="txt"><c:out value="${orderPayInfo.PAY_MST_KICC_BANK_NM }" /></span>
													<span class="txt">승인번호 : <c:out value="${orderPayInfo.PAY_MST_KICC_AUTH_NO }" /></span>
												</li>
											</ul>
										</c:when>
										<c:when test="${orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_MILEAGE}"><%-- 전액 포인트/쿠폰/크라운 결제 --%>
											<ul class="pay_detail">
												<li><span class="txt">포인트</span></li>
												<li>
													<span class="txt">포인트</span>
												</li>
											</ul>
										</c:when>
									</c:choose>
									<!-- 
									<c:if test="${orderPayInfo.ORD_MST_PAY_TYPE ne Code.PAY_DEPOSIT}">
										<script language="JavaScript" src="/nas/cdn/pc/js/receipt_link.js"/>
										<button onclick="showReceiptByTID('<c:out value="${orderPayInfo.PAY_MST_MID}"/>', '<c:out value="${orderPayInfo.PAY_MST_TID}"/>', '<c:out value="${commandMap.LGD_HASHDATA}"/>')" class="btn_small mt20">영수증 보기</button>
									</c:if>
									 -->
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>

				<!-- TODO 적립혜택정보 비회원, 일반 임직원 비노출 수정 -->
				<c:if test="">
					<div class="con_tit_wrap">
						<h3 class="con_tit">적립혜택정보</h3>
					</div>
					<div class="table_wrap mb95">
						<table class="tb_row">
							<caption>적립혜택정보 : 적립 예정 통합포인트 출력 표입니다.</caption>
							<colgroup>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">적립 예정 통합포인트</th>
									<td><fmt:formatNumber value="${orderPayInfo.TOT_ORD_SAV_MIL}" type="number"/> p</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>

				<div class="con_tit_wrap">
					<h3 class="con_tit">배송지 정보</h3>
					<div class="top_btn">
						<!-- TODO 입금대기, 결제완료 경우만 배송지 변경 버튼 노출 수정 -->
						<a href="javascript:goDeliveryModify();" class="btn_inq">배송지 정보 변경</a>
						<%-- <c:if test="${orderState.FRONT_WHOLE_CANCEL_POSSIBLE_YN eq 'Y'}">
							<c:if test="${orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_GET_IT_NOW_CD && orderPayInfo.ORD_MST_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD}">
							</c:if>
						</c:if> --%>
					</div>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>배송지 정보 : 받으시는 분, 휴대폰, 전화번호, 주소, 배송 유의사항 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col>
							<col style="width:20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">받으시는 분</th>
								<td colspan="3" id="td_dlv_nm"><c:out value="${orderDeliveryInfo.ORD_DLV_NM }" /></td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td id="td_hp">
									<c:if test="${not empty orderDeliveryInfo.ORD_DLV_HP1 }">
										<c:out value="${orderDeliveryInfo.ORD_DLV_HP1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }" />
									</c:if>
								</td>
								<th scope="row">전화번호</th>
								<td id="td_tel">
									<c:if test="${not empty orderDeliveryInfo.ORD_DLV_TEL1 }">
										<c:out value="${orderDeliveryInfo.ORD_DLV_TEL1 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }" />-<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }" />
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="3">
									<span id="td_dro">
										[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />] <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }" /><br>
									</span>
									<!-- 
									<span id="td_jbn">
										[<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }" />] <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }" />, <c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR2 }" />
									</span>
									 -->
								</td>
							</tr>
							<tr>
								<th scope="row">배송 유의사항</th>
								<td colspan="3" id="td_desc"><c:out value="${orderDeliveryInfo.ORD_DLV_MSG }" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- TODO 비회원인 경우 주문고객 정보 노출 수정 -->
				<c:if test="">
					<div class="con_tit_wrap">
						<h3 class="con_tit">주문고객 정보</h3>
					</div>
					<div class="table_wrap mb95">
						<table class="tb_row">
							<caption>주문고객 정보 : 주문자, 이메일, 휴대폰, 전화번호 출력 표입니다.</caption>
							<colgroup>
								<col style="width:20%">
								<col>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">주문자</th>
									<td><c:out value="${orderPayInfo.ORD_MST_ORD_NM }" /></td>
									<th scope="row">이메일</th>
									<td><c:out value="${orderPayInfo.ORD_MST_MAIL }" /></td>
								</tr>
								<tr>
									<th scope="row">휴대폰</th>
									<td><c:out value="${orderPayInfo.ORD_MST_HP1 }" />-<c:out value="${orderPayInfo.ORD_MST_HP2 }" />-<c:out value="${orderPayInfo.ORD_MST_HP3 }" /></td>
									<th scope="row">전화번호</th>
									<td><c:out value="${orderPayInfo.ORD_MST_HP1 }" />-<c:out value="${orderPayInfo.ORD_MST_HP2 }" />-<c:out value="${orderPayInfo.ORD_MST_HP3 }" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${orderPayInfo.ORD_MST_PCK_YN eq 'Y'}">
					<div class="con_tit_wrap">
						<h3 class="con_tit">배송 포장 정보</h3>
					</div>
					<div class="desc_wp packing">
						<p class="tit">선물포장 옵션 선택이 정상적으로 되었습니다. </p>
						<ul class="txt">
							<li>신원 상품 구매 시 선물용이나 이동 시, 편리하게 사용할 수 있는 쇼핑백을 포장해드립니다. <br>(*신원 외 판매자는 배송되지 않습니다) </li>
							<li>브랜드 쇼핑백 또는 신원 전용 쇼핑백 중 1개로 무작위 발송되며, 고객님의 요청사항이 반영되지 않습니다.</li>
						</ul>
					</div>
				</c:if>
				<div class="btn_wrap">
					<button type="button" class="btn_large" id="goOrderList">목록</button>
				</div>
				
				<!-- leyerPopup -->
				<div id="deliveryModifyPop" >
				</div>
				<!-- //leyerPopup -->
				
			</div>
			<!-- //sub_content -->
		</div>
	</div>
	<!--// Content -->
            
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script>
$(function(){
	
});
	var $frm = $("#frm");

	//상세페이지 이동
	goProductView = function(prdCd){
		
		$frm.find("input[name='PRD_MST_CD']").val(prdCd);
	    $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/productView.do?prdMstCd="+prdCd, "target":"_self", "method":"get"}).submit();
	};
	
	
	//목록
	$(document).on("click","#goOrderList",function(url){
		$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myShoppingList.do", "target":"_self", "method":"get"}).submit();
	});
	
	// 배송지 수정 팝업
    goDeliveryModify = function(){
    	var ORD_MST_CD = "${orderPayInfo.ORD_MST_CD}";
    	$("#deliveryModifyPop").load("<c:out value="${serverSslDomain}"/>/pc/cart/deliveryModifyPopup.do", {"ORD_MST_CD": ORD_MST_CD})
    	$("#deliveryModifyPop").show();
    	$(".dim").show();
    }

	//구매확정 버튼 클릭 이벤트
    function orderFix(){
		if (confirm("상품후기를 작성하시면 자동 구매확정됩니다.\n상품후기 작성페이지로 이동하시겠습니까?")){
			location.href = "<c:out value="${frontDomain}" />/pc/mypage/myWritableProductCommentList.do";
		}
	}

    // 신용카드영수증 출력
    printCardReceipt = function ()
    {
        var LGD_MID = "<c:out value="${orderPayInfo.PAY_MST_MID }" />";
    	var LGD_TID = "<c:out value="${orderPayInfo.PAY_MST_TID }" />";
    	var LGD_HASHDATA = "<c:out value="${commandMap.LGD_HASHDATA }" />";	//"<c:out value="${orderPayInfo.PAY_MST_HASHDATA }" />";

    	showReceiptByTID(LGD_MID, LGD_TID, LGD_HASHDATA);
    };


</script>            