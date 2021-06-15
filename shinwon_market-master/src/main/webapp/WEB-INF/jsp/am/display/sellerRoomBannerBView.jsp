<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
	<%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

	<div id="aside" class="aside left"><!-- aside -->
		<%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
	</div><!-- // aside -->

	<div id="wrapper"><!-- wrapper -->

		<div id="breadcrumb"></div><!-- breadcrumb -->

		<div id="contents"><!-- contents -->

			<div class="container">

				<h2 class="title"><span>전시배너관리B</span></h2>
				<h3 class="title"><span>목록</span></h3>
				<table class="table-row table-a">
					<colgroup>
						<col style="width:10%;">
						<col style="width:90%;">
					</colgroup>
					<tbody>
						<tr>
							<th><span>구분</span></th>
							<td>
								<ul class="form_radio_check_list">
									<li>
										<input type="radio" id="" name="" class="radio" checked>
										<label for="" class="label">PC</label>
									</li>
									<li>
										<input type="radio" id="" name="" class="radio">
										<label for="" class="label">MOBILE</label>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="tree_side_layout">
					<!-- .tree_wrap -->
					<div class="tree_wrap cf">
						<ul id="browser" class="filetree treeview-famfamfam treeview">
							<li class="collapsable lastCollapsable">
								<div class="hitarea collapsable-hitarea lastCollapsable-hitarea"></div>
								<ul>
									<li class="closed collapsable">
										<div class="hitarea closed-hitarea collapsable-hitarea"></div>
										<span class="folder" data-idx="3657" data-level="2">셀러룸B메인</span>
										<ul style="display: block;">
											<li class="closed"><span class="folder" data-idx="3661" data-level="3">상단배너</span></li>
											<li class="closed"><span class="folder" data-idx="3662" data-level="3">기획전</span></li>
											<li class="closed"><span class="folder" data-idx="3663" data-level="3">셀러픽</span></li>
											<li class="closed"><span class="folder" data-idx="3664" data-level="3">#by trend</span></li>
											<li class="closed last"><span class="folder" data-idx="3665" data-level="3">띠배너</span></li>
										</ul>
									</li>
									<li class="closed collapsable">
										<div class="hitarea closed-hitarea collapsable-hitarea"></div>
										<span class="folder" data-idx="3658" data-level="2">셀러픽B</span>
										<ul style="display: block;">
											<li class="closed"><span class="folder" data-idx="3666" data-level="3">상단배너</span></li>
										</ul>
									</li>
									<li class="closed expandable">
										<div class="hitarea closed-hitarea expandable-hitarea"></div>
										<span class="folder" data-idx="3659" data-level="2">셀러룸정보B</span>
										<ul style="display: none;">
											<li class="closed"><span class="folder" data-idx="3671" data-level="3">상단배너</span></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<div id="main_con">
							<div id="list_form_wrapper">
								<h3 class="title"><span>셀러룸B 메인 - 상단배너</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">상단배너 : 123*123 (필수1개, 최대1개)</div>
									<div class="text-right">
										<a href="#" class="button small"><span>선택삭제</span></a>
										<a id="reg_submit_btn" href="#" class="button small primary"><span>등록</span></a>
										
										
									</div>
								</div>
								<table class="table-col table-b">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" name="" id="" class="checkbox"></th>
											<th>제목</th>
											<th>전시기간</th>
											<th>잔여기간</th>
											<th>등록일</th>
											<th>사용여부</th>
											<th>보기</th>
											<th>전시순서</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="" id="" class="checkbox"></td>
											<td class="al"><a href="#">가을에는 트렌치코트</a></td>
											<td>2019-10-10 ~ 2019-10-31</td>
											<td>12</td>
											<td>2019-10-05</td>
											<td>
												<select name="" id="" class="select">
													<option value="" selected>사용</option>
													<option value="">미사용</option>
												</select>
											</td>
											<td>
												<a href="#" class="button button-a"><span>배너보기</span></a>
											</td>
											<td>
												<a href="#">△</a>
												<a href="#">▽</a>
											</td>
										</tr>
										<tr>
											<td colspan="8">조회된 데이터가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
							</div>
							
							<div id="reg_edit_form" style="display:none;">
							

									
								<h3 class="title"><span>배너등록</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">상단배너 : 123*123</div>
								</div>
								<table class="table-row table-a">
									<colgroup>
										<col style="width:20%;">
										<col style="width:80%;">
									</colgroup>
									<tbody>
										<tr>
											<th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<ul class="form_radio_check_list">
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">사용</label>
													</li>
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">미사용</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th><label for="">제목<i class="require"><em>필수입력</em></i></label></th>
											<td><input type="text" name="" id="" class="text xlarge"></td>
										</tr>
										<tr>
											<th><span>셀러픽<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="grid section-button-search">
													<a href="#" id="" class="button button-a"><span>선택삭제</span></a>
													<a href="#" id="" class="button button-a primary"><span>셀러픽등록</span></a>
												</div>
												<table class="table-a table-col">
													<colgroup>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th scope="col"><input type="checkbox" name="" id="" class="checkbox"></th>
															<th scope="col">셀러픽명</th>
															<th scope="col">등록일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td colspan="3">셀러픽 콘텐츠를 등록해 주세요.</td>
														</tr>
														<tr>
															<td><input type="checkbox" name="" id="" class="checkbox"></td>
															<td class="al">2020 S/S 신규 아이템 입고!</td>
															<td>2019-10-05</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<th><span>전시기간<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="tbl_line">
													<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
													<input type="text" class="text" id="" name="" readonly data-target-end="">
													<span>~</span>
													<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
													<input type="text" class="text" id="" name="" readonly data-target-start="">
													<a href="#" class="button button-a xsmall"><span>내일</span></a>
													<a href="#" class="button button-a xsmall"><span>일주일</span></a>
													<a href="#" class="button button-a xsmall"><span>15일</span></a>
													<a href="#" class="button button-a xsmall"><span>한달</span></a>
												</div>
												<p class="txt_warnning">(날짜형식: YYYY-MM-DD) <small class="desc">전시기간은 ‘Today+1일’부터 설정 가능합니다.</small></p>
											</td>
										</tr>
										<tr>
											<th><label for="">배너<i class="require"><em>필수입력</em></i></label></th>
											<td>
												<div class="tbl_line">
													<input type="file" name="" id="" class="file">
												</div>
												<div class="tbl_line">
													<a href="#" class="file_link">WF7A1018.jpg</a>
													<input type="checkbox" name="" id="" class="checkbox">
													<label for="">삭제</label>													
												</div>
											</td>
										</tr>
										<tr>
											<th><span>상품<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="grid section-button-search">
													<a href="#" id="" class="button button-a"><span>선택삭제</span></a>
													<a href="#" id="" class="button button-a primary"><span>상품등록</span></a>
												</div>
												<table class="table-a table-col">
													<colgroup>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th scope="col"><input type="checkbox" name="" id="" class="checkbox"></th>
															<th scope="col">상품코드</th>
															<th scope="col">이미지</th>
															<th scope="col">상품명</th>
															<th scope="col">판매상태</th>
															<th scope="col">등록일</th>
															<th scope="col">전시순서</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td colspan="7">배너 이미지 등록 후 상품을 등록해 주세요.</td>
														</tr>
														<tr>
															<td><input type="checkbox" name="" id="" class="checkbox"></td>
															<td>GYOAX2504</td>
															<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt="" alt=""></td>
															<td class="al">폭스 퍼 히든 버튼 덕다운 폭스 퍼 히든 버튼 덕다운 폭스 퍼 히든 버튼 덕다운</td>
															<td>판매중</td>
															<td>2019-10-05</td>
															<td>
																<a href="#">△</a>
																<a href="#">▽</a>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<th><span>URL</span></th>
											<td>
												<ul class="form_radio_check_list">
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">링크없음</label>
													</li>
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">현재창</label>
													</li>
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">새창열림</label>
													</li>
												</ul>
												<div class="tbl_line">
													<input type="text" name="" id="" class="text xlarge">
												</div>
												<p class="txt_warnning">* 팝업에 등록되는 배너는 현재창으로 링크가 안됩니다.</p>
											</td>
										</tr>
										<tr>
											<th><span>대체 텍스트</span></th>
											<td><textarea name="" id="" class="textarea"></textarea></td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a id="reg_save_btn" href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- // .tree_wrap -->
				</div>
			</div><!-- // container -->

		</div><!-- // contents -->

	</div><!-- // wrapper -->  

	<div id="quickmenu" class="aside right"><!-- quickmenu-->
		<%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
	</div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
	<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script src="/am/js/plugins/jquery.cookie.js"></script> <!-- treeview -->
<script src="/am/js/plugins/jquery.treeview.js"></script> <!-- treeview -->
<script src="/am/js/common/jquery.ajax.js"></script>
<script>
$(document).ready(function () {
	$('#reg_submit_btn').on('click', function(){
		$('#list_form_wrapper').hide();
		$('#reg_edit_form').show();
	});

	$('#reg_save_btn').on('click', function(){
		$('#list_form_wrapper').show();
		$('#reg_edit_form').hide();		
	});
   
});



//-->
</script>

</body>
</html>
