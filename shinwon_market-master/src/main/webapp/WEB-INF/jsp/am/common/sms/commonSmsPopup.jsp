<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">문자 발송</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		
		<h2 class="semantic">문자 발송</h2>
		
		<div class="contents-inner"><!-- contents-inner -->
		
		<div class="section-form"><!-- section-form-a -->
			<form id="frm" method="post">
			<input type="hidden" name="SEND_TYPE" value="lms" />
				<!--  		
				<div class="form-group">
		             <label class="label"><span>발송형태 <em class="strong">*</em></span></label>
		             <div class="field">
		            	 <input type="radio" id="lms" name="SEND_TYPE" value="lms" checked="checked"/><label for="lms">LMS</label>
		             	<input type="radio" id="sms" name="SEND_TYPE" value="sms"/><label for="sms">SMS</label>
		             </div>
		         </div>
				  -->
				<div class="form-group">
		             <label class="label"><span>전화번호 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <input type="text" name="PHONE_NOs" id="PHONE_NOs" class="text long" placeholder="콤마(,)로 구분해서 복수 입력 가능" value="<c:out value="${commandMap.PHONE_NO }"/>" maxlength="1000"/><br />
						 예) 01011112222,01022223333		                 
		             </div>
		         </div>
		         
				<div class="form-group lmsDiv">
		             <label class="label"><span>제목 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <input type="text" name="TR_SUBJECT" id="TR_SUBJECT" class="text long" placeholder="최대 26byte까지 입력하실 수 있습니다."/><br />
		                    예) 없을경우 '[마켓플랜트]'  으로 입력됩니다.
		                 <span id="byte">0</span>/26
		             </div>
		         </div>
		         
		         <div class="form-group">
		             <label class="label"><span>내용 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <textarea class="textarea LMS_MSG" name="TR_MSG" id="TR_MSG" style="width:90%;"></textarea>
		                 <span id="msgbyte">0</span><span id="trMsgMaxByte">/2600</span>
		             </div>
		         </div>
			</form>
		</div>
		
		 <div class="section-button"><!-- section button -->
             <a href="#none" id="goRegist" class="button button-b"><span>발송</span></a>
             <a href="javascript:self.close();" id="goList" class="button button-a"><span>취소</span></a>
         </div><!-- // section button --> 
         
         </div>
         
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("keyup","#TR_SUBJECT",function(){
		getStrByte(this,'#byte', 26, 2);
	});
	
	$(document).on("keyup",".LMS_MSG",function(){
		getStrByte(this,'#msgbyte', 2600, 2);
	});
	
	$(document).on("keyup",".SMS_MSG",function(){
		getStrByte(this,'#msgbyte', 80, 2);
	});
	
	var submitCnt = 0;
	$(document).on("click","#goRegist",function(){
		if(submitCnt == 0){
			
			//var phoneCheck = /^[0-9\,\-\s]*$/;
			var phoneCheck = /^[\,\-\^\s]*$/;
			
			/*
			if( !phoneCheck.test($.trim($("#PHONE_NOs").val())) ){
				alert("전화번호는 숫자, 하이픈(-), 콤마(,)만 허용됩니다.");
				$("#PHONE_NOs").focus();
				return;
			}
			*/
			
			if($.trim($("#PHONE_NOs").val()) == ""){
				alert("전화번호를 입력해주세요.");
				$("#PHONE_NOs").focus();
				return;
			}
			
			//if($("#lms").is(":checked")){
				/* if($.trim($("#TR_SUBJECT").val()) == ""){
					alert("제목을 입력해주세요.");
					$("#TR_SUBJECT").focus();
					return;
				} */
			//}
			
			if($.trim($("#TR_MSG").val()) == ""){
				alert("내용을 입력해주세요.");
				$("#TR_MSG").focus();
				return;
			}
			
			if(confirm("발송하시겠습니까?")){
				submitCnt = submitCnt + 1;
				$("#frm").attr("action","<c:out value="${serverDomain}" />/am/common/commonSmsProc.do").submit();
			}
			
		}else{
			alert("발송중입니다.");
			return;
		}
	});
	
	$(document).on("change","input[name=SEND_TYPE]",function(){
		var $this = $(this).val();
		if($this == "sms"){
			$(".lmsDiv").hide();
			$("#trMsgMaxByte").text("/80");
			$("#TR_MSG").removeClass("LMS_MSG").addClass("SMS_MSG").trigger("keyup");
		}else{
			$(".lmsDiv").show();
			$("#trMsgMaxByte").text("/2600");
			$("#TR_MSG").removeClass("SMS_MSG").addClass("LMS_MSG").trigger("keyup");
		}
	});
	
});
</script>
</body>
</html>