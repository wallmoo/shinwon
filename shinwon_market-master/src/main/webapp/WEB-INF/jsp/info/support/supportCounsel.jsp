<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-service">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>고객지원센터</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do" class="home"><span>고객지원센터</span></a>
            <span class="gt">&gt;</span>
            <strong>상담하기</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <%@ include file="/WEB-INF/jsp/info/include/leftMenu.jsp" %>

        <div id="contents" class="cs_con_d"><!-- #contents -->

            <h3 class="title">고객지원센터</h3>
			<ul class="tab_d">
				<li class="f"><a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do#cs_con_d"><span>공지사항</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportPraise.do#cs_con_d"><span>마켓플랜트 칭찬하기</span><i class="ico_ar"></i></a></li>
				<li class="on"><a href="<c:out value="${brandDomain}" />/info/support/supportCounsel.do#cs_con_d"><span>상담하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportFAQ.do#cs_con_d"><span>FAQ</span><i class="ico_ar"></i></a></li>
				<li class="l"><a href="<c:out value="${brandDomain}" />/info/support/supportAS.do#cs_con_d"><span>A/S 센터안내</span><i class="ico_ar"></i></a></li>
			</ul>

            <p class="ti_history">
				<span class="large22">마켓플랜트는 고객의 의견을 소중히 생각합니다.<br />
				상품과 서비스 그 어떤 내용이라도 궁금하시다면, 무엇이든 물어보세요.</span>
			</p>
			
			<div class="uProce"><!--.uProce s-->
				<h4 class="title ti_box"><strong>이용절차</strong></h4>
				<ol>
					<li class="f">
						<strong>상담내용<br/>작성</strong>
					</li>
					<li class="t">
						<strong>상담신청</strong>
					</li>
					<li class="l">
						<strong>상담진행<br/>(이메일 또는 전화)</strong>
					</li>
				</ol>
				<p>상담문의에 대한 답변은 평균 3일이 소요됩니다. 조금만 기다려 주세요.</p>
			</div><!--//.uProce e-->
			
			
			<div class="form_d">
				<h4 class="title mt0">개인정보 보호를 위한 이용자 동의사항</h4>

				<div class="agreement-wrap"><!-- agreement-wrap -->
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
					위 내용에 동의하시겠습니까?&nbsp;&nbsp;
					<label for="areement" class="js-checkbox">
						<input type="checkbox" id="areement" />
						동의합니다.
					</label>
				</div><!-- // agreement-wrap -->
			</div><!--//.form_d e-->


            <p class="text-right">
                <span class="essential warning"><em class="blind">필수입력</em></span> 표시는 필수 입력사항입니다.
            </p>
             
        	<form id="frm">               
	            <table class="bbs-form mt20 advice-form" border="0" cellpadding="0" cellspacing="0"><!-- bbs-form -->
	            <caption>고객명, 구분, 휴대폰 번호, 연락처, 이메일, 구입(예정)지점, 구입(예정)일, 구입(예정)모델, 제목, 내용으로 구성된 칭찬하기 입력테이블 입니다.</caption>
	            <colgroup>
	                <col style="width: 180px;" />
	                <col style="width: auto;" />
	             
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_NM">고객명 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <input type="text" id="MEM_CST_NM" name="MEM_CST_NM" class="text" />
	                    </td>
	                    
	                </tr>
	                <tr>
	                	<th scope="row"><label for="type">구분 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td class="type">
	                        <select id="MEM_CST_TYPE" name="MEM_CST_TYPE" class="sel_chg">
	                            <option value="">선택</option>
	                            <c:forEach var="codeRow" items="${consultGbCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
			                        	<c:out value="${codeRow.CMN_COM_NM }"/>
			                        </option>
			                    </c:forEach>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_HP1">휴대폰 번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <select  id="MEM_CST_HP1" name="MEM_CST_HP1" class="sel_chg" title="휴대폰 번호 앞자리">
	                        	<c:forEach var="codeRow" items="${hpCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
			                        	<c:out value="${codeRow.CMN_COM_NM }"/>
			                        </option>
			                    </c:forEach>
	                        </select> - 
	                        <input type="text" id="MEM_CST_HP2" name="MEM_CST_HP2"  class="text small" maxlength="4" title="휴대폰 번호 중간자리" /> -
	                        <input type="text" id="MEM_CST_HP3" name="MEM_CST_HP3"  class="text small" maxlength="4" title="휴대폰 번호 끝자리" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_TEL1">연락처</label></th>
	                    <td>
	                        <select id="MEM_CST_TEL1" name="MEM_CST_TEL1" class="sel_chg" title="연락처 앞자리">
	                            <c:forEach var="codeRow" items="${telCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
			                        	<c:out value="${codeRow.CMN_COM_NM }"/>
			                        </option>
			                    </c:forEach>
	                        </select> - 
	                        <input type="text" id="MEM_CST_TEL2" name="MEM_CST_TEL2" class="text small" maxlength="4" title="연락처 중간자리" /> -
	                        <input type="text" id="MEM_CST_TEL3" name="MEM_CST_TEL3" class="text small" maxlength="4" title="연락처 끝자리" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MAIL1">이메일<span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td class="mail">
	                        <input type="text" id="MAIL1" name="MAIL1" class="text" title="이메일 아이디" /> @
	                        <input type="text" id="MAIL2" name="MAIL2" class="text" title="이메일 도메인" />
	                        <select id="MAIL_SEL" class="sel_chg" title="이메일 도메인 선택">
	                            <option value="">직접입력</option>
	                            <c:forEach var="codeRow" items="${emailCodeList }" varStatus="i">
			                    	<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
			                      		<c:out value="${codeRow.CMN_COM_NM }"/>
			                    	</option>
			                    </c:forEach>
	                        </select>
	                        <input type="hidden" name="MEM_CST_MAIL" id="MEM_CST_MAIL" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="BRANCH_SEL">구입(예정)지점 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td class="shop">
	                        <select id="BRANCH_SEL" class="sel_chg">
	                            <option value="">선택</option>
	                            <c:forEach var="codeRow" items="${branchList }" varStatus="i">
	                            	<option value="<c:out value="${codeRow.SHP_MST_IDX }"/>^<c:out value="${codeRow.SHP_MST_NM }"/>^<c:out value="${codeRow.SHP_MST_TEL }"/>">
			                      		<c:out value="${codeRow.SHP_MST_NM }"/>
			                    	</option>
			                    </c:forEach>
	                        </select>&nbsp;&nbsp;
	                        <input type="hidden" name="MEM_CST_SHP_CD" id="MEM_CST_SHP_CD" />
	                        <span id="shopInfo"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_VST_DT">구입(예정)일 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <input type="text" id="MEM_CST_VST_DT" name="MEM_CST_VST_DT"  class="text" maxlength="10" data-max="<c:out value="${endDay }" />" data-min="2015-12-01" />
	                        <a href="javascript:;" class="btn_calendar"><span class="blind">시작날짜선택</span></a>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_MDL_NO">구입(예정)모델</label></th>
	                    <td colspan="3">
	                        <input type="text" id="MEM_CST_MDL_NO" name="MEM_CST_MDL_NO" class="text xlarge" maxlength="50"/>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_TITLE">제목 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td colspan="3">
	                        <input type="text" id="MEM_CST_TITLE" name="MEM_CST_TITLE" class="text xlarge" maxlength="500"/>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MEM_CST_CONTENTS">내용 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td colspan="3">
	                        <textarea id="MEM_CST_CONTENTS" name="MEM_CST_CONTENTS" class="textarea" maxlength="2000"></textarea>
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // bbs-form -->
            </form>

            <div class="section-button text-center"><!-- section-button -->
                <a href="javascript:goRegist();" class="button warning"><span>저장하기</span></a>
            </div><!-- // section-button -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->

 
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
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
		$("#shopInfo").html(SHP_MST_NM+" : "+SHP_MST_TEL);
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
    
    if($.trim($("#MEM_CST_VST_DT").val()) == ""){
		alert("구입(예정)일을 선택해 주십시오.");
		$("#EMP_THK_VST_DT").focus();
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
    	mail = $("#MAIL1").val()+"@"+$("#MAIL2").val();
    	$("#MEM_CST_MAIL").val(mail);
        $("#frm").attr({"action":"<c:out value="${brandDomain}" />/info/support/counselRegist.do", "target":"_self", "method":"post"}).submit();
    }

};

 
</script>

</body>
</html>
<script>
com.search = {
	hash: function(){
		var query = window.location.hash,
			vars = query.split('#');
		return vars[1];
	},//com.search.hash : function(){
	scroll: function(){		
		//scroll이동
		var _hash = com.search.hash(),
			_offset_t = $('.'+_hash).offset().top;
		$('body').scrollTop(_offset_t);
	}//com.search.scroll : function(){
};

$(document).ready(function(){
	com.search.scroll();
});
</script>
