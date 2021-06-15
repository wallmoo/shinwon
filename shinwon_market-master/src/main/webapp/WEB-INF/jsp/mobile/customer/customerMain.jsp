<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
	<article id="container" class="container" data-role="content" style="padding-bottom: 0px;">
		<!-- .cate_gnb S -->
		
        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>고객센터</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="customer-links"><!-- order-step -->
            <ol class="ui-grid-b">
                <li class="ui-block-a"><a href="javascript:goInquiry();"><i><!-- icon --></i><span>1:1 문의</span></a></li>
                <li class="ui-block-b"><a href="<c:out value="${mobileDomain}" />/mobile/event/memberBenefit.do"><i><!-- icon --></i><span>등급별회원혜택</span><em class="small">(쇼핑몰/지점)</em></a></li>
                <li class="ui-block-c"><a href="tel:02-6925-1160"><i><!-- icon --></i><span>온라인고객센터</span><em class="small">02-6925-1160</em></a></li>
            </ol>
        </div><!-- // order-step -->

        <hr class="hr-b">

        <div class="faq-search"><!-- faq-search -->
            <label for="faqSearch" class="xlarge">FAQ</label>
            <input type="text" id="faqSearch" class="text">
            <a href="javascript:goSearch();" class="button primary"><span>검색</span></a>
        </div><!-- // faq-search -->

        <div class="faq-links"><!-- faq-links -->
            <h3>자주묻는 질문(FAQ)</h3>
            <ul class="ct">
	            <c:forEach var="codeRow" items="${faqCodeList }" varStatus="i">
	                <li><a class="_pg_link" href="<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do?BRD_CMN_COM_UP_IDX=<c:out value="${codeRow.CMN_COM_IDX}" />"><c:out value="${codeRow.CMN_COM_NM}" /></a></li>
	            </c:forEach>
            </ul>
        </div><!-- // faq-links -->

        <div class="section-button"><!-- section-button -->
            <a href="javascript:;" class="button primary full"><span><i class="icon location"><!-- icon --></i>마켓플랜트 지점안내</span></a>
        </div><!-- // section-button -->

        <div class="bbs-preview"><!-- bbs-preview -->
            <h3>공지사항</h3>
            <ul>
	            <c:forEach var="noticeRow" items="${noticeList }" varStatus="i">
	                <li>
	                    <a data-ajax="false" href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardView.do?BRD_NTS_IDX=<c:out value="${noticeRow.BRD_NTS_IDX}" />"><c:out value="${noticeRow.BRD_NTS_TITLE}" /></a>
	                    <span class="date"><ui:formatDate value="${noticeRow.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/></span>
	                </li>
	            </c:forEach>
            </ul>
            <a data-ajax="false" href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardList.do" class="more">more<span class="blind">공지사항 더 보기</span></a>
        </div><!-- bbs-preview -->
		
		<c:if test="${not empty eveWinList }">
        <div class="bbs-preview"><!-- bbs-preview -->
            <h3>당첨자발표</h3>
            <ul>
	            <c:forEach var="winRow" items="${eveWinList }" varStatus="i">
	                <li>
	                    <a data-ajax="false" href="<c:out value="${mobileDomain}" />/mobile/customer/eventWinView.do?EVT_WIN_IDX=<c:out value="${winRow.EVT_WIN_IDX}" />"><c:out value="${winRow.EVT_WIN_NM}" /></a>
	                    <span class="date"><ui:formatDate value="${winRow.EVT_WIN_REG_DT }" pattern="yyyy.MM.dd"/></span>
	                </li>
	            </c:forEach>
            </ul>
            <a data-ajax="false" href="<c:out value="${mobileDomain}" />/mobile/customer/eventWinList.do" class="more">more<span class="blind">당첨자발표 더 보기</span></a>
        </div><!-- bbs-preview -->
		</c:if>
		
        <div class="customer-tel"><!-- customer-tel -->
            <ul class="ui-grid-a">
                <li class="col ui-block-a">
                    <strong>02-6925-1160</strong>
                    <ul class="mt15">
                        <li>평&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;09:30~18:00</li>
                        <li>토요일&nbsp;&nbsp;09:00~14:00</li>
                    </ul>
                    <div class="action mt20">
                        <a href="javascript:;" class="button small"><span>1:1 상담문의</span></a>
                    </div>
                </li>
            </ul>
        </div><!-- // customer-tel -->
		<form id="searchFrm">
			<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord}" />"/>
		</form>
	</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	
 
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
function goSearch(){
	var $frm = $("#searchFrm");
	var searchWord = $("#faqSearch").val();
	$("#searchWord").val(searchWord);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/faqSearchList.do", "target":"_self", "method":"post"	}).submit();
	
	
 	
	//$("#frm").submit();
};

goInquiry		= function(){
	
	var url = "<c:out value="${mobileSslDomain}"/>/mobile/customer/inquiryMain.do";
	<c:choose>
		<%-- 1. 비회원 --%>
		<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
			if(appType){
				callJavascriptLoginUrl(url); //app 로그인 연동
			}else{
				url = encodeURIComponent(url);
		    	location.target = "_self";
		    	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
			}
		</c:when>
		<%-- 2. 회원 --%>
		<c:when test="${sessionUser.ROLE_USER eq 'user'}">
			location.href = url;
		</c:when>
	</c:choose>		
};

//]]>
</script>
</body>
</html>