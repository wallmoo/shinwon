<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>마켓플랜트 칭찬하기</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>마켓플랜트는 고객의 의견을 소중이 생각합니다!</li>
                <li>지점 방문 시 지점에서 만난 친절한 직원에게  소중한 한마디 남겨주세요</li>
            </ul>
        </div>

        <h3 class="info-title">개인정보 보호를 위한 이용자 동의사항</h3>
		<form id="frm">     
        <div class="padder agreement-wrap"><!-- agreement-wrap -->
            <div class="agreement" tabindex="0">
                <pre>칭찬하기 개인정보 수집ㆍ이용 동의

마켓플랜트 은 고객님의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보를 수집ㆍ이용합니다.

1. 개인정보 수집 및 이용목적
① 게시물 작성자 정보 확보
② 서비스 개선을 위한 활용

2. 개인정보 수집항목
① 필수정보 : 성명, 핸드폰 번호, 이메일, 방문지점 직원, 방문일, 게시물 작성 내용
② 선택정보 : 연락처, 물류센터 배송기사

3. 개인정보의 보유 및 이용기간
고객님의 개인정보는 수집 및 이용목적이 달성되면 지체없이 파기합니다. 단, 관련 법령에  명시된 아래의 사유에 해당하는 경우에는 해당 기간 종료시까지 개인정보를 보유합니다. 
① 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
② 접속에 관한 기록보존 : 3개월

