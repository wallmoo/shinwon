<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- SNS INIT INFO -->
	<form name="snsInitForm" id="snsInitForm">
		<input type="hidden" name="FRONT_DOMAIN" id="FRONT_DOMAIN" value="<c:out value="${frontDomain}" />" />
<%-- 		<input type="hidden" name="url" value="<c:out value="${commandMap.url}"/>"/> --%>
        <input type="hidden" name="locationProtocol" value="<c:out value="${commandMap.locationProtocol }"/>"/>
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
	</form>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <form name="memberForm" id="memberForm"> 
                <input type="hidden" name="pageType" id="pageType" value="main"/>  <!-- 메인로그인창 -->
                <input type="hidden" name="ROLE_USER" value="user" />
                <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
                
                <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />
            <div id="content_area">
                <div class="cp01 join_wp">
                    <div class="writeWrap">
                        <div class="name">아이디</div>
                        <div class="form">
                            <input type="text" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" title="아이디 입력" placeholder="아이디 입력" maxlength="15">
                        </div>
                        <div class="name">비밀번호</div>
                        <div class="form">
                            <input type="password" id="MEM_MST_WEB_PWD"	name="MEM_MST_WEB_PWD" title="비밀번호 입력" placeholder="비밀번호 입력" maxlength="15">
                            <div class="space2">
                                <div class="id_save">
                                    <input type="checkbox" name="saveId" id="saveId">
                                    <label for="saveId">아이디 저장</label>
                                </div>
                                <a href="<c:out value="${serverDomain }"/>/mobile/manager/idFind.do?gubun=ID"  class="btn_find">>아이디/비밀번호 찾기</a>
                            </div>
                        </div>
                    </div>
                    <div class="btn_area">
                        <button onclick="login()"	type="button" class="btn ok">로그인</button>
                        <button type="button" class="btn black" id="nonMemberLoginBtn">비회원 주문조회</button>
                    </div>
                </div>
                <div class="sns_member_wp">
                    <div class="sns_mb">
		                <form id="searchForm" name="searchForm">
							<input type="hidden" name="searchPrdMstCd" 			value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
							<input type="hidden" name="searchPrdMstNm" 			value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
							<input type="hidden" name="searchPrdCtgIdx"			value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
							<input type="hidden" name="searchPrdCtgEnv"			value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" />
							<input type="hidden" name="searchPrdCtgDepth1" 		value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" />
							<input type="hidden" name="searchPrdCtgDepth2" 		value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" />
							<input type="hidden" name="searchPrdCtgDepth3" 		value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" />
							<input type="hidden" name="searchPrdCtgDepth4" 		value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" />
							<input type="hidden" name="searchPrdMstSellState"  	value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
		                    <input type="hidden" name="searchPrdMstDplState"    value="<c:out value="${commandMap.searchPrdMstDplState }"/>" />
		                    <input type="hidden" name="searchPrdMstApvState"    value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
							<input type="hidden" name="searchPrdMstMdId"	    value="<c:out value="${commandMap.searchPrdMstMdId }"/>" />
							<input type="hidden" name="cPage"                   value="<c:out value="${commandMap.cPage }"/>" />
							<input type="hidden" name="searchDetailY"           value="<c:out value="${commandMap.searchDetailY }"/>" />
							<input type="hidden" name="searchYn"                value="<c:out value="${commandMap.searchYn }"/>" />
							<input type="hidden" name="pageSize"                value="<c:out value="${commandMap.pageSize }"/>" />
							<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV"	   value="${commandMap.PRD_CTG_ENV}" />
							<input type="hidden" id="PRD_SPC_ENV" name="PRD_SPC_ENV"       value="${commandMap.PRD_SPC_ENV}" />
							<input type="hidden" id="PRD_SPC_TYPE" name="PRD_SPC_TYPE" />
							<input type="hidden" id="PRD_CTG_BRAND" name="PRD_CTG_BRAND"   value="" />
						</form>
                        <p class="title">SNS 로그인</p>
                        <div class="btn_sns">
                            <a href="javascript:loginKakao();"		 class="kakao"		id="custom-login-btn">카카오톡</a>
                            <a href="javascript:loginNaver();" 		 class="naver"		id="naver_id_login">네이버</a>
                            <a href="javascript:loginFacebook();" 	 class="facebook"	id="facebook_login">페이스북</a>
                        </div>
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
                            <button type="button" class="btn black"	id="joinConvertBtn">통합회원전환</button>
                        </div>
                    </div> -->
                </div>

            </div>
            </form>
            <!-- // #content_area -->
        </div>
        
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/kakao.min.js" charset="utf-8"></script>                   <!-- kakao 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/snsSDK.js" charset="utf-8"></script>  

