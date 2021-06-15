<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="layer_photo_review" class="layer type03">
	<div class="layer_header">
		<h2>포토리뷰 모아보기</h2>
	</div>
	<div class="layer_content">
		<div class="photo_review_wp">
			<div class="gallery_slide">
				<div class="swiper-container review-gallery-top">
					<div id="pr-pop-images" class="swiper-wrapper">
					
					</div>
				
				</div>
				<div class="gallery_detail">
					<div class="paging">
						<a id="pr-pop-prev" href="javascript:void(0);" class="prev">이전 포토리뷰 보기</a>
						<span><strong id="pr-pop-index">0</strong>/<label id="pr-pop-count">0</label></span>
						<a id="pr-pop-next" href="javascript:void(0);" class="next">다음 포토리뷰 보기</a>
					</div>
					<div class="photo_review_detail">
						<div class="rw_title">
							<span class="tit" id="pr-pop-name"></span>
							<span class="code" id="pr-pop-code"></span>
						</div>
						<div id="pr-pop-score" class="satisfy_check fix clearboth">
							<button type="button" class="btn_satisfaction" disabled>
								<em class="blind">만족도</em>
							</button>
							<button type="button" class="btn_satisfaction" disabled>
								<em class="blind">만족도</em>
							</button>
							<button type="button" class="btn_satisfaction" disabled>
								<em class="blind">만족도</em>
							</button>
							<button type="button" class="btn_satisfaction" disabled>
								<em class="blind">만족도</em>
							</button>
							<button type="button" class="btn_satisfaction" disabled>
								<em class="blind">만족도</em>
							</button>
						</div>
						<div class="rw_info"><span></span><span id="pr-pop-date"></span></div>
						<div class="review_bx">
							<dl>
								<dt>사이즈</dt><dd id="pr-pop-size">정사이즈예요<span></span></dd>
								<dt>컬러</dt><dd id="pr-pop-color">화면과 같아요<span></span></dd>
							</dl>
						</div>
						<p class="txt" id="pr-pop-contents"></p>
					</div>
				</div>
				<div id="pr-pop-thumbs" class="swiper-container review-gallery-thumbs">
					<div class="swiper-wrapper">
					</div>
					<div class="review-swiper-button-next"></div>
					<div class="review-swiper-button-prev"></div>
				</div>
			</div>
		</div>
	</div>
	<a href="#none" class="btn_layer_close">레이어 닫기</a>
</div>
				

