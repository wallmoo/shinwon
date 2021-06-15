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


	</aside>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>이벤트</h2>
            <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
			<div class="btn_r">
				<a href="javascript:$.com.util.layPop('open', $('#layShare'))" class="btn_share"><em class="blind">쇼핑기획전 공유하기</em></a>
				<a href="javascript:insertKeepingContents(<c:out value="${info.EVT_MST_IDX}" />);" class="btn_hart"><em class="blind">이벤트 찜하기</em></a>
			</div>
        </div>
		<!--// .section-title E -->
		
		<!-- .event_vw S -->
		<section class="event_vw">
			<div class="ev_type">
				<label for="sel_ingEv" class="sel_box_st0">
					<select name="sel_ingEv" id="sel_ingEv">
						<option>현재 진행중인 다른 이벤트</option>
						<c:forEach var="row" items="${list }">
							<option value="<c:out value="${row.EVT_MST_IDX }" />" <c:if test="${row.EVT_MST_IDX eq commandMap.EVT_MST_IDX }">selected</c:if> > <c:out value="${row.EVT_MST_TITLE }" /></option>
						</c:forEach>
					</select>
				</label>
				<c:choose>
					<c:when test="${info.EVT_ING_YN eq 'ing' }">
				<i href="javascript:void(0)" class="btn_red"><strong>진행중</strong></i>
					</c:when>
					<c:otherwise>
				<i href="javascript:void(0)" class="btn_gre"><strong>마감</strong></i>	
					</c:otherwise>
				</c:choose>		
			</div>
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
			<dl class="vw_con">
				<dt>
					<strong><i class="co_red">[<c:out value="${eveType }" />]</i><c:out value="${info.EVT_MST_TITLE }" /></strong>
					<span><ui:formatDate value="${info.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
				</dt>
				<dd class="dd_img">
					<c:if test="${not empty info.FILE_NM2 }">
					<img src="<c:out value="${cdnDomain }${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />" longdesc="#ev_tx_con" />
					</c:if>
					<div id="ev_tx_con" class="blind">
						<c:out value="${info.CMM_FLE_ALT_TXT2 }" />
					</div>
				</dd>
				
				<!-- .dd_best S -->
				<dd class="dd_best">
					<dl>
						<dt><img src="<c:out value="${cdnDomain}" />/mobile/img/event/ti_best5.jpg" alt="best photo5" /></dt>
						<!-- .best_5 S -->
						<dd class="best_5">
							<ol>
							<c:choose>
								<c:when test="${not empty bestList }">
								<c:forEach items="${bestList }" var="bestRow" varStatus="bestSta">
								<c:set var="clasNm" value="item" />
								<c:if test="${bestSta.first }">
									<c:set var="clasNm" value="f" />
								</c:if>
								<li class="<c:out value="${clasNm }" />" >
									<a href="javascript:goImgDetail('<c:out value="${bestRow.EVT_IMG_IDX}" />')" class="_pg_link">
										<i class="ico_best<c:out value="${bestSta.count }" />" ><span class="blind">best<c:out value="${bestSta.count }" />"</span></i>
										<img src="<c:out value="${cdnDomain }${bestRow.FILE_NM}" />" alt="<c:out value="${bestRow.CMM_FLE_ALT_TXT }" />" />
										<span class="tx_dateNid"><c:out value="${bestRow.EVT_IMG_REG_DT_CHAR }" /> / <c:out value="${bestRow.EVT_IMG_REG_ID }" /></span>
										<strong class="tx_ti"><c:out value="${bestRow.EVT_IMG_NM }" /></strong>
									</a>
									<a href="javascript:goRecomm('<c:out value="${bestRow.EVT_IMG_IDX }" />');" class="btn_gre">
										<i class="ico_good"><span class="blind">추천</span></i>
										<strong><c:out value="${bestRow.EVT_IMG_RCM_CNT }" /></strong>
									</a>
								</li>
								</c:forEach>
								</c:when>
							</c:choose>
							</ol>
						</dd>
						<!--// .best_5 E -->
						
						<!-- .photo_sh S -->
						<form name="frm" id="frm" data-ajax="false">
						<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" value="" />
						<dd class="photo_sh">
							<div class="list_type" >
								<label for="sel_type" class="sel_box_st0">
									<select id="searchType" name="searchType">
										<option value="id" <c:if test="${commandMap.searchType eq 'id'}"> selected</c:if> >아이디</option>
										<option value="nm" <c:if test="${commandMap.searchType eq 'nm'}"> selected</c:if> >이름</option>
										<option value="title" <c:if test="${commandMap.searchType eq 'title'}"> selected</c:if>>제목</option>
										<option value="cts" <c:if test="${commandMap.searchType eq 'cts'}"> selected</c:if>>내용</option>
									</select>
								</label>
								<label for="inp_txSh" class="inp_txSh">
									<span class="blind">검색어를 입력하세요</span>
									<input type="text" name="searchKey" id="searchKey" value="<c:out value="${commandMap.searchKey }" />" />
								</label>
								<a href="javascript:goSearch();" class="btn_gre"><strong>검색하기</strong></a>
							</div>
						</dd>
						</form>
						<!--// .photo_sh E -->
						
						<!-- .photo_list S -->
						<dd class="photo_list">
							<ol>
							<c:choose>
								<c:when test="${not empty imgList}">
								<c:forEach items="${imgList }" var="row" varStatus="sta">
								<li class="item" id="<c:out value="${row.EVT_IMG_IDX }" />">
									<a href="javascript:void(0)" class="_pg_link">
										<!--  i class="ico_best1"><span class="blind">best1</span></i>-->
										<img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMM_FLE_ALT_TXT }" />" />
										<span class="tx_dateNid"><c:out value="${row.EVT_IMG_REG_DT_CHAR }" />" / <c:out value="${row.EVT_IMG_REG_ID }" /></span>
										<strong class="tx_ti"><c:out value="${row.EVT_IMG_NM }" /></strong>
									</a>
									<c:if test="${commandMap.MEM_MST_MEM_ID eq row.EVT_IMG_REG_ID}">
									<a href="javascript:void(0)" data-evt_img_idx="<c:out value="${row.EVT_IMG_IDX }" />" class="btn_del"><span class="blind">내가 등록한 사진 지우기</span></a>
									</c:if>
									<a href="javascript:goRecomm('<c:out value="${row.EVT_IMG_IDX }" />');" class="btn_gre">
										<i class="ico_good"><span class="blind">추천</span></i>
										<strong><c:out value="${row.EVT_IMG_RCM_CNT }" /></strong>
									</a>
								</li>
								</c:forEach>
								</c:when>
							</c:choose>
							</ol>
						</dd>
						<!--// .photo_list E -->
					</dl>
				</dd>
				<!--// .dd_best E -->

			</dl>
		</section>
		<!--// .event_vw E -->
		
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
<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	var msnry = $( '.best_5 ol').masonry({
			itemSelector: '.item',
			stamp: '.f',
			resize: true
		}),
		msnry2 = $( '.photo_list ol').masonry({
			itemSelector: '.item',
			resize: true
		});
	
	
	//혹시나 몰라서 append해야할때 이렇게 써주세요
	/*$('.section-title h2').on('click', function(){
		var _list_html = $('<li class="item"><a href="javascript:void(0)" class="_pg_link ui-link" data-role="button" data-transition="slide" data-inline="true" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" data-theme="c"><i class="ico_best1"><span class="blind">best1</span></i><img src="http://www.etland.co.kr//etland/images/event/contests/thumb_L_583865.jpg" alt=""><span class="tx_dateNid">2015.11.29 / IDIDID</span><strong class="tx_ti">26일 첫눈 오는 날 000에서 찍었어요.</strong></a><a href="javascript:void(0)" class="btn_gre ui-link"><i class="ico_good"><span class="blind">추천</span></i><strong>250</strong></a></li>');
		
		msnry2.append( _list_html ).masonry( 'appended', _list_html );
	});*/

	//혹시나 몰라서 remove했을때 이렇께 써주세요.
	msnry2.on( 'click', '.btn_del', function() {
		var evt_img_idx	= $(this).data("evt_img_idx");
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type	: "POST",
				url		: "/mobile/event/eventImageDelAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" 		: "<c:out value="${info.EVT_MST_IDX}" />"
							, "EVT_IMG_IDX"		: evt_img_idx
							},
				success : function(data) {
					alert(data.resultMsg);
					msnry2.masonry( 'remove', $(this).parent('.item') ).masonry('layout');
				},error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});		
		}
	});
	
	
	//$(document).on("click", ".btn_recom", function(){
	goRecomm 		= function(evt_img_idx){ 		
		if(confirm("추천하시겠습니까?")){
			
			//var evt_img_idx	= $(this).data("evt_img_idx");
			
			$.ajax({
				type	: "POST",
				url		: "/mobile/event/eventImageRecommAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
							, "EVT_IMG_IDX" : evt_img_idx },
				success : function(data) {
					alert(data.resultMsg);
					if(data.succss){
						location.reload();
					}
				}, error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		}
	}
	//});
	
	goSearch		= function(){
		
		if($("#searchKey").val() == ""){
			alert("검색어를 입력하세요.");
			$("#searchKey").focus();
			return;
		}
		$("#EVT_MST_IDX").val('<c:out value="${info.EVT_MST_IDX}" />');
		$("#frm").attr("action", "/mobile/event/eventView.do").submit();
	};
	
	$(document).on("change", "#sel_ingEv", function(){
		var evt_mst_idx 		= $(this).val();
		//$("#EVT_MST_IDX").val(evt_mst_idx);
		//$("#frm").attr("action", "/mobile/event/eventView.do").submit();
		location.href = "<c:out value="${mobileDoamin}" />/mobile/event/eventView.do?EVT_MST_IDX=" + evt_mst_idx;
	});
	
	goImgDetail		= function(evt_img_idx){
		location.href = "<c:out value="${mobileDoamin}" />/mobile/event/eventImgView.do?EVT_MST_IDX=<c:out value="${info.EVT_MST_IDX}" />&EVT_IMG_IDX=" + evt_img_idx;
	}
	
	insertKeepingContents = function(MEM_CTS_GBN_IDX){
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
				,"MEM_CTS_GBN" : "E" //기획전:P, 이벤트:E, 매거진:M
			},
			url : "<c:out value="${frontDomain}" />/mobile/contents/insertInterestContentsAjax.do",
			success : function(data) {
				var result = data.result;//0:로그인 필요 1:성공 -1:실패
				if(result == 0){
					if(confirm(data.resultMsg)){
						var url = location.href;
						
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
	
	// sns kakostory
	goProductKakaoStory = function(){
		
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/event/eventView.do?EVT_MST_IDX=<c:out value='${commandMap.EVT_MST_IDX}' />";
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
		
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/event/eventView.do?EVT_MST_IDX=<c:out value='${commandMap.EVT_MST_IDX}' />";
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent("<c:out value="${info.EVT_MST_TITLE}" />");

		if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
			callJavascriptOutlinkPage(url+"&text="+text);
	    }else{
	    	var twitter = window.open("about:blank");
	    	twitter.location.href="https://twitter.com/share?url="+url+"&text="+text;
	    }
	};
	
	// sns facebook
	goProductFacebook = function(){ 
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/event/eventView.do?EVT_MST_IDX=<c:out value='${commandMap.EVT_MST_IDX}' />"; 
	    var text = encodeURIComponent("<c:out value="${info.EVT_MST_TITLE}" />");
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    
	    if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
	    	callJavascriptOutlinkPage(url);
	    }else{
	    	var faceBook = window.open("about:blank");
	    	faceBook.location.href=url;
	    }
	}; 
});
</script>