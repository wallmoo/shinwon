<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">
                	<form id="dataForm" name="dataForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
						<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>"/>
						<input type="hidden" name="MEM_MST_MEM_GBN" id="MEM_MST_MEM_GBN" value="<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
						<input type="hidden" name="MEM_MST_STY_JOB" id="MEM_MST_STY_JOB" value="<c:out value="${memberInfo.MEM_MST_STY_JOB }"/>"/>
						<input type="hidden" name="MEM_MST_STY_HEIGHT" id="MEM_MST_STY_HEIGHT" value="<c:out value="${memberInfo.MEM_MST_STY_HEIGHT }"/>"/>
						<input type="hidden" name="MEM_MST_STY_WEIGHT" id="MEM_MST_STY_WEIGHT" value="<c:out value="${memberInfo.MEM_MST_STY_WEIGHT }"/>"/>
						<input type="hidden" name="MEM_MST_PRF_IMG" id="MEM_MST_PRF_IMG" value="<c:out value="${memberInfo.MEM_MST_PRF_IMG }"/>"/>
                    <div class="tit_wp">
                        <p class="ct_tit">기본정보</p>
                    </div>
                    <div class="writeWrap">
                        <div class="name">아이디</div>
                        <div class="form">
                            <input type="text" title="아이디 입력" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }" />" readonly="readonly">
                        </div>
                        <div class="name">이름</div>
                        <div class="form">
                            <input type="text" title="이름 입력" value="<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>" readonly="readonly">
                        </div>
                        <div class="name">생년월일</div>
                        <div class="form">
                            <input type="text" title="생년월일 입력" value="<c:out value="${fn:substring(memberInfo.MEM_IPN_BIR, 0, 4) }년 " /><c:out value="${fn:substring(memberInfo.MEM_IPN_BIR, 4, 6) }월 " /><c:out value="${fn:substring(memberInfo.MEM_IPN_BIR, 6, 8) }일" />" readonly="readonly">
                            <div class="space">
                                <ul class="pickBox01">
                                    <li><input type="radio" name="birth" id="birth1"><label for="birth1">음력</label></li>
                                    <li><input type="radio" name="birth" id="birth2"><label for="birth2">양력</label></li>
                                </ul>
                            </div>
                        </div>
                        <div class="name">성별</div>
                        <div class="form">
                            <input type="text" title="성별 입력" value="<c:out value="${memberInfo.MEM_IPN_SEX eq 'M' ? '남자':'여자'}"/>" readonly="readonly">
                        </div>
                        <div class="name">프로필 사진</div>
                        <div class="profile_pic_wp">
                        			<c:choose>
                        				<c:when test="${not empty memberInfo.MEM_MST_PRF_IMG }">
		                            		<div class="profile">
                            				<img src="<c:out value="${cdnDomain }" /><c:out value="${memberInfo.MEM_MST_PRF_IMG }" />" alt="프로필 이미지">
                            				</div>
                            			</c:when>
                            			<c:otherwise>
                            				<div class="profile">
	                            			<img src="/nas/cdn/MW/images/common/ico/img_profile.png" alt="">
		                            		</div>
    		                        	</c:otherwise>
    		                        </c:choose>	
                            <div class="b_area">
                                <button class="btn mid black">변경</button>
                                <button class="btn mid gray del">삭제</button>
                            </div>
                        </div>
                        
                        <div class="name">닉네임</div>
                        <div class="form">
                            <input type="text" id="MEM_MST_NCK_NM" name="MEM_MST_NCK_NM"	title="닉네임 입력" value="${memberInfo.MEM_MST_NCK_NM }" maxlength="15">
                            <p class="t_desc">영문, 숫자 포함 8~15자 입력 / 닉네임은 사이트 내 활동 시 아이디 대신 사용되며, 미입력시 아이디로 노출됩니다. </p>
                        </div>
                        <div class="btn_area">
                            <button type="button" class="btn mid black full">비밀번호 변경</button>
                        </div>
                        <div class="name"><em class="must">필수</em>비밀번호</div>
                        <div class="form">
                            <input type="password" id="PW" name="PW" title="비밀번호 입력" placeholder="비밀번호 입력" maxlength="15">
                            <p class="t_desc">영문, 숫자, 특수문자 포함 8 ~ 15자 입력</p>
                        </div>
                        <!-- 에러일 경우 error클래스 추가 -->
                        <div class="name error"><em class="must">필수</em>비밀번호 확인</div>
                        <div class="form">
                            <input type="password" class="error" id="PW_RE" name="PW_RE" title="비밀번호 입력" placeholder="비밀번호 입력" value="" maxlength="15">
                            <p class="t_error">비밀번호가 일치하지 않습니다.</p>
                        </div>
                        <div class="btn_area dual">
                            <button type="button" class="btn mid black">취소</button>
                            <button onclick="modifyPw()" type="button" class="btn mid black">확인</button>
                        </div>
                        <div class="name"><em class="must">필수</em>상품수령주소</div>
                        	
			                        <div class="form">
			                            <div class="au_btninput">
			                                <div class="au_inpt">
			                                    <input type="text" id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" title="우편번호 입력" maxlength="5" value="">
			                                </div>
			                                <div class="au_btn">
			                                    <button id="zipCheck1" type="button" class="btn small w_auto" value="">우편번호 찾기</button>
			                                </div>
			                            </div>
			                            <div class="space">
			                                <input id="ORD_DLV_DRO_ADR1" name="ORD_DLV_DRO_ADR1" type="text" title="도로명 주소 입력" placeholder="도로명 주소" value="">
			                            </div>
			                            <div class="space">
			                                <input id="ORD_DLV_JBN_ADR1" name="ORD_DLV_JBN_ADR1" type="text" title="지번 주소 입력" placeholder="지번 주소" value="">
			                            </div>
			                            <div class="space">
			                                <input id="ORD_DLV_DRO_ADR2" name="ORD_DLV_DRO_ADR2" type="text" title="이하 주소 입력" placeholder="이하 주소" value="">
			                            </div>
			                        </div>
                        	
                        
                        <div class="name"><em class="must">필수</em>휴대폰</div>
                        <div class="form">
                            <div class="phone">
                                <div>
                                    <select title="휴대폰 앞번호 선택" id="MEM_MST_HP1" name="MEM_MST_HP1">
                                        <option value="010" selected="selected">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="019">019</option>
                                    </select>
                                </div>
                                <div><input type="tel" id="MEM_MST_HP2" name="MEM_MST_HP2" title="휴대폰 가운데 번호 입력" maxlength="4" value="${memberInfo.MEM_MST_HP2 }"></div>
                                <div class="dash">-</div>
                                <div><input type="tel" id="MEM_MST_HP3" name="MEM_MST_HP3" title="휴대폰 뒷번호 입력" maxlength="4" value="${memberInfo.MEM_MST_HP3 }"></div>
                            </div>
                        </div>
                        <div class="name"><em class="must">필수</em>이메일</div>
                        <div class="form">
                            <div class="email">
                            	<c:set var="email" value="${fn:split(memberInfo.MEM_MST_MAIL, '@') }"/>
									<c:forEach var="emailinfo" items="${email }" varStatus="status">
										<c:if test="${status.count % 2 != 0 }">
                                		<div><input type="text" id="MAIL_ID" name="MAIL_ID" title="이메일 입력" placeholder="이메일 입력" value="${emailinfo }"></div>
                                		<div class="at">@</div>
                                		</c:if>
                                		<c:if test="${status.last}">
                                		<div><input type="text" id="MAIL_DOMAIN" name="MAIL_DOMAIN" title="이메일 주소 입력" placeholder="직접 입력" value="${emailinfo }"></div>
                                		</c:if>
                                	</c:forEach>
                            </div>
                            <div class="space">
                                <select title="이메일 주소 선택">
                                    <option selected="selected">직접 입력</option>
                                    <option>naver.com</option>
									<option>daum.net</option>
                                    <%-- <c:forEach var="domain" items="${codes.EMAIL_DOMAIN_CODE}">
                                    <option>${domain.CMN_COM_NM}</option>
                                    </c:forEach> --%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="tit_wp">
                        <p class="ct_tit">이벤트 정보 수신</p>
                    </div>
                    <div class="writeWrap">
                        <div class="form">
                            <ul class="pickBox01">
                                <li><input type="checkbox" name="event" id="ev1" value="Y"<c:if test="${memberInfo.EMAIL_YN == 'Y' }">checked="checked"</c:if>>
                                	<label for="ev1">이메일</label></li>
                                <li><input type="checkbox" name="event" id="ev2" value="Y"<c:if test="${memberInfo.SMS_YN == 'Y' }">checked="checked"</c:if>>
                                	<label for="ev2">SMS</label></li>
                                <li><input type="checkbox" name="event" id="ev3" value="Y"<c:if test="${memberInfo.DM_YN == 'Y' }">checked="checked"</c:if>>
                                	<label for="ev3">카카오톡</label></li>
                            </ul>
                            <div class="space">
                                <ul class="dot_list">
                                    <li>다양한 이벤트 및 혜택에 대한 수신동의 여부를 선택해주세요. <br>수신 동의 시 고객님을 위한 다양한 혜택 정보를 제공합니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="btn_area">
                        <button type="button" class="btn ok" onclick="goModify()">회원정보 수정 </button>
                    </div>
                   </form> 
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<form id="pwForm" name="pwForm">
	<input type="hidden" name="MEM_MST_PW" id="MEM_MST_PW" value="">
	<%-- <input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/> --%>
