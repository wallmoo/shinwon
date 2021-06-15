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
	                <dd><a href="javascript:void(0)"><span>쇼핑혜택</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>크라운</span></a></dd>
	            </dl>
	
				<%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
				
	            <div id="body"><!-- #body -->
	
	                <h3 class="title">크라운</h3>
	
	                <form id="frm" name="frm" >
	                	<input type="hidden" name="MEM_PIT_TOT_PIT" id="MEM_PIT_TOT_PIT" value="<c:out value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0}" />"/>
						<div class="my-point"><!-- my-point -->
		                    <ul>
		                        <li>
		                            <strong class="tit">현재 보유 크라운</strong>
		                            <span class="warning"><fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0}" groupingUsed="true"/></span> C
		                            <a href="javascript:;" class="btn_st2 btn_blk777 large more"><span>포인트로 전환</span></a>
		                        </li>
								<li id="changeMileage" style="display:none;">
		                            <span class="desc">포인트로 전환할 크라운을 입력해 주세요.</span>
		                            <input type="text" class="text number" name="MEM_PIT_MNS" id="MEM_PIT_MNS" onKeyDown="onKeyDown();" /> C
		                            <input type="text" name="a" style="display:none;" />
		                            <a href="javascript:goChange();" class="btn_st2 btn_blk777 large"><span>전환하기</span></a>
	                        	</li>
		                    </ul>
	                	</div><!-- my-point -->	                
	                </form>
	
	                <h4 class="title title-a">적립/차감 크라운</h4>
	
	                <table class="table-a table-mileage mt10"><!-- table-a -->
	                <caption>구분, 내용, 크라운, 발생 일자로 구성된 적립/차감 크라운 목록입니다.</caption>
	                <thead>
	                    <tr>
	                        <th scope="col"><span>구분</span></th>
	                        <th scope="col"><span>내용</span></th>
	                        <th scope="col"><span>크라운</span></th>
	                        <th scope="col"><span>발생 일자</span></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                    	<c:when test="${not empty list }">
	                    		<c:forEach var="pointRow" items="${list }" varStatus="i">
	                    			<tr>
				                        <td class="part">
				                        	<c:out value="${pointRow.MEM_PIT_GBN eq 'P' ? '적립' : '차감' }"/>
				                        </td>
				                        <td class="detail">
				                        	<c:out value="${pointRow.MEM_PIT_GBN ne 'D' ? pointRow.MEM_PIT_BRK_DWN_NM : '휴면회원' }"/>
				                        </td>
				                        <td class="mileage">
				                        	<c:choose>
				                        		<c:when test="${pointRow.MEM_PIT_GBN eq 'P' }">
				                        			<fmt:formatNumber value="${pointRow.MEM_GET_PIT }" groupingUsed="true" />
				                        		</c:when>
				                        		<c:otherwise>
				                        			<fmt:formatNumber value="${pointRow.MEM_GET_PIT ne 0 ? - pointRow.MEM_GET_PIT : 0 }" groupingUsed="true" />
				                        		</c:otherwise>
				                        	</c:choose>
				                        </td>
				                        <td class="date">
				                        	<ui:formatDate value="${pointRow.MEM_PIT_REG_DT }" pattern="yyyy.MM.dd"/>
				                        </td>
				                    </tr>	
	                    		</c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<tr>
			                        <td colspan="4">
			                            <p class="message no-more">
		                                	크라운 내역이 없습니다.
			                            </p>
			                        </td>
			                    </tr>
	                    	</c:otherwise>
	                    </c:choose>
	                </tbody>
	                </table><!-- // table-a -->
	
	                <h5 class="title">크라운 유의사항</h5>
	                <ul class="list list-a small">
	                    <li>상품후기, 포토후기, 이벤트 참여, 로그인, 고객체험단 KINGER 선정과 같은 활동 내역에 따라 크라운을 적립해드립니다.</li>
	                    <li>적립된 크라운을 포인트로 전환하여 온라인에서 상품 구매시 현금처럼 사용할 수 있습니다.</li>
	                    <li>10크라운는 1포인트로 전환되며 10,000크라운부터 전환 가능합니다. 전환된 포인트는 익일 반영됩니다.</li>
	                    <li>휴면회원으로 전환되는 경우 보유중인 크라운은 모두 소멸됩니다.</li>
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

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
$(function(){

	// 포인트로 전환 버튼 클릭 이벤트
	$(".my-point .more").on("click",function(){
		$("#changeMileage").toggle();
	});
	
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
			$frm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/changeMileage.do", "target":"_self", "method":"post"}).submit();
		}
		
	};
	
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myPointList.do", "target":"_self", "method":"post"}).submit();
    };
    
    onKeyDown = function()
    {
    	if(event.keyCode == 13)
         {
    		goChange();
         }
    }
});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>