<script>
	$(function(){
		var id_save = $('.login_form .inp_chk'),
			ddClick = false;
	
		//아이디 저장
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
<script>
	//쿠키저장된 아이디 
	/* $(function () {
		cookie();
		function cookie()
		{
			var cookieMarketPlantUserId = $.cookie("cookieMarketPlantUserId");

			if(cookieMarketPlantUserId != null && cookieMarketPlantUserId != "") // 쿠키가  존재 할경우
			{
				$(".inp_chk").attr("class","inp_chk on");
			    $("#saveId").attr("checked", "checked");
			    $("#MEM_MST_MEM_ID").val(cookieMarketPlantUserId);
			    $("#MEM_MST_WEB_PWD").focus();
			}
			else // 쿠키가 존재하지 않을경우
			{
			    $("#MEM_MST_MEM_ID").focus();
			}
		}
	}) */
	
	// 폼체크
	$("#memberForm").validate({
	    rules: {
	        MEM_MST_MEM_ID:{required:true}, // 아이디
	        MEM_MST_WEB_PWD:{required:true} // 비밀번호
	    },
	    messages :{
	    	MEM_MST_MEM_ID : {required:"아이디를 입력해주세요."},
	    	MEM_MST_WEB_PWD : {required:"비밀번호를 입력해주세요."}
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
	
	// 아이디 form 엔터 이벤트
    $(document).on("keydown", "#MEM_MST_MEM_ID", function (e){
        if(e.keyCode == 13){
            login();
        }
    });
	
 	// 비밀번호 form 엔터 이벤트
    $(document).on("keydown", "#MEM_MST_WEB_PWD", function (e) {
        if(e.keyCode == 13){
            login();
        }
    });
  	
 	//회원 로그인
    function login () 
    {
    	var $memberForm = $("#memberForm");
        if($memberForm.valid())
        {
        	// 로그인 타입
            $memberForm.find("input[name=ROLE_USER]").val("user");  // 일반 로그인
            
        	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
        	
            $memberForm.attr({"action":"<c:out value="${serverDomain}"/>/mobile/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
            return false;
        }
    }
 	
 	 //비회원 구매/주문조회 클릭 이벤트
	/* nonMemberLogin = function(){
		if("${commandMap.ORD_MST_CD}" != ""){
			location.href = "<c:out value="${serverSslDomain}"/>/mobile/manager/nonMemberLogin.do?ORD_MST_CD=${commandMap.ORD_MST_CD}";
		}else{
			location.href = "<c:out value="${serverSslDomain}"/>/mobile/manager/nonMemberLogin.do";	    		
		}
	}; */
	
	//회원가입
	$("#joinBtn").on("click", function () {
		location.href = "<c:out value="${mobileSslDomain}"/>/mobile/member/joinMemType.do"
	});
	
	//통합회원전환
	$("#joinConvertBtn").on("click", function(){
	location.href = "<c:out value="${serverDomain}"/>/mobile/member/offlineMemStep1.do";
	});
	
	//비회원 주문조회
	$("#nonMemberLoginBtn").on("click", function name() {
		location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/nonMemberLogin.do";
	});
	

</script>