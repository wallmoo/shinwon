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
            
            <h2 class="title"><span>상품평</span></h2>
              
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
			        <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
			        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
			        <input type="hidden" name="searchBrdInqContents" value="<c:out value="${commandMap.searchBrdInqContents }"/>"/>
			        <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>
			        <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
			        <input type="hidden" name="BRD_INQ_IDX" value=""/>		
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                </form>
                
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
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
                            <th><span>회원정보</span></th>
                            <td>
                                <c:out value="${memberInfo.MEM_MST_MEM_ID }" />(<c:out value="${memberInfo.MEM_MST_MEM_NM }" />)
                            </td>
                            <c:if test="${memberInfo.MEM_MST_LEV_YN ne 'N' }"> 
                            <th><span>회원상태</span></th>
                            <td>
                                <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,0,4)}"/>년 <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,4,6)}"/>월 <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,6,8)}"/>일 <c:out value="${memberInfo.MEM_MST_LEV_YN eq 'Y' ? '탈퇴한' : '직권 탈퇴된' }"/> 회원 입니다.                       
                            </td>
                            </c:if>
                        </tr>   
                    </tbody>
                </table><!-- // table -->
                
                <h3 class="title"><span>상세정보</span></h3>
                <c:out value="${reviewDetail }"></c:out>
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                   <colgroup>
						<col style="width: 15%;min-width:180px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><label class="label"><span>상품코드 / 상품명</span></label></th>
							<td>
								<a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.PRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
                           			<c:out value="${row.PRD_PRD_MST_CD }"/>
                           		</a> / 
                           		<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${row.PRD_PRD_MST_CD}&ADMIN=Y" target="_blank">
                          			<c:out value="${row.PRD_MST_NM }"/>
                           		</a>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>작성자</span></label></th>
							<td>
								<c:choose>
									<c:when test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
                           				<c:out value="${row.MEM_MST_MEM_NM }"/> (<c:out value="${row.PRD_REV_REG_ID }"/>)
                           			</c:when>
                           			<c:otherwise>
                               			<c:out value="${row.MEM_MST_MEM_NM }"/> (<c:out value="${row.PRD_REV_REG_ID }"/>)
                           			</c:otherwise>
                       			</c:choose>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>등록일</span></label></th>
							<td>
								<ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>평점</span></label></th>
							<td>
								<span>총 평점 :</span> <c:out value="${row.PRD_REV_AVG_STAR }"/>
                       	 		<span>( 기능 :</span>
                           		<c:forEach begin="1" end="5" step="1" varStatus="i">
                           			<input name="star1" type="radio" class="star" disabled="disabled" <c:if test="${i.count <= row.PRD_REV_FNC_STAR}">checked="checked"</c:if>/>
                           		</c:forEach>
                        
                       	 		<span>/ 가격 : </span>
                           		<c:forEach begin="1" end="5" step="1" varStatus="i">
                           			<input name="star2" type="radio" class="star" disabled="disabled"  <c:if test="${i.count <= row.PRD_REV_PRC_STAR}">checked="checked"</c:if>/>
                           		</c:forEach>
                        
                        		<span>	/ 만족도 : </span>
                           		<c:forEach begin="1" end="5" step="1" varStatus="i">
                           			<input name="star3" type="radio" class="star" disabled="disabled"  <c:if test="${i.count <= row.PRD_REV_SCORE_STAR}">checked="checked"</c:if>/>
                           		</c:forEach>
                       			<span>) </span>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>제목 </span></label></th>
							<td>
								<c:if test="${row.PRD_REV_CHN_GBN eq 'M' }">
                           			<img alt="모바일에서 작성" src="<c:out value="${serverDomain }"/>/am/img/image_phone.png"/>
                          			</c:if>
                          			<c:if test="${row.CMM_FLE_CNT > 0 }">
                          				<img alt="이미지 포함" src="<c:out value="${serverDomain }"/>/am/img/image_photo.png"/>
                          			</c:if>
                           		<c:out value="${row.PRD_REV_TITLE }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>내용</span></label></th>
							<td>
								<ui:replaceLineBreak content="${row.PRD_REV_CONTENTS }"/>
							</td>
						</tr>
						
						<tr>
							<th><label class="label"><span>첨부이미지</span></label></th>
							<td>
								<form name="fileForm" id="fileForm">
						            <input type="hidden" name="CMM_FLE_IDX" value=""/>
						            <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
						            <input type="hidden" name="CMM_FLE_ORG_NM" value="" />                    
				                   	
			                    	<c:choose>
			                    		<c:when test="${not empty fileList }">    
		<%-- 									<c:forEach var="fileRow" items="${fileList }" varStatus="i"> --%>
		<%-- 		                    			<img src="${img_domain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }"/> --%>
		<%-- 		                    		</c:forEach>	                    	 --%>
											<c:forEach var="fileRow" items="${fileList }" varStatus="i">
			                              		<i class="icon-file"></i>
			                              		<a href="#none" class="file-ilst-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
			                                  		<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
			                              		</a>
			                           		</c:forEach>	
			                    		</c:when>
			                    		<c:otherwise>
			                    			-
			                    		</c:otherwise>
			                    	</c:choose>
		                    	</form> 
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->
				<h3 class="title"><span>관리정보</span></h3>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdRevRegNm" value="<c:out value="${commandMap.searchPrdRevRegNm }"/>"/>
                    <input type="hidden" name="searchPrdRevRegId" value="<c:out value="${commandMap.searchPrdRevRegId }"/>"/>
                    <input type="hidden" name="searchPrdRevContents" value="<c:out value="${commandMap.searchPrdRevContents }"/>"/>
                    <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>"/>
                    <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
				</form>
                
                <form id="frm" name="frm"> 
                	<input type="hidden" name="PRD_REV_IDX" value="<c:out value="${row.PRD_REV_IDX }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdRevRegNm" value="<c:out value="${commandMap.searchPrdRevRegNm }"/>"/>
                    <input type="hidden" name="searchPrdRevRegId" value="<c:out value="${commandMap.searchPrdRevRegId }"/>"/>
                    <input type="hidden" name="searchPrdRevContents" value="<c:out value="${commandMap.searchPrdRevContents }"/>"/>
                    <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>"/>
                    <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
	                    
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;min-width:180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<c:out value="${row.PRD_REV_USE_YN eq 'Y' ? '사용':'미사용'  }" />
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>카테고리전시여부</span></label></th>
	                    		<td>
	                    			<c:out value="${row.PRD_REV_BST_YN eq 'Y' ? '사용':'미사용'  }" />
	                    		</td>
	                        </tr>
	                        <c:if test="${not empty row.PRD_REV_ADM_REG_ID}">
		                        <tr>
		                    		<th><label class="label"><span>수정일</span></label></th>
		                    		<td>
		                    			<c:out value="${row.PRD_REV_ADM_REG_ID }"/>(<c:out value="${row.PRD_REV_ADM_REG_NM}"/>) / <ui:formatDate value="${row.PRD_REV_ADM_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
		                    		</td>
		                        </tr>
	                        </c:if>
	                    </tbody>
                	</table><!-- // table -->
                </form>
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
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberQnaPopup.do", "target":"_self", "method":"post"}).submit();
    });
});      
//]]>
</script>
</body>
</html>