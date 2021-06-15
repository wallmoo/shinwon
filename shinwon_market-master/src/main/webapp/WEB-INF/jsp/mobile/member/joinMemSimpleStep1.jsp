<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login page-join"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>회원가입</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .combineMem S -->
			<section class="combineMem">
				<form id="dataForm" name="dataForm" method="post">
					<input type="hidden" name="joinType" id="joinType" value="memberSimple"/> 
					<input type="hidden" name="emailCheckYn" id="emailCheckYn"/>
					<input type="hidden" name="emailCheck" id="emailCheck"/>
					<dl>
						<dt>
							<h3>마켓플랜트 회원가입</h3>
							<p class="sub_tx">
								<span>이메일을 이용한 간편 가입 방식으로 누구나 가입 가능합니다.<br/>현재 사용중인 이메일로 회원가입 해주세요.</span>
							</p>
						</dt>
						<dd class="dd_tabMn">
							<ol class="ui-grid-c">
								<li class="ui-block-a on">
									<p>
										<span>STEP 01</span>
										<strong>본인인증</strong>
									</p>
								</li>
								<li class="ui-block-b">
									<p>
										<span>STEP 02</span>
										<strong>약관동의</strong>
									</p>
								</li>
								<li class="ui-block-c ">
									<p>
										<span>STEP 03</span>
										<strong>정보확인</strong>
									</p>
								</li>
								<li class="ui-block-d">
									<p>
										<span>STEP 04</span>
										<strong>가입완료</strong>
									</p>
								</li>
							</ol>
						</dd>
		
						<dd class="dd_myinfo">
							<table>
								<caption>본인인증에 이름, 이메일주소, 인증번호로 구성된 표</caption>
								<colgroup>
								<col style="width:100px" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong>이름</strong><i class="co_red">*</i></th>
										<td class="td_name">
											<div class="inp_box">										
												<label for="MEM_MST_MEM_NM">
													<input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" maxlength="10"/>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th><strong>이메일 주소</strong></th>
										<td class="td_email2">
											<div class="inp_box">										
												<label for="inp_email">
													<input type="text" name="MEM_CTF_MAIL" id="MEM_CTF_MAIL" class="inp_mail" maxlength="50"/>
												</label>
											</div>
											<a href="javascript:mailCertify();" class="btn_gre2"><strong>인증번호 받기</strong></a>
										</td>
									</tr>
									<tr>
										<th><strong>인증번호</strong></th>
										<td class="td_certif">
											<div class="inp_box">										
												<label for="inp_certif">
													<input type="text" name="MEM_CTF_NO" id="MEM_CTF_NO" placeholder="인증번호를 입력해주세요." maxlength="10"/>
												</label>
											</div>
											<span class="tx_ex">이메일로 전송된 인증번호를 입력해주세요.</span>
										</td>
									</tr>
								</tbody>
							</table>
		
							<p class="tx_ex">
								<span><i class="ico_exc">!</i>이메일로 전송된 인증번호 유효기간은 4시간입니다. <br/>유효기간이 지난 경우 인증번호를 다시 신청해 주세요.</span>
							</p>
							<div class="btn_box">
								<a href="javascript:goCert();" class="btn_red"><strong>본인인증확인</strong></a>
							</div>
						</dd>
					</dl>
				</form>
			</section>
			<!--// .combineMem E -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	var $dataForm = $("#dataForm");
	
	// 폼체크
    $dataForm.validate(
    {
        rules: 
        {
        	MEM_MST_MEM_NM:{required:true},	// 이름
        	MEM_CTF_MAIL:{required:true, email:true},	// 이메일
        	MEM_CTF_NO:{required:{depends:function(){
            	if($("#emailCheckYn").val() != "") return true;
                else return false;
            }}, minlength:10, maxlength:10} 	// 인증번호
        },
        messages :
        {
        	MEM_MST_MEM_NM : {required:"이름을 입력해주세요."},
        	MEM_CTF_MAIL : {required:"이메일을 입력해주세요."},
        	MEM_CTF_NO: {required:"인증번호를 입력해주세요.", minlength:"인증번호는 최소 10글자 이상입니다.", maxlength:"인증번호는 최대 10글자입니다."}
        }
        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
	    	   //alert('[' + caption + '] ' + errorList[0].message);
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
	
	// 인증번호 받기 클릭 이벤트
	mailCertify = function(){
		if($dataForm.valid()){
			
			//$("#emailCheck").val($.trim($("#MEM_CTF_MAIL").val()));	// 인증번호 받은 이메일
			
			$.ajax({
                async : false,
                type : "POST",
                data : {"MEM_CTF_MAIL":$.trim($("#MEM_CTF_MAIL").val()), "MEM_MST_MEM_NM":$.trim($("#MEM_MST_MEM_NM").val())},
                url : "<c:out value="${mobileSslDomain}" />/mobile/member/checkEmailAjax.do",
                success : function (data) {
                    if(data.successYn == "Y")
                    {
                        if(data.resultYn == "N")
                        {
                        	alert("이미 회원가입하셨습니다.\n로그인 화면으로 이동합니다.");
                        	$dataForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/manager/login.do", "target":"_self", "method":"post"}).submit();	
                        }
                        else
                        {
                        	alert("인증번호가 발송되었습니다.");
                        }
                        
                        $("#MEM_CTF_NO").focus();
                        //$("#emailCheckYn").val(data.resultYn);
                        return;
                    }
                    else
                    {
                        alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
                        return;
                    }
                },
                error : function () {
                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                }
            });
		}
	};
	
	// 인증번호 확인 클릭 이벤트
	goCert = function(){

		// 중복체크한 이메일이 있는경우 폼에 있는 이메일과 일치하는지 비교
// 		if($("#emailCheck").val() != ""){
			
// 			if($("#emailCheck").val() != $("#MEM_CTF_MAIL").val()){
//         		alert("인증한 이메일과 입력하신 이메일이 일치하지않습니다.");
//         		$("#MEM_CTF_MAIL").focus();
//                 return;	            		
//         	}	
// 		}
		
		if($dataForm.valid()){
			
// 			var $chkObj = $("#emailCheckYn");
//             var $obj = $("#emailCheck");
//             if($chkObj.val() == "Y")	// 중복체크 성공
//             {
//             	if($("#emailCheck").val() == $("#MEM_CTF_MAIL").val()){		// 1. 중복체크 값과 email필드 값이 같은 경우
            		
            		$.ajax({
    	                async : false,
    	                type : "POST",
    	                data : {"MEM_CTF_NO":$("#MEM_CTF_NO").val(),"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val()},
    	                url : "<c:out value="${mobileSslDomain}" />/mobile/member/checkCertNoAjax.do",
    	                success : function (data) {
    	                    if(data.resultYn == "Y"){
    	                    	alert("본인 인증처리가 완료되었습니다.");
    	                    	$dataForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/member/joinMemSimpleStep2.do", "target":"_self", "method":"post"}).submit();
    	                    }
    	                    else if(data.resultYn == "O"){
    	                    	alert("인증 유효기간이 지났습니다.\n인증번호를 다시 발급받으시길바랍니다.");
    	                    	$(".btn_blk777").focus();
    	                    	return;
    	                    }
    	                    else if(data.resultYn == "N"){
    	                    	alert("이메일 인증번호을 발급받으셔야 합니다.\n인증번호 받기를 눌러주세요.");
    	 	            		$("#MEM_CTF_MAIL").focus();
    	 	                    return;
    	                    }
    	                    else
    	                    {
								alert("인증번호가 틀렸습니다.\n다시 확인 하신 후 입력바랍니다.");
								$("#MEM_CTF_NO").focus();
								return;
    	                    }
    	                },
    	                error : function () {
    	                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
    	                }
    	            });
//             	}   
//             	else{
//             		alert("인증한 이메일과 입력하신 이메일이 일치하지않습니다.");
//             		$("#MEM_CTF_MAIL").focus();
//                     return;
//             	}
//             }
//             else
//             {
//             	alert("인증번호를 발급받아주시기 바랍니다.");
//             	$(".btn_gre2").focus();
//                 return;
//             }
		}
	};
});
//]]>
</script>
</body>
</html>