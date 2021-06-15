<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="layer_myfit" class="layer type03 is_btn" style="top:50%;left:50%;display:block;margin:-320px 0 0 -455px; display:none;">
	<div class="layer_header">
		<h2>마이핏수정</h2>
	</div>
	<div class="layer_content">
		<div class="myfit_edit">
			<input type="hidden" id="myfit_infoyn" value="${myFitInfoYN}" /> 
			<div class="inner">
				<div class="icon_guide">					
					<img src="${cdnDomain}${myFitSampleImg}" alt="핏가이드이미지">
				</div>
				<div class="input_field">
					<div class="item_wp">
                  		<c:forEach var="myfitinfo" items="${myFitInfolist}" varStatus="status">
							<div class="item">
								<strong>${status.count }. ${myfitinfo.FIT_INFO_NM }</strong>
								<input class="myfit-data" type="number" placeholder="cm 입력" value="${myfitinfo.MEM_FIT_VAL }" data-midx="${myfitinfo.FIT_MST_IDX }" data-iidx="${myfitinfo.FIT_INFO_IDX }">
								<span>cm</span>
							</div>
                    	</c:forEach>
					</div>
				</div>
			</div>
			<!-- <div class="size_info">
				<h3>치수 입력 안내</h3>
				<ul class="ul_dot">
					<li>어깨너비는 최소 25 ~ 최대 80까지 입력 할 수 있습니다.</li>
					<li>가슴단면는 최소 30 ~ 최대 100까지 입력 할 수 있습니다.</li>
					<li>소매길이는 최소 10 ~ 최대 50까지 입력 할 수 있습니다.</li>
					<li>총장은 최소 30 ~ 최대 150까지 입력 할 수 있습니다.</li>
				</ul>
			</div> -->
		</div>
	</div>
	<div class="layer_footer">
		<button class="btn_large gray myfit-popup-close">취소</button>
		<button class="btn_large ok myfit-save">저장</button>
	</div>
	<a href="#none" class="btn_layer_close">레이어 닫기</a>
</div>

<script>
$( document ).ready(function() {
	var openMyfitPopup = function(pIsOpen) {
		if(pIsOpen) {
			resetDataUI();
		
			$('#layer_myfit').css({
			   'top' : '50%',
			   'left' : '50%',
			   'margin' : '-320px 0 0 -455px',
			   'display' : 'block'
			});
			$('.bg_layer').show();
		} else {
			$('#layer_myfit').hide();
			$('.bg_layer').hide();
		}
	}
	$('.myfit-popup').on('click', function(){
		
		if(!GetIsLogin()) {
			if(confirm('로그인이 필요합니다.\n로그인 하시겠습니까?')) {
				location.href = '/pc/manager/login.do';
			} 
		} else {
			if($('#myfit_infoyn').val() == 'Y')
				openMyfitPopup(true);	
			else 
				location.href = '/pc/mypage/myFitList.do';
		}
	});
	
	$('.myfit-popup-close').on('click', function(){
		openMyfitPopup(false);
	});
	
	var resetDataUI = function(){
		$('.myfit-data').each(function(){
			
			var comIdx = $(this).data('iidx');
			
			var prevTxt = '0';
			
			if($('#myfit_' + comIdx).length > 0) {
				prevTxt = $('#myfit_' + comIdx).text();
			}
			$(this).val(prevTxt);
		});
	}
	var isAjaxing = false;
	$('.myfit-save').on('click', function(){
		
		if(isAjaxing) return;
		
		var inData = [];
		$('.myfit-data').each(function(){
    		inData.push({
    			MEM_FIT_VAL : $(this).val(),
    			FIT_MST_IDX : $(this).data('midx'),
    			CMN_COM_IDX : $(this).data('iidx')
    		})
		});
		
   		var isVal = true;
    	for(var i = 0; i < inData.length; i++) {
    		if(inData[i].MEM_FIT_VAL.length <= 0 || inData[i].MEM_FIT_VAL * 1 < 0) {
    			isVal = false;
    		}
    	}
    	
    	if(isVal == false) {
    		alert('모든 항목에 0 이상의 정보를 입력해 주십시요.');
    		return;
    	} 
    	
    	isAjaxing = true;
    	ShowLoading(true);
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/mypage/myFitListAjax.do",
    		dataType: "json",
    		data	: {myfit_list : JSON.stringify(inData)},
    		success : function(data) {
				alert('저장에 성공했습니다.');
    			
				for(var i = 0; i < inData.length; i++) {
					$('#myfit_' + inData[i].CMN_COM_IDX).text(inData[i].MEM_FIT_VAL);
				}
				
				openMyfitPopup(false);
				
    		}, error : function(err) {
    			alert("요청 실패");
    			
    		}, complete : function(){
    			ShowLoading(false);
    			isAjaxing = false;
    			
    		}
    	});
    	
	});
});

</script>
		