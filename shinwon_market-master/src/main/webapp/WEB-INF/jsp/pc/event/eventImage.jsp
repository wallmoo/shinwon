<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->

			<!-- .section S -->
			<section class="event_zone">

				<%@ include file="/WEB-INF/jsp/pc/event/eventMenuInclude.jsp" %>
				
				<!-- .ev_con S -->
				<div class="ev_con ev_cons"> <!-- 이벤트: ev_cons / 회원혜택: ev_member / 쿠폰혜택: ev_coupon / 카드혜택: ev_card -->
					<ul class="ev_list">
						<li class="tab_mn">
							<c:choose>
								<c:when test="${info.EVT_ING_YN eq 'ing' }">
									<span id="tx_ex" class="tx_ex">현재 진행중인 모든 이벤트를 한번에 볼 수 있습니다. 다양한 혜택 놓치지 마세요</span>
								</c:when>
								<c:otherwise>
									<span class="tx_ex">종료된 이벤트를  보실 수 있습니다.  응모한 이벤트의 당첨자 발표를 확인해 주세요.</span>	
								</c:otherwise>
							</c:choose>
							<a href="<c:out value="${frontDomain }" />/pc/event/eventList.do?ingPage=1&endPage=1&type=ing" <c:if test="${info.EVT_ING_YN eq 'ing' }">class="on"</c:if> ><span>진행중인 이벤트</span></a>
							<a href="<c:out value="${frontDomain }" />/pc/event/eventList.do?ingPage=1&endPage=1&type=end" <c:if test="${info.EVT_ING_YN eq 'end' }">class="on"</c:if> ><span>종료된 이벤트</span></a>
						</li>
						<!-- .tab_con S -->
						<li class="tab_con">
							
							<!-- .ev_detail S -->
							<div class="ev_detail">
								<div class="btn_box">
									<c:if test="${not empty info.EVT_MST_IDX_PREV }"><a href="javascript:void(0)" class="btn_prev f" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_PREV }" />" ><span>이전</span></a></c:if>
									<c:if test="${not empty info.EVT_MST_IDX_NEXT }"><a href="javascript:void(0)" class="btn_next" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_NEXT }" />" ><span>다음</span></a></c:if>

									<select id="sel_ev_ing" class="sel_chg">
										<option value="">현재 진행중인 다른 이벤트</option>
										<c:forEach var="row" items="${list }">
											<option value="<c:out value="${row.EVT_MST_IDX }" />"> <c:out value="${row.EVT_MST_TITLE }" /></option>
										</c:forEach>
									</select>
								</div>

								<dl	class="ev_info">
									<dt class="ti">
										<span class="tx_ti">이벤트명</span>
										<c:set var="eveType" value="" />
										<c:if test="${info.EVT_MST_TYPE eq '708' }">
											<c:set var="eveType" value="CLICK" />
										</c:if>
										<c:if test="${info.EVT_MST_TYPE eq '710' }">
											<c:set var="eveType" value="TALK" />
										</c:if>
										<c:if test="${info.EVT_MST_TYPE eq '713' }">
											<c:set var="eveType" value="POLL" />
										</c:if>
										<c:if test="${info.EVT_MST_TYPE eq '1842' }">
											<c:set var="eveType" value="PHOTO" />
										</c:if>
										<p>
											<span><em><c:if test="${not empty eveType }">[<c:out value="${eveType }" />] </c:if></em><c:out value="${info.EVT_MST_TITLE }" /></span>
											<c:if test="${info.EVT_ING_YN eq 'ing' }">
												<i class="ico_mk ing"><span>진행중</span></i>	
											</c:if>												
											<c:if test="${info.EVT_ING_YN eq 'end' }">
												<c:choose>
													<c:when test="${info.EVT_WIN_USE_YN  == 0}">
												<i class="ico_mk end"><span>마감</span></i>
													</c:when>
													<c:otherwise>
												<a href="<c:out value="${frontDomain }" />/pc/customer/eventWinView.do?EVT_WIN_IDX=<c:out value="${info.EVT_WIN_IDX }" />"><i class="ico_mk dang"><span>당첨자 확인</span></i></a>
													</c:otherwise>
												</c:choose>												
											</c:if>
										</p>
									</dt>
									<dd class="con">
										<div class="ico_box">
											<a href="javascript:insertKeepingContents(<c:out value="${info.EVT_MST_IDX}" />);" class="btn_st0 btn_white small btn_kip"><em>키핑</em></a>
										</div>
										<c:if test="${not empty info.FILE_NM2 }">
										<img src="<c:out value="${cdnDomain}${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />"  /><br/>
										</c:if>

										<a href="javascript:btn_regist();" class="btn_regist"><span>사진등록</span></a>
									</dd>
								</dl>
								
								
								<c:if test="${bestListCount eq 5 }">
								<dl	class="bestPhoto">
									<dt class="ti">
										<h3><span class="ir">BEST PHOTO 5</span></h3>
									</dt>
									<dd class="best_list">
										<ol class="list_lg_<c:out value="${bestListCount }" />" ><!-- 리스트 갯수 뒤에 적어주세요.-->
										<c:choose>
											<c:when test="${not empty bestList }">
												<c:forEach items="${bestList }" var="bestRow" varStatus="bestSta">
													<li>
														<i class="ico_best best_<c:out value="${bestSta.count }" />" data-evt_img_idx="<c:out value="${bestRow.EVT_IMG_IDX }" />"><span class="blind">BEST<c:out value="${bestSta.count }" /></span></i>
														<a href="javascript:void(0);" id="detail" data-evt_img_idx="<c:out value="${bestRow.EVT_IMG_IDX }" />" data-evt_mst_idx="<c:out value="${bestRow.EVT_MST_IDX }" />"><img src="<c:out value="${cdnDomain }${bestRow.FILE_NM}" />" alt="<c:out value="${bestRow.CMM_FLE_ALT_TXT }" />" /></a>
														<strong class="tx_dateNid"><c:out value="${bestRow.EVT_IMG_REG_DT_CHAR }" /> / <c:out value="${bestRow.EVT_IMG_REG_ID }" /></strong>
														<hr class="bg_line_3px" />
														<span class="tx_ti"><c:out value="${bestRow.EVT_IMG_NM }" /></span>
														<a href="javascript:void(0)" class="btn_recom" data-evt_img_idx="<c:out value="${bestRow.EVT_IMG_IDX }" />"><i class="ico_recom"></i><span><c:out value="${bestRow.EVT_IMG_RCM_CNT }" /></span></a>
													</li>
												</c:forEach>
											</c:when>
										</c:choose>
										</ol>
									</dd>
								</dl>
								</c:if>
								<!-- .ev_sh_box S -->
								<form name="frm" id="frm">
								<input type="hidden" name="ingPage" id="ingPage" value="<c:out value="${commandMap.ingPage }" />" />
								<input type="hidden" name="endPage" id="endPage" value="<c:out value="${commandMap.endPage }" />" />
								<input type="hidden" name="type" id="type" value="<c:out value="${commandMap.whereType}" />" />
								<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" value="" />
								<dl class="ev_sh_box">
									<dt class="blind">이벤트 응모 검색</dt>
									<dd class="sh">
										<select id="searchType" name="searchType" class="sel_chg">
											<option value="">선택</option>
											<option value="id" <c:if test="${commandMap.searchType eq 'id'}"> selected</c:if> >아이디</option>
											<option value="nm" <c:if test="${commandMap.searchType eq 'nm'}"> selected</c:if> >이름</option>
											<option value="title" <c:if test="${commandMap.searchType eq 'title'}"> selected</c:if>>제목</option>
											<option value="cts" <c:if test="${commandMap.searchType eq 'cts'}"> selected</c:if>>내용</option>
										</select>
										<label for="">
											<input type="text" name="searchKey" id="searchKey" placeholder="검색어를 입력하세요." value="<c:out value="${commandMap.searchKey }" />" />
										</label>
										<a href="javascript:void(0)" class="btn_sh"><span>검색하기</span></a>
									</dd>
									<dd class="list">
										<ol>
										<c:choose>
											<c:when test="${not empty imgList}">
												<c:forEach items="${imgList }" var="row" varStatus="sta">
											<li class="item" id="<c:out value="${row.EVT_IMG_IDX }" />">
												<!--  i class="ico_best best_1"><span class="blind">BEST1</span></i>-->
												<a href="javascipt:void(0);" id="detail" data-evt_img_idx="<c:out value="${row.EVT_IMG_IDX }" />" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }" />" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMM_FLE_ALT_TXT }" />" /></a>
												<strong class="tx_dateNid"><c:out value="${row.EVT_IMG_REG_DT_CHAR }" /> / <c:out value="${row.EVT_IMG_REG_ID }" /></strong>
												<hr class="bg_line_3px" />
												<span class="tx_ti"><c:out value="${row.EVT_IMG_NM }" /><c:if test="${row.EVT_IMG_REG_ID eq commandMap.MEM_MST_MEM_ID }"><a href="javascropt:void(0)" class="btn_del" data-evt_img_idx="<c:out value="${row.EVT_IMG_IDX }" />" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }" />" ><span class="blind">삭제</span></a></c:if></span>
												<a href="javascript:void(0)" class="btn_recom" data-evt_img_idx="<c:out value="${row.EVT_IMG_IDX }" />"><i class="ico_recom"></i><span><c:out value="${row.EVT_IMG_RCM_CNT }" /></span></a>
											</li>	
												</c:forEach>
											</c:when>
										</c:choose>
										</ol>
									</dd>
								</dl>
								</form>
								<!--// .ev_sh_box E -->
								
								<div class="btn_box end_btn_box">
									<c:if test="${not empty info.EVT_MST_IDX_PREV }"><a href="javascript:void(0)" class="btn_prev f" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_PREV }" />" ><span>이전</span></a></c:if>
									<c:if test="${not empty info.EVT_MST_IDX_NEXT }"><a href="javascript:void(0)" class="btn_next" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_NEXT }" />"><span>다음</span></a></c:if>

									<a href="javascript:void(0)" class="btn_list l"><span>목록</span></a>
								</div>
							</div>
							<!--// .ev_detail E -->
							
						</li>
						<!--// .tab_con E -->
					</ul>
				</div>
				<!--// .ev_con E -->
			</section>
			<!--// .section E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	
	
	<script type="text/javascript">
		$(document).on("click", ".btn_prev", function(){
			var evt_mst_idx			= $(this).data("evt_mst_idx");
			$("#EVT_MST_IDX").val(evt_mst_idx);
			$("#frm").attr("action", "/pc/event/eventView.do").submit();
		});
		
		$(document).on("click", ".btn_next", function(){
			var evt_mst_idx			= $(this).data("evt_mst_idx");
			$("#EVT_MST_IDX").val(evt_mst_idx);
			$("#frm").attr("action", "/pc/event/eventView.do").submit();
		});
		
		$(document).on("click", ".btn_list", function(){
			$("#frm").attr("action", "/pc/event/eventList.do").submit();
		});
		
		$(document).on("click", ".sel_chg", function(){
			var evt_mst_idx 		= $(this).val();
			if(evt_mst_idx != ""){
				$("#EVT_MST_IDX").val(evt_mst_idx);
				$("#frm").attr("action", "/pc/event/eventView.do").submit();
			}
		});
		
		$(document).on("click", ".btn_regist", function(){
			$.ajax({
				async 	: false,
				type	: "POST",
				url		: "/pc/event/eventEntryAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"},
				success : function(data) {
					if(data.loginChk == 'N'){
						if(confirm(data.resultMsg)){
    						var url = location.href;
    						url = encodeURIComponent(url);
    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
    					}
					}else{
						if(data.resultMsg){
							alert(data.resultMsg);	
						}
						
						if(data.popup){
							window.open("<c:out value="${frontDomain}" />/pc/event/popup/eventImagePopUp.do?EVT_MST_IDX=<c:out value="${info.EVT_MST_IDX}" />", "image", "width=785px, height=980px");
						}	
					}
				}, error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		});
		
		$(document).on("click", ".btn_recom", function(){
			
			if(confirm("추천하시겠습니까?")){
				
				var evt_img_idx	= $(this).data("evt_img_idx");
				
				$.ajax({
					type	: "POST",
					url		: "/pc/event/eventImageRecommAjax.do",
					dataType: "json",
					data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
								, "EVT_IMG_IDX" : evt_img_idx },
					success : function(data) {
						if(data.loginChk == 'N'){
							if(confirm(data.resultMsg)){
	    						var url = location.href;
	    						url = encodeURIComponent(url);
	    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	    					}
						}else{
							alert(data.resultMsg);
							if(data.succss){
								location.reload();
							}
						}
					}, error : function(err) {
						window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}
		});
		
		$(document).on("click", ".btn_sh", function(){
			
			if($("#searchType").val() == ""){
				alert("검색 타입을 선택하세요.");
				return;
			}
			if($("#searchKey").val() == ""){
				alert("검색어를 입력하세요.");
				$("#searchKey").focus();
				return;
			}
			$("#EVT_MST_IDX").val('<c:out value="${info.EVT_MST_IDX}" />');
			$("#frm").attr("action", "/pc/event/eventView.do").submit();
		});
		
		insertKeepingContents = function(MEM_CTS_GBN_IDX){
    		$.ajax({
    			async : false,
    			type : "POST",
    			data : {
    				"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
    				,"MEM_CTS_GBN" : "E" //기획전:P, 이벤트:E, 매거진:M
    			},
    			url : "<c:out value="${frontDomain}" />/pc/contents/insertInterestContentsAjax.do",
    			success : function(data) {
    				var result = data.result;//0:로그인 필요 1:성공 -1:실패
    				if(result == 0){
    					if(confirm(data.resultMsg)){
    						var url = location.href;
    						url = encodeURIComponent(url);
    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
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
    	
    	$(document).on("click", "#detail", function(){
    		var evt_img_idx			= $(this).data("evt_img_idx");
    		var evt_mst_idx			= $(this).data("evt_mst_idx");
    		
    		window.open("<c:out value="${frontDomain}" />/pc/event/popup/eventDetailImgPopUp.do?EVT_MST_IDX="+evt_mst_idx+"&EVT_IMG_IDX="+evt_img_idx, "eventDetail", "width=580px, height=770px");
    	});
    	
    	$(document).on("click", ".btn_del", function(){
    		$.evMarThis = $(this);
    		var evt_img_idx			= $.evMarThis.data("evt_img_idx");
    		var evt_mst_idx			= $.evMarThis.data("evt_mst_idx");
    		
    		if(confirm("응모 취소 시 차감된 크라운은 재적립되지 않습니다. 응모를 취소하시겠습니까?" )){
    			
	    		$.ajax({
	    			async : false,
	    			type : "POST",
	    			data : {
	    				"EVT_IMG_IDX" : evt_img_idx
	    				,"EVT_MST_IDX" : evt_mst_idx
	    			},
	    			url : "<c:out value="${frontDomain}" />/pc/event/delEventImg.do",
	    			success : function(data) {
	    				var result = data.result;//0:로그인 필요 1:성공 -1:실패
	    				if(result == 0){
	    					if(confirm(data.resultMsg)){
	    						var url = location.href;
	    						url = encodeURIComponent(url);
	    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	    					}
	    				}else{
	    					alert(data.resultMsg);
	    					if(data.result > 0){
	    						$.evMar.masonry( 'remove', $.evMarThis.parents('li[id='+evt_img_idx+']'));
	    						$.evMar.masonry( 'reload' );
	    					}
	    				}
	    			},
	    			error : function(err) {
	    				alert("오류가 발생하였습니다.\n[" + err.status + "]");
	    				window.jquery
	    						|| console
	    								.log('오류가 발생하였습니다: ' + err.status);
	    			}
	    		});
    		}
    	});
	</script>
</section>
<!--// #wrap E -->
</body>
</html>

<script>
$(document).ready(function(){
	$.evMar = $.evMar || $('.ev_sh_box .list ol');
	$.evMar.masonry({
	  columnWidth: 0, //간격
	  itemSelector: '.item',
	  isAnimated: true
	});
		
	<c:if test="${not empty bestList }">
		<c:forEach items="${bestList }" var="row" varStatus="sta">
			$("#<c:out value="${row.EVT_IMG_IDX}" />").append('<i class="ico_best best_<c:out value="${sta.count}" />"><span class="blind">BEST<c:out value="${sta.count}" /></span></i>');
		</c:forEach>
	</c:if>			
		
});
</script>