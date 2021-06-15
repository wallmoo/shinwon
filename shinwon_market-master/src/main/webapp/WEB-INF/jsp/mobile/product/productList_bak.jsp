<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-cate"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		
		<!-- .cate_gnb S -->
		<nav class="_hd_fix cate_gnb">
			<span class="blind">현재 카테고리 위치 섹션</span>
			<ul class="mn_list">    
				<c:if test="${not empty listCategoryPath }">
					<c:forEach var="listCategoryPath" items="${listCategoryPath }" varStatus="status">
						<c:choose>
							<c:when test="${listCategoryPath.PRD_CTG_LEVEL == 1}">
								<li>
									<a href="<c:out value="${mobileDomain }"/>/mobile/product/productMain.do?idx=<c:out value="${listCategoryPath.PRD_CTG_IDX }" />" target="_self"><strong><c:out value="${listCategoryPath.PRD_CTG_NM}" /></strong></a>
									<i class="ico_ar"></i>
								</li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${listCategoryPath.PRD_CTG_IDX == cateIdx }">
										<li>
											<a href="javascript:void(0)" data-dep="dep_2"><strong><c:out value="${listCategoryPath.PRD_CTG_NM}" /></strong><span><span class="blind">상품수</span>(<fmt:formatNumber value="${totalCount }" groupingUsed="true" />)</span></a>
											<i class="ico_ar_b"></i>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<c:out value="${mobileDomain }"/>/mobile/product/productList.do?idx=<c:out value="${listCategoryPath.PRD_CTG_IDX }" />" target="_self"><strong><c:out value="${listCategoryPath.PRD_CTG_NM}" /></strong></a>
											<i class="ico_ar"></i>
										</li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
				<c:if test="${commandMap.cateDnCnt > 0 }">
				<li>
					<a href="javascript:void(0)" data-dep="dep_3" class="btn_cate"><span>카테고리</span></a>
				</li>
				</c:if>
			</ul>
			<ul id="dep_2" class="sub_list">
				<c:if test="${not empty listMenuCategory }">
					<c:forEach var="listMenuCategory" items="${listMenuCategory}" varStatus="Status">
						<li><a href="<c:out value="${mobileDomain }"/>/mobile/product/productList.do?idx=<c:out value="${listMenuCategory.PRD_CTG_IDX }" />" <ui:select v="${listMenuCategory.PRD_CTG_IDX}" t="${cateIdx }" g="class=on"/> target="_self"><c:out value="${listMenuCategory.PRD_CTG_NM }" /></a></li>
					</c:forEach>
				</c:if>
			</ul>
			<ul id="dep_3" class="sub_list">
				<c:if test="${not empty listMenuSubCategory }">
					<c:forEach var="CateMenu" items="${listMenuSubCategory}" varStatus="Status">
						<li><a href="<c:out value="${mobileDomain }"/>/mobile/product/productList.do?idx=<c:out value="${CateMenu.PRD_CTG_IDX }" />" target="_self"><c:out value="${CateMenu.PRD_CTG_NM }" /></a></li>
					</c:forEach>
				</c:if>
			</ul>
		</nav>
		<!--// .cate_gnb E -->
		
		<div class="cate_list_type">
			<label for="searchOrderType">
				<select data-role="none" id="searchOrderType" name="searchOrderType">
					<option value="hit" <ui:select v="${commandMap.orderType}" t="hit" g="selected"/>>온라인 인기순</option>
					<option value="off" <ui:select v="${commandMap.orderType}" t="off" g="selected"/>>오프라인 인기순</option>
					<option value="new" <ui:select v="${commandMap.orderType}" t="new" g="selected"/>>최신순</option>
					<option value="dwn" <ui:select v="${commandMap.orderType}" t="dwn" g="selected"/>>낮은 가격순</option>
					<option value="up"  <ui:select v="${commandMap.orderType}" t="up" g="selected"/>>높은 가격순</option>
				</select>
			</label>
			<a href="javascript:$.com.util.layPop('open', $('#lay_smart'), true)" class="_pg_link">SMART FILTER</a>
		</div>

		<!-- .cate_pr_list S -->
		<section class="cate_pr_list">
			<span class="blind">현제 카테고리 상품리스트 센셕</span>
			<ul class="ui-grid-a _scroll_list_ck">
				<c:choose>
					<c:when test="${not empty listProduct }">
						<c:set var="listNum" value="1" />
						<c:forEach var="listProduct" items="${listProduct }" varStatus="i">
							<c:choose>
								<c:when test="${listNum mod 2 == 0 }">
									<li class="ui-block-b">
								</c:when>
								<c:otherwise>
									<li class="ui-block-a">
								</c:otherwise>
							</c:choose>
								<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${cateIdx}" />','_self');" class="_pg_link" >
									<span class="tx_img">
										<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_OP_TEMPOUT || listProduct.PRD_MST_SEL_CNT == 0}">
										<span class="sold_out"><i>일시품절</i></span>
										</c:if>
										<c:if test="${listProduct.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_TEMPOUT}">
										<span class="sold_out"><i>품절</i></span>
										</c:if>
										<img data-original="<c:out value="${cdnDomain}" />/<c:out value="${listProduct.PRD_IMAGE}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" />
									</span>
									<span class="tx_ti">
										<c:choose>
											<c:when test="${fn:length(listProduct.PRD_MST_NM) > 32}">
												<c:out value="${fn:substring(listProduct.PRD_MST_NM,0,32) }" />...
											</c:when>
											<c:otherwise>
												<c:out value="${listProduct.PRD_MST_NM}" />
											</c:otherwise>
										</c:choose>
									</span>
									<strong class="tx_price">
										<fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span>
										<c:if test="${listProduct.PRD_NOW_DST_POINT > 0 && listProduct.PRD_CPN_DST_POINT eq 0}">
											<em class="discount">
												<span class="blind">할인률</span>
												<strong class="tx_num"><c:out value="${listProduct.PRD_NOW_DST_POINT}" /></strong>%
											</em>
										</c:if>
										<c:if test="${listProduct.PRD_CPN_DST_POINT > 0}">
											<em class="discount">
												<span class="blind">할인률</span>
												<strong class="tx_num"><c:out value="${listProduct.PRD_CPN_DST_POINT}" /></strong>%
											</em>
										</c:if>
									</strong>
								</a>
							</li>
						<c:set var="listNum" value="${listNum + 1 }" />
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="no_list">등록된 상품이 없습니다.</li>
					</c:otherwise>
				</c:choose>
			</ul>
			
		</section>
		<!--// .cate_pr_list E -->
		
		<!-- 스마트필터 S -->
		<!-- # S -->
		<section id="lay_smart" data-role="popup" data-overlay-theme="a" class="popup_st0 smart_filter_d">
		<form id="searchForm" name="searchForm">
		<input type="hidden" name="PRD_MST_SPC_IDX" id="PRD_MST_SPC_IDX" value="<c:out value="${commandMap.searchSpcIdxs }" />" />
		<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" />
		<input type="hidden" name="oldSearchPrdMstMinPrice" id="oldSearchPrdMstMinPrice" value="<c:out value="${listProductPrice.PRD_MST_MIN_PRICE }" />" />
		<input type="hidden" name="oldSearchPrdMstMaxPrice" id="oldSearchPrdMstMaxPrice" value="<c:out value="${listProductPrice.PRD_MST_MAX_PRICE }" />" />
		<input type="hidden" name="orderType" id="orderType" value=""/>
			<header>
				<h3>SMART FILTER</h3>
				<a href="javascript:$.com.util.layPop('close', $('#lay_smart'));"  class="_pg_link btn_close"><span class="blind">스마트필터 닫기</span></a>
			</header>
			<dl class="firter_list">
				<dt class="blind">설치형태, 브랜드, 가격대별로 구성된 검색 필터</dt>
				<c:if test="${not empty listCategorySpec }">
					<c:set var="spcIdx" value="0" />
					<c:forEach var="listCategorySpec" items="${listCategorySpec }" varStatus="i">
						<c:if test="${listCategorySpec.SPC_MST_LEVEL eq 3 && (spcIdx ne listCategorySpec.SPC_MST_IDX && spcIdx ne 0) }">
									</fieldset>
								</dd>
						</c:if>
						<c:choose>
							<c:when test="${ listCategorySpec.SPC_MST_LEVEL eq 3}">
								<c:set var="num" value="0" />
								<dd class="dd_chk">
									<fieldset data-role="controlgroup">
										<legend><c:out value="${listCategorySpec.SPC_MST_NM}" /></legend>
										<%-- <input type="checkbox" name="searchPrdMstSpcAll" id="searchPrdMstSpcAll_<c:out value="${listCategorySpec.SPC_MST_IDX}" />_<c:out value="${num}" />" checked=true value="<c:out value="${listCategorySpec.SPC_MST_IDX}" />" data-all="true">
										<label for="searchPrdMstSpcAll_<c:out value="${listCategorySpec.SPC_MST_IDX}" />_<c:out value="${num}" />">ALL</label> --%>
							</c:when>
							<c:otherwise>
									<input type="checkbox" name="searchPrdMstSpc" id="searchPrdMstSpc_<c:out value="${listCategorySpec.SPC_MST_UP_IDX}" />_<c:out value="${num}" />" value="<c:out value="${listCategorySpec.SPC_MST_IDX}" />">
									<label for="searchPrdMstSpc_<c:out value="${listCategorySpec.SPC_MST_UP_IDX}" />_<c:out value="${num}" />"><c:out value="${listCategorySpec.SPC_MST_NM}" /></label>
							</c:otherwise>
						</c:choose>
						<c:set var="num" value="${num + 1 }" />
						<c:if test="${i.last }">
									</fieldset>
								</dd>
						</c:if>
						<c:if test="${listCategorySpec.SPC_MST_LEVEL eq 3 }">
							<c:set var="spcIdx" value="${listCategorySpec.SPC_MST_IDX }" />
						</c:if>
					</c:forEach>
				</c:if>
				<dd class="dd_rice">
					<fieldset data-role="controlgroup">
						<legend>가격대별</legend>
						<input type="text" name="searchPrdMstMinPrice" id="searchPrdMstMinPrice" value="<c:out value="${commandMap.searchPrdMstMinPrice == '' || commandMap.searchPrdMstMinPrice == null ? listProductPrice.PRD_MST_MIN_PRICE : commandMap.searchPrdMstMinPrice }" />" placeholder="최저금액" />
						<i>~</i>
						<input type="text" name="searchPrdMstMaxPrice" id="searchPrdMstMaxPrice" value="<c:out value="${commandMap.searchPrdMstMaxPrice == '' || commandMap.searchPrdMstMaxPrice == null ? listProductPrice.PRD_MST_MAX_PRICE : commandMap.searchPrdMstMaxPrice }" />" placeholder="최고금액" />
					</fieldset>
				</dd>
				<dd class="dd_btn">
					<a href="javascript:fromReset();" class="btn_red"><span>검색초기화</span></a>
					<a href="javascript:void(0)" id="searchPrdMstSpec" class="btn_gre"><span>상세검색</span></a>
				</dd>
			</dl>
		</form>
		</section>
		<!--//# E -->
		<!-- 스마트필터 E -->
			
	</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->
