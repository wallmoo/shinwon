<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-main"><%-- page class : main, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>



            <div class="container pt10"><!-- container -->
                
                <div class="padder section-banner"><!-- banner -->
                    <div class="grid">
                    <c:choose>
                    <c:when test="${not empty listBannerA }" >
                    <c:forEach var="item" items="${listBannerA }" varStatus="status">
                    	<div class="col-1-1">
                    <c:if test="${not empty item.BNR_DTL_TARGET }" >
                         	<a href="javascript:goNewPageUrl('${item.BNR_DTL_URL }','${item.BNR_DTL_TARGET}');"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" /></a>
					</c:if>
					<c:if test="${ empty item.BNR_DTL_TARGET}" >
                    		<img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" />
					</c:if>
						</div>                                 
                    </c:forEach>
                    </c:when>
                   	</c:choose>
                    </div>
                </div><!-- // banner -->

                <h3 class="title"><!-- title -->
                    <strong>BEST SELLER</strong>
                </h3><!-- // title -->
                            
                <div class="padder"><!-- padder -->
                    <div class="list-grid"><!-- list-grid -->
                        <ul class="row">
						<c:choose>
						<c:when test="${not empty listTopSeller}">
						<c:set var="listNum" value="1" />
						<c:forEach var="item" items="${listTopSeller }" varStatus="status">
							<li class="col-1-2" <c:if test="${listNum > 4 }">style="display: none"</c:if>>
                                <div class="holder">
                                    <!-- <p class="sticker-wrap">
                                    	<p class="sticker-wrap"><span class="sticker new"><span>NEW</span></span></p>
                                    </p> -->
                                    <p class="sticker-wrap"><span class="sticker new"><span>BEST</span></span></p>
                                    <div class="pic">
                                    	<a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="<c:out value="${cdnDomain }${item.PRD_IMAGE }" />" alt="<c:out value="${item.PRD_MST_NM }" />" class="thumb100" /></a>
                                    </div>
                                    <div class="desc">
                                        <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                        <p class="name"><a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><c:out value="${item.PRD_MST_NM }" /></a></p>
                                        <p class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></p>
                                    </div>
                                </div>
                            </li>                                                 
                        <c:set var="listNum" value="${listNum+1}" />
						</c:forEach>
						</c:when>   
						</c:choose>	
                        </ul>
                    </div><!-- // list-grid -->
                </div><!-- // padder -->

<c:if test="${fn:length(listTopSeller) > 4 }" >
                <div class="padder section-more" id="top_more"><!-- 더 보기 -->
                    <a href="javascript:;" class="button primary large block" id="moreTopProduct"><span>더 보기</span><span class="icon down"></span></a>
                </div><!-- // 더 보기 -->
