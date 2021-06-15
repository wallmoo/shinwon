<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-helpdesk blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>멤버십 혜택</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		    <a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
		    <div id="more" class="sub">
		        <ul class="reset">
		        	<li><a href="<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do"><span>FAQ</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/inquiryMain.do"><span>1:1문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardList.do"><span>공지사항</span></a></li>
		            <li class="active"><a href="javascript:;"><span>멤버십혜택</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/groupInquiryForm.do"><span>단체주문문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/utilAgree.do"><span>이용약관</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/privacyPolicy.do"><span>개인정보취급방침</span></a></li>
		        </ul>
		    </div>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap membership-wrap"><!-- warp -->

				
			    <div class="tab-b item-3"><!-- tab-b -->
				    <ul class="tab">
				        <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/membershipBenefitNormal.do"><span>일반등급</span></a></li>
				        <li class="active"><a href="javascript:;"><span>실버등급</span></a></li>
				        <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/membershipBenefitGold.do"><span>골드등급</span></a></li>
				    </ul>
				</div><!-- // tab-b -->
				

				<div class="memeber-class">
				    <span class="icon silver"><em>실버등급</em></span>
				</div>

				<h4 class="title"><span>실버등급 혜택안내</span></h4>

				<div class="gap"><!-- gap -->
				    <ul class="basic"> 
				        <li><span class="warning">누적포인트 150,001점 ~ 250,000점 이하인 회원</span></li>
				        <li>실버회원을 위한 분기별 추가 할인권 발송</li>
				        <li>생일/기념일 축하쿠폰 (전 등급 공통 제공)</li>
				    </ul>
				    <p class="info mt0 mb20">정보불명확 / 수신거부 / 생일&amp;기념일 미등록 고객의 경우 상기 혜택에서 제외될 수 있습니다.</p>
				</div><!-- // gap -->

				<h4 class="title"><span>멤버십 혜택 안내</span></h4>
				<div class="gap"><!-- gap -->

					<table class="table-col table-a" cellspacing="0"><!-- table-a -->
					<caption></caption>
					<colgroup>
					    <col style="width:11%;" />
					<col style="width:15%;" />
					<col style="width:25%;" />
					<col style="width:15%;" />
					<col style="width:auto;" />
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
					    <tr><!-- row-->
					    <td colspan="2">할인</td>
					    <td>5%</td>
					    <td>-</td>
					    <td>
					        정상제품에 한함<br />
					        <span class="warning">실 구매금액의 5% 할인</span>
					    </td>
					</tr>
					<tr><!-- row-->
					    <td rowspan="2">포인트적립</td>
					    <td>정상제품</td>
					    <td>5%</td>
					    <td>5%</td>
					    <td>
					        <span class="warning">실 구매금액의 5% 적립</span>
					    </td>
					</tr>
					<tr><!-- row-->
					    <td class="line">이월/세일/특가</td>
					    <td>2%</td>
					    <td>2%</td>
					    <td>
					        <span class="warning">실 구매금액의 2% 적립</span>
					    </td>
					</tr>
					<tr><!-- row-->
					            <td colspan="2">포인트사용</td>
					            <td colspan="3">잔여포인트 5,000점 이상 시 사용 가능</td>
					        </tr>
					    </tobdy>
					</table><!-- // table-a -->
					
				</div><!-- // gap -->


			</div><!-- // wrap -->
		</div><!-- // container -->

	</div><!-- // contents -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
	$(function()
	{
	
	});
//]]>
</script>

</body>
</html>