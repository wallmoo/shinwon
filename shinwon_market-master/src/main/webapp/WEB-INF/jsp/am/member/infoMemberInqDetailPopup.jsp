<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

    <div class="modal"><!-- modal -->
    
        <div class="modal-wrapper"><!-- modal-wrapper -->
        
            <div class="modal-inner"><!-- modal-inner -->
            
            <h2 class="title"><span>1:1고객문의 상세</span></h2>
              
                <c:choose>
                    <c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
                        <%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>           
                    </c:when>
                    <c:otherwise>
                        <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                    </c:otherwise>
                </c:choose>
                
				<form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
			        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
			        <input type="hidden" name="searchMemAdvQstTypeUp" value="<c:out value="${commandMap.searchMemAdvQstTypeUp }"/>"/>
			        <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>"/>
			        <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
			        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
			        <input type="hidden" name="searchMemAdvTitle" value="<c:out value="${commandMap.searchMemAdvTitle }"/>"/>
			        <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>"/>
			        <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
			        <input type="hidden" name="MEM_ADV_IDX" value=""/>		
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                </form>
                
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
                <!-- // table -->
                
                <h3 class="title"><span>상세정보</span></h3>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />                        
                    </colgroup>
                    <tbody>
                        <!-- 
                        <tr>
                        	<th><span>구분</span></th>
                        	<td>
                        		<c:out value="${row.MEM_ADV_TYPE_NM }" />	
                        	</td>
                        </tr>
                         -->
                        <tr>
                        	<th><span>문의유형</span></th>
                        	<td>
                        		<c:out value="${row.MEM_ADV_QST_TYPE_UP_NM }" /> > <c:out value="${row.MEM_ADV_QST_TYPE_NM }" />	
                        	</td>
                        </tr>   
	                    <c:if test="${row.MEM_ADV_TYPE ne '2238'}">
	                    	<tr>
	                        	<th><span>CS구분</span></th>
	                        	<td>
	                        		판매처 : <c:out value="${row.MEM_ADV_CS_STR_NM }" /> / 품목 : <c:out value="${row.MEM_ADV_CS_ITM_NM }" />
	                        	</td>
	                        </tr>
	                    </c:if>
	                    <!-- 
	                    <tr>
                        	<th><span>주문번호</span></th>
                        	<td>
                        		<c:if test="${not empty row.ORD_MST_CD }">
	                    			<a href="javascript:goOrderView('<c:out value="${row.ORD_MST_CD }" />');">
	                               		<c:out value="${row.ORD_MST_CD }"/>
	                            	</a>
	                    		</c:if>	
                        	</td>
                        </tr>  
                        <tr>
                        	<th><span>상품코드</span></th>
                        	<td>
                        		<a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.MEM_ADV_MDL_NO }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
	                               <c:out value="${row.MEM_ADV_MDL_NO }"/>
	                            </a> 
                        	</td>
                        </tr>
                         -->
                        <tr>
                       		<th><span>제목</span></th>
                       		<td>
                       			<c:out value="${row.MEM_ADV_TITLE }"/>
                       		</td>
                       	</tr>  
                       	<tr>
                       		<th><span>내용</span></th>
                       		<td>
                       			<ui:replaceLineBreak content="${row.MEM_ADV_CONTENTS }"/>
                       		</td>
                       	</tr>
                       	<tr>
                       		<th><span>이메일</span></th>
                       		<td>
                       			<ui:replaceLineBreak content="${row.MEM_ADV_EMAIL }"/>
                       		</td>
                       	</tr>
                       	<tr>
                       		<th><span>휴대폰</span></th>
                       		<td>
                       			<ui:replaceLineBreak content="${row.MEM_TEL_NO }"/>
                       		</td>
                       	</tr>
                       	<!--   
                       	<tr>
                       		<th><span>답변 희망형태</span></th>
                       		<td>
                       			<c:if test="${row.MEM_ADV_MAIL_YN eq 'Y' }">이메일</c:if>
	                            <c:if test="${row.MEM_ADV_MAIL_YN eq 'N' }">받지않음(마이페이지에서 확인)</c:if>
	                            <c:if test="${row.MEM_ADV_MAIL_YN eq 'T' }">전화상담</c:if>	
                       		</td>
                       	</tr>
                       	-->	                     
                       	<c:if test="${row.MEM_ADV_TYPE eq '2238'}">
	                       	<tr>
	                        	<th><span>첨부파일</span></th>
	                        	<td>
	                        		<form name="fileForm" id="fileForm">
							            <input type="hidden" name="CMM_FLE_IDX" value=""/>
							            <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
							            <input type="hidden" name="CMM_FLE_ORG_NM" value="" />                    
					                   	
			                    		<c:if test="${not empty fileList }">    
											<c:forEach var="fileRow" items="${fileList }" varStatus="i">
			                              		<i class="icon-file"></i>
			                              		<a href="#none" class="file-ilst-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
			                                  		<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
			                              		</a>
			                           		</c:forEach>	
			                    		</c:if>
				                    </form> 
	                        	</td>
	                       	</tr>	
                       	</c:if>
                       	<tr>
                       		<th><span>작성자</span></th>
                       		<td>
                       			<c:out value="${row.MEM_ADV_REG_NM }"/>(<c:out value="${row.MEM_ADV_REG_ID }"/>)
                       		</td>	
                       	</tr>
                       	<tr>
                       		<th><span>등록일</span></th>
                       		<td>
                       			<ui:formatDate value="${row.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                       		</td>
                       	</tr>
                    </tbody>
                </table><!-- // table -->
                
                <h3 class="title"><span>답변하기</span></h3>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />                        
                    </colgroup>
                    <tbody>                    
                    	<tr>
                    		<th><span>답변상태</span></th>
                    		<td><c:out value="${row.MEM_ADV_RPL_YN eq 'Y' ? '답변완료' : '문의접수' }"/></td>
                    	</tr>
                    	<c:if test="${row.MEM_ADV_RPL_YN eq 'Y' }">			                    
                    		<tr>
	                    		<th><span>답변내용</span></th>
	                    		<td><c:out value="${row.MEM_ADV_RPL_CONTENTS }" escapeXml="false"/></td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>답변일</span></th>
	                    		<td><ui:formatDate value="${row.MEM_ADV_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>답변자</span></th>
	                    		<td><c:out value="${row.MEM_ADV_UPD_ID }"/>(<c:out value="${row.MEM_ADV_UPD_NM }"/>)</td>
	                    	</tr>	                    	
                    	</c:if>
               		</tbody>
               	</table>
               	
               	<div class="grid section-button-search"><!-- section button -->
					<a href="#none" id="goList" class="button small"><span>목록</span></a>
				</div>
            
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->
    
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

<script>
//<![CDATA[
$(document).ready(function () 
{       
	$(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberInqPopup.do", "target":"_self", "method":"post"}).submit();
    });
	
	// 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
});      
//]]>
</script>
</body>
</html>