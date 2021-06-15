<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">교환 상세</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/mypageTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>교환 상세조회 : 주문번호, 주문일 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%;">
							<col>
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td>123456789A</td>
								<th scope="row">주문일</th>
								<td>2019-10-01</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">주문상품 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>주문상품 정보 : 상품정보, 상품금액, 배송비, 판매자명, 진행상태 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:10%;">
							<col style="width:16%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">교환 사이즈</th>
								<th scope="col">상품금액</th>
								<th scope="col">배송비</th>
								<th scope="col">판매자명</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
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
								<td>100</td>
								<td>
									<span class="r_price">102,500원</span>
									<span class="s_price">95,000원</span>
								</td>
								<td rowspan="2">무료배송</td>
								<td rowspan="2">신원</td>
								<td>
									<span class="order_state">교환대기중</span>
									<a href="#" class="btn order cancel">교환접수취소</a>
								</td>
							</tr>
							<tr>
								<td>
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
								<td>80</td>
								<td>
									<span class="s_price">83,300 원</span>
								</td>
								<td>
									<span class="order_state">교환배송중</span>
									<span class="order_delivery">(CJ택배/<a href="#n" class="btn_txt">123456789A</a>)</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">교환 신청 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>교환 신청 정보 : 신청일, 사유, 교환 방법, 반품 수거지, 교환 배송지, 교환 배송비 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">신청일</th>
								<td>2019-10-01</td>
							</tr>
							<tr>
								<th scope="row">사유</th>
								<td><strong class="t_tit">단순변심</strong>상세 사유 내용은 없고, 교환해주세요.</td>
							</tr>
							<tr>
								<th scope="row">교환 방법</th>
								<td>자동 수거</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">반품 수거지</th>
								<td>
									<ul class="t_info">
										<li><strong class="t_tit">홍길동</strong></li>
										<li>010-1234-5478</li>
										<li>02-123-4567</li>
										<li>[14043] 서울 광진구 경변북로 332, APT 1523-102</li>
										<li>[143-200] 서울 광진구 구의동 573, APT 1523-102</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>cj택배</dt>
										<dd>12345678cj</dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">교환 배송지</th>
								<td>
									<ul class="t_info">
										<li><strong class="t_tit">홍길동</strong></li>
										<li>010-1234-5478</li>
										<li>02-123-4567</li>
										<li>[14043] 서울 광진구 경변북로 332, APT 1523-102</li>
										<li>[143-200] 서울 광진구 구의동 573, APT 1523-102</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>cj택배</dt>
										<dd><a href="#n">12345678cj</a></dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row">교환 배송비</th>
								<td>
									<dl class="inf_detail">
										<dt>판매자 책임</dt>
										<dd><strong>0원</strong> (반송배송비 0원 + 교환배송비 0원)</dd>
									</dl>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 교환 신청 정보_교환 방법 선택별 화면 정의  -->
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>교환 신청 정보 : 신청일, 사유, 교환 방법, 반품지, 교환 배송지, 교환 배송비 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">신청일</th>
								<td>2019-10-01</td>
							</tr>
							<tr>
								<th scope="row">사유</th>
								<td><strong class="t_tit">단순변심</strong>상세 사유 내용은 없고, 교환해주세요.</td>
							</tr>
							<tr>
								<th scope="row">교환 방법</th>
								<td>직접 발송</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">반품지</th>
								<td>
									<ul class="t_info">
										<li><strong class="t_tit">신원</strong></li>
										<li>서울 마포구 독막로 328(도화동)</li>
										<li>1661-2585</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>cj택배</dt>
										<dd>12345678cj</dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">교환 배송지</th>
								<td>
									<ul class="t_info">
										<li><strong class="t_tit">홍길동</strong></li>
										<li>010-1234-5478</li>
										<li>02-123-4567</li>
										<li>[14043] 서울 광진구 경변북로 332, APT 1523-102</li>
										<li>[143-200] 서울 광진구 구의동 573, APT 1523-102</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>cj택배</dt>
										<dd><a href="#n">12345678cj</a></dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">교환 배송비</th>
								<td>
									<dl class="inf_detail">
										<dt>구매자 책임</dt>
										<dd><strong>5,000원</strong> (반송배송비 2,500원 + 교환배송비 2,500원)</dd>
										<dd>가상계좌(무통장입금) </dd>
									</dl>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>현금영수증</dt>
										<dd>개인소득공제용 (휴대폰번호 : 010-1234-5678)</dd>
									</dl>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>환불계좌정보</dt>
										<dd>국민은행 / 123456789012 / 홍길동</dd>
									</dl>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 교환 신청 정보_교환 방법, 교환배송비 케이스별 화면 정의  -->
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>교환 신청 정보 : 신청일, 사유, 교환 방법, 발송 정보, 교환 배송지, 교환 배송비 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">신청일</th>
								<td>2019-10-01</td>
							</tr>
							<tr>
								<th scope="row">사유</th>
								<td><strong class="t_tit">단순변심</strong>상세 사유 내용은 없고, 교환해주세요.</td>
							</tr>
							<tr>
								<th scope="row">교환 방법</th>
								<td>이미 발송</td>
							</tr>
							<tr>
								<th scope="row">발송 정보</th>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>cj택배</dt>
										<dd>12345678cj</dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">교환 배송지</th>
								<td>
									<ul class="t_info">
										<li><strong class="t_tit">홍길동</strong></li>
										<li>010-1234-5478</li>
										<li>02-123-4567</li>
										<li>[14043] 서울 광진구 경변북로 332, APT 1523-102</li>
										<li>[143-200] 서울 광진구 구의동 573, APT 1523-102</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="td_detail">
									<dl class="inf_detail">
										<dt>cj택배</dt>
										<dd><a href="#n">12345678cj</a></dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row">교환 배송비</th>
								<td>
									<dl class="inf_detail">
										<dt>구매자 책임</dt>
										<dd><strong>5,000원</strong> (반송배송비 2,500원 + 교환배송비 2,500원)</dd>
										<dd>쿠폰 사용 </dd>
									</dl>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap">
					<button type="button" class="btn_large">목록</button>
				</div>
			</div>
			<!-- //sub_content -->
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>