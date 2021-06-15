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
	            <h2>통합 회원 전환</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .combineMem S -->
			<section class="combineMem">
				<dl>
					<dt>
						<h3>마켓플랜트 통합 회원 전환</h3>
						<p class="sub_tx">
							<span>마켓플랜트는 통합 회원 전환으로 <br/>보다 나은 서비스를 제공하고자 합니다.</span>
							<span>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 <br/> 이용하실 수 있는 서비스입니다.</span>
						</p>
					</dt>
					<dd class="dd_tabMn">
						<ol class="ui-grid-c">
							<li class="ui-block-a on">
								<p>
									<span>STEP 01</span>
									<strong>본인인증</strong>
								</p>
							</li>
							<li class="ui-block-b">
								<p>
									<span>STEP 02</span>
									<strong>약관동의</strong>
								</p>
							</li>
							<li class="ui-block-c">
								<p>
									<span>STEP 03</span>
									<strong>정보확인</strong>
								</p>
							</li>
							<li class="ui-block-d">
								<p>
									<span>STEP 04</span>
									<strong>전환완료</strong>
								</p>
							</li>
						</ol>
					</dd>
					<dd class="dd_certifi">
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
					</dd>
				</dl>
			</section>
			<!--// .combineMem E -->
				
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
	
	<!-- 온라인 전환 폼 -->
	<form name="onlineForm" id="onlineForm">
		<input type="hidden" name="MEM_IPN_BIR_DT" id="onIpnBirth"/>
		<input type="hidden" name="MEM_IPN_SEX" id="onSex"/>
		<input type="hidden" name="MEM_IPN_CI" id="onCI"/>
		<input type="hidden" name="MEM_IPN_DI" id="onDI"/>
		<input type="hidden" name="MEM_MST_MEM_ID" id="onId"/>
		<input type="hidden" name="MEM_MST_MEM_NM" id="onMemNm"/>
		<input type="hidden" name="MEM_MST_MAIL"   id="onMail"/>
		<input type="hidden" name="MEM_MST_RCM_ID" id="onRcmId"/>
		<input type="hidden" name="MEM_MST_TEL1" id="onTel1"/>
		<input type="hidden" name="MEM_MST_TEL2" id="onTel2"/>
		<input type="hidden" name="MEM_MST_TEL3" id="onTel3"/>
		<input type="hidden" name="MEM_MST_HP1" id="onHp1"/>
		<input type="hidden" name="MEM_MST_HP2" id="onHp2"/>
		<input type="hidden" name="MEM_MST_HP3" id="onHp3"/>
		<input type="hidden" name="MEM_MST_BIR_DT" id="onBirth"/>
		<input type="hidden" name="MEM_MST_ZIP_CDE5" id="onZipCode5"/>
		<input type="hidden" name="MEM_MST_DRO_ADR1" id="onDroAdr1"/>
		<input type="hidden" name="MEM_MST_DRO_ADR2" id="onDroAdr2"/>
		<input type="hidden" name="MEM_MST_JBN_ADR1" id="onJbnAdr1"/>
		<input type="hidden" name="MEM_MST_JBN_ADR2" id="onJbnAdr2"/>
		<input type="hidden" name="MEM_MST_REG_DT" id="onRegDt"/>
		<input type="hidden" name="MEM_MST_ERP_ID" id="onErpId"/>
		<input type="hidden" name="TRM_YN0001" id="onSmsYn"/>
		<input type="hidden" name="TRM_YN0002" id="onTmYn"/>
		<input type="hidden" name="TRM_YN0003" id="onDmYn"/>
		<input type="hidden" name="TRM_YN0004" id="onEmailYn"/>
		<input type="hidden" name="TRM_YN0005" id="onSkYn"/>
		<input type="hidden" name="TRM_YN0006" id="onSCardYn"/>
		<input type="hidden" name="TRM_YN0007" id="onSElecYn"/>
		<input type="hidden" name="TRM_YN0008" id="onLgYn"/>
		<input type="hidden" name="erpInfoYn" id="erpInfoYn"/>
		<input type="hidden" name="membershipYn" id="onMembershipYn"/>
	</form>

	<!-- 간편회원 전환 폼 -->
	<form name="simpleForm" id="simpleForm">
		<input type="hidden" name="MEM_IPN_BIR_DT" id="simpleIpnBirth"/>
		<input type="hidden" name="MEM_IPN_SEX" id="simpleSex"/>
		<input type="hidden" name="MEM_IPN_CI" id="simpleCI"/>
		<input type="hidden" name="MEM_IPN_DI" id="simpleDI"/>
		<input type="hidden" name="MEM_MST_MEM_ID" id="simpleId"/>
		<input type="hidden" name="MEM_MST_MEM_NM" id="simpleMemNm"/>
		<input type="hidden" name="MEM_MST_MAIL"   id="simpleMail"/>
		<input type="hidden" name="MEM_MST_RCM_ID" id="simpleRcmId"/>
		<input type="hidden" name="MEM_MST_TEL1" id="simpleTel1"/>
		<input type="hidden" name="MEM_MST_TEL2" id="simpleTel2"/>
		<input type="hidden" name="MEM_MST_TEL3" id="simpleTel3"/>
		<input type="hidden" name="MEM_MST_HP1" id="simpleHp1"/>
		<input type="hidden" name="MEM_MST_HP2" id="simpleHp2"/>
		<input type="hidden" name="MEM_MST_HP3" id="simpleHp3"/>
		<input type="hidden" name="MEM_MST_BIR_DT" id="simpleBirth"/>
		<input type="hidden" name="MEM_MST_ZIP_CDE5" id="simpleZipCode5"/>
		<input type="hidden" name="MEM_MST_DRO_ADR1" id="simpleDroAdr1"/>
		<input type="hidden" name="MEM_MST_DRO_ADR2" id="simpleDroAdr2"/>
		<input type="hidden" name="MEM_MST_JBN_ADR1" id="simpleJbnAdr1"/>
		<input type="hidden" name="MEM_MST_JBN_ADR2" id="simpleJbnAdr2"/>
		<input type="hidden" name="MEM_MST_REG_DT" id="simpleRegDt"/>
		<input type="hidden" name="MEM_MST_ERP_ID" id="simpleErpId"/>
		<input type="hidden" name="MEM_MST_ERP_YN" id="simpleErpYn"/>
		<input type="hidden" name="TRM_YN0001" id="simpleSmsYn"/>
		<input type="hidden" name="TRM_YN0002" id="simpleTmYn"/>
		<input type="hidden" name="TRM_YN0003" id="simpleDmYn"/>
		<input type="hidden" name="TRM_YN0004" id="simpleEmailYn"/>
		<input type="hidden" name="TRM_YN0005" id="simpleSkYn"/>
		<input type="hidden" name="TRM_YN0006" id="simpleSCardYn"/>
		<input type="hidden" name="TRM_YN0007" id="simpleSElecYn"/>
		<input type="hidden" name="TRM_YN0008" id="simpleLgYn"/>
		<input type="hidden" name="simpleMemYn" id="simpleMemYn"/>
	</form>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
	$(function(){
	
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
			    
			    $("meta[name=viewport]").prop("content","width=480, user-scalable=no");
				
			    $(document.body).append(sirenHtml);
			    $('#sirenIframeDiv').show();
			}
			else{
				window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				target = "popupIPIN2";
			}
			
			document.ipinForm.action = "<c:out value="${ipinCertReqUrl}" />";
		    document.ipinForm.target = target;
		    document.ipinForm.submit();
	    };
	    
	    // 온라인회원 정보 가지고 전환 페이지로 이동
	    goChangeOnlineDataForm = function()
	    {
	    	$("#onlineForm").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/member/onlineMemStep1.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 간편회원 정보 가지고 전환 페이지로 이동
	    goChangeSimpleMemDataForm = function()
	    {
	    	$("#simpleForm").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/member/onlineMemStep2.do", "target":"_self", "method":"post"}).submit();
	    };
	});
//]]>
</script>
</body>
</html>