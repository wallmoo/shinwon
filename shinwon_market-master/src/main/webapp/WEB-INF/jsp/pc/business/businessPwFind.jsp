<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>


<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
		
		<!-- #container S -->
		<form id="frm" name="frm" method="post">
		<double-submit:preventer/> 
		<article id="container" class="container login_con">
			<div class="minW contents"><!-- .contents S -->
				
				<!-- .inpForm_d S -->
				<section class="inpForm_d">
					<h2>비밀번호 찾기</h2>
					<dl>
						<dt>
							<span class="tx_ex"><i class="co_red">*</i> 표시된 항목은 필수 입력 사항입니다.</span>
						</dt>
						<dd class="dd_inp">
							<div class="inp_box inp_comNum">
								<strong class="tx_ti">사업자등록번호 <i class="co_red">*</i></strong>
								<label for="VDR_LGN_BUSI1" class="blind">사업자등록번호 첫번째</label>
								<input type="text" name="VDR_LGN_BUSI1" id="VDR_LGN_BUSI1" maxlength="3" class="number" />
								<span class="ico_l">-</span>
								<label for="VDR_LGN_BUSI2" class="blind">사업자등록번호 두번째</label>
								<input type="text" name="VDR_LGN_BUSI2" id="VDR_LGN_BUSI2" maxlength="2" class="number" />
								<span class="ico_l">-</span>
								<label for="VDR_LGN_BUSI3" class="blind">사업자등록번호 세번째</label>
								<input type="text" name="VDR_LGN_BUSI3" id="VDR_LGN_BUSI3" maxlength="5" class="number" />
							</div>
							<div class="inp_box inp_pw">
								<strong class="tx_ti">대표자명 <i class="co_red">*</i></strong>
								<label for="VDR_LGN_CEO_NM">
									<input type="text" name="VDR_LGN_CEO_NM" id="VDR_LGN_CEO_NM" maxlength="15" />
								</label>
							</div>
							<div class="inp_box inp_email">
								<strong class="tx_ti">대표 Email <i class="co_red">*</i></strong>
								<label for="VDR_LGN_MAIL_ID" class="blind">대표 email 아이디</label>
								<input type="text" name="VDR_LGN_MAIL_ID" id="VDR_LGN_MAIL_ID" maxlength="20" />
								<span class="ico_l">@</span>
								<label for="VDR_LGN_MAIL_DOMAIN" class="blind">대표 email 도메인</label>
								<input type="text" name="VDR_LGN_MAIL_DOMAIN" id="VDR_LGN_MAIL_DOMAIN" />
								<input type="hidden" id="VDR_LGN_MAIL" name="VDR_LGN_MAIL" />
								<label for="emailDomainSelectbox" class="sel_box">
									<select id="emailDomainSelectbox" class="sel_chg">
										<option value="">직접입력</option>
	                            		<c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
		                            		<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
		                            			<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
	                            			</c:forEach>
	                            		</c:if>														
									</select>
								</label>
							</div>
						</dd>
						<dd class="dd_btn">
							<p class="ex_tx">
								<span>※ 입력하신 내용이 모두 맞으면 대표 Email로 임시 비밀번호가 발송됩니다.</span>
							</p>
							<a href="javascript:goFind();" class="btn_red"><span>확인</span></a>
							<a href="javascript:goCancel();" class="btn_gre"><span>취소</span></a>
						</dd>
					</dl>
				</section>
				<!--// .inpForm_d E -->
	
	
			</div><!--// .contents E -->
		</article>
		</form>		
		<!--// #container E -->
	<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

<script>
	$(function(){
		
		// 취소
	    goCancel = function(){
	    	location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
	    };		
	    
 		// 이메일 도메인 select box 변경 이벤트
	    $(document).on("click", "#emailDomainSelectbox", function () 
	    {
	        var $domain = $("#VDR_LGN_MAIL_DOMAIN");
	        
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
		
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	        	VDR_LGN_BUSI1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자 번호1
	        	VDR_LGN_BUSI2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자 번호2
	        	VDR_LGN_BUSI3:{required:true, number:true, minlength:5, maxlength:5},	// 사업자 번호3
	        	VDR_LGN_CEO_NM :{required:true},										// 대표자명
	            VDR_LGN_MAIL_ID:{required:true, emailId:true},							// 이메일 아이디
	            VDR_LGN_MAIL_DOMAIN:{required:true, emailDomain:true}					// 이메일 도메인	        	
	        },
	        messages :
	        {
	        	VDR_LGN_BUSI1: {required:"[사업자번호]첫번째 자리를 입력해주세요."},
	        	VDR_LGN_BUSI2: {required:"[사업자번호]두번째 자리를 입력해주세요."},
	        	VDR_LGN_BUSI3: {required:"[사업자번호]세번째 자리를 입력해주세요."},
	        	VDR_LGN_CEO_NM: {required:"[대표자명]은 필수 정보입니다."},
	        	VDR_LGN_MAIL_ID : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:"아이디 형식을 올바르게 입력해 주십시오."},
	        	VDR_LGN_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."}	        	
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
		
		
	  	goFind = function(){
	  		
	        if($frm.valid())
	        {
	        	// 이메일 ID + DOMAIN
                $("#VDR_LGN_MAIL").val($("#VDR_LGN_MAIL_ID").val() + "@" + $("#VDR_LGN_MAIL_DOMAIN").val());
	 	        	
    	    	$.ajax({
                    async : false,
                    type : "POST",
                    data : $frm.serialize(),
                    url : "<c:out value="${serverSslDomain}" />/pc/business/checkBusinessInfoAjax.do",
                    success : function (data) {
                    	
                        if(data.successYn == "Y")
                        {
                            if(data.resultYn == "N")
                            {
                            	alert("일치하는 회원이 없습니다.");
                            }
                            else
                            {
                            	if(data.successSend == "Y"){
	                            	alert("가입 당시 입력하신 이메일로 임시비밀번호가 발송되었습니다.");
	                            	location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	
                            	}else{
	                            	alert("임시비밀번호 발송에 싫패하였습니다.");
	                            	location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";                            		
                            	}
                            }
                        }
                        else
                        {
                            alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
                            return;
                        }
                    },
                    error : function () {
                        alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                    }
                });
	        }
	  	};
	    
	});
</script>
</body>
</html>