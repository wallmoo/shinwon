<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

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
			<form id="dataForm" name="dataForm" method="post">
            <input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
            <input type="hidden" name="MEM_CTF_MAIL" id="MEM_CTF_MAIL" value="<c:out value="${commandMap.MEM_CTF_MAIL }"/>"/>
			<input type="hidden" name="joinType" id="joinType" value="<c:out value="${commandMap.joinType }"/>"/> 
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
							<p class="sub_tx">
								<span>이메일을 이용한 간편 가입 방식으로 누구나 가입 가능합니다.<br/>현재 사용중인 이메일로 회원가입 해주세요.</span>
							</p>
						</dt>
						<dd class="dd_tabMn">
							<ol class="ui-grid-c">
								<li class="ui-block-a">
									<p>
										<span>STEP 01</span>
										<strong>본인인증</strong>
									</p>
								</li>
								<li class="ui-block-b on">
									<p>
										<span>STEP 02</span>
										<strong>약관동의</strong>
									</p>
								</li>
								<li class="ui-block-c">
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
						<dd class="dd_clause">
							<div class="tx_chk">
								<p>
									<span>회원가입을 위하서 아래 회원약관, <br/>개인정보취급방침에 대한 안내를 읽고 동의해주세요. </span>
								</p>
								<fieldset data-role="controlgroup" class="chk_st0">
									<input type="checkbox" name="chk_caluse" id="chk_caluse">
									<label for="chk_caluse">전체약관 동의</label>
								</fieldset>
							</div>
							
							<ul id="acco_clause" class="acco_clause" data-role="collapsible-set">
								<li class="li_ti"><h3>회원 약관</h3></li>
						<!-- 1개 S -->
						
						<li>
							<fieldset data-role="controlgroup" class="chk_st0">
								<input type="checkbox" name="chk_clause_1" id="chk_clause_1" value="Y" />
								<label for="chk_clause_1" class="co_red">(필수)</label>
							</fieldset>	

							<div data-role="collapsible">
								<h4>
									<strong>온라인 쇼핑몰 회원약관 동의</strong>								
									<i></i>
								</h4>
								<div class="acc_con">
									<pre>
<strong>마켓플랜트 쇼핑몰 이용약관</strong>

<strong>제1조	 (목적)</strong>
이 약관은 (주)이패스씨앤아이(전자상거래 사업자, 이하 "회사"라 한다)이 운영하는 마켓플랜트 온라인몰(이하 "몰"이라 한다)에서 제공되는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 온라인몰과 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.
※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질을 반하지 않는 한 이 약관을 준용합니다.

</pre>
								</div>
							</div>

						</li>
						<!-- 1개 E -->	
						<!-- 2개 S -->
						<li>
						
							<fieldset data-role="controlgroup" class="chk_st0">
								<input type="checkbox" name="chk_clause_2" id="chk_clause_2" value="Y"/>
								<label for="chk_clause_2" class="co_red">(필수)</label>
							</fieldset>	

							<div data-role="collapsible">
								<h4>
									<strong>마켓플랜트 온라인 쇼핑몰 개인정보 취급방침 동의</strong>
									<i></i>
								</h4>
								<div class="acc_con">
									<pre>
<strong>마켓플랜트 쇼핑몰 개인정보 취급방침</strong>

