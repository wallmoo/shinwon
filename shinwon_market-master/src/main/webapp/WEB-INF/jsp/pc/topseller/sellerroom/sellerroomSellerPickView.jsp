<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>


<title>Insert title here</title>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">
        
         	<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
         
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

		   	<%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>
            
        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_right">
        	</c:if>

            <!-- .pg_sub_tit_wrap -->
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl">${sellerpickInfo.CNT_MST_TITLE}</h3>  
            </div>
            <!-- // .pg_sub_tit_wrap -->
            <!-- .editor_content_wrap -->
            <div class="editor_content_wrap">
                <p style="text-align:center;font-size:50px;color:#fff;padding-top:450px;">
                ${sellerpickInfo.CNT_MST_DESC}
                </p>
            </div>
            <div class="goods_util_box">
                <ul class="clearboth">
                    <li>
	                    <button type="button" class="btn_circle like ${sellerpickInfo.MY_LIKE_CLS }"
	                    onclick="javascript:likeBtnEvent($(this), '${sellerpickInfo.CNT_MST_IDX }', 'TYPE_TOP_SELLER')">
	                    ${sellerpickInfo.LIKE_COUNTS }
	                    </button>
                    </li>
                                    
                    <li><button type="button" onclick="javascript:goPage('${sellerpickInfo.VDR_MST_IDX }')" class="btn_circle sellerroom">셀러룸</button></li>
                    <li><button type="button" class="btn_circle social">공유하기</button></li>
                </ul>
            </div>
            <!-- // .editor_content_wrap -->

            <div class="sub_content product">

                <div class="search_product">
                    <div class="items">
                        <p class="num" id="allProductCount">판매 (0)</p>
                        <div class="select_box">
                            <button type="button" class="btn_detail set-srh"><span>상세검색</span></button>
                            <span class="select">
                                <select id="sel_ord_type" title="">
                                    <option value="new" selected="selected">최근등록순</option>
                                    <option value="dwn" >가격 낮은순</option>
                                    <option value="up" >가격높은순</option>
                                    <option value="hit" >판매량 많은순</option>
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

										<!-- .new_goods_wrap -->
		                <div class="new_goods_wrap">
		                	<ul id="productItemContainner" class="new_goods_list clearboth">
		                    </ul>
		                </div>
		                <!-- // .new_goods_wrap -->
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

<form id="pageForm" name="pageForm">
	<input type="hidden" id="VDR_MST_IDX" name="VDR_MST_IDX" value="">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>
<script>

var cPage = 1;
var cIsLast = false;
var pageSize = 16;

var status = "new";
var VDR_MST_IDX = "${commandMap.VDR_MST_IDX }"
	
var selectSearchItems = {"arrSearchPrice":[]};
var arrSearchPrice;
var selectItemAddContainner;
var selectCheckSizeBoxes;
var selectCheckPriceBoxes;
var selectCheckColorBoxes;
var allProductCount;
var productItemContainner;

resetPageParam = function() {
	cPage = 1;
	cIsLast = false;
}	

//사이즈체크
getsearchSizeItem = function(){
	var checkedList = $("input[name='searchSizeItem']:checked");
	var filterData = [];
	for(var index = 0; index < checkedList.length; index++){
		filterData.push(checkedList[index].dataset.value);
	}
	return filterData;
}

//컬러체크
getsearchColorItem = function(){
	var checkedList = $("span[name='searchColorItem'].on");
	var filterData = [];
	for(var index = 0; index < checkedList.length; index++){
		filterData.push(checkedList[index].dataset.value);
	}
	return filterData;
}

UiBind = function(){
	allProductCount = $("#allProductCount");
	productItemContainner = $("#productItemContainner");
	selectStatus = $("#selectStatus");
	selectItemAddContainner = $("#selectItemAddContainner");
	selectCheckSizeBoxes = $("input[name='searchSizeItem']");
	selectCheckPriceBoxes = $("input[name='searchPriceItem']");
	selectCheckColorBoxes = $("span[name='searchColorItem']");
}


