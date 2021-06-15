<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->


			<div class="sub_content">
				<h2 class="pg_tit blind">마이페이지</h2>
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
					<form id="frm" name="frm">
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
						
			<div class="tab_view_wp">
				<div class="tab_cont tab_view2 on">
					 <h4 class="blind">My Shopping</h4>

					<div class="personal_wrap">
						<strong class="tit">
							<em class="lato bold"><c:out value="${sessionUser.MEM_MST_MEM_ID }"/></em> 님의 <em class="lato bold">OOTD</em>
						</strong>
						<div class="sorting">
							<ul class="clearboth">
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myMileageList.do" class="clearboth">
										<span class="name">통합포인트</span>
										<span class="num lato bold"><c:out value="${myEpointMap}"/><em class="txt lato">p</em></span>
									</a>
								</li>
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myMileageList.do" class="clearboth">
										<span class="name">E포인트</span>
										<span class="num lato bold"><c:out value="${summaryMap.MEM_PIT_TOT_PIT}"/><em class="txt lato">p</em></span>
									</a>
								</li>
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myCouponUsableList.do" class="clearboth">
										<span class="name">쿠폰</span>
										<span class="num lato bold"><c:out value="${summaryMap.MEM_CPN_CNT}"/><em class="txt">장</em></span>
									</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="order_wrap">
						<div class="tit_box clearboth">
							<strong class="tit">주문/배송조회<em class="txt">최근 1개월 기준</em></strong>
							<!-- <a href="#" class="total_view"><em class="txt"><i>전체보기</i></em></a> -->
						</div>
						<div class="order_sequence">
							<ul class="clearboth">
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
										<span class="num"><c:out value="${memberTotCnt.ORD_STY}"/></span>
										<span class="txt">입금대기</span>
									</a>
								</li>
								<li class="active">
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
										<span class="num"><c:out value="${memberTotCnt.ORD_FIN}"/></span>
										<span class="txt">결제완료</span>
									</a>
								</li>
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
										<span class="num"><c:out value="${memberTotCnt.ORD_DLV_RED}"/></span>
										<span class="txt">배송준비중</span>
									</a>
								</li>
								<li class="active"> <!-- 진행 중-->
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
										<span class="num"><c:out value="${memberTotCnt.ORD_DLV_ING}"/></span>
										<span class="txt">배송중</span>
									</a>
								</li>
								<li class="active"> <!-- 진행 중-->
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
										<span class="num"><c:out value="${memberTotCnt.ORD_DLV_FIN}"/></span>
										<span class="txt">배송완료</span>
									</a>
								</li>
								<li class="last">
									<div class="else">
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
											<span class="receipt clearboth">
												<em class="txt">매장수령</em>
												<em class="num"><c:out value="${memberTotCnt.ORD_DLV_DRT}"/></em>
											</span>
										</a>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myShoppingList.do" class="clearboth">
											<span class="confirm clearboth">
												<em class="txt">구매확정</em>
												<em class="num"><c:out value="${memberTotCnt.ORD_FIX}"/></em>
											</span>
										</a>
									</div>
								</li>
							</ul>
						</div>
						<div class="my_total_order">
							<ul class="clearboth">
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myOrderCancelBackList.do" class="clearboth">
										<span class="name">취소</span>
										<span class="num lato bold"><c:out value="${memberTotCnt.ORD_CNL}"/><em class="txt">건</em></span>
									</a>
								</li>
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myOrderCancelBackList.do" class="clearboth">
										<span class="name">교환</span>
										<span class="num lato bold"><c:out value="${memberTotCnt.ORD_CHG}"/><em class="txt">건</em></span>
									</a>
								</li>
								<li class="active"> <!-- 진행 중-->
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myOrderCancelBackList.do" class="clearboth">
										<span class="name">반품</span>
										<span class="num lato bold"><c:out value="${memberTotCnt.ORD_RTN}"/><em class="txt">건</em></span>
									</a>
								</li>
							</ul>
						</div>
					</div>

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
														<!-- <a href="#" class="btn order cancel">전체주문취소</a> -->
														<!-- 2020.06.15 전체취소 / 부분취소 구분화  -->
