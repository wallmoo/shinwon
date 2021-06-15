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
				<h2 class="pg_tit">반품 신청</h2>
			</div>
			<!--// Title -->
			
			
			
			<div class="sub_content">
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
				<div class="tab_wrap fix">
						<form id="frm" name="frm">
					        <input type="hidden" id="" name="selfReturn" value="Y" />
					        <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
					        <input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="${commandMap.ORD_PRD_ORD_STATE }" />
					        <input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value="${commandMap.ORD_PRD_IDX_ARR }"/>
					        <input type="hidden" id="DLV_PAY_WAY" name="DLV_PAY_WAY"/>
			            	<input type="hidden" id="DLV_PAY_WAY_MEMO" name="DLV_PAY_WAY_MEMO"/>
			            	<input type="hidden" id="ORD_PRD_DLV_ADD_CAG_GBN" name="ORD_PRD_DLV_ADD_CAG_GBN"/>
							<div class="table_wrap mb95">
								<table class="tb_row">
									<caption>주문/배송 상세조회 : 주문번호, 주문일 출력 표입니다.</caption>
									<colgroup>
										<col style="width:20%;">
										<col>
										<col style="width:20%;">
										<col style="width:30%;">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">주문번호</th>
											<td><c:out value="${commandMap.ORD_MST_CD }" /></td>
											<th scope="row">주문일</th>
											<td><ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="con_tit_wrap">
								<h3 class="con_tit">주문상품 정보</h3>
								<div class="top_btn">
								</div>
							</div>
							
							<div class="table_wrap mb95">
								<table class="tb_col">
									<caption>주문상품 정보 : 상품정보, 상품금액, 배송비, 판매자명, 진행상태 출력 표입니다.</caption>
									<colgroup>
										<col>
										<col style="width:12%;">
										<col style="width:12%;">
										<col style="width:10%;">
										<col style="width:16%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">상품정보</th>
											<th scope="col">상품금액</th>
											<th scope="col">배송비</th>
											<th scope="col">판매자명</th>
											<th scope="col">진행상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${orderProductList }" varStatus="i">
											<c:set var="r_price" value="${row.ORD_PRD_PRD_PRC * row.ORD_PRD_ORD_CNT + row.SUM_SUB_OPTION_ADD_PRC}"/>
											<c:set var="s_price" value="${row.ORD_PRD_SAL_PRC * row.ORD_PRD_ORD_CNT + row.SUM_SUB_OPTION_ADD_PRC}"/>
											<tr>
												<td class="pro_chk">
													<div class="chkbx">
														<c:set var="basic_chk" value="" />
														<c:if test="${commandMap.ORD_PRD_IDX eq row.ORD_PRD_IDX}"><c:set var="checked" value="checked" /></c:if>
														<c:if test="${commandMap.ORD_PRD_IDX ne row.ORD_PRD_IDX}"><c:set var="checked" value="" /></c:if>
														<c:if test="${row.ORD_PRD_ORD_STATE ne Code.OST_SEND_END}"><c:set var="disabled" value="disabled" /></c:if>
														<c:if test="${row.ORD_PRD_ORD_STATE eq Code.OST_SEND_END}"><c:set var="disabled" value="" /></c:if>
														<input type="checkbox" id="pro-${i.index + 1 }" name="pro_chk" ${checked } value="${row.ORD_PRD_IDX }" ${disabled } 
															data-price="${s_price }" data-e_point="${row.ORD_PRD_DC_PIT }" data-tot_point="${row.ORD_PRD_DC_TOT_PIT }" 
															data-sw_point="${row.ORD_PRD_DC_SW_PIT }" data-dc_prom="${row.ORD_PRD_DC_PRM }" 
															data-dc_cpn="${row.ORD_PRD_DC_CPN }" data-ORD_PRD_IDX = "${row.ORD_PRD_IDX }" data-dlv_type="${row.ORD_PRD_DLV_TYPE }">
														
														<label for="pro-${i.index + 1}"><span class="icon"></span><span class="blind">선택</span></label>
													</div>
													<div class="product_info clearboth">
														<div class="img">
															<a href="javascript:goProductView('${row.ORD_PRD_MST_CD }');" class="product_thumb">
																<img src="${cdnDomain }${row.PRODUCT_THUM_IMG}" alt="${row.PRD_IMAGE_ALT}">
															</a>
														</div>
														<div class="txt">
															<span class="brand">[${row.VDR_MST_NM }]</span>
															<a href="javascript:goProductView('${row.ORD_PRD_MST_CD }');" class="item_name">${row.PRD_MST_NM}</a>
															<span class="item_info">${row.ORD_PRD_COLOR_NM } / ${row.ORD_PRD_SIZE_NM } / ${row.ORD_PRD_ORD_CNT }개</span>
														</div>
													</div>
												</td>
												<td>
													<c:if test="${r_price != s_price}">
														<span class="r_price"><fmt:formatNumber value="${r_price}" type="number" />원</span>
													</c:if>
													<span class="s_price"><fmt:formatNumber value="${s_price}" type="number" />원</span>
												</td>
												<c:choose>
													<c:when test="${row.ORD_PRD_DLV_BND_YN eq 'Y' and row.VDR_ROWNUM eq 1}">
							                          	<td rowspan="${row.VDR_IDX_CNT}">
							                          		<fmt:formatNumber value="${row.ORD_PRD_DLV_BND_CAG}" type="number"/>
							                     	  	</td>
							                        </c:when>
							                        <c:when test="${row.ORD_PRD_DLV_BND_YN ne 'Y'}">
							                          	<td>
							                          		<fmt:formatNumber value="${row.ORD_PRD_DLV_CAG}" type="number"/>
							                     	  	</td>
							                        </c:when>
						                        </c:choose>
												<td>${row.VDR_MST_NM}</td>
												<td>
													<span class="order_state"><c:out value="${row.ORD_PRD_ORD_STATE_NM }" /></span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							<c:if test="${fn:length(orderGiftList) > 0 }">
								<!-- 사은품 부분은 아직 하드코딩임(2020.07.01) -->
								<div class="con_tit_wrap mt95">
									<h3 class="con_tit">사은품 정보</h3>
								</div>
								<div class="table_wrap mb95">
									<table class="tb_col">
										<caption>사은품 정보 출력 표입니다.</caption>
										<colgroup>
											<col style="width:100%;">
										</colgroup>
										<tbody>
											<c:forEach items="${orderGiftList }" var="data">
											<tr>
												<td>
													<div class="product_info clearboth">
														<div class="img">
															<a href="#" class="product_thumb">
																<img src="" alt="제품 이미지">
															</a>
														</div>
														<div class="txt">
															<span class="brand">[신원] VIKI</span>
															<a href="#" class="item_name">${data.GFT_MST_NAME }(TYSCI297)</a>
															<span class="item_info">블랙 / 85 / 1개</span>
														</div>
													</div>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
			
							<div class="con_tit_wrap">
								<h3 class="con_tit">반품 사유</h3>
							</div>
							<div class="table_wrap mb95">
								<table class="tb_row">
									<caption>반품 사유 : 사유, 상세사유 출력 표입니다.</caption>
									<colgroup>
										<col style="width:20%">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span class="required"><em class="blind">필수 정보</em></span>사유</th>
											<td>
												<span class="select">
													<select id="SELECT_REASON" name="SELECT_REASON" class="w310" title="사유">
														<option selected="selected" value="">반품 사유 선택</option>
														<c:if test="${not empty codes.ORDER_CANCEL_RETURN_REASON }">
								                            <c:forEach var="data" items="${codes.ORDER_CANCEL_RETURN_REASON}">
																<option value="${data.CMN_COM_IDX }" class="<c:if test="${ '구매자귀책' eq data.CMN_COM_ETC1 }">userFault</c:if>">${data.CMN_COM_NM }</option>
															</c:forEach>
								                        </c:if>
													</select>
												</span>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="ORD_PRD_CHANGE_REASON_DSC">상세사유</label></th>
											<td>
												<textarea name="ORD_PRD_CHANGE_REASON_DSC" id="ORD_PRD_CHANGE_REASON_DSC" class="text_area h140" placeholder="200자 이내로 입력하세요."></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
			
							<div class="con_tit_wrap">
								<h3 class="con_tit">반품 상세 정보</h3>
							</div>
							<div class="table_wrap mb50">
								<table class="tb_row">
									<caption>반품 상세 정보 : 반품 방법 출력 표입니다.</caption>
									<colgroup>
										<col style="width:20%">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span class="required"><em class="blind">필수 정보</em></span>반품 방법</th>
											<td>
												<input type="radio" id="return-1" name="changeProduct" value="A">
												<label for="return-1" class="mr40"><span class="icon"></span>자동수거</label>
												<input type="radio" id="return-2" name="changeProduct" value="B">
												<label for="return-2" class="mr40"><span class="icon"></span>직접 발송</label>
												<input type="radio" id="return-3" name="changeProduct" value="C">
												<label for="return-3"><span class="icon"></span>이미 발송</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<!-- 반품 수거지 -->
							<jsp:include page="include/return_delivery.jsp"></jsp:include>
							
							<div class="con_sstit_wrap mb10">
								<h4 class="con_sstit">반품 배송비</h4>
							</div>
							<div class="table_wrap mb95" id="return_pay_wp">
								<table class="tb_row tb_small">
									<caption>반품 배송비 : 반품 배송비 출력 표입니다.</caption>
									<colgroup>
										<col>
									</colgroup>
									<tbody>
										<!-- 사유미선택 : S -->
										<tr class="reason_not_selected">
											<td><strong class="t_inf">반품사유를 먼저 선택해주세요</strong></td>
										</tr>
										<!-- //사유미선택 : E -->
										<!-- 구매자 책임 사유선택 : S -->
										<tr class="userFault_showing" style="display:none;">
											<td>
												<dl class="inf_detail">
													<dt>구매자 책임</dt>
													<dd><strong>2,500원</strong></dd>
												</dl>
											</td>
										</tr>
										<!-- //구매자 책임 사유선택 : E -->
										<!-- 판매자 책임 사유선택 : S -->
										<tr class="sellerFault_showing" style="display:none;">
											<td>
												<dl class="inf_detail">
													<dt>판매자 책임</dt>
													<dd><strong>0원</strong></dd>
												</dl>
											</td>
										</tr>
										<!-- //판매자 책임 사유선택 : E -->
									</tbody>
								</table>
							</div>
							<!-- 결제 수단 -->
							<jsp:include page="include/return_delivery_payment.jsp" />
			
							<div class="con_tit_wrap">
								<h3 class="con_tit">환불 정보</h3>
							</div>
							<div class="table_wrap payment mb95">
								<table class="tb_col">
									<caption>환불 정보 : 취소 주문금액, 차감금액, 환불금액, 환불포인트 출력 표입니다.</caption>
									<colgroup>
										<col style="width:290px;">
										<col style="width:290px;">
										<col style="width:310px;">
										<col style="width:*;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">
												<p class="tit">취소 주문금액</p>
												<p class="price"><strong id="total_cancel_price">0</strong> 원</p>
											</th>
											<th scope="col">
												<span class="minus">-</span>
												<p class="tit">차감금액</p>
												<p class="price"><strong id="total_minus_price">0</strong> 원</p>
											</th>
											<th scope="col" class="total">
												<span class="equal">=</span>
												<p class="tit">환불금액</p>
												<p class="price"><strong id="total_refund_price">0</strong> 원</p>
											</th>
											<th scope="col" class="total">
												<span class="plus">+</span>
												<p class="tit">환불포인트</p>
												<p class="price"><strong id="total_cancel_point">0</strong> p</p>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<ul class="pay_detail">
													<li><span class="tit">취소 상품금액</span><span class="price" id="cancel_price">0 원</span></li>
													<!-- <li><span class="tit">취소 배송비</span><span class="price">2,500 원</span></li>
													<li><span class="tit">취소 도서산간 배송비</span><span class="price">2,500 원</span></li> -->
												</ul>
											</td>
											<td>
												<ul class="pay_detail">
													<li><span class="tit">즉시할인</span><span class="price">0 원</span></li>
													<li><span class="tit">제휴사할인</span><span class="price">0 원</span></li>
													<li><span class="tit">상품할인쿠폰</span><span class="price" id="dc_cpn">2,500 원</span></li>
													<!-- <li><span class="tit">배송비쿠폰</span><span class="price">2,500 원</span></li> -->
													<li><span class="tit">프로모션 할인</span><span class="price" id="dc_prom">0 원</span></li>
												</ul>
											</td>
											<td>
												<ul class="pay_detail">
													<li><span class="tit">${orderPayInfo.ORD_MST_PAY_TYPE_NM }</span><span class="price" id="refund_price">0 원</span></li>
												</ul>
											</td>
											<td>
												<ul class="pay_detail">
													<li><span class="tit">통합포인트</span><span class="price cancel_tot_point">0 p</span></li>
													<li><span class="tit">E포인트</span><span class="price cancel_e_point">0 p</span></li>
													<li><span class="tit">임직원포인트</span><span class="price cancel_sw_point">0 p</span></li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' and (orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW)}">
						        <div class="con_tit_wrap">
									<h3 class="con_tit">환불 계좌 정보</h3>
								</div>
								<div class="table_wrap mb95">
							        <table class="tb_row tb_small"><!-- table-a -->
							        <caption>환불은행, 계좌번호, 예금주명으로 구성된 환불계좌정보 입력 테이블입니다.</caption>
							        <colgroup>
							            <col style="width:15%;">
										<col>
										<col style="width:15%;">
										<col style="width:35%;">
							        </colgroup>
							        <tbody>
							            <tr>
							                <th scope="row"><span class="required"><em class="blind">필수 정보</em></span>은행명</th>
							                <td>
							                    <select id="ORD_MST_RFD_CD" name="ORD_MST_RFD_CD" class="sel_chg">
							                        <option value="">선택</option>
							                        <c:forEach var="item" items="${depositBankList }">
														<option value="${item.CMN_COM_ETC1 }">${item.CMN_COM_NM }</option>
													</c:forEach>
							                    </select>
							                </td>
							                <th scope="row"><span class="required"><em class="blind">필수 정보</em></span>계좌번호</th>
							                <td>
							                    <input type="text" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" class="text large" maxlength="20"/>
							                </td>
							            </tr>
							            <tr>
							                
							            </tr>
							            <tr>
							                <th scope="row"><span class="required"><em class="blind">필수 정보</em></span>예금주</th>
							                <td>
							                    <input type="text" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" class="text" value="${orderPayInfo.ORD_MST_ORD_NM }"/>
							                </td>
							                <td colspan="2">
							                    <button type="button" id="check_account" class="btn_small gray">계좌 확인</button>
							                </td>
							            </tr>
							        </tbody>
							        </table><!-- // table-a -->
								</div>
					        </c:if>
		
							<div class="btn_wrap mb95">
								<button type="button" class="btn_large" onclick = "history.back(-1)">취소</button>
								<button type="button" id="goConfirm" class="btn_large ok">반품신청</button>
							</div>
						
						</form>
		
						<div class="attention_list_wrap mt95">
							<strong class="tit">교환/반품이 불가능한 경우</strong>
							<ul>
								<li>고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</li>
								<li>고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(수선등).</li>
								<li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</li>
								<li>복제가 가능한 상품등의 포장을 훼손한 경우 (자세한 내용은 마이페이지 1:1문의를 이용해 주시기 바랍니다.) </li>
							</ul>
							<p class="desc mt30">고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.(색상 교환, 사이즈 교환 등 포함)</p>
						</div>

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
<script type="text/javascript" src="/nas/cdn/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 -->


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
	$.fn.datePic();
	
	var refund_account = ${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' and (orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW)};
	
	// 반품 사유 선택 셀렉트박스 이벤트
	var userFaultFlag = false;
	$(document).on("change", "#SELECT_REASON", function(){
		if($(this).find('option:selected').index() == 0){
			$('.reason_not_selected').show();
			$('.userFault_showing').hide();
			$('.sellerFault_showing').hide();
			$('#return_pay_wp').addClass('mb95').removeClass('mb25');
			return;
		}
   		userFaultFlag = $('#SELECT_REASON option:selected').attr('class')=='userFault'?true:false;
	   	if(userFaultFlag){
	   		$('.userFault_showing').show();
	   		$('.sellerFault_showing').hide();
	   		$('.reason_not_selected').hide();
	   		$('#return_pay_wp').removeClass('mb95').addClass('mb25');
	   	}else{
	   		$('.userFault_showing').hide();
	   		$('.sellerFault_showing').show();
	   		$('.reason_not_selected').hide();
	   		$('#return_pay_wp').addClass('mb95').removeClass('mb25');
	   	}
    });
	
	// 폼체크
    $("#frm").validate({
        rules: {
        	changeProduct:{required:true}
        	,SELECT_REASON:{required:true} // 사유
            ,ORD_PRD_CHANGE_REASON_DSC :{maxlength:200} // 상세사유
            ,ORD_MST_RFD_CD :{required:refund_account} // 환불은행
            ,ORD_MST_RFD_ACT :{required:refund_account, number:true} // 계좌번호
            ,ORD_MST_RFD_HDR :{required:refund_account} // 예금주명
        },
        messages :{
            changeProduct: {required:"반품 방법을 선택해주세요."}
        	,SELECT_REASON : {required:"사유를 선택해 주십시오."}
            ,ORD_PRD_CHANGE_REASON_DSC : {maxlength:"상세 사유는 200자 이내로 작성해주세요."}
            ,ORD_MST_RFD_CD :{required:"환불은행을 입력해 주십시오."} // 환불은행
            ,ORD_MST_RFD_ACT :{required:"계좌번호를 입력해 주십시오.",number:"계좌번호는 숫자만 입력해 주십시오."} // 계좌번호
            ,ORD_MST_RFD_HDR :{required:"예금주명을 입력해 주십시오."} // 예금주명
        }
     	//,ignore: ":hidden"
        ,onkeyup:false
 	    ,onclick:false
 	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
        	if(this.numberOfInvalids()) { 
  	    	   alert(errorList[0].message);
  	    	   $(errorList[0].element).focus();
  	       }
 	   }
    });

    // 확인 버튼 클릭 이벤트
    $(document).on("click", "#goConfirm", function () {
    	
    	var arr = new Array();
    	$("input:checkbox[name='pro_chk']:checked").each(function() {
			arr.push($(this).val());
		});
    	var value = arr.join(",");
    	$('#ORD_PRD_IDX_ARR').val(value);
    	var $frm = $("#frm");
        
        if(value.length != 0){
            if($frm.valid() && payment_validation()){
            	if(confirm("반품 신청하시겠습니까?")){
            		$frm.attr({"action":"${serverSslDomain}/pc/mypage/orderStateProc.do", "target":"_self", "method":"post"}).submit();
            	}
            }
        }else{
            alert("[취소]선택된 주문번호가 없습니다.");
        }
    });
    
  	//간편보기
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			popup('${frontDomain}/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
	
	// 상품 선택 체크박스 변경에 따른 환불정보 계산 이벤트
	calcCancelPrice();
	$('input[name="pro_chk"]').change(function() {
		calcCancelPrice();
	})
	
	function calcCancelPrice() {
		let price = 0;
		let dc_cpn = 0;
		let dc_prom = 0;
		let dc_ptn = 0;
		let e_point = 0;
		let tot_point = 0;
		let sw_point = 0;
		
		let auto_dlv_check = true;	// 일반택배일 경우에만 자동수거 버튼 활성화하기 위해 사용할 변수
		
		$('input[name="pro_chk"]').each(function() {
			if($(this).is(":checked")){
				price += $(this).data('price');
				dc_cpn += $(this).data('dc_cpn');
				dc_prom += $(this).data('dc_prom');
				dc_ptn += $(this).data('dc_ptn');
				e_point += $(this).data('e_point');
				tot_point += $(this).data('tot_point');
				sw_point += $(this).data('sw_point');
				
				if($(this).data('dlv_type') != "${Code.DLV_TYPE_PARCEL_SGS}"){
					auto_dlv_check = false;
				}
			}
		})
		
		if(auto_dlv_check){
			$('#return-1, #return-1 + label').show();
		}else{
			$('#return-1, #return-1 + label').hide();
		}
		
		setPrice($('#cancel_price'), price, " 원", true);
		setPrice($('#dc_cpn'), dc_cpn, " 원", true);
		setPrice($('#dc_prom'), dc_prom, " 원", true);
		setPrice($('.cancel_e_point'), e_point, " p", true);
		setPrice($('.cancel_tot_point'), tot_point, " p", true);
		setPrice($('.cancel_sw_point'), sw_point, " p", true);
		
		let total_cancel_price = price*1;
		let total_cancel_point = e_point*1 + tot_point*1 + sw_point*1;
		let total_minus_price = dc_cpn*1 + dc_prom*1;
		let total_refund_price = total_cancel_price - total_minus_price - total_cancel_point;
		
		setPrice($('#total_cancel_price'), total_cancel_price, "", false); 		// 취소 주문금액
		setPrice($('#total_minus_price'), total_minus_price, "", false); 		// 차감금액
		setPrice($('#total_refund_price'), total_refund_price, "", false); 		// 환불금액
		setPrice($('#total_cancel_point'), total_cancel_point, "", false); 		// 환불포인트
		
		setPrice($('#refund_price'), total_refund_price, " 원", true);
	}
	
	function setPrice($tag, param, suffix, parentHide){
		if(param * 1 == 0 && parentHide){
			$tag.parent().hide();
		}else{
			$tag.parent().show();
			$tag.text(setComma(param) + suffix);
		}
	}
	
});
    
</script>