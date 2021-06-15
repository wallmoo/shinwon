<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="popup tooltip detail-buy" data-size="580x800"><!-- page class : main, 팝업창 크기 -->
 
<h1 class="sr-only">LNS Mall Popup</h1>
 
<div id="popupContainer" class="popup-container"><!-- popup-container -->
	
	<h3 class="title">배송방법선택</h3>
	<a class="stick-right" href="javascript:self.close();"><span class="icon close2"></span></a>
	<div class="pop detail-subject-wrapper border-top-thick"><!-- padder -->
		
		<div class="detail-subject"><!-- detail-subject -->
			<div class="holder clearfix">
				<div class="brand-logo">
					<img src="${cdnDomain}/pc/img/common/brand_prospecs_100x60.png" alt="프로스펙스">
				</div>
				<div class="text">
					<p class="name">W POWER 714</p>
					<p class="desc">Running Shoes / 상품코드 PW0UW14S714</p>
				</div>
			</div>
		</div>		
 
	</div><!-- // wrap -->
	<div class="info1">
		<p>해당 상품은 스마트 픽업이 가능한 상품입니다.<br>
		상품의 배송방법을 선택하신 후 주문절차를 진행하시기 바랍니다.</p>
		<input type="radio" id="deliverTypeA" name="deliverType" checked="checked" value="N" />
		<label for="deliverTypeA">일반배송</label> &nbsp; 
		<input type="radio" id="deliverTypeB" name="deliverType" value="Y" />
		<label for="deliverTypeB">스마트픽업</label>
	</div>
	<div class="info2 mb20"><!-- form -->
		<ul class="list-normal">
			<li>
				-      스마트픽업은 주문하신 상품을 고객님의 위치에서<br />
				&nbsp; 가장 가까운 매장을 지정하신 후 직접 내방하여 수령하시는 방법입니다.
			</li>
			<li>
				-      배송방법으로 스마트픽업을 선택하신 경우 택배비용 부과 상품도<br />
				&nbsp; 무료로 배송됩니다.
			</li>
			<li>
				-      매장에서 수령하시기 때문에 동일 제품에 대한 반품 / 교환 등은<br />
				&nbsp; 매장에서 직접 가능합니다.
			</li>
			<li>
				-      스마트픽업 선택 후 주문이 완료되면 고객님의 휴대폰으로<br />
				&nbsp; 주문번호가 SMS로 발송되며 이 주문번호로 지정하신 매장을 방문하여<br />
				&nbsp; 주문하신 상품을 수령하시면 됩니다.
			</li>
			<li>
				-      스마트픽업은 주문 완료 후 익일 오후 이후에 수령 가능합니다.<br />
				&nbsp; 단, 재고 확보 등으로 인하여 수령 시간이 지연되는 경우<br />
				&nbsp; 주문번호를 받으신 휴대폰으로 별도 안내를 드립니다.
			</li>
			<li>
				-      스마트픽업은 동일 브랜드에만 국한되며 주문하신 상품 중<br />
				&nbsp; 브랜드가 다를 경우에는 이용하실 수 없으며 OUTLET 상품도 이에 해당되므로<br />
				&nbsp; 착오 없으시기 바랍니다.
			</li>
		</ul>
	</div><!-- // form -->
	<div class="buttons text-center">
		<a href="javascript:self.close();" class="button xlarge">취소</a>
		<a href="javascript:goPaymentPage();" class="button xlarge primary" >구매하기</a>
	</div>
 
</div><!-- // popup-container -->
 
<script src="${cdnDomain}/pc/js/plugins.js" charset="utf-8"></script>
<script src="${cdnDomain}/pc/js/base.js" charset="utf-8"></script>
<script src="${cdnDomain}/pc/js/popup.js" charset="utf-8"></script>
<!--
<script>document.write('<script src="${cdnDomain}/pc/js/main.js?timeStamp='+Math.floor(+new Date()/1000)+'" charset="utf-8"><\/script>');</script>
-->
<script src="${cdnDomain}/pc/js/defer.js" charset="utf-8" defer></script>
<script> 
//<![CDATA[
	
	goPaymentPage = function(){
		
		var pickup = $(':radio[name="deliverType"]:checked').val();
      	opener.goPaymentPage(pickup);
      	self.close();
	};
//]]>
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>
