<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>쑈윈도 | 채널ON_Veiw</title>

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
                <h2 class="pg_tit">채널ON</h2>
            </div>
            <!--// Title -->
	
            <!-- .pg_sub_tit_wrap -->
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl"><c:out value="${channelOnInfo.CNT_MST_TITLE }" /></h3>
                <button type="button" class="btn-like ${channelOnInfo.MY_LIKE eq 'Y' ? 'on' : ''} fr" onclick="likeBtnEvent($(this),'${item.PLN_PRD_MST_CD}', 'TYPE_CHANNEL_ON')" title="좋아요"><span><c:out value="${item.LIKE_COUNT }"></c:out></span></button>
            </div>
            <!-- // .pg_sub_tit_wrap -->

            <!-- .editor_content_wrap -->
            <div class="editor_content_wrap">

            </div>
            <!-- // .editor_content_wrap -->

            <div class="by_tag">
                <div class="tag_list" >
                    <ul>
                    <c:if test="${not empty tagList}">
                		<c:forEach var="tagRow" items="${tagList }">
                		<li>
                			<c:out value="${tagRow.TAG_MST_TITLE }"></c:out>
                		</li>	
                    	</c:forEach>
                    </c:if>
                    </ul>
                </div>
            </div>

 <!-- .sub_content -->
            <div class="sub_content product">

                <!-- .goods_list_wrap -->
                <div class="goods_list_wrap">
                    <!-- .title_exp_area -->
                    <div class="title_exp_area clearboth mt46">
                        <h3 class="fl">관련 상품</h3>
                    </div>
                    <!-- // .title_exp_area -->
										<!-- .new_goods_wrap -->
		                <div class="new_goods_wrap mt100">
		                    <ul class="new_goods_list clearboth" id="productItemContainner">
		                        <!-- <li>
		                            <span class="flag_video">video</span>
		                            <a href="#">
		                                <div class="img_thum_wrap">
		                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem01.jpg);"></div>
		                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem01_over.jpg);"></div>
		                                    <ul class="color_list">
		                                        <li><span style="background:#273b38;">color 01</span></li>
		                                        <li><span style="background:#c7673e;">color 02</span></li>
		                                        <li><span style="background:#6686ad;">color 03</span></li>
		                                    </ul>
		                                </div>
		                                <div class="sort_tag_area clearboth">
		                                    <span class="sort">SIEG</span>
		                                    <span class="tag">#신상품</span>
		                                </div>
		                                <p class="goods_title">한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !</p>
		                                 <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p>
		                                <div class="goods_cost_info">
		                                    <span class="dc_before_cost">￦88,000</span>
		                                    <strong class="clearboth">
		                                        <span class="goods_cost">￦44,000</span>
		                                        <em class="dc_percent">50%</em>
		                                    </strong>
		                                </div>
		                            </a>
		                            <div class="btn_like_area">
		                                <button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
		                            </div>
		                        </li> -->
		                    </ul>
		                </div>
		                <!-- // .new_goods_wrap -->
                </div>
                <!-- // .goods_list_wrap -->

            </div>
            <!-- // .sub_content -->

        </div>
    </div>
    <!--// Content -->



<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
	
	var cPage = 1;
	var idx = "${param.CNT_MST_IDX }";
	var pageSize = 16;
	var isLastData =false;
	var isAjaxing = false;
	
	$(document).ready(function(){
		reqProductListAjax();
	});


	// 스크롤 이벤트
	$(window).scroll(function(){
	 	var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight == currentScroll){
			reqProductListAjax();
		}
		
	});

	// 리스트 호출
	
    reqProductListAjax = function(){
    	if(isAjaxing || isLastData){ return; }
    	
    	isAjaxing = true; 

    	
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/channelon/channelonProductAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage, "CNT_MST_IDX" : idx, pageSize : pageSize},
    		success : function(data) {
    			if( data.list.length < pageSize ) isLastData = true;
    			
    			renderProductList(data.list);
    			cPage += data.list.length;
    			
    		}, error : function(err) {
    			alert("요청 실패");
   			
    		}, complete : function(){
    			isAjaxing = false;
    		}
    	});
    }
    
 	// 데이터 렌더링
   function renderProductList(list){
    	
    	if(list == null){ return; }
    	
    	for(var idx =0; idx < list.length; idx++){
    		
    		var html = "";
    			html += "<li>";
    			html += "	<span class=\"flag_video\">video</span>";
    			html += "	<a href=\"<c:out value='${frontDomain }'/>/pc/product/productView.do?PRD_MST_CD="+list[idx].PRD_MST_CD+"\">";
    			html += "		<div class=\"img_thum_wrap\">";
    			var img1 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_IMAGE; //curData.PRD_IMAGE
    			var img2 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_ROLL_OVER_IMG; //curData.PRD_ROLL_OVER_IMG

    			html += "			<div class=\"img_thum_inner crop\" style=\"background-image:url("+img1+");\"></div>";
		        html += "			<div class=\"img_thum_inner crop\" style=\"background-image:url("+img2+");\"></div>"; 
				html += "			<ul class=\"color_list\">";
				if(list[idx].CNT_PRD_COLOR.length > 0){
					for (var coloridx = 0; coloridx < list[idx].CNT_PRD_COLOR.length ; coloridx++){
						html +=	"<li><span style=\"background:"+list[idx].CNT_PRD_COLOR[coloridx].CNT_PRD_COLOR+";\">"+list[idx].CNT_PRD_COLOR[coloridx].CMN_COM_NM+"</span></li>";
					}
				}
				html += "			</ul>";			
				html += "			</div>";
				html += "		<div class=\"sort_tag_area clearboth\">";	
				html += "			<span class=\"sort\">"+list[idx].PRD_MST_BRAND_NM+"</span>";
 				html += "			<span class=\"tag\">"+list[idx].TAG_MST_TITLE+"</span>";		
		        html += "		</div>";
				html += "		<p class=\"goods_title\">"+(list[idx].PRD_MST_NM)+"</p>";
				html += "		<div class=\"goods_cost_info\">";
				html += "			<span class=\"dc_before_cost\">￦"+GetNumberFormat(list[idx].PRD_MST_PRC)+"</span>";
				html += "			<strong class=\"clearboth\">";
				html += "				<span class=\"goods_cost\">￦"+GetNumberFormat(list[idx].PRD_MST_DSP_PRC)+"</span>";
				html += "				<em class=\"dc_percent\">"+list[idx].PRD_SALE_RATE+"%</em>";
				html += "			</strong>";
				html += "		</div>";
				html += "	</a>";
				html += "	<div class=\"btn_like_area\">";
				html += "		<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].CNT_PRD_MST_CD+"','TYPE_PRODUCT')\" class=\"btn-like"+(list[idx].MY_LIKE == 'Y' ? " on" : "")+"\" title=\"좋아요\"><span>"+list[idx].LIKE_COUNT+"</span></button>";
				html += "	</div>";
				html += "</li>";
				
		   		$("#productItemContainner").append(html);    		
		}
    }
 	


</script>
