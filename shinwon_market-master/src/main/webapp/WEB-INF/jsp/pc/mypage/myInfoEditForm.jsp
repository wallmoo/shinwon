<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">회원정보수정</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<!-- //my_modify_top_wrap -->

				<div class="table_wrap mb90">
					<p class="required_txt"><span>필수입력사항</span></p>
					<form id="dataForm" name="dataForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
						<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>"/>
						<input type="hidden" name="MEM_MST_MEM_GBN" id="MEM_MST_MEM_GBN" value="<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
						<input type="hidden" name="MEM_MST_STY_JOB" id="MEM_MST_STY_JOB" value="<c:out value="${memberInfo.MEM_MST_STY_JOB }"/>"/>
						<input type="hidden" name="MEM_MST_STY_HEIGHT" id="MEM_MST_STY_HEIGHT" value="<c:out value="${memberInfo.MEM_MST_STY_HEIGHT }"/>"/>
						<input type="hidden" name="MEM_MST_STY_WEIGHT" id="MEM_MST_STY_WEIGHT" value="<c:out value="${memberInfo.MEM_MST_STY_WEIGHT }"/>"/>
						<input type="hidden" name="MEM_MST_PRF_IMG" id="MEM_MST_PRF_IMG" value="<c:out value="${memberInfo.MEM_MST_PRF_IMG }"/>"/>
						
						
					<table class="tb_row">
						<caption>회원정보수정 : 아이디, 이름, 생년월일, 성별, 프로필 사진, 닉네임, 비밀번호, 주소, 휴대폰, 이메일, 이벤트 정보 수신 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
								
								<tr>
									<th scope="row">아이디</th>
									<td><c:out value="${memberInfo.MEM_MST_MEM_ID }" /></td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td><c:out value="${memberInfo.MEM_MST_MEM_NM }"></c:out></td>
								</tr>
								<tr>
									<th scope="row">생년월일</th>
									<td>
										<c:out value="${fn:substring(memberInfo.MEM_IPN_BIR, 0, 4) }년 " />
										<c:out value="${fn:substring(memberInfo.MEM_IPN_BIR, 4, 6) }월 " />
										<c:out value="${fn:substring(memberInfo.MEM_IPN_BIR, 6, 8) }일" />
									</td>
								</tr>
								<tr>
									<th scope="row">성별</th>
									<td><c:out value="${memberInfo.MEM_IPN_SEX eq 'M' ? '남자':'여자'}"></c:out></td>
								</tr>
								<tr>
									<th scope="row">프로필 사진</th>
									<td>
										<div class="profile_wrap clearboth">
											<c:choose>
												<c:when test="${not empty memberInfo.MEM_MST_PRF_IMG }">
													<div class="img">
														<img src="<c:out value="${cdnDomain }" /><c:out value="${memberInfo.MEM_MST_PRF_IMG }" />" alt="프로필 이미지">
													</div>
												</c:when>
												<c:otherwise>
													<div class="img">
														<img src="/nas/cdn/PW/images/mypage/img_default_profile.png" alt="프로필 이미지">
													</div>
												</c:otherwise>
											</c:choose>
											<div class="btn_profile_wrap">
												<input type="file" id="file" name="file" class="inp_file" data-attach_cnt="1" data-accept="img" />
												<label for="file" class="file_label">변경</label>
												<button type="button" class="profile_delete">삭제</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">닉네임</th>
									<td>
										<input type="text" name="MEM_MST_NCK_NM" id="MEM_MST_NCK_NM" placeholder="닉네임 입력" class="w602" maxlength="15" value="${memberInfo.MEM_MST_NCK_NM }">
										<p class="txt_guide">영문, 숫자 포함 8~15자 입력<br>닉네임은 사이트 내 활동 시 아이디 대신 사용되며, 미입력시 아이디로 노출됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<button type="button" class="btn_password">비밀번호 변경</button>
									</td>
								</tr>
								<tr class="tr_password">
									<th scope="row">
										<span class="required">
											<em class="blind">필수 정보</em>
										</span> 신규 비밀번호
									</th>
									<td>
										<input type="password" name="PW" id="PW" placeholder="영문, 숫자, 특수문자 포함 8~15자 입력" maxlength="15" class="w602 inp_password">
									</td>
								</tr>
								<tr class="tr_password">
									<th scope="row">
										<span class="required">
											<em class="blind">필수 정보</em>
										</span> 신규 비밀번호 확인
									</th>
									<td>
										<input type="password" name="PW_RE" id="PW_RE" placeholder="비밀번호 재입력" maxlength="15" class="w602 inp_password">
										<div class="btn_box fix mt15">
											<button type="button" class="btn_cancel">취소</a>
											<button type="button" onclick="modifyPw()" class="btn_modify">확인</a>
										</div>
									</td>
								</tr>
								<%-- <tr>
									<th scope="row">주소</th>
									<td>
										<span class="block">
											<input type="text" name="" placeholder="우편번호 입력" class="w439" value='<c:out value="${memberInfo.MEM_MST_ZIP_CDE5 }"></c:out>'>
											<button class="btn_large type03">우편번호 찾기</button>
										</span>
										<span class="block">
											<input type="text" name="" placeholder="도로명 주소 입력" class="w100p" value='<c:out value="${memberInfo.MEM_MST_DRO_ADR1 }"></c:out>'>
										</span>
										<span class="block">
											<input type="text" name="" placeholder="지번 입력" class="w100p" value='<c:out value="${memberInfo.MEM_MST_JBN_ADR1 }"></c:out>'>
										</span>
										<span class="block">
											<input type="text" name="" placeholder="이하 입력" class="w100p" value='<c:out value="${memberInfo.MEM_MST_DRO_ADR2 }"></c:out>'>
										</span>
									</td>
								</tr> --%>
								<tr>
									<th scope="row">
										<span class="required">
											<em class="blind">필수 정보</em>
										</span> 휴대폰
									</th>
									<td>
										<input type="text" name="MEM_MST_HP1" id="MEM_MST_HP1" placeholder="번호 입력" class="w284" value="${memberInfo.MEM_MST_HP1 }" readonly>
										<span class="hyphen">-</span>
										<input type="text" name="MEM_MST_HP2" id="MEM_MST_HP2" placeholder="번호 입력" class="w284" value="${memberInfo.MEM_MST_HP2 }" readonly>
										<span class="hyphen">-</span>
										<input type="text" name="MEM_MST_HP3" id="MEM_MST_HP3" placeholder="번호 입력" class="w284" value="${memberInfo.MEM_MST_HP3 }" readonly>
									</td>
								</tr>
								<%-- <tr>
									<th scope="row">
										<span class="required">
											<em class="blind">필수 정보</em>
										</span> 이메일
									</th>
									<td>
										<c:set var="email" value="${fn:split(memberInfo.MEM_MST_MAIL, '@') }"></c:set>
										<c:forEach var="emailinfo" items="${email }" varStatus="status">
											<c:if test="${status.count % 2 != 0 }">
												<input type="text" name="MAIL_ID" id="MAIL_ID" placeholder="이메일 입력" class="w284" value="${emailinfo }">
												<span class="at">@</span>
											</c:if>
											<c:if test="${status.last}">
												<input type="text" name="MAIL_DOMAIN" id="MAIL_DOMAIN" placeholder="직접 입력" class="w284" value="${emailinfo }">
											</c:if>
										</c:forEach>
										<input type="hidden" name="MEM_MST_MAIL" id="MEM_MST_MAIL" value="">
										<span class="select">
											<select id="select1" class="w298">
												<option selected="selected">직접 입력</option>
												<option>naver.com</option>
												<option>daum.net</option>
											</select>
										</span>
									</td>
								</tr> --%>
								<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 이메일</th>
								<td>
									<div class="ui_form email clearboth">
										<c:set var="email" value="${fn:split(memberInfo.MEM_MST_MAIL, '@') }"></c:set>
										<c:forEach var="emailinfo" items="${email }" varStatus="status">
										<c:if test="${status.count % 2 != 0 }">
									    <input type="text" id="MAIL_ID" name="MAIL_ID" placeholder="이메일 아이디 입력" value="${emailinfo }">
									    <span class="at">@</span>
									    </c:if>
									    </c:forEach>
									    <span class="select" >
									        <select id="emailDomainSelectbox" name="MAIL_DOMAIN"	class="user_email_select" >
						        				<option value="" selected="selected">직접 입력</option>
									    			<c:forEach var="emailinfo" items="${email }" varStatus="status">
									    			<c:if test="${status.last}">
										    			<c:forEach var="domain" items="${codes.EMAIL_DOMAIN_CODE}">
										    				<option value="${domain.CMN_COM_NM}" <c:if test="${domain.CMN_COM_NM eq emailinfo}">selected="selcted"</c:if>>${domain.CMN_COM_NM}</option>
										    			</c:forEach>
									    			</c:if>
									       		</c:forEach> 
									        </select>
									    </span>
									    
									    <button type="button" onclick="emailCheck()" class="btn_form">중복확인</button>
									    
									</div>
									<div class="ui_form user_inp">
									   <input type="text" id="MST_MAIL_DOMAIN" name="MST_MAIL_DOMAIN" placeholder="직접 입력" >
									</div>
									<input type="hidden" id="MEM_MST_MAIL" name="MEM_MST_MAIL" value="${memberInfo.MEM_MST_MAIL}">
								</td>
							</tr>
								<tr>
								<th scope="row">주소</th>
									<td>
										<span class="block">
											<input type="text" readonly="readonly"	placeholder="우편번호 입력" class="w439" name="MEM_MST_ZIP_CDE5" id="MEM_MST_ZIP_CDE5" value='<c:out value="${memberInfo.MEM_MST_ZIP_CDE5}"></c:out>'>
											<button type="button" class="btn_large type03" id="zipCheck">우편번호 찾기</button>
										</span>
										<span class="block">
											<input type="text" readonly="readonly"	placeholder="도로명 주소 입력" class="w100p" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" value='<c:out value="${memberInfo.MEM_MST_DRO_ADR1}"></c:out>'> 
										</span>
										<span class="block">
											<input type="text" placeholder="지번 입력" class="w100p" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" value='<c:out value="${memberInfo.MEM_MST_JBN_ADR1}"></c:out>'>
										</span>
										<span class="block">
											<input type="text" placeholder="이하 입력" class="w100p" name="MEM_MST_DRO_ADR2" id="MEM_MST_DRO_ADR2" value='<c:out value="${memberInfo.MEM_MST_DRO_ADR2}"></c:out>'>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row">이벤트 정보 수신</th>
									<td>
										<input type="checkbox" id="TRM_YN0004" name="TRM_YN0004" value="Y" <c:if test="${memberInfo.EMAIL_YN eq 'Y' }">checked="checked"</c:if>>
										<label for="TRM_YN0004" class="mr40"><span class="icon"></span>이메일</label>
										<input type="checkbox" id="TRM_YN0001" name="TRM_YN0001" value="Y" <c:if test="${memberInfo.SMS_YN eq 'Y' }">checked="checked"</c:if>/> 
										<label for="TRM_YN0001" class="mr40"><span class="icon"></span>문자</label>
										<input type="checkbox" id="TRM_YN0006" name="TRM_YN0006" value="Y" <c:if test="${memberInfo.KAKAO_YN eq 'Y' }">checked="checked"</c:if>>
	                                    <label for="TRM_YN0006" class="mr40"><span class="icon"></span>카카오</label>
	                                    <input type="checkbox" id="TRM_YN0005" name="TRM_YN0005" value="Y" <c:if test="${memberInfo.AD_YN eq 'Y' }">checked="checked"</c:if>>
	                                    <label for="TRM_YN0005" class="mr40"><span class="icon"></span>영리목적광고</label>
										<input type="checkbox" id="TRM_YN0002" name="TRM_YN0002" value="Y" <c:if test="${memberInfo.TM_YN eq 'Y' }">checked="checked"</c:if>/> 
										<label for="TRM_YN0002" class="mr40"><span class="icon"></span>텔레마케팅</label>
										<input type="checkbox" id="TRM_YN0003" name="TRM_YN0003" value="Y" <c:if test="${memberInfo.DM_YN eq 'Y' }">checked="checked"</c:if>/> 
										<label for="TRM_YN0003" class="mr40"><span class="icon"></span>DM</label>
										<p class="txt_guide">
											다양한 이벤트 및 혜택에 대한 수신동의 여부를 선택해 주세요.<br> 수신 동의 시 고객님을 위한
											다양한 혜택 정보를 제공합니다.
										</p>
									</td>
								</tr>
						</tbody>
					</table>
					</form>
				</div>
				<!-- //table_wrap -->

				<div class="btn_wrap">
					<!-- <button type="button" class="btn_large delete">삭제</button> -->
					<button type="button" onclick="goModify()" class="btn_large ok">회원정보 수정</button>
					<!-- <button type="button" class="btn_large ok">수정</button> -->
				</div>

			</div>
			<!-- //sub_content -->

		</div>
	</div>

