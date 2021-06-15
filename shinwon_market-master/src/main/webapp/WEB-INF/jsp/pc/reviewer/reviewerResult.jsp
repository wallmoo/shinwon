<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>쑈윈도 | 리뷰어 신청완료</title>

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
				<h2 class="pg_tit">리뷰어 신청완료</h2>
			</div>
			<!--// Title -->

			<div class="sub_content reviewer_apply_end">
				<div class="reviewer_end">
					<p class="reviewer_end_context1"><span class="co_pink">리뷰어 신청</span>이 완료되었습니다.</p>
					<p class="reviewer_end_context2">리뷰어로 선정되면 회원님의 휴대폰으로 알림톡이 발송됩니다.</p>
				</div>
				<p class="reviewer_apply">리뷰어 신청정보</p>
				<div class="table_wrap reviewer_apply_tb">
					<table class="tb_row">
						<caption>리뷰어 신청완료 테이블 ; 당첨자 발표, 신청사유, 참고url, 상품수령주소에 대한 정보를 제공</caption>
						<colgroup>
							<col style="width:240px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">당첨자 발표</th>
								<td>2019-10-10</td>
							</tr>
							<tr>
								<th scope="row">신청사유</th>
								<td>
									<p>
										신청합니다!<br />꼼꼼후기 약속드려요! SONY A5100, Casnon Mark2 보유/동영상 촬영 가능<br />개인 유투브 채널도 운영하고 있습니다!
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row">참고url</th>
								<td class="url_link">
									<a href="#">www.naver.com</a><br />
									<a href="#">www.naver.com</a><br />
									<a href="#">www.naver.com</a>
								</td>
							</tr>
							<tr>
								<th scope="row">상품수령주소</th>
								<td>
									<p class="address1">[14043] 서울 광진구 경변북로 332, APT 1523-102</p>
									<p class="address2">[143-200] 서울 광진구 구의동 573, APT 1523-102</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap">
					<button class="btn_large ok">메인으로</button>
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