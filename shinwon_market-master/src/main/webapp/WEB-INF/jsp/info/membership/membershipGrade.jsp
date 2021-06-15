<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-membership">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>멤버십가이드</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/membership/membershipGuide.do" class="home"><span>멤버십 가이드</span></a>
            <span class="gt">&gt;</span>
            <strong>등급별혜택</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <div id="contents"class="cs_con_d lv_con_d mb50"><!-- #contents -->
        
			
			<h3 class="title">등급별혜택</h3>
            <hr class="hr-a" />

			<ul class="tab_d2 mt50">
				<li id="mTab"class="f"><a href="javascript:goMembership();"><span>멤버십 안내</span><i class="ico_ar"></i></a></li>
				<li id="gTab" class="l on"><a href="javascript:goGrade();"><span>등급별 혜택</span><i class="ico_ar"></i></a></li>
			</ul>
			<div id="membershipTab">
	            <p class="ti_history">
					마켓플랜트  고객만을 위한 차별화된 혜택!<br/>
					쓸수록 쌓이는 마일리지로 더욱 알뜰하게 구매하세요!
				</p>
	
	            <div class="membership-guide-a"><!-- membership-guide-a -->
	                <div class="grid">
	                    <div class="col col-1-2 nth-child-1">
	                        <div class="module">
	                            <h4>전국 매장에서 현금처럼<br />사용가능<i class="icon cash"><!-- icon --></i></h4>
	                            <p>
	                                마켓플랜트  전국 매장에서 제품 구매 후 멤버십카드를 제시하시면, 구매금액의 일정액을 포인트로 적립해드립니다. 
	                            </p>
	                            <p>
	                                적립된 포인트는 마켓플랜트  전국 매장에서 제품 구매시 현금처럼 사용하실 수 있습니다.
	                            </p>
	                            <p class="primary info">
	                                마켓플랜트  포인트 : 10,000점 이상 보유시 사용가능
	                            </p>
	                        </div>
	                    </div>
	                    <div class="col col-1-2 nth-child-2">
	                        <div class="module">
	                            <h4>OK캐쉬백 기능이 추가되어<br />더욱 스마트하게<i class="icon ok"><!-- icon --></i></h4>
	                            <p>
	                                마켓플랜트  멤버십카드는 Ok캐쉬백 기능을 내포하고 있습니다. 마켓플랜트 에서는 구매금액의 0.24%를 OK캐쉬백 포인트로 적립해드립니다.
	                            </p>
	                            <p>
	                                전국 OK캐쉬백 가맹점에서도 마켓플랜트  멤버십카드를 통해 적립 및 사용이 가능합니다.
	                            </p>
	                            <p class="primary info">
	                                OK CASHBAG 포인트 : 1,000점 이상 보유시 사용가능
	                            </p>
	                        </div>
	                    </div>
	                </div>
	                <div class="grid">
	                    <div class="col col-1-2 nth-child-3">
	                        <div class="module">
	                            <h4>마켓플랜트 <br />적립금 추가 지급<i class="icon point"><!-- icon --></i></h4>
	                            <ul class="list list-a">
	                                <li>최초 가입시 가입 기념 1,000포인트 기본제공</li>
	                                <li>행사시 특별 추가 포인트 지급(연중 수시)</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="col col-1-2 nth-child-4">
	                        <div class="module">
	                            <h4>멤버십 고객님들만을 위한<br />더욱 특별한 혜택<i class="icon benefit"><!-- icon --></i></h4>
	                            <p>
	                                방문고객, 구매금액별 및 행사모델 구매고객을 위한 특별사은품을 증정합니다.(연중 수시)
	                            </p>
	                            <ul class="list list-a">
	                                <li>소고기 프랜차이즈 "그램그램" 이용시 곁들임 메뉴(찌개류 또는 국수류 中택1)무료 제공</li>
	                            </ul>
	                            <p class="primary info">
	                                당사 멤버십카드 제시 必
	                            </p>
	                        </div>
	                    </div>
	                </div>
	                <div class="grid">
	                    <div class="col col-1-2 nth-child-5">
	                        <div class="module">
	                            <h4>마켓플랜트 만의<br />프리미엄 서비스<i class="icon premium"><!-- icon --></i></h4>
	                            <p>
	                                고객님의 실적에 따라 더욱 더 다양하고 특별한 혜택이 제공됩니다.
	                            </p>
	                            <p>
	                                구매실적에 따라 등급이 부여되며, 등급에 따라 적립 및 할인 혜택을 받으실 수 있습니다.
	                            </p>
	                            <p class="primary info">
	                                등급기준은 매년 변경될 수 있으며, 변경시 미리 서면안내 후 시행됩니다.
	                            </p>
	                        </div>
	                    </div>
	                    <div class="col col-1-2 nth-child-6">
	                        <div class="module">
	                            <h4>무상 A/S 연장 서비스<i class="icon as"><!-- icon --></i></h4>
	                            <p>
	                                삼성·LG VIP멤버십 서비스 가입시, 4대 품목 3년 무상 서비스 혜택을 받으실 수 있습니다.
	                            </p>
	                            <ul class="list list-a">
	                                <li>4대품목 : TV, 냉장고, 에어컨, 세탁기</li>
	                            </ul>
	                            <p class="primary info">
	                                조건 충족시 적용
	                            </p>
	                            <p class="primary info">
	                                각 메이커 정책에 한함 (확인필수)
	                            </p>
	                        </div>
	                    </div>
	                </div>
	                <div class="grid l">
	                    <div class="col col-1-2 nth-child-7">
	                        <div class="module">
	                            <h4>자체 물류센터를 통한 빠른<br />무료배송시스템<i class="icon ship"><!-- icon --></i></h4>
	                            <p>
	                                자체 물류센터를 통해 구입하신 제품을 원하시는 시간에 무료로 배송해드리는 차별화된 서비스를 제공합니다.
	                            </p>
	                            <p>
	                                무료 폐가전 수거는 물론, 택배배송 서비스도 함께합니다.
	                            </p>
	                            <p class="primary info">
	                                도서산간지역 및 일부지역의 경우 배송이 늦어질 수 있습니다.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div><!-- // membership-guide-a -->
				
				<h4 class="title ti_box"><strong>멤버십 신청방법</strong></h4>
	
	            <div class="membership-guide-b"><!-- membership-guide-b -->
	                <ul class="reset">
	                    <li class="col nth-child-1">
	                        <h5 class="reset">지점<span>신청</span></h5>
	                        <ol class="reset step">
	                            <li class="nth-child-1"><i class="icon"><!-- icon --></i>매장방문</li>
	                            <li class="nth-child-2"><i class="icon"><!-- icon --></i>통합회원 가입</li>
	                            <li class="nth-child-3 l"><span>마켓플랜트 <br />멤버십 발급</span></li>
	                        </ol>
	                    </li>
	                    <li class="col nth-child-2">
	                        <h5 class="reset">온라인 <span>신청</span></h5>
	                        <ol class="reset step">
	                            <li class="nth-child-1"><i class="icon"><!-- icon --></i>쇼핑몰 접속</li>
	                            <li class="nth-child-2"><i class="icon"><!-- icon --></i>통합회원 가입</li>
	                            <li class="nth-child-3 l"><span>마켓플랜트<br />멤버십 발급</span></li>
	                        </ol>
	                    </li>
	                    <li class="col nth-child-3">
	                        <h5 class="reset">시럽<span>신청</span></h5>
	                        <ol class="reset step">
	                            <li class="nth-child-1"><i class="icon"><!-- icon --></i><span>&lsquo;시럽 월렛&rsquo;<br/>애플리케이션 설치 후 실행<br/>‘마켓플랜트 ’ 검색</span></li>
	                            <li class="nth-child-2"><i class="icon"><!-- icon --></i><span>마켓플랜트 <br />멤버십카드 발급받기</span></li>
	                            <li class="nth-child-3"><i class="icon"><!-- icon --></i><span>필요정보 입력<br />및 약관동의</span></li>
	                            <li class="nth-child-4 l"><span>마켓플랜트<br />멤버십 발급</span></li>
	                        </ol>
	                    </li>
	                </ul>
	            </div><!-- // membership-guide-b -->
	            
	        </div><!-- // #membershipTab -->
	        <div id="gradeTab">
	        	<p class="ti_history">
					마켓플랜트  회원을 위한 특별한 혜택을 확인하고,<br/>
					지점과 온라인쇼핑몰에서 행복한 쇼핑 서비스를 경험하세요.<br/>
					<span class="tx_sub">
						마켓플랜트 은 오프라인 지점과 온라인 쇼핑몰에서는<br/>
						별도의 회원혜택 정책을 운영하고 있으며, 통합회원의 경우는  모든 혜택을 제공받으실 수 있습니다
					</span>
				</p>
	
	
	            <h4 class="title mt40 ti_box2"><strong class="warning">지점(오프라인) 회원</strong></h4>
	
	            <h5 class="title large16 mt30">고객등급 별 포인트 적립률</h5>
	
	            <ul class="list list-a mt20">
					<li>구매금액에 따른 포인트 적립 및 OK캐쉬백 포인트 적립</li>
					<li> 통합 회원의 경우, 오프라인 지점과 온라인에서 모두 사용할 수 있습니다.</li>
					<li>전국 매장에서 현금처럼 사용 가능한 포인트 서비스</li>
	            </ul>
	
	            <table class="table-a table-col mt20" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
	            <caption>구분, VVIP, VIP, 일반으로 구성된 등급별 포인트 적립률 안내 테이블입니다.</caption>
	            <colgroup>
	                <col style="width: 20%;" span="5" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th scope="col" colspan="2">구분</th>
	                    <th scope="col">VVIP</th>
	                    <th scope="col">VIP</th>
	                    <th scope="col">일반</th>
	                </tr>
	            </thead>
	            <tfoot>
	                <tr>
	                    <th scope="col" colspan="2"><strong>OK Cashbag 적립</strong></th>
	                    <th scope="col" colspan="3" class="tx_l"><strong>0.24% (인샵매장 제외)</strong></th>
	                </tr>
	            </tfoot>
	            <tbody>
	                <tr>
	                    <th socpe="rowgroup" rowspan="2"><strong>포인트 적립률</strong></th>
	                    <th socpe="row">직영점</th>
	                    <td>0.8%</td>
	                    <td>0.3%</td>
	                    <td>-</td>
	                </tr>
	                <tr>
	                    <th socpe="row" class="line-left">인샵매장</th>
	                    <td>1.04%</td>
	                    <td>0.54%</td>
	                    <td>0.24%</td>
	                </tr>
	            </tbody>
	            </table><!-- // table-a -->
	
	            <h5 class="title large16">고객 승급조건 및 등급유지조건</h5>
	
	            <table class="table-a table-col " border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
	            <caption>구분, VVIP, VIP, 일반으로 구성된 고객 승급조건 및 등급유지조건 안내 테이블입니다.</caption>
	            <colgroup>
	                <col style="width: 25%;" span="4" />
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
	                    <th socpe="row"><strong>승급조건</strong></th>
	                    <td>
	                        <p>
	                            <strong>[VIP 고객기준]</strong><br />
	                            24개월 이내<br />
	                            500만원 이상 구매고객
	                        </p>
	                        <p>
	                            <strong>[일반고객기준]</strong><br />
	                            24개월 이내 3회 이상 <br />
	                            800만원 이상 구매고객
	                        </p>
	                    </td>
	                    <td>
	                        <strong>[일반고객기준]</strong><br />
	                        24개월 이내 3회 이상<br />
	                        300만원 이상 구매고객
	                    </td>
	                    <td>회원가입 고객</td>
	                </tr>
	                <tr>
	                    <th socpe="row"><strong>등급유지조건</strong></th>
	                    <td>2년간 500만원 이상 구매시<br />고객등급 2년 자동연장</td>
	                    <td>2년간 300만원 이상 구매시<br />고객등급 2년 자동연장</td>
	                    <td>&nbsp;</td>
	                </tr>
	            </tbody>
	            </table><!-- // table-a -->
	
	            <h4 class="title ti_box2"><strong class="warning">마켓플랜트  쇼핑몰(온라인) 회원</strong></h4>
				
				<h5 class="title large16 mt20">마켓플랜트  쇼핑몰(온라인) 회원</h5>
	            <table class="table-a table-col " border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
	            <caption>회원등급, PLATINUM, VIP, GOLD, SILVER, RED로 구성된 마켓플랜트  쇼핑몰(온라인) 회원 안내 테이블입니다.</caption>
	            <colgroup>
	                <col style="width: 8%;" />
	                <col style="width: auto;" />
	                <col style="width: 16%;" span="5" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th scope="col" colspan="2">회원등급</th>
	                    <th scope="col">PLATINUM</th>
	                    <th scope="col">VIP</th>
	                    <th scope="col">GOLD</th>
	                    <th scope="col">SILVER</th>
	                    <th scope="col">RED</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <th socpe="row">기준</th>
	                    <th socpe="row">구매금액</th>
	                    <td>100만원이상</td>
	                    <td>50~100만원</td>
	                    <td>30~50만원</td>
	                    <td>1~30만원</td>
	                    <td>미구매</td>
	                </tr>
	                <tr>
	                    <th socpe="rowgroup" rowspan="5">혜택</th>
	                    <th socpe="row" rowspan="2">쿠폰</th>
	                    <td>
	                        5% 할인쿠폰(5)<br />
	                        &lt;최대 3천원&gt;<br />
	                        <span class="warning">5만원이상구매시</span>
	                    </td>
	                    <td>
	                        5% 할인쿠폰(3)<br />
	                        &lt;최대 3천원&gt;<br />
	                        <span class="warning">5만원이상구매시</span>
	                    </td>
	                    <td>
	                        5% 할인쿠폰(3)<br />
	                        &lt;최대 3천원&gt;<br />
	                        <span class="warning">5만원이상구매시</span>
	                    </td>
	                    <td>
	                        5% 할인쿠폰(1)<br />
	                        &lt;최대 3천원&gt;<br />
	                        <span class="warning">5만원이상구매시</span>
	                    </td>
	                    <td>
	                        5% 할인쿠폰(1)<br />
	                        &lt;최대 3천원&gt;<br />
	                        <span class="warning">5만원이상구매시</span>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="line-left">
	                        7% 할인쿠폰(1)<br />
	                        &lt;최대 1만원&gt;<br />
	                        <span class="warning">10만원이상구매시</span>
	                    </td>
	                    <td>
	                        7% 할인쿠폰(1)<br />
	                        &lt;최대 1만원&gt;<br />
	                        <span class="warning">10만원이상구매시</span>
	                    </td>
	                    <td>
	                        7% 할인쿠폰(1)<br />
	                        &lt;최대 1만원&gt;<br />
	                        <span class="warning">10만원이상구매시</span>
	                    </td>
	                    <td>&nbsp;</td>
	                    <td>&nbsp;</td>
	                </tr>
	                <tr>
	                    <th socpe="row" class="line-left">무료배송</th>
	                    <td>
	                        무료배송쿠폰(1)<br />
	                        &lt;마켓플랜트상품만&gt;
	                    </td>
	                    <td>
	                        무료배송쿠폰(1)<br />
	                        &lt;마켓플랜트상품만&gt;
	                    </td>
	                    <td>
	                        무료배송쿠폰(1)<br />
	                        &lt;마켓플랜트상품만&gt;
	                    </td>
	                    <td>&nbsp;</td>
	                    <td>&nbsp;</td>
	                </tr>
	                <tr>
	                    <th socpe="row" class="line-left">마일리지</th>
	                    <td>0.5%</td>
	                    <td>0.4%</td>
	                    <td>0.3%</td>
	                    <td>0.24%</td>
	                    <td>0.24%</td>
	                </tr>
	                <tr>
	                    <th socpe="row" class="line-left">생일쿠폰</th>
	                    <td>
	                        10% 할인쿠폰(1)<br />
	                       최대 10만원할인<br />
	                        <span class="warning">50만원이상구매시</span>
	                    </td>
	                    <td>
	                        10% 할인쿠폰(1)<br />
	                       최대 8만원할인<br />
	                        <span class="warning">40만원이상구매시</span>
	                    </td>
	                    <td>
	                        10% 할인쿠폰(1)<br />
	                       최대 5만원할인<br />
	                        <span class="warning">30만원이상구매시</span>
	                    </td>
	                    <td>
	                        10% 할인쿠폰(1)<br />
	                       최대 3만원할인<br />
	                        <span class="warning">20만원이상구매시</span>
	                    </td>
	                    <td>
	                        10% 할인쿠폰(1)<br />
	                       최대 2만원할인<br />
	                        <span class="warning">10만원이상구매시</span>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table-a -->
	
	            <p class="reset primary info mt30">
	                최근 3개월 구매금액(결제금액 기준이며 구매확정 이후 건만 적용)을 기준으로 등급이 책정되며, 매월 1일 적용
	            </p>
	
	            <p class="reset primary info">
	                쿠폰은 매월 1일 오전 6시 기준으로 반영되며, 12:00~06:00 시간동안은 쿠폰 적용이 안됨 (쿠폰유효기간은 1개월, 재발급 없음)
	            </p>
	
	            <p class="reset primary info">
	                주문 취소/반품시 익월 반영
	            </p>
	
	            <p class="reset primary info">
	                구매제한금액은 상품판매가 기준으로 산정
	            </p>
	            
	        </div><!-- // #gradeTab -->
	        
        </div>

    </div>
</div><!-- // #container -->

<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script type="text/javascript">

$("#membershipTab").hide();

function goMembership(){
	$("#membershipTab").show();
	$("#gradeTab").hide();
	$("#mTab").addClass("on");
	$("#gTab").removeClass("on");
	
	$("#contents").removeClass("lv_con_d");
	$("#contents").removeClass("mb50");
	$("#contents").addClass("mem_con_d");
	
	
};
function goGrade(){
	$("#membershipTab").hide();
	$("#gradeTab").show();
	$("#gTab").addClass("on");
	$("#mTab").removeClass("on");
	
    $("#contents").removeClass("mem_con_d");
    $("#contents").addClass("lv_con_d");
	$("#contents").addClass("mb50");
};

 
 
 

//]]>
</script>


</body>
</html>