3<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>    
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
               <!--  <div id="location">
                    <h2><button type="button" class="title_sub">회원가입</button></h2>
                    <button type="button" class="btn_history_back">이전</button>
                    .sub_menu_wrap
                    // .sub_menu_wrap
                </div> -->
                <!-- // #snb -->

                <div class="cp01">
                    <div class="title_wp">
                        <p class="ct_title">정보입력</p>
                        <div class="right">
                            <ol class="step_wp">
                                <li><span>1</span><p>약관동의</p></li>
                                <li class="on" title="현재단계"><span>2</span><p>정보입력</p></li>
                                <li><span>3</span><p>태그선택</p></li>
                                <li><span>4</span><p>희망태그</p></li>
                                <li><span>5</span><p>스타일정보</p></li>
                                <li><span>6</span><p>가입완료</p></li>
                            </ol>
                        </div>
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
                    <div class="title_wp2">
                        <p class="ct_title2">기본정보</p>
                    </div>
                    <div class="writeWrap fix">
                        <div class="name">이름</div>
                        <div class="form">
                            <input type="text" title="이름 입력" value="${commandMap.MEM_MST_MEM_NM}" readonly="readonly">
                            
                        </div>
                        <div class="name">생년월일</div>
                        <div class="form">
                            <input type="text" title="생년월일 입력" value="${commandMap.MEM_IPN_BIR_DT} " readonly="readonly">
                            <div class="space">
                                <ul class="pickBox01">
                                    <li><input type="radio" name="birth" id="birth1">
                                    	<label for="birth1">음력</label></li>
                                    <li><input type="radio" name="birth" id="birth2">
                                    	<label for="birth2">양력</label></li>
                                </ul>
                            </div>
                        </div>
                        <div class="name">성별</div>
                        <div class="form">
                        	<c:if test="${commandMap.MEM_IPN_SEX eq 'M' }">
                            <input type="text" title="성별 입력" value="남자" readonly="readonly">
                            </c:if>
                            <c:if test="${commandMap.MEM_IPN_SEX eq 'F' }">
                            <input type="text" title="성별 입력" value="여자" readonly="readonly">
                            </c:if>
                        </div>
                    </div>
                    <div class="title_wp2">
                        <p class="ct_title2">정보입력</p>
                    </div>
                    <div class="writeWrap fix"> <!-- class fix 추가 -->
                        <div class="name"><em class="must">필수</em>아이디</div>
                            <input type="text" title="아이디 입력" placeholder="아이디 입력" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID">
                            <p id="id_txt_error" class="t_error" style="display: none;">중복된 아이디 입니다.</p>
							<input type="hidden" id="idCheckYn" value="" />
							<input type="hidden" id="validID" value="F" /> 
                            
                        <c:if test="${commandMap.MEM_SNS_TYPE eq '' }">
                        <div class="name"><em class="must">필수</em>비밀번호</div>
                            <input type="password" title="비밀번호 입력" placeholder="비밀번호 입력" id="MEM_MST_PW" name="MEM_MST_PW">
                            <p class="t_desc">영문, 숫자, 특수문자 포함 8 ~ 15자 입력</p>
                            <p id="pw_txt_error" class="t_error" style="display: none;">비밀번호는 영문, 숫자, 특수문자 포함하여 8~15자를 입력해 주세요.</p>
							<input type="hidden" id="validPW" value="F" />
                        <!-- 에러일 경우 error클래스 추가 -->
                        
                        <div class="name error"><em class="must">필수</em>비밀번호 확인</div>
                            <input type="password" class="error" title="비밀번호 입력" placeholder="비밀번호 입력" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE">
                            <p id="pw2_txt_error" class="t_error" style="display: none;">비밀번호가 일치하지 않습니다.</p>
                            <input type="hidden" id="validPW2" value="F" />
                        </c:if>    
                        
                        <div class="name">닉네임</div>
                            <input type="text" title="닉네임 입력" value=""  id="MEM_MST_NCK_NM" name="MEM_MST_NCK_NM">
                            <p id="nck_nm_txt_error" class="t_error" style="display: none;">중복된 닉네임 입니다.</p>
                            <p class="t_desc">특수문자 제외 8~15자 입력 / 닉네임은 사이트 내 활동 시 아이디 대신 사용되며, 미입력시 아이디로 노출됩니다. </p>
                            <input type="hidden" id="validNickname" value="F" />
                        
                        <div class="name"><em class="must">필수</em>휴대폰</div>
                            <div class="phone">
                                <%-- <div>
                                    <select	id="MEM_MST_HP1" name="MEM_MST_HP1" title="휴대폰 앞번호 선택">
                                    	<c:forEach var="hp" items="${codes.HP_CODE}">
                                        <option value="${hp.CMN_COM_NM }" <c:if test="${hp.CMN_COM_NM eq '010' }">checked="checked"</c:if>>${hp.CMN_COM_NM}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div><input type="tel" title="휴대폰 가운데 번호 입력" maxlength="4" id="MEM_MST_HP2" name="MEM_MST_HP2"></div>
                                <div class="dash">-</div>
                                <div><input type="tel" title="휴대폰 뒷번호 입력" maxlength="4" id="MEM_MST_HP3" name="MEM_MST_HP3"></div> --%>
                                <div><input id="MEM_MST_HP1" name="MEM_MST_HP1" type="number" name="" value="<c:out value="${commandMap.MEM_MST_HP1 }"/>" placeholder="번호 입력" class="w284" readonly/></div>
                                <div class="dash">-</div>
                                <div><input id="MEM_MST_HP2" name="MEM_MST_HP2" type="number" name="" value="<c:out value="${commandMap.MEM_MST_HP2 }"/>" placeholder="번호 입력" class="w284" readonly/></div>
                                <div class="dash">-</div>
                                <div><input id="MEM_MST_HP3" name="MEM_MST_HP3" type="number" name="" value="<c:out value="${commandMap.MEM_MST_HP3 }"/>" placeholder="번호 입력" class="w284" readonly/></div>
                                
                            </div>
                            
                        <div class="name"><em class="must">필수</em>이메일</div>
                            <div class="email">
                                <div><input type="text" title="이메일 입력" placeholder="이메일 입력" id="MEM_MST_MAIL_ID" name="MEM_MST_MAIL_ID"></div>
                                <div class="at">@</div>
                                <div>
                                    <select title="이메일 주소 선택" class="user_email_select" id="emailDomainSelectbox" >
                                        <option selected="selected" value="">직접 입력</option>
                                        <c:forEach var="domain" items="${codes.EMAIL_DOMAIN_CODE }">
                                        <option>${domain.CMN_COM_NM }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="space user_inp" style="display: block;">
                                <input type="text" title="이메일 주소 입력" placeholder="직접 입력" id="MEM_MST_MAIL_DOMAIN" name="MEM_MST_MAIL_DOMAIN">
                            </div>
                    </div>
                    <div class="title_wp2">
                        <p class="ct_title2">이벤트 정보 수신</p>
                    </div>
                    <div class="writeWrap fix"> <!-- class fix 추가 -->
                        <div class="form">
                            <ul class="pickBox01">
                                <li>
                                	<input type="checkbox" id="TRM_YN0001" name="TRM_YN0001" value="Y" checked="checked"/> 
									<label for="TRM_YN0001" class="mr40">문자</label>
                                </li>
                                <li>
                                	<input type="checkbox" id="TRM_YN0002" name="TRM_YN0002" value="Y" checked="checked"/> 
									<label for="TRM_YN0002" class="mr40">텔레마케팅</label>
                                </li>
                                <li>
                                	<input type="checkbox" id="TRM_YN0003" name="TRM_YN0003" value="Y" checked="checked"/> 
									<label for="TRM_YN0003" class="mr40">DM</label>
                                </li>
                                <li>
                                	<input type="checkbox" id="TRM_YN0004" name="TRM_YN0004" value="Y" checked="checked">
									<label for="TRM_YN0004" class="mr40">이메일</label>
                                </li>
                                <li>
                                	<input type="checkbox" id="TRM_YN0005" name="TRM_YN0005" value="Y" checked="checked">
                                    <label for="TRM_YN0005" class="mr40">영리목적광고</label>
                                </li>
                                <li>
                                	<input type="checkbox" id="TRM_YN0006" name="TRM_YN0006" value="Y" checked="checked">
                                    <label for="TRM_YN0006" class="mr40">카카오</label>
                                </li>
                            </ul>
                            <div class="space">
                                <ul class="dot_list">
                                    <li>다양한 이벤트 및 혜택에 대한 수신동의 여부를 선택해주세요. <br>수신 동의 시 고객님을 위한 다양한 혜택 정보를 제공합니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="title_wp2">
                        <p class="ct_title2">스페셜 코드</p>
                    </div>
                    <div class="writeWrap fix"> <!-- class fix 추가 -->
                        <div class="form">
                            <ul class="pickBox01">
                                <li><input type="checkbox" name="special_code" id="special_code"><label for="special_code"> 입력</label></li>
                            </ul>
                            <div class="space">
                                <input type="text" title="스페셜 코드 입력" placeholder="스페셜 코드" >
                            </div>
                            <div class="space">
                                <div class="au_btninput">
                                    <div class="au_inpt">
                                        <input type="text" title="스페셜 개인코드 입력"  placeholder="스페셜 개인코드">
                                    </div>
                                    <div class="au_btn">
                                        <button type="button" class="btn mid black">코드 확인</button>
                                    </div>
                                </div>
                            </div>
                            <div class="space">
                                <ul class="dot_list">
                                    <li>스페셜 코드, 스페셜 개인 코드 8자리 입력 </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </form>
                    <div class="btn_area dual">
                        <button type="button" class="btn big black" id="bkBtn">이전</button>
                        <c:choose>
                        <c:when test="${commandMap.MEM_SNS_TYPE eq ''}">
                        <button type="button" class="btn big ok" id="goBtn">인증하기</button>
                        </c:when>
                        <c:otherwise>
						<button type="button" class="btn big ok" id="goBtnSns">인증하기</button>
						</c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
       
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script>

		
        $('.user_email_select').on('change', function(){
            var txt = $('.user_email_select option:selected').text();
            if (txt == '직접 입력') {
                $('.user_inp').show();
            } else {
                $('.user_inp').hide();
            }
        });
        
      //엔터막기
    	$(document).keydown(function() {
    		  if (event.keyCode === 13) {
    		    event.preventDefault();
    		  };
    		});
      
    	$('#special_code').on('click', function() {
    		var view = $('.special_code_wp')
    		if (this.checked) {
    			view.show();
    		} else {
    			view.hide();
    		}
    	});
      
	 	    		
      $(function () {
    	  
    	//아아디  체크
    	  var pattern = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/
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
    						url : "/mobile/member/checkIdAjax.do",
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
    	  
    	  //패스워드체크
    	  $('#MEM_MST_PW').on("blur",function() {
    			var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
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
    	  
    	  //패스워드확인
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
    	  
    	  //닉네임 체크
    	  $('#MEM_MST_NCK_NM').on("blur",function(){
    		  	var regType1 = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\+]{8,15}$/;
    			var nickName = $('#MEM_MST_NCK_NM').val();
    			if (!regType1.test(nickName)) {
    				$('#MEM_MST_NCK_NM').addClass('error')
    				$('#nck_nm_txt_error').text("아이디는 특수문자를 제외한 영문 숫자를 사용 8~15자를 입력해 주세요");
    				$('#nck_nm_txt_error').show();
    				$("#validNickname").val("F");
    			} else {
    				$.ajax({
    					type : "post",
    					data : {
    						"MEM_MST_NCK_NM" : nickName
    					},
    					url : "/pc/member/checkNickNameAjax.do",
    					success : function(data) {
    						if(data.resultYn=="Y"){
    							$('#MEM_MST_NCK_NM').removeClass('error');
    							$('#nck_nm_txt_error').hide();
    							$("#validNickname").val("T");
    						}else{
    							$('#MEM_MST_NCK_NM').addClass('error');
    							$('#nck_nm_txt_error').text("중복된 닉네임 입니다.");
    							$('#nck_nm_txt_error').show();
    							$("#validNickname").val("F");
    						}
    					},
    					error : function(err) {
    						alert("통신에러");
    					}
    				});
    			}
    		});
    	  
    	  //이메일체크
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
    	  
    	// 다음페이지 버튼
   		$("#goBtn").on("click",function() {
   			
   			if(!validateBirth()){
   				return; 
   			}else if(!validateIdAndPw()){
   				return;
   			/* }else if(!validatePhone()){
   				return; */
   			}else if(!validateEmail()){
   				return;
   			}else if(!emailCheck()){
   				return;
   			}
   			/* else if(isChecked){
   				return true;
   			} */
   			validateAllSuccess();
   		});
    	
   		$("#goBtnSns").on("click",function() {
   			
   			if(!validateBirth()){
   				return; 
   			}else if(!validateIdAndPw()){
   				return;
   			}else if(!validatePhone()){
   				return;
   			/* }else if(!validateEmail()){
   				return; */
   			}else if(!emailCheck()){
   				return;
   			}
   			
   			validateAllSuccess();
   		});
    	
    	
    	//이전으로
   		$("#bkBtn").on("click", function() {
   			history.back();
   		});
    	  
		});
       
</script>
<script>
	
	//패스워드 입력체크
	function validatePw(){
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var pw = $("#MEM_MST_PW").val(); //비밀번호
		if (!regex.test(pw)){
			$('#MEM_MST_PW').focus()
			return false;
		}
		return true;
	}
	
	// 비밀번호 확인 체크
	function validatePw2(){
		var pw = $("#MEM_MST_PW").val(); //비밀번호
		var pw2 = $("#MEM_MST_PW_RE").val(); //비밀번호
		if (pw != pw2){
			$('#MEM_MST_PW_RE').focus();
			return false;
		}
		return true;
	}
	
	//SNS ID/PW 
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
		}else{
			$("#validPW2").focus();
			return false;
		}
	}
	
	// 이메일 입력 체크
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
				url : "<c:out value="${mobileDomain}"/>/mobile/member/checkEmailAjax.do",
				success : function(data) {
					if(data.resultYn == "N"){
						alert("중복된 이메일 입니다.");
					}else{
						//alert("사용가능한 이메일 입니다.");
						isChecked = true;
						validateAllSuccess();
					}
					statusAjax = false;
				},
				error : function(err) {
					alert("이메일 중복확인 에러");
					statusAjax = false;
				}
			});
		}
		
	}
	
	// 핸드폰 유효성 검사
	function validatePhone(){
		
		var phoneRegExp = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
		var phoneRegExp1 = /(\d{4}|\d{3})/;
		var phoneRegExp2 = /\d{4}$/;
		
		if(phoneRegExp.test($("#MEM_MST_HP1").val()+ "-"+ $("#MEM_MST_HP2").val()+ "-" + $("#MEM_MST_HP3").val())) {
			return true;
		}
		
		if($("#MEM_MST_HP1").val() == ""){
			alert("[휴대폰번호]는 필수 정보입니다.")
			return false
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
	//음력 양력 체크
	function validateBirth(){
		if($(":input:radio[id=birth1]").is(":checked")){
			$("#MEM_IPN_BIR_SOLAR").val("N");
			return true;
		}else if($(":input:radio[id=birth2]").is(":checked")){
			$("#MEM_IPN_BIR_SOLAR").val("Y");
			return true;
		}else{
			$(":input:radio[id=birth1]").focus();
			alert('음력 양력을 선택해 주세요');
			return false;
		}
	}
	
	function validateAllSuccess(){
		$("#dataForm").attr({"action":"/mobile/member/joinMemStep4.do", "target":"_self", "method":"post"}).submit();
	}

</script>
