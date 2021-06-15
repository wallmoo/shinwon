<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-thema page-magazine"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
        <div class="section-title _hd_fix">
            <h2><c:out value="${info.MGZ_MST_CTG_NM}" /><c:if test="${not empty info.MGZ_MST_THM_CTG1_NM}"> &gt; <c:out value="${info.MGZ_MST_THM_CTG1_NM}" /></c:if></h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
            <div class="btn_r">
                <a href="javascript:$.com.util.layPop('open', $('#layShare'))" class="btn_share"><em class="blind">쇼핑기획전 공유하기</em></a>
                <a href="javascript:insertKeepingContents(<c:out value="${info.MGZ_MST_IDX}" />);" class="btn_hart"><em class="blind">쇼핑기획전 찜하기</em></a>
            </div>
        </div>
		<!--// .section-title E -->
        
        <!-- .wedding_vw S -->
        <section class="thema_vw wedding_vw">
            <hgroup>
                <h4>
                	<c:if test="${not empty info.MGZ_MST_GBN_NM}"><c:out value="${info.MGZ_MST_GBN_NM}" /></c:if>
       				<c:if test="${not empty info.MGZ_MST_THM_CTG2_NM}"><c:out value="${info.MGZ_MST_THM_CTG2_NM}" /></c:if>    
       				<c:if test="${not empty info.MGZ_MST_THM_CTG3_NM}"> &gt; <c:out value="${info.MGZ_MST_THM_CTG3_NM}" /></c:if>     
                </h4>
                <h3><c:out value="${info.MGZ_MST_SRS}" /></h3>         
                <h2><c:out value="${info.MGZ_MST_TITLE}" /></h2>
            </hgroup>
            <div class="tx_con">
                <ui:replaceLineBreak content="${info.MGZ_MST_CTS}" />  
            </div>
            
            <!-- .pr_relation S -->
            <dl class="pr_relation">
                <dt>
                    <strong>관련상품</strong>
                    <hr class="hr_3px_st1" />
                </dt>
                <dd>
                    <ul class="ui-grid-a">
                    	<c:forEach var="rowProduct" items="${listProduct }" varStatus="i">
	                        <li class="l ui-block-<c:out value="${rowProduct.RNK_GB}" />">
								<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }" />/mobile/product/product.do?prdMstCd=<c:out value="${rowProduct.PRD_MST_CD }" />', '');" class="_pg_link">
									<span class="tx_img"><img data-original="<c:out value="${cdnDomain}" /><c:out value="${rowProduct.IMG_THUMBNAIL}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
									<span class="tx_ti"><c:out value="${rowProduct.PRD_MST_NM}" /></span>
									<strong class="tx_price">
										<fmt:formatNumber value="${rowProduct.MGZ_PRD_PRICE }" groupingUsed="true" /><span>원</span>
										<c:if test="${rowProduct.PRD_SALE_RATE > 0 }">
											<em class="discount">
												<span class="blind">할인률</span>
												<strong class="tx_num"><fmt:formatNumber value="${rowProduct.PRD_SALE_RATE }" groupingUsed="true" /></strong>%
											</em>
										</c:if>
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
                            <input type="text" name="MGZ_QNA_QST" id="MGZ_QNA_QST" <c:if test="${sessionUser.ROLE_USER ne 'user'}"> placeholder="로그인 후 질문해 주세요"</c:if> />
                        </label>
                        <a href="javascript:void(0)" id="emagazineQuest"><strong>질문하기</strong></a>
                    </div>
                    <span id="QST_LEN" class="tx_num">0/200 bye</span>
                </dd>
            </dl>
            <!--// .thema_qa E -->
			
            <div class="comment-button">
                <a href="javascript:;" class="button primary small" id="myCommentButton" style="display:none;"><span>MY 댓글 보기</span></a>
                <a href="javascript:;" class="button primary small" id="allCommentButton" style="display:none;"><span>전체 댓글 보기</span></a>
            </div>
            
            <table id="emagazineQnaTable" class="bbs-list" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
            <caption>번호, Q&amp;A, 답변여부로 구성된 질문 목록입니다.</caption>
            <colgroup>
                <col style="width: 40px;">
                <col style="width: auto;">
                <col style="width: 70px;">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">Q&amp;A</th>
                    <th scope="col">답변여부</th>
                </tr>
            </thead>
            <tbody class="_scroll_list_ck" id="emagazineQnaList">
                 
            </tbody>
            </table><!-- // table-a -->

        </section>
        <!--// .wedding_vw E -->
        <form id="frm">
			<input type="hidden" id="MGZ_MST_CTG" name="MGZ_MST_CTG" value="<c:out value="${commandMap.MGZ_MST_CTG}" />"/>
			<input type="hidden" id="MGZ_MST_GBN" name="MGZ_MST_GBN" value="<c:out value="${commandMap.MGZ_MST_GBN}" />"/>
			<input type="hidden" id="MGZ_MST_THM_CTG1" name="MGZ_MST_THM_CTG1" value="<c:out value="${commandMap.MGZ_MST_THM_CTG1}" />"/>
			<input type="hidden" id="MGZ_MST_THM_CTG2" name="MGZ_MST_THM_CTG2" value="<c:out value="${commandMap.MGZ_MST_THM_CTG2}" />"/>
			<input type="hidden" id="MGZ_MST_THM_CTG3" name="MGZ_MST_THM_CTG3" value="<c:out value="${commandMap.MGZ_MST_THM_CTG3}" />"/>
			<input type="hidden" id="searchGb" name="searchGb" value="<c:out value="${commandMap.searchGb}" />"/>
			<input type="hidden" id="MGZ_MST_IDX" name="MGZ_MST_IDX" value="<c:out value="${commandMap.MGZ_MST_IDX}" />"/>
			<input type="hidden" id="MGZ_QNA_REG_ID" name="MGZ_QNA_REG_ID" value="<c:out value="${commandMap.MGZ_QNA_REG_ID}" />"/>
		</form>
		<input type="hidden" name="totalCount" id="totalCount" value=""/>	
	</article>
	<!--// #container E -->

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
		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${mobileDomain}" />/am/js/common.js"></script>
