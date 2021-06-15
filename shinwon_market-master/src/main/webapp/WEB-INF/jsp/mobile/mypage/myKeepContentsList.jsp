<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>키핑백</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="tab-a" data-role="navbar"><!-- tab-a -->
	            <ul>
	                <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myKeepProductList.do','_self');" class="_pg_link" target="_self">키핑상품</a></li>
	                <li class="active"><a href="javascript:;">키핑콘텐츠</a><span class="blind">현재위치</span></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myKeepPlanList.do" class="_pg_link" target="_self">키핑기획전</a></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myKeepEventList.do" class="_pg_link" target="_self">키핑이벤트</a></li>
	            </ul>
	        </div><!-- // tab-a -->
	
	        <div class="bbs-status"><!-- bbs-status -->
            	내가 키핑한 콘텐츠 <span class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></span>개 
	        </div><!-- // bbs-status -->
	
	        <div class="section-button bbs-button"><!-- section-button -->
	            <a href="javascript:;" id="allCheck" class="button small _pg_link">전체선택</a>
	            <a href="javascript:selectedDeleteBtn();" class="button small _pg_link">선택콘텐츠 삭제</a>
	        </div><!-- // section-button -->
	
	        <div class="keeping-list"><!-- keeping-list -->
	            <c:choose>
               		<c:when test="${not empty list }">
               			<ul class="ct">
			                <c:forEach var="row" items="${list }" varStatus="i">
				                <li class="${row.MGZ_MST_KID eq 'T' ? 'view-text' : ''}">
				                    <div class="module">
				                        <input type="checkbox" class="checkbox" name="Check" value="<c:out value="${row.MEM_CTS_IDX }"/>" title="<c:out value="${row.MGZ_MST_TITLE }"/> 선택" />
				                        <c:if test="${row.MGZ_MST_CTG eq Code.EMAGAZINE_CATEGORY_LIFE }">
											<span class="label label-a">라이프가이드</span>				                                
		                                </c:if>
		                                <c:if test="${row.MGZ_MST_CTG eq Code.EMAGAZINE_CATEGORY_BUY }">
											<span class="label label-b">구매가이드</span>                                
		                                </c:if>
		                                <c:if test="${row.MGZ_MST_CTG eq Code.EMAGAZINE_CATEGORY_PRODUCT_REVIEW }">
											<span class="label label-c">상품리뷰</span>			                                
		                                </c:if>
		                                <c:if test="${row.MGZ_MST_CTG eq Code.EMAGAZINE_CATEGORY_PRODUCT_NEWS }">
											<span class="label label-d">상품뉴스</span>			                                
		                                </c:if>
		                                <c:if test="${row.MGZ_MST_CTG eq Code.EMAGAZINE_CATEGORY_STUFF }">
											<span class="label label-e">Stuff</span>			                                
		                                </c:if>
		                                <c:if test="${row.MGZ_MST_CTG eq Code.EMAGAZINE_CATEGORY_THEME }">
											<span class="label label-f">테마</span>	                                
		                                </c:if>
				                        <a href="<c:out value="${mobileDomain }"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${row.MGZ_MST_IDX }" />" target="_self">
				                            <c:choose>
				                            	<c:when test="${row.MGZ_MST_KID eq 'T'}">
				                            		<span class="subject"><c:out value="${row.MGZ_MST_TITLE }"/></span>
						                            <span class="text">
						                               <c:out value="${fn:substring(row.MGZ_MST_CTS,0,70)}"/>..
						                            </span>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<span class="thumb">
						                            	<c:if test="${row.MGZ_MST_KID eq 'M' }">
						                            		<span class="movie"><i><em class="blind">동영상 게시물</em></i></span>
						                            	</c:if>
						                            	<img src="<c:out value="${cdnDomain }${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${row.CMN_FLE_ALT_TXT }"/>" />
						                            </span>
						                            <span class="subject"><c:out value="${row.MGZ_MST_TITLE }"/></span>
				                            	</c:otherwise>
				                            </c:choose>    	
				                        </a>
				                    </div>
				                </li>
			                </c:forEach>
			            </ul>
               		</c:when>
               		<c:otherwise>
						<p class="no-more">
		                	등록된 콘텐츠가 없습니다.
			            </p>               		
               		</c:otherwise>
               	</c:choose>
	        </div><!-- // keeping-list -->
	
	        <div class="padder mt20">
	            <ul class="list list-a mt10">
	                <li>키핑백에 담긴 관심 콘텐츠를 한눈에 확인하실 수 있습니다.</li>
	                <li>콘텐츠 이미지를 클릭하시면 상세 내용을 보실 수 있습니다.</li>
	            </ul>
	        </div>
	
	        <form id="pageFrm" name="pageFrm">
           		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <div class="section-pagination"><!-- section pagination -->
                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                </div><!-- // section pagination -->
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
//<![CDATA[
$(function(){
	// 페이지 이동
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myKeepContentsList.do", "target":"_self", "method":"post"}).submit();
    };
    
  	//전체체크
	$('#allCheck').on('click', function(){
		var checkboxCnt = $("input[name=Check]").length;	// 체크박스 갯수
		var checkedCnt = $("input[name=Check]:checked").length;	// 체크된 체크박스 갯수
		// 전체 선택
		if(checkedCnt == 0 || checkedCnt < checkboxCnt){
			$("input[name=Check]").each(function(){
				$(this).prop("checked",true);
			});
		}
		else{
			$("input[name=Check]").each(function(){
				$(this).prop("checked",false);
			});
		}			
		
	});
	
	//선택 콘텐츠 삭제
	selectedDeleteBtn = function(){
		if($("input[name='Check']:checked").length == 0){
			alert("선택된 콘텐츠가 없습니다.");
			return;
		}
		
		if(confirm("선택된 콘텐츠를 삭제하시겠습니까?")){
			var idx_arr = new Array();
			
			$("input[name='Check']:checked").each(function() {
				idx_arr[idx_arr.length] = $(this).val();
			});
			deleteKeepContents(idx_arr);
		}
	};
	
	// 서버에 삭제 요청
	deleteKeepContents = function(idx_arr) {
		$.ajax({
					async : false,
					type : "POST",
					data : {
						"MEM_CTS_IDX[]" : idx_arr
					},
					url : "<c:out value="${mobileDomain}" />/mobile/mypage/deleteKeepContentsAjax.do",
					success : function(data) {
						if(data.result == "Y"){
							alert("삭제되었습니다.");
							location.reload(true);							
						}
						else{
							alert("삭제 중 오류가 발생하였습니다.\n다시 시도해주세요.");
						}
					},
					error : function(err) {
						alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery
								|| console
										.log('오류가 발생하였습니다: ' + err.status);
					}
				});
	};
});
//]]>
</script>
</body>
</html>