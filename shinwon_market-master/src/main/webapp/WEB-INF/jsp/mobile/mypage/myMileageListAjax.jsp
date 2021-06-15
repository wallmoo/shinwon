<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table class="table-d table-col mt10" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
   <caption>유형, 구분, 내용, 포인트, 발생일자로 구성된 적립/차감 포인트 목록입니다.</caption>
   <colgroup>
       <col style="width: 18%;">
       <col style="width: 12%;">
       <col style="width: auto;">
       <col style="width: 18%;">
       <col style="width: 22%;">
   </colgroup>
   <thead>
       <tr>
           <th scope="col">유형</th>
           <th scope="col">구분</th>
           <th scope="col">내용</th>
           <th scope="col">포인트</th>
           <th scope="col">발생 일자</th>
       </tr>
   </thead>
   <tbody>
   	<c:choose>
<c:when test="${not empty mileageList }">
<c:forEach var="mileageList" items="${mileageList }" varStatus="i">
	<tr>
	    <td><c:out value="${mileageList.MLG_SHP_GB_NM }"/></td>
	    <td><c:out value="${mileageList.MLG_USE_GB_NM }"/></td>
	    <td>
	    	<c:out value="${mileageList.MLG_KND_GB_NM }"/>
	    	<c:if test="${fn:trim(mileageList.MLG_ORDER_CD) != '' }">
	    		<br/><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}"/>/mobile/mypage/myShoppingInfo.do?ORD_MST_CD=<c:out value="${mileageList.MLG_ORDER_CD }" />','_self');">(<c:out value="${mileageList.MLG_ORDER_CD }"/>)</a>
	    	</c:if>
	    </td>
	    <td>
	    	<c:choose>
	    		<c:when test="${mileageList.MLG_USE_GB == 'A' || mileageList.MLG_USE_GB == 'C'}">
	    			<fmt:formatNumber value="${mileageList.MLG_ERP_MLG }" groupingUsed="true" />
	    		</c:when>
	    		<c:otherwise>
	    			-<fmt:formatNumber value="${mileageList.MLG_ERP_MLG }" groupingUsed="true" />
	    		</c:otherwise>
	    	</c:choose>
	    </td>
	    <td><ui:formatDate value="${mileageList.MLG_ERP_DT }" pattern="yyyy.MM.dd"/></td>
	</tr>
</c:forEach>
</c:when>
<c:otherwise>
	<tr>
        <td colspan="5">
            <p class="no-more">
                포인트 내역이 없습니다.
            </p>
        </td>
    </tr>
</c:otherwise>
</c:choose>
   </tbody>
   </table><!-- // table-d -->
</div>

<div class="padder mt20">
    <h4 class="title-benefit">포인트 유의사항</h4>

    <ul class="list list-a mt10">
        <li>상품을 구매하는 회원에게 구매금액의 일정 비율을 포인트로 적립하며, 주문취소 또는 반품의 경우에는 포인트가 회수됩니다.</li>
        <li>포인트는 적립일로부터 3년간 유효하며, 유효기간이 경과한 적립금은 자동적으로 소멸됩니다.</li>
        <li>포인트는 10,000원 이상부터 사용가능하며  당월 소멸 예정 포인트는 1원부터 사용 가능합니다.</li>
    </ul>
</div>

<div class="section-pagination mt20"><!-- section pagination -->
<ui:frontpaging paging="${paging }" jsFunction="goPage" />
</div><!-- // section pagination -->

<input type="hidden" name="cPage" value="${commandMap.cPage }"/>

