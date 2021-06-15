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
            <h2>상담하기</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>마켓플랜트는 고객의 의견을 소중이 생각합니다!</li>
                <li>상품, 서비스 등 궁금하신 사항, 무엇이든 물어보세요!</li>
            </ul>
        </div>

        <h3 class="info-title">개인정보 보호를 위한 이용자 동의사항</h3>

        <div class="padder agreement-wrap"><!-- agreement-wrap -->
            <div class="agreement" tabindex="0">
                <pre>상담하기 개인정보 수집ㆍ이용 동의

마켓플랜트 은 고객님의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보를 수집ㆍ이용합니다. 보다 자세한 내용은 『개인정보 취급방침』을 확인하여 주시기 바랍니다.

1. 개인정보 수집 및 이용목적
① 게시물 작성자 정보 확보
② 서비스 개선을 위한 활용
③ 불만처리 의사소통 경로 확보

2. 개인정보 수집항목
① 필수정보 : 성명, 핸드폰 번호, 이메일, 구입(예정)지점, 구입(예정)일, 게시물 작성 내용
② 선택정보 : 연락처, 구입(예정)모델

3. 개인정보의 보유 및 이용기간
고객님의 개인정보는 수집 및 이용목적이 달성되면 지체없이 파기합니다. 단, 관련 법령에  명시된 아래의 사유에 해당하는 경우에는 해당 기간 종료시까지 개인정보를 보유합니다. 
① 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
② 접속에 관한 기록보존 : 3개월

