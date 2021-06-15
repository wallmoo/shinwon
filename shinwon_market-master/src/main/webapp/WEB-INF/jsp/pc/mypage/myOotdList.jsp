<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

 <div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">OOTD 관리</h2>
            </div>
            <!--// Title -->


            <div class="sub_content">
                
                <%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
                <!-- //my_modify_top_wrap -->

                <div class="ootd_main">
                    <div class="list col3">
                        <div id="contents_list_wrapper" class="grid">
                        	<div class="grid_sizer"></div>
                        </div>
                    </div><!-- //list-->
                </div>
            </div>




        </div>
    </div>
    
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<!-- OOTD 템플릿 -->
<script type="text/template" id="c_ootd_template"> 
<div class="grid_item">
    <a href="/pc/mypage/myOotdDetail.do?CNT_MST_IDX=\${CNT_MST_IDX}">
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

<script>

$(function(){
	
	///////////// CONTENTS LIST PROCESS START //////////////
    var isLastData = false;
	
	var $wrapperElem = $("#contents_list_wrapper");
	var selOffset = 1;
    var resetListVar = function(){
    	selOffset = 1;
    	isLastData = false;
    }
    resetListVar();

    var renderCurrentUI = function(pData) {
        	
		if(pData.length > 0) {
		
			$('#c_ootd_template').tmpl(pData).appendTo($wrapperElem);
			
			for(var i = 0 ; i < pData.length; i++) {
				
				var curDataList = pData[i]; 
				var cdnDomain = '<c:out value="${cdnDomain}"/>';
    	        var liHTML = '';
    	        liHTML += '<li>';
    	        liHTML += '    <a href="javascript:(void);">';
    	        liHTML += '        <div class="pro"><img src="{image}" alt="{alt}"></div>';
    	        liHTML += '        <div class="if">';
    	        liHTML += '            <p class="tit">{title}</p>';
    	        liHTML += '            <p class="pri_bx">';
    	        liHTML += '                <span class="pri">{price}</span>';
    	        liHTML += '                <span class="per">{percent}%</span>';
    	        liHTML += '            </p>';
    	        liHTML += '        </div>';
    	        liHTML += '    </a>';
    	        liHTML += '</li>';
				var fullHTML = '';
				
				
				for(var i = 0; i < curDataList.DTL_LIST.length ; i ++) {
					var curDtlInfo = curDataList.DTL_LIST[i];
					console.log(curDtlInfo);
					fullHTML += liHTML.replace('{image}', cdnDomain + '/'+ curDtlInfo.PRD_IMAGE)
										.replace('{title}', curDtlInfo.PRD_MST_NM)
										.replace('{alt}', curDtlInfo.PRD_IMAGE_ALT)
										.replace('{price}', curDtlInfo.PRD_NOW_DST_PRICE)
										.replace('{percent}', curDtlInfo.PRD_DST_PERCENT);
				}
				
				$('#ootd_' + curDataList.CNT_MST_IDX).append(fullHTML);
				
			}
		}
    }
    
    var renderContentsUI = function(pData){
    	
    	renderCurrentUI(pData.list);
    	
    	selOffset += pData.list.length;
    	if(pData.list.length < 20 ) {
    		isLastData = true;
    	}
    	/*
        $('.grid').masonry({
            itemSelector: '.grid_item',
            columnWidth: '.grid_sizer',
            percentPosition: true,
            transitionDuration: '0.3s'
    	});
    	*/
    }
    
    var isAjaxing = false;
    var funcGetContentsList = function(){
    	
		if(isAjaxing == false && isLastData == false) {
			isAjaxing = true;
			
			ShowLoading(true);
        	$.ajax({
        		type	: "POST",
        		url		: "/pc/mypage/myOotdListAjax.do",
        		dataType: "json",
        		data	: {STARTNUM : selOffset, ENDNUM : selOffset + 20, MY_CONN_YN : 'Y'},
        		success : function(data) {
        			//console.log(data);
        			renderContentsUI(data);
				
        		}, error : function(err) {
        			alert("요청 실패");
        		}, complete : function() {
        			isAjaxing = false;   
        			ShowLoading(false);
        	    }
        	});
		}
    };
    
    funcGetContentsList();
    
   	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			funcGetContentsList();
		}
	});
	///////////// CONTENTS LIST PROCESS FINISH //////////////
    
});
</script>