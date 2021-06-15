<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<a href="<c:out value="${frontDomain }" />/pc/event/eventMain.do"><h2 class="ti"><span class="ir">EVENT ZONE<span>마켓플랜트에서 만나는 다양한 이벤트</span></span></h2></a>
<div class="ev_mn">
	<div>
		<a href="/pc/event/eventList.do" <c:if test="${menu eq 'event' }">class="on"</c:if> ><span>이벤트</span></a>
		<a href="/pc/event/memberBenefit.do" <c:if test="${menu eq 'member' }">class="on"</c:if> ><span>회원혜택</span></a>
		<a href="/pc/event/couponBenefit.do" <c:if test="${menu eq 'coupon' }">class="on"</c:if>><span>쿠폰혜택</span></a>
		<a href="/pc/event/cardBenefit.do" class="l <c:if test="${menu eq 'card' }">on</c:if>"><span>카드혜택</span></a>
	</div>
</div>	

<script type="text/javascript">
	checkAgt		= function(){
		
		var agt = navigator.userAgent.toLowerCase();
		
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agt.indexOf("msie") != -1) ) {
			return 'Internet Explorer';	
		}else{
			if (agt.indexOf("chrome") != -1) return 'Chrome'; 
			if (agt.indexOf("opera") != -1) return 'Opera'; 
			if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
			if (agt.indexOf("webtv") != -1) return 'WebTV'; 
			if (agt.indexOf("beonex") != -1) return 'Beonex'; 
			if (agt.indexOf("chimera") != -1) return 'Chimera'; 
			if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
			if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
			if (agt.indexOf("firefox") != -1) return 'Firefox'; 
			if (agt.indexOf("safari") != -1) return 'Safari'; 
			if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
			if (agt.indexOf("netscape") != -1) return 'Netscape'; 
			if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'; 
			if (agt.indexOf("msie") != -1) return 'Internet Explorer';
		}
	};
</script>