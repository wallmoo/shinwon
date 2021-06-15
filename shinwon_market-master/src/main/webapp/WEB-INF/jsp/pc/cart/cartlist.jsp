<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<style>
.dim{display:block}
.layer{display:block;top:50%;left:50%;margin:-260px 0 0 -260px}
</style>
	<div id="container">
		<div id="content" class="content">
			
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">장바구니</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<div class="join_step w3">
					<ol>
						<li class="on"><span>STEP 01 <strong>장바구니</strong></span></li>
						<li><span>STEP 02 <strong>주문/결제</strong></span></li>
						<li><span>STEP 03 <strong>주문완료</strong></span></li>
					</ol>
				</div>

				<div class="tab_wrap">
					<ul class="tab n2">
						<li class="on"><a href="#tab1">배송상품</a></li>
						<li><a href="#tab2">매장수령</a></li>
					</ul>
					<div class="tab_cont" id="tab1">
						<h3 class="blind">배송상품</h3>
						<div class="table_wrap">
							<table class="tb_col">
								<caption>배송상품 정보 : 상품정보, 상품금액, 적립혜택, 배송비, 판매자명 출력 표입니다.</caption>
								<colgroup>
									<col>
									<col style="width:135px;">
									<col style="width:135px;">
									<col style="width:170px;">
									<col style="width:135px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<span class="chk_wrap">상품정보
											    <div class="chkbxall ac">
											        <input type="checkbox" id="check_all" checked>
											        <label for="check_all"><span class="icon"></span><span class="blind">선택</span></label>
											    </div>
											</span>
										</th>
										<th scope="col">상품금액</th>
										<th scope="col">적립혜택</th>
										<th scope="col">배송비</th>
										<th scope="col">판매자명</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty cartlist }">
											<c:forEach var="row" items="${cartlist }" varStatus="i">
												<tr>
													<td class="pro_chk st2">
														<div class="chkbx">
															<input type="checkbox" id="crtCheckBox_${row.MEM_CRT_IDX }" class="crt_idx" value="${row.MEM_CRT_IDX }" checked="checked">
															<label for="crtCheckBox_${row.MEM_CRT_IDX }"><span class="icon"></span><span class="blind">선택</span></label>
														</div>
														<div class="product_info clearboth">
															<div class="img">
																<a href="javascript:goProductView('<c:out value="${row.PRD_MST_CD }"/>')" class="product_thumb">
																	<img src="<c:out value="${cdnDomain }"/><c:out value="${row.PRODUCT_THUM_IMG }"/>" alt="${row.PRD_IMAGE_ALT}">
																</a>
															</div>
															<div class="txt">
																<span class="brand">[<c:out value="${row.VDR_MST_NM }"/>]<c:out value="${row.PRD_MST_BRAND_NM }"/></span> 
																<a href="javascript:goProductView('<c:out value="${row.PRD_MST_CD }"/>')" class="item_name"><c:out value="${row.PRD_MST_NM }"/></a>
																<div class="option_bx">
																	<!-- TODO 옵션정보 수정 -->
																	<span class="item_info dot"><c:out value="${row.MEM_CRT_COLOR_TITLE }"/> / <c:out value="${row.MEM_CRT_SIZE_VALUE }"/> / <c:out value="${row.PRD_OPT_NM }"/></span>
																	<div class="quantity_slct">
																		<button type="button" onclick="prdCntChangeUi('minus', '${row.MEM_CRT_IDX }')" class="minus">-</button>
																		<input type="text" id="prd_cnt_${row.MEM_CRT_IDX }" value="<c:out value="${row.MEM_CRT_CNT }"/>">
																		<button type="button" onclick="prdCntChangeUi('plus', '${row.MEM_CRT_IDX }')" class="plus">+</button>
																	</div>
																</div>
																<a href="javascript:optionLayerPopup();" class="btn order view b_option">옵션변경</a>
															</div>
														</div>
													</td>
													<td>
														<c:choose>
															<c:when test="${row.CUSTOMER_ORDER_PRICE > 0}">
																<span class="r_price gray "><fmt:formatNumber value="${row.PRODUCT_ORDER_PRICE }"/></span>
																<strong class="s_price red"><fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE }"/></strong>
															</c:when>
															<c:otherwise>
																<strong class="s_price red"><fmt:formatNumber value="${row.CUSTOMER_ORDER_PRICE }" type="number" /></strong>
															</c:otherwise>
														</c:choose>
													</td>
													<!-- TODO 적립혜텍 중 적립률 수정 -->
													<td><c:out value="${row.RESERVE_POINT }"/><span class="s_gray">(3%)</span></td>
													<c:choose>
														<c:when test="${row.VDR_IDX_CNT > 1}">
															<c:if test="${row.VDR_ROWNUM eq 1}">
																<td rowspan="${row.VDR_IDX_CNT }">
																	<c:choose>
																		<c:when test="${row.FREE_DLV_CHARGE_YN eq 'Y' }">
																			무료배송
																		</c:when>
																		<c:otherwise>
																			<c:out value="${row.SUM_FIN_DLV_CHARGE }"/><span class="s_gray">50,000원<br>이상<br>무료배송</span>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td rowspan="${row.VDR_IDX_CNT }"><c:out value="${row.VDR_MST_NM }"/></td>
															</c:if>
														</c:when>
														<c:otherwise>
															<td>2500원<span class="s_gray">50,000원<br>이상<br>무료배송</span></td>
															<td><c:out value="${row.VDR_MST_NM }"/></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
		                                        <td colspan="5" class="ac">장바구니에 담긴 상품이 없습니다.</td>
		                                    </tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<div class="btn_wrap mt30 txt_left">
							<button type="button" onclick="delteProduct('select')" class="btn_small gray">선택상품 삭제</button>
							<button type="button" onclick="delteProduct('all')" class="btn_small gray">전체상품 삭제</button>
						</div>
						
						<div class="calculation_wp">
							<div class="cbx">
								<span class="tit">총 상품금액</span><span class="price"><strong id="span_cart_prd_amount_normal" class="span_amt"><fmt:formatNumber value="${cart_prd_amount_sysRetail + cart_prd_amount_vendor}" type="number" /></strong> 원</span>
							</div>
							<div class="cbx">
								<span class="cal minus">-</span>
								<span class="tit">총 즉시할인</span><span class="price"><strong id="span_cart_ist_cpn_prc_normal" class="span_amt"><fmt:formatNumber value="${cart_ist_cpn_prc_sysRetail + cart_ist_cpn_prc_vendor}" type="number" /></strong> 원</span>
							</div>
							<div class="cbx">
								<span class="cal plus">+</span>

								<span class="tit">배송비</span><span class="price"><strong id="span_cart_delivery_normal" class="span_amt"><fmt:formatNumber value="${cart_delivery_sysRetail + cart_delivery_vendor}" type="number" /></strong> 원</span>
							</div>
							<div class="cbx last">
								<span class="cal equal">=</span>
								<div class="row total clearboth">
									<span class="tit">총 주문금액</span><span class="price"><strong id="span_cart_total_normal" class="span_amt"><fmt:formatNumber value="${cart_total_sysRetail + cart_total_vendor}" type="number" /></strong> 원</span>
								</div>
								<div class="row point clearboth">
									<span class="tit">적립 예정 통합포인트</span><span class="price"><strong id="span_cart_reserve_point_normal" class="span_amt"><fmt:formatNumber value="${cart_reserve_mileage_sysRetail + cart_reserve_mileage_vendor}" type="number" /></strong> P</span>
								</div>
							</div>
						</div>
						
						<div class="btn_wrap mt100">
							<button type="button" onclick="payment(false)" class="btn_large">선택상품 구매</button>
							<button type="button" onclick="payment(true)" class="btn_large ok">전체상품 구매</button>
						</div>
						<div class="attention_list_wrap mt95">
							<strong class="tit">유의사항</strong>
							<ul>
								<li>장바구니에 최대 100개 상품까지 담을 수 있으며, 최대 30일 보관됩니다.</li>
								<li>본사물류 또는 해당 브랜드 매장에서 택배로 고객님께 상품이 배송됩니다. (주문 완료 후, 3~5일 이내 수령)</li>
								<li>판매자가 다를 경우 배송비가 판매자별로 각각 부과될 수 있습니다.</li>
								<li>판매자별로 배송비 부과 기준이 다를 수 있습니다. </li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div id="option_popup"></div> 
			
		</div>
	</div>
	
