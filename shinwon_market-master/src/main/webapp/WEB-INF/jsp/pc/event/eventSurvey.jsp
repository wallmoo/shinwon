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
										<option value="">현재 진행중인 이벤트</option>
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
										<img src="<c:out value="${cdnDomain}${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />"  />
										</c:if>

									</dd>
								</dl>

								<!-- .survey_box S -->
								<div class="survey_box">
									<strong class="blind">설문조사 영역</strong>
									<ol class="survey_list">
									<c:choose>
										<c:when test="${info.EVT_MST_SVY_TYPE eq 'T'}">
											<c:forEach var="row" items="${surveyList}" varStatus="sta">
											<li <c:if test="${sta.first }">class="on"</c:if> >
												<label for="inp_ra_<fmt:formatNumber value="${row.EVT_DTL_NO}" pattern="00"/>" tabindex="0">
													<input type="radio" name="EVT_DTL_IDX" id="inp_ra_<fmt:formatNumber value="${row.EVT_DTL_NO}" pattern="00"/>" value="<c:out value="${row.EVT_DTL_IDX }" />" <c:if test="${sta.first }">checked</c:if> />
													<span class="tx"><span><c:out value="${row.EVT_DTL_NM }" /></span></span>
													<i class="ico_ra"></i>
												</label>
											</li>
											</c:forEach>
										</c:when>											
										<c:when test="${info.EVT_MST_SVY_TYPE eq 'I' }">
											<c:forEach var="row" items="${surveyList}" varStatus="sta">
											<li <c:if test="${sta.first }">class="on"</c:if> >
												<label for="inp_ra_<fmt:formatNumber value="${row.EVT_DTL_NO}" pattern="00"/>" tabindex="0">
													<input type="radio" name="EVT_DTL_IDX" id="inp_ra_<fmt:formatNumber value="${row.EVT_DTL_NO}" pattern="00"/>" value="<c:out value="${row.EVT_DTL_IDX }" />" <c:if test="${sta.first }">checked</c:if> />
													<img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMM_FLE_ALT_TXT }" />" style="width:170px;height:170px;"  />
													<i class="ico_ra"></i>
												</label>
											</li>
											</c:forEach>		
										</c:when>
									</c:choose>
									</ol>
									<a href="javascript:void(0)" class="btn_entry"><span>응모하기</span></a>
								</div>
								<!--// .survey_box E -->
								
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
	<form name="frm" id="frm">
	<input type="hidden" name="ingPage" id="ingPage" value="<c:out value="${commandMap.ingPage }" />" />
	<input type="hidden" name="endPage" id="endPage" value="<c:out value="${commandMap.endPage }" />" />
	<input type="hideen" name="type" id="type" value="<c:out value="${commandMap.whereType}" />" />
	<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" value="" />
	</form>
</section>
<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	//라디오
	$('.survey_list label').on('click', function(){
		var _this = $(this),
			_li = _this.parent('li');

		_li.addClass('on').find('input').prop('checked', true);
		_li.siblings().removeClass('on').find('input').prop('checked', false);
		return false;

	});
	
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
	
	$(document).on("click", ".btn_entry", function(){
		
		var evt_dtl_idx = $("input[name=EVT_DTL_IDX]:checked").val();
		var agt			= checkAgt();
		
		$.ajax({
			async 	: false,
			type	: "POST",
			url		: "/pc/event/eventEntryAjax.do",
			dataType: "json",
			data	: {	"EVT_DTL_IDX" 	: evt_dtl_idx
						, "EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
						, "EVT_AGT" 	: agt},
			success : function(data) {
				if(data.loginChk == 'N'){
					if(confirm(data.resultMsg)){
						var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
					}
				}else{
					alert(data.resultMsg);
				}
			}, error : function(err) {
				window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
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
	
});
</script>