</pre>
            </div>
            <p>
                위 내용에 동의하시겠습니까?&nbsp;&nbsp;
                <label for="areement" class="js-checkbox">
                    <input type="checkbox" id="areement" name="areement" class="checkbox" value="Y" <c:if test="${commandMap.areement eq 'Y'}">checked="checked"</c:if>/>
                    동의합니다.
                </label>
            </p>
        </div><!-- // agreement-wrap -->

        
        <div class="ct info-title">
            <h3 class="fl">칭찬하기</h3>
            <p class="fr small">
                <span class="essential"><em class="blind">필수입력</em></span> 표시는 필수 입력사항입니다.
            </p>
        </div>
  
	        <ul class="form-a compliment-form"><!-- form-a -->
	            <li class="name">
	                <div class="tit">
	                    <label for="EMP_THK_CST_NM">고객명<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <input type="text" name="EMP_THK_CST_NM" id="EMP_THK_CST_NM"  class="text" value="<c:out value="${commandMap.EMP_THK_CST_NM}" />">
	                </div>
	            </li>
	            <li class="tel">
	                <div class="tit">
	                    <label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="EMP_THK_HP1" class="sel_box_st0" title="휴대폰 번호 앞자리">
	                        <select id="EMP_THK_HP1" name="EMP_THK_HP1"  class="select">
	                             <c:forEach var="codeRow" items="${hpCodeList }" varStatus="i">
		                    		<option value="<c:out value="${codeRow.CMN_COM_NM }"/>" <c:if test="${commandMap.EMP_THK_HP1 eq codeRow.CMN_COM_NM}">selected="selected"</c:if>>
		                        		<c:out value="${codeRow.CMN_COM_NM }"/>
		                            </option>
		                        </c:forEach>
	                        </select>
	                    </label> -
	                    <input type="text" id="EMP_THK_HP2" name="EMP_THK_HP2" class="text small" maxlength="4" title="휴대폰 번호 중간자리" value="<c:out value="${commandMap.EMP_THK_HP2}" />"> -
	                    <input type="text" id="EMP_THK_HP3" name="EMP_THK_HP3" class="text small"  maxlength="4" title="휴대폰 번호 끝자리" value="<c:out value="${commandMap.EMP_THK_HP3}" />">
	                </div>
	            </li>
	            <li class="tel">
	                <div class="tit">
	                    <label for="tel">연락처</label>
	                </div>
	                <div class="field">
	                    <label for="EMP_THK_TEL1" class="sel_box_st0" title="연락처 앞자리">
	                        <select id="EMP_THK_TEL1" name="EMP_THK_TEL1" class="select">
	                            <c:forEach var="codeRow" items="${telCodeList }" varStatus="i">
		                    		<option value="<c:out value="${codeRow.CMN_COM_NM }"/>" <c:if test="${commandMap.EMP_THK_TEL1 eq codeRow.CMN_COM_NM}">selected="selected"</c:if>>
		                        		<c:out value="${codeRow.CMN_COM_NM }"/>
		                            </option>
		                        </c:forEach>
	                        </select>
	                    </label> -
	                    <input type="text" id="EMP_THK_TEL2" name="EMP_THK_TEL2"  class="text small" maxlength="4" title="연락처 중간자리" value="<c:out value="${commandMap.EMP_THK_TEL2}" />"> -
	                    <input type="text" id="EMP_THK_TEL3" name="EMP_THK_TEL3"  class="text small"  maxlength="4" title="연락처 끝자리" value="<c:out value="${commandMap.EMP_THK_TEL3}" />">
	                </div>
	            </li>
	            <li class="mail">
	                <div class="tit">
	                    <label for="mail">이메일<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="text" id="MAIL1" name="MAIL1" class="text" title="이메일 아이디" value="<c:out value="${commandMap.MAIL1}" />"> @
	                        <input type="text" id="MAIL2" name="MAIL2" class="text" title="이메일 도메인" value="<c:out value="${commandMap.MAIL2}" />">
	                    </p>
	                    <p>
	                        <label for="MAIL_SEL" class="sel_box_st0">
	                            <select id="MAIL_SEL" name="MAIL_SEL"  class="select">
	                                <option value="">직접입력</option>
	                                <c:forEach var="codeRow" items="${emailCodeList }" varStatus="i">
		                    		<option value="<c:out value="${codeRow.CMN_COM_NM }"/>" <c:if test="${commandMap.MAIL_SEL eq codeRow.CMN_COM_NM}">selected="selected"</c:if>>
		                        		<c:out value="${codeRow.CMN_COM_NM }"/>
		                            </option>
		                        </c:forEach>
	                            </select>
	                        </label>
	                    </p>
	                    <input type="hidden" name="EMP_THK_MAIL" id="EMP_THK_MAIL" />
	                </div>
	            </li>
	            <li class="staff">
	                <div class="tit">
	                    <label for="EMP_THK_BRC_NM">방문지점/직원<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="text" name="EMP_THK_BRC_NM" id="EMP_THK_BRC_NM" class="text" title="방문지점" value="<c:out value="${commandMap.BU_NAME_S }"/>" readonly/>
	                        <input type="text" name="EMP_THK_CHG_NM" id="EMP_THK_CHG_NM" class="text" title="직원" value="<c:out value="${commandMap.KS_NAME_S }"/>" readonly/>
	                        <input type="hidden" name="EMP_THK_BRC_CD" id="EMP_THK_BRC_CD" value="<c:out value="${commandMap.BU_CODE_S }"/>" />
	                        <input type="hidden" name="EMP_THK_CHG_SBN" id="EMP_THK_CHG_SBN" value="<c:out value="${commandMap.KS_SABUN_S }"/>"/>
	                    </p>
	                    <p>
	                        <a id="popupPraiseEmployee" href="javascript:popupPraiseEmployee()" class="button primary small full"><span>검색</span></a>
	                    </p>
	                </div>
	            </li>
	            <li class="date">
	                <div class="tit">
	                    <label for="date">방문일<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="EMP_THK_VST_DT_YY" class="sel_box_st0" title="방문 년도">
	                        <select id="EMP_THK_VST_DT_YY" name="EMP_THK_VST_DT_YY" class="select">
	                            <option value="">년도</option>
	                            <c:forEach var="codeRow" items="${yearList }" varStatus="i">
		                           	<option value="<c:out value="${codeRow.YEAR }"/>" <c:if test="${commandMap.EMP_THK_VST_DT_YY eq codeRow.YEAR}">selected="selected"</c:if>>
				                   		<c:out value="${codeRow.YEAR }"/>년
				                  	</option>
				                </c:forEach>
	                        </select>
	                    </label>
	                    <label for="EMP_THK_VST_DT_MM" class="sel_box_st0" title="방문 월">
	                        <select id="EMP_THK_VST_DT_MM" name="EMP_THK_VST_DT_MM" class="select">
	                            <option value="">월</option>
	                            <option value="01" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '01'}">selected="selected"</c:if>>1월</option>
	                            <option value="02" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '02'}">selected="selected"</c:if>>2월</option>
	                            <option value="03" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '03'}">selected="selected"</c:if>>3월</option>
	                            <option value="04" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '04'}">selected="selected"</c:if>>4월</option>
	                            <option value="05" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '05'}">selected="selected"</c:if>>5월</option>
	                            <option value="06" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '06'}">selected="selected"</c:if>>6월</option>
	                            <option value="07" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '07'}">selected="selected"</c:if>>7월</option>
	                            <option value="08" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '08'}">selected="selected"</c:if>>8월</option>
	                            <option value="09" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '09'}">selected="selected"</c:if>>9월</option>
	                            <option value="10" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '10'}">selected="selected"</c:if>>10월</option>
	                            <option value="11" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '11'}">selected="selected"</c:if>>11월</option>
	                            <option value="12" <c:if test="${commandMap.EMP_THK_VST_DT_MM eq '12'}">selected="selected"</c:if>>12월</option>
	                        </select>
	                    </label>
	                    <label for="EMP_THK_VST_DT_DD" class="sel_box_st0" title="방문 일">
	                        <select id="EMP_THK_VST_DT_DD" name="EMP_THK_VST_DT_DD" class="select">
	                            <option value="">일</option>
	                            <c:forEach begin="1" end="31" step="1" varStatus="i">
			                    	<c:set var="dd" value="${i.index}"/>
			                     	<c:if test="${i.index < 10}">
			                      		<c:set var="dd" value="0${i.index}"/>
			                       	</c:if>
			                      	<option value="${dd}" <c:if test="${commandMap.EMP_THK_VST_DT_DD eq dd}">selected="selected"</c:if>>${i.index}일</option>
			                    </c:forEach>
	                        </select>
	                    </label>
	                    <input type="hidden" name="EMP_THK_VST_DT" id="EMP_THK_VST_DT" />
	                </div>
	            </li>
	            <li class="staff">
	                <div class="tit">
	                    <label for="EMP_THK_CTR_NM">물류배송점<br />/배송기사</label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="text" name="EMP_THK_CTR_NM" id="EMP_THK_CTR_NM" class="text" title="물류배송점 " value="<c:out value="${commandMap.EMP_THK_CTR_NM }"/>" readonly/>
	                        <input type="text" name="EMP_THK_DRV_NM" id="EMP_THK_DRV_NM"  class="text" title="배송기사" value="<c:out value="${commandMap.EMP_THK_DRV_NM }"/>" readonly/>
	                        <input type="hidden" name="EMP_THK_CTR_CD" id="EMP_THK_CTR_CD" value="<c:out value="${commandMap.EMP_THK_CTR_CD }"/>" />
	                        <input type="hidden" name="EMP_THK_DRV_SBN" id="EMP_THK_DRV_SBN" value="<c:out value="${commandMap.EMP_THK_DRV_SBN }"/>"/>
	                    </p>
	                    <p>
	                        <a id="popupPraiseDelivery" href="javascript:popupPraiseDelivery();" class="button primary small full"><span>검색</span></a>
	                    </p>
	                </div>
	            </li>
	            <li class="subject">
	                <div class="tit">
	                    <label for="EMP_THK_TITLE">제목<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <input type="text" id="EMP_THK_TITLE" name="EMP_THK_TITLE" class="text" value="<c:out value="${commandMap.EMP_THK_TITLE }"/>">
	                </div>
	            </li>
	            <li class="message">
	                <div class="tit">
	                    <label for="EMP_THK_CONTENTS">내용<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <textarea class="textarea" id="EMP_THK_CONTENTS" name="EMP_THK_CONTENTS"><c:out value="${commandMap.EMP_THK_CONTENTS }"/></textarea>
	                </div>
	            </li>
	        </ul><!-- // form-a -->
		</form>
        <div class="section-button"><!-- section-button -->
            <a href="javascript:goRegist();" class="button warning"><span>저장하기</span></a>
        </div><!-- // section-button -->
        
	</article>
	<!--// #container E -->

