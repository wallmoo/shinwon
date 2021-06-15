<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- #header S -->
 <div id="lnb"><!-- #lnb -->
	 <c:if test="${fn:indexOf(requestUrl,'/info/intro') > -1}">
	 	<h2 class="reset">마켓플랜트 소개</h2>
	    <ul class="reset">
	    	<li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introCompany') > -1}">class="active"</c:if>>
	    		<a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do"><span>브랜드 스토리</span></a></li>
	        <li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introPhilosophy') > -1}">class="active"</c:if>>
	        	<a href="<c:out value="${brandDomain}" />/info/intro/introPhilosophy.do"><span>경영이념</span></a></li>
	        <li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introFriend') > -1}">class="active"</c:if>>
	        	<a href="<c:out value="${brandDomain}" />/info/intro/introFriend.do"><span>계열사 및 관계사</span></a></li>
	        <li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introBI') > -1}">class="active"</c:if>>
	        	<a href="<c:out value="${brandDomain}" />/info/intro/introBI.do"><span>BI 소개</span></a></li>
	        <li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introPrize') > -1}">class="active"</c:if>>
	        	<a href="<c:out value="${brandDomain}" />/info/intro/introPrize.do"><span>수상내역</span></a></li>
	        <li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introPress') > -1}">class="active"</c:if>>
	        	<a href="<c:out value="${brandDomain}" />/info/intro/introPress.do"><span>보도자료</span></a></li>
	        <li <c:if test="${fn:indexOf(requestUrl,'/info/intro/introPosition') > -1}">class="active"</c:if>>
	        	<a href="<c:out value="${brandDomain}" />/info/intro/introPosition.do"><span>본사위치</span></a></li>
	    </ul>
	</c:if>
	
	 <c:if test="${fn:indexOf(requestUrl,'/info/membership') > -1}">
 			<h2 class="reset">멤버십가이드</h2>
		  	<ul class="reset">
		       	<li <c:if test="${fn:indexOf(requestUrl,'/info/membership/membershipGuide') > -1}">class="active"</c:if>>
		       		<a href="<c:out value="${brandDomain}" />/info/membership/membershipGuide.do"><span>멤버십안내</span></a></li>
		        <li <c:if test="${fn:indexOf(requestUrl,'/info/membership/membershipGrade') > -1}">class="active"</c:if>>
		        	<a href="<c:out value="${brandDomain}" />/info/membership/membershipGrade.do"><span>등급별혜택</span></a></li>
		    </ul>
 	</c:if>
	
	<c:if test="${fn:indexOf(requestUrl,'/info/support') > -1}">
	    	<h2 class="reset">고객지원센터</h2>
	        <ul class="reset">
	            <li <c:if test="${fn:indexOf(requestUrl,'/info/support/supportNotice') > -1}">class="active"</c:if>>
	            	<a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do"><span>공지사항</span></a></li>
	            <li <c:if test="${fn:indexOf(requestUrl,'/info/support/supportPraise') > -1}">class="active"</c:if>>
	            	<a href="<c:out value="${brandDomain}" />/info/support/supportPraise.do"><span>마켓플랜트칭찬하기</span></a></li>
	            <li <c:if test="${fn:indexOf(requestUrl,'/info/support/supportCounsel') > -1}">class="active"</c:if>>
	            	<a href="<c:out value="${brandDomain}" />/info/support/supportCounsel.do"><span>상담하기</span></a></li>
	            <li <c:if test="${fn:indexOf(requestUrl,'/info/support/supportFAQ') > -1}">class="active"</c:if>>
	            	<a href="<c:out value="${brandDomain}" />/info/support/supportFAQ.do"><span>FAQ</span></a></li>
	            <li <c:if test="${fn:indexOf(requestUrl,'/info/support/supportAS') > -1}">class="active"</c:if>>
	            	<a href="<c:out value="${brandDomain}" />/info/support/supportAS.do"><span>A/S센터안내</span></a></li>
	        </ul>
	</c:if>

	<c:if test="${fn:indexOf(requestUrl,'/info/recruit') > -1}">
            <h2 class="reset">채용정보</h2>
            <ul class="reset">
                <li <c:if test="${fn:indexOf(requestUrl,'/info/recruit/recruitModel') > -1}">class="active"</c:if>>
                	<a href="<c:out value="${brandDomain}" />/info/recruit/recruitModel.do"><span>인재상</span></a></li>
                <li <c:if test="${fn:indexOf(requestUrl,'/info/recruit/recruitWelfare') > -1}">class="active"</c:if>>
                	<a href="<c:out value="${brandDomain}" />/info/recruit/recruitWelfare.do"><span>인사/복리후생</span></a></li>
                <li <c:if test="${fn:indexOf(requestUrl,'/info/recruit/recruitJob') > -1}">class="active"</c:if>>
                	<a href="<c:out value="${brandDomain}" />/info/recruit/recruitJob.do"><span>직무소개</span></a></li>
            </ul>
    </c:if>

</div><!-- // #lnb -->




