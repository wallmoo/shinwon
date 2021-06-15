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
            
            <h3 class="title"><span>입점업체 기본정보</span></h3>

            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th>입점업체명</th>
                        <td><c:out value="${row.VDR_MST_NM }"/></td>
                        <th>브랜드명</th>
                        <td><c:out value="${brandManagerInfo.BND_MST_BRAND_NM }"/></td>
                    </tr>
                    <tr>    
                        <th>대표이메일</th>
                        <td colspan="3"><c:out value="${row.VDR_MST_MAIL }"/></td>
                    </tr>
                    <tr>
                        <th>사업자번호</th>
                        <td><c:out value="${row.VDR_MST_BUSI1 }"/> - <c:out value="${row.VDR_MST_BUSI2 }"/> - <c:out value="${row.VDR_MST_BUSI3 }"/></td>
                        <th>대표자명</th>
                        <td><c:out value="${row.VDR_MST_CEO_NM }"/></td>
                    </tr>
                    <tr>
                        <th>업태/업종</th>
                        <td colspan="3"><c:out value="${row.VDR_MST_BUSI_CDT }"/> / <c:out value="${row.VDR_MST_BUSI_TYPE }"/></td>
                    </tr>
                    <tr>
                        <th>사업장 주소</th>
                        <td colspan=3>
                            <c:if test="${not empty row.VDR_MST_DR_ADDR1 || not empty row.VDR_MST_JB_ADDR1 }">
                                [<c:out value="${row.VDR_MST_POST5 }"/>]
                                <c:choose> 
                                    <c:when test="${not empty row.VDR_MST_DR_ADDR1 && not empty row.VDR_MST_DR_ADDR2 }">
                                        <c:out value="${row.VDR_MST_DR_ADDR1 }"/> <c:out value="${row.VDR_MST_DR_ADDR2 }"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${row.VDR_MST_JB_ADDR1 }"/> <c:out value="${row.VDR_MST_JB_ADDR2 }"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>    
                            <c:if test="${not empty row.VDR_MST_TEL1}">
                                <c:out value="${row.VDR_MST_TEL1 }"/>-<c:out value="${row.VDR_MST_TEL2 }"/>-<c:out value="${row.VDR_MST_TEL3 }"/>
                            </c:if>
                        </td>
                        <th> 팩스</th>
                        <td>
                            <c:if test="${not empty row.VDR_MST_FAX1}">
                                <c:out value="${row.VDR_MST_FAX1 }"/>-<c:out value="${row.VDR_MST_FAX2 }"/>-<c:out value="${row.VDR_MST_FAX3 }"/>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>담당MD</th>
                        <td>
                        	<c:if test="${not empty managerMDList }">
                        		<c:forEach var="managerMDRow" items="${managerMDList }" varStatus="i">
									<c:if test="${row.VDR_MST_MD_ID eq managerMDRow.ADM_MST_ID}">
										<c:out value="${managerMDRow.ADM_MST_NM }"/>
									</c:if>
								</c:forEach>
                        	</c:if>
                        	<c:out value="${managerMDRow.ADM_MST_NM }"/>
                        <th>상태</th>
                        <td>
                            <c:choose>
                                <c:when test="${row.VDR_MST_USE_YN eq 'Y' }">
									사용
                                </c:when>
                                <c:otherwise>
									미사용
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </tbody>
            </table><!-- // table -->
            
            <h3 class="title"><span>정산/계약 정보</span></h3>
                    
            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th>정산주기</th>
                        <td><c:out value="${row.VDR_MST_BAL_ACT }"/>일</td>
                        <th>은행</th>
                        <td>
                                <c:if test="${not empty codes.KICC_BANK_CD }">
                                    <c:forEach var="bankRow" items="${codes.KICC_BANK_CD }" varStatus="i">
                                        <c:if test="${row.VDR_MST_BANK_CD eq bankRow.CMN_COM_ETC1 }">
                                            <c:out value="${bankRow.CMN_COM_NM }"/>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                
                            <c:if test="${row.VDR_MST_BANK_CD eq bankRow.CMN_COM_ETC1 }"><c:out value="${bankRow.CMN_COM_NM }"/></c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>계좌번호</th>
                        <td><c:out value="${row.VDR_MST_ACT_NO }"/></td>
                        <th>예금주</th>
                        <td><c:out value="${row.VDR_MST_ACT_HDR }"/></td>
                    </tr>
                    <tr>
                        <th>계약기간</th>
                        <td>
                            <c:if test="${not empty row.VDR_MST_CTR_ST_DT && not empty row.VDR_MST_CTR_ED_DT}">
                                <c:out value="${row.VDR_MST_CTR_ST_DT }"/> ~ <c:out value="${row.VDR_MST_CTR_ED_DT }"/>
                            </c:if> 
                        </td>
                        <th>계약일</th>
                        <td><c:out value="${row.VDR_MST_CTR_DT }"/></td>
                    </tr>
                    <tr>
                        <th>수수료</th>
                        <td colspan="3"><c:out value="${not empty row.VDR_MST_FEE ? row.VDR_MST_FEE : 0 }"/> %</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="title"><span>배송비정보</span></h3>
                    
            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>                 
                    <tr>
                        <th>배송비무료조건</th>
                        <td>
                            <c:choose>
                                <c:when test="${not empty row.VDR_MST_DLV_PRICE }">
                                    주문금액 <c:out value="${row.VDR_MST_DLV_PRICE }"/> 원 이상
                                </c:when>
                                <c:otherwise>
                                    해당 없음
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="title"><span>업체 담당자정보</span></h3>
                    
            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                    <col style="width: 16%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>                 
                    <tr>
                        <th>담당자명</th>
                        <td>
                            <c:out value="${row.VDR_MST_MNG_NM }"/>
                        </td>
                        <th>담당자 연락처</th>
                        <td>
							<c:out value="${row.VDR_MST_MNG_TEL1 }"/> - <c:out value="${row.VDR_MST_MNG_TEL2 }"/> - <c:out value="${row.VDR_MST_MNG_TEL3 }"/>                            
                        </td>
                        
                    </tr>
                    <tr>
                        <th>담당자 휴대폰</th>
                        <td>
							<c:out value="${row.VDR_MST_MNG_HP1 }"/> - <c:out value="${row.VDR_MST_MNG_HP2 }"/> - <c:out value="${row.VDR_MST_MNG_HP3 }"/>
                        </td>
                        <th>담당자 이메일</th>
                        <td>
                            <c:out value="${row.VDR_MST_MNG_MAIL }"/>
                        </td>
                    </tr>
                    <tr>
                        <th>업무구분</th>
                        <td colspan="3">
                        	<c:if test="${not empty codes.WORK_DIVISION_CODE }">
								<c:forEach var="workRow" items="${codes.WORK_DIVISION_CODE }" varStatus="i">
									<c:if test="${row.VDR_MST_MNG_TYPE eq workRow.CMN_COM_IDX }">
										<c:out value="${workRow.CMN_COM_NM }"/>
									</c:if>
								</c:forEach>
							</c:if>
                        </td>  
                    </tr>
                </tbody>
            </table>
                
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

</body>
</html>