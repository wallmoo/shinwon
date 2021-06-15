
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<script type="text/javascript" src="/nas/cdn/pc/js/productList.js"></script>
<%
/* List<Map<String, Object>> toplist = (List<Map<String, Object>>)request.getAttribute("toplist");
System.out.println("toplist.size() :: " + toplist.size()); */
%>

<script>
    $(function(){
        $('.channelon_visual').slick({
            dots : true,
            infinite: true,
            speed: 500,
            cssEase: 'linear',
            slidesToShow: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            adaptiveHeight: true
        });
    });
</script>

<title>쑈윈도 | 채널ON</title>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">

            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">채널ON</h2>
            </div>
            <!--// Title -->

            <!-- .channelon_visual_wrap -->
            <div class="channelon_visual_wrap">
                <!-- .channelon_visual -->
                <div class="channelon_visual">
                	<c:if test="${not empty toplist }">
						<c:forEach var="movRow" items="${toplist }" varStatus="status"> 
                    <div>
                    	 <!-- <a href="/pc/channelon/channelonView.do" class="clearboth"> -->
                    	  <a href="javascript:void(0);" class="clearboth">
                            <div class="img_area fl">
								<div class="movWrap" data-video="<c:out value="${movRow.BNR_MST_URL}" /><c:out value="${movRow.FILE_NM }" /> ">
                            			<%-- <iframe src="<c:out value="${movRow.CNT_MST_URL }" /><c:out value="${movRow.CMM_FLE_SYS_NM }" />"></iframe> --%>
								<button type="button" class="btn_mov_play">PLAY</button>
								</div>
                            </div>
                            <dl class="fl">
                                <dt><c:out value="${movRow.BNR_MST_TITLE}" /></dt>
                                <dd><c:out value="${movRow.BNR_MST_DESC}" /></dd>
                            </dl>
                        </a>
                    </div>
                    	<!-- // .channelon_visual -->
						</c:forEach>
					</c:if>
                </div>
            </div>
            <!-- // .channelon_visual_wrap -->
			
            <!-- .tabmenuWrap 탭 매뉴바-->
            <div class="tabmenuWrap up_visual_content">
                <ul class="tabmenu_list cf">
                	<c:if test="${not empty listGnbMenu}">
                		<c:forEach var="gnbMenuRow" items="${listGnbMenu }" varStatus="i">
                			<c:if test="${gnbMenuRow.PRD_CTG_LEVEL eq 1 }">
			                    <li class="tabmenuLink <c:if test='${i.index == 0 }'>on</c:if>" data-id="${gnbMenuRow.PRD_CTG_IDX}">
			                    	<a href="javascript:void(0)"><c:out value="${gnbMenuRow.PRD_CTG_NM }" /></a>
			                    </li>
		                    </c:if>
                		</c:forEach>
                	</c:if>
	            </ul>
            </div>        
            <!-- // .tabmenuWrap -->

            <!-- .sub_content -->
            <div class="sub_content product">
                <!-- .mov_list_wrap -->
                <div class="mov_list_wrap">

                    <!-- .top_title_select_area cf 셀렉트박스-->
                    <div class="top_title_select_area clearboth">
                        <span class="select">
                            <select id="orderSelect" title="" onchange="chgSelectFn();" >
                                <option value="CNT_MST_REG_DT" selected>최근등록순</option>
                                <option value="CNT_MST_SEASON">시즌별</option>
                                <option value="CNT_MST_HIT_CNT">조회순</option>
                            </select>
                        </span>
                    </div>
                    <!-- // .top_title_select_area cf -->
					<ul class="mov_list clearboth" id="mov_list_container">
                        <!-- D : loop 동영상목록-->
                        <!-- //D : loop -->
					</ul>
                </div>
                <!-- // .mov_list_wrap -->
            </div>
            <!-- // .sub_content -->

        </div>
    </div>
    <!--// Content -->

<form id="pageForm" name="pageForm">
	<input type="hidden" id="CNT_MST_IDX" name="CNT_MST_IDX" value="">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>
