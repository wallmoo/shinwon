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
					<span>리뷰이벤트 선택</span>
				</h2>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 15%;">
						<col style="width: auto;">
						</colgroup>
					<tbody>
						<tr>
							<th><span>리뷰이벤트</span></th>
							<td>
								<select class="select xlarge">
									<option>선택</option>
									<option>등록 된 진행중인 리뷰이벤트 목록</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="#none" id="goRegist" class="button large primary"><span>취소</span></a>
						<a href="#none" id="goList" class="button large"><span>선택</span></a>
					</div>
				</div><!-- // section-button -->

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
