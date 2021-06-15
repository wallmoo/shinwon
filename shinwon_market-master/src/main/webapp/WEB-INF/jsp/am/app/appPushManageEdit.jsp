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

                <h3 class="title"><span>수정</span></h3>
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
                	<input type="hidden" name="APP_PSH_IDX" id="APP_PSH_IDX" value="<c:out value="${row.APP_PSH_IDX }"/>" /> 
                   	<input type="hidden" name="searchAppPshTitle" value="<c:out value="${commandMap.searchAppPshTitle }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchAppPshUseYn" value="<c:out value="${commandMap.searchAppPshUseYn }"/>"/>     
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>  
					
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>상태</span></label></th>
	                    		<td>
	                    			<input type="radio" name="APP_PSH_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.APP_PSH_USE_YN eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="APP_PSH_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.APP_PSH_USE_YN eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미사용</label>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>제목 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="APP_PSH_TITLE" id="APP_PSH_TITLE" placeholder="최대20자까지 입력하실 수 있습니다." class="text xlarge" maxlength="20" value="${row.APP_PSH_TITLE }"/>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>안드로이드 전송이미지 <i class="require"><em>필수입력</em></i></span></label><small style="margin-top:-5px;margin-left:7px;">(540*280)</small></th>
	                    		<td>
	                    			<c:forEach items="${fileList}" var="fileRow" varStatus="i">
		                            	<i class="icon-file"></i>
				                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
				                        	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
				                        </a>
										<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
	                   					<label for="CMM_FLE_IDX">삭제</label>
		                            </c:forEach>
		                            <input type="file" class="file" name="file" id="file"/>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>URL<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text xlarge" id="APP_PSH_URL" name="APP_PSH_URL" maxlength="100" value="${row.APP_PSH_URL }" onkeyup="getStrByte(this,'#byte', 100, 1);" />
		                            <span style="float:right;">(<span id="byte">0</span>/100byte)</span> 
		                            <br/>
		                            <small class="desc">※도메인을제외하고 “/” 부터 입력하고 실제 모바일 페이지의 링크를 적어주세요.</small>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>발송예정일</span></label></th>
	                    		<td>
	                    			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="APP_PSH_DT" name="APP_PSH_DT" readonly="readonly" value="<ui:formatDate value="${row.APP_PSH_DT }" pattern="yyyy-MM-dd"/>"/>
		                            <select id="APP_PSH_HH" name="APP_PSH_HH" >
		                            	<option value="">선택</option>
		                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                            		<c:set var="hh" value="${i.index}"/>
		                            		<c:if test="${i.index < 10}">
		                            			<c:set var="hh" value="0${i.index}"/>
		                            		</c:if>
		                            		<option value="${hh}" <c:if test="${hh eq row.APP_PSH_HH}">selected</c:if>>${hh}</option>
		                            	</c:forEach>
		                            </select>&nbsp;시&nbsp;&nbsp;(날짜형식: YYYY-MM-DD)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>발송건수</span></label></th>
	                    		<td>
	                    			<c:out value="${not empty row.APP_PSH_SND_CNT ? row.APP_PSH_SND_CNT : 0 }"/>&nbsp;건
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
	//화면 로딩후 바이트 수 체크
	getStrByte(document.getElementById("APP_PSH_URL"),'#byte', 100, 1, "Y");
	// 100자 체크
	$(document).on("keyup","#APP_PSH_URL",function(){
		getStrByte(this,'#byte', 100, 1);
	});
	
	var $frm = $("#frm"); 
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/app/appPushManageList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
  	//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
	$(".cmmFleIdx").each(function(){
        var fileName = $(this).data("file_name");
        $("input[name='"+ fileName +"']").prop("disabled", true);
	});
  	
	// 파일 삭제 check box 변경 이벤트
    $(document).on("change", ".cmmFleIdx", function () {
        var $this = $(this);
        var fileName = $(this).data("file_name");
        
        if($this.is(":checked"))
        {
            $("input[name='"+ fileName +"']").prop("disabled", false);    
        }
        else
        {
        	$("input[name='"+ fileName +"']").val("");
            $("input[name='"+ fileName +"']").prop("disabled", true);
        }
    }); 
  	
	//파일 삭제를 위한 체크박스 클릭 이벤트
	$(".cmmFleIdx").click(function(){
		var cmmFleIdx = "";
		$("input[name='CMM_FLE_IDX']:checked").each(function(){
			cmmFleIdx = cmmFleIdx + $(this).val() + ",";
		});
		$("input[name='cmmFleIdx']").val(cmmFleIdx);		
	});
    
    // 수정 이벤트
    $(document).on("click", "#goRegist", function () {
       
    	if($.trim($("#APP_PSH_TITLE").val()) == ""){
    		alert("제목을 입력해주세요.");
    		$("#APP_PSH_TITLE").focus();
    		return;
    	}
    	
    	//새로 첨부한 이미지
		var file = $("#file").val();
		//기존 첨부된 이미지
		var oldFile = $("#CMM_FLE_IDX").length;

		//새로운 첨부파일도 없고 기존 파일도 없는 경우 || 새로운 첨부파일 없는데 기존 파일 삭제한 경우
		if((file == "" && oldFile == 0) || (file == "" && oldFile > 0 && $("#CMM_FLE_IDX").is(":checked") == true)){
			alert("안드로이드용 이미지를 등록해주세요.");
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
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/app/appPushManageModify.do", "target":"_self", "method":"post"}).submit();
        }
    });
});
//-->
</script>

</body>
</html>
