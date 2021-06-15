<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<script type="text/javascript" src="/nas/cdn/pc/js/clipboard.js"></script>

    <div id="container">
        <div id="content" class="content">

            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            
            <div class="sub_content">
                <div class="dim"></div>
                <div id="layer_benefit" class="layer type01">
                    <div class="layer_header">
                        <h2>공유하기</h2>
                    </div>
                    <div class="layer_content">
                        <!-- .socialshare -->
                        <div class="socialshare">
                            <ul class="socialshare_list clearboth">
                                <li><button type="button" onclick="goSellerPickFacebook()"   class="btn_socialshare_facebook">페이스북</button></li>
                                <li><button type="button" onclick="goSellerPickTwitter()"    class="btn_socialshare_twitter">트위터</button></li>
                                <li><button type="button" onclick="goSellerPickBand()"       class="btn_socialshare_band">밴드</button></li>
                                <li><button type="button" onclick="goSellerPickKakaoStory()" class="btn_socialshare_kakaostory">카카오스토리</button></li>
                                <input type="hidden" id="shareParam" name="shareParam" value="" />
                            </ul>
                            <div class="btn_wrap">
                                <button onclick="goProductCopyClipBoard()" class="btn_small">URL 복사</button>
                            </div>
                        </div>
                        <!-- // .socialshare -->
                    </div>
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
            </div>
            
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">셀러픽</h2>
            </div>
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl"><c:out value="${sellerpickInfo.CNT_MST_TITLE}"/></h3>
            </div>
            <div class="editor_content_wrap">
 
            <c:choose>
            	<c:when test="${sellerpickInfo.CNT_MST_DETAIL_TYPE eq 'I'}">
	            	<img src="<c:out value='${cdnDomain}${sellerpickInfo.CMM_FLE_ATT_PATH}${sellerpickInfo.CMM_FLE_SYS_NM }'/>" alt="<c:out value='${sellerpickInfo.CMN_FLE_ALT_TXT}'/>">
            	</c:when>
            	<c:when test="${sellerpickInfo.CNT_MST_DETAIL_TYPE eq 'S'}">

            	</c:when>
            	<c:when test="${sellerpickInfo.CNT_MST_DETAIL_TYPE eq 'E'}">

            	</c:when>
            </c:choose>

            </div>
            <c:if test="${sellerpickInfo.CNT_MST_DETAIL_TYPE eq 'E' }">
                <div id= "editHtml" style='display:none' ><c:out value="${sellerpickInfo.CNT_MST_PC_BANNER}" escapeXml="false" /></div>
                <script>
                   $('.editor_content_wrap').append($('#editHtml').html());
                </script>
            </c:if>

            <c:if test="${sellerpickInfo.CNT_MST_DETAIL_TYPE eq 'S' }">
            
                <div id= "scriptHtml" style='display:none' ><c:out value="${sellerpickInfo.CNT_MST_PC_SCRIPT}" escapeXml="false" /></div>
                <script>
                   $('.editor_content_wrap').append($('#scriptHtml').html());
                </script>
            </c:if>
                                    
            
            <div class="goods_util_box">
                <ul class="clearboth">
                    <li><button type="button" onclick="likeBtnEvent($(this),'${sellerpickInfo.CNT_MST_IDX }','${sellerpickInfo.CNT_MST_TYPE }' )"  
                    class="btn_circle like<c:if test='${sellerpickInfo.MY_LIKE eq "Y" }'> on</c:if>"><c:out value="${sellerpickInfo.LIKE_COUNTS }" /></button></li>
                    <li><button type="button" onclick="goSellerRoomPage('${sellerpickInfo.CNT_MST_IDX }')" class="btn_circle sellerroom">셀러룸</button></li>
                    <li><button type="button" onclick="showModal()" class="btn_circle social">공유하기</button></li>
                </ul>
            </div>
            <div class="pg_sub_tit_wrap clearboth mt200">
                <h3 class="pg_sub_tit fl">셀러픽 상품</h3>
            </div>
            <div class="sub_content product">
                <div class="search_product">
                    <div class="items pt20">
                        <p class="num" id="allProductCount">상품(0)</p>
                        <div class="select_box">
                            <button type="button" class="btn_detail set-srh"><span>상세검색</span></button>
                            <span class="select">
                                <select id="selectStatus" title="">
                                    <option value="new" selected>최근등록순</option>
                                    <option value="dwn" >가격 낮은순</option>
                                    <option value="up" >가격 높은순</option>
                                    <option value="hit" >판매량 많은순</option>
                                    <!-- <option value="review" >리뷰 많은순</option> -->
                                </select>
                            </span>
                        </div>
                    </div>
                    <div class="detail_search">
                        <div class="sch-box">
                            <div class="type_item">
                                <h3>사이즈</h3>
                                <div class="inner check">
                                    <ul>
                                    	<c:if test="${not empty sizeList }">
                                    		<c:forEach var="sizeItemRow" items="${sizeList }" varStatus="i">
		                                        <li>
		                                            <input name="searchSizeItem" data-value="${sizeItemRow.CMN_COM_IDX }" type="checkbox" id="size-${i.index }">
		                                            <label for="size-${i.index }"><span class="icon"></span><c:out value="${sizeItemRow.CMN_COM_NM }" /></label>
		                                        </li>
                                    		</c:forEach>
                                    	</c:if>
                                    </ul>
                                </div>
                            </div>
                            <div class="type_item">
                                <h3>가격</h3>
                                <div class="inner check">
                                    <ul>
                                        <li>
                                            <input name="searchPriceItem" type="checkbox" id="price-1">
                                            <label for="price-1"><span class="icon"></span>0 만원 ~ 1 만원</label>
                                        </li>
                                        <li>
                                            <input name="searchPriceItem" type="checkbox" id="price-2">
                                            <label for="price-2"><span class="icon"></span>1 만원 ~ 3 만원</label>
                                        </li>
                                        <li>
                                            <input name="searchPriceItem" type="checkbox" id="price-3">
                                            <label for="price-3"><span class="icon"></span>3 만원 ~ 5 만원</label>
                                        </li>
                                        <li>
                                            <input name="searchPriceItem" type="checkbox" id="price-4">
                                            <label for="price-4"><span class="icon"></span>5 만원 ~ 10 만원</label>
                                        </li>
                                        <li>
                                            <input name="searchPriceItem" type="checkbox" id="price-5">
                                            <label for="price-5"><span class="icon"></span>10 만원 ~ 15 만원</label>
                                        </li>
                                        <li>
                                            <input name="searchPriceItem" type="checkbox" id="price-6">
                                            <label for="price-6"><span class="icon"></span>15 만원 이상</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="type_item">
                                <h3>색상</h3>
                                <div class="inner color_pick">
                                    <ul>
	                                	<c:if test="${not empty colorList }">
	                                		<c:forEach var="colorItemRow" items="${colorList }" varStatus="i">
		                                        <li>
		                                            <input type="checkbox" id="color-${i.index }">
		                                            <label for="color-${i.index }">
		                                                <span name="searchColorItem" class="color" data-id="color-${i.index }" data-value="${colorItemRow.CMN_COM_IDX }" data-color="${colorItemRow.CMN_COM_ETC2 }" 
		                                                style="background-color:<c:out value='${colorItemRow.CMN_COM_ETC2 }' />"><c:out value="${colorItemRow.CMN_COM_ETC1 }" /></span>
		                                            </label>
		                                        </li>
	                                		</c:forEach>
	                                	</c:if>
                                    </ul>
                                </div>
                            </div>
                            <div class="select_item">
                                <ul id="selectItemAddContainner">
                                </ul>
                            </div>
                            <div class="btn_wrap">
                                <button onclick="removeSelectedItemUIAll()" class="btn_large gray">초기화</button>
                                <button onclick="keywordSearch()" class="btn_large ok">적용</button>
                            </div>
                        </div>
                    </div>
                    <div class="new_goods_wrap">
                        <!-- .goods_list -->
                        <ul class="new_goods_list clearboth" id="productItemContainner" >
                        </ul>
                        <!-- // .goods_list -->
                    </div>
                </div>
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>
    <!--// Content -->
    
