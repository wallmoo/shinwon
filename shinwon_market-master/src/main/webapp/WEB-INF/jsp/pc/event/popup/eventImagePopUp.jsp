<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">
<!-- #wrap S -->
<section id="wrap">	
	<!-- #container S -->
	<article id="container" class="container event_regist_pop">
		<header>
			<a href="javascript:self.close();" class="btn_close"><span class="blind">사진등록 팝업 닫기</span></a>
			<h1>사진 등록하기</h1>
		</header>
		<div class="contents"><!-- .contents S -->
			<dl>
				<dt>
					<strong class="ev_ti"><c:out value="${info.EVT_MST_TITLE }" /></strong>
					<p class="tx_ex">
						<span><i>ㆍ</i>본 게시판과 관련이 없거나 광고성, 단순반복성, 저작권침해 등 불건전한 내용을 올리실 경우 통보 없이 임의로 삭제 처리될 수 있습니다.</span>
					</p>
				</dt>
				<dd class="form">
				<form name="pfrm" id="pfrm" enctype="multipart/form-data" method="post">
				<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" value="<c:out value="${info.EVT_MST_IDX }" />" />
				<input type="hidden" name="EVT_AGT" id="EVT_AGT" value="" />
				<double-submit:preventer/>
					<table>
						<caption>제목, 내용, 사진찾기으로 구성된 표</caption>
						<colgroup>
						<col style="width:120px" />
						<col  />
						</colgroup>
						<tbody>
							<tr>
								<th><span>제목</span><i class="co_red">*<span class="blind">필수입력</span></i></th>
								<td>
									<div class="inp_box">
										<input type="text" name="EVT_IMG_NM" id="EVT_IMG_NM" placeholder="50자 이내">
										<span class="inp_num" id="nm_num">(50자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>내용</span><i class="co_red">*<span class="blind">필수입력</span></i></th>
								<td>
									<div class="inp_box">
										<textarea name="EVT_IMG_CTS" id="EVT_IMG_CTS" placeholder="500자 아내로 입력해 주세요"></textarea>
										<span class="inp_num" id="cts_num">(500자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>사진찾기</span><i class="co_red">*<span class="blind">필수입력</span></i></th>
								<td>
									<div class="inp_box">
										<input type="file" name="multiFile" id="multiFile">
										<p class="tx_ex">
											<span>- 최대 3MB까지 업로드가 가능합니다.</span>
											<span>- 1장의 사진만 업로드해 주세요.</span>
											<span>- jpg, gif, png 파일만 업로드 가능합니다. </span>
										</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="clause_box">
						<strong class="ti">개인정보 및 이벤트 약관 동의</strong>
						<label for="" class="tx_d">
							<pre name="" id="">
								<table cellpadding="0" cellspacing="0" border="0" class="pre_table" summary="개인정보 수집 및 이용 동의에 관한 설명">
									<caption>개인정보 수집 및 이용 동의</caption>
									<colgroup>
									<col style="width:150px" />
									<col />
									</colgroup>
									<thead>
										<tr>
											<th colspan="2" class="last">개인정보 수집 및 이용 동의</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>개인정보 수집목적</td>
											<td class="last">이벤트 참여 및 경품 지급</td>
										</tr>
										<tr>
											<td>개인정보 수집항목</td>
											<td class="last">회원 ID, 이름, 연락처, 주소</td>
										</tr>
										<tr>
											<td>보유 및 이용기간</td>
											<td class="last">개인정보의 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.<br/>단, 이벤트 당첨자는 경품 지급을 위하여 90일 동안 개인정보가 보관됩니다.</td>
										</tr>
									</tbody>
								</table>

								<table cellpadding="0" cellspacing="0" border="0" class="pre_table" summary="이벤트 약관 동의에 관한 설명">
									<caption>이벤트 약관 동의</caption>
									<thead>
										<tr>
											<th class="last">이벤트 약관 동의</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="last">
1. 제출된 사진은 마켓플랜트의 광고 및 홍보용으로 사용될 수 있습니다.<br/>
2. 제출된 사진에 대한 저작권, 초상권 등 모든 법적 책임은 게시자 본인에게 있습니다.<br/>
3. 본 이벤트와 연관이 없거나 선정성, 폭력성이 포함된 사진 또는 글을 게재할 경우 게시자에게 사전 연락 없이 삭제됩니다.<br/>
4. 부당한 방법으로 이벤트에 참여할 경우 경고 없이 참여 자격이 박탈될 수 있습니다.<br/>
5. 마켓플랜트가 개인정보를 수집하고 이용함에 있어 내용을 충분히 확인하고, 이용에 동의합니다.
											</td>
										</tr>
									</tbody>
								</table>

							</pre>
						</label>
						<div class="inp_box">
							<label for="" class="on">
								<input type="radio" name="rad" id="rad1" value="Y" />
								<span>동의함</span>
							</label>
							<label for="">
								<input type="radio" name="rad" id="rad2" value="N" checked />
								<span>동의안함</span>
							</label>
						</div>
					</div>
					</form>
					<div class="btn_box">
						<a href="javascript:void(0)" class="btn_bl_k"><strong>사진 등록하기</strong></a>
					</div>
				</dd>
			</dl>

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<script type="text/javascript">
		calculate_msglen = function(message) {
			var nbytes = 0;
			
			for (i=0; i<message.length; i++) {
				var ch = message.charAt(i);
				/*if(escape(ch).length > 4) {
					 nbytes += 2;
				} else if (ch == '\n') {
					 if (message.charAt(i-1) != '\r') {
					 nbytes += 1;
			 		}
			 	} else if (ch == '<' || ch == '>') {
			 		nbytes += 4;
			 	} else {
			 		nbytes += 1;
			 	}*/
				nbytes += 1;
			 }
			 
			return nbytes;
		}
		
	 	assert_msglen = function(message, maximum) {
			 var inc = 0;
			 var nbytes = 0;
			 var msg = "";
			 var msglen = message.length;
			 
			for (i=0; i<msglen; i++) {
				 var ch = message.charAt(i);
				 /*if (escape(ch).length > 4) {
					 inc = 2;
				 } else if (ch == '\n') {
				 	if (message.charAt(i-1) != '\r') {
						 inc = 1;
				 	}
				 } else if (ch == '<' || ch == '>') {
				 	inc = 4;
				 } else {
				 	inc = 1;
				 }*/
				 inc = 1;
				 
				 if ((nbytes + inc) > maximum) {
				 	break;
				 }
				 nbytes += inc;
				 msg += ch;
			 }
			 return msg;
		}
	 	
		$(document).on("keyup", "#EVT_IMG_NM", function(){
			
			var maximumCount 	= 50;
			var str 			= $("#EVT_IMG_NM").val();
			var now 			= calculate_msglen(str);
			
			if(now > maximumCount){
				alert("글자 입력수가 초과하였습니다.");
				$("#EVT_IMG_NM").val(assert_msglen(str, maximumCount));
				now = calculate_msglen($("#EVT_IMG_NM").val());
			}
			
			$("#nm_num").text('(' + (maximumCount - now) + '자)');
		});
		
		$(document).on("keyup", "#EVT_IMG_CTS", function(){
			
			var maximumCount 	= 500;
			var str 			= $("#EVT_IMG_CTS").val();
			var now 			= calculate_msglen(str);
			
			if(now > maximumCount){
				alert("글자 입력수가 초과하였습니다.");
				$("#EVT_IMG_CTS").val(assert_msglen(str, maximumCount));
				now = calculate_msglen($("#EVT_IMG_CTS").val());
			}
			
			$("#cts_num").text('(' + (maximumCount - now) + '자)');
		});
		
		$('.inp_box label').on('click', function(){
			var _this = $(this);
				
			_this.addClass('on').find('input').prop('checked', true);
			_this.siblings().removeClass('on').find('input').prop('checked', false);
			return false;

		});
		
		$(document).on("click", ".btn_bl_k", function(){
		
			if($("#EVT_IMG_NM").val() == ""){
				alert("제목을 입력해주세요.");
				$("#EVT_IMG_NM").focus();
				return;
			}
			if($("#EVT_IMG_CTS").val() == ""){
				alert("내용을 입력하세요.");
				$("#EVT_IMG_CTS").focus();
				return;
			}
			
			if($("#multiFile").val() == ""){
				alert("파일을 첨부하세요.");
				return;
			}
			
			if($(':radio[name="rad"]:checked').val() == 'N'){
				alert("약관에 동의 하셔야 합니다.");
				return;
			}
			
			$("#EVT_AGT").val(checkAgt());
			if (confirm("저장 하시겠습니까?")) {
				$("#pfrm").attr("action","<c:out value="${frontDomain}" />/pc/event/eventImageRegist.do").submit();
			}
		});
		
		//파일용량, 확장자 체크
		$('#multiFile').bind('change', function() {
			//alert(this.files[0].size);
			var fileSise1 = this.files[0].size;
			var file1 = $("#multiFile").val();
	   		
	   		var extensionF1 = file1; //파일을 추가한 input 박스의 값
	   		extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   		
	   		if(fileSise1 > 3145728){
	   			alert('파일 용량(3MB)만 등록 가능합니다.');
	   			$("#multiFile").val('');
	   			return;
	   		}
	   		
	   		if(extensionF1 != "jpg" && extensionF1 != "png" &&  extensionF1 != "gif"){ //확장자를 확인합니다.
	   			alert('파일(jpg, png, gif)만 등록 가능합니다.');
	   			$("#multiFile").val('');
	   			return;
	   		}       		
		});
		
		
		checkAgt		= function(){
			
			var agt = navigator.userAgent.toLowerCase();
			
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agt.indexOf("msie") != -1) ) {
				return 'Internet Explorer';	
			}else{
				if (agt.indexOf("chrome") != -1) return 'Chrome'; 
				if (agt.indexOf("opera") != -1) return 'Opera'; 
				if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
				if (agt.indexOf("webtv") != -1) return 'WebTV'; 
				if (agt.indexOf("beonex") != -1) return 'Beonex'; 
				if (agt.indexOf("chimera") != -1) return 'Chimera'; 
				if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
				if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
				if (agt.indexOf("firefox") != -1) return 'Firefox'; 
				if (agt.indexOf("safari") != -1) return 'Safari'; 
				if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
				if (agt.indexOf("netscape") != -1) return 'Netscape'; 
				if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'; 
				if (agt.indexOf("msie") != -1) return 'Internet Explorer';
			}
		};
		
		$(document).ready(function(){
			com.pop_chk(false);
		});
	</script>
</section>
<!--// #wrap E -->
</body>
</html>