</pre>
            </div>
            <p>
                위 내용에 동의하시겠습니까?&nbsp;&nbsp;
                <label for="areement" class="js-checkbox">
                    <input type="checkbox" id="areement" class="checkbox" />
                    동의합니다.
                </label>
            </p>
        </div><!-- // agreement-wrap -->

        
        <div class="ct info-title">
            <h3 class="fl">상담하기</h3>
            <p class="fr small">
                <span class="essential"><em class="blind">필수입력</em></span> 표시는 필수 입력사항입니다.
            </p>
        </div>
		<form id="frm">
	        <ul class="form-a compliment-form"><!-- form-a -->
	            <li class="name">
	                <div class="tit">
	                    <label for="MEM_CST_NM">고객명<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <input type="text" id="MEM_CST_NM" name="MEM_CST_NM" class="text">
	                </div>
	            </li>
	            <li>
	                <div class="tit">
	                    <label for="type">구분<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="MEM_CST_TYPE" class="sel_box_st0">
	                        <select id="MEM_CST_TYPE" name="MEM_CST_TYPE" class="select">
	                            <option value="">전체</option>
	                            <c:forEach var="codeRow" items="${consultGbCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
			                        	<c:out value="${codeRow.CMN_COM_NM }"/>
			                        </option>
			                    </c:forEach>
	                        </select>
	                    </label>
	                </div>
	            </li>
	            <li class="tel">
	                <div class="tit">
	                    <label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="MEM_CST_HP1" class="sel_box_st0" title="휴대폰 번호 앞자리">
	                        <select id="MEM_CST_HP1" name="MEM_CST_HP1" class="select">
	                            <c:forEach var="codeRow" items="${hpCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
			                        	<c:out value="${codeRow.CMN_COM_NM }"/>
			                        </option>
			                    </c:forEach>
	                        </select>
	                    </label> -
	                    <input type="text" id="MEM_CST_HP2" name="MEM_CST_HP2" class="text small" maxlength="4" title="휴대폰 번호 중간자리"> -
	                    <input type="text" id="MEM_CST_HP3" name="MEM_CST_HP3" class="text small"  maxlength="4" title="휴대폰 번호 끝자리">
	                </div>
	            </li>
	            <li class="tel">
	                <div class="tit">
	                    <label for="tel">연락처</label>
	                </div>
	                <div class="field">
	                    <label for="MEM_CST_TEL1" class="sel_box_st0" title="연락처 앞자리">
	                        <select id="MEM_CST_TEL1" name="MEM_CST_TEL1" class="select">
	                            <c:forEach var="codeRow" items="${telCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
			                        	<c:out value="${codeRow.CMN_COM_NM }"/>
			                        </option>
			                    </c:forEach>
	                        </select>
	                    </label> -
	                    <input type="text" id="MEM_CST_TEL2" name="MEM_CST_TEL2" class="text small" maxlength="4" title="연락처 중간자리"> -
	                    <input type="text" id="MEM_CST_TEL3" name="MEM_CST_TEL3" class="text small"  maxlength="4" title="연락처 끝자리">
	                </div>
	            </li>
	            <li class="mail">
	                <div class="tit">
	                    <label for="MAIL1">이메일<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="text" id="MAIL1" name="MAIL1" class="text" title="이메일 아이디"> @
	                        <input type="text" id="MAIL2" name="MAIL2" class="text" title="이메일 도메인">
	                    </p>
	                    <p>
	                        <label for="MAIL_SEL" class="sel_box_st0">
	                            <select id="MAIL_SEL" class="select">
	                                <option value="">직접입력</option>
	                                <c:forEach var="codeRow" items="${emailCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
			                      		<c:out value="${codeRow.CMN_COM_NM }"/>
			                    	</option>
			                    </c:forEach>
	                            </select>
	                        </label>
	                    </p>
	                    <input type="hidden" name="MEM_CST_MAIL" id="MEM_CST_MAIL" />
	                </div>
	            </li>
	            <li>
	                <div class="tit">
	                    <label for="BRANCH_SEL">구입(예정)지점<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <p>
	                        <label for="BRANCH_SEL" class="sel_box_st0">
	                            <select id="BRANCH_SEL" class="select">
	                                <option value="">전체</option>
	                                <c:forEach var="codeRow" items="${branchList }" varStatus="i">
		                            	<option value="<c:out value="${codeRow.SHP_MST_IDX }"/>^<c:out value="${codeRow.SHP_MST_NM }"/>^<c:out value="${codeRow.SHP_MST_TEL }"/>">
				                      		<c:out value="${codeRow.SHP_MST_NM }"/>
				                    	</option>
				                    </c:forEach>
	                            </select>
	                            <input type="hidden" name="MEM_CST_SHP_CD" id="MEM_CST_SHP_CD" />
	                        </label>
	                    </p>
	                    <p id="shopInfo">
	                    </p>
	                </div>
	            </li>
	            <li class="date">
	                <div class="tit">
	                    <label for="date">구입(예정)일<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="MEM_CST_VST_DT_YY" class="sel_box_st0" title="방문 년도">
	                        <select id="MEM_CST_VST_DT_YY" class="select">
	                            <option value="">년도</option>
	                            <c:forEach var="codeRow" items="${yearList }" varStatus="i">
		                           	<option value="<c:out value="${codeRow.YEAR }"/>">
				                   		<c:out value="${codeRow.YEAR }"/>년
				                  	</option>
				                </c:forEach>
	                        </select>
	                    </label>
	                    <label for="MEM_CST_VST_DT_MM" class="sel_box_st0" title="방문 월">
	                        <select id="MEM_CST_VST_DT_MM" class="select">
	                            <option value="">월</option>
	                            <option value="01">1월</option>
	                            <option value="02">2월</option>
	                            <option value="03">3월</option>
	                            <option value="04">4월</option>
	                            <option value="05">5월</option>
	                            <option value="06">6월</option>
	                            <option value="07">7월</option>
	                            <option value="08">8월</option>
	                            <option value="09">9월</option>
	                            <option value="10">10월</option>
	                            <option value="11">11월</option>
	                            <option value="12">12월</option>
	                            
	                        </select>
	                    </label>
	                    <label for="MEM_CST_VST_DT_DD" class="sel_box_st0" title="방문 일">
	                        <select id="MEM_CST_VST_DT_DD" class="select">
	                            <option value="">일</option>
	                            <c:forEach begin="1" end="31" step="1" varStatus="i">
			                    	<c:set var="dd" value="${i.index}"/>
			                     	<c:if test="${i.index < 10}">
			                      		<c:set var="dd" value="0${i.index}"/>
			                       	</c:if>
			                      	<option value="${dd}">${i.index}일</option>
			                    </c:forEach>
	                        </select>
	                    </label>
	                    <input type="hidden" name="MEM_CST_VST_DT" id="MEM_CST_VST_DT" />
	                </div>
	            </li>
	            <li>
	                <div class="tit">
	                    <label for="MEM_CST_MDL_NO">구입(예정)모델</label>
	                </div>
	                <div class="field">
	                    <input type="text" id="MEM_CST_MDL_NO" name="MEM_CST_MDL_NO"  class="text">
	                </div>
	            </li>
	            <li class="subject">
	                <div class="tit">
	                    <label for="MEM_CST_TITLE">제목<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <input type="text" id="MEM_CST_TITLE" name="MEM_CST_TITLE" class="text" maxlength="500">
	                </div>
	            </li>
	            <li class="message">
	                <div class="tit">
	                    <label for="MEM_CST_CONTENTS">내용<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <textarea id="MEM_CST_CONTENTS" name="MEM_CST_CONTENTS" class="textarea" maxlength="2000"></textarea>
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

