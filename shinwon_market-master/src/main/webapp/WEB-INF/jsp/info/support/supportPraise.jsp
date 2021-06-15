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
            <strong>마켓플랜트칭찬하기</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">

        <div id="contents" class="cs_con_d"><!-- #contents -->

			<h3 class="title">고객지원센터</h3>
			<ul class="tab_d">
				<li class="f"><a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do#cs_con_d"><span>공지사항</span><i class="ico_ar"></i></a></li>
				<li class="on"><a href="<c:out value="${brandDomain}" />/info/support/supportPraise.do#cs_con_d"><span>마켓플랜트 칭찬하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportCounsel.do#cs_con_d"><span>상담하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportFAQ.do#cs_con_d"><span>FAQ</span><i class="ico_ar"></i></a></li>
				<li class="l"><a href="<c:out value="${brandDomain}" />/info/support/supportAS.do#cs_con_d"><span>A/S 센터안내</span><i class="ico_ar"></i></a></li>
			</ul>
			
            <p class="ti_history">
				지점에서 친절한 직원을 만나셨나요?<br/>
				고객님이 만난 친절한 직원에게 소중한 한마디 남겨주세요!<br/>
				<span class="warning">마켓플랜트는 고객의 의견을 가장 귀기울여 듣고 있습니다.</span>
			</p>
			
			<div class="form_d">
				<h4 class="title mt0">개인정보 보호를 위한 이용자 동의사항</h4>

				<div class="agreement-wrap"><!-- agreement-wrap -->
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
					위 내용에 동의하시겠습니까?&nbsp;&nbsp;
					<label for="areement" class="js-checkbox">
						<input type="checkbox" id="areement" value="Y"/>
						동의합니다.
					</label>
				</div><!-- // agreement-wrap -->
			</div><!--//.form_d e-->
 

            <h4 class="title ti_box"><strong>칭찬하기</strong></h4>

            <p class="text-right">
                <span class="essential warning"><em class="blind">필수입력</em></span> 표시는 필수 입력사항입니다.
            </p>
            <form id="frm">       
	            <table class="bbs-form mt20" border="0" cellpadding="0" cellspacing="0"><!-- bbs-form -->
	            <caption>고객명, 휴대폰 번호, 연락처, 이메일, 방문지점/직원, 방문일, 물류센터/배송기사, 제목, 내용으로 구성된 칭찬하기 입력테이블 입니다.</caption>
	            <colgroup>
	                <col style="width: 180px;" />
	                <col style="width: auto;" />
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_CST_NM">고객명 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <input type="text" name="EMP_THK_CST_NM" id="EMP_THK_CST_NM" class="text" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_HP1">휴대폰 번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <select id="EMP_THK_HP1" name="EMP_THK_HP1" class="sel_chg" title="휴대폰 번호 앞자리">
	                            <c:forEach var="codeRow" items="${hpCodeList }" varStatus="i">
		                    		<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
		                        		<c:out value="${codeRow.CMN_COM_NM }"/>
		                            </option>
		                        </c:forEach>
	                        </select> - 
	                        <input id="EMP_THK_HP2" name="EMP_THK_HP2" type="text" class="text small" maxlength="4" title="휴대폰 번호 중간자리" /> -
	                        <input id="EMP_THK_HP3" name="EMP_THK_HP3" type="text" class="text small" maxlength="4" title="휴대폰 번호 끝자리" />
	                        
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_TEL1">연락처</label></th>
	                    <td>
	                        <select id="EMP_THK_TEL1" name="EMP_THK_TEL1" class="sel_chg" title="연락처 앞자리">
	                            <c:forEach var="codeRow" items="${telCodeList }" varStatus="i">
		                    		<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
		                        		<c:out value="${codeRow.CMN_COM_NM }"/>
		                            </option>
		                        </c:forEach>
	                        </select> - 
	                        <input id="EMP_THK_TEL2" name="EMP_THK_TEL2" type="text" class="text small" maxlength="4" title="연락처 중간자리" /> -
	                        <input id="EMP_THK_TEL3" name="EMP_THK_TEL3" type="text" class="text small" maxlength="4" title="연락처 끝자리" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="MAIL1">이메일<span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td class="mail">
	                        <input type="text" id="MAIL1" class="text" title="이메일 아이디" /> @
	                        <input type="text" id="MAIL2" class="text" title="이메일 도메인" />
	                        <select id="MAIL_SEL" class="sel_chg" title="이메일 도메인 선택">
	                            <option value="">직접입력</option>
	                            <c:forEach var="codeRow" items="${emailCodeList }" varStatus="i">
		                    		<option value="<c:out value="${codeRow.CMN_COM_NM }"/>">
		                        		<c:out value="${codeRow.CMN_COM_NM }"/>
		                            </option>
		                        </c:forEach>
	                        </select>
	                        <input type="hidden" name="EMP_THK_MAIL" id="EMP_THK_MAIL" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_VST_DT">방문일 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <input type="text" id="EMP_THK_VST_DT" name="EMP_THK_VST_DT" class="text" maxlength="10" data-max="<c:out value="${today }" />" data-min="2015-01-01" />
	                        <a href="javascript:;" class="btn_calendar"><span class="blind">시작날짜선택</span></a>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_BRC_NM">방문지점 / 직원 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <input type="text" name="EMP_THK_BRC_NM" id="EMP_THK_BRC_NM" class="text" placeholder="검색 후 자동 출력" title="방문지점" readonly/> 
	                        <input type="text" name="EMP_THK_CHG_NM" id="EMP_THK_CHG_NM" class="text" placeholder="검색 후 자동 출력" title="직원" readonly/>
	                        <input type="hidden" name="EMP_THK_BRC_CD" id="EMP_THK_BRC_CD" />
	                        <input type="hidden" name="EMP_THK_CHG_SBN" id="EMP_THK_CHG_SBN" />
	                        <a id="popupPraiseEmployee" href="javascript:popupPraiseEmployee()"   class="button primary small"><span>검색</span></a>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_CTR_NM">물류센터 / 배송기사</label></th>
	                    <td>
	                        <input type="text" name="EMP_THK_CTR_NM" id="EMP_THK_CTR_NM"  class="text" placeholder="검색 후 자동 출력" title="물류센터" readonly/> 
	                        <input type="text" name="EMP_THK_DRV_NM" id="EMP_THK_DRV_NM" class="text" placeholder="검색 후 자동 출력" title="배송기사" readonly/>
	                        <input type="hidden" name="EMP_THK_CTR_CD" id="EMP_THK_CTR_CD" />
	                        <input type="hidden" name="EMP_THK_DRV_SBN" id="EMP_THK_DRV_SBN" />
	                        <a id="popupPraiseDelivery" href="javascript:popupPraiseDelivery();" class="button primary small"><span>검색</span></a>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_TITLE">제목 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <input type="text" id="EMP_THK_TITLE" name="EMP_THK_TITLE" class="text xlarge" />
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><label for="EMP_THK_CONTENTS">내용 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                    <td>
	                        <textarea id="EMP_THK_CONTENTS" name="EMP_THK_CONTENTS" class="textarea"></textarea>
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

var popupPraiseEmployee		= function(page){
    // 해당 그룹의 최 상위 부모 Node
     
    window.open("<c:out value="${brandDomain }"/>/info/support/popupPraiseEmployee.do","popupPraiseEmployee","width=600, height=920, scrollbars=yes");
};

var popupPraiseDelivery		= function(page){
    // 해당 그룹의 최 상위 부모 Node
     
    window.open("<c:out value="${brandDomain }"/>/info/support/popupPraiseDelivery.do","popupPraiseDelivery","width=600, height=920, scrollbars=yes");
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
    
    if($.trim($("#EMP_THK_VST_DT").val()) == ""){
		alert("방문일을 선택해 주십시오.");
		$("#EMP_THK_VST_DT").focus();
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
    	mail = $("#MAIL1").val()+"@"+$("#MAIL2").val();
    	$("#EMP_THK_MAIL").val(mail);
        $("#frm").attr({"action":"<c:out value="${brandDomain}" />/info/support/praiseRegist.do", "target":"_self", "method":"post"}).submit();
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