<%-- <jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/> --%>
<input type='hidden' id="listGnbMenu" value='${JsonUtil.getJsonArrayFromList(listGnbMenu)}'>
<script>
	var listGnbMenu = '';// JSON.parse($("#listGnbMenu").val());
	var categoryProductList = [];

	
	var cPage = 1;
	var isLastData =false;
	var pageSize = 16;
	var cCategoryIdx = $('.tabmenuLink.on').attr('data-id');
	
	var resetVarInfo = function(){
		cPage = 1;
		isLastData = false;
		$('#mov_list_container').empty();
	}
	/**
	* 탭메뉴 버튼 클릭시 해당리스트 이벤트
	*/		
	
	channelonstatus = function(elem){
		$(".tabmenuLink").removeClass("on");	
		$(elem).addClass("on");
		cCategoryIdx = $(elem).data('id');
		resetVarInfo();
		
		reqProductListAjax();
		
		//changeProductList(idx);
	}
	
	changeProductList = function(idx){
		$("#mov_list_container").empty();
		cCategoryIdx = idx;		
		var productList = getProductListByIdx(idx);
		if(productList == null){return;}
		renderStatus(productList.getStatus());
		if(productList.getCurrentPage() == 0){
			reqProductListAjax(productList.getCurrentPage(), productList.getStatus(), productList.getCategoryIdx());	
		}
		else{
			renderProductList(productList.getProductList());	
		}		
	}
	
	getProductListByIdx = function(idx){
		var productList = categoryProductList.find(function(item){return item.getCategoryIdx() == idx;});
		if(productList == null){return null;}

		return productList;
	}
		
	initProductList = function(){
		var isFirst = true;
		for(var index = 0; index < listGnbMenu.length; index++){
			if(listGnbMenu[index].PRD_CTG_LEVEL == 1){
				if(isFirst){
					cCategoryIdx = listGnbMenu[index].PRD_CTG_IDX;
					isFirst = false;
				}
				var productList = new ProductList(listGnbMenu[index].PRD_CTG_IDX);
				categoryProductList.push(productList);
			}
		}
	}
	
    function chgSelectFn(){
    	//var productList = getProductListByIdx(cCategoryIdx);
    	//productList.setStatus($("#select1").val());
    	//productList.clearProductList();
    	//reqProductListAjax(productList.getCurrentPage(), productList.getStatus(), productList.getCategoryIdx());
    	
    	resetVarInfo();
    	reqProductListAjax();
    }
    
	$(document).ready(function(){
		
		/* reqProductListAjax(); */
		//initProductList();
		//var productList = getProductListByIdx(cCategoryIdx);
		//reqProductListAjax(productList.getCurrentPage(), productList.getStatus(), productList.getCategoryIdx());
		
		reqProductListAjax();
		
		$('.tabmenuLink').on('click', function(){
			console.log('...here..!!');
			channelonstatus(this)
		});
		
	});
	
    
    $(window).scroll(function(){
     	var maxHeight = $(document).height();
    	var currentScroll = $(window).scrollTop() + $(window).height();
    	if(maxHeight == currentScroll){
    		//var productList = getProductListByIdx(cCategoryIdx);
    		//reqProductListAjax(productList.getCurrentPage(), productList.getStatus(), productList.getCategoryIdx());
    		//alert("스크롤이벤트");
    		reqProductListAjax();
    	}
    		
    });
    
    var isReqAjax = false;
    function reqProductListAjax(){
    	
    	if(isReqAjax || isLastData) return;
    	
    	isLastData = true;
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/channelon/channelonListAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage, "orderType": $('#orderSelect option:selected').val(), "PRD_CTG_IDX" : cCategoryIdx},
    		success : function(data) {
    			
    			if(data.list.length < pageSize) isLastData = true;
    			
    			//addProductListData(data.list);
    			
    			renderProductList(data.list);
    			
    			cPage += data.list.length;
    			
    		}, error : function(err) {
    			alert("요청 실패");
    		}, complete : function() {
    			isReqAjax = false;
    		}
    	});
    }
    
    function addProductListData(productListData){
    	var productList = getProductListByIdx(cCategoryIdx);
    	if(productList == null){return ;}
    	productList.addProduct(productListData);
    	productList.setCurrentPage(productList.getCurrentPage()+1);
    	renderProductList(productListData);
    }
    
    function renderProductList(list){
    	
    	if(list == null){ return; }
    	
    	for(var idx =0; idx < list.length; idx++){
    		
    		
    		var html = "";
    			html += "<li>";
    			html += "	<a href=\"javascript:goPage('"+list[idx].CNT_MST_IDX+"');\" class=\"mov_thum_box\">";
//    			html += "	<img src=\""+list[idx].CMM_FLE_ATT_PATH+list[idx].CMM_FLE_SYS_NM+"\" alt=\""+list[idx].CMN_FLE_ALT_TXT+"\"></a>";
    			html += "	<img src=\"<c:out value="${cdnDomain}"/>"+list[idx].FILE_NM+"\" alt=\""+list[idx].CMN_FLE_ALT_TXT+"\"></a>";
		        html += "	<div class=\"sort_tag_area clearboth\">"; 
		        html += "		<span class=\"sort\">"+list[idx].BND_MST_BRAND_NM+"</span>"; 
				html += "		<span class=\"tag\">"+list[idx].TAG_MST_TITLE+"</span>";
				html += "	</div>";
				html += "	<p class=\"mov_title\">"+list[idx].CNT_MST_TITLE+"</p>";	
				html += "	<div class=\"btn_like_area\">";	
				html += "	<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].CNT_MST_IDX+"','TYPE_CHANNEL_ON')\" class=\"btn-like"+(list[idx].MY_LIKE == 'Y' ? " on" : "") +"\" title=\"좋아요\"><span id=\"likeCount\">"+list[idx].LIKE_COUNTS+"</span></button>";	
 				html += "	</div>";	
		        html += "</li>";
		    
		   		$("#mov_list_container").append(html);    		
		}
    }
    				
   	
    
    
   	renderStatus = function(status){
   		$("#select1").val(status);
   	}

    // 상세 페이지 이동
    goPage = function(idx){
    	var pageForm = $("#pageForm");
    	pageForm.find("input[name='CNT_MST_IDX']").val(idx);
    	pageForm.attr({"action":"/pc/channelon/channelonView.do", "target":"_self", "method":"post"}).submit();
    }
</script>