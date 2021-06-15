<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">

<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
			
			<dl class="join_top"><!-- .join_top S -->
				<dt><h2>마켓플랜트 통합 회원 전환</h2></dt>
				<dd class="tx_sub">
					<p>마켓플랜트는 통합 회원 전환으로 보다 나은 서비스를 제공하고자 합니다.<br/>
						통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있는 서비스입니다.</p>
				</dd>
				<dd class="nv stp_4">
					<ol>
						<li class="f on"><strong><span>01</span>본인인증</strong></li>
						<li><strong><span>02</span>전환 약관동의</strong></li>
						<li><strong><span>03</span>가입정보 재입력</strong></li>
						<li class="l "><strong><span>04</span>전환완료</strong></li>
					</ol>
				</dd>
			</dl><!--// .join_top E -->
	
			<ul class="join_con"><!-- .join_con S -->
				<li class="certifi">
					<div class="f">
						<a href="javascript:fnSirenPopup();" class="btn_st2 btn_rd"><span>휴대폰으로 인증하기</span></a>
						<p>
							<span>본인 명의로 된 휴대폰 번호로만 인증이 가능합니다.</span>
							<span>타인명의/법인휴대폰 회원님은 휴대폰 본인인증이 불가합니다.</span>
						</p>
					</div>
					<div class="l">
						<a href="javascript:fnIpinPopup();" class="btn_st2 btn_white"><span>아이핀(i-pin)으로 인증하기</span></a>
						<p>
							<span>아이핀 ID에 가입하신 고객분들만 사용 가능합니다.</span>
							<span>아이핀 ID가 없는 경우 아이핀 발급기관에서 발급받으셔야 이용 가능합니다.</span>
						</p>
					</div>
					<hr class="line_1px" />
				</li>
			</ul><!--// .join_con E -->
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>

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



<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		// 사이렌 본인인증 팝업
		fnSirenPopup = function()
	    {
			window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		    document.certForm.action = "<c:out value="${certReqUrl}" />";
		    document.certForm.target = "popupChk";
		    document.certForm.submit();
	    };
		
	    // IPIN 본인인증 팝업
		fnIpinPopup = function()
	    {
			window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	        document.ipinForm.target = "popupIPIN2";
	        document.ipinForm.action = "<c:out value="${ipinCertReqUrl}"/>";
	        document.ipinForm.submit();
	    };
	    
	    // 온라인회원 정보 가지고 전환 페이지로 이동
	    goChangeOnlineDataForm = function()
	    {
	    	$("#onlineForm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/onlineMemStep1.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 간편회원 정보 가지고 전환 페이지로 이동
	    goChangeSimpleMemDataForm = function()
	    {
	    	$("#simpleForm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/onlineMemStep2.do", "target":"_self", "method":"post"}).submit();
	    };
	   
	});
</script>
</body>
</html>