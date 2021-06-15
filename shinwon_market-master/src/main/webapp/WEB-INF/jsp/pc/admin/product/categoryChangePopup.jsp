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
					<span>카테고리 변경</span>
				</h2>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width:180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>PC카테고리</th>
                            <td id="divCategory" style="display:block">
                                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                                <div class="col-1-2 text-left">
                                    <select class="select" name="">
                                        <option>1차카테고리</option>
                                    </select>
                                    <select class="select" name="">
                                        <option>2차카테고리</option>
                                    </select>
                                    <select class="select" name="">
                                        <option>3차카테고리</option>
                                    </select>
                                </div>
                                <div class="col-1-2 text-right">
                                    <a href="#none" id="goSpcCategoryDelete_P"   class="button button-a small"><span>선택삭제</span></a>
                                    <a id="goCategoryPopup" href="#" class="button button-b small" title="새 창 으로 열립니다."><span>카테고리추가</span></a>
                                </div>
                                </div><!-- // 목록 상단 버튼 -->

                                <table class="table-row table-a" id="tableCategory">
                                    <colgroup>
                                        <col style="width: 40px;" />
                                        <col style="width: auto;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" class="checkbox checkAll_P" /></th>
                                            <th>카테고리 경로</th>
                                        </tr>
                                    </thead>
                                    <tbody id="applyCategoryList_P">
                                        <tr id="specCategoryNodata_P"><!-- row -->
                                            <td><input type="checkbox" class="checkbox"></td>
                                            <td>MEN > OUTER > 다운패딩</td>
                                        </tr>
                                        <tr id="categoryNodata_P"><!-- row -->
                                            <td colspan="2">카테고리를 추가해 주세요.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>MOBILE 카테고리</th>
                            <td id="divCategory" style="display:block">
                                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                                <div class="col-1-2 text-left">
                                    <select class="select" name="">
                                        <option>1차카테고리</option>
                                    </select>
                                    <select class="select" name="">
                                        <option>2차카테고리</option>
                                    </select>
                                    <select class="select" name="">
                                        <option>3차카테고리</option>
                                    </select>
                                </div>
                                <div class="col-1-2 text-right">
                                    <a href="#none" id="goSpcCategoryDelete_P"   class="button button-a small"><span>선택삭제</span></a>
                                    <a id="goCategoryPopup" href="#" class="button button-b small" title="새 창 으로 열립니다."><span>카테고리추가</span></a>
                                </div>
                                </div><!-- // 목록 상단 버튼 -->

                                <table class="table-row table-a" id="tableCategory">
                                    <colgroup>
                                        <col style="width: 40px;" />
                                        <col style="width: auto;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" class="checkbox checkAll_P" /></th>
                                            <th>카테고리 경로</th>
                                        </tr>
                                    </thead>
                                    <tbody id="applyCategoryList_P">
                                        <tr id="specCategoryNodata_P"><!-- row -->
                                            <td><input type="checkbox" class="checkbox"></td>
                                            <td>MEN > OUTER > 다운패딩</td>
                                        </tr>
                                        <tr id="categoryNodata_P"><!-- row -->
                                            <td colspan="2">카테고리를 추가해 주세요.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                   </tbody>
                </table><!-- // table -->

                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                            <a href="#none" id="goList" class="button large"><span>닫기</span></a>
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