<%-- 														<c:if test="${data.CANCEL_CNT != 1 and data.CANCEL_CNT eq data.EXCEPT_SWAP_TOTAL_CNT }">
															<a href="javascript:orderCancel('${data.ORD_MST_CD }')" class="btn order cancel" data-ORD_MST_CD="${data.ORD_MST_CD }" data-ORD_PRD_IDX="${data.ORD_PRD_IDX } " >전체주문취소</a>
														</c:if>	 --%>																										
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
																<span class="brand"><c:out value="" /></span>
																<a href="javascript:goProductView('<c:out value="${data.ORD_MST_CD }" />');" class="item_name"><c:out value="${data.PRD_MST_NM }" /></a>
																<span class="item_info">${data.ORD_PRD_COLOR_VAL } / ${data.ORD_PRD_SIZE_VAL } / ${data.ORD_PRD_ORD_CNT }<c:out value="${data.OPT_DTL_NM}" /></span>
															</div>
														</div>
													</td>
													<td>
														<span class="r_price"><fmt:formatNumber value="${o_price}" type="number" /></span>
														<span class="s_price"><fmt:formatNumber value="${data.ORD_PRD_ORD_PRC + data.SUM_SUB_OPTION_ADD_PRC}" type="number" />원</span>
														
													</td>
													<td>
														<!-- 케이스별 진행상태 -->
														<span class="order_state"><c:out value="${data.ORD_PRD_ORD_STATE_NM }" /></span>
