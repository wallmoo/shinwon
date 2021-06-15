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
			<div class="contents"><!-- .contents S -->
				<form id="dataForm" name="dataForm" method="post">
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
				<input type="hidden" name="joinType" id="joinType" value="<c:out value="${commandMap.joinType }"/>"/> 
				
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
					<dd class="tx_sub">
						<p>마켓플랜트 통합회원으로 가입하시면 마켓플랜트와<br/>
							전국 매장에서 포인트 적립 및 다양한 혜택을 받으실 수 있으며 프로모션과 이벤트 참여가 가능합니다.<br/>
							고객님의 개인정보보호를 위해 본인 확인 절차를 거쳐 회원가입을 하고 있습니다.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f"><strong><span>01</span>본인인증</strong></li>
							<li class="on"><strong><span>02</span>약관동의</strong></li>
							<li><strong><span>03</span>정보입력</strong></li>
							<li class="l "><strong><span>04</span>가입완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con agree_con"><!-- .join_con S -->
					<li class="agree_list">
						<h3>회원가입을 위해서 아래 회원약관, 개인정보취급방침, 멤버십 서비스 약관,<br/>개인정보 선택 제공에 대한 안내를 읽고 동의해주세요. </h3>
						<dl>
							<dt>
								<label for="join_ag_0">
									<input type="checkbox" name="join_ag_0" id="join_ag_0" value="Y"/>
									<span><span class="co_red">(필수)</span>마켓플랜트 쇼핑몰 회원약관에 동의합니다.</span>
								</label>
							</dt>
							<dd>
								<pre>
<strong>마켓플랜트 쇼핑몰 이용약관</strong>

<strong>제1조	(목적)</strong>
이 약관은 (주)이패스씨앤아이(전자상거래 사업자, 이하 "회사"라 한다)이 운영하는 마켓플랜트 온라인몰(이하 "몰"이라 한다)에서 제공되는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 온라인몰과 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.
※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질을 반하지 않는 한 이 약관을 준용합니다.

</pre>
							</dd>
							<dt>
								<label for="join_ag_1">
									<input type="checkbox" name="join_ag_1" id="join_ag_1" value="Y" />
									<span><span class="co_red">(필수)</span>마켓플랜트 쇼핑몰 개인정보 취급방침 약관에 동의합니다.</span>
								</label>
							</dt>
							<dd>
								<pre>
<strong>마켓플랜트 쇼핑몰 개인정보 취급방침</strong>

마켓플랜트 쇼핑몰은 회원의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보 취급방침을 수립ㆍ공개합니다. 
마켓플랜트의 개인정보 취급방침은 관련 법률 및 지침의 변경과 마켓플랜트 내부 운영방침의 변경에 따라 변경될 수 있습니다. [개인정보 취급방침]이 변경될 경우 변경사항은 마켓플랜트 쇼핑몰에 게시됩니다. 변경사항에 의문이 있으실 경우는 언제라도 담당자에게 문의하시거나 마켓플랜트 쇼핑몰을 방문하여 확인하실 수 있습니다.
마켓플랜트는 회원의 정보를 소중히 여기고, 불법적인 개인정보 유출 방지를 위해 최선의 노력을 다하겠습니다. 

</pre>
							</dd>
							<dt>
								<label for="join_ag_2">
									<input type="checkbox" name="join_ag_2" id="join_ag_2" value="Y"/>
									<span><span class="co_red">(필수)</span>마켓플랜트 멤버십 서비스 약관에 동의합니다.</span>
								</label>
							</dt>
							<dd>
								<pre><strong>마켓플랜트 멤버십카드 서비스 약관</strong>  

<strong>제 1조 (목적)</strong>
본 약관은 마켓플랜트 멤버십카드 회원이 당사가 제공하는 마켓플랜트 멤버십 카드 서비스를 이용함에 있어 마켓플랜트 멤버십카드 회원과 당사의 제반 권리, 의무 및 관련절차 등을 규정하는데 그 목적이 있습니다.  
</pre>
							</dd>
							<dt>
								<label for="join_ag_3">
									<input type="checkbox" name="join_ag_3" id="join_ag_3" value="Y"/>
									<span><span class="co_red">(필수)</span>마켓플랜트 오프라인 매장 개인정보 취급방침에 동의합니다.</span>
								</label>
							</dt>
							<dd>
								<pre>㈜이패스씨앤아이(이하 "회사"라 함)는 회원의 개인정보보호를 매우 중요시하며, 회원이 회사의 서비스 (이하 "마켓플랜트 서비스" 또는 "마켓플랜트"이라 함)를 이용함과 동시에 매장, 온라인 및 모바일 상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다. 이에 회사는 ‘개인정보보호법’, ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’등 모든 관련 법규를 준수하기 위하여 [㈜이패스씨앤아이 개인정보처리방침]을 제정하여 이를 준수하고 마켓플랜트 개인정보처리방침을 영업장에 비치하거나 홈페이지(www.epasscni.com)에 공개하여 회원이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보 보호정책을 홈페이지에 공개함으로써 회원이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 회사의 개인정보 보호정책은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인해 수시로 변경될 수 있고, 이에 따른 개인정보 보호정책의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 보호정책을 개정하는 경우 회사는 그 변경사항에 대하여 즉시 매장 안내문 또는 홈페이지를 통해서 게시하고 버전 번호 및 개정일자 등을 부여하여 개정된 사항을 회원이 쉽게 알아볼 수 있도록 하고 있습니다. 회원께서는 매장 및 사이트 방문시 수시로 확인하시기 바랍니다. 마켓플랜트의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다.   
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
				</form>
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
	            alert("회원약관에 동의해주세요.");
	            $("#join_ag_0").focus();
	            return;
	        }
	        
	        if(!$("#join_ag_1").is(':checked')){
	            alert("개인정보 취급방침에 동의해주세요.");
	            $("#join_ag_1").focus();
	            return;
	        }
	        
	        if(!$("#join_ag_2").is(':checked')){
	            alert("멤버십 서비스 약관에 동의해주세요.");
	            $("#join_ag_2").focus();
	            return;
	        }
	        
	        if(!$("#join_ag_3").is(':checked')){
	            alert("오프라인 매장 개인정보 취급방침에 동의해주세요.");
	            $("#join_ag_3").focus();
	            return;
	        }
	        
	        $dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemStep3.do", "target":"_self", "method":"post"}).submit();
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