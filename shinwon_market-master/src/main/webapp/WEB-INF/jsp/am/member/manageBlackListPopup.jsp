<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<div id="container" style="margin:0px;"><!-- container -->

	<div id="contents"><!-- contents -->

		<div class="title-box">
			<h4 class="title">블랙리스트 관리</h4>
		</div>

		<form id="frm" name="frm">
		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }" />" />
		<input type="hidden" name="RST_YN" value="<c:out value="${commandMap.RST_YN }" />" />	
		<input type="hidden" name="MEM_BLK_RSN" id="MEM_BLK_RSN" value=""/>
		<input type="hidden" name="MEM_MST_BLK_YN" id="MEM_MST_BLK_YN" value=""/>
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
							<input type="radio" class="radio" id="stop1" name="MEM_BLK_CD" value="1"/><label for="stop1"> 일시정지&nbsp;&nbsp;</label>
							<input type="radio" class="radio" id="stop2" name="MEM_BLK_CD" value="2"/><label for="stop2"> 영구정지&nbsp;&nbsp;</label>
							<input type="radio" class="radio" id="clear" name="MEM_BLK_CD" value="3"/><label for="clear"> 해제</label>
						</td>
					</tr>
					<tr id="defaultReason">
						<th>사유선택 <em class="strong">*</em></th>
						<td class="left">
							<select class="select" id="defaultReason">
                                <option value="">선택</option>
                            </select>
                        </td>
					</tr>
					<tr id="stopDt">
						<th>일시정지<br/>기간 <em class="strong">*</em></th>
						<td class="left">
							<input type="text" name="MEM_BLK_ST" id="stopStDt" class="text datepicker p-datepicker" /> ~
                            <input type="text" name="MEM_BLK_ED" id="stopEdDt" class="text datepicker p-datepicker" />
						</td>
					</tr>
					<tr id="stopReason">
						<th>사유선택 <em class="strong">*</em></th>
						<td class="left">
							<select class="select" id="STOP_RSN">
                                <option value="">선택</option>
                                <c:if test="${not empty codes.MEMBER_STOP_REASON }">
                                    <c:forEach var="stopReasonRow" items="${codes.MEMBER_STOP_REASON }">                                    	
                                        <option value="<c:out value="${stopReasonRow.CMN_COM_IDX }"/>"><c:out value="${stopReasonRow.CMN_COM_NM }"/></option>
                                    </c:forEach>
                                </c:if>
                           	</select>
						</td>
					</tr>
					<tr id="clearReason">
						<th>사유선택 <em class="strong">*</em></th>
						<td class="left">
							<select class="select" id="STOP_CLEAR_RSN">
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
							<input type="text" class="text" name="MEM_BLK_MEMO" id="MEM_BLK_MEMO" maxlength="20" placeholder="20자이내" style="width:90%;"/>
							<input type="text" style="display:none;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // row list -->
		
		<div class="section-button"><!-- section button -->
	        <a href="javascript:;" id="goRegist" class="button button-b"><span>저장</span></a>
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
	$("#stopReason").hide(); 
	$("#clearReason").hide();
	$("#stopDt").hide();	// 일시정지 기간 숨기기(기본값)
	
	// 블랙리스트 관리 구분 값 변경 이벤트
	$(document).on("change","input[name='MEM_BLK_CD']", function(){
		var blackListTypeVal = $("input[name='MEM_BLK_CD']:checked").val();

		$("#STOP_RSN").val("");
		$("#STOP_CLEAR_RSN").val("");
		
		// 일시정지
		if(blackListTypeVal == "1"){
			$("#stopDt").show();	// 일시정지 기간
			$("#stopReason").show(); // 정지 사유선택
			$("#clearReason").hide(); // 해지 사유선택
			$("#defaultReason").hide(); // 기본 사유선택
		}
		// 영구정지
		else if(blackListTypeVal == "2"){
			$("#stopDt").hide();	// 일시정지 기간
			$("#stopReason").show(); // 정지 사유선택
			$("#clearReason").hide(); // 해지 사유선택
			$("#defaultReason").hide(); // 기본 사유선택
		}
		// 해제
		else if(blackListTypeVal == "3"){
			$("#stopDt").hide();	// 일시정지 기간
			$("#stopReason").hide(); // 정지 사유선택
			$("#clearReason").show(); // 해지 사유선택
			$("#defaultReason").hide(); // 기본 사유선택
		}
	});
	
	// 등록 이벤트
	$(document).on("click", "#goRegist", function () 
	{
		var checkType = $("input[name='MEM_BLK_CD']").is(":checked");
		// 구분 값 선택 체크
		if(! checkType){
			alert("[구분]은 필수 선택사항입니다.");
			$("input[name='MEM_BLK_CD']").eq(0).focus();
			return;
		}
		else{
			var checkedTypeVal = $("input[name='MEM_BLK_CD']:checked").val();
			
			//일시정지
			if(checkedTypeVal == "1"){
				if($("#stopStDt").val() == "" || $("#stopEdDt").val() == ""){
					alert("[일시정지기간]은 필수 선택사항입니다.");
					return;
				}
				
				if($("#STOP_RSN").val() == ""){
					alert("[사유선택]는 필수 선택사항입니다.");
					$("#STOP_RSN").focus();
					return;
				}
				
				$("#MEM_BLK_RSN").val($("#stopReason option:selected").val());
				$("#MEM_MST_BLK_YN").val("Y");
			}
			// 영구정지
			else if(checkedTypeVal == "2"){
				if($("#STOP_RSN").val() == ""){
					alert("[사유선택]는 필수 선택사항입니다.");
					$("#STOP_RSN").focus();
					return;
				}
				
				$("#MEM_BLK_RSN").val($("#stopReason option:selected").val());
				$("#MEM_MST_BLK_YN").val("Y");
			}
			// 해제
			else if(checkedTypeVal == "3"){
				if($("#STOP_CLEAR_RSN").val() == ""){
					alert("[사유선택]는 필수 선택사항입니다.");
					$("#STOP_CLEAR_RSN").focus();
					return;
				}
				
				$("#MEM_BLK_RSN").val($("#clearReason option:selected").val());
				$("#MEM_MST_BLK_YN").val("N");
			}
		}
		
		if (confirm( "저장 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/member/manageBlackListPopupRegist.do", "target":"_self", "method":"post"}).submit();
        }			
	});
	
});
</script>
</body>
</html>
