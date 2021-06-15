<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">이메일 발송 ( 실시간 )</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		
		<h2 class="semantic">이메일 발송</h2>
		
		<div class="contents-inner"><!-- contents-inner -->
		
		<div class="section-form"><!-- section-form-a -->
			<form id="frm" method="post">
				
				
				<div class="form-group">
		             <label class="label"><span>이벤트 ID <em class="strong">*</em></span></label>
		             <div class="field">
		                 <input type="text" name="MAIL_CODE" id="MAIL_CODE" class="text long" placeholder="이벤트 ID(숫자만 기입)" maxlength="2" />
		             </div>
		         </div>				
				
				
				<div class="form-group">
		             <label class="label"><span>수신자 이메일 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" class="text long" placeholder="수신자 이메일" maxlength="1000"/>
		             </div>
		         </div>
		         
				<div class="form-group">
		             <label class="label"><span>수신자 이름 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <input type="text" name="MEMBER_NAME" id="MEMBER_NAME" class="text long" placeholder="수신자 이름" maxlength="1000"/>
		             </div>
		         </div>
		         
				<div class="form-group lmsDiv">
		             <label class="label"><span>제목 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <input type="text" name="EMAIL_TITLE" id="EMAIL_TITLE" class="text long" placeholder="최대 200byte까지 입력하실 수 있습니다."/><br />
		                 <span id="byte">0</span>/200
		             </div>
		         </div>
		         
		         <div class="form-group">
		             <label class="label"><span>내용 <em class="strong">*</em></span></label>
		             <div class="field">
		                 <textarea class="textarea LMS_MSG" name="EMAIL_CONTENTS" id="EMAIL_CONTENTS" style="width:90%;"></textarea>
		                 <!-- <span id="msgbyte">0</span><span id="trMsgMaxByte">/2600</span> -->
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
	$(document).on("keyup","#EMAIL_TITLE",function(){
		getStrByte(this,'#byte', 200, 2);
	});
	
	
	
	var $frm = $("#frm");
	
	// 폼체크
    $frm.validate(
    {
        rules: 
        {
        	MAIL_CODE	: {required:true,number:true,maxlength:2},				 // 이벤트 코드
        	MEMBER_EMAIL: {required:true},				 						 // 수신자 이메일 주소
        	MEMBER_NAME : {required:true},				 						 // 수신자 이름
        	EMAIL_TITLE : {required:true},				 						 // 이메일 제목
        	EMAIL_CONTENTS : {required:true}				 					 // 이메일 내용
        },
        messages :
        {
        	MAIL_CODE: {required:"[이벤트 코드]는 필수 정보입니다."},
        	MEMBER_EMAIL: {required:"[수신자 이메일 주소]는 필수 정보입니다."},
        	MEMBER_NAME: {required:"[수신자이름]은 필수 정보입니다."},
        	EMAIL_TITLE: {required:"[이메일 제목]는 필수 정보입니다."},
        	EMAIL_CONTENTS: {required:"[이메일 내용]는 필수 정보입니다."}
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
	
	var submitCnt = 0;
	$(document).on("click","#goRegist",function(){
		if(submitCnt == 0){
			
			if($frm.valid()){
				
				if(confirm("발송하시겠습니까?")){
					submitCnt = submitCnt + 1;
					$("#frm").attr("action","<c:out value="${serverDomain}" />/am/common/commonEmailSendProc.do").submit();
				}
			}
			
		}else{
			alert("발송중입니다.");
			return;
		}
	});
	
});
</script>
</body>
</html>