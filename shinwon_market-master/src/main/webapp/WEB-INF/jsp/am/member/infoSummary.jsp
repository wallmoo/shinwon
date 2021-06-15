<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 10%;">
						<col style="width: auto;">
						<col style="width: 10%;">
						<col style="width: auto;">
						<col style="width: 10%;">
						<col style="width: auto;">
						<col style="width: 10%;">
						<col style="width: auto;">
						<c:if test="${memberInfo.MEM_MST_LEV_YN ne 'N' }">
						<col style="width: 10%;" />
						<col style="width: auto;" />
						</c:if>
					</colgroup>
					<tbody>
						<tr>
							<th><span>아이디(이름)</span><span>ERP</span></th>
							<td><c:out value="${memberInfo.MEM_MST_MEM_ID }"/>(<c:out value="${memberInfo.MEM_MST_MEM_NM }" />)	<br><c:out value="${memberInfo.MEM_MST_ERP_ID }"/></td>
							<th><span>닉네임</span></th>
							<td>
								<c:choose>
									<c:when test="${empty memberInfo.MEM_MST_NCK_NM}">
								      	 닉네임을 등록하지 않은 유저입니다
								    </c:when>
								    <c:otherwise>
								        <c:out value="${memberInfo.MEM_MST_NCK_NM }"/>
								    </c:otherwise>
								</c:choose>
								
							</td>
							<th><span>프로필사진</span></th>
							<td>
								<p class="profile_img">
									<c:choose>
										<c:when test="${empty memberInfo.MEM_MST_PRF_IMG}">
									       <img src="../img/admin/user.gif" alt="기본 프로필 이미지">
									    </c:when>
									    <c:otherwise>
									        <img src="<c:out value="${cdnDomain}${memberInfo.MEM_MST_PRF_IMG}"/>" alt="프로필 이미지">
									    </c:otherwise>
									</c:choose>
	
									
								</p>
							</td>
							<th><span>회원가입 유형</span></th>
							<td><c:out value="${memberInfo.MEM_MST_MEM_GBN_NM }"/></td>
						</tr>
					</tbody>
				</table>