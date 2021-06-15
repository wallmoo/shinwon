<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>


<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<form id="frm" name="frm" method="post">
        <double-submit:preventer/>		
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">입점 신청서</h2>
					</div>
					
					<dl class="minW counsel_ask">
						<dt>
							<strong>입점 신청서 작성</strong>
						</dt>
						<dd class="dd_inpForm">
							<table>
								<caption>입점 신청서 작성에 구분, 업체명, 대표자명, 사업자구분, 법인등록번호, 사업장주소, 세금계산서 담당 이메일, 업태/업종(종목), 전화, 팩스번호, 은행명, 계좌번호, 예금주 으로 구성된 표</caption>
								<colgroup>
									<col style="width:140px" />
									<col style="width:339px" />
									<col style="width:140px" />
									<col style="width:339px" />
								</colgroup>
								<tbody>
									<tr>
										<th>구분</th>
										<td colspan="3" class="td_">
											<i class="ico_under"><strong>접수중</strong></i>
										</td>
									</tr>
									<tr>
										<th>업체명 <i class="co_red">*</i></th>
										<td class="td_comName">
											<div class="inp_box">
												<label for="">
													<input type="text" name="VDR_REQ_NM" id="VDR_REQ_NM" maxlength="40" value="<c:out value="${businessInfo.VDR_LGN_NM}" />"/>
												</label>
											</div>
										</td>
										<th>대표자명 <i class="co_red">*</i></th>
										<td class="td_ceoName">
											<div class="inp_box">
												<label for="">
													<input type="text" name="VDR_REQ_CEO_NM" id="VDR_REQ_CEO_NM" maxlength="15" value="<c:out value="${businessInfo.VDR_LGN_CEO_NM}" />" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>사업자구분 <i class="co_red">*</i></th>
										<td class="td_comType">
											<div class="inp_box">
												<label for="VDR_REQ_TYPE" class="sel_comType">
													<select id="VDR_REQ_TYPE" name="VDR_REQ_TYPE" class="sel_chg">
														<option value="">선택</option>
						                                <c:if test="${not empty codes.BUSINESS_CODE }">
							                                <c:forEach var="mngTelRow" items="${codes.BUSINESS_CODE }" varStatus="i">
					                                    		<option value="<c:out value="${mngTelRow.CMN_COM_IDX }"/>" 
					                                    		<c:if test="${mngTelRow.CMN_COM_IDX eq businessInfo.VDR_LGN_TYPE }">selected="selected"</c:if>>					                                    
							                                    <c:out value="${mngTelRow.CMN_COM_NM }"/></option>
							                                </c:forEach>
						                                </c:if>
													</select>
												</label>
											</div>
										</td>
										<th>법인등록번호</th>
										<td class="td_regNum">
											<div class="inp_box">
												<label for="">
													<input type="text" name="VDR_REQ_JRD_NO1" id="VDR_REQ_JRD_NO1" maxlength="6" class="number"  value="<c:out value="${businessInfo.VDR_LGN_JRD_NO1 }" />" />
												</label>
												<span class="ico_tx">-</span>
												<label for="">
													<input type="text" name="VDR_REQ_JRD_NO2" id="VDR_REQ_JRD_NO2" maxlength="7" class="number" value="<c:out value="${businessInfo.VDR_LGN_JRD_NO2 }" />" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>사업장주소 <i class="co_red">*</i></th>
										<td colspan="3" class="td_comAdd">
											<div class="f inp_box">
												<label for="VDR_REQ_POST5">
													<input type="text" name="VDR_REQ_POST5" id="VDR_REQ_POST5" maxlength="5" 
														title="우편번호" readonly="readonly" data-err_msg_id="zip" value="<c:out value="${businessInfo.VDR_LGN_POST5 }"/>" />
												</label>
												<a href="javascript:void(0)" id="zipCheck" class="btn_gre"><span>우편번호 찾기</span></a>
											</div>
											<div class="inp_box">
												<label for="VDR_LGN_DR_ADDR1">
													<input type="text" name="VDR_REQ_DR_ADDR1" id="VDR_REQ_DR_ADDR1" placeholder="도로명 주소" maxlength="100" readonly="readonly" data-err_msg_id="doro1" value="<c:out value="${businessInfo.VDR_LGN_DR_ADDR1 }"/>" />
												</label>
												<label for="VDR_LGN_DR_ADDR2">
													<input type="text" name="VDR_REQ_DR_ADDR2" id="VDR_REQ_DR_ADDR2" placeholder="도로명 주소 상세" maxlength="100" data-err_msg_id="doro2" value="<c:out value="${businessInfo.VDR_LGN_DR_ADDR2 }"/>" />
												</label>
											</div>
											<div class="l inp_box">
												<label for="VDR_LGN_JB_ADDR1">
													<input type="text" name="VDR_REQ_JB_ADDR1" id="VDR_REQ_JB_ADDR1" placeholder="지번 주소" maxlength="100" readonly="readonly" data-err_msg_id="jibun" value="<c:out value="${businessInfo.VDR_LGN_JB_ADDR1 }"/>" />
												</label>
												<label for="VDR_LGN_JB_ADDR2">
													<input type="text" name="VDR_REQ_JB_ADDR2" id="VDR_REQ_JB_ADDR2" placeholder="지번 주소 상세" maxlength="100" data-err_msg_id="jibun" value="<c:out value="${businessInfo.VDR_LGN_JB_ADDR2 }"/>" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>세금계산서<br/>담당 이메일 <i class="co_red">*</i></th>
										<td colspan="3" class="td_email">
											<div class="inp_box">
												<c:set var="mail2" value="${fn:split(businessInfo.VDR_LGN_MAIL,'@')[1]}" />
												<label for="" class="blind">대표 email 아이디</label>
												<input type="text" name="VDR_REQ_MAIL_ID" id="VDR_REQ_MAIL_ID" maxlength="20" data-err_msg_id="memEmailId" value="<c:out value="${fn:split(businessInfo.VDR_LGN_MAIL,'@')[0] }"/>"/>
												<span class="ico_l">@</span>
												<label for="VDR_LGN_MAIL_DOMAIN" class="blind">대표 email 도메인</label>
												<input type="text" name="VDR_REQ_MAIL_DOMAIN" id="VDR_REQ_MAIL_DOMAIN" data-err_msg_id="memEmailDomain" value="<c:out value="${fn:split(businessInfo.VDR_LGN_MAIL,'@')[1] }"/>"/>
												<input type="hidden" id="VDR_REQ_MAIL" name="VDR_REQ_MAIL" />												
												<label for="emailDomainSelectbox" class="sel_box">
													<select id="emailDomainSelectbox" class="sel_chg">
														<option value="">직접입력</option>
							                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
								                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
								                            	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${emailRow.CMN_COM_NM eq mail2}">selected="selected"</c:if>><c:out value="${emailRow.CMN_COM_NM }"/></option>
							                            	</c:forEach>
							                            </c:if>
													</select>													
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>업태/업종(종목) <i class="co_red">*</i></th>
										<td colspan="3" class="td_busines">
											<div class="inp_box">
												<label for="">
													<input type="text" name="VDR_REQ_BUSI_CDT" id="VDR_REQ_BUSI_CDT"  value="" />
												</label>
												<span class="ico_tx">/</span>
												<label for="">
													<input type="text" name="VDR_REQ_BUSI_TYPE" id="VDR_REQ_BUSI_TYPE" value="" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>전화 <i class="co_red">*</i></th>
										<td class="td_tel">
											<div class="inp_box">
												<label for="VDR_REQ_TEL1" class="">
													<select class="sel_chg" id="VDR_REQ_TEL1" name="VDR_REQ_TEL1" title="전화번호 앞자리">
						                                <option value="">선택</option>
						                                <c:if test="${not empty codes.TEL_CODE }">
							                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
							                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" 
							                                    		<c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
							                                    	<c:out value="${telRow.CMN_COM_NM }"/>
							                                    </option>
							                                </c:forEach>
						                                </c:if>
						                            </select>													
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_TEL2">
													<input type="text" class="text small number" name="VDR_REQ_TEL2" id="VDR_CST_TEL2" maxlength="4" class="number" title="전화번호 중간자리" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_TEL3">
													<input type="text" class="text small number" name="VDR_REQ_TEL3" id="VDR_CST_TEL3" maxlength="4" class="number" title="전화번호 끝자리" />
												</label>
											</div>
										</td>
										<th>팩스번호 <i class="co_red">*</i></th>
										<td class="td_fax">
											<div class="inp_box">
												<label for="VDR_REQ_FAX1" class="">
													<select class="sel_chg" id="VDR_REQ_FAX1" name="VDR_REQ_FAX1" title="팩스 앞자리">
						                                <option value="">선택</option>
						                                <c:if test="${not empty codes.TEL_CODE }">
							                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
							                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" 
							                                    		<c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
							                                    	<c:out value="${telRow.CMN_COM_NM }"/>
							                                    </option>
							                                </c:forEach>
						                                </c:if>
						                            </select>	
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_FAX2">
													<input type="text" class="text small number" name="VDR_REQ_FAX2" id="VDR_REQ_FAX2" maxlength="4" class="number" title="팩스 중간자리" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_REQ_FAX3">
													<input type="text" class="text small number" name="VDR_REQ_FAX3" id="VDR_REQ_FAX3" maxlength="4" class="number" title="팩스 끝자리" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>은행명 <i class="co_red">*</i></th>
										<td class="td_bank">
											<div class="inp_box">
												<label for="VDR_REQ_BANK_CD" class="">
													<select class="sel_chg" id="VDR_REQ_BANK_CD" name="VDR_REQ_BANK_CD" title="은행명" data-over="true">
						                                <option value="">선택</option>
						                                <c:if test="${not empty codes.KICC_BANK_CD }">
							                                <c:forEach var="bankRow" items="${codes.KICC_BANK_CD }" varStatus="i">
							                                    <option value="<c:out value="${bankRow.CMN_COM_ETC1 }"/>" 
							                                    		<c:if test="${bankRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
							                                    	<c:out value="${bankRow.CMN_COM_NM }"/>
							                                    </option>
							                                </c:forEach>
						                                </c:if>
						                            </select>	
												</label>
											</div>
										</td>
										<th>계좌번호 <i class="co_red">*</i></th>
										<td class="td_accNum">
											<div class="inp_box">
												<label for="VDR_REQ_ACT_NO">
													<input type="text" name="VDR_REQ_ACT_NO" id="VDR_REQ_ACT_NO" class="number" value="" maxlength="30" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>예금주 <i class="co_red">*</i></th>
										<td colspan="3" class="td_accHolder">
											<div class="inp_box">
												<label for="VDR_REQ_ACT_HDR">
													<input type="text" name="VDR_REQ_ACT_HDR" id="VDR_REQ_ACT_HDR" value="" />
												</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>						
						</dd>
						<dd class="dd_btn">
							<a href="javascript:goRegist();" class="btn_red"><span>확인</span></a>
							<a href="javascript:goCancel();" class="btn_gre"><span>취소</span></a>
						</dd>
					</dl>
				</section>
				<!--// .sub_lay E -->
	
			</div><!--// .contents E -->
		</article>		
		</form>
		
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>

	$(function(){
		
	 	// 우편번호 찾기 클릭 이벤트
	    $(document).on("click","#zipCheck",function(){
	    	window.open("<c:out value="${serverSslDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes,target=_blank");
	    });
	 	
	 	// 우편번호 callback 함수
		zipcodeCallback = function (zip,doroAddr,jibunAddr)
		{
			$('#VDR_REQ_POST5').val(zip);
			$('#VDR_REQ_DR_ADDR1').val(doroAddr);
			$('#VDR_REQ_JB_ADDR1').val(jibunAddr);
			$('#zip').html("");
			$('#doro').html("");
			$('#jibun').html("");
		};	 	
		
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	        	VDR_REQ_NM	: {required:true, maxlength:30},						 // 업체명
	        	VDR_REQ_CEO_NM	:{required:true, maxlength:15},						 // 담당자명
	        	VDR_REQ_TYPE :{required:true},										 // 사업자구분	       
	            VDR_REQ_POST5:{required:true, number:true}, 						 // 우편번호
	            VDR_REQ_DR_ADDR1:{required:true},   								 // 도로명 본주소
	            VDR_REQ_DR_ADDR2:{required:true},   								 // 도로명 상세주소
	            VDR_REQ_JB_ADDR1:{required:true},   								 // 지번 본주소
	            VDR_REQ_JB_ADDR2:{required:true},  									 // 지번 상세주소
	            VDR_REQ_MAIL_ID:{required:true, emailId:true},						 // 이메일 아이디
	            VDR_REQ_MAIL_DOMAIN:{required:true, emailDomain:true},				 // 이메일 도메인	          
	            VDR_REQ_BUSI_CDT :{required:true, maxlength:40},					 // 업태 
	            VDR_REQ_BUSI_TYPE :{required:true, maxlength:40},					 // 업종 
	            VDR_REQ_TEL1:{required:true},										 // 연락처번호 앞자리
	            VDR_REQ_TEL2:{required:true, number:true, minlength:3 , maxlength:4},// 연락처번호 중간자리
	            VDR_REQ_TEL3:{required:true, number:true, minlength:4 , maxlength:4},// 연락처번호 뒷자리
	            VDR_REQ_FAX1:{required:true},										 // 팩스번호 앞자리
	            VDR_REQ_FAX2:{required:true, number:true, minlength:3 , maxlength:4},// 팩스번호 중간자리
	            VDR_REQ_FAX3:{required:true, number:true, minlength:4 , maxlength:4},// 팩스번호 뒷자리	
	            VDR_REQ_BANK_CD:{required:true}, 				 					 // 은행명
	            VDR_REQ_ACT_NO:{required:true, number:true}, 				 		 // 계좌번호
	            VDR_REQ_ACT_HDR:{required:true}, 				 					 // 예금주
	        },
	        messages :
	        {
	        	VDR_REQ_NM: {required:"[업체명]은 필수 정보입니다."},
	        	VDR_REQ_CEO_NM: {required:"[대표자명]은 필수 정보입니다."},
	        	VDR_REQ_TYPE: {required:"[사업자구분]은 필수 정보입니다."},
	        	VDR_REQ_POST5: {required:"[우편번호]는 필수 정보입니다."},
	        	VDR_REQ_DR_ADDR1: {required:"[도로명 주소]는 필수 정보입니다."},
	        	VDR_REQ_DR_ADDR2: {required:"[도로명 주소 상세]는 필수 정보입니다."},
	        	VDR_REQ_JB_ADDR1: {required:"[지번 주소]는 필수 정보입니다."},
	        	VDR_REQ_JB_ADDR2: {required:"[지번 주소 상세]는 필수 정보입니다."},	        	
	        	VDR_REQ_MAIL_ID : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:"아이디 형식을 올바르게 입력해 주십시오."},
	        	VDR_REQ_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."},
	        	VDR_REQ_BUSI_CDT : {required:"[업태]는 필수 정보입니다."},
	        	VDR_REQ_BUSI_TYPE : {required:"[업종]는 필수 정보입니다."},
	        	VDR_REQ_TEL1: {required:"[연락처번호 앞자리]는 필수 정보입니다."},
	        	VDR_REQ_TEL2: {required:"[연락처번호 중간자리]는 필수 정보입니다." ,minlength:"[연락처번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[연락처번호 중간자리]는 최대 4글자입니다."},
	        	VDR_REQ_TEL3: {required:"[연락처번호 뒷자리]는 필수 정보입니다." ,minlength:"[연락처번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[연락처번호 뒷자리]는 최대 4글자입니다."},
	        	VDR_REQ_FAX1: {required:"[팩스번호 앞자리]는 필수 정보입니다."},
	        	VDR_REQ_FAX2: {required:"[팩스번호 중간자리]는 필수 정보입니다." ,minlength:"[팩스번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[팩스번호 중간자리]는 최대 4글자입니다."},
	        	VDR_REQ_FAX3: {required:"[팩스번호 뒷자리]는 필수 정보입니다." ,minlength:"[팩스번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[팩스번호 뒷자리]는 최대 4글자입니다."},
	        	VDR_REQ_BANK_CD: {required:"[은행명]는 필수 정보입니다."},
	        	VDR_REQ_ACT_NO : {required:"[계좌번호]은 필수 정보입니다."},  	        	
	        	VDR_REQ_ACT_HDR : {required:"[예금주]은 필수 정보입니다."}  	        	
	        }
	        //,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
	        ,onkeyup:false
		    ,onclick:false
		    ,onfocusout:false
	        ,showErrors:function(errorMap, errorList){
	 	       if(this.numberOfInvalids()) { 
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
		
 		// 이메일 도메인 select box 변경 이벤트
	    $(document).on("click", "#emailDomainSelectbox", function () 
	    {
	        var $domain = $("#VDR_REQ_MAIL_DOMAIN");
	        
	        if($(this).val() == "")
	        {
	            $domain.prop("readonly", false);
	            $domain.val("");
	        }
	        else
	        {
	            $domain.prop("readonly", true);
	            $domain.val($(this).val());
	        }
	    });
 		
 		
	 	// 등록 버튼 클릭 이벤트
	    goRegist = function () {
	 		
	 		if($frm.valid()){
                // 이메일 ID + DOMAIN
                $("#VDR_REQ_MAIL").val($("#VDR_REQ_MAIL_ID").val() + "@" + $("#VDR_REQ_MAIL_DOMAIN").val());
           		
           		if(confirm( "저장 하시겠습니까?")) {
   	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointApplicationRegist.do", "target":"_self", "method":"post"}).submit();
                }   
	        }
	    };
	    
	    // 취소 클릭 이벤트
	    goCancel = function(){
 			location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
	    };
	    
	});
</script>
</body>
</html>