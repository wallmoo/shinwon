<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>


<!-- Content -->
	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ********************************s********************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->


			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">주문/배송조회</h2>
			</div>
			<!--// Title -->
			
			
			
			<div class="sub_content">
				<div class="tab_wrap fix">
				
				<form name="frm" id="frm"		>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }"/>
	              	<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
	              	<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchMaxDate" value="<c:out value="${commandMap.searchMaxDate }"/>"/>
                    <input type="hidden" name="searchMinDate" value="<c:out value="${commandMap.searchMinDate }"/>"/>
                    
				    <ul class="tab n2">
				        <li	id="tab1" <c:if test="${commandMap.tabId == 'tab1' }" >class="on"</c:if>>
                        	<a href="javascript:moveTab('tab1');">배송상품 주문내역</a>
                        </li>	
                        <li	id="tab2" <c:if test="${commandMap.tabId == 'tab2' }" >class="on"</c:if>>
                        	<a href="javascirpt:moveTab('tab2');">매장수령 주문내역</a>	
                        </li>	
				    </ul>
				    
				    <div class="tab_cont" id="tab">
				    	<!-- <h4 class="blind">배송상품 주문내역</h4> -->
				    	<div class="inquiry_date_wrap clearboth" >
				    		<div class="month_inq">
				    			<strong class="tit">기간별 조회</strong>
				    			<span class="month_box clearboth">
				    				<span class="inline">
				    					<input type="radio" id="month1" name="month" value="30" class="inp_radio" data-start="beginning" data-end="finish" data-term="-30">
				    					<label for="month1" class="label">
											<em><i class="lato bold">1</i>개월</em>
				    					</label>
				    				</span>
									<span class="inline">
				    					<input type="radio" id="month3" name="month" value="90" class="inp_radio" data-start="beginning" data-end="finish" data-term="-90">
				    					<label for="month3" class="label">
				    						<em><i class="lato bold">3</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="month6" name="month" value="180" class="inp_radio" data-start="beginning" data-end="finish" data-term="-180">
				    					<label for="month6" class="label">
				    						<em><i class="lato bold">6</i>개월</em>
				    					</label>
				    				</span>
				    				<span class="inline">
				    					<input type="radio" id="month12" name="month" value="365" class="inp_radio" data-start="beginning" data-end="finish" data-term="-365">
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
				    					<input type="text" id="beginning" name="searchStartDate" class="inp_txt"  title="조회 시작일 입력" placeholder="- 180일" readonly="readonly" data-target-end="#searchEndDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
				    				</span>
				    				<span class="hyphen"> ~ </span>
				    				<span class="inline">
					    				<input type="text" id="finish" name="searchEndDate" class="inp_txt"  title="조회 종료일 입력" placeholder="TODAY" readonly="readonly" data-target-start="#searchStartDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					    			</span>
				    				<button	id="search" type="button" class="btn inp_search" name="month">
				    					<em class="blind" >검색하기</em>
				    				</button>
				    			</span>
				    		</div>
				    	</div>
						
				    	<script>
				    		
							$(function(){
								$.fn.datePic();
							});
							
						</script>
						

				    	<div class="table_wrap mb95">
							<table class="tb_col">
								<caption>주문/배송 조회 : 주문일, 주문번호, 상품정보, 상품금액, 진행상태 출력 표입니다.</caption>
								<colgroup>
									<col style="width:12%;">
									<col style="width:16%;">
									<col>
									<col style="width:15%;">
									<col style="width:16%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">주문일</th>
										<th scope="col">주문번호</th>
										<th scope="col">상품정보</th>
										<th scope="col">상품금액</th>
										<th scope="col">진행상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty list }">
											<c:forEach var="data" items="${list }" varStatus="status">
												<tr>
													<c:if test="${data.ORD_RNK eq 1 }">
													<td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="date"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
													<td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="order-number">
														<em class="order_num"><c:out value="${data.ORD_MST_CD }" /></em>
														<a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" class="btn order view">주문상세보기</a>
														<a href="#" class="btn order cancel">전체주문취소</a>
													</td>
													</c:if>	
													<td class="left">
														<div class="product_info clearboth">
															<div class="img">
																<a href="javascript:goProductView('<c:out value="${data.ORD_MST_CD }" />');" class="product_thumb">
																	<!-- <img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지"> -->
																	<img src="<c:out value="${cdnDomain }${data.PRODUCT_THUM_IMG}"/>" alt="${data.PRD_IMAGE_ALT}">
																</a>
															</div>
															
															<div class="txt">
																<span class="brand"><c:out value="${row.PRD_MST_NM}" /></span>
																<a href="javascript:goProductView('<c:out value="${data.ORD_MST_CD }" />');" class="item_name"><c:out value="${data.PRD_MST_NM }" /></a>
																<span class="item_info">블랙/1/1<c:out value="${data.OPT_DTL_NM}" /></span>
															</div>
														</div>
													</td>
													<td><fmt:formatNumber value="${data.ORD_MST_PAY_PRC}" type="number"/> 원</td>
													<td>
														<!-- 케이스별 진행상태 -->
														<span class="order_state"><c:out value="${data.ORD_PRD_ORD_STATE_NM }" /></span>
														<!-- TODO 배송중 택배사 정보 수정 -->
														<c:if test="${not empty data.ORD_PRD_IVC_NO }">
															<span class="order_delivery">(<c:out value="${row.DLV_CPN_NM }" />TEST택배<a href="javascript:goDeliveryView" class="btn_txt"><c:out value="${row.ORD_PRD_IVC_NO }" /><c:out value="${row.DLV_CPN_URL }"/>1234567</a>)</span>
														</c:if>
														<c:if test="${data.ORD_PRD_ORD_STATE eq '405' or data.ORD_PRD_ORD_STATE eq '3022' }">
															<a href="javascript:orderCancel('<c:out value="${data.ORD_MST_CD }" />', '<c:out value="${data.ORD_PRD_IDX }" />');" class="btn order cancel">주문취소</a>
														</c:if>
														<c:if test="${data.ORD_PRD_ORD_STATE eq '408' }">
															<a href="#" class="btn order confirm">구매확정</a>
															<a href="javascript:goOrderChange('${data.ORD_MST_CD }', '${data.ORD_PRD_ORD_STATE }', '${data.ORD_PRD_IDX }')" class="btn order confirm">교환신청</a>
															<a href="#" class="btn order confirm">반품신청</a>
														</c:if>
														<c:if test="${data.ORD_PRD_ORD_STATE eq '409' }">
															<a href="#" class="btn order review">상품후기</a>
															<a href="#" class="btn order review">후기보기</a>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</tbody>
							</table>
						</div>
						<div class="pagination">
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
						</div>
						</form>
						<!-- //pagination -->
						

						<div class="step_attention_wp w6">
							<strong class="tit">배송상품 주문/배송 안내</strong>
							<ul>
								<li>
									<p class="step">STEP 01</p>
									<p class="title">입금대기</p>
									<p class="txt">입금이 아직 이뤄지지<br>않았습니다.<br>3일 이내 미 입금시 <br>주문이 자동 취소됩니다. </p>
								</li>
								<li>
									<p class="step">STEP 02</p>
									<p class="title">결제완료</p>
									<p class="txt">판매자가 <br>주문을 확인하기 전<br>입니다. </p>
									<p class="cmt"><span>배송지 변경, 주문취소 가능</span></p>
								</li>
								<li>
									<p class="step">STEP 03</p>
									<p class="title">배송준비중</p>
									<p class="txt">주문하신 <br>상품을 준비 중<br>입니다. </p>
								</li>
								<li>
									<p class="step">STEP 04</p>
									<p class="title">배송중</p>
									<p class="txt">상품이 발송되어<br>고객님께 배송 중<br>입니다.</p>
								</li>
								<li>
									<p class="step">STEP 05</p>
									<p class="title">배송완료</p>
									<p class="txt">상품이<br>고객님께 도착<br>하였습니다. </p>
									<p class="cmt"><span>교환/반품 가능</span></p>
								</li>
								<li>
									<p class="step">STEP 06</p>
									<p class="title">구매확정</p>
									<p class="txt">상품수령 후<br>구매확정을 선택하시면<br>거래가 종료됩니다.<br>배송완료 이후<br>14일 지나면 자동으로 <br>구매확정 됩니다.</p>
									<p class="cmt"><span>상품후기 작성 가능<br>(교환/반품 불가)</span></p>
								</li>
							</ul>
						</div>
						<!-- <div class="attention_list_wrap mt95">
							<strong class="tit">유의사항</strong>
							<ul>
								<li>[주문상세보기]를 클릭하시면 주문상세내역 및 배송조회를 확인할 수 있습니다.</li>
								<li>결제 전 상태에서는 모든 주문건 취소가 가능하며, 출고 완료된 상품은 반품메뉴를 이용하시기 바랍니다.</li>
								<li>상품 일부만 취소/교환/반품을 원하시는 경우 1:1 문의 또는 고객센터(1661-2585)로 문의 부탁드립니다.</li>
								<li>배송처리 이후 14일이 경과되면 자동 구매확정 처리 되며 교환/반품이 불가능합니다.</li>
								<li>상품하자 또는 오배송으로 인한 교환/반품 신청은 1:1 문의 또는 고객센터(1661-2585)로 문의 부탁드립니다.</li>
								<li>가상계좌 결제주문의 경우, 환불금액 입금이 3-4일정도 소요됩니다. (영업일기준)</li>
							</ul>
						</div> -->

				    </div>
				    
				    <!-- //tab1 -->
				</div>
							
				<!-- //tab_wrap -->

			</div>
			<!-- //sub_content -->



		</div>
	
	<!--// Content -->
	


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />nas/cdn/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 -->


	<!-- 취소/교환/분품 폼 -->
	<form id="orderStateForm" name="orderStateForm" method="post" action=""> 
		<input type="hidden" name="ORD_MST_CD" value=""/>
        <input type="hidden" name="ORD_PRD_ORD_STATE" value=""/>
        <input type="hidden" name="ORD_PRD_IDX" value=""/>
        <input type="hidden" name="ORD_PRD_IDX_ARR" value=""/>
        <input type="hidden" name="ORD_PRD_CLE_TYPE" value="all"/>
        <input type="hidden" name="cPage" value="${commandMap.cPage }"/>
	</form>
	
