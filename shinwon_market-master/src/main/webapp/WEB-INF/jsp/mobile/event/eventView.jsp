<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<style type="text/css">
	.evt_con{position:relative;}
	.evt_con img{width:100%;}
	.evt_btn1{position:absolute;bottom:22.26258432797%;left:6.17647058824%;width:43.13725490196%;height:4.87804878049%;}
	.evt_btn2{position:absolute;bottom:22.26258432797%;left:50.98039215686%;width:43.13725490196%;;height:4.87804878049%;}
	.evt_btn3{position:absolute;bottom:11.24595469256%;left:32.64705882353%;width:36.86274509804%;height:5.74433656958%;}
	.evt_btn4{position:absolute;bottom:12.77842907386%;left:6.17647058824%;width:43.13725490196%;height:5.50996483001%;}
	.evt_btn5{position:absolute;bottom:12.77842907386%;left:50.88235294118%;width:43.13725490196%;height:5.50996483001%;}
</style>
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
					<c:choose>
						<c:when test="${info.EVT_MST_IDX eq '215' }">
							<div class="evt_con">
								<img src="<c:out value="${cdnDomain}${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />"  usemap="#card02" /><br/>
								<a href="https://www.samsungcard.com/personal/login/UHPPCO0301M0.jsp" target="_blank" class="evt_btn3"></a>
							</div>
						</c:when>
						<c:when test="${info.EVT_MST_IDX eq '214' }">
							<div class="evt_con">
								<img src="<c:out value="${cdnDomain}${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />"  usemap="#card01" /><br/>
								<a href="http://www.samsungcard.com/personal/card/cardfinder/UHPPCA0102M0.jsp?code=AAP1399&site=etland" target="_blank" class="evt_btn1"></a>
								<a href="http://www.samsungcard.com/personal/card/cardfinder/UHPPCA0102M0.jsp?code=AAP1399&site=etland&fastIsCardYn=Y" target="_blank" class="evt_btn2"></a>
							</div>								
						</c:when>
						<c:when test="${info.EVT_MST_IDX eq '213' }">
							<div class="evt_con">
							<img src="<c:out value="${cdnDomain}${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />"  usemap="#card03" /><br/>
							<a href="http://www.lottecard.co.kr/app/IHCDAAA_V200.do?vt_cd_knd_c=P01944-A01944" target="_blank" class="evt_btn4"></a>
							<a href="http://www.lottecard.co.kr/app/view/if/gate.jsp?b_id=10840_10888_11134&vt_cd_knd_c=P01946-A01946" target="_blank" class="evt_btn5"></a>
							</div>
						</c:when>
						<c:otherwise>
							<img src="<c:out value="${cdnDomain }${info.FILE_NM2 }" />" alt="" longdesc="#ev_tx_con" />
						</c:otherwise>
					</c:choose>
					</c:if>
					<div id="ev_tx_con" class="blind">
						<c:out value="${info.CMM_FLE_ALT_TXT2 }" />
					</div>
				</dd>
				<c:if test="${!(info.EVT_MST_IDX eq 216 || info.EVT_MST_IDX eq 215 || info.EVT_MST_IDX eq 214 || info.EVT_MST_IDX eq 213 || info.EVT_MST_IDX  eq 316) }">
				<dd class="dd_btn">
					<a href="javascript:goProcess();" class="btn_blu"><strong>응모하기</strong></a>
				</dd>
				</c:if>
				<c:if test="${info.EVT_MST_IDX eq 316 }">
				<dd >
					<a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myWritableProductCommentList.do" ><img src="<c:out value="${cdnDomain }"/>/pc/img/btn/product_recomment_btn.jpg" /></a>
				</dd>
				</c:if>
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
	<form name="frm" id="frm" >
	<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" value="" />
	</form>
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
			
			$.ajax({
				type	: "POST",
				url		: "/mobile/event/eventEntryAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
							, "EVT_AGT" 	: agt},
				success : function(data) {
					alert(data.resultMsg);
				}, error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
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