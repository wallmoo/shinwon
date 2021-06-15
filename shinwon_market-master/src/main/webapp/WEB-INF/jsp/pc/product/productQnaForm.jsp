<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="layer_modify" class="layer type03 is_btn">
		<div class="layer_header">
			<h2>상품문의 수정</h2>
		</div>
		<form id="modifyFrm" name="modifyFrm">
			<input type="hidden" id="BRD_INQ_IDX" name="BRD_INQ_IDX" value="<c:out value="${selectQnaInfo.BRD_INQ_IDX }" />">
			
			<div class="layer_content">
				<div class="table_wrap">
					<p class="required_txt"><span>필수입력사항</span></p>
					<table class="tb_row">
						<caption>회원가입 정보입력 : 이름, 생년월일, 성별, 아이디, 비밀번호, 비밀번호 확인, 닉네임, 휴대폰, 이메일, 이벤트 정보 수신, 제휴사 코드 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 제목
								</th>
								<td>
									<input type="text" id="BRD_INQ_TITLE" name="BRD_INQ_TITLE" placeholder="제목 입력" value="<c:out value="${selectQnaInfo.BRD_INQ_TITLE }" />" maxlength="50" class="w100p">
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 내용
								</th>
								<td>
									<div class="textarea_wrap">
										<textarea id="BRD_INQ_CONTENTS" name="BRD_INQ_CONTENTS" class="text_area" maxlength="2000" title="내용 입력"><ui:replaceLineBreak content="${selectQnaInfo.BRD_INQ_CONTENTS}"/></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">공개여부</th>
								<td>
									<span>
										<input type="checkbox" id="openStatus" name="openStatus" value="Y">
										<label for="openStatus">
											<span class="icon"></span>비공개
										</label>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //table_wrap -->
			</div>
		</form>
	<!-- //layer_content -->

	<div class="layer_footer">
		<div class="btn_wrap">
			<button type="button" class="btn_large gray under_close">취소</button>
			<button type="button" onclick="goModify()" class="btn_large purple">수정</button>
		</div>
	</div>
	<a href="#none" class="btn_layer_close">
		<em class="blind">레이어 닫기</em>
	</a>
	</div>


