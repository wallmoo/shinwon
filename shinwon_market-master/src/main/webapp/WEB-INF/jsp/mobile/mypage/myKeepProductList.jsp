<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
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

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>키핑백</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="tab-a" data-role="navbar"><!-- tab-a -->
	            <ul>
	                <li class="active"><a href="javascript:;">키핑상품</a><span class="blind">현재위치</span></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myKeepContentsList.do" class="_pg_link" target="_self">키핑콘텐츠</a></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myKeepPlanList.do" class="_pg_link" target="_self">키핑기획전</a></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myKeepEventList.do" class="_pg_link" target="_self">키핑이벤트</a></li>
	            </ul>
	        </div><!-- // tab-a -->
	
	        <div class="bbs-status"><!-- bbs-status -->
	            내가 키핑한 상품 <span class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></span>개 
	        </div><!-- // bbs-status -->
	
	        <div class="section-button bbs-button text-center section-button-keep"><!-- section-button -->
	            <a href="javascript:;" id="allCheck" class="button small _pg_link">전체선택</a>
	            <a href="javascript:selectedDeleteBtn();" class="button small _pg_link">선택상품 삭제</a>
	            <a href="javascript:soldOutDeleteBtn();" class="button small _pg_link">품절상품 삭제</a>
	            <a href="javascript:mutInsertCart();" class="button small _pg_link">장바구니 담기</a>
	        </div><!-- // section-button -->
	
			<form name="cartForm" id="cartForm">
		        <div class="keeping-product"><!-- keeping-product -->
		            <c:choose>
	                   	<c:when test="${not empty list }">
	                   		<c:set var="listNum" value="1" />
	                   		<ul>
				                <c:forEach var="row" items="${list }" varStatus="i">
					                <li class="col"><!-- row -->
					                    <input type="checkbox" class="checkbox" name="Check" value="<c:out value="${row.PRD_MST_CD }"/>^<c:out value="${row.PRD_MST_OPT_EST_CNT}" />^<c:out value="${row.MEM_KEP_IDX }"/>"  title="<c:out value="${row.PRD_MST_NM }"/> 선택" />
					                    <div class="item">
					                    	<c:choose>
			                                	<c:when test="${row.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP }">
			                                		<a href="javascript:alert('상품명 <c:out value="${row.PRD_MST_NM_FUL }"/> 판매 불가 상품이 포함되어 있습니다.')">
			                                	</c:when>
			                                	<c:when test="${row.PRD_MST_CNL_MB_YN ne 'Y' }">
			                                		<a href="javascript:alert('PC 전용 상품입니다.')">
			                                	</c:when>
			                                	<c:otherwise>
			                                		<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${row.PRD_MST_CD}" class="_pg_link" target="_self">
			                                	</c:otherwise>
			                                </c:choose>
					                            <span class="thumb">
								                    <c:if test="${row.PRD_MST_SEL_STATE == 'O' || PRD_MST_SEL_CNT == 0 }">
					                                	<i class="soldout"><span>일시품절</span></i>	                                	
					                                </c:if>
					                                <c:if test="${row.PRD_MST_SEL_STATE == 'T' }">
					                                	<i class="soldout"><span>품절</span></i>                            	
					                                </c:if>
					                            	<img src="<c:out value="${cdnDomain}" /><c:out value="${row.PRD_IMAGE}" />" alt="<c:out value="${row.PRD_IMAGE_ALT }"/>" />
					                            </span>
					                            <span class="subject"><c:out value="${row.PRD_MST_NM }"/></span>
					                        </a>
					                        <c:if test="${row.PRD_MST_ERP_PRC > 0 }">
						                        <p class="price-before">
						                            <span class="blind">소비자가</span><fmt:formatNumber value="${row.PRD_MST_ERP_PRC }" groupingUsed="true" />원
						                        </p>
					                        </c:if>
					                        <p class="price-after">
					                            <span class="blind">판매가</span><strong><fmt:formatNumber value="${row.PRD_MST_PRICE }" groupingUsed="true" /></strong>원
					                        </p>
	                                    	<c:if test="${row.REP_CNT != 0 }">
						                        <p class="reviews">
						                            <i class="ico_star0"><i class="star_<c:out value="${row.REP_POINT_GRD }"/>"><span class="blind">별점 10점 만점 중 <c:out value="${row.REP_POINT }"/>점</span></i></i>
						                            <span class="blind">상품평 개수</span>(<fmt:formatNumber value="${row.REP_CNT }" groupingUsed="true" />개)
						                        </p>
				                        	</c:if>
					                    </div>
					                    <div class="action">
					                    	<c:choose>
			                                	<c:when test="${row.PRD_MST_IVB_YN eq 'Y'}">
			                                    	<a href="javascript:setPaymentData('<c:out value="${row.PRD_MST_CD }"/>','<c:out value="${row.PRD_MST_OPT_EST_CNT}" />');" class="button warning _pg_link"><span>상담예약</span></a>
			                                    </c:when>
			                                    <c:otherwise>
			                                    	<a href="javascript:setPaymentData('<c:out value="${row.PRD_MST_CD }"/>','<c:out value="${row.PRD_MST_OPT_EST_CNT}" />');" class="button warning _pg_link"><span>바로구매</span></a>
			                                    </c:otherwise>
			                                </c:choose>
					                        <a href="javascript:insertCart('<c:out value="${row.PRD_MST_CD}" />','<c:out value="${row.PRD_MST_OPT_EST_CNT}" />');" class="button primary _pg_link"><span>장바구니 담기</span></a>
					                    </div>
					                </li><!-- // row -->
				                </c:forEach>
				            </ul>
	                   	</c:when>
	                   	<c:otherwise>
	                   		<p class="no-more">
			                	등록된 상품이 없습니다.
				            </p>
	                   	</c:otherwise>
	                </c:choose>
		        </div><!-- // keeping-product -->
		    </form>
	
	        <div class="padder mt20">
	            <ul class="list list-a mt10">
	                <li>키핑백에 담긴 상품은 바로구매나 장바구니에 담아 구매하실 수 있습니다.</li>
	                <li>바로구매나 장바구니 담기로 구매하는 경우 상품가격, 옵션, 사은품 내용은 키핑백에 담은 시점이 아닌 구매시점 내용으로 반영됩니다.</li>
	            </ul>
	        </div>
	
	         <form id="pageFrm" name="pageFrm">
        		 <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	             <div class="section-pagination"><!-- section pagination -->
	                 <ui:frontpaging paging="${paging }" jsFunction="goPage" />
	             </div><!-- // section pagination -->
             </form>
			<!-- #laypop S -->
			<%@ include file="/WEB-INF/jsp/mobile/product/productLayer.jsp" %>
			<!--// #laypop E -->	
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	// 페이지 이동
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myKeepProductList.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 결제 페이지로 이동 
	setPaymentData = function(prdMstCd,prdMstOptEstCnt)
	{

		var cartResult = true;
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		if(prdMstOptEstCnt > 0){
			alert("필수옵션을 선택해야 하는 상품입니다.\n상품상세로 이동합니다.");
			goProductView(prdMstCd);
			return;
 		}
		
		if(cartResult){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : {
		        			"PRD_MST_CD" : prdMstCd
		        			,"OPT_DTL_IDXs" : 0
		        			,"REQUEST_CNT_0" : 1
		        			,"MEM_CRT_DLV_GBN" : 2096
		        		},
	            url : "<c:out value="${mobileDomain}" />/mobile/cart/insertDirectPurchaseAjax.do",
	            success : function (data) 
	            { 
					switch (data.result) {
					case 1:
						$('#cartForm').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
						$('#cartForm').attr("method","post");
						<c:choose>
						<%-- 1. 비회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
						//$('#paymentform').attr('action','<c:out value="${mobileSslDomain}" />/pc/cart/cartLogin.do').submit();
						var url = location.href;
						url = encodeURIComponent(url);
						$('#cartForm').attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url, "target":"_self"}).submit();
						</c:when>
						<%-- 2. 회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'user'}">
						
						$('#cartForm').attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do", "target":"_self"}).submit();
						</c:when>
						</c:choose>
						break;
					default :
						alert(data.resultMsg);
						break;
					}
	            },
	            error : function (err)
	            {
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	            }
			});
		}
	};
    
	// 장바구니 담기
	insertCart = function(prdMstCd,prdMstOptEstCnt){
 		
 		if(prdMstOptEstCnt > 0){
			alert("필수옵션을 선택해야 하는 상품입니다.\n상품상세로 이동합니다.");
			goProductView(prdMstCd);
			return;
		}
 		
		$.ajax
        ({
            async : false,
            type : "POST",
            data : {
            			"PRD_MST_CD" : prdMstCd
            			,"OPT_DTL_IDXs" : 0
            			,"REQUEST_CNT_0" : 1
            			,"MEM_CRT_DLV_GBN" : 2096
            		},
            url : "<c:out value="${mobileDomain}" />/mobile/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		$("#topCartCnt").html(data.cartCnt);
            		$.com.util.layPop('open', $('#layCart'));//팝업 show
            		break;
            	default :
            		alert(data.resultMsg);
            		break;
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
		});
		
	};
	
	//전체체크
	$('#allCheck').on('click', function(){
		var checkboxCnt = $("input[name=Check]").length;	// 체크박스 갯수
		var checkedCnt = $("input[name=Check]:checked").length;	// 체크된 체크박스 갯수
		// 전체 선택
		if(checkedCnt == 0 || checkedCnt < checkboxCnt){
			$("input[name=Check]").each(function(){
				$(this).prop("checked",true);
			});
		}
		else{
			$("input[name=Check]").each(function(){
				$(this).prop("checked",false);
			});
		}			
		
	});
	
	//다중 장바구니 등록
	mutInsertCart = function(){
		if($("input[name=Check]:checked").length == 0){
			alert("장바구니에 담을 상품을 선택해주세요.");
			return;
		}
		
		var chkOptEstCnt = 0;
		var arrayPrdVal = "";
		$("input[name=Check]").each(function(){
			if($(this).is(":checked")){
				arrayPrdVal = $(this).val().split("^");
				if(arrayPrdVal[1] > 0){//필수 옵션이 있는 상품
					chkOptEstCnt ++;
				}
			}
		});
		
		if(chkOptEstCnt > 0 && $("input[name=Check]:checked").length == 1 ){
			alert("해당 상품은 필수 옵션이 있는 상품입니다.\n다중 장바구니 담기는 일반 상품만 가능합니다.");
			return;
		}
		
		var cartResult = "";
		var aryCartResult = "";
		var result = false;
		var topCartCnt = 0;
		var notCartResult = true;
		if(chkOptEstCnt > 0){//필수 옵션이 있는 상품이 있을 때
			if(confirm("선택하신 상품중 필수 옵션이 있는 상품이 있습니다\n해당 상품을 제외 하고 장바구니에 담으시겠습니까?")){
				$("input[name=Check]").each(function(){
					if($(this).is(":checked")){
						arrayPrdVal = $(this).val().split("^");
						if(arrayPrdVal[1] == 0){//필수 옵션이 없는 상품
							cartResult = insertCartMutil(arrayPrdVal[0]);
							if(cartResult.indexOf("^") != -1){
								aryCartResult = cartResult.split("^");
								if(aryCartResult[0] == "1"){
									result = true;
									topCartCnt = aryCartResult[1];
								}else{
									result = true;
									notCartResult = false;
									allEstResult = false;
								}
							}else{
								result = false;
							}
						}else if(arrayPrdVal[1] == $("input[name=Check]:checked").length){
							result = true;
							notCartResult = false;
							allEstResult = true;
						}else{
							result = true;
							notCartResult = false;
							allEstResult = false;
						}
					}
				});
 			}else{
 				return;
 			}
		}else{
			$("input[name=Check]").each(function(){
				if($(this).is(":checked")){
					arrayPrdVal = $(this).val().split("^");
					cartResult = insertCartMutil(arrayPrdVal[0]);
					if(cartResult.indexOf("^") != -1){
						aryCartResult = cartResult.split("^");
						if(aryCartResult[0] == "1"){
							result = true;
							topCartCnt = aryCartResult[1];
						}else{
							result = true;
							notCartResult = false;
							allEstResult = false;
						}
					}else{
						result = false;
					}
				}
			});
		}

		if(result){
			if(notCartResult){
				$("#topCartCnt").html(topCartCnt);
				$.com.util.layPop('open', $('#layCart'));//팝업 show
			}else if(allEstResult){
				$("#topCartCnt").html(topCartCnt);
				$.com.util.layPop('open', $('#laypopAllEstCart'));//팝업 show
			}else{
				$("#topCartCnt").html(topCartCnt);
				$.com.util.layPop('open', $('#laypopNotCart'));//팝업 show
			}
			
		}else{
			alert("예상외 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
	
	//장바구니 담기
	insertCartMutil = function(prdMstCd){
		$.ajax
	    ({
	        async : false,
	        type : "POST",
	        data : {
	        			"PRD_MST_CD" : prdMstCd
	        			,"OPT_DTL_IDXs" : 0
	        			,"REQUEST_CNT_0" : 1
	        			,"MEM_CRT_DLV_GBN" : 2096
	        		},
	        url : "<c:out value="${mobileDomain}" />/mobile/cart/insertCartAjax.do",
	        success : function (data) 
	        { 
	        	// 1 : 장바구니 등록 성공
	        	result = data.result+"^"+data.cartCnt;
	        },
	        error : function (err)
	        {
	        	result = "-2";
	        }
		});
		return result;
	};
	
	//상품 상세로 이동
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			$('#_blank_form').append("<input type=\"hidden\" name=\"prdMstCd\" value=\""+ prdMstCd +"\">");
			$('#_blank_form').attr({'action':'<c:out value="${mobileDomain}"/>/mobile/product/product.do','method':'get','target':'_self'}).submit();	
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
	
	//선택상품 삭제
	selectedDeleteBtn = function(){
		if($("input[name='Check']:checked").length == 0){
			alert("선택된 상품이 없습니다.");
			return;
		}
		
		if(confirm("선택상품 삭제하시겠습니까?")){
			var idx_arr = new Array();
			
			$("input[name='Check']:checked").each(function() {
				var arrayPrdVal = $(this).val().split("^");
				idx_arr[idx_arr.length] = arrayPrdVal[2];
			});
			deleteKeepProduct(idx_arr);
		}
	};
	
	// 서버에 삭제 요청
	deleteKeepProduct = function(idx_arr) {
		$.ajax({
					async : false,
					type : "POST",
					data : {
						"MEM_KEP_IDX[]" : idx_arr
					},
					url : "<c:out value="${mobileDomain}" />/mobile/mypage/deleteKeepProductAjax.do",
					success : function(data) {
						if(data.result == "Y"){
							alert("삭제되었습니다.");
							location.reload(true);							
						}
						else{
							alert("삭제 중 오류가 발생하였습니다.\n다시 시도해주세요.");
						}
					},
					error : function(err) {
						alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery
								|| console
										.log('오류가 발생하였습니다: ' + err.status);
					}
				});
	};
	
	//품절상품삭제
	 soldOutDeleteBtn = function(){
		if(confirm("품절상품 삭제하시겠습니까?")){
			
			$.ajax({
				async : false,
				type : "POST",
				url : "<c:out value="${mobileDomain}" />/mobile/mypage/deleteSoldOutKeepProductAjax.do",
				success : function(data) {
					if(data.result == "Y"){
						alert("삭제되었습니다.");
						location.reload(true);							
					}
					else if(data.result == "N"){
						alert("품절 상품이 없습니다.");
					}
					else{
						alert("삭제 중 오류가 발생하였습니다.\n다시 시도해주세요.");
					}
				},
				error : function(err) {
					alert("오류가 발생하였습니다.\n[" + err.status + "]");
					window.jquery
							|| console
									.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		}
	};
	
	//장바구니 이동
	goCartList = function(){
		$('#_blank_form').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','method':'get'}).submit();	
	};
});
//]]>
</script>
</body>
</html>