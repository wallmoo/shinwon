<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<!-- Content -->
    <div id="container">
        <div id="content" class="content">
        
            <%-- <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%> --%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">TOP SELLER</h2>
            </div>
            <!--// Title -->

            <!-- .topseller_vusual_wrap -->
            <div class="topseller_vusual_wrap">
                <div class="topseller_vusual slick_vusual">
                	<c:forEach var="topBannerListRow" items="${topBannerList }" varStatus="i">
	                    <div class="slick-slide-bx">
	                        <a href="javascript:goPage(${topBannerListRow.VDR_MST_IDX })" class="visual">
	        	            	<c:forEach var="productListRow" items="${topBannerListRow.topProductList }">
		                            <div class="img"><img src="<c:out value="${cdnDomain }"/>${productListRow.PRD_IMAGE }" alt="${productListRow.PRD_IMAGE_ALT }"></div>
	    	                	</c:forEach>
	                        </a>
	                        <div class="seller_info_bx">
	                            <div class="sl_info">
	                                <span class="sl_img"><img src="<c:out value="${cdnDomain }"/>${topBannerListRow.PROFILE_IMG }" alt="이미지"></span>
	                                <span class="sl_name"><c:out value="${topBannerListRow.BND_MST_SEL_NM }" /></span>
	                                <div class="sl_activity">
	                                    <a href="javascript:likeBtnEvent($(this), '${topBannerListRow.VDR_MST_IDX }', 'TYPE_TOP_SELLER');" class="like ${topBannerListRow.LIKE_CLS }"><span class="blind">좋아요</span><c:out value="${topBannerListRow.LIKE_COUNTS }"></c:out></a>
	                                    <a href="javascript:goPage(${topBannerListRow.VDR_MST_IDX })" class="shop">셀러홈 바로가기</a>
	                                </div>
	                            </div>
		                    	<div class="sl_tag">
		                    	<c:forEach var="tagListRow" items="${topBannerListRow.TAG_LIST }" varStatus="status">
		                    		<c:set var="arrayLength" value="${fn:length(topBannerListRow.TAG_LIST) }" />
	                    			<c:choose>
	                    				<c:when test="${arrayLength > 1 }">
				                    		<c:choose>
				                    				<c:when test="${status.index % 2 == 0 }">
					                    				<p>#<c:out value="${tagListRow.TAG_MST_TITLE }"></c:out>
					                    			</c:when>
					                    			<c:when test="${status.index % 2 != 0 }">
					                    				, #<c:out value="${tagListRow.TAG_MST_TITLE }"></c:out></p>
					                    			</c:when>
				                    				<c:otherwise>
				                    					</p>
				                    				</c:otherwise>
				                    		</c:choose>
	                    				</c:when>
	                    				<c:otherwise>
	                    					<p>#<c:out value="${tagListRow.TAG_MST_TITLE }"></c:out></p>
	                    				</c:otherwise>
	                    			</c:choose>
		                    	</c:forEach>
		                    	</div>
	                            <div class="sl_text">
	                            	<c:choose>
	                            		<c:when test="${fn:length(topBannerListRow.BND_MST_SEL_DESC) < 200 }">
			                                <p><c:out value="${topBannerListRow.BND_MST_SEL_DESC }" /></p>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<p><c:out value="${fn:substring(topBannerListRow.BND_MST_SEL_DESC, 0, 200) }[...]" /></p>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
            </div>
            <!-- // .topseller_vusual_wrap -->
            <!-- .topseller_vusual_wrap -->
            <div class="topseller_vusual_wrap">
                <div class="topseller_vusual slick_vusual">
                    <c:forEach var="bottomBannerRow" items="${bottomBannerList }" varStatus="i">
	                    <div class="slick-slide-bx">
	                        <a href="javascript:goPage(${bottomBannerRow.VDR_MST_IDX })" class="visual">
	        	            	<c:forEach var="productListRow" items="${bottomBannerRow.bottomProductList }">
		                            <div class="img"><img src="<c:out value="${cdnDomain }"/>${productListRow.PRD_IMAGE }" alt="${productListRow.PRD_IMAGE_ALT }"></div>
	    	                	</c:forEach>
	                        </a>
	                        <div class="seller_info_bx">
	                            <div class="sl_info">
	                                <span class="sl_img"><img src="<c:out value="${cdnDomain }"/>${topBannerListRow.PROFILE_IMG }" alt="이미지"></span>
	                                <span class="sl_name"><c:out value="${bottomBannerRow.BND_MST_SEL_NM }" /></span>
	                                <div class="sl_activity">
	                                    <a href="javascript:likeBtnEvent($(this), '${bottomBannerRow.VDR_MST_IDX }', 'TYPE_TOP_SELLER');" class="like ${bottomBannerRow.LIKE_CLS }"><span class="blind">좋아요</span><c:out value="${bottomBannerRow.LIKE_COUNTS }"></c:out></a>
	                                    <a href="javascript:goPage(${bottomBannerRow.VDR_MST_IDX })" class="shop">셀러홈 바로가기</a>
	                                </div>
	                            </div>
		                    	<div class="sl_tag">
		                    	<c:forEach var="tagListRow" items="${bottomBannerRow.TAG_LIST }" varStatus="status">
		                    		<c:choose>
		                    			<c:when test="${status.index % 2 == 0 }">
		                    				<p>#<c:out value="${tagListRow.TAG_MST_TITLE }"></c:out>
		                    			</c:when>
		                    			<c:when test="${status.index % 2 != 0 }">
		                    				, #<c:out value="${tagListRow.TAG_MST_TITLE }"></c:out></p>
		                    			</c:when>
		                    			<c:otherwise>
		                    				</p>
		                    			</c:otherwise>
		                    		</c:choose>
		                    	</c:forEach>
		                    	</div>
	                            <div class="sl_text">
	                            	<c:choose>
	                            		<c:when test="${fn:length(bottomBannerRow.BND_MST_SEL_DESC) < 200 }">
			                                <p><c:out value="${bottomBannerRow.BND_MST_SEL_DESC }" /></p>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<p><c:out value="${fn:substring(bottomBannerRow.BND_MST_SEL_DESC, 0, 200) }[...]" /></p>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
            </div>
            <!-- // .topseller_vusual_wrap -->

            <div class="sub_content product">

                <!-- .goods_list_wrap -->
                <div class="goods_list_wrap">
                    <!-- .title_exp_area -->
                    <div class="title_exp_area clearboth mb45">
                        <h3 class="fl">셀러</h3>
                    </div>
                    <!-- // .title_exp_area -->
                    <ul class="goods_list clearboth" id="sellerProductContainner">
                        
                    </ul>
                    <!-- // .goods_list -->
                </div>
                <!-- // .goods_list_wrap -->
            </div>
        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<form id="pageForm" name="pageForm">
	<input type="hidden" id="VDR_MST_IDX" name="VDR_MST_IDX" value="">
