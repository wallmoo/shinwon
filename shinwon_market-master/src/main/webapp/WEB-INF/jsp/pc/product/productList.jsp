<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<title>쑈윈도 | 중카테고리</title>
<!-- Content -->
    <div id="container"><p class="goods_title">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">${NOW_CATEGORY_NAME }</h2>
            </div>
            <!--// Title -->

            <div class="sub_content product">
                <div class="search_product">
                    <div class="items pt0">
                        <p class="num" id="allProductCount">상품 (0)</p>
                        <div class="select_box">
                            <button type="button" class="btn_detail set-srh"><span>상세검색</span></button>
                            <span class="select">
                                <select id="sel_ord_type" title="">
                                    <option value="new" selected>최근등록순</option>
                                    <option value="dwn">가격 낮은순</option>
                                    <option value="up">가격높은순</option>
                                    <option value="hit">판매량 많은순</option>
                                </select>
                            </span>
                        </div>
                    </div>
                    <div class="detail_search">
                        <div class="sch-box">
                            <div class="type_item">
                                <h3>브랜드</h3>
                                <div class="inner">
                                    <div class="sch-list mCustomScrollbar" tabindex="0">
                                        <div class="sch-list-inner">
                                            <ul>
	                                        	<c:if test="${not empty brandList}">
	                                        		<c:forEach var="brandListRow" items="${brandList }" varStatus="i">
		                                                <li>
		                                                	<input type="checkbox" id="check-${i.index}" name="searchBrandList" value="${brandListRow.BND_MST_IDX }" />
		                                                	<label for="check-${i.index}"><span class="icon"></span><c:out value="${brandListRow.BND_MST_BRAND_NM }"></c:out>
		                                                </li>
	                                            	</c:forEach>
	                                            </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="type_item">
                                <h3>사이즈</h3>
                                <div class="inner check">
                                    <ul>
                                    	<c:if test="${not empty sizeList}">
                                    		<c:forEach var="sizeItemRow" items="${sizeList}" varStatus="i">
		                                        <li>
		                                            <input type="checkbox" id="size-${i.index}" name="searchSizeItem" data-value="${sizeItemRow.CMN_COM_IDX}">
		                                            <label for="size-${i.index}"><span class="icon"></span><c:out value="${sizeItemRow.CMN_COM_NM }"/></label>
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
                                            <input type="checkbox" id="price-1" name="searchPriceItem">
                                            <label for="price-1"><span class="icon"></span>0 만원 ~ 1 만원</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="price-2" name="searchPriceItem">
                                            <label for="price-2"><span class="icon"></span>1 만원 ~ 3 만원</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="price-3" name="searchPriceItem">
                                            <label for="price-3"><span class="icon"></span>3 만원 ~ 5 만원</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="price-4" name="searchPriceItem">
                                            <label for="price-4"><span class="icon"></span>5 만원 ~ 10 만원</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="price-5" name="searchPriceItem">
                                            <label for="price-5"><span class="icon"></span>10 만원 ~ 15 만원</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="price-6" name="searchPriceItem">
                                            <label for="price-6"><span class="icon"></span>15 만원 이상</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="type_item">
                                <h3>색상</h3>
                                <div class="inner color_pick">
                                    <ul>
                                    	<c:if test="${not empty colorList}">
                                    		<c:forEach var="colorItemRow" items="${colorList}" varStatus="i">
		                                        <li>
		                                            <input type="checkbox" id="color-${i.index}" >
		                                            <label for="color-${i.index}">
		                                                <span class="color" name="searchColorItem" data-id="color-${i.index}" data-color="${colorItemRow.CMN_COM_ETC2 }" data-value="${colorItemRow.CMN_COM_IDX }"
		                                                	  style="background-color:<c:out value='${colorItemRow.CMN_COM_ETC2 }'/>"><c:out value="${colorItemRow.CMN_COM_NM }"/></span>
		                                            </label>
		                                        </li>
		                                     </c:forEach>   
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            <div class="select_item">
                                <ul id="selectItemAddContainner">
                                    <!-- <li>
                                        <strong>여성</strong>
                                        <button type="button" class="btn-del"><span>삭제</span></button>
                                    </li> -->
                                </ul>
                            </div>
                            <div class="btn_wrap">
                                <button class="btn_large gray" onclick="removeSelectedItemUIAll()">초기화</button>
                                <button class="btn_large ok" onclick="keywordSearch()">적용</button>
                            </div>
                        </div>
                    </div>

                    <!-- .new_goods_wrap -->
                    <div class="new_goods_wrap">
                        <ul class="new_goods_list clearboth" id="productItemContainner">
                        	<%-- <c:if test="${not empty productList}">
                				<c:forEach var="proRow" items="${productList }" varStatus="status">
		                            <li>
		                                <span class="flag_video">video</span>
		                                <a href="<c:out value='${frontDomain }'/>/pc/product/product.do?prdMstCd=<c:out value='"+list[idx].PRD_MST_CD+"'/>">
		                                    <div class="img_thum_wrap">
		                                        <div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem06.jpg);"></div>
		                                        <div class="img_thum_inner" style="background-image:url(/nas/cdn/PW/images/@temp/newitem06_over.jpg);"></div>
		                                        <div class="img_thum_inner" style="background-image:<c:out value="${proRow.PRD_IMAGE }" />"></div>
		                                        <ul class="color_list">
		                                        	<c:if test="${not empty colorList }">
		                                        		<c:forEach var="colorRow" items="${colorList}" varStatus="status">
				                                            <li><span style="background:<c:out value="${colorRow.CNT_PRD_COLOR}" /><c:out value="${colorRow.CMN_COM_IDX}" />">color 01</span></li>
		                                            	</c:forEach>
		                                            </c:if>
		                                        </ul>
		                                    </div>
		                                    <div class="sort_tag_area clearboth">
		                                        <span class="sort"><c:out value="${proRow.BND_MST_BRAND_NM}"/></span>
		                                        <span class="tag"><c:out value="${proRow.TAG_MST_TITLE}"/></span>
		                                    </div>
		                                    <p class="goods_title"><c:out value="${proRow.PRD_MST_NM }"/></p>
		                                    <div class="goods_cost_info">
		                                        <span class="dc_before_cost"><c:out value="${proRow.PRD_MST_PRC}"/></span>
		                                        <strong class="clearboth">
		                                            <span class="goods_cost"><c:out value="${proRow.PRD_NOW_DST_PRICE}"/></span>
		                                            <em class="dc_percent"><c:out value="${proRow.PRD_SALE_RATE}"/>%</em>
		                                        </strong>
		                                    </div>
		                                </a>
		                                <div class="btn_like_area">
		                                    <button type="button" class="btn-like on" onclick="likeBtnEvent($(this),'${item.PRD_MST_CD}')" title="좋아요"><span><c:out value="${item.LIKE_COUNT }"></c:out></button>
		                                </div>
		                            </li>
                            	</c:forEach>
                            </c:if> --%>
                        </ul>
                    </div>
                    <!-- // .new_goods_wrap -->
                </div>

                <!-- <div class="pagination">
                    <span class="img_arrow first">
                        <em class="blind">첫 페이지로 이동</em>
                    </span>
                    <span class="img_arrow prev">
                        <em class="blind">이전 페이지로 이동</em>
                    </span>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="num">4</a>
                    <a href="#" class="num">5</a>
                    <a href="#" class="num">6</a>
                    <a href="#" class="num">7</a>
                    <a href="#" class="num">8</a>
                    <span class="img_arrow next">
                        <em class="blind">다음 페이지로 이동</em>
                    </span>
                    <span class="img_arrow last">
                        <em class="blind">마지막 페이지로 이동</em>
                    </span>
                </div> -->
                <!-- //pagination -->
            </div>
        </div>
    </div>
    <!--// Content -->
    
