<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

 <div id="container">
		<div id="content" class="content">

			<!-- LOCATION -->
			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
			<!-- //LOCATION -->
			
			<form id="frm" name="frm">
				<input type="hidden" name="CNT_MST_IDX" value="${row.CNT_MST_IDX}">
			</form>

			<div class="ootd_detail">
				<div class="item_detail">
					<div class="title">
						<h2>${row.CNT_MST_TITLE }</h2>
						<p class="date"><ui:formatDate value="${row.CNT_MST_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></p>
					</div>
					<div class="cont">
						<div class="writer">
							<span class="img"><img src="${cdnDomain }${row.MEM_MST_PRF_IMG}" alt="이미지"></span> 
							<p class="name">${row.CNT_MST_REG_ID }</p>
						</div>
						<div class="detail">${row.CNT_MST_DESC }</div>
						<div class="tag_info">
							<c:forEach items="${tagList}" var="tag" varStatus="i">
								<a href="javascript(0);">${tag.TAG_MST_TITLE}</a>
							</c:forEach>
						</div>
						<div class="btn_box">
							<c:if test="${row.MY_OOTD_YN eq 'Y'}">
							<button id="ootd_del_submit" type="button" class="btn_delete" data-id="${row.CNT_MST_IDX }">삭제</button>
							<button id="ootd_mod_submit" type="button" class="btn_modify" data-id="${row.CNT_MST_IDX }">수정</button>
							</c:if>
						</div>
						<div class="count_list">
							<ul>
								<li><button id="like_function" type="button" class="like ${row.LIKE_CLS }" data-id="${row.CNT_MST_IDX }">${row.LIKE_COUNTS }</button></li>
								<li><span class="reply">0</span></li>
							</ul>
							<button type="button" class="sns_share"><em class="blind">공유</em></button>
						</div>
					</div>
					<div class="thumb-list">
						<h3>회원이 구매한 상품</h3>
						<ul>
							<c:forEach items="${ootdProductList}" var="prd">
								<li>
								<div class="thumb-img">
									<a href="/pc/product/productView.do?PRD_MST_CD=${prd.CNT_PRD_MST_CD }" target="_blank">
										<img src="${cdnDomain}${prd.PRD_IMAGE }" alt="${prd.PRD_IMAGE_ALT }">
									</a>
								</div>
								<div class="thumb-txt">
									<div class="sort">
										<a href="#" class="underline">${prd.BND_MST_BRAND_NM }</a>
										<a href="#" class="tag">${prd.TAG_MST_TITLE }</a>
									</div>
									<div class="tit">
										<a href="/pc/product/productView.do?PRD_MST_CD=${prd.CNT_PRD_MST_CD }" target="_blank">
											${prd.PRD_MST_NM }
										</a>
									</div>
									<div class="price">
										<p class="del"><fmt:formatNumber value="${prd.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></p>
										<em><fmt:formatNumber value="${prd.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" /></em>
										<strong class="sale"><fmt:formatNumber value="${prd.PRD_DST_PERCENT }" type="percent" groupingUsed="false" /></strong>
									</div>
								</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="item_detail">
					<div class="gallery_slide">
						<div class="swiper-container gallery-top">
							<div class="swiper-wrapper">
								<c:if test="${not empty fileList}">
									<c:forEach var="imgrow" items="${fileList }" varStatus="status">
										<div class="swiper-slide">
											<button date-type="layer" date-id="layer_img_detail" title="레이어 팝업 열림">
											<%-- <img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"> --%>
												<img src="/nas/cdn/PW/images/@temp/img_ootd_detail.jpg" alt="">
											</button>
										</div>
										<div class="swiper-slide">
											<button date-type="layer" date-id="layer_img_detail" title="레이어 팝업 열림">
											<%-- <img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"> --%>
												<img src="/nas/cdn/PW/images/@temp/img_ootd_detail.jpg" alt="">
											</button>
										</div>
										<div class="swiper-slide">
											<button date-type="layer" date-id="layer_img_detail" title="레이어 팝업 열림">
											<%-- <img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"> --%>
												<img src="/nas/cdn/PW/images/@temp/img_ootd_detail.jpg" alt="">
											</button>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<div class="swiper-container gallery-thumbs">
							<div class="swiper-wrapper">
								<c:if test="${not empty fileList}">
									<c:forEach var="imgrow" items="${fileList }" varStatus="status">
										<div class="swiper-slide">
											<%-- <img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"> --%>
											<img src="/nas/cdn/PW/images/@temp/img_ootd_detail.jpg" alt="">
										</div>
										<div class="swiper-slide">
											<%-- <img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"> --%>
											<img src="/nas/cdn/PW/images/@temp/img_ootd_detail.jpg" alt="">
										</div>
										<div class="swiper-slide">
											<%-- <img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"> --%>
											<img src="/nas/cdn/PW/images/@temp/img_ootd_detail.jpg" alt="">
										</div>
									</c:forEach>
								</c:if>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
				<!-- layer -->
				<div id="layer_img_detail" class="layer pro_detail">
					<div class="layer_content">
						<div class="gallery_wp">
							<div class="slider slider-for">
								<c:if test="${not empty fileList}">
									<c:forEach var="imgrow" items="${fileList }" varStatus="status">
										<div><img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"></div>
									</c:forEach>
								</c:if>
							</div>
							<div class="slider slider-nav">
								<c:if test="${not empty fileList}">
									<c:forEach var="imgrow" items="${fileList }" varStatus="status">
										<a href="javascript:;"><img src="${cdnDomain}${imgrow.CMM_FLE_ATT_PATH}${imgrow.CMM_FLE_SYS_NM}" alt="${imgrow.CMN_FLE_ALT_TXT}"></a>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
					<a href="#none" class="btn_layer_close type02">레이어 닫기</a>
				</div>
				<!-- //layer -->
				<div class="item_detail">
					<h3>댓글 (<span id="comment_tot_count">0</span>)</h3>
					<div class="reply">
						<!-- 
						<div class="writer">
							<span class="img"><img src="/nas/cdn/PWimages/@temp/img_temp_por.jpg" alt=""></span>
							<p class="name">BLOOMS LONDON</p>
						</div>
						 -->
						<div class="write">
							<textarea id="comment_input" cols="30" rows="10" placeholder="댓글 입력"></textarea>
							<button id="comment_submit" type="button" class="purple">등록</button>
						</div>
					</div>
					<div id="reply_list_wrapper" class="reply_list_wp mCustomScrollbar">
						<div class="reply_list">
							<ul id="comment_list">
							</ul>
						</div>
					</div>
				</div>
			</div>




		</div>
	</div>
		<!-- ******************* PHOTO REVIEW POPUP *************************-->
		<%-- <%@ include file="/WEB-INF/jsp/pc/ootd/ootdViewPopup.jsp"%> --%>
		
	
	<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>


