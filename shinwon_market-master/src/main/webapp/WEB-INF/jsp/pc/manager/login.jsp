<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
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
            <div class="pg_tit_wrap login">
                <h2 class="pg_tit">LOGIN</h2>
            </div>
            <!--// Title -->

            <!-- 로그인폼 -->
			<form name="memberForm" id="memberForm"> 
                <input type="hidden" name="pageType" id="pageType" value="main"/>  <!-- 메인로그인창 -->
                <input type="hidden" name="ROLE_USER" value="user" />
                <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
                <!-- 
                <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />
                   --> 
            <div class="login_wrap">
                <div class="login_form">
                    <ul>
                        <li>
                            <input type="text" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" placeholder="아이디 입력" maxlength="15">
                        </li>
                        <li>
                            <input type="password" id="MEM_MST_WEB_PWD" name="MEM_MST_WEB_PWD" placeholder="비밀번호 입력" maxlength="15">
                        </li>
                        <li>
                            <input type="checkbox" id="saveId" name="saveId" value="Y">
                            <label for="saveId" class="mr15"><span class="icon"></span>아이디 저장</label>
							<a href="<c:out value="${serverDomain }"/>/pc/manager/myInfoSearch.do?gubun=PW" class="btn_pw_ck btn_txt"><span>비밀번호 찾기</span></a>
                            <a href="<c:out value="${serverDomain }"/>/pc/manager/myInfoSearch.do" class="btn_id_ck btn_txt"><span>아이디/</span></a>
                        </li>
                    </ul>
                    <div class="btn_login_wrap">
                        <button type="button" onclick="login()" class="btn_large ok">로그인</button>
						<button type="button" class="btn_large" id="nonMemberLoginBtn">비회원 주문조회</button>
                    </div>
                    <ul class="login_sns"><form id="searchForm" name="searchForm">
                        <input type="hidden" name="searchPrdMstCd"
                            value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> <input
                            type="hidden" name="searchPrdMstNm"
                            value="<c:out value="${commandMap.searchPrdMstNm }"/>" /> <input
                            type="hidden" name="searchPrdCtgIdx"
                            value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" /> <input
                            type="hidden" name="searchPrdCtgEnv"
                            value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" /> <input
                            type="hidden" name="searchPrdCtgDepth1"
                            value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" /> <input
                            type="hidden" name="searchPrdCtgDepth2"
                            value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" /> <input
                            type="hidden" name="searchPrdCtgDepth3"
                            value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" /> <input
                            type="hidden" name="searchPrdCtgDepth4"
                            value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" /> <input
                            type="hidden" name="searchPrdMstSellState"
                            value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
                        <input type="hidden" name="searchPrdMstDplState"
                            value="<c:out value="${commandMap.searchPrdMstDplState }"/>" /> <input
                            type="hidden" name="searchPrdMstApvState"
                            value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
                        <input type="hidden" name="searchPrdMstMdId"
                            value="<c:out value="${commandMap.searchPrdMstMdId }"/>" /> <input
                            type="hidden" name="cPage"
                            value="<c:out value="${commandMap.cPage }"/>" /> <input
                            type="hidden" name="searchDetailY"
                            value="<c:out value="${commandMap.searchDetailY }"/>" /> <input
                            type="hidden" name="searchYn"
                            value="<c:out value="${commandMap.searchYn }"/>" /> <input
                            type="hidden" name="pageSize"
                            value="<c:out value="${commandMap.pageSize }"/>" /> <input
                            type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV"
                            value="${commandMap.PRD_CTG_ENV}" /> <input type="hidden"
                            id="PRD_SPC_ENV" name="PRD_SPC_ENV"
                            value="${commandMap.PRD_SPC_ENV}" /> <input type="hidden"
                            id="PRD_SPC_TYPE" name="PRD_SPC_TYPE" /> <input type="hidden"
                            id="PRD_CTG_BRAND" name="PRD_CTG_BRAND" value="" />
                    </form>
					<li><a href="javascript:loginNaver();" id="naver_id_login" class="btn_sns naver">네이버 로그인</a></li>
					<li><a href="javascript:loginKakao();" id="custom-login-btn" class="btn_sns kakao">카카오톡 로그인</a></li>
					<li><a href="javascript:loginFacebook();" id="facebook_login" class="btn_sns facebook">페이스북 로그인</a></li>
				</ul>
                </div>
                <div class="login_info">
                    <div class="info_box">
                        <strong class="tit">쑈윈도 회원가입시 다양한 혜택 제공!</strong>
                        <ul class="info_benefit">
                            <li>
                                <span>등급별<br>멤버십 혜택</span>
                            </li>
                            <li>
                                <span>포인트 증정<br>&amp; 적립</span>
                            </li>
                            <li>
                                <span>회원가입<br>쿠폰 증정</span>
                            </li>
                        </ul>
                        <button type="button" class="btn_small" id="joinBtn">회원가입</button>
                    </div>
                    <!-- <div class="info_box">
                        <strong class="tit">신원 오프라인 매장의 회원이세요?</strong>
                        <ul class="ul_dash">
                            <li>등급별 멤버십 혜택</li>
                            <li>신원 통합회원 전환시 5,000 포인트 즉시 증정</li>
                        </ul>
                        <button type="button" class="btn_small" id="joinConvertBtn">통합회원 전환</button>
                    </div> -->
                </div>
            </div>
            
            </form>
            <!--// 로그인폼 -->
			<form name="snsMemberForm" id="snsMemberForm" method="post"> 
                <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />
                <input type="hidden" name="ROLE_USER" value="user" />
                <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
            </form>
