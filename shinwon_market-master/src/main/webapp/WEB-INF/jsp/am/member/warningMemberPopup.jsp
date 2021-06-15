<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<div id="container" style="margin:0px;"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">경고 관리</h4>
		</div>

		<form id="frm" name="frm">
		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }" />" />
		<input type="hidden" name="RST_YN" value="<c:out value="${commandMap.RST_YN }" />" />
		<input type="hidden" name="MEM_CUT_RSN" id="MEM_CUT_RSN" value=""/>
		<input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${commandMap.MEM_MST_MEM_GBN }" />" />
		
		<div class="table-a"><!-- row list -->
			<table class="core">
				<colgroup>
					<col style="width: 30%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>구분 <em class="strong">*</em></th>
						<td class="left">
							<input type="radio" class="radio" id="warning1" name="MEM_CUT_CD" value="1"/><label for="warning1"> 1차경고&nbsp;&nbsp;</label>
							<input type="radio" class="radio" id="warning2" name="MEM_CUT_CD" value="2"/><label for="warning2"> 2차경고&nbsp;&nbsp;</label>
							<input type="radio" class="radio" id="warning3" name="MEM_CUT_CD" value="3"/><label for="warning3"> 3차경고&nbsp;&nbsp;</label>
							<input type="radio" class="radio" id="clear" name="MEM_CUT_CD" value="4"/><label for="clear"> 경고해제&nbsp;&nbsp;</label>
						</td>
					</tr>
					<tr>
						<th>사유선택 <em class="strong">*</em></th>
						<td class="left">
							<select class="select" id="DEFAULT_CUT_RSN">
								<option value="">선택</option>
                           	</select>
							<select class="select" id="CUT_RSN">
								<option value="">선택</option>
                                <c:if test="${not empty codes.MEMBER_WARNING_REASON }">
                                    <c:forEach var="warningReasonRow" items="${codes.MEMBER_WARNING_REASON}">                                    	
                                        <option value="<c:out value="${warningReasonRow.CMN_COM_IDX }"/>"><c:out value="${warningReasonRow.CMN_COM_NM }"/></option>
                                    </c:forEach>
                                </c:if>
                           	</select>
                           	<select class="select" id="CUT_CLEAR_RSN">
                                <option value="">선택</option>
                                <c:if test="${not empty codes.MEMBER_CLEAR_REASON }">
                                    <c:forEach var="clearReasonRow" items="${codes.MEMBER_CLEAR_REASON }">                                    	
                                        <option value="<c:out value="${clearReasonRow.CMN_COM_IDX }"/>"><c:out value="${clearReasonRow.CMN_COM_NM }"/></option>
                                    </c:forEach>
                                </c:if>
                           	</select>
						</td>
					</tr>
					<tr>
						<th>관리자메모</th>
						<td class="left">
							<input type="text" class="text" name="MEM_CUT_MEMO" id="MEM_CUT_MEMO" maxlength="20" placeholder="20자이내" style="width:90%;"/>
							<input type="text" style="display:none;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // row list -->
		</form>
		
		<div class="section-button"><!-- section button -->
	        <a href="javascript:;" id="goRegist" class="button button-b"><span>저장</span></a>
        </div><!-- // section button -->  

	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(function()
{
	$("#DEFAULT_CUT_RSN").show();
	$("#CUT_RSN").hide();
	$("#CUT_CLEAR_RSN").hide();
	
	// 구분 변경 이벤트
	$(document).on("change","input[name='MEM_CUT_CD']",function(){
		
		// 사유선택 초기화
		$("#CUT_RSN").val("");	
		$("#CUT_CLEAR_RSN").val("");
		
		var MEM_CUT_CD = $("input[name='MEM_CUT_CD']:checked").val();
		
		if(MEM_CUT_CD == "4"){
			$("#CUT_RSN").hide();
			$("#CUT_CLEAR_RSN").show();
			$("#DEFAULT_CUT_RSN").hide();
		}
		else{
			$("#CUT_RSN").show();
			$("#CUT_CLEAR_RSN").hide();
			$("#DEFAULT_CUT_RSN").hide();
		}
	});
		
	// 등록 이벤트
	$(document).on("click", "#goRegist", function () 
	{
		var MEM_CUT_CD = $("input[name='MEM_CUT_CD']:checked").val();
		
		if(! $("input[name='MEM_CUT_CD']").is(":checked")){
			alert("[구분]은 필수 선택사항입니다.");
			$("input[name='MEM_CUT_CD']").eq(0).focus();
			return;
		}	
		
		// 구분 값에 따른 사유 선택 
		if(MEM_CUT_CD == "4"){
			if($("#CUT_CLEAR_RSN").val() == ""){
				alert("[사유선택]는 필수 선택사항입니다.");
				$("#CUT_CLEAR_RSN").focus();
				return;
			}
			
			$("#MEM_CUT_RSN").val($("#CUT_CLEAR_RSN option:selected").val());				
		}
		else{
			if($("#CUT_RSN").val() == ""){
				alert("[사유선택]는 필수 선택사항입니다.");
				$("#CUT_RSN").focus();
				return;
			}
			
			$("#MEM_CUT_RSN").val($("#CUT_RSN option:selected").val());
		}

		if (confirm( "저장 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/warningMemberPopupRegist.do", "target":"_self", "method":"post"}).submit();
        }			
	});
	
});
</script>
</body>
</html>
