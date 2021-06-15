<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="popup calc" data-size="450x520"><!-- page class : main, 팝업창 크기 -->

<h1 class="sr-only">LNS Mall Popup</h1>

<div id="popupContainer" class="popup-container"><!-- popup-container -->
    
    <h3 class="title">미리 계산하기</h3>

    <div class="wrap"><!-- padder -->

        <div class="border-top-thick border-bottom-thick"><!-- form -->

            <div class="clearfix product">
                <div class="brand-logo">
                    <img src="${cdnDomain}${BI}" alt="<ui:brand brandCD="${productInfo.PRD_MST_BRAND_CD }"/>" />
                </div>
                <div class="text">
                    <p class="name">${productInfo.PRD_MST_NM }</p>
                    <p class="desc">${productCategory.PRD_CTG_NM } / 상품코드 ${commandMap.PRD_MST_CD }</p>
                </div>
            </div>

            <div class="calc-wrapper"><!-- calc-wrapper -->

                <div class="section price"><!-- price -->
                    <table class="fixed core">
                        <caption>판매가격</caption>
                        <colgroup>
                            <col style="width: 50%;" />
                            <col style="width: auto;" />
                            <col style="width: 50%;" />
                        </colgroup>
                        <tr class="price-before">
                            <th class="subject"><span>판매가</span></th>
                            <td class="desc">&nbsp;</td>
                            <td class="num"><fmt:formatNumber value="${productInfo.PRD_MST_CONSUMER_PRICE }" groupingUsed="true" />원</td>
                        </tr>
                        <tr class="price-after">
                            <th class="subject"><span>혜택가</span></th>
                            <td class="desc">&nbsp;</td>
                            <td class="num"><fmt:formatNumber value="${productInfo.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" />원</td>
                        </tr>
                    </table>
                </div><!-- // price -->

                <div class="section save"><!-- save -->
                    <table class="fixed core">
                        <caption>할인적용</caption>
                        <colgroup>
                            <col style="width: 30%;" />
                            <col style="width: auto;" />
                            <col style="width: 30%;" />
                        </colgroup>
                        <tr class="point">
                            <th class="subject"><span>크라운 사용</span></th>
                            <td class="desc">
							<c:choose>
							<c:when test="${commandMap.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_NONE}">                        
                                <p>크라운는 로그인하신 후 확인하실 수 있습니다.</p>
                                <input type="text" class="text" id="usePoint" title="크라운 사용" value="0" disabled readonly />
							</c:when>  
							<c:when test="${
								commandMap.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_MALL
								or commandMap.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_OWN
								or commandMap.MEM_MST_MEMBER_GROUP eq Code.MEMBER_GROUP_SUB
							}">                        
                                <p>사용가능 크라운 <fmt:formatNumber value="${myPoint }" groupingUsed="true" /> C</p>
                                <input type="text" class="text" id="usePoint" title="크라운 사용" value="0" />
							</c:when>  
							<c:otherwise>
								<p>크라운는 일반회원만 사용하실 수 있습니다.</p>
								<input type="text" class="text" id="usePoint" title="크라운 사용" value="0" disabled readonly />
							</c:otherwise>                              
							</c:choose>
                            </td>
                            <td class="num" id="priceOff_point" >0C</td>
                        </tr>
						<tr class="coupon-save">
                            <th class="subject"><span>할인쿠폰 적용</span></th>
                            <td class="desc" colspan="2">
                                <select class="select" title="쿠폰 적용" id="useCoupon" >
								<c:choose>
								<c:when test="${not empty listProductCoupon}">
									<option value="">쿠폰 선택</option>
								<c:forEach var="item" items="${listProductCoupon }" varStatus="status">                                     
		                             <option data-base_amt="${item.BASE_AMT}" data-cupo_kind="${item.CUPO_KIND}" data-add_disc="${item.ADD_DISC}" value="${item.CUPO_NO}">${item.CUPO_NM }</option>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="">해당 상품에 사용할 쿠폰이 없습니다</option>
								</c:otherwise>
								</c:choose>                                    
                                </select>
                            </td>
                        </tr>                        
                        <tr class="coupon-product">
                            <th class="subject"><span>상품쿠폰 적용</span></th>
                            <td class="desc" id="priceOff-Percent">0%</td>
                            <td class="num" id="priceOff_coupon">0원</td>
                        </tr>
                        
                    </table>
                </div><!-- // save -->

                <div class="section total"><!-- total -->
                    <table class="fixed core">
                        <caption>할인금액</caption>
                        <colgroup>
                            <col style="width: 50%;" />
                            <col style="width: auto;" />
                            <col style="width: 50%;" />
                        </colgroup>
                        <tr class="price">
                            <th class="subject"><span>총 할인금액</span></th>
                            <td class="desc">&nbsp;</td>
                            <td class="num" id="totalPriceOff">0원</td>
                        </tr>
                        <tr class="payment">
                            <th class="subject"><span>최종결제금액</span></th>
                            <td class="desc">&nbsp;</td>
                            <td class="num">
                                <p class="result"><strong id="buyingPrice"><fmt:formatNumber value="${productInfo.PRICE_MEMBER_GROUP_MALL }" groupingUsed="true" /></strong>원</p>
                            </td>
                        </tr>
                    </table>

