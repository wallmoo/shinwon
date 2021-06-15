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

        <div class="container">

            <h2 class="title"><span>제휴사관리</span></h2>

            <h3 class="title"><span>상세</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            
            <form name="searchForm" id="searchForm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	            <input type="hidden" name="searchCocMstSearchType" value="<c:out value="${commandMap.searchCocMstSearchType }"/>"/>
	            <input type="hidden" name="searchCocMstTitle" value="<c:out value="${commandMap.searchCocMstTitle }"/>"/>
	            <input type="hidden" name="searchCocSpcCD" value="<c:out value="${commandMap.searchCocSpcCD }"/>"/>
	            <input type="hidden" name="searchCocMstUseYn" value="<c:out value="${commandMap.searchCocMstUseYn }"/>"/>
			</form>
                
            <form name="frm" id="frm" method="post" action="/am/member/affiliateEditSubmit.do">
            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	            <input type="hidden" name="searchCocMstSearchType" value="<c:out value="${commandMap.searchCocMstSearchType }"/>"/>
	            <input type="hidden" name="searchCocMstTitle" value="<c:out value="${commandMap.searchCocMstTitle }"/>"/>
	            <input type="hidden" name="searchCocSpcCD" value="<c:out value="${commandMap.searchCocSpcCD }"/>"/>
	            <input type="hidden" name="searchCocMstUseYn" value="<c:out value="${commandMap.searchCocMstUseYn }"/>"/>
	            
	            <div class="section-form"><!-- section-form-a -->
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th><label class="label">제휴사명<i class="require"><em>필수입력</em></i></label></th>
	                            <td>
	                                <input type="text" class="text large" id="PRD_MST_CD" name="PRD_MST_CD" style="width:20%" value="<c:out value="${info.COC_NM}"/>" readonly="">&nbsp;
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><label class="label">스페셜코드<i class="require"><em>필수입력</em></i></label></th>
	                            <td>
	                            	<c:if test="${info.COC_SPC_CD eq null or empty info.COC_SPC_CD}">
	                            		<span>"스페셜코드는 자동 생성됩니다."</span>
	                            		<small style="margin-left:10px;">2자리 영문 + 5자리 숫자</small>
	                            	</c:if>
	                            	<c:if test="${info.COC_SPC_CD ne null and !empty info.COC_SPC_CD }">
	                                	<c:out value="${info.COC_SPC_CD}"/>
	                                </c:if>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><label class="label">제휴사설명</label></th>
	                            <td>
	                                <input type="text " class="text xlarge" name="COC_DES" value="<c:out value="${info.COC_DES}"/>"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
	                            <td>
	                                <input type="radio"	id="stateB" name="COC_USE_YN" class="radio" <c:if test="${info.COC_USE_YN eq 'Y'}">checked</c:if>  value="Y" />
	                                <label for="stateB">사용</label>
	                                <input type="radio" id="stateC" name="COC_USE_YN" class="radio" <c:if test="${info.COC_USE_YN eq 'N'}">checked</c:if> value="N" />
	                                <label for="stateC">미사용</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </div>
	            <input type="hidden" name="COC_IDX" value="<c:out value="${commandMap.COC_IDX }"/>"/>
	            <div class="section-button">
	                <div class="wrap text-center">
	                	<a href="#none" id="goList" class="button primary"><span>목록</span></a>
	                    <a href="#none" id="goRegist" class="button primary"><span>저장</span></a>
	                </div>
	            </div>
            </form>
        </div>

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
	
	var $frm = $("#frm");
	
	// 폼체크
	$frm.validate({
		rules : {
			COC_USE_YN : {required:true}
		},
		messages : {
			COC_USE_YN:{required:"[사용여부]는 필수 입력사항입니다."}
		}
	});
	
	// 목록 버튼 클릭 이벤트
	$(document).on("click", "#goList", function() {
		$("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/member/affiliateList.do", "target" : "_self", "method" : "post"}).submit();
	});
	
	// 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	if($frm.valid()){
    		if (confirm( "저장 하시겠습니까?")) {
				$frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/affiliateEditSubmit.do", "target":"_self", "method":"post"}).submit();
			}
    	}
    });
});
//-->
</script>

</body>
</html>
