<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

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
                <h2 class="pg_tit">비밀번호 변경 안내</h2>
            </div>
            <!--// Title -->
			
            <div class="cont_center">
                <div class="info_box">
                    <strong class="tit">소중한 개인정보 보호를 위하여<br/>회원님의 비밀번호를 변경해 주세요.</strong>
                    <ul class="info_txt">
                        <li>회원님은 현재 장기간 동일한 비밀번호를 사용 중이십니다.</li>
                        <li>쑈윈도에서는 고객님의 소중한 개인정보 보호를 위하여 비밀번호 변경<br> 안내를 드리고 있습니다.</li>
                        <li>정기적인 비밀번호 변경을 통해 소중한 개인정보를 보호해 주세요.</li>
                    </ul>
                </div>
                <form id="frm" name="frm">
                	<input type="hidden" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>">
                
	                <div class="login_form">
	                    <ul>
	                        <li><input type="password" id="MEM_MST_PW_OLD" name="MEM_MST_PW_OLD" placeholder="기존 비밀번호입력"></li>
	                        <li><input type="password" id="MEM_MST_PW" name="MEM_MST_PW" placeholder="새 비밀번호 입력"></li>
	                        <li><input type="password" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE" placeholder="새 비밀번호 재입력"></li>
	                    </ul>
	                    <p class="txt_guide">비밀번호는 영문+숫자 조합 8~20 자리</p>
	                    <div class="btn_wrap">
	                        <button onclick="goPwSkip()" class="btn_large">다음에 변경</button>
	                        <button onclick="goChangePw()" class="btn_large ok">변경</button>
	                    </div>
	                </div>
                </form>
                <form id="frm2" name="frm2"></form>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	var $frm = $("#frm");
	var $frm2 = $("#frm2");
	$frm.validate({
        rules: {
        	MEM_MST_PW:{required:true, minlength:8, maxlength:15, etlandPw:true}, // 비밀번호
            MEM_MST_PW_RE:{required:true, minlength:8, maxlength:15, equalTo:"#MEM_MST_PW"} // 비밀번호 확인
        },
        messages :{
        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 8글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."},
        	MEM_MST_PW_RE: {required:"비밀번호확인을 입력해주세요.",minlength:"비밀번호 확인은 최소 8글자 이상입니다.", maxlength:"비밀번호 확인은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."}
        }
    });
	
	goChangePw = function(){
		if($frm.valid()){
			if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW").val()){
				alert("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
    			$("#MEM_MST_PW").focus();
    			return;
			}else if ($("#MEM_MST_PW").val() == $("#MEM_MST_PW_OLD").val()){
				alert("기존 페스워드와 동일한 비밀번호는 사용하실 수 없습니다.")
				$("#MEM_MST_PW").focus();
				return;
			}else if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW_OLD").val() ){
				alert("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
    			$("#MEM_MST_PW_OLD").focus();
    			return;
			}
			
			$frm.attr({"action":"<c:out value="${frontDomain}" />/pc/manager/memberPasswordChange.do", "target":"_self", "method":"post"}).submit();
		}
	}
	
	goPwSkip = function(){
		$frm2.attr({"action":"<c:out value="${frontDomain}" />/pc/manager/pwskip.do", "target":"_self", "method":"post"}).submit();
	}
})
</script>