<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">
	<div class="modal"><!-- modal -->
		<div class="modal-wrapper"><!-- modal-wrapper -->
			<div class="modal-inner"><!-- modal-inner -->
				<h2 class="title"><span>상품등록</span></h2>
				<h3 class="title"><span>기본정보</span></h3>
				<form action="#" method="post" enctype="multipart/form-data">
					<fieldset>
						<legend></legend>
						<input type="hidden" name="">
					</fieldset>
				</form>
				<table class="table-row table-a">
					<caption>기본정보의 상품유형, 온라인상품코드, 상품명, 판매가능수량, 쿠폰적용여부, O2O여부, 네이버 쇼핑, 다음 쇼핑하우, 임직원 할인, 제휴사 할인, 시즌 정보, 성별, 포장, 등록일, 수정일을 알 수 있는 표 입니다.</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup>
					<tr>
						<th><label for="">상품유형<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<div class="tbl_line">
								<select name="" id="" class="select" disabled>
									<option value="" selected>일반</option>
								</select>
							</div>
							<p class="txt_warnning">(상품 등록 후에 수정이 불가능한 항목입니다.)</p>
						</td>
						<th><span>온라인상품코드</span></th>
						<td>시스템 자동생성</td>
					</tr>
					<tr>
						<th><label for="">상품명<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<div class="tbl_line">
								<input type="text" name="" id="" value="폭스 퍼 히든 버튼 덕다운 패딩 점퍼" class="text xlarge">
							</div>
							<p class="txt_warnning">(공백포함 최대 100자이내 입력)</p>
						</td>
						<th><label for="">판매가능수량<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<div class="tbl_line">
								<input type="text" name="" id="" value="546" class="number text"> 개
							</div>
							<p class="txt_warnning">(777 입력 시 수량 제한없음 처리)</p>
						</td>
					</tr>
					<tr>
						<th><span>상품품번</span></th>
						<td>ERP 자동생성</td>
						<th><span>등록일</span></th>
						<td>2019-02-26</td>
					</tr>
					<tr>
						<th><label for="">쿠폰적용여부</label></th>
						<td>
							<select name="" id="" class="select">
								<option value="">NO</option>
							</select>
						</td>
						<th><label for="">O2O여부<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select name="" id="" class="select">
								<option value="">NO</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="">네이버 쇼핑<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select name="" id="" class="select">
								<option value="" selected>연동안함</option>
							</select>
						</td>
						<th><label for="">다음 쇼핑하우<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select name="" id="" class="select">
								<option value="" selected>연동안함</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="">임직원 할인<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select name="" id="" class="select">
								<option value="" selected>NO</option>
							</select>
						</td>
						<th><label for="">제휴사 할인<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select name="" id="" class="select">
								<option value="" selected>NO</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="">시즌 정보<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<div class="tbl_line">
								<span>연도</span>
								<select name="" id="" class="select">
									<option value="" selected>2019</option>
								</select>
							</div>
							<div class="tbl_line">
								<span>시즌</span>
								<select name="" id="" class="select">
									<option value="" selected>F/W</option>
								</select>
							</div>
						</td>
						<th><label for="">성별</label></th>
						<td>
							<select name="" id="" class="select">
								<option value="" selected>여성</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="">포장<i class="require"><em>필수입력</em></i></label></th>
						<td colspan="3">
							<select name="" id="" class="select">
								<option value="" style=>NO</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><span>등록일</span></th>
						<td>김신원(MD) / 2019-12-01 12:11:05</td>
						<th><span>수정일</span></th>
						<td>김신원(MD) / 2019-12-01 12:11:05</td>
					</tr>
				</table>
				<h3 class="title"><span>상품가격</span></h3>
				<table class="table-row table-a">
					<caption>상품가격의 일반가(Tag가), 할인율, 판메가, 수수료, 수수료 기간을 알 수 있는 표 입니다.</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup>
					<tbody>
						<tr>
							<th><label for="">일반가(Tag가)<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<input type="text" name="" id="" value="990,500" class="text">
							</td>
							<th><label for="">할인율<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>정율(%)</option>
								</select>
								<input type="text" name="" id="" value="12" class="text">
							</td>
						</tr>
						<tr>
							<th><label for="">판메가</label></th>
							<td colspan="3">
								<input type="text" name="" id="" value="12" class="text" disabled>
							</td>
						</tr>
						<tr>
							<th><label for="">수수료</label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>브랜드 기본마진</option>
								</select>
								<input type="text" name="" id="" class="text" disabled> %
							</td>
							<th><label for="">수수료 기간</label></th>
							<td>
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
								<input type="text" class="text date" id="PRD_MST_FEE_ST_DT" name="PRD_MST_FEE_ST_DT" value="" readonly data-target-end="#PRD_MST_ICN_ED_DT">
								<span>~</span>
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
								<input type="text" class="text date" id="PRD_MST_FEE_ED_DT" name="PRD_MST_FEE_ED_DT" value="" readonly data-target-start="#PRD_MST_ICN_ST_DT_">
							</td>
						</tr>
					</tbody>
				</table>
				<h3 class="title"><span>태그설정 (<i class="require"><em>필수입력</em></i> 필수항목)</span></h3>
				<table class="table-row table-a">
					<caption>태그설정의 일반 TAG, 대표 TAG을 알 수 있는 표 입니다.</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:85%;">
					</colgroup>
					<tbody>
						<tr>
							<th><label for="">일반 TAG<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<div class="tag_cloud_wrap_side">
									<div class="tag_cloud_wrap">
										<ul class="tag_cloud_list">
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
										</ul>
									</div>
									<button type="button" class="btn_tag_select">선택</button>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="">대표 TAG<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>선택</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<h3 class="title"><span>전시정보</span></h3>
				<table class="table-row table-a">
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup>
					<tbody>
						<tr>
							<th><span>쇼핑채널<i class="require"><em>필수입력</em></i></span></th>
							<td>
								<input type="checkbox" name="" id="">
								<label for="">PC</label>
								<input type="checkbox" name="" id="">
								<label for="">MOBILE</label>
							</td>
							<th><label for="">판매상태</label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>판매중</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="">진열상태</label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>YES</option>
								</select>
							</td>
							<th><label for="">승인상태</label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>승인</option>
								</select>
							</td>
						</tr>
						<tr id="pc_category">
							<th><span>PC카테고리<i class="require"><em>필수입력</em></i></span></th>
							<td colspan="3">
								<div id="divCategory">
									<div class="text-right">
										<a href="#" id="goCategoryDelete_P" class="button button-a"><span>선택삭제</span></a>
										<a id="goCategoryPopup" href="javascript:registPopup('P');" class="button button-b primary" title="새 창 으로 열립니다."><span>카테고리 추가</span></a>
									</div>
									<table class="table-row table-a mt10" id="tableCategory">
										<colgroup>
											<col style="width:33px;">
											<col style="width:auto;">
										</colgroup>
										<thead>
											<tr>
												<th class="ac"><input type="checkbox" class="checkbox checkAll_P"></th>
												<th class="ac">카테고리 경로</th>
											</tr>
										</thead>
										<tbody id="applyCategoryList_P">
											<tr id="categoryNodata_P">
												<td colspan="2">카테고리를 추가해 주세요.</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr id="mobile_category">
							<th><span>모바일카테고리<i class="require"><em>필수입력</em></i></span></th>
							<td colspan="3">
								<div id="divCategory">
									<div class="text-right">
										<a href="#" id="goCategoryDelete_M" class="button button-a"><span>선택삭제</span></a>
										<a id="goCategoryPopup" href="javascript:registPopup('M');" class="button button-b primary" title="새 창 으로 열립니다."><span>카테고리 추가</span></a>
									</div>
									<table class="table-row table-a mt10" id="tableCategory">
										<colgroup>
											<col style="width:33px;">
											<col style="width:auto;">
										</colgroup>
										<thead>
											<tr>
												<th class="ac"><input type="checkbox" class="checkbox checkAll_M"></th>
												<th class="ac">카테고리 경로</th>
											</tr>
										</thead>
										<tbody id="applyCategoryList_M">
											<tr id="categoryNodata_M">
												<td colspan="3">카테고리를 추가해 주세요.</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<h3 class="title"><span>색상정보</span></h3>
				<table class="table-row table-a">
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup>
					<tbody>
						<tr>
							<th><span>색상<i class="require"><em>필수입력</em></i></span></th>
							<td colspan="3">
								<div class="color_info_wrap_side">
									<div class="color_info_wrap cf">
										<ul class="color_list">
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#ffffff;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#000000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#333f50;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#c55a11;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#00b0f0;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#ffc000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#ffffff;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#000000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#333f50;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#c55a11;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#00b0f0;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#ffc000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#ffffff;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#000000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#333f50;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#c55a11;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#00b0f0;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#ffc000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#ffffff;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#000000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#333f50;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#c55a11;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#00b0f0;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#ffc000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#ffffff;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#000000;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#333f50;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box">
												<label for="" style="background-color:#c55a11;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#00b0f0;">칼라색상</label>
											</li>
											<li>
												<input type="checkbox" name="" id="" class="color_list_box" checked>
												<label for="" style="background-color:#ffc000;">칼라색상</label>
											</li>
										</ul>
									</div>
									<button type="button" class="btn_color_select">선택</button>
								</div>
							</td>
						</tr>
						<tr>
							<th><span>사이즈<i class="require"><em>필수입력</em></i></span></th>
							<td colspan="3">
								<div id="">
									<table class="table-row table-a">
										<colgroup>
											<col style="width:auto;">
											<col style="width:auto;">
											<col style="width:auto;">
											<col style="width:auto;">
											<col style="width:auto;">
										</colgroup>
										<thead>
											<tr>
												<th class="ac">색상</th>
												<th class="ac">옵션값</th>
												<th class="ac">재고</th>
												<th class="ac">사용</th>
												<th class="ac">키/몸무게</th>
											</tr>
										</thead>
										<tbody class="tbl_color_list">
											<tr>
												<td>
													<button type="button" class="btn_row_minus">-</button>
													<span class="box_color" style="background-color:#c55a11">색상이름</span>
												</td>
												<td colspan="4">
													<table class="tbl_color">
														<colgroup>
															<col style="width:auto;">
															<col style="width:auto;">
															<col style="width:auto;">
															<col style="width:auto;">
														</colgroup>
														<tbody>
															<tr>
																<td>
																	<input type="text" name="" id="" class="text number" value="95">
																	<button type="button" class="btn_row_plus">+</button>
																</td>
																<td>
																	<input type="text" name="" id="" class="text number xlarge" value="123">
																</td>
																<td>
																	<select name="" id="" class="select xlarge">
																		<option value="" selected>사용</option>
																	</select>
																</td>
																<td>
																	<input type="text" name="" id="" class="text xlarge">
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<button type="button" class="btn_row_minus">-</button>
													<span class="box_color" style="background-color:#ffc000">색상이름</span>
												</td>
												<td colspan="4">
													<table class="tbl_color">
														<colgroup>
															<col style="width:auto;">
															<col style="width:auto;">
															<col style="width:auto;">
															<col style="width:auto;">
														</colgroup>
														<tbody>
															<tr>
																<td>
																	<input type="text" name="" id="" class="text number" value="95">
																	<button type="button" class="btn_row_plus">+</button>
																</td>
																<td>
																	<input type="text" name="" id="" class="text number xlarge" value="123">
																</td>
																<td>
																	<select name="" id="" class="select xlarge">
																		<option value="" selected>사용</option>
																	</select>
																</td>
																<td>
																	<input type="text" name="" id="" class="text xlarge">
																</td>
															</tr>
															<tr>
																<td>
																	<input type="text" name="" id="" class="text number" value="95">
																	<button type="button" class="btn_row_minus">-</button>
																</td>
																<td>
																	<input type="text" name="" id="" class="text number xlarge" value="123">
																</td>
																<td>
																	<select name="" id="" class="select xlarge">
																		<option value="" selected>사용</option>
																	</select>
																</td>
																<td>
																	<input type="text" name="" id="" class="text xlarge">
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<h3 class="title"><span>추가옵션</span></h3>
				<table class="table-row table-a">
					<colgroup>
						<col style="width:15%">
						<col style="width:85%">
					</colgroup>
					<tbody>
						<tr>
							<th><span>추가옵션</span></th>
							<td>
								<div class="grid section-button-search">
									<a href="#" id="" class="button button-a"><span>선택삭제</span></a>
									<a href="#" id="" class="button button-a primary"><span>옵션추가</span></a>
								</div>
								<table class="table-row table-a">
									<colgroup>
										<col style="width:33px">
										<col style="width:auto;">
										<col style="width:150px;">
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<th class="ac">옵션명</th>
											<th class="ac">사용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<input type="checkbox" name="" id="">
											</td>
											<td>
												<input type="text" name="" id="" class="text xlarge" value="안감 추가하기">
											</td>
											<td>
												<select name="" id="" class="select xlarge">
													<option value="" selected>선택</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" name="" id="">
											</td>
											<td>
												<input type="text" name="" id="" class="text xlarge" value="소매길이 짧게 수선">
											</td>
											<td>
												<select name="" id="" class="select xlarge">
													<option value="" selected>선택</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<h3 class="title"><span>함께 매치하기 좋은 상품</span></h3>
				<table class="table-row table-a">
					<colgroup>
						<col style="width:15%">
						<col style="width:85%">
					</colgroup>
					<tbody>
						<tr>
							<th><span>함께 매치하기 좋은 상품</span></th>
							<td>
								<ul class="product_match_list">
									<li>
										<input type="text" name="" id="" class="text half" value="폭스 퍼 히든 덕다운 패딩 점퍼">
										<button type="button" class="button button-a primary small">상품찾기</button>
										<button type="button" class="btn_row_plus">+</button>
										<button type="button" class="button button-a small">상품지우기</button>
									</li>
									<li>
										<input type="text" name="" id="" class="text half" value="폭스 퍼 히든 덕다운 패딩 점퍼">
										<button type="button" class="button button-a primary small">상품찾기</button>
										<button type="button" class="btn_row_minus">-</button>
									</li>
									<li>
										<input type="text" name="" id="" class="text half" value="폭스 퍼 히든 덕다운 패딩 점퍼">
										<button type="button" class="button button-a primary small">상품찾기</button>
										<button type="button" class="btn_row_minus">-</button>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- //modal-inner -->
		</div><!-- //modal-wrapper -->
	</div><!-- //modal -->
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
</body>
</html>