<script type="text/javascript">

var MEM_MST_MEM_ID = '<c:out value="${sessionUser.MEM_MST_MEM_ID}" />';
var ROLE_USER = '<c:out value="${sessionUser.ROLE_USER}" />';

<c:if test="${sessionUser.ROLE_USER eq 'user' &&  iMyReqCnt > 0}">
	$("#myCommentButton").show();
</c:if>

$("#allCommentButton").hide();

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
 

$(document).on("keyup", "#MGZ_QNA_QST", function(){
	var maximumCount 	= 200;
	var str 			= $("#MGZ_QNA_QST").val();
	var now 			= calculate_msglen(str);
	
	if(ROLE_USER != 'user')
	{
		var retVal = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		if( retVal == true ){
			if(appType){
				callJavascriptLoginUrl(url); //app 로그인 연동
			}else{
				var url = location.href;
				var MGZ_MST_IDX		= $("#MGZ_MST_IDX").val(); 
				url = encodeURIComponent(url);
	        	location.href="<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url + "&MGZ_MST_IDX=" + MGZ_MST_IDX;
			}
		}else{
			$("#MGZ_QNA_QST").val("");
			return;
		}

	}
	if(now > maximumCount){
		alert("글자 입력수가 초과하였습니다.");
		$("#MGZ_QNA_QST").val(assert_msglen(str, maximumCount));
		now = calculate_msglen($("#MGZ_QNA_QST").val());
	}
	
	$("#QST_LEN").text(now + '/'+ maximumCount + ' byte');
});

$("#QST_LEN").text('0/200 byte');

