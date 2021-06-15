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

                <h2 class="title"><span>제조사 관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                 	<input type="hidden" name="searchMakerNm" value="<c:out value="${commandMap.searchMakerNm }"/>"/>
                 	<input type="hidden" name="searchMrkMstUseYn" value="<c:out value="${commandMap.searchMrkMstUseYn }"/>"/>
                </form>
                
                <form id="frm" name="frm">
                	<input type="hidden" name="MRK_MST_IDX" value="<c:out value="${row.MRK_MST_IDX }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchMakerNm" value="<c:out value="${commandMap.searchMakerNm }"/>"/>
                    <input type="hidden" name="searchMrkMstUseYn" value="<c:out value="${commandMap.searchMrkMstUseYn }"/>"/>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>제조사코드 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<c:out value="${row.MRK_MST_IDX }"/>    
                                </td>
                            </tr>  
                            <tr>
                                <th><span>제조사명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <c:out value="${row.MRK_MST_BRAND_NM }"/>
                                </td>
                            </tr>                            
                            <tr>
                                <th><span>사용설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" name="MRK_MST_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.MRK_MST_USE_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="MRK_MST_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.MRK_MST_USE_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
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
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 수정 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if (confirm( "저장 하시겠습니까?")) {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/makerManagerModify.do", "target":"_self", "method":"post"}).submit();
        }
    });
    
});
</script>

</body>
</html>