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
	            <h2>아이디/비밀번호찾기</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .inquiry_tab_d S -->
			<section class="inquiry_tab_d">
				<dl class="tab_st1">
					<dt class="tab_mn ui-grid-a">
						<a href="javascript:void(0)" class="_pg_link ui-block-a on"><strong>아이디 찾기</strong></a>
						<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/pwFind.do?gubun=PW&type=m." class="_pg_link ui-block-b" target="_self"><strong>비밀번호 찾기</strong></a>
					</dt>
					
					<dd class="dd_inq_certifi">
						<label for="searchType" class="sel_box_st0">
							<select class="searchType" id="searchType">
								<option value="memberBasic" selected="selected">마켓플랜트 통합회원</option>
								<option value="memberSimple">이메일 간편회원</option>
								<option value="memberBusiness">기업회원</option>
							</select>
						</label>
						
						<!-- 통합회원 아이디 찾기 S -->
						<div class="certifi_d" id="memberBasic" style="display:block;">
							<dl class="form_phone">
								<dt>
									<a href="javascript:fnSirenPopup();"><i></i><strong>휴대폰으로 인증하기</strong></a>
								</dt>
								<dd>
									<p class="tx_ex2">
										<span>본인 명의로 된 휴대폰 번호로만 인증이 가능합니다.</span>
										<span>타인의 명의나 법인으로 된 휴대폰번호는 본인인증이 불가능 합니다. </span>
									</p>
								</dd>
							</dl>
							<dl class="form_iPIN">
								<dt>
									<a href="javascript:fnIpinPopup();"><i></i><strong>아이핀으로 인증하기</strong></a>
								</dt>
								<dd>
									<p class="tx_ex2">
										<span>아이핀 ID에 가입하신 고객분들만 사용 가능합니다.</span>
										<span>아이핀 ID가 없는 경우 아이핀 발급기관에서 발급받으셔야 이용 가능합니다.</span>
									</p>
								</dd>
							</dl>
						</div>
						<!-- 통합회원 아이디 찾기 E -->
						
						<!-- 간편회원 아이디 찾기 S -->
						<form id="simpleForm" name="simpleForm">
							<input type="hidden" name="memType" value="memberSimple"/> 	
							<div class="inp_form" id="memberSimple" style="display:none;">
								<label for="MEM_MST_MEM_NM">
									<strong>이름</strong>
									<input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" maxlength="10"/>
								</label>
								
								<div class="inp_email">
									<strong>이메일</strong>
									<div>
										<label for="MEM_MST_MAIL">								
											<input type="text" name="MEM_MST_MAIL" id="MEM_MST_MAIL" maxlength="50"/>
										</label>
									</div>
								</div>
								
								<p class="tx_ex2">
									<span>회원정보에 입력하신 정보와 동일하게 입력해주시기 바랍니다. </span>
								</p>
		
								<div class="btn_box">
									<a href="javascript:goIdFind();" class="btn_red"><strong>확인</strong></a>
								</div>
							</div>
						</form>
						<!-- 간편회원 아이디 찾기 E -->
						
						<!-- 기업회원 아이디 찾기 S -->
						<form id="businessForm" name="businessForm">
							<input type="hidden" name="memType" value="memberBusiness"/>
							<div class="inp_form" id="memberBusiness" style="display:none;">
								<label for="MEM_CPR_NM">
									<strong>기업명</strong>
									<input type="text" name="MEM_CPR_NM" id="MEM_CPR_NM" maxlength="20"/>
								</label>
								
								<div class="inp_corNumer">
									<strong>사업자등록번호</strong>
									<div class="inp_d">
										<label for="MEM_CPR_NO1">								
											<input type="text" name="MEM_CPR_NO1" id="MEM_CPR_NO1" maxlength="3" class="number"/>
										</label>
										<label for="MEM_CPR_NO2">								
											<input type="text" name="MEM_CPR_NO2" id="MEM_CPR_NO2" maxlength="2" class="number"/>
										</label>
										<label for="MEM_CPR_NO3">								
											<input type="text" name="MEM_CPR_NO3" id="MEM_CPR_NO3" maxlength="5" class="number"/>
										</label>
									</div>
								</div>
								
								<p class="tx_ex2">
									<span>회원정보에 입력하신 정보와 동일하게 입력해주시기 바랍니다. </span>
								</p>
		
								<div class="btn_box">
									<a href="javascript:goIdFind();" class="btn_red"><strong>확인</strong></a>
								</div>
							</div>
						</form>
						<!-- 기업회원 아이디 찾기 E -->
					</dd>
				</dl>
			</section>
			<!--// .inquiry_tab_d E -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->
	
	<form name="certForm" id="certForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${reqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${retUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="ipinForm" id="ipinForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${ipinReqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${ipinRetUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="basicForm" id="basicForm">
		<input type="hidden" name="MEM_MST_MEM_ID" id="memId"/>
		<input type="hidden" name="memType" value="memberBasic"/> 	
	</form>
	
<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script>
$(function(){
	//탭
	$.com.util.tab($('.tab_st1 .tab_mn'), 0);
});
</script>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	var $basicForm = $("#basicForm"),
	$simpleForm = $("#simpleForm"),
	$businessForm = $("#businessForm");

	// selectbox change
	$(".searchType").on("change",function(){
		
		var selectIdFindType = $(".searchType option:selected").val();
		
		// 통합회원
		if(selectIdFindType == "memberBasic"){
			$("#memberBasic").css("display","block");
			$("#memberSimple").css("display","none");
			$("#memberBusiness").css("display","none");
		}
		// 간편회원
		else if(selectIdFindType == "memberSimple"){
			$("#memberBasic").css("display","none");
			$("#memberSimple").css("display","block");
			$("#memberBusiness").css("display","none");
		}
		// 기업회원
		else if(selectIdFindType == "memberBusiness"){
			$("#memberBasic").css("display","none");
			$("#memberSimple").css("display","none");
			$("#memberBusiness").css("display","block");
		}
	});
	
	// 이메일 간편회원 폼체크
	$simpleForm.validate(
	{
	    rules: 
	    {
	    	MEM_MST_MEM_NM:{required:true},	// 이름
	    	MEM_MST_MAIL:{required:true, email:true},	// 이메일
	    },
	    messages :
	    {
	    	MEM_MST_MEM_NM : {required:"이름을 입력해주세요."},
	    	MEM_MST_MAIL : {required:"이메일을 입력해주세요."}
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
	
		// 기업회원 폼체크
	$businessForm.validate(
	{
	    rules: 
	    {
	    	MEM_CPR_NM:{required:true},	// 기업명
	    	MEM_CPR_NO1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자번호 앞자리
	    	MEM_CPR_NO2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자번호 중간자리
	    	MEM_CPR_NO3:{required:true, number:true, minlength:5, maxlength:5}	// 사업자번호 뒷자리
	    },
	    messages :
	    {
	    	MEM_CPR_NM : {required:"기업명을 입력해주세요."},
	    	MEM_CPR_NO1 : {required:"사업자등록번호 앞자리를 입력해주세요."},
	    	MEM_CPR_NO2 : {required:"사업자등록번호 중간자리를 입력해주세요."},
	    	MEM_CPR_NO3 : {required:"사업자등록번호 뒷자리를 입력해주세요."}
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
		
	// 사이렌 본인인증 팝업
	fnSirenPopup = function()
	{
		$('#sirenIframeDiv').remove();
		var target = "";
		if(navigator.userAgent.indexOf("MobileApp") > -1 ){
			target = "sirenIframe";
			
			var sirenHtml = '<div id="sirenIframeDiv" style="display: none; position: fixed; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 100;">';
			sirenHtml += '<iframe name="sirenIframe" src="" width="100%;" height="100%;" ></iframe>';
		    sirenHtml += '</div>';
			
		    $(document.body).append(sirenHtml);
		    $('#sirenIframeDiv').show();
		}
		else{
			window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			target = "popupChk";
		}
		
		document.certForm.action = "<c:out value="${certReqUrl}" />";
	    document.certForm.target = target;
	    document.certForm.submit();
	};
	
	// IPIN 본인인증 팝업
	fnIpinPopup = function()
	{
		$('#sirenIframeDiv').remove();
		var target = "";
		if(navigator.userAgent.indexOf("MobileApp") > -1 ){
			target = "sirenIframe";
			
			var sirenHtml = '<div id="sirenIframeDiv" style="display: none; position: fixed; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 100; background: #fff;">';
			sirenHtml += '<iframe name="sirenIframe" src="" width="100%;" height="100%;" scrolling="yes"></iframe>';
		    sirenHtml += '</div>';
			
		    
		    /* var _metaHtml ='<meta name="viewport" content="width=480, user-scalable=no">';
		    $(document.head).prepend(_metaHtml); */
		    
		    $("meta[name=viewport]").prop("content","width=480, user-scalable=no");
		    
		    $(document.body).append(sirenHtml);
		    $('#sirenIframeDiv').show();
		}
		else{
			window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			target = "popupIPIN2";
		}
		
	    document.ipinForm.action = "<c:out value="${ipinCertReqUrl}"/>";
	    document.ipinForm.target = target;
	    document.ipinForm.submit();
	};
	
	// 사이렌 본인인증 데이터 가지고 아이디 찾기 결과 페이지로 이동
	goBasicForm = function()
	{
		$basicForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/manager/idFindResult.do", "target":"_self", "method":"post"}).submit();
	};
	
	// 이메일간편회원, 기업회원 확인 클릭 이벤트
	goIdFind = function()
	{
		var searchType = $(".searchType option:selected").val();
		
		// 이메일 간편회원의 경우
		if(searchType == "memberSimple"){
			
			if($simpleForm.valid()){
				$simpleForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/manager/idFindResult.do", "target":"_self", "method":"post"}).submit();	    			
			}	    			
		}
		// 기업회원의 경우
		if(searchType == "memberBusiness"){
			
			if($businessForm.valid()){
				$("#businessForm").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/manager/idFindResult.do", "target":"_self", "method":"post"}).submit();	    			
			}
		}
	};
});
//]]>
</script>
</body>
</html>