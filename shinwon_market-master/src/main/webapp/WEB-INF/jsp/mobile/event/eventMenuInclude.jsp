<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<nav class="_hd_fix">
		<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/eventMain.do', '');" class="mn_0 <c:if test="${menu eq 'event' }">on</c:if>"><strong>이벤트</strong></a>
		<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do', '');" class="mn_1 <c:if test="${menu eq 'member' }">on</c:if>"><strong>회원혜택</strong></a>
		<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/couponBenefit.do', '');" class="mn_2 <c:if test="${menu eq 'coupon' }">on</c:if>"><strong>쿠폰혜택</strong></a>
		<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/event/cardBenefit.do', '');" class="mn_3 <c:if test="${menu eq 'card' }">on</c:if>"><strong>카드혜택</strong></a>
	</nav>
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