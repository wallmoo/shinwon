<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/topIdFindResult.jsp" %>

 <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
			
                <c:choose>
                	<c:when test="${commandMap.memType eq 'memberSns' }">
                		<c:if test="${not empty list }">
                			<c:forEach var="row" items="${list }" varStatus="i">
				                <div class="find_myinfo_wp">
				                    <p class="txt"><span><c:out value="${commandMap.MEM_MST_MEM_NM}"/></span> 님은<br>
				                    SNS(<c:out value="${commandMap.MEM_SNS_TYPE}"/>) 가입 회원이며, 아이디는</p>
				                    <p class="id"><c:out value="${commandMap.MEM_MST_MEM_ID}"/></p>
				                    <p class="txt">입니다.</p>
				                </div>
		                	</c:forEach>
		                </c:if>
                	</c:when>
                	<c:otherwise>
		                <div class="find_myinfo_wp">
		                    <p class="txt"><span><c:out value="${commandMap.MEM_MST_MEM_NM}"/></span> 님의<br>아이디는</p>
		                    <p class="id"><c:out value="${commandMap.MEM_MST_MEM_ID}"/></p>
		                    <p class="txt">입니다.</p>
		                </div>
                	</c:otherwise>
                </c:choose>
                
                <div class="btn_area dual">
                    <button type="button" class="btn black" id="goPasswordFind">비밀번호 찾기</button>
                    <button type="button" class="btn ok" id="goLogin">로그인</button>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script>
	$(function () {
		$("#goLogin").on("click", function () {
			location.href = "<c:out value="${mobileDomain}" />/mobile/manager/login.do";
		});
		
		$("#goPasswordFind").on("click", function () {
			location.href = "<c:out value="${mobileDoain}" />/mobile/manager/pwFind.do?gubun=PW";
		});
	
	});
	

</script>