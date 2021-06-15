<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/placeholders.jquery.min.js"></script>
<div id="container">
            <!-- #content_area -->
            <div id="content_area">
            	<form name="nonMemberForm" id="nonMemberForm">
			    	<input type="hidden" name="pageType" id="pageType" value="nonMember"/> 
			        <input type="hidden" name="ROLE_USER" value="order_guest" />
			        <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url }"/>"/>
            
                <div class="cp01 join_wp">
                    <div class="writeWrap">
                        <div class="name">주문자명</div>
                        <div class="form">
                            <input type="text" id="ORD_MST_ORD_NM"	name="ORD_MST_ORD_NM"	title="주문자명 입력" placeholder="주문자명 입력" maxlength="15">
                        </div>
                        <div class="name">주문번호</div>
                        <div class="form">
                            <input type="text" id="ORD_MST_CD" name="ORD_MST_CD"	title="주문번호 입력" placeholder="주문번호 입력" maxlength="15">
                        </div>
                    </div>
                    <div class="btn_area">
                        <button type="button" class="btn black" onclick="goGuestDelivery()">비회원 주문조회</button>
                    </div>
                    <div class="gray_bx">
                        <p class="tit">주문번호를 잊으셨나요? </p>
                        <ul class="dot_list2">
                            <li>알림톡(SMS) 또는 이메일의 주문번호를 확인해 주세요.</li>
                            <li>고객센터 <span class="t_point" id="answerTab">1:1문의</span> 또는 1661-2585로 문의해 주세요.</li>
                        </ul>
                    </div>
                </div>
                <div class="sns_member_wp">
                    <div class="sns_mb">
                        <p class="t_tit">쑈윈도 회원가입시 다양한 혜택 제공!</p>
                        <p class="t_txt">등급별 멤버십 혜택<br>포인트 증정&적립<br>회원가입 쿠폰 증정 </p>
                        <div class="btn_area">
                            <button type="button" class="btn ok" id="joinBtn">회원가입</button>
                        </div>
                    </div>
                    <!-- <div class="offline_mb">
                        <p class="t_tit">신원 오프라인 매장의 회원이세요? </p>
                        <p class="t_txt">등급별 멤버십 혜택<br>신원 통합회원 전환시 5,000 포인트 즉시 증정</p>
                        <div class="btn_area">
                            <button type="button" class="btn black" id="joinConvertBtn">통합회원전환</button>
                        </div>
                    </div> -->
                </div>
				</form>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>

<script>
	//비회원 주문조회
	goGuestDelivery = function () {
		var $nonMemberForm = $("#nonMemberForm");
		if($nonMemberForm.valid()){
			$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
			$nonMemberForm.attr({"action":"<c:out value="${serverSslDomain}"/>/mobile/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
	        return false;
		}
	};
	
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
	
    // 비회원 주문번호 엔터 이벤트
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
    
    //회원가입 클릭 이벤트
    $("#joinBtn").on("click", function () {
		location.href = "/mobile/member/joinMemType.do";
	});
    
    $("#joinConvertBtn").on("click", function () {
		location.href = "<c:out value="${serverDomain}"/>/mobile/member/offlineMemStep1.do";
	});
    
    $("#answerTab").on("click", function () {
		location.href = "<c:out value="${serverDomain}"/>/mobile/mypage/myInquiryForm.do";
	});

</script>