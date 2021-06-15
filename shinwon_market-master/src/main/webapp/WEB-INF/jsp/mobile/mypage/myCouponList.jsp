<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

			 <div class="title-nav">
                <h3 class="title-nav">나의 쿠폰함</h3>
                <a href="javascript:history.back(); return false;"><span class="sr-only">뒤로가기</span></a>
            </div>

            <div class="padder"><!-- padder -->

                <div class="title-coupon">
                    사용가능쿠폰 
                    <strong class="primary"><fmt:formatNumber value="${summaryMap.COUPON_CNT}" type="number"/></strong>
                    장
                </div>

                <div class="list-b guide">
                    <ul>
                        <li>사용 가능한 쿠폰내역만 조회 가능합니다.</li>
                        <li>쿠폰사용 내역은 PC 버전에서 확인해주시기 바랍니다.</li>
                    </ul>
                </div>

                <div class="section-list"><!-- section-list -->
                
                	<c:choose>
					    <c:when test="${not empty list}">
					    	<c:forEach var="data" items="${list }" varStatus="status">
					    	<div class="article"><!-- article -->

		                        <ul class="table"><!-- table -->
		                            <li class="number">
		                                <strong class="th">쿠폰번호 :</strong>
		                                <span class="td">
		                                    <c:out value="${data.CUPO_NO }" />
		                                </span>
		                            </li>
		                            <li class="save">
		                                <strong class="th">할인액(율) :</strong>
		                                <span class="td">
		                                    <strong class="primary"><fmt:formatNumber value="${data.ADD_DISC}" type="number"/><c:out value="${data.CUPO_KIND }" /></strong>
		                                    <p class="coupon-name">
		                                        <c:out value="${data.CUPO_NM }" />
		                                    </p>
		                                    <p class="coupon-desc">
		                                        (<fmt:formatNumber value="${data.BASE_AMT}" type="number"/>원 이상 구매시 사용가능)
		                                    </p>
		                                </span>
		                            </li>
		                            <li class="term">
		                                <strong class="th">사용기간 :</strong>
		                                <span class="td">
		                                    <ui:formatDate value="${data.VALD_TRM_FROM}" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${data.VALD_TRM_TO}" pattern="yyyy.MM.dd"/>
		                                </span>
		                            </li>
		                        </ul><!-- // table -->
		                    </div><!-- article -->
					    	</c:forEach>
					    </c:when>
					    <c:otherwise>
					    	<p class="message"><!-- 일반 오류 메시지 -->
		                        	사용 가능한 쿠폰이 없습니다. 
		                    </p><!-- 일반 오류 메시지 -->
					    </c:otherwise>
					</c:choose>
					
                </div><!-- // section-list -->

            </div><!-- // padder -->


			<c:if test="${totalCount > 5}">
	            <div class="padder section-more" id="moreBtn"><!-- 더 보기 -->
	                <a href="javascript:;" onclick="viewMoreList();" class="button large block"><span>더 보기</span><span class="icon down"></span></a>
	            </div><!-- // 더 보기 -->
			</c:if>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
$(function(){
    // 해당 페이지에만 필요한 개별 스크립트 삽입
    // console log version
    // window.jquery || console.log('jquery version: ' + $().jquery);
});

//더보기 클릭
function viewMoreList(){
	$.ajax({
		type: "post",
		url : "/mobile/mypage/myCouponList.do",
		data : {moreListYn : "Y"},
		dataType : "html",
		async : false,
		success : function(html){
			$(".article").last().append(html);	
			$("#moreBtn").hide();
		},
		error : function(){
			alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");
		}    		
	});
}
//]]>
</script>

</body>
</html>