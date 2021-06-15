<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
		<!-- Content -->
		
		<div class="sub_content" id="mainPop"><!-- 메인 (레이어)팝업 2020-06-10 -->
			<c:choose>
				<c:when test="${not empty listPopup }" >
					<c:forEach var="item" items="${listPopup }" varStatus="status">
						<c:if test="${item.POP_MST_TYP eq 'L' }">
							<div id="layer_benefit_${item.POP_MST_IDX }" class="layer notice_popup is_btn">
								<div class="layer_content">
								    <a href="javascript:popupLink('<c:out value="${item.POP_MST_LNK }"/>', '<c:out value="${item.POP_MST_MDE }"/>')">
								        ${item.POP_MST_CNT }
								    </a>
								</div>
								<div class="layer_bottom">
								<c:if test="${item.POP_MST_DAY_YN eq 'Y' }" >
								    <input type="checkbox" id="serach_chk_${item.POP_MST_IDX }" name="serach_chk_${item.POP_MST_IDX }">
								    <label for="serach_chk_${item.POP_MST_IDX }"><span class="icon"></span>오늘 하루 그만 보기</label>
								</c:if>
								<a href="javascript:void();" data-type="l" data-id="${item.POP_MST_IDX}" class="btn_layer_close">닫기</a>
								</div>
							</div>
	           			</c:if>
	           		</c:forEach>
	           	</c:when>
           	</c:choose>
		</div><!--// 메인 팝업 2020-06-10 -->
		
		<div id="content" class="content">
			<div class="ootd_main">
				<div class="visual">
					<form id="frm" action="#" method="post">
						
						<fieldset>
							<legend>내 스타일 찾기 폼</legend>
							<div class="sorting">
								<p class="txt">평범한 일상에 작은 변화와 기쁨을 Delight 하세요.</p>
								<div class="form">
									<ul>
										<li>
											<p class="label">Gender</p>
											<div class="fbx">
												<div class="gender_wrap clearboth">
													<input type="checkbox" name="gender_woman" value="F" id="gender_woman" > <label for="gender_woman">여성</label> 
													<input type="checkbox" name="gender_man" value="M" id="gender_man"> <label for="gender_man">남성</label>
												</div>
											</div>
										</li>
										<li>
											<p class="label">Height</p>
											<div class="fbx">
												<div class="wt">
													<input type="number" name="height" value="163" class="cm" maxlength="3" oninput="maxLengthCheck(this)"><span class="unit">cm</span>
												</div>
											</div>
										</li>
										<li>
											<p class="label">Weight</p>
											<div class="fbx">
												<div class="wt">
													<input type="number" name="weight" value="48" class="kg" maxlength="3" oninput="maxLengthCheck(this)"><span class="unit">kg</span>
												</div>
											</div>
										</li>
										<li>
											<p class="label">Style</p>
											<div class="fbx">
												<input type="hidden" id="cat01" name="cat01"/>
												<a id="searchPrdCtgDepth1_a" href="#n" class="lk" data-id="">전체</a>
												<ul id="searchPrdCtgDepth1" class="option_list">
												</ul>
											</div>
										</li>
										<li>
											<p class="label"></p>
											<div class="fbx">
												<input type="hidden" id="cat02" name="cat02"/>
												<a id="searchPrdCtgDepth2_a" href="#n" class="lk" data-id="">전체</a>
												<ul id="searchPrdCtgDepth2" class="option_list">
												</ul>
											</div>
										</li>
										<li>
											<p class="label">Color</p>
											<div class="fbx"> 
												<input type="hidden" id="color" name="color"/>
												<a id="color_a" href="#n" class="lk color total" data-id="">전체</a>
												<ul class="option_list">
													<li><button type="button" class="total" data-value="">전체</button></li>
		                                   			<c:forEach var="colorItemRow" items="${colorList}" varStatus="i">
		                                   				<li><button type="button" data-value="${colorItemRow.CMN_COM_IDX }" style="background: ${colorItemRow.CMN_COM_ETC2 };">${colorItemRow.CMN_COM_NM }</button></li>
				                                     </c:forEach> 
												</ul>
											</div>
										</li>
									</ul>
								</div>
								<div class="w_keyword">
									<input type="text" name="search_txt" placeholder="키워드 입력">
								</div>
								<div class="f_btn">
									<button  id="search_submit" class="btn_large ok">내 스타일 찾기</button>
								</div>
							</div>
						</fieldset>
						 
					</form>
					<img src="/nas/cdn/PW/images/main/img_visual.jpg" class="img_visual" alt=""> <a href="#n" class="b_edit" title="등록 페이지 이동">OOTD 등록</a>
				</div>
				<!-- //visual-->
				<div class="m_cont">
					<p class="m_tit">
						<strong>FEEDS OF THE DAY</strong>
					</p>
					<p class="m_txt">하루의 시작을 오피드와 함께 브랜드 상품, 기획전, 오오티디, 상품하울 등의 다양한 컨텐츠를 확인하세요.</p>
					<div class="setting">
						<div class="b_set">
							<p id="selected_tag_rep" class="key">
								
							</p>
							<a href="#n" class="b_feed" title="상세 열림"><span>태그관리</span></a>
						</div>
						<div class="set_cont">
							<div class="set_bx">
								<ul id="selected_tag_result" class="result">
									
								</ul>
								<ul class="sel_bx mCustomScrollbar">
		                      		<c:forEach var="tags" items="${feedTagList }" varStatus="status">
		                       			<li><input type="checkbox" name="feeds" id="feed-${tags.TAG_MST_ID }" data-id="${tags.TAG_MST_ID }" data-txt="${tags.TAG_MST_TITLE }">
		                       				<label for="feed-${tags.TAG_MST_ID }"><span class="icon"></span>${tags.TAG_MST_TITLE }</label> 
		                       			</li>
					                </c:forEach>
								</ul>
							</div>
							<div class="btn_wrap">
								<button id="tag_reset" class="btn_large">초기화</button>
								<button id="tag_submit" class="btn_large ok">적용</button>
							</div>
						</div>
					</div>
					<!-- //setting-->
					<div class="list">
					    <div id="contents_list_wrapper" class="grid">
                            <div class="grid_sizer"></div>
                        </div>
					</div>
					<!-- //list-->
				</div>
			</div>
			<!-- ootd_main -->
			<script>
		                //max 글자수 체크
		                function maxLengthCheck(object){
		                    if (object.value.length > object.maxLength){
		                        object.value = object.value.slice(0, object.maxLength);
		                    }
		                }
		                // 피드관리
		                $('.setting .b_feed').on('click', function(){
		                        if($(this).hasClass("atv")){
		                                $(this).parents('.b_set').next(".set_cont").stop().slideUp();
		                                $(this).removeClass("atv");
		                        }else {
		                                $(this).parents('.b_set').next(".set_cont").stop().slideDown();
		                                $(this).addClass("atv");
		                        }
		                });
		                // 성별선택
		                $('.sorting .gender').on('click', function(){
		                        $(this).toggleClass('on');
		                });
		
		            </script>
			<!--script src="/nas/cdn/PW/js/masonry.pkgd.js"></script>
			<script>
		                $(window).on('load', function(){
		                    $('.grid').masonry({
		                        itemSelector: '.grid_item',
		                        columnWidth: '.grid_sizer',
		                        percentPosition: true,
		                        transitionDuration: '0.3s'
		                    });
		                })
		            </script-->
		</div>
		<!--/ Content -->
	</div>
	
	<form name="popupForm" id="popupForm">
	     <input type="hidden" name="POP_MST_IDX" id="POP_MST_IDX" />
	</form>
	<form name="timeSalePopupForm" id="timeSalePopupForm">
	</form>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.cookie.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>  
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<!-- 기획전 템플릿 -->
<script type="text/template" id="c_plan_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx"><img src="${cdnDomain }\${CMM_FLE_SAVE_PATH }" alt="\${CMN_FLE_ALT_TXT }"></div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE }</span></div>
        <p class="title">\${PLN_MST_TITLE }</p>
        <p class="date">\${TARGET_DATE }</p>
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${PLN_MST_IDX}', 'TYPE_PLAN')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<!-- 타임특가 템플릿 -->
<script type="text/template" id="c_time_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="#">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="time_\${TIM_SAL_IDX}" class="color_list">
            </ul> 
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 
        <div class="per_bar_wrap remain_timer" data-starttime="\${TIM_SAL_ST}" data-finishtime="\${TIM_SAL_ED}">
            <p class="time">--:--:-- 남음</p><span class="percent_label">0%</span>
            <div class="per_bar">
                <span style="width:0%;" class="percent_label">0%</span>
            </div>
        </div>
    </a>
