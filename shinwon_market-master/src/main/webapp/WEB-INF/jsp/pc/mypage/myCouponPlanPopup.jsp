<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup"><!-- page-list -->
	
<div id="popContainer"><!-- popContainer -->

    <h1 class="title">쿠폰 적용 기획전보기</h1>

    <div id="popWrapper" class="coupon-plan"><!-- popWrapper -->

        <table class="table-a"><!-- table-a -->
        <caption>기획전명, 기획전 기간, 쿠폰유효기간으로 구성된 쿠폰 적용 기획전 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;" />
            <col style="width: 120px;" />
            <col style="width: 120px;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>기획전명</span></th>
                <th scope="col"><span>기획전 기간</span></th>
                <th scope="col"><span>쿠폰유효기간</span></th>
            </tr>
        </thead>
        <tbody>
        	<c:choose>
        		<c:when test="${not empty list }">
        			<c:forEach var="list" items="${list }" varStatus="status">
	        			<tr>
			                <td class="ac subject"><a href="javascript:goPlanView('<c:out value="${list.PLN_MST_IDX }" />');"><c:out value="${list.PLN_MST_TITLE }" /></a></td>
			                <td class="ac"><ui:formatDate value="${list.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/><br /> ~ <ui:formatDate value="${list.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></td>
			                <td class="ac">
			                	<c:choose>
			                		<c:when test="${list.CPN_MST_ISU_DAY_GBN eq 'B' }">
			                			발행일로 부터 <c:out value="${list.CPN_MST_USE_DAY }" />일
			                		</c:when>
			                		<c:otherwise>
			                			<ui:formatDate value="${list.CPN_MST_USE_ST_DT }" pattern="yyyy.MM.dd"/><br /> ~ <ui:formatDate value="${list.CPN_MST_USE_ED_DT }" pattern="yyyy.MM.dd"/>
			                		</c:otherwise>
			                	</c:choose>
			                </td>
			            </tr>
			    	</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<tr><td colspan=3>적용된 기획전이 없습니다.</td></tr>
        		</c:otherwise>
        	</c:choose>
        </tbody>
        </table><!-- // table-a -->

        <form id="pageFrm" name="pageFrm">
    	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
    	<input type="hidden" name="CPN_MST_IDX" value="<c:out value="${commandMap.CPN_MST_IDX }"/>"/>
         <div class="section-pagination"><!-- section pagination -->
             <ui:frontpaging paging="${paging }" jsFunction="goPage" />
         </div><!-- // section pagination -->
        </form>

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script type="text/javascript">

$(function(){
	goPlanView = function(planMstIdx){
		window.open("<c:out value="${frontDomain }"/>/pc/event/planProductList.do?PLN_MST_IDX="+planMstIdx);
		//self.close();
	};
	
	goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myCouponPlanPopup.do", "target":"_self", "method":"post"}).submit();
    };
}); //function

</script>
</html>