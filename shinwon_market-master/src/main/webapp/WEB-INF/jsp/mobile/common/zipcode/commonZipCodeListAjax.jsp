<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <p class="mt40 mb10">'<span class="search-title">${commandMap.searchWord}</span>' <span class="result-ammount primary">${totalCount}</span>개의 검색 결과</p>
	<div class="search-result-box mb20">
		<c:choose>
			<c:when test="${not empty list}">
			<c:forEach var="zip" items="${list}" varStatus="idx">
				<div class="result-card">
					<p class="zip"><c:out value="${fn:substring(zip.ZIP,0,3)}"/>-<c:out value="${fn:substring(zip.ZIP,3,6)}"/></p>
					<p class="addr"><c:out value="${zip.ADDR}"/></p>
					<a href="javascript:setAddrInfo(<c:out value="${idx.index}"/>);" class="button addr_info"  
						data-addr="<c:out value="${zip.ADDR}"/>" 
	                    data-zip1="<c:out value="${fn:substring(zip.ZIP,0,3)}"/>" 
	                    data-zip2="<c:out value="${fn:substring(zip.ZIP,3,6)}"/>" 
	                    data-sido="<c:out value="${zip.SIDO}"/>" ><span>선택</span></a>
				</div>
            </c:forEach>
          	</c:when>
          	<c:otherwise>
          	<div class="result-card">
				<p class="zip"></p>
				<p class="addr">검색 결과가 없습니다.</p>					
			</div>
       	  	</c:otherwise>   
       </c:choose>
   </div>     