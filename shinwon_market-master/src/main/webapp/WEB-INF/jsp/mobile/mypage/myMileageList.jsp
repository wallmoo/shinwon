<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<input type="hidden" name="tabNo" id="tabNo" value=""/>
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>포인트</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="padder">
	            <dl class="my-condition membership"><!-- my-condition -->
	                <dt>나의 멤버십 번호</dt>
	                <dd><strong class="warning"><c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 0, 4) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 4, 8) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 8, 12) }"/>-<c:out value="${fn:substring(DEFAULT_CASHBAG_CARD_NO, 12, 16) }"/></strong></dd>
	            </dl><!-- // my-condition -->
	            
	            <div class="my-mileage"><!-- my-mileage -->
	                <ul>
	                    <li>현재 사용 가능한 포인트: <span class="warning"><fmt:formatNumber value="${memberMileageMap.SOLUBLE_MILEAGE}" groupingUsed="true" /></span> 원</li>
	                    <li>이달 소멸예정 포인트: <span class="warning"><fmt:formatNumber value="${extinctMileage}" groupingUsed="true" /></span> 원</li>
	                </ul>
	            </div><!-- // my-mileage -->
	
	            <h3 class="title-benefit">적립/차감 포인트</h3>
	        </div>
	
	        <div class="tab-a" data-role="navbar" id="menuViewTab"><!-- tab-a -->
	            <ul>
	                <li class="active"><a href="javascript:;" data-tab_no="tab1">전체</a><span class="blind">현재위치</span></li>
	                <li><a href="javascript:;" data-tab_no="tab2">적립</a></li>
	                <li><a href="javascript:;" data-tab_no="tab3">사용</a></li>
	            </ul>
	        </div><!-- // tab-a -->
			
			<div id="divMileageList">
		        <table class="table-d table-col mt10" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
		        <caption>유형, 구분, 내용, 포인트, 발생일자로 구성된 적립/차감 포인트 목록입니다.</caption>
		        <colgroup>
		            <col style="width: 18%;">
		            <col style="width: 12%;">
		            <col style="width: auto;">
		            <col style="width: 18%;">
		            <col style="width: 22%;">
		        </colgroup>
		        <thead>
		            <tr>
		                <th scope="col">유형</th>
		                <th scope="col">구분</th>
		                <th scope="col">내용</th>
		                <th scope="col">포인트</th>
		                <th scope="col">발생 일자</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:choose>
						<c:when test="${not empty mileageList }">
							<c:forEach var="mileageList" items="${mileageList }" varStatus="i">
								<tr>
								    <td><c:out value="${mileageList.MLG_SHP_GB_NM }"/></td>
								    <td><c:out value="${mileageList.MLG_USE_GB_NM }"/></td>
								    <td>
								    	<c:out value="${mileageList.MLG_KND_GB_NM }"/>
								    	<c:if test="${fn:trim(mileageList.MLG_ORDER_CD) != '' }">
								    		<br/><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}"/>/mobile/mypage/myShoppingInfo.do?ORD_MST_CD=<c:out value="${mileageList.MLG_ORDER_CD }" />','_self');">(<c:out value="${mileageList.MLG_ORDER_CD }"/>)</a>
								    	</c:if>
								    </td>
								    <td>
								    	<c:choose>
								    		<c:when test="${mileageList.MLG_USE_GB == 'A' || mileageList.MLG_USE_GB == 'C'}">
								    			<fmt:formatNumber value="${mileageList.MLG_ERP_MLG }" groupingUsed="true" />
								    		</c:when>
								    		<c:otherwise>
								    			-<fmt:formatNumber value="${mileageList.MLG_ERP_MLG }" groupingUsed="true" />
								    		</c:otherwise>
								    	</c:choose>
								    </td>
								    <td><ui:formatDate value="${mileageList.MLG_ERP_DT }" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
					            <td colspan="5">
					                <p class="no-more">
					                    포인트 내역이 없습니다.
					                </p>
					            </td>
					        </tr>
						</c:otherwise>
					</c:choose>
		        </tbody>
		        </table><!-- // table-d -->
		    
		        <div class="padder mt20">
		            <h4 class="title-benefit">포인트 유의사항</h4>
		
		            <ul class="list list-a mt10">
		                <li>상품을 구매하는 회원에게 구매금액의 일정 비율을 포인트로 적립하며, 주문취소 또는 반품의 경우에는 포인트가 회수됩니다.</li>
		                <li>포인트는 적립일로부터 3년간 유효하며, 유효기간이 경과한 적립금은 자동적으로 소멸됩니다.</li>
		                <li>포인트는 10,000원 이상부터 사용가능하며  당월 소멸 예정 포인트는 1원부터 사용 가능합니다.</li>
		            </ul>
		        </div>
		
		        <div class="section-pagination mt20"><!-- section pagination -->
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
				</div><!-- // section pagination -->
				
				<input type="hidden" name="cPage" value="${commandMap.cPage }"/>
			
			</div>
			
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
//myPageMileageListAjax('1','');
    
 	// tab 변경 
	$("#menuViewTab").on("click", "a", function () {
 		
 		var this_tab_no = $(this).data('tab_no');
 		
 		$(this).parent().parent().find('a').each( function(i,item){
 			if( this_tab_no == $(item).data("tab_no") ){
 				$(item).parent().addClass("active");	
 			}	
 			else{
 				$(item).parent().removeClass("active");
 			}
 		});
 		myPageMileageListAjax('1',this_tab_no);
 		
 	});
});

//포인트 내역 리스트
function myPageMileageListAjax(cPage,tabNo){
	
	if(tabNo == 'tab2'){
		MlgUseGb = "A,C";
	}else if(tabNo == 'tab3'){
		MlgUseGb = "D,J,U";
	}else{
		MlgUseGb = "All";
	}
	$("#tabNo").val(tabNo);
	$("#divMileageList").load("<c:out value="${mobileDomain}" />/mobile/mypage/myMileageListAjax.do", {"cPage":cPage,"MlgUseGbMuit":MlgUseGb});
}

function goPage(cPage){
	myPageMileageListAjax(cPage,$("#tabNo").val());
}
//]]>
</script>
</body>
</html>