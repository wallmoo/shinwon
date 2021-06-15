<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
</script>

<body class="page-login page-join"><!-- page class : page-login page-join -->
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
	            <h2>회원가입</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .combineMem S -->
			<section class="combineMem">
				<dl>
					<dt>
						<h3>마켓플랜트 회원가입</h3>
						<c:choose>
							<c:when test="${commandMap.joinType eq 'memberSimple' }">
								<p class="sub_tx">
									<span>이메일을 이용한 간편 가입 방식으로 누구나 가입 가능합니다.<br/>현재 사용중인 이메일로 회원가입 해주세요.</span>
								</p>
							</c:when>
							<c:otherwise>
								<p class="sub_tx">
									<span>마켓플랜트 통합회원으로 가입하시면 마켓플랜트와 전국 매장에서 포인트 적립 및 다양한 혜택을 받으실 수 있으며 프로모션과 이벤트 참여가 가능합니다.</span>
									<span>고객님의 개인정보보호를 위해 본인 확인 절차를 거쳐 회원가입을 하고 있습니다.</span>
								</p>
							</c:otherwise>						
						</c:choose>
					</dt>
					<dd class="dd_tabMn">
						<ol class="ui-grid-c">
							<li class="ui-block-a">
								<p>
									<span>STEP 01</span>
									<strong>본인인증</strong>
								</p>
							</li>
							<li class="ui-block-b">
								<p>
									<span>STEP 02</span>
									<strong>약관동의</strong>
								</p>
							</li>
							<li class="ui-block-c on">
								<p>
									<span>STEP 03</span>
									<strong>정보확인</strong>
								</p>
							</li>
							<li class="ui-block-d">
								<p>
									<span>STEP 04</span>
									<strong>가입완료</strong>
								</p>
							</li>
						</ol>
					</dd>
	
					<dd class="dd_myinfo">
						<form id="frm" name="frm" method="post">
		                <input type="hidden" name="MEM_IPN_CI" id="MEM_IPN_CI" value="<c:out value="${commandMap.MEM_IPN_CI }"/>"/>
						<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
						<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT" value="<c:out value="${commandMap.MEM_IPN_BIR_DT }"/>"/>
						<input type="hidden" name="MEM_IPN_NO" id="MEM_IPN_NO" value="<c:out value="${commandMap.MEM_IPN_NO }"/>"/>
						<input type="hidden" name="MEM_IPN_AGE" id="MEM_IPN_AGE" value="<c:out value="${commandMap.MEM_IPN_AGE }"/>"/>
						<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX" value="<c:out value="${commandMap.MEM_IPN_SEX }"/>"/>
						<input type="hidden" name="MEM_IPN_AUT" id="MEM_IPN_AUT" value="<c:out value="${commandMap.MEM_IPN_AUT }"/>"/>
						<input type="hidden" name="MEM_IPN_FGN" id="MEM_IPN_FGN" value="<c:out value="${commandMap.MEM_IPN_FGN }"/>"/>
						<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI" value="<c:out value="${commandMap.MEM_IPN_DI }"/>"/>
						<input type="hidden" name="MEM_IPN_CI_VER" id="MEM_IPN_CI_VER" value="<c:out value="${commandMap.MEM_IPN_CI_VER }"/>"/>
						<input type="hidden" name="MEM_IPN_AUT_GB" id="MEM_IPN_AUT_GB" value="<c:out value="${commandMap.MEM_IPN_AUT_GB }"/>"/>
						<input type="hidden" name="MEM_IPN_RST" id="MEM_IPN_RST" value="<c:out value="${commandMap.MEM_IPN_RST }"/>"/>
						<input type="hidden" name="MEM_IPN_HP_CRP" id="MEM_IPN_HP_CRP" value="<c:out value="${commandMap.MEM_IPN_HP_CRP }"/>"/>
						<input type="hidden" name="MEM_IPN_CRT_DT" id="MEM_IPN_CRT_DT" value="<c:out value="${commandMap.MEM_IPN_CRT_DT }"/>"/>
		                <input type="hidden" name="joinType" id="joinType" value="${commandMap.joinType }"/>
		                <input type="hidden" name="TRM_YN0005" id="TRM_YN0005" value="${commandMap.TRM_YN0005 }"/>
		                <input type="hidden" name="TRM_YN0006" id="TRM_YN0006" value="${commandMap.TRM_YN0006 }"/>
		                <input type="hidden" name="TRM_YN0007" id="TRM_YN0007" value="${commandMap.TRM_YN0007 }"/>
		                <input type="hidden" name="TRM_YN0008" id="TRM_YN0008" value="${commandMap.TRM_YN0008 }"/> 
		                <input type="hidden" name="MEM_CTF_MAIL" id="MEM_CTF_MAIL" value="<c:out value="${commandMap.MEM_CTF_MAIL }"/>"/>    
		                <double-submit:preventer/>
							<table>
								<caption>정보확인에 아이디, 비밀번호, 비밀번호 확인, 이름, 이메일 주소, 전화번호, 휴대폰 번호, 주소, 정보수신로 구성된 표</caption>
								<colgroup>
								<col style="width:100px" />
								<col />
								</colgroup>
								<thead>
									<tr>
										<th colspan="2">
											<p>
												<strong>기본정보</strong>
												<span><i class="co_red">*</i>는 필수 입력 사항입니다.</span>
											</p>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th><strong>아이디</strong><i class="co_red">*</i></th>
										<td class="td_id_inp">
											<div class="inp_box">
												<input type="hidden" id="idCheckYn" value="" />
												<input type="hidden" id="checkId" value="" />
												<label for="MEM_MST_MEM_ID">
													<input type="text" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" placeholder="중복체크를 해주세요." maxlength="15" data-err_msg_id="memId" onkeydown="javascript:deleteCheckMsg();"/>
												</label>
												<a href="javascript:checkId();" class="btn_gre"><strong>중복체크</strong></a>
											</div>
											<p class="tx_ex">
												<span><i class="ico_exc">!</i>첫글자는 영문으로 띄어쓰기 없이 6~15자로 영문(소문자)과 숫자 조합으로 입력해주세요.</span>
												<strong class="tx_warn" id="memId"></strong>
											</p>
											<p class="tx_ex" style="margin-top:3px;">
												<strong class="tx_warn" id="memIdCheck"></strong>
											</p>
										</td>
									</tr>
									<tr>
										<th><strong>비밀번호</strong><i class="co_red">*</i></th>
										<td class="td_pw">
											<div class="inp_box">
												<label for="MEM_MST_PW">
													<input type="password" name="MEM_MST_PW" id="MEM_MST_PW" maxlength="15" data-err_msg_id="memPw" onkeydown="javascript:deleteCheckMsg();"/>
												</label>
												<p class="tx_ex">
													<span><i class="ico_exc">!</i>띄어쓰기 없이 6~15자 영문,숫자,특수문자 조합으로 입력해주세요.</span>
													<span><i class="ico_exc">!</i>아이디와 동일한 비밀번호는 사용을 자제해 주세요.</span>
													<strong class="tx_warn" id="memPw"></strong>
												</p>
												<p class="tx_ex">
													<strong class="tx_warn" id="memPwCheck"></strong>
												</p>
											</div>
										</td>
									</tr>
									<tr>
										<th><strong>비밀번호<br/>확인</strong><i class="co_red">*</i></th>
										<td class="td_pw2">
											<div class="inp_box">
												<label for="MEM_MST_PW_RE">
													<input type="password" name="MEM_MST_PW_RE" id="MEM_MST_PW_RE" maxlength="15" data-err_msg_id="memPwRe"/>
												</label>
												<p class="tx_ex">
													<span><i class="ico_exc">!</i>비밀번호 확인을 위해 다시 한번 입력해주세요. </span>
													<strong class="tx_warn" id="memPwRe"></strong>
												</p>
											</div>
										</td>
									</tr>
									<tr>
										<th><strong>이름</strong><i class="co_red">*</i></th>
										<td class="td_name">
											<strong><c:out value="${commandMap.MEM_MST_MEM_NM }"/></strong>
										</td>
									</tr>
									<tr>
										<th><strong>이메일 주소</strong><i class="co_red">*</i></th>
										<c:choose>
											<c:when test="${commandMap.joinType eq 'memberSimple'}">
												<td class="td_email"><c:out value="${commandMap.MEM_CTF_MAIL }"/></td>
											</c:when>
											<c:otherwise>
												<td class="td_email">
													<div class="inp_box">										
														<label for="MEM_MST_MAIL_ID">
															<input type="text" name="MEM_MST_MAIL_ID" id="MEM_MST_MAIL_ID" maxlength="20" data-err_msg_id="memEmailId"/>
														</label>
														<label for="MEM_MST_MAIL_DOMAIN">
															<input type="text" name="MEM_MST_MAIL_DOMAIN" id="MEM_MST_MAIL_DOMAIN" data-err_msg_id="memEmailDomain"/>
														</label>
													</div>
													<input type="hidden" id="MEM_MST_MAIL" name="MEM_MST_MAIL"/>
													<label for="emailDomainSelectbox" class="sel_box_st0">
														<select id="emailDomainSelectbox">
															<option value="">직접입력</option>
								                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
									                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
									                            	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
								                            	</c:forEach>
								                            </c:if>
														</select>
													</label>
													<p class="tx_ex" style="padding:3px 0;">
														<strong class="tx_warn" id="memEmailId"></strong>
													</p>
													<p class="tx_ex">
														<strong class="tx_warn" id="memEmailDomain"></strong>
													</p>
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
<%-- 									<c:if test="${commandMap.joinType eq 'memberSimple' }"> --%>
<!-- 										<tr> -->
<!-- 											<th><strong>성별</strong><i class="co_red">*</i></th> -->
<!-- 											<td class="td_sex"> -->
<!-- 												<label for="MEM_MST_SEX1"> -->
<!-- 													<input type="radio" name="MEM_MST_SEX" id="MEM_MST_SEX1" value="M" checked="checked"/> -->
<!-- 													<strong>남자</strong> -->
<!-- 												</label> -->
<!-- 												<label for="MEM_MST_SEX2"> -->
<!-- 													<input type="radio" name="MEM_MST_SEX" id="MEM_MST_SEX2" value="F"/> -->
<!-- 													<strong>여자</strong> -->
<!-- 												</label> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<%-- 									</c:if> --%>
									<tr>
										<th><strong>전화번호</strong></th>
										<td class="td_tal">
											<div class="inp_box">
												<div class="sel_d">
													<label for="MEM_MST_TEL1" class="sel_box_st0">
														<select id="MEM_MST_TEL1" name="MEM_MST_TEL1">
															<option value="">선택</option>
							                              	<c:if test="${not empty codes.TEL_CODE }">
								                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
								                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
								                                </c:forEach>
							                                </c:if>
														</select>
													</label>
												</div>
												<label for="MEM_MST_TEL2">
													<input type="text" name="MEM_MST_TEL2" id="MEM_MST_TEL2" maxlength="4" class="number" />
												</label>
												<label for="MEM_MST_TEL3">
													<input type="text" name="MEM_MST_TEL3" id="MEM_MST_TEL3" maxlength="4" class="number" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th><strong>휴대폰 번호</strong><i class="co_red">*</i></th>
										<td class="td_phone">
											<div class="ct inp_box">
												<div class="sel_d">
													<label for="MEM_MST_HP1" class="sel_box_st0">
														<select id="MEM_MST_HP1" name="MEM_MST_HP1" data-err_msg_id="memHp1">
															<option value="">선택</option>
							                                <c:if test="${not empty codes.HP_CODE }">
							                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
							                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
							                                    </c:forEach>
							                                </c:if>
														</select>
													</label>
												</div>
		
												<label for="MEM_MST_HP2">
													<input type="text" name="MEM_MST_HP2" id="MEM_MST_HP2" maxlength="4" class="number" data-err_msg_id="memHp2"/>
												</label>
												<label for="MEM_MST_HP3">
													<input type="text" name="MEM_MST_HP3" id="MEM_MST_HP3" maxlength="4" class="number" data-err_msg_id="memHp3"/>
												</label>
											</div>
											<p class="tx_ex" style="paddgin:3px 0;">
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
									<tr>
										<th><strong>주소</strong><i class="co_red">*</i></th>
										<td class="td_address">
											<div class="inp_box">
												<label for="MEM_MST_ZIP_CDE5">
													<input type="text" name="MEM_MST_ZIP_CDE5" id="MEM_MST_ZIP_CDE5" maxlength="5" data-err_msg_id="zip"/>
												</label>
												<a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true)" class="btn_cc_l btn_add"><strong>우편번호 찾기</strong></a>
											</div>
											<p class="tx_ex" style="padding-bottom:3px;">
												<strong class="tx_warn" id="zip"></strong>
											</p>
											<label for="MEM_MST_DRO_ADR1">
												<input type="text" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" placeholder="도로명 주소" maxlength="100"  data-err_msg_id="doro"/>
											</label>
											<label for="MEM_MST_JBN_ADR1">
												<input type="text" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" placeholder="지번 주소" maxlength="100"  data-err_msg_id="jibun"/>
											</label>
											<label for="MEM_MST_ADR2">
												<input type="text" name="MEM_MST_ADR2" id="MEM_MST_ADR2" placeholder="상세 주소" maxlength="100" data-err_msg_id="addrDetail"/>
											</label>
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
									<tr>
										<th><strong>정보수신</strong></th>
										<td class="td_reception">
											<div>
												<fieldset data-role="controlgroup" class="chk_st0">
													<input type="checkbox" name="TRM_YN0001" id="TRM_YN0001" value="Y" />
													<label for="TRM_YN0001">SMS수신</label>
													<input type="checkbox" name="TRM_YN0004" id="TRM_YN0004" value="Y"/>
													<label for="TRM_YN0004">이메일 수신 </label>
													<input type="checkbox" name="TRM_YN0003" id="TRM_YN0003" value="Y"/>
													<label for="TRM_YN0003">DM(우편) 수신</label>
													<input type="checkbox" name="TRM_YN0002" id="TRM_YN0002" value="Y"/>
													<label for="TRM_YN0002">TM(전화) 수신</label>
												</fieldset>
												<p class="tx_ex">
													<span><i class="ico_exc">!</i>이벤트 및 다양한 정보를 받으실 수 있습니다.</span>
													<span><i class="ico_exc">!</i>수신 동의와 상관없이 비밀번호 찾기, 주문/배송 관련 SMS/메일은 발송 됩니다.</span>											
												</p>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							
							<table>
								<caption>정보확인에 추천인 ID로 구성된 표</caption>
								<colgroup>
								<col style="width:100px" />
								<col />
								</colgroup>
								<thead>
									<tr>
										<th colspan="2">
											<strong>선택정보</strong>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th><strong>추천인 ID</strong></th>
										<td class="td_recomId">
											<label for="MEM_MST_RCM_ID">
												<input type="text" name="MEM_MST_RCM_ID" id="MEM_MST_RCM_ID" maxlength="15"/>
											</label>
										</td>
									</tr>
							</tbody>
						</table>
	
						<div class="btn_box">
							<a href="javascript:goRegist();" class="btn_red"><strong>확인</strong></a>
							<a href="javascript:goCancel();" class="btn_gre"><strong>취소</strong></a>
						</div>
						</form>
					</dd>
				</dl>
			</section>
			<!--// .combineMem E -->
			
			<%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$.com.win_scrollList = true;//스크롤 할거야~
	function _return_scrollList(_idx, _reNum){
	    /*
	        _idx = 리스트감싸고있는 객체
	        _reNum = 리턴 몇번째넘어왔는지
	    */
	    
	    if(_reNum <= 2){
	        var _list_html = _idx.html();
	        //리스트 추가!
	        _idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
	        //console.log('_reNum = '+_reNum);
	    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
	}
</script>
<script type="text/javascript">
	$.com.login = $.com.login || {
		checkbox: function(){
			//체크박스
			var _acco_clause = $('#acco_clause'),
				_li = _acco_clause.children('li');
	
			$.each(_li, function(i){
				var _this = $(this),
					_ti_chk = _this.children('fieldset'),
					_con_chk = _this.find('.ui-collapsible .chk_st0');
	
				//제목에 있는거 클릭
				_ti_chk.on('click', function(){
					var _this = $(this),
						_li = _this.parent('li');
	
					if(_li.hasClass('on')){ 
						_li.removeClass('on');
						_con_chk.find('input[type="checkbox"]').prop('checked', false).data('cacheval', false);
					}else{
						_li.addClass('on');
						_con_chk.find('input[type="checkbox"]').prop('checked', true).data('cacheval', true);
					}
				});
				
				//내용에 있는거 클릭
				_con_chk.find('input[type="checkbox"]').on('click', function(){
					var _this = $(this),
						_chk_box = _this.parents('.ui-controlgroup-controls'),
						_inp = _chk_box.find('input[type="checkbox"]'),
						_inp_lg = _chk_box.children().length,//체크박스 갯수
						_on_lg = 0;//체크된거 갯수
	
					$.each(_inp, function(){
						if($(this).is(':checked')) _on_lg++;
					});
	
					if(_inp_lg == _on_lg){
						_this.parents('li').addClass('on').children('fieldset').find('input[type="checkbox"]').prop('checked', true).data('cacheval', true);
					}else{
						_this.parents('li').removeClass('on').children('fieldset').find('input[type="checkbox"]').prop('checked', false).data('cacheval', false);
					}
				});
	
				
			});
		}
	};
	
	$(function(){
		$.com.login.checkbox();
	});
</script>
<script type="text/javascript">
//<![CDATA[
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
            //MEM_MST_SEX:{required:true},	// 성별
            MEM_MST_MAIL_ID:{required:true, emailId:true},	// 이메일 아이디
            MEM_MST_MAIL_DOMAIN:{required:true, emailDomain:true},	// 이메일 도메인
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
        	MEM_MST_MEM_ID: {required:"[아이디]는 필수 정보입니다.", minlength:"[아이디]는 최소 6글자 이상입니다.", maxlength:"[아이디]는 최대 15글자입니다."},
        	MEM_MST_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
        	MEM_MST_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."},
        	//MEM_MST_SEX: {required:"[성별]은 필수 정보입니다."},
        	MEM_MST_MAIL_ID : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:"아이디 형식을 올바르게 입력해 주십시오."},
        	MEM_MST_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."},
        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."},
        	MEM_MST_ZIP_CDE5: {required:"[우편번호]는 필수 정보입니다."},
        	MEM_MST_DRO_ADR1: {required:"[도로명 주소]는 필수 정보입니다."},
        	MEM_MST_JBN_ADR1: {required:"[지번 주소]는 필수 정보입니다."},
        	MEM_MST_ADR2: {required:"[상세 주소]는 필수 정보입니다."}
        }
        /* alert으로 처리해야하는 경우 활성화!
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
	   } */
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
                    data : {"MEM_MST_MEM_ID":$("#MEM_MST_MEM_ID").val()},
                    url : "<c:out value="${mobileSslDomain}" />/mobile/member/checkIdAjax.do",
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
    $(document).on("change", "#emailDomainSelectbox", function () 
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
            $("#memEmailDomain").html("");
        }
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
		$('#MEM_MST_ADR2').val("");
	};
		
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
            		
            		if (confirm( "저장 하시겠습니까?")) {
            			//com.laypop('show');//팝업 show
            			$("#idCheckYn").val("");
    	                $frm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/member/joinMemberRegist.do", "target":"_self", "method":"post"}).submit();
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
 			location.href = "<c:out value="${mobileDomain }"/>/mobile/main/index.do";	 			
 		}
    };
    
    // 아이디 및 비밀번호의 체크 메세지 초기화
    deleteCheckMsg = function(){
    	$("#memIdCheck").html("");
    	$("#memPwCheck").html("");
    };
});
//]]>
</script>
</body>
</html>