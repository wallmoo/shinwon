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
					<span>상품일괄업로드</span>
				</h2>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width:15%;">
						<col style="width:85%;">
					</colgroup>
					<tbody>
						<tr>
							<th><span>파일첨부</span></th>
							<td>
								<input type="text" class="large" disabled>
								<input type="file" id="fileUpload" class="file_inp" value="파일첨부">
								<label for="fileUpload" class="button small btn_file_upload">파일첨부</label>
								<a href="#none" id="search" class="button small primary"><span>검색</span></a> <br />
								<small style="margin-left:10px;color:red;">* xls 파일만 첨부 할 수 있습니다.</small>
								<a href="#none" id="" class="button primary btn_fileRegist" style="margin-top:3px;"><span>적용</span></a>
							</td>
						</tr>
					</tbody>
				</table>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 15%;">
						<col style="width: auto;">
						</colgroup>
					<tbody>
						<tr>
							<th><span>처리결과</span></th>
							<td class="clearboth"><span class="fl_left">전체 업로드 상품수 : 581개</span> <a id ="" class="button fl_right"><span>결과 다운로드</span></a></td>
						</tr>
						<tr>
							<th><span>성공개수</span></th>
							<td>578개</td>
						</tr>
						<tr>
							<th><span>실패개수</span></th>
							<td>
								<p>3개</p>
								<div>
									<p>■ 실패상세내역</p>
									<table cellspacing="0" class="table-col table-a"><!-- table -->
										<colgroup>
											<col />
											<col />
										</colgroup>
										<thead>
											<tr>
												<th>NO</th>
												<th>엑셀 행번호</th>
												<th>상품명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>3</td>
												<td>81</td>
												<td>사선 디테일 하이넥 후드 오리털 패딩 점퍼</td>
											</tr>
											<tr>
												<td>2</td>
												<td>109</td>
												<td>영문 레터링 체크 패턴 투 버튼 코트</td>
											</tr>
											<tr>
												<td>1</td>
												<td>572</td>
												<td>다운 모피 퍼 럭셔리 워밍 점퍼</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="#none" id="goList" class="button large"><span>닫기</span></a>
					</div>
				</div><!-- // section-button -->

				<div class="popup_info">
					<dl>
						<dt>유의사항</dt>
						<dd>
							· CSV 파일 등록 시 샘플 엑셀 파일의 '쇼핑몰상품명/세트상품여부/set_product1/set_product2/네이버지식쇼핑/컬러관리/성별' 을 입력 후 [파일등록] 버튼 클릭 시 선택된 세트상품이 일괄 등록됩니다.
							<ol>
								<li>세트 상품 ERP 코드 : 자동 생성되므로 등록시에는 값을 넣지 마세요.</li>
								<li>쇼핑몰상품명 : 상품의 기본 상품명을 설정할 수 있습니다.</li>
								<li>세트상품여부 : 상품의 세트여부를 설정할 수 있습니다. (Y : 기본값)</li>
								<li>set_product1* : 숫자 9자리의 1번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
								<li>set_product2* : 숫자 9자리의 2번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
								<li>네이버지식쇼핑 : 네이버쇼핑 노출여부를 설정할 수 있습니다. (Y : 노출, N : 노출안함)</li>
								<li>컬러관리 : 상품의 컬러옵션을 설정할 수 있습니다.</li>
								<li>성별 : 상품의 주요 사용 성별을 설정할 수 있습니다. (M : 남성, W : 여성, F : 유니섹스)</li>
							</ol>
						</dd>
					</dl>
				</div>

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
