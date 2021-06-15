<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container card_con" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>회원혜택</h2>
            <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .event_con_d S -->
		<section class="event_con_d">
			
			<%@ include file="/WEB-INF/jsp/mobile/event/eventMenuInclude.jsp" %>

			<div class="card_banner">
				<a href="javascript:$.com.util.layPop('open', $('#laySh'));" class="btn_red"><strong>상세 조건 검색</strong><i class="ico_sh"></i></a>
				<img src="<c:out value="${cdnDomain }" />/mobile/img/event/img_1.jpg" alt="마켓플랜트 12월 카드 혜택" />				
			</div>
						
			<!-- .card_list S -->
			<div class="card_list">
				<!-- 검색하고 없을때, 있을때 -->
				<c:choose>
					<c:when test="${empty cardDivList and empty chargeList and empty pointSaleList and empty cashList and empty pointSaveList}">
					<div class="list">					
						<div class="no_list"><span>검색 결과가 없습니다.</span></div>
					</div>
					</c:when>
					<c:otherwise>
					<c:if test="${not empty cardDivList}">
					<strong class="tx_ti">카드할부 카드행사</strong>
					<div class="list">
						<c:forEach var="row" items="${cardDivList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<dl class="<c:out value="${clsNm }" />">
							<dt>
								<img src="<c:out value="${cdnDomain }" />/mobile/img/event/event_card_title_<c:out value="${row.DIV_DTL_CD }" />.jpg" alt="" />
							</dt>
							<dd >
								<strong class="tx_ti">카드할부</strong>
								<p class="tx_con">
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
								</p>
							</dd>
						</dl>
						</c:forEach>
					</div>
					</c:if>
					
					<c:if test="${not empty chargeList}">
					<strong class="tx_ti">청구할인 카드행사</strong>
					<div class="list">
						<c:forEach var="row" items="${chargeList }" varStatus="sta">
						<c:set var="clsNm" value="" />
						<c:if test="${sta.last }">
						<c:set var="clsNm" value="l" />
						</c:if>
						<dl class="<c:out value="${clsNm }" />">
							<dt>
								<img src="<c:out value="${cdnDomain }" />/mobile/img/event/event_card_title_<c:out value="${row.DIV_DTL_CD }" />.jpg" alt="" />
							</dt>
							<dd>
								<strong class="tx_ti"><c:out value="${row.CRD_PMT_GBN_NM }" /></strong>
								<p class="tx_con">
									<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
										<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true" /> 만원 이상 결제 시 <c:out value="${row.PMT_CRD_SAL_PRC }" /> % 할인  / 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"  />만원
									</c:if>
									<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
										<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true"  /> 만원  이상 결제 시 <fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }" groupingUsed="true"  /> 만원 할인 
									</c:if>
								</p>
							</dd>
						</dl>
						</c:forEach>
					</div>
					</c:if>
					
					<c:if test="${not empty pointSaleList}">
						<strong class="tx_ti">포인트선할인 카드행사</strong>
						<div class="list">
							<c:forEach var="row" items="${pointSaleList }" varStatus="sta">
							<c:set var="clsNm" value="" />
							<c:if test="${sta.last }">
							<c:set var="clsNm" value="l" />
							</c:if>
							<dl class="<c:out value="${clsNm }" />" >
								<dt>
									<img src="<c:out value="${cdnDomain }" />/mobile/img/event/event_card_title_<c:out value="${row.DIV_DTL_CD }" />.jpg" alt="" />
								</dt>
								<dd>
									<strong class="tx_ti"><c:out value="${row.CRD_PMT_GBN_NM }" /></strong>
									<p class="tx_con">
										(<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true" />만원  ↑) 최소 <fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }"  groupingUsed="true"/>만원  ~ <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"/>만원
									</p>
								</dd>
							</dl>
							</c:forEach>
						</div>
					</c:if>
					
					<c:if test="${not empty cashList}">
						<strong class="tx_ti">현금캐시백 카드행사</strong>
						<div class="list">
							<c:forEach var="row" items="${cashList }" varStatus="sta">
							<c:set var="clsNm" value="" />
							<c:if test="${sta.last }">
							<c:set var="clsNm" value="l" />
							</c:if>
							<dl class="<c:out value="${clsNm }" />" >
								<dt>
									<img src="<c:out value="${cdnDomain }" />/mobile/img/event/event_card_title_<c:out value="${row.DIV_DTL_CD }" />.jpg" alt="" />
								</dt>
								<dd>
									<strong class="tx_ti"><c:out value="${row.CRD_PMT_GBN_NM }" /></strong>
									<p class="tx_con">
										(<fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true" />만원  ↑) 최소 <fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }"  groupingUsed="true"/>만원  ~ <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"/>만원
									</p>
								</dd>
							</dl>
							</c:forEach>
						</div>
					</c:if>
					
					<c:if test="${not empty pointSaveList}">
						<strong class="tx_ti">카드포인트적립</strong>
						<div class="list">
							<c:forEach var="row" items="${pointSaveList }" varStatus="sta">
							<c:set var="clsNm" value="" />
							<c:if test="${sta.last }">
							<c:set var="clsNm" value="l" />
							</c:if>
							<dl class="<c:out value="${clsNm }" />" >
								<dt>
									<img src="<c:out value="${cdnDomain }" />/mobile/img/event/event_card_title_<c:out value="${row.DIV_DTL_CD }" />.jpg" alt="" />
								</dt>
								<dd>
									<strong class="tx_ti"><c:out value="${row.CRD_PMT_GBN_NM }" /></strong>
									<p class="tx_con">
										<c:out value="${row.PMT_CRD_SAL_PRC }" />
										<c:if test="${row.PMT_CRD_SAL_GBN eq 'R' }">
											<c:out value="${row.PMT_CRD_SAL_PRC }" />% 포인트 적립 : 최대 <fmt:formatNumber value="${row.PMT_CRD_MXM_PRC }" groupingUsed="true"/>만원 한도
										</c:if>
										<c:if test="${row.PMT_CRD_SAL_GBN eq 'M' }">
											<fmt:formatNumber value="${row.PMT_CRD_SAL_PRC }" groupingUsed="true" />만원 적립 : <fmt:formatNumber value="${row.PMT_CRD_SML_PRC }" groupingUsed="true"/>이상 결제시
										</c:if>
									</p>
								</dd>
							</dl>
							</c:forEach>
						</div>
					</c:if>
					
					</c:otherwise>
				</c:choose>
				</div>
				<!-- 검색안하고 그냥 종류별리스트 -->
			</div>
			<!--// .card_list E -->
			
			
			<div class="coupon_txEx">
				<p class="tx_ex2">
					<span>본 카드행사는 당사 및 카드사의 사정에 따라 사전 예고 없이 변경 또는 취소될 수 있습니다.</span>
					<span>일부 상품에서 제외될 수 있습니다.</span>
				</p>
			</div>
			
		</section>
		<!--// .event_con_d E -->

		<!-- #laySh S -->
		<section id="laySh" data-role="popup" data-overlay-theme="a" class="popup_st0">
			<dl class="ui-content">
				<dt>
					<h2>상세 조건 검색</h2>
					<a href="javascript:$.com.util.layPop('close', $('#laySh'));" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="dd_con">
					<!-- .card_sh_form S -->
					<dl class="card_sh_form">
						<dt>
							<strong>기간 : <strong class="co_red tx_date"><c:out value="${year }"/>.<c:out value="${month }" />.01 ~ <c:out value="${year }"/>.<c:out value="${month }" />.<c:out value="${lastDay }" /></strong></strong>
							<span>카드 행사와 카드 할부 혜택을 확인해보세요</span>
						</dt>
						<dd class="dd_inp">
							<form method="get" name="frm" id="frm">
							<label for="" class="sel_box_st0">
								<select id="cardEv" name="cardEv">
									<option>카드행사 선택</option>
									<option value="2333" <c:if test="${commandMap.cardEv eq '2333' }">selected</c:if> >카드할부</option>
									<c:forEach var="row" items="${cardEventCodeList }" >
									<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.cardEv eq row.CMN_COM_IDX }">selected</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
									</c:forEach>
								</select>
							</label>
							<label for="" class="sel_box_st0">
								<select id="cardCode" name="cardCode" >
									<option>카드사 선택</option>
									<c:forEach var="row" items="${cardCodeList }">
									<option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${commandMap.cardCode eq row.CMN_COM_IDX }">selected</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
									</c:forEach>
								</select>
							</label>
							<label for="" class="inp_price">
								<input type="text" name="prc" id="prc" value="<c:out value="${commandMap.prc }" />" placeholder="결제금액" />
								<span>원</span>
							</label>
							</form>
						</dd>
						<dd class="dd_btn">
							<a href="javascript:goSearch();" class="btn_gre"><strong>조건 검색</strong></a>
						</dd>
					</dl>
					<!--// .card_sh_form E -->
				</dd>
			</dl>
		</section>
		<!--//#laySh E -->
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	$.com.util.tab($('.tab_st2 .tab_mn'), 0);
});

goSearch		= function(){
	$("#frm").attr("action", "<c:out value="${mobileDomain}"/>/mobile/event/cardBenefit.do").submit();
};
</script>