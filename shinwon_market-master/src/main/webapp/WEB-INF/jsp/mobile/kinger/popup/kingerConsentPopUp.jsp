<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-king">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>활동 동의서 제출</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .king_mission S -->
		<section class="king_mission">
			
			<dl class="mission_qNa">
				<dt><strong>KINGER 기본 의무</strong></dt>
				<dd class="tx_ex">
					<span>마켓플랜트의 KINGER로서 미션에 따라 성실하고 책임감 있게 활동해 주셔야 합니다.</span>
					<span>KINGER 활동 중, 개인적 사유로 미션 수행이 어려울 경우 미리 담당자에게 내용을 알려야 합니다.</span>
					<span>KINGER는 상품에 대한 객관적인 리뷰를 하는 책임을 가지며, 상품에 대한 장점과 단점을 정직하게 작성해야 합니다.</span>
					<span>상품수취 이후 별도의 협의 없이 미션을 불이행할 경우, 상품회수(반납)의 요청이 가해지며 모든 이벤트와 KINGER 당첨자에서 제외 될 수 있습니다.</span>
				</dd>
				<dt><strong>KINGER 콘텐츠 작성의 의무</strong></dt>
				<dd class="tx_ex">
					<span>KINGER로서 작성해 주신 리뷰 및 콘텐츠(닉네임, 아이디, 사진, 동영상, 파일, 기타의 콘텐츠)는 전자랜드 온/오프라인 채널을 통한 광고 및 홍보 목적으로 사용될 수 있습니다.</span>
					<span>타인이 작성한 리뷰 또는 사진의 무단 도용 시, 모든 책임은 본인에게 있으며 미션 불이행으로 간주되며 패널티가 주어집니다.</span>
					<span>위 조항에 대하여 타인의 저작권, 상표권, 퍼블리시티권, 인격권, 프라이버시권, 도덕권 등에 대한 개인 혹은 법적 주체의 권리 및 각종 법규를 위반하는 사실이 발생하지 아니함을 보장하며, 모든 책임은 본인에게 있습니다.</span>
					<span>악의적으로 보이는 부정적인 리뷰는 작성자에게 통보 없이 삭제될 수 있습니다.</span>
				</dd>
				<dt><strong>체험 상품 제공의 조건</strong></dt>
				<dd class="tx_ex">
					<span>미션은 반드시 공지된 기간 내에 완료해 주셔야 하며, 미션 불이행시 상품회수(반납)을 요청할 수 있습니다.</span>
					<span>마켓플랜트 고객체험단 선정 이후, KINGER 활동 동의서를 제출하신 회원에 한해서만 상품이 발송됩니다.</span>
					<span>체험상품 판매행위 적발 시, 회원탈퇴 조치 및 상품 회수 처리됩니다.</span>
				</dd>
			</dl>
			<div class="btn_box">
				<label for="" class="inp_chk">	
					<input type="checkbox" name="inp_chk_consent" id="inp_chk_consent" />
					<span>본인은 위의 마켓플랜트 고객체험단 활동에 대한 내용을 확실히 숙지하였으며, 이에 동의합니다.</span>
				</label>
				<a href="javascript:goSend();" class="btn_red"><strong>활동 동의서 제출</strong></a>
			</div>
		</section>
		<!--// .king_mission E -->

			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script type="text/javascript">

	goSend				= function(){
		var check	= $("input:checkbox[id='inp_chk_consent']").is(":checked"); 
		if(check){
			$.ajax({
				async : false,
				type : "POST",
				data : {"EXP_MST_CD" : "<c:out value="${commandMap.EXP_MST_CD}" />"},
				url	: "<c:out value="${mobileDomain}" />/mobile/kinger/kingerConsentSendAjax.do",
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
	};
</script>