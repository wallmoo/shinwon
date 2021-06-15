<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<div id="container" style="margin:0px;"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">직권탈퇴 관리</h4>
		</div>

		<form id="frm" name="frm">
		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }" />" />
		<input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${commandMap.MEM_MST_MEM_GBN }"/>"/>
		<input type="hidden" name="RST_YN" value="<c:out value="${commandMap.RST_YN }" />" />	
		<input type="hidden" name="MEM_MST_JOI_RTE" value="<c:out value="${commandMap.MEM_MST_JOI_RTE }"/>"/>
		<input type="hidden" name="MEM_MST_ERP_YN" value="<c:out value="${commandMap.MEM_MST_ERP_YN }"/>"/>
		<input type="hidden" name="MEM_MST_ERP_ID" value="<c:out value="${commandMap.MEM_MST_ERP_ID }"/>"/>
		
		<div class="table-a"><!-- row list -->
			<table class="core">
				<colgroup>
					<col style="width: 30%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>사유선택 <em class="strong">*</em></th>
						<td class="left">
							<select class="select" name="MEM_MST_OUT_RSN" id="MEM_MST_OUT_RSN">
								<option value="">선택</option>
                                <c:if test="${not empty authSecReasonList }">
                                    <c:forEach var="authSecReasonRow" items="${authSecReasonList}">                                    	
                                        <option value="<c:out value="${authSecReasonRow.CMN_COM_IDX }"/>"><c:out value="${authSecReasonRow.CMN_COM_NM }"/></option>
                                    </c:forEach>
                                </c:if>
                           	</select>
						</td>
					</tr>
					<tr>
						<th>관리자메모</th>
						<td class="left">
							<input type="text" class="text" name="MEM_MST_OUT_MEMO" id="MEM_MST_OUT_MEMO" maxlength="20" placeholder="20자이내" style="width:90%;"/>
							<input type="text" style="display:none;"/>	
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // row list -->
		
		<div class="section-button"><!-- section button -->
	        <a href="javascript:;" id="goRegist" class="button button-b"><span>즉시 탈퇴처리</span></a>
        </div><!-- // section button -->  
	
		</form>

	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(function()
{
	// 등록 이벤트
	$(document).on("click", "#goRegist", function () 
	{
		if($("#MEM_MST_OUT_RSN").val() == ""){
			alert("[사유선택]는 필수 선택사항입니다.");
			$("#MEM_MST_OUT_RSN").focus();
			return;
		}
		
		if (confirm( "즉시 탈퇴처리 '확인' 버튼을 클릭하면 회원정보가 바로 삭제됩니다.\n즉시 탈퇴처리를 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/authSecessionPopupRegist.do", "target":"_self", "method":"post"}).submit();
        }			
	});
	
});
</script>
</body>
</html>
