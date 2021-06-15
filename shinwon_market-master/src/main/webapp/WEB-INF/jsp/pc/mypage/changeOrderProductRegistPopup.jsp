<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">교환 신청</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>교환 신청 : 주문번호, 주문일 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%;">
							<col>
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td><c:out value="${orderInfo.ORD_MST_CD }" /></td>
								<th scope="row">주문일</th>
								<td><c:out value="${orderInfo.ORD_MST_ORD_DT8 }" /></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">주문상품 정보</h3>
				</div>
				
				<form id="frm" name="frm">
					<input type="hidden" id="" name="selfReturn" value="Y" />
	            	<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/>
	            	<input type="hidden" id="recordCnt" name="recordCnt"/>
	            	<input type="hidden" id="DLV_PAY_WAY" name="DLV_PAY_WAY"/>
	            	<input type="hidden" id="DLV_PAY_WAY_MEMO" name="DLV_PAY_WAY_MEMO"/>
	            	<input type="hidden" id="ORD_PRD_DLV_ADD_CAG_GBN" name="ORD_PRD_DLV_ADD_CAG_GBN"/>
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>주문상품 정보 : 상품정보, 교환 사이즈, 상품금액, 배송비, 판매자명, 진행상태 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:16%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:10%;">
							<col style="width:12%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">교환 사이즈</th>
								<th scope="col">상품금액</th>
								<th scope="col">배송비</th>
								<th scope="col">판매자명</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderProductList}" var="data" varStatus="i">
							<tr>
								<td class="pro_chk">
									<div class="chkbx">
										<input type="checkbox" id="ORD_PRD_IDX${i.index + 1 }" name="ORD_PRD_IDX${i.index + 1 }" 
											value="${data.ORD_PRD_IDX}" data-dlv_type="${data.ORD_PRD_DLV_TYPE }"
											<c:if test="${commandMap.ORD_PRD_IDX eq data.ORD_PRD_IDX }">checked</c:if>>
										<label for="ORD_PRD_IDX${i.index + 1 }"><span class="icon"></span><span class="blind">선택</span></label>
									</div>
									<div class="product_info clearboth">
										<div class="img">
											<a href="javascript:goProductView('${data.ORD_PRD_MST_CD }');" class="product_thumb">
												<img src="${cdnDomain }${data.PRODUCT_THUM_IMG }" >
											</a>
										</div>
										<div class="txt">
											<span class="brand">[${data.VDR_MST_NM}]</span>
											<a href="javascript:void(0)" class="item_name">${data.PRD_MST_NM }</a>
											<span class="item_info">${data.ORD_PRD_COLOR_NM} / ${data.ORD_PRD_SIZE_NM} / ${data.ORD_PRD_ORD_CNT}개</span>
										</div>
									</div>
								</td>
								<td>
									<span class="select">
										<select id="ordPrdSize${i.index + 1 }" class="w100p" name="ORD_PRD_SIZE${i.index + 1 }">
											<c:forEach items="${data.ALL_STOCK }" var="data2">
												<option ${data2.SELECTED } value="${data2.CODE }" ${data2.DISABLED }>${data2.SIZE_NM }</option>
											</c:forEach>
										</select>
									</span>
								</td>
								<td>
									<c:set var="r_price" value="${data.ORD_PRD_PRD_PRC}"/>
									<c:set var="s_price" value="${data.ORD_PRD_SAL_PRC}"/>
									<c:if test="${r_price ne s_price }">
										<span class="r_price"><fmt:formatNumber value="${data.ORD_PRD_PRD_PRC}" type="number"/>원</span>
									</c:if>
									<span class="s_price"><fmt:formatNumber value="${data.ORD_PRD_SAL_PRC}" type="number"/>원</span>
								</td>
								<c:choose>
									<c:when test="${data.ORD_PRD_DLV_BND_YN eq 'Y' and data.VDR_ROWNUM eq 1}">
			                          	<td rowspan="${data.VDR_IDX_CNT}">
			                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_BND_CAG}" type="number"/>
			                     	  	</td>
			                        </c:when>
			                        <c:when test="${data.ORD_PRD_DLV_BND_YN ne 'Y'}">
			                          	<td>
			                          		<fmt:formatNumber value="${data.ORD_PRD_DLV_CAG}" type="number"/>
			                     	  	</td>
			                        </c:when>
	                        	</c:choose>
								<td><c:out value="${data.VDR_MST_NM}" /></td>
								<td><c:out value="${data.ORD_PRD_ORD_STATE_NM}"/></td>
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">교환 사유</h3>
				</div>
				<div class="table_wrap mb95">
					<p class="required_txt"><span>필수입력사항</span></p>
					<table class="tb_row">
						<caption>교환사유 : 사유, 상세사유 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 사유</th>
								<td>
									<span class="select">
										<select id="SELECT_REASON" name="SELECT_REASON" class="w284">
											<option selected="selected" value="">교환 사유 선택</option>
											<c:forEach var="data" items="${codes.ORDER_CANCEL_RETURN_REASON}">
												<option value="${data.CMN_COM_IDX }" class="<c:if test="${ '구매자귀책' eq data.CMN_COM_ETC1 }">userFault</c:if>">${data.CMN_COM_NM }</option>
											</c:forEach>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">상세사유</th>
								<td>
									<textarea class="text_area" name="ORD_PRD_CHANGE_REASON_DSC" id="ORD_PRD_CHANGE_REASON_DSC" placeholder="200자 이내로 입력하세요."></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">교환 상세 정보</h3>
				</div>
				<div class="table_wrap mb95" id="changeProduct_wp">
					<table class="tb_row">
						<caption>교환 상세 정보 : 교환 방법 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">교환 방법</th>
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

				<jsp:include page="include/return_delivery.jsp"></jsp:include>
				
				<div class="con_sstit_wrap mb10">
					<h4 class="con_sstit">교환 배송지</h4>
					<div class="top_btn">
						<a href="javascript:void(0)" class="btn order view address_info">배송지 정보 변경</a>
					</div>
				</div>
				<div class="table_wrap mb50">
					<table class="tb_row tb_small">
						<caption>교환 배송지 : 받으시는 분, 휴대폰, 전화번호, 주소, 배송 유의사항 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:30%">
							<col style="width:20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">받으시는 분</th>
								<td colspan="3">
								<input type="text" name="ORD_DLV_NM" value="${orderDeliveryInfo.ORD_DLV_NM}" placeholder="수령인 입력" style="width:150px;">
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td>
									<input type="text" name="ORD_DLV_HP1" value="${orderDeliveryInfo.ORD_DLV_HP1}" maxlength=3 style="width:80px;"> -
			                        <input type="text" name="ORD_DLV_HP2" value="${orderDeliveryInfo.ORD_DLV_HP2}" maxlength=4 style="width:80px;"> -
			                        <input type="text" name="ORD_DLV_HP3" value="${orderDeliveryInfo.ORD_DLV_HP3}" maxlength=4 style="width:80px;">
								
								</td>
								<th scope="row">전화번호</th>
								<td>
									<input type="text" name="ORD_DLV_TEL1" value="${orderDeliveryInfo.ORD_DLV_TEL1}" maxlength=3 style="width:80px;"> -
			                        <input type="text" name="ORD_DLV_TEL2" value="${orderDeliveryInfo.ORD_DLV_TEL2}" maxlength=4 style="width:80px;"> -
			                        <input type="text" name="ORD_DLV_TEL3" value="${orderDeliveryInfo.ORD_DLV_TEL3}" maxlength=4 style="width:80px;">
								
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="3" class="address_info_wrapper">
									<span class="block">
									<input type="text" name="ORD_DLV_ZIP_CDE5" value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5}" placeholder="우편번호 입력" class="postcode" style="width:150px;">
									</span>
									<span class="block">
									<input type="text" name="ORD_DLV_DRO_ADR1" value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1}" placeholder="도로명 주소 입력" class="road_addr" style="width:600px;">
									</span>
									<span class="block">
									<input type="text" name="ORD_DLV_JBN_ADR1" value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1}" placeholder="지번 입력" class="jibun_addr" style="width:600px;">
									</span>
									<span class="block">
									<input type="text" name="ORD_DLV_DRO_ADR2" value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2}" placeholder="이하 입력" class="etc_addr" style="width:600px;">
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">배송 유의사항</th>
								<td colspan="3"><input type="text" name="ORD_DLV_MSG" value="${orderDeliveryInfo.ORD_DLV_MSG}" placeholder="배송메모 입력" style="width:600px;"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_sstit_wrap mb10">
					<h4 class="con_sstit">교환 배송비</h4>
				</div>
				<div class="table_wrap mb25">
					<table class="tb_row tb_small">
						<caption>교환 배송비 : 교환 배송비 출력 표입니다.</caption>
						<colgroup>
							<col>
						</colgroup>
						<tbody>
							<!-- 사유미선택 : S -->
							<tr class="reason_not_selected">
								<td><strong class="t_inf">교환사유를 먼저 선택해주세요</strong></td>
							</tr>
							<!-- //사유미선택 : E -->
							<!-- 구매자 책임 사유선택 : S -->
							<tr class="userFault_showing" style="display:none;">
								<td>
									<dl class="inf_detail">
										<dt>구매자 책임</dt>
										<dd><strong>5,000원</strong> (반송배송비 2,500원 + 교환배송비 2,500원)</dd>
									</dl>
								</td>
							</tr>
							<!-- //구매자 책임 사유선택 : E -->
							<!-- 판매자 책임 사유선택 : S -->
							<tr class="sellerFault_showing" style="display:none;">
								<td>
									<dl class="inf_detail">
										<dt>판매자 책임</dt>
										<dd><strong>0원</strong> (반송배송비 0원 + 교환배송비 0원)</dd>
									</dl>
								</td>
							</tr>
							<!-- //판매자 책임 사유선택 : E -->
						</tbody>
					</table>
				</div>
				<jsp:include page="include/return_delivery_payment.jsp"></jsp:include>

				<div class="btn_wrap mt95">
					<button type="button" class="btn_large" id="close">취소</button>
					<button type="button" class="btn_large ok" id="goRegist">교환신청</button>
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
			<!-- //sub_content -->
		</div>
	</div>

