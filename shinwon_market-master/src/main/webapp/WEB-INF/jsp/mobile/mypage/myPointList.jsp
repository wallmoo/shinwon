<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">
		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
		<%-- 각 화면 본문 시작 --%>
		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	 		<!-- #container S -->
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>크라운</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="padder">
	            <dl class="my-condition point"><!-- my-condition -->
	                <dt>현재 보유 크라운</dt>
	                <dd><strong class="warning"><fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0}" groupingUsed="true"/></strong> C</dd>
	            </dl><!-- // my-condition -->
	
	            <form id="frm" name="frm" >
                	<input type="hidden" name="MEM_PIT_TOT_PIT" id="MEM_PIT_TOT_PIT" value="<c:out value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0}" />"/>
		            <div class="search-register point"><!-- search-register -->
		                <div class="upper section-button">
		                    <a href="javascript:;" class="button primary register _pg_link"><span>포인트로 전환</span><em class="blind">열기</em></a>
		                </div>
		
		                <div class="downer">
		                    <div class="module">
		                        <p>
	                            	포인트로 전환할 크라운을 입력해 주세요.
		                        </p>
		                        <div class="form">
		                             <input type="text" class="text number" name="MEM_PIT_MNS" id="MEM_PIT_MNS" /> <span class="xlarge">C</span>&nbsp;&nbsp;
		                            <a href="javascript:goChange();" class="button primary small _pg_link"><span>전환하기</span></a>
		                        </div>
		                    </div>
		                </div>
		            </div><!-- // search-register -->
		       </form>
	           
	           <h3 class="title-benefit">적립/차감 크라운</h3>
	        </div>
	
	        <table class="table-d table-col mt10" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
	        <caption>구분, 내용, 크라운, 발생일자로 구성된 적립/차감 크라운 목록입니다.</caption>
	        <colgroup>
	            <col style="width: 12%;">
	            <col style="width: auto;">
	            <col style="width: 18%;">
	            <col style="width: 22%;">
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col">구분</th>
	                <th scope="col">내용</th>
	                <th scope="col">크라운</th>
	                <th scope="col">발생 일자</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:choose>
                   	<c:when test="${not empty list }">
                   		<c:forEach var="pointRow" items="${list }" varStatus="i">
                   			<tr>
				                <td><c:out value="${pointRow.MEM_PIT_GBN eq 'P' ? '적립' : '차감' }"/></td>
				                <td><c:out value="${pointRow.MEM_PIT_GBN ne 'D' ? pointRow.MEM_PIT_BRK_DWN_NM : '휴면회원' }"/></td>
				                <td>
				                	<c:choose>
		                        		<c:when test="${pointRow.MEM_PIT_GBN eq 'P' }">
		                        			<fmt:formatNumber value="${pointRow.MEM_GET_PIT }" groupingUsed="true" />
		                        		</c:when>
		                        		<c:otherwise>
		                        			<fmt:formatNumber value="${pointRow.MEM_GET_PIT ne 0 ? - pointRow.MEM_GET_PIT : 0 }" groupingUsed="true" />
		                        		</c:otherwise>
		                        	</c:choose>
				                </td>
				                <td><ui:formatDate value="${pointRow.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd"/></td>
				            </tr>
                   		</c:forEach>
                   	</c:when>
                   	<c:otherwise>
                   		<tr>
			                <td colspan="4">
			                    <p class="no-more">
		                        	크라운 내역이 없습니다.
			                    </p>
			                </td>
			            </tr>
                   	</c:otherwise>
            	</c:choose>
	        </tbody>
	        </table><!-- // table-d -->
	
	        <div class="padder mt20">
	            <h4 class="title-benefit">크라운 유의사항</h4>
	
	            <ul class="list list-a mt10">
	                <li>상품후기, 포토후기, 이벤트 참여, 로그인, 고객체험단 KINGER 선정과 같은 활동 내역에 따라 크라운을 적립해드립니다.</li>
	                <li>적립된 크라운을 포인트로 전환하여 온라인에서 상품 구매시 현금처럼 사용할 수 있습니다.</li>
	                <li>10크라운은 1포인트로 전환되며 10,000크라운부터 전환 가능합니다. 전환된 포인트는 익일 반영됩니다.</li>
	                <li>휴면회원으로 전환되는 경우 보유중인 크라운은 모두 소멸됩니다.</li>
	            </ul>
	        </div>
	
	        <form id="pageFrm" name="pageFrm">
	           	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	            <div class="section-pagination"><!-- section pagination -->
	                <ui:frontpaging paging="${paging }" jsFunction="goPage" />
	            </div><!-- // section pagination -->
            </form>
				
		</article>
		<!--// #container E -->
		
		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
	</section>
	<!--// #wrap E -->

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
$.params = ($.params !== undefined) ? $.params : [];

$(function(){
    
	$.com.win_scrollList = true;//스크롤 할거야~
	function _return_scrollList(_idx, _reNum){
	    /*
	        _idx = 리스트감싸고있는 객체
	        _reNum = 리턴 몇번째넘어왔는지
	    */
	    
	    if(_reNum <= 2){
	        var _list_html = _idx.html();
	        //리스트 추가!
	        _idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
	        //console.log('_reNum = '+_reNum);
	    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
	}
	
	// 포인트 전환 버튼 클릭 시
	$(".register").on("click",function(){
		$("#MEM_PIT_MNS").val("");
	});
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $pageFrm = $("#pageFrm");
	    $pageFrm.find("input[id='cPage']").val(cPage);
	    $pageFrm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myPointList.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 전환하기 버튼 클릭 이벤트
	goChange = function()
	{
		var $frm = $("#frm");
		
		if($("#MEM_PIT_MNS").val() == ""){
			alert("전환하려는 크라운을 입력해주세요.");
			$("#MEM_PIT_MNS").focus();
			return;
		}
		
		if(parseInt($("#MEM_PIT_TOT_PIT").val()) < 10000){
			alert("현재 보유 크라운을 확인해주세요.\n10,000P 부터 전환 가능합니다.");
			$("#MEM_PIT_MNS").focus();
			return;
		}
		
		if(parseInt($("#MEM_PIT_MNS").val()) < 10000){
			alert("전환하시려는 크라운을 확인해주세요.\n10,000P 부터 전환 가능합니다.");
			$("#MEM_PIT_MNS").focus();
			return;
		}
		
		if(parseInt($("#MEM_PIT_TOT_PIT").val()) < parseInt($("#MEM_PIT_MNS").val())){
			alert("보유 크라운보다 전환하는 크라운이 많습니다.");
			$("#MEM_PIT_MNS").focus();
			return;
		}
		
		if(parseInt($("#MEM_PIT_MNS").val()) % 10 != 0){
			alert("포인트 전환은 크라운 10점당 전환이 가능합니다\n전환하려는 크라운을 확인해주세요.");
			$("#MEM_PIT_MNS").focus();
			return;
		}
		if(confirm(parseInt($("#MEM_PIT_MNS").val())+"점 크라운을 포인트로 전환 하시겠습니까?")){
			$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/changeMileage.do", "target":"_self", "method":"post"}).submit();
		}
		
	};

	

});

</script>
</body>
</html>    