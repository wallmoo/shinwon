<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>


        <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
	            	<!-- .sub_menu_wrap -->
                <!-- // #snb -->
				<form id="dataForm" name="dataForm" method="post">
				<input type="hidden" name="double_submit_token" id="double_submit_token" value="${double_submit_token}"/>
			    <c:forEach var="type" items="${commandMap}">
				   <input type="hidden" name="${type.key}" id="${type.key}" value="${type.value}"/>
				</c:forEach>
            	</form>
                <div class="cp01">
                    <div class="title_wp">
                        <p class="ct_title">스타일정보</p>
                        <div class="right">
                            <ol class="step_wp">
                                <li><span>1</span><p>약관동의</p></li>
                                <li><span>2</span><p>정보입력</p></li>
                                <li><span>3</span><p>태그선택</p></li>
                                <li><span>4</span><p>희망태그</p></li>
                                <li class="on" title="현재단계"><span>5</span><p>스타일정보</p></li>
                                <li><span>6</span><p>가입완료</p></li>
                            </ol>
                        </div>
                    </div>
                    <div class="info_join_text">
                        <p class="tit">직업, 키, 몸무게를<br>입력해주세요.</p>
                        <p class="txt">상품 및 콘텐츠 제공을 위해 활용되며, 마이페이지에서 변경하실 수 있습니다.</p>
                    </div>
                    <div class="writeWrap line_st">
                        <div class="form">
                            <select title="직업 선택" id="select1">
                                <option selected="selected">회원님의 직업을 선택해 주세요.</option>
                                <option value="주부">주부</option>
                                <option value="자영업">자영업</option>
                                <option value="사무직">사무직</option>
                                <option value="생산/기술직">생산/기술직</option>
                                <option value="판매직">판매직</option>
                                <option value="보험업">보험업</option>
                                <option value="은행/증권업">은행/증권업</option>
                                <option value="전문직">전문직</option>
                                <option value="공무원">공무원</option>
                                <option value="농축산업">농축산업</option>
                                <option value="학생">학생</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                        <div class="form">
                            <input type="number" title="키 입력(cm)" placeholder="키 입력(cm)" id="height" name="height">
                        </div>
                        <div class="form">
                            <input type="number" title="몸무게 입력(kg)" placeholder="몸무게 입력(kg)" id="weight" name="weight">
                        </div>
                    </div>

                    <div class="btn_area dual">
                        <button  class="btn gray" id="bkBtn">이전</button>
                        <button  class="btn ok" id="goBtn">다음</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>

<script>
	
	
	//이전으로
	$("#bkBtn").on("click",function(){
		//location.href = "/pc/member/joinMemStep3.do";
		history.back();
	});
	
	$("#goBtn").on("click",function(){
		//if(!validateTag()) return;
		//if(!validateStyleInfo()) return;
		register();
	});
	
	/* function validateStyleInfo(){
		if($("#weight").val()!="" && $("#height").val()!="") return true;
		else if($("#height").val()=="") $("#height").focus();
		else $("#weight").focus();
		return false;
	} */

	function register(){
		var $frm = $("#dataForm");
		if($("#height").val() == "" ){
    		alert("키(cm)를 입력해주세요.")
    		$("#height").focus()
    		return;
    	}
		if($("#weight").val() == "" ){
    		alert("몸무게(kg)를 입력해주세요.")
    		$("#weight").focus()
    		return;
    	}
		
		var job = $("#select1 option:selected").val();
		var height = $("#height").val();
		var weight = $("#weight").val();
		$('#dataForm').append('<input type="hidden" id="MEM_MST_STY_JOB" name="MEM_MST_STY_JOB" value="'+job+'"/>');
		$('#dataForm').append('<input type="hidden" id="MEM_MST_STY_HEIGHT" name="MEM_MST_STY_HEIGHT" value="'+height+'"/>');
		$('#dataForm').append('<input type="hidden" id="MEM_MST_STY_WEIGHT" name="MEM_MST_STY_WEIGHT" value="'+weight+'"/>');
		
		$("#dataForm").attr({"action":"/mobile/member/joinMemberRegist.do", "target":"_self", "method":"post"}).submit();
	};
</script>


