<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">댓글 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
			
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
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
						<caption>댓글 관리 정보 : 댓글, 등록일 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:16%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">댓글</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="left bb_none">
									<p class="tit_reply">와~ 저도 빨리 다이어트 성공해서 구매 해야겠어요!<br>
									혹시 구매하신 사이즈 정보 좀 알 수 있을까요?</p>
								</td>
								<td rowspan="2">2019-09-09<br>12:05:20</td>
							</tr>
							<tr>
								<td class="prod_link">
									<a href="#n" class="btn_prod">
										<span class="pro_img"><img src="/nas/cdn/PW/images/@temp/img_reply_prod_02.jpg" alt=""></span>
										<span class="pro_tit">오랜만에 OOTD!(feat. 여행가는 날)</span>
									</a>
								</td>
							</tr>
							<tr>
								<td class="left bb_none">
									<p class="tit_reply">55 사이즈에요! 참고로 157cm에 50kg 초반이에요 ^.^</p>
								</td>
								<td rowspan="2">2019-09-09<br>12:05:20</td>
							</tr>
							<tr>
								<td class="prod_link">
									<a href="#n" class="btn_prod">
										<span class="pro_img"><img src="/nas/cdn/PW/images/@temp/img_reply_prod_01.jpg" alt=""></span>
										<span class="pro_tit">여름 Dailylook</span>
									</a>
								</td>
							</tr>
							<tr>
								<td class="left bb_none">
									<p class="tit_reply">내가 좋아하는 블루체크!</p>
								</td>
								<td rowspan="2">2019-09-09<br>12:05:20</td>
							</tr>
							<tr>
								<td class="prod_link">
									<a href="#n" class="btn_prod">
										<span class="pro_img"><img src="/nas/cdn/PW/images/@temp/img_reply_prod_02.jpg" alt=""></span>
										<span class="pro_tit">심플 브이넥 스트라이프 자켓 내 스타일이 완성시켜주는 나만의 활용하는 팁</span>
									</a>
								</td>
							</tr>
							<tr>
								<td class="left bb_none">
									<p class="tit_reply">어쩜 옷도, 모델도 너무 이쁘네요!!</p>
								</td>
								<td rowspan="2">2019-09-09<br>12:05:20</td>
							</tr>
							<tr>
								<td class="prod_link">
									<a href="#n" class="btn_prod">
										<span class="pro_img"><img src="/nas/cdn/PW/images/@temp/img_reply_prod_01.jpg" alt=""></span>
										<span class="pro_tit">8월의 Christmas</span>
									</a>
								</td>
							</tr>
							<tr>
								<td class="left bb_none">
									<p class="tit_reply">와~ 저도 빨리 다이어트 성공해서 구매 해야겠다!<br>혹시 구매하신 사이즈 정보 좀 알 수 있을까요?</p>
								</td>
								<td rowspan="2">2019-09-09<br>12:05:20</td>
							</tr>
							<tr>
								<td class="prod_link">
									<a href="#n" class="btn_prod">
										<span class="pro_img"><img src="/nas/cdn/PW/images/@temp/img_reply_prod_02.jpg" alt=""></span>
										<span class="pro_tit">오랜만에 OOTD!(feat. 여행가는 날)</span>
									</a>
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

				<div class="attention_list_wrap mt95">
					<strong class="tit">유의사항</strong>
					<ul>
						<li>댓글 수정, 삭제는 등록하신 OOTD 컨텐츠 페이지에서 하실 수 있습니다.</li>
					</ul>
				</div>

			</div>
			<!-- //sub_content -->
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>