</div>
</script>

<!-- 신상품 템플릿 -->
<script type="text/template" id="c_new_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="new_\${DSP_MST_IDX}" class="color_list">
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
  
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 

    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${DSP_MST_IDX}', 'TYPE_NEW_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<!-- 고정배너 템플릿 -->
<script type="text/template" id="c_banner_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx"><img src="${cdnDomain }\${CMM_FLE_SAVE_PATH}" alt="\${CMN_FLE_ALT_TXT}"></div>
    </a>
</div>
</script>
                
<!-- 이벤트 템플릿 -->
<script type="text/template" id="c_event_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx"><img src="${cdnDomain }\${CMM_FLE_SAVE_PATH}" alt="\${CMN_FLE_ALT_TXT}"></div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${EVT_MST_TITLE}</p>
    </a>
</div>
</script>

<!-- 셀러픽 템플릿 -->
<script type="text/template" id="c_pick_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx size1"><img src="${cdnDomain }\${IMAGE_02}" alt="IMAGE"></div>
        <div class="saler">
            <span class="pic"><img src="${cdnDomain }\${IMAGE_01}" alt="IMAGE"></span>
            <span class="name">\${VDR_MST_NM}</span>
        </div>
        <p class="title">\${CNT_MST_TITLE}</p>
        <p class="msg">\${CNT_MST_DESC}</p>
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${CNT_MST_IDX}', 'TYPE_SELLER_PICK')">\${LIKE_COUNTS }</a>
        <a href="#n" class="home">셀러룸 이동</a>
        <a href="#n" class="share">공유하기</a>
    </div>
