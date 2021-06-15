<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">
 
<div id="container" style="margin:0px;"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">변경 내역</h4>
		</div>
		
		<div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
             <ul class="tab">
                 <li class="${(empty commandMap.searchTab || commandMap.searchTab eq 'warning') ? ' active' : ''}"><a href="<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?searchTab=warning&MEM_MST_MEM_ID=${commandMap.MEM_MST_MEM_ID}"><span>경고 내역</span></a></li>
                 <li class="${commandMap.searchTab eq 'stopAndClear' ? ' active' : ''}"><a href="<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?searchTab=stopAndClear&MEM_MST_MEM_ID=${commandMap.MEM_MST_MEM_ID}"><span>정지/해제 내역</span></a></li>
             </ul>
        </div><!-- // tab -->
        
        <!-- 경고내역 -->
		<div class="table-a warning"><!-- col list -->
	        <table class="core">
	            <colgroup>
	                <col style="width: 8%;" />
	                <col style="width: 10%;">
	                <col style="width: 17%;" />
	                <col style="width: 35%;" />
	                <col style="width: 30%;" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>구분</th>
	                    <th>사유</th>
	                    <th>관리자메모</th>
	                    <th>변경일/처리자명</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test="${not empty list }">
	                        <c:set var="waringListNum" value="${totalCount }"/>
	                        <c:forEach var="warningRow" items="${list }" varStatus="i">
	                            <tr>
			                    	<td><c:out value="${waringListNum }"/></td>
				                	<td>
				                		<c:out value="${warningRow.MEM_CUT_CD eq '1' ? '1차경고' : warningRow.MEM_CUT_CD eq '2' ? '2차경고' : warningRow.MEM_CUT_CD eq '3' ? '3차경고' : '경고해제' }"/>
				                	</td>
				                	<td><c:out value="${warningRow.MEM_CUT_RSN }"/></td>
				                	<td><c:out value="${not empty warningRow.MEM_CUT_MEMO ? warningRow.MEM_CUT_MEMO : '-' }"/></td>
				                	<td>
				                		<ui:formatDate value="${warningRow.MEM_CUT_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/> / 
				                		<br/><c:out value="${warningRow.MEM_CUT_REG_ID }"/>(<c:out value="${warningRow.MEM_CUT_REG_NM }"/>)
				                	</td>   
			                    </tr>
			                    <c:set var="waringListNum" value="${waringListNum-1 }"/>
	                        </c:forEach>
	                    </c:when>
	                    <c:otherwise>
	                        <tr>
	                            <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
	                        </tr>
	                    </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	    </div><!-- // col list -->
	    <!-- // 경고내역 -->
	    
	    <!-- 정지&해제내역 -->
	    <div class="table-a stopAndClear"><!-- col list -->
	        <table class="core">
	            <colgroup>
	                <col style="width: 8%;" />
	                <col style="width: 10%;">
	                <col style="width: 15%;" />
	                <col style="width: 31%;" />
	                <col style="width: 14%;" />
	                <col style="width: 21%;" />
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>구분</th>
	                    <th>사유</th>
	                    <th>관리자메모</th>
	                    <th>정지기간</th>
	                    <th>변경일/처리자명</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test="${not empty list }">
	                        <c:set var="blackListNum" value="${totalCount }"/>
	                        <c:forEach var="blackListRow" items="${list }" varStatus="i">
	                            <tr>
			                    	<td><c:out value="${blackListNum }"/></td>
				                	<td><c:out value="${blackListRow.MEM_BLK_CD eq '1' ? '일시정지' : blackListRow.MEM_BLK_CD eq '2' ? '영구정지' : '해제'}"/></td>
				                	<td><c:out value="${blackListRow.MEM_BLK_RSN }"/></td>
				                	<td><c:out value="${not empty blackListRow.MEM_BLK_MEMO ? blackListRow.MEM_BLK_MEMO : '-' }"/></td>
				                	<td>
				                		<c:choose>
					                		<c:when test="${not empty blackListRow.MEM_BLK_ST && not empty blackListRow.MEM_BLK_ED}">
					                			<ui:formatDate value="${blackListRow.MEM_BLK_ST}" pattern="yyyy.MM.dd"/> ~
					                			<br/><ui:formatDate value="${blackListRow.MEM_BLK_ED}" pattern="yyyy.MM.dd"/>
					                		</c:when>
					                		<c:otherwise>-</c:otherwise>
				                		</c:choose>
				                	</td>
				                	<td>
				                		<ui:formatDate value="${blackListRow.MEM_BLK_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/> / 
				                		<br/><c:out value="${blackListRow.MEM_BLK_REG_ID }"/>
				                		<c:if test="${blackListRow.MEM_BLK_REG_ID ne 'SYSTEM-BATCH' }">(<c:out value="${blackListRow.MEM_BLK_REG_NM }"/>)</c:if>
				                	</td>   
			                    </tr>
			                    <c:set var="blackListNum" value="${blackListNum-1 }"/>
	                        </c:forEach>
	                    </c:when>
	                    <c:otherwise>
	                        <tr>
	                            <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
	                        </tr>
	                    </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	    </div><!-- // col list -->
	    <!-- // 정지&해제내역 -->
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(function()
{
	$(".stopAndClear").hide();
	
	var searchTab = "${commandMap.searchTab}";
	
	//탭 변경
	if(searchTab == "warning"){		// 경고 내역
		$(".warning").show();
		$(".stopAndClear").hide();
	}
	else if(searchTab == "stopAndClear"){	// 정지/해제 내역
		$(".warning").hide();
		$(".stopAndClear").show();
	}
});
</script>
</body>
</html>
