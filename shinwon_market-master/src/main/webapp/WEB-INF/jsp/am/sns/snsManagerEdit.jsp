<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->  

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container"><!-- container -->

                <h2 class="title"><span>SNS 관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                
                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="SNS_MST_IDX" value="<c:out value="${commandMap.SNS_MST_IDX }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" /> 
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchSnsType" value="<c:out value="${commandMap.searchSnsType }"/>"/>
                    <input type="hidden" name="searchSnsUseYn" value="<c:out value="${commandMap.searchSnsUseYn }"/>"/>      
                </form>
 
                <form id="frm" name="frm">
                    <input type="hidden" name="SNS_MST_IDX" value="<c:out value="${commandMap.SNS_MST_IDX }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" /> 
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchSnsType" value="<c:out value="${commandMap.searchSnsType }"/>"/> 
                    <input type="hidden" name="searchSnsUseYn" value="<c:out value="${commandMap.searchSnsUseYn }"/>"/>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>작성자</span></th>
                                <td>
                                    <c:out value="${row.SNS_MST_REG_NM }"/>(<c:out value="${row.SNS_MST_REG_ID }"/>)
                                </td>
                            </tr>
                            <tr>
                                <th><span>SNS 구분코드</span></th>
                                <td>
                                    <c:out value="${row.SNS_MST_TYPE_NM }"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>SNS API_KEY</span></th>
                                <td>
                                    <input type="text" name="SNS_MST_API_KEY" id="SNS_MST_API_KEY" class="text long" value="<c:out value="${row.SNS_MST_API_KEY }"/>" />
                                </td>
                            </tr>
                            <tr>
                                <th><span>SNS 사용여부</span></th>
                                <td>
                                    <c:choose>
                                        <c:when test="${row.SNS_MST_USE_YN eq 'Y' }">
                                            <label>사용</label><span>(SNS 사용시 미사용으로 변경이 불가능합니다.)</span>  
                                            <input type="hidden" name="SNS_MST_USE_YN" value="<c:out value="${row.SNS_MST_USE_YN }"/>" />
                                        </c:when>
                                        <c:otherwise>
                                            <input type="radio" name="SNS_MST_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.SNS_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                            <label for="stateA">사용</label>
                                            <input type="radio" name="SNS_MST_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.SNS_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                            <label for="stateB">미사용</label>
                                            <span>(SNS 사용시 미사용으로 변경이 불가능합니다.)</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>
                
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goModify" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
            </div><!-- // container -->

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>  

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script>    
$(function(){  
        
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goModify", function () {
           
        if($("#SNS_MST_TYPE").val() == "")
        {
            alert("[SNS구분코드]반드시 선택해 주십시오.");
            $("#SNS_MST_TYPE").focus();
            return;
        }
        
        if($.trim($("#SNS_MST_API_KEY").val()) == "")
        {
            alert("[SNS API_KEY]반드시 입력해 주십시오.");
            $("#SNS_MST_API_KEY").focus();
            return;
        }
    
        if (confirm("저장 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerModify.do", "target":"_self", "method":"post"}).submit();
        }
    });
    
});
</script>

</body>
</html>
