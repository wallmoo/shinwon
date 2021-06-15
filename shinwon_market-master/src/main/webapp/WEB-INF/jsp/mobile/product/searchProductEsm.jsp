<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<form id="frm" name="frm">
		<double-submit:preventer/>
		<article id="container" class="container" data-role="content">
	
			<!-- .section-title S -->
			<div class="section-title section-title_v2 _hd_fix">
				<h2>할인해주세요</h2>
				<a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
			</div>
			<!--// .section-title E -->
			
			<!-- .md_bargain S -->
			<section class="md_bargain">
				<div class="tx_msg_box">
					<div class="tx_msg">				
						<p class="blind">고객님만의 특별하고, 합리적인 가격</p>
					</div>
				</div>
				<dl>
					<dt class="pr_info">
						<div>
							<img src="<c:out value="${cdnDomain}" /><c:out value="${productInfo.PRD_IMAGE }" />" alt="<c:out value="${productInfo.PRD_IMAGE_ALT }" />" />
							<span class="pr_ti"><c:out value="${productInfo.PRD_MST_NM }" /></span>
							<c:if test="${not empty addOptDtlList }">
								<span class="pr_opt">
									<c:forEach var="addOptDtlList" items="${addOptDtlList }" varStatus="status">
										<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" />
										<input type="hidden" name="REQUEST_CNT" id="REQUEST_CNT" value="<c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />" />
										<c:out value="${addOptDtlList.OPT_DTL_ADD_PRC_NM }" /> / 수량 : <c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />개
									</c:forEach>
								</span>
							</c:if>
							<c:if test="${productInfo.PRD_MST_ERP_PRC > 0 }">
								<span class="pr_sel_prc"><em ><fmt:formatNumber value="${productInfo.PRD_MST_ERP_PRC }" groupingUsed="true" /></em><span class="tx_won">원</span></span>
							</c:if>
							<strong class="pr_prc"><strong><fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" /></strong><span class="tx_won">원</span></strong>
						</div>
						<p class="tx_exc">
							<strong><i class="ico_exc">!</i>가격흥정 상품은 MYLAND > 쇼핑활동 > 나의 견적신청 내역에서 
							확인하여 바로 주문하실 수 있습니다. </strong>
						</p>
					</dt>
					<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }" />" />
					<input type="hidden" name="ESM_MST_MEM_ID" id="ESM_MST_MEM_ID" value="<c:out value="${sessionUser.MEM_MST_MEM_ID }"/>" />
					<input type="hidden" name="ESM_MST_TYPE" id="ESM_MST_TYPE" value="2289" />
					<input type="hidden" name="ESM_MST_QST_TYPE" id="ESM_MST_QST_TYPE" value="1925" />
					<input type="hidden" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="<c:out value="${productInfo.PRD_MST_PRC }"/>" />
					<input type="hidden" name="ESM_MST_ADV_TYPE" id="ESM_MST_ADV_TYPE" value="1932" />
					<input type="hidden" name="ESM_MST_OPN_YN" id="ESM_MST_OPN_YN" value="N" />
					<input type="hidden" name="ESM_MST_USE_YN" id="ESM_MST_USE_YN" value="Y" />
					<input type="hidden" name="ESM_MST_PRD_CHANGE_YN" id="ESM_MST_PRD_CHANGE_YN" value="N" />
					<dd class="dd_form">
						<table>
							<caption>MD와 사격흥정하기에 이름, 휴대폰번호, 이메일, 문의내용, 구매의망가로 구성된 표</caption>
							<colgroup>
							<col style="width:100px" />
							<col />
							</colgroup>
							<tbody>
								<tr class="tr_name">
									<th>
										<label for="ESM_MST_MEM_NM">
											<strong class="ti">이름</strong><i class="co_red">*</i>
										</label>
									</th>
									<td>
										<input type="text" name="ESM_MST_MEM_NM" id="ESM_MST_MEM_NM" value="<c:out value="${sessionUser.MEM_MST_MEM_NM }"/>" />
									</td>
								</tr>
								<tr class="tr_tel">
									<th><strong class="ti">휴대폰 번호</strong><i class="co_red">*</i></th>
									<td>
										<div>
											<div class="sel_box">
												<label for="ESM_MST_HP1">
													<span class="blind">휴대폰번호 앞에 3자리</span>
													<select id="ESM_MST_HP1" name="ESM_MST_HP1">
														<option value="">선택</option>
														<c:if test="${not empty codes.HP_CODE }">
								                            <c:forEach var="hpRow" items="${codes.HP_CODE }">
								                            	<option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <ui:select v="${memberInfo.MEM_MST_HP1}" t="${hpRow.CMN_COM_NM }" g="selected"/>><c:out value="${hpRow.CMN_COM_NM }"/></option>
							                            	</c:forEach>
							                            </c:if>
													</select>
												</label>
											</div>
											<span class="ico-1">-</span>
											<label for="ESM_MST_HP2">
												<span class="blind">휴대폰번호 중간 4자리</span>
												<input type="number" id="ESM_MST_HP2" name="ESM_MST_HP2" maxlength="4" value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>" />
											</label>
											<span class="ico-2">-</span>
											<label for="ESM_MST_HP3">
												<span class="blind">휴대폰번호 마지막 4자리</span>
												<input type="number" id="ESM_MST_HP3" name="ESM_MST_HP3" maxlength="4" value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>" />
											</label>
										</div>
									</td>
								</tr>
								<tr class="tr_email">
									<th><strong class="ti">이메일</strong><i class="co_red">*</i></th>
									<td>
										<div class="email_d">
											<label for="ESM_MST_MAIL_ID" class="inp_email_0">
												<span class="blind">이메일 아이디</span>
												<input type="text" id="ESM_MST_MAIL_ID" name="ESM_MST_MAIL_ID" class="text" title="이메일 아이디" maxlength="20" data-err_msg_id="memEmailId" />
											</label>
											<span>@</span>
											<label for="ESM_MST_MAIL_DOMAIN" class="inp_email_1">
												<span class="blind">이메일 도메인</span>
												<input type="text" title="이메일 도메인" id="ESM_MST_MAIL_DOMAIN" name="ESM_MST_MAIL_DOMAIN" data-err_msg_id="memEmailDomain" />
											</label>
											<div class="sel_box">
												<label for="emailDomainSelectbox" class="inp_email_2">
													<span class="blind">이메일 도메인 옵션</span>
													<select id="emailDomainSelectbox">
														<option value="">직접입력</option>
														<c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
								                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
								                            	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
							                            	</c:forEach>
							                            </c:if>
													</select>
												</label>
												<input type="hidden" id="ESM_MST_MAIL" name="ESM_MST_MAIL"/>
											</div>
										</div>
										<div class="re_mail">
											<fieldset data-role="controlgroup">
												<input type="checkbox" name="ESM_MST_MAIL_SEND_YN" id="ESM_MST_MAIL_SEND_YN" value="Y">
												<label for="ESM_MST_MAIL_SEND_YN">답변 이메일로 받기 </label>
											</fieldset>
											<span class="tx_ex"><i class="ico_exc">!</i>‘답변 이메일로 받기’를 선택하시면 기재하신 이메일 로 견적 신청 결과를 빠르게 받아 보실 수 있습니다.</span>
										</div>
									</td>
								</tr>
								<tr class="tr_msg">
									<th><strong class="ti">문의내용</strong></th>
									<td>
										<div>
											<textarea placeholder="요청사항이나 문의사항이 있으신 경우 기재해주세요." name="ESM_MST_QST" id="ESM_MST_QST"></textarea>
										</div>
									</td>
								</tr>
								<tr class="tr_price">
									<td colspan="2">
										<p>
											<strong class="ti">필수입력</strong><i class="co_red">*</i>
										</p>
										<label for="">
											<strong>구매희망가</strong>
											<input type="number" name="ESM_MST_WSH_TOT_PRICE" id="ESM_MST_WSH_TOT_PRICE" />
											<strong>원</strong>
											<span class="tx_ex">원하는 금액을 입력해주세요.</span>
										</label>
										
									</td>
								</tr>
							</tbody>
						</table>
					</dd>
					<dd class="btn_box">
						<a href="javascript:void(0)" id="goRegist" class="btn_red"><strong>신청하기</strong></a>
						<a href="javascript:void(0);" class="btn_gre back"><strong>취소</strong></a>
					</dd>
				</dl>
			</section>
			<!--// .md_bargain E -->
		</article>
		</form>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script type="text/javascript">
