<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">취소 상세</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/mypageTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>주문상세조회 : 주문번호, 주문일 출력 표입니다.</caption>
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
								<td>무료배송</td>
								<td>신원</td>
								<td>취소완료</td>
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
								<td>2,500 원</td>
								<td>row</td>
								<td>취소완료</td>
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
					<h3 class="con_tit">취소 신청 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>취소 신청 정보 : 신청일, 사유 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">신청일</th>
								<td>2019-10-01</td>
							</tr>
							<tr>
								<th scope="row">사유</th>
								<td><strong class="t_tit">구매의사 없음</strong>취소 상세 사유는없고, 취소 처리 해주세요. </td>
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
					<h3 class="con_tit">환불 계좌 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>환불 계좌 정보 : 은행명, 계좌번호, 예금주 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:30%">
							<col style="width:20%">
							<col style="width:30%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">은행명</th>
								<td>우리은행</td>
								<th scope="row">계좌번호</th>
								<td>1234567891235</td>
							</tr>
							<tr>
								<th scope="row">예금주</th>
								<td colspan="3">홍길동</td>
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