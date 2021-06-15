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

				<h2 class="title"><span>코드확인</span></h2>

                    <!-- 탭부분 -->

                    <h2 class="title"><span>쿠폰정보</span></h2>

                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="" />
    	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 10%;" />
                                <col style="width: 10%;" />
    	                        <col style="width: auto;" />
    	                        <col style="width: 10%;" />
                                <col style="width: 10%;" />
                                <col style="width: 10%;" />
    	                    </colgroup>
    	                    <tbody>
    	                        <tr><!-- row -->
    	                            <th class="text-center"><span>쿠폰번호</span></th>
                                    <th class="text-center"><span>쿠폰종류</span></th>
                                    <th class="text-center"><span>쿠폰명</span></th>
                                    <th class="text-center"><span>할인구분</span></th>
                                    <th class="text-center"><span>할인금액</span></th>
                                    <th class="text-center"><span>발급수량</span></th>
                                </tr>
                                <tr>
                                    <td>ETLDIU834</td>
                                    <td>프로모션/페이퍼</td>
                                    <td>쿠폰명이 노출됩니다</td>
                                    <td>정액</td>
                                    <td>5,000</td>
                                    <td>5</td>
                                </tr>
    	                    </tbody>
    	                </table><!-- // table -->
                    </form>

                    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                        <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                        <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                    </div>

                    <h3 class="title"><span>목록</span></h3>

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

                            <div class="text-right">
                                <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                            </div>
                    	</div><!-- // 목록 상단 버튼 -->

    	                <table cellspacing="0" class="table-col table-b"><!-- table -->
    						<colgroup>
    							<col style="width: 10%;" />
    							<col style="width: auto;" />
    						</colgroup>
    						<thead>
    							<tr>
                                    <th>NO</th>
                                    <th>코드</th>
    							</tr>
    						</thead>
    						<tbody>
    							<tr>
                                    <td>5</td>
                                    <td>AGEW1234567890123</td>
								</tr>
                                <tr>
                                    <td>4</td>
                                    <td>AGEW1234567890122</td>
								</tr>
                                <tr>
                                    <td>3</td>
                                    <td>AGEW1234567890121</td>
								</tr>
                                <tr>
                                    <td>2</td>
                                    <td>AGEW1234567890120</td>
								</tr>
                                <tr>
                                    <td>1</td>
                                    <td>AGEW1234567890119</td>
								</tr>
							</tbody>
    					</table>
                        </form>

                        <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
    	                    <a href="#none" id="" class="button button-b"><span>닫기</span></a>
    	                </div><!-- // section button -->

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
