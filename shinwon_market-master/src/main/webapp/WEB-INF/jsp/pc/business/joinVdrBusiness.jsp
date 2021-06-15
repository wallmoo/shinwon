<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>

<script>
	window.history.forward(); 
</script>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>
		
		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<form id="dataForm" name="dataForm" method="post">
            <input type="hidden" name="TEMP_VDR_LGN_BUSI1" id="TEMP_VDR_LGN_BUSI1" value=""/>
            <input type="hidden" name="TEMP_VDR_LGN_BUSI2" id="TEMP_VDR_LGN_BUSI2" value=""/>
            <input type="hidden" name="TEMP_VDR_LGN_BUSI3" id="TEMP_VDR_LGN_BUSI3" value=""/>
            </form>			
            
			<form id="frm" name="frm" method="post">
            <double-submit:preventer/>            
			<div class="contents"><!-- .contents S -->
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">신규등록</h2>
						<span class="minW tx_sub">처음 방문하신 경우 입점 상담 및 계약을 진행하기 위해 반드시 업체정보를 신규 등록하셔야 합니다.</span>
					</div>
					
					<dl class="minW counsel_ask">
						<dt>
							<strong>로그인 정보</strong>
							<span class="tx_ex"><i class="co_red">*</i> 표시된 항목은 필수 입력 사항입니다.</span>
						</dt>
						<dd class="dd_inpForm">
							<table>
								<caption>로그인 정보에 사업자등록번호, 비밀번호, 비밀번호 확인으로 구성된 표</caption>
								<colgroup>
									<col style="width:140px" />
									<col style="width:339px" />
									<col style="width:140px" />
									<col style="width:339px" />
								</colgroup>
								<tbody>
									<tr>
										<th>사업자등록번호 <i class="co_red">*</i></th>
										<td colspan="3" class="td_commNum td_comAdd">
											<div class="f inp_box">
												<label for="VDR_LGN_BUSI1">
													<input type="text" name="VDR_LGN_BUSI1" id="VDR_LGN_BUSI1" maxlength="3" class="number" data-err_msg_id="vdrBus1" style="width:52px;" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_LGN_BUSI2">
													<input type="text" name="VDR_LGN_BUSI2" id="VDR_LGN_BUSI2" maxlength="2" class="number" data-err_msg_id="vdrBus2" style="width:52px;" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_LGN_BUSI3">
													<input type="text" name="VDR_LGN_BUSI3" id="VDR_LGN_BUSI3" maxlength="5" class="number" data-err_msg_id="vdrBus3" style="width:52px;" />
												</label>
												<input type="hidden" id="idCheckYn" value="" />
												<input type="hidden" id="checkId" value="" />											
												<a href="javascript:goCert();" class="btn_gre" id="businessNoCheck"><span>중복체크</span></a>
											</div>
										</td>
									</tr>
									<tr>
										<th>비밀번호 <i class="co_red">*</i></th>
										<td class="td_pw">
											<div class="inp_box">
												<label for="VDR_LGN_PW">
													<input type="password" name="VDR_LGN_PW" id="VDR_LGN_PW" maxlength="15" data-err_msg_id="memPw" onkeydown="javascript:deleteCheckMsg();" />
												</label>
											</div>
										</td>
										<th>비밀번호 확인 <i class="co_red">*</i></th>
										<td class="td_pw2">
											<div class="inp_box">
												<label for="VDR_LGN_PW_RE">
													<input type="password" name="VDR_LGN_PW_RE" id="VDR_LGN_PW_RE" maxlength="15" data-err_msg_id="memPwRe"  />
												</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<p class="tx_ex">
								<i class="ico_excl">!</i><span>띄어쓰기 없이 6~15자 영문,숫자,특수문자 중 2개 이상을 조합하여 입력해 주세요.</span>
							</p>
						</dd>
						<dt>
							<strong>업체 정보</strong>
							<span class="tx_ex"><i class="co_red">*</i> 표시된 항목은 필수 입력 사항입니다.</span>
						</dt>
						<dd class="dd_inpForm">
							<table>
								<caption>업체 정보에 사업자등록번호, 비밀번호, 비밀번호 확인으로 구성된 표</caption>
								<colgroup>
									<col style="width:140px" />
									<col style="width:339px" />
									<col style="width:140px" />
									<col style="width:339px" />
								</colgroup>
								<tbody>
									<tr>
										<th>업체명 <i class="co_red">*</i></th>
										<td class="td_comName">
											<div class="inp_box">
												<label for="VDR_LGN_NM">
													<input type="text" name="VDR_LGN_NM" id="VDR_LGN_NM" maxlength="40" data-err_msg_id="lgnNm" />
												</label>
											</div>
										</td>
										<th>대표자명 <i class="co_red">*</i></th>
										<td class="td_ceoName">
											<div class="inp_box">
												<label for="VDR_LGN_CEO_NM">
													<input type="text" name="VDR_LGN_CEO_NM" id="VDR_LGN_CEO_NM" maxlength="15" data-err_msg_id="ceoNm" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>사업자구분 <i class="co_red">*</i></th>
										<td class="td_comType">
											<div class="inp_box">
												<label for="VDR_LGN_TYPE" class="sel_comType">
													<select id="VDR_LGN_TYPE" name="VDR_LGN_TYPE" class="sel_chg" data-err_msg_id="vdrType">
														<option value="">선택</option>
				                                		<c:if test="${not empty codes.BUSINESS_CODE }">
					                                		<c:forEach var="mngTelRow" items="${codes.BUSINESS_CODE }" varStatus="i">
					                                    		<option value="<c:out value="${mngTelRow.CMN_COM_IDX }"/>"><c:out value="${mngTelRow.CMN_COM_NM }"/></option>
					                                		</c:forEach>
				                                		</c:if>
													</select>													
												</label>
											</div>
										</td>
										<th>법인등록번호</th>
										<td class="td_regNum">
											<div class="inp_box">
												<label for="VDR_LGN_JRD_NO1">
													<input type="text" name="VDR_LGN_JRD_NO1" id="VDR_LGN_JRD_NO1" maxlength="6" class="number" data-err_msg_id="jdrNo1" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_LGN_JRD_NO2">
													<input type="text" name="VDR_LGN_JRD_NO2" id="VDR_LGN_JRD_NO2" maxlength="7" class="number" data-err_msg_id="jdrNo2" />
												</label>
											</div>
										</td>
									</tr>
									
									<tr>
										<th>사업장주소 <i class="co_red">*</i></th>
										<td colspan="3" class="td_comAdd">
											<div class="f inp_box">
												<label for="VDR_LGN_POST5">
													<input type="text" name="VDR_LGN_POST5" id="VDR_LGN_POST5" maxlength="5" readonly="readonly" data-err_msg_id="zip" />
												</label>
												<a href="javascript:void(0)" id="zipCheck" class="btn_gre"><span>우편번호 찾기</span></a>
											</div>
											<div class="inp_box">
												<label for="VDR_LGN_DR_ADDR1">
													<input type="text" name="VDR_LGN_DR_ADDR1" id="VDR_LGN_DR_ADDR1" placeholder="도로명 주소" maxlength="100" readonly="readonly" data-err_msg_id="doro1" />
												</label>
												<label for="VDR_LGN_DR_ADDR2">
													<input type="text" name="VDR_LGN_DR_ADDR2" id="VDR_LGN_DR_ADDR2" placeholder="도로명 주소 상세" maxlength="100" data-err_msg_id="doro2"  />
												</label>
											</div>
											<div class="l inp_box">
												<label for="VDR_LGN_JB_ADDR1">
													<input type="text" name="VDR_LGN_JB_ADDR1" id="VDR_LGN_JB_ADDR1" placeholder="지번 주소" maxlength="100" readonly="readonly" data-err_msg_id="jibun1" />
												</label>
												<label for="VDR_LGN_JB_ADDR2">
													<input type="text" name="VDR_LGN_JB_ADDR2" id="VDR_LGN_JB_ADDR2" placeholder="지번 주소 상세" maxlength="100" data-err_msg_id="jibun2"  />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>대표 Email <i class="co_red">*</i></th>
										<td colspan="3" class="td_email">
											<div class="inp_box">
												<label for="VDR_LGN_MAIL_ID" class="blind">대표 email 아이디</label>
												<input type="text" name="VDR_LGN_MAIL_ID" id="VDR_LGN_MAIL_ID" maxlength="20" data-err_msg_id="memEmailId" />
												<span class="ico_tx">@</span>
												<label for="VDR_LGN_MAIL_DOMAIN" class="blind">대표 email 도메인</label>
												<input type="text" name="VDR_LGN_MAIL_DOMAIN" id="VDR_LGN_MAIL_DOMAIN" data-err_msg_id="memEmailDomain" />
												<input type="hidden" id="VDR_LGN_MAIL" name="VDR_LGN_MAIL" />
												<label for="emailDomainSelectbox" class="sel_box">
													<select id="emailDomainSelectbox" class="sel_chg">
														<option value="">직접입력</option>
					                            		<c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
						                            		<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
						                            			<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
					                            			</c:forEach>
					                            		</c:if>														
													</select>
												</label>
											</div>
										</td>
									</tr>
									
								</tbody>
							</table>
						</dd>
						<dd class="dd_btn">
							<a href="javascript:goRegist();" class="btn_red"><span>확인</span></a>
							<a href="javascript:goCancel();" class="btn_gre"><span>취소</span></a>
						</dd>
					</dl>
				</section>
				<!--// .sub_lay E -->
	
			</div><!--// .contents E -->
			</form>
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

