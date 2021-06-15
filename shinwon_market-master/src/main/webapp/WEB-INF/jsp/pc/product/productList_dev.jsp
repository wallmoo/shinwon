<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-list"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
			<div id="inner"><!-- inner -->

                <div class="container breadcrumb-wrap"><!-- breadcrumb -->
                    <div id="breadcrumb" class="wrap">
                        <div class="holder">
                            <a href="#!" class="home"><span>홈</span></a>
                            <span class="gt">&gt;</span>
                            <a href="#!" class="home"><span>${topCateName}</span></a>
                            <span class="gt">&gt;</span>
                            <strong class="warning">${middleCateName}</strong>
                        </div>
                    </div>
                </div><!-- // breadcrumb -->

                <div class="container visual-wrap"><!-- visual -->
                    <div class="wrap">

                        <h3 class="title">
                            <strong>${topCateName}</strong>
                        </h3>

                        <div class="category-main-visual">
                            <div class="slidr-utils">
                                <div id="pagerSlider" class="slidr-pager bottom-center"></div>
                                <div id="counterSlider" class="slidr-counter top-right"></div>
                                <a id="prevSlider" href="#!" class="slidr-nav prev"><span class="icon"><em>이전</em></span></a>
                                <a id="nextSlider" href="#!" class="slidr-nav next"><span class="icon"><em>다음</em></span></a>
                            </div>
                            <div class="section-slider">
                                <div id="slider" class="slidr js-prductSlidr"></div><!-- // slider -->
                            </div>
                        </div><!-- // section -->

                    </div>
                </div><!-- // visual -->


                <div class="container"><!-- container -->
                    <div class="wrap"><!-- wrap -->

                        <div id="lnb" class="category"><!-- category: 전시쪽 -->
                            <h3>SHOP BY CATEGORY</h3>
                            <ul class="reset">
                            	<c:choose>
				    				<c:when test="${not empty listMenuCategory['1']}">
				    					<c:forEach var="item" items="${listMenuCategory['1'] }" varStatus="status">     
                                    		<li <c:if test="${productCategory1 eq item.PRD_CTG_IDX}" > class="active" </c:if>><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM }</span></a></li>
                                    	</c:forEach>
                                    </c:when>
                                </c:choose>
                            </ul>
                        </div><!-- // lnb -->

                        <div id="internal"><!-- internal -->

                            <h3 class="sr-only">카테고리</h3>

                            <div class="tab-c"><!-- tab -->
                                <ul class="tab full-width item-5 js-nth-child">
                                	<li class="nth-child-1 <c:if test="${empty productCategory2}" > active </c:if>"><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=${productCategory1}"><span>ALL</span></a></li>
                                	<c:choose>
				    				<c:when test="${not empty listMenuCategory['2']}">
				    					<c:forEach var="item" items="${listMenuCategory['2'] }" varStatus="status">  
				    						<li class="nth-child-${status.count+1} <c:if test="${productCategory2 eq item.PRD_CTG_IDX}" > active </c:if>"><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=${item.PRD_CTG_IDX}"><span>${item.PRD_CTG_NM }</span></a></li>   
                                    	</c:forEach> 
                                    	<c:if test="${((fn:length(listMenuCategory['2'])+1) mod 5) ne 0}">
                                    		<c:forEach var="i" begin="1" end="${5 - ((fn:length(listMenuCategory['2'])+1) mod 5)}">
                                    			<li class="nth-child-${(fn:length(listMenuCategory['2'])+i+1)}"><span></span></li>
                                    		</c:forEach>
                                    	</c:if>
                                    </c:when>
                                    <c:otherwise>
                                    	<c:forEach var="i" begin="1" end="4">
                                    		<li class="nth-child-${i+1}"><span></span></li>
                                    	</c:forEach>
                                    </c:otherwise>
                                	</c:choose>
                                </ul>
                            </div>
							
							<!-- search form -->
							<form id="frm" name="frm" method="post" >
							    <input type="hidden" id="idx"      name="idx"      value="${commandMap.idx}" />
								<input type="hidden" id="cPage"    name="cPage"    value="${commandMap.cPage }" />
								<input type="hidden" id="pSort"    name="pSort"    value="${commandMap.pSort }" />
								<input type="hidden" id="viewType" name="viewType" value="${commandMap.viewType}" />
                            <div class="section-search-product"><!-- search-product -->
                                <table class="core" cellspacing="0">
                                <tr class="nth-child-1 line">
                                    <th><span>LINE</span></th>
                                    <td>
                                        <label class="all"><input type="checkbox" class="check" id="lineAll" name="searchLine_ALL" value="" <ui:select v="${commandMap.searchLine}" t="" g="checked"/> />ALL</label>
                                        <c:choose>
                                        	<c:when test="${not empty listLine}">
                                        		<c:forEach var="item" items="${listLine}" varStatus="status">
                                        			<label><input type="checkbox" class="check" name="searchLine" id="searchLine${item.LINE_CD}" value="${item.LINE_CD}" <c:forEach var="cd" items="${commandMap.searchLine}" varStatus="sts"> <ui:select v="${cd}" t="${item.LINE_CD}" g="checked"/> </c:forEach>/>${item.LINE_NM}</label>
                                        		</c:forEach>
                                        	</c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr class="nth-child-2 color">
                                    <th><span>COLOR</span></th>
                                    <td>
                                        <label class="all"><input type="checkbox" class="check" id="colorAll" name="searchRepColor_ALL" value=""  <ui:select v="${commandMap.searchRepColor}" t="" g="checked"/>/>ALL</label>
                                        <c:choose>
                                        	<c:when test="${not empty listRepColor}">
                                        		<c:forEach var="item" items="${listRepColor}" varStatus="status"> 
                                        			 <label><input type="checkbox" name="searchRepColor" id="searchRepColor${item.COLOR_CD}" value="${item.COLOR_CD}" <c:forEach var="cd" items="${commandMap.searchRepColor}" varStatus="sts"> <ui:select v="${cd}" t="${item.COLOR_CD}" g="checked"/> </c:forEach>/><span class="icon color" style="background-color: ${item.COLOR_RGB};"><em>${item.COLOR_NM}</em></span></label>
                                        		</c:forEach>
                                        	</c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr class="nth-child-3 size">
                                    <th><span>SIZE</span></th>
                                    <td>
                                        <label class="all"><input type="checkbox" class="check" id="sizeAll" name="searchSize_ALL" value=""  <ui:select v="${commandMap.searchSize}" t="" g="checked"/>/>ALL</label>
                                        <c:choose>
                                        	<c:when test="${not empty listSize}">
                                        		<c:forEach var="item" items="${listSize}" varStatus="status"> 
                                        			 <label><input type="checkbox" class="check" name="searchSize" id="searchSize${item.SIZE_CD}" value="${item.SIZE_CD}" <c:forEach var="cd" items="${commandMap.searchSize}" varStatus="sts"> <ui:select v="${cd}" t="${item.SIZE_CD}" g="checked"/> </c:forEach>/>${item.SIZE_NM}</label>
                                        		</c:forEach>
                                        	</c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr class="nth-child-4 price">
                                    <th><span>PRICE</span></th>
                                    <td>
                                        <div>
                                            <input id="amountMin" type="text" class="text" name="searchPriceStart" value="${commandMap.searchPriceStart}" />
                                            ~
                                            <input id="amountMax" type="text" class="text" name="searchPriceEnd" value="${commandMap.searchPriceEnd}" />
                                        </div>
                                        <div id="rangeSlider" class="range-slidr"></div>
                                    </td>
                                </tr>
                                </table>
                                <div class="action">
                                    <a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=${commandMap.idx}" class="button small"><span>초기화</span></a>
                                    <a href="javascript:goSearch();" class="button primary small"><span>검색</span></a>
                                </div>
                            </div><!-- // search-product -->

                            <div class="section-product-status"><!-- product-status -->
                                총 <strong class="warning">${totalCount}개의 상품</strong>이 있습니다.
                            </div><!-- // product-status -->

                            <div class="clearfix section-product-sort"><!-- section-product-sort -->
                                <div class="pull-left col filter">
                                    <ul class="tab">
                                        <li><a href="javascript:goPageSort('1');" class="button <ui:select v="${commandMap.pSort}" t="1" g="info"/>"><span>신상품순</span></a></li>
                                        <li><a href="javascript:goPageSort('2');" class="button <ui:select v="${commandMap.pSort}" t="2" g="info"/>"><span>인기순</span></a></li>
                                        <li><a href="javascript:goPageSort('3');" class="button <ui:select v="${commandMap.pSort}" t="3" g="info"/>"><span>높은가격순</span></a></li>
                                        <li><a href="javascript:goPageSort('4');" class="button <ui:select v="${commandMap.pSort}" t="4" g="info"/>"><span>낮은가격순</span></a></li>
                                    </ul>
                                </div>
                                <div class="pull-right col order">
                                    <a href="#list" class="image"><span class="icon image <c:if test="${empty commandMap.viewType || commandMap.viewType eq 'image' }">active</c:if>"></span>이미지 보기</a>
                                    <a href="#list" class="list"><span class="icon list <c:if test="${commandMap.viewType eq 'list' }">active</c:if>"></span>리스트 보기</a>
                                    <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="front" jsFunction="goPage"/>
                                </div>
                            </div><!-- // section-product-sort -->
							</form> <!-- // search form -->
							
                            <div id="list" class="list-product item-3 <c:out value="${empty commandMap.viewType ? 'image' : commandMap.viewType }"/> "><!-- list-product -->                               
                               	<c:choose>
			    					<c:when test="${not empty listProduct}">
			    						<ul class="reset core"><ul class="reset core">
			    					
		    							<c:forEach var="item" items="${listProduct}" varStatus="status">
		    								<li class="item <c:if test="${status.count mod 2 eq 1}">odd</c:if> <c:if test="${status.count mod 2 eq 0}">even</c:if> nth-child-${(status.index mod 3)+1}"><!-- item -->
		                                        <div class="module">
		                                            <div class="col thumb"  data-code="${item.PRD_MST_CD}" data-colors="${item.PRODUCT_RGB}">
		                                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb198" alt="" /></a>
		                                            </div>
		                                            <div class="col core">
		                                                <div class="desc">
		                                                    <p class="name">
		                                                        <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}">
		                                                        <c:if test="${not empty item.PRM_TEXT}" >[<c:out value="${item.PRM_TEXT }" />]</c:if>
		                                                        	${item.PRD_MST_NM}
		                                                        </a>
		                                                    </p>
		                                                </div>
		                                                <div class="prices">
															<p class="price-before">
											                	<fmt:formatNumber value="${item.PRD_MST_NORMAL_PRICE }" groupingUsed="true" />원
											                </p>
											                <p class="price-after">
											                    <fmt:formatNumber value="${item.PRD_MST_PRICE }" groupingUsed="true" />원
											                </p>
											            </div>
		                                                <div class="labels">
		                                                	<c:if test="${item.ICON_NEW eq 'Y'}">
		                                                    	<span class="label new">NEW</span>
		                                                    </c:if>
		                                                    <c:if test="${item.ICON_MD eq 'Y'}">
		                                                    	<span class="label md">MD추천</span>
		                                                    </c:if>
		                                                    <c:if test="${item.ICON_EVENT eq 'Y'}">
		                                                    	<span class="label event">EVENT</span>
		                                                    </c:if>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </li>
		    							</c:forEach>
		    						</ul>
			    					</c:when>
			    					<c:otherwise>
			    						<p class="no-list-more">
		                                    상품이 없습니다.
		                                </p>
			    					</c:otherwise>
			    				</c:choose>   
                            </div><!-- // list-product -->
                            
                            <div class="section-pagination"><!-- .section pagination -->
					            <ui:frontpaging paging="${paging}" jsFunction="goPage" />
					        </div><!-- // .section pagination -->

                            <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

                        </div><!-- internal -->

                    </div><!-- wrap -->
                </div><!-- // container -->
            </div><!-- // inner -->
   
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

