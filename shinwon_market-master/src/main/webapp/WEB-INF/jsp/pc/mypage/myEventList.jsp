<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">이벤트 참여현황</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<div class="inquiry_date_wrap clearboth">
		    		<div class="month_inq">
		    			<strong class="tit">응모기간별 조회</strong>
		    			<span class="month_box clearboth">
		    				<span class="inline">
		    					<input type="radio" id="month1" name="month" value="1" class="inp_radio">
		    					<label for="month1" class="label">
									<em><i class="lato bold">1</i>개월</em>
		    					</label>
		    				</span>
							<span class="inline">
		    					<input type="radio" id="month3" name="month" value="3" class="inp_radio">
		    					<label for="month3" class="label">
		    						<em><i class="lato bold">3</i>개월</em>
		    					</label>
		    				</span>
		    				<span class="inline">
		    					<input type="radio" id="month6" name="month" value="6" class="inp_radio">
		    					<label for="month6" class="label">
		    						<em><i class="lato bold">6</i>개월</em>
		    					</label>
		    				</span>
		    				<span class="inline">
		    					<input type="radio" id="month12" name="month" value="12" class="inp_radio">
		    					<label for="month12" class="label">
		    						<em><i class="lato bold">12</i>개월</em>
		    					</label>
		    				</span>
		    			</span>
		    		</div>
		    		<div class="day_inq">
		    			<strong class="tit">일자별 조회</strong>
		    			<span class="day_box">
		    				<span class="inline">
		    					<input type="text" id="beginning" class="inp_txt" title="조회 시작일 입력">
		    				</span>
		    				<span class="hyphen"> ~ </span>
		    				<span class="inline">
			    				<input type="text" id="finish" class="inp_txt" title="조회 종료일 입력">
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
						<caption>이벤트 참여현황 : 이벤트명, 이벤트 기간, 응모일, 상태, 발표일, 당첨자 발표 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:20.6666%;">
							<col style="width:12.6666%;">
							<col style="width:9.6666%;">
							<col style="width:12.6666%;">
							<col style="width:17.6666%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">이벤트명</th>
								<th scope="col">이벤트 기간</th>
								<th scope="col">응모일</th>
								<th scope="col">상태</th>
								<th scope="col">발표일</th>
								<th scope="col">당첨자 발표</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list }">
									<c:forEach var="list" items="${list }" varStatus="status">
										<tr>
											<td class="left"><a href="#n"><c:out value="${list.EVT_JOIN_CHN_TYPE }" /></a></td>
											<td><ui:formatDate value="${list.EVT_MST_REG_DT }" pattern="yyyy-MM-dd"/><br /> ~  <ui:formatDate value="${list.EVT_MST_ED_DT }" pattern="yyyy-MM-dd"/></td>
											<td><ui:formatDate value="${list.EVT_JOIN_REG_DT }" pattern="yyyy-MM-dd"/></td>
											<td><c:out value="${list.EVT_MST_STATUS }" /></td>
											<c:if test="${list.EVT_WIN_CNT > 0 }">
												<td>
													<ui:formatDate value="${list.EVT_WIN_REG_DT }" pattern="yyyy.MM.dd"/>
												</td>
												<td>
													<a href="<c:out value="${frontDomain }"/>/pc/customer/eventWinView.do?EVT_WIN_IDX=<c:out value="${list.EVT_WIN_IDX }" />" class="btn order prize">당첨자 보기</a>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="no_data">
										<td colspan="6" class="box">
											<span class="txt">참여한 이벤트가 없습니다.</span>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<form id="pageFrm" name="pageFrm">
					<div class="pagination">
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
					</div>
				</form>
				<!-- //pagination -->


			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	goPage = function (cPage){
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myEventList.do", "target":"_self", "method":"post"}).submit();
    };
});
</script>