<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
   
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>브랜드 스토리</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
		</div>
		<!--// .section-title E -->
        <div class="tab-a" data-role="navbar"><!-- tab-a -->
            <ul>
                <li id="goIntro" class="active"><a href="javascript:goIntro();">브랜드 스토리</a><span class="blind">현재위치</span></li>
                <li id="goHis"><a href="javascript:goHis1();">연혁</a></li>
            </ul>
        </div><!-- // tab-a -->
		<div id ="intro">
	        <div>
	            <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/info_about_obj.png" alt="" />
	        </div>
	
	        <div class="padder about-a"><!-- about-a -->
	            <h3 class="mt30 large20">전자유통의 메카, <span class="warning">마켓플랜트</span></h3>
	
	            <p class="mt20">
	                (주) 마켓플랜트는 1988년 국내 최초로 최대규모의 전자유통전문점의 새로운 활로를 개척해왔습니다.<br />
	                마켓플랜트는 전국 110여개 매장을 100% 직영으로 운영하고 있으며 국내 외 100여 개 유수 업체의 영상/음향/생활 가전 및 컴퓨터 &middot; IT 품목 &middot; 수입기기와 모바일 상품 등을 취급하는 동시에 전국 무료 배송, 폐가전 무료수거 등 다양한 고객서비스를 제공하고 있습니다.
	            </p>
	
	            <p class="mt10">
	                2013년에는 신개념 창고형매장  오픈을 통해 유통비용을 최소화하여 합리적인 가격으로 주방 &middot; 생활용품, 아이디어 상품 등 다양한 생활잡화를 제공하여 쇼핑을 편의를 제공하고 있습니다. 
	            </p>
	        </div><!-- about-a -->
	

		</div>
		<div id="history">
			<div class="padder history-wrap"><!-- history-wrap -->
	
	            <p>
	                마켓플랜트는 1985년 설립이래 고객을 가장 소중히 생각하는 기업입니다.  20년 동안 늘 고객과 함께하는 마음을 값진 땀방울을 흘려왔습니다.
	            </p>
	
	            <div class="tab-b" data-role="navbar"><!-- tab-b -->
	                <ul class="tab">
	                    <li id="goHis1" class="active"><a href="javascript:goHis1();"><span>2011~현재</span><span class="blind">년</span></a><span class="blind">현재위치</span></li>
	                    <li id="goHis2" ><a href="javascript:goHis2();"><span>1985~2010</span><span class="blind">년</span></a></li>
	                </ul>
	            </div><!-- // tab-b -->
	            <div id="history1">
					<div class="history-list"><!-- history-list -->
		                <div class="section">
		                    <h3><span class="warning large18">2016</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>02<span class="blind">월</span></strong>
		                            쿡앤킹 실크로드점 오픈
		                        </li>
		                        <li>
		                            <strong>01<span class="blind">월</span></strong>
		                            포브스 주관 2016 소비자 선정 최고의 브랜드 대상 수상
		                        </li>
		                    </ul>
		                </div>
		                <div class="section">
		                    <h3><span class="warning large18">2015</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>12<span class="blind">월</span></strong>
		                            한경미디어그룹 K- 가전유통부문 마켓플랜트 쿡앤킹
		                        </li>
		                        <li>
		                            <strong>11<span class="blind">월</span></strong>
		                            동아일보 주관 2015 고객의 마음을 움직이는 2015 공감브랜드 대상 수상
		                        </li>
		                        <li>
		                            <strong>11<span class="blind">월</span></strong>
		                            한국경제신문 주관 2015 대한민국 명품브랜드 대상 수상
		                        </li>
		                        <li>
		                            <strong>10<span class="blind">월</span></strong>
		                            마리오아울렛점,전주코아세이브존점오픈
		                        </li>
		                        <li>
		                            <strong>09<span class="blind">월</span></strong>
		                            해운대세이브존점 오픈
		                        </li>
		                        <li>
		                            <strong>04<span class="blind">월</span></strong>
		                            청주 하나로마트점 오픈
		                        </li>
		                        <li>
		                            <strong>03<span class="blind">월</span></strong>
		                            목포 하나로마트점 오픈
		                        </li>
		                    </ul>
		                </div>
		                <div class="section">
		                    <h3><span class="warning large18">2014</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>02<span class="blind">월</span></strong>
									국가인증우수쇼핑점 지정 (문화체육관광부, 한국관광공사)
		                            <p class="desc">
		                                둔산점, 도동점, 상남점 등 30지점 (총 33지점 국가인증쇼핑점 인증)
		                            </p>
		                        </li>
		                        <li>
		                            <strong>08<span class="blind">월</span></strong>
		                            TAX FREE 외국인 특화매장 쿡앤킹 명동점 오픈
		                        </li>
		                        <li>
		                            <strong>07<span class="blind">월</span></strong>
		                            동래메가마트점, 기장메가마트점 오픈
		                        </li>
		                        <li>
		                            <strong>06<span class="blind">월</span></strong>
		                            마리오아울렛점,전주코아세이브존점오픈
		                        </li>
		                        <li>
		                            신개념 창고매장 마켓플랜트  34지점 리뉴얼 오픈
		                        </li>
		                    </ul>
		                </div>
		                <div class="section">
		                    <h3><span class="warning large18">2013</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>11<span class="blind">월</span></strong>
		                            콜센터품질지수(KS-CQI) 전자제품 부문 1위 (한국표준협회)
		                        </li>
		                        <li>
		                            마켓플랜트  55지점 리뉴얼 오픈
		                        </li>
		                        <li>
		                            <strong>03<span class="blind">월</span></strong>
		                            신개념 창고매장 마켓플랜트  춘천점 1호점 오픈 
		                        </li>
		                    </ul>
		                </div>
		                <div class="section">
		                    <h3><span class="warning large18">2012</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
								<strong>01<span class="blind">월</span></strong>
		                            국가인증우수쇼핑점 지정(문화체육관광부, 한국관광공사)
		                            <p class="desc">
		                                용산점, 동인천점, 신제주점
		                            </p>
		                        </li>
		                        <li>
								<strong>01<span class="blind">월</span></strong>
		                            신개념 창고매장 마켓플랜트  춘천점 1호점 오픈 
		                        </li>
		                    </ul>
		                </div>
		                <div class="section">
		                    <h3><span class="warning large18">2011</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
								<strong>01<span class="blind">월</span></strong>
		                            전자신문 주관 2011년 인기상품 선정 고객만족부문 수상 
		                        </li>
		                    </ul>
		                </div>
		            </div><!-- // history-list -->
	            </div>
	            <div id="history2">
		            <div class="history-list"><!-- history-list -->
		                <div class="section section-2009">
		                    <h3><span class="warning large18">2009</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>01<span class="blind">월</span></strong>
									강릉점 외 신규 3지점 오픈
								</li>
		                    </ul>
		                </div>
		                <div class="section section-2008">
		                    <h3><span class="warning large18">2008</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>01<span class="blind">월</span></strong>
									내동점 외 신규 9지점 오픈
								</li>
		                    </ul>
		                </div>
		                <div class="section section-2007">
		                    <h3><span class="warning large18">2007</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>01<span class="blind">월</span></strong>
									도동점 외 신규 16지점 오픈
								</li>
		                    </ul>
		                </div>
		                <div class="section section-2006">
		                    <h3><span class="warning large18">2006</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>01<span class="blind">월</span></strong>
									광명점 외 신규 12지점 오픈
								</li>
		                    </ul>
		                </div>
		                <div class="section section-2005">
		                    <h3><span class="warning large18">2005</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>01<span class="blind">월</span></strong>
									서대전점 외 신규 7지점 오픈
								</li>
		                    </ul>
		                </div>
		                <div class="section section-2003">
		                    <h3><span class="warning large18">2003</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>10<span class="blind">월</span></strong>
		                            마켓플랜트 프로농구단<br />『마켓플랜트 블랙슬래머』창단
		                        </li>
		                        <li>
		                            <strong>04<span class="blind">월</span></strong>
		                            스포츠 투데이 사단법인 한국브랜드협회 공동주관
		                            <p class="desc">
		                                제2회 브랜드 마케팅대상 선정
		                            </p>
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-2002">
		                    <h3><span class="warning large18">2002</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>12<span class="blind">월</span></strong>
		                            본,신관 RENEWAL 완공
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-2001">
		                    <h3><span class="warning large18">2001</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>07<span class="blind">월</span></strong>
		                            마켓플랜트 직영점 사업 (주) 마켓플랜트 분사
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-1999">
		                    <h3><span class="warning large18">1999</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>11<span class="blind">월</span></strong>
		                            대한 상공회의소 주관 제 4회 한국유통대상 금상 수상
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-1997">
		                    <h3><span class="warning large18">1997</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>03<span class="blind">월</span></strong>
		                            전국 지점망 연계 무료배달 서비스
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-1995">
		                    <h3><span class="warning large18">1995</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>11<span class="blind">월</span></strong>
		                            폐가전 무료수거 서비스 최초도입
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-1988">
		                    <h3><span class="warning large18">1988</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>12<span class="blind">월</span></strong>
		                            국내 유통구조의 혁신 전자전문양판점 국내 최초 도입
		                            <p class="desc">
		                                용산 1호점 OPEN
		                            </p>
		                        </li>
		                    </ul>
		                </div>
		                <div class="section section-1985">
		                    <h3><span class="warning large18">1985</span><span class="blind">년</span><i class="icon"><!-- icon --></i></h3>
		                    <ul>
		                        <li>
		                            <strong>06<span class="blind">월</span></strong>
		                            서울전자유통주식회사 설립
		                        </li>
		                    </ul>
		                </div>
		            </div><!-- // history-list -->
	            </div>
	            
	            
			</div>
		</div>
	</article>
	<!--// #container E -->



<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>

<script type="text/javascript">

$("#history").hide();

function goIntro(){
	$("#intro").show();
	$("#history").hide();
	$("#goIntro").addClass("active");
	$("#goHis").removeClass("active");
	//$("#frm").submit();
};

$(document).on("click","#goHis",function()
{
//function goHis(){
	
	
	$("#history").show();
	$("#intro").hide();
	$("#goIntro").removeClass("active");
	$("#goHis").addClass("active");
	//$("#frm").submit();
});

function goHis1(){
	$("#history1").show();
	$("#history2").hide();
	$("#goHis1").addClass("active");
	$("#goHis2").removeClass("active");
	//$("#frm").submit();
};
 
function goHis2(){
	$("#history1").hide();
	$("#history2").show();
	$("#goHis1").removeClass("active");
	$("#goHis2").addClass("active");
	//$("#frm").submit();
};
 
 

//]]>
</script>
</body>
</html>