$(document).on("click","#BRANCH_SEL",function(){
	var myArray;
	myArray = $(this).val().split('^');
	
	var SHP_MST_IDX = myArray[0];
	var SHP_MST_NM = myArray[1];
	var SHP_MST_TEL = myArray[2];
	
	if(SHP_MST_IDX != "")
	{
		$("#shopInfo").html(SHP_MST_NM+' : <a href="tel:'+SHP_MST_TEL+'"><strong>'+SHP_MST_TEL+'<strong></a>');
		
		$("#MEM_CST_SHP_CD").val(SHP_MST_IDX);
		
	}else
	{
		$("#shopInfo").html("");
	}
	
});
 

// 등록 이벤트
goRegist = function(){
    var $frm = $("#frm"); 
    if(!$("#areement").is(':checked'))
    {
    	alert("이용자 동의사항에 동의해 주십시오.");
    	$("#areement").parent().attr('tabindex',0).focus();
		return;
    }
    if($.trim($("#MEM_CST_NM").val()) == ""){
		alert("고객명을 입력해 주십시오.");
		$("#MEM_CST_NM").focus();
		return;
	}
    if($.trim($("#MEM_CST_TYPE").val()) == ""){
		alert("구분을 입력해 주십시오.");
		$("#MEM_CST_TYPE").focus();
		return;
	}
    
    if($.trim($("#MEM_CST_HP1").val()) == ""){
		alert("휴대폰번호를 입력해 주십시오.");
		$("#MEM_CST_HP1").focus();
		return;
	}
    if($.trim($("#MEM_CST_HP2").val()) == ""){
		alert("휴대폰번호를 입력해 주십시오.");
		$("#MEM_CST_HP2").focus();
		return;
	}
    if($.trim($("#MEM_CST_HP3").val()) == ""){
		alert("휴대폰번호를 입력해 주십시오.");
		$("#MEM_CST_HP3").focus();
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
    
    if($.trim($("#MEM_CST_SHP_CD").val()) == ""){
		alert("구입(예정)지점을 입력해 주십시오.");
		$("#BRANCH_SEL").focus();
		return;
	}
    
    if($.trim($("#MEM_CST_VST_DT_YY").val()) == ""){
		alert("구입(예정)일 년도를 선택해 주십시오.");
		$("#MEM_CST_VST_DT_YY").focus();
		return;
	}
    if($.trim($("#MEM_CST_VST_DT_MM").val()) == ""){
		alert("구입(예정)일 월을 선택해 주십시오.");
		$("#MEM_CST_VST_DT_MM").focus();
		return;
	}
    if($.trim($("#MEM_CST_VST_DT_DD").val()) == ""){
		alert("구입(예정)일 일을 선택해 주십시오.");
		$("#MEM_CST_VST_DT_DD").focus();
		return;
	}
    
    if($.trim($("#MEM_CST_TITLE").val()) == ""){
		alert("제목을 입력해 주십시오.");
		$("#MEM_CST_TITLE").focus();
		return;
	}
    
    if($.trim($("#MEM_CST_CONTENTS").val()) == ""){
		alert("내용을 입력해 주십시오.");
		$("#MEM_CST_CONTENTS").focus();
		return;
	}
    
   
    if (confirm( "저장 하시겠습니까?")) {
    	var mail = "";
    	var MEM_CST_VST_DT = "";
    	mail = $("#MAIL1").val()+"@"+$("#MAIL2").val();
    	$("#MEM_CST_MAIL").val(mail);
    	MEM_CST_VST_DT = $("#MEM_CST_VST_DT_YY").val()+$("#MEM_CST_VST_DT_MM").val()+$("#MEM_CST_VST_DT_DD").val();
    	$("#MEM_CST_VST_DT").val(MEM_CST_VST_DT);
        $("#frm").attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/support/counselRegist.do", "target":"_self", "method":"post"}).submit();
    }

};

 
</script>

</body>
</html>