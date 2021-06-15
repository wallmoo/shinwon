<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>쑈윈도 | 브랜드 상품목록</title>


 <!-- Content -->
    <div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">BRAND</h2>
            </div>
            <!--// Title -->

            <div class="sub_content product">
                <div class="thumb_brand">
	               	<c:if test="${not empty brandInfo}">
						<div class="inner">
							<div class="img">

                             <p><img src="${cdnDomain }${brandInfo.IMG_THUMBNAIL}" alt="${brandInfo.CMN_FLE_ALT_TXT }"></p>
                       		</div>
                       				<div class="cont">
                           				<h3><c:out value="${brandInfo.BND_MST_BRAND_NM }"/></h3>
                           			<div class="txt">
                               			<p><c:out value="${brandInfo.BND_MST_DTL }"/></p>
                           			</div>
                           			<c:if test="${brandInfo.BND_MST_DPL_STATE eq 'Y'}">
	                           			<div class="btn_brand">
	                               			<a href="#" target="_blank" class="sbtn_txt"  onclick="javascript:goBrandInfo('${brandInfo.BND_MST_URL}' );">브랜드 안내</a>
	                           			</div>
                           			</c:if>
	                       		</div>
	                   		</div>
	                  	</c:if>
	               </div>

                <div class="search_product">
                    <div class="items">
                        <p class="num" id="allProductCount">상품 (<span id="brand_tot_count"></span>)</p>
                        <div class="select_box">
                            <button type="button" class="btn_detail set-srh"><span>상세검색</span></button>
                            <span class="select">
                                <select id="selectStatus1" title="">
                                    <option value="new" selected="selected">최근등록순</option>
                                    <option	value="dwn">가격 낮은순</option>
                                    <option	value="up">가격높은순</option>
                                    <option	value="hit">판매량 많은순</option>
                                </select>
                            </span>
                            <span class="select">
                                <select id="selectStatus2" title="">
                                    <option value="30" selected="selected">30개씩 보기</option>
                                    <option	value="50">50개씩 보기</option>
                                    <option value="100">100개씩 보기</option>
                                </select>
                            </span>
                        </div>
                    </div>
                    <div class="detail_search">
                        <div class="sch-box" id="allSearchBox">
                            <div class="type_item">
                                <h3>카테고리</h3>
                                <div class="inner">
                                    <div class="category_item">
                                    	<c:forEach var="listGnbMenu" items="${listGnbMenu}" varStatus="i">
                                        <div class="category mCustomScrollbar">
                                            <p>
                                                <input name="searchListGnbMenu" type="checkbox" id="oneDepthCategroy-${listGnbMenu.PRD_CTG_IDX}" data-value="${listGnbMenu.PRD_CTG_IDX }">
                                                <label for="oneDepthCategroy-${listGnbMenu.PRD_CTG_IDX}"><span class="icon"></span><c:out value="${listGnbMenu.PRD_CTG_NM}"/></label>
                                            </p>
                                            <ul>
                                            	<c:if test="${not empty listGnbMenu.child }">
                                            	<c:forEach var="secondDepthCategroy" items="${listGnbMenu.child}" varStatus="j">
                                                <li class="cate_1dep">
                                                    <input name="searchListGnbMenu" type="checkbox" id="secondDepthCategroy-${secondDepthCategroy.PRD_CTG_IDX}" data-value="${secondDepthCategroy.PRD_CTG_IDX }">
                                                    <label for="secondDepthCategroy-${secondDepthCategroy.PRD_CTG_IDX}"><span class="icon"></span><c:out value="${secondDepthCategroy.PRD_CTG_NM}"/></label>
                                                    <!-- 카테고리 2Depth 하위 메뉴 -->
                                                    <div class="cate_2dep">
                                                        <ul>
                                                        	<c:if test="${not empty secondDepthCategroy.child }">
                                            				<c:forEach var="thirdDepthCategory" items="${secondDepthCategroy.child}" varStatus="j">
                                                            <li>
                                                                <input name="searchListGnbMenu" type="checkbox" id="thirdDepthCategory-${thirdDepthCategory.PRD_CTG_IDX}" data-value="${secondDepthCategroy.PRD_CTG_IDX }">
                                                                <label for="thirdDepthCategory-${thirdDepthCategory.PRD_CTG_IDX}"><span class="icon"></span><c:out value="${thirdDepthCategory.PRD_CTG_NM}"/></label>
                                                            </li>
                                                            </c:forEach>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                    <!--//카테고리 2Depth 하위 메뉴 -->
                                                </li>
                                                </c:forEach>
                                                </c:if>
                                            </ul>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="type_item">
                                <h3>사이즈</h3>
                                <div class="inner check">
                                    <ul>
                                    	<c:if test="${not empty sizeList }">
                                    		<c:forEach var="sizeItemRow" items="${sizeList }" varStatus="i">
                                        		<li>
                                            		<input name="searchSizeItem" data-value="${sizeItemRow.CMN_COM_IDX }" type="checkbox" id="size-${i.index }">
                                            		<label for="size-${i.index}"><span class="icon"></span><c:out value="${sizeItemRow.CMN_COM_NM }" /></label>
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
	                                            	<input type="checkbox" id="color-${i.index}">
	                                           		<label for="color-${i.index}">
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

                    <!-- .new_goods_wrap -->
                    <div class="new_goods_wrap mt55">
                            <ul class="new_goods_list clearboth" id="productItemContainner">
                            </ul>
                    </div>
                    <!-- // .new_goods_wrap -->
                </div>

            </div>
        </div>
    </div>
    <!--// Content -->
	<form id="searchForm" name="searchForm" method="post">
	<input type="hidden" id="BND_MST_IDX" name="BND_MST_IDX" value="<c:out value="${param.BND_MST_IDX }"/>">
	</form>


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>