$(function(){
	
	UiBind();
	
	
	// 상세검색  size checkbox 이벤트
	$("input[name='searchSizeItem']").on("change", function(){
		if(this.checked){
			//addSearchObj(this.id, this.dataset.value);
			addSelectSearchItemUi(this.id, this.nextElementSibling.innerText, "");
		}else{
			//removeSearchObj(this.id);
			removeSelectSearchItemUi(this.id);
		}
	});
	
	// 상세검색 color checkbox 이벤트
	$("span[name='searchColorItem']").on("click", function(){
		if(this.dataset.value == "1142" || this.dataset.value == "3009" || this.dataset.value == "3012"){
			$(this).addClass("contrast");
		}
		if(this.classList.contains("on")){
			addSelectSearchItemUi(this.dataset.id, this.innerText, this.dataset.color);
			//addSearchObj(this.dataset.id, this.dataset.value);
		}else{
			removeSelectSearchItemUi(this.dataset.id);
			//removeSearchObj(this.dataset.id);
		}
	});
	
	//가격 체크이벤트
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
	
	addStartEndPrice = function(id){
		var startEndPrice = getStartEndPriceById(id);
		if(startEndPrice == null){return;}
		selectSearchItems.arrSearchPrice.push(startEndPrice);
	}
	
	removeStartEndPrice = function(id){
		var item = selectSearchItems.arrSearchPrice.find(function(item){return item.id == id;});
		var index = selectSearchItems.arrSearchPrice.indexOf(item);
		if(index > -1){
			selectSearchItems.arrSearchPrice.splice(index, 1);
		}
	}
	
	getStartEndPriceById = function(id){
		var startEndPrice = {};
		startEndPrice.min = 0;
		startEndPrice.max = 0;
		startEndPrice.id = id;
		switch(id){
			case "price-1":{
				startEndPrice.min = 0;
				startEndPrice.max = 10000;
				break;
			}
			case "price-2":{
				startEndPrice.min = 10000;
				startEndPrice.max = 30000;
				break;
			}
			case "price-3":{
				startEndPrice.min = 30000;
				startEndPrice.max = 50000;
				break;
			}
			case "price-4":{
				startEndPrice.min = 50000;
				startEndPrice.max = 100000;
				break;
			}
			case "price-5":{
				startEndPrice.min = 100000;
				startEndPrice.max = 150000;
				break;
			}
			case "price-6":{
				startEndPrice.min = 150000;
				startEndPrice.max = 9999999999999999;
				break;
			}
		}
		return startEndPrice;
	}
	
	removeSelected = function(){
		$(".icon").each(function(){
			$(this).removeClass("on");
		});
		$("input[name='search_category']:checked").each(function(){
			$(this).prop("checked", false);
		});
		initBrandListWithGroup(brandListOrigin);
	}
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		
		if(maxHeight <= currentScroll){
			reqProductListAjax();
		}
	});
	
	
	reqProductListAjax();
});


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
	
	selectSearchItems.arrSearchPrice = [];
	
	resetPageParam();
	reqProductListAjax();
}

//상세검색 적용
keywordSearch = function() {
	resetPageParam();
	reqProductListAjax();
};
$("#sel_ord_type").on("change", function () {
	resetPageParam();
	reqProductListAjax();
});

var isAjaxing = false;
reqProductListAjax = function (){
	
	
	if(isAjaxing || cIsLast){ return; }
	isAjaxing = true;
	
	if(cPage == 1)
		productItemContainner.empty();
	
	
	var arrSearchSize = getsearchSizeItem();
	var arrSearchColor = getsearchColorItem();
	var searchOptionYN = "N";
	var lastList = $(".new_goods_list clearboth").attr("#productItemContainner");
	
	if(arrSearchColor.length > 0 || arrSearchSize.length > 0){
		searchOptionYN = "Y";
	}
	
	var curOrderType = $('#sel_ord_type option:selected').val();
	var curParamData = {"cPage" : cPage,
			"VDR_MST_IDX" : VDR_MST_IDX, 
			"orderType": curOrderType,
			"pageSize" : pageSize,
			//"arrSearchBrand": JSON.stringify(arrSearchBrand),
			"arrSearchSize": JSON.stringify(arrSearchSize),
			"arrSearchPrice": JSON.stringify(selectSearchItems.arrSearchPrice),
			"arrSearchColor": JSON.stringify(arrSearchColor),
			"searchOptionYN": searchOptionYN
			};		
	
	ShowLoading(true);
	
	$.ajax({
		type	: "POST",
		url		: "/pc/topseller/sellerroom/sellerroomSellerPickProductListAjax.do",
		dataType: "json",
		data	: curParamData,
		success : function(data) {

			if(data.productList.length < pageSize)  cIsLast = true;
			
			//cPage++;
			
			//console.log(data);
			/* $("#productItemContainner").empty(); */
			allProductCount.html("상품("+data.totalCount+")");
			renderProductList(data.productList);
			cPage += data.productList.length;
			
		}, error : function(err) {
			alert("요청 실패");
	
		}, complete : function(){
			ShowLoading(false);
			isAjaxing = false;
		}
	});
}

