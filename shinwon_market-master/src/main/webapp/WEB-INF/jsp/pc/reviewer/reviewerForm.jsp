<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>쑈윈도 | 리뷰어 신청</title>

<!-- Content -->
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <div class="location">
                <ol class="clearboth">
                    <li><a href="#" class="home">홈</a></li>
                    <li class="active">
                        <a href="#">1Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">1Depth Menu 01</a></li>
                            <li><a href="#">1Depth Menu 02</a></li>
                            <li><a href="#">1Depth Menu 03</a></li>
                            <li><a href="#">1Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">2Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">2Depth Menu 01</a></li>
                            <li><a href="#">2Depth Menu 02</a></li>
                            <li><a href="#">2Depth Menu 03</a></li>
                            <li><a href="#">2Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">3Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">3Depth Menu 01</a></li>
                            <li><a href="#">3Depth Menu 02</a></li>
                            <li><a href="#">3Depth Menu 03</a></li>
                            <li><a href="#">3Depth Menu 04</a></li>
                        </ul>
                    </li>
                </ol>
            </div>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">리뷰어 신청</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<p class="reviewer_apply">신청정보입력</p>
				<div class="table_wrap reviewer_apply_tb">
					<table class="tb_row">
						<caption>리뷰어 신청정보입력 ; 신청사유, 참고url, 상품 수령 주소 정보를 제공.</caption>
						<colgroup>
							<col style="width:190px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 신청사유</th>
								<td><textarea title="신청사유입력" placeholder="신청사유입력"></textarea></td>
							</tr>
							<tr>
								<th scope="row">참고 url</th>
								<td>
									<div class="url_inp">
										<input type="text" name="txt" class="w800" placeholder="url 입력"> <input type="button" class="btnAdd btn_large ok w145" value="추가"></br/>
									</div>
									<p class="url_info">당첨자 선정에 도움이 될 수 있는 사이트(SNS, 블로그 등)의 url 정보를 입력해 주세요.</p>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 상품수령주소</th>
								<td>
									<div class="address_inp">
										<input type="text" name="txt" class="w340" placeholder="우편번호를 검색하세요."> <button class="btn_large zip_code_btn w140">우편번호 찾기</button><br/>
										<input type="text" name="txt" class="w100p" placeholder="도로명 주소"><br />
										<input type="text" name="txt" class="w100p" placeholder="지번주소"><br />
										<input type="text" name="txt" class="w100p" placeholder="이하 주소">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="apply_info">
						<p class="info_tit">꼭 읽어주세요!</p>
						<ul class="ul_dot">
							<li>당첨자로 선정되어 작성하신 리뷰는 쑈윈도의 마케팅 목적으로 활용될 수 있습니다.</li>
							<li>작성기한 내 리뷰 작성이 완료되지 않으면 제품 회수 및 금액을 청구할 수 있습니다.</li>
							<li>리뷰의 내용은 상품의 특성 고려한 정보 구성과 솔직한 체험 내용으로 구성해야 합니다.</li>
							<li>성의 없는 리뷰어 신청과 후기 작성은 이후 당첨자 선정에 영향을 줄 수 있습니다.</li>
						</ul>
					</div>
				</div>

				<div class="btn_wrap">
					<button class="btn_large">취소</button>
					<button class="btn_large ok">신청</button>
				</div>
			</div>
		</div>
	</div>
	<!--// Content -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>


<script>
	 $(document).ready (function () {
				 $('.btnAdd').click (function () {
						 $('.url_inp').append (
								 '<input type="text" name="txt" class="w800 remove_inp" placeholder="url 입력"> <input type="button" class="btnRemove btn_large w145" value="삭제"><br />'
						 ); // end append
						 $('.btnRemove').on('click', function () {
								 $(this).prev().remove (); // remove the textbox
								 $(this).next ().remove (); // remove the <br>
								 $(this).remove (); // remove the button
						 });
				 }); // end click
		 }); // end ready
	</script>