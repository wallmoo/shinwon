<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>

<body class="page-customer"><!-- page class : page-helpdesk -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
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
				
				<c:if test="${empty commandMap.searchWord }" >
                <h3 class="title">자주 묻는 질문 (FAQ)</h3>

                <div class="faq-tab"><!-- faq-tab -->
                    <h4><c:out value="${cateName}" /></h4>
                    <div class="tab">
                        <ul class="ct">
                            <li class="active"><a href="javascript:;"><span>전체보기</span></a><!--  span class="blind">현재위치</span>--></li>
                            <c:if test="${not empty lowCodeList }">
								<c:forEach items="${lowCodeList }" var="low">
									<li><a href="javascript:;" id="cate" data-cmn_com_up_idx="<c:out value="${low.CMN_COM_IDX }" />"><span><c:out value="${low.CMN_COM_NM }" /></span></a></li>
								</c:forEach>
							</c:if>
                        </ul>
                    </div>
                </div><!-- // faq-tab -->
				
				</c:if>
				
                <p class="bbs-status"><!-- bbs-status -->
					<c:out value="${cateName}" /> FAQ (<span class="warning"><c:out value="${paging.totalRecordCount }" /></span>건)
                <p><!-- // bbs-status -->

                <table class="bbs-list faq-list"><!-- bbs-list -->
                <caption>게시글 유형, 카테고리, 제목으로 구성된 자주묻는 질문 목록입니다.</caption>
                <colgroup>
                    <col style="width: 6%;" />
                    <col style="width: 14%;" />
                    <col style="width: auto%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">게시글 유형</th>
                        <th scope="col">카테고리</th>
                        <th scope="col">제목</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                	<c:when test="${not empty list }">
                		<c:forEach items="${list }" var="list">
                			<tr>
		                        <td class="type"><span class="icon q"><span class="blind">질문</span></span></td>
		                        <td class="category"><c:out value="${list.BRD_CMN_COM_NM }" /></td>
		                        <td class="subject"><a href="javascript:;" data-brd_faq_idx="<c:out value="${list.BRD_FAQ_IDX }" />" ><c:out value="${list.BRD_FAQ_TITLE }" /><span class="blind">답변보기</span></a></td>
		                    </tr>
		                    <tr class="answer" id="answer_<c:out value="${list.BRD_FAQ_IDX }" />" >
		                        <td class="type"><span class="icon a"><span class="blind">답변</span></span></td>
		                        <td colspan="2" class="substance"><c:out value="${list.BRD_FAQ_CONTENTS }" escapeXml="false"/></td>
		                    </tr>
                		</c:forEach>
                	</c:when>
                </c:choose>
                </tbody>
                </table><!-- // bbs-list -->
                <div class="section-pagination"><!-- section pagination -->
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
                </div><!-- // section pagination -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
<%-- 각 화면 본문 끝 --%>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script type="text/javascript">

	$(function(){
		
		
		
		//읽은 경우 조회수 증가
		$(document).on("click",".subject a",function(){
			var brd_faq_idx = $(this).data("brd_faq_idx");
			if($("#answer_"+brd_faq_idx).is(":visible")){
				$.ajax({
					async : false,
					type : "POST",
					data : {
						"BRD_FAQ_IDX" : brd_faq_idx
					},
					url : "<c:out value="${frontDomain}" />/pc/customer/increaseReadCountAjax.do",
					success : function(data) {
						
					},
					error : function(err) {
						//alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery
								|| console
										.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}
		});
		
		
		// 내용 검색 필드 엔터 이벤트 
	    $(document).on("keydown", "#searchWord", function (e) 
	    {
	        if(e.keyCode == 13)
	        {
	            $("#search").trigger("click");
	            return false;
	        }
	    }); 
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#lnbfrm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/faqBoardList.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	    // 검색 버튼 클릭 이벤트
	    $("#search").on("click" , function () 
	    {
	    	if($("#searchWord").val() == "")
	    	{
	    		alert("검색어를 입력해주세요.");
	    		$("#searchWord").focus();
	    		return false;
	    	}
	        var $searchForm = $("#searchForm"); 
	        $searchForm.find("input[name='searchWord']").val($.trim($("#searchWord").val()));
	        $searchForm.find("input[name='searchBrdCmnComIdx']").val("");
	        $searchForm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do", "target":"_self", "method":"get"}).submit(); 
	    });	
	});
	
	$(function(){

	    // faq toggle
	    com.accordion($('table.faq-list .subject a'), 'tr');
	    <c:if test="${not empty commandMap.BRD_FAQ_IDX}" >
	    	$('#answer_<c:out value="${commandMap.BRD_FAQ_IDX}" />').prev().find('a').trigger('click');
	    </c:if>
	    
		
	});
</script>

<!-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body> -->
</html>