<%-- 														<!-- TODO 배송중 택배사 정보 수정 -->
														<c:if test="${not empty data.ORD_PRD_IVC_NO }">
															<span class="order_delivery">(<c:out value="${row.DLV_CPN_NM }" />TEST택배<a href="javascript:goDeliveryView" class="btn_txt"><c:out value="${row.ORD_PRD_IVC_NO }" /><c:out value="${row.DLV_CPN_URL }"/>1234567</a>)</span>
														</c:if>
														<c:if test="${data.ORD_PRD_ORD_STATE eq '405' or data.ORD_PRD_ORD_STATE eq '3022' }">
															<a href="javascript:orderCancel('<c:out value="${data.ORD_MST_CD }" />', '<c:out value="${data.ORD_PRD_IDX }" />');" class="btn order cancel">주문취소</a>
															<a href="javascript:orderCancel('${data.ORD_MST_CD }', '${data.ORD_PRD_IDX }')" class="btn order confirm" data-ORD_MST_CD="${data.ORD_MST_CD }" data-ORD_PRD_IDX="${data.ORD_PRD_IDX } " >주문취소</a>
															<a href="javascript:orderEachCancel('${data.ORD_MST_CD }', '${data.ORD_PRD_IDX }')" class="btn order confirm" data-ORD_MST_CD="${data.ORD_MST_CD }" data-ORD_PRD_IDX="${data.ORD_PRD_IDX } " >주문취소</a>
														</c:if>
														<c:if test="${data.ORD_PRD_ORD_STATE eq '408' }">
															<a href="#" class="btn order confirm">구매확정</a>
															<a href="javascript:goOrderChange('${data.ORD_MST_CD }', '${data.ORD_PRD_ORD_STATE }', '${data.ORD_PRD_IDX }', '${data.ORD_PRD_VDR_IDX}')" class="btn order confirm">교환신청</a>
															<a href="javascript:goOrderCancelReturn('${data.ORD_MST_CD }', '${data.ORD_PRD_IDX }')" class="btn order confirm" data-ORD_MST_CD="${data.ORD_MST_CD }" data-ORD_PRD_IDX="${data.ORD_PRD_IDX }" >반품신청</a>
														</c:if>
														<c:if test="${data.ORD_PRD_ORD_STATE eq '409' }">
															<a href="#" class="btn order review">상품후기</a>
															<a href="#" class="btn order review">후기보기</a>
														</c:if> --%>
													</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>

							</tbody>
						</table>
					</div>
					</form>
								<div class="pagination">
									<ui:frontpaging paging="${paging }" jsFunction="goPage" />
								</div>
								<!-- //pagination -->
					<div class="con_tit_wrap">
						<h3 class="con_tit">최근 본 상품</h3>
					</div>
					<!-- .new_goods_wrap -->
					 <div class="new_goods_wrap">
							<ul class="new_goods_list clearboth">
									<c:choose>
										<c:when test="${not empty listPrw }">
											<c:forEach var="data" items="${listPrw }" varStatus="status">
									<li>
											<span class="flag_video">video</span>
											<a href="<c:out value="${frontDomain }"/>/pc/product/productView.do?PRD_CTG_IDX=<c:out value="${data.MEM_PRW_CTG_IDX }" />&PRD_MST_CD=<c:out value="${data.PRD_MST_CD }" />">
													<div class="img_thum_wrap">
															<div class="img_thum_inner crop" style="background-image:url(<c:out value="${data.PRD_MST_REF_IMG_URL }" />);"></div>
															<div class="img_thum_inner crop" style="background-image:url(<c:out value="${data.PRD_MST_REF_IMG_URL }" />);"></div>
															<ul class="color_list">
																	<li><span style="background:#273b38;">color 01</span></li>
																	<li><span style="background:#c7673e;">color 02</span></li>
																	<li><span style="background:#6686ad;">color 03</span></li>
															</ul>
													</div>
													<div class="sort_tag_area clearboth">
															<span class="sort"><c:out value="${data.VDR_MST_NM }" /></span>
															<span class="tag">#신상품</span>
													</div>
													<p class="goods_title"><c:out value="${data.PRD_MST_NM }" /></p>
													<div class="goods_cost_info">
															<span class="dc_before_cost">￦<c:out value="${data.PRD_MST_PRC }" /></span>
															<strong class="clearboth">
																	<span class="goods_cost">￦<c:out value="${data.PRD_MST_PRC_REAL }" /></span>
																	<em class="dc_percent"><c:out value="${data.PRD_MST_SALE_RATE }" />%</em>
															</strong>
													</div>
											</a>
											<div class="btn_like_area">
													<button type="button" class="btn-like on" title="좋아요" onclick="javascript:goLike('<c:out value="${data.PRD_MST_CD }" />');"><span><c:out value="${data.LIKEUP }" /></span></button>
											</div>
									</li>
											</c:forEach>
										</c:when>
									</c:choose>
							</ul>
					</div>
					<!-- // .new_goods_wrap -->

					
				</div>
				<!-- //tab_view2 -->
			</div>

			</div>
			<!-- //sub_content -->
		</div>
	</div>
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
        <input type="hidden" name="ORD_PRD_VDR_IDX" value=""/>
        
	</form>
	
<script>

