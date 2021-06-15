<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>취소/교환/반품 조회</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

		<form id="searchForm" name="searchForm">
		<input type="hidden" name="searchDate" value="<c:out value="${commandMap.searchDate }"/>" />
        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
        <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
					
		<input type="radio" id="searchState_0" name="searchState" value="cancel" <c:if test="${empty commandMap.searchState}">checked="checked"</c:if> style="display: none;"/>
		<input type="radio" id="searchState_1" name="searchState" value="swap" <c:if test="${commandMap.searchState eq 'swap'}">checked="checked"</c:if> style="display: none;"/>
		<input type="radio" id="searchState_2" name="searchState" value="back" <c:if test="${commandMap.searchState eq 'back'}">checked="checked"</c:if> style="display: none;"/>
	                
        <div class="tab-a" data-role="navbar"><!-- tab-a -->
            <ul>
                <li <c:if test="${commandMap.searchState eq 'cancel'}">class="active"</c:if>><a href="javascript:changeSearchState('0');">취소내역</a><c:if test="${commandMap.searchState eq 'cancel'}"><span class="blind">현재위치</span></c:if></li>
                <li <c:if test="${commandMap.searchState eq 'swap'}">class="active"</c:if>><a href="javascript:changeSearchState('1');">교환내역</a><c:if test="${commandMap.searchState eq 'swap'}"><span class="blind">현재위치</span></c:if></li>
                <li <c:if test="${commandMap.searchState eq 'back'}">class="active"</c:if>><a href="javascript:changeSearchState('2');">반품내역</a><c:if test="${commandMap.searchState eq 'back'}"><span class="blind">현재위치</span></c:if></li>
            </ul>
        </div><!-- // tab-a -->

        <div class="order-date-button"><!-- order-date-button -->
            <h3>조회기간</h3>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 1}">active</c:if>" data-date="1"><span>1주일</span></a>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 2}">active</c:if>" data-date="2"><span>한달</span></a>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 3}">active</c:if>" data-date="3"><span>6개월</span></a>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 4}">active</c:if>" data-date="4"><span>1년</span></a>
        </div><!-- // order-date-button -->
        
        </form>

		<c:choose>
		    <c:when test="${not empty list}">
	        <table class="table-order" border="0" cellpadding="0" cellspacing="0"><!-- table-order -->
	        <caption>상품정보, 진행현황으로 구성된 취소 내역 목록입니다.</caption>
	        <colgroup>
	            <col style="width: auto;">
		            <col style="width: 28%;">
	        </colgroup>
	        <thead class="blind">
	            <tr>
	                <th scope="col">상품정보</th>
	                <th scope="col">진행현황</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="data" items="${list }" varStatus="status">
	        		<c:if test="${data.ORD_RNK eq 1 }">
			            <tr class="title">
			                <td class="nunmber">
			                    	주문번호 <a href="javascript:;" class="primary"><c:out value="${data.ORD_MST_CD }" /></a>
			                </td>
			                <td class="date">
			                    <span class="blind">주문일</span>
			                    <ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/> <em></em>
			                </td>
			            </tr>
		            </c:if>
		            <tr>
		                <td class="text-left">
		                    <div class="module">
		                        <a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');">
		                            <span class="thumb"><img data-original="<c:out value="${cdnDomain }${data.PRODUCT_THUM_IMG}"/>" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="${data.PRD_IMAGE_ALT}" /></span>
		                            <span class="subject"><c:out value="${data.PRD_MST_NM }" /></span>
		                        </a>
		                        <c:if test="${data.TOT_VDR_PRD_CNT gt 0 && commandMap.searchCancelBack ne 'Y'}">
		                        <p><span class="primary">외 <c:out value="${data.TOT_VDR_PRD_CNT }" />건</span></p>
		                        </c:if>
		                        <c:if test="${data.TOT_VDR_PRD_CNT gt 0 && commandMap.searchCancelBack eq 'Y'}">
                                   	<c:if test="${empty data.ORD_PRD_ORG_IDX}" >
                                    	<c:if test="${not empty data.OPT_DTL_NM or not empty data.subPrdList}">
											<div class="option">
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
		                </td>
		                <td>
		                    <strong>
		                    	<c:out value="${data.ORD_PRD_ORD_STATE_NM }"/>
		                    </strong>
		                    <c:if test="${data.REPAY_YN eq 'Y'}">
		                    	<span class="warning">(재주문가능)</span>
		                    </c:if>
		                </td>
		            </tr>
	            </c:forEach>
	        </tbody>
	        </table><!-- // table-order -->
	        </c:when>
        <c:otherwise>
        	<p class="no-more-order-b mt15">
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
        </c:otherwise>
		</c:choose>
		
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

		<c:choose>
       		<c:when test="${commandMap.seartState eq 'cancel'}">
       			<div class="padder mt20">
		            <ul class="list list-a mt10">
		                <li><strong>최근 1년 간 취소 내역입니다.</strong></li>
		                <li>주문취소는 주문상세에서 가능합니다. 배송준비중일 경우에는 [고객센터]에 문의해 주세요.</li>
		            </ul>
		        </div>
        
       			<div class="order-guide accordion mt30" data-role="collapsible-set"><!-- order-guide -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>주문취소 안내</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <h4>취소가능</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>입금대기 : 주문취소가 가능합니다. </li>
		                            <li>결제완료 : 주문취소가 가능합니다. 결제수단별 환불안내를 확인해주시기 바랍니다.</li>
		                        </ul>
		                    </div>
		
		                    <h4>취소불가</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>배송준비중 : 배송을 위하여 물류/매장으로 주문정보가 전달되어 주문취소가 불가능합니다.</li> 
		                            <li>[고객센터] 또는 [1:1문의]를 통해 취소가 가능하며, 출고여부를 확인후에 취소여부를 안내해 드립니다. </li>
		                            <li>배송중 : 물류/택배사가 배송을 시작하여 주문취소가 불가능합니다. </li>
		                            <li>배송완료 : 배송이 완료된 상태이므로 반품 메뉴를 이용하시기 바랍니다.</li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		            <div class="section" data-role="collapsible" data-collapsed="true">
		                <h3>
		                    <strong>결제수단별 환불안내</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <h4>신용카드</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>승인취소 : 신용카드 승인취소는 매입이 되기 전이기 때문에 승인한 당일 취소됩니다.</li>
		                            <li>매입취소 : 카드사로 매입취소 신청을 하면 카드사에서 취소처리를 하는데 1~2주 정도 소요 됩니다.<br />
		                              (카드사별 취소 반영이 차이가 있습니다. 각 카드사 홈페이지에서 확인 가능합니다.)
		                            </li>
		                        </ul>
		                    </div>
		
		                    <h4>실시간계좌이체</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>익일에 실시간 계좌이체가 진행된 고객님의 계좌로 직접 환불됩니다.</li>
		                        </ul>
		                    </div>
		
		                    <h4>무통장입금</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>고객센터 해피콜 이후, 고객님의 취소신청 시 입력된 환불계좌로 2~3일 이내 환불됩니다. </li>
		                        </ul>
		                    </div>
		
		                    <h4>OK캐쉬백 포인트</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>전액환불 : OK캐쉬백 포인트를 사용하신 주문이 전체취소시 즉시 환불됩니다. </li>
		                        </ul>
		                    </div>
		
		                </div>
		            </div>
		        </div><!-- // order-guide -->
       		</c:when>
       		<c:when test="${commandMap.seartState eq 'swap'}">
       			<div class="padder mt20">
		            <ul class="list list-a mt10">
		                <li><strong>최근 1년 간 교환 내역입니다.</strong></li>
		                <li>교환신청은 배송완료 이후에 주문상세 에서 가능하며, 배송중일 경우에는 [고객센터]에 문의해 주세요</li>
		            </ul>
		        </div>
        
       			<div class="order-guide accordion mt30" data-role="collapsible-set"><!-- order-guide -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>교환절차안내</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <h4>1. 교환신청</h4>
		
		                    <div class="holder">
		                        <p>
		                            교환을 신청하셨습니다.
		                        </p>
		                    </div>
		
		                    <h4>2. 교환대기중</h4>
		
		                    <div class="holder">
		                        <p>
		                            교환신청이 정상적으로 접수되었습니다.
		                        </p>
		                    </div>
		
		                    <h4>3. 회수상품확인중</h4>
		
		                    <div class="holder">
		                        <p>
		                            상품이 회수 중이거나 회수된 상품을 확인 중입니다.
		                        </p>
		                    </div>
		
		                    <h4>4. 교환상품준비중</h4>
		
		                    <div class="holder">
		                        <p>
		                            상품회수가 정상적으로 처리되어 새로운 상품을 발송하였습니다.
		                        </p>
		                    </div>
		
		                    <h4>5. 교환완료</h4>
		
		                    <div class="holder">
		                        <p>
		                            교환을 신청하셨습니다.
		                        </p>
		
		                        <hr>
		
		                        <p>
		                            교환 배송비는 상품하자나 불량으로 귀책사유가 당사에 있을 경우를 제외하고 고객변심일 경우 고객님께서 부담하셔야 합니다.
		                        </p>
		
		                        <h5>교환이 불가능한 경우</h5>
		
		                        <ul class="list list-b">
		                            <li>제품이 사용되었거나 훼손된 경우</li>
		                            <li>제품에 부착되어있는 상품 택(TAG)을 제거 또는 상품 개봉으로 상품 가치가 훼손된 경우</li>
		                            <li>상품설명에 기재한 사용시 주의사항을 지키지 않은 경우</li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div><!-- // order-guide -->
       		</c:when>
       		<c:when test="${commandMap.seartState eq 'back'}">
       			<div class="padder mt20">
		            <ul class="list list-a mt10">
		                <li><strong>최근 1년 간 반품 내역 입니다.</strong></li>
		                <li>반품신청은 배송완료 이후에 주문상세 에서 가능하며, 배송중일 경우에는 [고객센터] 에 문의해 주세요</li>
		            </ul>
		        </div>
		        
       			<div class="order-guide accordion mt30" data-role="collapsible-set"><!-- order-guide -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>반품절차안내</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <h4>1. 반품신청</h4>
		
		                    <div class="holder">
		                        <p>
		                            반품을 신청하셨습니다.
		                        </p>
		                    </div>
		
		                    <h4>2. 반품대기중</h4>
		
		                    <div class="holder">
		                        <p>
		                            반품신청이 정상적으로 접수되었습니다.
		                        </p>
		                    </div>
		
		                    <h4>3. 반품상품확인중</h4>
		
		                    <div class="holder">
		                        <p>
		                            상품이 회수 중이거나 반품된 상품을 확인 중입니다.
		                        </p>
		                    </div>
		
		                    <h4>4. 반품완료</h4>
		
		                    <div class="holder">
		                        <p>
		                            반품된 상품확인 후 결제취소 또는 환불을 해드립니다. 
		                        </p>
		
		                        <hr>
		
		                        <p>
		                            반품 배송비는 상품하자나 불량으로 귀책사유가 당사에 있을 경우를 제외하고 고객변심일 경우 고객님께서 부담하셔야 합니다.
		                        </p>
		
		                        <h5>반품이 불가능한 경우</h5>
		
		                        <ul class="list list-b">
		                            <li>제품이 사용되었거나 훼손된 경우(단, 내용 확인을 위한 포장 개봉의 경우는 예외)</li>
		                            <li>제품에 부착되어있는 상품 택(TAG)을 제거 또는 상품 개봉으로 상품 가치가 훼손된 경우</li>
		                            <li>상품설명에 기재한 사용시 주의사항을 지키지 않은 경우</li>
		                            <li>환불은 현금 결제일 경우 제품 회수 확인 후 3일 이내에 환불처리됩니다.</li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		            <div class="section" data-role="collapsible" data-collapsed="true">
		                <h3>
		                    <strong>결제수단별 환불안내</strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <h4>신용카드</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>승인취소 : 신용카드 승인취소는 매입이 되기 전이기 때문에 승인한 당일 취소됩니다.</li>
		                            <li>매입취소 : 카드사로 매입취소 신청을 하면 카드사에서 취소처리를 하는데 1~2주 정도 소요 됩니다.<br />
		                              (카드사별 취소 반영이 차이가 있습니다. 각 카드사 홈페이지에서 확인 가능합니다.)
		                            </li>
		                        </ul>
		                    </div>
		
		                    <h4>실시간계좌이체</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>익일에 실시간 계좌이체가 진행된 고객님의 계좌로 직접 환불됩니다.</li>
		                        </ul>
		                    </div>
		
		                    <h4>무통장입금</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>고객센터 해피콜 이후, 고객님의 취소신청 시 입력된 환불계좌로 2~3일 이내 환불됩니다. </li>
		                        </ul>
		                    </div>
		
		                    <h4>OK캐쉬백 포인트</h4>
		
		                    <div class="holder">
		                        <ul class="list list-a">
		                            <li>전액환불 : OK캐쉬백 포인트를 사용하신 주문이 전체취소시 즉시 환불됩니다. </li>
		                        </ul>
		                    </div>
		
		                </div>
		            </div>
		        </div><!-- // order-guide -->
       		</c:when>
       	</c:choose>
	           	
	</article>
	<!--// #container E -->

	<%-- 겟잇나우 교환권 발송 팝업 폼 --%>
	<form name="getItNowForm" method="post" action="">
		<input type="hidden" name="ORD_MST_CD"/>
	</form>
		
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
</section>
<!--// #wrap E -->

<script type="text/javascript">
//<![CDATA[
$(function(){
	var $searchForm = $("#searchForm");
	var $frm = $("#frm");
	
	// 상세페이지 이동
	goOrderView = function(ordMstCd){
		$frm.find("input[name='ORD_MST_CD']").val(ordMstCd);
        $frm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingInfo.do", "target":"_self", "method":"get"}).submit();
	};
	
    // 검색
    search = function() 
    {
    	$searchForm.find("input[name=searchDate]").val("");
        $searchForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myOrderCancelBackList.do", "target":"_self", "method":"get"}).submit(); 
    };

    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/mypage/myOrderCancelBackList.do", "target":"_self", "method":"get"}).submit();
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
    	goSearchDelivery(url);
    };
    
 	// 개월 수 클릭시
    $(document).on("click",".searchDate",function(){
    	var searchDate = $(this).data("date");
    	$searchForm.find("input[name=searchDate]").val(searchDate);
    	$searchForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myOrderCancelBackList.do", "target":"_self", "method":"get"}).submit(); 
    });
});

//주문 보기 선택시
function changeSearchState(idx){
	$("#searchState_"+idx).prop("checked",true);
	
	search();
}

//]]>
</script>

</body>
</html>