<form id="linkForm" name="linkForm">
	<input type="hidden" id="PRD_CTG_IDX" name="PRD_CTG_IDX" value='' />
	<input type="hidden" id="cPage" name="cPage" value='${commandMap.cPage }' />
	<input type="hidden" id="PRD_MST_CD" name="prdMstCd" value=''/>
	<input type="hidden" id="PRD_MST_TYPE" name="PRD_MST_TYPE" value=''/>
	
</form>



<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>

	var cPage = 1;
	var cIsLast = false;
	
	var PRD_CTG_IDX = "${param.idx }"
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
		
		reqProductListAjax();
	
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
	
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		
		if(maxHeight <= currentScroll){
			reqProductListAjax();
		}
	});
	
	
	var isAjaxing = false;
	reqProductListAjax = function (){
    	
		
		if(isAjaxing || cIsLast){ return; }
		isAjaxing = true;
		
		if(cPage == 1)
			productItemContainner.empty();
		
		var arrSearchBrand = getSearchBrandList();
		var arrSearchSize = getsearchSizeItem();
		var arrSearchColor = getsearchColorItem();
		var searchOptionYN = "N";
		var lastList = $(".new_goods_list clearboth").attr("#productItemContainner");
		
		if(arrSearchColor.length > 0 || arrSearchSize.length > 0){
			searchOptionYN = "Y";
		}
		
		var curOrderType = $('#sel_ord_type option:selected').val();
		var curParamData = {"cPage" : cPage,
				"PRD_CTG_IDX" : PRD_CTG_IDX, 
				"orderType": curOrderType,
				"arrSearchBrand": JSON.stringify(arrSearchBrand),
				"arrSearchSize": JSON.stringify(arrSearchSize),
				"arrSearchPrice": JSON.stringify(selectSearchItems.arrSearchPrice),
				"arrSearchColor": JSON.stringify(arrSearchColor),
				"searchOptionYN": searchOptionYN
				};		
		
		ShowLoading(true);
		
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/product/productListAjax.do",
    		dataType: "json",
    		data	: curParamData,
    		success : function(data) {

    			cPage++;
    			isAjaxing = false;
    			//console.log(data);
    			/* $("#productItemContainner").empty(); */
    			allProductCount.html("상품("+data.totalCount+")");
    			renderProductList(data.productList);
    			
    			
    		}, error : function(err) {
    			alert("요청 실패");
    			isAjaxing = false;
    		}, complete : function(){
    			ShowLoading(false);
    		}
    	});
    }

	
	/*******************  DRAW PRODUCT ITEM UI START ***************************/
	var CorolHTML = '<li><span style="background:{data};">{name}</span></li>';
	var SoldOutHTML = '	<div class="soldout_bx">';
	SoldOutHTML += '		<p class="txt">SOLD OUT</p>';
	SoldOutHTML += '        <button class="btn_large btn_soldout">재입고 알림</button>';
	SoldOutHTML += '    </div>';
	
	var ItemHTML = ''; 
	ItemHTML += '                            <li class="{soldout}">';
	ItemHTML += '                                {soldout_html}';
	ItemHTML += '                                <span class="flag_video">video</span>';
	ItemHTML += '                                <a href="./productView.do?PRD_CTG_IDX={idx}&PRD_MST_CD={prd_cd}" target="_blank">';
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
	ItemHTML += '                                        <span class="dc_before_cost cur-number-format">{price01}</span>';
	ItemHTML += '                                        <strong class="clearboth">';
	ItemHTML += '                                            <span class="goods_cost cur-number-format">{price02}</span>';
	ItemHTML += '                                            <em class="dc_percent">{percent}%</em>';
	ItemHTML += '                                        </strong>';
	ItemHTML += '                                    </div>';
	ItemHTML += '                                </a>';
	ItemHTML += '                                <div class="btn_like_area">';
	ItemHTML += '                                    <button type="button" class="btn-like {like_cls}" title="좋아요" data-prdcd="{prd_cd}"><span>{like}</span></button>';
	ItemHTML += '                                </div>';
	ItemHTML += '                            </li>';

	
	renderProductList = function(list, idx, type){
		
		
		/* $("#productItemContainner").empty(); */
		if(list == null || list.length <= 0){
			cIsLast = true;
			return; 
		}
		
		for(var idx = 0; idx < list.length; idx++){
			
			var curData = list[idx];
			
			var img1 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_IMAGE; //curData.PRD_IMAGE
			var img2 = "<c:out value="${cdnDomain }"/>"+list[idx].PRD_ROLL_OVER_IMG; //curData.PRD_ROLL_OVER_IMG

			var soldoutCls = '';
			var soldoutHtml = '';
			var colorHtml = '';
			if( curData.PRD_MST_SEL_STATE != 'I') {
				soldoutCls = 'soldout';
				soldoutHtml = SoldOutHTML;
			}  
			for (var coloridx = 0; coloridx < curData.CNT_PRD_COLOR.length ; coloridx++){
				colorHtml += CorolHTML.replace('{data}', curData.CNT_PRD_COLOR[coloridx].CNT_PRD_COLOR)
										.replace('{name}', curData.CNT_PRD_COLOR[coloridx].CMN_COM_NM)
			}

			var curHTML = ItemHTML.replace('{soldout}', soldoutCls).replace('{soldout_html}', soldoutHtml)
								.replace('{imagurl}', img1).replace('{imagurlover}', img2)
								.replace('{color_list}', colorHtml)
								.replace('{brand}', curData.PRD_MST_BRAND_NM).replace('{tag}', curData.TAG_MST_TITLE)
								.replace('{title}', curData.PRD_MST_NM)
								.replace('{price01}', curData.PRD_MST_PRC).replace('{price02}', curData.PRD_NOW_DST_PRICE)
								.replace('{percent}', ((curData.PRD_MST_PRC-curData.PRD_NOW_DST_PRICE)/curData.PRD_MST_PRC * 100).toFixed(0))
								.replace('{like}', curData.LIKE_COUNTS)
								.replace('{like_cls}', curData.MY_LIKE == 'Y' ? 'on' : '')
								.replace(/{prd_cd}/ig, curData.PRD_MST_CD).replace('{idx}', PRD_CTG_IDX);
								
		
			productItemContainner.append(curHTML);
				
			/*
			var html = "";
			html = "<li>";
			html += "	<span class=\"flag_video\">video</span>"
//			html += "		<a href=\"<c:out value='${frontDomain }'/>/pc/product/product.do?prdMstCd=<c:out value='"+list[idx].PRD_MST_CD+"' />&cateIdx=<c:out value="${cateIdx }" />\">";
//			html += "		<a href='javascript:goPage("+list[idx].PRD_MST_CD+",\""+list[idx].PRD_MST_TYPE+"\" )'>";
			html += "		<a href=\"javascript:goPage('"+list[idx].PRD_MST_CD+"','"+list[idx].PRD_MST_TYPE +"')\">";
			html += "			<div class=\"img_thum_wrap\">";

//			html += "				<div class=\"img_thum_inner crop\" style=\"background-image:url("+list[idx].PRD_IMAGE+");\"></div>";
//			html += "				<div class=\"img_thum_inner crop\" style=\"background-image:url("+list[idx].PRD_ROLL_OVER_IMG+");\"></div>";
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
			html += "				<span class=\"dc_before_cost\">￦"+list[idx].PRD_MST_PRICE+"</span>";
			html += "				<strong class=\"clearboth\">";	
			html +=	"					<span class=\"goods_cost\">￦"+list[idx].PRD_NOW_DST_PRICE+"</span>";
			html +=	"					<em class=\"dc_percent\">"+list[idx].PRD_SALE_RATE+"%</em>";
			html += "				</strong>";
			html +=	"			</div>";
			html +=	"		</a>";
			html +=	"		<div class=\"btn_like_area\">";
			html +=	"			<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].CNT_PRD_MST_CD+"','TYPE_PRODUCT')\" class=\"btn-like"+(list[idx].MY_LIKE.indexOf("Y") > -1 ? " on" : "")+"\" title=\"\"><span>"+list[idx].LIKE_COUNTS+"</span></button>";
			html +=	"		</div>";
			html +=	"</li>";
		
			productItemContainner.append(html);
			*/
		}
		ResetCurrencyNumberFormat();
		$('.btn-like', productItemContainner).off('click').on('click', function(){
			var $thisElm = $(this);
				
			likeBtnEvent($thisElm, $thisElm.attr('data-prdcd'),'TYPE_PRODUCT');
		});
		
	}
	/*******************  DRAW PRODUCT ITEM UI FINISH ***************************/
	
	
	/*
	//상품type 상세이동
	goPage = function (prdMstCd, type) {
		var linkForm = $("#linkForm");
		
		$("#PRD_MST_CD").val(prdMstCd);
		$("#PRD_MST_TYPE").val(type);
		
		if(type.indexOf("G") > -1){
			linkForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productView.do", "target":"_self", "method":"get"}).submit();
			//location.href = "<c:out value="${frontDomain}"/>/pc/category/productViewNormal.do?prdMstCd="+prdMstCd;
		}else if(type.indexOf("B") > -1){
			linkForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productViewBundle.do", "target":"_self", "method":"get"}).submit();
			//location.href = "<c:out value="${frontDomain}"/>/pc/category/productViewBundle.do?prdMstCd=idx";
		}else if(type.indexOf("S") > -1){
			linkForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productViewSet.do", "target":"_self", "method":"get"}).submit();
			//location.href = "<c:out value="${frontDomain}"/>/pc/category/productViewSet.do?prdMstCd=idx";
		}
	};
	*/
	
	
	

</script>
