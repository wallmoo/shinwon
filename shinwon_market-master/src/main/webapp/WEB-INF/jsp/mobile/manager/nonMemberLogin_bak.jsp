<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login"><!-- page class : page-login -->
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
	            <h2>비회원 구매/주문조회</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .noMem_inq S -->
			<section class="noMem_inq">
				<form name="nonMemberForm" id="nonMemberForm">
			    	<input type="hidden" name="pageType" id="pageType" value="nonMember"/> 
			        <input type="hidden" name="ROLE_USER" value="order_guest" />
			        <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url }"/>"/>
					<dl>
						<dt><h3>비회원 주문조회</h3></dt>
						<dd class="dd_inq">
							<fieldset data-role="controlgroup">
								<input type="text" name="ORD_MST_ORD_NM" id="ORD_MST_ORD_NM" placeholder="주문자명" maxlength="15"/>
								<label for="ORD_MST_ORD_NM">주문자명</label>
								<input type="text" name="ORD_MST_CD" id="ORD_MST_CD" placeholder="주문번호" maxlength="15"/>
								<label for="ORD_MST_CD">주문번호</label>
							</fieldset>
							<a href="javascript:goGuestDelivery();" class="btn_red btn_inq"><strong>비회원 주문조회</strong></a>
							<p class="tx_ex">
								<span><i class="ico_exc">!</i>비회원 구매시 입력했던 주문자명과 주문번호를 입력해주세요.</span>
								<span><i class="ico_exc">!</i>주문번호는 구매자의 휴대폰 또는 이메일을 확인해주세요.</span>
							</p>
						</dd>
		
						<dt><h3>비회원 구매하기</h3></dt>
						<dd class="dd_pur">
							<strong class="tx_ti">비회원 개인정보 보호를 위한 이용자 동의</strong>
							<div class="persInfo_box">
								<pre>마켓플랜트 쇼핑몰 비회원 개인정보 수집ㆍ이용 동의

1. 개인정보 수집 및 이용목적
① 주문정보 확인 등
② 배송을 위한 배송지 확인 등
③ 대금 결제 서비스 제공 등
④ 고지의 전달, 불만처리, 서비스 정보 안내 등
⑤ 맞춤정보 제공 및 통계 분석 등

2. 개인정보 수집항목
① 필수정보 : 주문자 이름, 주문자 휴대폰번호, 주문자 이메일, 수취인 성명, 수취인 휴대폰번호, 수취인주소
② 선택정보 : 수취인 전화번호, 배송 요청사항
③ 결제정보 : 은행계좌정보, 신용카드정보, 휴대폰가입정보, 거래정보, 현금영수증 발행 여부
④ 추가 수집항목 : IP주소, 서비스 이용기록, 접속 로그, 쿠키

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

※ 비회원 주문 시 제공하신 개인정보는 상기 내용을 위하여 활용되며, 보다 자세한 내용은 『개인정보 취급방침』을 확인하여 주시기 바랍니다.
</pre>
							</div>
							
							<div class="chk_st0">
								<fieldset data-role="controlgroup">
									<input type="checkbox" name="nonMemAgr_1" id="nonMemAgr_1">
									<label for="nonMemAgr_1">위 내용에 동의합니다.</label>
									<input type="checkbox" name="nonMemAgr_2" id="nonMemAgr_2">
									<label for="nonMemAgr_2">만 14세 이상 입니다.</label>
								</fieldset>
								<a href="javascript:goGuestBuy();" class="btn_red btn_pur"><strong>비회원 구매하기</strong></a>
							</div>
		
							<p class="tx_ex">
								<span><i class="ico_exc">!</i>마켓플랜트 회원가입으로 다양한 혜택을 즐겨보세요.</span>
							</p>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain }"/>/mobile/member/joinMemType.do','_self');" class="_pg_link btn_cc_l btn_join"><strong>회원가입</strong></a>
						</dd>
						
						<dd class="dd_banner">
							<c:if test="${not empty nonLoginBannerList }">
								<c:forEach var="nonLoginBannerRow" items="${nonLoginBannerList }" varStatus="i">	
									<c:choose>
										<c:when test="${nonLoginBannerRow.BNR_MST_TGT eq 'D' }">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${nonLoginBannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${nonLoginBannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${nonLoginBannerRow.CMN_FLE_ALT_TXT}" />" />
										</c:when>
										<c:otherwise>
											<a href="<c:out value="${nonLoginBannerRow.BNR_MST_URL}" />" target="<c:out value="${nonLoginBannerRow.BNR_MST_TGT_TARGET}" />">
												<img src="<c:out value="${cdnDomain}" /><c:out value="${nonLoginBannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${nonLoginBannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${nonLoginBannerRow.CMN_FLE_ALT_TXT}" />" />
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</dd>
					</dl>
				</form>
			</section>
			<!--// .noMem_inq E -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){

	// 폼체크
    $("#nonMemberForm").validate({
        rules: {
            ORD_MST_CD:{required:true}, // 주문번호
            ORD_MST_ORD_NM:{required:true} // 주문자명
        },
        messages :{
            ORD_MST_CD : {required:"주문번호를 입력해주세요."},
            ORD_MST_ORD_NM : {required:"주문자명을 입력해주세요."}
        }
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
   	   }
    });

    // 비회원 구매하기
    goGuestBuy = function(){
    	
    	if(!$("#nonMemAgr_1").is(":checked")){
    		alert("위 내용에 동의해주시기 바랍니다.");
    		return;
    	}
    	
    	if(!$("#nonMemAgr_2").is(":checked")){
    		alert("만 14세 이상에 체크해주시기 바랍니다.");
    		return;
    	}
    	
    	var ORD_MST_CD = decodeURIComponent($("input[name=url]").val()).split("?ORD_MST_CD=")[1];
    	if(ORD_MST_CD === undefined){
    		ORD_MST_CD = "${commandMap.ORD_MST_CD}";
    	}
   		$('#_blank_form').attr({'action':'<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do?ORD_MST_CD='+ORD_MST_CD,"target":"_self", 'method':'post'}).submit();
    };
});

//비회원 주문조회
function goGuestDelivery () 
{
    var $nonMemberForm = $("#nonMemberForm");
    
    if($nonMemberForm.valid())
    {
    	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
    	
        $nonMemberForm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
        return false;
    }
};
//]]>
</script>
</body>
</html>