<script>
	$(function(){
		
		var $dataForm = $("#dataForm");
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	        	VDR_LGN_BUSI1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자 번호1
	        	VDR_LGN_BUSI2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자 번호2
	        	VDR_LGN_BUSI3:{required:true, number:true, minlength:5, maxlength:5},	// 사업자 번호3
	            VDR_LGN_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, 	// 비밀번호
	            VDR_LGN_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#VDR_LGN_PW"}, // 비밀번호 확인
	            VDR_LGN_NM :{required:true},											// 업체명
	            VDR_LGN_CEO_NM :{required:true},										// 대표자명
	            VDR_LGN_TYPE :{required:true},											// 사업자구분
	            VDR_LGN_JRD_NO1 : {number:true, minlength:6, maxlength:6},				// 법인등록번호1
	            VDR_LGN_JRD_NO2 : {number:true, minlength:7, maxlength:7},				// 법인등록번호2
	            VDR_LGN_POST5:{required:true, number:true}, 							// 우편번호
	            VDR_LGN_DR_ADDR1:{required:true},   									// 도로명 본주소
	            VDR_LGN_DR_ADDR2:{required:true},   									// 도로명 상세주소
	            VDR_LGN_JB_ADDR1:{required:true},   									// 지번 본주소
	            VDR_LGN_JB_ADDR2:{required:true},  										// 지번 상세주소            
	            VDR_LGN_MAIL_ID:{required:true, emailId:true},							// 이메일 아이디
	            VDR_LGN_MAIL_DOMAIN:{required:true, emailDomain:true}					// 이메일 도메인	            

	        },
	        messages :
	        {
	        	VDR_LGN_BUSI1: {required:"[사업자번호]첫번째 자리는 필수 정보입니다.", minlength:"[사업자번호]첫번째 자리는 최소 3글자 이상입니다."},
	        	VDR_LGN_BUSI2: {required:"[사업자번호]두번째 자리는 필수 정보입니다.", minlength:"[사업자번호]첫번째 자리는 최소 2글자 이상입니다."},
	        	VDR_LGN_BUSI3: {required:"[사업자번호]세번째 자리는 필수 정보입니다.", minlength:"[사업자번호]첫번째 자리는 최소 5글자 이상입니다."},
	        	VDR_LGN_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
	        	VDR_LGN_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."},
	        	VDR_LGN_NM: {required:"[업체명]은 필수 정보입니다."},	        	
	        	VDR_LGN_CEO_NM: {required:"[대표자명]은 필수 정보입니다."},
	        	VDR_LGN_TYPE: {required:"[사업자구분]은 필수 정보입니다."},
	        	VDR_LGN_POST5: {required:"[우편번호]는 필수 정보입니다."},
	        	VDR_LGN_DR_ADDR1: {required:"[도로명 주소]는 필수 정보입니다."},
	        	VDR_LGN_DR_ADDR2: {required:"[도로명 주소 상세]는 필수 정보입니다."},
	        	VDR_LGN_JB_ADDR1: {required:"[지번 주소]는 필수 정보입니다."},
	        	VDR_LGN_JB_ADDR2: {required:"[지번 주소 상세]는 필수 정보입니다."},
	        	VDR_LGN_MAIL_ID : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:"아이디 형식을 올바르게 입력해 주십시오."},
	        	VDR_LGN_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."}	        	
	        }
	        //,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
	        ,onkeyup:false
		    ,onclick:false
		    ,onfocusout:false
	        ,showErrors:function(errorMap, errorList){
	 	       if(this.numberOfInvalids()) { 
		    	   var errorOobjId = $(errorList[0].element).attr('id');
		    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
		    	   caption = caption.replace('*','').replace(/\s/gi,'');
		    	   if(caption != null && caption != "") 
		    	   {
		    	       alert('[' + caption + '] ' + errorList[0].message);
		    	   }
		    	   else
		    	   {
		    	       alert(errorList[0].message);
		    	   }
		    	   $(errorList[0].element).focus();
		       }
		   }	        
	    });
		
		// 사업자인증 확인 클릭 이벤트
		goCert = function(){
			
	        $("#checkId").val($("#VDR_LGN_BUSI1").val() + $("#VDR_LGN_BUSI2").val() + $("#VDR_LGN_BUSI3").val());	// 중복체크한 id  			
			
			if($("#VDR_LGN_BUSI1").val() == ""){
				alert("[사업자등록번호]첫번째 자리는 필수 정보입니다.");
				$("#VDR_LGN_BUSI1").focus();				
				return;				
			}
			if($("#VDR_LGN_BUSI2").val() == ""){
				alert("[사업자등록번호]두번째 자리는 필수 정보입니다.");
				$("#VDR_LGN_BUS2").focus();				
				return;				
			}
			if($("#VDR_LGN_BUSI3").val() == ""){
				alert("[사업자등록번호]세번째 자리는 필수 정보입니다.");
				$("#VDR_LGN_BUS3").focus();				
				return;				
			}

			$("#TEMP_VDR_LGN_BUSI1").val($("#VDR_LGN_BUSI1").val());
			$("#TEMP_VDR_LGN_BUSI2").val($("#VDR_LGN_BUSI2").val());
			$("#TEMP_VDR_LGN_BUSI3").val($("#VDR_LGN_BUSI3").val()); 
           		
			$.ajax({
                async : false,
                type : "POST",
                data : $dataForm.serialize(),
                url : "<c:out value="${serverSslDomain}" />/pc/business/checkBusinessNoAjax.do",
                success : function (data) {
                	if(data.successYn == "Y"){

                		if(data.resultYn == "Y"){
                			alert("인증처리가 완료되었습니다.");
  	 	                	$("#idCheckYn").val("Y");
   	                    }
   	                    else
   	                    {
   	                    	alert("등록된 사업자등록번호 입니다.");
  	 	                	$("#idCheckYn").val("F");   	                    	
   	                    	return;
   	                    }
                		
                	}
                	else{
                		alert("유효하지 않은 사업자등록번호입니다.");
                        return;
                	}
                },
                error : function () {
                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                }
            });
		};	    
	    
 		// 이메일 도메인 select box 변경 이벤트
	    $(document).on("click", "#emailDomainSelectbox", function () 
	    {
	        var $domain = $("#VDR_LGN_MAIL_DOMAIN");
	        
	        if($(this).val() == "")
	        {
	            $domain.prop("readonly", false);
	            $domain.val("");
	        }
	        else
	        {
	            $domain.prop("readonly", true);
	            $domain.val($(this).val());
	        }
	    });
 		
	 	// 우편번호 찾기 클릭 이벤트
	    $(document).on("click","#zipCheck",function(){
	    	window.open("<c:out value="${serverSslDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes,target=_blank");
	    });
	 	
	 	// 우편번호 callback 함수
		zipcodeCallback = function (zip,doroAddr,jibunAddr)
		{
			$('#VDR_LGN_POST5').val(zip);
			$('#VDR_LGN_DR_ADDR1').val(doroAddr);
			$('#VDR_LGN_JB_ADDR1').val(jibunAddr);
			$('#zip').html("");
			$('#doro').html("");
			$('#jibun').html("");
		};
 		
	 	// 등록 버튼 클릭 이벤트
	    goRegist = function () {
	 		
	 		if($frm.valid()){
	        	
	 			var $chkObj = $("#idCheckYn");
	            
	            if($chkObj.val() == "Y")	// 중복체크 성공
	            {
	            	
	            	var VDR_LGN_BUSINESSNO = $("#VDR_LGN_BUSI1").val()+$("#VDR_LGN_BUSI2").val()+$("#VDR_LGN_BUSI3").val();
	            	
	            	if($("#checkId").val() == VDR_LGN_BUSINESSNO ){	// 1. 중복체크 값과 사업자번호필드 값이 같은 경우
		                    
		            		// 비밀번호와 아이디가 같은지 체크
		            		if( VDR_LGN_BUSINESSNO == $("#VDR_LGN_PW").val() ){
		            			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
		            			$("#VDR_LGN_PW").focus();
		            			return;
		            		}
	            	
		                    // 이메일 ID + DOMAIN
		                    $("#VDR_LGN_MAIL").val($("#VDR_LGN_MAIL_ID").val() + "@" + $("#VDR_LGN_MAIL_DOMAIN").val());
		            		
		            		if (confirm( "저장 하시겠습니까?")) {
								$("#idCheckYn").val("");
		    	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/joinBusinessRegist.do", "target":"_self", "method":"post"}).submit();
		                    }   
	            	}   
	            	else{
	            		alert("사업자 등록번호 중복을 확인해 주십시오.");
	                    $("#businessNoCheck").focus();
	                    return;
	            	}
	            }
	            else{
	            	alert("사업자 등록번호 중복을 확인해 주십시오.");
                    $("#businessNoCheck").focus();
                    return;		
	            }
	        }
	    };
	    
	    // 취소 클릭 이벤트
	    goCancel = function(){
	    	if(confirm("회원가입을 취소하시겠습니까?")){
	 			location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
	 		}
	    };
	    
	 	// 아이디 및 비밀번호의 체크 메세지 초기화
	    deleteCheckMsg = function(){
	    	$("#memIdCheck").html("");
	    	$("#memPwCheck").html("");
	    };
	    
	});
</script>
</body>
</html>