<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta id="viewport" name="viewport" content="initial-scale=1.0, width=device-width, minimum-scale=1.0">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>신원몰 | 비밀번호 변경안내 </title>
    <link rel='shortcut icon' href="/nas/cdn/MW/images/common/ico/favicon.ico" type="image/x-ico">
    <!-- <link rel="stylesheet" href="/nas/cdn/MW/css/common.css"> -->
    <link rel="stylesheet" href="/nas/cdn/MW/css/style.css">
    <script src="/nas/cdn/MW/js/jquery-1.12.4.js"></script>
    <script src="/nas/cdn/MW/js/jquery.easing.1.3.js"></script>
    <script src="/nas/cdn/MW/js/webfont.js"></script>
    <script src="/nas/cdn/MW/js/ui_common.js"></script>
    <script src="/nas/cdn/MW/js/jquery.dotdotdot.min.js"></script>
    
     <!-- #wrap -->
    <div id="wrap" class="popup full">
        <!-- #header -->
        <header id="header" class="pop">
            <!-- .header_top -->
            <div class="header_top">
                <h1>비밀번호 변경안내</h1>
                <button type="button" class="btn_close" onclick="popupfull">닫기</button>
            </div>
            <!-- // .header_top -->
        </header>
        <!-- // #header -->

        <!-- #container -->
        <div id="container">
            <!-- #content_area -->
           <form id="frm" name="frm">
           <input type="hidden" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>">
            <div id="content_area">
                <div class="scroll_area">
                    <div class="cp02">
                        <div class="notice_bx">
                            <div class="inr">
                                <p class="tit">소중한 개인정보 보호를 위하여<br>회원님의 비밀번호를<br>변경해 주세요.</p>
                                <p class="txt">회원님은 현재 장기간 동일한 비밀번호를 사용 중이십니다.
                                신원몰에서는 고객님의 소중한 개인정보 보호를 위하여
                                비밀번호 변경 안내를 드리고 있습니다. 정기적인 비밀번호
                                변경을 통해 소중한 개인정보를 보호해 주세요.
                                </p>
                            </div>
                        </div>
                		
                        <div class="writeWrap fix"> <!-- class fix 추가-->
                            <div class="name">기존 비밀번호</div>
                            <div class="form">
                                <input type="password" id="MEM_MST_PW_OLD" name="MEM_MST_PW_OLD"	title="기존 비밀번호 입력" placeholder="기존 비밀번호 입력">
                            </div>
                            <div class="name">새 비밀번호</div>
                            <div class="form">
                                <input type="password" id="MEM_MST_PW"	name="MEM_MST_PW"	title="새 비밀번호 입력" placeholder="새 비밀번호 입력">
                            </div>
                            <div class="name">새 비밀번호 확인</div>
                            <div class="form">
                                <input type="password" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE"	title="새 비밀번호 확인 입력" placeholder="새 비밀번호 확인 입력">
                                <p class="t_desc">영문, 숫자, 특수문자 포함 8 ~ 15자 입력</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_area dual fix">
                    <button onclick="goPwSkip()" class="btn black">다음에 변경</button>
                    <button onclick="goChangePw()"	class="btn ok">변경</button>
                </div>
            </div>
            </form>
            <form id="frm2" name="frm2"></form>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
        
    </div>
    <!-- // #wrap -->
    <script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="/nas/cdn/pc/js/jquery.validate.js"></script>

<script>
	$(function () {
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
				
				$frm.attr({"action":"<c:out value="${frontDomain}" />/mobile/manager/memberPasswordChange.do", "target":"_self", "method":"post"}).submit();
			}
		};
		
		goPwSkip = function(){
			$frm2.attr({"action":"<c:out value="${frontDomain}" />/mobile/manager/pwskip.do", "target":"_self", "method":"post"}).submit();
		};
		
		
	});
</script>