<!-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다.
이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/common.js"></script>      
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/kakao.min.js" charset="utf-8"></script>                   <!-- kakao 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/snsSDK.js" charset="utf-8"></script>  
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
//<![CDATA[
$(function(){
	// 쿠키에 저장된 관리자 아이디
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
	
	cookie();

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
    
    // 로그인 버튼 클릭
//     function goLogin(){
//     	login();
//     };
    
	//비회원 구매/주문조회 클릭 이벤트
	/* nonMemberLogin = function(){
		if("${commandMap.ORD_MST_CD}" != ""){
			location.href = "<c:out value="${serverSslDomain}"/>/pc/manager/nonMemberLogin.do?ORD_MST_CD=${commandMap.ORD_MST_CD}";
		}else{
			location.href = "<c:out value="${serverSslDomain}"/>/pc/manager/nonMemberLogin.do";	    		
		}
	}; */
});

// 쿠키에 저장된 아이디
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

//회원 로그인
function login () 
{	
	var $memberForm = $("#memberForm");
    if($memberForm.valid())
    {
    	// 로그인 타입
        $memberForm.find("input[name=ROLE_USER]").val("user");  // 일반 로그인
        
    	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
    	
        $memberForm.attr({"action":"<c:out value="${serverDomain}"/>/pc/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
        return false;
    }
}

function fnSnsLogin(data){
	//수행
	//console.log(data);
	var $memberForm = $("#snsMemberForm");
            
        // 로그인 타입  
        $memberForm.find("input[name=ROLE_USER]").val("sns");  // SNS 로그인
        
        // sns 로그인 시 sns 타입   
        if(data.sns == "facebook")
        {  
            $memberForm.find("input[name=MEM_SNS_TYPE]").val(data.sns);  
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
             alert("SNS 로그인에 실패하셨습니다. 다시 시도해주세요.");
        }
          
        // 로그인 이벤트 이동          
        $("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
        $memberForm.attr({"action":"<c:out value="${serverDomain}"/>/pc/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
}

$("#joinBtn").on("click", function(){
	location.href = "<c:out value="${frontDomain}"/>/pc/member/joinMemType.do";
});

$("#joinConvertBtn").on("click", function(){
	location.href = "<c:out value="${frontDomain}"/>/pc/member/offlineMemStep1.do";
})
$("#nonMemberLoginBtn").on("click", function name() {
	location.href = "<c:out value="${serverSslDomain}"/>/pc/manager/nonMemberLogin.do";
});

//]]>
</script>
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.cookie.js"></script>
</body>
</html>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>