</form>

<form id="fileFrm" name="fileFrm" style="visibility:hidden">
	<input type="file" name="upload" id="upload" value="">
</form>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>
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
	            document.getElementById('ORD_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('ORD_DLV_DRO_ADR1').value = fullRoadAddr;
	            document.getElementById('ORD_DLV_JBN_ADR1').value = data.jibunAddress;
				
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
	$(document).on("click","#zipCheck1",execDaumPostcode);
</script>
<script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
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
        
        //양력 음력체크
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
        
        //프로필 이미지 변경, 삭제
        $('input[type=file]').change(function () {
	    	var tmpPath = URL.createObjectURL(this.files[0]);
	    	$(".profile_wrap img").fadeIn("fast").attr('src',tmpPath);
	    	
	    	profileUploadAjax("regist");
	    });
        
        $('.btn mid gray del').on('click',function(){
	    	$(".profile_wrap img").attr("src","/nas/cdn/MW/images/@temp/img_temp_profile.jpg");
	    	$('input[type=file]').val("");
	    	profileUploadAjax("delete");
	    });
        
        $('.tr_password .btn mid black').on('click',function(){
			$('.tr_password').removeClass('on')
			$('.tr_password').prev('tr').not('.tr_password').css('display','table-row');
		});
        
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
        
        //회원정보 수정 
        goModify = function(){
    		
			if($dataForm.valid()){
				var email = $("#MAIL_ID").val()+"@"+$("#MAIL_DOMAIN").val();
				$("input[name='MEM_MST_MAIL']").val(email);
				$dataForm.attr({"action":"<c:out value="${frontDomain}" />mobile/mypage/myInfoModify.do", "target":"_self", "method":"post"}).submit();
			}
		}
    </script>
    