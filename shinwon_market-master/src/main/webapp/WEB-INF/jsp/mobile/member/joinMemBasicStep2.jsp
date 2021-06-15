<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">
		        <form id="dataForm" name="dataForm" method="post">
					 	<input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="${commandMap.MEM_SNS_TYPE}" />       
		                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="${commandMap.MEM_SNS_ID}" />       
		                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="${commandMap.MEM_SNS_NM}" />                           
		                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="${commandMap.MEM_SNS_EMAIL}" />
		                <input type="hidden" name="joinType" id="joinType" value="memberBasic" />
                    <div class="title_wp">
                        <p class="ct_title">약관동의</p>
                        <div class="right">
                            <ol class="step_wp">
                                <li class="on" title="현재단계"><span>1</span><p>약관동의</p></li>
                                <li><span>2</span><p>정보입력</p></li>
                                <li><span>3</span><p>태그선택</p></li>
                                <li><span>4</span><p>희망태그</p></li>
                                <li><span>5</span><p>스타일정보</p></li>
                                <li><span>6</span><p>가입완료</p></li>
                            </ol>
                        </div>
                    </div>
                    <div class="terms_agree_wp">
                        <ul>
                            <li class="check_all">
                                <input type="checkbox" name="terms" id="terms1">
                                <label for="terms1">전체동의</label>
                                <a href="#n" class="b_terms">약관 상세보기</a>
                            </li>
                            <c:forEach var="item" items="${agreementList }" varStatus="status">
                            <li class="check_div">
                                <input type="checkbox" name="checked" id="check_${status.index }" class="agree_list">
                                <label for="check_${status.index }">${item.CMN_COM_NM} <span>(필수)</span></label>
                                <a href="#n" class="b_terms">약관 상세보기</a>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="title_wp2">
                        <div class="ct_title2">실명인증
                            <span class="help_wp"><a href="#">도움말</a>
                                <div class="tip_txt">
                                    <ul class="dot_list2">
                                        <li>고객님의 개인정보보호를 위해 본인인증이 필요합니다.</li>
                                        <li>휴대폰 인증 또는 아이핀 인증을 통해 실명인증을 완료해 주세요.</li>
                                    </ul>
                                </div>
                            </span>
                        </div>
                    </div>
                    <!-- <ul class="dot_list2">
                        <li>고객님의 개인정보보호를 위해 본인인증이 필요합니다. </li>
                        <li>휴대폰 인증 또는 아이핀 인증을 통해 실명인증을 완료해 주세요.</li>
                    </ul> -->
                    <div class="self_check_btn">
                    	<li id="phoneCheck">
                        <a href="#n">
                            <p class="tit" >휴대폰 본인인증</p>
                            <p class="txt">본인 명의의 휴대폰을 이용하여 인증을 진행합니다.</p>
                        </a>
                        </li>
                        <!-- <li id="ipinCheck">
                        <a href="#n" >
                            <p class="tit">아이핀 인증</p>
                            <p class="txt">본인확인기관에서 발급받은 아이핀으로 인증을 진행합니다.</p>
                        </a>
                        </li -->
                    </div>
                    </form>
                    <div class="btn_area dual">
                        <button  class="btn big black" id="bkBtn">이전</button>
                        <button  class="btn big ok" id="goBtn">인증하기</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
            <!-- </form> -->
        </div>
        <!-- // #container -->
        
        
<script>
	$("#goBtn").on("click",function(){
		if(validateTerm()){
			if($("#phoneCheck").prop("class") == "on"){
				window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else if($("#ipinCheck").prop("class") == "on"){
				window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else { 
				alert("인증수단을 선택해 주세요.");
			}
		}	
	});
	
	//실명인증
	$(".self_check_btn li a").on('click', function(e) {
        e.preventDefault();
        $(this).parent().addClass('on').siblings().removeClass('on');
    });
			
	/* 이전으로  
	클릭시 
 	*/
 	$("#bkBtn").on("click", function () {
		location.href ="/mobile/member/joinMemType.do";
		//history.back();
	});
	
	
	//약관체크 
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
		$("#dataForm").attr({"action":"<c:out value="${serverDomain}" />/mobile/member/joinMemStep3.do", "target":"_self", "method":"post"}).submit();
	}
</script>
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>