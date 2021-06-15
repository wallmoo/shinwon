<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
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
		<div id="contents"><!-- contents -->
			<div class="container">
				<h2 class="title"><span>대시보드</span></h2>

				<h3 class="title"><span><a href="#">매출현황</a> (접속당일, 결제완료 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col style="width:auto;">
						<col style="width:auto;">
						<col style="width:auto;">
						<col style="width:auto;">
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>주문건수</th>
							<th>주문수량</th>
							<th>결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>입점사</th>
							<td>500</td>
							<td>1,354</td>
							<td>999,999,999</td>
						</tr>
						<tr>
							<th>입점사(자사)</th>
							<td>420</td>
							<td>987</td>
							<td>999,999,999</td>
						</tr>
					</tbody>
				</table>

				<h3 class="title"><span><a href="<c:out value="${serverDomain}"/>/am/order/orderList.do?searchYn=Y&searchStartDate=<ui:formatDate value="${commandMap.searchStartDate}" pattern="yyyy-MM-dd"/>&searchEndDate=<ui:formatDate value="${commandMap.searchEndDate}" pattern="yyyy-MM-dd"/>">주문/배송 현황</a> (접속 당일을 포함한 최근 30일 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
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
							<th>구분</th>
							<th>입금대기</th>
							<th>결제완료</th>
							<th>배송준비 중</th>
							<th>배송 보류</th>
							<th>배송 중</th>
							<th>구매확정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>일반택배발송</th>
							<td>23</td>
							<td>956</td>
							<td>52</td>
							<td>21</td>
							<td>450</td>
							<td>960</td>
						</tr>
						<tr>
							<th>매장택배발송</th>
							<td>23</td>
							<td>956</td>
							<td>52</td>
							<td>21</td>
							<td>450</td>
							<td>960</td>
						</tr>
						<!-- <tr>
							<td><fmt:formatNumber value="${orderSummary.PAY_READY_CNT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderSummary.PAY_CNT}" type="number"/></td>
							<td><span class="strong"><fmt:formatNumber value="${orderSummary.PRD_SEND_READY_CNT}" type="number"/></span></td>
							<td><span class="strong"><fmt:formatNumber value="${orderSummary.PRD_SEND_CNT}" type="number"/></span></td>
							<td><span class="strong"><fmt:formatNumber value="${orderSummary.PRD_SEND_END_CNT}" type="number"/></span></td>
						</tr> -->
					</tbody>
				</table>
				<table class="table-col table-b">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>입금대기</th>
							<th>결제완료</th>
							<th>상품준비 중</th>
							<th>매장수령</th>
							<th>구매확정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>매장픽업</th>
							<td>15</td>
							<td>250</td>
							<td>25</td>
							<td>325</td>
							<td>453</td>
						</tr>
					</tbody>
				</table>
				
				<h3 class="title">
					<span>클레임 현황 (접속 당일 누적 주문상태 기준)</span>
				</h3>             
				
				<table class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>취소접수</th>
							<th>교환접수</th>
							<th>반품접수</th>
							<th>환불접수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>입점사</th>
							<td>32</td>
							<td>10</td>
							<td>23</td>
							<td>5</td>
							<!-- <td><fmt:formatNumber value="${orderClaim.CANCEL_CNT}" type="number"/></td>
							<td><span class="strong"><fmt:formatNumber value="${orderClaim.PRD_SWAP_CNT}" type="number"/></span></td>
							<td><span class="strong"><fmt:formatNumber value="${orderClaim.PRD_BACK_CNT}" type="number"/></span></td>
							<td><fmt:formatNumber value="${orderClaim.REFUND_CNT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderClaim.SCM_CNL_Y_CNT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderClaim.SCM_CNL_D_CNT}" type="number"/></td>
							<td><fmt:formatNumber value="${orderClaim.SCM_CNL_C_CNT}" type="number"/></td> -->
						</tr>
						<tr>
							<th>입점사(자사)</th>
							<td>5</td>
							<td>2</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>
				</table><!-- // table -->
				
				<h3 class="title">
					<span><a href="<c:out value="${serverDomain}"/>/am/product/basicProductList.do">상품판매상태 현황</a> (접속 당일 기준)</span>
				</h3>                 
				
				<table class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>판매중</th>
							<th>미판매</th>
							<th>품절</th>
							<th>일부품절</th>
							<th>전체</th>	                        	                       
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>입점사</th>
							<td>560</td>
							<td>23</td>
							<td>12</td>
							<td>3</td>
							<td>598</td>
						</tr>
						<tr>
							<th>입점사(자사)</th>
							<td>560</td>
							<td>23</td>
							<td>12</td>
							<td>3</td>
							<td>598</td>
						</tr>
						<!-- <c:choose>
							<c:when test="${not empty selectProductSelSummaryList }">
								<c:forEach var="row" items="${selectProductSelSummaryList }" varStatus="i">
									<tr>
										<td><c:out value="${row.PRD_MST_TITLE }" /></td>
										<td><fmt:formatNumber value="${row.SEL_CNT }" groupingUsed="true" /></td>
										<td><fmt:formatNumber value="${row.NOT_SEL_CNT }" groupingUsed="true" /></td>
										<td><fmt:formatNumber value="${row.OUT_CNT }" groupingUsed="true" /></td>
										<td><fmt:formatNumber value="${row.TOT_CNT }" groupingUsed="true" /></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr><td colspan=6>등록된 상품판매상태가 없습니다.</td></tr>
							</c:otherwise>
						</c:choose> -->              
					</tbody>
				</table><!-- // table -->
				
				<h3 class="title">
					<span><a href="<c:out value="${serverDomain}"/>/am/member/infoMemberList.do">회원현황</a>(접속 당일 기준)</span>
				</h3> 
				
				<table class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>일반회원</th>
							<th>통합회원</th>
							<th>SNS회원</th>
							<th>제휴사회원</th>
							<th>탈퇴회원</th>
							<th>휴먼회원</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>신규</th>
							<td>20</td>
							<td>12</td>
							<td>45</td>
							<td>5</td>
							<td>5</td>
							<td>2</td>
						</tr>
						<tr>
							<th>월 누적</th>
							<td>20</td>
							<td>12</td>
							<td>45</td>
							<td>5</td>
							<td>5</td>
							<td>2</td>
						</tr>
						<tr>
							<th>총 누적</th>
							<td>20</td>
							<td>12</td>
							<td>45</td>
							<td>5</td>
							<td>5</td>
							<td>2</td>
						</tr>
						<!-- <tr>
							<td>신규</td>
							<td><fmt:formatNumber value="${memberSummary.BASIC_NEW_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.SIMPLE_NEW_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.COMP_NEW_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.OUT_NEW_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.REST_NEW_CNT }" groupingUsed="true"/></td>
						</tr>
						<tr>
							<td>월누적</td>
							<td><fmt:formatNumber value="${memberSummary.BASIC_MONTH_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.SIMPLE_MONTH_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.COMP_MONTH_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.OUT_MONTH_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.REST_MONTH_CNT }" groupingUsed="true"/></td>
						</tr>
						<tr>
							<td>총누적</td>
							<td><fmt:formatNumber value="${memberSummary.BASIC_TOTAL_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.SIMPLE_TOTAL_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.COMP_TOTAL_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.OUT_TOTAL_CNT }" groupingUsed="true"/></td>
							<td><fmt:formatNumber value="${memberSummary.REST_TOTAL_CNT }" groupingUsed="true"/></td>
						</tr> -->    
					</tbody>
				</table><!-- // table -->
				
				<h3 class="title"><span><a href="#">1:1문의</a> (접속 당일 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>문의우형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>로그인</th>
							<td class="al"><a href="#">사이즈가 어떻게 되나요?</a></td>
							<td><a href="#">홍길동(Ididid)</a></td>
							<td>2019-01-02 09:23:12</td>
							<td>답변대기</td>
						</tr>
						<tr>
							<th>구매관련</th>
							<td class="al"><a href="#">사이즈가 어떻게 되나요?</a></td>
							<td><a href="#">홍길동(Ididid)</a></td>
							<td>2019-01-02 09:23:12</td>
							<td>답변완료</td>
						</tr>
					</tbody>
				</table>

				<h3 class="title"><span><a href="#">셀러문의</a> (접속 당일 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>셀러명</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>이루마</th>
							<td class="al"><a href="#">사이즈가 어떻게 되나요?</a></td>
							<td><a href="#">홍길동(Ididid)</a></td>
							<td>2019-01-02 09:23:12</td>
							<td>답변대기</td>
						</tr>
						<tr>
							<th>seller</th>
							<td class="al"><a href="#">사이즈가 어떻게 되나요?</a></td>
							<td><a href="#">홍길동(Ididid)</a></td>
							<td>2019-01-02 09:23:12</td>
							<td>답변완료</td>
						</tr>
					</tbody>
				</table>

				<h3 class="title"><span><a href="#">상품후기</a> (접속 당일 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>입점사명</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>나이키</th>
							<td>S620325</td>
							<td class="al">완전패딩점퍼</td>
							<td class="al"><a href="#">사이즈가 딱 맞아요.</a></td>
						</tr>
						<tr>
							<th>나이키</th>
							<td>S620325</td>
							<td class="al">완전패딩점퍼</td>
							<td class="al"><a href="#">사이즈가 딱 맞아요.</a></td>
						</tr>
					</tbody>
				</table>

				<h3 class="title"><span><a href="#">OOTD현황</a> (접속 당일 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col style="width:80px;">
						<col style="width:auto;">
						<col style="width:100px;">
					</colgroup>
					<thead>
						<tr>
							<th>&nbsp;</th>
							<th>제목</th>
							<th>댓글수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
							<td class="al"><a href="#">사이즈가 딱 맞아요.</a></td>
							<td>200</td>
						</tr>
						<tr>
							<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
							<td class="al"><a href="#">사이즈가 딱 맞아요.</a></td>
							<td>200</td>
						</tr>
					</tbody>
				</table>

				<h3 class="title"><span><a href="#">셀러픽현황</a> (접속 당일 기준)</span></h3>
				<table class="table-col table-b">
					<colgroup>
						<col style="width:100px;">
						<col style="width:80px;">
						<col style="width:auto;">
					</colgroup>
					<thead>
						<tr>
							<th>입점사명</th>
							<th colspan="2">제목</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>나이키</th>
							<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
							<td class="al"><a href="#">사이즈가 딱 맞아요.</a></td>
						</tr>
						<tr>
							<th>베스트밸리</th>
							<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
							<td class="al"><a href="#">사이즈가 딱 맞아요.</a></td>
						</tr>
					</tbody>
				</table>





				<h3 class="title">
					<span>최근 등록한 상품Q&A</span>
				</h3>     
				
				<table cellspacing="0" class="table-col table-b"><!-- table -->
					<colgroup>
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>상품코드</th>
							<th>상품명</th>
							<th>내용</th>	                        	                        	                      
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty scmProductInquiryList }">
								<c:forEach var="scmProductInquiryRow" items="${scmProductInquiryList }" varStatus="i">
									<tr>
										<td><c:out value="${scmProductInquiryRow.BRD_PRD_MST_CD }" /></td>
										<td><c:out value="${scmProductInquiryRow.BRD_PRD_MST_NM }"/></td>
										<td><c:out value="${scmProductInquiryRow.BRD_INQ_CONTENTS }"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr><td class="td_no_result">등록된 상품Q&A가 없습니다.</td></tr>
							</c:otherwise>
						</c:choose>         
					</tbody>
				</table><!-- // table -->
				
				<h3 class="title">
					<span>최근 등록한 상품평</span>
				</h3> 
				
				<table cellspacing="0" class="table-col table-b"><!-- table -->
					<colgroup>
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>상품코드</th>
							<th>상품명</th>
							<th>내용</th>	                        	                        	                      
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty scmProductCommentList }">
								<c:forEach var="scmProductCommentRow" items="${scmProductCommentList }" varStatus="i">
									<tr>
										<td><c:out value="${scmProductCommentRow.PRD_PRD_MST_CD }" /></td>
										<td><c:out value="${scmProductCommentRow.PRD_MST_NM }" /></td>
										<td><c:out value="${scmProductCommentRow.PRD_REV_TITLE }"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr><td class="td_no_result">등록된 상품평이 없습니다.</td></tr>
							</c:otherwise>
						</c:choose>     
					</tbody>
				</table><!-- // table -->
			</div>

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
<script>
$(function(){

});
//-->
</script>

</body>
</html>
