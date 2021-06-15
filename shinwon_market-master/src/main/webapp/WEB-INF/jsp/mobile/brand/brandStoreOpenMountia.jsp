<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display mountia"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>STORE</span></h3>
		    <a href="javascript:;" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap section-shop-inquire"><!-- warp -->

				<div class="tab-b"><!-- tab-b -->
				    <ul class="tab">
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandStoreIntroMountia.do"><span>매장안내</span></a></li>
				        <li class="active"><a href="javascript:;"><span>매장개설문의</span></a></li>
				    </ul>
				</div><!-- // tab-b -->

				<h4 class="title mt15"><span>매장개설절차</span></h4>

				<div class="gap">
				    <div class="grid shop-open-step"><!-- shop-open-step -->
					    <div class="col-1-4 step">
					        <span class="icon step01"></span>
					        <p class="reset mt15"><span class="primary">STEP 01</span></p>
					        <p class="reset mt5">개설신청서<br />작성</p>
					    </div>
					    <div class="col-1-4 step">
					        <span class="icon step02"></span>
					        <p class="reset mt15"><span class="primary">STEP 02</span></p>
					        <p class="reset mt5">본사 검토 후<br />유선상담 </p>
					    </div>
					    <div class="col-1-4 step">
					        <span class="icon step03"></span>
					        <p class="reset mt15"><span class="primary">STEP 03</span></p>
					        <p class="reset mt5">매장방문<br />및 시장조사 </p>
					    </div>
					    <div class="col-1-4 step">
					        <span class="icon step04"></span>
					        <p class="reset mt15"><span class="primary">STEP 04</span></p>
					        <p class="reset mt5">최고 경영자<br />심의 후 계약 </p>
					    </div>
					</div><!-- // shop-open-step -->
				</div>

				<h4 class="title mt20"><span>매장거래조건</span></h4>

				<div class="gap">
				    <table class="table-row table-a" cellspacing="0"><!-- table-a -->
						<caption></caption>
						<colgroup>
						    <col style="width: 75px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
						    <tr><!-- row -->
							    <th><span>입지조건</span></th>
							    <td>인구 15만 이상 시 단위 주요 상권</td>
							</tr>
							<tr><!-- row -->
							    <th><span>매장조건</span></th>
							    <td>전면 6M이상 25평 이상(창고별도)</td>
							</tr>
							<tr><!-- row -->
							    <th><span>공급유형</span></th>
							    <td>위탁판매 거래</td>
							</tr>
							<tr><!-- row -->
							    <th><span>담보조건</span></th>
							    <td>부통산담보 1억원 및 현금 보증금 2천만원</td>
							</tr>
							<tr><!-- row -->
							    <th><span>대금결제</span></th>
							    <td>주 단위 결제</td>
							</tr>
							<tr><!-- row -->
							    <th><span>인테리어</span></th>
							    <td>당사 지정업체 시공</td>
							</tr>
							<tr><!-- row -->
					            <th><span>본사지원</span></th>
					            <td>오픈 사은품, 마케팅 프로모션 지원</td>
					        </tr>
						</tbody>
					</table><!-- // table-a -->
				</div>

				<h4 class="title mt20"><span>지역별담당자</span></h4>

				<div class="gap">
				    <table class="table-row table-a" cellspacing="0"><!-- table-a -->
						<caption></caption>
						<colgroup>
						    <col style="width: 75px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
						    <tr><!-- row -->
						    	<th><span>지역</span></th>
						    	<td>서울(강남/강동/강서), 경기북부, 강원도, 경상도, 제주</td>
							</tr>
							<tr><!-- row -->
							    <th><span>담당자</span></th>
							    <td>김경학 차장</td>
							</tr>
							<tr><!-- row -->
							    <th><span>연락처</span></th>
							    <td>02-2286-9641</td>
							</tr>
							<tr><!-- row -->
					            <th><span>휴대전화</span></th>
					            <td>010-8872-0744</td>
					        </tr>
						</tbody>
					</table><!-- // table-a -->
							
					<table class="table-row table-a" cellspacing="0"><!-- table-a -->
						<caption></caption>
						<colgroup>
						    <col style="width: 75px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
						    <tr><!-- row -->
						    	<th><span>지역</span></th>
						    	<td>서울(강북), 경기남부, 충청도/대전, 전라도/광주</td>
							</tr>
							<tr><!-- row -->
							    <th><span>담당자</span></th>
							    <td>허영민 과장</td>
							</tr>
							<tr><!-- row -->
							    <th><span>연락처</span></th>
							    <td>02-2286-9648</td>
							</tr>
							<tr><!-- row -->
					            <th><span>휴대전화</span></th>
					            <td>010-3332-5613</td>
					        </tr>
					    </tbody>
					</table><!-- // table-a -->
					
					<div class="section-buttton actions mt15"><!-- section-buttton -->
					    <a href="<c:out value="${mobileDomain}" />/mobile/brand/brandStoreOpenForm.do" class="button warning full"><span>매장 개설문의</span></a>
					</div><!-- // section-buttton -->
				</div>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
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

	$(function()
	{
		
	});

</script>

</body>
</html>