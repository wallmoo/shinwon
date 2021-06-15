<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title">
					<span>태그일괄수정</span>
				</h2>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 15%; min-width: 180px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr><!-- row -->
							<th><span>태그 그룹명 <i class="require"><em>필수입력</em></i></span></th>
							<td>
								<select class="select">
									<option>선택</option>
									<option>2020 S/S VIKI상의</option>
								</select>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>태그 그룹 설명</span></th>
							<td>
								<span>태그 그룹을 선택해 주세요.</span>
								<span>2020 봄 시즌 VIKI 상의 품목 태그 모음입니다.</span>
							</td>
						</tr>
						<tr>
							<th><span>일반 태그<i class="require"><em>필수입력</em></i> <br />(0)</span></th>
							<td>
								<span>태그 그룹을 선택해 주세요.</span>
								<ul class="tag_list">
									<li>#오버핏<button type="button" class="btn_del">X</button></li>
									<li>#신상품<button type="button" class="btn_del">X</button></li>
									<li>#빈티지<button type="button" class="btn_del">X</button></li>
									<li>#거울셀카<button type="button" class="btn_del">X</button></li>
									<li>#streetstyle<button type="button" class="btn_del">X</button></li>
									<li>#루즈핏<button type="button" class="btn_del">X</button></li>
									<li>#고상한<button type="button" class="btn_del">X</button></li>
									<li>#신상품1<button type="button" class="btn_del">X</button></li>
									<li>#가을신상<button type="button" class="btn_del">X</button></li>
									<li>#데일리룩<button type="button" class="btn_del">X</button></li>
									<li>#ootd<button type="button" class="btn_del">X</button></li>
									<li>#비오는날<button type="button" class="btn_del">X</button></li>
									<li>#상큼한<button type="button" class="btn_del">X</button></li>
									<li>#가을여행<button type="button" class="btn_del">X</button></li>
									<li>#오버핏1<button type="button" class="btn_del">X</button></li>
									<li>#신상품2<button type="button" class="btn_del">X</button></li>
									<li>#빈티지1<button type="button" class="btn_del">X</button></li>
									<li>#거울셀카1<button type="button" class="btn_del">X</button></li>
									<li>#streetstyle1<button type="button" class="btn_del">X</button></li>
									<li>#루즈핏1<button type="button" class="btn_del">X</button></li>
									<li>#고상한1<button type="button" class="btn_del">X</button></li>
									<li>#신상품3<button type="button" class="btn_del">X</button></li>
									<li>#가을신상<button type="button" class="btn_del">X</button></li>
									<li>#데일리룩1<button type="button" class="btn_del">X</button></li>
									<li>#ootd<button type="button" class="btn_del">X</button></li>
									<li>#비오는날1<button type="button" class="btn_del">X</button></li>
									<li>#상큼한<button type="button" class="btn_del">X</button></li>
									<li>#가을여행<button type="button" class="btn_del">X</button></li>
								</ul>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>대표태그<i class="require"><em>필수입력</em></i></span></th>
							<td>
								<select class="select">
									<option>선택</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->

			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->

	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		//<![CDATA[
		$(function() {

		});
		//]]>
	</script>
</body>
</html>