$(function(){
	//달력
	//$('.btn_calendar').datePickr();
	var $orderStateForm = $("#orderStateForm");
	goPage = function (cPage){
        var $frm = $("#frm");
 
     //   $frm.find("input[name='cPage']").val(cPage);
          $frm.find("#cPage" + ($('#product_tab').val() * 1 + 1)).val(cPage);
      
          moveTab($frm.find("input[name='tabId']").val(), cPage);
    };	
	
	//주문배송상세페이지 이동
	goOrderView = function(ordMstCd){
		var $frm = $("#orderStateForm");
		$frm.find("input[name='ORD_MST_CD']").val(ordMstCd);
	    $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingInfo.do", "target":"_self", "method":"get"}).submit();
	};
	
	//상품상세페이지 이동
	goProductView = function(prdCd){
		var $frm = $("#orderStateForm");
		$frm.find("input[name='PRD_MST_CD']").val(prdCd);
	    $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/productView.do?PRD_MST_CD="+prdCd, "target":"_self", "method":"get"}).submit();
	};

	//좋아요
	goLike = function(prdCd){
		
		$.ajax({
				type: "get",
				url: "<c:out value="${serverDomain}"/>/pc/mypage/insertLike.do",
				data: {"PRD_MST_CD": prdCd},
				async: false,
				success: function(data)
				{
					if(data.result == "success" )
					{
						document.location.reload(true);
					}
				},
				error : function (err)
				{
			      	alert("오류가 발생하였습니다.\n[" + err.status + "]");
				}
			});		
	};
	
	//페이지 이동
	goRefrash = function (){
		location.href = "<c:out value="${serverSslDomain}"/>/pc/mypage/myPageMainShopping.do";
	    };
	
	//페이지 이동
	goPage = function (cPage){
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myPageMainShopping.do", "target":"_self", "method":"get"}).submit();
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
	// 2020.06.15 전체 / 부분 구분
	// 전체주문취소 버튼 클릭
	//orderCancel = function(orderCd, ordPrdIdx){
		orderCancel = function(orderCd){
		
		var state = "<c:out value="${Code.OST_CANCEL }" />";
		var ord_prd_idx_arr = new Array();
		$("a[data-ORD_MST_CD='" + orderCd + "']").each(function() {
			ord_prd_idx_arr.push($(this).data("ord_prd_idx"));
		})
		var idxs = ord_prd_idx_arr.join(",");

		$orderStateForm.find("input[name='ORD_MST_CD']").val(orderCd);
		$orderStateForm.find("input[name='ORD_PRD_ORD_STATE']").val(state);
//		$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
		$orderStateForm.find("input[name='ORD_PRD_IDX_ARR']").val(idxs);
		
/* 		
		$orderStateForm.find("input[name='ORD_MST_CD']").val(orderCd);
		$orderStateForm.find("input[name='ORD_PRD_ORD_STATE']").val(state);
		$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
 */		
		$orderStateForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/orderCancel.do?allCancel=all", "target":"_self", "method":"post"}).submit();
	}
	
	// 주문취소 버튼 클릭
	orderEachCancel = function(orderCd, ordPrdIdx){
		
		var state = "<c:out value="${Code.OST_CANCEL }" />";
	//	var ord_prd_idx_arr = new Array();
	//	ord_prd_idx_arr.push(ordPrdIdx);				

		$orderStateForm.find("input[name='ORD_MST_CD']").val(orderCd);
		$orderStateForm.find("input[name='ORD_PRD_ORD_STATE']").val(state);
		$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
		$orderStateForm.find("input[name='ORD_PRD_IDX_ARR']").val(ordPrdIdx);		
			
		$orderStateForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/orderCancel.do", "target":"_self", "method":"post"}).submit();
	}
	
	// END 2020.06.15 전체 / 부분 구분
	
	// 교환신청 버튼 클릭 이벤트
	goOrderChange = function(ordPrdCd, ordPrdState, ordPrdIdx, ORD_PRD_VDR_IDX){
    	
    	if(ordPrdState != "${Code.OST_SEND_END}"){
    		alert("교환신청은 배송완료 상태의 상품만 가능합니다.");
    		return;
    	}
    	
       	$orderStateForm.find("input[name='ORD_MST_CD']").val(ordPrdCd);
       	$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
    	$orderStateForm.find("input[name='ORD_PRD_VDR_IDX']").val(ORD_PRD_VDR_IDX);
       	
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
	
	// 반품신청 버튼 클릭
	goOrderCancelReturn = function(orderCd, ordPrdIdx){
		
		var state = "<c:out value="${Code.OST_BACK }" />";
		var ord_prd_idx_arr = new Array();
		$("a[data-ORD_MST_CD='" + orderCd + "']").each(function() {
			ord_prd_idx_arr.push($(this).data("ord_prd_idx"));
		})
		var idxs = ord_prd_idx_arr.join(",");
		
		$orderStateForm.find("input[name='ORD_MST_CD']").val(orderCd);
		$orderStateForm.find("input[name='ORD_PRD_ORD_STATE']").val(state);
		$orderStateForm.find("input[name='ORD_PRD_IDX']").val(ordPrdIdx);
		$orderStateForm.find("input[name='ORD_PRD_IDX_ARR']").val(idxs);
		
		$orderStateForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/orderBack.do", "target":"_self", "method":"post"}).submit();
	}
});
    
</script>
