<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-basket blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title-->
			<h3><span>상품 Q&amp;A</span></h3>
			<a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
			<a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
			<div id="more" class="sub">
			    <ul class="reset">
			        <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');"><span>쇼핑내역</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myCouponUsableList.do"><span>쿠폰</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myPointList.do"><span>크라운</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myProductCommentList.do"><span>상품평</span></a></li>
			        <li class="active"><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myProductInquiryList.do"><span>상품 Q&amp;A</span></a></li>
			        <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do','_self');"><span>1:1 문의</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/todayViewProductList.do"><span>오늘 본 상품</span></a></li>
			        <li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myDeliveList.do"><span>배송주소록</span></a></li>
			        <li><a href="javascript:memberInfoModify();"><span>회원정보수정</span></a></li>
				    <li><a href="javascript:memberInfoDelete();"><span>회원탈퇴</span></a></li>
			    </ul>
			</div>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->

				<ul class="list list-a">
				    <li>최근 3개월간의 상품평만 조회 가능합니다.</li>
				    <li>이전 내역은 PC 버전에서 확인해주시기 바랍니다.</li>
				</ul>

				<div class="grid head-actions"><!-- head-actions -->
				    <div class="col-1-1 total text-left">
				        <strong class="primary">문의 목록:</strong>
				        <strong class="warning"><fmt:formatNumber value="${commandMap.totalCount}" groupingUsed="true" />개</strong>
				    </div>
				</div><!-- // head-actions -->

				<div id="bbsQna" class="bbs-qna js-bbs-collapse"><!-- bbs-qna -->
					<div class="item-bbs"><!-- item -->
						<div class="head">
						    <div class="table">
						        <div class="cell pic">
						            <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${row.BRD_PRD_MST_CD }">
						            	<img src="<c:out value="${cdnDomain }${row.PRD_MST_IMG_URL_PATH }"/>" alt="<c:out value="${row.PRD_MST_NM}"/>" class="thumb99"/>
						            </a>
						        </div>
						        <div class="cell desc">
						            <p class="name">
						                <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${row.BRD_PRD_MST_CD }">
						                	<c:out value="${row.PRD_MST_NM}" />
						                </a>
						            </p>
						            <p class="subject-q">
						                <c:out value="${row.BRD_INQ_TITLE}"/>
						            </p>
						            <p class="status">작성일: <strong><ui:formatDate value="${row.BRD_INQ_REG_DT}" pattern="yyyy.MM.dd"/></strong></p>
						            <p class="going">
						                <strong class="${row.BRD_INQ_REPLY_CD == 'Y' ? 'primary' : '' }">
					                    	[ ${row.BRD_INQ_REPLY_CD == 'Y' ? '답변완료' : '문의접수' } ]
					                    </strong>
						            </p>
						        </div>
						    </div>
						</div>
						<div class="body"><!-- body -->
						    <div class="grid question">
						        <span class="icon q"><em>질문</em></span>
						        <div class="col">
						            <p>
						                <strong class="primary"><c:out value="${row.BRD_INQ_TITLE}"/></strong>
						            </p>
						            <p>
						               <ui:replaceLineBreak content="${row.BRD_INQ_CONTENTS}"/>
						            </p>
						        </div>
						    </div>
						    <c:choose>
		    					<c:when test="${not empty row.BRD_INQ_REPLY_CONTENTS }">
			    					<div class="grid answer">
								        <span class="icon a"><em>답변</em></span>
								        <div class="col">
								            <c:out value="${row.BRD_INQ_REPLY_CONTENTS}" escapeXml="false"/>
								        </div>
								    </div>
							    </c:when>
							    <c:otherwise>
							    	<div class="grid answer">
								        <span class="icon a"><em>답변</em></span>
								        <div class="col">
								            답변 미작성 상태 입니다.
								        </div>
								    </div>
							    </c:otherwise>
							</c:choose>
						</div><!-- // body -->
					</div><!-- // item -->
				</div><!-- // bbs-qna -->

				<div class="grid section-button actions"><!-- section-button -->
				    <div class="col-1-1 text-center">
				        <a href="javascript:;" id="goList" class="button primary"><span>목록</span></a>
				    </div>
				</div><!-- // section-button -->
				
				<form id="frm" name="frm">
	            	<input type="hidden" name="BRD_INQ_IDX" value="" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	            </form>   

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
		//목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductInquiryList.do", "target":"_self", "method":"post"}).submit();
		});
		
	});
//]]>
</script>

</body>
</html>