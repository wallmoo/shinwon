<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%@page isELIgnored="false" %>
<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">약관동의</h2>
			</div>
			<!--// Title -->
			
			<form id="dataForm" name="dataForm" method="post">
			 	<input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="${commandMap.MEM_SNS_TYPE}" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="${commandMap.MEM_SNS_ID}" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="${commandMap.MEM_SNS_NM}" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="${commandMap.MEM_SNS_EMAIL}" />
                <input type="hidden" name="joinType" id="joinType" value="memberBasic" />
            
			<div class="sub_content">
				<div class="join_step">
					<ol>
						<li class="on"><span>STEP 01 <strong>약관동의</strong></span></li>
						<li><span>STEP 02 <strong>정보입력</strong></span></li>
						<li><span>STEP 03 <strong>피드설정</strong></span></li>
						<li><span>STEP 04 <strong>가입완료</strong></span></li>
					</ol>
				</div>
				<div class="terms_wrap">
					<div class="terms_check">
						<div class="check">
							<input type="checkbox" id="all_check">
							<label for="all_check" class="mr15"><span class="icon"></span>전체동의</label>
						</div>
					</div>
					<c:forEach var="item" items="${agreementList}" varStatus="status">
						<div class="terms_agree">
							<div class="check">
								<input type="checkbox" id="check_${status.index }"  class="agree_list" name="checked">
								<label for="check_${status.index }" class="mr15" ><span class="icon"></span>${item.CMN_COM_NM}<strong>(필수)</strong></label>
								<span class="arrow on">약관 펼쳐보기</span>
							</div>
							<div class="terms_cont">
								<c:out value="${item.BRD_AGR_CONTENTS}" escapeXml="false"/>
							</div>
						</div>
					</c:forEach>
                    <!-- //terms_agree -->
				</div>
				<div class="name_certifiy">
					<div class="tit-area">
						<div class="left">
							<h3 class="tits2">실명인증</h3>
							<div class="tooltip-area">
								<button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
								<!-- TOOLTIP -->
								<div class="tooltip-layer left top">
									<div class="tooltip-con">
										<div class="list">
											<ul>
												<li>고객님의 개인정보보호를 위해 본인인증이 필요합니다.</li>
												<li>휴대폰 인증 또는 아이핀 인증을 통해 실명인증을 완료해 주세요.</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- //TOOLTIP -->
							</div>
						</div>
					</div>
					<div class="certifiy_check">
						<ul>
							<li id="phoneCheck">
								<a href="#">
									<strong class="tit">휴대폰 본인인증</strong>
									<span>본인 명의의 휴대폰을 이용하여 인증을 진행합니다.</span>
								</a>
							</li>
							<!-- 
							<li id="ipinCheck">
								<a href="#">
									<strong class="tit">아이핀 인증</strong>
									<span>본인확인기관에서 발급받은 아이핀으로 인증을 진행합니다.</span>
								</a>
							</li>
							 -->
						</ul>
					</div>
				</div>

			</div>
			</form>
							<div class="btn_wrap">
					<button class="btn_large" id="bkBtn">취소</button>
					<button class="btn_large ok" id="goBtn">인증하기</button>
				</div>
		</div>
	</div>


<script>
	$("#goBtn").on("click",function(){
		if(validateTerm()){
			window.name='Parent_window';
			if($("#phoneCheck").prop("class") == "on"){
				window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else if($("#ipinCheck").prop("class") == "on"){
				window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else { 
				alert("인증수단을 선택해 주세요.");
			}
		}
	});
	
	// 전체동의
	$("#all_check").on("click",function(){
		
		var flag = $(this).is(":checked") == true ? true : false;
		
		$(".agree_list").each(function(){
			if(this.checked == !flag){
				this.checked = flag;
			}
		});

	});
	
	// 약관에 다 동의하였을때 전체 동의 체크
	$(".agree_list").change(function(){
		
		var agreeCheckCount = $(".agree_list:checked").length;
		var agreeMaxCount = $(".agree_list").length;
		
		if(agreeCheckCount < agreeMaxCount){
			$('#all_check').prop("checked", false);
		}else{
			$('#all_check').prop("checked", true);
		}
    });
	
	$("#bkBtn").on("click",function(){
		location.href = "/pc/member/joinMemType.do"
	});
	
	function validateTerm() {
		var checkboxArray = $('.agree_list');
		for(var i=0;i<checkboxArray.length;i++){
			if(!$(checkboxArray[i]).is(":checked")){
				$(checkboxArray[i]).focus();
				alert($(checkboxArray[i]).siblings('label').text()+'에 동의해 주세요');
				return false;
			}
		}		
		return true;	
	}
	
	function certCallback(data){
		for(key in data) {
			$("#dataForm").append('<input type="hidden" id="'+key+'" name ="'+key+'" value="'+data[key]+'">');
		}
		$("#dataForm").attr({"action":"<c:out value="${serverDomain}" />/pc/member/joinMemStep3.do", "target":"_self", "method":"post"}).submit();
	}
	
</script>
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>