<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-king">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container king_rg_con" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>고객체험단</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .king_con_d S -->
		<section class="king_con_d">
			<header>
				<h3><span class="ir">KINGER</span></h3>
				<span class="tx_sub">마켓플랜트 1% 프리미엄 고객체험단, 킹저</span>
			</header>
			
			<!-- .king_recruit S -->
			<dl class="king_recruit">
				<dt>
					<span class="blind">현제 진행중인 KIBER 모집</span>
					<strong>KINGER <c:out value="${info.EXP_KINGER_CD }" /> <span>모집</span></strong>
				</dt>
				<dd class="dd_info">
					<i class="ico_day">
						<span class="blind">KINGER</span>
						<c:choose>
							<c:when test="${info.DDAY >= 0  }">
								<strong>D-<c:out value="${info.DDAY }" />
							</c:when>
							<c:when test="${info.DDAY < 0 and info.WINCNT eq 0 }">
								<strong class="tx_dang">모집종료</strong>		
							</c:when>
							<c:when test="${info.DDAY < 0 and info.WINCNT > 0 }">
								<strong class="tx_dang">당첨발표</strong>
							</c:when>
						</c:choose>
					</i>
					<c:if test="${not empty info.PRD_IMG_URL_PATH }">
					<div class="img_d">
						<img src="<c:out value="${cdnDomain }${info.PRD_IMG_URL_PATH }" />" alt="<c:out value="${info.PRD_IMG_ALT_TEXT }" />" class="img_king_pr" >
					</div>
					</c:if>
					<p class="tx_d">
						<strong class="tx_prTi"><c:out value="${info.EXP_MST_NM }" /></strong>
						<span class="tx_model"><c:out value="${info.PRD_MST_CPS_MDL }" /></span>
						<span class="tx_con"><c:out value="${info.EXP_MST_SUB_NM }" /></span>
					</p>
					<p class="tx_info">
						<span><span class="tx_ti">모집기간</span><ui:formatDate value="${info.EXP_MST_RCT_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EXP_MST_RCT_ED_DT }" pattern="yyyy.MM.dd"/></span>
						<span><span class="tx_ti">모집인원</span><c:out value="${info.EXP_MST_WIN_CNT }" />명</span>
						<span><span class="tx_ti">당첨자 발표</span><ui:formatDate value="${info.EXP_MST_WIN_DT }" pattern="yyyy.MM.dd"/></span>
						<span><span class="tx_ti">활동기간 </span><ui:formatDate value="${info.EXP_MST_ATV_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EXP_MST_ATV_ED_DT }" pattern="yyyy.MM.dd"/></span>
					</p>
				</dd>
			</dl>
			<!--// .king_recruit E -->
			
			<div class="king_appli">
				<div>
					<span class="blind">현제 KINGER 신청자수</span>
					<span><strong><c:out value="${info.EXP_MST_ETR_CNT }" /></strong>명 신청</span>
				</div>
			</div>

			<dl class="king_benefit">
				<dt>KINGER 당첨 혜택!</dt>
				<dd>
					<ol>
						<c:out value="${info.EXP_MST_BNF }" escapeXml="false"/>
					</ol>
				</dd>
			</dl>
			
			<!-- .king_step S -->
			<div class="king_step" >
				<div >
					<h4>KINGE 신청은 이렇게~ </h4>
					<ol class="ct step_con">
						<li>
							<span>STEP 01</span>
							<strong>KINGER 모집<br/>페이지<br/>스크랩하기</strong>
						</li>
						<li>
							<span>STEP 02</span>
							<strong>블로그<br/>URL과<br/>신청글 남기기</strong>
						</li>
						<li>
							<span>STEP 03</span>
							<strong>전자랜드<br/>프라이스킹<br/>KINGER<br/>신청 완료</strong>
						</li>
					</ol>
				</div>
			</div>
			<!--// .king_step E -->

			<div class="king_scrap">
				<strong class="tx_ti">블로그 또는 SNS에 <br/>KINGER모집 페이지 스크랩 하기</strong>
				<a href="javascript:_blogScrap();"><strong>블로그 스크랩하기</strong></a>
				<a href="javascript:_snsScrap();"><strong>SNS 스크랩하기</strong></a>
			</div>
			
			<!-- .king_appliForm S -->
			<div class="king_appliForm">
				<table>
					<caption>KINGER 신청폼. 블로그 URL, SNS URL, 신청글로 구성된 표</caption>
					<colgroup>
					<col style="width:100px" />
					<col />
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">
								<strong>스크랩한 블로그 URL과 신청글을 남겨주세요.</strong>
								<span>(신청글은 로그인 후 등록 가능)</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
								<strong>블로그 URL <i class="co_red">*</i></strong>
							</th>
							<td>
								<label for="" class="inp_box">
									<input type="text" name="inp_blog" id="inp_blog" value="" />
								</label>
							</td>
						</tr>
						<tr>
							<th>
								<strong>SNS URL</strong>
							</th>
							<td>
								<label for="" class="inp_box">
									<input type="text" name="inp_sns" id="inp_sns" value="" />
								</label>
							</td>
						</tr>
						<tr>
							<th>
								<strong>신청글 <i class="co_red">*</i></strong><br/>
								<span id="tx_num">(0/250)</span>
							</th>
							<td>
								<div class="inp_box">
									<textarea id="txt_msg" name="txt_msg"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="td_btn">
								<a href="javascript:goKingerReq();" class="btn_gre"><strong>신청하기</strong></a>
							</td>
						</tr>
					</tbody>
				</table>				
			</div>
			<!--// .king_appliForm E -->

			<!-- .king_tab S -->
			<dl class="tab_st1 king_tab">
				<dt class="ui-grid-a tab_mn">
					<a href="javascript:void(0)" class="ui-block-a <c:if test="${commandMap.REV ne 'Y'}">on</c:if>" data-tabcon="tab_apply"><strong>KINGER 신청글</strong> <span>(<em class="co_red" id="reqCnt"><c:out value="${reqPaging.totalRecordCount }" /></em>)</span></a>
					<a href="javascript:void(0)" class="ui-block-b <c:if test="${commandMap.REV eq 'Y'}">on</c:if>" data-tabcon="tab_review"><strong>KINGER 리뷰</strong> <span>(<em class="co_red" id="revCnt"><c:out value="${reviewPaging.totalRecordCount }" /></em>)</span></a>
				</dt>
				<!-- #tab_apply S -->
				<dd id="tab_apply" class="tab_con">
					<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y' and iMyReqCnt  > 0}">
					<c:choose>
						<c:when test="${commandMap.MYASK ne 'Y'}">
					<a href="javascript:goMyAsk();" class="btn_gre btn_myAppli"><strong>MY 신청글 보기</strong></a>
						</c:when>
						<c:otherwise>
					<a href="javascript:goAsk();" class="btn_gre btn_myAppli"><strong>전체 신청글 보기</strong></a>						
						</c:otherwise>
					</c:choose>
					</c:if>

					<ol class="tx_list _scroll_list_ck">
						<c:set var="reqlistNum" value="${reqPaging.listNum}" />
						<c:forEach var="ask" items="${reqList}" varStatus="askSta">
						<li>
							<c:if test="${ask.MEM_MST_MEM_ID eq commandMap.MEM_MST_MEM_ID }">
							<a href="javascript:goAskDel('<c:out value="${ask.EXP_ETR_IDX }" />');" class="btn_close"><span class="blind">신청 글 삭제</span></a>
							</c:if>
							<strong class="tx_no">No.<c:out value="${reqlistNum }" /></strong>
							<strong class="tx_name"><c:out value="${ask.MEM_MST_MEM_NM }" /> (<c:out value="${ask.HID_MEM_MST_MEM_ID }" />)</strong>

							<p class="tx_con">
								<c:out value="${ask.EXP_ETR_CMT }" /> 
							</p>
							<span class="tx_date"><ui:formatDate value="${ask.EXP_ETR_REG_DT }" pattern="yyyy.MM.dd"/></span>
							<a href="<c:out value="${ask.EXP_ETR_BLG_URL}" />" class="btn_blog" target="_blank"><strong>블로그 바로가기</strong></a>
						</li>
						<c:set var="reqlistNum" value="${reqlistNum -1}" />
						</c:forEach>
					</ol>
				</dd>
				<!--// #tab_apply E -->
				<!-- #tab_review S -->
				<dd id="tab_review" class="tab_con">
					<c:if test="${commandMap.MEM_LOGIN_YN eq 'Y' and iMyRevCnt> 0}">
						<c:choose>
							<c:when test="${commandMap.MYREVIEW ne 'Y'}">
					<a href="javascript:goMyReview();" class="btn_gre btn_myAppli"><strong>MY 리뷰 보기</strong></a>
							</c:when>
							<c:otherwise>
					<a href="javascript:goReview();" class="btn_gre btn_myAppli"><strong>전체 리뷰 보기</strong></a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<ol class="tx_list _scroll_list_ck2">
				<c:choose>
					<c:when test="${empty reviewList }">
						<li class="no_list">
							<span>등록된 KINGER 리뷰가 없습니다. <br>당첨자발표 후 등록 가능합니다.</span>
						</li>
					</c:when>
					<c:otherwise>
						<c:set var="reviewlistNum" value="${reviewPaging.listNum}" />
						<c:forEach var="rev" items="${reviewList}" varStatus="revSta">
						<li>
							<c:if test="${rev.EXP_REV_BST_YN eq 'Y' }">
							<i class="ico_best"><span class="blind">BEST KINGER</span></i>
							</c:if>
							<c:if test="${not empty  rev.CMM_FLE_SAVE_PATH }">
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }" />/mobile/kinger/kingerRevView.do?EXP_REV_IDX=<c:out value="${rev.EXP_REV_IDX }" />', '_self');"><img src="<c:out value="${cdnDomain }${rev.CMM_FLE_SAVE_PATH }" />" alt="" /></a>
							</c:if>
							<c:if test="${rev.MEM_MST_MEM_ID eq commandMap.MEM_MST_MEM_ID }">
							<a href="javascript:goRevDel('<c:out value="${rev.EXP_REV_IDX }" />');" class="btn_close"><span class="blind">신청 글 삭제</span></a>
							</c:if>
							<strong class="tx_id">No.<c:out value="${reviewlistNum }" /></strong>
							<strong class="tx_con"><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }" />/mobile/kinger/kingerRevView.do?EXP_REV_IDX=<c:out value="${rev.EXP_REV_IDX }" />', '_self');"><c:out value="${rev.EXP_REV_NM }" /></a>(<c:out value="${rev.HID_MEM_MST_MEM_ID }" />)</strong>

							<p class="tx_con">
								<c:out value="${rev.EXP_REV_SUB_NM }" />
							</p>
							<span class="tx_date"><ui:formatDate value="${rev.EXP_REV_REG_DT }" pattern="yyyy.MM.dd"/></span>
							<a href="<c:out value="${rev.EXP_REV_URL}" />" class="btn_blog" target="_blank"><strong>블로그 바로가기</strong></a>
						</li>
						<c:set var="reviewlistNum" value="${reviewlistNum -1}" />
						</c:forEach>
					</c:otherwise>
				</c:choose>
					</ol>
				</dd>
				<!--// #tab_review E -->
			</dl>
			<!--// .king_tab E -->

		</section>
		<!--// .king_con_d E -->
			
	</article>
	<form name="frm" id="frm" method="get">
	<input type="hidden" name="EVP_MST_IDX" id="EVP_MST_IDX" />
	<input type="hidden" name="_idx" id="_idx" value="0" />
	</form>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
		var url = $(location).attr('href');

		_blogScrap				= function(){
			var ieUrl	= "<a href='"+ url +" target='_blank'><img src='<c:out value="${cdnDomain}${info.PRD_IMG_URL_PATH}" />'></a>";
			if(navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident") > -1){
				window.clipboardData.setData('Text', ieUrl);
			}else{
				prompt('Ctrl+C를 눌러 클립보드로 복사하세요', ieUrl);
			}
		};
		
		_snsScrap				= function(){
			var ieUrl	= "<a href='"+ url +" target='_blank'><img src='<c:out value="${cdnDomain}${info.CMM_FLE_SAVE_PATH}" />'></a>";
			
			if(navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident") > -1){
				window.clipboardData.setData('Text', ieUrl);
			}else{
				prompt('Ctrl+C를 눌러 클립보드로 복사하세요', ieUrl);
			}
		};
		
		$(document).on("keyup", "#txt_msg", function(){
			var maximumCount 	= 250;
			var str 			= $("#txt_msg").val();
			var now 			= calculate_msglen(str);
			
			if(now > maximumCount){
				alert("글자 입력수가 초과하였습니다.");
				$("#txt_msg").val(assert_msglen(str, maximumCount));
				now = calculate_msglen($("#txt_msg").val());
			}
			
			$("#tx_num").text('('+ now + '/'+ maximumCount + ')');
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
	 	
	 	goMyAsk				= function(){
	 		location.href = "<c:out value="${mobileDomain}"/>/mobile/kinger/kingerView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&MYASK=Y&MYREVIEW=<c:out value="${commandMap.MYREVIEW}" />&ASK=Y";
	 	};
	 	
	 	goMyReview			= function(){
	 		location.href = "<c:out value="${mobileDomain}"/>/mobile/kinger/kingerView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&MYREVIEW=Y&MYASK=<c:out value="${commandMap.MYASK}"/>&REV=Y";
	 	};
	 	
	 	goAsk				= function(){
	 		location.href = "<c:out value="${mobileDomain}"/>/mobile/kinger/kingerView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&MYASK=&MYREVIEW=<c:out value="${commandMap.MYREVIEW}" />&ASK=Y";
	 	};
	 	
	 	goReview			= function(){
	 		location.href = "<c:out value="${mobileDomain}"/>/mobile/kinger/kingerView.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />&MYREVIEW=&MYASK=<c:out value="${commandMap.MYASK}"/>&REV=Y";
	 	};
	 	
	 	goKingerReq 			= function(){
			// 세션 부분 처리 추가
			var blogVal		= $("#inp_blog").val();
			var snsVal		= $("#inp_sns").val();
			var txtMsgVal	= $("#txt_msg").val();
			
			if(blogVal == ""){
				alert("블로그 URL을 입력하세요.");
				$("#inp_blog").focus();
				return;
			}
			
			if(blogVal.length > 200){
				alert("블로그 URL작성은 200자까지만 적용됩니다.");
				$("#inp_blog").focus();
				return;
			}
			
			if(txtMsgVal == ""){
				alert("신청글을 입력해주세요.");
				$("#txt_msg").focus();
				return;
			}
			
			if(calculate_msglen(txtMsgVal) > 250){
				alert("메시지는 영문 250글자,한글 125글자까지  입력할수있습니다.");
				$("#txt_msg").focus();
				return;
			}
			
			$.ajax({
				type	: "POST",
				url		: "/mobile/kinger/kingerReqAjax.do",
				dataType: "json",
				data	: {	"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD }" />"
						   ,"EXP_ETR_SNS_URL" 	: $("#inp_sns").val()
						   ,"EXP_ETR_BLG_URL"	: $("#inp_blog").val()
						   ,"EXP_ETR_CMT" 		: $("#txt_msg").val()
							},
				success : function(data) {
					alert(data.resultMsg);
					// 값 초기화.
					location.reload(true);
				}, error : function(err) {
					window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		};
	 	
		$.com.win_scrollList = true;//스크롤 할거야~
		function _return_scrollList(_idx, _reNum){
			/*
				_idx = 리스트감싸고있는 객체
				_reNum = 리턴 몇번째넘어왔는지
			*/
			var _list_html 	= "";
			
			var totalCount	= "";
			var reqlistNum	= "";
			var reviewlistNum	= "";
			var url			= "";
			var tabIdx		= $("#_idx").val();
			
			if(tabIdx == 0){
				totalCount		= <c:out value="${reqPaging.totalPageCount}" />;
				reqlistNum		= <c:out value="${reqPaging.listNum}" />;
				url				= "<c:out value="${mobileDomain}" />/mobile/kinger/reqListAjax.do";
			}else{
				totalCount		= <c:out value="${reviewPaging.totalPageCount}" />;
				reviewlistNum	= <c:out value="${reviewPaging.listNum}" />;
				url				= "<c:out value="${mobileDomain}" />/mobile/kinger/reviewListAjax.do";
			}
			
			if(_reNum <= totalCount ){
				$.ajax({
		        	async 	: false,
		        	type 	: "POST",
		        	data	: {
		        		"cPage"				: _reNum + 2
		        		, "MYASK"			: '<c:out value="${commandMap.MYASK}" />'
		        		,"EXP_MST_CD"		: '<c:out value="${info.EXP_MST_CD }" />'
		        		, "MYREVIEW"		: '<c:out value="${commandMap.MYREVIEW}" />'
		        	},
		        	url		: url,
					success : function(data) {
						
						$.each(data.list, function(i,item){
							if(tabIdx == 0){
								_list_html		+= '<li>';
								if (item.MEM_MST_MEM_ID == '<c:out value="${commandMap.MEM_MST_MEM_ID}" />'){
									_list_html		+='<a href="javascript:goAskDel('+ item.EXP_ETR_IDX + ');" class="btn_close"><span class="blind">신청 글 삭제</span></a>';
								}
								_list_html		+= '<strong class="tx_no">No.' + item.NO + '</strong>';
								_list_html		+= '<strong class="tx_name">' + item.MEM_MST_MEM_NM +' (' + item.HID_MEM_MST_MEM_ID + ')</strong>';
								_list_html		+= '<p class="tx_con">';
								_list_html		+= item.EXP_ETR_CMT; 
								_list_html		+= '</p>';
								_list_html		+= '_<span class="tx_date">' + item.EXP_ETR_REG_DT_PAT + '</span>';
								_list_html		+= '<a href="' + item.EXP_ETR_BLG_URL + '" class="btn_blog" target="_blank"><strong>블로그 바로가기</strong></a>';
								_list_html		+= '</li>';
								
								reqlistNum		= reqlistNum - 1;
								
							}else{
								_list_html		+= '<li>';
								if(item.EXP_REV_BST_YN == 'Y'){
									_list_html		+= '<i class="ico_best"><span class="blind">BEST KINGER</span></i>';										
								}
								
								if(item.CMM_FLE_SAVE_PATH != null && item.CMM_FLE_SAVE_PATH == ""){ 
									_list_html		+= '<a href="javascript:callJavascriptNextPage("<c:out value="${mobileDomain}" />/mobile/kinger/kingerRevView.do?EXP_REV_IDX='+ item.EXP_REV_IDX +', "");"><img src="<c:out value="${cdnDomain}" />' + item.CMM_FLE_SAVE_PATH + '" alt="" /></a>';
								}
								
								if(item.MEM_MST_MEM_ID == '<c:out value="${commandMap.MEM_MST_MEM_ID }" />'){
									_list_html		+= '<a href="javascript:goRevDel(' + item.EXP_REV_IDX + ');" class="btn_close"><span class="blind">신청 글 삭제</span></a>';
								}
								
								_list_html			+= '<strong class="tx_id">No.'+ item.NO +'</strong>';
								_list_html			+= '<strong class="tx_con"><a href="javascript:callJavascriptNextPage("<c:out value="${mobileDomain}" />/mobile/kinger/kingerRevView.do?EXP_REV_IDX='+ item.EXP_REV_IDX +', "");">'+ item.EXP_REV_NM +'</a>(' + item.HID_MEM_MST_MEM_ID +')</strong>';
								_list_html			+= '<p class="tx_con">';
								_list_html			+= item.EXP_REV_SUB_NM;
								_list_html			+= '</p>';
								_list_html			+= '<span class="tx_date">'+ item.EXP_REV_REG_DT_PAT +'</span>';
								_list_html 			+= '<a href="'+ item.EXP_REV_URL +'" class="btn_blog" target="_blank"><strong>블로그 바로가기</strong></a>';
								_list_html			+= '</li>';
								
								reviewlistNum		= reviewlistNum - 1;
								
							}
						});
					},
					error 	: function(err) {
						//alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
					}
		        });
				
				if(tabIdx == 0){
					$("#tab_apply ol").append(_list_html);		
				}else{
					$("#tab_review ol").append(_list_html);
				}
				//_idx.append(_list_html);
			}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
		}
		
		goAskDel			= function(exp_etr_idx){
			$.ajax({
	        	async 	: false,
	        	type 	: "POST",
	        	data	: {
	        		"EXP_ETR_IDX"		: exp_etr_idx
	        		, "EXP_MST_CD"		: "<c:out value="${info.EXP_MST_CD}" />"
	        	},
	        	url		: "<c:out value="${mobileDomain}" />/mobile/kinger/kingerReqDelAjax.do",
				success : function(data) {
					alert(data.resultMsg);
					// 값 초기화.
					location.reload(true);
				},
				error 	: function(err) {
					//alert("오류가 발생하였습니다.\n[" + err.status + "]");
					window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
				}
	        });
		};
		
		goRevDel			= function(exp_rev_idx){
			$.ajax({
	        	async 	: false,
	        	type 	: "POST",
	        	data	: {
	        		"EXP_REV_IDX"		: exp_rev_idx
	        		, "EXP_MST_CD"		: "<c:out value="${info.EXP_MST_CD}" />"
	        	},
	        	url		: "<c:out value="${mobileDomain}" />/mobile/kinger/kingerReviewDelAjax.do",
				success : function(data) {
					alert(data.resultMsg);
					// 값 초기화.
					location.reload(true);
				},
				error 	: function(err) {
					//alert("오류가 발생하였습니다.\n[" + err.status + "]");
					window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
				}
	        });
		};
		
		$(document).on("click", "#revLink", function(){
			var exp_rev_idx = $(this).data("exp_rev_idx");
			location.href="<c:out value="${mobileDomain}" />/mobile/kinger/kingerRevView.do?EXP_REV_IDX="+exp_rev_idx;				
		});
	</script>
</section>
<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	
	<c:if test="${info.DDAY < 0}">
	$.com.util.tab($('.tab_st1 .tab_mn'), 1, true);
	</c:if>
	
	<c:if test="${commandMap.REV eq 'Y'}">
	$.com.util.tab($('.tab_st1 .tab_mn'), 1, true);
	</c:if>
	
	<c:if test="${commandMap.REV ne 'Y'}">
	$.com.util.tab($('.tab_st1 .tab_mn'), 0, true);
	</c:if>
	
});

function _return_tab(_tab_mn, _idx){
	
	$("#_idx").val(_idx);

	if(_idx){
		//console.log('[1]');
		_scroll_list = $('._scroll_list_ck');
		$.com.util.scrollList(_scroll_list);
		$.com.win_scrollList = true;//스크롤 할거야~
	}else{
		//console.log('[2]');
		_scroll_list = $('._scroll_list_ck2');
		$.com.util.scrollList(_scroll_list);
		$.com.win_scrollList = true;//스크롤 할거야~
	}
}
</script>