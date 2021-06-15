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

                <h2 class="title"><span>APP 버전관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm">
           			<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
    				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                </form>
                
                <form id="frm" name="frm"> 
                	<input type="hidden" name="APP_VER_IDX" id="APP_VER_IDX" value="<c:out value="${appVersionManageInfo.APP_VER_IDX }"/>"/>
                   	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;min-width:180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>구분</span></label></th>
	                    		<td>
	                    			<input type="radio" name="APP_VER_GBN" id="gubunA" value="A" class="radio" <c:if test="${appVersionManageInfo.APP_VER_GBN eq 'A' }">checked="checked"</c:if>/>
		                            <label for="gubunA">안드로이드</label>
		                            <input type="radio" name="APP_VER_GBN" id="gubunB" value="I" class="radio" <c:if test="${appVersionManageInfo.APP_VER_GBN eq 'I' }">checked="checked"</c:if>/>
		                            <label for="gubunB">IOS</label>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>제목 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="APP_VER_NM" id="APP_VER_NM" class="text xlarge" placeholder="최대 15자까지 입력하실 수 있습니다." maxlength="15" value="<c:out value="${appVersionManageInfo.APP_VER_NM }"/>"/>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>버전 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="APP_VER_NO" id="APP_VER_NO" class="text" maxlength="10" value="<c:out value="${appVersionManageInfo.APP_VER_NO }"/>"/>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea name="APP_VER_CTS" id="APP_VER_CTS" style="height: 300px;" maxlength="1800"><c:out value="${appVersionManageInfo.APP_VER_CTS }"/></textarea>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<input type="radio" name="APP_VER_YN" id="stateA" value="Y" class="radio" <c:if test="${appVersionManageInfo.APP_VER_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="APP_VER_YN" id="stateB" value="N" class="radio" <c:if test="${appVersionManageInfo.APP_VER_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                </form>
               	<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goEdit" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button --> 

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
        rules: {
    		APP_VER_GBN:{required:true}, // 구분
        	APP_VER_NM:{required:true}, // 제목
        	APP_VER_NO:{required:true}, // 버전
        	APP_VER_CTS:{required:true},// 내용
        	APP_VER_YN:{required:true}	// 사용여부
        }
    });
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/app/appVersionManageList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 수정 이벤트
    $(document).on("click", "#goEdit", function () {
       
    	if($frm.valid()){ 
        	
            if (confirm( "저장 하시겠습니까?")) {
                $frm.attr({"action":"<c:out value="${serverDomain}" />/am/app/appVersionManageModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
});
//-->
</script>

</body>
</html>
