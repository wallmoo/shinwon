<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
        <!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>회원정보수정</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="tab-a" data-role="navbar"><!-- tab-a -->
	            <ul>
	                <li><a href="javascript:goMyInfoEdit();" class="_pg_link" target="_self">기본정보 변경</a></li>
	                <li class="active"><a href="javascript:;">비밀번호 변경</a><span class="blind">현재위치</span></li>
	            </ul>
	        </div><!-- // tab-a -->
	        
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>새로운 비밀번호로 변경하실 수 있습니다.</li>
	                <li>개인정보 보호를 위해 주기적인 비밀번호 변경을 바랍니다.</li>
	            </ul>
	        </div>
	
	        <form id="frm" name="frm">
		        <input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
		        <ul class="form-a password-change"><!-- form-a -->
		            <li>
		                <div class="tit">
		                    <label for="pw1">변경할<br />비밀번호<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <input type="password" id="MEM_MST_PW" name="MEM_MST_PW" class="text" maxlength="15" 
	                           		data-err_msg_id="memPw" onkeydown="javascript:deleteCheckMsg();"/>
		                    <ul class="list list-a desc mt10">
		                        <li>띄어쓰기 없이 6~15자 영문,숫자,특수문자 조합으로 입력해주세요.</li>
		                        <li>아이디와 동일한 비밀번호는 사용을 자제해주세요.</li>
		                    </ul>
		                    <p class="message" id="memPw"></p>
	                        <p class="message" id="memPwCheck"></p>
		                </div>
		            </li>
		            <li>
		                <div class="tit">
		                    <label for="pw2">비밀번호<br />확인<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <input type="password" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE" class="text" maxlength="15" data-err_msg_id="memPwRe"/>
		                    <p class="mt10 desc">
	                        	비밀번호 확인을 위해 다시 한번 입력해주세요. 
		                    </p>
		                    <p class="message" id="memPwRe"></p>
		                </div>
		            </li>
		        </ul><!-- // form-a -->
	        </form>
	        
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:goPwdModify();" class="button warning"><span>수정</span></a>
	            <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do','_self');" class="button primary _pg_link"><span>취소</span></a>
	        </div><!-- // section-button -->
	            
	    </article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->
	<form id="changeFrm" name="changeFrm">
	</form>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	var $frm = $("#frm");
	
	// 폼체크
    $frm.validate(
    {
        rules: 
        {
            MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, // 비밀번호
            MEM_MST_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#MEM_MST_PW"} // 비밀번호 확인
        },
        messages :
        {
        	MEM_MST_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
        	MEM_MST_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."}
        }
    });
	
	// 비밀번호 수정 클릭 이벤트
	goPwdModify = function(){
		if($frm.valid()){
			
			// 비밀번호와 아이디가 같은지 체크
       		if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW").val()){
       			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
       			$("#MEM_MST_PW").focus();
       			return;
       		}
			
			if (confirm( "비밀번호를 변경하시겠습니까?")) {
                $frm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myPwdModify.do", "target":"_self", "method":"post"}).submit();
            }  
		}
	};
	
	// 기본정보 수정 클릭 이벤트
	goMyInfoEdit = function(){
		$("#changeFrm").attr({"action":"<c:out value="${mobileSslDomain }"/>/mobile/mypage/myInfoEditForm.do", "target":"_self", "method":"post"}).submit();
	};
	
	// 비밀번호의 체크 메세지 초기화
    deleteCheckMsg = function(){
    	$("#memPwCheck").html("");
    	
    };	
});
//]]>
</script>
</body>
</html>