$.json.itemsVisual = {
	    "group": [{
	        "subject": "마켓플랜트",
	        "items": [
	<c:choose>
	<c:when test="${not empty listPromotionBanner}">
		<c:forEach var="item" items="${listPromotionBanner}" varStatus="status">                   
	        {
	            "thumb": "${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}",
	            "target": "${item.BNR_DTL_TARGET eq 'N' ? '_blank' : '_self' }",
	            "src": "${empty item.BNR_DTL_TARGET  ? '#!' : item.BNR_DTL_URL }"
	        }
	       <c:if test="${!status.last}" > 
	         , 
	       </c:if>  
		</c:forEach>
	</c:when>
	</c:choose>
	        ]
	    }]
};


$(function(){

	if (typeof $.domain == 'undefined') {
		$.domain = '${cdnDomain}';
    }

    // init slider
    $('#slider').productSlidr({
        indicatorURL: $.indicatorURL,
        json: $.json.itemsVisual,
        formatter: function($item, _idx) {
        	
            var _html = '';
            var _target = ($item.target !== undefined) ? $item.target : '_self';
            _html += '<li class="item">';
            _html += '<div class="thumb">';
            _html += '<a href="' + $item.src + '" target="' + _target + '"><img src="' + $item.thumb + '" class="pic" alt="" /></a>';
            _html += '</div>';
            _html += '</li>';
            return _html;
        },
        // autoPlay: false,
        visibleLength: 1,
        sliderHeight: '250px',
        navPrev: '#prevSlider',
        navNext: '#nextSlider',
        counter: '#counterSlider',
        pager: '#pagerSlider'
    });
    
    // INIT rangeSlider
    if ($('#rangeSlider').length) {

        var _scriptsRangeSlider = [
            $.domain + '/pc/js/plugins/jquery-ui-rangeslider.js', // jquery ui range slider
            $.domain + '/pc/js/epass.helper.jqueryUI.slider-0.1.js' // range slider helper
        ];
        var startPrice ='<c:out value="${empty commandMap.searchPriceStart ? 1 : commandMap.searchPriceStart}"/>';
        var endPridce = '<c:out value="${empty commandMap.searchPriceEnd ? 2500000 : commandMap.searchPriceEnd}"/>';
        
        // modernizr yepnope
        if ($.isFunction(yepnope)) {
            yepnope({
                load: _scriptsRangeSlider,
                complete: function() {
                    $('#rangeSlider').rangeSlider({ // range slider
                        startMin: startPrice, // 시작 최저값
                        startMax: endPridce, // 시작 최고값
                        min: 1, // 최저값
                        max: 2500000 // 최고값
                   });
                }
            });
        }
    }
});

