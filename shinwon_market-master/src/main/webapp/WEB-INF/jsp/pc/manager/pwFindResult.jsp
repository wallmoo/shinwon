<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

<script>
	window.history.forward(); 
</script>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">비밀번호 재설정</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<div class="table_wrap">
					<form id="dataForm" name="dataForm">
						<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
						
						<table class="tb_row">
							<caption>비밀번호 재설정 : 새 비밀번호, 새 비밀번호 확인 입력 표입니다.</caption>
							<colgroup>
								<col style="width:20%">
								<col style="width:auto">
							</colgroup>
							<tbody>
	
								<tr>
									<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 새 비밀번호</th>
									<td>
										<input type="password" id="MEM_MST_PW" name="MEM_MST_PW" placeholder="비밀번호 입력" class="w602" data-err_msg_id="pwErr">
										<em class="txt_note">영문, 숫자, 특수문자 포함 8~15자 입력</em>
										<span class="txt_error" id="pwErr"></span>
									</td>
								</tr>
								<tr>
									<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 새 비밀번호 확인</th>
									<td>
										<input type="password" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE" placeholder="비밀번호 재입력" class="w602" data-err_msg_id="pwChkErr">
										<span class="txt_error" id="pwChkErr"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="btn_wrap">
					<button class="btn_large" id="goCancel">취소</button>
					<button onclick="goChangePw()" class="btn_large ok">변경하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
<script>
$(function(){
	var $dataForm = $("#dataForm");
	
	// 폼체크
    $dataForm.validate({
        rules: {
        	MEM_MST_PW:{required:true, minlength:8, maxlength:15}, // 비밀번호
            MEM_MST_PW_RE:{required:true, minlength:8, maxlength:15, equalTo:"#MEM_MST_PW"} // 비밀번호 확인
        },
        messages :{
        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 8글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."},
        	MEM_MST_PW_RE: {required:"비밀번호확인을 입력해주세요.",minlength:"비밀번호 확인은 최소 8글자 이상입니다.", maxlength:"비밀번호 확인은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."}
        }
    });
	
	goChangePw = function(){
		if($dataForm.valid()){
			if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW").val()){
				alert("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
    			$("#MEM_MST_PW").focus();
    			return;
			}
			$dataForm.attr({"action":"<c:out value="${frontDomain}" />/pc/manager/changeMemPw.do", "target":"_self", "method":"post"}).submit();
		}
	}
	
	$("#goCancel").on("click", function () {
		location.href = "<c:out value="${frontDomain}" />/pc/manager/login.do";
	});
});
</script>