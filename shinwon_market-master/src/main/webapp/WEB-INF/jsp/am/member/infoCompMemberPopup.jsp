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
            
            <h2 class="title"><span>회원정보</span></h2>
              
                <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                
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
                
                <h3 class="title"><span>기본정보</span></h3>
            
                <form id="frm" name="frm">
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }" />" />
                    <input type="hidden" name="MEM_MST_MEM_NM" value="<c:out value="${memberInfo.MEM_MST_MEM_NM }" />" />
                    <input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${memberInfo.MEM_MST_REG_DT }"/>"/> 
                    <input type="hidden" name="MEM_MST_TEL1" value="<c:out value="${memberInfo.MEM_MST_TEL1 }"/>"/>
                    <input type="hidden" name="MEM_MST_TEL2" value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>"/>
                    <input type="hidden" name="MEM_MST_TEL3" value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>"/>
                    <input type="hidden" name="MEM_MST_HP1" value="<c:out value="${memberInfo.MEM_MST_HP1 }"/>"/>
                    <input type="hidden" name="MEM_MST_HP2" value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>"/>
                    <input type="hidden" name="MEM_MST_HP3" value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>"/>
                    <input type="hidden" name="MEM_MST_ZIP_CDE5" value="<c:out value="${memberInfo.MEM_MST_ZIP_CDE5 }"/>"/>
                    <input type="hidden" name="MEM_MST_JBN_ADR1" value="<c:out value="${memberInfo.MEM_MST_JBN_ADR1 }"/>"/>
                    <input type="hidden" name="MEM_MST_DRO_ADR1" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR1 }"/>"/>
                    <input type="hidden" name="MEM_MST_ADR2" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR2 }"/>"/>
                    <input type="hidden" name="MEM_MST_MAIL" value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
                    <input type="hidden" name="MEM_MST_ERP_ID" value="<c:out value="${memberInfo.MEM_MST_ERP_ID }"/>"/>
                    <input type="hidden" name="MEM_MST_ERP_YN" value="<c:out value="${memberInfo.MEM_MST_ERP_YN }"/>"/>
                    <input type="hidden" name="MEM_CPR_CEO_NM" value="<c:out value="${memberInfo.MEM_CPR_CEO_NM }"/>"/>
                    <input type="hidden" name="MEM_CPR_TYPE" value="<c:out value="${memberInfo.MEM_CPR_TYPE }"/>"/>
                    <input type="hidden" name="MEM_CPR_STUS" value="<c:out value="${memberInfo.MEM_CPR_STUS }"/>"/>
                    <input type="hidden" name="MEM_CPR_TEL1" value="<c:out value="${memberInfo.MEM_CPR_TEL1 }"/>"/>
                    <input type="hidden" name="MEM_CPR_TEL2" value="<c:out value="${memberInfo.MEM_CPR_TEL2 }"/>"/>
                    <input type="hidden" name="MEM_CPR_TEL3" value="<c:out value="${memberInfo.MEM_CPR_TEL3 }"/>"/>
                    <input type="hidden" name="RST_YN" value="<c:out value="${memberInfo.RST_YN }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="searchInfoStartDate" value="<c:out value="${commandMap.searchInfoStartDate }"/>" />
                    <input type="hidden" name="searchInfoEndDate" value="<c:out value="${commandMap.searchInfoEndDate }"/>" />
                    <input type="hidden" name="searchId" value="<c:out value="${commandMap.searchId }"/>"/>
                    <input type="hidden" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>"/>
                    <input type="hidden" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>"/>
                    <input type="hidden" name="searchBirth" value="<c:out value="${commandMap.searchBirth }"/>"/>
                    <input type="hidden" name="searchMemberType" value="<c:out value="${commandMap.searchMemberType }"/>"/>
                    <input type="hidden" name="searchMemGrade" value="<c:out value="${commandMap.searchMemGrade }"/>"/>
                    <input type="hidden" name="searchJoinPath" value="<c:out value="${commandMap.searchJoinPath }"/>"/>                
                    <input type="hidden" name="searchJoinType" value="<c:out value="${commandMap.searchJoinType }"/>"/>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>아이디 <i class="require"><em>필수입력</em></i></span></th>
                                <td><c:out value="${memberInfo.MEM_MST_MEM_ID }"/></td>
                                <th><span>회원분류/회원등급 <i class="require"><em>필수입력</em></i></span></th>
                                <td><c:out value="${memberInfo.MEM_MST_MEM_GBN_NM }"/> / 
                                    <select class="select" name="MEM_MST_MEM_GRD">
                                        <c:if test="${not empty compMemGradeList }">
                                            <c:forEach var="compMemGradeRow" items="${compMemGradeList }">                                      
                                                <option value="<c:out value="${compMemGradeRow.CMN_COM_IDX }"/>" <c:if test="${compMemGradeRow.CMN_COM_IDX eq memberInfo.MEM_MST_MEM_GRD}">selected="selected"</c:if>><c:out value="${compMemGradeRow.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <c:if test="${memberInfo.RST_YN eq 'Y' }">
                                        <span style="color:red;">(휴)</span>
                                    </c:if> 
                                </td>
                            </tr>
                            <tr>
                                <th><span>기업명/대표자명 <i class="require"><em>필수입력</em></i></span></th>
                                <td><c:out value="${memberInfo.MEM_CPR_NM }"/> / <c:out value="${memberInfo.MEM_CPR_CEO_NM }"/></td>
                                <th><span>사업자등록번호 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <c:if test="${not empty memberInfo.MEM_CPR_NO1 && not empty memberInfo.MEM_CPR_NO2 && not empty memberInfo.MEM_CPR_NO3 }">
                                        <c:out value="${memberInfo.MEM_CPR_NO1 }"/> - 
                                        <c:out value="${memberInfo.MEM_CPR_NO2 }"/> - 
                                        <c:out value="${memberInfo.MEM_CPR_NO3 }"/> 
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>업종/업태</span></th>
                                <td>
                                    <c:out value="${not empty memberInfo.MEM_CPR_TYPE ? memberInfo.MEM_CPR_TYPE : '-' }"/> / 
                                    <c:out value="${not empty memberInfo.MEM_CPR_STUS ? memberInfo.MEM_CPR_STUS : '-' }"/>
                                </td>
                                <th><span>일반전화/팩스번호</span></th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty memberInfo.MEM_CPR_TEL2 && not empty memberInfo.MEM_CPR_TEL3 }">
                                            <c:out value="${memberInfo.MEM_CPR_TEL1 }"/> -
                                            <c:out value="${memberInfo.MEM_CPR_TEL2 }"/> - 
                                            <c:out value="${memberInfo.MEM_CPR_TEL3 }"/> 
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose> 
                                    / 
                                    <c:choose>
                                        <c:when test="${not empty memberInfo.MEM_CPR_FAX2 && not empty memberInfo.MEM_CPR_FAX3 }">
                                            <c:out value="${memberInfo.MEM_CPR_FAX1 }"/> -
                                            <c:out value="${memberInfo.MEM_CPR_FAX2 }"/> - 
                                            <c:out value="${memberInfo.MEM_CPR_FAX3 }"/> 
                                        </c:when> 
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th><span>사업장 주소 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <c:out value="${not empty memberInfo.MEM_CPR_ZIP_CDE5 ? memberInfo.MEM_CPR_ZIP_CDE5 : memberInfo.MEM_CPR_ZIP_CDE6 }"/>&nbsp;&nbsp;<c:out value="${memberInfo.MEM_CPR_JBN_ADR1 }"/>&nbsp;<c:out value="${memberInfo.MEM_CPR_JBN_ADR2 }"/><br/>
                                    <c:out value="${not empty memberInfo.MEM_CPR_ZIP_CDE5 ? memberInfo.MEM_CPR_ZIP_CDE5 : memberInfo.MEM_CPR_ZIP_CDE6 }"/>&nbsp;&nbsp;<c:out value="${memberInfo.MEM_CPR_DRO_ADR1 }"/>&nbsp;<c:out value="${memberInfo.MEM_CPR_DRO_ADR2 }"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>가입일</span></th>
                                <td>
                                    <ui:formatDate value="${memberInfo.MEM_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                <th><span>최근접속일</span></th>
                                <td><ui:formatDate value="${memberInfo.MEM_MST_VST_LAT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                            </tr>
                            <tr>
                                <th><span>개인정보선택동의여부</span></th>                                     
                                <td colspan="3">
                                    SK플래닛(주) : <c:out value="${memberInfo.SK_YN }"/> &nbsp;&nbsp;
                                    삼성카드(주) : <c:out value="${memberInfo.S_CARD_YN }"/> &nbsp;&nbsp;
                                    삼성전자(주) : <c:out value="${memberInfo.S_ELEC_YN }"/> &nbsp;&nbsp;
                                    LG전자(주) : <c:out value="${memberInfo.LG_YN }"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>최종변경일/처리자</span></th>
                                <td colspan="3">
                                    <c:if test="${not empty memberInfo.MEM_MST_UPD_DT && not empty memberInfo.MEM_MST_UPD_ID }">
                                        <ui:formatDate value="${memberInfo.MEM_MST_UPD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/> / <c:out value="${memberInfo.MEM_MST_UPD_ID }"/>
                                        <c:if test="${memberInfo.MEM_MST_UPD_ID ne 'SYSTEM-BATCH' }">(<c:out value="${not empty memberInfo.MEM_MST_UPD_NM ? memberInfo.MEM_MST_UPD_NM : memberInfo.MEM_MST_MEM_NM }"/>)</c:if>
                                    </c:if>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                            
                </form>
            
                <h3 class="title"><span>담당자 정보</span></h3>
                    
                <table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 16%;" />
                        <col style="width: auto;" />
                        <col style="width: 16%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>이름 <i class="require"><em>필수입력</em></i></span></th>
                            <td><c:out value="${memberInfo.MEM_MST_MEM_NM }"/></td>
                            <th><span>일반전화 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <c:if test="${not empty memberInfo.MEM_MST_TEL2 && not empty memberInfo.MEM_MST_TEL3 }">
                                    <c:out value="${memberInfo.MEM_MST_TEL1 }"/> -
                                    <c:out value="${memberInfo.MEM_MST_TEL2 }"/> -
                                    <c:out value="${memberInfo.MEM_MST_TEL3 }"/>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th><span>이메일 <i class="require"><em>필수입력</em></i></span></th>
                            <td><c:out value="${memberInfo.MEM_MST_MAIL }"/></td>
                            <th><span>휴대전화 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <c:if test="${not empty memberInfo.MEM_MST_HP2 && not empty memberInfo.MEM_MST_HP3 }">
                                    <c:out value="${memberInfo.MEM_MST_HP1 }"/> -
                                    <c:out value="${memberInfo.MEM_MST_HP2 }"/> -
                                    <c:out value="${memberInfo.MEM_MST_HP3 }"/>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th><span>정보수신여부</span></th>                                     
                            <td colspan="3"> 
                                SMS수신 : 
                                <select class="select" name="TRM_YN0001" id="SMS_YN" style="width:40px;">
                                    <option value="Y" <c:if test="${memberInfo.SMS_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
                                    <option value="N" <c:if test="${memberInfo.SMS_YN eq 'N' }">selected="selected"</c:if>>N</option>
                                </select>&nbsp;&nbsp;
                                이메일 수신 :
                                <select class="select" name="TRM_YN0004" id="EMAIL_YN" style="width:40px;">
                                    <option value="Y" <c:if test="${memberInfo.EMAIL_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
                                    <option value="N" <c:if test="${memberInfo.EMAIL_YN eq 'N' }">selected="selected"</c:if>>N</option>
                                </select>&nbsp;&nbsp;
                                DM(우편) : 
                                <select class="select" name="TRM_YN0003" id="DM_YN" style="width:40px;margin-top:5px;">
                                    <option value="Y" <c:if test="${memberInfo.DM_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
                                    <option value="N" <c:if test="${memberInfo.DM_YN eq 'N' }">selected="selected"</c:if>>N</option>
                                </select>&nbsp;&nbsp;        
                                TM(전화) : 
                                <select class="select" name="TRM_YN0002" id="TM_YN" style="width:40px;margin-top:5px;">
                                    <option value="Y" <c:if test="${memberInfo.TM_YN eq 'Y' }">selected="selected"</c:if>>Y</option>
                                    <option value="N" <c:if test="${memberInfo.TM_YN eq 'N' }">selected="selected"</c:if>>N</option>
                                </select>               
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <h3 class="title"><span>탈퇴정보</span></h3>
                
                <table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 16%;" />
                        <col style="width: auto;" />
                        <col style="width: 16%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>                 
                        <tr>
                            <th><span>회원탈퇴사유</span></th>
                            <td>
                                <c:out value="${memberInfo.MEM_MST_LEV_RSN_CD_NM }"/>
                                <c:if test="${memberInfo.MEM_MST_LEV_RSN_CD eq Code.SEC_REASON_ETC && not empty memberInfo.MEM_MST_LEV_RSN}">
                                    / <ui:replaceLineBreak content="${memberInfo.MEM_MST_LEV_RSN }"/>
                                </c:if>
                            </td>
                            <th><span>탈퇴일</span></th>
                            <td><ui:formatDate value="${memberInfo.MEM_MST_LEV_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                        </tr>
                    </tbody>
                </table>
            
                <c:if test="${memberInfo.MEM_MST_LEV_YN eq 'N' }">
                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="#none;" id="goRegist" class="button"><span>저장</span></a>
                        </div>
                    </div><!-- // section-button -->
                </c:if>
                
            </div><!-- //modal-inner -->
          
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

<script src="<c:out value="${serverDomain}" />/am/js/admin.js"></script>   
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>

<script>
$(function(){
    
	// 등록 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        if (confirm( "저장 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/infoCompMemberPopupRegist.do", "target":"_self", "method":"post"}).submit();
        }           
    });
    
});
</script>
</body>
</html>