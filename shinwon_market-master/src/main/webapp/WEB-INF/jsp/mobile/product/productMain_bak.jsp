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
			<span class="blind">현제 카테고리 위치 센셕</span>
			<ul class="mn_list">    
				<li>
					<a href="javascript:void(0)" data-dep="dep_2"><strong><c:out value="${topCateName }" /></strong><span><span class="blind">상품수</span>(<fmt:formatNumber value="${totalCount }" groupingUsed="true" />)</span></a>
					<i class="ico_ar_b"></i>
				</li>
				<li>
					<a href="javascript:void(0)" data-dep="dep_3" class="btn_cate"><span>카테고리</span></a>
				</li>
			</ul>
			<ul id="dep_2" class="sub_list">
				<c:if test="${not empty listMenuCategory }">
					<c:forEach var="listMenuCategory" items="${listMenuCategory}" varStatus="Status">
						<li><a href="<c:out value="${mobileDomain }"/>/mobile/product/productMain.do?idx=<c:out value="${listMenuCategory.PRD_CTG_IDX }" />" <ui:select v="${listMenuCategory.PRD_CTG_IDX}" t="${cateIdx }" g="class=on"/> target="_self"><c:out value="${listMenuCategory.PRD_CTG_NM }" /></a></li>
					</c:forEach>
				</c:if>
			</ul>
			<ul id="dep_3" class="sub_list">
				<c:if test="${not empty CategorySubMenuList }">
					<c:forEach var="CateMenu" items="${CategorySubMenuList}" varStatus="Status">
						<c:if test="${CateMenu.PRD_CTG_LEVEL == 2 }">
							<li><a href="<c:out value="${mobileDomain }"/>/mobile/product/productList.do?idx=<c:out value="${CateMenu.PRD_CTG_IDX }" />" target="_self"><c:out value="${CateMenu.PRD_CTG_NM }" /></a></li>
						</c:if>
					</c:forEach>
				</c:if>
			</ul>
			<div class="list_type" style="display:block">
				
			</div>
		</nav>
		<!--// .cate_gnb E -->

		<!-- .cate_slider S -->
		<section class="cate_slider">
			<span class="blind">현제 카테고리 이벤트 배너 센셕</span>
			<ul class="slider">
				<c:if test="${not empty productMainProBannerList }">
					<c:forEach var="productMainProBannerList" items="${productMainProBannerList }" varStatus="i">
						<li>
							<a href="<c:out value="${productMainProBannerList.BNR_MST_URL}" />" target="<c:out value="${productMainProBannerList.BNR_MST_TGT_TARGET}" />">
								<img src="<c:out value="${cdnDomain}" /><c:out value="${productMainProBannerList.CMM_FLE_ATT_PATH}" /><c:out value="${productMainProBannerList.CMM_FLE_SYS_NM}" />" alt="<c:out value="${productMainProBannerList.CMN_FLE_ALT_TXT}" />" />
								<!-- <p>
									<strong>새해 복 여기에 담아 드립니다</strong>
									<span>새해의 시작, 따뜻한 음악까지 함께 담아드립니다.</span>
								</p> -->
							</a>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</section>
		<!--// .cate_slider E -->
		
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
									<li class="ui-block-b ${i.last ? 'last' : '' }" >
								</c:when>
								<c:otherwise>
									<li class="ui-block-a ${listNum == fn:length(listProduct) - 2 ? 'last' : '' }" >
								</c:otherwise>
							</c:choose>
								<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />&cateIdx=<c:out value="${cateIdx}" />','_self');" class="_pg_link" >
									<span class="tx_img">
										<c:if test="${listProduct.PRD_MST_SEL_STATE eq 'O' || listProduct.PRD_MST_SEL_CNT == 0}">
										<span class="sold_out"><i>일시품절</i></span>
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
										<c:if test="${listProduct.PRD_NOW_DST_POINT > 0}">
											<em class="discount">
												<span class="blind">할인률</span>
												<strong class="tx_num"><c:out value="${listProduct.PRD_NOW_DST_POINT}" /></strong>%
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
			//_idx.addClass('_ck_slider').bxSlider(_idx_opt);
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
</script>
</body>
</html>