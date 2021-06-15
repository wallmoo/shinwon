<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
	window.history.forward(); 
</script>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<form id="frm" name="frm" method="post">
            <input type="hidden" name="MEM_CPR_NM" id="MEM_CPR_NM" value="<c:out value="${commandMap.MEM_CPR_NM }"/>"/>
            <input type="hidden" name="MEM_CPR_NO1" id="MEM_CPR_NO1" value="<c:out value="${commandMap.MEM_CPR_NO1 }"/>"/>
            <input type="hidden" name="MEM_CPR_NO2" id="MEM_CPR_NO2" value="<c:out value="${commandMap.MEM_CPR_NO2 }"/>"/>
            <input type="hidden" name="MEM_CPR_NO3" id="MEM_CPR_NO3" value="<c:out value="${commandMap.MEM_CPR_NO3 }"/>"/>
			<input type="hidden" name="TRM_YN0005" id="TRM_YN0005" value="${commandMap.TRM_YN0005 }"/>
            <input type="hidden" name="TRM_YN0006" id="TRM_YN0006" value="${commandMap.TRM_YN0006 }"/>
            <input type="hidden" name="TRM_YN0007" id="TRM_YN0007" value="${commandMap.TRM_YN0007 }"/>
            <input type="hidden" name="TRM_YN0008" id="TRM_YN0008" value="${commandMap.TRM_YN0008 }"/>
            <input type="hidden" name="joinType" id="joinType" value="${commandMap.joinType }"/>
            <double-submit:preventer/>
			
			<div class="contents"><!-- .contents S -->
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
					<dd class="tx_sub">
						<p>기업회원으로 가입하시면 기업회원 할인을 받으실 수 있습니다.<br/>
							기업회원 확인을 위해 사업자등록번호로  가입 가능합니다.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f"><strong><span>01</span>사업자인증</strong></li>
							<li><strong><span>02</span>약관동의</strong></li>
							<li class="on"><strong><span>03</span>정보입력</strong></li>
							<li class="l"><strong><span>04</span>가입완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con my_info_con"><!-- .join_con S -->
					<li class="my_info">
						<h3>기본정보<span>(* 필수 입력사항 입니다.)</span></h3>
						<table class="f table_st4">
							<caption>기본정보 / 아이디, 비밀번호, 비밀번호 확인, 이름, 이메일, 전화번호, 휴대폰 번호, 주소, 정보수신 으로 구성된 표</caption>
							<colgroup>
							<col style="width:170px" />
							<col />
							</colgroup>
							<tbody>
								<tr class="tr_id">
									<th><span><label for="MEM_MST_MEM_ID">아이디</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="text" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" placeholder="아이디 중복체크를 해주세요." maxlength="15" data-err_msg_id="memId" onkeydown="javascript:deleteCheckMsg();" />
											<input type="hidden" id="idCheckYn" value="" />
											<input type="hidden" id="checkId" value="" /> 
											<a href="javascript:checkId();" class="btn_st0 btn_blk777"><span>중복체크</span></a>
										</div>
										<p class="tx_ex">
											<span>첫글자는 영문(소문자)으로 띄어쓰기 없이 6~15자로 영문(소문자)과 숫자 조합으로 입력해주세요.</span>
											<strong class="tx_warn" id="memId"></strong>
										</p>
										<p class="tx_ex">
											<strong class="tx_warn" id="memIdCheck"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_pw">
									<th><span><label for="MEM_MST_PW">비밀번호</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="password" name="MEM_MST_PW" id="MEM_MST_PW" maxlength="15" data-err_msg_id="memPw" onkeydown="javascript:deleteCheckMsg();"/>
										</div>
										<p class="tx_ex">
											<span>띄어쓰기 없이 6~15자 영문,숫자,특수문자 조합으로 입력해주세요.<br/>아이디와 동일한 비밀번호는 사용을 자제해주세요.</span>
											<strong class="tx_warn" id="memPw"></strong>
										</p>
										<p class="tx_ex">
											<strong class="tx_warn" id="memPwCheck"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_pwRe">
									<th><span><label for="MEM_MST_PW_RE">비밀번호 확인</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="password" name="MEM_MST_PW_RE" id="MEM_MST_PW_RE" maxlength="15" data-err_msg_id="memPwRe" />
										</div>
										<p class="tx_ex">
											<span>비밀번호 확인을 위해 다시 한번 입력해주세요. </span>
											<strong class="tx_warn" id="memPwRe"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_comName">
									<th><span>기업명<i>*</i></span></th>
									<td>
										<c:choose>
											<c:when test="${empty commandMap.MEM_CPR_NM }">
												<span><c:out value="${commandMap.AUTO_MEM_CPR_NM }"/></span>
											</c:when>
											<c:otherwise>
												<span><c:out value="${commandMap.MEM_CPR_NM }"/></span>								
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr class="tr_regist">
									<th><span>사업자 등록번호<i>*</i></span></th>
									<td>
										<span>
											<c:choose>
												<c:when test="${empty commandMap.MEM_CPR_NO1 && empty commandMap.MEM_CPR_NO2 && empty commandMap.MEM_CPR_NO3}">
													<c:out value="${commandMap.AUTO_MEM_CPR_NO1 }"/> -
						                            <c:out value="${commandMap.AUTO_MEM_CPR_NO2 }"/> -
						                            <c:out value="${commandMap.AUTO_MEM_CPR_NO3 }"/>
						                        </c:when>
						                        <c:otherwise>
						                        	<c:out value="${commandMap.MEM_CPR_NO1 }"/> -
						                            <c:out value="${commandMap.MEM_CPR_NO2 }"/> -
						                            <c:out value="${commandMap.MEM_CPR_NO3 }"/>
						                        </c:otherwise>
						                    </c:choose>
										</span>
									</td>
								</tr>
								<tr class="tr_name">
									<th><span><label for="MEM_CPR_CEO_NM">대표자명</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="text" name="MEM_CPR_CEO_NM" id="MEM_CPR_CEO_NM" maxlength="10" data-err_msg_id="ceoNm" />
										</div>
										<p class="tx_ex" style="margin-top:3px;">
											<strong class="tx_warn" id="ceoNm"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_comType">
									<th><span><label for="MEM_CPR_TYPE">업종/업태</label></span></th>
									<td>
										<div class="inp_box">
											<input type="text" name="MEM_CPR_TYPE" id="MEM_CPR_TYPE" maxlength="10" />
											<label for="MEM_CPR_STUS">
												<input type="text" name="MEM_CPR_STUS" id="MEM_CPR_STUS" maxlength="10" />
											</label>
										</div>
									</td>
								</tr>							
								<tr class="tr_tel">
									<th><span>대표전화</span></th>
									<td>
										<div class="inp_box">
											<select id="MEM_CPR_TEL1" name="MEM_CPR_TEL1" class="sel_chg" >
												<option value="">선택</option>
				                                <c:if test="${not empty codes.TEL_CODE }">
					                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
					                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
					                                </c:forEach>
				                                </c:if>
											</select>
											<i>-</i>
											<label for="inp_tel2">
												<input type="text" name="MEM_CPR_TEL2" id="MEM_CPR_TEL2" maxlength="4" class="number" />
											</label>
											<i>-</i>
											<label for="inp_tel3">
												<input type="text" name="MEM_CPR_TEL3" id="MEM_CPR_TEL3" maxlength="4" class="number" />
											</label>
										</div>
									</td>
								</tr>
								<tr class="tr_phone">
									<th><span>팩스번호</span></th>
									<td>
										<div class="inp_box">
											<select id="MEM_CPR_FAX1" name="MEM_CPR_FAX1" class="sel_chg" >
												<option value="">선택</option>
				                                <c:if test="${not empty codes.TEL_CODE }">
					                                <c:forEach var="faxRow" items="${codes.TEL_CODE }" varStatus="i">
					                                    <option value="<c:out value="${faxRow.CMN_COM_NM }"/>"><c:out value="${faxRow.CMN_COM_NM }"/></option>
					                                </c:forEach>
				                                </c:if>
											</select>
											<i>-</i>
											<label for="MEM_CPR_FAX2">
												<input type="text" name="MEM_CPR_FAX2" id="MEM_CPR_FAX2" maxlength="4" class="number" />
											</label>
											<i>-</i>
											<label for="MEM_CPR_FAX3">
												<input type="text" name="MEM_CPR_FAX3" id="MEM_CPR_FAX3" maxlength="4" class="number" />
											</label>
										</div>
									</td>
								</tr>
								<tr class="tr_add">
									<th><span>사업장 주소<i>*</i></span></th>
									<td>
										<div class="inp_box li_1" style="margin-bottom:3px;">
											<input type="text" name="MEM_CPR_ZIP_CDE5" id="MEM_CPR_ZIP_CDE5" maxlength="5" readonly="readonly" data-err_msg_id="zip"/>
											<a href="javascript:execDaumPostcode();" id="zipCheck" class="btn_st0 btn_blk777"><span>우편번호 찾기</span></a>
										</div>
										<p class="tx_ex" style="padding-bottom:3px;">
											<strong class="tx_warn" id="zip"></strong>
										</p>
										<div class="inp_box li_2">
											<label for="MEM_CPR_DRO_ADR1" class="f">
												<input type="text" name="MEM_CPR_DRO_ADR1" id="MEM_CPR_DRO_ADR1" placeholder="도로명 주소" maxlength="100" readonly="readonly" data-err_msg_id="doro"/>
											</label>
										</div>
										<div class="inp_box li_3">
											<label for="MEM_CPR_JBN_ADR1" class="f">
												<input type="text" name="MEM_CPR_JBN_ADR1" id="MEM_CPR_JBN_ADR1" placeholder="지번 주소" maxlength="100" readonly="readonly" data-err_msg_id="jibun" />
											</label>
											<label for="MEM_CPR_ADR2" class="l">
												<input type="text" name="MEM_CPR_ADR2" id="MEM_CPR_ADR2" placeholder="상세 주소" maxlength="40" data-err_msg_id="addrDetail" />
											</label>
										</div>
										<p class="tx_ex" style="padding:3px 0;">
											<strong class="tx_warn" id="doro"></strong>
										</p>
										<p class="tx_ex" style="padding:3px 0;">
											<strong class="tx_warn" id="jibun"></strong>
										</p>
										<p class="tx_ex">
											<strong class="tx_warn" id="addrDetail"></strong>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
	
						<hr class="line_1px" />
	
						<h3 class="ti">담당자 정보</h3>
						<table class="l table_st4">
							<caption>선택정보 / 추천ID로 구성된 표</caption>
							<colgroup>
							<col style="width:170px" />
							<col />
							</colgroup>
							<tbody>
								<tr class="tr_name">
									<th><span><label for="MEM_MST_MEM_NM">담당자 이름</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" maxlength="10" data-err_msg_id="memNm" />
										</div>
										<p class="tx_ex" style="padding:3px 0;">
											<strong class="tx_warn" id="memNm"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_email">
									<th><span><label for="inp_emailS">이메일</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="text" name="MEM_MST_MAIL_ID" id="MEM_MST_MAIL_ID" maxlength="20" data-err_msg_id="memEmailId"/>
											<i>@</i>
											<label for="MEM_MST_MAIL_DOMAIN">
												<input type="text" name="MEM_MST_MAIL_DOMAIN" id="MEM_MST_MAIL_DOMAIN" data-err_msg_id="memEmailDomain"/>
											</label>
											<input type="hidden" id="MEM_MST_MAIL" name="MEM_MST_MAIL"/>
											<select id="emailDomainSelectbox" class="sel_chg">
												<option value="">직접입력</option>
					                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
						                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
						                            	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
					                            	</c:forEach>
					                            </c:if>
											</select>
										</div>
										<p class="tx_ex" style="padding:3px 0;">
											<strong class="tx_warn" id="memEmailId"></strong>
										</p>
										<p class="tx_ex">
											<strong class="tx_warn" id="memEmailDomain"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_tel">
									<th><span>일반전화<i>*</i></span></th>
									<td>
										<div class="inp_box">
											<select id="MEM_MST_TEL1" name="MEM_MST_TEL1" class="sel_chg" data-err_msg_id="memTel1">
												<option value="">선택</option>
				                                <c:if test="${not empty codes.TEL_CODE }">
					                                <c:forEach var="mngTelRow" items="${codes.TEL_CODE }" varStatus="i">
					                                    <option value="<c:out value="${mngTelRow.CMN_COM_NM }"/>"><c:out value="${mngTelRow.CMN_COM_NM }"/></option>
					                                </c:forEach>
				                                </c:if>
											</select>
											<i>-</i>
											<label for="MEM_MST_TEL2">
												<input type="text" name="MEM_MST_TEL2" id="MEM_MST_TEL2" maxlength="4" class="number" data-err_msg_id="memTel2"/>
											</label>
											<i>-</i>
											<label for="MEM_MST_TEL3">
												<input type="text" name="MEM_MST_TEL3" id="MEM_MST_TEL3" maxlength="4" class="number" data-err_msg_id="memTel3"/>
											</label>
										</div>
										<p class="tx_ex" style="padding:3px 0;">
											<strong class="tx_warn" id="memTel1"></strong>
										</p>
										<p class="tx_ex" style="padding-bottom:3px;">
											<strong class="tx_warn" id="memTel2"></strong>
										</p>
										<p class="tx_ex">
											<strong class="tx_warn" id="memTel3"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_phone">
									<th><span>휴대폰 번호<i>*</i></span></th>
									<td>
										<div class="inp_box">
											<select id="MEM_MST_HP1" name="MEM_MST_HP1" class="sel_chg" data-err_msg_id="memHp1">
												<option value="">선택</option>
				                                <c:if test="${not empty codes.HP_CODE }">
				                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
				                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
				                                    </c:forEach>
				                                </c:if>
											</select>
											<i>-</i>
											<label for="MEM_MST_HP2">
												<input type="text" name="MEM_MST_HP2" id="MEM_MST_HP2" maxlength="4" class="number" data-err_msg_id="memHp2" />
											</label>
											<i>-</i>
											<label for="MEM_MST_HP3">
												<input type="text" name="MEM_MST_HP3" id="MEM_MST_HP3" maxlength="4" class="number" data-err_msg_id="memHp3" />
											</label>
										</div>
										<p class="tx_ex" style="padding:3px 0;">
											<strong class="tx_warn" id="memHp1"></strong>
										</p>
										<p class="tx_ex" style="padding-bottom:3px;">
											<strong class="tx_warn" id="memHp2"></strong>
										</p>
										<p class="tx_ex">
											<strong class="tx_warn" id="memHp3"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_receive">
									<th><span>정보수신</span></th>
									<td>
										<div class="inp_box">
											<label for="TRM_YN0001">
												<input type="checkbox" name="TRM_YN0001" id="TRM_YN0001" value="Y"/>
												<span>SMS 수신</span>
											</label>
											<label for="TRM_YN0004">
												<input type="checkbox" name="TRM_YN0004" id="TRM_YN0004" value="Y"/>
												<span>이메일 수신</span>
											</label>
											<label for="TRM_YN0003">
												<input type="checkbox" name="TRM_YN0003" id="TRM_YN0003" value="Y"/>
												<span>DM(우편) 수신</span>
											</label>
											<label for="TRM_YN0002" class="l">
												<input type="checkbox" name="TRM_YN0002" id="TRM_YN0002" value="Y"/>
												<span>TM(전화) 수신</span>
											</label>
											<p class="tx_ex">
												이벤트 및 다양한 정보를 받으실 수 있습니다.<br/>
												수신 동의와 상관없이 비밀번호 찾기, 주문/배송 관련 SMS/메일은 발송 됩니다.
											</p>
										</div>
									</td>
								</tr>
								<tr class="tr_recomID">
									<th><span><label for="inp_recomID">추천인 ID</label></span></th>
									<td>
										<div class="inp_box">
											<input type="text" name="MEM_MST_RCM_ID" id="MEM_MST_RCM_ID" maxlength="15" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</li>
					<li class="btn_box">
						<a href="javascript:goRegist();" class="btn_st2 btn_rd"><span>확인</span></a>
						<a href="javascript:goCancel();" class="btn_st2 btn_blk777"><span>취소</span></a>
					</li>
				</ul><!--// .join_con E -->
				
				<div id="laypop" class="laypop" data-idx="0" style="display: none; width: 1136px; height: 995px;">
					<ul class="laypop_con loading"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
						<li class="con">
							<img src="<c:out value="${cdnDomain }"/>/pc/img/lay/loading.gif" alt="로딩중입니다." />
						</li>
					</ul>
				</div>
			</div><!--// .contents E -->
			</form>
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<%-- 다음 우편번호 시작 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
    			
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEM_CPR_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('MEM_CPR_DRO_ADR1').value = fullRoadAddr;
                document.getElementById('MEM_CPR_JBN_ADR1').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<%-- 다음 우편번호 끝 --%>