<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<form id="popFrm" name="popFrm">
<input type="hidden" name="cPage" id="cPage" value="1"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount }" />"/>
<input type="hidden" name="cateIdx" id="cateIdx" value="<c:out value="${cateIdx }" />"/>
<input type="hidden" name="orderType" id="orderType" value="<c:out value="${commandMap.orderType }" />"/>
</form>
<script type="text/javascript">
//<![CDATA[
$.com.cate = $.com.cate || {
	slider : function(){
		//카테고리 슬라이드
		var _idx = $('.cate_slider .slider'),
			_idx_opt = {
				preloadImages: 'visible',
				pager: true,
				controls: false,
				captions: true,
				auto: true,
				adaptiveHeight: true,
				autoControls: false
			};
		if(!_idx.hasClass('_ck_slider')){
			_idx.addClass('_ck_slider').bxSlider(_idx_opt);
		}	
	},//slider : function(){
	util: function(){
		//카테고리 눌렀을때 서브리스트 나오는거
		
		var _cate_gnb = $('.cate_gnb'),
			_mn_list = _cate_gnb.children('.mn_list');

		_mn_list.find('a').on('click', function(){
			var _this = $(this),
				_li = _this.parent('li'),
				_sublist = _this.data('dep');

			if(_sublist){ 
				_cate_gnb.children('.sub_list').hide();
				if(_li.hasClass('on')){//누른곳 또누르면 그냥 서브리스트 닫아줘
					_li.removeClass('on');				
				}else{
					_li.addClass('on').siblings().removeClass('on');				
					$('#'+_sublist).show();
				}
			}
		});
	}
};
$(function(){
	$.com.cate.slider();
	$.com.cate.util();
	
	$(document).on("change", "#searchOrderType", function (){
    	var orderType = $("#searchOrderType").val();
    	var cateIdx = $("#cateIdx").val();
    	var searchSpcIdxs = $("#PRD_MST_SPC_IDX").val();
		var searchPrdMstMaxPrice = $("#searchPrdMstMaxPrice").val();
		var searchPrdMstMinPrice = $("#searchPrdMstMinPrice").val();
    	location.href = "<c:out value="${mobileDomain}" />/mobile/product/productList.do?idx="+cateIdx+"&orderType="+orderType+"&searchSpcIdxs="+searchSpcIdxs+"&searchPrdMstMaxPrice="+searchPrdMstMaxPrice+"&searchPrdMstMinPrice="+searchPrdMstMinPrice;
    });
	
	fromReset = function(){
		$("#searchForm").find("input").each(function(idx){
    		var $tag = $(this);
    		if($tag.attr("name") != "searchPrdMstSpcAll"){
    			switch($tag.attr("type"))
	    		{
	    			case "checkbox" : 
	    				$tag.prop("checked", false);
	    			case "text" : 
	    				$tag.val('');
	    		}
    		}
    	});
    	
    };
    
    //스마트 필터 검색
    $(document).on("click", "#searchPrdMstSpec", function (){
    	var orderType = $("#searchOrderType").val();
    	var spcAll = 0;
    	var chkResult = 0;
    	var priceResult = false;
    	var prd_mst_spc_Idx = "";
    	
    	/* $("input[name=searchPrdMstSpcAll]").each(function(){
    		if($(this).is(":checked") == false){
    			var idx = $(this).val();
    			$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
    				if($(this).is(":checked")){
    					chkResult = chkResult + 1;
    					if(prd_mst_spc_Idx == ""){
    						prd_mst_spc_Idx = $(this).val();
    					}else{
    						prd_mst_spc_Idx = prd_mst_spc_Idx +","+$(this).val();
    					}
    				}
    			});
    		}else{
    			spcAll = spcAll + 1;
    			var idx = $(this).val();
    			$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
   					if(prd_mst_spc_Idx == ""){
   						prd_mst_spc_Idx = $(this).val();
   					}else{
   						prd_mst_spc_Idx = prd_mst_spc_Idx +","+$(this).val();
    				}
    			});
    		}
    	}); */
    	
    	$("input[name=searchPrdMstSpc]").each(function(){
    		if($(this).is(":checked")){
    			chkResult = chkResult + 1;
    			if(prd_mst_spc_Idx == ""){
					prd_mst_spc_Idx = $(this).val();
				}else{
					prd_mst_spc_Idx = prd_mst_spc_Idx +","+$(this).val();
				}
    		}
    	});
    	
    	if($("#searchPrdMstMaxPrice").val() == "" && $("#searchPrdMstMinPrice").val() == ""){
    		priceResult = true;
    	}else{
    		if($("#searchPrdMstMaxPrice").val() <= $("#searchPrdMstMinPrice").val() ){
    			alert("최소가격과 최대가격 내의 구간으로 검색 가능합니다.");
    			return;
    		}
    	}
    	
    	
    	if(chkResult == 0 && priceResult){
			alert("스마트 필터의 항목을 선택하시거나 가격검색을 등록 하셔야 합니다.");
			return;
		}
    	$("#PRD_MST_SPC_IDX").val(prd_mst_spc_Idx);
    	var orderType = $("#searchOrderType").val();
    	var cateIdx = $("#cateIdx").val();
    	var searchPrdMstMaxPrice = $("#searchPrdMstMaxPrice").val();
		var searchPrdMstMinPrice = $("#searchPrdMstMinPrice").val();
    	location.href = "<c:out value="${mobileDomain}" />/mobile/product/productList.do?idx="+cateIdx+"&orderType="+orderType+"&searchSpcIdxs="+prd_mst_spc_Idx+"&searchPrdMstMaxPrice="+searchPrdMstMaxPrice+"&searchPrdMstMinPrice="+searchPrdMstMinPrice;;
    });
    //스팩 선택
   /*  $(document).on("change", "input[name=searchPrdMstSpc]", function (){
    	var chkidx = 0;
    	var chkAllObj = $(this).parent("div").parent("div").find("input[name=searchPrdMstSpcAll]");
    	var strArray = $(this).attr("id").split('_');
		var idx = strArray[strArray.length-2];
		var prtChkLen = $("input[id^=searchPrdMstSpc_"+idx+"]").length;
		
    	$("input[name=searchPrdMstSpc]").each(function(){
			if($(this).is(":checked")){
				chkidx = chkidx + 1;
			}
    	});
    	
    	if(chkidx == prtChkLen){
    		chkAllObj.prop("checked",true);
    		$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
    			$(this).prop("checked",false);
    		});
    	}
    	else if(chkidx > 0){
    		chkAllObj.prop("checked",false);
    	}
    });
    
    $(document).on("change","input[name=searchPrdMstSpcAll]", function(){
    	var strArray = $(this).attr("id").split('_');
		var idx = strArray[strArray.length-2];
		if($(this).is(":checked")){
			$("input[id^=searchPrdMstSpc_"+idx+"]").each(function(){
				$(this).prop("checked",false);
	    	});
		}
    }); */
});

$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
	*/
	
	var totalCount = $("#totalCount").val();
    var addcPage = $("#cPage").val();
    var cateIdx = $("#cateIdx").val();
    totalCount = Math.ceil(totalCount / 10);
    
    if(_reNum < 2){
		cPage = _reNum + 2;
	}else{
		cPage = parseInt(addcPage) + 1;
	}
    $("#cPage").val(cPage);
	
	if(cPage <= totalCount){
		$.ajax({
            async : false,
            type : "POST",
            data : { "cateIdx": cateIdx , "cPage": cPage},
            dataType : "html",
            url : "<c:out value="${mobileDomain}" />/mobile/product/productListAjax.do",
            success : function (data) 
            {
            	if(data != null)
    			{
            		
            		 _idx.append(data);
            		 _idx.find('img').lazyload();
    			}
    			else
    			{
    				alert("조회된 데이터가 없습니다.");
    			}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }
    	});
	}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
}

//]]>
</script>
</body>
</html>