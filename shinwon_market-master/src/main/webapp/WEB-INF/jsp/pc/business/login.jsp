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
		<article id="container" class="container login_con">
		<form id="frm" name="frm" method="post">
		<input type="hidden" name="ROLE_USER" value="business" />
		<input type="hidden" name="url" value="<c:out value="${commandMap.url}"/>"/>
		<input type="hidden" name="locationProtocol" value="<c:out value="${commandMap.locationProtocol }"/>"/>
        <double-submit:preventer/>
			<div class="minW contents"><!-- .contents S -->
				
				<!-- .inpForm_d S -->
				<section class="inpForm_d">
					<h2>로그인</h2>
					<dl>
						<dt><strong class="tx_ti">신규 등록 시 입력한 사업자등록번호와 비밀번호를 입력해주시기 바랍니다.</strong></dt>
						<dd class="dd_inp">
							<div class="inp_box inp_comNum">
								<strong class="tx_ti">사업자등록번호</strong>
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
								<strong class="tx_ti">비밀번호</strong>
								<label for="">
									<input type="password" name="VDR_LGN_PW" id="VDR_LGN_PW" maxlength="15" placeholder="비밀번호" />
								</label>
							</div>
							<a href="javascript:goLogin();" class="btn_red btn_login"><strong>로그인</strong></a>
						</dd>
						<dd class="dd_pwNjoin">
							<div>
								<span class="tx">* 비밀번호를 분실하신 경우 재발급 받으실 수 있습니다.</span>
								<a href="<c:out value="${serverSslDomain }"/>/pc/business/businessPwFind.do" class="btn_gre"><span>비밀번호 찾기</span></a>
							</div>
							<div>
								<span class="tx">* 입점상담을 위해서는 반드시 업체정보를 신규등록 해주셔야 합니다.</span>
								<a href="<c:out value="${serverSslDomain }"/>/pc/business/joinVdrAgree.do" class="btn_gre"><span>신규등록</span></a>
							</div>
						</dd>
					</dl>
				</section>
				<!--// .inpForm_d E -->
	
	
			</div><!--// .contents E -->
		</form>
	</article>
	<!--// #container E -->
	<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

<script>
	$(function(){
		
		var $frm = $("#frm");
		
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	        	VDR_LGN_BUSI1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자 번호1
	        	VDR_LGN_BUSI2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자 번호2
	        	VDR_LGN_BUSI3:{required:true, number:true, minlength:5, maxlength:5},	// 사업자 번호3
	            VDR_LGN_PW:{required:true} 												// 비밀번호
	        },
	        messages :
	        {
	        	VDR_LGN_BUSI1: {required:"[사업자번호]첫번째 자리를 입력해주세요."},
	        	VDR_LGN_BUSI2: {required:"[사업자번호]두번째 자리를 입력해주세요."},
	        	VDR_LGN_BUSI3: {required:"[사업자번호]세번째 자리를 입력해주세요."},
	        	VDR_LGN_PW: {required:"[비밀번호]는 입력해주세요."}
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
		
		
	    // 비밀번호 form 엔터 이벤트
	    $(document).on("keydown", "#VDR_LGN_PW", function (e) {
	        if(e.keyCode == 13){
	            login();
	        }
	    });		
		
	    // 로그인 버튼 클릭
	    goLogin = function () {
	        login();
	    };		
	    
	  
	  	//회원 로그인
	  	login = function(){
	  		
	        var $frm = $("#frm");
	        if($frm.valid())
	        {
	        	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
	 	        	
	            $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/business/loginProc.do", "target":"_self", "method":"post"}).submit();
	            return false;
	        }
	  	};
	    
	});
</script>
</body>
</html>