<script id="ootdQItemTemplate" type="text/x-jquery-tmpl">
<li>
	<div class="writer">
		<span class="img"><img src="${cdnDomain }\\${MEM_MST_PRF_IMG}" alt="이미지"></span>
		<p class="name">\${MEM_MST_NCK_NM}</p>
	</div>
	<div class="txt">
		\${OTD_RPL_CTS}
	</div>
	<p class="date">\${OTD_RPL_REG_DT}</span></p>
	<div id="button_\${OTD_RPL_ID}" class="btn_box">
	</div>
	<ul id="comment_\${OTD_RPL_ID}">
	</ul>
</li>
</script>

<script id="ootdAItemTemplate" type="text/x-jquery-tmpl">
<li>
	<div class="writer">
		<span class="img"><img src="${cdnDomain }\\${MEM_MST_PRF_IMG}" alt="이미지"></span>
		<p class="name">\${MEM_MST_NCK_NM}</p>
	</div>
	<div class="txt">
		\${OTD_RPL_CTS}
	</div>
	<p class="date">\${OTD_RPL_REG_DT}</span></p>
	<div id="button_\${OTD_RPL_ID}" class="btn_box">
	</div>
</li>
</script>

<script id="ootdItemRmvDelTemplate" type="text/x-jquery-tmpl">
<button type="button" class="btn_delete" data-id="\${OTD_RPL_ID}">삭제</button>
<button type="button" class="btn_modify" data-id="\${OTD_RPL_ID}">수정</button>
</script>
<script id="ootdItemReplyTemplate" type="text/x-jquery-tmpl">
<button type="button" class="btn_reply" data-id="\${OTD_RPL_ID}" data-name="\${MEM_MST_NCK_NM}">답글</button>
</script>            
		
			
<script>