</c:if>                

                <div class="hr"></div><!-- hr -->

				<div class="tab-a padder"><!-- tab-a -->
                    <ul class="tab js-tab-view">
                        <li class="col-1-2 active"><a href="#newArrivals"><span>MD'S CHOICE</span></a></li>
                        <li class="col-1-2"><a href="#mdsChoice"><span>New Arrivals</span></a></li>
                    </ul>
                </div><!-- // tab-a -->

                <div class="padder toggle-contents"><!-- padder -->
                    <div id="newArrivals" class="list-grid active"><!-- list-grid -->
                    <c:choose>
					<c:when test="${not empty listMdsChoice}">
                        <ul class="row">
						<c:forEach var="item" items="${listMdsChoice }" varStatus="status">
							<li class="col-1-2">
                                <div class="holder">
                                <c:choose>
									<c:when test="${item.ICON_BEST eq 'Y' }">
										<p class="sticker-wrap"><span class="sticker new"><span>BEST</span></span></p>
									</c:when>
									<c:when test="${item.ICON_BEST ne 'Y' && item.ICON_NEW eq 'Y'}">
										<p class="sticker-wrap"><span class="sticker new"><span>NEW</span></span></p>
									</c:when>
								</c:choose>
                                    <div class="pic">
                                    	<a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="<c:out value="${cdnDomain }${item.PRD_IMAGE }" />" alt="<c:out value="${item.PRD_MST_NM }" />" class="thumb100" /></a>
                                    </div>
                                    <div class="desc">
                                        <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                        <p class="name"><a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><c:out value="${item.PRD_MST_NM }" /></a></p>
                                        <p class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></p>
                                    </div>
                                </div>
                            </li>
						</c:forEach>
                        </ul>
                    </c:when>   
					</c:choose>
                    </div><!-- // list-grid -->

                    <div id="mdsChoice" class="list-grid hide"><!-- list-grid -->
                    <c:choose>
					<c:when test="${not empty listNewArrivals}">
                        <ul class="row">
						<c:forEach var="item" items="${listNewArrivals }" varStatus="status">
							<li class="col-1-2">
                                <div class="holder">
									<!-- <p class="sticker-wrap"><span class="sticker new"><span>BEST</span></span></p> -->
                                    <div class="pic">
                                    	<a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><img src="<c:out value="${cdnDomain }${item.PRD_IMAGE }" />" alt="<c:out value="${item.PRD_MST_NM }" />" class="thumb100" /></a>
                                    </div>
                                    <div class="desc">
                                        <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                        <p class="name"><a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}"><c:out value="${item.PRD_MST_NM }" /></a></p>
                                        <p class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></p>
                                    </div>
                                </div>
                            </li>
						</c:forEach>
                        </ul>
                	</c:when>   
					</c:choose>
                    </div><!-- // list-grid -->
	            </div><!-- // padder -->
  
                <div class="hr"></div><!-- hr -->

				<a id="product_list" ></a>

				<form id="frm" name="frm">
				<input type="hidden" id="idx" name="idx" value="<c:out value="${commandMap.idx }"/>"/>
			    <input type="hidden" id="cPage" name="cPage" value="1"/>
                <div class="padder section-sort"><!-- section-sort -->
                    <div class="grid sort-1-2">
                        <div class="col-1-2">
                            <div class="module">
                                <select id="productCategory2" class="select block" title="카테고리">
                                    <c:choose>
				    				<c:when test="${not empty listMenuCategory['2']}">
				    				<c:if test="${ empty commandMap.productCategory2 }" >
				    				<option value="">전체</option>
				    				</c:if>
				    				<c:forEach var="item" items="${listMenuCategory['2'] }" varStatus="status">     
                                    <option value="${item.PRD_CTG_IDX }" <c:if test="${commandMap.productCategory2 eq item.PRD_CTG_IDX}" >selected </c:if>>${item.PRD_CTG_NM }</option>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    	<option value="">상위카테고리를 먼저 선택하세요.</option>                                    
                                    </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                        <div class="col-1-2">
                            <div class="module">
                                <select id="productCategory3" class="select block" title="카테고리">
                                    <c:choose>
				    				<c:when test="${not empty listMenuCategory['3']}">
				    				<c:if test="${ empty commandMap.productCategory3 }" >
				    				<option value="">전체</option>
				    				</c:if>
				    				<c:forEach var="item" items="${listMenuCategory['3'] }" varStatus="status">     
                                    <option value="${item.PRD_CTG_IDX }" <c:if test="${commandMap.productCategory3 eq item.PRD_CTG_IDX}" >selected </c:if>>${item.PRD_CTG_NM }</option>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    	<option value="">상위카테고리를 먼저 선택하세요.</option>                                    
                                    </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="grid sort-1-2">
                        <div class="col-1-1">
                            <select class="select block" name="productPrice" title="가격대">
								<option value="">전체판매금액</option>
								<option value="0|100000" <c:if test="${commandMap.productPrice eq '0|100000'}" >selected </c:if>>10만원 미만</option>
								<option value="100000|200000" <c:if test="${commandMap.productPrice eq '100000|200000'}" >selected </c:if>>20만원 미만</option>
								<option value="200000|300000" <c:if test="${commandMap.productPrice eq '200000|300000'}" >selected </c:if>>30만원 미만</option>
								<option value="300000|400000" <c:if test="${commandMap.productPrice eq '300000|400000'}" >selected </c:if>>40만원 미만</option>
								<option value="400000|500000" <c:if test="${commandMap.productPrice eq '400000|500000'}" >selected </c:if>>50만원 미만</option>
								<option value="500000|1000000" <c:if test="${commandMap.productPrice eq '500000|1000000'}" >selected </c:if>>100만원 미만</option>
								<option value="1000000|" <c:if test="${commandMap.productPrice eq '1000000|'}" >selected </c:if>>100만원 이상</option>
							</select>
                        </div>
                    </div>
                    
                    <div class="grid sort-1-2">
                        <div class="col-1-1">
                            <select class="select block" name="pSort" title="가격대">
								<option value="1" <c:if test="${ empty commandMap.pSort || commandMap.pSort eq '1'}" > selected="selected"</c:if>>판매인기순</option>
								<option value="5" <c:if test="${ commandMap.pSort eq '5'}" > selected="selected"</c:if>>추천(평점)순</option>
								<option value="3" <c:if test="${ commandMap.pSort eq '3'}" > selected="selected"</c:if>>높은가격순</option>
								<option value="4" <c:if test="${ commandMap.pSort eq '4'}" > selected="selected"</c:if>>낮은가격순</option>
								<option value="6" <c:if test="${ commandMap.pSort eq '6'}" > selected="selected"</c:if>>할인율높은순</option>
								<option value="7" <c:if test="${ commandMap.pSort eq '7'}" > selected="selected"</c:if>>상품코드순</option>
							</select>
                        </div>
                    </div>
                </div><!-- // section-sort -->
                </form>

                <div class="padder">
                    <div class="list-row">
                        <ul class="row" id="ProductList">
						<c:choose>
					    <c:when test="${not empty listProduct}">
					    <c:set var="listNum" value="1" />
					    <c:forEach var="item" items="${listProduct }" varStatus="status">         
					    	<li class="col-1-1"><!-- col -->
                                <div class="holder">
                                <c:choose>
									<c:when test="${item.ICON_BEST eq 'Y' }">
										<p class="sticker-wrap"><span class="sticker new"><span>BEST</span></span></p>
									</c:when>
									<c:when test="${item.ICON_BEST ne 'Y' && item.ICON_NEW eq 'Y'}">
										<p class="sticker-wrap"><span class="sticker new"><span>NEW</span></span></p>
									</c:when>
								</c:choose>
                                    <div class="pic">
                                        <a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD }" ><img src="${cdnDomain }${item.PRD_IMAGE }" alt="${item.PRD_MST_NM }" class="thumb140"/></a>
                                    </div>
                                    <div class="desc">
										<c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
											<c:if test="${ item.PROD_PERAMT1 eq 0 }" >
											<span class="sale">(균일)</span>
							            </c:if>   
							            <c:if test="${ item.PROD_PERAMT1 > 0 }" >
							            	<span class="sale">${item.PROD_PERAMT1 }%<em>&#8595;</em></span>
		                                </c:if>
		                                </c:if>                                        
		                                <p class="brand"><ui:brand brandCD="${item.PRD_MST_BRAND_CD }"/></p>
                                        <p class="name"><a href="/mobile/product/product.do?prdMstCd=${item.PRD_MST_CD}&cat=${commandMap.idx}">${item.PRD_MST_NM }</a></p>
                                        <p class="event">${item.PRM_TEXT }</p>
                                        <p class="price">
                                        <c:if test="${ item.PRD_MST_CONSUMER_PRICE ne item.PRICE_MEMBER_GROUP_MALL }" >
                                        	<span class="price-before"><fmt:formatNumber value="${item.PRD_MST_CONSUMER_PRICE }"
												groupingUsed="true" /></span>
                                        </c:if>
                                        	<span class="price-after"><fmt:formatNumber value="${item.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></span>
                                        </p>
                                        <div class="action">
                                            <div class="icons">
                                            <c:if test="${item.PRD_POINT_YN eq 'Y' }" ><span class="icon mileage"><em>적립</em></span></c:if>
                                            <c:if test="${item.PRD_COUPON_YN eq 'Y' }" ><span class="icon coupon"><em>쿠폰</em></span></c:if>
                                            <c:if test="${item.PRD_EVENT_YN eq 'Y' }" ><span class="icon event"><em>EVENT</em></span></c:if>
                                            </div>
                                            <div class="size">
                                                <a href="javascript:;" class="js-button-size" data-prdMstCd="${item.PRD_MST_CD}" data-productName="${item.PRD_MST_NM }"><span class="icon size"><em>사이즈보기</em></span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li><!-- // col -->             
						</c:forEach>
						</c:when>
						</c:choose>                        
                        </ul>
                    </div><!-- // list-row -->
                </div><!-- // padder -->

