<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!--  <style>
.dim{display:block}
</style> -->
<div class="cpnForm"> 	
	<div class="location" style="top: 141px;"></div>	
	<div id="layer_inquiry" class="layer type01 is_btn" style="display:none;">			
		<div id="layer_goods_coupon" >
			<div class="layer_header">
				<h2>상품할인쿠폰 적용</h2>
			</div>
			<div class="layer_content scroll">
				<div class="goods_coupon">
					<ul>
						<li>
							<p class="tit">할인쿠폰</p>
							<div class="select">
								<select id="prdCpnList" name="prdCpnList"></select>
							</div>						
						</li>
						<li>
							<p class="tit">중복할인</p>
							<span class="select w100p">
								<select title="중복할인">
									<option>중복 1,000원 할인 쿠폰</option>
								</select>
						</span>
						</li>
					</ul>
					<div class="total clearboth">
						<p class="tit">총 할인금액</p>
						<p class="price">							
							<span id="cpnDcAmt">0</span>
							<span>원</span>
						</p>						
						<!-- <p class="price">3,000 원</p> -->
					</div>
				</div>
			</div>
			<div class="layer_footer">				
				<button class="cpn_popup_close btn_large gray">취소</button>
				<button type="button" id="write" class="btn_large ok" >적용</button>
			</div>
			<%-- <a href="<c:out value="${serverDomain}" />/shinwonmall/web/html/payment/SWPWOP07.html#none" class="inquiry_popup_close btn_layer_close">레이어 닫기</a> --%>
			<!-- <a href="javascript:openUseCpnPopup()" class="inquiry_popup_close btn_layer_close">레이어 닫기</a> -->
			<a href="#" class="cpn_popup_close btn_layer_close">레이어 닫기</a>
			</div>
	</div>
</div>
<form id="inquiryForm" name="inquiryForm"></form>
<script>

var $prdCpnList = $('#prdCpnList');
var cpnIndex = "";
var PRD_TMP_IDX =""; //주문임시테이블번호

$('.cpn_popup_close').on('click', function(){
	openUseCpnPopup(false);
});

openCpnPopup = function(CPN_TGT_CD , prdTmpIdx , index){	//상품, 인덱스
	cpnIndex = index;
	PRD_TMP_IDX = prdTmpIdx;
	openUseCpnPopup(true,CPN_TGT_CD);
}	

var openUseCpnPopup = function(pIsOpen, CPN_TGT_CD) {
	if(pIsOpen) {			
		$.ajax({
			type: "post",
			url: "<c:out value="${serverDomain}"/>/pc/cart/selectProdCpnProcAjax.do",
			data: {
					  "CPN_TGT_CD": CPN_TGT_CD
				  },
			async: false,
			success: function(data) {				
				if(data != null) {
					//데이터로 해당 페이지 매핑
					if(data.cpnList != null) {
						$prdCpnList.empty();
						$.each(data.cpnList, function(index, items) {
							if(index == 0) {
								$prdCpnList.append('<option value="" >쿠폰을 선택해 주세요. </option>');
							}
							
							if(items.CPN_MEM_USE_DT != 'undefined' && items.CPN_MEM_USE_DT != "" && items.CPN_MEM_USE_DT != null) {								
								var appendVal = '<option value="'+items.CPN_MEM_IDX+'" data-cpnDc='+items.CPN_MST_SAL_GBN_PAY+' style="background-color:#ababab;" disabled >'+items.CPN_MST_TITLE+'(사용중)</option>';
							}else {
								var appendVal = '<option value="'+items.CPN_MEM_IDX+'" data-cpnDc='+items.CPN_MST_SAL_GBN_PAY+'>'+items.CPN_MST_TITLE+'</option>';
							}							
							$prdCpnList.append(appendVal);	
						});	
						$('.cpnForm').show();
						$('#layer_inquiry').css({
							   'top' : '15%',
							   'left' : '35%',			   
							   'display' : 'block',
							   'width' : '520px',
							   'height' : '520px'			   
							});													
						$('.cpnForm').append('<div class="dim" style="display:block;"></div>');							
					}							
				}										
	 		},
	 		error : function (err) {
	 		   	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	 		}
		 });				
	}else {
		$('.cpnForm').find('.dim').remove();
		$('.cpnForm').hide();
	}
}

var isQnaAjax = false;
$(document).on("click", "#write", function(){
	if(isQnaAjax) return;
	$("#inquiryForm").empty();
	var $inquiryForm = $("#inquiryForm");
	
	var cpnDcAmt = $('#cpnDcAmt').text();	
	
	if($inquiryForm.valid()){	
		if(confirm('적용하시겠습니까?')) {		
			
			//formData set			
			var memIdx = $('#prdCpnList :selected').val();
			var cpnDcAmt = $('#prdCpnList :selected').data('cpndc');			
			var useCpn = '<input type="hidden" name="CPN_MEM_IDX" value="'+memIdx+'" />';
			var tmpIdx = '<input type="hidden" name="PRD_TMP_IDX" value="'+PRD_TMP_IDX+'" />';
			
			$inquiryForm.append(useCpn);
			$inquiryForm.append(tmpIdx);
			var queryString = $inquiryForm.serialize(); 
			console.log();
			
			//데이터 UPDATE
			$.ajax({
			    type : 'POST',			    
			    url: "<c:out value="${serverDomain}"/>/pc/cart/cpnUseUpdateProc.do",
			    data : queryString,
			    error: function(xhr, status, error){
			    	alert('저장에 실패했습니다.');
			    },
			    success : function(data){			    	
			    	if(data) {
			    		alert('쿠폰을 사용했습니다.');	
			    		$('#cpnDcAmt_'+cpnIndex).text(setComma(cpnDcAmt));
			    		calcIniPayment(cpnIndex);
			    	}else {
			    		alert('쿠폰사용에 실패했습니다.');			    		
			    	}			    				    				    
			    },
			    complete : function() {
			    	isQnaAjax = false;
			    	openUseCpnPopup(false);
			    }
			});
									
		}
		
	}
});

$('#prdCpnList').on('change', function(){
	var val = $(this).val();
	
	if(val != '') {	
		$('#cpnDcAmt').text(setComma($('#prdCpnList :selected').data('cpndc')));
	}else {
		$('#cpnDcAmt').text(0);
	}
});

</script>