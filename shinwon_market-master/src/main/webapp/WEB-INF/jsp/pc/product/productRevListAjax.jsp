<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
    <div id="productReviewListHtml">
        <table class="table-col table-a is-fixed" cellspacing="0">
            <caption>상품리뷰 테이블</caption>
            <colgroup>
                <col style="width: 10%;" />
                <col style="width: 15%;" />
                <col style="width: auto;" />
                <col style="width: 15%;" />
                <col style="width: 15%;" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col"><span>번호</span></th>
                    <th scope="col"><span>만족도</span></th>
                    <th scope="col"><span>상품평</span></th>
                    <th scope="col"><span>구매자</span></th>
                    <th scope="col"><span>작성일</span></th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty listProductRev}">
                <tr>
                    <td colspan="5" class="no-result">
                        상품평이 없습니다.
                    </td>
                </tr>
                </c:if>
                <c:forEach var="data" items="${listProductRev}" varStatus="i">
                <tr>
                    <td><fmt:formatNumber value="${paging.listNum - i.index}" groupingUsed="true" /></td>
                    <td>
                        <div class="stars">
                            <i class="icon star star-<c:out value="${data.REP_POINT_GRD}"/>"><span><em>별점 10점 만점중 <c:out value="${data.REP_POINT_GRD}"/>점</em></span></i>
                        </div>
                    </td>
                    <td class="text-left">
                        <!-- 
                        <a href="javascript:;">
                         -->
                            <c:out value="${data.PRD_REV_TITLE}" />
                        <!-- 
                        </a>
                         -->
                    </td>
                    <td><c:out value="${data.PRD_REV_REG_ID}" /></td>
                    <td><c:out value="${data.PRD_REV_REG_DT_2}" /></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <div id="pagingHtml">
        <h4 class="sr-only">목록 페이징</h4>
        <div class="wrap">
            <ui:frontpaging paging="${paging}" jsFunction="goProductReviewPage" />
        </div>
    </div>
    <input type="hidden" id="totalRecordCount" value="${paging.totalRecordCount}" />
</div>