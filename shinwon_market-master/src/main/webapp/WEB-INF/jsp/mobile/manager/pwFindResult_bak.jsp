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
						<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/idFind.do?gubun=ID&type=m." class="_pg_link ui-block-a" target="_self"><strong>아이디 찾기</strong></a>
						<a href="javascript:void(0)" class="_pg_link ui-block-b on" data-tabCon="tab_con_pw"><strong>비밀번호 찾기</strong></a>
					</dt>
					
					<c:choose>
						<c:when test="${commandMap.memType eq 'memberBasic' }">
							<dd class="dd_inq_pwSet">
							
								<h3>본인 인증이 완료되었습니다.<br/>사용하실 새 비밀번호를 입력해주세요.</h3>
								<form id="dataForm" name="dataForm">
									<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
									<input type="hidden" name="RST_YN" id="RST_YN" value="<c:out value="${commandMap.RST_YN }"/>"/>
									
									<div class="inp_form">
										<label for="MEM_MST_PW">
											<strong>새 비밀번호</strong>
											<input type="password" name="MEM_MST_PW" id="MEM_MST_PW" maxlength="15"/>
										</label>
										<label for="MEM_MST_PW_RE">
											<strong>새 비밀번호확인</strong>
											<input type="password" name="MEM_MST_PW_RE" id="MEM_MST_PW_RE" maxlength="15"/>
										</label>
									</div>
								</form>
								<div class="btn_box">
									<a href="javascript:goChangePw();" class="_pg_link btn_red" target="_self"><strong>등록</strong></a>
									<a href="<c:out value="${mobileDomain }"/>/mobile/main/index.do" class="_pg_link btn_gre" target="_self"><strong>취소</strong></a>
								</div>
								<p class="tx_ex">
									<strong class="co_red"><i class="ico_exc">!</i>비밀번호 변경시 유의사항입니다.</strong>
								</p>
								<p class="tx_ex2">
									<span>비밀번호는 영문(필수), 숫자, 특수문자 중 2가지 이상을 조합하여 6~15자이여야 합니다. </span>
									<span>비밀번호에 공백을 사용할 수 없으며, 아이디와 동일한 패스워드는 사용할 수 없습니다.</span>
									<span>사용 가능한 특수문자 32자: !”#$%&’()*+,-./:;<=>?@[\]^_`{|}~ </span>
								</p>
							</dd>
						</c:when>
						<c:otherwise>
							<dd class="tab_con dd_inq_id">
								<h3 class="tx_ti">가입 당시 입력하신 이메일로 <br/>임시비밀번호가 발송되었습니다.</h3>
								<strong class="co_red tx_id"><c:out value="${commandMap.markingEmail }"/></strong>
								<span class="tx_sub">임시비밀번호로 로그인 후 <a href="<c:out value="${mobileSslDomain }"/>/mobile/mypage/myInfoPasswordForm.do?returnUrl=/pc/mypage/myInfoEditForm.do" class="_pg_link" target="_self">회원정보수정</a>에서<br/> 비밀번호 재설정 바랍니다.</span>
			
								<div class="btn_box">
									<a href="<c:out value="${mobileSslDomain }"/>/mobile/manager/login.do" class="_pg_link btn_red" target="_self"><strong>로그인 하기</strong></a>
								</div>
								<p class="tx_ex2">
									<span>이메일로 전송된 임시 비밀번호 유효기간은 4시간입니다.  <br/>유효기간이 지난 경우 인증번호를 다시 신청해주세요.</span>
								</p>
							</dd>
						</c:otherwise>
					</c:choose>
				</dl>
			</section>
			<!--// .inquiry_tab_d E -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
$(function(){
	$.com.util.tab($('.tab_st1 .tab_mn'), 1);
});
</script>

<script type="text/javascript">
//<![CDATA[
$(function(){
	var $dataForm = $("#dataForm");
	
	// 폼체크
    $dataForm.validate(
    {
        rules: 
        {
        	MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, // 비밀번호
            MEM_MST_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#MEM_MST_PW"} // 비밀번호 확인
        },
        messages :
        {
        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."},
        	MEM_MST_PW_RE: {required:"비밀번호확인을 입력해주세요.",minlength:"비밀번호 확인은 최소 6글자 이상입니다.", maxlength:"비밀번호 확인은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."}
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
	
	// 통합회원 비밀번호 재설정
	goChangePw = function(){
		
		if($dataForm.valid()){
			
			if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW").val()){
				alert("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
    			$("#MEM_MST_PW").focus();
    			return;
			}
			
			$dataForm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/manager/changeMemPw.do", "target":"_self", "method":"post"}).submit();				
		}
	};
});
//]]>
</script>
</body>
</html>