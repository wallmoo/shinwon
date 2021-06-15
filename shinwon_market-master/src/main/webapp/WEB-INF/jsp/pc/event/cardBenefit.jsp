<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->

			<!-- .section S -->
			<section class="event_zone">
				
				<%@ include file="/WEB-INF/jsp/pc/event/eventMenuInclude.jsp" %>
				
				<!-- .ev_con S -->
				<div class="ev_con ev_card"> <!-- 이벤트: ev_cons / 회원혜택: ev_member / 쿠폰혜택: ev_coupon / 카드혜택: ev_card -->
					<div class="bn_top">
					<c:if test="${not empty cardBannerInfo.FILE_NM  }" >
						<c:choose>
							<c:when test="${cardBannerInfo.BNR_MST_TGT eq 'S' }">
						<a href="<c:out value="${cardBannerInfo.BNR_MST_URL }" />" ><img src="<c:out value="${cdnDomain }${cardBannerInfo.FILE_NM }" />" alt="이벤트 배너"  /></a>							
							</c:when>
							<c:when test="${cardBannerInfo.BNR_MST_TGT eq 'N' }">
						<a href="<c:out value="${cardBannerInfo.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain }${cardBannerInfo.FILE_NM }" />" alt="이벤트 배너"  /></a>							
							</c:when>
							<c:otherwise>
						<img src="<c:out value="${cdnDomain }${cardBannerInfo.FILE_NM }" />" alt="이벤트 배너"  />							
							</c:otherwise>
						</c:choose>
					</c:if>
					</div>
					<dl class="sh_box">
						<dt class="blind">카드혜택 검색</dt>
						<dd class="tx">
							<strong>기간 : <c:out value="${year }"/>.<c:out value="${month }" />.01 ~ <c:out value="${year }"/>.<c:out value="${month }" />.<c:out value="${lastDay }" /></strong>
							<span>카드 행사와 카드 할부 혜택을 확인해보세요.</span>
						</dd>
						<form name="frm" id="frm">
						<dd class="sh">
							<select id="cardEv" name="cardEv" class="sel_chg">
								<option value="">선택</option>
								<option value="2333" <c:if test="${commandMap.cardEv eq '2333' }">selected</c:if> >카드할부</option>
								<c:forEach var="row" items="${cardEventCodeList }" >
								<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.cardEv eq row.CMN_COM_IDX }">selected</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
								</c:forEach>
							</select>
							<select id="cardCode" name="cardCode" class="sel_chg">
								<option value="">선택</option>
								<c:forEach var="row" items="${cardCodeList }">
								<option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${commandMap.cardCode eq row.CMN_COM_IDX }">selected</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
								</c:forEach>
							</select>
							<label for="">
								<input type="text" name="prc" id="prc" value="<c:out value="${commandMap.prc }" />" />
								<span class="tx_won">원</span>
							</label>
							<a href="javascript:void(0)" class="btn_sh"><span>조건 검색</span></a>
						</dd>
						</form>
					</dl>

					
					<c:choose>
						<c:when test="${empty cardDivList and empty chargeList and empty pointSaleList and empty cashList and empty pointSaveList}">
					<ol class="card_list">						
						<li class="no_list">
							<span>검색 결과가 없습니다. </span>
						</li>
					</ol>							
						</c:when>
						<c:otherwise>
						<c:if test="${not empty cardDivList}">
				<h3 class="card_title"><strong>카드할부 카드행사</strong></h3>
					<ol class="card_list">
						<c:forEach var="row" items="${cardDivList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last || sta.count mod 3 == 0 }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<c:if test="${sta.first || sta.count mod 3 == 1 }">
						<c:set var="clsNm" value="f" />
						</c:if>
						<li class="<c:out value="${clsNm }" />">
							<img src="<c:out value="${cdnDomain }" />/pc/img/custom/event_card_title_<c:out value="${row.DIV_DTL_CD }" />.png" alt="카드이벤트 배너" />
							<table>
								<caption>청구할인, 할인내역조건으로 구성된 표</caption>
								<colgroup>
								<col style="width:64px" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong>카드할부</strong></th>
										<td>
											<c:forEach var="optRow" items="${cardOptList }">
												<c:if test="${row.DIV_DTL_CD eq  optRow.DIV_DTL_CD}">
													<c:if test="${not empty optRow.DIV_INF_MNT }">
													<c:out value="${optRow.DIV_INF_MNT }" />개월  <c:out value="${optRow.DIV_INF_GBN_NM }" />: 
													</c:if>
													<c:if test="${not empty optRow.DIV_INF_NTC }">
													<c:out value="${optRow.DIV_INF_NTC }" />,
													</c:if>
													<c:if test="${not empty  optRow.DIV_DTL_PRC}"> 
													<fmt:formatNumber value="${optRow.DIV_DTL_PRC }" groupingUsed="true"/>만원 이상 <br/>
													</c:if>
												</c:if>
											</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
						</c:forEach>
					</ol>						
						</c:if>
						
						<c:if test="${not empty chargeList}">
				<h3 class="card_title"><strong>청구할인 카드행사</strong></h3>
					<ol class="card_list">						
						<c:forEach var="row" items="${chargeList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last || sta.count mod 3 == 0 }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<c:if test="${sta.first || sta.count mod 3 == 1 }">
						<c:set var="clsNm" value="f" />
						</c:if>
						<li class="<c:out value="${clsNm }" />">
							<img src="<c:out value="${cdnDomain }" />/pc/img/custom/event_card_title_<c:out value="${row.PMT_CRD_IDX }" />.png" alt="카드이벤트 배너" />
							<table>
								<caption>청구할인, 할인내역조건으로 구성된 표</caption>
								<colgroup>
								<col style="width:64px" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong><c:out value="${row.CRD_PMT_GBN_NM }" /></strong></th>
										<td>
											<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
												<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true" /> 만원 이상 결제 시 <c:out value="${row.PMT_CRD_SAL_PRC }" /> % 할인  / 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"  />만원
											</c:if>
											<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
												<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true"  /> 만원  이상 결제 시 <fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }" groupingUsed="true"  /> 만원 할인 
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
						</c:forEach>
				</ol>						
						</c:if>
						
						<c:if test="${not empty pointSaleList}">
				<h3 class="card_title"><strong>포인트선할인 카드행사</strong></h3>
					<ol class="card_list">							
						<c:forEach var="row" items="${pointSaleList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last || sta.count mod 3 == 0 }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<c:if test="${sta.first || sta.count mod 3 == 1 }">
						<c:set var="clsNm" value="f" />
						</c:if>
						<li class="<c:out value="${clsNm }" />">
							<img src="<c:out value="${cdnDomain }" />/pc/img/custom/event_card_title_<c:out value="${row.PMT_CRD_IDX }" />.png" alt="카드이벤트 배너" />
							<table>
								<caption>청구할인, 할인내역조건으로 구성된 표</caption>
								<colgroup>
								<col style="width:64px" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong><c:out value="${row.CRD_PMT_GBN_NM }" /></strong></th>
										<td>(<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true" />만원  ↑) 최소 <fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }"  groupingUsed="true"/>만원  ~ <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"/>만원</td>
									</tr>
								</tbody>
							</table>
						</li>
						</c:forEach>
						</c:if>
						
						<c:if test="${not empty cashList}">
				<h3 class="card_title"><strong>현금캐시백 카드행사</strong></h3>
					<ol class="card_list">							
						<c:forEach var="row" items="${cashList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last || sta.count mod 3 == 0 }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<c:if test="${sta.first || sta.count mod 3 == 1 }">
						<c:set var="clsNm" value="f" />
						</c:if>
						<li class="<c:out value="${clsNm }" />">
							<img src="<c:out value="${cdnDomain }" />/pc/img/custom/event_card_title_<c:out value="${row.PMT_CRD_IDX }" />.png" alt="카드이벤트 배너" />
							<table>
								<caption>청구할인, 할인내역조건으로 구성된 표</caption>
								<colgroup>
								<col style="width:64px" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong><c:out value="${row.CRD_PMT_GBN_NM }" /></strong></th>
										<td>(<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true"/>만원  ↑) 최소 <fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }" groupingUsed="true" /> ~ <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true" />만원</td>
									</tr>
								</tbody>
							</table>
						</li>
						</c:forEach>
					</ol>						
						</c:if>
						
						<c:if test="${not empty pointSaveList}">
				<h3 class="card_title"><strong>카드포인트적립</strong></h3>
					<ol class="card_list">		
						<c:forEach var="row" items="${pointSaveList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last || sta.count mod 3 == 0 }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<c:if test="${sta.first || sta.count mod 3 == 1 }">
						<c:set var="clsNm" value="f" />
						</c:if>
						<li class="<c:out value="${clsNm }" />">
							<img src="<c:out value="${cdnDomain }" />/pc/img/custom/event_card_title_<c:out value="${row.PMT_CRD_IDX }" />.png" alt="카드이벤트 배너" />
							<table>
								<caption>청구할인, 할인내역조건으로 구성된 표</caption>
								<colgroup>
								<col style="width:64px" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong><c:out value="${row.CRD_PMT_GBN_NM }" /></strong></th>
										<td>
											<c:out value="${row.PMT_CRD_SAL_PRC }" />
											<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
												<c:out value="${row.PMT_CRD_SAL_PRC }" />% 포인트 적립 : 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"/>만원 한도
											</c:if>
											<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
												<fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }" groupingUsed="true" />만원 적립 : <fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true"/>이상 결제시
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</li>
						</c:forEach>
						</c:if>
						</c:otherwise>
					</c:choose>						
					</ol>
				
					<div class="tx_ex">
						<span><i>ㆍ</i>본 카드행사는 당사 및 카드사의 사정에 따라 사전 예고없이 변경 또는 취소될 수 있습니다.</span>
						<span><i>ㆍ</i>일부 상품에서 제외될 수 있습니다.</span>
					</div>
					
				</div>
				<!--// .ev_con E -->
			</section>
			<!--// .section E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	<script type="text/javascript">
		$(document).on("click", ".btn_sh", function(){
			$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/event/cardBenefit.do").submit();
		});
		
	</script>	
	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
