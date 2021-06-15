<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="layer_inquiry" class="layer type03 is_btn" style="display:none;">
	<div class="layer_header">
		<h2>상품문의하기</h2>
	</div>
	<form id="inquiryForm" name="inquiryForm">
		<div class="layer_content">
			<div class="table_wrap">
				<p class="required_txt"><span>필수입력사항</span></p>
				<input type="hidden" value="" name="BRD_INQ_IDX">
				<input type="hidden" value="${productInfo.PRD_MST_CD }" name="prdMstCd">
				
				<table class="tb_row type03">
					<caption>상품문의하기 : 제목, 내용, 공개여부 입력 표입니다.</caption>
					<colgroup>
						<col style="width:22.35%">
						<col style="width:auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 제목</th>
							<td><input type="text" id="BRD_INQ_TITLE" name="BRD_INQ_TITLE" maxlength="40" placeholder="제목 입력" class="w620"></td>
						</tr>
						<tr>
							<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 내용</th>
							<td><textarea id="BRD_INQ_CONTENTS" name="BRD_INQ_CONTENTS" maxlength="1500" cols="30" rows="10"></textarea></td>
						</tr>
						<tr>
							<th scope="row">공개여부</th>
							<td>
								<input type="checkbox" id="BRD_INQ_PUB_YN" name="BRD_INQ_PUB_YN" value="N">
								<label for="BRD_INQ_PUB_YN"><span class="icon"></span>비공개</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	
	<div class="layer_footer">
		<button class="btn_large gray inquiry_popup_close">취소</button>
		<button type="button" id="write" class="btn_large ok" >완료</button>
	</div>
	<a href="#none" class="btn_layer_close inquiry_popup_close">레이어 닫기</a>
</div>

<script>
$( document ).ready(function() {
	
	$("#inquiryForm").validate({
        rules: 
        {
        	BRD_INQ_TITLE:{required:true, maxlength:40},
			BRD_INQ_CONTENTS:{required:true, maxlength:1500}
        },
        messages :
        {
        	BRD_INQ_TITLE: {required:"[제목]은 필수 정보입니다..", maxlength:"비밀번호는 최대 40글자입니다."},
        	BRD_INQ_CONTENTS: {required:"[내용]은 필수 정보입니다.", maxlength:"비밀번호는 최대 1500글자입니다."}
        }
        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   var errorOobjId = $(errorList[0].element).attr('id');
	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
	    	   caption = caption.replace('*','').replace(/\s/gi,'');
	    	   if(caption != null && caption != "") 
	    	   {
	    	       alert('[' + caption + '] ' + errorList[0].message);
	    	   }
	    	   else
	    	   {
	    	       alert(errorList[0].message);
	    	   }
	    	   $(errorList[0].element).focus();
	       }
        }
    });
	
	var openInquiryPopup = function(pIsOpen) {
		if(pIsOpen) {
			$('#layer_inquiry').css({
			   'top' : '50%',
			   'left' : '50%',
			   'margin' : '-320px 0 0 -455px',
			   'display' : 'block'
			});
			$('.bg_layer').show();
			
		} else {
			$('#layer_inquiry').hide();
			$('.bg_layer').hide();
			$("#inquiryForm")[0].reset();
			$("#BRD_INQ_PUB_YN").attr("checked", false);
		}
	}
	
	var renderInquiryInfo = function(pData) {
		$('#BRD_INQ_TITLE').val(pData.BRD_INQ_TITLE);
		$('#BRD_INQ_CONTENTS').val(pData.BRD_INQ_CONTENTS);
		if(pData.BRD_INQ_PUB_YN == 'Y') $('#BRD_INQ_PUB_YN').prop('checked', false);
		else  $('#BRD_INQ_PUB_YN').prop('checked', true);
	}
	
	var getInquiryInfo = function(pID){
	   	$.ajax({
    		type	: "POST",
    		url		: "/pc/product/productQnaInfoAjax.do",
    		dataType: "json",
    		data	: {BRD_INQ_IDX: pID},
    		success : function(data) {
    			renderInquiryInfo(data.info);
    		}, error : function(err) {
    		}, complete : function(){
    		}
    	});
		
	}
	$(document).on('click', '.inquiry_popup', function(){
		
		$('#inquiryForm input[name="BRD_INQ_IDX"]').val('');
		
		var curId = $(this).attr('data-id');
		if(curId && curId.length > 0) {
			$('#inquiryForm input[name="BRD_INQ_IDX"]').val(curId);
			openInquiryPopup(true);
			getInquiryInfo(curId);
		}
		else if($(this).data('mem').length <= 0){
			alert('로그인이 필요한 서비스입니다.');
		} else {
			openInquiryPopup(true);	
		}
	});
	
	$('.inquiry_popup_close').on('click', function(){
		openInquiryPopup(false);
	});
	
	var isQnaAjax = false;
	$(document).on("click", "#write", function(){
		if(isQnaAjax) return;
		var $inquiryForm = $("#inquiryForm");
		if($inquiryForm.valid()){
			
			if(confirm('저장하시겠습니까?')) {
				var queryString = $inquiryForm.serialize() ;
				isQnaAjax = true;
				console.log(queryString);
		        $.ajax({
		            type : 'post',
		            url : '/pc/product/productQnaRegist.do',
		            data : queryString,
		            //dataType : 'json',
		            error: function(xhr, status, error){
		            	alert('저장에 실패했습니다.');
		            },
		            success : function(json){
		            	alert('자장에 성공했습니다.');
		            	openInquiryPopup(false);
		            	funcGetQnAList(1);
		            },
		            complete : function() {
		            	isQnaAjax = false;
		            }
		        });
			}

		
			// TODO 상품문의 등록 수정
			//$inquiryForm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/productQnaRegist.do", "target":"_self", "method":"post"}).submit();
		}
	});
	
});

</script>