<form id="pwForm" name="pwForm">
	<input type="hidden" name="MEM_MST_PW" id="MEM_MST_PW" value="">
	<%-- <input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/> --%>
</form>

<form id="fileFrm" name="fileFrm" style="visibility:hidden">
	<input type="file" name="upload" id="upload" value="">
</form>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('MEM_MST_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('MEM_MST_DRO_ADR1').value = fullRoadAddr;
	            document.getElementById('MEM_MST_JBN_ADR1').value = data.jibunAddress;
				
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            /*
	            if(data.autoRoadAddress) {
	                //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = ;
	                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')
	
	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	            */
	        }
	    }).open();
	}
</script>
<script>
	$(function(){
		$(document).on("click","#zipCheck",execDaumPostcode);
		
		
		var $dataForm = $("#dataForm");
		// 폼체크
	    $dataForm.validate({
	        rules: {
	        	MEM_MST_NCK_NM:{maxlength:15},
	            MEM_MST_HP1:{required:true},	// 핸드폰번호 앞자리
	            MEM_MST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
	        	MEM_MST_HP3:{required:true, number:true, minlength:4 , maxlength:4} // 핸드폰번호 뒷자리
	        },
	        messages :{
	        	MEM_MST_NCK_NM:{maxlength:"[닉네임]은 최대 15글자 입니다."},
	        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
	        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."}
	        },
	        showErrors : function(errorMap, errorList){
	        	if(errorList.length){
	        		return alert(errorList[0].message);
	        	}
	        }
	    });
		
	    $('input[type=file]').change(function () {
	    	var tmpPath = URL.createObjectURL(this.files[0]);
	    	$(".profile_wrap img").fadeIn("fast").attr('src',tmpPath);
	    	
	    	profileUploadAjax("regist");
	    });
		
	    $('.profile_delete').on('click',function(){
	    	$(".profile_wrap img").attr("src","/nas/cdn/PW/images/mypage/img_default_profile.png");
	    	$('input[type=file]').val("");
	    	profileUploadAjax("delete");
	    })
		
		$('.tr_password .btn_cancel').on('click',function(){
			$('.tr_password').removeClass('on')
			$('.tr_password').prev('tr').not('.tr_password').css('display','table-row');
		});
	    
		var isChecked = false;
		goModify = function(){
		
			if($dataForm.valid()){
				var email = $("#MAIL_ID").val()+"@"+($("#emailDomainSelectbox").val() == "" ? $("#MST_MAIL_DOMAIN").val() : $("#emailDomainSelectbox").val());
				//var email = $("#MAIL_ID").val()+"@"+$("MAIL_DOMAIN").val();
				if($("input[name='MEM_MST_MAIL']").val() != email){
					if(!isChecked){
						alert("이메일 중복확인을 해주세요.");
						return;
					}
					$("input[name='MEM_MST_MAIL']").val(email);
				}
				else{
				}
				$dataForm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myInfoModify.do", "target":"_self", "method":"post"}).submit();
			}
		};
		
		var checkPwStatus = false;
		
		$('#PW').on("focusout",function() {
			var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var pw = $("#PW").val(); //비밀번호
			if (!regex.test(pw)) {
				alert("비밀번호는 영문, 숫자, 특수문자 포함하여 8~15자를 입력해 주세요");
				checkPwStatus = false;
				return false;
			}
			checkPwStatus = true;
		});
		
		$('#PW_RE').on("focusout", function() {
			if(checkPwStatus == false){ return; }
			var pw = $("#PW").val(); //비밀번호
			var pw2 = $("#PW_RE").val(); //비밀번호
			if (pw != pw2) {
				alert("비밀번호를 잘못 입력 하셨습니다. 다시 입력해주시기 바랍니다.");
				return false;
			}
		});

		modifyPw = function(){
			
			if($("#PW").val() == ""){
				return alert("비밀번호를 입력해 주세요");
			} else if ($("PW_RE").val() == ""){
				return alert("비밀번호를 확인해 주세요");
			}
			
			var pwForm = $("#pwForm");
			$("#MEM_MST_PW").val($("#PW").val());
			pwForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myPwdModify.do", "target":"_self", "method":"post"}).submit();
		}
		
		profileUploadAjax = function(type){
			var form = $('#fileFrm');
			if(type.indexOf("regist") >= 0){
				form.empty();
				var fileClone = $('#file').clone();
				fileClone.attr("id","upload");
				fileClone.attr("name","upload");
				fileClone.attr("type","file");
				form.append(fileClone);
				var formData = new FormData(form[0]);
				$.ajax({
					url : "<c:out value="${serverSslDomain}" />/upload/userProfileUploadAjax.do",
					enctype: 'multipart/form-data',
					type : "post",
					processData: false,
	                contentType: false,
					data : formData,
					success : function(data){
						if(data != null){
							$("#MEM_MST_PRF_IMG").val(data.CMM_FLE_ATT_PATH + data.CMM_FLE_SYS_NM);
						}
					}, error : function(err){
						alert(err);
					}
				});
			}else{
				form.find('#upload').val() == '';
			}
			
			
		}
		
		$('.ui_form.user_inp').hide();
		
		$('.user_email_select').on('change', function(){
	           var txt = $('.user_email_select option:selected').text();
	           if (txt == '직접 입력') {
	               $('.ui_form.user_inp').show();
	           } else {
	               $('.ui_form.user_inp').hide();
	           }
	       });
		
		$("#emailDomainSelectbox").on("change", function () {
			isChecked = false;
		});
		
		$("#emailDomainSelectbox").on("change", function(){
			var $domain = $("#MAIL_DOMAIN");
			if ($(this).val() == "") {
				$domain.prop("readonly", false);
				$domain.val("");
			} else {
				$domain.prop("readonly", true);
				$domain.val($(this).val());
			}
		});
		
		// 이메일 유효성 검사
		function validateEmail(){
			var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var emailRegExp1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])/;
			var emailRegExp2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var mail = $("#MAIL_ID").val()+"@"+($("#emailDomainSelectbox").val() == "" ? $("#MST_MAIL_DOMAIN").val() : $("#emailDomainSelectbox").val());
			
			if(emailRegExp.test(mail)){
				return true;
			/* }else if(!emailRegExp.test($("#MEM_MST_MAIL_ID").val())){
				$("#MEM_MST_MAIL_ID").focus();
				alert("이메일은 필수 입력사항 입니다.") */
				
			}else if(!emailRegExp1.test($("#MAIL_ID").val())){
				$("#MAIL_ID").focus();
				alert("이메일 아이디 형식을 올바르게 입력해 주십시오.");
			}else if(!emailRegExp2.test($("#MST_MAIL_DOMAIN").val())){
				$("#MST_MAIL_DOMAIN").focus();
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
				
				var memCtfMail = $("#MAIL_ID").val()+"@"+($("#emailDomainSelectbox").val() == "" ? $("#MST_MAIL_DOMAIN").val() : $("#emailDomainSelectbox").val());
				
				statusAjax = true;
				
				$.ajax({
					type : "post",
					data : {
						"MEM_CTF_MAIL" : memCtfMail
					},
					url : "<c:out value="${frontDomain}"/>/pc/myPage/checkEditEmailAjax.do",
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
		
		
	});
	
</script>