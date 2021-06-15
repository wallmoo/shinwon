<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<form id="dataForm" name="dataForm" method="post">
			<input type="hidden" name="joinType" id="joinType" value="memberSimple"/> 
			<input type="hidden" name="emailCheckYn" id="emailCheckYn"/>
			<input type="hidden" name="emailCheck" id="emailCheck"/>
			<div class="contents"><!-- .contents S -->
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
					<dd class="tx_sub">
						<p>이메일을 이용한 간편 가입 방식으로 누구나 가입 가능합니다.<br/>현재 사용중인 이메일로 회원가입 해주세요.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f on"><strong><span>01</span>본인인증</strong></li>
							<li><strong><span>02</span>약관동의</strong></li>
							<li><strong><span>03</span>정보입력</strong></li>
							<li class="l"><strong><span>04</span>가입완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con"><!-- .join_con S -->
					<li class="certi_con">
						<div class="con">
							<table>
								<caption>본인인증 / 이름, 이메일주소, 인증번호로 구성된 표</caption>
								<colgroup>
								<col style="width:90px" />
								<col />
								</colgroup>
								<tbody>
									<tr class="tr_name">
										<th><label for="MEM_MST_MEM_NM"><span>이름</span></label></th>
										<td>
											<div class="inp_box">
												<input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" maxlength="10"/>
											</div>
										</td>
									</tr>
									<tr class="tr_email">
										<th><label for="MEM_CTF_MAIL"><span>이메일주소</span></label></th>
										<td>
											<div class="inp_box">
												<input type="text" name="MEM_CTF_MAIL" id="MEM_CTF_MAIL" class="inp_mail" maxlength="50"/>
												<a href="javascript:mailCertify();" class="btn_st0 btn_blk777"><span>인증번호 받기</span></a>
											</div>
										</td>
									</tr>
									<tr class="tr_name">
										<th><label for="MEM_CTF_NO"><span>인증번호</span></label></th>
										<td>
											<div class="inp_box">
												<input type="text" name="MEM_CTF_NO" id="MEM_CTF_NO" placeholder="메일로 전송된 인증번호를 입력해주세요." maxlength="10"/>
											</div>
										</td>
									</tr>
									<tr class="tr_ex">
										<th><span class="blind">유의사항</span></th>
										<td>
											<p class="tx_ex2">
												<span>이메일로 전송된 인증번호 유효기간은 4시간입니다. </span>
												<span>유효기간이 지난 경우 인증번호를 다시 신청해주세요.</span>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li class="btn_box">
						<a href="javascript:goCert();" class="btn_st2 btn_rd"><span>본인인증  확인</span></a>
					</li>
				</ul><!--// .join_con E -->
			</div><!--// .contents E -->
			</form>
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
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
	                url : "<c:out value="${serverSslDomain}" />/pc/member/checkEmailAjax.do",
	                success : function (data) {
	                    if(data.successYn == "Y")
	                    {
	                        if(data.resultYn == "N")
	                        {
	                        	alert("이미 회원가입하셨습니다.\n로그인 화면으로 이동합니다.");
	                        	$dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/manager/login.do", "target":"_self", "method":"post"}).submit();	
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
// 			if($("#emailCheck").val() != ""){
				
// 				if($("#emailCheck").val() != $("#MEM_CTF_MAIL").val()){
// 	        		alert("인증한 이메일과 입력하신 이메일이 일치하지않습니다.");
// 	        		$("#MEM_CTF_MAIL").focus();
// 	                return;	            		
// 	        	}	
// 			}
			
			if($dataForm.valid()){
				
				//var $chkObj = $("#emailCheckYn");
	            //var $obj = $("#emailCheck");
	            //if($chkObj.val() == "Y")	// 중복체크 성공
	            //{
	            	//if($("#emailCheck").val() == $("#MEM_CTF_MAIL").val()){		// 1. 중복체크 값과 email필드 값이 같은 경우
	            		
	            		$.ajax({
	    	                async : false,
	    	                type : "POST",
	    	                data : {"MEM_CTF_NO":$("#MEM_CTF_NO").val(),"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val()},
	    	                url : "<c:out value="${serverSslDomain}" />/pc/member/checkCertNoAjax.do",
	    	                success : function (data) {
	    	                    if(data.resultYn == "Y"){
	    	                    	alert("본인 인증처리가 완료되었습니다.");
	    	                    	$dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemSimpleStep2.do", "target":"_self", "method":"post"}).submit();
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
// 	            	}   
// 	            	else{
// 	            		alert("인증한 이메일과 입력하신 이메일이 일치하지않습니다.");
// 	            		$("#MEM_CTF_MAIL").focus();
// 	                    return;
// 	            	}
	           // }
// 	            else
// 	            {
// 	            	alert("인증번호를 발급받아주시기 바랍니다.");
// 	            	$(".btn_blk777").focus();
//                     return;
// 	            }
			}
		};
	    
	});
</script>
</body>
</html>