<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-login"><!-- page-login : 850x644 -->

<!-- #container S -->
<article id="container" class="container">
	<form name="memberForm" id="memberForm">
   	<input type="hidden" name="pageType" id="pageType" value="pop"/>
    <input type="hidden" name="ROLE_USER" value="user" />
    <input type="hidden" name="url" value="<c:out value="${commandMap.url}"/>"/>
    <input type="hidden" name="locationProtocol" value="<c:out value="${commandMap.locationProtocol }"/>"/>
    <input type="hidden" name="ORD_MST_CD" value=""/>
	<div class="minW2 contents"><!-- .contents S -->
		<ul class="login_form sty_naver login_popup">
			<li class="ti">
				<h2>로그인</h2>
				<hr class="bg_line_5px" />
			</li>
			<li class="form">
				<label for="inp_id" class="inp_tx">
					<input type="text" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" placeholder="아이디" maxlength="15" />
				</label>
				<label for="inp_pw" class="inp_pw">
					<input type="password" name="MEM_MST_WEB_PWD" id="MEM_MST_WEB_PWD" placeholder="비밀번호" maxlength="15"/>
				</label>
				<a href="javascript:goLogin();" class="btn_login"><span>로그인</span></a>
				<label for="saveId" class="inp_chk" style="width:90px;">
					<input type="checkbox" name="saveId" id="saveId" value="Y"/>
					<span>아이디 저장</span>
				</label>
			</li>
			<li class="btn_box">
				<a href="javascript:goIdFind();" class="btn_id_ck"><span>아이디 찾기</span></a>
				<a href="javascript:goPwFind();" class="btn_pw_ck"><span>비밀번호 찾기</span></a>
				<a href="javascript:nonMemberLogin();" class="bnt_nomem"><span>비회원 구매/주문조회</span></a>
				<hr class="bg_line_5px" />
				<p>
					<span class="tx">마켓플랜트<br/>회원가입으로 다양한 혜택을 즐겨보세요.</span>
					<a href="javascript:goJoin();" class="btn_st0 btn_white"><span>회원가입</span></a>
				</p>
			</li>
			<li class="ad">
				<c:if test="${not empty loginBannerList }">
					<c:forEach var="loginBannerRow" items="${loginBannerList }" varStatus="i">	
							<c:choose>
								<c:when test="${loginBannerRow.BNR_MST_TGT ne 'N' }">
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

<script src="<c:out value="${cdnDomain}"/>/pc/js/plugins.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/epass.base-0.3.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.comboBoxr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.productSlidr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.toggleSlidr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.fxSlider-0.4.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/min/epass.productViewr-0.1.min.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/ui.breadcrumb.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/ui.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js"></script>
<script src="<c:out value="${cdnDomain}"/>/pc/js/jquery.validate.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/webtoolkit.base64.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/makePCookie.js"></script>

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

	// 쿠키에 저장된 아이디
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
    goLogin = function () {
        login();
    };
    
    var url = "${commandMap.url}"; 
	
	url = encodeURIComponent(url);
	
    // 비회원 구매/주문조회 클릭 이벤트
    nonMemberLogin = function(){
		
    	var nonMemberUrl = "<c:out value="${serverDomain}"/>/pc/manager/nonMemberLogin.do?url=" + url;
    	
    	nonMemberUrl = encodeURIComponent(nonMemberUrl);
    	
    	if("${commandMap.locationProtocol}" == "https"){
    		location.href = "<c:out value="${serverDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + nonMemberUrl;
    	}
    	else{
    		location.href = "<c:out value="${frontDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + nonMemberUrl;
    	}
    	
    };
    
 	// 회원가입 이동
    goJoin = function(){
 		
    	var joinUrl = "<c:out value="${serverSslDomain }"/>/pc/member/joinMemType.do";
    	
    	joinUrl = encodeURIComponent(joinUrl);
 		
    	if("${commandMap.locationProtocol}" == "https"){
    		location.href = "<c:out value="${serverSslDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + joinUrl;
    	}
    	else{
    		location.href = "<c:out value="${frontDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + joinUrl;
    	}
    	
    };
    
    // 아이디찾기 이동
    goIdFind = function(){

    	var idUrl = "<c:out value="${serverSslDomain }"/>/pc/manager/myInfoSearch.do";
    	
    	idUrl = encodeURIComponent(idUrl);
    	
    	if("${commandMap.locationProtocol}" == "https"){
    		location.href = "<c:out value="${serverSslDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + idUrl;
    	}
    	else{
    		location.href = "<c:out value="${frontDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + idUrl;
    	}
    };
    
    // 비밀번호 찾기 이동
    goPwFind = function(){
    	
    	var pwUrl = "<c:out value="${serverSslDomain }"/>/pc/manager/myInfoSearch.do?gubun=PW";
    	
    	pwUrl = encodeURIComponent(pwUrl);
    	
    	if("${commandMap.locationProtocol}" == "https"){
    		location.href = "<c:out value="${serverSslDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + pwUrl;
    	}
    	else{
    		location.href = "<c:out value="${frontDomain}"/>/pc/manager/loginPopHttp.do?linkUrl=" + pwUrl;
    	}
    };
});

// 쿠키에 저장된 아이디
function cookie()
{
	var cookieEtlandUserId = $.cookie("cookieEtlandUserId");

	if(cookieEtlandUserId != null && cookieEtlandUserId != "") // 쿠키가  존재 할경우
	{
		$(".inp_chk").attr("class","inp_chk on");
	    $("#saveId").attr("checked", "checked");
	    $("#MEM_MST_MEM_ID").val(cookieEtlandUserId);
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
    	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
    	
    	if("${commandMap.ORD_MST_CD}" != ""){
    		$("input[name='ORD_MST_CD']").val("${commandMap.ORD_MST_CD}");
    	}
    	
        //$memberForm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
        $memberForm.attr({"action":"<c:out value="${serverDomain}"/>/pc/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
        return false;
    }
}

//]]>
</script>

<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>