</div>
</script>

<!-- OOTD 템플릿 -->
<script type="text/template" id="c_ootd_template"> 
<div class="grid_item">
    <a href="/pc/ootd/ootdView.do?CNT_MST_IDX=\${CNT_MST_IDX}" target="_blank">
        <div class="visual_bx size1"><img src="${cdnDomain }\${IMAGE_01}" alt="IMAGE"></div>
        <div class="saler">
            <span class="pic"><img src="${cdnDomain }\${MEM_MST_PRF_IMG}" alt="IMAGE"></span>
            <span class="name">\${VDR_MST_NM}</span>
        </div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${CNT_MST_TITLE}</p>
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${CNT_MST_IDX}', 'TYPE_OOTD')">\${LIKE_COUNTS }</a>
        <a href="#n" class="cmt">\${COMMENT_CNT}</a>
        <a href="#n" class="share">공유하기</a>
    </div>
    <ul id="ootd_\${CNT_MST_IDX}" class="pro_list">
    </ul>
</div>
</script>

<!-- 하울영상 템플릿 -->
<script type="text/template" id="c_haul_template"> 
<div class="grid_item">
    <a href="#n">
        <div class="visual_bx video"><img src="\${PRD_MST_URL}" alt=""></div>
        <div class="tg_bx"><span class="flag">\${BND_MST_BRAND_NM}</span><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${PRD_MST_NM}</p>
    </a>
    <div class="etc">
        <a href="#n" class="like \${LIKE_CLS}"
			onclick="likeBtnEvent($(this), '\${DSP_MST_IDX}', 'TYPE_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<!-- 베스트리뷰 템플릿 -->
