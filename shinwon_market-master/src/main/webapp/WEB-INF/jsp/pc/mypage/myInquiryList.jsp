<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">1:1 문의</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
				<div class="tab_wrap fix">
					
				    <ul class="tab n2">
				        <li class="on"><a href="#incomplete">답변대기</a></li>
				        <li><a href="#complete">답변완료</a></li>
				    </ul>
				    
				    <div class="tab_cont" id="incomplete">
				    	<h4 class="blind">답변대기</h4>
				    	<div class="inquiry_date_wrap clearboth">
				    		<div class="month_inq">
				    			<strong class="tit">기간별 조회</strong>
				    			<span class="month_box clearboth">
				    				<span class="inline">
				    					<input type="radio" id="incomplete_month1" name="incomplete_month" value="1" class="inp_radio" checked="checked">
				    					<label for="incomplete_month1" class="label">
											<em><i class="lato bold">1</i>개월</em>
				    					</label>
				    				</span>
									<span class="inline">
				    					<input type="radio" id="incomplete_month3" name="incomplete_month" value="3" class="inp_radio">
				    					<label for="incomplete_month3" class="label">
				    						<em><i class="lato bold">3</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="incomplete_month6" name="incomplete_month" value="6" class="inp_radio">
				    					<label for="incomplete_month6" class="label">
				    						<em><i class="lato bold">6</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="incomplete_month12" name="incomplete_month" value="12" class="inp_radio">
				    					<label for="incomplete_month12" class="label">
				    						<em><i class="lato bold">12</i>개월</em>
				    					</label>
				    				</span>
				    			</span>
				    		</div>
				    		<div class="day_inq">
				    			<strong class="tit">일자별 조회</strong>
				    			<span class="day_box">
				    				<span class="inline">
				    					<input type="text" id="incomplete_beginning" class="inp_txt date_start" title="조회 시작일 입력">
				    				</span>
				    				<span class="hyphen"> ~ </span>
				    				<span class="inline">
					    				<input type="text" id="incomplete_finish" class="inp_txt date_end" title="조회 종료일 입력">
					    			</span>
				    				<button type="button" class="btn inp_search">
				    					<em class="blind">검색하기</em>
				    				</button>
				    			</span>
				    		</div>
				    	</div>
				    	<!-- //inquiry_date_wrap -->

				    	<script>
							$(function(){
								$.fn.datePic();
							});
						</script>

						<div class="table_wrap mb95">
							<div class="top_btn">
								<a href="<c:out value="${frontDomain }"/>/pc/mypage/myInquiryForm.do" class="btn_inq">문의하기</a>
							</div>
							<table class="tb_col">
								<caption>1:1 문의 : 작성일, 상담유형, 제목 출력 표입니다.</caption>
								<colgroup>
									<col style="width:15%;">
									<col style="width:17%;">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">작성일</th>
										<th scope="col">상담유형</th>
										<th scope="col">제목</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty list }">
											<c:forEach var="list" items="${list }" varStatus="i">
												<c:if test="${list.MEM_ADV_RPL_YN eq 'N' }">
														<tr>
															<td><ui:formatDate pattern="yyyy-MM-dd" value="${list.MEM_ADV_REG_DT }"/></td>
															<td><c:out value="${list.MEM_ADV_QST_TYPE_NM }"/></td>
															<td class="left">
																<a href="javascript:goInquiryEdit('${list.MEM_ADV_IDX }');" class="tit_link"><c:out value="${list.MEM_ADV_TITLE }"/></a>
															</td>
														</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3">
													<div class="box">
														<span class="txt">등록된 문의가 없습니다.</span>
													</div>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>

						<div class="pagination">
			                <div class="section-pagination"><!-- section pagination -->
			                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
			                </div><!-- // section pagination -->
						</div>
						
						<!-- //pagination -->

				    </div>
				    <!-- //tab1 -->
				    
				    <div class="tab_cont" id="complete">
				    	<h4 class="blind">답변대기</h4>
				    	<div class="inquiry_date_wrap clearboth">
				    		<div class="month_inq">
				    			<strong class="tit">기간별 조회</strong>
				    			<span class="month_box clearboth">
				    				<span class="inline">
				    					<input type="radio" id="complete_month1" name="complete_month" value="1" class="inp_radio" checked="checked">
				    					<label for="complete_month1" class="label">
											<em><i class="lato bold">1</i>개월</em>
				    					</label>
				    				</span>
									<span class="inline">
				    					<input type="radio" id="complete_month3" name="complete_month" value="3" class="inp_radio">
				    					<label for="complete_month3" class="label">
				    						<em><i class="lato bold">3</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="complete_month6" name="complete_month" value="6" class="inp_radio">
				    					<label for="complete_month6" class="label">
				    						<em><i class="lato bold">6</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="complete_month12" name="complete_month" value="12" class="inp_radio">
				    					<label for="complete_month12" class="label">
				    						<em><i class="lato bold">12</i>개월</em>
				    					</label>
				    				</span>
				    			</span>
				    		</div>
				    		<div class="day_inq">
				    			<strong class="tit">일자별 조회</strong>
				    			<span class="day_box">
				    				<span class="inline">
				    					<input type="text" id="complete_beginning" class="inp_txt  date_start" title="조회 시작일 입력">
				    				</span>
				    				<span class="hyphen"> ~ </span>
				    				<span class="inline">
					    				<input type="text" id="complete_finish" class="inp_txt date_end" title="조회 종료일 입력">
					    			</span>
				    				<button type="button" class="btn inp_search">
				    					<em class="blind">검색하기</em>
				    				</button>
				    			</span>
				    		</div>
				    	</div>
				    	<!-- //inquiry_date_wrap -->

				    	<script>
							$(function(){
								$.fn.datePic();
							});
						</script>

						<div class="table_wrap mb95">
							
							<table class="tb_col">
								<caption>1:1 문의 : 작성일, 상담유형, 제목 출력 표입니다.</caption>
								<colgroup>
									<col style="width:15%;">
									<col style="width:17%;">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">작성일</th>
										<th scope="col">상담유형</th>
										<th scope="col">제목</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty list }">
											<c:forEach var="list" items="${list }" varStatus="i">
												<c:if test="${list.MEM_ADV_RPL_YN eq 'Y' }">
													<tr>
														<td><ui:formatDate pattern="yyyy-MM-dd" value="${list.MEM_ADV_REG_DT }"/></td>
														<td><c:out value="${list.MEM_ADV_QST_TYPE_NM }"/></td>
														<td class="left">
															<a href="javascript:goInquiryDetail('<c:out value="${list.MEM_ADV_IDX }" />')" class="tit_link"><c:out value="${list.MEM_ADV_TITLE }"/></a>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3">
													<div class="box">
														<span class="txt">등록된 문의가 없습니다.</span>
													</div>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>

						<div class="pagination">
			                <div class="section-pagination"><!-- section pagination -->
			                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
			                </div><!-- // section pagination -->
						</div>
						
						<!-- //pagination -->

				    </div>

				</div>
				<!-- //tab_wrap -->


			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