<c:if test="${not isLogin}">
                    <div class="guest"><!-- 비로그인 시 -->
                        <p class="message">
                            <strong class="block">로그인 시 쿠폰 및 크라운 등의 혜택을 확인하실 수 있습니다.</strong>
                        </p>
                    </div><!-- // 비로그인 시 -->
</c:if>                    

                </div><!-- // total -->

            </div><!-- // calc wrapper -->

        </div><!-- // form -->

        <div class="clearfix section-button"><!-- buttons -->
<c:if test="${isLogin}">        
            <a href="javascript:;" class="button large js-close"><span>확인</span></a>
</c:if>
<c:if test="${not isLogin}">            
            <a href="javascript:login();" class="button large primary"><span>로그인</span></a>
</c:if>            
        </div><!-- // buttons -->

    </div><!-- // wrap -->

</div><!-- // popup-container -->

<script src="<c:out value="${cdnDomain}" />/pc/js/plugins.js" charset="utf-8"></script>
<!--[if (gt IE 8)|!(IE)]> <!--> <script src="<c:out value="${cdnDomain}" />/pc/js/plugins/jquery.touchSwipe.1.3.3.min.js" charset="utf-8"></script> <!--<![endif]-->
<script src="<c:out value="${cdnDomain}" />/pc/js/base.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/main.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/defer.js" charset="utf-8" defer></script>
<script>

<c:if test="${isLogin}"> 

var retailPrice = ${productInfo.PRICE_MEMBER_GROUP_MALL};
var price = retailPrice;
var buyingPrice = retailPrice;
var myPoint = ${myPoint};

$(document).ready(function () {
	
	// 쿠폰 선택에 따른 연산 처리
	$('#useCoupon').change(function(){
    	price = retailPrice;
    	
		var coupon_no = $(this).val();
		var base_amt = parseInt($(this).find(':selected').data('base_amt'),10);
		var cupo_kind = $(this).find(':selected').data('cupo_kind');
		var add_disc = parseInt($(this).find(':selected').data('add_disc'),10);
		
		if(coupon_no!=''){
			
			// 쿠폰적용금액 확인
			if( price < base_amt ){
				$(this).val('');
				alert('선택하신 쿠폰은 '+setComma(base_amt)+'원 이상 상품에만 적용 가능합니다.');
				return;
			}
			
			// 쿠폰 할인 금액 적용 - 정액기준설정
			var discount_price = add_disc;
			// 쿠폰 할인 금액 적용 - 정율인 경우 재계산
			if('M'==cupo_kind){
				// 상품가 * 할인율 / 100
				discount_price = retailPrice * add_disc / 100;
				
				$("#priceOff-Percent").html(add_disc+"%");
		    	$("#priceOff_coupon").html("0원");
			}else{
				$("#priceOff-Percent").html("0%");
		    	$("#priceOff_coupon").html(setComma(add_disc)+"원");
			}
			price = retailPrice - discount_price;
		}
		else{
			// 할인금액 초기화
			$("#priceOff-Percent").html("0%");
	    	$("#priceOff_coupon").html("0원");
		}
    	
    	$("#usePoint").keyup();
		
	});
	
    /* $(document).on("change", "#useCoupon", function () 
    {
    	var priceOff = 0;
    	var priceOffPercent = 0;
    	price = retailPrice;

    	if( $(this).find(':selected').data("peramt1") > 0 ){
    		priceOffPercent = parseInt($(this).find(':selected').data("peramt1"));
    		priceOff = retailPrice * priceOffPercent / 100;
    		price = retailPrice - priceOff;
    	}
    	
    	if( $(this).find(':selected').data("peramt2") > 0 ){
    		price = parseInt($(this).find(':selected').data("peramt2"));
    		priceOff = retailPrice - price;
    		priceOffPercent = Math.round(100*priceOff/retailPrice);
    	}
    	
    	$("#priceOff-Percent").html(priceOffPercent+"%");
    	$("#priceOff_coupon").html(setComma(priceOff)+"원");
    	
    	$("#usePoint").keyup();
  	}); */
    
    $("#usePoint").keyup(function(){
    	
    	var point = 0;
    	
    	if ($(this).val() !=''){
    		point = parseInt($(this).val());
    	}
    	
    	if( point > myPoint ){
    		alert('보유 포인트 이상의 크라운은 사용할 수 없습니다.');
    		point = myPoint;    		
    	}
    	
    	if( point > price ){
    		alert('상품 구매금액 이상의 크라운은 사용할 수 없습니다.');
    		point = price;    		
    	}
    	
    	$(this).val(point);
    	$("#priceOff_point").text(setComma(point)+"P");

    	buyingPrice = price - point;    	
    	var totalPriceOff = retailPrice - buyingPrice;
    	$("#totalPriceOff").html(setComma(totalPriceOff));
    	$("#buyingPrice").html(setComma(buyingPrice));
    });
    
});	
</c:if>

	login = function() {
		opener.$('#_blank_form').attr({'action':'<c:out value="${frontDomain}" />/pc/manager/login.do','method':'post'}).submit();
		self.close();
	};
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>