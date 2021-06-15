<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
	
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	         <div id="breadcrumb" class="wrap">
	             <div class="holder">
	                 <span>홈</span>
	                 <span class="gt">&gt;</span>
	                 <span>고객센터</span>
	                 <span class="gt">&gt;</span>
	                 <strong class="warning">멤버십혜택</strong>
	             </div>
	         </div>
	    </div><!-- // breadcrumb -->

		<div class="container visual-wrap"><!-- visual -->
		    <div class="wrap">
		        <img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_helpdesk.png" alt="" />
		    </div>
		</div><!-- // visual -->


		<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->

		<div id="lnb"><!-- lnb -->
		    <ul class="reset">
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do">FAQ</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do">1:1문의</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do">공지사항</a></li>
		        <li class="active"><a href="<c:out value="${frontDomain}" />/pc/customer/membershipBenefit.do">멤버십혜택</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do">단체주문문의</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/utilAgree.do">이용약관</a></li>
			    <li><a href="<c:out value="${frontDomain}" />/pc/customer/privacyPolicy.do">개인정보취급방침</a></li>
		    </ul>
		</div><!-- // lnb -->

		<div id="internal"><!-- internal -->

		<h3 class="title"><span>멤버십 혜택</span></h3>

		<div class="membership-card"><!-- membership-card -->
		<ul class="tab card">
		    <li><a href="#membershipFamily" class="ir card family js-toggler-form"><em>패밀리 카드</em></a></li>
            <li><a href="#membershipSilver" class="ir card silver js-toggler-form"><em>실버 카드</em></a></li>
            <li><a href="#membershipGold" class="ir card gold js-toggler-form"><em>골드 카드</em></a></li>
		</ul>

		<div id="membershipFamily" class="benefit toggle in"><!-- family -->
		    <h4 class="reset">일반등급 혜택안내</h4>
		
		    <ul class="list list-a mt15">
		        <li><span class="warning">누적포인트 150,000점 이하인 회원</span></li>
		        <li>신규 가입 시 신규 가입 감사 쿠폰</li>
		        <li>생일/기념일 축하쿠폰 (전 등급 공통 제공)</li>
		    </ul>
		
		    <p class="info mb0">
		        <span class="info"> 정보불명확/수신거부/생일&amp;기념일미등록 고객의 경우 상기 혜택에서 제외될 수 있습니다.
		    </p>
		</div><!-- // family -->

		<div id="membershipSilver" class="benefit toggle"><!-- silver -->
		    <h4 class="reset">실버등급 혜택안내 </h4>
		
		    <ul class="list list-a mt15">
		        <li><span class="warning">누적포인트 150,001점 ~ 250,000점 이하인 회원</span></li>
		        <li>실버회원을 위한 분기별 추가 할인권 발송</li>
		        <li>생일/기념일 축하쿠폰 (전 등급 공통 제공)</li>
		    </ul>
		
		    <p class="info mb0">
		        <span class="info"> 정보불명확/수신거부/생일&amp;기념일미등록 고객의 경우 상기 혜택에서 제외될 수 있습니다.
		    </p>
		</div><!-- // silver -->

		<div id="membershipGold" class="benefit toggle"><!-- gold -->
		    <h4 class="reset">골드등급 혜택안내 </h4>
		
		    <ul class="list list-a mt15">
		        <li><span class="warning">누적포인트 250,001점 이상인 회원</span></li>
		        <li>골드회원을 위한 분기별 추가할인권 발송</li>
		        <li>생일/기념일 축하쿠폰 (전 등급 공통 제공)</li>
		    </ul>
		
		    <p class="info mb0">
		        <span class="info"> 정보불명확/수신거부/생일&amp;기념일미등록 고객의 경우 상기 혜택에서 제외될 수 있습니다.
		    </p>
		</div><!-- // gold -->

		</div><!-- // membership-card -->

		<h4 class="title"><span>멤버십 기본혜택 안내</span></h4>

		<table class="table-col table-b large" cellspacing="0">
		<colgroup>
			<col style="width: auto;" />
			<col style="width: auto;" />
			<col style="width: auto;" />
			<col style="width: auto;" />
			<col style="width: auto;" />
		</colgroup>
		<thead>
		    <tr>
		        <th colspan="2"><span>구분</span></th>
		        <th><span>직영/대리점</span></th>
		        <th><span>백화점</span></th>
		        <th><span>비고</span></th>
		    </tr>
		</thead>
		<tbody>
		    <tr>
		        <td colspan="2">할인</td>
		        <td>5%</td>
		        <td>&nbsp;</td>
		        <td>정상제품에 한함 / <span class="warning">실 구매금액의 5% 할인</span></td>
		    </tr>
		    <tr>
		        <td rowspan="2">포인트 적립</td>
		        <td>정상제품</td>
		        <td>5%</td>
		        <td>5%</td>
		        <td><span class="warning">실 구매금액의 5% 할인</span></td>
		    </tr>
		    <tr>
		        <td class="line-l">이월/세일/특가</td>
		        <td>2%</td>
		        <td>2%</td>
		        <td><span class="warning">실 구매금액의 2% 적립</span></td>
		    </tr>
		    <tr>
		        <td colspan="2">포인트 사용</td>
		        <td colspan="3">잔여포인트 5,000점 이상 시 사용 가능</td>
		    </tr>
		</tbody>
		</table>


		</div><!-- internal -->
		
		</div><!-- wrap -->
		</div><!-- // container -->

		<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
$(function(){

});
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>