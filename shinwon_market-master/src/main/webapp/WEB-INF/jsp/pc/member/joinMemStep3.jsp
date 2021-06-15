<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>	
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<div id="container">
	<div id="content" class="content">
		<!-- LOCATION -->
		<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
		<!-- //LOCATION -->
		<!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
		
		<!-- Title -->
		<div class="pg_tit_wrap">
			<h2 class="pg_tit">정보입력</h2>
		</div>
		<!--// Title -->

			
		<div class="sub_content">
			<div class="join_step">
				<ol>
					<li><span>STEP 01 <strong>약관동의</strong></span></li>
					<li class="on"><span>STEP 02 <strong>정보입력</strong></span></li>
					<li><span>STEP 03 <strong>피드설정</strong></span></li>
					<li><span>STEP 04 <strong>가입완료</strong></span></li>
				</ol>
			</div>
			<form id="dataForm" name="dataForm" method="post">
				<input type="hidden" name="certType" id="certType" value="<c:out value="${commandMap.certType }"/>"/>
				<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI" value="<c:out value="${commandMap.MEM_IPN_DI }"/>"/>
				<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
				<input type="hidden" name="MEM_IPN_FGN" id="MEM_IPN_FGN" value="<c:out value="${commandMap.MEM_IPN_FGN }"/>"/>
				<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX" value="<c:out value="${commandMap.MEM_IPN_SEX }"/>"/>
				<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT" value="<c:out value="${commandMap.MEM_IPN_BIR_DT }"/>"/>
				<input type="hidden" name="MEM_IPN_RST" id="MEM_IPN_RST" value="<c:out value="${commandMap.MEM_IPN_RST }"/>"/>
				<input type="hidden" name="MEM_IPN_CRT_DT" id="MEM_IPN_CRT_DT" value="<c:out value="${commandMap.MEM_IPN_CRT_DT }"/>"/>
				<input type="hidden" name="MEM_IPN_CI" id="MEM_IPN_CI" value="<c:out value="${commandMap.MEM_IPN_CI }"/>"/>
				<input type="hidden" name="MEM_IPN_BIR_SOLAR" id="MEM_IPN_BIR_SOLAR" value=""/>
				<input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="${commandMap.MEM_SNS_TYPE}" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="${commandMap.MEM_SNS_ID}" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="${commandMap.MEM_SNS_NM}" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="${commandMap.MEM_SNS_EMAIL}" />
                <input type="hidden" name="joinType" id="joinType" value="${commandMap.joinType}" />
				<div class="table_wrap">
					<p class="required_txt">
						<span>필수입력사항</span>
					</p>
					<table class="tb_row">
						<caption>회원가입 정보입력 : 이름, 생년월일, 성별, 아이디, 비밀번호, 비밀번호 확인,
							닉네임, 휴대폰, 이메일, 이벤트 정보 수신, 제휴사 코드 입력 표입니다.</caption>
						<colgroup>
							<col style="width: 20%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>${commandMap.MEM_MST_MEM_NM}</td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td>${commandMap.MEM_IPN_BIR_DT}
									<div class="group">
										<input type="radio" id="radio1" name="radio"/>
										<label for="radio1"><span class="icon"></span>음력</label> 
										<input type="radio" id="radio2" name="radio"/> 
										<label for="radio2"><span class="icon"></span>양력</label>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<c:if test="${commandMap.MEM_IPN_SEX eq 'M'}">남자</c:if>
									<c:if test="${commandMap.MEM_IPN_SEX eq 'F'}">여자</c:if>
								</td>
							</tr>

							<tr>
								<th scope="row">
									<span class="required"><em class="blind">필수 정보</em></span> 아이디
								</th>
								<td>
									<input type="text" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" value="" placeholder="아이디 입력" class="w602 " autocomplete="off"/><br>
									<span id="id_txt_error"class="txt_error" style="display: none;">중복된 아이디 입니다.</span>
									<input type="text" id="MEM_MST_MEM_ID_FAKE" name="MEM_MST_MEM_ID_FAKE" value="" placeholder="아이디 입력" class="w602 " style="display: none;" autocomplete="off"/><br>
									<input type="hidden" id="idCheckYn" value="" />
									<input type="hidden" id="validID" value="F" /> 
								</td>
							</tr>
							<!-- 인풋영역 커서 아웃처리 시 아이디 중복일 경우 에러메시지 노출 -->
							<c:if test="${commandMap.MEM_SNS_TYPE eq '' }">
							<tr>
								<th scope="row">
									<span class="required"><em class="blind">필수 정보</em></span> 비밀번호
								</th>
								<td>
									<input type="password" id="MEM_MST_PW_FAKE" name=MEM_MST_PW_FAKE  placeholder="비밀번호 입력" class="w602 " autocomplete="off" style="display: none;"/>
									<input type="password" id="MEM_MST_PW" name="MEM_MST_PW"  placeholder="비밀번호 입력" class="w602 " autocomplete="off"/>
									
									<em class="txt_note">영문, 숫자, 특수문자 포함 8~15자 입력</em><br> 
									<br><span id="pw_txt_error" class="txt_error" style="display: none;">비밀번호는 영문, 숫자, 특수문자 포함하여 8~15자를 입력해 주세요.</span>
									<input type="hidden" id="validPW" value="F" />
								</td>
							</tr>
							<!-- 인풋영역 커서 아웃처리 시 비밀번호 입력 가이드 위반 여부 체크 후 에러메시지 노출 -->

							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 비밀번호 확인</th>
								<td>
									<input type="password" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE" placeholder="비밀번호 재입력" class="w602 "/><br> 
									<br><span id="pw2_txt_error" class="txt_error" style="display: none;">비밀번호가 일치하지 않습니다.</span> 
									<input type="hidden" id="validPW2" value="F" />
								</td>
							</tr>
							<!-- 인풋영역 커서 아웃처리 시 비밀번호 동일 여부 체크, 동일하지 않을 경우 에러메시지 노출 -->
							</c:if>
							
							<tr>
								<th scope="row">닉네임</th>
								<td>
									<input type="text" id="MEM_MST_NCK_NM" name="MEM_MST_NCK_NM" placeholder="닉네임 입력" class="w602"/><br>
									<br><span id="nck_nm_txt_error" class="txt_error" style="display: none;">중복된 닉네임 입니다.</span>
									<input type="hidden" id="validNickname" value="F" />
									<em class="txt_guide gray">특수문자 제외 8~15자 입력<br>닉네임은 사이트 내 활동 시 아이디 대신 사용되며, 미입력시 아이디로 노출됩니다.</em><!-- 2019-12-17 수정 -->
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 휴대폰</th>
								<td>
									<input id="MEM_MST_HP1" name="MEM_MST_HP1" type="number" name="" value="<c:out value="${commandMap.MEM_MST_HP1 }"/>" placeholder="번호 입력" class="w284" readonly/>
									<span class="hyphen">-</span>
									<input id="MEM_MST_HP2" name="MEM_MST_HP2" type="number" name="" value="<c:out value="${commandMap.MEM_MST_HP2 }"/>" placeholder="번호 입력" class="w284" readonly/>
									<span class="hyphen">-</span>
									<input id="MEM_MST_HP3" name="MEM_MST_HP3" type="number" name="" value="<c:out value="${commandMap.MEM_MST_HP3 }"/>" placeholder="번호 입력" class="w284" readonly/>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 이메일</th>
								<td>
									<div class="ui_form email clearboth">
									    <input type="text" id="MEM_MST_MAIL_ID" name="MEM_MST_MAIL_ID" placeholder="이메일 아이디 입력">
									    <span class="at">@</span>
									    <span class="select">
									        <select id="emailDomainSelectbox" class="user_email_select">
									            <option value="" selected>직접 입력</option>
									            <c:forEach var="domain" items="${codes.EMAIL_DOMAIN_CODE}">
									                <option>${domain.CMN_COM_NM}</option>
									            </c:forEach>
									        </select>
									    </span>
									    <button type="button" onclick="emailCheck()" class="btn_form">중복확인</button>
									</div>
									<div class="ui_form user_inp">
									   <input type="text" id="MEM_MST_MAIL_DOMAIN" name="MEM_MST_MAIL_DOMAIN" placeholder="직접 입력">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">이벤트 정보 수신</th>
								<td>
									<input type="checkbox" id="TRM_YN0001" name="TRM_YN0001" value="Y" checked="checked"/> 
									<label for="TRM_YN0001" class="mr40"><span class="icon"></span>문자</label>
									<input type="checkbox" id="TRM_YN0002" name="TRM_YN0002" value="Y" checked="checked"/> 
									<label for="TRM_YN0002" class="mr40"><span class="icon"></span>텔레마케팅</label>
									<input type="checkbox" id="TRM_YN0003" name="TRM_YN0003" value="Y" checked="checked"/> 
									<label for="TRM_YN0003" class="mr40"><span class="icon"></span>DM</label>
									<input type="checkbox" id="TRM_YN0004" name="TRM_YN0004" value="Y" checked="checked">
									<label for="TRM_YN0004" class="mr40"><span class="icon"></span>이메일</label>
									<input type="checkbox" id="TRM_YN0005" name="TRM_YN0005" value="Y" checked="checked">
                                    <label for="TRM_YN0005" class="mr40"><span class="icon"></span>영리목적광고</label>
                                    <input type="checkbox" id="TRM_YN0006" name="TRM_YN0006" value="Y" checked="checked">
                                    <label for="TRM_YN0006" class="mr40"><span class="icon"></span>카카오</label>
									<p class="txt_guide">
										다양한 이벤트 및 혜택에 대한 수신동의 여부를 선택해 주세요.<br> 수신 동의 시 고객님을 위한
										다양한 혜택 정보를 제공합니다.
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row">스페셜 코드</th>
								<td>
									<div>
										<input type="checkbox" id="special_code">
										<label for="special_code" ><span class="icon"></span>입력</label>
									</div>
									<div class="special_code_wp mt20" style="display:none;">
										<input type="text" name="" placeholder="스페셜 코드" class="w284">
										<input type="text" name="" placeholder="스페셜 개인 코드" class="w284">
										<button class="btn_large type03">코드 확인</button>
										<em class="txt_guide gray">스페셜 코드, 스페셜 개인 코드 8자리 입력</em>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btn_wrap">
				<button class="btn_large" id="bkBtn">이전</button>
				<c:choose>
				<c:when test="${commandMap.MEM_SNS_TYPE eq ''}">
				<button class="btn_large ok" type="button" id="goBtn">다음</button>
				</c:when>
				<c:otherwise>
				<button class="btn_large ok" type="button" id="goBtnSns">다음</button>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<script>
	
	
	$('.ui_form.user_inp').show();
	
	$('#special_code').on('click', function() {
		var view = $('.special_code_wp')
		if (this.checked) {
			view.show();
		} else {
			view.hide();
		}
	})
	
	//엔터막기
	$(document).keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
	$('.user_email_select').on('change', function(){
           var txt = $('.user_email_select option:selected').text();
           if (txt == '직접 입력') {
               $('.ui_form.user_inp').show();
           } else {
               $('.ui_form.user_inp').hide();
           }
       });
	
	var pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/
		
	$('#MEM_MST_MEM_ID').on("blur",function(){
		var regType1 = /^[A-Za-z0-9+]{6,15}$/;
		var id = $('#MEM_MST_MEM_ID').val();
		

		if (!regType1.test(id)) {
			$('#MEM_MST_MEM_ID').addClass('error')
			$('#id_txt_error').text("아이디는 특수문자를 제외한 영문 숫자를 사용 6~15자를 입력해 주세요")
			$('#id_txt_error').show()
			$("#validID").val("F");
		} else {
			$.ajax({
				type : "post",
				data : {
					"MEM_MST_MEM_ID" : id
				},
				url : "/pc/member/checkIdAjax.do",
				success : function(data) {
					if(data.resultYn=="Y"){
						$('#MEM_MST_MEM_ID').removeClass('error')
						$('#id_txt_error').hide()
						$("#validID").val("T");
					}else{
						$('#MEM_MST_MEM_ID').addClass('error')
						$('#id_txt_error').text("중복된 아이디 입니다.")
						$('#id_txt_error').show()
						$("#validID").val("F");
					}
				},
				error : function(err) {
					alert("통신에러");
				}
			});
		}
	});
	
	
	$('#MEM_MST_PW').on("blur",function() {
		var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&~*()`+=-])(?=.*[0-9]).{8,15}$/;
					
		var pw = $("#MEM_MST_PW").val(); //비밀번호
		if (!regex.test(pw)) {
			$('#MEM_MST_PW').addClass('error')
			$('#pw_txt_error').show()
			$('#validPW').val("F")
		} else {
			$('#MEM_MST_PW').removeClass('error')
			$('#pw_txt_error').hide()
			$('#validPW').val("T")
		}
	});
	
	$('#MEM_MST_PW_RE').on("blur", function() {
		var pw = $("#MEM_MST_PW").val(); //비밀번호
		var pw2 = $("#MEM_MST_PW_RE").val(); //비밀번호
		if (pw != pw2) {
			$('#MEM_MST_PW_RE').addClass('error')
			$('#pw2_txt_error').show()
			$('#validPW2').val("F")
		} else {
			$('#MEM_MST_PW_RE').removeClass('error')
			$('#pw2_txt_error').hide()
			$('#validPW2').val("T")
		}

	});
	$('#MEM_MST_MAIL_ID').on("blur", function(){
		isChecked = false;
	});
	$('#MEM_MST_MAIL_DOMAIN').on("blur", function(){
		isChecked = false;
	});
	$("#emailDomainSelectbox").on("change", function () {
		isChecked = false;
	});
	
	$('#MEM_MST_NCK_NM').on("blur",function(){
		var regType1 = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\+]{8,15}$/;
		var nickName = $('#MEM_MST_NCK_NM').val();
		
		
		if (nickName!=null && nickName!="" && !regType1.test(nickName)) {
			$('#MEM_MST_NCK_NM').addClass('error')
			$('#nck_nm_txt_error').text("닉네임은 특수문자를 제외한 국문, 영문, 숫자를 사용 8~15자를 입력해 주세요");
			$('#nck_nm_txt_error').show();
			($("#validNickname").val() == "F")
				$("#MEM_MST_NCK_NM").focus();
			return false;
			
		} else {
			$.ajax({
				type : "post",
				data : {
					"MEM_MST_NCK_NM" : nickName
				},
				url : "/pc/member/checkNickNameAjax.do",
				success : function(data) {
					if(data.resultYn=="Y" ){
						$('#MEM_MST_NCK_NM').removeClass('error');
						$('#nck_nm_txt_error').hide();
						$("#validNickname").val("T");
						
					}else{
						$('#MEM_MST_NCK_NM').addClass('error');
						$('#nck_nm_txt_error').text("중복된 닉네임 입니다.");
						//$('#nck_nm_txt_error').show();
						$("#validNickname").val("F");
					}
				},
				error : function(err) {
					alert("통신에러");
				}
			});
		}
	});
	
	$("#emailDomainSelectbox").on("change", function(){
		var $domain = $("#MEM_MST_MAIL_DOMAIN");
		if ($(this).val() == "") {
			$domain.prop("readonly", false);
			$domain.val("");
		} else {
			$domain.prop("readonly", true);
			$domain.val($(this).val());
		}
	});
	
	$("#emailRecieve").prop('checked', true);
	$("#smsRecieve").prop('checked', true);
	$("#kakaoRecieve").prop('checked', true);

	// 다음 버튼
	$("#goBtn").on("click",function() {
		
		if(!validateBirth()){
			return; 
		}else if(!validateIdAndPw()){
			return;
		}else if(!validatePhone()){
			return;
		}else if(!validateEmail()){
			return;
		/* }else if(!validateEmailCheck()){
			return; */
		}
		if(!isChecked){
			alert("이메일 중복확인을 해주세요.");
			return;
		}
		validateAllSuccess();
	})
	
	// 다음 버튼
	$("#goBtnSns").on("click",function() {
		
		if(!validateBirth()){
			return; 
		}else if(!validateId()){
			return;
		}else if(!validatePhone()){
			return;
		}else if(!validateEmail()){
			return;
		/* }else if(!validateEmailCheck()){
			return; */
		}
		if(!isChecked){
			alert("이메일 중복확인을 해주세요.");
			return;
		}
		
		validateAllSuccess();
	})

	$("#bkBtn").on("click", function() {
		location.href = "<c:out value="${frontDomain}" />/pc/member/joinMemBasicStep2.do";
		//history.back();
	})
</script>
<script>
	$(document).ready(function(){
		$("#frmExec").attr('autocomplete', 'off');
	});
	function validatePw(){
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var pw = $("#MEM_MST_PW").val(); //비밀번호
		if (!regex.test(pw)){
			$('#MEM_MST_PW').focus()
			return false;
		}
		return true;
	}
	
	// 비밀번호 재입력 유효성 검사
	function validatePw2(){
		var pw = $("#MEM_MST_PW").val(); //비밀번호
		var pw2 = $("#MEM_MST_PW_RE").val(); //비밀번호
		if (pw != pw2){
			$('#MEM_MST_PW_RE').focus();
			return false;
		}
		return true;
	}
	
	function validateIdAndPw(){
		if($("#validID").val() == "T" && $("#validPW").val() == "T" && $("#validPW2").val() == "T"){
			return true;
		}else if("${commandMap.MEM_SNS_TYPE}" != ''){
			return true;
		}else if($("#validID").val() == "F"){
			$("#MEM_MST_MEM_ID").focus();
			return false;
		}else if($("#validPW").val() == "F"){
			$("#MEM_MST_PW").focus();
			return false;
		}else if($("#validPW2").val() == "F"){
			$("#MEM_MST_PW_RE").focus();
			return false;
		}else{
			$("#validPW2").focus();
			return false;
		}
	}
	
	function validateId(){
		if($("#validID").val() == "T"){
			return true;
		
		}else if($("#validID").val() == "F"){
			$("#MEM_MST_MEM_ID").focus();
			return false;
		
		}
	}
	
	// 이메일 유효성 검사
	function validateEmail(){
		var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var emailRegExp1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])/;
		var emailRegExp2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var mail = $("#MST_MAIL_ID").val()+"@"+($("#emailDomainSelectbox").val() == "" ? $("#MEM_MST_MAIL_DOMAIN").val() : $("#emailDomainSelectbox").val());
		
		if(emailRegExp.test(mail)){
			return true;
		/* }else if(!emailRegExp.test($("#MEM_MST_MAIL_ID").val())){
			$("#MEM_MST_MAIL_ID").focus();
			alert("이메일은 필수 입력사항 입니다.") */
		}else if(!emailRegExp1.test($("#MEM_MST_MAIL_ID").val())){
			$("#MEM_MST_MAIL_ID").focus();
			alert("이메일 아이디 형식을 올바르게 입력해 주십시오.");
		}else if(!emailRegExp2.test($("#MEM_MST_MAIL_DOMAIN").val())){
			$("#MEM_MST_MAIL_DOMAIN").focus();
			alert("도메인 형식을 올바르게 입력해 주십시오.");
			return false;
		}
	}
	
	// 핸드폰 유효성 검사
	function validatePhone(){
		
		var phoneRegExp = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
		var phoneRegExp1 = /^[|0-9]{3,4}$/;
		var phoneRegExp2 = /^[|0-9]{4}$/;
		
		if(phoneRegExp.test($("#MEM_MST_HP1").val()+ "-"+ $("#MEM_MST_HP2").val()+ "-" + $("#MEM_MST_HP3").val())) {
			return true;
		}
		
		if($("#MEM_MST_HP1").val() == ""){
			alert("[휴대폰번호]는 필수 정보입니다.")
			$("#MEM_MST_HP1").focus();
			return false;
		}else if(!phoneRegExp1.test($("#MEM_MST_HP2").val())){
			alert("[휴대폰번호 중간자리]는 숫자 최소 3자리 이상, 4자리 이하 입니다.");
			$("#MEM_MST_HP2").focus();
			return false;
		}else if(!phoneRegExp2.test($("#MEM_MST_HP3").val())){
			alert("[휴대폰번호 뒷자리]는 숫자 최대 4자리 입니다.");
			$("#MEM_MST_HP3").focus();
			return false;
		}
		
	}
	
	function validateBirth(){
		if($(":input:radio[id=radio1]").is(":checked")){
			$("#MEM_IPN_BIR_SOLAR").val("N");
			return true;
		}else if($(":input:radio[id=radio2]").is(":checked")){
			$("#MEM_IPN_BIR_SOLAR").val("Y");
			return true;
		}else{
			$(":input:radio[id=radio1]").focus();
			alert('음력 양력을 선택해 주세요');
			return false;
		}
	}
	
	
	
	function validateAllSuccess(){
		$("#dataForm").attr({"action":"/pc/member/joinMemStep4.do", "target":"_self", "method":"post"}).submit();
	}
	
	var isChecked = false;
	// 이메일 중복확인
	emailCheck = function(){
		
		var statusAjax = false;
		
		if(statusAjax == true){ return; }
		
		if(validateEmail()){
			
			var memCtfMail = $("#MEM_MST_MAIL_ID").val()+"@"+($("#emailDomainSelectbox").val() == "" ? $("#MEM_MST_MAIL_DOMAIN").val() : $("#emailDomainSelectbox").val());
			
			statusAjax = true;
			
			$.ajax({
				type : "post",
				data : {
					"MEM_CTF_MAIL" : memCtfMail
				},
				url : "<c:out value="${frontDomain}"/>/pc/member/checkEmailAjax.do",
				success : function(data) {
					if(data.resultYn == "N"){
						alert("중복된 이메일 입니다.");
					}else{
						alert("사용가능한 이메일 입니다.");
						isChecked = true;
					}
					statusAjax = false;
				},
				error : function(err) {
					alert("이메일 중복확인 에러");
					statusAjax = false;
				}
			});
		}
		
		/* function validateEmailCheck() {
			if($("emailCheck").is("click")){
				return;
			}else{
				$("#MEM_MST_MAIL_DOMAIN").focus();
				alert("이메일 중복체크 필수 입니다.")
				return false;
			}
		} */
	}
		
</script>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>
