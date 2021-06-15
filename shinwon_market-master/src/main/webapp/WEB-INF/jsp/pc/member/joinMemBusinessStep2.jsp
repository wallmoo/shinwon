<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<form id="dataForm" name="dataForm" method="post">
            <input type="hidden" name="MEM_CPR_NM" id="MEM_CPR_NM" value="<c:out value="${commandMap.MEM_CPR_NM }"/>"/>
            <input type="hidden" name="MEM_CPR_NO1" id="MEM_CPR_NO1" value="<c:out value="${commandMap.MEM_CPR_NO1 }"/>"/>
            <input type="hidden" name="MEM_CPR_NO2" id="MEM_CPR_NO2" value="<c:out value="${commandMap.MEM_CPR_NO2 }"/>"/>
            <input type="hidden" name="MEM_CPR_NO3" id="MEM_CPR_NO3" value="<c:out value="${commandMap.MEM_CPR_NO3 }"/>"/>
			<input type="hidden" name="joinType" id="joinType" value="<c:out value="${commandMap.joinType }"/>"/> 
			
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
							<li class="on"><strong><span>02</span>약관동의</strong></li>
							<li><strong><span>03</span>정보입력</strong></li>
							<li class="l"><strong><span>04</span>가입완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con agree_con"><!-- .join_con S -->
					<li class="agree_list">
						<h3>회원가입을 위하여 기업회원 회원약관, 기업회원 개인정보취급방침에 대한 안내를 읽고 동의해주세요. </h3>
						<dl>
							<dt>
								<label for="join_ag_0">
									<input type="checkbox" name="join_ag_0" id="join_ag_0" />
									<span><span class="co_red">(필수)</span>마켓플랜트 쇼핑몰 기업회원약관에 동의합니다.</span>
								</label>
							</dt>
							<dd>
								<pre>
<strong>마켓플랜트 쇼핑몰 이용약관</strong>

<strong>제1조	 (목적)</strong>
이 약관은 (주)이패스씨앤아이(전자상거래 사업자, 이하 "회사"라 한다)이 운영하는 마켓플랜트 온라인몰(이하 "몰"이라 한다)에서 제공되는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 온라인몰과 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.
※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질을 반하지 않는 한 이 약관을 준용합니다.

</pre>
							</dd>
							<dt>
								<label for="join_ag_1">
									<input type="checkbox" name="join_ag_1" id="join_ag_1" />
									<span><span class="co_red">(필수)</span>마켓플랜트 쇼핑몰 기업정보 취급방침 약관에 동의합니다.</span>
								</label>
							</dt>
							<dd>
								<pre>
<strong>마켓플랜트 쇼핑몰 기업정보 취급방침</strong>

마켓플랜트 쇼핑몰은 회원의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보 취급방침을 수립ㆍ공개합니다. 
마켓플랜트의 개인정보 취급방침은 관련 법률 및 지침의 변경과 마켓플랜트 내부 운영방침의 변경에 따라 변경될 수 있습니다. [개인정보 취급방침]이 변경될 경우 변경사항은 마켓플랜트 쇼핑몰에 게시됩니다. 변경사항에 의문이 있으실 경우는 언제라도 담당자에게 문의하시거나 마켓플랜트 쇼핑몰을 방문하여 확인하실 수 있습니다.
마켓플랜트는 회원의 정보를 소중히 여기고, 불법적인 개인정보 유출 방지를 위해 최선의 노력을 다하겠습니다.

