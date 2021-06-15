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
            <h2>주문/배송조회</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

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

        <hr class="hr-a">

        <div class="tab-a" data-role="navbar"><!-- tab-a -->
            <ul>
                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');" target="_self">쇼핑몰 주문내역</a></li>
                <li class="active"><a href="<c:out value="${mobileSslDomain}" />/mobile/mypage/myOfflineShoppingList.do" target="_self">오프라인 매장 주문내역</a><span class="blind">현재위치</span></li>
            </ul>
        </div><!-- // tab-a -->

        <div class="order-date-button"><!-- order-date-button -->
            <h3>조회기간</h3>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 1}">active</c:if>" data-date="1"><span>1주일</span></a>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 2}">active</c:if>" data-date="2"><span>한달</span></a>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 3}">active</c:if>" data-date="3"><span>6개월</span></a>
            <a href="javascript:;" class="button small searchDate <c:if test="${commandMap.searchDate eq 4}">active</c:if>" data-date="4"><span>1년</span></a>
        </div><!-- // order-date-button -->
		
		<form id="searchForm" name="searchForm">
		<input type="hidden" name="searchDate" value="<c:out value="${commandMap.searchDate }"/>" />
        </form>
        
        <c:choose>
		    <c:when test="${not empty list}">
		        <table class="table-order off-line mt10" border="0" cellpadding="0" cellspacing="0"><!-- table-order -->
		        <caption>상품정보, 진행현황으로 구성된 주문하신 상품목록입니다.</caption>
		        <colgroup>
		            <col style="width: auto;">
		            <col style="width: 32%;">
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
			                    	매장명 <a href="javascript:;" class="primary"><c:out value="${data.SHOP_NM }" /></a>
			                </td>
			                <td class="date">
			                    <span class="blind">주문일</span>
			                    <ui:formatDate value="${data.ORD_DT}" pattern="yyyy.MM.dd"/> <em></em>
			                </td>
			            </tr>
		            </c:if>
		            <tr>
		                <td class="text-left">
		                    <div class="module">
		                        <a href="javascript:;">
		                            <span class="subject"><c:out value="${data.PRD_NM }" /></span>
		                        </a>
		                    </div>
		                </td>
		                <c:if test="${data.ORD_RNK eq 1 }">
			                <td class="price" rowspan="<c:out value="${data.ORD_CNT}"/>">
			                    <strong class="large warning"><fmt:formatNumber value="${data.ORD_PRC}" type="number"/>원</strong>
			                </td>
		                </c:if>
		            </tr>
		            </c:forEach>
		        </tbody>
		        </table><!-- // table-order -->
			</c:when>
			<c:otherwise>
				<p class="no-more-order-b mt20">
		            주문내역이 없습니다. 
		        </p>
			</c:otherwise>	
        </c:choose>

        <form id="frm" name="frm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            <input type="hidden" name="ORD_MST_CD" value=""/> 
            <input type="hidden" name="searchDate" value="<c:out value="${commandMap.searchDate }"/>" />
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
            
			<div class="section-pagination"><!-- section pagination -->
			    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
            </div><!-- // section pagination -->
        </form>

        <div class="padder mt20">
            <ul class="list list-a mt10">
                <li>최근 <strong>1년 간</strong>오프라인 매장에서 주문하신 내역 입니다.</li>
                <li>1년 이전 내역은 PC용 사이트에서 확인하실 수 있습니다.</li>
            </ul>
        </div>
            
    </article>
	<!--// #container E -->
		
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
</section>
<!--// #wrap E -->

<script>
$(function(){
	var $searchForm = $("#searchForm");
	var $frm = $("#frm");
    
	// 검색
    search = function() 
    {
        $searchForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myOfflineShoppingList.do", "target":"_self", "method":"get"}).submit(); 
    };
    
	// 페이지 이동
    goPage = function (cPage) 
    {
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/mypage/myOfflineShoppingList.do", "target":"_self", "method":"get"}).submit();
    };
	
    // 개월 수 클릭시
    $(document).on("click",".searchDate",function(){
    	var searchDate = $(this).data("date");
    	$searchForm.find("input[name=searchDate]").val(searchDate);
    	$searchForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myOfflineShoppingList.do", "target":"_self", "method":"get"}).submit(); 
    });
});
</script>
</body>
</html>