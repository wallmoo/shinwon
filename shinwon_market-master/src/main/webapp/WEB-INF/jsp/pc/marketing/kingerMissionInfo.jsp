<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${empty commandMap.EXP_MST_CD}">
		<script type="text/javascript">
			alert("잘못된 접속입니다.");
			history.back();
		</script>						
	</c:when>
</c:choose>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-kinger">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->


			<!-- .king_sub S -->
			<section class="king_sub king_consent">
				<!-- .king_hd S -->
				<div class="king_hd">
					<h2 class="logo_kinger"><a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do"><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/logo_kinger.png" alt="KINGER 마켓플랜트 프리미엄 1% 고객 체험단. 킹저" /></a></h2>
				</div>
				<!--// .king_hd E -->
				
				<!-- .king_con S -->
				<div class="king_con">
					<h2 class="con_ti">
						<strong class="ir">KINGER 미션 확인</strong>
						<a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do" class="btn_close"><span class="ir">이전 페이지로</span></a>
					</h2/>
					
					<!-- .king_pross S -->
					<div class="king_pross">
						<strong class="ti">Kinger 활동 프로세스 </strong>
						<ol>
							<li class="li_1">
								<strong>동의서 제출</strong>
								<i class="ico_at"></i>
							</li>
							<li class="li_2">
								<strong>당첨 확인</strong>
								<i class="ico_at"></i>
							</li>
							<li class="li_3">
								<strong>상품 체험</strong>
								<i class="ico_at"></i>
							</li>
							<li class="li_4">
								<strong>블로그 리뷰 2개 작성</strong>
								<i class="ico_at"></i>
							</li>
							<li class="li_5">
								<strong>킹저 리뷰 2개 작성</strong>
								<i class="ico_at"></i>
							</li>
							<li class="li_6">
								<strong>미션 완료</strong>
							</li>
						</ol>
					</div>
					<!-- .king_pross E -->
					<dl class="tx_consent">
						<dt>Kinger(킹저)란?</dt>
						<dd class="dd_1">
							<p>킹저는 마켓플랜트의 고객체험단으로써, 상품을 직접 사용해 보고 리얼한 리뷰를 제공해 주는 프리미엄 체험단입니다. <br/>
								마켓플랜트에서 소개하고 싶은 기능과 디자인이 뛰어난 상품을 선정하여 킹저를 모집하며, 킹저님들의 상품에 대한 솔!직!한 리뷰를 통해 마켓플랜트 회원님들이 좀 더 현명하게 구매하실 수 있도록 도움을 드리고자 합니다.<br/>
								킹저는 언제나 공정한 심사로 선정되며, 킹저로 정성껏 활동해 주시는 모든 킹저님들께는 활동포인트 1,000포인트를 드립니다. <br/>(10,000 포인트를 적립하시면, 1,000 마일리지로 전환하여 사용하실 수 있습니다.) 또한 베스트 리뷰로 채택이 되시면, 백화점 상품권을 감사의 의미로 선물드립니다.
							</p>
						</dd>
						<dt>무엇을?</dt>
						<dd class="dd_2">
							<p>
								<strong>(1) 활동 기간 내에 <em>킹저님의 블로그에 체험리뷰 2개를 작성</em>해 주세요.</strong>
								<span class="tx_ex">* 리뷰는 반드시 ‘전체공개’ 해주세요.</span>
							</p>
							<p class="l">
								<strong>(2) 마켓플랜트 <em>쇼핑몰 킹저 리뷰에 2개의 리뷰를 작성</em>해 주세요.</strong>
								<span class="tx_ex">* 위에 킹저님의 블로그 내용과 동일한 내용이며, HTML소스를 복사하여 입력해 주시면 됩니다.</span>
							</p>
						</dd>
						<dt>어떻게?</dt>
						<dd class="dd_3">
							<p>
								<span><i>(1)</i> 먼저 킹저님의 블로그에 리뷰 2개 작성을 완료합니다.</span>
								<span><i>(2)</i> 마켓플랜트 킹저 리뷰에 킹저님의 블로그에 작성한 내용을 HTML 소스 복사하여 붙여 넣습니다.</span>
								<span><i>(3)</i> 자동으로 반영된 리뷰 내용에서 동영상, 네이버 이모티콘(스티커) 부분은 삭제합니다. (해당 내용은 킹저 리뷰에 <br/> 업로드 되지 않습니다. 엑박(X)이 뜰 수 있으니 꼭~! 기억해주세요.)</span>
								<span><i>(4)</i> 제목은 리뷰의 제목과 동일하게 입력합니다.</span>
								<span><i>(5)</i> [미리보기] 버튼을 통해 내용이 잘 입력되었는지 확인하시고, 저장해 주세요.</span>
								<span><i>(6)</i> 킹저 리뷰등록 완료~! (베테랑 블로거님들이니 아주 쉽게 작성하실 수 있으리라 믿습니다.)</span>
							</p>
						</dd>
					</dl>
					
					<div class="tx_memo">
						“미션 완료 후 BEST KINGER로 선정되시면, 백화점 상품권을 선물로 드립니다.”<br/>
						(킹저 당첨자 발표페이지에서 확인)<br/>
						또한 BEST KINGER로 선정되시면, 다른 킹저 모집에서도 당첨 우선권이 주어집니다.
						<i class="ico_memo"></i>
					</div>
					
					<div class="btn_box">
						<c:choose>
							<c:when test="${info.EXP_ETR_AGR_YN eq 'Y' }">
								<a href="javascript:alert('이미 동의서를 제출 하셧습니다.');" class="btn_bl_k"><strong>KINGER 동의서 제출 완료</strong></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" class="btn_bl_k" id="sendBtn"><strong>KINGER 동의서 제출하기</strong></a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- .king_con E -->

			</section>
			<!--// .king_sub E -->
			
			<!-- #laypop S -->
			<div id="laypopKinger" class="laypop">
				<!-- [0] 장바구니 -->
				<ul class="laypop_con king_consent_pop">
					<li class="pop_con_d">
						<div class="contents"><!-- .contents S -->
							<h1><strong class="ir">Kinger 활동 동의서</strong></h1>
							<dl class="consent_list">
								<dt><strong>Kinger 기본 의무</strong><i class="ico_consent_0"></i></dt>
								<dd>
									<p>
										<span><i>-</i> 마켓플랜트의 KINGER로서 미션에 따라 성실하고 책임감 있게 활동해 주셔야 합니다.</span>
										<span><i>-</i> KINGER 활동 중, 개인적 사유로 미션 수행이 어려울 경우 미리 담당자에게 내용을 알려야 합니다.</span>
										<span><i>-</i> KINGER는 상품에 대한 객관적인 리뷰를 하는 책임을 가지며, 상품에 대한 장점과 단점을 정직하게<br/>    
										  작성해야 합니다.</span>
										<span><i>-</i> 상품수취 이후 별도의 협의 없이 미션을 불이행할 경우, 상품회수(반납)의 요청이 가해지며 모든<br/> 
										  이벤트와 KINGER 당첨자에서 제외 될 수 있습니다.</span>
									</p>
								</dd>
								<dt><strong>Kinger 콘텐츠 작성의 의무</strong><i class="ico_consent_1"></i></dt>
								<dd>
									<p>
										<span><i>-</i> KINGER로서 작성해 주신 리뷰 및 콘텐츠(닉네임, 아이디, 사진, 동영상, 파일, 기타의 콘텐츠)는 <br/>
										  마켓플랜트 온/오프라인 채널을 통한 광고 및 홍보 목적으로 사용될 수 있습니다.</span>
										<span><i>-</i> 타인이 작성한 리뷰 또는 사진의 무단 도용 시, 모든 책임은 본인에게 있으며 미션 불이행으로<br/> 
										  간주되며 패널티가 주어집니다.</span>
										<span><i>-</i> 위 조항에 대하여 타인의 저작권, 상표권, 퍼블리시티권, 인격권, 프라이버시권, 도덕권 등에 대한 개인<br/> 
										  혹은 법적 주체의 권리 및 각종 법규를 위반하는 사실이 발생하지 아니함을 보장하며, 모든 책임은 <br/>
										  본인에게 있습니다.</span>
										<span><i>-</i> 악의적으로 보이는 부정적인 리뷰는 작성자에게 통보 없이 삭제될 수 있습니다.</span>

									</p>
								</dd>
								<dt><strong>체험 제품의 제공 조건</strong><i class="ico_consent_2"></i></dt>
								<dd>
									<p>
										<span><i>-</i> 미션은 반드시 공지된 기간 내에 완료해 z주시고, 미션 불이행 시 제품 반납을 <br/>  
										요청할 수 있습니다.</span>
										<span><i>-</i> 마켓플랜트 체험단 KINGER 활동 동의서를 제출하신 회원에 한해서만 <br/>
										  체험제품이 발송 됩니다.
										</span>
										<span><i>-</i> 체험상품 판매행위 적발 시, 회원탈퇴조치 및 상품회수 처리됩니다.
										</span>
									</p>
								</dd>
							</dl>
							<div class="tx_ck">
								<label for="inp_chk_consent" class="inp_checkbox js-checkbox">
									<input type="checkbox" name="inp_chk_consent" id="inp_chk_consent" />
									<span>본인은 위의 마켓플랜트 고객체험단 활동에 대한 내용을 확실히 숙지하였으며, 이에 동의합니다.</span>
								</label>
							</div>
							<div class="btn_box">
								<a href="javascript:goConsent();" class="btn_bl_k"><strong>Kinger 동의서 제출</strong></a>
							</div>

						</div><!--// .contents E -->
					</li>
				</ul>
			</div>
			<!--// #laypop E -->
			<!--// 팝업-->
			
			
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
		$(document).on("click", "#sendBtn", function(){
			<c:choose>
				<c:when test="${empty commandMap.MEM_MST_MEM_ID}">
					if(confirm("로그인 후 동의서를 제출하실 수 있습니다.")){
						var url = location.href;
				    	url = encodeURIComponent(url);
						window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
					}
				</c:when>
				<c:when test="${icnt == 0}">
					alert("KINGER 당첨자 발표 후에 확인 해 주세요.");
				</c:when>
				<c:when test="${empty info}">
					alert("KINGER 당첨 여부를확인해주세요\nKINGER 당첨자의 동의서를 받고 있습니다.");
				</c:when>
				<c:otherwise>
					//window.open("<c:out value="${frontDomain}"/>/pc/marketing/popup/kingerConsentPopUp.do?EXP_MST_CD=<c:out value="${commandMap.EXP_MST_CD}" />", "consent", "width=536px, height=768px");
					com.laypop('show', 0, 'laypopKinger');
				</c:otherwise>
			</c:choose>	
		});
		
		goConsent		= function(){
			var check	= $("input:checkbox[id='inp_chk_consent']").is(":checked"); 
			if(check){
				$.ajax({
					async : false,
					type : "POST",
					data : {"EXP_MST_CD" : "<c:out value="${commandMap.EXP_MST_CD}" />"},
					url	: "<c:out value="${frontDomain}" />/pc/marketing/kingerConsentSendAjax.do",
					success : function(data) {
						alert(data.strResultMsg);
						com.laypop('hide', 0, 'laypopKinger');
					},
					error : function(err) {
						//alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery
								|| console
										.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}else{
				alert("동의 하셔야 합니다.");
				$("#inp_chk_consent").focus();
				return;
			}
		};
		
	</script>
</section>
<!--// #wrap E -->
</body>
</html>

<script>

//test할려고 뛰웠습니다.
$(document).ready(function(){
	//setTimeout(function(){
	//	com.laypop('show', 0);
	//}, 1000);	
});
</script>