</form>

<script>

    $(function(){
    	
        $('.topseller_vusual').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            adaptiveHeight: true,
            arrows: false
        });

        var cPage = 1; // "<c:out value="${commandMap.cPage}"/>";
    	var isLastData = false;
    	var pageSize = 16;
    	//if(cPage == ""){ cPage = 1; }

    	
    	
	    $(window).scroll(function(){
	     	var maxHeight = $(document).height();
	    	var currentScroll = $(window).scrollTop() + $(window).height();
	    	if(maxHeight == currentScroll){
	    		reqSellerProductListAjax();
	    	}
	    });
	    
	    var sellerProductContainner;
	    
	    UiBind = function(){
	    	sellerProductContainner = $("#sellerProductContainner");
	    }
	    UiBind();
	    var isAjaxing = false;
	    
	    
		renderProductList = function(list){
			if(list == null){ return; }
			for(var idx = 0; idx < list.length; idx++){
				
				var html = "";
				html += "<li>";
				html += "	<div class=\"goods_info_wrap\">";
				html += "		<a href=\"javascript:goPage('"+list[idx].VDR_MST_IDX+"')\">";
				html += "			<div class=\"thum_color_info\">";
				html += "				<img src=\"<c:out value='${cdnDomain }' />/"+list[idx].PRD_IMAGE+"\" alt=\""+list[idx].PRD_IMAGE_ALT+"\" >";
				html += "			</div>";
				html += "		</a>";
				html += "		<div class=\"saler_cont\">";
				html += "			<div class=\"saler\">";
				html += "				<span class=\"pic\"><img src=\"<c:out value='${cdnDomain }' />/"+list[idx].SELLER_IMG+"\" alt=\""+list[idx].PRD_IMAGE_ALT+"\" ></span>";
				html += "				<span class=\"name\">"+list[idx].BND_MST_SEL_NM+"</span>";
				html += "			</div>";
				if(list[idx].BND_MST_SEL_DESC)
					html += "			<p class=\"title\">"+(list[idx].BND_MST_SEL_DESC.length < 45 ? list[idx].BND_MST_SEL_DESC : list[idx].BND_MST_SEL_DESC.substring(0, 45)+"...")+"</p>";
				else 
					html += "			<p class=\"title\">...</p>";
					
				html += "		</div>";
				html += "		<div class=\"btn_like_area\">";
				html += "			<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].VDR_MST_IDX+"','TYPE_TOP_SELLER')\" class=\"btn-like"+(list[idx].MY_LIKE.indexOf("Y") > -1 ? " on" : "")+"\" title=\"좋아요\"><span>"+list[idx].LIKE_COUNTS+"</span></button>";
				html += "			<button type=\"button\" onclick=\"goPage("+list[idx].VDR_MST_IDX+")\" class=\"btn-home\"><span class=\"blind\">셀러룸 이동</span></button>";
				html += "		</div>";
				html += "	</div>";
				html += "</li>";
		        
				sellerProductContainner.append(html);
			}
	    
		}
		
		reqSellerProductListAjax = function (){
		
		
			if(isAjaxing || isLastData){ return; }
			
			isAjaxing = true;
			
	    	$.ajax({
	    		type	: "POST",
	    		url		: "<c:out value="${frontDomain}"/>/pc/topseller/topsellerProductAjax.do",
	    		dataType: "json",
	    		data	: {	"cPage" : cPage , "pageSize" : pageSize},
	    		success : function(data) {
	    			if(data.sellerProductList.length < pageSize) isLastData = true;
	    			
	    			renderProductList(data.sellerProductList);
	    			
	    			cPage += data.sellerProductList.length;
	    			
	    			isAjaxing = false;
	    		}, error : function(err) {
	    			alert("요청 실패");
	    			isAjaxing = false;
	    		}
	    	});
	    }
		
		reqSellerProductListAjax(cPage);

    });
    

	

	
	goPage = function(vdrMstIdx){
		var pageForm = $("#pageForm");
    	pageForm.find("input[name='VDR_MST_IDX']").val(vdrMstIdx);
    	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/sellerroomHome.do", "target":"_self", "method":"post"}).submit();
	}

</script>