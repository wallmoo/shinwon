<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
    
    <%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
    
    <!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>증빙서류발급</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>

            <div id="body"><!-- #body -->

                <h3 class="title">증빙서류발급</h3>

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

                <table class="table-product table-my-order mt30"><!-- table-product -->
                <caption>처리일, 주문번호, 총결제금액, 상품정보, 영수증, 세금계산서로 구성된 주문 목록입니다.</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 14%;" />
                    <col style="width: 12%;" />
                    <col style="width: auto;" />
                    <col style="width: 12%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><span>처리일</span></th>
                        <th scope="col"><span>주문번호</span></th>
                        <th scope="col"><span>총결제금액</span></th>
                        <th scope="col"><span>상품정보</span></th>
                        <th scope="col"><span>영수증</span></th>
                        <th scope="col"><span>세금계산서</span></th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
					    <c:when test="${not empty list}">
					    	<c:forEach var="data" items="${list }" varStatus="status">
					    	<tr>
					    		<td class="date"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/></td>
		                        <td class="order-number">
		                            <p><a href="javascript:goOrderView('<c:out value="${data.ORD_MST_CD }" />');"><c:out value="${data.ORD_MST_CD }" /></a></p>
		                        </td>
		                        <td class="price">
		                            <p><span class="warning"><fmt:formatNumber value="${data.ORD_MST_PAY_PRC}" type="number"/></span>원</p>
		                        </td>
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
		                                    <c:if test="${data.TOT_ORD_PRD_CNT gt 0 }">
		                                    	<p class="desc">
			                                        	외 <c:out value="${data.TOT_ORD_PRD_CNT }" />건
			                                    </p>
		                                    </c:if>
		                                </div>
		                            </div>
		                        </td>
		                        <td class="receipt">
		                        	<c:choose>
										<c:when test="${data.ORD_MST_PAY_TYPE eq Code.PAY_CARD or data.ORD_MST_PAY_TYPE eq Code.PAY_FOREIGN_CARD}"><%-- 신용카드 --%>
											<a href="javascript:printKiccReceipt('<c:out value="${data.PAY_MST_TID}" />', '01');" class="btn_st0 btn_white small"><span>신용카드 전표</span></a>
										</c:when>
										<c:when test="${data.ORD_MST_PAY_TYPE eq Code.PAY_KAKAOPAY }"><%-- 카카오페이 --%>
											<a href="javascript:printKakaoReceipt('<c:out value="${data.PAY_MST_TID}" />');" class="btn_st0 btn_white small"><span>신용카드 전표</span></a>
										</c:when>
										<c:when test="${data.ORD_MST_PAY_TYPE eq Code.PAY_PAYNOW }"><%-- 페이나우 --%>
											<a href="javascript:printCardReceipt();" class="btn_st0 btn_white small"><span>신용카드 전표</span></a>
										</c:when>
										<c:when test="${data.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or data.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW}"><%-- 무통장 or 에스크로 --%>
											<c:if test="${data.ORD_MST_CSH_RCP eq 'Y' }">
												<a href="javascript:printKiccReceipt('<c:out value="${data.PAY_MST_TID}" />', '03');" class="btn_st0 btn_white small"><span>현금 영수증</span></a>
											</c:if>
										</c:when>
										<c:when test="${data.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT}"><%-- 실시간 계좌이체 --%>
											<c:if test="${data.ORD_MST_CSH_RCP eq 'Y' }">
												<a href="javascript:printKiccReceipt('<c:out value="${data.PAY_MST_TID}" />', '02');" class="btn_st0 btn_white small"><span>현금 영수증</span></a>
											</c:if>
										</c:when>
									</c:choose>
		                        </td>
		                        <td class="tax">
		                        	<c:if test="${data.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or data.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW or data.ORD_MST_PAY_TYPE eq Code.PAY_ACCOUNT }">
		                        		<c:if test="${data.ORD_MST_CSH_RCP ne 'Y' }">
		                        			<c:choose>
		                        				<c:when test="${empty data.TAX_IVC_IDX }">
		                        					<a href="javascript:taxInvoceFormPop('<c:out value="${data.ORD_MST_CD }"/>');" class="btn_st0 btn_white small tax"><span>신청</span></a>
		                        				</c:when>
		                        				<c:otherwise>
		                        					<c:choose>
		                        						<c:when test="${data.TAX_IVC_STATE eq 'Y' }">
		                        							발행완료
		                        						</c:when>
		                        						<c:otherwise>
		                        							신청완료
		                        						</c:otherwise>
		                        					</c:choose>
		                        				</c:otherwise>
		                        			</c:choose>
		                        		</c:if>
		                        	</c:if>
		                        </td>
		                    </tr>
					    	</c:forEach>
					    </c:when>
					    <c:otherwise>
							<tr>
		                        <td colspan="6">
		                            <p class="message no-more">
		                                	최근 6개월 간 주문 내역이 없습니다.
		                            </p>
		                        </td>
		                    </tr>
					    </c:otherwise>
					</c:choose>
                </tbody>
                </table><!-- // table-product -->

                <div class="frame-a"><!-- frame-a -->
                    <ul class="list list-a small">
                        <li><strong>최근 6개월 간 주문 내역으로 증빙서류 출력이 가능한 주문내역입니다.</strong></li>
                        <li>신용카드 결제, 또는 현금 영수증을 신청한 현금 결제 주문에 한해서 증명서류 출력이 가능합니다.</li>
                        <li>부가세법 시행령 제 57조 2항에 의거하여, 신용카드 전표는 세금계산서 대용으로 세액 공제를 받을 수 있습니다.</li>
                        <li><strong>세금계산서는 전자세금계산서로 발급되며, 세금계산서 신청시 입력된 이메일주소로 발급됩니다.</strong></li>
                        <li>세금계산서 발급 문의는 [고객센터] 또는 [1:1문의]로 문의해 주시기 바랍니다.</li>
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
	
	<%-- kicc 영수증 출력용 폼 --%>
	<form name="kiccReceiptForm" method="get" action=""> 
		<input type="hidden" name="controlNo"/>
        <input type="hidden" name="payment"/>
	</form>
	
	<%--세금계산서 신청 폼 --%>
	<form id="taxIvcForm" name="taxIvcForm" method="post" action=""> 
		<input type="hidden" name="ORD_MST_CD"/>
	</form>

	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
