<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">
	<!-- .modal -->
	<div class="modal">
		<!-- .modal-wrapper -->
		<div class="modal-wrapper">
			<!-- .modal-inner -->
			<div class="modal-inner">
				<form id="frm" name="frm" action="" method="post">
					<fieldset>
						<input type="hidden" name="pageSize" value="5"/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }"/>" />
						<h3 class="title"><span>보류내역보기</span></h3>
						<ul class="pending_history_list">
							<!-- Dev S : loop -->
							<c:forEach var="row" items="${productHoldOffInfoList}" varStatus="status">
								<li>
									<p class="text-right">${row.VDR_HLD_REG_DT}&nbsp;등록</p>
									<table class="table-row table-a">
										<caption>보류내역정보의 보류사유와 상세사유를 알 수 있는 표 입니다.</caption>
										<colgroup>
											<col style="width:20%;">
											<col style="width:80%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">보류사유</th>
												<td>
													<div class="tbl_line">
														<c:set var="title_txt" value=""></c:set>
														<c:if test="${row.VDR_HLD_PRC_YN eq 'Y'}">
															<c:set var="title_txt" value="${title_txt}${','} 판매가"></c:set>
														</c:if>
														<c:if test="${row.VDR_HLD_NM_YN eq 'Y'}">
															<c:set var="title_txt" value="${title_txt}${','} 상품명"></c:set>
														</c:if>
														<c:if test="${row.VDR_HLD_CTG_YN eq 'Y'}">
															<c:set var="title_txt" value="${title_txt}${','} 카테고리 "></c:set>
														</c:if>
														<c:if test="${row.VDR_HLD_CNT_YN eq 'Y'}">
															<c:set var="title_txt" value="${title_txt}${','} 영상/이미지"></c:set>
														</c:if>
														<c:if test="${row.VDR_HLD_NFI_YN eq 'Y'}">
															<c:set var="title_txt" value="${title_txt}${','} 고시정보"></c:set>
														</c:if>
														<c:if test="${row.VDR_HLD_ETC_YN eq 'Y'}">
															<c:set var="title_txt" value="${title_txt}${','} 기타"></c:set>
														</c:if>
														${fn:substring(title_txt,2,100) }
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">상세사유</th>
												<td>
													<div class="tbl_line">
														${row.VDR_HLD_DESC}
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</li>
							</c:forEach>
							<!-- Dev E : loop -->
						</ul>
					</fieldset>
				</form>
				<!-- section pagination -->
				<div class="section-pagination">
					<h4 class="sr-only">목록 페이징</h4>
					<div class="wrap">
						<ui:paging paging="${paging }" jsFunction="goPage" />
					</div>
				</div>
				<!-- //section pagination -->
			</div>
			<!-- // .modal-inner -->
		</div>
		<!-- // .modal-wrapper -->
	</div>
	<!-- // .modal -->
	<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script>
		$(function(){
			$(document).on("click","#closePopup",function(){
				self.close();
			});

			// 페이지 이동
			goPage = function (cPage)
			{
				var $frm = $("#frm");
				$frm.find("input[name='cPage']").val(cPage);
				$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/pendingHistoryPopup.do", "target":"_self", "method":"post"}).submit();
			};
		});
	</script>
</body>
</html>