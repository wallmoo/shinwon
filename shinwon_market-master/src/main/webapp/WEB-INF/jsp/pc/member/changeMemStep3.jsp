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
			<div class="contents"><!-- .contents S -->
				
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 통합 회원 전환</h2></dt>
					<dd class="tx_sub">
						<p>마켓플랜트는 통합 회원 전환으로 보다 나은 서비스를 제공하고자 합니다.<br/>
							통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있는 서비스입니다.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f"><strong><span>01</span>가입정보확인</strong></li>
							<li><strong><span>02</span>전환 약관동의</strong></li>
							<li class="on"><strong><span>03</span>가입정보 재입력</strong></li>
							<li class="l "><strong><span>04</span>전환완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con my_info_con"><!-- .join_con S -->
					<li class="my_info">
						<h3>기본정보<span>(* 필수 입력사항 입니다.)</span></h3>
						
						<form id="frm" name="frm" method="post">
						<!-- 온라인,오프라인 공통적으로 필요한 부분 -->
						<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT" value="<c:out value="${commandMap.MEM_IPN_BIR_DT }"/>"/>
						<input type="hidden" name="MEM_IPN_CI" id="MEM_IPN_CI" value="<c:out value="${commandMap.MEM_IPN_CI }"/>"/>
						<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX" value="<c:out value="${commandMap.MEM_IPN_SEX }"/>"/>
						<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI" value="<c:out value="${commandMap.MEM_IPN_DI }"/>"/>
						<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
		                <input type="hidden" name="MEM_MST_ERP_ID" id="MEM_MST_ERP_ID" value="<c:out value="${commandMap.MEM_MST_ERP_ID }"/>"/>
		                <input type="hidden" name="MEM_MST_RCM_ID" id="MEM_MST_RCM_ID" value="<c:out value="${commandMap.MEM_MST_RCM_ID }"/>"/>
		                <input type="hidden" name="TRM_YN0005" id="TRM_YN0005" value="${commandMap.TRM_YN0005 }"/>
		                <input type="hidden" name="TRM_YN0006" id="TRM_YN0006" value="${commandMap.TRM_YN0006 }"/>
		                <input type="hidden" name="TRM_YN0007" id="TRM_YN0007" value="${commandMap.TRM_YN0007 }"/>
		                <input type="hidden" name="TRM_YN0008" id="TRM_YN0008" value="${commandMap.TRM_YN0008 }"/>
		                
		                <!-- 온라인,오프라인 전환 필요한 부분 -->
		                <input type="hidden" name="membershipYn" id="membershipYn" value="<c:out value="${commandMap.membershipYn }"/>"/>
		                
		                <!-- 온라인 전환 필요한 부분 -->
		                <input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
		                <input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${commandMap.MEM_MST_REG_DT }"/>"/>
		                <input type="hidden" name="erpInfoYn" id="erpInfoYn" value="<c:out value="${commandMap.erpInfoYn }"/>"/>
		                <!-- 오프라인 전환 필요한 부분 -->
		                <input type="hidden" name="MEM_MST_OCB_NO" id="MEM_MST_OCB_NO" value="<c:out value="${commandMap.MEM_MST_OCB_NO }"/>"/>
						<input type="hidden" name="MEM_MST_ZIP_CDE6" id="MEM_MST_ZIP_CDE6" value="<c:out value="${commandMap.MEM_MST_ZIP_CDE6 }"/>"/>
						<input type="hidden" name="P8E1CTDG" id="P8E1CTDG" value="<c:out value="${commandMap.P8E1CTDG }"/>"/>
						   
						<!-- 간편회원 전환 필요한 부분 -->
						<input type="hidden" name="simpleMemYn" id="simpleMemYn" value="<c:out value="${commandMap.simpleMemYn }"/>"/>
						<input type="hidden" name="MEM_MST_ERP_YN" id="MEM_MST_ERP_YN" value="<c:out value="${commandMap.MEM_MST_ERP_YN }"/>"/>
		                <double-submit:preventer/>
						
						<table class="f table_st4">
							<caption>기본정보 / 아이디, 비밀번호, 비밀번호 확인, 이름, 이메일, 전화번호, 휴대폰 번호, 주소, 정보수신 으로 구성된 표</caption>
							<colgroup>
							<col style="width:170px" />
							<col />
							</colgroup>
							<tbody>
								<c:choose>
									<c:when test="${not empty commandMap.MEM_MST_MEM_ID }">
										<tr class="tr_id">
											<th><span><label for="MEM_MST_MEM_ID">아이디</label><i>*</i></span></th>
											<td>
												<div class="inp_box">
													<c:out value="${commandMap.MEM_MST_MEM_ID }"/>
												</div>
											</td>
										</tr>									
									</c:when>
									<c:otherwise>
										<tr class="tr_id">
											<th><span><label for="MEM_ID">아이디</label><i>*</i></span></th>
											<td>
												<div class="inp_box">
													<input type="text" name="MEM_ID" id="MEM_ID" placeholder="아이디 중복체크를 해주세요." maxlength="15" data-err_msg_id="memId" onkeydown="javascript:deleteCheckMsg();"/>
													<input type="hidden" id="idCheckYn" value="" />
													<input type="hidden" id="checkId" value="" /> 
													<a href="javascript:checkId();" class="btn_st0 btn_blk777"><span>중복체크</span></a>
												</div>
												<p class="tx_ex">
													<span>! 첫글자는 영문(소문자)으로 띄어쓰기 없이 6~15자로 영문(소문자)과 숫자 조합으로 입력해주세요.</span>
													<strong class="tx_warn" id="memId"></strong>
												</p>
												<p class="tx_ex" style="margin-top:3px;">
													<strong class="tx_warn" id="memIdCheck"></strong>
												</p>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<tr class="tr_pw">
									<th><span><label for="MEM_MST_PW">비밀번호</label><i>*</i></span></th>
									<td>
										<div class="inp_box">
											<input type="password" name="MEM_MST_PW" id="MEM_MST_PW" maxlength="15" data-err_msg_id="memPw" onkeydown="javascript:deleteCheckMsg();"/>
										</div>
										<p class="tx_ex">
											<span>! 띄어쓰기 없이 6~15자 영문,숫자,특수문자 조합으로 입력해주세요.<br/>아이디와 동일한 비밀번호는 사용을 자제해주세요.</span>
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
											<input type="password" name="MEM_MST_PW_RE" id="MEM_MST_PW_RE" maxlength="15" data-err_msg_id="memPwRe"/>
										</div>
										<p class="tx_ex">
											<span>! 비밀번호 확인을 위해 다시 한번 입력해주세요. </span>
											<strong class="tx_warn" id="memPwRe"></strong>
										</p>
									</td>
								</tr>
								<tr class="tr_name">
									<th><span>이름<i>*</i></span></th>
									<td><span><c:out value="${commandMap.MEM_MST_MEM_NM }"/></span></td>
								</tr>
								<c:choose>
									<c:when test="${commandMap.simpleMemYn eq 'Y' }">
										<tr class="tr_email">
											<th><span><label for="inp_emailS">이메일</label><i>*</i></span></th>
											<td>
												<c:out value="${commandMap.MEM_MST_MAIL }"/>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr class="tr_email">
											<th><span><label for="inp_emailS">이메일</label><i>*</i></span></th>
											<td>
												<div class="inp_box">
													<input type="text" name="MEM_MST_MAIL" id="MEM_MST_MAIL" maxlength="50" data-err_msg_id="memEmail" value="<c:out value="${commandMap.MEM_MST_MAIL }"/>"/>
												</div>
												<p class="tx_ex" style="padding:3px 0;">
													<strong class="tx_warn" id="memEmail"></strong>
												</p>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<tr class="tr_tel">
									<th><span>전화번호</span></th>
									<td>
										<div class="inp_box">
											<select id="MEM_MST_TEL1" name="MEM_MST_TEL1" class="sel_chg" >
												<option value="">선택</option>
				                                <c:if test="${not empty codes.TEL_CODE }">
					                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
					                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq commandMap.MEM_MST_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
					                                </c:forEach>
				                                </c:if>
											</select>
											<i>-</i>
											<label for="MEM_MST_TEL2">
												<input type="text" name="MEM_MST_TEL2" id="MEM_MST_TEL2" maxlength="4" class="number" value="<c:out value="${commandMap.MEM_MST_TEL2 }"/>" />
											</label>
											<i>-</i>
											<label for="MEM_MST_TEL3">
												<input type="text" name="MEM_MST_TEL3" id="MEM_MST_TEL3" maxlength="4" class="number" value="<c:out value="${commandMap.MEM_MST_TEL3 }"/>" />
											</label>
										</div>
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
				                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq commandMap.MEM_MST_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
				                                    </c:forEach>
				                                </c:if>
											</select>
											<i>-</i>
											<label for="MEM_MST_HP2">
												<input type="text" name="MEM_MST_HP2" id="MEM_MST_HP2" maxlength="4" class="number" data-err_msg_id="memHp2" value="<c:out value="${commandMap.MEM_MST_HP2 }"/>"/>
											</label>
											<i>-</i>
											<label for="MEM_MST_HP3">
												<input type="text" name="MEM_MST_HP3" id="MEM_MST_HP3" maxlength="4" class="number" data-err_msg_id="memHp3" value="<c:out value="${commandMap.MEM_MST_HP3 }"/>"/>
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
								<tr class="tr_add">
									<th><span>주소<i>*</i></span></th>
									<td>
										<c:choose>
											<c:when test="${not empty commandMap.MEM_MST_ZIP_CDE5 }">
												<div class="inp_box li_1" style="margin-bottom:3px;">
													<input type="text" name="MEM_MST_ZIP_CDE5" id="MEM_MST_ZIP_CDE5" maxlength="5" readonly="readonly" data-err_msg_id="zip" value="<c:out value="${commandMap.MEM_MST_ZIP_CDE5 }"/>"/>
													<a href="javascript:;" id="zipCheck" class="btn_st0 btn_blk777"><span>우편번호 찾기</span></a>
												</div>
												<p class="tx_ex" style="padding-bottom:3px;">
													<strong class="tx_warn" id="zip"></strong>
												</p>
												<div class="inp_box li_2">
													<label for="MEM_MST_DRO_ADR1" class="f">
														<input type="text" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" placeholder="도로명 주소" 
																maxlength="100" readonly="readonly" data-err_msg_id="doro" value="<c:out value="${commandMap.MEM_MST_DRO_ADR1 }"/>"/>
													</label>
												</div>
												
												<div class="inp_box li_3">
													<label for="MEM_MST_JBN_ADR1" class="f">
														<input type="text" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" placeholder="지번 주소" 
																maxlength="100" readonly="readonly" data-err_msg_id="jibun" value="<c:out value="${commandMap.MEM_MST_JBN_ADR1 }"/>"/>
													</label>
													<label for="MEM_MST_ADR2" class="l">
														<input type="text" name="MEM_MST_ADR2" id="MEM_MST_ADR2" placeholder="상세 주소" 
																maxlength="100" data-err_msg_id="addrDetail" value="<c:out value="${commandMap.MEM_MST_DRO_ADR2 ne '' ? commandMap.MEM_MST_DRO_ADR2 : commandMap.MEM_MST_JBN_ADR2 }"/>"/>
													</label>
												</div>
											</c:when>
											<c:otherwise>
												<div class="inp_box li_1" style="margin-bottom:3px;">
													<input type="text" name="MEM_MST_ZIP_CDE5" id="MEM_MST_ZIP_CDE5" maxlength="5" readonly="readonly" data-err_msg_id="zip"/>
													<a href="javascript:;" id="zipCheck" class="btn_st0 btn_blk777"><span>우편번호 찾기</span></a>
												</div>
												<p class="tx_ex" style="padding-bottom:3px;">
													<strong class="tx_warn" id="zip"></strong>
												</p>
												<div class="inp_box li_2">
													<label for="MEM_MST_DRO_ADR1" class="f">
														<input type="text" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" placeholder="도로명 주소" 
																maxlength="100" readonly="readonly" data-err_msg_id="doro"/>
													</label>
												</div>
												
												<div class="inp_box li_3">
													<label for="MEM_MST_JBN_ADR1" class="f">
														<input type="text" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" placeholder="지번 주소" 
																maxlength="100" readonly="readonly" data-err_msg_id="jibun"/>
													</label>
													<label for="MEM_MST_ADR2" class="l">
														<input type="text" name="MEM_MST_ADR2" id="MEM_MST_ADR2" placeholder="상세 주소" 
																maxlength="100" data-err_msg_id="addrDetail"/>
													</label>
												</div>
											</c:otherwise>
										</c:choose>
										
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
								<tr class="tr_receive">
									<th><span>정보수신</span></th>
									<td>
										<div class="inp_box">
											<label for="TRM_YN0001" class="<c:if test="${commandMap.TRM_YN0001 eq 'Y' }">on</c:if>">
												<input type="checkbox" name="TRM_YN0001" id="TRM_YN0001" value="Y" <c:if test="${commandMap.TRM_YN0001 eq 'Y'}">checked="checked"</c:if>/>
												<span>SMS 수신</span>
											</label>
											<label for="TRM_YN0004" class="<c:if test="${commandMap.TRM_YN0004 eq 'Y' }">on</c:if>">
												<input type="checkbox" name="TRM_YN0004" id="TRM_YN0004" value="Y" <c:if test="${commandMap.TRM_YN0004 eq 'Y'}">checked="checked"</c:if>/>
												<span>이메일 수신</span>
											</label>
											<label for="TRM_YN0003" class="<c:if test="${commandMap.TRM_YN0003 eq 'Y' }">on</c:if>">
												<input type="checkbox" name="TRM_YN0003" id="TRM_YN0003" value="Y" <c:if test="${commandMap.TRM_YN0003 eq 'Y'}">checked="checked"</c:if>/>
												<span>DM(우편) 수신</span>
											</label>
											<label for="TRM_YN0002" class="l <c:if test="${commandMap.TRM_YN0002 eq 'Y' }">on</c:if>">
												<input type="checkbox" name="TRM_YN0002" id="TRM_YN0002" value="Y" <c:if test="${commandMap.TRM_YN0002 eq 'Y'}">checked="checked"</c:if>/>
												<span>TM(전화) 수신</span>
											</label>
											<p class="tx_ex">
												! 이벤트 및 다양한 정보를 받으실 수 있습니다.<br/>
												! 수신 동의와 상관없이 비밀번호 찾기, 주문/배송 관련 SMS/메일은 발송 됩니다.
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<hr class="line_1px" />
	
						<h3 class="ti">선택정보</h3>
						<table class="l table_st4">
							<caption>선택정보 / 추천ID로 구성된 표</caption>
							<colgroup>
							<col style="width:170px" />
							<col />
							</colgroup>
							<tbody>
								<tr class="tr_recomID">
									<th><span><label for="inp_recomID">추천인 ID</label></span></th>
									<td>
										<div class="inp_box">
											<c:out value="${commandMap.MEM_MST_RCM_ID }"/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
					</li>
					<li class="btn_box">
						<c:choose>
							<c:when test="${not empty commandMap.MEM_MST_MEM_ID }">
								<a href="javascript:goOnlineRegist();" class="btn_st2 btn_rd"><span>확인</span></a>							
							</c:when>
							<c:otherwise>
								<a href="javascript:goOfflineRegist();" class="btn_st2 btn_rd"><span>확인</span></a>
							</c:otherwise>
						</c:choose>
						
						<a href="javascript:goCancel();" class="btn_st2 btn_blk777"><span>취소</span></a>
					</li>
				</ul><!--// .join_con E -->
				
				<div id="laypop" class="laypop" data-idx="0" >
					<ul class="laypop_con loading"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
						<li class="con">
							<img src="<c:out value="${cdnDomain }"/>/pc/img/lay/loading.gif" alt="로딩중입니다." />
						</li>
					</ul>
				</div>
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		var receive_list = $('.tr_receive .inp_box label'),
		ddClick = false;

		//체크박스
		receive_list.on('click',function(){
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
		
		//라디오
		var sex_list = $('.tr_sex .inp_box label');

		sex_list.on('click',function(){
			_this = $(this);
			_this.addClass('on').children('input').prop('checked', true).attr('checked', true);
			_this.siblings().removeClass('on').children('input').prop('checked', false).attr('checked', false);
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
	        	MEM_ID:{required:true, minlength:6, maxlength:15}, // 아이디
	            MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, // 비밀번호
	            MEM_MST_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#MEM_MST_PW"}, // 비밀번호 확인
	            MEM_MST_MAIL:{required:true, email:true},	// 이메일
	            MEM_MST_HP1:{required:true},	// 핸드폰번호 앞자리
	            MEM_MST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
	        	MEM_MST_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
	        	MEM_MST_ZIP_CDE5:{required:true, number:true}, // 우편번호
	        	MEM_MST_DRO_ADR1:{required:true}, // 도로명 본주소
	        	MEM_MST_JBN_ADR1:{required:true}, // 지번 본주소
	        	MEM_MST_ADR2:{required:true}  // 상세주소
	        },
	        messages :
	        {
	        	MEM_ID: {required:"[아이디]는 필수 정보입니다.", minlength:"[아이디]는 최소 6글자 이상입니다.", maxlength:"[아이디]는 최대 15글자입니다."},
	        	MEM_MST_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
	        	MEM_MST_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."},
	        	MEM_MST_MAIL : {required:"[이메일]은 필수 정보입니다.", email:"이메일을 올바르게 입력해 주십시오."},
	        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
	        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."},
	        	MEM_MST_ZIP_CDE5: {required:"[우편번호]는 필수 정보입니다."},
	        	MEM_MST_DRO_ADR1: {required:"[도로명 주소]는 필수 정보입니다."},
	        	MEM_MST_JBN_ADR1: {required:"[지번 주소]는 필수 정보입니다."},
	        	MEM_MST_ADR2: {required:"[상세 주소]는 필수 정보입니다."}
	        }
	        // alert으로 처리해야하는 경우 활성화!
// 	        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
// 	        ,onkeyup:false
// 		    ,onclick:false
// 		    ,onfocusout:false
// 	        ,showErrors:function(errorMap, errorList){
// 	 	       if(this.numberOfInvalids()) { 
// 		    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
// 		    	   //alert('[' + caption + '] ' + errorList[0].message);
// 		    	   var errorOobjId = $(errorList[0].element).attr('id');
// 		    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
// 		    	   caption = caption.replace('*','').replace(/\s/gi,'');
// 		    	   if(caption != null && caption != "") 
// 		    	   {
// 		    	       alert('[' + caption + '] ' + errorList[0].message);
// 		    	   }
// 		    	   else
// 		    	   {
// 		    	       alert(errorList[0].message);
// 		    	   }
// 		    	   $(errorList[0].element).focus();
// 		       }
// 		   } 
	    });
		
		var $id = $("#MEM_ID");
	    
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
	        		$("#memIdCheck").html("사용할 수 없는 아이디입니다.\n영문과 숫자를 포함해서 입력해 주십시오.");
	        		$id.focus();
	                $("#idCheckYn").val("F");
	                return;
	            }
	            else
	            {
	            	$.ajax({
	                    async : false,
	                    type : "POST",
	                    data : {"MEM_MST_MEM_ID":$("#MEM_ID").val()},
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
		
	 	// 우편번호 찾기 클릭 이벤트
	    $(document).on("click","#zipCheck",function(){
	    	window.open("<c:out value="${serverSslDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes,target=_blank");
	    });
	 	
	 	// 우편번호 callback 함수
		zipcodeCallback = function (zip,doroAddr,jibunAddr)
		{
			$('#MEM_MST_ZIP_CDE5').val(zip);
			$('#MEM_MST_DRO_ADR1').val(doroAddr);
			$('#MEM_MST_JBN_ADR1').val(jibunAddr);
			$('#zip').html("");
			$('#doro').html("");
			$('#jibun').html("");
		};
 		
	 	// 온라인 전환에 대한 등록 버튼 클릭 이벤트
	    goOnlineRegist = function () {
	    	
	 		if($frm.valid()){
	 			// 비밀번호와 아이디가 같은지 체크
          		if($("#MEM_MST_MEM_ID").val() == $("#MEM_MST_PW").val()){
          			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
          			$("#MEM_MST_PW").focus();
          			return;
          		}

           		if (confirm( "저장 하시겠습니까?")) {
           			com.laypop('show');//팝업 show
           			$("#idCheckYn").val("");
   	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/onlineMemRegist.do", "target":"_self", "method":"post"}).submit();
                }   
	 		}
	    };
	    
	    // 오프라인 전환에 대한 등록 버튼 클릭 이벤트
	    goOfflineRegist = function () {

	    	if($frm.valid()){
	 			
	    		var $chkObj = $("#idCheckYn");
	            
	            if($chkObj.val() == "Y")	// 중복체크 성공
	            {
	            	if($("#checkId").val() == $("#MEM_ID").val()){		// 1. 중복체크 값과 ID필드 값이 같은 경우

	            		// 비밀번호와 아이디가 같은지 체크
	            		if($("#MEM_ID").val() == $("#MEM_MST_PW").val()){
	            			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
	            			$("#MEM_MST_PW").focus();
	            			return;
	            		}

	            		if (confirm( "저장 하시겠습니까?")) {
	            			com.laypop('show');//팝업 show
	            			$("#idCheckYn").val("");
	    	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/offlineMemRegist.do", "target":"_self", "method":"post"}).submit();
	                    }   
	            	}   
	            	else{
	            		$("#memIdCheck").html("아이디 중복을 확인해 주십시오.");
	            		$id.focus();
	                    return;
	            	}
	            }
	            else if($chkObj.val() == "N")
	            {
	            	if($("#checkId").val() == $("#MEM_ID").val()){
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
	            	if($("#checkId").val() == $("#MEM_ID").val()){
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