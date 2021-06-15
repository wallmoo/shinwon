<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/topIdFind.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">

                <div class="tab_wrap pd_reset">
                    <ul class="tab st3 n2">
                        <li><a href="<c:out value="${serverDomain }"/>/mobile/manager/idFind.do?gubun=ID">아이디 찾기</a></li>
                        <li class="on"><a href="#tab2">비밀번호 찾기</a></li>
                    </ul>
                    <!-- <div class="tab_cont" id="tab1">
                        <div class="inner">
                            <ul class="dot_list2">
                                <li>회원가입 시 인증한 수단으로 본인여부를 확인해 주세요.</li>
                                <li>타인명의/법인 휴대폰 회원님은 본인인증이 불가합니다.</li>
                            </ul>
                            <div class="self_check_btn" >
                                <a href="javascript:;" id="phoneCheck">
                                    <p class="tit">휴대폰 본인인증</p>
                                    <p class="txt">본인 명의의 휴대폰을 이용하여 인증을 진행합니다.</p>
                                </a>
                                <a href="#n" id="ipinCheck">
                                    <p class="tit">아이핀 인증</p>
                                    <p class="txt">본인확인기관에서 발급받은 아이핀으로 인증을 진행합니다.</p>
                                </a>
                            </div>
                        </div>
                    </div> -->
                    <div class="tab_cont" id="tab2">
                    	<form name="basicForm" id="basicForm">
							<input type="hidden" name="memType" value="memberBasic"/>
                        <div class="inner">
                            <ul class="dot_list2">
                                <li>비밀번호를 재설정하실 아이디를 입력해 주세요.</li>
                                <li>회원가입 시 인증한 수단으로 본인여부를 확인해 주세요.</li>
                                <li>본인인증 후 비밀번호를 재설정하실 수 있습니다.</li>
                            </ul>
                            <div class="writeWrap fix find_id_form">
                                <div class="name">아이디</div>
                                <div class="form">
                                    <input type="text" id="MEM_MST_MEM_ID" name="MEM_MST_MEM_ID" placeholder="아이디 입력" class="w602">
                                </div>
                            </div>
                            <div class="self_check_btn">
                                <a href="#n">
                                    <p class="tit">휴대폰 본인인증</p>
                                    <p class="txt">본인 명의의 휴대폰을 이용하여 인증을 진행합니다.</p>
                                </a>
                                <a href="#n">
                                    <p class="tit">아이핀 인증</p>
                                    <p class="txt">본인확인기관에서 발급받은 아이핀으로 인증을 진행합니다.</p>
                                </a>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="btn_area">
                    <button type="button" class="btn ok" id="goBtn">인증하기</button>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
    <form name="certForm" id="certForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${reqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${retUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="ipinForm" id="ipinForm">
	<input type="hidden" name="reqInfo" value="<c:out value="${ipinReqInfo }" />">      <!-- 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="retUrl" value="<c:out value="${ipinRetUrl }" />">      <!-- 결과수신 URL -->
	</form>
	
	<form name="basicForm" id="basicForm">
	<input type="hidden" name="MEM_MST_MEM_ID" id="memId"/>
	<input type="hidden" name="memType" value="memberBasic"/> 	
	</form>
        
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	var _db_idx = [0,0];// 위치확인
	$(function(){
		

		$("#goBtn").on("click",function(){
			if($("#phoneCheck")){
				window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else if($("#ipinCheck")){
				window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			}else { 
				alert("인증수단을 선택해 주세요.");
			}
		});

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
			
			$("#MEM_MST_MEM_NM").val("");
	    	$("#MEM_MST_MAIL").val("");
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
		
		var $basicForm = $("#basicForm"),
			$simpleForm = $("#simpleForm"),
			$businessForm = $("#businessForm");
		
		// 이메일 간편회원 폼체크
		/*
	    $simpleForm.validate(
	    {
	        rules: 
	        {
	        	MEM_MST_MEM_NM:{required:true},	// 이름
	        	MEM_MST_MAIL:{required:true, email:true},	// 이메일
	        },
	        messages :
	        {
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
		*/
	 	// 기업회원 폼체크
	 	/*
	    $businessForm.validate(
	    {
	        rules: 
	        {
	        	MEM_CPR_NM:{required:true},	// 기업명
	        	MEM_CPR_NO1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자번호 앞자리
	        	MEM_CPR_NO2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자번호 중간자리
	        	MEM_CPR_NO3:{required:true, number:true, minlength:5, maxlength:5}	// 사업자번호 뒷자리
	        },
	        messages :
	        {
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
		*/
		// 사이렌 본인인증 팝업
		fnSirenPopup = function()
	    {
			window.open('/common/cert/phone.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			
	    };
		
	    // IPIN 본인인증 팝업
		fnIpinPopup = function()
	    {
			window.open('/common/cert/ipin.do', 'popupIPIN2', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	        
	    };
	    certCallback = function(data){
			for(key in data) {
				$basicForm.append('<input type="hidden" id="'+key+'" name ="'+key+'" value="'+data[key]+'">');
			}
			goBasicForm();
		}
	 	// 사이렌 본인인증 데이터 가지고 아이디 찾기 결과 페이지로 이동
	    goBasicForm = function()
	    {
	    	$basicForm.attr({"action":"<c:out value="${serverSslDomain}" />/mobile/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    // 이메일간편회원, 기업회원 확인 클릭 이벤트
	    goIdFind = function()
	    {
			var searchType = $("input[name='searchType']:checked").val();
			
	    	// 이메일 간편회원의 경우
	    	if(searchType == "memberSimple"){
	    		
	    		if($simpleForm.valid()){
	    			$simpleForm.attr({"action":"<c:out value="${serverSslDomain}" />/mobile/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();	    			
	    		}	    			
			}
	    	// 기업회원의 경우
	    	if(searchType == "memberBusiness"){
	    		
	    		if($businessForm.valid()){
	    			$("#businessForm").attr({"action":"<c:out value="${serverSslDomain}" />/mobile/manager/pwFindResult.do", "target":"_self", "method":"post"}).submit();	    			
	    		}
	    	}
	    };
	    
	});
</script>