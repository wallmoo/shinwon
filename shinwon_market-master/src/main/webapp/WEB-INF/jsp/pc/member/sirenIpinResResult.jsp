<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<c:choose>
	<c:when test="${!empty closeMsg}">
	<script type="text/javascript">
	    $(function () {
	        alert("${closeMsg }");
	        window.close();
	    });
	</script>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${not empty returnUrl}">
				<script type="text/javascript">
					$(function(){
						if("${resultMsg}" != ""){
							alert("${resultMsg}");
						}
						
						opener.document.location.href = "${returnUrl}";
						window.close();
					});
				</script>	
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
				    $(function () {
				    	if("${resultMsg}" != ""){
				    		alert("${resultMsg}");				    		
				    	}
				    	
				    	var $opener = opener.document;
				    	
				    	// 회원가입
				    	if("${commandMap.gubun}" == "JOIN")
				    	{
				    		$("#MEM_IPN_CI",$opener).val("${commandMap.MEM_IPN_CI}");
					    	$("#MEM_MST_MEM_NM",$opener).val("${commandMap.MEM_MST_MEM_NM}");
					    	$("#MEM_IPN_BIR_DT",$opener).val("${commandMap.MEM_IPN_BIR_DT}");
					    	$("#MEM_IPN_NO",$opener).val("${commandMap.MEM_IPN_NO}");
					    	$("#MEM_IPN_AGE",$opener).val("${commandMap.MEM_IPN_AGE}");
					    	$("#MEM_IPN_SEX",$opener).val("${commandMap.MEM_IPN_SEX}");
					    	$("#MEM_IPN_AUT",$opener).val("${commandMap.MEM_IPN_AUT}");
					    	$("#MEM_IPN_FGN",$opener).val("${commandMap.MEM_IPN_FGN}");
					    	$("#MEM_IPN_DI",$opener).val("${commandMap.MEM_IPN_DI}");
					    	$("#MEM_IPN_CI_VER",$opener).val("${commandMap.MEM_IPN_CI_VER}");
					    	$("#MEM_IPN_AUT_GB",$opener).val("${commandMap.MEM_IPN_AUT_GB}");
					    	$("#MEM_IPN_RST",$opener).val("${commandMap.MEM_IPN_RST}");
					    	
					    	$(opener.location).attr("href", "javascript:goDataForm();");
				    	}
				    	
				    	// 아이디찾기
				    	if("${commandMap.gubun}" == "ID")
				    	{
				    		$("#memId",$opener).val("${commandMap.MEM_MST_MEM_ID}");
					    	
					    	$(opener.location).attr("href", "javascript:goBasicForm();");
				    	}
				    	
				    	// 비밀번호 찾기
				    	if("${commandMap.gubun}" == "PW")
				    	{
				    		$("#MEM_IPN_CI",$opener).val("${commandMap.MEM_IPN_CI}");
				    		$("#RST_YN",$opener).val("${commandMap.RST_YN}");
					    	
					    	$(opener.location).attr("href", "javascript:goBasicForm();");				    		
				    	}
				    	
				    	// 온라인회원 전환
				    	if("${commandMap.returnVal}" == -2){
				    		
				    		$("#onIpnBirth",$opener).val("${commandMap.MEM_IPN_BIR_DT}");
				    		$("#onSex",$opener).val("${commandMap.MEM_IPN_SEX}");
				    		$("#onCI",$opener).val("${commandMap.MEM_IPN_CI}");
				    		$("#onDI",$opener).val("${commandMap.MEM_IPN_DI}");
				    		$("#onId",$opener).val("${commandMap.MEM_MST_MEM_ID}");
				    		$("#onMemNm",$opener).val("${commandMap.MEM_MST_MEM_NM}");
				    		$("#onMail",$opener).val("${commandMap.MEM_MST_MAIL}");
				    		$("#onRcmId",$opener).val("${commandMap.MEM_MST_RCM_ID}");
				    		$("#onTel1",$opener).val("${commandMap.MEM_MST_TEL1}");
				    		$("#onTel2",$opener).val("${commandMap.MEM_MST_TEL2}");
				    		$("#onTel3",$opener).val("${commandMap.MEM_MST_TEL3}");
				    		$("#onHp1",$opener).val("${commandMap.MEM_MST_HP1}");
				    		$("#onHp2",$opener).val("${commandMap.MEM_MST_HP2}");
				    		$("#onHp3",$opener).val("${commandMap.MEM_MST_HP3}");
				    		$("#onBirth",$opener).val("${commandMap.MEM_MST_BIR_DT}");
				    		$("#onZipCode5",$opener).val("${commandMap.MEM_MST_ZIP_CDE5}");
				    		$("#onDroAdr1",$opener).val("${commandMap.MEM_MST_DRO_ADR1}");
				    		$("#onDroAdr2",$opener).val("${commandMap.MEM_MST_DRO_ADR2}");
				    		$("#onJbnAdr1",$opener).val("${commandMap.MEM_MST_JBN_ADR1}");
				    		$("#onJbnAdr2",$opener).val("${commandMap.MEM_MST_JBN_ADR2}");
				    		$("#onRegDt",$opener).val("${commandMap.MEM_MST_REG_DT}");
				    		$("#onErpId",$opener).val("${commandMap.MEM_MST_ERP_ID}");
				    		$("#onSmsYn",$opener).val("${commandMap.TRM_YN0001}");
				    		$("#onTmYn",$opener).val("${commandMap.TRM_YN0002}");
				    		$("#onDmYn",$opener).val("${commandMap.TRM_YN0003}");
				    		$("#onEmailYn",$opener).val("${commandMap.TRM_YN0004}");
				    		$("#onSkYn",$opener).val("${commandMap.TRM_YN0005}");
				    		$("#onSCardYn",$opener).val("${commandMap.TRM_YN0006}");
				    		$("#onSElecYn",$opener).val("${commandMap.TRM_YN0007}");
				    		$("#onLgYn",$opener).val("${commandMap.TRM_YN0008}");
				    		$("#erpInfoYn",$opener).val("${commandMap.erpInfoYn}");
				    		$("#onMembershipYn",$opener).val("${commandMap.membershipYn}");
				    		
					    	$(opener.location).attr("href", "javascript:goChangeOnlineDataForm();");
				    	}
				    	
				    	// 오프라인 전환
				    	if("${commandMap.returnVal}" == -3 || "${commandMap.returnVal}" == -4){

				    		$("#offIpnBirth",$opener).val("${commandMap.MEM_IPN_BIR_DT}");
				    		$("#offSex",$opener).val("${commandMap.MEM_IPN_SEX}");
				    		$("#offCI",$opener).val("${commandMap.MEM_IPN_CI}");
				    		$("#offDI",$opener).val("${commandMap.MEM_IPN_DI}");
				    		$("#offErpId",$opener).val("${commandMap.MEM_MST_ERP_ID}");
				    		$("#offOcbNo",$opener).val("${commandMap.MEM_MST_OCB_NO}");
				    		$("#offMemNm",$opener).val("${commandMap.MEM_MST_MEM_NM}");
				    		$("#offMail",$opener).val("${commandMap.MEM_MST_MAIL}");
					    	$("#offJbnAdr1",$opener).val("${commandMap.MEM_MST_JBN_ADR1}");
					    	$("#offJbnAdr2",$opener).val("${commandMap.MEM_MST_JBN_ADR2}");
					    	$("#offDroAdr1",$opener).val("${commandMap.MEM_MST_DRO_ADR1}");
					    	$("#offDroAdr2",$opener).val("${commandMap.MEM_MST_DRO_ADR2}");
					    	$("#offZipCode6",$opener).val("${commandMap.MEM_MST_ZIP_CDE6}");
					    	$("#offZipCode5",$opener).val("${commandMap.MEM_MST_ZIP_CDE5}");
					    	$("#offTel1",$opener).val("${commandMap.MEM_MST_TEL1}");
					    	$("#offTel2",$opener).val("${commandMap.MEM_MST_TEL2}");
					    	$("#offTel3",$opener).val("${commandMap.MEM_MST_TEL3}");
					    	$("#offHp1",$opener).val("${commandMap.MEM_MST_HP1}");
					    	$("#offHp2",$opener).val("${commandMap.MEM_MST_HP2}");
					    	$("#offHp3",$opener).val("${commandMap.MEM_MST_HP3}");
					    	$("#offBirth",$opener).val("${commandMap.MEM_MST_BIR_DT}");
					    	$("#offRcmId",$opener).val("${commandMap.MEM_MST_RCM_ID}");
					    	$("#offRegDt",$opener).val("${commandMap.offRegDt}");
					    	$("#offSmsYn",$opener).val("${commandMap.TRM_YN0001}");
					    	$("#offTmYn",$opener).val("${commandMap.TRM_YN0002}");
					    	$("#offDmYn",$opener).val("${commandMap.TRM_YN0003}");
					    	$("#offEmailYn",$opener).val("${commandMap.TRM_YN0004}");
					    	$("#membershipYn",$opener).val("${commandMap.membershipYn}");
					    	$("#EXMILEGE",$opener).val("${commandMap.EXMILEGE}");
					    	$("#P8E1CTDG",$opener).val("${commandMap.P8E1CTDG}");
					    	$("#SOLUBLE_MILEAGE",$opener).val("${commandMap.SOLUBLE_MILEAGE}");
					    	
					    	$(opener.location).attr("href", "javascript:goChangeOfflineDataForm();");
				    	}
				    	
				    	// 간편회원 전환
				    	if("${commandMap.changeSimpleMem}" == "Y")
				    	{
				    		$("#simpleIpnBirth",$opener).val("${commandMap.MEM_IPN_BIR_DT}");
				    		$("#simpleCI",$opener).val("${commandMap.MEM_IPN_CI}");
				    		$("#simpleDI",$opener).val("${commandMap.MEM_IPN_DI}");
				    		$("#simpleSex",$opener).val("${commandMap.MEM_MST_SEX}");
				    		$("#simpleId",$opener).val("${commandMap.MEM_MST_MEM_ID}");
				    		$("#simpleMemNm",$opener).val("${commandMap.MEM_MST_MEM_NM}");
				    		$("#simpleMail",$opener).val("${commandMap.MEM_MST_MAIL}");
				    		$("#simpleRcmId",$opener).val("${commandMap.MEM_MST_RCM_ID}");
				    		$("#simpleTel1",$opener).val("${commandMap.MEM_MST_TEL1}");
				    		$("#simpleTel2",$opener).val("${commandMap.MEM_MST_TEL2}");
				    		$("#simpleTel3",$opener).val("${commandMap.MEM_MST_TEL3}");
				    		$("#simpleHp1",$opener).val("${commandMap.MEM_MST_HP1}");
				    		$("#simpleHp2",$opener).val("${commandMap.MEM_MST_HP2}");
				    		$("#simpleHp3",$opener).val("${commandMap.MEM_MST_HP3}");
				    		$("#simpleBirth",$opener).val("${commandMap.MEM_MST_BIR_DT}");
				    		$("#simpleZipCode5",$opener).val("${commandMap.MEM_MST_ZIP_CDE5}");
				    		$("#simpleDroAdr1",$opener).val("${commandMap.MEM_MST_DRO_ADR1}");
				    		$("#simpleDroAdr2",$opener).val("${commandMap.MEM_MST_DRO_ADR2}");
				    		$("#simpleJbnAdr1",$opener).val("${commandMap.MEM_MST_JBN_ADR1}");
				    		$("#simpleJbnAdr2",$opener).val("${commandMap.MEM_MST_JBN_ADR2}");
				    		$("#simpleRegDt",$opener).val("${commandMap.MEM_MST_REG_DT}");
				    		$("#simpleErpId",$opener).val("${commandMap.MEM_MST_ERP_ID}");
				    		$("#simpleErpYn",$opener).val("${commandMap.MEM_MST_ERP_YN}");
				    		$("#simpleSmsYn",$opener).val("${commandMap.TRM_YN0001}");
				    		$("#simpleTmYn",$opener).val("${commandMap.TRM_YN0002}");
				    		$("#simpleDmYn",$opener).val("${commandMap.TRM_YN0003}");
				    		$("#simpleEmailYn",$opener).val("${commandMap.TRM_YN0004}");
				    		$("#simpleSkYn",$opener).val("${commandMap.TRM_YN0005}");
				    		$("#simpleSCardYn",$opener).val("${commandMap.TRM_YN0006}");
				    		$("#simpleSElecYn",$opener).val("${commandMap.TRM_YN0007}");
				    		$("#simpleLgYn",$opener).val("${commandMap.TRM_YN0008}");
				    		$("#simpleMemYn",$opener).val("${commandMap.changeSimpleMem}");
				    		
				    		$(opener.location).attr("href", "javascript:goChangeSimpleMemDataForm();");
				    	}
				    	
				    	window.close();
				    	
					});
				</script>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>