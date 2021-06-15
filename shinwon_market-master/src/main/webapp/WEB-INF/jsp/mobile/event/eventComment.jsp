<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<img src="<c:out value="${cdnDomain }${info.FILE_NM2}" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />" longdesc="#ev_tx_con" />
					</c:if>
					<div id="ev_tx_con" class="blind">
						<c:out value="${info.CMM_FLE_ALT_TXT2 }" />
					</div>
				</dd>
				<dd class="dd_comment">
					<dl class="comm_form">
						<dt>
							<strong>댓글달기 이벤트</strong>
							<span><i class="ico_exc">!</i>로그인 후 댓글 등록 가능합니다.</span>
						</dt>
						<dd class="dd_form">
							<div class="">
								<textarea name="comment" id="comment" placeholder="200자 이내로 남겨주세요."></textarea>
							</div>
							<a href="javascript:goProcess();" class="btn_comm"><strong>댓글<br/>달기</strong></a>
						</dd>
					</dl>
					
					<p class="list_type">
						<strong class="tx_ti">총 <strong id="commCnt"><c:out value="${iCommCount }" /></strong>개의 댓글이 있습니다.</strong>
						<a href="javascript:void(0)" class="btn_gre_l"><strong>MY 댓글 보기</strong></a>
					</p>
					<ol id="commTbody" class="_scroll_list_ck">
					<c:choose>
						<c:when test="${not empty commList }">
						<c:set var="commListNum" value="${paging.listNum }" />
						<c:forEach var="commRow" items="${commList }">
						<li>
							<em><c:out value="${commListNum }" /></em>
							<p class="tx_comm"><c:if test="${commRow.EVT_RPL_CHN_TYPE eq 'M' }"><i class="ico_phone"><span class="blind">핸드폰으로 등록</span></i></c:if><c:out value="${commRow.EVT_RPL_CTS }" /></p>
							<span class="tx_idNdate"><c:out value="${commRow.HID_EVT_RPL_REG_ID }" />/<c:out value="${commRow.EVT_RPL_REG_DT_CHAR }" /></span>
							
							<a href="javascript:commentDel('<c:out value="${commRow.EVT_RPL_IDX }" />');" class="btn_close"><span class="blind">내가 등록한 댓글 지우기</span></a>
							
						</li>
						<c:set var="commListNum" value="${commListNum -1}" />
						</c:forEach>
						</c:when>
					</c:choose>												
					</ol>
				</dd>
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
	<script type="text/javascript">
		
		$(document).on("change", "#sel_ingEv", function(){
			var evt_mst_idx 		= $(this).val();
			//$("#EVT_MST_IDX").val(evt_mst_idx);
			//$("#frm").attr("action", "/mobile/event/eventView.do").submit();
			location.href = "<c:out value="${mobileDomain}" />/mobile/event/eventView.do?EVT_MST_IDX=" + evt_mst_idx;
		});
		
		//$(document).on("click", ".btn_entry", function(){
		goProcess			= function(){			
			
			var agt			= checkAgt();
			var comment		= $("#comment").val();
			
			if(comment == ""){
				alert("댓글 내용을 입력하세요.");
			}else{
				$.ajax({
					type	: "POST",
					url		: "/mobile/event/eventEntryAjax.do",
					dataType: "json",
					data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
								, "EVT_AGT" 	: agt
								, "EVT_RPL_CTS" : comment
								},
					success : function(data) {
						alert(data.resultMsg);
						goPage(1);
					}, error : function(err) {
						window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}
		};
		
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
		
		goPage			= function(cPage){
			$.ajax({
				type	: "POST",
				url		: "/mobile/event/eventCommetnListAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" 		: "<c:out value="${info.EVT_MST_IDX}" />"
							, "cPage"			: cPage
							},
				success : function(data) {
					var innerHtml	= "";
					if(data.totalPageCount == 0){
						innerHtml = "";
					}else{
						var listNum		= data.listNum;
						$.each(data.commList, function(i,item){
							innerHtml	+= '<li>';
							innerHtml	+= '<em>' + listNum + '</em>';
							innerHtml	+= '<p class="tx_comm">';
							if (item.EVT_RPL_CHN_TYPE == 'M'){
								innerHtml += '<i class="ico_phone"><span class="blind">핸드폰으로 등록</span></i>';
							}
							innerHtml	+= item.EVT_RPL_CTS + '</p>';
							innerHtml 	+= '<span class="tx_idNdate">'+ item.HID_EVT_RPL_REG_ID + '/' + item.EVT_RPL_REG_DT_CHAR + "</span>";
							if(item.EVT_RPL_REG_ID == item.MEM_MST_MEM_ID){
							innerHtml 	+= '<a href="javascript:commentDel('+ item.EVT_RPL_IDX + ');" class="btn_close"><span class="blind">내가 등록한 댓글 지우기</span></a>';
							}
							innerHtml	+= '</li>';
							listNum		= listNum -1;
						});
						$("#commTbody").html(innerHtml);
					}
					
					$("#commCnt").text(data.totalRecordCount);
				},error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		};
		
		commentDel			= function(idx){
			$.ajax({
				type	: "POST",
				url		: "/mobile/event/eventCommetnDelAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" 		: "<c:out value="${info.EVT_MST_IDX}" />"
							, "EVT_RPL_IDX"		: idx
							},
				success : function(data) {
					alert(data.resultMsg);
					goPage(1);
				},error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});				
		};
		
		$.com.win_scrollList = true;//스크롤 할거야~
		function _return_scrollList(_idx, _reNum){
			
			var totalCount		= <c:out value="${paging.totalPageCount}" />
			
			if(_reNum <= totalCount ){
				$.ajax({
		        	async 	: false,
		        	type 	: "POST",
		        	data	: {
		        				"cPage"				: _reNum + 2
		        				,"EVT_MST_IDX" 		: "<c:out value="${info.EVT_MST_IDX}" />"
							},
		        	url		: "<c:out value="${mobileDomain}" />/mobile/event/eventCommetnListAjax.do",
					success : function(data) {
						var listNum		= data.listNum;
						$.each(data.list, function(i,item){
							innerHtml	+= '<li>';
							innerHtml	+= '<em>' + listNum + '</em>';
							innerHtml	+= '<p class="tx_comm">';
							if (item.EVT_RPL_CHN_TYPE == 'M'){
								innerHtml += '<i class="ico_phone"><span class="blind">핸드폰으로 등록</span></i>';
							}
							innerHtml	+= item.EVT_RPL_CTS + '</p>';
							innerHtml 	+= '<span class="tx_idNdate">'+ item.HID_EVT_RPL_REG_ID + '/' + item.EVT_RPL_REG_DT_CHAR + "</span>";
							if(item.EVT_RPL_REG_ID == item.MEM_MST_MEM_ID){
							innerHtml 	+= '<a href="javascript:commentDel('+ item.EVT_RPL_IDX + ');" class="btn_close"><span class="blind">내가 등록한 댓글 지우기</span></a>';
							}
							innerHtml	+= '</li>';
							listNum		= listNum -1;
						});
						
						$("#commTbody").append(innerHtml);
					}, error 	: function(err) {
						//alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}else{
				$.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
			}
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
	</script>
</section>
<!--// #wrap E -->
</body>
</html>