var ItemHTML = ''; 
ItemHTML += '                            <li>';
ItemHTML += '                                <span class="flag_video">video</span>';
ItemHTML += '                                <a href="/pc/product/productView.do?PRD_MST_CD={prd_cd}" target="_blank">';
ItemHTML += '                                    <div class="img_thum_wrap">';
ItemHTML += '                                        <div class="img_thum_inner crop" style="background-image:url({imagurl});"></div>';
ItemHTML += '                                        <div class="img_thum_inner crop" style="background-image:url({imagurlover});"></div>';
ItemHTML += '                                        <ul class="color_list">{color_list}</ul>';
ItemHTML += '                                    </div>';
ItemHTML += '                                    <div class="sort_tag_area clearboth">';
ItemHTML += '                                        <span class="sort">{brand}</span>';
ItemHTML += '                                        <span class="tag">{tag}</span>';
ItemHTML += '                                    </div>';
ItemHTML += '                                    <p class="goods_title">{title}</p>';
ItemHTML += '                                    <div class="goods_cost_info">';
ItemHTML += '                                        <span class="dc_before_cost">￦{price01}</span>';
ItemHTML += '                                        <strong class="clearboth">';
ItemHTML += '                                            <span class="goods_cost">￦{price02}</span>';
ItemHTML += '                                            <em class="dc_percent">{percent}%</em>';
ItemHTML += '                                        </strong>';
ItemHTML += '                                    </div>';
ItemHTML += '                                </a>';
ItemHTML += '                                <div class="btn_like_area">';
ItemHTML += '                                    <button type="button" class="btn-like {like_cls}" title="좋아요" data-prdcd="{prd_cd}"><span>{like}</span></button>';
ItemHTML += '                                </div>';
ItemHTML += '                            </li>';


var colorHTML = '';
colorHTML += '<li><span style="background:{data};">{name}</span></li>';


renderProductList = function(list){
	
	
	/* $("#productItemContainner").empty(); */
	if(list == null || list.length <= 0){
		cIsLast = true;
		return; 
	}
	
	for(var idx = 0; idx < list.length; idx++){
		
		var curData = list[idx];
		
		var img1 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_IMAGE; //curData.PRD_IMAGE
		var img2 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_ROLL_OVER_IMG; //curData.PRD_ROLL_OVER_IMG

		var colorHtml = '';

		for (var coloridx = 0; coloridx < curData.CNT_PRD_COLOR.length ; coloridx++){
			colorHtml += colorHTML.replace('{data}', curData.CNT_PRD_COLOR[coloridx].CNT_PRD_COLOR)
									.replace('{name}', curData.CNT_PRD_COLOR[coloridx].CMN_COM_NM)
		}

		var curHTML = ItemHTML.replace('{imagurl}', img1).replace('{imagurlover}', img2)
							.replace('{color_list}', colorHtml)
							.replace('{brand}', curData.PRD_MST_BRAND_NM).replace('{tag}', GetNumberFormat(curData.TAG_MST_TITLE))
							.replace('{title}', curData.PRD_MST_NM)
							.replace('{price01}', curData.PRD_MST_PRC).replace('{price02}', GetNumberFormat(curData.PRD_NOW_DST_PRICE))
							.replace('{percent}', GetNumberFormat(((curData.PRD_MST_PRC-curData.PRD_NOW_DST_PRICE)/curData.PRD_MST_PRC * 100).toFixed(0)) )
							.replace('{like}', curData.LIKE_COUNTS)
							.replace('{like_cls}', curData.MY_LIKE == 'Y' ? 'on' : '')
							.replace(/{prd_cd}/ig, curData.PRD_MST_CD);
							
	
		productItemContainner.append(curHTML);
			
	}
	
	$('.btn-like', productItemContainner).off('click').on('click', function(){
		var $thisElm = $(this);
			
		likeBtnEvent($thisElm, $thisElm.attr('data-prdcd'),'TYPE_PRODUCT');
	});
	
}

goPage = function(pIdx){
	var pageForm = $("#pageForm");
	$('#VDR_MST_IDX').val(pIdx);
	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/sellerroomHome.do", "target":"_self", "method":"post"}).submit();
}
</script>
