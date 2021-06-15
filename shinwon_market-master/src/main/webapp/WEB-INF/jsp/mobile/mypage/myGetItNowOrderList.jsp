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
	            <h2>교환권</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	        
	        <c:choose>
			    <c:when test="${not empty list}">
			    	<c:forEach var="row" items="${list }" varStatus="status">
			    		<div class="coupon-dispatch coupon-dispatch-list"><!-- coupon-dispatch -->
				            <h3><c:out value="${row.ORD_MST_CD }"/>&nbsp;<span class="warning"><c:out value="${row.SHP_MST_NM }"/></span></h3>
				            <ul class="form-a view">
				                <li>
				                    <div class="tit">방문예정일</div>
				                    <div class="field">
				                        <strong><ui:formatDate pattern="yyyy.MM.dd" value="${row.ORD_GET_PKU_DT }"/></strong>
				                    </div>
				                </li>
				                <li>
				                    <div class="tit">방문예정시간</div>
				                    <div class="field">
				                        <strong><c:out value="${row.ORD_GET_PKU_HH }"/></strong>
				                    </div>
				                </li>
				                <li>
				                    <div class="tit">수령인정보</div>
				                    <div class="field">
				                        <p><c:out value="${row.ORD_GET_NM }"/></p>
				                        <p><c:out value="${row.ORD_GET_TEL1 }"/>-<c:out value="${row.ORD_GET_TEL2 }"/>-<c:out value="${row.ORD_GET_TEL3 }"/></p>
				                    </div>
				                </li>
				            </ul>
				        </div><!-- // coupon-dispatch -->
				
				        <div class="section-button"><!-- section-button -->
				            <a href="<c:out value="${mobileDomain}" />/mobile/mypage/myGetItNowOrderInfo.do?ORD_MST_CD=<c:out value="${row.ORD_MST_CD }"/>" target="_self" class="button primary full"><span>교환권보기</span></a>
				        </div><!-- // section-button -->
			    	</c:forEach>
			    </c:when>	
			    <c:otherwise>
			    	<p class="no-more mt30 text-center">
			            <strong>겟잇나우 주문이 없습니다.</strong>
			        </p>
			    </c:otherwise>
			</c:choose>
	            
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

$(function(){
	
});

</script>
</body>
</html>    