$(function(){
	

	
	/////////////////////// COMMENT PROCESS ////////////////////////////
	var startOffset = 1;
	var queryCount = 10;
	var isLastData = false;
	
	var resetCommentList = function(){
		startOffset = 1;
		queryCount = 10;
		isLastData = false;
		$("#comment_list").empty();

		reqCommentList();
	}
	
	var renderCommentList = function(pData){
		
		if(pData != null){
			startOffset += pData.length;
			
			var curQDataList = [];
			var curADataList = [];
			for(var i = 0 ; i < pData.length ; i ++) {
				if(pData[i].OTD_RPL_REF_ID <= 0 || pData[i].OTD_RPL_REF_ID == null) {
					curQDataList.push(pData[i]);
				} else {
					curADataList.push(pData[i]);
				}
			}
			//MEM_MST_ID
			$("#ootdQItemTemplate").tmpl( curQDataList ).appendTo("#comment_list");
			
			for(var i = 0; i < curADataList.length; i++) {
				$("#ootdQItemTemplate").tmpl( curADataList[i] ).appendTo('#comment_' + curADataList[i].OTD_RPL_REF_ID);
				
				if(curADataList[i].MY_CMT_YN == 'Y') {
					$("#ootdItemRmvDelTemplate").tmpl( curADataList[i] ).appendTo('#button_' + curADataList[i].OTD_RPL_ID);
				}
			}
			for(var i =0; i < curQDataList.length; i++) {
				if(curQDataList[i].MY_CMT_YN == 'Y') {
					$("#ootdItemRmvDelTemplate").tmpl( curQDataList[i] ).appendTo('#button_' + curQDataList[i].OTD_RPL_ID);
				} else {
					$("#ootdItemReplyTemplate").tmpl( curQDataList[i] ).appendTo('#button_' + curQDataList[i].OTD_RPL_ID);
				}
			}
		}
		
	}
	var isReqCommentAjax = false;
	var reqCommentList = function(){
		console.log(isCommentAjax + ", " + isLastData);
		if(isReqCommentAjax== false && isLastData == false) {
			isReqCommentAjax = true;
			ShowLoading(true);
			$.ajax({
				type : "POST",
				async:true,
				url : '<c:out value="${serverDomain}"/>/pc/ootd/ootdCommentListAjax.do',
				data : {
							CNT_MST_IDX : '<c:out value="${row.CNT_MST_IDX}" />',
							STARTNUM : startOffset,
							ENDNUM : startOffset + queryCount
					   },  
				success : function(data){
					
					renderCommentList(data.list);
					$('#comment_tot_count').text(data.count);
				}, complete : function() {
					ShowLoading(false);
					isReqCommentAjax = false;
				}
			}); 
		}
	}
	
	reqCommentList();

	//$(".mCustomScrollbar").mCustomScrollbar("destroy");
	/*
	$(".mCustomScrollbar2").mCustomScrollbar({
		callbacks: {
			onScroll: function(){
				console.log('onscroll');
			},
			onTotalScroll: function(){
				console.log('onTotalScroll');
			},
			onTotalScrollBack : function(){
				console.log('onTotalScrollBack');
			}
		}
	});
	*/
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		
		if(maxHeight <= currentScroll){
			reqCommentList();
		}
	});
	
	
	
	var isCommentAjax = false;
	var SELECTED_REPLY_INFO = {};
	
	var initCommentVar = function() {
		$('#comment_input').val('');
		SELECTED_REPLY_INFO = {};
		resetCommentList();
		
	}
	$('#comment_submit').on('click', function(){
		
		if(!GetIsLogin()) {
			alert('로그인을 하셔야 합니다.');
			return;
		}
		if(isCommentAjax) return;
		
		var curComment = $('#comment_input').val();
		if(curComment.length <= 0) {
			alert('댓글을 입력해 주세요.');
			return;
		}
		
		isCommentAjax = true;
			
		var ajaxParam = {}
		var ajaxUrl = '';
		if(SELECTED_REPLY_INFO.MOD_YN == 'Y') {
			ajaxUrl = '<c:out value="${serverDomain}"/>/pc/ootd/ootdCommentModAjax.do',
			ajaxParam = {}
			
			ajaxParam = {
					OTD_RPL_ID : SELECTED_REPLY_INFO.OTD_RPL_ID,
					OTD_RPL_CTS : curComment
			   };
			
		} else {
			ajaxUrl = '<c:out value="${serverDomain}"/>/pc/ootd/ootdCommentRegAjax.do',
			
			OTD_RPL_REF_ID = 0;
			
			if(SELECTED_REPLY_INFO.NAME && 
					curComment.indexOf('@' + SELECTED_REPLY_INFO.NAME) == 0) {
				OTD_RPL_REF_ID = SELECTED_REPLY_INFO.OTD_RPL_REF_ID;
				curComment = $.trim(curComment.substr(('@' + SELECTED_REPLY_INFO.NAME).length));
			}
			
			ajaxParam = {
					CNT_MST_IDX : '<c:out value="${row.CNT_MST_IDX}" />',
					OTD_RPL_CTS : curComment,
					OTD_RPL_REF_ID : OTD_RPL_REF_ID
			   };
		}
		
		$.ajax({
			type : "POST",
			async:true,
			url : ajaxUrl,
			data : ajaxParam,
			success : function(data){
				initCommentVar();
			}, complete : function() {
				isCommentAjax = false;
			}
		});
	});
	
	$(document).on('click', '#comment_list .btn_reply', function(){
		var curId = $(this).data('id');
		var curName = $(this).data('name');
		
		SELECTED_REPLY_INFO = {
			OTD_RPL_REF_ID : curId,
			NAME : curName
		}
		$('#comment_input').val('@' + curName + ' ');
		$('#comment_input').focus();
	});
		
	$(document).on('click', '#comment_list .btn_modify', function(){
		var curId = $(this).data('id');		
		var curCont = $('div.txt', $(this).closest('li')).first().text();
		SELECTED_REPLY_INFO = {
			MOD_YN : 'Y',
			OTD_RPL_ID : curId
		}
		$('#comment_input').val($.trim(curCont));
		$('#comment_input').focus();
	});
	

	$(document).on('click', '#comment_list .btn_delete', function(){
		var curId =  $(this).data('id');
		
		if(confirm('삭제하시겠습니까?')) {
			$.ajax({
				type : "POST",
				async:false,
				url : '<c:out value="${serverDomain}"/>/pc/ootd/ootdCommentDelAjax.do',
				data : { OTD_RPL_ID : curId },
				success : function(data){
					initCommentVar();
				}, complete : function() {
				}
			});
		}
	});
	
	$('#ootd_mod_submit').on('click',function(){
		
		var $frm = $("#frm");
		$frm.attr({"action": "<c:out value="${serverDomain}" />/pc/ootd/ootdEdit.do", "target":"_self", "method":"post"}).submit();
	});
	
	$('#ootd_del_submit').on('click', function(){
		if(confirm('삭제하시겠습니까?')) {
			var $frm = $("#frm");
			$frm.attr({"action": "<c:out value="${serverDomain}" />/pc/ootd/ootdDelete.do", "target":"_self", "method":"post"}).submit();			
		}
	});
	
	$('#like_function').on('click', function(){
		var $thisElm = $(this);
		
		likeBtnEvent($thisElm, $thisElm.attr('data-id'),'TYPE_OOTD');
		
		return false;
	});

});
</script>
<script>
	$(function(){
		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween: 2,
			slidesPerView: 5,
			freeMode: true,
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
		});
		var galleryTop = new Swiper('.gallery-top', {
			autoHeight: true,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
			thumbs: {
				swiper: galleryThumbs
			}
		});

		$('.slider-for').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: false,
			fade: true,
			asNavFor: '.slider-nav'
		});
		$('.slider-nav').slick({
			slidesToShow: 6,
			slidesToScroll: 1,
			asNavFor: '.slider-for',
			dots: false,
		  	focusOnSelect: true
		});

		// var galleryThumbs_layer = new Swiper('.gallery_thumbs_layer', {
		//     spaceBetween: 2,
		//     slidesPerView: 6,
		//     freeMode: true,
		//     watchSlidesVisibility: true,
		//     watchSlidesProgress: true,
		// });
		// var galleryTop_layer = new Swiper('.gallery_top_layer', {
		//     spaceBetween: 0,
		//     navigation: {
		//         nextEl: '.btn_gallery_next',
		//         prevEl: '.btn_gallery_prev',
		//     },
		//     thumbs: {
		//         swiper: galleryThumbs_layer
		//     }
		// });
	});
</script>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>