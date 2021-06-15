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
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>자주묻는 질문</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="faq-search"><!-- faq-search -->
            <label for="faqSearch" class="xlarge">FAQ</label>
            <input type="text" id="faqSearch" class="text" value="<c:out value="${commandMap.searchWord}" />">
            <a href="javascript:goSearch();" class="button primary"><span>검색</span></a>
        </div><!-- // faq-search -->

        <hr class="hr-b">

        <div class="faq-result text-center"><!-- faq-result -->
            &ldquo;<span class="warning"><c:out value="${commandMap.searchWord}" /></span>&rdquo;에 대해 총 <span class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></span>건의 FAQ가 검색 되었습니다.
        </div><!-- faq-result -->

        <div class="faq-list _scroll_list_ck" data-role="collapsible-set"><!-- faq-list -->
        	<c:forEach var="row" items="${list }" varStatus="i">
	            <div class="section" data-role="collapsible" data-collapsed="true" data-brd_faq_idx="<c:out value="${row.BRD_FAQ_IDX}" />">
	                <h3>
	                    <i class="type question"><span class="blind">질문</span></i>
	                    <strong><span class="blind">하위 카테고리</span><c:out value="${row.BRD_CMN_COM_NM}" /></strong>
	                    <span><c:out value="${row.BRD_FAQ_TITLE}" /></span>
	                    <i class="more"><!-- icon --></i>
	                </h3>
	                <div class="toggle-box">
	                    <i class="type answer"><span class="blind">답변</span></i>
	                    ${row.BRD_FAQ_CONTENTS}
	                </div>
	            </div>
            </c:forEach>     
        </div><!-- // faq-list -->
		<form id="searchFrm">
			<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord}" />"/>
		</form>
		<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>
	</article>
	<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
 
$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
		*/
	var page = _reNum + 2;
	var searchWord = $("#searchWord").val();
	var totalCount = $("#totalCount").val();
	
	
	if(parseInt(totalCount) >= (parseInt(page)-1) * 20)
	{	
		$.ajax({
			type		: "POST",
			url			: "/mobile/customer/faqBoardListAjax.do",
			dataType	: "json",
			async       : false,
			data		: {	"searchWord" : searchWord
							,"cPage": page
							},
			success : function(data) {
				var innerHtml	= '<ul class="ct">';
				
				if(data.totalPageCount == 0){
					innerHtml = "";
				}else{
					
					var listNum		= data.listNum;
					$.each(data.resultMap.list, function(i,item){
						
	// 					<div class="section" data-role="collapsible" data-collapsed="true">
	// 	                <h3>
	// 	                    <i class="type question"><span class="blind">질문</span></i>
	// 	                    <strong><span class="blind">하위 카테고리</span><c:out value="${row.BRD_CMN_COM_NM}" /></strong>
	// 	                    <c:out value="${row.BRD_FAQ_TITLE}" />
	// 	                    <i class="more"><!-- icon --></i>
	// 	                </h3>
	// 	                <div class="toggle-box">
	// 	                    <i class="type answer"><span class="blind">답변</span></i>
	// 	                    ${row.BRD_FAQ_CONTENTS}
	// 	                </div>
	// 	            </div>
	
						innerHtml += '<div class="section" data-role="collapsible" data-collapsed="true">';
						innerHtml += '<h3>';
						innerHtml += '<i class="type question"><span class="blind">질문</span></i>';
						innerHtml += '<strong><span class="blind">하위 카테고리</span>'+item.BRD_CMN_COM_NM+'</strong>';
						innerHtml += item.BRD_FAQ_TITLE;
						innerHtml += '<i class="more"><!-- icon --></i>';
						innerHtml += '</h3>';
						innerHtml += '<div class="toggle-box">';
						innerHtml += '<i class="type answer"><span class="blind">답변</span></i>';
						innerHtml += item.BRD_FAQ_CONTENTS;
						innerHtml += '</div>';
						innerHtml += '</div>';
						
					});
					//alert(innerHtml);
					_idx.append(innerHtml);
					
					//com.accordion($('.question'), 'i');
					
				}
					
			}
			 
		});
	}
	
	
}
function goDtl(BRD_CMN_COM_IDX){
	var $frm = $("#frm");
	$("#BRD_CMN_COM_IDX").val(BRD_CMN_COM_IDX);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do", "target":"_self", "method":"post"}).submit();
	//$("#frm").submit();
};
function goSearch(){
	var $frm = $("#searchFrm");
	var searchWord = $("#faqSearch").val();
	$("#searchWord").val(searchWord);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/faqSearchList.do", "target":"_self", "method":"post"}).submit();
	//$("#frm").submit();
};

$('.faq-list .section').collapsible({
	expand: function( event, ui ) {
		var brd_faq_idx = $(this).data("brd_faq_idx");
		$.ajax({
			async : false,
			type : "POST",
			data : {
						"BRD_FAQ_IDX" : brd_faq_idx
					},
			url : "<c:out value="${mobileDomain}" />/pc/customer/increaseReadCountAjax.do",
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
//]]>
</script>
</body>
</html>