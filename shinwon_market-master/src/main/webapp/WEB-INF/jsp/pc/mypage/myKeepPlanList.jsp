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
	                <dd><a href="javascript:void(0)"><span>쇼핑활동</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>키핑백</span></a></dd>
	            </dl>
	
	            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
	            <div id="body"><!-- #body -->
	
	                <h3 class="title">키핑백</h3>
	
	                <ul class="ct tab-a item-4"><!-- tab-a -->
	                    <li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepProductList.do"><span>키핑상품</span></a></li>
	                    <li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepContentsList.do"><span>키핑콘텐츠</span></a></li>
	                    <li class="active"><a href="javascript:;"><span>키핑기획전</span></a><span class="blind">현재위치</span></li>
	                    <li><a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepEventList.do"><span>키핑이벤트</span></a></li>
	                </ul><!-- // tab-a -->
	
	                <div class="ct keeping-status"><!-- keeping-status -->
                    	내가 키핑한 기획전 <strong class="warning"><fmt:formatNumber value="${totalCount }" groupingUsed="true" /></strong>개
	                    <div class="fr">
	                        <a href="javascript:;" id="allCheck" class="btn_st0 btn_white small26"><span>전체선택</span></a>
	                        <a href="javascript:selectedDeleteBtn();" class="btn_st0 btn_white small26"><span>선택기획전 삭제</span></a>
	                        <a href="javascript:endDeleteBtn();" class="btn_st0 btn_white small26"><span>종료된 기획전 삭제</span></a>
	                    </div>
	                </div><!-- // keeping-status -->
	
	                <div class="keeping-list"><!-- keeping-list -->
						<c:choose>
							<c:when test="${not empty list }">
								<ul class="ct">
			                        <c:forEach var="row" items="${list }" varStatus="i">
			                        	<li>
				                            <div class="module">
				                                <p class="check">
				                                    <input type="checkbox" class="checkbox" name="Check" value="<c:out value="${row.MEM_CTS_IDX }"/>" title="<c:out value="${row.PLN_MST_TITLE }"/> 선택" />
				                                </p>
				                                <a href="<c:out value="${frontDomain }"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${row.PLN_MST_IDX }"/>">
				                                    <span class="thumb">
				                                    	<img src="<c:out value="${cdnDomain }${row.CMM_FLE_ATT_PATH }${row.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${row.CMN_FLE_ALT_TXT }"/>" />
				                                    </span>
				                                    <span class="subject"><c:out value="${row.PLN_MST_TITLE }"/></span>
				                                </a>
				                            </div>
				                        </li>
			                        </c:forEach>
			                    </ul>
							</c:when>
							<c:otherwise>
								<p class="message no-more">
		                        	등록된 기획전이 없습니다.
			                    </p>
							</c:otherwise>
						</c:choose>
	                </div><!-- // keeping-list -->
	
	                <ul class="list list-a small mt20">
	                    <li>키핑백에 담긴 기획전을 한눈에 확인하실 수 있습니다.</li>
	                    <li>기획전 이미지를 클릭하시면 상세 내용을 보실 수 있습니다.</li>
	                </ul>
	
	                <form id="pageFrm" name="pageFrm">
	            		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		                <div class="section-pagination"><!-- section pagination -->
		                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
		                </div><!-- // section pagination -->
	                </form>
	
	            </div><!-- // #body -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<%-- 각 화면 본문 끝 --%>

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>
	<!--// #wrap E -->
<form id="popFrm" name="popFrm">
<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value=""/>
</form>
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
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myKeepPlanList.do", "target":"_self", "method":"post"}).submit();
    };
    
  	//전체체크
	$('#allCheck').on('click', function(){
		var checkboxCnt = $("input[name=Check]").length;	// 체크박스 갯수
		var checkedCnt = $("input[name=Check]:checked").length;	// 체크된 체크박스 갯수
		
		// 전체 선택
		if(checkedCnt == 0 || checkedCnt < checkboxCnt){
			$("input[name=Check]").prop("checked",true);
		}
		else{
			$("input[name=Check]").prop("checked",false);
		}			
		
	});
	
	//선택 기획전 삭제
	selectedDeleteBtn = function(){
		if($("input[name='Check']:checked").length == 0){
			alert("선택된 기획전이 없습니다.");
			return;
		}
		
		if(confirm("선택된 기획전을 삭제하시겠습니까?")){
			var idx_arr = new Array();
			
			$("input[name='Check']:checked").each(function() {
				idx_arr[idx_arr.length] = $(this).val();
			});
			deleteKeepPlan(idx_arr);
		}
	};
	
	// 서버에 삭제 요청
	deleteKeepPlan = function(idx_arr) {
		$.ajax({
					async : false,
					type : "POST",
					data : {
						"MEM_CTS_IDX[]" : idx_arr
					},
					url : "<c:out value="${frontDomain}" />/pc/mypage/deleteKeepPlanAjax.do",
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
	
	// 종료된 기획전 삭제
	endDeleteBtn = function(){
		if(confirm("종료된 기획전을 삭제하시겠습니까?")){
			$.ajax({
				async : false,
				type : "POST",
				url : "<c:out value="${frontDomain}" />/pc/mypage/deleteEndKeepPlanAjax.do",
				success : function(data) {
					if(data.result == "Y"){
						alert("삭제되었습니다.");
						location.reload(true);							
					}
					else{
						alert("종료된 기획전이 없습니다.");
					}
				},
				error : function(err) {
					alert("오류가 발생하였습니다.\n[" + err.status + "]");
					window.jquery
							|| console
									.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		}
	};
});
//]]>
</script>
</body>