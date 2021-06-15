<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-category-main"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
		<div id="inner"><!-- inner -->

				<div id="mainPop"><!-- 메인 팝업 2015-06-29 -->
				<c:choose>
					<c:when test="${not empty listPopup }" >
						<c:forEach var="item" items="${listPopup }" varStatus="status">
							<div id="pop${item.POP_MST_IDX}" class="popup pos-absolute"><!-- popup -->
		                        <div class="grid core">
		                            ${item.POP_MST_CONTENTS}
		                        </div>
		                        <div class="action">
                            		<div class="pull-left">
		                            <c:if test="${item.POP_MST_DAY_YN eq 'Y' }" >		
										<input id="remember_${item.POP_MST_IDX}" type="checkbox" class="checkbox" />
		                                <label for="remember_${item.POP_MST_IDX}">오늘 하루 보지 않기</label>
									</c:if>	
		                            </div>
		                            <div class="pull-right">
		                                <a href="#!" class="close" data-id="${item.POP_MST_IDX}"><img src="${cdnDomain}/pc/img/common/close_pop.png" alt="" /></a>
		                            </div>
		                        </div>
		                    </div>
						</c:forEach>
					</c:when>
				</c:choose>				
                </div><!-- // 메인 팝업 2015-06-29 -->
                
                <div class="container breadcrumb-wrap"><!-- breadcrumb -->
                    <div id="breadcrumb" class="wrap">
                        <div class="holder">
                            <a href="#!" class="home"><span>홈</span></a>
                            <span class="gt">&gt;</span>
                            <strong class="warning">${topCateName}</strong>
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
                                    		<li><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=${item.PRD_CTG_IDX}">${item.PRD_CTG_NM }</span></a></li>
                                    	</c:forEach>
                                    </c:when>
                                </c:choose>
                            </ul>
                        </div><!-- // lnb -->

                        <div id="internal"><!-- internal -->

                            <h3 class="sr-only">카테고리 메인</h3>

                            <div class="clearfix pos-relative new-arrivals" style="background-image: url('${cdnDomain}${newArrivalsImgPath}');">
                                <h4 class="pos-absolute title-line">
                                    <span>NEW<br />ARRIVALS</span>
                                </h4>
                                <div id="list" class="list-product simple item-4 image"><!-- list-product -->
                                    <ul class="reset core">
									<c:choose>
				    					<c:when test="${not empty listNewProduct}">
			    							<c:forEach var="item" items="${listNewProduct}" varStatus="status">
			    								<li class="item"><!-- item -->
			                                        <div class="module">
			                                            <div class="col thumb"  data-code="${item.PRD_MST_CD}" data-colors="${item.PRODUCT_RGB}">
			                                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}"><img src="${cdnDomain}${item.PRD_IMAGE}" class="thumb188" alt="" /></a>
			                                            </div>
			                                            <div class="col core">
			                                                <div class="desc">
			                                                    <p class="name">
			                                                        <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}">${item.PRD_MST_NM}</a>
			                                                    </p>
			                                                </div>
			                                                <div class="prices">
			                                                    <p class="price-after">
			                                                        <fmt:formatNumber value="${item.PRD_MST_PRICE }"/>원
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
				    					</c:when>
				    				</c:choose>
                                    </ul>
                                </div><!-- // list-product -->
                            </div>

                            <h4 class="title"><span>WHAT DO YOU WANT TO EQUIP FOR TODAY?</span></h4>

                            <div class="grid section-today-recommend"><!-- section-today-recommend -->
								<c:choose>
								<c:when test="${not empty listStyleBanner}">
									<c:forEach var="item" items="${listStyleBanner}" varStatus="status">                   
										<div class="col col-1-3 nth-child-${status.count}">
		                                    <div class="module">
		                                        <a href="<c:out value="${empty item.BNR_DTL_TARGET ? '#!' : item.BNR_DTL_URL}"/>"  target="${item.BNR_DTL_TARGET eq 'N' ? '_blank' : '_self' }"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="" /></a>
		                                    </div>
		                                </div> 
									</c:forEach>
								</c:when>
								</c:choose>
                            </div><!-- // section-today-recommend -->

                            <h4 class="title">
                                <span>HOT ITEM</span>
                            </h4>

                            <div class="section-hotitem"><!-- section-hotitem -->

                                <div class="slidr-utils">
                                    <div id="pagerHotItem" class="slidr-pager bottom-center"></div>
                                    <div id="counterHotItem" class="slidr-counter top-right"></div>
                                    <a id="prevHotItem" href="#!" class="slidr-nav prev"><span class="icon"><em>이전</em></span></a>
                                    <a id="nextHotItem" href="#!" class="slidr-nav next"><span class="icon"><em>다음</em></span></a>
                                </div>
                                <div class="section-slider">
                                    <div id="hotitem" class="slidr js-prductSlidr"><!-- slider -->
                                        
                                        <!--
                                        <div id="list" class="itemwrap list-product simple item-4 image">
                                        </div>
                                        -->

                                    </div><!-- // slider -->
                                </div>

                            </div><!-- // section-hotitem -->
            
                            <div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

                        </div><!-- internal -->

                    </div><!-- wrap -->
                </div><!-- // container -->

            </div><!-- // inner -->
   
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>

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

