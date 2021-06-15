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
				<h2 class="pg_tit">주문/배송조회</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<div class="my_modify_top_wrap mb100">
					<div class="my_modify_top">
						<div class="personal_box clearboth">
							<div class="position_left">
								<div class="portrait">
									<img src="../../images/mypage/img_portrait.jpg" alt="개인화 이미지">
								</div>
							</div>
							<div class="position_right">
								<div class="txt_box">
									<span class="welcome">환영해요!</span>
									<span class="class"><em class="lato bold">Ariel</em> 님은 VIP 고객입니다.
									</span>
								</div>
								<div class="btn_box">
									<a href="#" class="btn" role="button">내정보수정</a>
									<a href="#" class="btn" role="button">등급별혜택</a>
								</div>
							</div>
						</div><!-- //personal_box -->
						<div class="tab_wrap">
								<ul class="tab n2">
								    <li><a href="#my_tab1">OOTD</a></li>
								    <li><a href="#my_tab2">My Shopping</a></li>
								</ul>
								<div class="tab_cont" id="my_tab1">
									<h4 class="blind">OOTD</h4>
									<div class="q_link_wrap">
										<ul class="clearboth">
											<li><a href="#">피드 관리</a></li>
											<li><a href="#">OOTD 관리</a></li>
											<li><a href="#">댓글 관리</a></li>
											<li><a href="#">좋아요 관리</a></li>
											<li><a href="#">이벤트 참여현황</a></li>
											<li><a href="#">상품 리뷰</a></li>
											<li><a href="#">재입고 알림</a></li>
											<li><a href="#">즐겨찾기 관리</a></li>
											<li><a href="#">상품문의</a></li>
											<li><a href="#">1:1문의</a></li>
										</ul>
									</div>
								</div>
								<!-- //tab1 -->
								<div class="tab_cont" id="my_tab2">
									<h4 class="blind">My Shopping</h4>
									<div class="q_link_wrap">
										<ul class="clearboth">
											<li><a href="#">주문/배송 조회</a></li>
											<li><a href="#">취소/교환/반품 현황</a></li>
											<li><a href="#">회원등급 및 혜택</a></li>
											<li><a href="#">포인트</a></li>
											<li><a href="#">할인쿠폰</a></li>
											<li><a href="#">마이핏 관리</a></li>
											<li><a href="#">회원정보 수정</a></li>
											<li><a href="#">배송지 관리</a></li>
											<li><a href="#">환불계좌 관리</a></li>
											<li><a href="#">회원탈퇴</a></li>
										</ul>
									</div>
								</div>
								<!-- //tab2 -->
						</div>
						<!-- //tab_wrap -->
					</div>
				</div>
				<!-- //my_modify_top_wrap -->
				<form method="post" name="frm" id="frm"		>
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
				<input type="hidden" name="ORD_MST_CD" value=""/>
				<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" />
				<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
                <input type="hidden" name="searchDlvGbn" value="<c:out value="${commandMap.searchDlvGbn }"/>"/>

				<div class="tab_wrap fix">
				    <ul class="tab n2">
				        <li		id="tab1"	 class="on" 		<c:if test="${commandMap.tabId == 'tab1' }" ></c:if>>
                        	<a href="#tab1"				onclick="moveTab('tab1');">배송상품 주문내역</a>
                        <li		id="tab2"			<c:if test="${commandMap.tabId == 'tab2' }" ></c:if>>
                        	<a href="#tab2"				onclick="moveTab('tab2');">매장수령 주문내역</a>	
				    </ul>
				    <div class="tab_cont" id="tab1">
				    	<h4 class="blind">배송상품 주문내역</h4>
				    	<div class="inquiry_date_wrap clearboth">
				    		<div class="month_inq">
				    			<strong class="tit">기간별 조회</strong>
				    			<span class="month_box clearboth">
				    				<span class="inline">
				    					<input type="radio" id="month1" name="month" value="1" class="inp_radio">
				    					<label for="month1" class="label">
											<em><i class="lato bold">1</i>개월</em>
				    					</label>
				    				</span>
									<span class="inline">
				    					<input type="radio" id="month3" name="month" value="3" class="inp_radio">
				    					<label for="month3" class="label">
				    						<em><i class="lato bold">3</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="month6" name="month" value="6" class="inp_radio">
				    					<label for="month6" class="label">
				    						<em><i class="lato bold">6</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="month12" name="month" value="12" class="inp_radio">
				    					<label for="month12" class="label">
				    						<em><i class="lato bold">12</i>개월</em>
				    					</label>
				    				</span>
				    			</span>
				    		</div>
				    		<div class="day_inq">
				    			<strong class="tit">일자별 조회</strong>
				    			<span class="day_box">
				    				<span class="inline">
				    					<input type="text" id="beginning" class="inp_txt" title="조회 시작일 입력">
				    				</span>
				    				<span class="hyphen"> ~ </span>
				    				<span class="inline">
					    				<input type="text" id="finish" class="inp_txt" title="조회 종료일 입력">
					    			</span>
				    				<button type="button" class="btn inp_search">
				    					<em class="blind">검색하기</em>
				    				</button>
				    			</span>
				    		</div>
				    	</div>

				    	<script>
							$(function(){
								$.fn.datePic();
							});
						</script>

				    	<div class="table_wrap mb95">
							<table class="tb_col">
								<caption>주문/배송 조회 : 주문일, 주문번호, 상품정보, 상품금액, 진행상태 출력 표입니다.</caption>
								<colgroup>
									<col style="width:12%;">
									<col style="width:16%;">
									<col>
									<col style="width:15%;">
									<col style="width:16%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">주문일</th>
										<th scope="col">주문번호</th>
										<th scope="col">상품정보</th>
										<th scope="col">상품금액</th>
										<th scope="col">진행상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="3">2019-07-16</td>
										<td rowspan="3">
											<em class="order_num">123456789A</em>
											<a href="#" class="btn order view">주문상세보기</a>
											<a href="#" class="btn order cancel">전체주문취소</a>
										</td>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">배송중</span>
											<span class="order_delivery">(CJ택배/<a href="#n" class="btn_txt">123456789A</a>)</span>
											<a href="#" class="btn order confirm">구매확정</a>

											<!-- 케이스별 진행상태 -->
											<span class="order_state">입금대기</span>
											<span class="order_state">결제완료</span>
											<span class="order_state">배송준비중</span>
											<span class="order_state">배송보류</span>
											<span class="order_state">배송중</span>
											<span class="order_state">배송완료</span>
											<span class="order_state">구매확정</span>
											<span class="order_delivery">(CJ택배/<a href="#n" class="btn_txt">123456789A</a>)</span>
											<a href="#" class="btn order cancel">주문취소</a>
											<a href="#" class="btn order confirm">구매확정</a>
											<a href="#" class="btn order confirm">교환신청</a>
											<a href="#" class="btn order confirm">반품신청</a>
											<a href="#" class="btn order review">상품후기</a>
											<a href="#" class="btn order review">후기보기</a>
										</td>
									</tr>
									<tr>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">배송완료</span>
											<span class="order_delivery">(CJ택배/<a href="#n" class="btn_txt">123456789A</a>)</span>
											<a href="#" class="btn order confirm">구매확정</a>
										</td>
									</tr>
									<tr>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">구매확정</span>
											<a href="#" class="btn order review">상품후기</a>
										</td>
									</tr>
									<tr>
										<td>2019-07-16</td>
										<td>
											<em class="order_num">123456789A</em>
											<a href="#" class="btn order view">주문상세보기</a>
											<a href="#" class="btn order cancel">전체주문취소</a>
										</td>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">결제완료</span>
											<a href="#" class="btn order cancel">주문취소</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="pagination">
							<span class="img_arrow first">
								<em class="blind">첫 페이지로 이동</em>
							</span>
							<span class="img_arrow prev">
								<em class="blind">이전 페이지로 이동</em>
							</span>
							<a href="#" class="num on">1</a>
							<a href="#" class="num">2</a>
							<a href="#" class="num">3</a>
							<a href="#" class="num">4</a>
							<a href="#" class="num">5</a>
							<a href="#" class="num">6</a>
							<a href="#" class="num">7</a>
							<a href="#" class="num">8</a>
							<span class="img_arrow next">
								<em class="blind">다음 페이지로 이동</em>
							</span>
							<span class="img_arrow last">
								<em class="blind">마지막 페이지로 이동</em>
							</span>
						</div>
						<!-- //pagination -->

						<div class="step_attention_wp w6">
							<strong class="tit">배송상품 주문/배송 안내</strong>
							<ul>
								<li>
									<p class="step">STEP 01</p>
									<p class="title">입금대기</p>
									<p class="txt">입금이 아직 이뤄지지<br>않았습니다.<br>3일 이내 미 입금시 <br>주문이 자동 취소됩니다. </p>
								</li>
								<li>
									<p class="step">STEP 02</p>
									<p class="title">결제완료</p>
									<p class="txt">판매자가 <br>주문을 확인하기 전<br>입니다. </p>
									<p class="cmt"><span>배송지 변경, 주문취소 가능</span></p>
								</li>
								<li>
									<p class="step">STEP 03</p>
									<p class="title">배송준비중</p>
									<p class="txt">주문하신 <br>상품을 준비 중<br>입니다. </p>
								</li>
								<li>
									<p class="step">STEP 04</p>
									<p class="title">배송중</p>
									<p class="txt">상품이 발송되어<br>고객님께 배송 중<br>입니다.</p>
								</li>
								<li>
									<p class="step">STEP 05</p>
									<p class="title">배송완료</p>
									<p class="txt">상품이<br>고객님께 도착<br>하였습니다. </p>
									<p class="cmt"><span>교환/반품 가능</span></p>
								</li>
								<li>
									<p class="step">STEP 06</p>
									<p class="title">구매확정</p>
									<p class="txt">상품수령 후<br>구매확정을 선택하시면<br>거래가 종료됩니다.<br>배송완료 이후<br>14일 지나면 자동으로 <br>구매확정 됩니다.</p>
									<p class="cmt"><span>상품후기 작성 가능<br>(교환/반품 불가)</span></p>
								</li>
							</ul>
						</div>
						<!-- <div class="attention_list_wrap mt95">
							<strong class="tit">유의사항</strong>
							<ul>
								<li>[주문상세보기]를 클릭하시면 주문상세내역 및 배송조회를 확인할 수 있습니다.</li>
								<li>결제 전 상태에서는 모든 주문건 취소가 가능하며, 출고 완료된 상품은 반품메뉴를 이용하시기 바랍니다.</li>
								<li>상품 일부만 취소/교환/반품을 원하시는 경우 1:1 문의 또는 고객센터(1661-2585)로 문의 부탁드립니다.</li>
								<li>배송처리 이후 14일이 경과되면 자동 구매확정 처리 되며 교환/반품이 불가능합니다.</li>
								<li>상품하자 또는 오배송으로 인한 교환/반품 신청은 1:1 문의 또는 고객센터(1661-2585)로 문의 부탁드립니다.</li>
								<li>가상계좌 결제주문의 경우, 환불금액 입금이 3-4일정도 소요됩니다. (영업일기준)</li>
							</ul>
						</div> -->



				    </div>
				    <!-- //tab1 -->
				    <div class="tab_cont" id="tab2">
				    	<h4 class="blind">매장수령 주문내역</h4>
				    	<div class="inquiry_date_wrap clearboth">
				    		<div class="month_inq">
				    			<strong class="tit">기간별 조회</strong>
				    			<span class="month_box clearboth">
				    				<span class="inline">
				    					<input type="radio" id="month1-1" name="month-2" class="inp_radio">
				    					<label for="month1-1" class="label">
				    						<em><i class="lato bold">1</i>개월</em>
				    					</label>
				    				</span>
									<span class="inline">
				    					<input type="radio" id="month3-3" name="month-2" class="inp_radio">
				    					<label for="month3-3" class="label">
				    						<em><i class="lato bold">3</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="month6-6" name="month-2" class="inp_radio">
				    					<label for="month6-6" class="label">
				    						<em><i class="lato bold">6</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="month12-12" name="month-2" class="inp_radio">
				    					<label for="month12-12" class="label">
				    						<em><i class="lato bold">12</i>개월</em>
				    					</label>
				    				</span>
				    			</span>
				    		</div>
				    		<div class="day_inq">
				    			<strong class="tit">일자별 조회</strong>
				    			<span class="day_box">
				    				<span class="inline">
				    					<input type="text" id="beginning" class="inp_txt" title="조회 시작일 입력">
				    				</span>
				    				<span class="hyphen"> ~ </span>
				    				<span class="inline">
					    				<input type="text" id="finish" class="inp_txt" title="조회 종료일 입력">
					    			</span>
				    				<button type="button" class="btn inp_search">
				    					<em class="blind">검색하기</em>
				    				</button>
				    			</span>
				    		</div>
				    	</div>

				    	<script>
							$(function(){
								$.fn.datePic();
							});
						</script>

				    	<div class="table_wrap mb95">
							<table class="tb_col">
								<caption>주문/배송 조회 : 주문일, 주문번호, 상품정보, 상품금액, 진행상태 출력 표입니다.</caption>
								<colgroup>
									<col style="width:12%;">
									<col style="width:16%;">
									<col>
									<col style="width:15%;">
									<col style="width:16%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">주문일</th>
										<th scope="col">주문번호</th>
										<th scope="col">상품정보</th>
										<th scope="col">상품금액</th>
										<th scope="col">진행상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="2">2019-07-16</td>
										<td rowspan="2">
											<em class="order_num">123456789A</em>
											<a href="#" class="btn order view">주문상세보기</a>
											<a href="#" class="btn order cancel">전체주문취소</a>
										</td>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">상품준비완료</span>

											<!-- 케이스별 진행상태 -->
											<!-- <span class="order_state">입금대기</span>
											<span class="order_state">결제완료</span>
											<span class="order_state">상품준비중</span>
											<span class="order_state">매장수령</span>
											<span class="order_state">구매확정</span>
											<a href="#" class="btn order cancel">주문취소</a>
											<a href="#" class="btn order confirm">구매확정</a>
											<a href="#" class="btn order confirm">교환신청</a>
											<a href="#" class="btn order confirm">반품신청</a>
											<a href="#" class="btn order review">상품후기</a>
											<a href="#" class="btn order review">후기보기</a> -->
										</td>
									</tr>
									<tr>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">픽업완료</span>
											<span class="order_pickup">(2019-10-10)</span>
											<a href="#" class="btn order confirm">구매확정</a>
										</td>
									</tr>
									<tr>
										<td>2019-07-16</td>
										<td>
											<em class="order_num">123456789A</em>
											<a href="#" class="btn order view">주문상세보기</a>
											<a href="#" class="btn order cancel">전체주문취소</a>
										</td>
										<td class="left">
											<div class="product_info clearboth">
												<div class="img">
													<a href="#" class="product_thumb">
														<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
													</a>
												</div>
												<div class="txt">
													<span class="brand">[신원] VIKI</span>
													<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
													<span class="item_info">블랙 / 85 / 1개</span>
												</div>
											</div>
										</td>
										<td>92,500 원</td>
										<td>
											<span class="order_state">구매확정</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="pagination">
							<span class="img_arrow first">
								<em class="blind">첫 페이지로 이동</em>
							</span>
							<span class="img_arrow prev">
								<em class="blind">이전 페이지로 이동</em>
							</span>
							<a href="#" class="num on">1</a>
							<a href="#" class="num">2</a>
							<a href="#" class="num">3</a>
							<a href="#" class="num">4</a>
							<a href="#" class="num">5</a>
							<a href="#" class="num">6</a>
							<a href="#" class="num">7</a>
							<a href="#" class="num">8</a>
							<span class="img_arrow next">
								<em class="blind">다음 페이지로 이동</em>
							</span>
							<span class="img_arrow last">
								<em class="blind">마지막 페이지로 이동</em>
							</span>
						</div>
						<!-- //pagination -->

						<div class="step_attention_wp w5">
							<strong class="tit">매장수령 상품 주문/배송 안내</strong>
							<ul>
								<li>
									<p class="step">STEP 01</p>
									<p class="title">입금대기</p>
									<p class="txt">입금이 아직 이뤄지지<br>않았습니다.<br>3일 이내 미 입금시 <br>주문이 자동 취소됩니다. </p>
								</li>
								<li>
									<p class="step">STEP 02</p>
									<p class="title">결제완료</p>
									<p class="txt">판매자가 <br>주문을 확인하기 전<br>입니다. </p>
									<p class="cmt"><span>주문취소 가능</span></p>
								</li>
								<li>
									<p class="step">STEP 03</p>
									<p class="title">상품준비중</p>
									<p class="txt">주문하신 <br>상품을 준비 중<br>입니다. </p>
								</li>
								<li>
									<p class="step">STEP 04</p>
									<p class="title">매장수령</p>
									<p class="txt">매장에 고객님이 <br>방문하시어 상품을 <br>수령하였습니다.</p>
									<p class="cmt"><span>교환/반품 가능</span></p>
								</li>
								<li>
									<p class="step">STEP 05</p>
									<p class="title">구매확정</p>
									<p class="txt">상품수령 후<br>구매확정을 선택하시면<br>거래가 종료됩니다.<br>픽업완료 이후<br>14일 지나면 자동으로<br>구매확정 됩니다. </p>
									<p class="cmt"><span>상품후기 작성 가능<br>(교환/반품 불가)</span></p>
								</li>
							</ul>
						</div>
						<!-- <div class="attention_list_wrap mt95">
							<strong class="tit">유의사항</strong>
							<ul>
								<li>[주문상세보기]를 클릭하시면 주문상세내역 및 배송조회를 확인할 수 있습니다.</li>
								<li>결제 전 상태에서는 모든 주문건 취소가 가능하며, 출고 완료된 상품은 반품메뉴를 이용하시기 바랍니다.</li>
								<li>상품 일부만 취소/교환/반품을 원하시는 경우 1:1 문의 또는 고객센터(1661-2585)로 문의 부탁드립니다.</li>
								<li>배송처리 이후 14일이 경과되면 자동 구매확정 처리 되며 교환/반품이 불가능합니다.</li>
								<li>상품하자 또는 오배송으로 인한 교환/반품 신청은 1:1 문의 또는 고객센터(1661-2585)로 문의 부탁드립니다.</li>
								<li>가상계좌 결제주문의 경우, 환불금액 입금이 3-4일정도 소요됩니다. (영업일기준)</li>
							</ul>
						</div> -->


				    </div>
				    <!-- //tab2 -->
				</div>
				</form>
				<!-- //tab_wrap -->

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	<!--// Content -->
            
            
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>        

<script>
	moveTab = function (tabId) 
	{
		
		var $frm = $("#frm");
			$frm.find("input[name='cPage']").val(1);
			$frm.find("input[name='tabId']").val(tabId);
			
			
		var actionUrl = "";
		
		if(tabId == "tab1" ){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingList.do";
		}else if(tabId == "tab2"){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myOfflineShoppingList.do";
		}else{
			alert("올바르지 않은 접근입니다.");
			return false;
		}
	        
	    $frm.attr({"action":actionUrl, "target":"_self", "method":"get"}).submit();
	    
	};

</script>    