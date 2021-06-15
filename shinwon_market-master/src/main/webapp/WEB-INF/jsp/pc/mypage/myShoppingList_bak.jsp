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
	                    <li class="active"><a href="<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do"><span>쇼핑몰 주문내역</span></a><span class="blind">현재위치</span></li>
	                    <li><a href="<c:out value="${serverSslDomain}" />/pc/mypage/myOfflineShoppingList.do"><span>오프라인 매장 주문내역</span></a></li>
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
	
	                <div class="section-button ar mt20"><!-- section-button -->
	                	<input type="radio" id="searchDlvGbn_0" name="searchDlvGbn" value="" <c:if test="${empty commandMap.searchDlvGbn}">checked="checked"</c:if> style="display: none;"/>
	                	<input type="radio" id="searchDlvGbn_1" name="searchDlvGbn" value="${Code.CART_DLV_GBN_GET_IT_NOW_CD }" <c:if test="${commandMap.searchDlvGbn eq Code.CART_DLV_GBN_GET_IT_NOW_CD}">checked="checked"</c:if> style="display: none;"/>
	                	<input type="radio" id="searchDlvGbn_2" name="searchDlvGbn" value="${Code.CART_DLV_GBN_SERVICE_CD }" <c:if test="${commandMap.searchDlvGbn eq Code.CART_DLV_GBN_SERVICE_CD}">checked="checked"</c:if> style="display: none;"/>
	                	
	                    <a href="javascript:changeSearchDlvGbn('0');" id="searchDlvGbnBtn_0" class="btn_st0 ${empty commandMap.searchDlvGbn ? 'btn_rd' : 'btn_white' } small"><strong>전체 주문 보기</strong></a>
	                    <a href="javascript:changeSearchDlvGbn('1');" id="searchDlvGbnBtn_1" class="btn_st0 ${commandMap.searchDlvGbn eq Code.CART_DLV_GBN_GET_IT_NOW_CD ? 'btn_rd' : 'btn_white' } small"><strong>겟잇나우 주문만 보기</strong></a>
	                    <a href="javascript:changeSearchDlvGbn('2');" id="searchDlvGbnBtn_2" class="btn_st0 ${commandMap.searchDlvGbn eq Code.CART_DLV_GBN_SERVICE_CD ? 'btn_rd' : 'btn_white' } small"><strong>클린킹 상담예약만 보기</strong></a>
	                </div><!-- // section-button -->
	                </form>
	
	                <table class="table-product table-my-order mt10"><!-- table-product -->
	                <caption>주문일, 주문번호, 총결제금액, 상품정보, 배송정보로 구성된 쇼핑몰 주문내역 목록입니다.</caption>
	                <colgroup>
	                    <col style="width: 10%;" />
	                    <col style="width: 15%;" />
	                    <col style="width: 15%;" />
	                    <col style="width: auto;" />
	                    <col style="width: 15%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"><span>주문일</span></th>
	                        <th scope="col"><span>주문번호</span></th>
	                        <th scope="col"><span>총결제금액</span></th>
	                        <th scope="col"><span>상품정보</span></th>
	                        <th scope="col"><span>배송정보</span></th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:choose>
						    <c:when test="${not empty list}">
						    	<c:forEach var="data" items="${list }" varStatus="status">
						    	<tr>
						    		<c:if test="${data.ORD_RNK eq 1 }">
			                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="date"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
			                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="order-number">
			                            <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');"><c:out value="${data.ORD_MST_CD }" /></a></p>
			                            <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');" class="btn_st0 btn_white xsmall detail"><span>주문상세</span></a></p>
			                        </td>
			                        <td rowspan="<c:out value="${data.ORD_MST_CNT}"/>" class="price">
			                            <p><span class="warning"><fmt:formatNumber value="${data.ORD_MST_PAY_PRC}" type="number"/></span>원</p>
			                        </td>
			                        </c:if>
			                        <td class="product">
			                            <div class="item">
			                                <div class="thumb">
			                                    <a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');">
			                                    	<img src="<c:out value="${cdnDomain }${data.PRODUCT_THUM_IMG}"/>" class="thumb84" alt="${data.PRD_IMAGE_ALT}" />
			                                    </a>
			                                </div>
			                                <div class="core">
			                                    <p class="subject">
			                                        <a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');"><c:out value="${data.PRD_MST_NM }" /></a>
			                                    </p>
			                                    <c:if test="${data.TOT_VDR_PRD_CNT gt 0 }">
			                                    	<p class="desc">
				                                        	외 <c:out value="${data.TOT_VDR_PRD_CNT }" />건
				                                    </p>
			                                    </c:if>
			                                </div>
			                            </div>
			                        </td>
			                        <td class="ship">
		                            	<c:choose>
		                            		<c:when test="${data.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_NORMAL_CD }">
		                            			<c:if test="${data.ORD_PRD_VDR_IDX eq -1 }">
		                            				<P>프라이스킹배송</P>
		                            			</c:if>
		                            			<c:if test="${data.ORD_PRD_VDR_IDX ne -1 }">
		                            				<P>파트너배송</P>
		                            			</c:if>
		                            		</c:when>
		                            		<c:when test="${data.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD }">
		                            			<P>겟잇나우</P>
		                            			<c:if test="${data.ORD_PRD_ORD_STATE eq Code.OST_PAY or data.ORD_PRD_ORD_STATE eq Code.OST_SEND_READY }">
		                            				<p><a href="javascript:goGetItNowTicketSend('${data.ORD_MST_CD}');" class="btn_st0 btn_white xsmall"><span>교환권발송</span></a></p>
		                            			</c:if>
		                            		</c:when>
		                            		<c:when test="${data.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }">
		                            			<P>클린킹</P>
		                            		</c:when>
		                            		<c:when test="${data.ORD_MST_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD }">
		                            			<P>장기할부</P>
		                            		</c:when>
		                            	</c:choose>
			                        </td>
			                    </tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<tr>
			                        <td colspan="5">
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
	                        <li>최근 <strong>6개월 간</strong> 마켓플랜트 쇼핑몰에서 주문하신 내역 입니다. </li>
	                        <li>[주문번호]를 클릭하시면 주문상세내역 및 배송조회를 확인할 수 있습니다. </li>
	                        <li>주문취소/반품접수/교환접수는 주문상세정보 페이지에서 이용하실 수 있습니다.</li>
	                        <li>겟잇나우 상품만 <strong>교환권 재발송</strong> 버튼이 보여지며, 최대 2회 재발송이 가능합니다.</li>
	                    </ul>
	                </div><!-- // frame-a -->
					
					<form id="frm" name="frm">
		                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		                <input type="hidden" name="ORD_MST_CD" value=""/> 
		                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
		                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
		                <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
		                <input type="hidden" name="searchDlvGbn" value="<c:out value="${commandMap.searchDlvGbn }"/>"/>
		                
						<div class="section-pagination"><!-- section pagination -->
						    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
		                </div><!-- // section pagination -->
		            </form>
	
	                <div class="order-ship-guide"><!-- order-ship-guide -->
	                    <h4 class="title-a"><span>주문/배송 안내</span></h4>
	                    <ol class="ct">
	                        <li class="nth-child-1">
	                            <span class="icon"><!-- icon --></span>
	                            <strong>입금대기</strong>
	                            <p class="small">
	                                입금이 아직 이뤄지지<br />
	                                않은 단계이며, 3일 이내<br />
	                                미입금시 자동<br />
	                                주문취소됩니다.
	                            </p>
	                        </li>
	                        <li class="nth-child-2">
	                            <span class="icon"><!-- icon --></span>
	                            <strong>결제완료</strong>
	                            <p class="small">
	                                카드결제 및 입금확인이<br />
	                                완료되어<br />
	                                물류/매장/파트너업체에<br />
	                                주문내역을<br />
	                                전달하였습니다.
	                            </p>
	                        </li>
	                        <li class="nth-child-3">
	                            <span class="icon"><!-- icon --></span>
	                            <strong>배송준비중</strong>
	                            <p class="small">
	                                고객님께 발송할 상품을<br />
	                                준비하고 있습니다.
	                            </p>
	                        </li>
	                        <li class="nth-child-4">
	                            <span class="icon"><!-- icon --></span>
	                            <strong>배송중/상품<br />준비완료</strong>
	                            <p class="small">
	                                택배사/매장으로 상품이<br />
	                                전달되어 배송이<br />
	                                시작되어 보통 1~2일<br />이내 도착합니다. 
	                            </p>
	                        </li>
	                        <li class="nth-child-5">
	                            <span class="icon"><!-- icon --></span>
	                            <strong>배송/픽업완료</strong>
	                            <p class="small">
	                                고객님께 상품이<br />
	                                배송되었습니다.<br />
	                                배송완료 14일 후<br />
	                                자동으로 구매확정<br />
	                                처리됩니다. 
	                            </p>
	                        </li>
	                    </ol>
	                    <p class="possible nth-child-1">
	                        <span>
	                            <em class="blind">입금대기, 결제완료 단계</em>
	                            주문취소/옵션변경/배송지변경 가능 
	                        </span>
	                    </p>
	                    <p class="possible nth-child-2">
	                        <span>
	                            <em class="blind">배송준비중 단계</em>
	                            주문취소/옵션변경/배송지변경 불가
	                        </span>
	                    </p>
	                    <p class="possible nth-child-3">
	                        <span>
	                            <em class="blind">배송중/상품 준비완료, 배송/픽업완료 단계</em>
	                            교환/반품 가능
	                        </span>
	                    </p>
	                </div><!-- // order-ship-guide -->
	
	            </div><!-- // #body -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->		
		<%-- 각 화면 본문 끝 --%>
		
		<%-- 겟잇나우 교환권 발송 팝업 폼 --%>
		<form name="getItNowForm" method="post" action="">
			<input type="hidden" name="ORD_MST_CD"/>
		</form>

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
    
 	// 상세페이지 이동
	goOrderView = function(ordMstCd){
		$frm.find("input[name='ORD_MST_CD']").val(ordMstCd);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingInfo.do", "target":"_self", "method":"get"}).submit();
	};
	
    // 검색
    search = function() 
    {
        $searchForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do", "target":"_self", "method":"get"}).submit(); 
    };

    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingList.do", "target":"_self", "method":"get"}).submit();
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
    	goSearchDelivery(url);
    };
    
	// 겟잇나우 교환권 발송 팝업
    goGetItNowTicketSend = function(ordMstCd){
    	window.open("","getItNowTicketPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=650,scrollbars=yes');
    	document.getItNowForm.action = "<c:out value="${serverSslDomain}"/>/pc/cart/getItNowTicketPopup.do";
    	document.getItNowForm.ORD_MST_CD.value = ordMstCd;
    	document.getItNowForm.target = "getItNowTicketPop";
    	document.getItNowForm.submit();
    }
});

//주문 보기 선택시
function changeSearchDlvGbn(idx){
	$("#searchDlvGbn_"+idx).prop("checked",true);
	$("#searchDlvGbn_"+idx).trigger("change");
	$("#searchDlvGbnBtn_"+idx).siblings().removeClass("btn_rd");
	$("#searchDlvGbnBtn_"+idx).siblings().addClass("btn_white");
	$("#searchDlvGbnBtn_"+idx).removeClass("btn_white");
	$("#searchDlvGbnBtn_"+idx).addClass("btn_rd");
	
	search();
}

//]]>
</script>

</html>