<script type="text/template" id="c_best_template"> 
<div class="grid_item">
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank">
        <div class="visual_bx size2"><img src="${cdnDomain }\${REV_IMAGE}" alt="\${PRD_IMAGE_ALT}"></div>
        <div class="tg_bx"><span>\${TAG_MST_TITLE}</span></div>
        <p class="title">\${PRD_REV_TITLE}</p>
    </a>
    <ul class="pro_list">
        <li>
            <a href="#">
                <div class="pro"><img src="${cdnDomain }\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></div>
                <div class="if">
                    <p class="tit">\${PRD_MST_NM}</p>
                    <p class="pri_bx"><span class="pri cur-number-format">\${PRD_NOW_DST_PRICE}</span><span class="per">\${PRD_DST_PERCENT}%</span></p>
                </div>
            </a>
        </li>
    </ul>
</div>
</script>


<!-- 펀딩 템플릿 -->
<script type="text/template" id="c_fund_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="#">
        <div class="img_thum_wrap">
            <div class="img_thum_inner" style="background-image:url(../../images/@temp/newitem04.jpg);"></div>
            <div class="img_thum_inner" style="background-image:url(../../images/@temp/newitem04_over.jpg);"></div>
            <ul class="color_list">
                <li><span style="background:#273b38;">color 01</span></li>
                <li><span style="background:#c7673e;">color 02</span></li>
                <li><span style="background:#6686ad;">color 03</span></li>
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">SIEG</span>
            <span class="tag">#펀딩</span>
        </div>
        <p class="goods_title">스퀘어 스카프 토드백</p>
        <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost">￦88,000</span>
            <strong class="clearboth">
                <span class="goods_cost">￦44,000</span>
                <em class="dc_percent">50%</em>
            </strong>
        </div>
        <div class="per_bar_wrap">
            <p class="time">14:21:21 남음 <span>60%</span></p>
            <div class="per_bar">
                <span style="width:60%;">60%</span>
            </div>
        </div>
    </a>
    <div class="etc">
        <a href="#n" class="share">공유하기</a>
    </div>
</div>
</script>

<!-- 탑셀러상품 템플릿 -->
<script type="text/template" id="c_top_template"> 
<div class="grid_item">
    <span class="flag_video">video</span>
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="top_\${DSP_MST_IDX}" class="color_list">
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 
    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${DSP_MST_IDX}', 'TYPE_NEW_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</div>
</script>

<jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>
<input type='hidden' id="listPopupData" value='${JsonUtil.getJsonArrayFromList(listPopup)}'>
<script>

	
$(function(){
		
	/////////////////  TAG PROCESS START ////////////////
	var $tagResultElem = $('#selected_tag_result');
	var $repTagResultElem = $('#selected_tag_rep');
	
	var itemHTML = '<li data-id="{id}"><a href="#n" class="key">{name}</a><a href="#n" class="del">삭제</a></li>';
	var repItemHTML = '<span>{name}</span>'
	/*
	var renderLayerPopup = function(layerPopupList){
		
		if( layerPopupList == null || layerPopupList == ''){return;}
		for(var index = 0; index < layerPopupList.length; index++){
			if(layerPopupList[index].POP_MST_DAY_YN == 'Y')
			{
				stopToday = "오늘 하루 그만보기";
			}
			if(layerPopupList[index].POP_MST_TYP == 'L'){
				$('#c_layer_popup_template').tmpl(layerPopupList[index]).appendTo('#mainPop');

				$('.layer_content a', '#layer_benefit_'+layerPopupList[index].POP_MST_IDX).html(layerPopupList[index].POP_MST_CNT);					
			}
		}
	}
	var layerPopupList = JSON.parse($("#listPopupData").val());
	renderLayerPopup(layerPopupList) ;
	*/
	
	var renderCheckTagUI = function() {
		$tagResultElem.empty();
		$repTagResultElem.empty();
		
		var totCount = 0;
		$('input:checkbox[name=feeds]').each(function(){
			if(this.checked) {
				var $curElem = $(this);
				var curHTML = itemHTML.replace('{name}', $curElem.data('txt')).replace('{id}', $curElem.data('id'))
				$tagResultElem.append(curHTML);
				
				totCount++;
				if(totCount <= 3) {
					var repHTML = repItemHTML.replace('{name}', $curElem.data('txt'));
					$repTagResultElem.append(repHTML);
				}
			}
		});
	}
	//최초 모든 TAG 활성화
	$('input:checkbox[name=feeds]').each(function(){
		$(this).prop('checked', true);
	});
	renderCheckTagUI();
	
	$(document).on('click', '#selected_tag_result .del', function(){
		var $targetElem = $(this).closest('li');
		var dataId = $targetElem.attr('data-id');
		
		$('#feed-' + dataId).prop('checked', false);
		renderCheckTagUI();
	});
	
	$('#tag_reset').on('click', function(){
		$('input:checkbox[name=feeds]').each(function(){
			$(this).prop('checked', false);
		});
		renderCheckTagUI();
	});

	$('input:checkbox[name=feeds]').on('change', function(){
		renderCheckTagUI();
	});
	
	$('#tag_submit').on('click', function(){
		funcGetContentsList(true);
	});
	/////////////////  TAG PROCESS FINISH ////////////////
	
	
	$(document).on('click', '.b_edit', function(){
		location.href = "/pc/ootd/ootdForm.do";
	});
	
	
	///////////// CONTENTS LIST PROCESS START //////////////
    var renderRemainTimer = function() {
    	$('.remain_timer').each(function(){
    		
    		//new Date("Jan 5, 2021 15:37:25").getTime();
    		var $targetElem = $(this);
    		if($targetElem.attr('data-execute') != 'Y') {
    			
          		$(targetElem).attr('data-execute', 'Y');
        		
        		var startTime = $targetElem.attr('data-starttime');
        		var finishTime = $targetElem.attr('data-finishtime');
        		    		
        		//console.log(startTime + ", " + finishTime);
        		//yyyymmddhhmmss
        		var curFinishDateTime = new Date(finishTime.slice(0, 4), finishTime.slice(4, 6) - 1, finishTime.slice(6, 8),
        				//finishTime.slice(8, 10), finishTime.slice(10, 12), finishTime.slice(12, 14)).getTime();
        				finishTime.slice(8, 10), finishTime.slice(10, 12), '00').getTime();
        		
        		var curStartDateTime = new Date(startTime.slice(0, 4), startTime.slice(4, 6) - 1, startTime.slice(6, 8),
        				//startTime.slice(8, 10), startTime.slice(10, 12), startTime.slice(12, 14)).getTime();
        				startTime.slice(8, 10), startTime.slice(10, 12), '00').getTime();
        		
        		var curDistance = curFinishDateTime - curStartDateTime;
        		
        		var $targetTimeTxt = $('.time', $targetElem);
        		var $targetProgress = $('.per_bar span', $targetElem);
        		var $targetPercent = $('.percent_label', $targetElem);
        		
        	    var x = setInterval(function() {

               	  	// Get today's date and time
               	  	var now = new Date().getTime();

               	  	// Find the distance between now and the count down date
               	  	var distance = curFinishDateTime - now;

               	  	// Time calculations for days, hours, minutes and seconds
               	  	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
               	  	var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
               	 	if(hours < 10) hours = '0' + hours;
               	  	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
               	 	if(minutes < 10) minutes = '0' + minutes;
               	  	var seconds = Math.floor((distance % (1000 * 60)) / 1000);
               	  	if(seconds < 10) seconds = '0' + seconds;

               	  	// If the count down is finished, write some text
               	  	if (distance < 0) {
               	  		clearInterval(x);
               	 		$targetTimeTxt.text('00:00:00');
               	 		$targetProgress.css('width', '0%');
               	 	$targetPercent.text('0%');
    				} else {
    					$targetTimeTxt.text(hours + ':' + minutes + ':' + seconds);
    					var curPercent = Math.floor(distance / curDistance * 100);
               	 		$targetProgress.css('width', curPercent + '%');
               	 		$targetPercent.text( curPercent + '%');
    				}
               }, 1000);
    			
    		}

    	});
    };
    
    var isLastData = false;
	
	var lastKeyIndex = -1;
	var contentFirstListKeys = ['planList', 'timeList', 'newList','bannerList','eventList','pickList','ootdList','haulList', 'bannerList','bestList','fundList','topList'];
	var $wrapperElem = $("#contents_list_wrapper");
	
    var CONTENT_LIST_INFO;
    
    var resetListVar = function(){
    	$wrapperElem.empty();
    	prevSelectCount = 20;
    	lastKeyIndex = -1;
    	CONTENT_LIST_INFO = {
   	    	tag_bnd_id : [],
   	    	id_type : 'list',
   	    	planOffset : 1,
   	    	timeOffset : 1,
   	    	newOffset : 1,
   	    	eventOffset : 1,
   	    	pickOffset : 1,
   	    	ootdOffset : 1,
   	    	haulOffset : 1,
   	    	bestOffset : 1,
   	    	fundOffset : 1,
   	    	topOffset : 1,
   	    	bannerOffset : 1
   	    };
    	$wrapperElem.append('<div class="grid_sizer"></div>');
    }
    resetListVar();

    var renderCurrentUI = function(pData) {
    	
    	while(true) {
    		lastKeyIndex++;
    		if(lastKeyIndex >= contentFirstListKeys.length) lastKeyIndex = 0;
    		
    		var curKey = contentFirstListKeys[lastKeyIndex];
    		
    		if(pData[curKey].length > 0) {
    			
    			var templateID = curKey.replace("List", "");
    			var curDataList = pData[curKey][0];
    			$('#c_' + templateID + '_template').tmpl(curDataList).appendTo($wrapperElem);
    			
    			if(templateID == 'time' || templateID == 'new' || templateID == 'top') {
    				var liHTML = '<li><span style="background:{colorvalue};">{colorname}</span></li>';
    				var fullHTML = '';
    				for(var i = 0; i < curDataList.CNT_PRD_COLOR.length ; i ++) {
    					var curColorInfo = curDataList.CNT_PRD_COLOR[i];
    					fullHTML += liHTML.replace('{colorvalue}', curColorInfo.CNT_PRD_COLOR)
    										.replace('{colorname}', curColorInfo.CMN_COM_NM);
    				}
    				var curIDX = '';
    				if(templateID == 'time' ) curIDX = curDataList.TIM_SAL_IDX;
    				else if(templateID == 'new' ) curIDX = curDataList.DSP_MST_IDX;
    				else if(templateID == 'top' ) curIDX = curDataList.DSP_MST_IDX;
    				$('#' + templateID + '_' + curIDX).append(fullHTML);
    				
    				if(templateID == 'time')
    					renderRemainTimer();
    				
    			} else if (templateID == 'ootd') {
    				var cdnDomain = '<c:out value="${cdnDomain}"/>';
        	        var liHTML = '';
        	        liHTML += '<li>';
        	        liHTML += '    <a href="/pc/product/productView.do?PRD_MST_CD={PRD_MST_CD}" target="_blank">';
        	        liHTML += '        <div class="pro"><img src="{image}" alt="{alt}"></div>';
        	        liHTML += '        <div class="if">';
        	        liHTML += '            <p class="tit">{title}</p>';
        	        liHTML += '            <p class="pri_bx">';
        	        liHTML += '                <span class="pri cur-number-format">{price}</span>';
        	        liHTML += '                <span class="per">{percent} %</span>';
        	        liHTML += '            </p>';
        	        liHTML += '        </div>';
        	        liHTML += '    </a>';
        	        liHTML += '</li>';
    				var fullHTML = '';
    				for(var i = 0; i < curDataList.DTL_LIST.length ; i ++) {
    					var curDtlInfo = curDataList.DTL_LIST[i];
    					fullHTML += liHTML.replace('{image}', cdnDomain + '/'+ curDtlInfo.PRD_IMAGE)
    										.replace('{title}', curDtlInfo.PRD_MST_NM)
    										.replace('{PRD_MST_CD}', curDtlInfo.PRD_MST_CD)
    										.replace('{alt}', curDtlInfo.PRD_IMAGE_ALT)
    										.replace('{price}', curDtlInfo.PRD_MST_PRICE)
    										.replace('{percent}', curDtlInfo.PRD_DST_PERCENT);
    				}
    				
    				$('#' + templateID + '_' + curDataList.CNT_MST_IDX).append(fullHTML);
    			}

    			pData[curKey].splice(0, 1);
    			break;
    		}
    	}
    }
    
    var renderContentsUI = function(pData){
    	
    	var totalLength = pData.count * 1;
 
    	for(var i = 0; i < totalLength; i++) {
    		renderCurrentUI(pData.list);
    	}

    	isLastData = totalLength == 0 ? true : false;

    	for (var key in pData.offset) {
    		if(CONTENT_LIST_INFO[key]) 
    			CONTENT_LIST_INFO[key] = pData.offset[key]
    	}
    	
    	$('.grid').masonry('destroy');
    	$('.grid').removeData('masonry'); // This line to remove masonry's data
    	
    	$('.grid').masonry({
            itemSelector: '.grid_item',
            columnWidth: '.grid_sizer',
            percentPosition: true,
            transitionDuration: '0.3s'
    	});
        ResetCurrencyNumberFormat();
        //$('.grid').masonry('reloadItems');
    }
    
    var isAjaxing = false;
    var funcGetContentsList = function(pIsInit){
    	
		var selTagList = [];
		$('input:checkbox[name=feeds]').each(function(){
			if(this.checked)
				selTagList.push($(this).attr('data-id'));
		});
		
		if(selTagList.length <= 0) {
			alert('선택하신 태그가 없습니다.');
			return false;
		}
		
		if(pIsInit === true) resetListVar();
		
		CONTENT_LIST_INFO.tag_bnd_id = JSON.stringify(selTagList);
		
		if(isAjaxing == false && isLastData == false) {
			isAjaxing = true;
			
        	$.ajax({
        		type	: "POST",
        		url		: "/pc/contents/contentListAjax.do",
        		dataType: "json",
        		data	: CONTENT_LIST_INFO,
        		success : function(data) {
        			//console.log(data);
        			renderContentsUI(data);
				
        		}, error : function(err) {
        			alert("요청 실패");
        		}, complete : function() {
        			isAjaxing = false;   
        	    }
        	});
		}
		
		return true;
    };
    
    funcGetContentsList();
	///////////// CONTENTS LIST PROCESS FINISH //////////////
    
	
    ///////////////////// FIND MY STYLE POPUP PROCESS START //////////////////////////
	var getMainCategoryList = function($pTargetElem, upIdx)
	{
		$pTargetElem.empty();
        $.ajax({
            type    : "POST",
            url     : '<c:out value="${serverDomain}"/>/pc/product/subCategoryProductAjax.do',
            data    :  { "PRD_CTG_IDX":upIdx, "PRD_CTG_ENV": '<c:out value="${commandMap.PRD_CTG_ENV}" />'},
            dataType : "JSON",
            async   : false,
            success : function(data)
            {
				$pTargetElem.append("<li><button type='button' data-id=''>전체</button></li>");
         
                $.each(data.categoryList, function(i,item) 
                {
                    $pTargetElem.append("<li><button type='button' data-id='" + item.PRD_CTG_IDX + "'>"+ item.PRD_CTG_NM + "</button></li>");
                });
              
            },
            error   : function(xhr,status,error)
            { 
                alert("상품 카테고리 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status); 
            }
        });
	};
	
    getMainCategoryList($('#searchPrdCtgDepth1'), -1);
   

    $('#search_submit').on('click', function(){
    	
    	$('#cat01').val($('#searchPrdCtgDepth1_a').attr('data-id'));
    	$('#cat02').val($('#searchPrdCtgDepth2_a').attr('data-id'));
    	$('#color').val($('#color_a').attr('data-id'));
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/pc/search/search.do", "target":"_self",  "method":"post"}).submit();
		
		return false;
    });
    
    $(".option_list").mCustomScrollbar({
        axis:'y',
        theme:'minimal'
    });
    $(document).on('click','.fbx > a', function(){
        if (!$(this).siblings('.option_list').is(':visible')) {
            $(this).siblings('.option_list').fadeIn(300);
        }
    });
    
    $('.option_list li button').off('click');
    $(document).on('click', '.option_list li button', function(){
        var _this = $(this);
        if (_this.parents('.option_list').siblings('a').hasClass('color')) {
  
            if(_this.hasClass('total')){
                _this.parents('.option_list').siblings('.lk').addClass('total').removeAttr('style');
            }else{
                _this.parents('.option_list').siblings('.lk').removeClass('total');
            }
            
            _this.parents('.option_list').siblings('.lk').text(_this.text()).attr('data-id', _this.attr('data-value')).attr('style',_this.attr('style'));
            _this.parents('.option_list').fadeOut(300);
        } else {
        	
            _this.parents('.option_list').siblings('.lk').text(_this.text()).attr('data-id',  _this.attr('data-id'));
            _this.parents('.option_list').fadeOut(300);
            
            var curID = _this.parents('.option_list').attr('id');
            
            if(curID.indexOf('1') > 0) {
       			getMainCategoryList($('#searchPrdCtgDepth2'), _this.attr('data-id'));
            	$('#searchPrdCtgDepth2_a').text('전체').attr('data-id', '');
            }

        }
    });
    $(document).on('mouseleave', '.option_list', function(){
        $(this).fadeOut(300);
    });
    
	///////////////////// FIND MY STYLE POPUP PROCESS FINISH //////////////////////////
	
	//레이어팝업 오늘하루그만보기
	$(document).on('click', '.btn_layer_close', function(){
	    var todayDate = new Date();
	    var midnight = new Date(todayDate.getFullYear(), todayDate.getMonth(), todayDate.getDate(), 23, 59, 59);
		var popup_idx = $(this).data("id");
		var type = $(this).data("type");
		var $this = $(this).parent("div").parent("div").parent("div");
		
		if($this.find("input[id^=serach_chk_]").is(":checked") == true)
		{
			$.cookie("MainPopup_"+popup_idx, "Y" , { path: '/', expires: midnight });	
		}
		$("#layer_benefit_"+$(this).data("id")).remove();
	});

});

	$(function () {
		// layer popup open
	    <c:choose>
	    <c:when test="${not empty listPopup }" >
	    
	    <c:forEach var="item" items="${listPopup }" varStatus="status">
				var index = '<c:out value="${status.index}" />';
				var popMstTyp = '<c:out value="${item.POP_MST_TYP}" />';
				
				if ($.cookie("MainPopup_${item.POP_MST_IDX}")!="Y" )
				{
					if(popMstTyp == "L"){
						
						$('#layer_benefit_${item.POP_MST_IDX}').css({
		    				left:'${item.POP_MST_X}px',
		    				top:'${item.POP_MST_Y}px',
		    				width:'${item.POP_MST_W}',
		    				height:'${item.POP_MST_H}'
		    			});
						$('.layer').css({
							display:'block',
							top:'50%',
							left:'50%',
							margin : '-260px 0 0 -260px'
						});
					}else{
						$("#POP_MST_IDX").val('${item.POP_MST_IDX}');
						popupXY('',"${item.POP_MST_W}","${item.POP_MST_H}","${item.POP_MST_X}","${item.POP_MST_Y}",130,"no","_MainPopup_${item.POP_MST_IDX}");
						$("#popupForm").attr({"action":"<c:out value="${frontDomain}" />/pc/main/mainPopupInfo.do", "target":"popup_MainPopup_${item.POP_MST_IDX}", "method":"post"}).submit();
					}
	    		}
				else
				{
	    			$("#layer_benefit_${item.POP_MST_IDX }").remove();
	    		}
	    </c:forEach>
	    </c:when>
	    </c:choose>

	});
	
	//레이어팝업 링크
	popupLink = function(link, type){
		if(type == 'N'){//새창열림
			window.open(link, '_blank');
		}
		if(type == 'P'){//부모창열림
			window.open(link, '_self');
		}
	}

</script>