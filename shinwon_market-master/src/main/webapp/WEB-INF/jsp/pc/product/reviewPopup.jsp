<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="layer_review_wirte" class="layer type03 is_btn" style="display:none;">
	<div class="layer_header">
		<h2>리뷰작성</h2>
	</div>
	<div class="layer_content">
		<div class="table_wrap">
			<p class="required_txt"><span>필수입력사항</span></p>
			<form name="reviewfrm" id="reviewfrm" enctype="multipart/form-data" novalidate="novalidate">
			<input id="PRD_REV_IDX" name="PRD_REV_IDX" type="hidden"/>
			<input id="CMM_FLE_IDXs" name="CMM_FLE_IDXs" type="hidden"/>
			<input id="PRD_ORD_PRD_IDX" name="PRD_ORD_PRD_IDX" type="hidden" value="${productInfo.PRD_ORD_PRD_IDX }"/>
			<input id="PRD_PRD_MST_CD" name="PRD_PRD_MST_CD" type="hidden" value="${productInfo.PRD_MST_CD }"/>
			
			<table class="tb_row">
				<caption>리뷰작성 : 상품 평가, 만족도 평가, 내용, 사진첨부 입력 표입니다.</caption>
				<colgroup>
					<col style="width:20%">
					<col style="width:auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">
							<span class="required">
								<em class="blind">필수 정보</em>
							</span> 상품 평가
						</th>
						<td class="satisfy_wp clearboth">
							<input id="PRD_REV_STAR" name="PRD_REV_STAR" type="hidden"/>
							<div class="satisfy_check fix clearboth">
								<button type="button" class="btn_satisfaction">
									<em class="blind">만족도</em>
								</button>
								<button type="button" class="btn_satisfaction">
									<em class="blind">만족도</em>
								</button>
								<button type="button" class="btn_satisfaction">
									<em class="blind">만족도</em>
								</button>
								<button type="button" class="btn_satisfaction">
									<em class="blind">만족도</em>
								</button>
								<button type="button" class="btn_satisfaction">
									<em class="blind">만족도</em>
								</button>
    					</div>
    					<!-- <span class="score purple"><strong>3.0</strong>점</span> -->
    				</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="required">
								<em class="blind">필수 정보</em>
							</span> 만족도 평가
						</th>
						<td>
							<dl class="satisfy_rdo clearboth">
								<dt>사이즈는 어떤가요?</dt>
								<dd>
									<input type="radio" id="r_size1" name="PRD_REV_SIZE" value="A" checked>
									<label for="r_size1"><span class="icon"></span>작아요</label>
									<input type="radio" id="r_size2" name="PRD_REV_SIZE"  value="B" >
									<label for="r_size2"><span class="icon"></span>정사이즈예요</label>
									<input type="radio" id="r_size3" name="PRD_REV_SIZE"  value="C" >
									<label for="r_size3"><span class="icon"></span>커요</label>
								</dd>
							</dl>
							<dl class="satisfy_rdo clearboth pt0">
								<dt>컬러는 어떤가요?</dt>
								<dd>
									<input type="radio" id="r_color1" name="PRD_REV_CLR" value="A" checked>
									<label for="r_color1"><span class="icon"></span>화면과 같아요</label>
									<input type="radio" id="r_color2" name="PRD_REV_CLR" value="B">
									<label for="r_color2"><span class="icon"></span>화면과 달라요</label>
								</dd>
							</dl>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="required">
								<em class="blind">필수 정보</em>
							</span> 내용
						</th>
						<td>
							<textarea title="내용 입력" id="PRD_REV_CONTENTS" name="PRD_REV_CONTENTS"></textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">사진첨부</th>
						<td>
							<div class="attachment_wrap">
								<input type="text" name="" value="" class="inp_txt" title="파일 첨부하기">
								<input type="file" id="attachment" class="inp_file">
								<label for="attachment" class="btn_attachment">파일 첨부하기</label>
								<span class="txt">
									첨부파일 형식 : <em>JPG, GIF</em>  /  용량 : <em>2MB</em> 이하
								</span>
							</div>
							<div class="attachment_write">
								<ul id="review_images">
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
		<div class="attention_list_wrap mt25">
			<ul>
				<li>구매한 상품과 관계가 없는 내용이나 비방성 글은 등록자에게 사전 동의 없이 임의로 삭제될 수 있습니다.</li>
				<li>배송, 상품문의는 마이페이지&gt;1:1 문의를 이용해주세요.</li>
			</ul>
		</div>
	</div>
	<div class="layer_footer">
		<button class="btn_large gray review-popup-close">취소</button>
		<button class="btn_large ok review-submit">완료</button>
	</div>
	<a href="#none" class="btn_layer_close">레이어 닫기</a>
