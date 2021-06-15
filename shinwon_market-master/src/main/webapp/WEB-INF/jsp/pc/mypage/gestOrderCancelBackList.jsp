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
	                <dd class="l"><a href="javascript:void(0)"><span>취소/교환/반품 조회</span></a></dd>
	            </dl>
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
				
	            <div id="body"><!-- #body -->
	
	                 <h3 class="title">취소/교환/반품 조회</h3>

	                <div class="order-change-progress"><!-- order-change-progress -->
	                    <div class="holder">
	                        <ul class="ct">
	                            <li class="col">
	                                <p class="tit">
	                                    	교환
	                                    <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.PRD_SWAP_CNT}" /></strong>건</span>
	                                </p>
	                                <ol class="ct step">
	                                    <li class="nth-child-1">
	                                        <span class="icon"><!-- icon --></span>
	                                        <p>교환신청<br />(교환접수승인)</p>
	                                    </li>
	                                    <li class="nth-child-2">
	                                        <span class="icon"><!-- icon --></span>
	                                        <p>교환대기중<br />(회수진행/완료)</p>
	                                    </li>
	                                    <li class="nth-child-3">
	                                        <span class="icon"><!-- icon --></span>
	                                        <p>교환물품배송</p>
	                                    </li>
	                                </ol>
	                            </li>
	                            <li class="col">
	                                <p class="tit">
	                                    	반품
	                                    <span class="number"><strong class="warning"><fmt:formatNumber value="${myPageOrderInfo.BACK_CNT}" /></strong>건</span>
	                                </p>
	                                <ol class="ct step">
	                                    <li class="nth-child-1">
	                                        <span class="icon"><!-- icon --></span>
	                                        <p>반품신청<br />(반품접수승인)</p>
	                                    </li>
	                                    <li class="nth-child-2">
	                                        <span class="icon"><!-- icon --></span>
	                                        <p>반품대기중<br />(회수진행/완료) </p>
	                                    </li>
	                                    <li class="nth-child-3">
	                                        <span class="icon"><!-- icon --></span>
	                                        <p>반품완료</p>
	                                    </li>
	                                </ol>
	                            </li>
	                        </ul>
	                    </div>
	                </div><!-- // order-change-progress -->
	                
					<form id="searchForm" name="searchForm">
					
					<input type="radio" id="searchState_0" name="searchState" value="cancel" <c:if test="${empty commandMap.searchState}">checked="checked"</c:if> style="display: none;"/>
	                <input type="radio" id="searchState_1" name="searchState" value="swap" <c:if test="${commandMap.searchState eq 'swap'}">checked="checked"</c:if> style="display: none;"/>
	                <input type="radio" id="searchState_2" name="searchState" value="back" <c:if test="${commandMap.searchState eq 'back'}">checked="checked"</c:if> style="display: none;"/>
	                	
	                <ul class="ct tab-a item-3"><!-- tab-a -->
	                    <li <c:if test="${commandMap.searchState eq 'cancel'}">class="active"</c:if>><a href="javascript:changeSearchState('0');"><span>취소내역</span></a><c:if test="${commandMap.searchState eq 'cancel'}"><span class="blind">현재위치</span></c:if></li>
	                    <li <c:if test="${commandMap.searchState eq 'swap'}">class="active"</c:if>><a href="javascript:changeSearchState('1');"><span>교환내역</span></a><c:if test="${commandMap.searchState eq 'swap'}"><span class="blind">현재위치</span></c:if></li>
	                    <li <c:if test="${commandMap.searchState eq 'back'}">class="active"</c:if>><a href="javascript:changeSearchState('2');"><span>반품내역</span></a><c:if test="${commandMap.searchState eq 'back'}"><span class="blind">현재위치</span></c:if></li>
	                </ul><!-- // tab-a -->
	
	                <%-- <div class="search-order"><!-- search-order -->
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
	                </div><!-- // search-order --> --%>
	
	                </form>
	
	                <table class="table-product table-my-order mt10"><!-- table-product -->
	                <caption>주문일, 주문번호, 총결제금액, 상품정보, 배송정보로 구성된 쇼핑몰 주문내역 목록입니다.</caption>
	                <colgroup>
	                    <col style="width: 10%;" />
	                    <col style="width: 15%;" />
	                    <col style="width: auto;" />
	                    <col style="width: 15%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"><span>주문일</span></th>
	                        <th scope="col"><span>주문번호</span></th>
	                        <th scope="col"><span>상품정보</span></th>
	                        <th scope="col"><span>진행현황</span></th>
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
			                                    <c:if test="${not empty data.ORD_PRD_ORG_IDX}" > 
										        	<img src="<c:out value="${cdnDomain }"/>/pc/img/ico/ico_reply.png" alt="교환" style="width:17px;" />
										        </c:if>
			                                        <a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');"><c:out value="${data.PRD_MST_NM }" /></a>
			                                    </p>
			                                    <c:if test="${data.TOT_VDR_PRD_CNT gt 0 && commandMap.searchCancelBack ne 'Y'}">
			                                    	<p class="desc">
				                                        	외 <c:out value="${data.TOT_VDR_PRD_CNT }" />건
				                                    </p>
			                                    </c:if>
			                                    <c:if test="${data.TOT_VDR_PRD_CNT gt 0 && commandMap.searchCancelBack eq 'Y'}">
			                                    	<c:if test="${empty data.ORD_PRD_ORG_IDX}" >
				                                    	<c:if test="${not empty data.OPT_DTL_NM or not empty data.subPrdList}">
															<div class="option dotum">
																옵션 :
																<c:if test="${not empty data.optionList}">
																	<c:out value="${data.OPT_DTL_NM}" />
																	<c:if test="${not empty data.subPrdList}">
																		&nbsp;/&nbsp;
																	</c:if>
																</c:if>
																
																<%-- 선택옵션 상품 리스트 --%>
																<c:if test="${not empty data.subPrdList}">
																	<c:forEach var="subPrd" items="${data.subPrdList}" varStatus="i">
																		${subPrd.OPT_DTL_NM}
																		(
																			<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																				+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																			</c:if>
																		<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
																		${i.last ? '' : '/&nbsp;'}	
																	</c:forEach>
																</c:if>
															</div>
														</c:if>
													</c:if>
			                                    </c:if>
			                                </div>
			                            </div>
			                        </td>
			                        <td class="step">
			                        	<c:out value="${data.ORD_PRD_ORD_STATE_NM }"/>
			                        </td>
			                    </tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<tr>
			                        <td colspan="4">
			                            <p class="message no-more">
			                                	최근 6개월 간
			                                	<c:choose>
			                                		<c:when test="${commandMap.seartState eq 'cancel'}">
			                                			취소
			                                		</c:when>
			                                		<c:when test="${commandMap.seartState eq 'swap'}">
			                                			교환
			                                		</c:when>
			                                		<c:when test="${commandMap.seartState eq 'back'}">
			                                			반품
			                                		</c:when>
			                                	</c:choose>
			                                	내역이 없습니다.
			                            </p>
			                        </td>
			                    </tr>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	                </table><!-- // table-product -->
	
	                <div class="frame-a"><!-- frame-a -->
	                    <ul class="list list-a small">
	                        <li><strong>최근 6개월 간 취소 내역 입니다.</strong></li>
	                        <li>주문취소는 주문상세에서 가능합니다. 배송준비중일 경우에는 [고객센터] 또는 [1:1문의]를 통해 취소가 가능하며,<br />출고여부를 확인후에 취소여부를 안내해 드립니다.</li>
	                        <li>주문취소를 하시면 전체주문이 즉시 취소되며, 주문상품 중 일부만 취소하실 경우 주문취소 후 재주문 하시기 바랍니다.</li>
	                        <li>이미 출고된 상품이 있는 경우 주문을 취소할 수 없습니다. 반품 메뉴를 이용하시기 바랍니다.</li>
	                    </ul>
	                </div><!-- // frame-a -->
					
					<form id="frm" name="frm">
		                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		                <input type="hidden" name="ORD_MST_CD" value=""/> 
		                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
		                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
		                <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
		                <input type="hidden" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
		                
						<%-- <div class="section-pagination"><!-- section pagination -->
						    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
		                </div><!-- // section pagination --> --%>
		            </form>
	
	                <h4 class="title guide">주문취소 안내</h4>

	                <table class="table-a table-col"><!-- table-a -->
	                <caption>취소가능, 취소불가로 구성된 주문취소 안내 테이블입니다.</caption>
	                <colgroup>
	                    <col style="width: 140px;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">취소가능</th>
	                        <td>
	                            <ul class="list list-a small">
	                                <li>입금대기 : 주문취소가 가능합니다.</li>
	                                <li>결제완료 : 주문취소가 가능합니다. 결제수단별 환불안내를 확인해주시기 바랍니다.</li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">취소불가</th>
	                        <td>
	                            <ul class="list list-a small">
	                                <li>배송준비중 : 배송을 위하여 물류/매장으로 주문정보가 전달되어 주문취소가 불가능합니다.<br />
	                                [고객센터] 또는 [1:1문의]를 통해 취소가 가능하며, 출고여부를 확인후에 취소여부를 안내해 드립니다.
	                                </li> 
	                                <li>배송중 : 물류/택배사가 배송을 시작하여 주문취소가 불가능합니다. </li>
	                                <li>배송완료 : 배송이 완료된 상태이므로 반품 메뉴를 이용하시기 바랍니다.</li>
	                            </ul>
	                        </td>
	                    </tr>
	                </tbody>
	                </table><!-- // table-a -->
	
	                <h4 class="title guide">결제수단별 환불안내</h4>
	
	                <table class="table-a table-col"><!-- table-a -->
	                <caption>신용카드, 실시간계좌이체, 무통장입금, OK캐쉬백 포인트로 구성된 결제수단별 환불안내 테이블입니다.</caption>
	                <colgroup>
	                    <col style="width: 140px;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row">신용카드</th>
	                        <td>
	                            <ul class="list list-a small">
	                                <li>승인취소 : 신용카드 승인취소는 매입(카드사로 결제정보가 넘어가기 전)인 경우에는 취소 승인한 당일 취소됩니다.</li>
	                                <li>매입취소 : 카드사로 결제정보가 넘어간 후에는 카드사에서 취소처리를 하는데 1~2주 정도 소요 됩니다.<br />
	                                    (카드사별 취소 반영이 차이가 있습니다. 각 카드사 홈페이지에서 확인 가능합니다.)
	                                </li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">실시간계좌이체</th>
	                        <td>
	                            <ul class="list list-a small">
	                                <li>취소신청 완료 후 익일에 실시간 계좌이체가 진행된 고객님의 계좌로 직접 환불됩니다.</li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">무통장입금</th>
	                        <td>
	                            <ul class="list list-a small">
	                                <li>고객센터 해피콜 이후, 고객님의 취소신청 시 입력된 환불계좌로 2~3일 이내 환불됩니다.</li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">OK캐쉬백 포인트</th>
	                        <td>
	                            <ul class="list list-a small">
	                                <li>전액환불 : OK캐쉬백 포인트를 사용하신 주문이 전체취소시 즉시 환불됩니다.</li>
	                            </ul>
	                        </td>
	                    </tr>
	                </tbody>
	                </table><!-- // table-a -->
	
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
        $searchForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/gestOrderCancelBackList.do", "target":"_self", "method":"get"}).submit(); 
    };

    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/gestOrderCancelBackList.do", "target":"_self", "method":"get"}).submit();
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
    	goSearchDelivery(url);
    };
});

//주문 보기 선택시
function changeSearchState(idx){
	$("#searchState_"+idx).prop("checked",true);
	$("#searchState_"+idx).trigger("change");
	
	search();
}

//]]>
</script>

</html>