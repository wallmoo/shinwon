<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-login">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container">
			<form name="memberForm" id="memberForm"> 
                <input type="hidden" name="pageType" id="pageType" value="main"/>  <!-- 메인로그인창 -->
                <input type="hidden" name="ROLE_USER" value="user" />
                <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
                
                <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />                          
			 
            <div class="minW2 contents"><!-- .contents S -->
				<ul class="login_form sty_naver">
					<li class="ti">
						<h2>로그인</h2>
						<hr class="bg_line_5px" />
					</li>
					<li class="form">
						<label for="inp_id" class="inp_tx">
							<input type="text" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" placeholder="아이디" maxlength="15"/>
						</label>
						<label for="inp_pw" class="inp_pw">
							<input type="password" name="MEM_MST_WEB_PWD" id="MEM_MST_WEB_PWD" placeholder="비밀번호" maxlength="15" />
						</label>
						<a href="javascript:login();" class="btn_login"><span>로그인</span></a>
						<label for="saveId" class="inp_chk" style="width:90px;">
							<input type="checkbox" name="saveId" id="saveId" value="Y"/>
							<span>아이디 저장</span>
						</label>
					</li>
                    <!-- ------------------- SNS 로그인 > NAVER/FACEBOOK/KAKAOTALK 버튼 ------------------- -->   
                    <li style="margin-bottom: 10px;">
                        <c:if test="${not empty snsUseList }">
                            <c:forEach var="snsUseRow" items="${snsUseList }" varStatus="i">  
                                <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '네이버' }">
                                    <a href="javascript:loginNaver();" id="naver_id_login"></a>            
                                    <input type="hidden" name="SNS_NAVER_API_KEY" id="SNS_NAVER_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />      
                                </c:if>   
                                <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '카카오' }">  
                                    <a href="javascript:loginKakao();" id="custom-login-btn" ><img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="185" height="40"/></a>
                                    <input type="hidden" name="SNS_KAKAO_API_KEY" id="SNS_KAKAO_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />  
                                </c:if>  
                                <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '페이스북' }">
                                    <a href="javascript:loginfacebook();"><img src="<c:out value="${serverDomain}" />/am/img/facebook_btn.png" /></a>        
                                    <input type="hidden" name="SNS_FBOOK_API_KEY" id="SNS_FBOOK_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />  
                                </c:if>      
                            </c:forEach>        
                        </c:if>    
                    </li>  
                    <!-- ---------------------------------------------------------------------------------- -->   
					<li class="btn_box">
						<a href="<c:out value="${serverDomain }"/>/pc/manager/idFind.do?gubun=ID" class="btn_id_ck"><span>아이디 찾기</span></a>
						<a href="<c:out value="${serverDomain }"/>/pc/manager/pwFind.do?gubun=PW" class="btn_pw_ck"><span>비밀번호 찾기</span></a>
						<a href="javascript:nonMemberLogin();" class="bnt_nomem"><span>비회원 구매/주문조회</span></a>
						<hr class="bg_line_5px" />
						<p>
							<span class="tx">마켓플랜트쇼핑몰 <br/>회원가입으로 다양한 혜택을 즐겨보세요.</span>
							<a href="<c:out value="${serverDomain }"/>/pc/member/joinMemType.do" class="btn_st0 btn_white"><span>회원가입</span></a>
						</p>
					</li>
					<li class="ad">
						<c:if test="${not empty loginBannerList }">
							<c:forEach var="loginBannerRow" items="${loginBannerList }" varStatus="i">	
								<c:choose>
									<c:when test="${loginBannerRow.BNR_MST_TGT eq 'D' }">
										<img src="<c:out value="${cdnDomain}" /><c:out value="${loginBannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${loginBannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${loginBannerRow.CMN_FLE_ALT_TXT}" />" style="width:278px;height:322px;"/>
									</c:when>
									<c:otherwise>
										<a href="<c:out value="${loginBannerRow.BNR_MST_URL}" />" target="<c:out value="${loginBannerRow.BNR_MST_TGT_TARGET}" />">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${loginBannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${loginBannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${loginBannerRow.CMN_FLE_ALT_TXT}" />" style="width:278px;height:322px;"/>
										</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</li>
				</ul>
			</div><!--// .contents E -->
			</form>
		</article>
		<!--// #container E -->
		<%-- 각 화면 본문 끝 --%>

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>
	
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>  
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>      
<script src="<c:out value="${serverDomain}" />/am/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
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
//<![CDATA[
$(function(){
	// 쿠키에 저장된 관리자 아이디
	cookie();

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
    
    // 로그인 버튼 클릭
//     function goLogin(){
//     	login();
//     };
    
	//비회원 구매/주문조회 클릭 이벤트
	nonMemberLogin = function(){
		if("${commandMap.ORD_MST_CD}" != ""){
			location.href = "<c:out value="${serverDomain}"/>/pc/manager/nonMemberLogin.do?ORD_MST_CD=${commandMap.ORD_MST_CD}";
		}else{
			location.href = "<c:out value="${serverDomain}"/>/pc/manager/nonMemberLogin.do";	    		
		}
	};
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
};     


//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>