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

				<h2 class="title"><span>당첨자 확인</span></h2>

                    <!-- 탭부분 -->

					<form id="frm" name="frm">
    	               <input type="hidden" name="PLN_MST_IDX" value="" />
    					<input type="hidden" name="cPage" value="" />
    					<input type="hidden" name="searchPlnMstShopType" value="" />
    					<input type="hidden" name="searchPlnMstTitle" value="" />
    					<input type="hidden" name="searchPlnMstStDt" value="2020-01-21" />
    					<input type="hidden" name="searchPlnMstEdDt" value="2020-01-21" />
    					<input type="hidden" name="searchPlnMstStatus" value="" />
    					<input type="hidden" name="searchPlnMstUseYn" value="" />

    	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                     		<div class="col-1-2 text-left">
    	                 		<select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                                <span class="pages">
    	                        	(총 <strong class="em">1</strong>건, 1 of 1 page)
    	                        </span>
    						</div>

    	                    <div class="col-1-2 text-right">
    	                        <a id ="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
    	                    </div>
                    	</div><!-- // 목록 상단 버튼 -->

						<div style="height:240px;overflow-y:scroll;">
							<table cellspacing="0" class="table-col table-b"><!-- table -->
    						<colgroup>
    							<col style="width: 5%;" />
    							<col style="width: 10%;" />
    							<col style="width: 7%;" />
    							<col style="width: 10%;" />
    							<col style="width: auto;" />
    						</colgroup>
    						<thead>
    							<tr>
    								<th>NO</th>
    								<th>회원정보</th>
    								<th>경품명</th>
    								<th>지급일</th>
    								<th>메모</th>
    							</tr>
    						</thead>
    						<tbody>
								<tr>
                                    <td>1</td>
                                    <td><a href="#">김도영<br/>(asvqw1234)</a></td>
                                    <td>지나식스 30% 할인쿠폰</td>
                                    <td>2020-01-10</td>
                                    <td>지나식스 패딩 퀴즈 이벤트</td>
								</tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="#">김도영<br/>(asvqw1234)</a></td>
                                    <td>지나식스 30% 할인쿠폰</td>
                                    <td>2020-01-10</td>
                                    <td>지나식스 패딩 퀴즈 이벤트</td>
								</tr>
								<tr>
                                    <td>3</td>
                                    <td><a href="#">김도영<br/>(asvqw1234)</a></td>
                                    <td>지나식스 30% 할인쿠폰</td>
                                    <td>2020-01-10</td>
                                    <td>지나식스 패딩 퀴즈 이벤트</td>
								</tr>
							</tbody>
    					</table>
						</div>
						</form>

    					<div class="section-pagination"><!-- section pagination -->
    	                    <h4 class="sr-only">목록 페이징</h4>
    	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
    	                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                            </div>
    	                </div><!-- // section pagination -->

                    <div class="section-button-popup text-center"><!-- section button -->
                  		<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
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
