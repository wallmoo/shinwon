<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
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
	            <h2>마이페이지</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="my-stage"><!-- my-stage -->
	            <div class="core">
	                <p>
	                    <strong class="large">Happy today, <c:out value="${sessionUser.MEM_MST_MEM_ID }"/>님</strong>
	                </p>
	                <!-- 통합회원일 경우(platinum, vip, gold, silver, red) -->
		        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
						<!-- platinum -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_PLATINUM_GRADE }">
							<div class="level platinum mt15"></div>		   
						</c:if> 
						<!-- vip -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_VIP_GRADE }">
		        			<div class="level vip mt15"></div>		 
		        		</c:if>
		        		<!-- gold -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_GOLD_GRADE }">
		        			<div class="level gold mt15"></div>	
		        		</c:if>
		        		<!-- silver -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_SILVER_GRADE }">
		        			<div class="level silver mt15"></div>	
		        		</c:if>
		        		<!-- red -->
		        		<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.PRI_MEMBER_RED_GRADE }">
		        			<div class="level red mt15"></div>	
		        		</c:if>    	
		        	</c:if>
		        	
		        	<!-- 간편회원일 경우(easy) -->
		        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
		        		<div class="level easy mt15"></div>	
		        	</c:if>
		        	
					<!-- 기업회원일 경우(business business-a, business business-b) -->	
					<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_COMP_MEMBER_GRADE }">
						<!-- 1등급 -->
						<c:if test="${summaryMap.MEM_MST_MEM_GRD ne Code.COMP_MEMBER_BASIC_GRADE }">
							<div class="level business business-b mt15"></div>	
						</c:if>
						<!-- 2등급 -->
						<c:if test="${summaryMap.MEM_MST_MEM_GRD eq Code.COMP_MEMBER_BASIC_GRADE }">
							<div class="level business business-a mt15"></div>	
						</c:if>
					</c:if>
		        	
		        	<!-- 통합회원 -->
		        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
		                <div class="action mt10">
		                    <a href="<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do" class="button success _pg_link" target="_self"><span>나의 등급 혜택보기</span></a>
		                    <c:if test="${summaryMap.MEM_MST_JOI_RTE eq Code.JOIN_TYPE_ONLINE }">
		                    	<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/changeOnlineMemCert.do?gubun=ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>&type=m." class="button success _pg_link" target="_self"><span>통합회원으로 전환하기</span></a>
		                    </c:if>
		                </div>
		            </c:if>
	                <!-- 간편회원 -->
		        	<c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
		                <div class="action mt10">
		                    <a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/changeOnlineMemCert.do?gubun=ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>&type=m." class="button success _pg_link" target="_self"><span>통합회원으로 전환하기</span></a>
		                </div>
		                <p class="mt10">
				                   통합회원으로 전환하시면<br />
				                   더 많은 혜택을 받으실 수 있습니다.
		                </p>
		            </c:if>
		            
	                <c:if test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
		                <p class="mt10">
		                   <span class="tit">산정기간 : </span><c:out value="${summaryMap.CAL_ST_DT }"/> ~ <c:out value="${summaryMap.CAL_ED_DT }"/><br />
		                   <span class="tit">구매금액 : </span><fmt:formatNumber value="${not empty summaryMap.TOT_AMOUNT ? summaryMap.TOT_AMOUNT : 0 }" groupingUsed="true"/>원
		                </p>
		            </c:if>
	            </div>
	            <c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.COMMON_COMP_MEMBER_GRADE }">
		            <div class="desc">
		                <ul class="ct">
		                    <li>
		                    	<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myCouponUsableList.do','_self');" class="_pg_link" >
			                        <strong class="xlarge"><c:out value="${summaryMap.MEM_CPN_CNT }"/>장</strong>
			                        <span>쿠폰</span>
		                        </a>
		                    </li>
	                    	<c:choose>
			                	<c:when test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
			                		<li>
				                		<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myMileageList.do','_self');" class="_pg_link" >
					                        <strong class="xlarge"><fmt:formatNumber value="${summaryMap.SOLUBLE_MILEAGE }" groupingUsed="true" />P</strong>
					                        <span>포인트</span>			                       
				                        </a>
			                        </li>
			                	</c:when>
			                	<c:otherwise>
			                		<li class="disable">
				                        <strong class="xlarge">P</strong>
				                        <span>포인트</span>
				                    </li>
			                	</c:otherwise>
			               	</c:choose>
	                    	<c:choose>
			                	<c:when test="${summaryMap.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
			                		<li>
				                		<a href="<c:out value="${mobileDomain}" />/mobile/mypage/myPointList.do" class="_pg_link" target="_self">
					                        <strong class="xlarge"><fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0 }" groupingUsed="true"/>C</strong>
					                        <span>크라운</span>
				                        </a>
			                        </li>
			                	</c:when>
			                	<c:otherwise>
			                		<li class="disable">
				                        <strong class="xlarge">C</strong>
				                        <span>크라운</span>
				                    </li>
			                	</c:otherwise>
			                </c:choose>
		                    <li>
		                    	<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myKeepProductList.do','_self');" class="_pg_link" target="_self">
			                        <strong class="xlarge"><fmt:formatNumber value="${not empty summaryMap.MEM_KEP_CNT ? summaryMap.MEM_KEP_CNT : 0 }" groupingUsed="true"/>개</strong>
			                        <span>키핑백</span>
		                        </a>
		                    </li>
		                </ul>
		            </div>
		    	</c:if>
	        </div><!-- // my-stage -->
	
	        <div class="ship-condition"><!-- ship-condition -->
	            <h3><span class="large">배송현황</span></h3>
	
	            <div class="order-history"><!-- order-history -->
	                <ol class="ui-grid-d">
	                    <li class="ui-block-a">
	                        <span class="tit">입금대기</span>
	                        <span class="count"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PAY_READY_CNT}" /></strong>건</span>
	                    </li>
	                    <li class="ui-block-b">
	                        <span class="tit">결제완료</span>
	                        <span class="count"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PAY_CNT}" /></strong>건</span>
	                    </li>
	                    <li class="ui-block-c">
	                        <span class="tit">배송준비중</span>
	                        <span class="count"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SEND_READY_CNT}" /></strong>건</span>
	                    </li>
	                    <li class="ui-block-d">
	                        <span class="tit">배송중</span>
	                        <span class="count"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SEND_CNT}" /></strong>건</span>
	                    </li>
	                    <li class="ui-block-e">
	                        <span class="tit">배송완료</span>
	                        <span class="count"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SEND_END_CNT}" /></strong>건</span>
	                    </li>
	                </ol>
	            </div><!-- // order-history -->
	
	            <div class="change-count">
	                취소 <a href="javascript:;"><span class="warning"><fmt:formatNumber value="${myPageOrderInfo.CANCEL_CNT}" /></span></a>건
	                <span class="pipe">/</span>
	                교환 <a href="javascript:;"><span class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SWAP_CNT}" /></span></a>건
	                <span class="pipe">/</span>
	                반품 <a href="javascript:;"><span class="warning"><fmt:formatNumber value="${myPageOrderInfo.BACK_CNT}" /></span></a>건
	            </div>
	        </div><!-- // ship-condition -->
	
			<c:if test="${kingerCount > 0 }">
				<c:if test="${not empty kingerProductCommentList }">
               		<c:forEach var="kingerRow" items="${kingerProductCommentList }" varStatus="i">
				        <div class="review-condition mt10"><!-- ship-condition -->
				            <h3><c:out value="${sessionUser.MEM_MST_MEM_NM }"/> 님의 프리미엄 고객체험단 KINGER <c:out value="${kingerRow.EXP_KINGER_CD }"/> 상품리뷰 작성 현황<br />( <c:out value="${not empty kingerRow.EXP_REV_CNT ? kingerRow.EXP_REV_CNT : 0 }"/> / 2회 )</h3>
				            <a href="<c:out value="${mobileDomain }"/>/mobile/kinger/kingerView.do?EXP_MST_CD=<c:out value="${kingerRow.EXP_MST_CD }"/>" class="button small"><span>상품리뷰 작성하러 가기</span></a>
				        </div><!-- // ship-condition -->
				    </c:forEach>
				</c:if>
	        </c:if>
	
	        <div class="my-page-nav"><!-- my-page-nav -->
	            <ul class="ct nav-a">
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');" class="_pg_link" target="_self"><i class="icon-ship"><!-- icon --></i><span>주문/배송조회</span></a></li>
	                <li><a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain}" />/mobile/cart/cartlist.do','_self');" class="_pg_link" target="_self"><i class="icon-cart"><!-- icon --></i><span>장바구니</span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myKeepProductList.do','_self');" class="_pg_link" target="_self"><i class="icon-benefit"><!-- icon --></i><span>키핑백</span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myBuyShoppingList.do','_self');" class="_pg_link" target="_self"><i class="icon-order"><!-- icon --></i><span>내가 구매한 상품</span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myEventList.do','_self');" class="_pg_link" ><i class="icon-event"><!-- icon --></i><span>참여한 이벤트 </span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myEstimate.do','_self');" class="_pg_link" ><i class="icon-estimate"><!-- icon --></i><span>MY견적</span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myWritableProductCommentList.do','_self')" class="_pg_link" target="_self"><i class="icon-review"><!-- icon --></i><span>상품후기</span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myProductInquiryList.do','_self')" class="_pg_link" target="_self"><i class="icon-qna"><!-- icon --></i><span>상품Q&amp;A</span></a></li>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do','_self');" class="_pg_link" ><i class="icon-one"><!-- icon --></i><span>1:1문의</span></a></li>
	            </ul>
	            <div class="nav-b">
	                <a href="<c:out value="${mobileDomain}" />/mobile/mypage/myDeliveList.do" class="_pg_link" target="_self">배송지관리</a>
	                <span class="pipe">/</span>
	                <a href="<c:out value="${mobileSslDomain }"/>/mobile/mypage/myInfoPasswordForm.do" class="_pg_link" target="_self">회원정보수정</a>
	                <span class="pipe">/</span>
	                <a href="<c:out value="${mobileSslDomain }"/>/mobile/mypage/myInfoDeleteForm.do" class="_pg_link" target="_self">회원탈퇴</a>
	            </div>
	        </div><!-- // my-page-nav -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script>
	$.com.win_scrollList = true;//스크롤 할거야~
	function _return_scrollList(_idx, _reNum){
	    /*
	        _idx = 리스트감싸고있는 객체
	        _reNum = 리턴 몇번째넘어왔는지
	    */
	    
	    if(_reNum <= 2){
	        var _list_html = _idx.html();
	        //리스트 추가!
	        _idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
	        //console.log('_reNum = '+_reNum);
	    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
	}
</script>
<script type="text/javascript">
//<![CDATA[
$(function(){

});
//]]>
</script>
</body>
</html>