<form id="pageForm" name="pageForm">
	<input type="hidden" name="cPage" value="${commandMap.cPage }"/>
</form>
<!-- 
<form id="tabForm" name="tabForm">
	<input type="hidden" id="replyStatus" name="replyStatus" value="">
	<input type="hidden" id="cPage" name="cPage" value="">
</form>
 -->
<form id="detailForm" name="detailForm">
	<input type="hidden" id="MEM_ADV_IDX" name="MEM_ADV_IDX" value="<c:out value="${commandMap.MEM_ADV_IDX }"/>">
	<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage }"/>">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
	$(function(){
		
		var replyStatus = "<c:out value="${commandMap.replyStatus }"/>"; 
		
		if(replyStatus == ""){ }
		
		var $pageForm = $("#pageForm");
		
		// 페이지 이동
		goPage = function(cPage){
	        $pageForm.find("input[name='cPage']").val(cPage);
	        $pageForm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 탭 이동
/* 	    moveTab = function(status){
	    	var $tabForm = $("#tabForm");
	    	
    		$tabForm.find("input[name='replyStatus']").val(status);
	    	$tabForm.find("input[name='cPage']").val(1);
	    	$tabForm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
	    } */
	    
	    // 1:1문의 상세화면 이동
	    goInquiryDetail = function(memAdvIdx){
			var $detailForm = $("#detailForm");
			
			$detailForm.find("input[name='MEM_ADV_IDX']").val(memAdvIdx);
			$detailForm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myInquiryView.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	 	// 1:1문의 상세화면 이동
	    goInquiryEdit= function(memAdvIdx){
			var $detailForm = $("#detailForm");
			
			$detailForm.find("input[name='MEM_ADV_IDX']").val(memAdvIdx);
			$detailForm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myInquiryEdit.do", "target":"_self", "method":"post"}).submit();
	    };
	});
	
</script>