</pre>
							</dd>
							<dd class="l">
								<label for="join_ag_all">
									<input type="checkbox" name="join_ag_all" id="join_ag_all" />
									<span>위 모든 약관에 동의합니다.</span>
								</label>
							</dd>
						</dl>					
					</li>
					<li class="btn_box">
						<a href="javascript:goCheck();" class="btn_st2 btn_rd"><span>확인</span></a>
						<a href="javascript:goCancel();" class="btn_st2 btn_blk777"><span>취소</span></a>
					</li>
				</ul><!--// .join_top E -->
			</div><!--// .contents E -->
			</form>
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		var agree_list = $('.agree_list'),
		ck_lg = agree_list.find('dt label').length,
		_ck_text = ['no_click','self_chk','self_chk on','self_chk '];

		//체크박스
		agree_list.find('label').on('click',function(e){
			var _tagname = (e.target.tagName).toLowerCase();
			/*if(_tagname != 'label' && _tagname != 'span'){
				console.log('[11]');
				return false; // && ddClick == true
			}*/
			if($(this).parent().hasClass('no_click')) return false;
			
	
			var _this = $(this),
				_for = _this.attr('for'),
				_has = _this.hasClass('on'),
				_pasClass= _this.parents('.self_chk').length,
				all_label = agree_list.find('dt label');
	
			if(_has) _this.removeClass('on').children('input').prop('checked', false);
			else _this.addClass('on').children('input').prop('checked', true);
			
			if(_for == 'join_ag_all'){
				/*
					조건처리합니다.
					no_click, self_chk는 전체체크 nono
				*/
				$.each(all_label, function(i){
					_this = $(this),
					_thisClass = _this.parents('dt').attr('class');
	
					if($.inArray(_thisClass, _ck_text) == -1){
						if(_has) _this.removeClass('on').children('input').prop('checked', false);
						else _this.addClass('on').children('input').prop('checked', true);						
					} 
				});			
			}
	
			if(_pasClass == '1'){
				if(_this.parent('.ck_box').length){
					//브랜드 선택
					var _prt = _this.parent('.ck_box'),
						_label_lg = _prt.find('label').length,
						_on_lg = _prt.find('.on').length;
	
					if(_label_lg == _on_lg) _prt.prev('label').addClass('on').children('input').prop('checked', true);
					else _prt.prev('label').removeClass('on').children('input').prop('checked', false);
				}else{
					//타이틀 선택
					var _next_label = _this.next('.ck_box').find('label');
	
					if(_this.hasClass('on')) _next_label.addClass('on').children('input').prop('checked', true);					
					else _next_label.removeClass('on').children('input').prop('checked', false);				
				}	
				return false;
			}
	
			if(_for != 'join_ag_all'){//전체선택
				var on_lg = function(){
								var each_num = 0;
								agree_list.find('dt').each(function(i){
									_this = $(this),
									_thisClass = _this.attr('class');
									if($.inArray(_thisClass,_ck_text) == -1 && _this.children('.on').length == 1) each_num++;	
								});
								return each_num;
							},
					self_chk_lg = agree_list.find('dt.self_chk label').length,
					no_click_lg = agree_list.find('dt.no_click label').length,
					total_lg = on_lg()+no_click_lg+self_chk_lg;
				
				if(ck_lg == total_lg ) agree_list.find('dd.l label').addClass('on').children('input').prop('checked', true);
				else agree_list.find('dd.l label').removeClass('on').children('input').prop('checked', false);	
			}
	
			return false;
		});
		//아코디언
		agree_list.find('dl dt').on('click',function(e){		
			if($(this).hasClass('no_click')) return false;		
			if((e.target.tagName).toLowerCase() == 'dt'){
				_this = $(this);
				if(_this.hasClass('on')) _this.removeClass('on').next().hide();
				else _this.addClass('on').next().show();			
			}
		});
	
		//초기에 체크된건지 체크
		$.each(agree_list.find('input'), function(i){
			var _this = $(this);
			if(_this.is(':checked')) _this.parent('label').addClass('on');
		});
	});
</script>
<script>
	$(function(){

		var $dataForm = $("#dataForm");

		// 필수 동의 체크 여부
		goCheck = function()
	    {
	        if(!$("#join_ag_0").is(':checked')){
	            alert("기업회원약관에 동의해주세요.");
	            $("#join_ag_0").focus();
	            return;
	        }
	        
	        if(!$("#join_ag_1").is(':checked')){
	            alert("기업정보 취급방침에 동의해주세요.");
	            $("#join_ag_1").focus();
	            return;
	        }
	        
	        $dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemBusinessStep3.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	 	// 취소 클릭 이벤트
	    goCancel = function(){
	 		if(confirm("회원가입을 취소하시겠습니까?")){
	 			location.href = "<c:out value="${frontDomain }"/>/pc/main/index.do";	 			
	 		}
	    };
	    
	});
</script>
</body>
</html>