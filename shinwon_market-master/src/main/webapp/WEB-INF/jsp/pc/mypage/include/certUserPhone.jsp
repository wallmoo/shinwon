<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sub_content">
	<div class="info_box">
	<strong class="tit">개인정보를 안전하게 보호하기 위하여<br>본인인증을 완료해주세요.</strong>
	<!-- <ul class="info_txt">
		<li>회원님은 현재 장기간 동일한 비밀번호를 사용 중이십니다.</li>
		<li>쑈윈도에서는 고객님의 소중한 개인정보 보호를 위하여 비밀번호 변경<br> 안내를 드리고 있습니다.</li>
		<li>정기적인 비밀번호 변경을 통해 소중한 개인정보를 보호해 주세요.</li>
	</ul> -->
	</div>
	<div class="name_certifiy">
			<div class="tit-area">
				<div class="left">
					<h3 class="tits2">실명인증</h3>
					<div class="tooltip-area">
						<button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
						<!-- TOOLTIP -->
					<div class="tooltip-layer left top" style="opacity: 0;">
						<div class="tooltip-con">
							<div class="list">
								<ul>
									<li>고객님의 개인정보보호를 위해 본인인증이 필요합니다.</li>
									<li>휴대폰 인증을 통해 실명인증을 완료해 주세요.</li>
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
			</ul>
		</div>
		<div class="btn_wrap">
			<button class="btn_large ok" id="goBtn">인증하기</button>
		</div>
	</div>
	<script type="text/javascript">
	$("#goBtn").on("click",function(){
		window.name='Parent_window';
		if($("#phoneCheck").prop("class") == "on"){
			window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		}else if($("#ipinCheck").prop("class") == "on"){
			window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		}else { 
			alert("인증수단을 선택해 주세요.");
		}
	});

	guid = function () {    
	    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}
	s4 = function () {
	  return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	}

	</script>
</div>