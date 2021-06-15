<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display marmot"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>LOOKBOOK</span></h3>
		    <a href="javascript:;" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- warp -->

				<h4 class="title background-none"><span><c:out value="${commandMap.LKB_MST_TITLE }"/></span></h4>

				<div class="gap">
				    <img src="<c:out value="${cdnDomain }"/>${lookBookImageMap.LKB_IMG_ATT_PATH}${lookBookImageMap.LKB_IMG_SYS_NM}" alt="${lookBookImageMap.LKB_IMG_TXT }" class="full"/>
				</div>
				
				<c:choose>
					<c:when test="${not empty imageProductList }">
						<h4 class="title background-none"><span>RELATED ITEM</span></h4>
		
						<div id="sliderLookbook" class="slidr-wrap grid-product pager-outter">
						    <a href="#!" class="slidr-nav in prev ml5"><span class="icon"><em>이전</em></span></a>
						    <a href="#!" class="slidr-nav in next mr5"><span class="icon"><em>다음</em></span></a>
						    <div class="slider lookbook">
						        <c:forEach var="item" items="${imageProductList }" varStatus="i">
							        <div class="item-product image " data-sale="null">
							            <div class="module">
							                <div class="thumb">
							                    <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${item.LKB_PRD_MST_CD}">
							                    	<img src="<c:out value="${cdnDomain }"/>${item.PRD_IMG}" alt="${item.PRD_MST_NM }" class="thumb144">
							                    </a>
							                </div>
							                <div class="desc">
							                    <p class="hello">
								                    <c:if test="${not empty item.PRM_TEXT}" >
												    	<span>[<c:out value="${item.PRM_TEXT }" />]</span>
												    </c:if>
											    </p>	
							                    <p class="name">
							                        <a href="/pc/product/product.do?prdMstCd=${item.LKB_PRD_MST_CD}">
						                       			<c:out value="${item.PRD_MST_NM }" />
							                        </a>
							                    </p>
							                    <p class="price-after">
							                        <fmt:formatNumber value="${item.PRD_PRICE }" groupingUsed="true" />원
							                    </p>
							                    <p class="labels">
											        <c:if test="${item.ICON_NEW eq 'Y' }">
									                	<span class="label new">NEW</span>
									                </c:if>
									                <c:if test="${item.ICON_MD eq 'Y' }">
														<span class="label md">MD추천</span>
									                </c:if>
											    </p>
							                </div>
							            </div>
							        </div>
								</c:forEach>
						    </div>
						</div>
					</c:when>
				</c:choose>

				<h4 class="title background-none mt10"><span>LOOKBOOK LIST</span></h4>

				<div class="lookbook-list"><!-- lookbook-list -->
					<c:choose>
			    		<c:when test="${not empty lookBookImgList }">
							<div id="masonry" class="grid masonry">
							    <div class="item-sizer">
								    <c:forEach var="lookBookImgRow" items="${lookBookImgList }" varStatus="i">
									    <div class="item">
									    	<div class="module">
										        <a href="javascript:;" data-lkb_img_idx = "${lookBookImgRow.LKB_IMG_IDX }">
										        	<img src="<c:out value="${cdnDomain }"/>${lookBookImgRow.LKB_IMG_ATT_PATH}${lookBookImgRow.LKB_IMG_SYS_NM}" alt="${lookBookImgRow.LKB_IMG_TXT }" class="full"/>
										        </a>
									        </div>
									    </div>
								    </c:forEach>
							    </div>
						    </div>
						</c:when>
					</c:choose>
				</div><!-- // lookbook-list -->
				
				<form id="frm" name="frm">
					<input type="hidden" name="LKB_MST_IDX" value="${commandMap.LKB_MST_IDX }" />
					<input type="hidden" name="LKB_MST_TITLE" value="${commandMap.LKB_MST_TITLE }" />
					<input type="hidden" name="LKB_IMG_IDX" value="" />
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            	</form>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
		</div><!-- // container -->
	</div><!-- // contents -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
$(function(){
	
	var $sliderLookbook = $("#sliderLookbook");

	$sliderLookbook.children('.slider').owlCarousel({
	    lazyLoad: true,
	    mouseDrag: false,
	    touchDrag: false,
	    items: 3,
	    singleItem: false,
	    autoHeight: false,
	    pagination: true,
	    itemsDesktop: [1199, 3],
	    itemsDesktopSmall: [979, 3],
	    itemsTablet: [768, 2],
	    itemsMobile: [479, 2]
	});

	var owlLookbook = $sliderLookbook.children('.slider').data('owlCarousel');

	$sliderLookbook.find('a.prev').on('click', function(e) {
	    e.preventDefault();
	    owlLookbook.prev();
	});

	$sliderLookbook.find('a.next').on('click', function(e) {
	    e.preventDefault();
	    owlLookbook.next();
	});

	// 하위 이미지 클릭 시 
	$(document).on("click",".module a",function()
	{
		var $frm = $("#frm");
		$("input[name='LKB_IMG_IDX']").val($(this).data("lkb_img_idx"));
		$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/brand/brandLookBookView.do", "target":"_self", "method":"get"}).submit();
	});
	
	
});
</script>

</body>
</html>