<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-customer">

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->
			
			
            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>메인</span></a></dd>
            </dl>
			
			<%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>

            <div id="body"><!-- #body -->

				<%@ include file="/WEB-INF/jsp/pc/include/customer/search.jsp" %>
			
                <div class="ct">
                    <div class="main-faq"><!-- main-faq -->
                        <h3><span class="blind">자주 묻는 질문 TOP 5. 고객님께서 많이 물어보시는 질문입니다.</span></h3>
                        <ul>
                        <c:choose>
                        	<c:when test="${not empty faqList }">
                        		<c:forEach items="${faqList }" var="faq" varStatus="faqSta">
                            		<li><a href="javascript:;" id="faq" data-brd_faq_idx="<c:out value="${faq.BRD_FAQ_IDX}" />" data-cmn_com_idx="<c:out value="${faq.BRD_CMN_COM_UP_IDX }" />" data-cmn_com_up_idx="<c:out value="${faq.BRD_CMN_COM_IDX }" />" ><c:out value="${faq.BRD_FAQ_TITLE}" /></a></li>
                            	</c:forEach>
                         	</c:when>
						</c:choose>                         	
                        </ul>
                    </div><!-- // main-faq -->


                    <div class="main-links-a"><!-- main-links-a -->
                        <ul>
                            <li class="nth-child-1"><a href="<c:out value="${frontDomain }" />/pc/customer/inquiryMain.do" ><img src="<c:out value="${cdnDomain}" />/pc/img/custom/customer_link_a_1.png" alt="1:1문의" /></a></li>
                            <li class="nth-child-2"><a href="<c:out value="${frontDomain}" />/pc/mypage/myInquiryList.do" ><img src="<c:out value="${cdnDomain}" />/pc/img/custom/customer_link_a_2.png" alt="1:1답변확인" /></a></li>
                            <%-- <li class="nth-child-3"><a href="<c:out value="${frontDomain }" />/info/branch/branchList.do" target="_blank" ><img src="<c:out value="${cdnDomain}" />/pc/img/custom/customer_link_a_3.png" alt="마켓플랜트 지점안내" /></a></li> --%>
                        </ul>
                    </div><!-- // main-links-a -->
                </div>

                <div class="main-links-b"><!-- main-links-b -->
                    <h3><span><em class="blind">Quick menu</em></span></h3>
                    <ul class="ct">
                        <li class="nth-child-1"><a href="<c:out value="${frontDomain }" />/pc/manager/myInfoSearch.do" >ID/비밀번호 찾기</a></li>
                        <li class="nth-child-2"><a href="<c:out value="${frontDomain }" />/pc/mypage/myShoppingList.do">주문 배송조회</a></li>
                        <li class="nth-child-3"><a href="<c:out value="${frontDomain }" />/pc/mypage/myOrderCancelBackList.do">교환 반품신청</a></li>
                        <li class="nth-child-4"><a href="<c:out value="${frontDomain }" />/pc/mypage/myReceiptIssueList.do">증빙서류 발급</a></li>
                        <li class="nth-child-5"><a href="<c:out value="${frontDomain }" />/pc/event/memberBenefit.do">등급별 회원혜택</a></li>
                        <li class="nth-child-6"><a href="<c:out value="${frontDomain }" />/pc/mypage/myEventList.do">응모한 이벤트</a></li>
                    </ul>
                </div><!-- // main-links-b -->

                <div class="ct">
                    <div class="main-bbs notice"><!-- main-bbs -->
                        <h3>공지사항</h3>
                        <ul>
                        <c:choose>
                        	<c:when test="${not empty noticeList }">
                        		<c:forEach items="${noticeList }" var="noti" varStatus="notiSta">
                        			<li class="tx_doc"><a href="<c:out value="${frontDomain }" />/pc/customer/noticeBoardView.do?BRD_NTS_IDX=<c:out value="${noti.BRD_NTS_IDX }" />&BRD_NTS_TOP_YN=<c:out value="${noti.BRD_NTS_TOP_YN }" />" ><c:out value="${noti.BRD_NTS_TITLE }" /></a></li>	
                        		</c:forEach>
                        	</c:when>
                        </c:choose>
                        </ul>
                        <a href="javascript:;" class="more" id="notiLink">more</a>
                    </div><!-- // main-bbs -->
                    
                    <div class="main-bbs winner"><!-- main-bbs -->
                        <h3>당첨자 발표</h3>
                        <ul>
                        <c:choose>
                        	<c:when test="${not empty eveWinList }">
                        		<c:forEach items="${eveWinList }" var="win" varStatus="winSta">
                        			<li class="tx_doc"><a href="<c:out value="${frontDomain}" />/pc/customer/eventWinView.do?EVT_WIN_IDX=<c:out value="${win.EVT_WIN_IDX }" />"><c:out value="${win.EVT_WIN_NM }" /></a></li>
                        		</c:forEach>
                        	</c:when>
                        </c:choose>
                        </ul>
                        <a href="javascript:;" class="more" id="eveWinLink" >more</a>
                    </div><!-- // main-bbs -->
                </div>

                <div class="main-guide"><!-- main-guide -->
                    <ul class="ct">
                        <li class="col nth-child-1">
                            <div class="module">
                                <a href="<c:out value="${frontDomain }" />/pc/customer/faqBoardList.do?CMN_COM_IDX=106&CMN_COM_UP_IDX=&BRD_FAQ_IDX=&cPage=1"><img src="<c:out value="${cdnDomain}" />/pc/img/custom/customer_faq.png" alt="무엇을 도와드릴까요? FAQ Search" /></a>
                            </div>
                        </li>
                        <li class="col nth-child-2">
                            <div class="module">
                                <h3>마켓플랜트 고객센터</h3>
                                <strong class="tel">02-6925-1160</strong>
                                <ul class="time dotum">
                                    <li><span>평 일</span>09:30 ~ 18:00</li>
                                    <li><span>토요일</span>09:30 ~ 18:00</li>
                                </ul>
                                <div class="action">
                                    <a href="<c:out value="${severDomain }" />/pc/customer/inquiryMain.do" class="btn_st1 btn_blk777 large"><span>1:1 상담문의</span></a>
                                </div>
                            </div>
                        </li>
                        <%--
                        <li class="col nth-child-3">
                            <div class="module">
                                <h3>전자랜드 직영점 고객센터</h3>
                                <strong class="tel">080-8700-8000</strong>
                                <ul class="time dotum">
                                    <li><span>평 일</span>09:30 ~ 18:00</li>
                                    <li><span>토요일</span>토/일/공휴일 09:30 ~ 18:00</li>
                                </ul>
                                <p class="notice">
                                    <strong>지점은 오전 10:30분 부터 전화상담 가능</strong>
                                </p>
                            </div>
                        </li>
                         --%>
                    </ul>
                </div><!-- // main-guide -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script type="text/javascript">
//<![CDATA[
	$(function(){
		 
	 	// 공지사항 제목 a Tag 클릭 이벤트
	    $(".notice-list-title a").on("click", function () 
	    {	    	
	        var $frm = $("#frm");
	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/noticeBoardView.do", "target":"_self", "method":"get"}).submit();
	    });
	 	
	 	// FAQ 제목 a Tag 클릭 이벤트
	    $(".faq-list-title a").on("click", function () 
   	    {	    	
   	        var $frm = $("#frm");
   	        $frm.find("input[name='BRD_FAQ_IDX']").val($(this).data("brd_faq_idx"));
   	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do", "target":"_self", "method":"get"}).submit();
   	    });
	 	
	 	
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>