<form id="mainForm" name="mainForm" method="post">
	<input type="hidden" id="IDX" name="IDX" value="" />
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>

	var cPage = 1;
	var pageSize = 16;
	var isLastData =false;
	var status = "new";
	var idx = "${param.CNT_MST_IDX }"
	var selectSearchItems = {"searchPrice":[]};
	
	var resetCommonParamVar = function(){
		cPage = 1;
		isLastData = false;
		productItemContainner.empty();
	}
	
	$(function(){
		UiBind();
		
		reqSellerpickProductListAjax();
		
		// 상세검색  사이즈 checkbox 이벤트
		$("input[name='searchSizeItem']").on("change", function(){
			if(this.checked){
				//addSearchObj(this.id, this.dataset.value);
				addSelectSearchItemUi(this.id, this.nextElementSibling.innerText, "");
			}else{
				//removeSearchObj(this.id);
				removeSelectSearchItemUi(this.id);
			}
		});
		
		// 상세검색 프라이스 checkbox 이벤트
		$("input[name='searchPriceItem']").on("change", function(){
			if(this.checked){
				addStartEndPrice(this.id);
				addSelectSearchItemUi(this.id, this.nextElementSibling.innerText, "");
			}
			else{
				removeStartEndPrice(this.id);
				removeSelectSearchItemUi(this.id);
			}
		});	
		
		$("span[name='searchColorItem']").on("click", function(){
			if(this.dataset.value == "1142" || this.dataset.value == "3009" || this.dataset.value == "3012"){
				$(this).addClass("contrast")
			}
			if(this.classList.contains("on")){
				addSelectSearchItemUi(this.dataset.id, this.innerText, this.dataset.color);
				//addSearchObj(this.dataset.id, this.dataset.value);
			}else{
				removeSelectSearchItemUi(this.dataset.id);
				//removeSearchObj(this.dataset.id);
			}
		})
		
		$("#selectStatus").on("change", function(){
			status = this.value;
			resetCommonParamVar();
			reqSellerpickProductListAjax();
		});
		
	});
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight == currentScroll){
			reqSellerpickProductListAjax();
		}
	});
	 
	var selectItemAddContainner;
	var selectCheckSizeBoxes;
	var selectCheckPriceBoxes;
	var selectCheckColorBoxes;
	var allProductCount;
	var productItemContainner;
	var selectStatus;
	var mainForm;
	
	UiBind = function(){
		allProductCount = $("#allProductCount");
		productItemContainner = $("#productItemContainner");
		selectStatus = $("#selectStatus");
		mainForm = $("#mainForm");
		selectItemAddContainner = $("#selectItemAddContainner");
		selectCheckColorBoxes = $(".color");
		selectCheckSizeBoxes = $("input[name='searchSizeItem']");
		selectCheckPriceBoxes = $("input[name='searchPriceItem']");
	}
	
	addSearchObj = function(id, value){
		var obj = {}
		obj.id = id;
		obj.value = value;
		if(obj == null){ return; }
		if(id.indexOf("size") > -1){
			selectSearchItems.searchSize.push(obj);
		}else{
			selectSearchItems.searchColor.push(obj);
		}
	}
	
	removeSearchObj = function(id){
		if(id.indexOf("size") > -1){
			var item = selectSearchItems.searchSize.find(function(item){return item.id == id;});
			var index = selectSearchItems.searchSize.indexOf(item);
			if(index > -1){
				selectSearchItems.searchSize.splice(index, 1);
			}
		}else{
			var item = selectSearchItems.searchColor.find(function(item){return item.id == id;});
			var index = selectSearchItems.searchColor.indexOf(item);
			if(index > -1){
				selectSearchItems.searchColor.splice(index, 1);
			}
		}
	}
	
	addStartEndPrice = function(id){
		var startEndPrice = getStartEndPriceById(id);
		if(startEndPrice == null){return;}
		selectSearchItems.searchPrice.push(startEndPrice);
	}
	
	removeStartEndPrice = function(id){
		var item = selectSearchItems.searchPrice.find(function(item){return item.id == id;});
		var index = selectSearchItems.searchPrice.indexOf(item);
		if(index > -1){
			selectSearchItems.searchPrice.splice(index, 1);
		}
	}
	
	getStartEndPriceById = function(id){
		var startEndPrice = {};
		startEndPrice.startPrice = 0;
		startEndPrice.endPrice = 0;
		startEndPrice.id = id;
		switch(id){
			case "price-1":{
				startEndPrice.startPrice = 0;
				startEndPrice.endPrice = 10000;
				break;
			}
			case "price-2":{
				startEndPrice.startPrice = 10000;
				startEndPrice.endPrice = 30000;
				break;
			}
			case "price-3":{
				startEndPrice.startPrice = 30000;
				startEndPrice.endPrice = 50000;
				break;
			}
			case "price-4":{
				startEndPrice.startPrice = 50000;
				startEndPrice.endPrice = 100000;
				break;
			}
			case "price-5":{
				startEndPrice.startPrice = 100000;
				startEndPrice.endPrice = 150000;
				break;
			}
			case "price-6":{
				startEndPrice.startPrice = 150000;
				startEndPrice.endPrice = 9999999999999999;
				break;
			}
		}
		return startEndPrice;
		
	}
	
	getSearchInputItem = function(){
		var checkedList = $("input[name='searchSizeItem']:checked");
		var filterData = [];
		for(var index = 0; index < checkedList.length; index++){
			filterData.push(checkedList[index].dataset.value);
		}
		return filterData;
	}
	
	getSearchClassItem = function(){
		var checkedList = $("span[name='searchColorItem'].on");
		var filterData = [];
		for(var index = 0; index < checkedList.length; index++){
			filterData.push(checkedList[index].dataset.value);
		}
		return filterData;
	}
	
	var test1;
    var isAjaxing = false;
	// 셀러픽 상세 상품리스트 호출
	reqSellerpickProductListAjax = function (){
    	
		if(isAjaxing || isLastData){ return; }
		isAjaxing = true;
		
		var arrSearchSize = getSearchInputItem();
		var arrSearchColor = getSearchClassItem();
		
		test1 = arrSearchColor ;
		
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/sellerpick/sellerpickProductAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage,
    					"CNT_MST_IDX" : idx, 
    					"orderType": status,
    					"searchSize": JSON.stringify(arrSearchSize),
    					"searchPrice": JSON.stringify(selectSearchItems.searchPrice),
    					"searchColor": JSON.stringify(arrSearchColor)
    					},
    		success : function(data) {
    			
    			if(data.sellerpickProductList.length < pageSize) isLastData = true;
    			
    			allProductCount.html("상품("+data.totalCount+")");
    			renderProductList(data.sellerpickProductList);
    			
    			cPage += data.sellerpickProductList.length;
    			
    			isAjaxing = false;
    		}, error : function(err) {
    			alert("요청 실패");
    			isAjaxing = false;
    		}
    	});
    }

	renderProductList = function(list){
		
		if(list == null){ return; }
		
		for(var idx = 0; idx < list.length; idx++){
			var html = "";
			html = "<li>";
			html += "	<span class=\"flag_video\">video</span>"
			html +=	"	<div class=\"goods_info_wrap\">";
			html += "		<a href=\"<c:out value='${frontDomain }'/>/pc/product/productView.do?PRD_MST_CD="+list[idx].PRD_MST_CD+"\" target=\"_blank\">";		
			html += "			<div class=\"img_thum_wrap\">";

			var img1 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_IMAGE; //curData.PRD_IMAGE
			var img2 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_ROLL_OVER_IMG; //curData.PRD_ROLL_OVER_IMG
			
			html += "				<div class=\"img_thum_inner crop\" style=\"background-image:url("+img1+");\"></div>";
			html += "				<div class=\"img_thum_inner crop\" style=\"background-image:url("+img2+");\"></div>";
			html += "				<ul class=\"color_list\">";
			if(list[idx].CNT_PRD_COLOR.length > 0){
				for (var coloridx = 0; coloridx < list[idx].CNT_PRD_COLOR.length ; coloridx++){
					html +=	"<li><span style=\"background:"+list[idx].CNT_PRD_COLOR[coloridx].CNT_PRD_COLOR+";\">"+list[idx].CNT_PRD_COLOR[coloridx].CMN_COM_NM+"</span></li>";
				}
			}
			html += "				</ul>";
			html += "			</div>";
			html +=	"			<div class=\"sort_tag_area clearboth\">";
			html += "				<span class=\"sort\">"+list[idx].PRD_MST_BRAND_NM+"</span>";	
			html += "				<span class=\"tag\">"+list[idx].TAG_MST_TITLE+"</span>";
			html += "			</div>";
			html += "			<p class=\"goods_title\">"+(list[idx].PRD_MST_NM.length < 45 ? list[idx].PRD_MST_NM : list[idx].PRD_MST_NM.substring(0, 45)+"...")+"</p>";	
			html += "			<div class=\"goods_cost_info\">";
			html += "				<span class=\"dc_before_cost\">￦"+GetNumberFormat(list[idx].PRD_MST_PRC)+"</span>";
			html += "				<strong class=\"clearboth\">";	
			html +=	"					<span class=\"goods_cost\">￦"+GetNumberFormat(list[idx].PRD_MST_DSP_PRC)+"</span>";
			html +=	"					<em class=\"dc_percent\">"+list[idx].PRD_SALE_RATE+"%</em>";
			html += "				</strong>";
			html +=	"			</div>";
			html +=	"		</a>";
			html +=	"		<div class=\"btn_like_area\">";
			html +=	"			<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].CNT_PRD_MST_CD+"','TYPE_PRODUCT')\" class=\"btn-like"+(list[idx].MY_LIKE.indexOf("Y") > -1 ? " on" : "")+"\" title=\"\"><span>"+list[idx].LIKE_COUNT+"</span></button>";
			html +=	"		</div>";
			html +=	"	</div>";
			html +=	"</li>";
			
			productItemContainner.append(html);
		}
    
	}
	// 상세검색  UI item 추가
	addSelectSearchItemUi = function(id, title, color){
		var html = "<li id=\"selectedItem_"+id+"\">";
		if(color == ""){
        	html += "	<strong>"+title+"</strong>";
		}else{
            html += "	<span class=\"color select_item\" data-color="+color+" style=\"background-color:"+color+"\">"+title+"</span>";
		}
        	html += "	<button type=\"button\" onclick=\"removeSelectSearchItemUi('"+id+"')\" class=\"btn-del\"><span>삭제</span></button>";
    		html += "</li>";
    	
   		selectItemAddContainner.append(html);
	}
	
	// 상세검색  UI item 삭제
	removeSelectSearchItemUi = function(id){
		$("#selectedItem_"+id).remove();
		$("#"+id).prop("checked", false);
		$("span[data-id='"+id+"']").removeClass("on");
		//removeSearchObj(id);
	}
	
	// 상세검색 UI 초기화
	removeSelectedItemUIAll = function(){
		selectItemAddContainner.empty();
		selectCheckSizeBoxes.each(function(){
			$(this).prop("checked", false);
		});
		selectCheckPriceBoxes.each(function(){
			$(this).prop("checked", false);
		});
		selectCheckColorBoxes.each(function(){
			$(this).removeClass("on");
		});
		selectSearchItems = {"searchPrice":[]};
		
		resetCommonParamVar();
		reqSellerpickProductListAjax();
	}

	// 셀러룸 이동
	goSellerRoomPage = function(idx){
		mainForm.find("input[name='IDX']").val(idx);
		mainForm.attr({'action':'<c:out value="${serverSslDomain}" />/pc/sellerroom/sellerroomHome.do','method':'post'}).submit();
	}
	
    // 모달 팝업
    showModal = function(){
		var propertyValueObj = {"top" : "50%" ,"left" : "50%" ,"margin" : "-260px 0 0 -260px"};
		$("#layer_benefit").css(propertyValueObj);
		$("#layer_benefit").show();
    }
    
	// TODO URL 복사 구현중
	goProductCopyClipBoard = function () {

		var url = document.location.href;
		
		var clipboard = new ClipboardJS('#shareUrl', {
			text: function() {
				alert('클립보드에 복사하였습니다');
				return url;
			}
		});
		/*var paramUrl = $("#shareUrl");
		paramUrl.val("text");
		paramUrl.select();
		document.execCommand("copy");
		alert("링크 복사가 완료되었습니다.");*/ 
	}
	
	// 상세 검색 적용 버튼 클릭
	keywordSearch = function(){
		resetCommonParamVar();
		reqSellerpickProductListAjax();
	}
	

    // TODO URL 복사 구현중
	goProductCopyClipBoard = function () {
		  var t = document.createElement("textarea");
		  document.body.appendChild(t);
		  t.value = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do?CNT_MST_IDX=${param.CNT_MST_IDX }";
		  t.select();
		  document.execCommand('copy');
		  document.body.removeChild(t);    	
		  alert("링크 복사가 완료되었습니다."); 
	};
	
	// TODO sns kakostory 구현중
	goSellerPickKakaoStory = function(){
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do?CNT_MST_IDX=${param.CNT_MST_IDX }";
		var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 
	    window.open(url,'kakoStory','toolbar=0,status=0,width=1024,height=665'); 
	};
	
	// TODO sns Twitter 구현중
	goSellerPickTwitter = function(){
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do?CNT_MST_IDX=${param.CNT_MST_IDX }";
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent("<c:out value="${sellerpickInfo.CNT_MST_TITLE}" />");
		window.open("https://twitter.com/share?url="+url+"&text="+text, "twitter", "width=650, height=400");
	};
	
	// TODO sns facebook 구현중
	goSellerPickFacebook = function() {
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do?CNT_MST_IDX=${param.CNT_MST_IDX }";
	    var text = encodeURIComponent("<c:out value="${sellerpickInfo.CNT_MST_TITLE}" />");
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    window.open(url,'faceBook','toolbar=0,status=0,width=1024,height=665'); 
	};
	
	goSellerPickBand= function() {
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do?CNT_MST_IDX=${param.CNT_MST_IDX }";
	    var title = '<c:out value="${sellerpickInfo.CNT_MST_TITLE}"/>';	    
	    var url = 'http://band.us/plugin/share?body=' +encodeURIComponent(paramUrl)+'\\n' + encodeURIComponent(title) +'&route=www.shinwonmall.com' ;
	    window.open(url,'band','toolbar=0,status=0,width=1024,height=665');
	    
	};
	
	
	// 셀러픽 - 테마전시배너
	sellerPicBanner = function(){
        $('.seller_recom_goood_area').find('li:odd').find('dl').removeClass('pos_top');
        $('.seller_recom_goood_area').find('li:odd').find('dl').addClass('pos_bottom');
	};	
	
	
</script>