</script>
<script>
$(function(){
	
	quickView = function(_code) {
		alert(_code);
        var _href = '<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd=' + _code,
            _width = 840,
            _height = 800,
            _scroll = 'yes';
        $.openPopup(_href, _width, _height, _scroll);
    };
	
    // list view type setting 
    goSetListType = function(type)
    {
    	 var $frm = $("#frm");
 	     $frm.find("input[id='viewType']").val(type);
    }
    
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 검색버튼 클릭 시 
	goSearch = function () 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(1);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 정렬순서 선택
	goPageSort = function (pSort) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='pSort']").val(pSort);
	    $frm.find("input[id='cPage']").val(1);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 라인 검색조건 선택 시 
	$(document).on("click", "input[id^=searchLine]", function ()
    {    
 		var $frm = $("#frm"); 
 		var $lines = $frm.find("input[id^=searchLine]");
 		var chkCnt = 0;
 		$lines.each(function(){
 			if($(this).is(":checked"))
 			{
 				chkCnt ++;
 			}
 		});
 		if(chkCnt == 0)
 		{
 			$("#lineAll").prop("checked", true);
 		}
 		else
 		{
 			$("#lineAll").prop("checked", false);
 		}
    });
	
	$(document).on("click", "#lineAll", function ()
	{    
 		var $frm = $("#frm"); 
 		var $lines = $frm.find("input[id^=searchLine]");
 		if($(this).is(":checked")){
 	 		$lines.each(function(){
 	 			if($(this).is(":checked"))
 	 			{
 	 				$(this).prop("checked", false);
 	 			}
 	 		});
 		}
    });
			
			
	// 색상 검색조건 선택 시 
	$(document).on("click", "input[id^=searchRepColor]", function ()
    {    
 		var $frm = $("#frm"); 
 		var $colors = $frm.find("input[id^=searchRepColor]");
 		var chkCnt = 0;
 		$colors.each(function(){
 			if($(this).is(":checked"))
 			{
 				chkCnt ++;
 			}
 		});
 		if(chkCnt == 0)
 		{
 			$("#colorAll").prop("checked", true);
 		}
 		else
 		{
 			$("#colorAll").prop("checked", false);
 		}
    });
	
	$(document).on("click", "#colorAll", function ()
	{    
 		var $frm = $("#frm"); 
 		var $colors = $frm.find("input[id^=searchRepColor]");
 		if($(this).is(":checked")){
 	 		$colors.each(function(){
 	 			if($(this).is(":checked"))
 	 			{
 	 				$(this).prop("checked", false);
 	 			}
 	 		});
 		}
    });
	
	
	// 사이즈 검색조건 선택 시 
	$(document).on("click", "input[id^=searchSize]", function ()
    {    
 		var $frm = $("#frm"); 
 		var $sizes = $frm.find("input[id^=searchSize]");
 		var chkCnt = 0;
 		$sizes.each(function(){
 			if($(this).is(":checked"))
 			{
 				chkCnt ++;
 			}
 		});
 		if(chkCnt == 0)
 		{
 			$("#sizeAll").prop("checked", true);
 		}
 		else
 		{
 			$("#sizeAll").prop("checked", false);
 		}
    });
	
	$(document).on("click", "#sizeAll", function ()
	{    
 		var $frm = $("#frm"); 
 		var $sizes = $frm.find("input[id^=searchSize]");
 		if($(this).is(":checked")){
 	 		$sizes.each(function(){
 	 			if($(this).is(":checked"))
 	 			{
 	 				$(this).prop("checked", false);
 	 			}
 	 		});
 		}
    });
	

	
	
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>