$(document).on("click", "#emagazineQuest", function(){
	// 세션 부분 처리 추가
	var MGZ_QNA_QST		= $("#MGZ_QNA_QST").val();
	var MGZ_MST_IDX		= $("#MGZ_MST_IDX").val();
	
//	var MEM_MST_MEM_ID = '<c:out value="${sessionUser.MEM_MST_MEM_ID}" />';
	if(ROLE_USER != 'user')
	{
		var retVal = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		if( retVal == true ){
			var url = location.href;
			var MGZ_MST_IDX		= $("#MGZ_MST_IDX").val(); 
			url = encodeURIComponent(url);
        	location.href="<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url + "&MGZ_MST_IDX=" + MGZ_MST_IDX;
        	
		}else{
			$("#MGZ_QNA_QST").val("");
			return;
		}
	}
	else
	{
		if($("#MGZ_QNA_QST").val() == ""){
			alert("질문내용을 입력해 주시기 바랍니다.");
			$("#MGZ_QNA_QST").focus();
			return;
		}
		
		if(calculate_msglen(MGZ_QNA_QST) > 200){
			alert("질문내용은 영문 200글자,한글 100글자까지  입력할수있습니다.");
			$("#MGZ_QNA_QST").focus();
			return;
		}
		
		$.ajax({
			type	: "POST",
			url		: "/mobile/contents/emagazineQnaAjax.do",
			dataType: "json",
			data	: {	"MGZ_MST_IDX" : MGZ_MST_IDX
					   ,"MGZ_QNA_QST" 	: MGZ_QNA_QST
					   ,"MGZ_QNA_REG_ID"	: MEM_MST_MEM_ID//추후에 아이디 넣어야 함.
						},
			success : function(data) {
				//alert(data.resultMsg);
				// 값 초기화.
				$("#MGZ_QNA_QST").val('');
				$("#MGZ_QNA_QST").trigger("keyup");
				goPage(1);
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}
	
});

$(document).on("click", ".qnaDel", function(){
	
	var MGZ_QNA_IDX = $(this).data("mgz_qna_idx");
	
	//alert("MGZ_QNA_IDX : "+MGZ_QNA_IDX);
	//if(confirm("삭제하시겠습니까??")){
		$.ajax({
			type	: "POST",
			url		: "/mobile/contents/emagazineDelAjax.do",
			dataType: "json",
			data	: {	"MGZ_QNA_IDX": MGZ_QNA_IDX
						,"MGZ_QNA_UPD_ID" : "skarldnd1"//추후에 아이디 넣어야 함.
						},
			success : function(data) {
			//	alert(data.resultMsg);
				goPage(1);
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	//}
});

goPage		= function(page){
//	alert("goReqPage");
	var dataCnt = 0;
	var MGZ_MST_IDX = $("#MGZ_MST_IDX").val();
	var MGZ_QNA_REG_ID = $("#MGZ_QNA_REG_ID").val();
	
//	var MEM_MST_MEM_ID = '<c:out value="${sessionUser.MEM_MST_MEM_ID}" />';
	
 	$.ajax({
		type		: "POST",
		url			: "/mobile/contents/emagazineQnaListAjax.do",
		dataType	: "json",
		async       : false,
		data		: {	"MGZ_MST_IDX" : MGZ_MST_IDX
						,"MGZ_QNA_REG_ID" : MGZ_QNA_REG_ID
						,"cPage": page
						},
		success : function(data) {
			var innerHtml	= '">';
			if(data.totalPageCount == 0){
				innerHtml = "";
				
			}else{
				 
				var listNum		= data.listNum;
				
				$.each(data.resultMap.qnaList, function(i,item){
					
					dataCnt++;
					innerHtml += '<tr>';
					innerHtml += '<td>'+listNum+'</td>';
					innerHtml += '<td class="text-left"><div class="module"><i class="type"><span class="blind">질문</span></i>';
					innerHtml += '<a href="javascript:;" class="subject">'+item.MGZ_QNA_QST+'</a>';
					innerHtml += '<p class="desc"><span class="blind">작성자</span>'+item.MGZ_QNA_REG_ID_DSP+' /<span class="blind">글쓴이</span>'+item.MGZ_QNA_REG_DT_DSP+'</p>';
					if(MEM_MST_MEM_ID==item.MGZ_QNA_REG_ID)
					{
						innerHtml += '<a href="javascript:;" class="delete qnaDel" data-mgz_qna_idx="'+item.MGZ_QNA_IDX+'"><span class="blind">질문 삭제</span></a>';//삭제버트- 추후 권한처리
					}
					innerHtml += '</div></td>';
					if(item.MGZ_QNA_ANR_YN =="Y")innerHtml += '<td class="condition"><strong>답변완료</strong></td></tr>';
					if(item.MGZ_QNA_ANR_YN !="Y")innerHtml += '<td class="condition"><strong>-<span class="blind">미답변</span></strong></td></tr>';
					if(item.MGZ_QNA_ANR_YN =="Y")
					{
						innerHtml += '<tr class="answer"><td>&nbsp;</td><td colspan="2" class="text-left"><div class="module"><i class="type"><span class="blind">답변</span></i><p>';
						innerHtml += item.MGZ_QNA_ANR;
						innerHtml += '</p></div></td></tr>';
					}
				 
					listNum	= listNum -1;
				});
				
				$("#emagazineQnaList").html(innerHtml).data('returnNum',0);;
				$("#totalCount").val(data.resultMap.totalCount);
				//com.accordion($('.magazine-view .bbs-list a.question'), 'tr');
				
				
				if(dataCnt == 0)
				{
					$("#emagazineQnaTable").hide();
				}
				else
				{
					$("#emagazineQnaTable").show();
				}
			 
				if(data.iMyReqCnt > 0){
					if($("#MGZ_QNA_REG_ID").val() == ''){
						$("#myCommentButton").show();
	                   	$("#allCommentButton").hide();
					}else{
						$("#myCommentButton").hide();
	                   	$("#allCommentButton").show();
					}
				}else{
					$("#myCommentButton").hide();
                   	$("#allCommentButton").hide();
				}
			}
			//$("#reqCnt").text(data.totalRecordCount);
			
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
	//console.log("_reNum : "+_reNum);
	
	var page = _reNum + 2;
	var totalCount = $("#totalCount").val();
	var MGZ_MST_IDX = $("#MGZ_MST_IDX").val();
	var MGZ_QNA_REG_ID = $("#MGZ_QNA_REG_ID").val();
	
//	var MEM_MST_MEM_ID = '<c:out value="${sessionUser.MEM_MST_MEM_ID}" />';
	
	if(parseInt(totalCount) >= (parseInt(page)-1) * 20)
	{	
		$.ajax({
			type		: "POST",
			url			: "/mobile/contents/emagazineQnaListAjax.do",
			dataType	: "json",
			async       : false,
			data		: {	"MGZ_MST_IDX" : MGZ_MST_IDX
							,"MGZ_QNA_REG_ID" : MGZ_QNA_REG_ID
							,"cPage": page
							},
			success : function(data) {
				var innerHtml	= '';
				if(data.totalPageCount == 0){
					innerHtml = "";
					
				}else{
					 
					var listNum		= data.listNum;
					$.each(data.resultMap.qnaList, function(i,item){
					 
						innerHtml += '<tr>';
						innerHtml += '<td>'+item.RNUM+'</td>';
						innerHtml += '<td class="text-left"><div class="module"><i class="type"><span class="blind">질문</span></i>';
						innerHtml += '<a href="javascript:;" class="subject">'+item.MGZ_QNA_QST+'</a>';
						innerHtml += '<p class="desc"><span class="blind">작성자</span>'+item.MGZ_QNA_REG_ID_DSP+' /<span class="blind">글쓴이</span>'+item.MGZ_QNA_REG_DT_DSP+'</p>';
						
						if(MEM_MST_MEM_ID==item.MGZ_QNA_REG_ID)
						{
							innerHtml += '<a href="javascript:;" class="delete qnaDel" data-mgz_qna_idx="'+item.MGZ_QNA_IDX+'"><span class="blind">질문 삭제</span></a>';//삭제버트- 추후 권한처리
						}
						
						
						innerHtml += '</div></td>';
						if(item.MGZ_QNA_ANR_YN =="Y")innerHtml += '<td class="condition"><strong>답변완료</strong></td></tr>';
						if(item.MGZ_QNA_ANR_YN !="Y")innerHtml += '<td class="condition"><strong>-<span class="blind">미답변</span></strong></td></tr>';
						if(item.MGZ_QNA_ANR_YN =="Y")
						{
							innerHtml += '<tr class="answer"><td>&nbsp;</td><td colspan="2" class="text-left"><div class="module"><i class="type"><span class="blind">답변</span></i><p>';
							innerHtml += item.MGZ_QNA_ANR;
							innerHtml += '</p></div></td></tr>';
						}
					 
					});
					
					//$("#emagazineQnaList").html(innerHtml);
					_idx.append(innerHtml);
					
					$('.thema_vw .bbs-list .subject').on('click', function(e) {
				        e.preventDefault();

				        var $this = $(this),
				            _answer = $this.parents('tr').next();

				        if (_answer.hasClass('answer')) {
				            _answer.toggleClass('in');
				        }
				    });
					
					if(data.iMyReqCnt > 0){
						if($("#MGZ_QNA_REG_ID").val() == ''){
							$("#myCommentButton").show();
		                   	$("#allCommentButton").hide();
						}else{
							$("#myCommentButton").hide();
		                   	$("#allCommentButton").show();
						}
					}else{
						$("#myCommentButton").hide();
	                   	$("#allCommentButton").hide();
					}
					
					//_idx.append(innerHtml);
					 
				}
				 
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	} 
	
		
}

$(document).on("click", "#allCommentButton", function(){
	$("#MGZ_QNA_REG_ID").val("");
	$("#allCommentButton").hide();
	$("#myCommentButton").show();
	goPage(1);
});

$(document).on("click", "#myCommentButton", function(){
	
//	var MEM_MST_MEM_ID = '<c:out value="${sessionUser.MEM_MST_MEM_ID}" />';
	//alert(MEM_MST_MEM_ID);
	$("#MGZ_QNA_REG_ID").val(MEM_MST_MEM_ID);//login id here
	$("#allCommentButton").show();
	$("#myCommentButton").hide();
	goPage(1);
});

goPage(1);
$("#allCommentButton").hide();

//관심등록
insertKeepingContents = function(MEM_CTS_GBN_IDX){
	$.ajax({
		async : false,
		type : "POST",
		data : {
			"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
			,"MEM_CTS_GBN" : "M" //기획전:P, 이벤트:E, 매거진:M
		},
		url : "<c:out value="${mobileDomain}" />/mobile/contents/insertInterestContentsAjax.do",
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

goProductKakaoStory = function(){
	
	var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value='${commandMap.MGZ_MST_IDX}' />";
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
	
	var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value='${commandMap.MGZ_MST_IDX}' />";
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
	var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value='${commandMap.MGZ_MST_IDX}' />"; 
    var text = encodeURIComponent("<c:out value="${info.MGZ_MST_TITLE}" />");
    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
    
    if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
    	callJavascriptOutlinkPage(url);
    }else{
    	var faceBook = window.open("about:blank");
    	faceBook.location.href=url;
    }
}; 
</script>
</body>
</html>