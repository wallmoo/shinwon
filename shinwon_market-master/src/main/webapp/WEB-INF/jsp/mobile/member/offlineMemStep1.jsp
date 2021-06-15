<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
                <!-- // #snb -->

                <div class="cp01">
                    <div class="terms_agree_wp">
                        <ul>
                            <li>
                                <input type="checkbox" name="terms" id="terms1">
                                <label for="terms1">회원님의 고객정보를 쑈윈도(㈜신원)에 <br>제공함을 동의합니다. <span>(필수)</span></label>
                                <a href="#n" class="b_terms">약관 상세보기</a>
                            </li>
                        </ul>
                    </div>
                    <div class="writeWrap fix">
                    <form id="frm" name="frm">
                        <div class="name"><em class="must">필수</em>이름</div>
                        <div class="form">
                                <input type="text" title="이름 입력" placeholder="이름 입력" id="MEM_MST_MEM_NM" name="MEM_MST_MEM_NM" maxlength="20"">
                        </div>
                        <div class="name"><em class="must">필수</em>휴대폰</div>
                        <div class="form">
                            <div class="phone">
                                <div>
                                    <select title="휴대폰 앞번호 선택" id="MEM_MST_HP1" name="MEM_MST_HP1">
                                        <option value="010" selected="selected">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option	value="017">017</option>
                                        <option	value="019">019</option>
                                    </select>
                                </div>
                                <div>
                                <input type="tel" title="휴대폰 가운데 번호 입력" maxlength="4" id="MEM_MST_HP2" name="MEM_MST_HP2">
                                </div>
                                <div class="dash">-</div>
                                <div>
                                <input type="tel" title="휴대폰 뒷번호 입력" maxlength="4" id="MEM_MST_HP3" name="MEM_MST_HP3">
                                </div>
                            </div>
                        </div>
                    </form>    
                    </div>
                    <div class="btn_area">
                        <button type="button" class="btn ok" id="searchBtn">조회</button>
                    </div>

                    <div class="title_wp2">
                        <p class="ct_title2">관련 브랜드</p>
                    </div>
                    <ul class="connect_brand">
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_01.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_02.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_03.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_04.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_05.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_06.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_07.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_08.png" alt=""></li>
                        <li><img src="/nas/cdn/MW/images/content/member/img_brand_09.png" alt=""></li>
                    </ul>

                    <div class="title_wp2">
                        <p class="ct_title2">통합회원전환 시 혜택 안내</p>
                    </div>
                    <ul class="benefit_list">
                        <li class="b01">
                            <div>
                                <strong>10% 할인쿠폰</strong>
                                <span>전 상품 사용 가능한 할인쿠폰 지급</span>
                            </div>
                        </li>
                        <li class="b02">
                            <div>
                                <strong>3,000원 할인쿠폰</strong>
                                <span>3,000원 이상 구매시 할인쿠폰 즉시 지급</span>
                            </div>
                        </li>
                        <li class="b03">
                            <div>
                                <strong>3,000 포인트</strong>
                                <span>가입 즉시 사용 가능한 포인트 지급</span>
                            </div>
                        </li>
                        <li class="b04">
                            <div>
                                <strong>멤버십 포인트 적립</strong>
                                <span>구매 금액의 등급별 포인트 적립</span>
                            </div>
                        </li>
                    </ul>

                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>
<script>
	$(function () {
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
		
		$("#searchBtn").on("click", function () {
			var terms = $("#terms1");
			if(!terms.is(":checked")){
				terms.focus();
				alert(terms.siblings("label").text()+"입니다.")
				return;
			}
			if($frm.valid()){
				$frm.attr({"action" : "<c:out value = "${mobileSslDomain}"/>/mobile/member/offlineMemStep2.do", "target" : "_self", "method" : "post"}).submit();
			}
		});
	});
	
</script>