<script>
$( document ).ready(function() {
	
	var $SwiperThumbs = null, $SwiperTop = null;
	
	var initDrawSwiper = function(){
		if($SwiperThumbs != null) {
			$SwiperThumbs.destroy();
		}
		if($SwiperTop != null) {
			$SwiperTop.destroy();
		}
		$SwiperThumbs = new Swiper('.review-gallery-thumbs', {
			spaceBetween: 5,
			slidesPerView: 7,
			freeMode: true,
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
		});
		$SwiperTop = new Swiper('.review-gallery-top', {
			autoHeight: true,
			navigation: {
				nextEl: '.review-swiper-button-next',
				prevEl: '.review-swiper-button-prev',
			},
			thumbs: {
				swiper: $SwiperThumbs
			}
		});
	}
	

	
	var openPhotoReviewPopup = function(pIsOpen) {
		if(pIsOpen) {
			
			$('#layer_photo_review').css({
					   'top' : '50%',
					   'left' : '50%',
					   'margin' : '-320px 0 0 -455px',
					   'display' : 'block'
					});
			$('.bg_layer').show();
		} else {
			$('#layer_photo_review').hide();
			$('.bg_layer').hide();
		}
	}
	
	var getInitDataIndex = function(pIdx) {
		
		var initIndex = 0;
		for(var i = 0 ; i < REVIEW_LIMIT_ALL_DATA.length; i ++) {
			if(REVIEW_LIMIT_ALL_DATA[i].PRD_REV_IDX == pIdx) {
				initIndex = i;
				break;
			}
		}
		
		return initIndex;
	}
	var getReviewLimitAllData = function(pSelIdx){
		
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/product/productPhotoRevLimitListAjax.do",
    		dataType: "json",
    		data	: {PRD_MST_CD: $('#target_prd_code').val()},
    		success : function(data) {
    			REVIEW_LIMIT_ALL_DATA = data.list;
    			if(data.list.length > 0)
    				renderPhotoReviewUI(getInitDataIndex(pSelIdx));
    		}, error : function(err) {
    		}, complete : function(){
    		}
    	});
	};
	
	$('.photoreview-popup').on('click', function(){
		
		var selIdx = $(this).data('id');
		if(REVIEW_LIMIT_ALL_DATA.length <= 0) {
			getReviewLimitAllData(selIdx);
		} else {
			renderPhotoReviewUI(getInitDataIndex(selIdx));
		}

		openPhotoReviewPopup(true);
		
	});
	
	var REVIEW_BAS_IMG_PATH = '<c:out value="${cdnDomain}" />';
	var REVIEW_LIMIT_ALL_DATA = [];
	
	var REVIEW_IMG_HTML = '';
	REVIEW_IMG_HTML += '<div class="swiper-slide">';
	REVIEW_IMG_HTML += '<img src="{img}" alt="{alt}">';
	REVIEW_IMG_HTML += '<div class="rw_txt"><p>{txt}</p></div>';
	REVIEW_IMG_HTML += '</div>';

	var REVIEW_THUMB_HTML = '<div class="swiper-slide"><img src="{img}" alt="{alt}"></div>';
	
	var renderPhotoReviewUI = function(pIndex) {
		
		$('#pr-pop-index').text(pIndex + 1);
		$('#pr-pop-count').text(REVIEW_LIMIT_ALL_DATA.length);
		
		var curData = REVIEW_LIMIT_ALL_DATA[pIndex];
		var imgList = curData.IMAGES;
		
		var $imgElem = $('#pr-pop-images');
		var $thumbElem = $('#pr-pop-thumbs .swiper-wrapper');
		
		$imgElem.empty();
		$thumbElem.empty();
		
		if(imgList){
			for(var i = 0 ; i < imgList.length; i ++) {
				var curImgPath =  REVIEW_BAS_IMG_PATH + imgList[i].FILENM;
				var curImgAlt = imgList[i].CMM_FLE_ATT_EXT;
				
				$imgElem.append(REVIEW_IMG_HTML
								.replace('{img}', curImgPath)
								.replace('{alt}', curImgAlt)
								.replace('{txt}', ''));
				$thumbElem.append(REVIEW_THUMB_HTML
								.replace('{img}', curImgPath)
								.replace('{alt}', curImgAlt));
			}
		}


		$('#pr-pop-name').text(curData.PRD_MST_NM);
		$('#pr-pop-code').text('(' + curData.PRD_PRD_MST_CD + ')')
		
		if(imgList.length == 1) {
			$('#pr-pop-thumbs').hide();
		} else {
			$('#pr-pop-thumbs').show();
		}
		initDrawSwiper();
		
		
		var curScoreIdx = 1;
		$('#pr-pop-score .btn_satisfaction').each(function(){
			if( curScoreIdx <= curData.PRD_REV_STAR ) $(this).addClass('on');
			else $(this).removeClass('on');
			
			curScoreIdx++;
		});
		
		$('#pr-pop-date').text(curData.PRD_REV_REG_DT);
		
		if(curData.PRD_REV_CLR == 'A') {
			$('#pr-pop-color').text('화면과 같아요');
		} else if (curData.PRD_REV_CLR == 'B') {
			$('#pr-pop-color').text('화면과 달라요');
		} else $('#pr-pop-color').text('');
		
		if(curData.PRD_REV_SIZE == 'A') {
			$('#pr-pop-size').text('작아요');
		} else if (curData.PRD_REV_SIZE == 'B') {
			$('#pr-pop-size').text('정사이즈예요');
		} else if (curData.PRD_REV_SIZE == 'C') {
			$('#pr-pop-size').text('커요');
		} else $('#pr-pop-size').text('');
		
		$('#pr-pop-contents').text(curData.PRD_REV_CONTENTS);
		
	}
	
	var movePageProcess = function(pIsNext) {
		var curIndex = $('#pr-pop-index').text() * 1;
		var curCount = $('#pr-pop-count').text() * 1;
		
		if(curCount == 0) return;
		
		if(pIsNext) {
			curIndex++;
			if(curIndex > curCount) curIndex = 1;
		} else {
			curIndex--;
			if(curIndex <= 0) curIndex = curCount;
		}
		
		renderPhotoReviewUI(curIndex - 1);
	}
	
	$('#pr-pop-prev').on('click', function(){
		movePageProcess(false);
	});
	$('#pr-pop-next').on('click', function(){
		movePageProcess(true);
	});

});

</script>
		