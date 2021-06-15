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

				<h2 class="title"><span>전시상품관리B</span></h2>
				<h3 class="title"><span>목록</span></h3>
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
											<li class="closed"><span class="folder" data-idx="3661" data-level="3">#by tag 상품</span></li>
											<li class="closed"><span class="folder" data-idx="3662" data-level="3">신상품 TAB</span></li>
											<li class="closed"><span class="folder" data-idx="3663" data-level="3">주간베스트 TAB</span></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<div id="main_con">
							<div id="list_form_wrapper">
								<h3 class="title"><span>셀러룸B 메인 - #by tag 상품</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">상품 최대 8개</div>
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
											<th>상품코드</th>
											<th>이미지</th>
											<th>상품명</th>
											<th>판매상태</th>
											<th>노출순위</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="" id="" class="checkbox"></td>
											<td class="al"><a href="#">GY0AX2504</a></td>
											<td>
												<span class="thumbnail_img"><img name="PRD_IMAGE" src="http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/27/S0012163/S0012163_0_84.png"></span>
											</td>
											<td>폭스 퍼 히든 버튼 덕다운 패딩 점퍼</td>
											<td>판매중</td>
											<td>
												<a href="#">△</a>
												<a href="#">▽</a>
											</td>
										</tr>
										<!-- 
										<tr>
											<td colspan="8">조회된 데이터가 없습니다.</td>
										</tr>
										 -->
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
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

   
});



//-->
</script>

</body>
</html>
