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
            
            <h2 class="title"><span>μνλ¬Έμ</span></h2>
              
                <c:choose>
                    <c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
                        <%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>           
                    </c:when>
                    <c:otherwise>
                        <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                    </c:otherwise>
                </c:choose>
                
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>
                
				<form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
			        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
			        <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
			        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
			        <input type="hidden" name="searchBrdInqContents" value="<c:out value="${commandMap.searchBrdInqContents }"/>"/>
			        <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>
			        <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
			        <input type="hidden" name="BRD_INQ_IDX" value=""/>		
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                </form>
                
                <!--
                <table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <c:if test="${memberInfo.MEM_MST_LEV_YN ne 'N' }"> 
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </c:if>  
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>νμμ λ³΄</span></th>
                            <td>
                                <c:out value="${memberInfo.MEM_MST_MEM_ID }" />(<c:out value="${memberInfo.MEM_MST_MEM_NM }" />)
                            </td>
                            <c:if test="${memberInfo.MEM_MST_LEV_YN ne 'N' }"> 
                            <th><span>νμμν</span></th>
                            <td>
                                <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,0,4)}"/>λ <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,4,6)}"/>μ <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,6,8)}"/>μΌ <c:out value="${memberInfo.MEM_MST_LEV_YN eq 'Y' ? 'νν΄ν' : 'μ§κΆ νν΄λ' }"/> νμ μλλ€.
                                <c:out value="${memberInfo.MEM_MST_MEM_GBN_NM }"/> / 
                                <ui:formatDate value="${fn:trim(memberInfo.MEM_MST_REG_DT)}" pattern="yyyy-MM-dd HH:mm:ss"/>                     
                            </td>
                            </c:if>
                        </tr>   
                    </tbody>
                </table>--><!-- // table -->
                
                <h3 class="title"><span>μμΈμ λ³΄</span></h3>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />                        
                    </colgroup>
                    <tbody>
                        <c:if test="${not empty row.BRD_PRD_MST_CD }">
	                        <tr>
	                            <th><span>μνμ½λ/μνλͺ</span></th>
	                            <td>
	                                <a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.BRD_PRD_MST_CD }" />" target="_blank" title="μ μ°½ μΌλ‘ μ΄λ¦½λλ€.">
	                               		  <c:out value="${row.BRD_PRD_MST_CD}"/>
	                               	</a>
	                               	/
									<a href="<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD=${row.BRD_PRD_MST_CD}&ADMIN=Y" target="_blank">
	                               		<c:out value="${row.BRD_PRD_MST_NM }"/>
	                               	</a>
	                            </td>
		                    </tr>    
	                    </c:if>      
	                    <tr>
                        	<th><span>μμ±μ</span></th>
                        	<td>
                        		<c:out value="${row.BRD_INQ_REG_NM }" />(<c:out value="${row.BRD_INQ_REG_ID }"/>)
                        	</td>
                       	</tr>  
                       	<tr>
                       		<th><span>λ±λ‘μΌ</span></th>
                       		<td>
                       			<ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>	
                       		</td>	
                       	</tr>
                       	<tr>
                       		<th><span>μ λͺ©</span></th>
                       		<td>
                       			<c:out value="${row.BRD_INQ_TITLE }"/>	
                       		</td>
                       	</tr>  
                       	<tr>
                       		<th><span>λ΄μ©</span></th>
                       		<td>
                       			<c:out value="${row.BRD_INQ_CONTENTS }" escapeXml="false"/>
                       		</td>
                       	</tr>                  
                    </tbody>
                </table><!-- // table -->
                
                <h3 class="title"><span>λ΅λ³νκΈ°</span></h3>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />                        
                    </colgroup>
                    <tbody>
                    	<tr>
                    		<th><span>μ¬μ©μ¬λΆ</span></th>
                    		<td><c:out value="${row.BRD_INQ_USE_YN eq 'Y' ? 'μ¬μ©' : 'λ―Έμ¬μ©' }"/></td>
                    	</tr>
                    	<tr>
                    		<th><span>λ΅λ³μν</span></th>
                    		<td><c:out value="${row.BRD_INQ_REPLY_CD eq 'Y' ? 'λ΅λ³μλ£' : 'λ―Έλ΅λ³' }"/></td>
                    	</tr>
                    	<c:if test="${row.BRD_INQ_REPLY_CD eq 'Y' }">
                    		<tr>
	                    		<th><span>λ΅λ³λ΄μ©</span></th>
	                    		<td><c:out value="${row.BRD_INQ_REPLY_CONTENTS }" escapeXml="false"/></td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>λ΅λ³μΌ</span></th>
	                    		<td><ui:formatDate value="${row.BRD_INQ_REPLY_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>λ΅λ³μ</span></th>
	                    		<td><c:out value="${row.BRD_INQ_REPLY_ID }"/>(<c:out value="${row.BRD_INQ_REPLY_NM }"/>)</td>
	                    	</tr>	                    	
                    	</c:if>
               		</tbody>
               	</table>
               	
               	<div class="grid section-button-search"><!-- section button -->
					<a href="#none" id="goList" class="button small"><span>λͺ©λ‘</span></a>
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
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberQnaPopup.do", "target":"_self", "method":"post"}).submit();
    });
});      
//]]>
</script>
</body>
</html>