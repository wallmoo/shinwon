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
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container coupon_con" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>회원혜택</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .event_con_d S -->
		<section class="event_con_d">
			
			<%@ include file="/WEB-INF/jsp/mobile/event/eventMenuInclude.jsp" %>
			
			<c:if test="${empty userInfo }">
			<!-- 로그인 전 S -->
			<div class="login_box">
				<p>
					<strong>회원 등급별 혜택</strong>
					<span>로그인 하시면  등급별 쿠폰을 확인 하실 수 있습니다.</span>
				</p>
				<div class="btn_box">
					<a href="javascript:goLogin();"><span>로그인</span></a>
					<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do', '_self');"><span>회원혜택보기</span></a>
				</div>
			</div>
			<p class="tx_ex">
				<span>사용 가능한 유효기간, 기준금액 등 사용조건을 꼭 확인해 보시기 바랍니다.</span>
				<span>결제 시 쿠폰을 선택하지 않으면, 할인금액이 적용되지 않으며 당사 사정에 의해 쿠폰조건이 변경될 수 있습니다.</span>
				<span>결제 시 쿠폰을 선택하지 않으면, 할인금액이 적용되지 않으며 당사 사정에 의해 쿠폰조건이 변경될 수 있습니다.</span>
			</p>
			<!-- 로그인 전 E -->
			</c:if>
			
			<c:if test="${commandMap.MEM_MST_MEM_GBN ne '683'}">
				<c:if test="${not empty userInfo }">
			<!-- 로그인 후 S -->
			<div class="login_box2">
				<p>
					<c:set var="lev" value="" />
					<c:choose>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1833' }">
							<c:set var="lev" value="ico_lv_5" />
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1834' }">
							<c:set var="lev" value="ico_lv_4" />
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1835' }">
							<c:set var="lev" value="ico_lv_3" />
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1836' }">
							<c:set var="lev" value="ico_lv_2" />
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1837' }">
							<c:set var="lev" value="ico_lv_1" />
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1838' }">
							<c:set var="lev" value="" />
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GRD eq '1839' }">
							<c:set var="lev" value="" />
						</c:when>
						<c:otherwise>
							<c:set var="lev" value="" />
						</c:otherwise>
					</c:choose>
					<!--
						ico_lv_1  = platinum
						ico_lv_2 = vip
						ico_lv_3 = gold
						ico_lv_4 = silver
						ico_lv_5 = red
					-->
					<i class="<c:out value="${lev }" />"><span class="ir"><c:out value="${userInfo.MEM_MST_MEM_GRD_NM }" /> 등급 아이콘</span></i>
					<span>회원등급별 혜택</span>
					<c:choose>
						<c:when test="${userInfo.MEM_MST_MEM_GBN eq '682' }">
							<span><strong><c:out value="${userInfo.MEM_MST_MEM_NM }" /></strong>님의 <strong><c:out value="${userInfo.MEM_MST_MEM_GRD_NM }" /> 등급</strong> 쿠폰입니다.</span>
						</c:when>
						<c:when test="${userInfo.MEM_MST_MEM_GBN eq '1961' }">
							<span><strong><c:out value="${userInfo.MEM_MST_MEM_NM }" /></strong>님의 <strong>간편회원</strong> 쿠폰입니다.</span>
						</c:when>
					</c:choose>
					
				</p>
			</div>
			<!--// 로그인 후 E -->
			
			<!-- .coupon_list1 S -->
			<c:if test="${not empty topList}">
			<div class="coupon_list1">
				<strong class="tx_ti">사용 가능한 쿠폰</strong>
				
				<div class="list" id="list">
					<c:forEach items="${topList }" var="topRow" varStatus="topSta">
						<c:if test="${topRow.CPN_MST_GBN ne 'F' }">
						<c:choose>
							<c:when test="${topRow.CPN_MST_SAL_GBN eq 'A' }">
								<dl>
									<dt>
										<p class="bg_coupon_a">
											<strong class="tx_num"><c:out value="${topRow.CPN_MST_SAL_PRC }" /><span>%</span></strong>
											<strong class="tx">할인쿠폰</strong>
										</p>
									</dt>
									<dd>
										<strong class="tx_ti"><c:out value="${topRow.CPN_MST_TITLE }" /></strong>
										<span class="tx_sub"><fmt:formatNumber value="${topRow.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</span>
										<div class="btn_d">
											<c:if test="${topRow.CPN_MST_TGT_GBN eq 'A' }">
												<a href="javascript:goSetCouponPopup('1','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_wht"><strong>적용상품보기</strong></a>
											</c:if>
											<c:if test="${topRow.CPN_MST_TGT_GBN eq 'B' }">
												<a href="javascript:void(0)" class="btn_w_ev"><span>전체상품</span></a>
											</c:if>
											<c:if test="${topRow.CPN_MST_TGT_GBN eq 'C' }">
												<a href="javascript:goSetCouponPopup('2','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_wht"><span>적용브랜드보기</span></a>
											</c:if>
											<c:if test="${topRow.CPN_MST_TGT_GBN eq 'D' }">
												<a href="javascript:goSetCouponPopup('3','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_wht"><span>적용기획전보기</span></a>
											</c:if>
										</div>
									</dd>
								</dl>
							</c:when>
							<c:when test="${topRow.CPN_MST_SAL_GBN eq 'B' }">
							<dl>
								<dt>
									<p class="bg_coupon_b">
										<strong class="tx_num"><fmt:formatNumber value="${topRow.CPN_MST_SAL_PRC }" groupingUsed="true" /><span>원</span></strong>
										<strong class="tx">할인쿠폰</strong>
									</p>
								</dt>
								<dd>
									<strong class="tx_ti"><c:out value="${topRow.CPN_MST_TITLE }" /></strong>
									<span class="tx_sub"><fmt:formatNumber value="${topRow.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</span>
									<div class="btn_d">
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'A' }">
											<a href="javascript:goSetCouponPopup('1','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_wht"><strong>적용상품보기</strong></a>
										</c:if>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'B' }">
											<a href="javascript:void(0)" class="btn_wht"><span>전체상품</span></a>
										</c:if>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'C' }">
											<a href="javascript:goSetCouponPopup('2','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_wht"><span>적용브랜드보기</span></a>
										</c:if>
										<c:if test="${topRow.CPN_MST_TGT_GBN eq 'D' }">
											<a href="javascript:goSetCouponPopup('3','<c:out value="${topRow.CPN_MST_IDX }" />');" class="btn_wht"><span>적용기획전보기</span></a>
										</c:if>
									</div>
								</dd>
							</dl>					
							</c:when>
						</c:choose>
						</c:if>
					</c:forEach>
				</div>
			</div>
			</c:if>
			<!--// .coupon_list1 E -->
			<!-- .coupon_list2 S -->
				</c:if>
			</c:if>				
			
			<c:if test="${not empty list }" >
			<div class=coupon_list1>
				<strong class="tx_ti">진행중인  쿠폰</strong>
				
				<div class="list" id="list2">
					<c:forEach items="${list }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${row.CPN_MST_SAL_GBN eq 'A' }">
								<dl>
									<dt>
										<p class="bg_coupon_a">
											<strong class="tx_num"><c:out value="${row.CPN_MST_SAL_PRC }" /><span>%</span></strong>
											<strong class="tx">할인쿠폰</strong>
										</p>
									</dt>
									<dd>
										<strong class="tx_ti"><c:out value="${row.CPN_MST_TITLE }" /></strong>
										<span class="tx_sub"><fmt:formatNumber value="${row.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</span>
										<div class="btn_d">
											<c:if test="${row.CPN_MST_TGT_GBN eq 'A' }">
												<a href="javascript:goSetCouponPopup('1','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_wht"><strong>적용상품보기</strong></a>
											</c:if>
											<c:if test="${row.CPN_MST_TGT_GBN eq 'B' }">
												<a href="javascript:void(0)" class="btn_w_ev"><span>전체상품</span></a>
											</c:if>
											<c:if test="${row.CPN_MST_TGT_GBN eq 'C' }">
												<a href="javascript:goSetCouponPopup('2','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_wht"><span>적용브랜드보기</span></a>
											</c:if>
											<c:if test="${row.CPN_MST_TGT_GBN eq 'D' }">
												<a href="javascript:goSetCouponPopup('3','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_wht"><span>적용기획전보기</span></a>
											</c:if>
										</div>
									</dd>
								</dl>
							</c:when>
							<c:when test="${row.CPN_MST_SAL_GBN eq 'B' }">
							<dl>
								<dt>
									<p class="bg_coupon_b">
										<strong class="tx_num"><fmt:formatNumber value="${row.CPN_MST_SAL_PRC }" groupingUsed="true" /><span>원</span></strong>
										<strong class="tx">할인쿠폰</strong>
									</p>
								</dt>
								<dd>
									<strong class="tx_ti"><c:out value="${row.CPN_MST_TITLE }" /></strong>
									<span class="tx_sub"><fmt:formatNumber value="${row.CPN_MST_SML_PRC }" groupingUsed="true" />원 이상 구매시</span>
									<div class="btn_d">
										<c:if test="${row.CPN_MST_TGT_GBN eq 'A' }">
											<a href="javascript:goSetCouponPopup('1','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_wht"><strong>적용상품보기</strong></a>
										</c:if>
										<c:if test="${row.CPN_MST_TGT_GBN eq 'B' }">
											<a href="javascript:void(0)" class="btn_wht"><span>전체상품</span></a>
										</c:if>
										<c:if test="${row.CPN_MST_TGT_GBN eq 'C' }">
											<a href="javascript:goSetCouponPopup('2','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_wht"><span>적용브랜드보기</span></a>
										</c:if>
										<c:if test="${row.CPN_MST_TGT_GBN eq 'D' }">
											<a href="javascript:goSetCouponPopup('3','<c:out value="${row.CPN_MST_IDX }" />');" class="btn_wht"><span>적용기획전보기</span></a>
										</c:if>
									</div>
								</dd>
							</dl>					
							</c:when>
						</c:choose>
					</dl>
					</c:forEach>
				</div>
			</div>
			<!--// .coupon_list2 E -->
			</c:if>
			
			<div class="coupon_txEx">
				<p class="tx_ex2">
					<span>사용 가능한 유효기간, 기준금액 등 사용조건을 꼭 확인해 보시기 바랍니다.</span>
					<span>결제 시 쿠폰을 선택하지 않으면, 할인금액이 적용되지 않으며 당사 사정에 의해 쿠폰조건이 변경될 수 있습니다.</span>
					<span>발급된 쿠폰은 마이페이지>쇼핑혜택>쿠폰에서 확인하실 수 있습니다.</span>
				</p>
			</div>
			
		</section>
		<!--// .event_con_d E -->
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<form id="popFrm" name="popFrm">
<input type="hidden" name="cPage" id="cPage" value="1"/>
<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value=""/>
</form>
<script>
$(document).ready(function(){
	$.com.util.tab($('.tab_st2 .tab_mn'), 0);
});

	goSetCouponPopup = function(setGu,cpnMstIdx){
    	var url = "";
    	switch(setGu){
    		case '1' : url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponProductPopup.do";
    				   break;
    		case '2' : url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponBrandPopup.do";
    				   break;
    		case '3' : url = "<c:out value="${mobileDomain}"/>/mobile/mypage/myCouponPlanPopup.do";
    				   break;
    	}
    	$("#cPage").val(1)
		$("#CPN_MST_IDX").val(cpnMstIdx);    	
 		$("#popFrm").attr({"action":url, "target":"_self", "method":"post"}).submit();
    };
    
    goLogin		= function(){
    	var url = location.href;
		
		if(appType){
			callJavascriptLoginUrl(url); //app 로그인 연동
		}else{
			url = encodeURIComponent(url);
        	location.target = "_self";
        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
		}
    };
</script>