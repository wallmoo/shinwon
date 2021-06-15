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

				<h2 class="title"><span>쿠폰검색</span></h2>

                    <!-- 탭부분 -->

                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="" />
    	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 10%;" />
    	                        <col style="width: auto;" />
                                <col style="width: 10%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
    	                        <tr><!-- row -->
    	                            <th><span>쿠폰코드</span></th>
    	                            <td colspan="3">
    	                                <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text large" value=""/>
    	                            </td>
                                </tr>
                                <tr>
                                    <th><span>쿠폰명</span></th>
    	                            <td>
    	                                <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text large" value=""/>
    	                            </td>
                                    <th><span>할인쿠폰</span></th>
                                    <td>
                                        <select class="select" name="">
                                            <option value="">전체</option>
                                            <option value="">정율</option>
                                            <option value="">정액</option>
                                            <option value="">E-포인트</option>
                                        </select>
                                    </td>
    	                        </tr>
                                <tr>
                                    <th><span>쿠폰수수료</span></th>
                                    <td>
                                        <select class="select">
                                            <option value="">전체</option>
                                            <option value="">쑈윈도</option>
                                            <option value="">입점사</option>
                                            <option value="">반반부담</option>
                                        </select>
                                    </td>
                                    <th><span>상태</span></th>
                                    <td>
                                        <select class="select">
                                            <option value="">전체</option>
                                            <option value="">사용</option>
                                            <option value="">미사용</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>채널</span></th>
                                    <td colspan="3">
                                        <select class="select">
                                            <option value="">전체</option>
                                            <option value="">PC</option>
                                            <option value="">MOBILE WEB</option>
                                            <option value="">MOBILE APP</option>
                                        </select>
                                    </td>
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

                    	</div><!-- // 목록 상단 버튼 -->

    	                <table cellspacing="0" class="table-col table-b"><!-- table -->
    						<colgroup>
    							<col style="width: 5%;" />
    							<col style="width: 12%;" />
    							<col style="width: auto;" />
    							<col style="width: 10%;" />
    							<col style="width: 10%;" />
    							<col style="width: 10%;" />
    							<col style="width: 10%;" />
    						</colgroup>
    						<thead>
    							<tr>
                                    <th><input type="checkbox" class="checkbox checkAll"></th>
    								<th>쿠폰코드</th>
    								<th>쿠폰명</th>
    								<th>할인구분</th>
    								<th>쿠폰수수료</th>
    								<th>상태</th>
    								<th>채널</th>
    							</tr>
    						</thead>
    						<tbody>
    							<tr>
                                    <td><input type="checkbox" class="checkbox"></td>
                                    <td>GYOAX2504</td>
                                    <td><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
                                    <td>정율</td>
                                    <td>쑈윈도</td>
                                    <td>사용</td>
                                    <td>PC</td>
								</tr>
                                <tr>
                                    <td><input type="checkbox" class="checkbox"></td>
                                    <td>GYOAX2504</td>
                                    <td><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
                                    <td>정액</td>
                                    <td>입점사</td>
                                    <td>미사용</td>
                                    <td>전체</td>
								</tr>
                                <tr>
                                    <td><input type="checkbox" class="checkbox"></td>
                                    <td>GYOAX2504</td>
                                    <td><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
                                    <td>포인트</td>
                                    <td>반반부담</td>
                                    <td>미사용</td>
                                    <td>전체</td>
								</tr>
							</tbody>
    					</table>
						</form>

    					<div class="section-pagination"><!-- section pagination -->
    	                    <h4 class="sr-only">목록 페이징</h4>
    	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
    	                        <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                            </div>
    	                </div><!-- // section pagination -->

						<div class="section-button"><!-- section-button -->
                            <div class="wrap text-center">
                                <a href="#none" id="" class="button large"><span>취소</span></a>
                                <a href="#none" id="" class="button large primary"><span>선택</span></a>
                            </div>
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
