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

				<h2 class="title"><span>보류 사유등록</span></h2>

                    <!-- 탭부분 -->

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr><!-- row -->
                                <th><span>보류사유</span></th>
                                <td>
                                    <input type="checkbox" class="checkbox" id="check1" name="check">
                                    <label for="check1">판매가</label>
                                    <input type="checkbox" class="checkbox" id="check2" name="check">
                                    <label for="check2">상품명</label>
                                    <input type="checkbox" class="checkbox" id="check3" name="check">
                                    <label for="check3">카테고리</label>
                                    <input type="checkbox" class="checkbox" id="check4" name="check">
                                    <label for="check4">영상/이미지</label>
                                    <input type="checkbox" class="checkbox" id="check5" name="check">
                                    <label for="check5">고시정보</label>
                                    <input type="checkbox" class="checkbox" id="check6" name="check">
                                    <label for="check6">기타</label>
                                </td>
                            </tr>
                            <tr><!-- row -->
                                <th><span>상세사유</span></th>
                                <td>
                                    <textarea cols="30" rows="10"></textarea>
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