</div>
				

<script>
$( document ).ready(function() {

	var openReviewPopup = function(pIsOpen) {
		if(pIsOpen) {
			$('#layer_review_wirte').css({
					   'top' : '50%',
					   'left' : '50%',
					   'margin' : '-320px 0 0 -455px',
					   'display' : 'block'
					});
			$('.bg_layer').show();
		} else {
			$('#layer_review_wirte').hide();
			$('.bg_layer').hide();
		}
	};
	var REVIEW_BAS_IMG_PATH = '<c:out value="${cdnDomain}" />';
	var renderReviewInfo = function(curData) {
		var $formElem = $('#layer_review_wirte');
		
		console.log(curData);
		var curScoreIdx = 1;
		$('.satisfy_check .btn_satisfaction', $formElem).each(function(){
			if( curScoreIdx <= curData.PRD_REV_STAR ) $(this).addClass('on');
			else $(this).removeClass('on');
			
			curScoreIdx++;
		});
		
		$('input:radio[name="PRD_REV_SIZE"]', $formElem).each(function() {
	
			 if(this.value == curData.PRD_REV_SIZE){
				 this.checked = true;
			 } else
				 this.checked = false;
		});
		 
		$('input:radio[name="PRD_REV_CLR"]', $formElem).each(function() {

			 if(this.value == curData.PRD_REV_CLR){
				 this.checked = true;
			 } else 
				 this.checked = false;
		});
		 
		$('#PRD_REV_CONTENTS').val(curData.PRD_REV_CONTENTS);
		 
		var imgList = curData.IMAGES;
		
		if(imgList){
			for(var i = 0 ; i < imgList.length; i ++) {
				var curImgPath =  REVIEW_BAS_IMG_PATH + imgList[i].FILENM;
				//var curImgAlt = imgList[i].CMM_FLE_ATT_EXT;
				
				var tmpIDX = 'REV_' + imgList[i].CMM_FLE_IDX;
				var prevTempHTML = PREVIEW_HTML.replace(/{idx}/ig, tmpIDX);
				$('#review_images').append(prevTempHTML);
				$('#' + tmpIDX).attr('src', curImgPath);
			}
		}
		
	};
	
	var getProdReviewInfo = function(pId) {
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/product/productPhotoRevLimitListAjax.do",
    		dataType: "json",
    		data	: {PRD_MST_CD: $('#target_prd_code').val(), PRD_REV_IDX : pId},
    		success : function(data) {
    			if(data.list.length > 0)
    				renderReviewInfo(data.list[0]);
    		}, error : function(err) {
    		}, complete : function(){
    		}
    	});
	}
	
	var DELETED_IMG_LIST = [];
	$(document).on('click', '.review-popup', function(){
		$('#PRD_REV_IDX').val('');		
		
		DELETED_IMG_LIST = [];
		var selID = $(this).attr('data-id');		
	
		if(selID) {
			openReviewPopup(true);
			getProdReviewInfo(selID);
			$('#PRD_REV_IDX').val(selID);
		} else if($(this).data('mem').length <= 0){
			alert('로그인이 필요한 서비스입니다.');
		} else if (!selPrdIdx || selPrdIdx.length <= 0) {
			alert('리뷰작성은 상품구매확정 이후 작성할 수 있습니다');
		} else {
			$('#PRD_REV_CONTENTS').val('');
			$('#review_images').empty();
			openReviewPopup(true);
		}
	});
	
	$('.review-popup-close').on('click', function(){
		openReviewPopup(false);
		///pc/mypage/insertMyProductComment
	});

	//// IMAGE PREVIEW PROCESS
	var TMPIDX = 0;
    var PREVIEW_HTML = '';
    PREVIEW_HTML += '<li>';
    PREVIEW_HTML += '<span class="file_img"><img id="{idx}" src="" alt="이미지"></span>';
    PREVIEW_HTML += '<div class="file_write"><textarea title="사진 설명 입력" placeholder="사진의 설명을 입력해주세요."></textarea></div>';
    PREVIEW_HTML += '<button type="button" data-idx="{idx}" class="btn_attach_delete">삭제</button>';
    PREVIEW_HTML += '</li>';
    

    var renderImagePreview = function($that) {
		var tmpIDX = 'TMP_' + (++TMPIDX);
		var cloneElem = $that.clone();
		cloneElem.attr('name', 'file');
		cloneElem.attr('data-idx', tmpIDX);
		
		var prevTempHTML = PREVIEW_HTML.replace(/{idx}/ig, tmpIDX);
				
		$('#review_images').append(prevTempHTML);
		$('#' + tmpIDX).parent().append(cloneElem);

		cloneElem.hide();
		
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#' + tmpIDX).attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(cloneElem.prop('files')[0]); // convert to base64 string
	    
	    $that.val("");
    }

	$('#attachment').on('change', function(){
		if(this.files.length > 0) {
			
			renderImagePreview($(this));
		}
	});
	
	$(document).on('click', '.btn_attach_delete', function(){
		var curIDX = $(this).attr('data-idx');
		$('#' + curIDX).closest('li').remove();
		
		if(curIDX.indexOf('REV_') >= 0) {
			DELETED_IMG_LIST.push(curIDX.replace('REV_', ''));
		}
		
	});
	
	var isAjax = false;
	$('.review-submit').on('click', function(){
		
		if(isAjax) return;
	
		var PRD_REV_STAR = $('.btn_satisfaction.on').length;
		if(PRD_REV_STAR <=0) {
			alert('상품평가를 채워주세요.');
			return false;
		}
		$('#PRD_REV_STAR').val(PRD_REV_STAR);
		
		if($('#PRD_REV_CONTENTS').val().length <= 0) {
			alert('내용을 추가해 주십시요');
			return;
		}
		
		var form = $('#reviewfrm')[0];
		var data = new FormData(form);
		
	   	//var formData = $("#reviewfrm").serialize();
		
	   	if(DELETED_IMG_LIST.length > 0 ) {
	   		$('#CMM_FLE_IDXs').val(JSON.stringify(DELETED_IMG_LIST));
	   	} else {
	   		$('#CMM_FLE_IDXs').val('');
	   	}
	   	
	   	var isCreate = true;
	   	if($('#PRD_REV_IDX').val().length > 0 ) isCreate = false;
		isAjax = true;
		
        $.ajax({
            url : isCreate ? "/pc/mypage/insertMyProductComment.do" : "/pc/mypage/updateProductComment.do",
            enctype: 'multipart/form-data',
            type : 'POST', 
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success : function(data) {
            	if(data.isSuccessYn == 'Y') {
            		alert('리뷰작성을  완료했습니다.');
            		openReviewPopup(false);
            		funcGetReviewList(1);
            	} else {
            		alert('리뷰작성에 실패했습니다.');
            	}
            	
            }, 
            error : function(xhr, status) {
               	alert('리뷰작성에 실패했습니다.');
            },
            complete : function() {
            	isAjax = false;
            }
        });
	});
	
});

</script>
		