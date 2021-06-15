<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
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
	            <h2>등급별 쿠폰혜택 보기</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="level-coupon"><!-- level-coupon -->
	            <div class="apply" id="menuViewTab"><!-- apply -->
	                <a href="javascript:;" class="button small primary" data-tab_no="tab1"><span>PLATINUM</span><em class="blind">현재위치</em></a>
	                <a href="javascript:;" class="button small " data-tab_no="tab2"><span>VIP</span></a>
	                <a href="javascript:;" class="button small" data-tab_no="tab3"><span>GOLD</span></a>
	                <a href="javascript:;" class="button small" data-tab_no="tab4"><span>SILVER</span></a>
	                <a href="javascript:;" class="button small" data-tab_no="tab5"><span>RED</span></a>
	            </div><!-- // apply -->
				<!-- PLATINUM -->
	            <table border="0" cellpadding="0" cellspacing="0" id="tab1"><!-- table -->
	            <caption>구분, 쿠폰, 쿠폰상세로 구성된 등급별 쿠폰혜택입니다.</caption>
	            <colgroup>
	                <col style="width: 24%;">
	                <col style="width: 38%;">
	                <col style="width: auto;">
	            </colgroup>
	            <thead class="blind">
	                <tr>
	                    <th scope="col">구분</th>
	                    <th scope="col">쿠폰</th>
	                    <th scope="col">쿠폰상세</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr class="section">
	                    <th rowspan="3" scope="row">등급별<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon coupon-a"><strong>5</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>5만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 3천원</span></p>
	                        <p class="number">(무적쿠폰 5장)</p>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="coupon">
	                        <p class="coupon coupon-a"><strong>7</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>10만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 1만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="coupon">
	                        <p class="coupon ship"><span>무료배송</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>마켓플랜트<br />배송 한정</strong></p>
	                        <p class="number">(1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">생일 축하<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon coupon-a"><strong>10</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>50만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 10만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">포인트<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">포인트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.5% 적립</strong></p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">기프트</th>
	                    <td class="coupon">
	                        <span class="icon gift gift-a"><em class="blind">기프트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>A등급 기프트</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
	            <!-- VIP -->
	            <table border="0" cellpadding="0" cellspacing="0" id="tab2" style="display:none;"><!-- table -->
	            <caption>구분, 쿠폰, 쿠폰상세로 구성된 등급별 쿠폰혜택입니다.</caption>
	            <colgroup>
	                <col style="width: 24%;">
	                <col style="width: 38%;">
	                <col style="width: auto;">
	            </colgroup>
	            <thead class="blind">
	                <tr>
	                    <th scope="col">구분</th>
	                    <th scope="col">쿠폰</th>
	                    <th scope="col">쿠폰상세</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr class="section">
	                    <th rowspan="3" scope="row">등급별<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>5</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>5만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 3천원</span></p>
	                        <p class="number">(무적쿠폰 3장)</p>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>7</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>10만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 1만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="coupon">
	                        <p class="coupon ship"><span>무료배송</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>마켓플랜트<br />배송 한정</strong></p>
	                        <p class="number">(1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">생일 축하<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>10</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>40만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 8만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">포인트<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">포인트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.4% 적립</strong></p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th>기프트</th>
	                    <td class="coupon">
	                        <span class="icon gift gift-a"><em class="blind">기프트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>B등급 기프트</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
	            <!-- GOLD -->
	            <table border="0" cellpadding="0" cellspacing="0" id="tab3" style="display:none;"><!-- table -->
	            <caption>구분, 쿠폰, 쿠폰상세로 구성된 등급별 쿠폰혜택입니다.</caption>
	            <colgroup>
	                <col style="width: 24%;">
	                <col style="width: 38%;">
	                <col style="width: auto;">
	            </colgroup>
	            <thead class="blind">
	                <tr>
	                    <th scope="col">구분</th>
	                    <th scope="col">쿠폰</th>
	                    <th scope="col">쿠폰상세</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr class="section">
	                    <th rowspan="3" scope="row">등급별<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>5</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>5만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 3천원</span></p>
	                        <p class="number">(무적쿠폰 3장)</p>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>7</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>10만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 1만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="coupon">
	                        <p class="coupon ship"><span>무료배송</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>마켓플랜트<br />배송 한정</strong></p>
	                        <p class="number">(1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">생일 축하<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>10</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>30만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 5만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">포인트<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">포인트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.3% 적립</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
	            <!-- SILVER -->
	            <table border="0" cellpadding="0" cellspacing="0" id="tab4" style="display:none;"><!-- table -->
	            <caption>구분, 쿠폰, 쿠폰상세로 구성된 등급별 쿠폰혜택입니다.</caption>
	            <colgroup>
	                <col style="width: 24%;">
	                <col style="width: 38%;">
	                <col style="width: auto;">
	            </colgroup>
	            <thead class="blind">
	                <tr>
	                    <th scope="col">구분</th>
	                    <th scope="col">쿠폰</th>
	                    <th scope="col">쿠폰상세</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr class="section">
	                    <th scope="row">등급별<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>5</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>5만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 3천원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">생일 축하<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>10</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>20만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 3만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">포인트<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">포인트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.24% 적립</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
	            <!-- RED -->
	            <table border="0" cellpadding="0" cellspacing="0" id="tab5" style="display:none;"><!-- table -->
	            <caption>구분, 쿠폰, 쿠폰상세로 구성된 등급별 쿠폰혜택입니다.</caption>
	            <colgroup>
	                <col style="width: 24%;">
	                <col style="width: 38%;">
	                <col style="width: auto;">
	            </colgroup>
	            <thead class="blind">
	                <tr>
	                    <th scope="col">구분</th>
	                    <th scope="col">쿠폰</th>
	                    <th scope="col">쿠폰상세</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr class="section">
	                    <th scope="row">등급별<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>5</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>5만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 3천원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">생일 축하<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>10</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>10만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 2만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">포인트<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">포인트</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.24% 적립</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
	        </div><!-- // level-coupon -->
	
	        <div class="padder mt20">
	            <ul class="list list-a warning">
	                <li>쿠폰은 구매조건에 따라 상품 결제 시 적용할 수 있습니다. </li>
	                <li>해당 쿠폰의 사용 조건과 유효기간을 반드시 확인하여 주세요.</li>
	                <li>유효기간이 만료된 쿠폰은 자동 소멸되며 사용하신 쿠폰은 주문취소 및 반품하실 경우 재발급 되지 않습니다<br />
	                    단 상품발송 전 주문을 전체 취소하신 경우에는 쿠폰을 다시 사용하실 수 있습니다.
	                </li>
	            </ul>
	        </div>
				
		</article>
	<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
 	// tab 변경 
	$("#menuViewTab").on("click", "a", function () {
 		var this_tab_no = $(this).data('tab_no');

 		$("table").each(function(){
 			$(this).hide();
 		});
 		
 		$(this).parent().parent().find('a').each( function(i,item){
 			if( this_tab_no == $(item).data("tab_no") ){
 				$(item).addClass("primary");	
 			}	
 			else{
 				$(item).removeClass("primary");
 			}
 		});
 		
 		$("#"+this_tab_no).show();
 		
 	});
});
//]]>
</script>
</body>
</html>