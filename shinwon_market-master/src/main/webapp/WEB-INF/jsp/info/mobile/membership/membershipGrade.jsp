<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>멤버십안내</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder text-center mt30">
            <p>
                <strong class="xlarge">마켓플랜트  고객만을 위한 차별회된 혜택!</strong>
            </p>
            <p>
                <span class="info">고객 등급에 따라 차별회된 고품격 서비스를 제공!</span>
            </p>
            <p>
                <span class="info">전국 모든 지점에서 사용할 수 있는 마일리지 제공!</span>
            </p>
        </div>

        <div class="padder">
            <h3 class="mt50 large"><span class="warning">지점(오프라인) 회원</span></h3>
        </div>

        <h4 class="info-membership">고객등급 별 포인트 적립률</h4>
        
        <div class="padder">
            <ul class="list list-a mt20">
                <li>구매금액에 따른 포인트 적립 및 OK캐쉬백 포인트 적립</li>
                <li>전국 매장에서 현금처럼 사용 가능한 포인트 서비스</li>
            </ul>
        </div>

        <table class="table-d table-col table-membership mt20" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
        <caption>구분, VVIP, VIP, 일반으로 구성된 고객등급 별 포인트 적립률 안내 테이블입니다.</caption>
        <colgroup>
            <col style="width: 24%;" span="5" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col" colspan="2">구분</th>
                <th scope="col">VVIP</th>
                <th scope="col">VIP</th>
                <th scope="col">일반</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="2">포인트<br />적립률</td>
                <td>직영점</td>
                <td>0.8%</td>
                <td>0.3%</td>
                <td>-</td>
            </tr>
            <tr>
                <td class="line-left">인샵매장</td>
                <td>1.04%</td>
                <td>0.54%</td>
                <td>0.24%</td>
            </tr>
            <tr>
                <td colspan="2">OK Cashbag 적립</td>
                <td colspan="3">0.24% (인샵매장 제외)</td>
            </tr>
        </tbody>
        </table><!-- // table-d -->

        <h4 class="info-membership">고객 승급조건 및 등급유지조건</h4>

        <table class="table-d table-col table-membership" border="0" cellpadding="0" cellspacing="0" style="border-top: 0px;"><!-- table-d -->
        <caption>구분, VVIP, VIP, 일반으로 구성된 고객 승급조건 및 등급유지조건 안내 테이블입니다.</caption>
        <colgroup>
            <col style="width: 18%;" />
            <col style="width: auto;" />
            <col style="width: 35%;" />
            <col style="width: 12%;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col">구분</th>
                <th scope="col">VVIP</th>
                <th scope="col">VIP</th>
                <th scope="col">일반</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>승급<br />조건</td>
                <td>
                    <p>
                        [VIP 고객기준]<br />
                        24개월 이내<br />
                        500만원 이상<br />구매고객
                    </p>
                    <p class="mt10">
                        [일반고객기준]<br />
                        24개월 이내 3회<br />이상 800만원 이상<br />구매고객
                    </p>
                </td>
                <td>
                    [일반고객기준]<br />
                    24개월 이내 3회<br />이상 300만원 이상<br />구매고객
                </td>
                <td>회원 가입 고객</td>
            </tr>
            <tr>
                <td>등급유지<br />조건</td>
                <td>2년간 500만원<br />이상 구매시<br />고객등급 2년<br />자동연장</td>
                <td>2년간 300만원<br />이상 구매시<br />고객등급 2년<br />자동연장</td>
                <td>&nbsp;</td>
            </tr>
        </tbody>
        </table><!-- // table-d -->

        <div class="padder">
            <h3 class="mt50 large"><span class="warning">마켓플랜트  쇼핑몰(온라인) 회원</span></h3>
        </div>

        <div class="level-coupon level-coupon-info"><!-- level-coupon -->
            <div class="apply"><!-- apply -->
                <a id="goGrade1" href="javascript:goGrade(1);" class="button small primary goGrade" data-gnum="1"><span>PLATINUM</span><em class="blind">현재위치</em></a>
                <a id="goGrade2" href="javascript:goGrade(2);" class="button small goGrade" data-gnum="2"><span>VIP</span></a>
                <a id="goGrade3" href="javascript:goGrade(3);" class="button small goGrade" data-gnum="3"><span>GOLD</span></a>
                <a id="goGrade4" href="javascript:goGrade(4);" class="button small goGrade" data-gnum="4"><span>SILVER</span></a>
                <a id="goGrade5" href="javascript:goGrade(5);" class="button small goGrade" data-gnum="5"><span>RED</span></a>
            </div><!-- // apply -->
			<div id="grade1">
	            <table border="0" cellpadding="0" cellspacing="0"><!-- table -->
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
	                        <p class="number">(무적쿠폰 5장)</p>
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
	                        <p class="limit"><strong>마켓플랜트 <br />배송 한정</strong></p>
	                        <p class="number">(1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">생일 축하<br />무적쿠폰</th>
	                    <td class="coupon">
	                        <p class="coupon sale"><strong>10</strong><span>%할인</span></p>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>50만원 이상 구매시</strong></p>
	                        <p class="sale"><span class="primary">최대 10만원</span></p>
	                        <p class="number">(무적쿠폰 1장)</p>
	                    </td>
	                </tr>
	                <tr class="section">
	                    <th scope="row">마일리지<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">마일리지</em></span>
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
            </div>
            <div id="grade2">
            	<table border="0" cellpadding="0" cellspacing="0"><!-- table -->
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
	                        <p class="number">(무적쿠폰 5장)</p>
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
	                        <p class="limit"><strong>마켓플랜트 <br />배송 한정</strong></p>
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
	                    <th scope="row">마일리지<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">마일리지</em></span>
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
            </div>
            <div id="grade3">
	            <table border="0" cellpadding="0" cellspacing="0"><!-- table -->
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
	                        <p class="limit"><strong>마켓플랜트 <br />배송 한정</strong></p>
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
	                    <th scope="row">마일리지<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">마일리지</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.3% 적립</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
            </div>
            <div id="grade4">
	            <table border="0" cellpadding="0" cellspacing="0"><!-- table -->
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
	                        <p class="number">(무적쿠폰 3장)</p>
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
	                    <th scope="row">마일리지<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">마일리지</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.24% 적립</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
            </div>
            <div id="grade5">
	            <table border="0" cellpadding="0" cellspacing="0"><!-- table -->
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
	                        <p class="number">(무적쿠폰 3장)</p>
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
	                    <th scope="row">마일리지<br />(구매시<br />적립률)</th>
	                    <td class="coupon">
	                        <span class="icon mileage"><em class="blind">마일리지</em></span>
	                    </td>
	                    <td class="text-left">
	                        <p class="limit"><strong>0.24% 적립</strong></p>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table -->
            </div>
        </div><!-- // level-coupon -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>최근 3개월 구매금액(결제금액 기준이며 구매확정 이후 건만 적용)을 기준으로 등급이 책정되며, 매월 1일 적용</li>
                <li>쿠폰은 매월 1일 오전 6시 기준으로 반영되며, 12:00~06:00 시간 동안은 쿠폰 적용이 안됨 (쿠폰유효기간은 1개월, 재발급 없음)</li>
                <li>주문 취소/반품시 익월 반영</li>
                <li>회원혜택은 "무적쿠폰" 즉시쿠폰과 중복사용이 가능<br />
                    (단, 생일쿠폰만 중복X)</li>
                <li>구매제한금액은 상품판매가 기준으로 산정</li>
            </ul>
        </div>
    
	</article>
	<!--// #container E -->
	<!--// #container E -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(){

	$("#grade2").hide();
	$("#grade3").hide();
	$("#grade4").hide();
	$("#grade5").hide();
	 
});

// 제목 a Tag 클릭 이벤트
$(document).on("click", ".goGrade", function () {
    var num = $(this).data("gnum");
    for(var i=1;i<6;i++)
	{
		if(i==num)
		{
			$("#grade"+i).show();
			$("#goGrade"+i).addClass("primary");
		}
		else
		{
			$("#grade"+i).hide();
			$("#goGrade"+i).removeClass("primary");
		}
		
	}
});

 

</script>
</body>
</html>