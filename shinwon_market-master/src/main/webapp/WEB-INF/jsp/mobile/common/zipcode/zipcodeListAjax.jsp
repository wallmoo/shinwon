<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${not empty list }">
		<c:forEach var="row" items="${list }" varStatus="i">
          		<!-- tr S -->
			<tr tabindex="0">
				<td rowspan="2" class="f"><c:out value="${row.RNUM }"/></td>
				<td rowspan="2"><c:out value="${row.BASE_ZONE }"/></td>
				<td class="td_add">
					<a href="javascript:setDoroAddrInfo(<c:out value="${i.index }"/>);"class="doroInfo" 
	                        data-doro="<c:out value="${row.DORO_ADDR}"/>" 
	                        data-zip="<c:out value="${row.BASE_ZONE}"/>" 
	                        data-jibun="<c:out value="${row.JIBUN_ADDR }"/>" >
						<span class="ico_tx btn_gre2">도로명</span><c:out value="${row.DORO_ADDR }"/>
					</a>
				</td>
			</tr>
			<tr tabindex="0">
				<td class="td_add">
					<a href="javascript:setJibunAddrInfo(<c:out value="${i.index }"/>);"class="jibunInfo" 
	                        data-doro="<c:out value="${row.DORO_ADDR}"/>" 
	                        data-zip="<c:out value="${row.BASE_ZONE}"/>" 
	                        data-jibun="<c:out value="${row.JIBUN_ADDR }"/>" >
						<span class="ico_tx btn_gre3">지번</span><c:out value="${row.JIBUN_ADDR }"/>
					</a>
				</td>
			</tr>
			<!-- tr E -->
           </c:forEach>
	</c:when>
	<c:otherwise>
		<!-- tr S -->
		<c:if test="${commandMap.searchZipYn ne 'Y' }">
			<tr tabindex="0">
				<td class="no_list" colspan="3">우편번호를 검색해주세요.</td>
			</tr>
		</c:if>
		<c:if test="${commandMap.searchZipYn eq 'Y' }">
			<tr tabindex="0">
				<td class="no_list" colspan="3">검색 결과가 없습니다.</td>
			</tr>
		</c:if>
		<!-- tr E -->
	</c:otherwise>
</c:choose>
