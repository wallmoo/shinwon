<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">포인트 적립/차감 대상확인</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container">

	<div id="contents">
		 <div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width:  20%" />
					<col style="width:  25%" />
					<col style="width: auto;" />
					<col style="width:  25%"/>
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>내역</th>
						<th>관리자메모</th>
						<th>개별포인트</th>
						
					</tr>
				</thead>
				<tbody id="pointMemberList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
				    	<c:if test="${status.index eq 0 }">
						<tr>
							<td>
								<c:if test="${item.MIL_MST_GBN eq 'P' }">적립</c:if>
								<c:if test="${item.MIL_MST_GBN eq 'M' }">차감 </c:if>
							</td>
							<td><c:out value="${item.MIL_MST_BRK_DWN_NM }" /></td>
							<td><c:out value="${item.MIL_MST_MEMO }" /></td>
							<td><c:out value="${item.MIL_MST_PRC }" /></td>								
						</tr>
						
						</c:if>
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	 
				    	<tr>
							<td colspan="3">포인트 내역이 없습니다.</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->
	 
		 
		<div class="title-box">
			<h4 class="title">대상인원</h4>
		</div>
		
	 	<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width:  20%" />
					<col style="width:  25%" />
					<col style="width: auto;" />
					<col style="width:  25%"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>ERP고객코드</th>
						<th>고객명</th>
						<th>아이디</th>
						
					</tr>
				</thead>
				<tbody id="pointMemberList">
				<c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${status.index +1 }" /></td>
							<td><c:out value="${item.MEM_MST_ERP_ID }" /></td>
							<td><c:out value="${item.MEM_MST_MEM_ID }" /></td>
							<td><c:out value="${item.MEM_MST_MEM_NM }" /></td>								
						</tr>
						<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	 
				    	<tr>
							<td colspan="4">포인트 내역이 없습니다.</td>
						</tr>
				    </c:otherwise>
				</c:choose>
				</tbody>
			</table>			
		</div><!-- // col list -->
 
      
	</div>

</div><!-- // container -->




<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
	
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
//]]>
</script>
</body>
</html>