<c:if test="${paging.lastPageNoOnPageList >1 }">
                <div class="padder section-more" id="product_more"><!-- 더 보기 -->
                    <a href="javascript:;" class="button primary large block" id="moreBrandProduct"><span>더 보기</span><span class="icon down"></span></a>
                </div><!-- // 더 보기 -->
</c:if>                

                <div class="hr"></div><!-- hr -->


                <c:choose>
                <c:when test="${not empty listBannerB }" >
                <div class="padder section-banner"><!-- banner -->
                    <div class="grid">
                    <c:forEach var="item" items="${listBannerB }" varStatus="status">
                    	<div class="col-1-2">
                            <div class="module">
                    <c:if test="${not empty item.BNR_DTL_TARGET }" >
                         	<a href="javascript:goNewPageUrl('${item.BNR_DTL_URL }','${item.BNR_DTL_TARGET}');"><img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" /></a>
					</c:if>
					<c:if test="${ empty item.BNR_DTL_TARGET}" >
                    		<img src="${cdnDomain}${item.CMM_FLE_ATT_PATH}${item.CMM_FLE_SYS_NM}" alt="${item.CMN_FLE_ALT_TXT }" class="full-width" />
					</c:if>
							</div>
                        </div>                                
                    </c:forEach>
                    </div>
                </div><!-- // banner -->
                </c:when>
                </c:choose>
                
            </div><!-- // container -->


