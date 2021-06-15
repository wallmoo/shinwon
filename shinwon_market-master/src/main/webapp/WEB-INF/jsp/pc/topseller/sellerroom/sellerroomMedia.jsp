<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<!-- Content -->
    <div id="container">
        <div id="content" class="content">

			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

		   	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_wrap clearboth">
        	</c:if>
        	
			<%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>

        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_right">
        	</c:if>
        	
            <div class="sub_content product">
                <div class="search_product">
                    <div class="items pt0">
                    <!-- 
                        <div class="select_box">
                            <span class="select">
                                <select title="상품출력 선택">
                                    <option>최근등록순</option>
                                </select>
                            </span>
                            <span class="select">
                                <select title="시즌별 선택">
                                    <option>시즌별</option>
                                </select>
                            </span>
                        </div>
                      -->
                    </div>
                </div>
                <div class="media_list">
                    <ul id="contents_wrapper" class="clearboth">
                    </ul>
                </div>

                <!-- 
              	<div id="layer-media-bg" class="dim not"></div>
                <div id="layer_lookbook6" class="layer layer_media">
					영상 재생 UI 
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
                 -->
                
				<!-- layer -->
				<div id="layer_img_detail" class="layer pro_detail">
					<div class="layer_content video" id='layer_content_video'>
						<iframe id="player" type="text/html" width="100%" height="100%"  src=""  frameborder="0"></iframe>
					</div>
					<a href="#none" class="btn_layer_close type02">레이어 닫기</a>
				</div>
				<!-- //layer -->                
                
            </div>
            
            
       	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
				</div>
				<!-- //Right Wrapper -->
        	</div>
        	<!-- //All Wrapper -->
       	</c:if>
       	
        </div>
    </div>
    <!--// Content -->



<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
$(function(){
	

	
	
	
    var cPage = 1;
	var isLastData = false;
	var pageSize = 20;
	var VDR_MST_IDX = "<c:out value="${commandMap.VDR_MST_IDX}"/>";
	
	var $contentsWrapper = $('#contents_wrapper');
	
	var resetVar = function(){
		cPage = 1;
		$contentsWrapper.empty();
		isLastData = false;
	}
	resetVar();
	
    $(window).scroll(function(){
     	var maxHeight = $(document).height();
    	var currentScroll = $(window).scrollTop() + $(window).height();
    	if(maxHeight == currentScroll){
    		reqListAjax();
    	}
    });
    
	renderList = function(list){
		if(list == null){ return; }
		for(var idx = 0; idx < list.length; idx++){
			
			var html = "";
			html += "<li>";
			html += "	<a href='#' class='media_item'  data-url='"  + list[idx].CNT_MST_URL + "'>";
			html += "    	<img src='<c:out value="${cdnDomain }" />" + list[idx].CMM_FLE_SAVE_PATH + "' alt='" + list[idx].CMN_FLE_ALT_TXT + "'>";
			html += "    	<p class='tit'>"  + list[idx].CNT_MST_TITLE  + "</p>";
			html += "    	<p class='date'>" + list[idx].CNT_MST_REG_DT + "</p>";
			html += "	</a>";
			html += "</li>";
			
			
			var html = "";
			html += "<li>";
			html += "	<a href='#' class='media_item'  data-url='"  + list[idx].CNT_MST_URL + "'>";
			html += "    	<img src='<c:out value="${cdnDomain }" />" + list[idx].CMM_FLE_SAVE_PATH + "' alt='" + list[idx].CMN_FLE_ALT_TXT + "'>";
			html += "	</a>";			
			html += "   <p class='tit'>"  + list[idx].CNT_MST_TITLE  + "</p>";
			html += "   <p class='date'>" + list[idx].CNT_MST_REG_DT + "</p>";
			html += "</li>";
			
			
			$contentsWrapper.append(html);
		}
	}
	
	/*
	var $popupBGElem = $('#layer-media-bg');
	var $popupElem = $('#layer_lookbook6');
	
	$contentsWrapper.on('click', '.media_item', function(){
		var curUrl = $(this).attr('data-url');
		
		renderPopupUI(curUrl);
		
		$popupBGElem.show();
		//$popupElem.show();
		
		
		$popupElem.css({
		   'top' : '50%',
		   'left' : '50%',
		   'margin' : '-300px 0 0 -455px',
		   'display' : 'block'
		});
	});
	
	var renderPopupUI = function(pData) {
		
	}
	*/
	
    var isAjaxing = false;
	reqListAjax = function (){
		
		if(isAjaxing || isLastData){ return; }
		
		isAjaxing = true;
		
    	$.ajax({
    		type	: "POST",
    		url		: "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomMediaListAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage , "pageSize" : pageSize, "VDR_MST_IDX" : VDR_MST_IDX},
    		success : function(data) {
    			if(data.list.length < pageSize) isLastData = true;
    			
    			console.log(data.list);
    			renderList(data.list);
    			
    			cPage += data.list.length;
    			
    			isAjaxing = false;
    		}, error : function(err) {
    			alert("요청 실패");
    			isAjaxing = false;
    		}
    	});
    }
	
	reqListAjax();
	
	
	
	$('.media_list').on('click', 'li > a', function(){
		
		if ($('#layer_img_detail').is(':visible')) {
			$('#layer_img_detail').css('display','none');
		} else {

			
			var curUrl = $(this).attr('data-url');
			
	        $('#layer_content_video').empty();
            $('#layer_content_video').append('<iframe width="960" height="600" src="https://www.youtube.com/embed/'+curUrl+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
    		
			$('#layer_img_detail').css('display','block');
		}
		
		/*
		if ($('.layer').is(':visible')) {
			$('.layer').css('display','none');
		} else {
			$('.layer').css('display','block');
		}
		*/
				
		
		
		
	});	
	
});


</script>