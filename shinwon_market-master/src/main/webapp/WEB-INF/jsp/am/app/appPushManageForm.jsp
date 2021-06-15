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

                <h2 class="title"><span>APP 푸시관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="searchAppPshTitle" value="<c:out value="${commandMap.searchAppPshTitle }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchAppPshUseYn" value="<c:out value="${commandMap.searchAppPshUseYn }"/>"/>     
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
				</form>
                
                <form id="frm" name="frm" enctype="multipart/form-data"> 
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<input type="radio" name="APP_PSH_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="APP_PSH_USE_YN" id="stateB" value="N" class="radio" />
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>제목 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="APP_PSH_TITLE" id="APP_PSH_TITLE" placeholder="최대20자까지 입력하실 수 있습니다." class="text xlarge" maxlength="20"/>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>안드로이드 전송이미지 <i class="require"><em>필수입력</em></i></span></label><small style="margin-top:-5px;margin-left:7px;">(540*280)</small></th>
	                    		<td>
	                    			<input type="file" class="file" name="file" id="file"/>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>URL<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text xlarge" id="APP_PSH_URL" name="APP_PSH_URL" maxlength="100" onkeyup="getStrByte(this,'#byte', 100, 1);" placeholder="최대 100byte까지 입력하실 수 있습니다." />
		                            <span style="float:right;">(<span id="byte">0</span>/100byte)</span>
		                            <br/> 
		                            <small class="desc">※도메인을제외하고 “/” 부터 입력하고 실제 모바일 페이지의 링크를 적어주세요.</small>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>발송예정일</span></label></th>
	                    		<td>
	                    			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="APP_PSH_DT" name="APP_PSH_DT" readonly="readonly"/>
		                            <select id="APP_PSH_HH" name="APP_PSH_HH" >
		                            	<option value="">선택</option>
		                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                            		<c:set var="hh" value="${i.index}"/>
		                            		<c:if test="${i.index < 10}">
		                            			<c:set var="hh" value="0${i.index}"/>
		                            		</c:if>
		                            		<option value="${hh}" <c:if test="${hh eq '00' }">selected</c:if>>${hh}</option>
		                            	</c:forEach>
		                            </select>&nbsp;시
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
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/app/appPushManageList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
       
    	if($.trim($("#APP_PSH_TITLE").val()) == ""){
    		alert("제목을 입력해주세요.");
    		$("#APP_PSH_TITLE").focus();
    		return;
    	}
    	
    	if($("#file").val() == ""){
			alert("안드로이드용 이미지를 등록해주세요.");
			$("#file").focus();
			return;
    	}
    	
    	if($.trim($("#APP_PSH_URL").val()) == ""){
    		alert("URL을 입력해주세요.");
    		$("#APP_PSH_URL").focus();
    		return;	
    	}
    	
    	if($.trim($("#APP_PSH_DT").val()) == ""){
			alert("발송예정일을 입력해주세요.");
			$("#APP_PSH_DT").focus();
			return;
		}
    	if($.trim($("#APP_PSH_HH").val()) == ""){
			alert("발송예정일 시간을 선택해주세요.");
			$("#APP_PSH_HH").focus();
			return;
		}
    	
        if (confirm( "저장 하시겠습니까?")) {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/app/appPushManageRegist.do", "target":"_self", "method":"post"}).submit();
        }
    });
});
//-->
</script>

</body>
</html>