$(function(){
	
	var $frm = $("#frm");
	
	// 폼체크
    $frm.validate(
    {
        rules: 
        {
        	ESM_MST_MEM_NM:{required:true}, // 이름
	        ESM_MST_HP1:{required:true, number:true},	// 핸드폰번호 앞자리
	        ESM_MST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
	        ESM_MST_HP3:{required:true, number:true, minlength:4 , maxlength:4} // 핸드폰번호 뒷자리
        },
        messages :
        {
        	ESM_MST_MEM_NM: {required:"[이름은]는 필수 정보입니다."},
        	ESM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
        	ESM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
        	ESM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."}
        }
        //,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
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
	
	//등록
    $(document).on("click", "#goRegist", function () {
    	var $frm = $("#frm");
    	if($frm.valid()){
    		
    		if($.trim($("#ESM_MST_MAIL_ID").val()) == ""){
				alert("이메일 아이디을 입력해주세요.");
				$("#ESM_MST_MAIL_ID").focus();
				return;
			}
	    	
	    	if($.trim($("#ESM_MST_MAIL_DOMAIN").val()) == ""){
				alert("이메일 도메인을 입력해주세요.");
				$("#ESM_MST_MAIL_DOMAIN").focus();
				return;
			}
    		if($.trim($("#ESM_MST_MAIL_ID").val()) != "" && $.trim($("#ESM_MST_MAIL_DOMAIN").val()) != ""){
        		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        		//이메일 주소 
    	    	$("#ESM_MST_MAIL").val($("#ESM_MST_MAIL_ID").val()+"@"+$("#ESM_MST_MAIL_DOMAIN").val());
    	    	
    	    	if(!regEmail.test($("#ESM_MST_MAIL").val())) {
    	            alert('이메일 주소가 유효하지 않습니다');
    	            $("#ESM_MST_MAIL_DOMAIN").focus();
    	            return false;
    	        }
        	}
	    	
	    	if($("#ESM_MST_WSH_TOT_PRICE").val() == ""){
	    		alert("구매 희망가를 입력해주세요.");
	    		return;
	    	}
	    	
	    	if(confirm("신청하시겠습니까?"))
	       	{
	       		$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/esmProductRegist.do", "target":"_self", "method":"post"}).submit();
	       	}
    	}
    });
	
 	// 이메일 도메인 select box 변경 이벤트
    $(document).on("change", "#emailDomainSelectbox", function () 
    {
        var $domain = $("#ESM_MST_MAIL_DOMAIN");

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
	
}); //function

</script>
</body>
</html>