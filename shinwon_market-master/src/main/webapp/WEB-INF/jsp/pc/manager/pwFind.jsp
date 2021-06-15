<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap"> --%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
		 <!-- Content -->
	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
	
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">아이디/비밀번호 찾기</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<div class="tab_wrap">
					<ul class="tab n2">
						<li><a href="<c:out value="${serverDomain }"/>/pc/manager/myInfoSearch.do">아이디 찾기</a></li>
						<li class="on"><a href="#tab2">비밀번호 찾기</a></li>
					</ul>
					<div class="tab_cont" id="tab2">
						<h3 class="blind">비밀번호 찾기</h3>
						<div class="id_pw_wrap">
							<div class="table_wrap">
								<form name="basicForm" id="basicForm">
									<input type="hidden" name="memType" value="memberBasic"/>
									
									<table class="tb_row">
										<caption>비밀번호 찾기 : 아이디 입력 표입니다.</caption>
										<colgroup>
											<col style="width:20%">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 아이디</th>
												<td><input type="text" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" placeholder="아이디 입력" class="w602"></td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
							<ul class="ul_dot">
								<li>비밀번호를 재설정하실 아이디를 입력해 주세요.</li>
								<li>회원가입 시 인증한 수단으로 본인여부를 확인해 주세요.</li>
								<li>본인인증 후 비밀번호를 재설정하실 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<div class="certifiy_check">
						<ul>
							<li id="phoneCheck">
								<a href="#">
									<strong class="tit">휴대폰 본인인증</strong>
									<span>본인 명의의 휴대폰을 이용하여 인증을 진행합니다.</span>
								</a>
							</li>
							<li id="ipinCheck">
								<a href="#">
									<strong class="tit">아이핀 인증</strong>
									<span>본인확인기관에서 발급받은 아이핀으로 인증을 진행합니다.</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="btn_wrap">
						<button id="goBtn" class="btn_large ok">인증하기</button>
					</div>
				</div>
			</div>
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
	
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>
	
	<form name="certForm" id="certForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${reqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${retUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="ipinForm" id="ipinForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${ipinReqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${ipinRetUrl }" />">      <!-- 결과수신 URL -->
	</form>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	var _db_idx = [1,0];// 위치확인
	
	$(function(){
		
		//탭
// 		var tab_list = $('.join_top .tab a'),
// 			dd_click = false;
		
// 		tab_list.on('click',function(){
// 			_this = $(this),
// 			_idx = _this.index();
// 			_db_idx[0] = _idx;
// 			con_show();
	
// 			_this.addClass('on').siblings().removeClass('on');		
// 		});
		con_show();
		dd_click = false;
	
		//라디오
		var type_list = $('.join_top .type label');
	
		type_list.on('click',function(){
			if(dd_click) return false;
			_this = $(this),
			_idx =_this.index(),
			_db_idx[1] = _idx,
			dd_click = true;
			con_show();
			
			_this.addClass('on').children('input').prop('checked', true).attr('checked', true);
			_this.siblings().removeClass('on').children('input').prop('checked', false).attr('checked', false);
			
			$("#basicMemId").val("");
			$("#basicMemNm").val("");
			$("#simpleMemId").val("");
			$("#simpleMemNm").val("");
			$("#simpleMemMail").val("");
			$("#businessMemId").val("");
			$("#MEM_CPR_NM").val("");
			$("#MEM_CPR_NO1").val("");
			$("#MEM_CPR_NO2").val("");
			$("#MEM_CPR_NO3").val("");
	    	
			setTimeout(function(){
				dd_click = false;
			},100);
		});
		
		//탭별로 내용 보여줘용
		function con_show(){
			var tab1 = $('.ul_tab1'),
				tab2 = $('.ul_tab2'),
				certifi = $('.certifi'),
				pwInp = $('.join_top .pwInp_box'),
				btn_box = $('.ul_btn'),
				_thisTab = null;
	
			$.each(_db_idx,function(i){
				if(i == 0){
					if(_db_idx[i]){									
						tab2.show().prev().hide();
						_thisTab = tab2;
					}else{					
						tab1.show().next().hide();
						_thisTab = tab1;
					}
				}else{
					if(_db_idx[i] == 0){
						if(_db_idx[0] == 1) pwInp.show();
						else pwInp.hide();
						certifi.show();
						_thisTab.children().hide();
						btn_box.hide();
					}
					else if(_db_idx[i] == 1) _thisTab.children('.email').show().siblings().hide();
					else if(_db_idx[i] == 2) _thisTab.children('.company').show().siblings().hide();
	
					if(_db_idx[i] != 0){
						certifi.hide();
						pwInp.hide();
						btn_box.show();
					}
				}			
			});
		}
	});
</script>
<script>
	$(function(){
		
		$("#goBtn").on("click",function(){
			if($basicForm.valid()){
				if($("#phoneCheck").prop("class") == "on"){
					window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				}else if($("#ipinCheck").prop("class") == "on"){
					window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				}else { 
					alert("인증수단을 선택해 주세요.");
				}
			}
		});
		
		var $basicForm = $("#basicForm"),
			$simpleForm = $("#simpleForm"),
			$businessForm = $("#businessForm");
		
		// 통합회원 폼체크
	    $basicForm.validate({
	        rules: 
	        {
	        	MEM_MST_MEM_ID :{required:true},	// 아이디
	        },
	        messages :
	        {
	        	MEM_MST_MEM_ID : {required:"아이디를 입력해주세요."},
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
		
		// 이메일 간편회원 폼체크
	    $simpleForm.validate({
	        rules: 
	        {
	        	basicMemId :{required:true},	// 아이디
	        	MEM_MST_MEM_NM:{required:true},	// 이름
	        	MEM_MST_MAIL:{required:true, email:true},	// 이메일
	        },
	        messages :
	        {
	        	MEM_MST_MEM_ID : {required:"아이디를 입력해주세요."},
	        	MEM_MST_MEM_NM : {required:"이름을 입력해주세요."},
	        	MEM_MST_MAIL : {required:"이메일을 입력해주세요."}
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
		
	 	// 기업회원 폼체크
	    $businessForm.validate({
	        rules: 
	        {
	        	MEM_MST_MEM_ID :{required:true},	// 아이디
	        	MEM_CPR_NM:{required:true},	// 기업명
	        	MEM_CPR_NO1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자번호 앞자리
	        	MEM_CPR_NO2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자번호 중간자리
	        	MEM_CPR_NO3:{required:true, number:true, minlength:5, maxlength:5}	// 사업자번호 뒷자리
	        },
	        messages :
	        {
	        	MEM_MST_MEM_ID : {required:"아이디를 입력해주세요."},	
	        	MEM_CPR_NM : {required:"기업명을 입력해주세요."},
	        	MEM_CPR_NO1 : {required:"사업자등록번호 앞자리를 입력해주세요."},
	        	MEM_CPR_NO2 : {required:"사업자등록번호 중간자리를 입력해주세요."},
	        	MEM_CPR_NO3 : {required:"사업자등록번호 뒷자리를 입력해주세요."}
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
		
		// 사이렌 본인인증 팝업
		fnSirenPopup = function(){
			if($basicForm.valid()){
				window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			    document.certForm.action = "<c:out value="${certReqUrl}" />";
			    document.certForm.target = "popupChk";
			    document.certForm.submit();				
			}
	    };
		
	    // IPIN 본인인증 팝업
		fnIpinPopup = function(){
	    	if($basicForm.valid()){
	    		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		        document.ipinForm.target = "popupIPIN2";
		        document.ipinForm.action = "<c:out value="${ipinCertReqUrl}"/>";
		        document.ipinForm.submit();	
	    	}
	    };
	    
	 	// 사이렌 본인인증 데이터 가지고 비밀번호 찾기 결과 페이지로 이동
	    goBasicForm = function(){
	    	/*$.ajax({
                async : false,
                type : "POST",
                data : {"MEM_MST_MEM_ID":$("#basicMemId").val(),"MEM_MST_MEM_NM":$("#MEM_MST_MEM_NM").val(),"MEM_IPN_CI":$("#MEM_IPN_CI").val()},
                url : "<c:out value="${serverSslDomain}" />/pc/manager/checkMemInfoAjax.do",
                success : function (data) {
                    if(data.successYn == "Y")
                    {
                        if(data.resultYn == "N")
                        {
                        	alert("일치하는 회원이 없습니다.");
                        	return;
                        }
                        else
                        {
                        	$basicForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();
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
            });*/
            // TODO 회원정보검색 후 submit 처리 필요
            
    		$basicForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 이메일간편회원, 기업회원 확인 클릭 이벤트
	    goPwFind = function(){
			var searchType = $("input[name='searchType']:checked").val();
			
	    	// 이메일 간편회원의 경우
	    	if(searchType == "memberSimple"){
	    		
	    		if($simpleForm.valid()){
	    			$simpleForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();	    			
	    		}	    			
			}
	    	// 기업회원의 경우
	    	if(searchType == "memberBusiness"){
	    		
	    		if($businessForm.valid()){
	    			$("#businessForm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();	    			
	    		}
	    	}
	    };
	    
	    certCallback = function(data){
			for(key in data) {
				$basicForm.append('<input type="hidden" id="'+key+'" name ="'+key+'" value="'+data[key]+'">');
			}
			goBasicForm();
		}
	    
	});
</script>
</body>
</html>