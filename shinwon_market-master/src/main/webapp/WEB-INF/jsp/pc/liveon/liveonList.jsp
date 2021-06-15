<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">
           <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>

<!--             S : 콘텐츠 시작

            ***************************************************************************** -->
            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">라이브ON</h2>
            </div>
            <!--// Title -->
            <div class="sub_content product">
                <div class="top_title_select_area clearboth">
                    <p class="goods_length" id="allProductCount">상품 (<c:out value="${totalCount }" />)</p>
                    <span class="select">
                        <select id="select1" title="">
                            <option value="new" selected>최근등록순</option>
                            <option value="dwn">가격 낮은순</option>
                            <option value="up">가격 높은순</option>
                            <option value="hit">판매랑 많은순</option>
                        </select>
                        

		                        
                    </span>
                </div>
                <ul class="liveon_list clearboth" id="productItemContainner">
                	<%-- <c:if test="${not empty liveonProductList}">
                		<c:forEach var="movRow" items="${liveonProductList }" varStatus="status">
                    <li>
                        <div class="movWrap" data-video="<c:out value="${movRow.PRD_MST_URL}" /><c:out value="${movRow.PRD_MST_NM }" /> ">
                            <button type="button" class="btn_mov_play">PLAY</button>
                        </div>
                        <div class="sort_tag_area clearboth">
                            <span class="sort">SIEG</span><c:out value="${movRow.PRD_MST_BRAND_NM}"></c:out>
                            <span class="tag">#신상품</span><c:out value="${movRow.TAG_MST_TITLE}"></c:out>
                        </div>
                        <p class="goods_title"><a href="#"><c:out value="${movRow.CNT_MST_TITLE }"/></a></p>
                        <div class="goods_cost_info">
                            <span class="dc_before_cost"><c:out value="${movRow.PRD_MST_PRC}"/></span>
                            <strong class="clearboth">
                                <span class="goods_cost"><c:out value="${movRow.CNT_PRD_PRICE}"/></span>
                                <em class="dc_percent"><c:out value="${movRow.PRD_SALE_RATE}"/>%</em>
                            </strong>
                        </div>
                        <div class="btn_option_area">
                            <button type="button" class="btn_option_layer" id="">옵션보기</button>
                        </div>
                    </li>
                    	</c:forEach>
                    </c:if> --%>
                </ul>
            </div>
        </div>
    </div>
    <!--// Content -->
	<div id="productOptionPopup" class="layer full" >
		
	</div>
	
	<!-- <div class="dim" style="width: 100wv; height: 2107px; display: none;"></div> -->
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
	
	var cPage = 1;
	var pageSize = 8;
	var isLastData = false;
	
	$(document).ready(function(){
		reqProductListAjax();
	});
		
	// 스크롤 이벤트
	 $(window).scroll(function(){
	 	var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			reqProductListAjax();
			 //alert("스크롤이벤트");
		}
		
	});
	
	$('#select1').on('change', function(){
		cPage = 1;
		isLastData = false;
		reqProductListAjax();
	});
	

	var isAjax = false;
	// 리스트 호출
 	reqProductListAjax = function(){
    	
		if(isAjax || isLastData) return;
		
		isAjax = true;
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/liveon/liveonListAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage, pageSize : pageSize,  orderType : $('#select1 option:selected').val() },
    		success : function(data) {
    			
    			if(data.list.length < pageSize) isLastData = true;
    			
    			renderProductList(data.list);
    			
    			cPage += data.list.length;
    			
    		}, error : function(err) {
    			alert("요청 실패");
   			
    		} , complete : function() {
    			isAjax = false;
    		}
    	});
    }
    
 	reqProductListAjax();
 	
	// 데이터 렌더링
    function renderProductList(list){
     	
     	if(list == null){ return; }
     	
     	for(var idx =0; idx < list.length; idx++){
     		
     		var html = "";
     			html += "<li>";
     			html += "	<div class=\"movWrap\" data-video=\"TzWIXvPMv0E\" style=\"background-image:url(/nas/cdn/pc/images/@temp/img_mov_03.png);\">";			    			
     			html += "		<button type=\"button\" class=\"btn_mov_play\">PLAY</button>";
     			html += "	</div>";	
     			html += "	<div class=\"sort_tag_area clearboth\">";
 		        html += "		<span class=\"sort\">"+list[idx].PRD_MST_BRAND_NM+"</span>";
 				html += "		<span class=\"tag\">"+list[idx].TAG_MST_TITLE+"</span>";
 				html += "	</div>";			 
 				html += "	<p class=\"goods_title\"><a href=\"<c:out value='${frontDomain }'/>/pc/product/productView.do?PRD_MST_CD="+list[idx].PRD_MST_CD+"\">"+list[idx].PRD_MST_NM+"</a></p>";
 				html += "	<div class=\"goods_cost_info\">";	
 				html += "		<span class=\"dc_before_cost\">￦"+GetNumberFormat(list[idx].PRD_MST_PRC)+"</span>";
  				html += "		<strong class=\"clearboth\">";		
 		        html += "			<span class=\"goods_cost\">￦"+GetNumberFormat(list[idx].PRD_NOW_DST_PRICE)+"</span>";
 				html += "			<em class=\"dc_percent\">"+list[idx].PRD_NOW_DST_POINT+"%</em>";
 				html += "		</strong>";
 				html += "	</div>";
 				html += "	<div class=\"btn_option_area\">";
 				html += "		<button type=\"button\" class=\"btn_option_layer\" onclick=\"showProductOptionPopup('"+list[idx].PRD_MST_CD+"')\">옵션보기</button>";
 				html += "	</div>";
 				html += "</li>";
 				
 				
 		   		$("#productItemContainner").append(html);    		
 		}
     }
	
	
	//Popup 클릭이벤트
	
	showProductOptionPopup = function(prdMstCd){
		//$("#productOptionPopup").load("<c:out value="${frontDomain}" />/pc/liveon/liveonProductAjax.do #contents", {"PRD_MST_CD":prdMstCd }, function(){
		$("#productOptionPopup").load("/pc/liveon/liveonProductAjax.do", {"PRD_MST_CD":prdMstCd });
		$("#productOptionPopup").show();
		/* $(".dim").show(); */
		
	}
		
		
     
</script>


