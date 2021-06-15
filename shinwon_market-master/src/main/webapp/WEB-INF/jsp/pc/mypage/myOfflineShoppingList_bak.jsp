<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page-mypage -->
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">
		
		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
	    <article id="container" class="container">
	        <div class="minW contents"><!-- contents S -->
	
	            <dl class="loc">
	                <dt class="blind">현재 카테고리 경로</dt>
	                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
	                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>주문/배송 조회</span></a></dd>
	            </dl>
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
				
	            <div id="body"><!-- #body -->
	
	                <h3 class="title">주문/배송 조회</h3>
	
	                <div class="order-progress"><!-- order-progress -->
	                    <div class="ct holder">
	                        <ol class="ct">
	                            <li class="nth-child-1">
	                                <p class="step">입금대기</p>
	                                <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PAY_READY_CNT}" /></strong>건</span>
	                            </li>
	                            <li class="nth-child-2">
	                                <p class="step">결제완료</p>
	                                <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PAY_CNT}" /></strong>건</span>
	                            </li>
	                            <li class="nth-child-3">
	                                <p class="step">배송준비중</p>
	                                <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SEND_READY_CNT}" /></strong>건</span>
	                            </li>
	                            <li class="nth-child-4">
	                                <p class="step">배송중<br /><span class="icon"><!-- icon --></span>상품준비완료</p>
	                                <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SEND_CNT}" /></strong>건</span>
	                            </li>
	                            <li class="nth-child-5">
	                                <p class="step">배송<br /><span class="icon"><!-- icon --></span>픽업완료</p>
	                                <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SEND_END_CNT}" /></strong>건</span>
	                            </li>
	                        </ol>
	
	                        <%-- <ul class="change">
	                            <li>
	                                <span class="tit">취소</span>
	                                <span><strong class="warning "><fmt:formatNumber value="${myPageOrderInfo.CANCEL_CNT}" /></strong>건</span>
	                            </li>
	                            <li>
	                                <span class="tit">교환</span>
	                                <span><strong class="warning "><fmt:formatNumber value="${myPageOrderInfo.PRD_SWAP_CNT}" /></strong>건</span>
	                            </li>
	                            <li>
	                                <span class="tit">반품</span>
	                                <span><strong class="warning "><fmt:formatNumber value="${myPageOrderInfo.BACK_CNT}" /></strong>건</span>
	                            </li>
	                        </ul> --%>
	                    </div>
	                </div><!-- // order-progress -->
	
	                <ul class="ct tab-a item-2"><!-- tab-a -->
	                    <li><a href="<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do"><span>쇼핑몰 주문내역</span></a></li>
	                    <li class="active"><a href="<c:out value="${serverSslDomain}" />/pc/mypage/myOfflineShoppingList.do"><span>오프라인 매장 주문내역</span></a><span class="blind">현재위치</span></li>
	                </ul><!-- // tab-a -->
	
					<form id="searchForm" name="searchForm">
	                <div class="search-order"><!-- search-order -->
	                    <label class="tit" for="searchDate">조회기간</label>
	                     <a href="javascript:;" class="btn_st0 btn_white small time js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-7"><span>1주일</span></a>
	                    <a href="javascript:;" class="btn_st0 btn_white small time js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-30"><span>한달</span></a>
	                    <a href="javascript:;" class="btn_st0 btn_white small time js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-180"><span>6개월</span></a>
	                    <a href="javascript:;" class="btn_st0 btn_white small time js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-365"><span>1년</span></a>
	                    <input type="text" id="dateA" name="searchStartDate" class="text" maxlength="10" data-max="<c:out value="${commandMap.searchMaxDate }"/>" data-min="<c:out value="${commandMap.searchMinDate }"/>" title="주문내역 조회 시작 날짜" placeholder="- 180일" value="<c:out value="${commandMap.searchStartDate }"/>" />
	                    <a href="javascript:;" class="btn_calendar"><span class="blind">시작날짜선택</span></a>
	                    <span class="pipe">~</span>
	                    <input type="text" id="dateB" name="searchEndDate" class="text" maxlength="10" data-max="<c:out value="${commandMap.searchMaxDate }"/>" data-min="<c:out value="${commandMap.searchMinDate }"/>" title="주문내역 조회 종료 날짜" placeholder="TODAY" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                    <a href="javascript:;" class="btn_calendar"><span class="blind">종료날짜선택</span></a>
	                    <a href="javascript:search();" class="btn_st0 btn_blk777 small go"><span>조회</span></a>
	                </div><!-- // search-order -->
	
	                </form>
	
	                <table class="table-product table-my-order mt10"><!-- table-product -->
	                <caption>주문일, 매장명, 총결제금액, 상품정보로 구성된 오프라인 매장 주문내역 목록입니다.</caption>
	                <colgroup>
	                    <col style="width: 12%;" />
	                    <col style="width: 16%;" />
	                    <col style="width: 16%;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"><span>주문일</span></th>
	                        <th scope="col"><span>매장명</span></th>
	                        <th scope="col"><span>총결제금액</span></th>
	                        <th scope="col"><span>상품정보</span></th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:choose>
						    <c:when test="${not empty list}">
						    	<c:forEach var="data" items="${list }" varStatus="status">
						    	<tr>
						    		<c:if test="${data.ORD_RNK eq 1 }">
			                        <td rowspan="<c:out value="${data.ORD_CNT}"/>" class="date"><ui:formatDate value="${data.ORD_DT}" pattern="yyyy.MM.dd"/></td>
			                        <td rowspan="<c:out value="${data.ORD_CNT}"/>" class="order-number">
			                            <p><c:out value="${data.SHOP_NM }" /></p>
			                        </td>
			                        <td rowspan="<c:out value="${data.ORD_CNT}"/>" class="price">
			                            <p><span class="warning"><fmt:formatNumber value="${data.ORD_PRC}" type="number"/></span>원</p>
			                        </td>
			                        </c:if>
			                        <td class="product">
			                            <p class="subject">
			                                <c:out value="${data.PRD_NM }" />
			                            </p>
			                        </td>
			                    </tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<tr>
			                        <td colspan="4">
			                            <p class="message no-more">
			                                	주문내역이 없습니다.
			                            </p>
			                        </td>
			                    </tr>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	                </table><!-- // table-product -->
	
	                <div class="frame-a"><!-- frame-a -->
	                    <ul class="list list-a small">
	                        <li>최근 <strong>6개월 간</strong> 마켓플랜트 오프라인 매장에서 주문하신 내역 입니다.</li>
	                        <!-- <li>[주문번호]를 클릭하시면 주문상세내역 및 배송조회를 확인할 수 있습니다.</li> -->
	                    </ul>
	                </div><!-- // frame-a -->
					
					<form id="frm" name="frm">
		                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		                <input type="hidden" name="ORD_MST_CD" value=""/> 
		                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
		                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
		                
						<div class="section-pagination"><!-- section pagination -->
						    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
		                </div><!-- // section pagination -->
		            </form>
	
	            </div><!-- // #body -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->		
		<%-- 각 화면 본문 끝 --%>
		
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>
	<!--// #wrap E -->
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 -->
<script type="text/javascript">
//<![CDATA[
$(function(){
	//달력
    //epass.datepickr-0.4.js 이거불러와서 써주세요.
    $('.btn_calendar').datePickr();
	
    var $searchForm = $("#searchForm"); 
    var $frm = $("#frm");
    
    // 검색
    search = function() 
    {
        $searchForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myOfflineShoppingList.do", "target":"_self", "method":"get"}).submit(); 
    };

    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myOfflineShoppingList.do", "target":"_self", "method":"get"}).submit();
    };

});
//]]>
</script>

</html>