<script>

$(function(){
	//달력
	//$('.btn_calendar').datePickr();
	var $orderStateForm = $("#orderStateForm");
	
	
	//주문배송상세페이지 이동
	goOrderView = function(ordMstCd){
		var $frm = $("#frm");
		$frm.find("input[name='ORD_MST_CD']").val(ordMstCd);
	    $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingInfo.do", "target":"_self", "method":"get"}).submit();
	};
	
	//상품상세페이지 이동
	goProductView = function(prdCd){
		var $frm = $("#frm");
		$frm.find("input[name='PRD_MST_CD']").val(prdCd);
	    $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/product.do?prdMstCd="+prdCd, "target":"_self", "method":"get"}).submit();
	};
	
	
	//페이지 이동
	goPage = function (cPage){
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingList.do", "target":"_self", "method":"get"}).submit();
	    };
        
    // 검색
     search = function(){	
    	var $frm = $("#frm");
    	$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do", "target":"_self", "method":"get"}).submit();
    	
     };
  	// 배송조회 팝업페이지 호출
     goDeliveryView = function (url){	var $frm = $("#frm");
     	goSearchDelivery(url);
     }; 
     
    /* //주문 보기 선택시
    changeSearchDlvGbn = function (idx) {
     	$("#searchDlvGbn_"+idx).prop("checked",true);
     	$("#searchDlvGbn_"+idx).trigger("change");
     	$("#searchDlvGbnBtn_"+idx).siblings().removeClass("btn_rd");
     	$("#searchDlvGbnBtn_"+idx).siblings().addClass("btn_white");
     	$("#searchDlvGbnBtn_"+idx).removeClass("btn_white");
     	$("#searchDlvGbnBtn_"+idx).addClass("btn_rd");
     	
     	search();
	} */
    
    moveTab = function (tabId){
	
		var $frm = $("#frm");
			$frm.find("input[name='cPage']").val(1);
			$frm.find("input[name='tabId']").val(tabId);
			
			
		var actionUrl = "";
		
		if(tabId == "tab1" ){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingList.do";
		}else if(tabId == "tab2"){
			actionUrl ="<c:out value="${serverSslDomain}"/>/pc/mypage/myOfflineShoppingList.do";
		}else{
			alert("올바르지 않은 접근입니다.");
			return false;
		}
		     
		$frm.attr({"action":actionUrl, "target":"_self", "method":"get"}).submit();
	    
	};
	
	// 주문취소 버튼 클릭
	orderCancel = function(orderCd, ordPrdIdx){
		
		var state = "<c:out value="${Code.OST_CANCEL }" />";
		
		$orderStateForm.find("input[name='ORD_MST_CD']").val(orderCd);
		$orderStateForm.find("input[name='ORD_PRD_ORD_STATE']").val(state);
		$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
		
		$orderStateForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/orderCancel.do", "target":"_self", "method":"post"}).submit();
	}
	
	// 교환신청 버튼 클릭 이벤트
	goOrderChange = function(ordPrdCd, ordPrdState, ordPrdIdx){
    	
    	if(ordPrdState != "${Code.OST_SEND_END}"){
    		alert("교환신청은 배송완료 상태의 상품만 가능합니다.");
    		return;
    	}
    	
       	$orderStateForm.find("input[name='ORD_MST_CD']").val(ordPrdCd);
       	$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
        
    	if(ordPrdIdx != ""){
    		$.ajax({
        		type: "post",
        		url : "<c:out value="${serverSslDomain}"/>/pc/mypage/swapAvailableCheckAjax.do",
        		data : {"ORD_MST_CD": ordPrdCd , "ORD_PRD_IDX" : ordPrdIdx},
        		dataType : "json",
        		async : false,
        		success : function(data){    			
        			// 0 이상 : 성공
        			if(data.result > 0){
        				$orderStateForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/changeOrderProductRegistPopup.do", "target":"_self", "method":"post"}).submit();
        			}else{
        				alert(data.resultMsg);
        			}
        		},
        		error : function(error){
        			alert(error);
        		}
        	});
        }
    	else
        {
            alert("[교환접수]선택된 주문상품 번호가 없습니다.");
            
        }
    	
    	//popup("<c:out value="${serverSslDomain}" />/pc/mypage/changeOrderProductRegistPopup.do?ORD_MST_CD="+orderCd+"&ORD_PRD_IDX="+ordPrdIdx, "800", "600", "yes", "orderChangeProduct");
	}
});
    
</script>