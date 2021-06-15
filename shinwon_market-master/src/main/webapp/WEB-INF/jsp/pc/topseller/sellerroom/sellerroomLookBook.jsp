<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<!-- Content -->
    <div id="container">
        <div id="content" class="content">

			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            
            
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
                        <div class="select_box">
                            <span class="select">
                                <select id="season_sel" title="시즌별 선택">
                                    <option value="" selected>전체</option>
                                    <c:forEach var="infoRow" items="${seasonList }">
                        				<option value="${infoRow.CMN_COM_IDX }" >${infoRow.CMN_COM_NM }</option>
                        			</c:forEach>
                                </select>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="lookbook_list">
                    <ul id="contents_wrapper" class="clearboth">
                    </ul>
                </div>
                
              	<div id="layer-lookbook-bg" class="dim not"></div>
                <div id="layer_lookbook6" class="layer layer_lookbook">
                    <div class="layer_header">
                        <h2 class="title"></h2>
                    </div>
                    <div class="layer_content">
                        <div class="lookbook_slide slick_vusual">
                        </div>
                    </div>
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
                
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
	var curDataInfo = {};
	var VDR_MST_IDX = "<c:out value="${commandMap.VDR_MST_IDX}"/>";
	var $contentsWrapper = $('#contents_wrapper');
	
	var resetVar = function(){
		cPage = 1;
		curDataInfo = {};
		$contentsWrapper.empty();
		isLastData = false;
	}
	resetVar();
	
	$('#season_sel').on('change', function(){
		resetVar();
		reqListAjax();
	});
	
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
			html += "	<a class='lookbook_item' data-id='"  + list[idx].CNT_MST_IDX + "' href='javascript:void(0)'>";
			html += "    	<img src='<c:out value="${cdnDomain }" />" + list[idx].CMM_FLE_SAVE_PATH + "' alt='" + list[idx].CMN_FLE_ALT_TXT + "'>";
			html += "    	<div class='tit'><span>" + list[idx].CNT_MST_TITLE + "<br>" + list[idx].SEASON_NM + "</span></div>";
			html += "	</a>";
			html += "</li>";
	        
			$contentsWrapper.append(html);
			
			curDataInfo[list[idx].CNT_MST_IDX] = list[idx];
		}
	}
	
    var isAjaxing = false;
	reqListAjax = function (){
		
		if(isAjaxing || isLastData){ return; }
		
		isAjaxing = true;
		
		
    	$.ajax({
    		type	: "POST",
    		url		: "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomLookBookListAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage , "pageSize" : pageSize, "VDR_MST_IDX" : VDR_MST_IDX, "CNT_MST_SEASON" : $('#season_sel option:selected').val()},
    		success : function(data) {
    			if(data.list.length < pageSize) isLastData = true;
    			
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
	
	var $popupBGElem = $('#layer-lookbook-bg');
	var $popupElem = $('#layer_lookbook6');
	
	$contentsWrapper.on('click', '.lookbook_item', function(){
		var curIdx = $(this).attr('data-id');
		
		renderPopupUI(curDataInfo[curIdx]);
		
		$popupBGElem.show();
		//$popupElem.show();
		
		$popupElem.css({
		   'top' : '50%',
		   'left' : '50%',
		   'margin' : '100px 0 0 -455px',
		   'display' : 'block'
		});
		
	});
	
	var baseImgURL = '<c:out value="${cdnDomain }" />';
	var isSlick = false;
	var renderPopupUI = function(pData) {
		
		$('.title', $popupElem).html(pData.CNT_MST_TITLE + ' | ' + pData.SEASON_NM);
		
		if(isSlick)
			$('.lookbook_slide').slick('unslick');
		
		var $slideElem = $('.lookbook_slide',  $popupElem);
		$slideElem.empty();
		
		for(var i = 0; i < pData.IMAGES.length; i++) {
			var curData = pData.IMAGES[i];
		
			var curHTML = '<div><a href="javascript:;"><img src="' + baseImgURL + curData.CMM_FLE_ATT_PATH + curData.CMM_FLE_SYS_NM + '" alt="' + curData.CMN_FLE_ALT_TXT + '"></a></div>';
			
			$slideElem.append(curHTML);
		}
		isSlick = true;
		
		setTimeout(function() {
	        $('.lookbook_slide').slick({
	            dots : false,
	            infinite: true,
	            cssEase: 'linear',
	            autoplay: false,
	            slidesToShow: 1,
	            arrows: true
	        });
		}, 50);
		

	}
	
});

</script>