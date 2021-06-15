<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page-mypage -->
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">
		
		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
	    <article id="container" class="container">
	        <div class="minW contents"><!-- contents S -->
	
	            <dl class="loc">
	                <dt class="blind">현제 카테고리 경로</dt>
	                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
	                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
	                <dd><a href="javascript:;"><span>쇼핑활동</span></a></dd>
	                <dd class="l"><a href="javascript:;"><span>내가 구매한 상품</span></a></dd>
	            </dl>
	
	            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
	            <div id="body"><!-- #body -->

	                <h3 class="title">내가 구매한 상품</h3>
	
	                <div class="ct keeping-status mt30"><!-- keeping-status -->
	                    내가 구매한 상품 <strong class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></strong>개
	                    <div class="fr">
	                        <a href="javascript:;" id="allCheck" class="btn_st0 btn_white small"><span>전체선택</span></a>
	                        <a href="javascript:mutInsertCart();" class="btn_st0 btn_blk777 small"><span>장바구니 담기</span></a>
	                    </div>
	                </div><!-- // keeping-status -->
					<form name="cartForm" id="cartForm">
	                <div class="product-list-a my-product"><!-- product-list-a -->
	                	<c:choose>
	                		<c:when test="${not empty listProduct }">
	                			<ul class="ct">
	                				<c:forEach var="listProduct" items="${listProduct }" varStatus="status">
				                        <li>
				                            <div class="module">
				                                <input type="checkbox" class="checkbox" id="Check" name="Check" value="<c:out value="${listProduct.PRD_MST_CD }"/>^<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />"  title="<c:out value="${listProduct.PRD_MST_NM }"/> 선택" />
				                                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />">
				                                    <span class="thumb"><img src="<c:out value="${cdnDomain}" />/<c:out value="${listProduct.PRD_IMAGE}" />" class="thumb200" alt="<c:out value="${listProduct.PRD_IMAGE_ALT}" />" /></span>
				                                    <span class="subject"><c:out value="${listProduct.PRD_MST_NM }"/></span>
				                                </a>
				                                <c:if test="${not empty listProduct.OPT_DTL_NM or not empty listProduct.subPrdList}">
													<div class="option dotum">
														옵션 :
														<c:if test="${not empty listProduct.optionList}">
															<c:out value="${listProduct.OPT_DTL_NM}" />
															<c:if test="${not empty listProduct.subPrdList}">
																&nbsp;/&nbsp;
															</c:if>
														</c:if>
														
														<%-- 선택옵션 상품 리스트 --%>
														<c:if test="${not empty listProduct.subPrdList}">
															<c:forEach var="subPrd" items="${listProduct.subPrdList}" varStatus="i">
																${subPrd.OPT_DTL_NM}
																(
																			<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																				+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																			</c:if>
																		<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
																${i.last ? '' : '/&nbsp;'}	
															</c:forEach>
														</c:if>
													</div>
												</c:if>
												<c:if test="${listProduct.PRD_MST_ERP_PRC > listProduct.PRD_MST_PRICE }">
				                                	<p class="price-before"><span class="blind">소비자가</span><strong><fmt:formatNumber value="${listProduct.PRD_MST_ERP_PRC }" groupingUsed="true" /></strong>원</p>
				                                </c:if>
				                                <c:choose>
													<c:when test="${listProduct.PRD_NOW_DST_PRICE > 0}">
														<p class="price-after"><span class="blind">판매가</span><strong><strong class="co_red"><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /></strong></strong>원</p>
													</c:when>
													<c:otherwise>
														<p class="price-after"><span class="blind">판매가</span><strong><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /></strong>원</p>													
													</c:otherwise>
												</c:choose>
				                                <p class="date">주문일 <ui:formatDate value="${listProduct.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd"/></p>
				                                <p class="action">
				                                	<c:choose>
					                                	<c:when test="${listProduct.PRD_MST_IVB_YN eq 'Y'}">
					                                    	<a href="javascript:setPaymentData('<c:out value="${listProduct.PRD_MST_CD }"/>','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="btn_st0 btn_rd small"><span>상담예약</span></a>
					                                    </c:when>
					                                    <c:otherwise>
					                                    	<a href="javascript:setPaymentData('<c:out value="${listProduct.PRD_MST_CD }"/>','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="btn_st0 btn_rd small"><span>바로구매</span></a>
					                                    </c:otherwise>
					                                </c:choose>
				                                    <a href="javascript:insertCart('<c:out value="${listProduct.PRD_MST_CD }"/>','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="btn_st0 btn_blk777 small"><span>장바구니 담기</span></a>
				                                </p>
				                            </div>
				                        </li>
				                    </c:forEach>
			                   </ul>
	                		</c:when>
	                		<c:otherwise>
	                			<p class="message no-more">
			                        구매하신 상품이 없습니다.
			                    </p>
	                		</c:otherwise>
	                	</c:choose>
	                </div><!-- // product-list-a -->
	                </form>
	
	                <ul class="list list-a small mt20">
	                    <li>내가 구매한 상품을 쉽고 빠르게 확인하실 수 있습니다.</li>
	                    <li>최근 6개월간 구매한 상품 리스트입니다. </li>
	                    <li>현재 품절된 상품인 경우는 바로구매, 장바구니 담기가 안될 수 있습니다.</li>
	                </ul>
	
	                <form id="pageFrm" name="pageFrm">
	            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		                <div class="section-pagination"><!-- section pagination -->
		                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
		                </div><!-- // section pagination -->
	                </form>
	
	            </div><!-- // #body -->
			<!-- #laypop S -->
			<%@ include file="/WEB-INF/jsp/pc/product/productLayer.jsp" %>
			<!--// #laypop E -->
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<%-- 각 화면 본문 끝 --%>

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>
	<!--// #wrap E -->
<form id="popFrm" name="popFrm">
<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value=""/>
</form>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
$(function(){
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myBuyShoppingList.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 장바구니 담기
	insertCart = function(prdMstCd,prdMstOptEstCnt){
 		
 		if(prdMstOptEstCnt > 0){
 			if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
 				goProductView(prdMstCd);
 				return;
 			}else{
 				return;
 			}
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
            url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		$("#topCartCnt").html(data.cartCnt);
            		com.laypop('show',0,'laypopCart');//팝업 show
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
 			if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
 				goProductView(prdMstCd);
 				return;
 			}else{
 				return;
 			}
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
	            url : "<c:out value="${frontDomain}" />/pc/cart/insertDirectPurchaseAjax.do",
	            success : function (data) 
	            { 
					switch (data.result) {
					case 1:
						$('#cartForm').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
						$('#cartForm').attr("method","post");
						<c:choose>
						<%-- 1. 비회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
						//$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartLogin.do').submit();
						var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&ORD_MST_CD=" + data.ORD_MST_CD,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
						</c:when>
						<%-- 2. 회원 --%>
						<c:when test="${sessionUser.ROLE_USER eq 'user'}">
						$('#cartForm').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
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
	//전체체크
	$('#allCheck').on('click', function(){
		var checkboxCnt = $("input[name=Check]").length;	// 체크박스 갯수
		var checkedCnt = $("input[name=Check]:checked").length;	// 체크된 체크박스 갯수
		
		// 전체 선택
		if(checkedCnt == 0 || checkedCnt < checkboxCnt){
			$("input[name=Check]").prop("checked",true);
		}
		else{
			$("input[name=Check]").prop("checked",false);
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
			if(confirm("선택하신 상품중 필수 옵션이 있는 상품이 있습니다\n해당 상품을 제외 하고 장바구니에 담으 시겠습니까?")){
				$("input[name=Check]").each(function(){
					if($(this).is(":checked")){
						arrayPrdVal = $(this).val().split("^");
						if(arrayPrdVal[1] == 0){//필수 옵션이 있는 상품
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
				com.laypop('show',0,'laypopCart');//팝업 show	
			}else if(allEstResult){
				$("#topCartCnt").html(topCartCnt);
				com.laypop('show',0,'laypopAllEstCart');//팝업 show
			}else{
				$("#topCartCnt").html(topCartCnt);
				com.laypop('show',0,'laypopNotCart');//팝업 show	
			}
			
		}else{
			alert("예상외 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
	
	//간편보기
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
	
	//장바구니 이동
	goCartList = function(){
		$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();	
	};
});

//장바구니 담기
function insertCartMutil(prdMstCd){
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
        url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
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
}
//]]>
</script>
</body>