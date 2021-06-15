<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

 <!-- Content -->
    <div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">스페셜</h2>
            </div>
            <!--// Title -->

            <!-- .special_visual_wrap -->
            <div class="special_visual_wrap">
                <div class="special_visual">
                	<c:if test="${not empty toplist }">
                		<c:forEach var="movRow" items="${toplist }" varStatus="status">
                		 
                		 	<div>
		                        <!--  <a href="/pc/special/specialView.do">-->
		                        <a href="${movRow.BNR_MST_URL}" target="_blank">
		                            <img src="${cdnDomain}${movRow.FILE_NM }" alt="${movRow.CMN_FLE_ALT_TXT }">
		                            <div class="special_movie_area">
		                                <!-- YOUTUBE VIDEO -->
		                                <div class="ev_video" data-video="${movRow.BNR_MST_MOV_URL}" style="background-image:url(${cdnDomain}${movRow.FILE_NM })">
		                                    <span class="ev_play"></span>
		                                </div>
		                                <!--//YOUTUBE VIDEO -->
		                            </div>
		                        </a>
		                    </div>
                    
                		</c:forEach>

                    
                	</c:if>

                </div>
            </div>
            <!-- // .special_visual_wrap -->
			
            <ul class="img_banner_link_list clearboth">
            </ul>

        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
	var isReqAjax 	= false;
	var isLastData 	= false;
	var cPage 		= 1;
	var pageSize 	= 20;
    $(function(){
        $('.special_visual').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            adaptiveHeight: true
        });
        
        reqListAjax();
    });
    
    $(window).scroll(function(){
     	var maxHeight = $(document).height();
    	var currentScroll = $(window).scrollTop() + $(window).height();
    	if(maxHeight == currentScroll){
    		reqListAjax();
    	}
    });
    
    function reqListAjax(){
    	
    	//console.log(isReqAjax+'||'+isLastData);
    	
    	if(isReqAjax || isLastData) return;
    	
    	isAjaxing = true;
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/special/specialAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage ,
    			        "pageSize" : pageSize
    			      },
    		success : function(data) {
    			
    			if(data.list.length < pageSize) isLastData = true;
    			
    			renderList(data.list);
    			
    			cPage += data.list.length;
    			
    		}, error : function(err) {
    			//alert("요청 실패");
    		}, complete : function() {
    			isReqAjax = false;
    		}
    	});
    }

    function renderList(list){
    	
    	//console.log('list', list);
    	
    	if(list == null){ return; }
    	
    	for(var idx =0; idx < list.length; idx++){
    		var html = "";
    		html += "<li>";
    		html += "<a href=\"/pc/special/specialView.do?CNT_MST_IDX=" + list[idx].CNT_MST_IDX + "\">";
    		html += "    <div class=\"banner_img_area\">";
    		html += "	    <img src=\"<c:out value="${cdnDomain}"/>"+list[idx].FILE_NM+"\" alt=\""+list[idx].CMN_FLE_ALT_TXT+"\">";
    		
    		html += "    </div>";
    		html += "    <strong>"+list[idx].CNT_MST_TITLE+"</strong>";
    		html += "</a>";
    		html += "</li>";
        
		   	$(".img_banner_link_list").append(html);    		
		}
    }    
</script>

