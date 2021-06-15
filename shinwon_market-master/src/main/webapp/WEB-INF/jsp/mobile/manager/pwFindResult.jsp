<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/topPwFind.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
                <!-- // #snb -->

                <div class="cp01">
                    <div class="writeWrap">
                    	<form id="dataForm" name="dataForm">
							<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
                        <div class="name">비밀번호</div>
                        <div class="form">
                            <input type="password" title="비밀번호 입력" placeholder="비밀번호 입력" id="MEM_MST_PW" name="MEM_MST_PW" data-err_msg_id="pwErr">
                            <p class="t_desc" id="pwErr">영문, 숫자, 특수문자 포함 8 ~ 15자 입력</p>
                        </div>
                        <!-- 에러일 경우 error클래스 추가 -->
                        <div class="name error">비밀번호 확인</div>
                        <div class="form">
                            <input type="password" class="error" title="비밀번호 입력" placeholder="비밀번호 입력" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE">
                            <p class="t_error" id="pwChkErr"></p>
                        </div>
                    </div>
                    <div class="btn_area dual">
                        <button type="button" class="btn gray" id="goCancel">취소</button>
                        <button type="button" class="btn ok" onclick="goChangePw()">변경</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script>

	$(function () {
		var $dataForm = $("#dataForm");
		
		// 폼체크
	    $dataForm.validate({
	        rules: {
	        	MEM_MST_PW:{required:true, minlength:8, maxlength:15, etlandPw:true}, // 비밀번호
	            MEM_MST_PW_RE:{required:true, minlength:8, maxlength:15, equalTo:"#MEM_MST_PW"} // 비밀번호 확인
	        },
	        messages :{
	        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 8글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."},
	        	MEM_MST_PW_RE: {required:"비밀번호확인을 입력해주세요.",minlength:"비밀번호 확인은 최소 8글자 이상입니다.", maxlength:"비밀번호 확인은 최대 15글자입니다.",equalTo: "비밀번호가 일치하지 않습니다."}
	        }
	    });
		
	    goChangePw = function(){
			if($dataForm.valid()){
				if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW").val()){
					alert("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
	    			$("#MEM_MST_PW").focus();
	    			return;
				}
				$dataForm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/manager/changeMemPw.do", "target":"_self", "method":"post"}).submit();
			}
		}
	    
	    $("#goCancel").on("click", function () {
			location.href = "<c:out value="${mobileDomain}" />/mobile/manager/login.do";
		})
		
	});
</script>