<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<script>
$(document).ready(function(){
    //달력
    //epass.datepickr-0.4.js 이거불러와서 써주세요.
    $('.btn_calendar').datePickr();

});

//유형 변경시
$(document).on("click","#MAIL_SEL",function(){
	var thisValue = $(this).val();
	$("#MAIL2").val(thisValue);
	
});

popupPraiseEmployee		= function(page){
    // 해당 그룹의 최 상위 부모 Node
     
    //window.open("<c:out value="${serverDomain }"/>/info/mobile/support/popupPraiseEmployee.do","popupPraiseEmployee","width=600, height=920, scrollbars=yes");
    //location.href = "<c:out value="${serverDomain }"/>/info/mobile/support/popupPraiseEmployee.do";
    //$("#frm").attr({"action":"<c:out value="${serverDomain}" />/info/mobile/support/popupPraiseEmployee.do", "target":"_self", "method":"post"}).submit();
    window.open("<c:out value="${mobileBrandDomain }"/>/info/mobile/support/popupPraiseEmployee.do","popupPraiseDelivery");
};

popupPraiseDelivery		= function(page){
    // 해당 그룹의 최 상위 부모 Node
     
    window.open("<c:out value="${mobileBrandDomain }"/>/info/mobile/support/popupPraiseDelivery.do","popupPraiseDelivery");
};