<script>
	$(function(){
		var receive_list = $('.tr_receive .inp_box label'),
			ddClick = false;
	
		//체크박스
		receive_list.on('click',function(e){
			if(ddClick == true) return false;
			var _this = $(this),
				_has = _this.hasClass('on');
	
			ddClick = true;
			if(_has) _this.removeClass('on').children('input').prop('checked', false).attr('checked', false);
			else _this.addClass('on').children('input').prop('checked', true).attr('checked', true);
	
			setTimeout(function(){
				ddClick = false;
			},100);
		});
		
	});
</script>
<script>
	$(function(){
		
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	            MEM_MST_MEM_ID:{required:true, minlength:6, maxlength:15}, // 아이디
	            MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, // 비밀번호
	            MEM_MST_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#MEM_MST_PW"}, // 비밀번호 확인
	            MEM_CPR_CEO_NM:{required:true},	// 대표자명 
	            MEM_CPR_ZIP_CDE5:{required:true, number:true}, // 우편번호
	        	MEM_CPR_DRO_ADR1:{required:true}, // 도로명 본주소
	        	MEM_CPR_JBN_ADR1:{required:true}, // 지번 본주소
	        	MEM_CPR_ADR2:{required:true},  // 상세주소
	        	MEM_MST_MEM_NM:{required:true},	// 담당자 이름
	        	MEM_MST_MAIL_ID:{required:true, emailId:true},	// 이메일 아이디
	            MEM_MST_MAIL_DOMAIN:{required:true, emailDomain:true},	// 이메일 도메인
	            MEM_MST_TEL1:{required:true},	// 일반전화 앞자리
	            MEM_MST_TEL2:{required:true, number:true , minlength:3 , maxlength:4}, // 일반전화 중간자리
	            MEM_MST_TEL3:{required:true, number:true , minlength:4 , maxlength:4}, // 일반전화 뒷자리
	            MEM_MST_HP1:{required:true},	// 핸드폰번호 앞자리
	            MEM_MST_HP2:{required:true, number:true , minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
	        	MEM_MST_HP3:{required:true, number:true , minlength:4 , maxlength:4} // 핸드폰번호 뒷자리
	        },
	        messages :
	        {
	        	MEM_MST_MEM_ID: {required:"[아이디]는 필수 정보입니다.", minlength:"[아이디]는 최소 6글자 이상입니다.", maxlength:"[아이디]는 최대 15글자입니다."},
	        	MEM_MST_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
	        	MEM_MST_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."},
	        	MEM_CPR_CEO_NM: {required:"[대표자명]은 필수 정보입니다."},
	        	MEM_CPR_ZIP_CDE5: {required:"[우편번호]는 필수 정보입니다."},
	        	MEM_CPR_DRO_ADR1: {required:"[도로명 주소]는 필수 정보입니다."},
	        	MEM_CPR_JBN_ADR1: {required:"[지번 주소]는 필수 정보입니다."},
	        	MEM_CPR_ADR2: {required:"[상세 주소]는 필수 정보입니다."},
	        	MEM_MST_MEM_NM: {required:"[담당자 이름]은 필수 정보입니다."},
	        	MEM_MST_MAIL_ID : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:"아이디 형식을 올바르게 입력해 주십시오."},
	        	MEM_MST_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."},
	        	MEM_MST_TEL1: {required:"[일반전화 앞자리]는 필수 정보입니다."},
	        	MEM_MST_TEL2: {required:"[일반전화 중간자리]는 필수 정보입니다.",minlength:"[일반전화 중간자리]는 최소 3글자 이상입니다." , maxlength:"[일반전화 중간자리]는 최대 4글자입니다."},
	        	MEM_MST_TEL3: {required:"[일반전화 뒷자리]는 필수 정보입니다." ,minlength:"[일반전화 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[일반전화 뒷자리]는 최대 4글자입니다."},
	        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
	        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다." }
	        }
	    });
		
	    var $id = $("#MEM_MST_MEM_ID");
	    
		// 아이디 중복체크
	    checkId = function(){
	        var value = $id.val();
	        
	        $("#checkId").val($id.val());	// 중복체크한 id 
	        
	        if(value == "")
	        {
	            $id.focus();
	            return;
	        }
	        else
	        {
	        	var pattern1 = /^[a-z]+[a-z|0-9]{5,14}$/;
	        	var pattern2 = /[a-z]/g;
	        	var pattern3 = /[0-9]/g;    

	        	if(!pattern1.test(value) || !pattern2.test(value) || !pattern3.test(value))
	            {
	        		$("#memIdCheck").html("사용할 수 없는 아이디입니다.");
	        		$id.focus();
	                $("#idCheckYn").val("F");
	                return;
	            }
	            else
	            {
	            	$.ajax({
	                    async : false,
	                    type : "POST",
	                    data : {"MEM_MST_MEM_ID":$("#MEM_MST_MEM_ID").val()},
	                    url : "<c:out value="${serverSslDomain}" />/pc/member/checkIdAjax.do",
	                    success : function (data) {
	                        if(data.successYn == "Y")
	                        {
	                            if(data.resultYn == "N")
	                            {
	                            	$("#memIdCheck").html("이미 사용중인 아이디입니다.");
	                            }
	                            else
	                            {
	                            	$("#memIdCheck").html("사용 가능한 아이디 입니다.");
	                            }
	                            
	                            $id.focus();
	                            $("#idCheckYn").val(data.resultYn);
	                            return;
	                        }
	                        else
	                        {
	                            alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
	                            return;
	                        }
	                    },
	                    error : function () {
	                        alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
	                    }
	                });
	            }
	        }
	    };
	    
 		// 이메일 도메인 select box 변경 이벤트
	    $(document).on("click", "#emailDomainSelectbox", function () 
	    {
	        var $domain = $("#MEM_MST_MAIL_DOMAIN");
	        
	        if($(this).val() == "")
	        {
	            $domain.prop("readonly", false);
	            $domain.val("");
	        }
	        else
	        {
	            $domain.prop("readonly", true);
	            $domain.val($(this).val());
	        }
	    });
 		
	    $(document).on("click", "#MEM_CPR_TEL1", function () 
   	    {
	    	var thisVal = $(this).val();
	    	if(thisVal == ""){
	    		$("#MEM_CPR_TEL1").val("");
	    		//com.sel_chg($("#MEM_CPR_TEL1"), 'reset');
	    	}else{
	    		
	    	}
	    	
   	    });
 		
	 	// 등록 버튼 클릭 이벤트
	    goRegist = function () {
	 		
	 		if($frm.valid()){
	        	
	 			var $chkObj = $("#idCheckYn");
	            //var $obj = $("#idCheck");
	            
	            if($chkObj.val() == "Y")	// 중복체크 성공
	            {
	            	if($("#checkId").val() == $("#MEM_MST_MEM_ID").val()){		// 1. 중복체크 값과 ID필드 값이 같은 경우
		                    
		            		// 비밀번호와 아이디가 같은지 체크
		            		if($("#MEM_MST_MEM_ID").val() == $("#MEM_MST_PW").val()){
		            			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
		            			$("#MEM_MST_PW").focus();
		            			return;
		            		}
	            	
		                    // 이메일 ID + DOMAIN
		                    $("#MEM_MST_MAIL").val($("#MEM_MST_MAIL_ID").val() + "@" + $("#MEM_MST_MAIL_DOMAIN").val());
		            		
							com.laypop('show');//팝업 show
							$("#idCheckYn").val("");
	    	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemberRegist.do", "target":"_self", "method":"post"}).submit();
	            	}   
	            	else{
	            		$("#memIdCheck").html("아이디 중복을 확인해 주십시오.");
	                    $id.focus();
	                    return;
	            	}
	            }
	            else if($chkObj.val() == "N")
	            {
	            	if($("#checkId").val() == $("#MEM_MST_MEM_ID").val()){
	            		$("#memIdCheck").html("사용할 수 없는 아이디입니다.");
			            $id.focus();
			            return;	            			
	            	}
	            	else{
	            		$("#memIdCheck").html("아이디 중복을 확인해 주십시오.");
	                    $id.focus();
	                    return;	
	            	}
	            }
	            else if($chkObj.val() == "F")
	            {
	            	if($("#checkId").val() == $("#MEM_MST_MEM_ID").val()){
	            		$("#memIdCheck").html("사용할 수 없는 아이디입니다.");
	   	                $id.focus();
	   	                return;
	            	}
	            	else{
	            		$("#memIdCheck").html("아이디 중복을 확인해 주십시오.");
	                    $id.focus();
	                    return;	
	            	}
	            }
	            else{
	            	$("#memIdCheck").html("아이디 중복을 확인해 주십시오.");
                    $id.focus();
                    return;		
	            }
	        }
	    };
	    
	    // 취소 클릭 이벤트
	    goCancel = function(){
	    	if(confirm("회원가입을 취소하시겠습니까?")){
	 			location.href = "<c:out value="${frontDomain }"/>/pc/main/index.do";	 			
	 		}
	    };
	    
	 	// 아이디 및 비밀번호의 체크 메세지 초기화
	    deleteCheckMsg = function(){
	    	$("#memIdCheck").html("");
	    	$("#memPwCheck").html("");
	    };
	    
	});
</script>
</body>
</html>