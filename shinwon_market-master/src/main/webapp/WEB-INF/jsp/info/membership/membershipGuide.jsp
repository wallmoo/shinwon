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
            <strong>멤버십안내</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <div id="contents" class="cs_con_d mem_con_d"><!-- #contents -->
        
			
			<h3 class="title">멤버십 가이드</h3>
            <hr class="hr-a" />

			<ul class="tab_d2 mt50">
				<li id="mTab"class="f on"><a href="javascript:goMembership();"><span>멤버십 안내</span><i class="ico_ar"></i></a></li>
				<li id="gTab" class="l"><a href="javascript:goGrade();"><span>등급별 혜택</span><i class="ico_ar"></i></a></li>
			</ul>
			<div id="membershipTab">
	            <p class="ti_history">
	            	<span class="large22">
						마켓플랜트  고객만을 위한 차별화된 혜택!<br/>
						쓸수록 쌓이는 마일리지로 더욱 알뜰하게 구매하세요!
					</span>
				</p>
	
	            <div class="membership-guide-a"><!-- membership-guide-a -->
	                <div class="grid">
	                    <div class="col col-1-2 nth-child-1">
	                        <div class="module">
	                            <h4>전국 매장에서 현금처럼<br />사용가능</h4>
	                            <p>
	                                마켓플랜트  전국 매장에서 제품 구매 후<br />
	                                멤버십카드를 제시하시면, 구매금액의 일정액을 포인트로<br />
	                                적립해드립니다. 
	                            </p>
	                            <p>
	                                적립된 포인트는 마켓플랜트  전국 매장에서 제품<br />구매시 현금처럼 사용하실 수 있습니다.
	                            </p>
	                            <p class="primary info">
	                                마켓플랜트  포인트 : 10,000점 이상 보유시<br />사용가능
	                            </p>
	                        </div>
	                    </div>
	                    <div class="col col-1-2 nth-child-2">
	                        <div class="module">
	                            <h4>OK캐쉬백 기능이 추가되어<br />더욱 스마트하게</h4>
	                            <p>
	                                마켓플랜트  멤버십카드는 Ok캐쉬백 기능을 내포하고<br />있습니다. 마켓플랜트 에서는 구매금액의 0.24%를 OK<br />캐쉬백 포인트로 적립해드립니다.
	                            </p>
	                            <p>
	                                전국 OK캐쉬백 가맹점에서도 마켓플랜트  멤버십카드를<br />통해 적립 및 사용이 가능합니다.
	                            </p>
	                            <p class="primary info">
	                                OK CASHBAG 포인트 : 1,000점 이상 보유시 사용가능
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div><!-- // membership-guide-a -->
				
				<h4 class="title ti_box"><strong>멤버십 신청방법</strong></h4>
	
	            <div class="membership-guide-b"><!-- membership-guide-b -->
	                <ul class="reset">
	                    <li class="col nth-child-2">
	                        <h5 class="reset">온라인 <span>신청</span></h5>
	                        <ol class="reset step">
	                            <li class="nth-child-1"><i class="icon"><!-- icon --></i>쇼핑몰 접속</li>
	                            <li class="nth-child-2"><i class="icon"><!-- icon --></i>회원 가입</li>
	                            <li class="nth-child-3 l"><span>마켓플랜트<br />멤버십 발급</span></li>
	                        </ol>
	                    </li>
	                </ul>
	            </div><!-- // membership-guide-b -->
	            
	        </div><!-- // #membershipTab -->
	        <div id="gradeTab">
	        	<p class="ti_history">
					<span class="large22">마켓플랜트  회원을 위한 특별한 혜택을 확인하고,<br/>
					행복한 쇼핑 서비스를 경험하세요.</span>
				</p>
	
	            <h4 class="title ti_box2"><strong class="warning">마켓플랜트</strong></h4>
				
				<h5 class="title large16 mt20">마켓플랜트 회원 등급</h5>
	            <table class="table-a table-col " border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
	            <caption>회원등급, PLATINUM, VIP, GOLD, SILVER, RED로 구성된 마켓플랜트  쇼핑몰(온라인) 회원 안내 테이블입니다.</caption>
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: 17%;" span="5" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th scope="col">회원등급</th>
	                    <th scope="col">PLATINUM</th>
	                    <th scope="col">VIP</th>
	                    <th scope="col">GOLD</th>
	                    <th scope="col">SILVER</th>
	                    <th scope="col">RED</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <th socpe="row">구매금액 기준</th>
	                    <td>100만원이상</td>
	                    <td>50~100만원</td>
	                    <td>30~50만원</td>
	                    <td>1~30만원</td>
	                    <td>미구매</td>
	                </tr>
	                <tr>
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
	                    <th socpe="row">무료배송</th>
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
	                    <th socpe="row">마일리지</th>
	                    <td>0.5%</td>
	                    <td>0.4%</td>
	                    <td>0.3%</td>
	                    <td>0.24%</td>
	                    <td>0.24%</td>
	                </tr>
	                <tr>
	                    <th socpe="row">생일쿠폰</th>
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
	                <tr>
	                    <th socpe="row">기프트</th>
	                    <td>A등급 키프트</td>
	                    <td>B등급 키프트</td>
	                    <td>&nbsp;</td>
	                    <td>&nbsp;</td>
	                    <td>&nbsp;</td>
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

$("#gradeTab").hide();

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