<form name="paymentform" id="paymentform" method="post">
	<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<!-- template -->
<script id="optionPopupTemplate" type="text/x-jquery-tmpl">
<div class="dim"></div>
<div id="layer_option_change" class="layer type01 is_btn">
				<div class="layer_header">
					<h2>옵션변경</h2>
				</div>
				<div class="layer_content scroll">
					<div class="option_change">
						<div class="product_info clearboth">
							<div class="img">
								<a href="#" class="product_thumb">
									<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
								</a>
							</div>
							<div class="txt">
								<span class="brand">[신원] VIKI</span>
								<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)
								<span class="item_info">블랙 / 90</span>
							</div>
						</div>
					</div>
					<div class="option_edit_wp">
						<span class="select">
								<select id="" title="옵션 추가">
										<option selected="selected">옵션 추가</option>
								</select>
						</span>
						<ul class="option_list">
							<li class="clearboth">
								<span class="txt">블랙/85</span>
								<div class="op_right">
									<div class="quantity_slct">
										<button type="button" class="minus">-</button>
										<input type="text" value="1">
										<button type="button" class="plus">+</button>
									</div>
									<button class="b_del">삭제</button>
								</div>
							</li>
							<li class="clearboth">
								<span class="txt">블랙/90</span>
								<div class="op_right">
									<div class="quantity_slct">
										<button type="button" class="minus">-</button>
										<input type="text" value="1">
										<button type="button" class="plus">+</button>
									</div>
									<button class="b_del">삭제</button>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="layer_footer">
					<button class="btn_large gray">취소</button>
					<button class="btn_large ok">적용</button>
				</div>
				<a href="#none" class="btn_layer_close">레이어 닫기</a>
			</div>
