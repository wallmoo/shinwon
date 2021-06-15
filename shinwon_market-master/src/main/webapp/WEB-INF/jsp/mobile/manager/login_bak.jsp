<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login"><!-- page class : page-login -->
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
	            <h2>로그인</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .login_form S -->
			<section class="login_form">
				<form name="memberForm" id="memberForm">
                   <input type="hidden" name="ROLE_USER" value="user" />
                   <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
					<dl>
						<dt class="blind">아이디, 비밀번호, 아이디저장, 자동로그인으로 구성된 로그인 폼</dt>
						<dd class="dd_inp">
							<fieldset data-role="controlgroup">
								<input type="text" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" placeholder="아이디" >
								<label for="MEM_MST_MEM_ID">아이디</label>
								<input type="password" name="MEM_MST_WEB_PWD" id="MEM_MST_WEB_PWD"  placeholder="비밀번호">
								<label for="MEM_MST_WEB_PWD">비밀번호</label>
							</fieldset>
							
							<div class="chk_st0 inp_chk">
								<fieldset data-role="controlgroup">
									<input type="checkbox" name="saveId" id="saveId" value="Y"/>
									<label for="saveId">아이디 저장</label>
									<input type="checkbox" name="autoLoginYn" id="autoLoginYn" value="Y">
									<label for="autoLoginYn">자동로그인</label>
								</fieldset>
								<button class="btn_red btn_login" type="button"><strong>로그인</strong></button>
							</div>
						</dd>
						<dd class="dd_find">
							<div>
								<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/idFind.do?gubun=ID&type=m." class="_pg_link" target="_self"><strong>아이디 찾기</strong></a>
								<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/pwFind.do?gubun=PW&type=m." class="_pg_link" target="_self"><strong>비밀번호 찾기</strong></a>
							</div>
							<a href="javascript:nonMemberLogin();" class="_pg_link btn_gre" target="_self"><strong>비회원 구매/주문조회</strong></a>					
						</dd>
						<dd class="dd_join">
							<p class="tx_ex">
								<span><i class="ico_exc">!</i>마켓플랜트 회원가입으로 다양한 혜택을 즐겨보세요.</span>
							</p>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain }"/>/mobile/member/joinMemType.do','_self');" class="_pg_link btn_cc_l"><strong>회원가입</strong></a>
						</dd>
		
						<dd class="dd_banner">
							<c:if test="${not empty loginBannerList }">
								<c:forEach var="loginBannerRow" items="${loginBannerList }" varStatus="i">	
									<c:choose>
										<c:when test="${loginBannerRow.BNR_MST_TGT eq 'D' }">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${loginBannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${loginBannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${loginBannerRow.CMN_FLE_ALT_TXT}" />" />
										</c:when>
										<c:otherwise>
											<a href="<c:out value="${loginBannerRow.BNR_MST_URL}" />" target="<c:out value="${loginBannerRow.BNR_MST_TGT_TARGET}" />">
												<img src="<c:out value="${cdnDomain}" /><c:out value="${loginBannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${loginBannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${loginBannerRow.CMN_FLE_ALT_TXT}" />" />
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</dd>
					</dl>
				</form>
			</section>
			<!--// .login_form E -->
				
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
	
	// 쿠키에 저장된 사용자 아이디
	cookie();
	
	// 쿠키에 저장된 자동로그인 관련 사용자 아이디
// 	autoLoginCookie();

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
    
    // 로그인 버튼 클릭
    $(document).on("click", ".btn_login", function () {
        login();
    });
    
  	//비회원 구매/주문조회 클릭 이벤트
	nonMemberLogin = function(){
		if("${commandMap.ORD_MST_CD}" != ""){
			var url = "<c:out value="${mobileSslDomain}"/>/mobile/manager/nonMemberLogin.do?ORD_MST_CD=${commandMap.ORD_MST_CD}";
			callJavascriptNextPage(url,'_self');
		}else{
			var url = "<c:out value="${mobileSslDomain}"/>/mobile/manager/nonMemberLogin.do";	    
			callJavascriptNextPage(url,'_self');
		}
	};
	
});

// 쿠키에 저장된 사용자 아이디
function cookie()
{
	var cookieEtlandUserId = $.cookie("cookieEtlandUserId");
	
	if(cookieEtlandUserId != null && cookieEtlandUserId != "") // 쿠키가  존재 할경우
	{
	    $("#saveId").attr("checked", "checked");
	    $("#MEM_MST_MEM_ID").val(cookieEtlandUserId);
	    //$("#MEM_MST_WEB_PWD").focus();
	}
	else // 쿠키가 존재하지 않을경우
	{
	    //$("#MEM_MST_MEM_ID").focus();
	}
}

//쿠키에 저장된 자동로그인 관련 사용자 아이디
//function autoLoginCookie()
//{
//	var cookieEtlandUserAutoLogin = $.cookie("cookieEtlandUserAutoLogin");
	
//	if(cookieEtlandUserAutoLogin != null && cookieEtlandUserAutoLogin != "") // 쿠키가  존재 할경우
//	{
//	    $("#autoLoginYn").attr("checked", "checked");
//	    $("#MEM_MST_MEM_ID").val(cookieEtlandUserAutoLogin);
//	    $("#MEM_MST_WEB_PWD").val("etlandmall");
	    
//	    login();
//	}
//}

//회원 로그인
function login () 
{
    var $memberForm = $("#memberForm");

    if($memberForm.valid())
    {
    	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
    	
    	if(navigator.userAgent.indexOf("MobileApp") > -1 ){
    		$memberForm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/manager/appLoginProc.do", "target":"_self", "method":"post"}).submit();	
    	}
    	else{
    		$memberForm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/manager/loginProc.do", "target":"_self", "method":"post"}).submit();	
    	}
        
        return false;
    }
}

//]]>
</script>
</body>
</html>