$.json.itemsHotItem = {
    "group": [{
        "subject": "마켓플랜트",
        "items": [
<c:choose>
<c:when test="${not empty listHotProduct}">
	<c:forEach var="item" items="${listHotProduct}" varStatus="status">
			    {
			        "thumb": "${cdnDomain}${item.PRD_IMAGE}",
			        "src": "<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${item.PRD_MST_CD}",
			        "desc": "${item.PRD_MST_NM}",
			        "price": "${item.PRD_MST_PRICE }원",
			        "code": "${item.PRD_MST_CD}",
			        "colors": "${item.PRODUCT_RGB}",			        
			        "new": "${item.ICON_NEW}",
			        "md": "${item.ICON_MD}",
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

$(function() {

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

    // init slider
    $('#hotitem').productSlidr({
        indicatorURL: $.indicatorURL,
        json: $.json.itemsHotItem,
        formatter: function($item, _idx) {
            var _html = '';
            _html += '<li class="item"><div class="module">';
            _html += '<div class="col thumb" data-code="' + $item.code + '" data-colors="' + $item.colors + '">';
            _html += '<a href="' + $item.src + '"><img src="' + $item.thumb + '" class="thumb188" alt="" /></a>';
            _html += '</div>';
            _html += '<div class="col core">';
            _html += '<div class="desc"><p class="name"><a href="' + $item.src + '">' + $item.desc + '</a></p></div>';
            _html += '<div class="prices"><p class="price-after">' + setComma($item.price) + '</p></div>';
            _html += '<div class="labels">';
            if ($item.new === "Y") _html += '<span class="label new">NEW</span>&nbsp;';
            if ($item.md === "Y") _html += '<span class="label md">MD추천</span>&nbsp;';
            _html += '</div></div></div></li>';
            return _html;
        },
        // autoPlay: false,
        visibleLength: 4,
        sliderHeight: '340px',
        navPrev: '#prevHotItem',
        navNext: '#nextHotItem',
        counter: '#counterHotItem',
        pager: '#pagerHotItem',
        onInit: function(base) {
            var $list = base.$el.find('.itemwrap');
            $list.addClass('list-product simple item-4 image');
            setTimeout(function() {
                $list.setProductUtil();
            }, 1000);
        }
    });

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
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do?idx=${commandMap.idx}#list", "target":"_self", "method":"get"}).submit();
	};
	
	// 검색버튼 클릭 시 
	goSearch = function () 
	{
	    var $frm = $("#frm");
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do?idx=${commandMap.idx}#list", "target":"_self", "method":"get"}).submit();
	};
	
	// 정렬순서 선택
	goPageSort = function (pSort) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='pSort']").val(pSort);
	    $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/productList.do?idx=${commandMap.idx}#list", "target":"_self", "method":"get"}).submit();
	};
	
	// 라인 검색조건 선택 시 
	$(document).on("click", "input[name=searchLine]", function ()
    {    
 		var $frm = $("#frm"); 
 		var $lines = $frm.find("input[name=searchLine]");
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
	
	// 색상 검색조건 선택 시 
	$(document).on("click", "input[name=searchRepColor]", function ()
    {    
 		var $frm = $("#frm"); 
 		var $lines = $frm.find("input[name=searchRepColor]");
 		var chkCnt = 0;
 		$lines.each(function(){
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

	// 사이즈 검색조건 선택 시 
	$(document).on("click", "input[name=searchSize]", function ()
    {    
 		var $frm = $("#frm"); 
 		var $lines = $frm.find("input[name=searchSize]");
 		var chkCnt = 0;
 		$lines.each(function(){
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
	
    // 팝업 활성화
    var todayDate = new Date();
    var today = ""+(todayDate.getMonth()+1)+todayDate.getDate();
    
    $.fn.initPop = function(_css){
        var $this = $(this);
        $this.find('.close').on('click', function(e){
            var popup_idx = $(this).data("id");
            // 팝업 닫기전에 오늘하루 보지 않음 체크 
            if($this.find("input[id^=remember_]").is(":checked") == true )
            {
            	$.cookie("EtlandProductPopup_"+popup_idx+"_"+today, "Y", { path: '/', expires: 1 }  );
            }
            $this.removeClass('in');
        });
        $this.css(_css).addClass('in');
        return this;
    }

 	
    // layer popup open
<c:choose>
<c:when test="${not empty listPopup }" >
<c:forEach var="item" items="${listPopup }" varStatus="status">
		if ($.cookie("EtlandProductPopup_${item.POP_MST_IDX}_"+today)!="Y" ){
			$('#mainPop .popup').eq(${status.index}).initPop({
		        top: '${item.POP_MST_Y}px',
		        left:'${item.POP_MST_X}px',
		        width:'${item.POP_MST_W}px'
		    });
		}
</c:forEach>
</c:when>
</c:choose>	
	
	
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>