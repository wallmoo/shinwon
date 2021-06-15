<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">상품 리뷰 작성</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/mypageTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->


				<div class="top_review clearboth">
					<div class="img_area">
						<img src="/nas/cdn/PW/images/@temp/img_temp_pdt.jpg" alt="상품 이미지">
					</div>
					<div class="satisfy_area">
						<dl>
							<dt>[신원] VIKI</dt>
							<dd>플리츠 배색 니트 스커트 (TYSCI297)</dd>
							<dd class="detail">블랙 / 85 / 1개</dd>
						</dl>
					</div>
				</div>
				<!-- //top_review -->

				<div class="table_wrap">
					<p class="required_txt"><span>필수입력사항</span></p>
					<table class="tb_row">
						<caption>리뷰작성 : 상품 평가, 만족도 평가, 내용, 사진첨부 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 상품 평가
								</th>
								<td class="satisfy_wp clearboth">
									<div class="satisfy_check fix clearboth">
										<button type="button" class="btn_satisfaction">
											<em class="blind">만족도</em>
										</button>
										<button type="button" class="btn_satisfaction">
											<em class="blind">만족도</em>
										</button>
										<button type="button" class="btn_satisfaction">
											<em class="blind">만족도</em>
										</button>
										<button type="button" class="btn_satisfaction">
											<em class="blind">만족도</em>
										</button>
										<button type="button" class="btn_satisfaction">
											<em class="blind">만족도</em>
										</button>
		    					</div>
		    					<span class="score purple"><strong>3.0</strong>점</span>
		    				</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 만족도 평가
								</th>
								<td>
									<dl class="satisfy_rdo clearboth">
										<dt>사이즈는 어떤가요?</dt>
										<dd>
											<input type="radio" id="r_size1" name="r_size">
											<label for="r_size1"><span class="icon"></span>작아요</label>
											<input type="radio" id="r_size2" name="r_size">
											<label for="r_size2"><span class="icon"></span>정사이즈예요</label>
											<input type="radio" id="r_size3" name="r_size">
											<label for="r_size3"><span class="icon"></span>커요</label>
										</dd>
									</dl>
									<dl class="satisfy_rdo clearboth">
										<dt>컬러는 어떤가요?</dt>
										<dd>
											<input type="radio" id="r_color1" name="r_color">
											<label for="r_color1"><span class="icon"></span>화면과 같아요</label>
											<input type="radio" id="r_color2" name="r_color">
											<label for="r_color2"><span class="icon"></span>화면과 달라요</label>
										</dd>
									</dl>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 내용
								</th>
								<td>
									<textarea title="내용입력"></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">사진첨부</th>
								<td>
									<div class="attachment_wrap">
										<input type="text" name="" value="" class="inp_txt" title="파일 첨부하기">
										<input type="file" id="attachment" class="inp_file">
										<label for="attachment" class="btn_attachment">파일 첨부하기</label>
										<span class="txt">
											첨부파일 형식 : <em>JPG, GIF</em>  /  용량 : <em>2MB</em> 이하
										</span>
									</div>
									<div class="attachment_write">
										<ul>
											<li>
												<span class="file_img"><img src="/nas/cdn/PW/images/@temp/img_temp_pdt.jpg" alt="상품 이미지"></span>
												<div class="file_write">
													<textarea title="사진 설명 입력" placeholder="사진의 설명을 입력해주세요.">옷 색상 완전 내스타일이쟈나쟈나~ </textarea>
												</div>
												<button type="button" class="btn_attach_delete">삭제</button>
											</li>
											<li>
												<span class="file_img"><img src="/nas/cdn/PW/images/@temp/img_temp_pdt.jpg" alt="상품 이미지"></span>
												<div class="file_write">
													<textarea title="사진 설명 입력" placeholder="사진의 설명을 입력해주세요."></textarea>
												</div>
												<button type="button" class="btn_attach_delete">삭제</button>
											</li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //table_wrap -->

				<div class="attention_list_wrap mt47">
					<ul>
						<li>구매한 상품과 관계가 없는 내용이나 비방성 글은 등록자에게 사전 동의 없이 임의로 삭제될 수 있습니다.</li>
						<li>배송, 상품문의는 마이페이지&gt;1:1 문의를 이용해주세요.</li>
					</ul>
				</div>

				<div class="btn_wrap">
					<button type="button" class="btn_large">취소</button>
					<button type="button" class="btn_large ok">등록</button>
				</div>

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>