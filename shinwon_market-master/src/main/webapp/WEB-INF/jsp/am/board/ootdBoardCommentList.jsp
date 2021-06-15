<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3 class="title"><span>댓글</span></h3>
         <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
             <div class="col-1-2 text-left">
                 <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                 <span class="pages">
                     (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                 </span>
             </div>

             <div class="col-1-2 text-right">
                 <a href="#none" id="goUpdate" class="button small primary"><span>미사용처리</span></a>
             </div>
         </div><!-- // 목록 상단 버튼 -->

         <table cellspacing="0" class="table-col table-b"><!-- table -->
             <colgroup>
                 <col style="width: 8%;" />
                 <col style="width: auto;" />
                 <col style="width: 10%;" />
                 <col style="width: 15%;" />
                 <col style="width: 10%;" />
                 <col style="width: 10%;" />
             </colgroup>
             <thead>
                 <tr>
                     <th><input type="checkbox" class="checkbox checkAll" /></th>
                     <th>내용</th>
                     <th>작성자</th>
                     <th>등록일</th>
                     <th>상태</th>
                     <th>답글 작성</th>
                 </tr>
             </thead>
             <tbody id="comment-list">
             	<c:forEach items="${commentList}" var="comment">
             	<tr>
			<td><input type="checkbox" class="checkbox checkRow" data-otd_rpl_id="${comment.OTD_RPL_ID }"></td>
		    <td class="text-left txt_line1"><c:if test="${not empty comment.OTD_RPL_REF_ID}">↳ </c:if>${comment.OTD_RPL_CTS}</td>
		    <td>${comment.OTD_RPL_REG_ID}(${comment.MEM_MST_NCK_NM})</td>
		    <td>${comment.OTD_RPL_REG_DT}</td>						    
			<td><c:choose><c:when test="${comment.OTD_RPL_USE_YN eq 'Y'}">사용</c:when><c:otherwise>미사용</c:otherwise></c:choose></td>
			<td>
				<c:choose>
					<c:when test="${comment.OTD_RPL_USE_YN eq 'Y' && empty comment.OTD_RPL_REF_ID}"><a href="#none" class="button small rpl-reg-btn" data-otd_rpl_id="${comment.OTD_RPL_ID }" data-reg_id="${comment.OTD_RPL_REG_ID}" data-reg-nm="${comment.MEM_MST_NCK_NM}"><span>답글작성</span></a></c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
		</tr>
             	</c:forEach>
             </tbody>
         </table>

         <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
         </div><!-- // section pagination -->
