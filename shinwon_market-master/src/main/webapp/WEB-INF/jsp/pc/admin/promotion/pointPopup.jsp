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

                <h2 class="title"><span>포인트 적립/차감 대상확인</span></h2>

                    <!-- 탭부분 -->

                    <h3 class="title"><span>적립/차감 정보</span></h3>

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;">
                            <col style="width: auto;">
                            <col style="width: 20%;">
                            </colgroup>
                        <thead>
                            <th>구분</th>
                            <th>내역</th>
                            <th>포인트</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>적립</td>
                                <td>관리자 수동 지급</td>
                                <td>30,000</td>
                            </tr>
                        </tbody>
                    </table>

                    <h3 class="title"><span>대상인원</span></h3>

                    <div class="grid section-button-list" ><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-right" style="width:100%;">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;">
                            <col style="width: auto;">
                            <col style="width: auto;">
                        </colgroup>
                        <thead>
                            <th>NO</th>
                            <th>고객명</th>
                            <th>아이디</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>3</td>
                                <td>홍길동A</td>
                                <td>afasfafw1233</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>홍길동A</td>
                                <td>afasfafw1233</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>홍길동A</td>
                                <td>afasfafw1233</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="#none" id="goList" class="button"><span>닫기</span></a>
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
