<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<div id="container" style="margin:0px;"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">수수료 변경</h4>
		</div>

		<form id="frm" name="frm">
		<input type="hidden" name="PRD_MST_VDR_IDX" value="<c:out value="${commandMap.PRD_MST_VDR_IDX }" />" />
		
		<div class="table-a"><!-- row list -->
			<table class="core">
				<colgroup>
					<col style="width: 30%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>현재 수수료 <em class="strong">*</em></th>
						<td>
							<c:out value="${not empty commandMap.VDR_MST_FEE ? commandMap.VDR_MST_FEE : 0 }"/> %
						</td>
					</tr>
					<tr>
						<th>변경할 수수료 <em class="strong">*</em></th>
						<td>
							<input type="text" name="VDR_MST_FEE" id="VDR_MST_FEE" class="text short number" maxlength="2"/> %
							<input type="text" name="hiddenText" id="hiddenText" style="display:none;"/>
                        </td>
					</tr>
				</tbody>
			</table>
		</div><!-- // row list -->
		
		<div class="section-button"><!-- section button -->
	        <a href="javascript:;" id="goRegist" class="button button-b"><span>저장</span></a>
	        <a href="javascript:self.close();" class="button button-a"><span>취소</span></a>
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
		if($("#VDR_MST_FEE").val() == ""){
			alert("변경할 수수료를 입력하세요.");
			$("#VDR_MST_FEE").focus();
			return;
		}
		
		if($("#VDR_MST_FEE").val() == "${commandMap.VDR_MST_FEE}"){
			alert("기존 수수료와 동일합니다.\n변경이 불가능합니다.");
			$("#VDR_MST_FEE").focus();
			return;
		}
		
		if("${commandMap.VDR_MST_FEE}" == "" && $("#VDR_MST_FEE").val() == 0){
			alert("변경할 수수료는 0보다 커야합니다.");
			$("#VDR_MST_FEE").focus();
			return;
		}
		
		if (confirm( "저장 하시겠습니까?")) {
			$.ajax({
	            async : false,
	            type : "POST",
	            data : $("#frm").serialize(),
	            url : "<c:out value="${serverDomain}" />/am/site/changeFeePopupRegistAjax.do",
	            success : function (data) {
	                if(data.successYn == "Y")
	                {
	                    alert(data.resultMsg);
	                    opener.parent.location.reload();
	                    window.close();
	                }
	                else
	                {
	                    alert("데이터 전송중 데이터가 누락 되었습니다./n다시 시도해 주십시오.");
	                    return;
	                }
	            },
	            error : function () {
	                alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
	            }
	        });
        }			
	});
	
});
</script>
</body>
</html>
