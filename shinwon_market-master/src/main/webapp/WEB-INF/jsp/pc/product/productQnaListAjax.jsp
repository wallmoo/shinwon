<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
    <div id="productQnAListHtml">
        <table class="table-col table-a bbs-collapse is-fixed" cellspacing="0">
            <caption>질문과 답변 테이블</caption>
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
                    <th scope="col"><span>답변상태</span></th>
                    <th scope="col"><span>제목</span></th>
                    <th scope="col"><span>구매자</span></th>
                    <th scope="col"><span>작성일</span></th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty listProductQna}">
                <tr>
                    <td colspan="5" class="no-result">
                        문의내역이 없습니다.
                    </td>
                </tr>
                </c:if>
                <c:forEach var="data" items="${listProductQna}" varStatus="i">
                <tr class="head"><!-- row -->
                    <td><fmt:formatNumber value="${paging.listNum - i.index}" groupingUsed="true" /></td>
                    <td>
                        <span<c:if test="${data.BRD_INQ_REPLY_CD eq 'Y'}"> class="primary"</c:if>><c:out value="${data.BRD_INQ_REPLY_CD_NM }" /></span>
                    </td>
                    <td class="subject text-left">
                        <a href="javascript:;">
                            <c:out value="${data.BRD_INQ_TITLE}" />
                        </a>
                    </td>
                    <td><c:out value="${data.BRD_INQ_REG_ID}" /></td>
                    <td><c:out value="${data.BRD_INQ_REG_DT_2}" /></td>
                </tr>
                <tr class="body"><!-- row -->
                    <td></td>
                    <td colspan="3">
                        <div class="wrap"><!-- wrap -->
                            <div class="holder">
                                <div class="upper">
                                    <i class="icon"><em>질문</em></i>
                                    <div class="core">
                                        <ui:replaceLineBreak content="${data.BRD_INQ_CONTENTS}"/>
                                    </div>
                                </div>
                                <c:if test="${data.BRD_INQ_REPLY_CD eq 'Y'}">
                                <div class="downer">
                                    <i class="icon"><em>답변</em></i>
                                    <div class="core">
                                        <c:out value="${data.BRD_INQ_REPLY_CONTENTS}" escapeXml="false"/>
                                    </div>
                                    <p class="desc">
                                              답변일 : <c:out value="${data.BRD_INQ_REPLY_DT_2}" />
                                    </p>
                                </div>
                                </c:if>
                            </div>
                        </div><!-- // wrap -->
                    </td>
                    <td></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <div id="pagingHtml">
        <h4 class="sr-only">목록 페이징</h4>
        <div class="wrap">
            <ui:frontpaging paging="${paging}" jsFunction="goProductQnAPage" />
        </div>
    </div>
    <input type="hidden" id="totalRecordCount" value="${paging.totalRecordCount}" />
</div>