<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

$(document).on("click","#moreTopProduct", function(){
	$('.padder .list-grid ul.row li').slideDown(); 
	$("#top_more").html('');
});


$(document).on("change", "select[id=productCategory2]", function (){
   	var $frm = $("#frm");
   	$frm.find("input[id='idx']").val(this.value);
   	$frm.find("select[name=productPrice]").val("");
    $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brand.do?#product_list", "target":"_self", "method":"get"}).submit();
});

$(document).on("change", "select[id=productCategory3]", function (){
   	var $frm = $("#frm");
   	$frm.find("input[id='idx']").val(this.value); 
   	$frm.find("select[name=productPrice]").val("");
   	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brand.do?#product_list", "target":"_self", "method":"get"}).submit();
});

$(document).on("change", "select[name=productPrice]", function (){
   	var $frm = $("#frm"); 	
   	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brand.do?#product_list", "target":"_self", "method":"get"}).submit();
});

$(document).on("change", "select[name=pSort]", function (){
   	var $frm = $("#frm"); 	
   	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/brand/brand.do?#product_list", "target":"_self", "method":"get"}).submit();
});


$(document).on("click","#moreBrandProduct", function(){
	
	$("#cPage").val( 1+eval($("#cPage").val()) );
	
	var url = "<c:out value="${mobileDomain}"/>/mobile/brand/moreBrandProduct.do";
    var data = new Object();
    data.idx = $("#idx").val();
	data.cPage = $("#cPage").val();
	data.brandSubCategory1 = $("select[name=brandSubCategory1] option:selected").val();
	data.brandSubCategory2 = $("select[name=brandSubCategory2] option:selected").val();
	data.productPrice = $("select[name=productPrice] option:selected").val();
	data.pSort = $("select[name=pSort] option:selected").val();
	$("#ProductList").after("<div style='display:none'></div>");
	$obj = $("#ProductList").next("div");
    $obj.load(url, data, function(data){ 
		  $(data).appendTo("#ProductList");
	});
    $obj.remove();
});

$(document).on("click",".js-button-size", function(){
	
	    var url = "<c:out value="${mobileDomain}"/>/mobile/product/productSize.do";
	    var data = new Object();
		data.prdCd = $(this).attr('data-prdCd');
		data.productName = $(this).closest("div.holder").find("p.name").text();
		$(".size-list").remove();
		$(this).parent().find("div").remove();
		$(this).after('<div class="size-list"></div>');
	    $obj = $(this).parent().find("div.size-list");
	    $obj.empty();
		$obj.load(url, data, function () {    });			
	} 
);

</script>

</body>
</html>