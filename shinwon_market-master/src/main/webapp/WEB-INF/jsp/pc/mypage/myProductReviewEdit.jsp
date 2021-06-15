<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">재입고 알림</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/mypageTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>재입고 알림 : 상품정보, 판매가, 신청일, 발송일, 알림현황, 선택 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:13%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
								<th scope="col">신청일</th>
								<th scope="col">발송일</th>
								<th scope="col">알림현황</th>
								<th scope="col">선택</th>
							</tr>
						</thead>
						<tbody>
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
										</div>
									</div>
								</td>
								<td>92,500원</td>
								<td>2019-09-22</td>
								<td>2019-09-22</td>
								<td>알림대기</td>
								<td>
									<button type="button" class="btn_delete">삭제</button>
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
										</div>
									</div>
								</td>
								<td>92,500원</td>
								<td>2019-09-22</td>
								<td>2019-09-22</td>
								<td>판매종료</td>
								<td>
									<button type="button" class="btn_delete">삭제</button>
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
										</div>
									</div>
								</td>
								<td>92,500원</td>
								<td>2019-09-22</td>
								<td>2019-09-22</td>
								<td>기간만료</td>
								<td>
									<button type="button" class="btn_delete">삭제</button>
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

				<div class="attention_list_wrap mt47">
					<ul>
						<li>신청 후 30일 내에 상품이 재입고되면 1회 알림이 발송됩니다.</li>
						<li>소량 입고되거나 동시 구매가 이루어질 경우 등 알림 후에도 품절이 발생할 수 있습니다.</li>
						<li>알림 신청 시의 상품 옵션 및 가격 등의 상품정보가 재입고 시 변동될 수 있습니다.</li>
						<li>알림 신청 후 30일이 지난 상품, 판매 종료된 상품은 알림이 불가능합니다.</li>
						<li>알림 내역에서 알림 삭제 시, 알림 신청이 취소됩니다.</li>
						<li>회원정보에 등록된 휴대폰 번호로 카카오 알림톡으로 안내드리며(혹은 SMS문자), 변경 희망 시 회원정보 수정 필요합니다.</li>
					</ul>
				</div>

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>