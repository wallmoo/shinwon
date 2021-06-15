<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-kinger">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->


			<!-- .king_sub S -->
			<section class="king_sub king_rev">
				<!-- .king_hd S -->
				<div class="king_hd">
					<h2 class="logo_kinger"><a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do"><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/logo_kinger.png" alt="KINGER 마켓플랜트 프리미엄 1% 고객 체험단. 킹저" /></a></h2>
				</div>
				<!--// .king_hd E -->
				<div class="king_con">
					<h2 class="con_ti">
						<strong>KINGER <c:out value="${info.EXP_KINGER_CD }" />모집</strong>
						<a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do?cPage=<c:out value="${commandMap.page }" />" class="btn_close"><span class="ir">이전 페이지로</span></a>
					</h2/>
					
					<ul class="ct king_info">
						<li class="img_d">
							<c:choose>
								<c:when test="${info.DDAY >= 0  }">
									<i class="ico_day"><span class="blind">Kinger</span><strong>d-<c:out value="${info.DDAY }" /></strong></i>
								</c:when>
								<c:when test="${info.DDAY < 0 && info.WINCNT > 0}">
									<i class="ico_dang"><span class="blind">Kinger</span><strong>당첨발표</strong></i>
								</c:when>
								<c:when test="${info.DDAY < 0 && info.WINCNT eq 0}">
									<i class="ico_end"><span class="blind">Kinger</span><strong>모집종료</strong></i>
								</c:when>
							</c:choose>
							<img src="<c:out value="${cdnDomain }${info.PRD_IMG_URL_PATH }" />" alt="<c:out value="${info.PRD_IMG_ALT_TEXT }" />" class="img_king_pr" >
							<a href="<c:out value="${frontDomain }" />/pc/product/product.do?prdMstCd=<c:out value="${info.PRD_MST_CD }" />" class="btn_dte" target="_blank">
								<strong>제품 자세히 보기</strong>
								<i class="ico_line">
									<i class="ico_l"></i>
									<i class="ico_r"></i>
								</i>
							</a>
						</li>
						<li class="info">
							<dl>
								<dt class="ti">
									<h3><c:out value="${info.EXP_MST_NM }" escapeXml="false"/></h3>
									<h4><c:if test="${not empty row.PRD_ERP_CD }" ><c:out value="${info.PRD_ERP_CD }" /></c:if></h4>
									<p><ui:replaceLineBreak content="${info.EXP_MST_SUB_NM }" /></p>
								</dt>
								<dd class="tx_d">
									<p>
										<strong>모집기간</strong>
										<span><ui:formatDate value="${info.EXP_MST_RCT_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EXP_MST_RCT_ED_DT }" pattern="yyyy.MM.dd"/></span>
									</p>
									<p>
										<strong>모집인원</strong>
										<span><c:out value="${info.EXP_MST_WIN_CNT }" />명</span>
									</p>
									<p>
										<strong>당첨자 발표</strong>
										<span><ui:formatDate value="${info.EXP_MST_WIN_DT }" pattern="yyyy.MM.dd"/></span>
									</p>
									<p>
										<strong>활동기간</strong>
										<span><ui:formatDate value="${info.EXP_MST_ATV_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EXP_MST_ATV_ED_DT }" pattern="yyyy.MM.dd"/></span>
									</p>
								</dd>
								<dd class="king_ask">
									<i class="ico_king"></i>
									<strong><c:out value="${info.EXP_MST_ETR_CNT }" /></strong>
									<span>명 신청</span>
								</dd>
								<dd class="king_benefit">
									<strong>KINGER 당첨혜택!</strong>
									<ol>
										<ui:replaceLineBreak content="${info.EXP_MST_BNF }"  />
									</ol>
								</dd>
							</dl>
						</li>
						<li><i class="ico_pan"></i></li>
					</ul>
					
					<c:choose>
						<c:when test="${info.DDAY >= 0 }" >
				
					<!-- .king_ask_box S -->
					<dl class="king_ask_box">
						<dt><i></i><strong>Kinger</strong><span>신청은 이렇게</span><i></i></dt>
						<dd class="step">
							<ol>
								<li class="step1">
									<strong>Step 1</strong>
									<span>Kinger 모집 페이지<br/>스크랩하기</span>
								</li>
								<li class="step2">
									<strong>Step 2</strong>
									<span>블로그 URL과<br/>신청글 남기기</span>
								</li>
								<li class="step3">
									<strong>Step 3</strong>
									<span>마켓플랜트<br/>Kinger 신청완료</span>
								</li>
							</ol>
						</dd>
						<dd class="form">
							<table>
								<caption></caption>
								<colgroup>
								<col style="width:307px" />
								<col />
								</colgroup>
								<tbody>
									<tr class="tr_link">
										<th>
											<strong>블로그 또는 SNS에 <br/>KINGER 모집 페이지 스크랩 하기</strong>
										</th>
										<td>
											<a href="javascript:void(0)" class="" id="blogScrap"><strong>블로그 스크랩 하기</strong></a>
											<a href="javascript:void(0)" class=" l" id="snsScrap"><strong>SNS 스크랩하기</strong></a>
										</td>
									</tr>
									<tr class="tr_inp">
										<th rowspan="3">
											<strong>스크랩한 블로그 URL과 <br/>신청글을 남겨주세요.</strong>
											<span>(신청글은 로그인 후 등록 가능)</span>
										</th>
										<td>
											<div class="inp_box">
												<span class="inp_ti">블로그 URL <i class="co_red">*</i></span>
												<label for="inp_blog"><input type="text" id="inp_blog" value="" /></label>
											</div>
										</td>
									</tr>
									<tr class="tr_inp">
										<td>
											<div class="inp_box">
												<span class="inp_ti">SNS URL</span>
												<label for="inp_sns"><input type="text" id="inp_sns" value=""  /></label>
											</div>
										</td>
									</tr>
									<tr class="tr_inp">
										<td>
											
											<div class="inp_box">
												<span class="inp_ti">신청글 <i class="co_red">*</i><span class="tx_num">(0/220)</span></span>
												<label for="txt_msg"><textarea id="txt_msg"></textarea></label>
											</div>
											<a href="javascript:void(0)" class="btn_bl_k" id="kingerReq"><strong>신청하기</strong></a>
										</td>
									</tr>
								</tbody>								
							</table>
						</dd>
					</dl>
					</c:when>
					</c:choose>

					<!-- .king_ask_box E -->
					<!-- .king_activ_box S -->
					<c:choose>
					<c:when test="${info.DDAY >= 0 }" >
					<dl class="king_activ_box"></dl>
					</c:when>
					<c:otherwise>
					<dl class="king_activ_box">
						<dt><i></i><strong>Kinger</strong> <span>활동은 이렇게</span><i></i></dt>
						<dd class="step">
							<ol>
								<li class="step1">
									<span>로그인 후 당첨 확인</span>
									<strong>Step 1</strong>
									<c:choose>
										<c:when test="${info.WINCNT > 0}">
											<a href="<c:out value="${frontDomain}"/>/pc/marketing/kingerWinView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />"  target="_blank"><span>Kinger 당첨자 발표</span></a>
										</c:when>
										<c:otherwise>
											<a href="javascript:alert('KINGER 당첨자 발표 후에 확인 해주세요.');"><span>Kinger 당첨자 발표</span></a>
										</c:otherwise>
									</c:choose>
								</li>
								<li class="step2">
									<span>Kinger 미션확인 및 동의서 제출</span>
									<strong>Step 2</strong>
									<a href="<c:out value="${frontDomain}"/>/pc/marketing/kingerMissionInfo.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />" id="missionLink" target="_blank"><span>KINGER 미션 확인 및 동의서 제출하기</span></a>
								</li>
								<li class="step3">
									<span>상품을 체험 후 리뷰 등록</span>
									<strong>Step 3</strong>
									<a href="javascript:void(0)" id="reviewReg"><span>리뷰 등록하기</span></a>
								</li>
								<li class="tx_ex">
									<span>동의서를 제출하셔야 Kinger 리뷰등록이 가능합니다.</span>
								</li>
							</ol>
						</dd>
					</dl>
					</c:otherwise>
					</c:choose>
					<div class="king_tab">
						<div class="tab_mn">
							<a href="javascript:void(0)" class="f on" id="req"><span>KINGER 신청글(<em id="reqCnt"><c:out value="${reqPaging.totalRecordCount }" /></em>)</span></a>
							<a href="javascript:void(0)" class="l" id="rev"><span>KINGER 리뷰(<em id="revCnt"><c:out value="${reviewPaging.totalRecordCount }" /></em>)</span></a>
						</div>
						<div class="my_btn">
							<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y' and iMyReqCnt  > 0}">	
								<a href="javascript:void(0);" id="myAsk" ><span>MY 신청글 보기</span></a>
							</c:if>
							<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y' and iMyRevCnt> 0}">							
								<a href="javascript:void(0);" id="myRev" style="display:none;"><span>MY리뷰보기</span></a>
							</c:if>
						</div>
						
						<ol class="ask_list"><!--신청글 : ask_list // 리뷰: rev_list -->
						<c:choose>
							<c:when test="${empty reqList}">
							<li class="no_list">
								<strong>등록된 글이 없습니다.</strong>
							</li>
							</c:when>
							<c:otherwise>
							<c:set var="reqlistNum" value="${reqPaging.listNum}" />
							<c:forEach var="ask" items="${reqList}" varStatus="askSta">
							<c:set var="askClsNm" value="" />
							
							<c:if test="${askSta.count mod 3 == 0 }">
								<c:set var="askClsNm" value="l" />
							</c:if>
							<c:if test="${askSta.first || askSta.count mod 3 == 1 }">
								<c:set var="askClsNm" value="f" />
							</c:if>
							<li class="<c:out value="${askClsNm }" />" >
								<c:if test="${ask.MEM_MST_MEM_ID eq commandMap.MEM_MST_MEM_ID}"><a href="javascript:void(0)" class="ico_close" data-exp_etr_idx="<c:out value="${ask.EXP_ETR_IDX }" />" id="askDel"><span class="ir">신청글 삭제</span></a></c:if>
								<strong class="no_num">No.<c:out value="${reqlistNum }" /></strong>
								<strong class="tx_name"><c:out value="${ask.HID_MEM_MST_MEM_ID }" /></strong>
								<p class="tx_con">
									<ui:replaceLineBreak content="${ask.EXP_ETR_CMT }" />
								</p>
								<span class="tx_date"><ui:formatDate value="${ask.EXP_ETR_REG_DT }" pattern="yyyy.MM.dd"/></span>
								<a href="<c:if test="${fn:indexOf(ask.EXP_ETR_BLG_URL, 'http://') != 0}">http://</c:if><c:out value="${ask.EXP_ETR_BLG_URL}" />" class="btn_blog"  target="_blank" ><span>블로그 바로가기</span></a>
							</li>
							<c:set var="reqlistNum" value="${reqlistNum -1}" />
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</ol>
						<div class="section-pagination" id="ask_pg" style="padding:30px 0;">
							<ui:frontpaging paging="${reqPaging }" jsFunction="goReqPage" />
						</div>
						
						<ol class="rev_list" style="display:none;"><!--신청글 : ask_list // 리뷰: rev_list -->
						<c:choose>
							<c:when test="${empty reviewList }">
								<li class="no_list">
									<strong>등록된 글이 없습니다.</strong>
								</li>
							</c:when>
							<c:otherwise>
						<c:set var="reviewlistNum" value="${reviewPaging.listNum}" />
						<c:set var="revcnt" value="0" />
						<c:forEach var="rev" items="${reviewList}" varStatus="revSta">
							<c:set var="revClsNm" value="" />
							<c:if test="${revSta.count mod 3 == 0 }">
								<c:set var="revClsNm" value="l" />
							</c:if>
							<c:if test="${revSta.first || revSta.count mod 3 == 1 }">
								<c:set var="revClsNm" value="f" />
							</c:if>
							<li class="<c:out value="${revClsNm }" />" >
								<a href="javascript:void(0)" class="ico_close" data-exp_rev_idx="<c:out value="${rev.EXP_REV_IDX }" />" id="revLink">
									<img src="<c:out value="${cdnDomain }${rev.CMM_FLE_SAVE_PATH }" />" alt="" />
									<strong class="tx_ti"><c:out value="${rev.EXP_REV_NM }" /></strong>
									<span class="tx_con"><c:out value="${rev.EXP_REV_SUB_NM }" /></span>
								</a>
								<strong class="tx_id">
									<c:out value="${rev.HID_MEM_MST_MEM_ID }" />
									<c:if test="${rev.MEM_MST_MEM_ID eq commandMap.MEM_MST_MEM_ID }">
									<a href="javascript:void(0)" class="btn_edt" data-exp_rev_idx="<c:out value="${rev.EXP_REV_IDX }" />" ><span>수정</span></a>
									</c:if>
								</strong>
							</li>
							<c:set var="revcnt" value="${revSta.count }" />
						</c:forEach>
						<c:if test="${revcnt mod 3 != 0 }">
							<c:forEach varStatus="sta" step="1" begin="1" end="${3 - (revcnt mod 3)}">
								<li <c:if test="${sta.last }">class="l"</c:if>></li>
							</c:forEach>
						</c:if>
							</c:otherwise>
						</c:choose>
						</ol>
						<div class="section-pagination" id="rev_pg" style="padding:30px 0; display:none;" >
							<ui:frontpaging paging="${reviewPaging }" jsFunction="goRevPage" />
						</div>
					</div>
					<!-- .king_activ_box E -->
				</div>
				<!-- .king_con E -->
			</section>
			<!--// .king_sub E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<input type="hidden" name="myAskVal" id="myAskVal" />
	<input type="hidden" name="myRevVal" id="myRevVal" />
	
	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	 <script type="text/javascript">
    	$(function(){
    		var url = $(location).attr('href');
    		
    		$(document).on("click", "#blogScrap", function(){
    			var ieUrl	= "<a href='"+ url +" target='_blank'><img src='<c:out value="${cdnDomain}${info.CMM_FLE_SAVE_PATH}" />'></a>";
    			
    			if(navigator.userAgent.indexOf("MSIE") > -1  == true|| navigator.userAgent.indexOf("Trident") > -1 == true){
    				window.clipboardData.setData('Text', ieUrl);
    				alert("주소가 복사되었습니다. 소문낼 게시판에서 Ctrl+V 또는 붙여넣기를 하세요"); 
    			}else{
    				prompt('Ctrl+C를 눌러 클립보드로 복사하세요', ieUrl);
    			}
    			
    		});
    		
			$(document).on("click", "#snsScrap", function(){
				var ieUrl	= "<a href='"+ url +" target='_blank'><img src='<c:out value="${cdnDomain}${info.CMM_FLE_SAVE_PATH}" />'></a>";
				
				if(navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident") > -1){
					//console.log("!!");
    				window.clipboardData.setData('Text', ieUrl);
    				alert("주소가 복사되었습니다. 소문낼 게시판에서 Ctrl+V 또는 붙여넣기를 하세요"); 
    			}else{
    				prompt('Ctrl+C를 눌러 클립보드로 복사하세요', ieUrl);
    			}
    		});
    	
			$(document).on("keyup", "#txt_msg", function(){
				var maximumCount 	= 220;
				var str 			= $("#txt_msg").val();
				var now 			= calculate_msglen(str);
				
				if(now > maximumCount){
					alert("글자 입력수가 초과하였습니다.");
					$("#txt_msg").val(assert_msglen(str, maximumCount));
					now = calculate_msglen($("#txt_msg").val());
				}
				
				$(".tx_num").text('('+ now + '/'+ maximumCount + ')');
			});
				
			$("#inp_blog").keyup(function(event){
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9/:.]/gi,''));
				}
			});
			
			$("#inp_sns").keyup(function(event){
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9/:.]/gi,''));
				}
			});
			
			$(document).on("click", "#kingerReq", function(){
				// 세션 부분 처리 추가
				var blogVal		= $("#inp_blog").val();
				var snsVal		= $("#inp_sns").val();
				var txtMsgVal	= $("#txt_msg").val();
				
				if(blogVal == ""){
					alert("블로그 URL을 입력하세요.");
					$("#inp_blog").focus();
					return;
				}else{
					if(!checkDetailUrl(blogVal)){
						alert("유효한 URL 이 아닙니다.");
						$("#inp_blog").focus();
						return;
					}
				}
				
				if(blogVal.length > 200){
					alert("블로그 URL작성은 200자까지만 적용됩니다.");
					$("#inp_blog").focus();
					return;
				}
				
				if(snsVal != ""){
					if(!checkDetailUrl(snsVal)){
						alert("유효한 URL 이 아닙니다.");
						$("#inp_sns").focus();
						return;
					}
				}
				
				if(txtMsgVal == ""){
					alert("신청글을 입력해주세요.");
					$("#txt_msg").focus();
					return;
				}
				
				if(calculate_msglen(txtMsgVal) > 220){
					alert("메시지는 영문 220글자,한글 110글자까지  입력할수있습니다.");
					$("#txt_msg").focus();
					return;
				}
				
				$.ajax({
					type	: "POST",
					url		: "/pc/marketing/kingerReqAjax.do",
					dataType: "json",
					data	: {	"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD }" />"
							   ,"EXP_ETR_SNS_URL" 	: $("#inp_sns").val()
							   ,"EXP_ETR_BLG_URL"	: $("#inp_blog").val()
							   ,"EXP_ETR_CMT" 		: $("#txt_msg").val()
								},
					success : function(data) {
						alert(data.resultMsg);
						// 값 초기화.
						$("#inp_sns").val('');
						$("#inp_blog").val('');
						$("#txt_msg").val('');
						// my 신청글 버튼 처리 
						if(data.iCnt == 1){
							$(".my_btn").html('<a href="javascript:void(0);" id="myAsk" ><span>MY 신청글 보기</span></a>');
						}
						goReqPage(1);
						
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
				
			});
			
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
		 	
		 	$(document).on("click", "#req", function(){
	    		if(!$("#req").hasClass()){
	    			$("#req").addClass("on");
	    		}
	    		$("#rev").removeClass("on");
	    		$(".ask_list").show();
	    		$("#ask_pg").show();
	    		$("#myAsk").show();
	    		$(".rev_list").hide();
	    		$("#rev_pg").hide();
	    		$("#myRev").hide();
	    	});
	    	
			$(document).on("click", "#rev", function(){
				if(!$("#rev").hasClass()){
	    			$("#rev").addClass("on");
	    		}
	    		$("#req").removeClass("on");
	    		$(".ask_list").hide();
	    		$("#ask_pg").hide();
	    		$("#myAsk").hide();
	    		$(".rev_list").show();
	    		$("#rev_pg").show();
	    		$("#myRev").show();
	    	});
	    	
			$(document).on("click", "#askDel", function(){
				if(confirm("삭제하시겠습니까??")){
					$.ajax({
						type	: "POST",
						url		: "/pc/marketing/kingerReqDelAjax.do",
						dataType: "json",
						data	: {	"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD }" />"
								   ,"EXP_ETR_IDX": $(this).data("exp_etr_idx")
									},
						success : function(data) {
							alert(data.resultMsg);
							if(data.iCnt == 0){
								$(".my_btn").html('');
							}
							goReqPage(1);
						}, error : function(err) {
							window.jquery
								|| console.log('오류가 발생하였습니다: ' + err.status);
						}
					});
				}
			});
			
			goReqPage		= function(page){
				$.ajax({
					type		: "POST",
					url			: "/pc/marketing/kingerReqListAjax.do",
					dataType	: "json",
					data		: {	"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD }" />"
							   		,"reqCPage": page
							   		, "MYASK" : $("#myAskVal").val()
									},
					success : function(data) {
						var innerHtml	= "";
						
						if(data.totalPageCount == 0){
							innerHtml = "";
						}else{
							
							var listNum		= data.listNum;
							$.each(data.resultMap.reqList, function(i,item){
								var clsNm	= "";

								if(i == 0 || (i+1) % 3 == 1){
									clsNm = "f"
								}else if(i == data.resultMap.reqList.length - 1 || (i + 1) % 3 == 0){
									clsNm = "l";
								}else {
									clsNm = "";
								}
								
								innerHtml +='<li class="' + clsNm + '">';
								<c:if test="${not empty commandMap.MEM_MST_MEM_ID}">
								if(item.MEM_MST_MEM_ID == '<c:out value="${commandMap.MEM_MST_MEM_ID}" />'){
									innerHtml +='<a href="javascript:void(0)" class="ico_close" data-exp_etr_idx="' + item.EXP_ETR_IDX + '" id="askDel"><span class="ir">신청글 삭제</span></a>';
								}
								</c:if>
								innerHtml +='<strong class="no_num">No.' + listNum +' </strong>';
								innerHtml +='<strong class="tx_name">'+ item.HID_MEM_MST_MEM_ID + '</strong>';
								innerHtml +='<p class="tx_con">' + item.EXP_ETR_CMT +'</p>';
								innerHtml +='<span class="tx_date">' + item.EXP_ETR_REG_DT_PAT +'</span>';
								innerHtml +='<a href="' + item.EXP_ETR_BLG_URL +'" class="btn_blog" target="_blank" ><span>블로그 바로가기</span></a>';
								innerHtml +='</li>';
								listNum 	= listNum - 1;
							});
							
							$(".ask_list").html(innerHtml);
							
							var firstPageNo 				= data.firstPageNo;
				            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
				            var totalPageCount 				= data.totalPageCount;
				            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
				            var cPage 						= data.cPage;
				            var lastPageNo 					= data.lastPageNo;
				            var pageSize 					= data.pageSize;
				            var pagingSize 					= data.pagingSize;
				            
				            innerHtml 	= "";
				            
				            if(totalPageCount > pagingSize){
				            	if(firstPageNoOnPageList > pagingSize){
				            		innerHtml += '<a class="nav first" href="javascript:goReqPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
				            		innerHtml += '<a class="nav prev" href="javascript:goReqPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
				            	}else{
				            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
				            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
				            	}
				            }else{
				            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
				            }
				            
				            
				            if (lastPageNoOnPageList > totalPageCount){
				                lastPageNoOnPageList = totalPageCount;
				            }
			            	
			            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
			            		
				                if(i==cPage){
				                	innerHtml +='<a href="javascript:void(0)" class="num active">' + i + '</a>';
				                }else{
				                	innerHtml +='<a href="javascript:goReqPage(' + i + ')" class="num">' + i + '</a>';
				                }
				            }
				            	
			            	if(totalPageCount > pagingSize){
				                if(lastPageNoOnPageList < totalPageCount){
				                	innerHtml +='<a class="nav next" href="javascript:goReqPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
				                	innerHtml +='<a class="nav last" href="javascript:goReqPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
				                }else {
				                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
				                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
				                }
				            } else {
				            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
			                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
				            }
				            	
				            $("#ask_pg").html(innerHtml);
				            
						}
						$("#reqCnt").text(data.totalRecordCount);
						$(".king_ask > strong").text(data.totalRecordCount);
						
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}; // goReqPage end
			
			goRevPage		= function(page){
				
				//console.log($("#myRevVal").val());
				$.ajax({
					type		: "POST",
					url			: "/pc/marketing/kingerRevListAjax.do",
					dataType	: "json",
					data		: {	"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD }" />"
							   		,"reviewCPage": page
							   		, "MYREVIEW" : $("#myRevVal").val()
									},
					success : function(data) {
						var innerHtml	= "";
						
						if(data.totalPageCount == 0){
							innerHtml = "";
						}else{
							
							var listNum		= data.listNum;
							var revcnt		= 0;
							
							$.each(data.resultMap.revList, function(i,item){
								var clsNm	= "";
								
								if(i == 0 || (i+1) % 3 == 1){
									clsNm = "f"
								}else if((i + 1) % 3 == 0){
									clsNm = "l";
								}else {
									clsNm = "";
								}
								
								innerHtml +='<li class="' + clsNm + '">';
								innerHtml +='<a href="javascript:void(0)" class="ico_close">';
								innerHtml +='<img src="<c:out value="${cdnDomain}" />'+ item.CMM_FLE_SAVE_PATH +'" alt="" />';
								innerHtml +='<strong class="tx_ti">' + item.EXP_REV_NM + '</strong>';
								innerHtml +='<span class="tx_con">' + item.EXP_REV_SUB_NM + '</span>';
								innerHtml +='<strong class="tx_id">' + item.HID_MEM_MST_MEM_ID;
								if(item.MEM_MST_MEM_ID == "<c:out value="${commandMap.MEM_MST_MEM_ID }" />"){ 
									innerHtml +='<a href="javascript:void(0)" class="btn_edt" data-exp_rev_idx="'+ item.EXP_REV_IDX +'"><span>수정</span></a>';
								}
								innerHtml +='</strong>';
								innerHtml +='</a>';
								innerHtml +='</li>';
								listNum 	= listNum - 1;
								
								revcnt++;
							});
							
							if(revcnt % 3 != 0){
								for(j=0;j < 3 -(revcnt % 3 ); j++) {
									if((j + 2) % 3 == 0){
										innerHtml	+= '<li class=\"l\"></li>';
									}else{
										innerHtml	+= '<li></li>'
									}
								}
							}
							
							$(".rev_list").html(innerHtml);
							
							var firstPageNo 				= data.firstPageNo;
				            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
				            var totalPageCount 				= data.totalPageCount;
				            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
				            var cPage 						= data.cPage;
				            var lastPageNo 					= data.lastPageNo;
				            var pageSize 					= data.pageSize;
				            var pagingSize 					= data.pagingSize;
				            
				            innerHtml 	= "";
				            
				            if(totalPageCount > pagingSize){
				            	if(firstPageNoOnPageList > pagingSize){
				            		innerHtml += '<a class="nav first" href="javascript:goRevPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
				            		innerHtml += '<a class="nav prev" href="javascript:goRevPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
				            	}else{
				            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
				            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
				            	}
				            }else{
				            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
				            }
				            
				            
				            if (lastPageNoOnPageList > totalPageCount){
				                lastPageNoOnPageList = totalPageCount;
				            }
			            	
			            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
			            		
				                if(i==cPage){
				                	innerHtml +='<a href="javascript:void(0)" class="num active">' + i + '</a>';
				                }else{
				                	innerHtml +='<a href="javascript:goRevPage(' + i + ')" class="num">' + i + '</a>';
				                }
				            }
				            	
			            	if(totalPageCount > pagingSize){
				                if(lastPageNoOnPageList < totalPageCount){
				                	innerHtml +='<a class="nav next" href="javascript:goRevPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
				                	innerHtml +='<a class="nav last" href="javascript:goRevPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
				                }else {
				                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
				                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
				                }
				            } else {
				            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
			                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
				            }
				            	
				            $("#rev_pg").html(innerHtml);
				            
						}
						
						$("#revCnt").text(data.totalRecordCount);
						
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}; // goRevPage end

			$(document).on("click", "#reviewReg", function(){
			<c:choose>
				<c:when test="${info.ATVDAY >= 0 }">
					<c:if test="${commandMap.MEM_LOGIN_YN eq 'N'}">
						if(confirm("로그인 후에 이용 가능한 서비스입니다.")){
							var url = location.href;
					    	url = encodeURIComponent(url);
					        window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
						}
		        	</c:if>
		        	<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y'}">
						window.open("<c:out value="${frontDomain}" />/pc/marketing/kingerReviewPopUpWrite.do?EXP_MST_CD=<c:out value="${commandMap.EXP_MST_CD}" />", "review", "width=891px, heigth=905px");
					</c:if>
				</c:when>
				<c:otherwise>
					alert("KINGER 리뷰 등록 기간이 종료되었습니다.");
				</c:otherwise>
			</c:choose>	
			});
			
			$(document).on("click", "#revLink", function(){
				var exp_rev_idx = $(this).data("exp_rev_idx");
				location.href="<c:out value="${frontDomain}" />/pc/marketing/kingerRevView.do?EXP_REV_IDX="+exp_rev_idx;				
			});
    	
			<c:if test="${info.DDAY < 0}">
				if(!$("#rev").hasClass()){
	    			$("#rev").addClass("on");
	    		}
	    		$("#req").removeClass("on");
	    		$(".ask_list").hide();
	    		$("#ask_pg").hide();
	    		$("#myAsk").hide();
	    		$(".rev_list").show();
	    		$("#rev_pg").show();
	    		$("#myRev").show();
			</c:if>
			
    	});
    	
    	<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y' and iMyReqCnt > 0 }">
    		$(document).on("click", "#myRev", function(){
    			if($("#myRevVal").val() == 'Y'){
    				$("#myRevVal").val('');
    				$("#myRev > span").text("MY리뷰보기");
    			}else{
    				$("#myRevVal").val("Y");
    				$("#myRev > span").text("전체리뷰보기");
    			}
    			goRevPage(1);
    		});
    		
			$(document).on("click", "#myAsk", function(){
				if($("#myAskVal").val() == 'Y'){
					$("#myAskVal").val("");
					$("#myAsk > span").text("MY 신청글 보기");
					
    			}else{
    				$("#myAskVal").val("Y");
    				$("#myAsk > span").text("전체 신청글보기");
    			}
				goReqPage(1);
    		});
    		
    	</c:if>
    	
    	<c:if test="${commandMap.MEM_LOGIN_YN eq 'N'}">
    	
	    	var blog = $('#inp_blog');
	    	var sns	= $("#inp_sns");
	    	var msg	= $("#txt_msg");
	    	var url = location.href;
	    	url = encodeURIComponent(url);
	    	
	    	blog.focus(function(){
	        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	    	});
	    	
	    	sns.focus(function(){
	        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");    		
	    	});
	    	
	    	msg.focus(function(){
	        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	    	});
	    </c:if>
	    
	    function checkDetailUrl(strUrl) {
		    var expUrl = /^(http\:\/\/)?((\w+)[.])+(asia|biz|cc|cn|com|de|eu|in|info|jobs|jp|kr|mobi|mx|name|net|nz|org|travel|tv|tw|uk|us)(\/(\w*))*$/i;
		    return expUrl.test(strUrl);
		}
	    
	    $(document).on("click", ".btn_edt", function(){
	    	var exp_rev_idx = $(this).data("exp_rev_idx");
	    	<c:choose>
			<c:when test="${info.ATVDAY >= 0 }">
				<c:if test="${commandMap.MEM_LOGIN_YN eq 'N'}">
				if(confirm("로그인 후에 이용 가능한 서비스입니다.")){
					var url = location.href;
			    	url = encodeURIComponent(url);
			        window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
				}
		    	</c:if>
		    	<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y'}">
					window.open("<c:out value="${frontDomain}" />/pc/marketing/kingerReviewPopUpEdit.do?EXP_MST_CD=<c:out value="${commandMap.EXP_MST_CD}" />&EXP_REV_IDX="+ exp_rev_idx, "review", "width=891px, heigth=905px");
				</c:if>					
			</c:when>
			<c:otherwise>
				alert("KINGER 리뷰 등록 기간에만 수정이 가능합니다.");
			</c:otherwise>
		</c:choose>
	    });
    </script>
</section>
<!--// #wrap E -->
</body>
</html>
				
