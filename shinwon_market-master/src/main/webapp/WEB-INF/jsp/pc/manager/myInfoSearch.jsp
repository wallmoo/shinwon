<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	
	 <!-- Content -->
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
				<h2 class="pg_tit">아이디/비밀번호 찾기</h2>x
			</div>
			<!--// Title -->

			<div class="sub_content">
				<div class="tab_wrap">
					<ul class="tab n2" id="modeContainer">
						<li class="on"><a href="#tab1" class="undone" id="typeId">아이디 찾기</a></li>
						<li class=""><a href="#tab2" class="done" id="typePassword">비밀번호 찾기</a></li>
					</ul>
					<div class="tab_cont" id="tab1" style="display: block;">
						<form name="basicForm" id="basicForm" action="<c:out value="${serverSslDomain}" />/pc/manager/idFindResult.do">
							<input type="hidden" name="memType" value="memberBasic"/> 	
						</form>
						<h3 class="blind">아이디 찾기</h3>
						<div class="id_pw_wrap">
							<ul class="ul_dot">
								<li>회원가입 시 인증한 수단으로 본인여부를 확인해주세요.</li>
								<li>타인명의/법인 휴대폰 회원님은 본인인증이 불가합니다.</li>
							</ul>
						</div>
					</div>
					<div class="tab_cont" id="tab2" style="display: none;">
						<h3 class="blind">비밀번호 찾기</h3>
						<div class="id_pw_wrap">
							<div class="table_wrap">
								<table class="tb_row">
									<caption>비밀번호 찾기 : 아이디 입력 표입니다.</caption>
									<colgroup>
										<col style="width:20%">
										<col style="width:auto">
									</colgroup>
									<tbody>
										<tr>
											<form name="passwordFindForm" id="passwordFindForm" action="<c:out value="${serverSslDomain}" />/pc/manager/pwFindResult.do">
												<input type="hidden" name="memType" value="memberBasic"/>
												<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 아이디</th>
												<td><input type="text" name="MEM_MST_MEM_ID" placeholder="아이디 입력" class="w602"></td>
											</form>
										</tr>
									</tbody>
								</table>
							</div>
							<ul class="ul_dot">
								<li>비밀번호를 재설정하실 아이디를 입력해 주세요.</li>
								<li>회원가입 시 인증한 수단으로 본인여부를 확인해 주세요.</li>
								<li>본인인증 후 비밀번호를 재설정하실 수 있습니다.</li>
							</ul>
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
							<li id="ipinCheck">
								<a href="#">
									<strong class="tit">아이핀 인증</strong>
									<span>본인확인기관에서 발급받은 아이핀으로 인증을 진행합니다.</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="btn_wrap">
						<button class="btn_large ok" id="goBtn">인증하기</button>
					</div>
				</div>
			</div>
	
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>
	
	<form name="certForm" id="certForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${reqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${retUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="ipinForm" id="ipinForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${ipinReqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${ipinRetUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="basicForm" id="basicForm">
		<input type="hidden" name="MEM_MST_MEM_ID" id="memId"/>
		<input type="hidden" name="memType" value="memberBasic"/> 	
	</form>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script>
	$(function(){
		
		var type = '<c:out value="${commandMap.gubun}"></c:out>';
		if(type == 'PW'){
			$('#typePassword').click();
		}
		$("#goBtn").on("click",function(){
			if($("#phoneCheck").prop("class") == "on"){
				window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else if($("#ipinCheck").prop("class") == "on"){
				window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else { 
				alert("인증수단을 선택해 주세요.");
			}
		});
	});
	function certCallback(data){
    	var tabContentId = $('#modeContainer').find('.on').find('a').attr('href');
    	var $form = $(tabContentId).find('form');
		for(key in data) {
			$form.append('<input type="hidden" id="'+key+'" name ="'+key+'" value="'+data[key]+'">');
		}
		$form.attr({"target":"_self", "method":"post"}).submit();
	}
</script>
</body>
</html>