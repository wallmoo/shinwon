<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<title>쑈윈도 | 여성중카테고리</title>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                 <div class="tit_wp">
                     <p class="ct_tit2" id="allProductCount">상품 (0)</p>
                     <div class="board_right">
                         <select id="sel_ord_type" title="상품정렬">
                             <option value="new" selected>			최근등록순</option>
                              <option value="dwn">		  			가격 낮은순</option>
                              <option value="up">					가격높은순</option>
                              <option value="hit "> 				판매량 많은순</option>
                         </select>
                         <button type="button" class="b_filter" onclick="">필터</button>
                     </div>
                 </div>
                 
                 <ul class="goods_list dual" id="productItemContainner">
                 </ul>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
    
   <script type="text/javascript">
    $(".set_tag").mCustomScrollbar({
        axis:"x",
        advanced:{
            autoExpandHorizontalScroll:true
        }
    });
</script>         
        
        <form id="linkForm" name="linkForm">
		<input type="hidden" id="PRD_CTG_IDX" name="PRD_CTG_IDX" value='' />
		<input type="hidden" id="cPage" name="cPage" value='${commandMap.cPage }' />
		<input type="hidden" id="PRD_MST_CD" name="prdMstCd" value=''/>
		<input type="hidden" id="PRD_MST_TYPE" name="PRD_MST_TYPE" value=''/>
		</form>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script>
	var cPage = 1;
	var PRD_CTG_IDX = "${param.idx }"
	var selectSearchItems = {"arrSearchPrice":[]};
	var arrSearchPrice;
	var selectItemAddContainner;
	var selectCheckSizeBoxes;
	var selectCheckPriceBoxes;
	var selectCheckColorBoxes;
	var allProductCount;
	var productItemContainner;
	
	
	$("#sel_ord_type").on("change", function () {
		productItemContainner.empty();
		reqProductListAjax(1);
	});
	
	//브랜드체크
	getSearchBrandList = function(){
		var checkedList = $("input[name='searchBrandList']:checked");
		var filterData = [];
		for(var index = 0; index < checkedList.length; index++){
			filterData.push(checkedList[index].value);
		}
		return filterData;
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
		selectCheckBrandBoxes = $("input[name='searchBrandList']");
		selectCheckSizeBoxes = $("input[name='searchSizeItem']");
		selectCheckPriceBoxes = $("input[name='searchPriceItem']");
		selectCheckColorBoxes = $("span[name='searchColorItem']");
	}
	
	$(function(){
		UiBind();
		
		reqProductListAjax(cPage);
	
		// 카테고리 checkbox UI
		$("input[name='searchBrandList']").on("change", function(){
			if(this.checked){
				//addSearchObj(this.id, this.dataset.value);
				addSelectSearchItemUi(this.id, this.nextElementSibling.innerText, "");
			}else{
				//removeSearchObj(this.id);
				removeSelectSearchItemUi(this.id);
			}
		});
	
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
		selectCheckBrandBoxes.each(function() {
			$(this).prop("checked", false);
		});
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
		
		reqProductListAjax(1);
	}
	
	//상세검색 적용
	keywordSearch = function() {
		reqProductListAjax(1);
	};
	
	$("#sel_ord_type").on("change", function () {
		productItemContainner.empty();
		reqProductListAjax(1);
	});
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			reqProductListAjax(cPage);
		}
	});
	
	var isAjaxing = false;
	// 셀러픽 상세 상품리스트 호출
	reqProductListAjax = function (cPage){
		
		
		if(isAjaxing){ return; }
		isAjaxing = true;
		if(cPage == 1)
			productItemContainner.empty();
		var OrderType = $('#sel_ord_type option:selected').val();
		var lastList = $(".goods_list dual").attr("#productItemContainner");
		
		$.ajax({
			type	: "POST",
			url		: "/mobile/product/productListAjax.do",
			dataType: "json",
			data	: {	"cPage" : cPage,
						"PRD_CTG_IDX" : PRD_CTG_IDX 
						

						},
			success : function(data) {
				console.log(data);
				allProductCount.html("상품("+data.totalCount+")");
				renderProductList(data.productList);
    			cPage++;
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
			html += "		<a href=\"<c:out value='${frontDomain }'/>/pc/product/product.do?PRD_CTG_IDX=<c:out value='"+list[idx].PRD_MST_CD + list[idx].PRD_MST_TYPE+"' />&cateIdx=<c:out value="${cateIdx }" />\">";		
			html += "			<div class=\"thum_img\">";
			//html += " <img src="\nas/cdn/images/_temp/img_thum_dual.jpg\">";
			html += "	</div>";
			html += "<div class=\"thum_info_txt\">";
			html += "<div class=\"sort_tag_area clearboth\">";
			html += "<span class=\"sort\">SIEG</span>";
			html += "<span class=\"tag\">#탑셀러상품</span>";
			html += "</div>";
			html += "<p class=\"goods_title\">겨울 한정 판매 봄을 맞이하는 여성스러운 원피스</p>";
			html += "<div class=\"goods_cont_wp\">";
			html += "<div class=\"goods_cost_info\">";
			html += "<span class=\"dc_before_cost\">1,000,000</span>";
			html += "<div class=\"dc_after_cost\">";
			html += "<span class=\"dc_percent\"><strong>50</strong>%</span><span class=\"goods_cost\"><strong>500,000</strong>원</span>";
			html += "</div>";
			html += "</div>";
			html += "</div>";
			html += "</div>";
			html += "</a>";
			html += "<div class=\"btn_goods_area\">";
			html +=	"			<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].PRD_MST_CD+"','TYPE_PRODUCT')\" class=\"btn-like"+(list[idx].MY_LIKE.indexOf("Y") > -1 ? " on" : "")+"\" title=\"\"><span>"+list[idx].LIKE_COUNT+"</span></button>";
			html += "</div>";
			html += "</li>";
			
			productItemContainner.append(html);
		}
	
	}
	
</script>
