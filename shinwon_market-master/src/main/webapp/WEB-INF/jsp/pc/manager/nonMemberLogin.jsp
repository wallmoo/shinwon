<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

 <!-- Content -->
	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">비회원 주문조회</h2>
			</div>
			<!--// Title -->

			<!-- 로그인폼 -->
			<div class="login_wrap">
				<div class="login_form">
					<form name="nonMemberForm" id="nonMemberForm">
			    	<input type="hidden" name="pageType" id="pageType" value="nonMember"/> 
			        <input type="hidden" name="ROLE_USER" value="order_guest" />
			        <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url }"/>"/>
					<ul>
						<li>
							<input type="text"  placeholder="주문자명 입력" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM">
						</li>
						<li>
							<input type="password" placeholder="주문번호 입력" name="ORD_MST_CD" id="ORD_MST_CD" maxlength="15">
						</li>
					</ul>
					</form>
					<div class="btn_login_wrap">
						<button class="btn_large ok" id="guest_inquiry">비회원 주문조회</button>
					</div>
					<dl class="logo_inquire">
						<dt>주문번호를 잊으셨나요?</dt>
						<dd>알림톡(SMS) 또는 이메일의 주문번호를 확인해 주세요.<br/>
								고객센터 <a href="#" id="answerTab"><span class="purple">1:1문의</span></a> 또는 1661-2585로 문의해 주세요.
						</dd>
					</dl>
				</div>
				<div class="login_info">
					<div class="info_box">
						<strong class="tit">쑈윈도 회원가입시 다양한 혜택 제공!</strong>
						<ul class="info_benefit">
							<li>
								<span>등급별<br>멤버십 혜택</span>
							</li>
							<li>
								<span>포인트 증정<br>& 적립</span>
							</li>
							<li>
								<span>회원가입<br>쿠폰 증정</span>
							</li>
						</ul>
						<button type="button"	class="btn_small" id="joinBtn">회원가입</button>
					</div>
					<!-- <div class="info_box">
						<strong class="tit">신원 오프라인 매장의 회원이세요?</strong>
						<ul class="ul_dash">
							<li>등급별 멤버십 혜택</li>
							<li>신원 통합회원 전환시 5,000 포인트 즉시 증정</li>
						</ul>
						<button	type="button" class="btn_small" id="joinConvertBtn">통합회원 전환</button>
					</div> -->
				</div>
			</div>
			<!--// 로그인폼 -->




		</div>
	</div>
	<!--// Content -->
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script>
	
	
	//비회원 주문조회
	function goGuestDelivery () 
	{
	    var $nonMemberForm = $("#nonMemberForm");
	    
	    if($nonMemberForm.valid())
	    {
	    	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
	    	
	        $nonMemberForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
	        return false;
	    }
	};
	
	//화면 페이지 이동
	$(function () {
		$("#answerTab").on("click", function () {
			location.href = "<c:out value="${frontDomain}"/>/pc/mypage/myInquiryForm.do";
		})
		
		$("#joinBtn").on("click", function () {
			location.href = "<c:out value="${frontDomain}"/>/pc/member/joinMemType.do";
		})
		
		$("#joinConvertBtn").on("click", function () {
			location.href = "<c:out value="${frontDomain}"/>/pc/member/offlineMemStep1.do";
		})
	
		$("#ORD_MST_ORD_NM").focus();
	
	// 폼체크
    $("#nonMemberForm").validate({
        rules: {
            ORD_MST_CD:{required:true}, // 주문번호
            ORD_MST_ORD_NM:{required:true} // 주문자명
        },
        messages :{
            ORD_MST_CD : {required:"주문번호를 입력해주세요."},
            ORD_MST_ORD_NM : {required:"주문자명을 입력해주세요."}
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
	
  //비회원 주문번호 엔터 이벤트
	$(document).on("keydown", "#ORD_MST_CD", function (e){
		if(e.keyCode == 13){
	    	goGuestDelivery();
	    }
	});
	
	// 비회원 주문자명 엔터 이벤트
	$(document).on("keydown", "#ORD_MST_ORD_NM", function (e){
	    if(e.keyCode == 13){
	    	goGuestDelivery();
	    }
	});
	
	$('#guest_inquiry').on('click',goGuestDelivery);
	
});
	
</script>	