</script>

<script>

$(function(){
	
	// 상품 수량 변경
	prdCntChangeUi = function(btnType, pIndex){
		
		var $inputCntTag = $("#prd_cnt_" + pIndex);
		var cntValue = $inputCntTag.val(); 
		if(btnType == "plus"){
			$inputCntTag.val(++cntValue);
		}else if(btnType == "minus"){
			if(cntValue<=0){
				return;
			}
			$inputCntTag.val(--cntValue);
		}	
		
		goCntModify(pIndex,btnType);
	}
	
	//수량 변경
	goCntModify = function(mem_crt_idx, btnType){
		
		//var memCrtCnt = $("#memCrtCnt_"+mem_crt_idx).val();
		var memCrtCnt = $("#prd_cnt_"+mem_crt_idx).val();	
		
		var memCrt = $("#prd_cnt_"+mem_crt_idx);
		//PRD_OPT_DTL_IDX << 옵션변경 파라미터
	//	memCrtCnt = btnType == "plus" ? ++memCrtCnt : --memCrtCnt;
		
		if(parseInt(memCrtCnt) < 2){
			$(".minus_btn_"+mem_crt_idx).css("visibility", "hidden");
		}else if(parseInt(memCrtCnt) > 98){
			$(".plus_btn_"+mem_crt_idx).css("visibility", "hidden");
		}else{
			$(".minus_btn_"+mem_crt_idx).css("visibility", "visible");
			$(".plus_btn_"+mem_crt_idx).css("visibility", "visible");
		}
		
		if(isNaN(memCrtCnt)){
			alert("숫자를 입력해주십시오.");
			//memCrtCnt.val(1);
			memCrt.val(1); 
			return;
		}
		
		if(parseInt(memCrtCnt) < 1){
			alert("최소구매수량은 1개입니다.");
			memCrt.val(1); 
			//memCrtCnt.val(1); 
			return;
		}
		
		if(parseInt(memCrtCnt) > 99){
			alert("주문 수량은 99개 이하만 가능합니다.\n100개 이상의 상품은 대량견적을 이용해주세요.");
			memCrt.val(99); 
			//memCrtCnt.val(99); 
			return;
		}
		
		$.ajax({
			type: "post",
			url : "<c:out value="${serverSslDomain}"/>/pc/cart/productOptionCntModifyAjax.do",
			data : {
						MEM_CRT_IDX : mem_crt_idx,
						MEM_CRT_CNT : parseInt(memCrtCnt)
					},
			dataType : "json",
			async : false,
			success : function(data){
				// -1 : 동일옵션 있음.
				// 0 : 옵션변경 실패
				// 0 이상 : 성공
				alert(data.resultMsg);
			
				if(data.result > 0){
					location.reload(true);
				}
			},
			error : function(error){
				alert(error);
			}
		});
	}
	
	// 상품 삭제 [select:선택 상품 삭제 / all:전체 상품 삭제]
	delteProduct = function(btnType){
		
		var crt_idx_arr = [];
		var $checkedinput = btnType == "select" ? $(".crt_idx:checked") : $(".crt_idx").prop("checked", true);
		
		if($checkedinput.length < 1){
			alert("선택하신 상품이 없습니다.");
			$("#check_all").focus();
			return;
		}
		
		if(btnType == "select"){
			if (confirm('선택하신 상품을 장바구니에서 삭제하시겠습니까?')){
				for(var i=0; i < $checkedinput.length; i++){
					crt_idx_arr[i] = $checkedinput[i].value;
				}
				deletecart(crt_idx_arr);
			}else{
				calculateCartAmount()
			}
		}else if(btnType == "all"){
			if (confirm('전체 상품을 장바구니에서 삭제하시겠습니까?')) {
				for(var i=0; i < $checkedinput.length; i++){
					crt_idx_arr[i] = $checkedinput[i].value;
				} 
				deletecart(crt_idx_arr);
			}else{
				calculateCartAmount()
			}
		}
	};
	
	// 체크박스 선택시
	$(".crt_idx").on("change", function(){
		
		$("#check_all").prop("checked", false);
		
		calculateCartAmount();
	});
	
	// 전체체크
	$("#check_all").on("change",function(){
		
		var allInputBox = $(".crt_idx");
		
		if($(this).is(":checked")){
			allInputBox.prop("checked", true);
		}else{
			allInputBox.prop("checked", false);
		}
		
		calculateCartAmount();
	});
	
	// 상품 구매
	payment = function(selectedFlag) {
		
		var idx_arr = new Array();
		
		$(".crt_idx").each(function(){
			if($(this).is(":checked") || selectedFlag){
				idx_arr.push($(this).val());
			}
		});
		
		if(idx_arr.length == 0){
			alert('장바구니에 담으신 상품이 없습니다.');
			return;
		};
		
		if (idx_arr.length > 100) {
			alert('상품 종류 기준으로 100개까지만 주문 가능합니다.');
			return;
		}
		
		$.ajax({
	        async : false,
	        type : "POST",
	        data : {
	        			"MEM_CRT_IDX[]" : idx_arr
	        		  },
	        url : "<c:out value="${serverSslDomain}" />/pc/cart/insertCartpaymentAjax.do",
	        success : function (data){ 
				switch (data.result){
				case 1:
					$('#paymentform').find("input[name='ORD_MST_CD']").val(data.ORD_MST_CD);
					$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
					break;
				default :
					alert(data.resultMsg);
					break;
				}
	        },
	        error : function (err){
	            alert("오류가 발생하였습니다.\n[" + err.status + "]");
	            window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	        }
		});

	}
});

	//체크박스 변경시 금액 계산하기
	calculateCartAmount = function(){
		var idx_arr = new Array();
		
		if($('.crt_idx:checked').length > 0){
			$('.crt_idx:checked').each(function(index) {
				idx_arr[index] = $(this).val();
			});
			
			$.ajax({
				type: "post",
				url : "<c:out value="${serverSslDomain}"/>/pc/cart/calculateCartAmountAjax.do",
				data : {"MEM_CRT_IDX[]" : idx_arr},
				dataType : "json",
				async : false,
				success : function(data){
					console.log(data);
					/* $.each(data, function(key, item){
						if(document.getElementById("span_"+key) != null){
							//console.log(key);
							//console.log(item);
							//console.log(document.getElementById("span_"+key));
							document.getElementById("span_"+key).innerHTML = setComma(item);
						}
					}); */
					
					// 마켓플랜트/입점업체 상품 합계 금액은 따로 계산 필요
					document.getElementById("span_cart_prd_amount_normal").innerHTML = setComma(data.cart_prd_amount_sysRetail + data.cart_prd_amount_vendor);
					document.getElementById("span_cart_ist_cpn_prc_normal").innerHTML = setComma(data.cart_ist_cpn_prc_sysRetail + data.cart_ist_cpn_prc_vendor);
					document.getElementById("span_cart_delivery_normal").innerHTML = setComma(data.cart_delivery_sysRetail + data.cart_delivery_vendor);
					document.getElementById("span_cart_total_normal").innerHTML = setComma(data.cart_total_sysRetail + data.cart_total_vendor);
					document.getElementById("span_cart_reserve_point_normal").innerHTML = setComma(data.cart_reserve_point_sysRetail + data.cart_reserve_point_vendor);
					
				},
				error : function(error){
					alert(error);
				}
			});
		}else{
			$(".span_amt").html("0");
		}
	}
	
	// 상품상세 이동
	goProductView = function(prdMstCd){
		location.href = "<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD="+prdMstCd;
	}
	
	// 선택상품 삭제 ajax 요청
	deletecart = function(idx_arr){
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"MEM_CRT_IDX[]" : idx_arr
			},
			url : "<c:out value="${serverSslDomain}" />/pc/cart/deleteCart.do",
			success : function(data) {
				location.href = "<c:out value="${serverSslDomain}"/>/pc/cart/cartlist.do";
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});
	}
	
	// 옵션변경
	optionLayerPopup = function(){
		var object = new Object();
		
		$("#option_popup").empty();
		$("#optionPopupTemplate").tmpl(object).appendTo($("#option_popup"));	
	}
</script>