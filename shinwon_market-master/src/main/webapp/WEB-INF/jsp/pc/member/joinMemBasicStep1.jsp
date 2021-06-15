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
			<form id="dataForm" name="dataForm" method="post">
			<input type="hidden" name="MEM_IPN_CI" id="MEM_IPN_CI"/>
			<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM"/>
			<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT"/>
			<input type="hidden" name="MEM_IPN_NO" id="MEM_IPN_NO"/>
			<input type="hidden" name="MEM_IPN_AGE" id="MEM_IPN_AGE"/>
			<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX"/>
			<input type="hidden" name="MEM_IPN_AUT" id="MEM_IPN_AUT"/>
			<input type="hidden" name="MEM_IPN_FGN" id="MEM_IPN_FGN"/>
			<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI"/>
			<input type="hidden" name="MEM_IPN_CI_VER" id="MEM_IPN_CI_VER"/>
			<input type="hidden" name="MEM_IPN_AUT_GB" id="MEM_IPN_AUT_GB"/>
			<input type="hidden" name="MEM_IPN_RST" id="MEM_IPN_RST"/>
			<input type="hidden" name="MEM_IPN_HP_CRP" id="MEM_IPN_HP_CRP"/>
			<input type="hidden" name="MEM_IPN_CRT_DT" id="MEM_IPN_CRT_DT"/>
			<input type="hidden" name="joinType" id="joinType" value="memberBasic"/> 
			
			<dl class="join_top"><!-- .join_top S -->
				<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
				<dd class="tx_sub">
					<p>마켓플랜트 통합회원으로 가입하시면 마켓플랜트와<br/>
						전국 매장에서 포인트 적립 및 다양한 혜택을 받으실 수 있으며 프로모션과 이벤트 참여가 가능합니다.<br/>
						고객님의 개인정보보호를 위해 본인 확인 절차를 거쳐 회원가입을 하고 있습니다.</p>
				</dd>
				<dd class="nv stp_4">
					<ol>
						<li class="f on"><strong><span>01</span>본인인증</strong></li>
						<li><strong><span>02</span>약관동의</strong></li>
						<li><strong><span>03</span>정보입력</strong></li>
						<li class="l "><strong><span>04</span>가입완료</strong></li>
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
							<span>아이핀ID에 가입하신 고객분들만 사용 가능합니다.</span>
							<span>아이핀ID가 없는 경우 아이핀 발급기관에서 발급 받으셔야 이용 가능합니다.</span>
						</p>
					</div>
					<hr class="line_1px" />
				</li>
			</ul><!--// .join_con E -->
			</form>
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

<!-- 오프라인 전환 폼 -->
<form name="offlineForm" id="offlineForm">
<input type="hidden" name="MEM_IPN_BIR_DT" id="offIpnBirth"/>
<input type="hidden" name="MEM_IPN_SEX" id="offSex"/>
<input type="hidden" name="MEM_IPN_CI" id="offCI"/>
<input type="hidden" name="MEM_IPN_DI" id="offDI"/>
<input type="hidden" name="MEM_MST_ERP_ID" id="offErpId"/>
<input type="hidden" name="MEM_MST_OCB_NO" id="offOcbNo"/>
<input type="hidden" name="MEM_MST_MEM_NM" id="offMemNm"/>
<input type="hidden" name="MEM_MST_MAIL" id="offMail"/>
<input type="hidden" name="MEM_MST_JBN_ADR1" id="offJbnAdr1"/>
<input type="hidden" name="MEM_MST_JBN_ADR2" id="offJbnAdr2"/>
<input type="hidden" name="MEM_MST_DRO_ADR1" id="offDroAdr1"/>
<input type="hidden" name="MEM_MST_DRO_ADR2" id="offDroAdr2"/>
<input type="hidden" name="MEM_MST_ZIP_CDE6" id="offZipCode6"/>
<input type="hidden" name="MEM_MST_ZIP_CDE5" id="offZipCode5"/>
<input type="hidden" name="MEM_MST_TEL1" id="offTel1"/>
<input type="hidden" name="MEM_MST_TEL2" id="offTel2"/>
<input type="hidden" name="MEM_MST_TEL3" id="offTel3"/>
<input type="hidden" name="MEM_MST_HP1" id="offHp1"/>
<input type="hidden" name="MEM_MST_HP2" id="offHp2"/>
<input type="hidden" name="MEM_MST_HP3" id="offHp3"/>
<input type="hidden" name="MEM_MST_BIR_DT" id="offBirth"/>
<input type="hidden" name="MEM_MST_RCM_ID" id="offRcmId"/>
<input type="hidden" name="TRM_YN0001" id="offSmsYn"/>
<input type="hidden" name="TRM_YN0002" id="offTmYn"/>
<input type="hidden" name="TRM_YN0003" id="offDmYn"/>
<input type="hidden" name="TRM_YN0004" id="offEmailYn"/>
<input type="hidden" name="offRegDt" id="offRegDt"/>
<input type="hidden" name="membershipYn" id="membershipYn"/>
<input type="hidden" name="EXMILEGE" id="EXMILEGE"/>
<input type="hidden" name="P8E1CTDG" id="P8E1CTDG"/>
<input type="hidden" name="SOLUBLE_MILEAGE" id="SOLUBLE_MILEAGE"/>
</form>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		// 사이렌 본인인증 팝업
		fnSirenPopup = function()
	    {
			window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		    /* document.certForm.action = "<c:out value="${certReqUrl}" />"; */
		    document.certForm.action = "/pc/member/sirenResResult.do";
		    document.certForm.target = "popupChk";
		    document.certForm.submit();
	    };
		
	    // IPIN 본인인증 팝업
		fnIpinPopup = function()
	    {
			window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	        document.ipinForm.target = "popupIPIN2";
	        /* document.ipinForm.action = "<c:out value="${ipinCertReqUrl}"/>"; */
	        document.ipinForm.action = "/pc/member/sirenResResult.do";
	        document.ipinForm.submit();
	    };
	    
	    // 사이렌 본인인증 데이터 가지고 약관동의 페이지로 이동
	    goDataForm = function()
	    {
	    	$("#dataForm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemBasicStep2.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 온라인회원 정보 가지고 전환 페이지로 이동
	    goChangeOnlineDataForm = function()
	    {
	    	$("#onlineForm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/onlineMemStep1.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 오프라인회원 정보 가지고 전환 페이지로 이동
	    goChangeOfflineDataForm = function()
	    {
	    	$("#offlineForm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/offlineMemStep1.do", "target":"_self", "method":"post"}).submit();
	    };
	});
</script>
</body>
</html>