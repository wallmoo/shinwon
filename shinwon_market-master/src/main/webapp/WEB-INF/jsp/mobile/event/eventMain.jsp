<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-event">
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
            <h2>이벤트</h2>
            <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .event_con_d S -->
		<form name="frm" id="frm" method="get">
		<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" />
		<input type="hidden" name="_idx" id="_idx" value="0" />
		<section class="event_con_d">
			<%@ include file="/WEB-INF/jsp/mobile/event/eventMenuInclude.jsp" %>
			<dl class="tab_st1">
				<dt class="ui-grid-a tab_mn">
					<a href="javascript:void(0);" class="ui-block-a mn_0 on" data-tabcon="ev_list"><strong>진행중인 이벤트</strong></a>
					<a href="javascript:void(0);" class=" ui-block-b mn_1" data-tabcon="ev_list2"><strong>종료된 이벤트</strong></a>
				</dt>
				
				<dd class="tab_con ev_list" id="ev_list">
					<ul class="_scroll_list_ck">
					<c:choose>
						<c:when test="${not empty ingList }">
						<c:forEach var="ingRow" items="${ingList }" varStatus="ingSta">
						<c:set var="eveType" value="" />
						<c:if test="${ingRow.EVT_MST_TYPE eq '708' }">
							<c:set var="eveType" value="CLICK" />
						</c:if>
						<c:if test="${ingRow.EVT_MST_TYPE eq '710' }">
							<c:set var="eveType" value="TALK" />
						</c:if>
						<c:if test="${ingRow.EVT_MST_TYPE eq '713' }">
							<c:set var="eveType" value="POLL" />
						</c:if>
						<c:if test="${ingRow.EVT_MST_TYPE eq '1842' }">
							<c:set var="eveType" value="PHOTO" />
						</c:if>
						<li>
							<a href="javascript:goDetail('<c:out value="${ingRow.EVT_MST_IDX }" />');" data-evt_mst_idx="<c:out value="${ingRow.EVT_MST_IDX }" />" data-ajax="false" >
								<i class="ico_ing"><strong>진행중</strong></i>
								<c:if test="${not empty ingRow.FILE_NM }">
								<img src="<c:out value="${cdnDomain}${ingRow.FILE_NM }" />" alt="<c:out value="${ingRow.EVT_MST_TITLE }"/>" />
								</c:if>
								<strong class="tx_ti"><c:out value="${ingRow.EVT_MST_TITLE }"/></strong>
								<strong class="tx_type"><c:out value="${eveType }" /> EVENT</strong><span class="tx_date"><ui:formatDate value="${ingRow.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${ingRow.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
							</a>
						</li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<li class="no_list">진행 된 이벤트가 없습니다.</li>
						</c:otherwise>
					</c:choose>	
					</ul>
				</dd>
				
				<dd class="tab_con ev_list" id="ev_list2" >
					<ul class="_scroll_list_ck2">
						<c:choose>
						<c:when test="${not empty endList }">
						<c:forEach var="endRow" items="${endList }" varStatus="endSta">
						<c:set var="eveType" value="" />
						<c:if test="${endRow.EVT_MST_TYPE eq '708' }">
							<c:set var="eveType" value="CLICK" />
						</c:if>
						<c:if test="${endRow.EVT_MST_TYPE eq '710' }">
							<c:set var="eveType" value="TALK" />
						</c:if>
						<c:if test="${endRow.EVT_MST_TYPE eq '713' }">
							<c:set var="eveType" value="POLL" />
						</c:if>
						<c:if test="${endRow.EVT_MST_TYPE eq '1842' }">
							<c:set var="eveType" value="PHOTO" />
						</c:if>
						<li>
							<a href="javascript:goDetail('<c:out value="${endRow.EVT_MST_IDX }" />');" data-evt_mst_idx="<c:out value="${endRow.EVT_MST_IDX }" />" data-ajax="false">
								<c:if test="${endRow.EVT_WIN_USE_YN == 0 }" >
									<i class="ico_end"><strong>마감</strong></i>
								</c:if>
								<c:if test="${endRow.EVT_WIN_USE_YN > 0 }" >
									<i class="ico_dang"><strong>당첨자 확인</strong></i>
								</c:if>
								<c:if test="${not empty endRow.FILE_NM }">
								<img src="<c:out value="${cdnDomain}${endRow.FILE_NM }" />" alt="<c:out value="${endRow.EVT_MST_TITLE }"/>" />
								</c:if>
								<strong class="tx_ti"><c:out value="${endRow.EVT_MST_TITLE }"/></strong>
								<strong class="tx_type"><c:out value="${eveType }" /> EVENT</strong><span class="tx_date"><ui:formatDate value="${endRow.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${endRow.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
							</a>
						</li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<li class="no_list">종료된 이벤트가 없습니다.</li>
						</c:otherwise>
					</c:choose>	
					</ul>
				</dd>
			</dl>
			
		</section>
		</form>
		<script type="text/javascript">
			$.com.win_scrollList = true;//스크롤 할거야~
			function _return_scrollList(_idx, _reNum){
				/*
					_idx = 리스트감싸고있는 객체
					_reNum = 리턴 몇번째넘어왔는지
				*/
				var _list_html 	= "";
				
				var totalCount	= "";
				var whereType	= "";
				
				var tabIdx		= $("#_idx").val();
				
				if(tabIdx == 0){
					totalCount		= "<c:out value="${ingPaging.totalPageCount}" />";
					whereType		= "ing";	
				}else{
					totalCount		= "<c:out value="${endPaging.totalPageCount}" />";
					whereType		= "end";
				}
				
				if(_reNum <= Number(totalCount) ){
					
					$.ajax({
			        	async 	: false,
			        	type 	: "POST",
			        	data	: {
			        		"cPage"				: _reNum + 2,
			        		"whereType"			: whereType
			        	},
			        	url		: "<c:out value="${mobileDomain}" />/mobile/event/eventListAjax.do",
						success : function(data) {
							
							$.each(data.list, function(i,item){
								var eveType		= "";
								var mark		= "";
								
								if (item.EVT_MST_TYPE == '708'){
									eveType	= "CLICK";
								}else if(item.EVT_MST_TYPE == '710'){
									eveType = "TALK";
								}else if(item.EVT_MST_TYPE == '713'){
									eveType = "POLL";
								}else if(item.EVT_MST_TYPE == '1842'){
									eveType = "PHOTO";
								}
									
								if(tabIdx == 0){
									mark = "<i class='ico_ing'><strong>진행중</strong></i>";
								}else{
									if(item.EVT_WIN_USE_YN > 0){
										mark = "<i class='ico_dang'><strong>당첨자 확인</strong></i>";	
									}else{
										mark = "<i class='ico_end'><strong>마감</strong></i>";
									}
								}
								
								_list_html += "<li>"; 
								_list_html += "<a href='javscript:goDetail('"+ item.EVT_MST_IDX +"')' data-evt_mst_idx='" + item.EVT_MST_IDX + "' data-ajax='false' >";
								_list_html += mark;
								if(item.FILE_NM != "" && item.FILE_NM != null){
									_list_html += "<img src='<c:out value="${cdnDomain}" />" + item.FILE_NM +"' alt='" + item.EVT_MST_TITLE +"' />";	
								}
								_list_html += "<strong class='tx_ti'>" + item.EVT_MST_TITLE + "</strong>";									
								_list_html += "<strong class='tx_type'>" + eveType + " EVENT</strong><span class='tx_date'>" + item.EVT_MST_ST_DT_CHAR + " ~ "+ item.EVT_MST_ED_DT_CHAR + " </span>";		
								_list_html += "</a>";
								_list_html += "</li>";
							});
						},
						error 	: function(err) {
							//alert("오류가 발생하였습니다.\n[" + err.status + "]");
							window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
						}
			        });
					
					if(tabIdx == 0){
						$("#ev_list .ul").append(_list_html);		
					}else{
						$("#ev_list2 .ul").append(_list_html);
					}
					//_idx.append(_list_html);
				}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
			}
			/*
			$(document).on("click", "li a", function(){
				//console.log('asdasd');
				var evt_mst_idx			= $(this).data("evt_mst_idx");
				//console.log("evt_mst_idx ::::>" + evt_mst_idx );
				$("#EVT_MST_IDX").val(evt_mst_idx);
				//$("#frm").attr("action", "<c:out value="${mobileDomain}" />/mobile/event/eventView.do").submit();
				//location.href = "<c:out value="${mobileDomain}" />/mobile/event/eventView.do";
				
				$.mobile.changePage("<c:out value="${mobileDomain}" />/mobile/event/eventView.do?EVT_MST_IDX=" + evt_mst_idx, { transition: "slideup", changeHash: false });
			});*/
			
			goDetail		= function(evt_mst_idx){
				location.href = "<c:out value="${mobileDomain}" />/mobile/event/eventView.do?EVT_MST_IDX=" + evt_mst_idx;
			};
		</script>	
		<!--// .event_con_d E -->
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>

$(document).ready(function(){
	$.com.util.tab($('.tab_st1 .tab_mn'), 0, true);
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