마켓플랜트 쇼핑몰은 회원의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보 취급방침을 수립ㆍ공개합니다. 
마켓플랜트의 개인정보 취급방침은 관련 법률 및 지침의 변경과 마켓플랜트 내부 운영방침의 변경에 따라 변경될 수 있습니다. [개인정보 취급방침]이 변경될 경우 변경사항은 마켓플랜트 쇼핑몰에 게시됩니다. 변경사항에 의문이 있으실 경우는 언제라도 담당자에게 문의하시거나 마켓플랜트 쇼핑몰을 방문하여 확인하실 수 있습니다.
마켓플랜트는 회원의 정보를 소중히 여기고, 불법적인 개인정보 유출 방지를 위해 최선의 노력을 다하겠습니다.
</pre>
								</div>
							</div>

						</li>
							</ul>
		
							<div class="btn_box">
								<a href="javascript:goCheck();" class="btn_red"><strong>확인</strong></a>
								<a href="javascript:goCancel();" class="btn_gre"><strong>취소</strong></a>
							</div>
						</dd>
					</dl>
				</section>
			<!--// .combineMem E -->
			</form>
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
	$.com.login = $.com.login || {
		checkbox: function(){
			//체크박스
			var _acco_clause = $('#acco_clause'),
				_li = _acco_clause.children('li'),
				_all_chk = $('#chk_caluse'),
				_dataNum = 0,
				_li_all_chk = [];//라인별 체크완료 확인 [true, false, ..]
			
			$.each(_li, function(i){
				var _this = $(this),
					_ti_chk = _this.children('.chk_st0'),
					_ti_chk_lg = _this.children('.chk_st0').length,
					_con_chk = _this.children('.chk_st1'),
					_inp_chk = _ti_chk.find('input[type="checkbox"]').is(':checked'),
					_hasClass = _this.hasClass('ti_chk');
	
				if(_ti_chk_lg && !_hasClass){
					_this.attr('data-idx', _dataNum);
					_li_all_chk.push(_inp_chk*1);
					_dataNum++;
				}
	
				//제목에 있는거 클릭
				_ti_chk.on('click', function(){	
					var _this = $(this),
						_li = _this.parent('li'),
						_dt_idx = _li.data('idx');
	
					if(_li.hasClass('on')){
						_li_all_chk[_dt_idx] = false*1;
						_li.removeClass('on');
						_this.find('input[type="checkbox"]').prop('checked', false).data('cacheval', false).trigger('change');
						_con_chk.find('input[type="checkbox"]').prop('checked', false).data('cacheval', false).trigger('change');
					}else{
						_li_all_chk[_dt_idx] = true*1;
						_li.addClass('on');
						_this.find('input[type="checkbox"]').prop('checked', true).data('cacheval', true).trigger('change');
						_con_chk.find('input[type="checkbox"]').prop('checked', true).data('cacheval', true).trigger('change');
					}
					all_chk();
				});
	
				
				//제목에 서브체크 클릭
				_con_chk.find('input[type="checkbox"]').on('click', function(){
					var _this = $(this),
						_li = _this.parents('li'),
						_dt_idx = _li.data('idx'),
						_chk_box = _this.parents('.ui-controlgroup-controls'),
						_inp = _chk_box.find('input[type="checkbox"]'),
						_inp_lg = _chk_box.children().length,//체크박스 갯수
						_on_lg = 0;//체크된거 갯수
	
					$.each(_inp, function(){
						if($(this).is(':checked')) _on_lg++;
					});
					
					if(_inp_lg == _on_lg){
						_li_all_chk[_dt_idx] = true*1;
						_li.addClass('on').children('.chk_st0').find('input[type="checkbox"]').prop('checked', true).data('cacheval', true).trigger('change');
					}else{
						_li_all_chk[_dt_idx] = false*1;
						_li.removeClass('on').children('.chk_st0').find('input[type="checkbox"]').prop('checked', false).data('cacheval', false).trigger('change');
						_all_chk.prop('checked', false).data('cacheval', false).trigger('change');
					}
					all_chk();
				});
	
				
			});//$.each
			
			//전체 체크
			_all_chk.on('click', function(){
				var _type = _all_chk.is(':checked');
							
				$.each(_li, function(i){
					var _this = $(this),
						_ti_chk = _this.children('.chk_st0'),
						_hasClass = _this.hasClass('ti_chk'),
						_hasti = _this.hasClass('li_ti');
					
					if(!_hasClass && !_hasti){
						if(_type){
							_this.addClass('on');
							_this.find('input[type="checkbox"]').prop('checked', true).data('cacheval', true).trigger('change');
							//_con_chk.find('input[type="checkbox"]').prop('checked', true).data('cacheval', true).trigger('change');
						}else{
							_this.removeClass('on');
							_this.find('input[type="checkbox"]').prop('checked', false).data('cacheval', false).trigger('change');
							//_con_chk.find('input[type="checkbox"]').prop('checked', false).data('cacheval', false).trigger('change');
						}
					}
				});
				$.each(_li_all_chk, function(i){
					_li_all_chk[i] = _type;
				});
			});
			
			function all_chk(){
				var _all = _li_all_chk.indexOf(0);
				if(_all == -1) _all_chk.prop('checked', true).data('cacheval', true).trigger('change');
				else _all_chk.prop('checked', false).data('cacheval', false).trigger('change');
			}
		}
	};
	
	$(function(){
		$.com.login.checkbox();
	});
</script>

<script type="text/javascript">
//<![CDATA[
$(function(){
	var $dataForm = $("#dataForm");
	
	// 필수 동의 체크 여부
	goCheck = function()
    {
		if(!$("input[name=chk_clause_1]").is(':checked')){
            alert("회원약관에 동의해주세요.");
            $("#chk_clause_1").focus();
            return;
        }
        
        if(!$("input[name=chk_clause_2]").is(':checked')){
            alert("개인정보 취급방침에 동의해주세요.");
            $("#chk_clause_2").focus();
            return;
        }
        
        $dataForm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/member/joinMemStep3.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 취소 클릭 이벤트
    goCancel = function(){
    	if(confirm("회원가입을 취소하시겠습니까?")){
 			location.href = "<c:out value="${mobileDomain }"/>/mobile/main/index.do";	 			
 		}
    };
});
//]]>
</script>
</body>
</html>