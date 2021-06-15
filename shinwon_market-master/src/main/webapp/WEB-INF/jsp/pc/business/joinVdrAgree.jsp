<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>

<body class="page-join">

	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	
	<!-- #wrap S -->
	<section id="wrap">
		
		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		<!-- #container S -->
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">신규등록</h2>
					</div>
					
					<form id="dataForm" name="dataForm" method="post">
					<double-submit:preventer/>
					<dl class="minW counsel_ask">
						<dt><strong>개인정보 보호를 위한 이용자 동의사항</strong></dt>
						<dd class="dd_agree">
							<div class="tx_agree">
								<textarea>마켓플랜트 쇼핑몰 개인정보 수집ㆍ이용 동의

1. 개인정보 수집 및 이용목적
① 회원가입
② 입점상담 및 입점신청서 작성
③ 사업관련 의사소통 확보
④ 고지의 전달, 불만처리, 서비스 정보 안내 등
⑤ 맞춤정보 제공 및 통계 분석 등

2. 개인정보 수집항목
① 회원가입 시
- 필수정보 : 사업자등록번호, 비밀번호, 업체명, 대표자명, 사업자구분, 사업장주소, 대표 Email
- 선택정보 : 법인등록번호
② 입점 상담신청 시
- 필수정보 : 대표상품군, 담당자명, 연락처, 휴대폰번호, 담당자 이메일, 입점신청요약, 입점신청내용, 판매희망채널, 현재 유통방법
- 선택정보 : 팩스번호, 홈페이지, 비고, 상품제안서, 회사소개서, 제품인증서
③ 입점신청서 작성 시
- 필수정보 : 업체명, 대표자명, 사업자구분, 사업장주소, 세금계산서 담당 Email, 업태/업종, 전화, FAX, 은행명, 계좌번호, 예금주
- 선택정보 : 법인등록번호

3. 개인정보의 보유 및 이용기간
고객님의 개인정보는 수집목적 또는 제공받은 목적이 달성되거나, 마켓플랜트 쇼핑몰 이용약관에 표명한 절차에 따라 탈퇴를 요청한 경우, 지체없이 파기합니다. 단, 관련 법령에  명시된 아래의 사유에 해당하는 경우에는 해당 기간 종료시까지 개인정보를 보유합니다. 
① 계약 또는 청약철회 등에 관한 기록
- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조
- 보존기간 : 5년
② 대금결제 및 재화 등의 공급에 관한 기록
- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조
- 보존기간 : 5년
③ 소비자의 불만 또는 분쟁처리에 관한 기록
- 보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 시행령 제6조
- 보존기간 : 3년
④ 접속에 관한 기록보존
- 보존근거 : 통신비밀보호법 제15조의2 및 시행령 제41조
- 보존기간 : 3개월

</textarea>
							</div>
							<span class="tx_ex">위 내용에 동의하시겠습니까? </span>
							<label for="VDR_AGREE">
								<input type="checkbox" name="VDR_AGREE" id="VDR_AGREE" value="Y" />
								<span>동의합니다.</span>
							</label>
						</dd>
					</dl>
					</form>
				</section>
				<!--// .sub_lay E -->
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
		
		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
	</section>

<script>

	var $dataForm = $("#dataForm");
	
	$(function(){
		// 동의 체크박스 클릭시
	    $("#VDR_AGREE").click(function(){
	        var chk = $(this).is(":checked");
	        if(chk){
	        	$dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/joinVdrBusiness.do", "target":"_self", "method":"post"}).submit();	        	
	        } 
	    });
	});	
	
	
	
</script>
</body>
</html>