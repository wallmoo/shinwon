<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup"><!-- page-list -->
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap" class="nego_pop">	
	<!-- #container S -->
	<article id="container" class="container nego_pop">
		<header>
			<div class="blind">
				<h1>할인해주세요</h1>
				<p class="msg_box">
					<strong>담당MD에게 원하는 구매희망가를 보내주세요<br/>고객님만의 특별하고, 합리적인 가격을 선물해 드릴게요</strong>
				</p>
			</div>
		</header>
		<div class="contents"><!-- .contents S -->

			<div class="nego_con">
				
				<form id="frm" name="frm">
				<double-submit:preventer/>
				<dl class="pr_info">
					<dt>
						<strong class="blind">선택한 상품 정보</strong>
						<img src="<c:out value="${cdnDomain}" /><c:out value="${productInfo.PRD_IMAGE }" />" class="thumb198" alt="<c:out value="${productInfo.PRD_IMAGE_ALT }" />" />
					</dt>
					<dd>
						<span class="ti">
							<c:choose>
								<c:when test="${productInfo.PRD_MST_BRAND_NM ne null && productInfo.PRD_MST_CPS_MDL ne null }">
									[<c:out value="${productInfo.PRD_MST_BRAND_NM}" />/<c:out value="${productInfo.PRD_MST_CPS_MDL}" />]
								</c:when>
								<c:otherwise>
									<c:if test="${productInfo.PRD_MST_BRAND_NM ne null }">
										[<c:out value="${productInfo.PRD_MST_BRAND_NM}" />]	
									</c:if>
									<c:if test="${productInfo.PRD_MST_CPS_MDL ne null }">
										[<c:out value="${productInfo.PRD_MST_CPS_MDL}" />]	
									</c:if>
								</c:otherwise>
							</c:choose><br />
							<c:out value="${productInfo.PRD_MST_NM_ADD }" />
						</span>
						
						<c:if test="${not empty addOptDtlList }">
						<span class="tx_opt">
							<c:forEach var="addOptDtlList" items="${addOptDtlList }" varStatus="status">
								<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" />
								<input type="hidden" name="REQUEST_CNT" id="REQUEST_CNT" value="<c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />" />
								<span class="tx_opt"><c:out value="${addOptDtlList.OPT_DTL_ADD_PRC_NM }" /> / 수량 : <c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />개</span>
							</c:forEach>
						</span>
						</c:if>
						<c:if test="${productInfo.PRD_MST_ERP_PRC > 0 }">
							<span class="tx_price_w"><em><fmt:formatNumber value="${productInfo.PRD_MST_ERP_PRC }" groupingUsed="true" /></em><span class="tx_won">원</span></span>
						</c:if>
						<strong class="tx_price"><fmt:formatNumber value="${productInfo.PRD_MST_PRICE }" groupingUsed="true" /><span>원</span></strong>
					</dd>
				</dl>
				
				<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }" />" />
				<input type="hidden" name="ESM_MST_MEM_ID" id="ESM_MST_MEM_ID" value="<c:out value="${sessionUser.MEM_MST_MEM_ID }"/>" />
				<input type="hidden" name="ESM_MST_TYPE" id="ESM_MST_TYPE" value="2289" />
				<input type="hidden" name="ESM_MST_QST_TYPE" id="ESM_MST_QST_TYPE" value="1925" />
				<input type="hidden" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="<c:out value="${productInfo.PRD_MST_PRC }"/>" />
				<input type="hidden" name="ESM_MST_ADV_TYPE" id="ESM_MST_ADV_TYPE" value="1932" />
				<input type="hidden" name="ESM_MST_OPN_YN" id="ESM_MST_OPN_YN" value="N" />
				<input type="hidden" name="ESM_MST_USE_YN" id="ESM_MST_USE_YN" value="Y" />
				<input type="hidden" name="ESM_MST_PRD_CHANGE_YN" id="ESM_MST_PRD_CHANGE_YN" value="N" />
				<!-- .nogo_form S -->
				<div class="nogo_form">
					<span class="tx_ex">가격흥정 상품은 <em>마이페이지 > 쇼핑활동 > 나의 견적신청 내역</em>에서 확인하여 바로 주문하실 수 있습니다.  (<span class="co_red">*</span> 필수입력)</span>
					<table>
						<caption>상품 Q&A작성에 내용입력하는 표</caption>
						<colgroup>
						<col style="width:140px" />
						<col />
						</colgroup>
						<tfoot>
							<tr>
								<th colspan="2">
									<label for="">
										<strong class="tx_ti">구매 희망가</strong>
										<input type="text" name="ESM_MST_WSH_TOT_PRICE" id="ESM_MST_WSH_TOT_PRICE" class="number" />
										<strong class="tx_won">원</strong>
									</label>
								</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<th>
									<label for="">
										<strong>이름</strong> <span class="co_red">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="ESM_MST_MEM_NM" id="ESM_MST_MEM_NM" value="<c:out value="${sessionUser.MEM_MST_MEM_NM }"/>" />
								</td>
							</tr>
							<tr class="tr_phone">
								<th>
									<strong>휴대폰</strong> <span class="co_red">*</span>
								</th>
								<td>
									<select class="sel_chg" id="ESM_MST_HP1" name="ESM_MST_HP1" title="휴대폰 번호 앞자리">
										<option value="">선택</option>
										<c:if test="${not empty codes }">
		                                    <c:forEach var="hpRow" items="${codes }" varStatus="i">
		                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <ui:select v="${memberInfo.MEM_MST_HP1}" t="${hpRow.CMN_COM_NM }" g="selected"/>><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
									</select>
									<i class="ico">-</i>
									<label for="">
										<input type="text" id="ESM_MST_HP2" name="ESM_MST_HP2" maxlength="4" title="휴대폰 번호 중간자리" value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>" class="number" />
									</label>
									<i class="ico">-</i>
									<label for="">
										<input type="text" id="ESM_MST_HP3" name="ESM_MST_HP3" maxlength="4" title="휴대폰 번호 끝자리" value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>" class="number" />
									</label>
								</td>
							</tr>
							<tr class="tr_email">
								<th>
									<label for="">
										<strong>이메일</strong> <span class="co_red">*</span>
									</label>
								</th>
								<td>
									<input type="text" id="ESM_MST_MAIL" name="ESM_MST_MAIL" maxlength="50" data-err_msg_id="memEmail" value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>" />
									<label for="ESM_MST_MAIL_SEND_YN" class="chk_label js-checkbox">
										<input type="checkbox" name="ESM_MST_MAIL_SEND_YN" id="ESM_MST_MAIL_SEND_YN" value="Y">
										<span>답변 이메일로 받기</span>
									</label>
									<span class="tx_ex">‘답변 이메일로 받기’를 선택하시면 기재하신 이메일로 견적 신청 결과를 <br>빠르게 받아 보실 수 있습니다.</span>
								</td>
							</tr>
							<tr>
								<th>
									<label for="text_mun">
										<strong>문의내용</strong>
									</label>
								</th>
								<td>
									<textarea name="ESM_MST_QST" id="ESM_MST_QST"></textarea>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="btn_box">
						<a href="javascript:void(0)" id="goRegist" class="btn_st2 btn_rd"><span>신청하기</span></a>
						<a href="javascript:self.close();" class="btn_st2 btn_blk777"><span>취소</span></a>
					</div>
				</div>
				</form>
				<!-- .nogo_form E -->

			</div>

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

</section>
<!--// #wrap E -->
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
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
    		
    		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    	
	    	if(!regEmail.test($("#ESM_MST_MAIL").val())) {
	            alert('이메일 주소가 유효하지 않습니다');
	            $("#ESM_MST_MAIL").focus();
	            return false;
	        }
	    	
	    	if($("#ESM_MST_WSH_TOT_PRICE").val() == ""){
	    		alert("구매 희망가를 입력해주세요.");
	    		return;
	    	}
	    	
	    	if(confirm("신청하시겠습니까?"))
	       	{
	       		$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/product/esmProductRegist.do", "target":"_self", "method":"post"}).submit();
	       	}
    	}
    });
	
    $('.nogo_form table tfoot th input').focus(function(){
		$(this).css("background-image","none");
	});
    $('body').css('overflow','hidden');
	
}); //function

</script>
</html>