</section>
<!--// #wrap E -->

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 -->
<script type="text/javascript">
//<![CDATA[
$(function(){
	var CST_PLATFORM = "<c:out value="${commandMap.CST_PLATFORM }" />";
	
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
        $searchForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myReceiptIssueList.do", "target":"_self", "method":"get"}).submit(); 
    };

    // 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myReceiptIssueList.do", "target":"_self", "method":"get"}).submit();
    };
    
    /*
	카드 영수증 팝업 출력(카카오페이)
	@param tid: 거래 아이디
	*/
    printKakaoReceipt = function (tid)
   	{
		var status =
		"toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=420,height=540";
		var url = "https://mms.cnspay.co.kr/trans/retrieveIssueLoader.do?TID="+tid+"&type=0";
		window.open(url,"popupIssue",status);
	}
	
	// KICC 거래내역  영수증 팝업
    printKiccReceipt = function (controlNo, payment)
    {
    	var url = "http://testoffice.easypay.co.kr/receipt/ReceiptBranch.jsp";
    	if(CST_PLATFORM != "test"){
    		url = "https://office.easypay.co.kr/receipt/ReceiptBranch.jsp"; 
    	}
    	window.open("","MEMB_POP_RECEIPT", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=450,height=700');
    	document.kiccReceiptForm.action = url;
    	document.kiccReceiptForm.controlNo.value = controlNo;
    	document.kiccReceiptForm.payment.value = payment;
    	document.kiccReceiptForm.target = "MEMB_POP_RECEIPT";
    	document.kiccReceiptForm.submit();
    };
    
 	// 세금계산서 신청 팝업
    taxInvoceFormPop = function (orderCd)
    {
    	window.open("","taxInvoceFormPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=700,scrollbars=yes');
    	document.taxIvcForm.action =  "<c:out value="${serverSslDomain}"/>/pc/mypage/taxInvoiceFormPopup.do";
    	document.taxIvcForm.ORD_MST_CD.value = orderCd;
    	document.taxIvcForm.target = "taxInvoceFormPop";
    	document.taxIvcForm.submit();
    };
});
//]]>
</script>

</body>
</html>