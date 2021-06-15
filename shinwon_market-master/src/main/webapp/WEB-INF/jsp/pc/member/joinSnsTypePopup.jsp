<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-login"><!-- page-login : 850x644 --> 

<!-- #container S -->
<article id="container" class="container">
	<form name="memberForm" id="memberForm">
        <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />
        <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
        <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
        <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />
        <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />             
        <input type="hidden" name="joinType" id="joinType" value="<c:out value="memberSns"/>" />                 
      
	<div class="minW2 contents"><!-- .contents S -->
		<ul class="login_form sty_naver login_popup">  
			<li class="ti">
				<h2>SNS 인증</h2>
				<hr class="bg_line_5px" />
			</li>
	  
            <!-- ------------------- SNS 로그인 > NAVER/FACEBOOK/KAKAOTALK 버튼 ------------------- -->   
            <li style="margin-bottom: 10px;">
                <c:if test="${not empty snsUseList }">
                    <c:forEach var="snsUseRow" items="${snsUseList }" varStatus="i">  
		                 <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '네이버' }">
		                     <input type="hidden" name="SNS_NAVER_API_KEY" id="SNS_NAVER_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />
		                     <input type="hidden" name="SNS_NAVER_CODE" id="SNS_NAVER_CODE" value="${snsUseRow.SNS_MST_TYPE }" />      
		                 </c:if>   
		                 <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '카카오' }">  
		                     <input type="hidden" name="SNS_KAKAO_API_KEY" id="SNS_KAKAO_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />
		                     <input type="hidden" name="SNS_KAKAO_CODE" id="SNS_KAKAO_CODE" value="${snsUseRow.SNS_MST_TYPE }" />  
		                 </c:if>  
		                 <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '페이스북' }">        
		                     <input type="hidden" name="SNS_FACEBOOK_API_KEY" id="SNS_FACEBOOK_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />
		                     <input type="hidden" name="SNS_FACEBOOK_CODE" id="SNS_FACEBOOK_CODE" value="${snsUseRow.SNS_MST_TYPE }" />  
		                 </c:if>      
		             </c:forEach>      
                </c:if>   
            </li>   
            <!-- ---------------------------------------------------------------------------------- -->   
            
		</ul>
	</div><!--// .contents E -->
	</form>
</article>
<!--// #container E -->
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>  
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>     
<script src="<c:out value="${serverDomain}" />/am/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/am/js/kakao.min.js" charset="utf-8"></script>                   <!-- kakao 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/am/js/snsSDK.js" charset="utf-8"></script>                      <!-- sns   자바스크립트 SDK -->

<script>
	$(function(){      
		var id_save = $('.login_form .inp_chk'),
			ddClick = false;
	
		//체크박스
		id_save.on('click',function(e){
			if(ddClick == true) return false;
			var _this = $(this),
				_has = _this.hasClass('on');
	
			ddClick = true;
			if(_has) _this.removeClass('on').children('input').prop('checked', false).attr('checked', false);
			else _this.addClass('on').children('input').prop('checked', true).attr('checked', true);
	
			setTimeout(function(){
				ddClick = false;
			},100);
		});
	});
</script>

<script type="text/javascript">

/* 네이버 로그인은 redirect_Url 사용 */
// 페이스북, 카카오톡 로그인 이벤트
fnSnsLogin = function(data)    
{ 
    if(data != null) 
    {        
        var $memberForm = $("#memberForm");
         
        // 로그인 타입
        $memberForm.find("input[name=ROLE_USER]").val("sns");  // SNS 로그인
        
        // sns 로그인 시 sns 타입   
        if(data.sns == "facebook")
        {  
            $memberForm.find("input[name=MEM_SNS_TYPE]").val($('#'));  
            $memberForm.find("input[name=MEM_SNS_ID]").val(data.id);  
            $memberForm.find("input[name=MEM_SNS_NM]").val(data.name);
            $memberForm.find("input[name=MEM_SNS_EMAIL]").val(data.email);
        }
        else if(data.sns == "kakaotalk")
        {
            $memberForm.find("input[name=MEM_SNS_TYPE]").val(data.sns);   
            $memberForm.find("input[name=MEM_SNS_ID]").val(data.id);  
            $memberForm.find("input[name=MEM_SNS_NM]").val(data.name);    
            $memberForm.find("input[name=MEM_SNS_EMAIL]").val("Y");  
        }
        else if(data.sns == "naver")
        {
            $memberForm.find("input[name=MEM_SNS_TYPE]").val(data.sns);   
            $memberForm.find("input[name=MEM_SNS_ID]").val(data.id);  
            $memberForm.find("input[name=MEM_SNS_NM]").val(data.name);    
            $memberForm.find("input[name=MEM_SNS_EMAIL]").val(data.email);    
        }  
        else
        {
        	 alert("SNS 인증에 실패하셨습니다. 다시 시도해주세요.");
        }
            
        // 부모창으로 submit 방식
        opener.name = "openerParent";    
        $memberForm.attr({"action":"<c:out value="${serverDomain}"/>/pc/member/joinMemSnsStep2.do", "method":"post", "target":"openerParent"}).submit();
        
        window.close();  
    }
};     
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>