<script>
	
	var cIsLast = false;
	var cPage = 1;
	var status = "new";
	var totQueryCount = 30;
	var idx = "${param.BND_MST_IDX }";
	var selectSearchItems = {"arrSearchPrice":[]};
	var arrSearchSize = [];
	var arrSearchColor = [];
	var arrSearchPrice;
		
	var selectItemAddContainner;
	var selectCheckOneDepthBoxes;
	var selectCheckSizeBoxes;
	var selectCheckPriceBoxes;
	var selectCheckColorBoxes;
	var allProductCount;
	var productItemContainner;
	var selectStatus;
	
	

	
	UiBind = function(){
		allProductCount = $("#allProductCount");
		selectCheckColorBoxes = $(".color");
		productItemContainner = $("#productItemContainner");
		selectStatus = $("#selectStatus");
		selectItemAddContainner = $("#selectItemAddContainner");
		selectCheckOneDepthBoxes = $("input[name='searchListGnbMenu']");
		selectCheckSizeBoxes = $("input[name='searchSizeItem']");
		selectCheckPriceBoxes = $("input[name='searchPriceItem']");
		selectCheckColorBoxes = $("span[name='searchColorItem']");
	}
	
	var resetUIVar = function(){
		cIsLast = false;
		cPage = 1;
		productItemContainner.empty();
	}
	
	//카테고리 체크
	getSearchCategory = function(){
		var checkedList = $("input[name='searchListGnbMenu']:checked");
		var filterData = [];
		for(var index = 0; index < checkedList.length; index++){
			filterData.push(checkedList[index].dataset.value);
		}
		return filterData;
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
	
	$(function(){
		UiBind();
		
		//reqSearchBrandProductAjax(cPage, idx);
		
		// 카테고리 checkbox UI
		$("input[name='searchListGnbMenu']").on("change", function(){
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
		
		// 상세검색 price checkbox 이벤트
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
		})
		
		/* addSearchObj = function(id, value){
			var obj = {};
			obj.id = id;
			obj.value = value;
			if(obj == null){ return; }
			if(id.indexOf("size") > -1){
				selectSearchItems.arrSearchSize.push(obj);
			}else{
				selectSearchItems.arrSearchSize.push(obj);
			}
		} */
		
		
		
		removeSearchObj = function(id){
			if(id.indexOf("size") > -1){
				var item = selectSearchItems.arrSearchSize.find(function(item){return item.id == id;});
				var index = selectSearchItems.arrSearchSize.indexOf(item);
				if(index > -1){
					selectSearchItems.arrSearchSize.splice(index, 1);
				}
			}else{
				var item = selectSearchItems.arrSearchColor.find(function(item){return item.id == id;});
				var index = selectSearchItems.arrSearchColor.indexOf(item);
				if(index > -1){
					selectSearchItems.arrSearchColor.splice(index, 1);
				}
			}
		}
		
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
		
		//서치박스
		$("#selectStatus1").on("change", function () {
			status = this.value;
			resetUIVar();
			reqSearchBrandProductAjax();
		});
		
		$("#selectStatus2").on("change", function () {
			totQueryCount = this.value * 1;
			resetUIVar();
			reqSearchBrandProductAjax();
		});
		
		resetUIVar();
		reqSearchBrandProductAjax();
		
	});
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight == currentScroll){
			reqSearchBrandProductAjax();
		}
	});
	
	/* $(document).ready(function() {
		reqSearchBrandProductAjax(cPage, idx);
	}); */
	
	var isAjaxing = false;
	// 셀러픽 상세 상품리스트 호출
	reqSearchBrandProductAjax = function (){
		if(isAjaxing || cIsLast){ return; }
		isAjaxing = true;
		
		var arrSearchCategory = getSearchCategory();
		var arrSearchSize = getSearchInputItem();
		var arrSearchColor = getSearchClassItem();
		var arrSearchPrice = getSearchClassItem();
		var searchOptionYN = "N";
		
		if(arrSearchColor.length > 0 || arrSearchSize.length > 0){
			searchOptionYN = "Y";
		}
		

		
		$.ajax({
			type	: "POST",
			url		: "/pc/brand/searchBrandProductAjax.do",
			dataType: "json",
			data	: {	"cPage" : cPage,
						"pageSize" : totQueryCount,
						"BND_MST_IDX" : idx, 
						"orderType": status,
						"arrSearchCategory" : JSON.stringify(arrSearchCategory),
						"arrSearchSize": JSON.stringify(arrSearchSize),
						"arrSearchPrice": JSON.stringify(selectSearchItems.arrSearchPrice),
						"arrSearchColor": JSON.stringify(arrSearchColor),
						"searchOptionYN": searchOptionYN,
						},
			success : function(data) {
				if(data.brandProductList.length <  totQueryCount) cIsLast = true;
					
				/* $("#productItemContainner").empty(); */
				allProductCount.html("상품("+data.totalCount+")");
				if(data.brandProductList.length > 0){
					renderProductList(data.brandProductList);
					cPage += data.brandProductList.length;
					//cPage++;
				}
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
			html += "		<a href='/pc/product/productView.do?PRD_MST_CD="+list[idx].PRD_MST_CD+"' target='_blank'>";		
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
			html += "				<span class=\"sort\">"+list[idx].BND_MST_BRAND_NM +"</span>";	
			html += "				<span class=\"tag\">"+list[idx].TAG_MST_TITLE+"</span>";
			html += "			</div>";
			html += "			<p class=\"goods_title\">"+(list[idx].PRD_MST_NM.length < 45 ? list[idx].PRD_MST_NM : list[idx].PRD_MST_NM.substring(0, 45)+"...")+"</p>";	
			html += "			<div class=\"goods_cost_info\">";
			html += "				<span class=\"dc_before_cost\">￦"+GetNumberFormat(list[idx].PRD_MST_PRC)+"</span>";
			html += "				<strong class=\"clearboth\">";	
			html +=	"					<span class=\"goods_cost\">￦"+GetNumberFormat(list[idx].PRD_NOW_DST_PRICE)+"</span>";
			html +=	"					<em class=\"dc_percent\">"+list[idx].PRD_NOW_DST_POINT+"%</em>";
			html += "				</strong>";
			html +=	"			</div>";
			html +=	"		</a>";
			html +=	"		<div class=\"btn_like_area\">";
			html +=	"			<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].PRD_MST_CD+"','TYPE_PRODUCT')\" class=\"btn-like"+(list[idx].MY_LIKE == 'Y' ? " on" : "")+"\" title=\"\"><span>"+list[idx].LIKE_COUNT+"</span></button>";
			html +=	"			<button type=\"button\" <span></span></button>";
			html +=	"		</div>";
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
	
	// 상세검색 UI Item 삭세
	removeSelectSearchItemUi = function(id){
		$("#searchListGnbMenu"+id).remove();
		$("#selectedItem_"+id).remove();
		$("#"+id).prop("checked", false);
		$("span[data-id='"+id+"']").removeClass("on");
	}
	
	// 상세검색 UI 초기화
	removeSelectedItemUIAll = function(){
		selectItemAddContainner.empty();
		selectCheckOneDepthBoxes.each(function() {
			$(this).prop("checked", false);
		})
		selectCheckSizeBoxes.each(function(){
			$(this).prop("checked", false);
		});
		selectCheckPriceBoxes.each(function(){
			$(this).prop("checked", false);
		});
		selectCheckColorBoxes.each(function(){
			$(this).removeClass("on");
		});
		
		resetUIVar();
		reqSearchBrandProductAjax();
	}
	
	
	// 상세검색 적용클릭 이벤트
	keywordSearch = function() {
		resetUIVar();
		reqSearchBrandProductAjax();
	};
	
	
	goBrandInfo = function ( urls ) {
		
		if ( urls == ''  ) {
			return;	
		}else{
			location.href = "http://" + urls;			
		}
		
	};
	
	/*
	// 로그인할 경우에 bnd_mst_idx
	likeBtnEvent = function(elem, productCd, type){
		

		if($('#session_login_status').length < 0 || 
				$('#session_login_status').val() != 'Y') {
			
			if(confirm("로그인이 필요합니다.\n로그인화면으로 이동하시겠습니까?")){
				
				var pageForm = $("#searchForm");
				pageForm.attr("action", "/pc/manager/login.do");
		 		pageForm.submit();
				
				//location.href = "/pc/manager/login.do";
			}
			
		} else {
			var likeCheck = likeCheckOk(elem);
			if(likeProgressIng){ return; }
			likeProgressIng = true;

			$.ajax({
				type	: "POST",
				url		: "/pc/member/likeContentsAjax.do",
				dataType: "json",
				data	: {	"CNT_MST_TYPE" : type, "CNT_MST_ID": productCd , "LIKE_YN" : likeCheck },
				success : function(data) {
					likeProgressIng = false;
					if(data.RESULT_CODE == "200"){
						if(likeCheck == "Y"){
							elem.addClass("on");
							elem.text(elem.text()*1 + 1);
						} 
						else {
							elem.removeClass("on");
							elem.text(elem.text()*1 - 1);
							
						}
					}
				}, error : function() {
					likeProgressIng = false;
					alert(data.RESULT_CODE);
				}
			});
		}
	}
	*/

</script>
