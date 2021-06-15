<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">취소/교환/반품 조회</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
			
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<!-- <div class="return_wrap">
					<div class="return_sequence fix">
						<p class="title"><span class="tit">교환</span><strong class="num">4</strong><span class="txt">건</span></p>
						<ul class="clearboth">
							<li>
								<a href="#none">
									<span class="txt">교환신청</span>
								</a>
							</li>
							<li>
								<a href="#none">
									<span class="txt">교환대기중</span>
								</a>
							</li>
							<li>
								<a href="#none">
									<span class="txt">교환물품배송</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="return_sequence fix">
						<p class="title"><span class="tit">반품</span><strong class="num">4</strong><span class="txt">건</span></p>
						<ul class="clearboth">
							<li>
								<a href="#none">
									<span class="txt">반품신청</span>
								</a>
							</li>
							<li>
								<a href="#none">
									<span class="txt">반품대기중</span>
								</a>
							</li>
							<li>
								<a href="#none">
									<span class="txt">반품물품배송</span>
								</a>
							</li>
						</ul>
					</div>
		    </div> -->

				<div class="tab_wrap fix">
				    <ul class="tab n3">
				        <li <c:if test="${commandMap.searchState eq 'cancel'}" >class="on"</c:if>><a href="javascript:moveTab('cancel');">취소내역</a></li>
				        <li <c:if test="${commandMap.searchState eq 'swap'}" >class="on"</c:if>><a href="javascript:moveTab('swap');">교환내역</a></li>
				        <li <c:if test="${commandMap.searchState eq 'back'}" >class="on"</c:if>><a href="javascript:moveTab('back');">반품내역</a></li>
				    </ul>
				    <div class="tab_cont" id="tab1">
				    	<h4 class="blind">취소내역</h4>
				    	
				    	<form id="searchForm" name="searchForm">
				    		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				    		<input type="hidden" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
				    		
					    	<div class="inquiry_date_wrap clearboth">
					    		<div class="month_inq">
					    			<strong class="tit">기간별 조회</strong>
					    			<span class="month_box clearboth">
					    				<span class="inline">
					    					<input type="radio" id="month1" name="month" value="-30" class="inp_radio">
					    					<label for="month1" class="label">
												<em><i class="lato bold">1</i>개월</em>
					    					</label>
					    				</span>
										<span class="inline">
					    					<input type="radio" id="month3" name="month" value="-90" class="inp_radio">
					    					<label for="month3" class="label">
					    						<em><i class="lato bold">3</i>개월</em>
					    					</label>
					    				</span>
					    				<span class="inline">
					    					<input type="radio" id="month6" name="month" value="-180" class="inp_radio">
					    					<label for="month6" class="label">
					    						<em><i class="lato bold">6</i>개월</em>
					    					</label>
					    				</span>
					    				<span class="inline">
					    					<input type="radio" id="month12" name="month" value="-365" class="inp_radio">
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
					    					<input type="text" id="dateA" name="searchStartDate" class="inp_txt" title="조회 시작일 입력">
					    				</span>
					    				<span class="hyphen"> ~ </span>
					    				<span class="inline">
						    				<input type="text" id="dateB" name="searchEndDate" title="조회 종료일 입력">
						    			</span>
					    				<button onclick="search()" type="button" class="btn inp_search">
					    					<em class="blind">검색하기</em>
					    				</button>
					    			</span>
					    		</div>
					    	</div>
						</form>


			    	<div class="table_wrap mb95">
						<table class="tb_col">
							<caption>취소내역 조회 : 신청일, 주문일/주문번호, 상품정보, 진행상태 출력 표입니다.</caption>
							<colgroup>
								<col style="width:13%;">
								<col style="width:16%;">
								<col>
								<col style="width:16%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">신청일</th>
									<th scope="col">주문일/주문번호</th>
									<th scope="col">상품정보</th>
									<th scope="col">진행상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty list}">
										<c:forEach var="data" items="${list }" varStatus="status">
											<tr>
												<c:if test="${data.ORD_RNK eq 1 }">
													<td rowspan="<c:out value="${data.ORD_MST_CNT }" />"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd"/>
														<a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" class="btn order view">상세정보</a>
													</td>
													<td rowspan="<c:out value="${data.ORD_MST_CNT }" />"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd"/>
														<em class="order_num">(<c:out value="${data.ORD_MST_CD }" />)</em>
														<a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" class="btn order view">주문상세보기</a>
													</td>
												</c:if>
												<td class="left">
													<div class="product_info clearboth">
														<div class="img">
															<a href="#" class="product_thumb">
																<img src="<c:out value="${cdnDomain }" /><c:out value="${data.PRODUCT_THUM_IMG }" />" alt="<c:out value="${data.PRD_IMAGE_ALT }" />">
															</a>
														</div>
														<div class="txt">
															<span class="brand">[${data.VDR_MST_NM }] <c:out value="${data.PRD_MST_NM}"></c:out></span>
															<a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />')" class="item_name"><c:out value="${data.PRD_IMAGE_ALT }"/></a>
															<!-- TODO 상품 정보 수정 -->
															<span class="item_info">${data.ORD_PRD_COLOR_VAL } / ${data.ORD_PRD_SIZE_VAL } / ${data.ORD_PRD_ORD_CNT }개</span>
														</div>
													</div>
												</td>
												<td>
													<span class="order_state"><c:out value="${data.ORD_PRD_ORD_STATE_NM }" /></span>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								
							</tbody>
						</table>
						</div>

						<form id="frm" name="frm">
							<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
			                <input type="hidden" name="ORD_MST_CD" value=""/> 
			                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
			                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
			                <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
			                <input type="hidden" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
		                
							<div class="pagination">
								<ui:frontpaging paging="${paging }" jsFunction="goPage" />
							</div>
						</form>
						<!-- //pagination -->

						<c:choose>
							<c:when test="${commandMap.searchState eq 'swap'}">
								<div class="step_attention_wp w5">
									<strong class="tit">교환 안내</strong>
									<ul>
										<li>
											<p class="step">STEP 01</p>
											<p class="title">교환접수</p>
											<p class="txt">교환 신청이<br>접수되었습니다.</p>
										</li>
										<li>
											<p class="step">STEP 02</p>
											<p class="title">교환대기중</p>
											<p class="txt">판매자가<br>교환 접수에 대해<br>확인하였습니다</p>
											<p class="cmt"><span>교환 접수 철회 가능</span></p>
										</li>
										<li>
											<p class="step">STEP 03</p>
											<p class="title">교환승인</p>
											<p class="txt">교환 신청한 상품을 판매자가<br>회수 대기중에 있습니다.<br>교환 신청하신 상품에 <br>이상이 있을 경우에는 교환처리가<br>되지 않을 수 있습니다.</p>
										</li>
										<li>
											<p class="step">STEP 04</p>
											<p class="title">교환배송중</p>
											<p class="txt">교환 상품이<br>고객님께 배송중입니다.</p>
										</li>
										<li>
											<p class="step">STEP 05</p>
											<p class="title">교환완료</p>
											<p class="txt">교환 상품이<br>고객님께 도착하였습니다. </p>
										</li>
									</ul>
								</div>
								<div class="attention_list_wrap gray mt95">
									<strong class="tit">교환/반품이 불가능한 경우</strong>
									<ul>
										<li>고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</li>
										<li>고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(수선등).</li>
										<li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</li>
										<li>복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 마이페이지 1:1문의를 이용해 주시기 바랍니다.) </li>
									</ul>
									<p class="desc">고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.(색상 교환, 사이즈 교환 등 포함)</p>
								</div>
							</c:when>
							<c:when test="${commandMap.searchState eq 'back'}">
								<div class="step_attention_wp w4">
									<strong class="tit">반품 안내</strong>
									<ul>
										<li>
											<p class="step">STEP 01</p>
											<p class="title">반품접수</p>
											<p class="txt">반품 신청이<br>접수되었습니다.</p>
										</li>
										<li>
											<p class="step">STEP 02</p>
											<p class="title">반품대기중</p>
											<p class="txt">판매자가<br>반품 접수에 대해<br>확인하였습니다. </p>
											<p class="cmt"><span>반품 접수 철회 가능</span></p>
										</li>
										<li>
											<p class="step">STEP 03</p>
											<p class="title">반품승인</p>
											<p class="txt">반품 신청한 상품을<br>판매자가 회수 대기중에<br>있습니다.</p>
										</li>
										<li>
											<p class="step">STEP 04</p>
											<p class="title">반품완료</p>
											<p class="txt">반품 상품을 확인 후 이상이<br>없을 경우 반품 승인되며,<br>결제 수단별 환불 절차에 따라<br>환불이 진행됩니다.</p>
										</li>
									</ul>
								</div>
								<div class="attention_list_wrap gray mt95">
									<strong class="tit">교환/반품이 불가능한 경우</strong>
									<ul>
										<li>고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</li>
										<li>고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(수선등).</li>
										<li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</li>
										<li>복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 마이페이지 1:1문의를 이용해 주시기 바랍니다.) </li>
									</ul>
									<p class="desc">고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.(색상 교환, 사이즈 교환 등 포함)</p>
								</div>
							</c:when>
						</c:choose>
					

				    </div>
				</div>
				<!-- //tab_wrap -->

			</div>
			<!-- //sub_content -->
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	var $searchForm = $("#searchForm");
	var $frm = $("#frm");
	
	// 탭 이동
	moveTab = function (tabId){
		
			$searchForm.find("input[name='cPage']").val(1);
			$searchForm.find("input[name='searchState']").val(tabId);
			
			
		var actionUrl = "";
		
		if(tabId == "cancel" ){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myOrderCancelBackList.do?seartState="+tabId;
		}else if(tabId == "swap"){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myOrderCancelBackList.do?seartState="+tabId;
		}else if(tabId == "back"){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myOrderCancelBackList.do?searchState="+tabId;
		}else{
			alert("올바르지 않은 접근입니다.");
			return false;
		}
		     
		$searchForm.attr({"action":actionUrl, "target":"_self", "method":"get"}).submit();
	    
	};
	
	// 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myOrderCancelBackList.do", "target":"_self", "method":"get"}).submit();
    };
    
 	// 상세페이지 이동
	goOrderView = function(ordMstCd){
		$frm.find("input[name='ORD_MST_CD']").val(ordMstCd);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingInfo.do", "target":"_self", "method":"get"}).submit();
	};
});

</script>

