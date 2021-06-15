<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

    <!-- Content -->
	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">오프라인 회원정보조회</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<div class="terms_wrap">
					<div class="terms_agree">
						<div class="check">
							<input type="checkbox" id="agree_1">
							<label for="agree_1" class="mr15"><span class="icon"></span>회원님의 고객정보를 쑈윈도(㈜신원)에 제공함을 동의합니다. <strong>(필수)</strong></label>
							<span class="arrow on">약관 펼쳐보기</span>
						</div>
						<div class="terms_cont">
							제공하는 개인정보 항목<br>
							- 이름, 생년월일, 성별, 이메일, 전화번호, 휴대폰번호, 주소, 연계정보(CI), 중복가입 방지정보(DI), 아이디, 내외국인 여부, 개인정보 제3자 제공동의서<br>
							- 상품안내 전화 수신 동의서<br>
							- 이메일 수신동의 여부<br>
							- SMS 수신동의여부<br><br>

							보유 및 이용기간<br>
							- 쑈윈도 (㈜신원) 서비스 이용약관 철회 또는 쑈윈도 (㈜신원) 회원탈퇴시까지
						</div>
					</div>
				</div>

				<div class="table_wrap">
					<p class="required_txt"><span>필수입력사항</span></p>
					<form id="frm" name="frm" >
						<table class="tb_row">
							<caption>오프라인 회원정보조회 : 이름, 휴대폰 입력 표입니다.</caption>
							<colgroup>
								<col style="width:20%">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 이름</th>
									<td><input type="text" id="MEM_MST_MEM_NM" name="MEM_MST_MEM_NM" maxlength="20" placeholder="이름 입력" class="w284"></td>
								</tr>
								<tr>
									<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 휴대폰</th>
									<td>
										<span class="select">
											<select id="MEM_MST_HP1" name="MEM_MST_HP1" class="w284">
												<option value ="" selected="selected">선택</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="019">019</option>
												<option value="010">010</option>
											</select>
										</span>
										<span class="hyphen">-</span>
										<input type="text" id="MEM_MST_HP2" name="MEM_MST_HP2" maxlength="4" placeholder="번호 입력" class="w284">
										<span class="hyphen">-</span>
										<input type="text" id="MEM_MST_HP3" name="MEM_MST_HP3" maxlength="4" placeholder="번호 입력" class="w284">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

				<div class="btn_wrap">
					<button type="button" id="searchBtn" class="btn_large ok">조회</button>
				</div>

				<div class="tit-area">
					<h3 class="tits2">관련 브랜드</h3>
				</div>
				<div class="related_brand">
					<ul>
						<li><img src="/nas/cdn/PW/images/member/img_logo01.png" alt="GINNASIX"></li>
						<li><img src="/nas/cdn/PW/images/member/img_logo02.png" alt="iCONIQ7"></li>
						<li><img src="/nas/cdn/PW/images/member/img_logo03.png" alt="BESTI BELLI"></li>
						<li><img src="/nas/cdn/PW/images/member/img_logo04.png" alt="VIKI"></li>
						<li><img src="/nas/cdn/PW/images/member/img_logo05.png" alt="SI"></li>
						<li><img src="/nas/cdn/PW/images/member/img_logo06.png" alt="ISABEY"></li>
						<li><img src="/nas/cdn/PW/images/member/img_logo07.png" alt="SIEG' FAHRENHEIT"></li>
					</ul>
				</div>

				<div class="tit-area">
					<h3 class="tits2">통합회원 전환시 혜택 안내</h3>
				</div>
				<ul class="member_info">
					<li class="ico01 coupon">
						<dl>
							<dt>ALL</dt>
							<dd>
								<strong>10<span>%</span></strong>
								<em>COUPON</em>
							</dd>
						</dl>
					</li>
					<li class="ico02 coupon">
						<dl>
							<dt>ALL</dt>
							<dd>
								<strong>10<span>%</span></strong>
								<em>COUPON</em>
							</dd>
						</dl>
					</li>
					<li class="ico03 point">
						<dl>
							<dt>3,000 포인트</dt>
							<dd>5,000<span>P</span></dd>
						</dl>
					</li>
				</ul>

			</div>
		</div>
	</div>
	<!--// Content -->
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	var $frm = $("#frm");
	
	$frm.validate({
        rules: {
        	MEM_MST_MEM_NM:{required:true, maxlength:20}, // 아이디
            MEM_MST_HP1:{required:true},	// 핸드폰번호 앞자리
            MEM_MST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
        	MEM_MST_HP3:{required:true, number:true, minlength:4 , maxlength:4} // 핸드폰번호 뒷자리
        },
        messages :{
        	MEM_MST_MEM_NM : {required:"[이름]은 필수 정보입니다.", maxlength:"[이름]은 최대 20글자 입니다."},
        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."},
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
	
	$("#searchBtn").on("click", function(){
		var agree = $("#agree_1");
		if(!agree.is(":checked")){
			agree.focus();
			alert(agree.siblings("label").text()+"입니다")
			return;
		}
		
		if($frm.valid()){
			$frm.attr({"action":"<c:out value="${frontDomain}" />/pc/member/offlineMemStep2.do", "target":"_self", "method":"post"}).submit();
		}
	});
});
</script>