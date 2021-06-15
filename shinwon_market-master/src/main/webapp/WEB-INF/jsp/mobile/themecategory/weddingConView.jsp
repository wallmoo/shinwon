<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-thema">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>웨딩</h2>
            <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
            <div class="btn_r">
				<a href="javascript:$.com.util.layPop('open', $('#layShare'))" class="btn_share"><em class="blind">쇼핑기획전 공유하기</em></a>
				<a href="javascript:insertKeepingContents(<c:out value="${info.MGZ_MST_IDX}" />);" class="btn_hart"><em class="blind">쇼핑기획전 찜하기</em></a>
			</div>
        </div>
        
		<!--// .section-title E -->
		
		<!-- .wedding_vw S -->
		<section class="thema_vw wedding_vw">
			<hgroup>
				<h4><c:out value="${info.MGZ_MST_THM_CTG2_NM }" /> > <c:out value="${info.MGZ_MST_THM_CTG3_NM }" /></h4>
				<h3><c:out value="${info.MGZ_MST_SRS }" /></h3>			
				<h2><c:out value="${info.MGZ_MST_TITLE }" /></h2>
			</hgroup>
			<div class="tx_con">
				<c:out value="${info.MGZ_MST_CTS }" escapeXml="false" />
			</div>
			
			<!-- .pr_relation S -->
			<dl class="pr_relation">
				<dt>
					<strong>연관상품</strong>
					<hr class="hr_3px_st1" />
				</dt>
				<dd>
					<ul class="ui-grid-a">
					<c:forEach var="row" items="${list }" varStatus="sta">
					<c:set var="classNm" value="a" />
					<c:if test="${sta.count mod 2 == 0 }">
					<c:set var="classNm" value="b" />
					</c:if>
						<li class="ui-block-<c:out value="${classNm }" />" >
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');" class="_pg_link" target="_blank">
								<span class="tx_img"><img data-original="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" src="<c:out value="${cdnDomain }" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
								<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
								<strong class="tx_sale">
									<fmt:formatNumber value="${row.PRD_MST_PRICE}" groupingUsed="true" /><span>원</span>
								</strong>
								<strong class="tx_price">
									<fmt:formatNumber value="${row.PRD_MST_PRC}" groupingUsed="true" /><span>원</span>
								</strong>
							</a>
						</li>
					</c:forEach>
					</ul>
				</dd>
			</dl>
			<!--// .pr_relation E -->
			<!-- .thema_qa S -->
			<dl class="thema_qa">
				<dt class="">“궁금한 내용을 질문해 주세요~”</dt>
				<dd>
					<div class="inp_box">
						<label for="">
							<input type="text" name="txt_msg" id="txt_msg" placeholder="로그인 후 질문해 주세요" />
						</label>
						<a href="javascript:void(0)" id="qnaReq"><strong>질문하기</strong></a>
					</div>
					<span class="tx_num">0/200 bye</span>
				</dd>
			</dl>
			<!--// .thema_qa E -->

		</section>
		<!--// .wedding_vw E -->
		
		<!-- 공유 -->
		<!-- #layKeep S -->
		<section id="layShare" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
			<dl class="ui-content">
				<dt>
					<h2>공유하기 팝업</h2>
					<a href="javascript:$.com.util.layPop('close', $('#layShare'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
				</dt>
				<dd class="dd_evSns">
					<div class="btn_sns" style="padding-bottom:0">
						<a href="javascript:goProductKakaoStory();" class="btn_kk"><span class="ir"></span></a>
						<a href="javascript:goProductTwitter();" class="btn_tw"><span class="ir"></span></a>
						<a href="javascript:goProductFacebook();" class="btn_fb"><span class="ir"></span></a>
					</div>
				</dd>
				<dd class="btn_box">
					<a href="javascript:$.com.util.layPop('close', $('#layShare'))" class="btn_wht"><strong>닫기</strong></a>
				</dd>
			</dl>
		</section>
		<!--//#layKeep E -->
		
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<script type="text/javascript">

	calculate_msglen = function(message) {
		var nbytes = 0;
		
		for (i=0; i<message.length; i++) {
			var ch = message.charAt(i);
			if(escape(ch).length > 4) {
				 nbytes += 2;
			} else if (ch == '\n') {
				 if (message.charAt(i-1) != '\r') {
				 nbytes += 1;
		 		}
		 	} else if (ch == '<' || ch == '>') {
		 		nbytes += 4;
		 	} else {
		 		nbytes += 1;
		 	}
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
			 if (escape(ch).length > 4) {
				 inc = 2;
			 } else if (ch == '\n') {
			 	if (message.charAt(i-1) != '\r') {
					 inc = 1;
			 	}
			 } else if (ch == '<' || ch == '>') {
			 	inc = 4;
			 } else {
			 	inc = 1;
			 }
			 
			 if ((nbytes + inc) > maximum) {
			 	break;
			 }
			 nbytes += inc;
			 msg += ch;
		 }
		 return msg;
	}
	
	$(document).on("keyup", "#txt_msg", function(){
		var maximumCount 	= 200;
		var str 			= $("#txt_msg").val();
		var now 			= calculate_msglen(str);
		
		if(now > maximumCount){
			alert("글자 입력수가 초과하였습니다.");
			$("#txt_msg").val(assert_msglen(str, maximumCount));
			now = calculate_msglen($("#txt_msg").val());
		}
		
		$(".tx_num").text('('+ now + '/'+ maximumCount + ')');
	});
	
	$(document).on("click", "#qnaReq", function(){
		// 세션 부분 처리 추가
		var txtMsgVal	= $("#txt_msg").val();
		
		if(txtMsgVal == ""){
			alert("내용을 입력해주세요.");
			$("#txt_msg").focus();
			return;
		}
		
		if(calculate_msglen(txtMsgVal) > 200){
			alert("메시지는 영문 200글자,한글 100글자까지  입력할수있습니다.");
			$("#txt_msg").focus();
			return;
		}
		
		$.ajax({
			type	: "POST",
			url		: "/mobile/themecategory/qnaReqAjax.do",
			dataType: "json",
			data	: {	"MGZ_MST_IDX" : "<c:out value="${info.MGZ_MST_IDX }" />"
					   ,"MGZ_QNA_QST" 		: $("#txt_msg").val()           
						},
			success : function(data) {
				alert(data.resultMsg);
				// 값 초기화.
				$("#txt_msg").val('');
				//goQnaPage(1);
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	});
	
	// sns kakostory
	goProductKakaoStory = function(){
		
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/themecategory/weddingConView.do?MGZ_MST_IDX=<c:out value='${commandMap.MGZ_MST_IDX}' />&MGZ_MST_THM_CTG2=<c:out value='${commadnMap.MGZ_MST_THM_CTG2}' />&MGZ_MST_THM_CTG3=<c:out value='${commandMap.MGZ_MST_THM_CTG3}' />";
		var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 

		if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
	    	callJavascriptOutlinkPage(url);
	    }else{
	    	var kakoStory = window.open("about:blank");
	    	kakoStory.location.href=url;
	    }
	};
	// sns Twitter
	goProductTwitter = function(){
		
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/themecategory/weddingConView.do?MGZ_MST_IDX=<c:out value='${commandMap.MGZ_MST_IDX}' />&MGZ_MST_THM_CTG2=<c:out value='${commadnMap.MGZ_MST_THM_CTG2}' />&MGZ_MST_THM_CTG3=<c:out value='${commandMap.MGZ_MST_THM_CTG3}' />";
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent("<c:out value="${info.MGZ_MST_TITLE}" />");

		if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
			callJavascriptOutlinkPage(url+"&text="+text);
	    }else{
	    	var twitter = window.open("about:blank");
	    	twitter.location.href="https://twitter.com/share?url="+url+"&text="+text;
	    }
	};
	
	// sns facebook
	goProductFacebook = function(){ 
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/themecategory/weddingConView.do?MGZ_MST_IDX=<c:out value='${commandMap.MGZ_MST_IDX}' />&MGZ_MST_THM_CTG2=<c:out value='${commadnMap.MGZ_MST_THM_CTG2}' />&MGZ_MST_THM_CTG3=<c:out value='${commandMap.MGZ_MST_THM_CTG3}' />"; 
	    var text = encodeURIComponent("<c:out value="${info.MGZ_MST_TITLE}" />");
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    
	    if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
	    	callJavascriptOutlinkPage(url);
	    }else{
	    	var faceBook = window.open("about:blank");
	    	faceBook.location.href=url;
	    }
	}; 
	
	insertKeepingContents = function(MEM_CTS_GBN_IDX){
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
				,"MEM_CTS_GBN" : "M" //기획전:P, 이벤트:E, 매거진:M
			},
			url : "<c:out value="${mobileDomain}" />/pc/contents/insertInterestContentsAjax.do",
			success : function(data) {
				var result = data.result;//0:로그인 필요 1:성공 -1:실패
				if(result == 0){
					if(confirm(data.resultMsg)){
						var url = location.href;
						url = encodeURIComponent(url);
						
						if(appType){
							callJavascriptLoginUrl(url); //app 로그인 연동
						}else{
							url = encodeURIComponent(url);
				        	location.target = "_self";
				        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
						}
					}
				}else{
					alert(data.resultMsg);
				}
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	};
</script>
<!--// #wrap E -->
</body>
</html>