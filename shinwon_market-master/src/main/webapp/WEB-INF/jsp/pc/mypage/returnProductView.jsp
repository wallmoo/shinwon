<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">반품 상세</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/mypageTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>반품 상세조회 : 주문번호, 주문일 출력 표입니다.</caption>
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
								<td>
									<span class="r_price">102,500원</span>
									<span class="s_price">92,500원</span>
								</td>
								<td rowspan="2">무료배송</td>
								<td rowspan="2">신원</td>
								<td>
									<span class="order_state">결제완료</span>
									<a href="#" class="btn order cancel">주문취소</a>
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
								<td>
									<span class="s_price">83,300 원</span>
								</td>
								<td>
									<span class="order_state">반품배송중</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">사은품 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>사은품 정보 : 사은품 정보 출력 표입니다.</caption>
						<colgroup>
							<col style="width:100%;">
						</colgroup>
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
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">환불 정보</h3>
				</div>
				<div class="table_wrap payment mb95">
					<table class="tb_col">
						<caption>환불 정보 : 취소 주문금액, 차감금액, 환불금액, 환불포인트 출력 표입니다.</caption>
						<colgroup>
							<col style="width:290px;">
							<col style="width:290px;">
							<col style="width:310px;">
							<col style="width:*;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<p class="tit">취소 주문금액</p>
									<p class="price"><strong>102,500</strong> 원</p>
								</th>
								<th scope="col">
									<span class="minus">-</span>
									<p class="tit">차감금액</p>
									<p class="price"><strong>22,500</strong> 원</p>
								</th>
								<th scope="col" class="total">
									<span class="equal">=</span>
									<p class="tit">환불금액</p>
									<p class="price"><strong>63,000</strong> 원</p>
								</th>
								<th scope="col" class="total">
									<span class="plus">+</span>
									<p class="tit">환불포인트</p>
									<p class="price"><strong>17,000</strong> p</p>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<ul class="pay_detail">
										<li><span class="tit">취소 상품금액</span><span class="price">97,500 원</span></li>
										<li><span class="tit">취소 배송비</span><span class="price">2,500 원</span></li>
										<li><span class="tit">취소 도서산간 배송비</span><span class="price">2,500 원</span></li>
									</ul>
								</td>
								<td>
									<ul class="pay_detail">
										<li><span class="tit">즉시할인</span><span class="price">13,000 원</span></li>
										<li><span class="tit">제휴사할인</span><span class="price">2,500 원</span></li>
										<li><span class="tit">상품할인쿠폰</span><span class="price">2,500 원</span></li>
										<li><span class="tit">배송비쿠폰</span><span class="price">2,500 원</span></li>
										<li><span class="tit">프로모션 할인</span><span class="price">2,000 원</span></li>
									</ul>
								</td>
								<td>
									<ul class="pay_detail">
										<li><span class="tit">신용카드</span><span class="price">2,000 원</span></li>
									</ul>
								</td>
								<td>
									<ul class="pay_detail">
										<li><span class="tit">통합포인트</span><span class="price">2,000 p</span></li>
										<li><span class="tit">E포인트</span><span class="price">10,000 p</span></li>
										<li><span class="tit">임직원포인트</span><span class="price">5,000 p</span></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">반품 신청 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>반품 신청 정보 : 신청일, 사유, 반품 방법, 반품 수거지, 반품 배송비 출력 표입니다.</caption>
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
								<th scope="row">반품 방법</th>
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
								<th scope="row">반품 배송비</th>
								<td>
									<dl class="inf_detail">
										<dt>판매자 책임</dt>
										<dd><strong>0원</strong> (반송배송비 0원)</dd>
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