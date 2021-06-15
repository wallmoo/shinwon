<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>주문상태변경내역</span></h3>
            </div><!-- // push-guide -->
            
	        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	            <colgroup>
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
	                <tr>
						<th>상품코드</th>
						<td><c:out value="${orderProductInfo.ORD_PRD_MST_CD}"/></td>
						<th>상품명</th>
						<td>
						    <p><ui:brand brandCD="${orderProductInfo.PRD_MST_BRAND_CD }"/></p>
						    <p><c:out value="${orderProductInfo.PRD_MST_NM}"/></p> 
						<th>현재상태</th>
						<td><c:out value="${orderProductInfo.ORD_PRD_ORD_STATE_NM}"/></td>
					</tr>
	            </tbody>
	        </table><!-- // table -->
	        
	        <br/>
	        
	        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	            <colgroup>
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <thead>
					<tr>
						<th>상태</th>
						<th>사유</th>
						<th>송장번호</th>
						<th>담당자 또는 주문자</th>
						<th>처리일</th>
					</tr>
				</thead>
				<tbody>
				    <c:forEach items="${orderHistoryList}" var="data" varStatus="i">  
					<tr>
						<td><c:out value="${data.ORD_PRD_ORD_STATE_NM}"/></td>
						<td style="text-align:left;">
						    <c:if test="${not empty data.ORD_PRD_REASON_NM }">
						        [<c:out value="${data.ORD_PRD_REASON_NM}"/>]
						    </c:if>
						    <c:out value="${data.ORD_PRD_DSC}"/>
						</td>
						<td style="text-align:left;">
							<c:if test="${not empty data.ORD_PRD_IVC_NO}">
							발송 : <c:out value="${data.ORD_PRD_IVC_NO}"/>
							</c:if>
						</td>
						<td>
						<c:choose>
						    <c:when test="${data.ORD_PRD_REG_TYPE eq Code.OPERATOR_TYPE_USER }">
                                <c:if test="${data.ORD_PRD_REG_ID ne '_GUEST_' }"><c:out value="${data.MEM_MST_MEM_NM}"/>(<c:out value="${data.ORD_PRD_REG_ID}"/>)</c:if>
						        <c:if test="${data.ORD_PRD_REG_ID eq '_GUEST_' }">비회원</c:if>
						    </c:when>
						    <c:when test="${data.ORD_PRD_REG_TYPE eq Code.OPERATOR_TYPE_ADMIN || data.ORD_PRD_REG_TYPE eq Code.OPERATOR_TYPE_LOGIS }">
                                <c:out value="${data.ORD_PRD_REG_ID}"/>(<c:out value="${data.ADM_MST_NM}"/>)
						    </c:when>
						    <c:when test="${data.ORD_PRD_REG_TYPE eq Code.OPERATOR_TYPE_PARCEL }">
						        택배사
						    </c:when>
						    <c:when test="${data.ORD_PRD_REG_TYPE eq Code.OPERATOR_TYPE_SHOP }">
						        매장
						    </c:when>
						    <c:when test="${data.ORD_PRD_REG_TYPE eq Code.OPERATOR_TYPE_BATCH }">
						        자동
						    </c:when>
						    <c:otherwise>
                                <c:out value="${data.ORD_PRD_REG_ID}"/>
						    </c:otherwise>
						</c:choose>
						</td>
						<td><ui:formatDate value="${data.ORD_PRD_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
					</tr>
					</c:forEach>
				</tbody>
	        </table><!-- // table -->
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</body>
</html>