<script type="text/javascript">
$(function(){
	
	// 셀렉트박스 초기화
	$('input[name^="ORD_PRD_IDX"]').each(function() {
		selectBoxEvent($(this));
	})
	
	// 체크박스 값 변경시 이벤트
	$('input[name^="ORD_PRD_IDX"]').change(function() {
		selectBoxEvent($(this));
		
		let auto_dlv_check = true;	// 일반택배일 경우에만 자동수거 버튼 활성화하기 위해 사용할 변수
		$('input[name^="ORD_PRD_IDX"]').each(function() {
			if($(this).data('dlv_type') != "${Code.DLV_TYPE_PARCEL_SGS}"){
				auto_dlv_check = false;
			}
		})
		if(auto_dlv_check){
			$('#return-1, #return-1 + label').show();
		}else{
			$('#return-1, #return-1 + label').hide();
		}
	})
	
	function selectBoxEvent($checkBox){
		if($checkBox.is(":checked")){
			$checkBox.parent().parent().next().find('select').removeAttr('disabled');
		}else{
			$checkBox.parent().parent().next().find('select').attr('disabled', true);
		}
	}
	
	// 교환 사유 선택 셀렉트박스 이벤트
	var userFaultFlag = false;
	$(document).on("change", "#SELECT_REASON", function(){
		if($(this).find('option:selected').index() == 0){
			$('.reason_not_selected').show();
			$('.userFault_showing').hide();
			$('.sellerFault_showing').hide();
			return;
		}
   		userFaultFlag = $('#SELECT_REASON option:selected').attr('class')=='userFault'?true:false;
	   	if(userFaultFlag){
	   		$('.userFault_showing').show();
	   		$('.sellerFault_showing').hide();
	   		$('.reason_not_selected').hide();
	   	}else{
	   		$('.userFault_showing').hide();
	   		$('.sellerFault_showing').show();
	   		$('.reason_not_selected').hide();
	   	}
    });
	
	// 폼체크
    $("#frm").validate({
        rules:{
        	changeProduct : {required:true}
        	,SELECT_REASON : {required:true} 
        	,ORD_PRD_CHANGE_REASON_DSC : {maxlength:200}
        },
        messages :{
        	changeProduct : {required:"교환 방법을 선택해주세요."}
        	,SELECT_REASON : {required:"교환 사유를 선택해주십시오."} 
        	,ORD_PRD_CHANGE_REASON_DSC : {maxlength:"상세 사유는 200자 이내로 작성해주세요."}
        }
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

	// 등록 이벤트
    $(document).on("click", "#goRegist", function () {
    	
        var $frm = $("#frm");
        $('#recordCnt').val($('div.chkbx input[name^="ORD_PRD_IDX"]:checked').length);
        
        if($frm.valid() && payment_validation()){
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"${serverDomain}/mypage/changeOrderProductProc2.do", "target":"_self", "method":"post"}).submit();
                $.blockUI({
            		message: "처리중입니다...",
            		css: {
	                    border: 'none',
	                    padding: '15px',
	                    backgroundColor: '#000',
	                    '-webkit-border-radius': '10px',
	                    '-moz-border-radius': '10px',
	                    opacity: .5,
	                    color: '#fff'
                	}
            	});
            }
        }
    });
	
    $(document).on("click", "input[name=changeProduct]", function () {
    	$('#changeProduct_wp').removeClass("mb95").addClass("mb50");
    })
    
  	//간편보기
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			popup('${frontDomain}/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
    
   });
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode($pTargetElem) {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            $('.postcode').val(data.zonecode);
	            $('.road_addr').val(fullRoadAddr);
	            $('.jibun_addr').val(data.jibunAddress);
	            $('.etc_addr').val('');
	        
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('MEM_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            //document.getElementById('MEM_DLV_DRO_ADR1').value = fullRoadAddr;
	            //document.getElementById('MEM_DLV_JBN_ADR1').value = data.jibunAddress;
				
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            /*
	            if(data.autoRoadAddress) {
	                //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = ;
	                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')
	
	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	            */
	        }
	    }).open();
	}
	
	function execDaumPostcode2($pTargetElem) {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	         
	            $('.postcode2').val(data.zonecode);
	            $('.road_addr2').val(fullRoadAddr);
	            $('.jibun_addr2').val(data.jibunAddress);
	            $('.etc_addr2').val('');
	        
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('MEM_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            //document.getElementById('MEM_DLV_DRO_ADR1').value = fullRoadAddr;
	            //document.getElementById('MEM_DLV_JBN_ADR1').value = data.jibunAddress;
				
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            /*
	            if(data.autoRoadAddress) {
	                //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = ;
	                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')
	
	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	            */
	        }
	    }).open();
	}
	
	$('.address_info').on('click', function(){
		var $targetElem = $(this).closest('.address_info_wrapper');
		execDaumPostcode($targetElem);
	});
	
	$('.address_info2').on('click', function(){
		var $targetElem = $(this).closest('.address_info_wrapper2');
		execDaumPostcode2($targetElem);
	});
	
	$('#close').click(function() {
		history.back(-1);
	})
</script>