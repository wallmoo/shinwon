
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">	
	<!-- #container S -->
	<article id="container" class="container king_consent_pop">
		<div class="contents"><!-- .contents S -->
			<h1>KINGER 동의서</h1>
			<dl class="consent_list">
				<dt><strong>일반사항</strong></dt>
				<dd>
					<p>KINGER로써 미션에 따라 성실하고 책임감 있게 활동해 주셔야 합니다.<br/>
						미션 불이행 시 향후 마켓플랜트의 모든 이벤트와 KINGER 체험에서 제외됩니다.<br/>
						KINGER 활동 중, 개인적 사유로 진행이 어려울 경우 담당자에게 미리 연락을 해야 합니다.</p>
				</dd>
				<dt><strong>활동 가이드라인</strong></dt>
				<dd>
					<p>
						<span><i>-</i> 타인이 작성한 리뷰 또는 사진 무단 도용 시, 패널티가 주어집니다.</span>
						<span class="co_red"><i>-</i> KINGER로써 작성해 주신 리뷰 및 컨텐츠(닉네임, 아이디, 사진, 동영상, 파일, 기타<br/> 
						  이와 유사한 컨텐츠)가 마켓플랜트 제품의 광고 및 홍보용으로 사용 될 수 <br/>
						  있습니다.
						</span>
						<span><i>-</i> 위 조항에 대하여 타인의 저작권, 상표권, 퍼블리시티권, 인격권(PERSONA), <br/>
						  프라이버시권, 도덕권, 기타 개인 혹은 각종 법적 주체의 일체의 권리 및 각종 법규를 <br/>
						  위한하는 사실이 발생하지 아니함을 보장합니다.
						</span>
					</p>
				</dd>
				<dt><strong>체험 제품의 제공 조건</strong></dt>
				<dd>
					<p>
						<span><i>-</i> 미션은 반드시 공지된 기간 내에 완료해 z주시고, 미션 불이행 시 제품 반납을 <br/>  
						요청할 수 있습니다.</span>
						<span class="co_red"><i>-</i> 마켓플랜트 체험단 KINGER 활동 동의서를 제출하신 회원에 한해서만 <br/>
						  체험제품이 발송 됩니다.
						</span>
						<span><i>-</i> 체험상품 판매행위 적발 시, 회원탈퇴조치 및 상품회수 처리됩니다.<br/>
						(제품회수 관련비용 고객부담)
						</span>
					</p>
				</dd>
			</dl>
			<div class="tx_ck">
				<label for="inp_chk_consent">
					<input type="checkbox" name="inp_chk_consent" id="inp_chk_consent" />
				</label>
				<span>귀하는 마켓플랜트의 체험단 미션에 대해 다음과 같은 내용을 동의합니다.</span>
			</div>
			<div class="btn_box">
				<a href="javascript:void(0)" class="btn_bl_k"><strong>동의서 제출</strong></a>
			</div>

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<script type="text/javascript">
		$(document).on("click", ".btn_bl_k", function(){
			var check	= $("input:checkbox[id='inp_chk_consent']").is(":checked"); 
			if(check){
				$.ajax({
					async : false,
					type : "POST",
					data : {"EXP_MST_CD" : "<c:out value="${commandMap.EXP_MST_CD}" />"},
					url	: "<c:out value="${frontDomain}" />/pc/marketing/kingerConsentSendAjax.do",
					success : function(data) {
						alert(data.strResultMsg);
						self.close();
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
		});
	</script>
</section>
<!--// #wrap E -->
</body>
</html>