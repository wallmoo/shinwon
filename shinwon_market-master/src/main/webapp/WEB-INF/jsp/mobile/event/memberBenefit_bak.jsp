<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>회원혜택</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .event_con_d S -->
		<section class="event_con_d">
			
			<%@ include file="/WEB-INF/jsp/mobile/event/eventMenuInclude.jsp" %>
			
			<dl class="memClass_d">
				<dt class="dt_ti">
					<strong class="tx_ti">회원등급기준</strong>
					<c:if test="${empty commandMap.MEM_ID }">
					<a href="javascript:void(0);" class="btn_gre"><strong>회원가입</strong></a>
					</c:if>
				</dt>
				<dd class="dd_con">
					<p class="tx_ex2">
						<span>최근 3개월간의 이용내역을 반영하여 매월 1일 새로운 회원등급이 부여됩니다.</span>
						<span>주문 취소/반품은 익월 반영됩니다.</span>
					</p>
					<table class="table_st0 ico_lv">
						<caption>회원등급기준에 회원등급, 구매금액별로 구성된 등급 안내표</caption>
						<colgroup>
							<col style="width:50%" />
							<col style="width:50%" />
						</colgroup>
						<thead>
							<tr>
								<th>회원등급</th>
								<th>구매금액별</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><i class="ico_lv_1"></i>PLATINUM</th>
								<td>100만원이상</td>
							</tr>
							<tr>
								<th><i class="ico_lv_2"></i>VIP</th>
								<td>50~100만원</td>
							</tr>
							<tr>
								<th><i class="ico_lv_3"></i>GOLD</th>
								<td>30~50만원</td>
							</tr>
							<tr>
								<th><i class="ico_lv_4"></i>SILVER</th>
								<td>1~30만원</td>
							</tr>
							<tr>
								<th><i class="ico_lv_5"></i>RED</th>
								<td>신규가입회원&미구매 고객</td>
							</tr>
						</tbody>
					</table>
				</dd>
				<dt class="dt_ti"><strong class="tx_ti">회원등급별 혜택</strong></dt>
				<dd class="dd_con">
					<p class="tx_ex2">
						<span>최근 3개월간의 이용내역을 반영하여 매월 1일 새로운 회원등급이 부여됩니다.</span> 
						<span>쿠폰 유효기간은 1개월이며 매월 1일 오전 6시 이후부터 사용 가능합니다.</span>						 
						<span>기프트는 12개월 중 6개월 이상 등급 유지 시 제공됩니다. <br/>
						(PLATINUM, VIP 등급에 한함)</span>						 
						<span>주문/취소/반품 내역은 익월 등급에 반영됩니다.</span>
					</p>

					<!-- .tab_st2 S -->
					<dl class="tab_st2">
						<dt class="ui-grid-d tab_mn">
							<a href="javascript:void(0);" class="ui-block-a on" data-tabcon="platinum_con"><strong>PLATINUM</strong></a>
							<a href="javascript:void(0);" class=" ui-block-b" data-tabcon="vip_con"><strong>VIP</strong></a>
							<a href="javascript:void(0);" class="ui-block-c" data-tabcon="gold_con"><strong>GOLD</strong></a>
							<a href="javascript:void(0);" class=" ui-block-d" data-tabcon="silver_con"><strong>SILVER</strong></a>
							<a href="javascript:void(0);" class="ui-block-e" data-tabcon="red_con"><strong>RED</strong></a>
						</dt>
						<!-- #platinum_con S -->
						<dd id="platinum_con" class="tab_con">
							<table class="table_st1">
								<caption>회원등급별 혜택에 PLATINUM등급 혜택안내 표</caption>
								<colgroup>
									<col style="width:85px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>등급별<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">5</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">5만원 이상 구매시</strong>
												<span class="tx_sub">최대 3천원</span>
												<span class="tx_ex">(무적쿠폰 5장)</span>
											</div>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">7</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">10만원 이상 구매시</strong>
												<span class="tx_sub">최대 1만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
											<div class="cpupon_box">
												<p class="bg_coupon_b">
													<strong class="tx">무료배송</strong>
												</p>
												<strong class="tx_ti">마켓플랜트 배송 한정</strong>
												<strong class="tx_ex">(1장)</strong>
											</div>
										</td>
									</tr>
									<tr>
										<th>생일 축하<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">10</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">50만원 이상 구매시</strong>
												<span class="tx_sub">최대 10만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>포인트<br/>(구매시 <br/>적립률)</th>
										<td>
											<div class="point_box">
												<i class="ico_m"><span class="ir">포인트 아이콘</span></i>
												<strong class="tx_ti">0.5% 적립</strong>
											</div>
										</td>
									</tr>
									<tr>
										<th>기프트</th>
										<td>
											<div class="point_box">
												<i class="ico_a"><span class="ir">기프트 아이콘</span></i>
												<strong class="tx_ti">A등급 기프트</strong>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
						<!--// #platinum_con E -->
						<!-- #vip_con S -->
						<dd id="vip_con" class="tab_con">
							<table class="table_st1">
								<caption>회원등급별 혜택에 VIP등급 혜택안내 표</caption>
								<colgroup>
									<col style="width:85px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>등급별<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">5</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">5만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 3천원</span>
												<span class="tx_ex">(무적쿠폰 5장)</span>
											</div>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">7</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">10만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 1만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
											<div class="cpupon_box">
												<p class="bg_coupon_b">
													<strong class="tx">무료배송</strong>
												</p>
												<strong class="tx_ti">마켓플랜트 배송 한정</strong>
												<strong class="tx_ex">(1장)</strong>
											</div>
										</td>
									</tr>
									<tr>
										<th>생일 축하<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">10</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">40만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 8만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>포인트<br/>(구매시 <br/>적립률)</th>
										<td>
											<div class="point_box">
												<i class="ico_m"><span class="ir">포인트 아이콘</span></i>
												<strong class="tx_ti">0.4% 적립</strong>
											</div>
										</td>
									</tr>
									<tr>
										<th>기프트</th>
										<td>
											<div class="point_box">
												<i class="ico_b"><span class="ir">기프트 아이콘</span></i>
												<strong class="tx_ti">B등급 기프트</strong>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
						<!--// #vip_con E -->
						<!-- #gold_con S -->
						<dd id="gold_con" class="tab_con">
							<table class="table_st1">
								<caption>회원등급별 혜택에 GOLD등급 혜택안내 표</caption>
								<colgroup>
									<col style="width:85px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>등급별<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">5</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">5만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 3천원</span>
												<span class="tx_ex">(무적쿠폰 3장)</span>
											</div>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">7</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">10만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 1만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
											<div class="cpupon_box">
												<p class="bg_coupon_b">
													<strong class="tx">무료배송</strong>
												</p>
												<strong class="tx_ti">마켓플랜트 배송 한정</strong>
												<strong class="tx_ex">(1장)</strong>
											</div>
										</td>
									</tr>
									<tr>
										<th>생일 축하<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">10</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">30만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 5만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>포인트<br/>(구매시 <br/>적립률)</th>
										<td>
											<div class="point_box">
												<i class="ico_m"><span class="ir">포인트 아이콘</span></i>
												<strong class="tx_ti">0.3% 적립</strong>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
						<!--// #gold_con E -->
						<!-- #silver_con S -->
						<dd id="silver_con" class="tab_con">
							<table class="table_st1">
								<caption>회원등급별 혜택에 SILVER등급 혜택안내 표</caption>
								<colgroup>
									<col style="width:85px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>등급별<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">5</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">5만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 3천원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>생일 축하<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">10</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">20만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 3만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>포인트<br/>(구매시 <br/>적립률)</th>
										<td>
											<div class="point_box">
												<i class="ico_m"><span class="ir">포인트 아이콘</span></i>
												<strong class="tx_ti">0.24% 적립</strong>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
						<!--// #silver_con E -->
						<!-- #red_con S -->
						<dd id="red_con" class="tab_con">
							<table class="table_st1">
								<caption>회원등급별 혜택에 RED등급 혜택안내 표</caption>
								<colgroup>
									<col style="width:85px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>등급별<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">5</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">5만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 3천원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>생일 축하<br/>무적쿠폰</th>
										<td>
											<div class="cpupon_box">
												<p class="bg_coupon_a">
													<strong class="tx_num">10</strong>
													<strong class="tx">%할인</strong>
												</p>
												<strong class="tx_ti">10만원 이상 구매시</strong>
												<span class="co_blu tx_sub">최대 2만원</span>
												<span class="tx_ex">(무적쿠폰 1장)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>포인트<br/>(구매시 <br/>적립률)</th>
										<td>
											<div class="point_box">
												<i class="ico_m"><span class="ir">포인트 아이콘</span></i>
												<strong class="tx_ti">0.24% 적립</strong>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
						<!--// #red_con E -->
					</dl>
					<!--// .tab_st2 E -->

				</dd>
			</dl>

			
			
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
<script>
$(document).ready(function(){
	$.com.util.tab($('.tab_st2 .tab_mn'), 0);
});

</script>