fnResultEmp = function(params){
	$.each(params, function(index,item){
		var BU_NAME = item.BU_NAME;
		var KS_NAME = item.KS_NAME;
		var BU_CODE = item.BU_CODE;
		var KS_SABUN = item.KS_SABUN;
		if(BU_NAME=="noStaff")
		{
			BU_NAME = "해당 사항 없음";
			KS_NAME = "해당 사항 없음";
			BU_CODE = "0";
			KS_SABUN = "0";
		}
		
		$("#EMP_THK_BRC_NM").val(BU_NAME);
		$("#EMP_THK_BRC_CD").val(BU_CODE);
		$("#EMP_THK_CHG_NM").val(KS_NAME);
		$("#EMP_THK_CHG_SBN").val(KS_SABUN);
	
    });
	
	return true;
};

fnResultDelivery = function(params){
	$.each(params, function(index,item){
		var BU_NAME = item.BU_NAME;
		var KS_NAME = item.KS_NAME;
		var BU_CODE = item.BU_CODE;
		var KS_SABUN = item.KS_SABUN;
		if(BU_NAME=="noStaff")
		{
			BU_NAME = "해당 사항 없음";
			KS_NAME = "해당 사항 없음";
			BU_CODE = "0";
			KS_SABUN = "0";
		}
		
		$("#EMP_THK_CTR_NM").val(BU_NAME);
		$("#EMP_THK_CTR_CD").val(BU_CODE);
		$("#EMP_THK_DRV_NM").val(KS_NAME);
		$("#EMP_THK_DRV_SBN").val(KS_SABUN);
	
    });
	
	return true;
};

// 등록 이벤트
goRegist = function(){
    var $frm = $("#frm"); 
    if(!$("#areement").is(':checked'))
    {
    	alert("이용자 동의사항에 동의해 주십시오.");
    	//$("#areement").focus();
    	$("#areement").parent().attr('tabindex',0).focus();
		return;
    }
    if($.trim($("#EMP_THK_CST_NM").val()) == ""){
		alert("고객명을 입력해 주십시오.");
		$("#EMP_THK_CST_NM").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_HP1").val()) == ""){
		alert("휴대폰번호를 입력해 주십시오.");
		$("#EMP_THK_HP1").focus();
		return;
	}
    if($.trim($("#EMP_THK_HP2").val()) == ""){
		alert("휴대폰번호를 입력해 주십시오.");
		$("#EMP_THK_HP2").focus();
		return;
	}
    if($.trim($("#EMP_THK_HP3").val()) == ""){
		alert("휴대폰번호를 입력해 주십시오.");
		$("#EMP_THK_HP3").focus();
		return;
	}
    if($.trim($("#MAIL1").val()) == ""){
		alert("이메일을 입력해 주십시오.");
		$("#MAIL1").focus();
		return;
	}
    if($.trim($("#MAIL2").val()) == ""){
		alert("이메일을 입력해 주십시오.");
		$("#MAIL2").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_BRC_NM").val()) == ""){
		alert("방문지점/직원을 선택해 주십시오.");
		$("#popupPraiseEmployee").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_VST_DT_YY").val()) == ""){
		alert("방문일 년도를 선택해 주십시오.");
		$("#EMP_THK_VST_DT_YY").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_VST_DT_MM").val()) == ""){
		alert("방문일 월을 선택해 주십시오.");
		$("#EMP_THK_VST_DT_MM").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_VST_DT_DD").val()) == ""){
		alert("방문일을 선택해 주십시오.");
		$("#EMP_THK_VST_DT_DD").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_TITLE").val()) == ""){
		alert("제목을 입력해 주십시오.");
		$("#EMP_THK_TITLE").focus();
		return;
	}
    
    if($.trim($("#EMP_THK_CONTENTS").val()) == ""){
		alert("내용을 입력해 주십시오.");
		$("#EMP_THK_CONTENTS").focus();
		return;
	}
    
   
    if (confirm( "저장 하시겠습니까?")) {
    	var mail = "";
    	var MEM_CST_VST_DT = "";
    	mail = $("#MAIL1").val()+"@"+$("#MAIL2").val();
    	$("#EMP_THK_MAIL").val(mail);
    	MEM_CST_VST_DT = $("#MEM_CST_VST_DT_YY").val()+$("#MEM_CST_VST_DT_MM").val()+$("#MEM_CST_VST_DT_DD").val();
    	$("#MEM_CST_VST_DT").val(MEM_CST_VST_DT);
    	
        $("#frm").attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/support/praiseRegist.do", "target":"_self", "method":"post"}).submit();
    }

};

 
</script>

</body>
</html>