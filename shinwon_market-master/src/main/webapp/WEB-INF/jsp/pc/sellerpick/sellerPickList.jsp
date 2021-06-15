<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<script src="/nas/cdn/PW/js/masonry.pkgd.js"></script>
<script type="text/javascript" src="/nas/cdn/pc/js/clipboard.js"></script>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">

			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************
			
            S : 콘텐츠 시작

            ***************************************************************************** -->
            
            
            <!-- layerPopup start -->
            <div class="sub_content">
                <div class="dim"></div>
                <div id="layer_benefit" class="layer type01">
                    <div class="layer_header">
                        <h2>공유하기</h2>
                    </div>
                    <div class="layer_content">
                        <!-- .socialshare -->
                        <div class="socialshare">
                            <ul class="socialshare_list clearboth">
                                <li><button type="button" onclick="goSellerPickFacebook()"   class="btn_socialshare_facebook">페이스북</button></li>
                                <li><button type="button" onclick="goSellerPickTwitter()"    class="btn_socialshare_twitter">트위터</button></li>
                                <li><button type="button" onclick="goSellerPickBand()"      class="btn_socialshare_band">밴드</button></li>
                                <li><button type="button" onclick="goSellerPickKakaoStory()" class="btn_socialshare_kakaostory">카카오스토리</button></li>
                                <input type="hidden" id="shareParam" name="shareParam" value="" />
                                <input type="hidden" id="shareName" name="shareName" value="" />
                            </ul>
                            <div class="btn_wrap">
                                <button onclick="goProductCopyClipBoard()" class="btn_small">URL 복사</button>
                            </div>
                        </div>
                        <!-- // .socialshare -->
                    </div>
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
            </div>
            
            <!-- layerPopup end -->
            
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">셀러픽</h2>
            </div>
            <!-- .seller_recom_goood_area -->
            <div class="seller_recom_goood_area">
                <ul class="clearboth">
                	<c:forEach var="topListRow" items="${toplist }" varStatus="i">
	                    <li>
	                        <%-- <a href="javascript:goPage('<c:out value="${topListRow.CNT_MST_IDX }" />')">--%>
	                        <a href="${topListRow.BNR_MST_URL }" target="_blank"/>
	                        	<img src="${cdnDomain}${topListRow.FILE_NM }" alt="${topListRow.CMN_FLE_ALT_TXT }">
	                            <dl class="pos_top">
	                                <dt><c:out value="${topListRow.BNR_MST_TITLE }" /></dt>
	                                <dd><c:out value="${topLIstRow.BNR_MST_DESC }" /></dd>
	                            </dl>
	                        </a>
	                    </li>
                	</c:forEach>
                </ul>
            </div>
            <!-- // .seller_recom_goood_area -->
            <div class="grid_wrap seller_post">
                <div class="grid" id="sellerListContannier">
                    <div class="grid_sizer"></div>
                </div>
            </div>
            
                    <div class="grid_item" id="gridTemp" style="display: none;">
                        <a href="#">
                            <div class="thum_img">
                                <img src="../../images/@temp/img_sellerpic_grid_01.jpg" alt="">
                            </div>
                            <div class="seller_info_wrap clearboth">
                                <div class="seller_info_thum">
                                    <img src="../../images/@temp/img_temp_por.jpg" alt="">
                                </div>
                                <span class="seller_name">pinkprincess</span>
                            </div>
                            <p class="subject">공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook공주님 Dailylook</p>
                            <span class="txt">핑크곤듀로 만들어주는 룩!<br>#핑크원피스 #셔링원피스 #러블리 #원피스 #셔링원피스 #러블리 #원피스 #셔링원피스 #러블리 #원피스 #셔링원피스 #러블리 #원피스</span>
                        </a>
                        <div class="btn_area clearboth">
                            <div class="btn_like_sellerhome_area clearboth">
                                <button type="button" class="btn-like" title="좋아요"><span>480</span></button>
                                <a href="#">셀러홈으로 이동하기</a>
                            </div>
                            <button type="button" class="btn_social_sharing">공유하기</button>
                        </div>
                    </div>            
            
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<form id="pageForm" name="pageForm">
	<input type="hidden" id="CNT_MST_IDX" name="CNT_MST_IDX">
</form>

<script>

	var cPage = 1;
	var isLastData =false;
	var isAjaxing = false;
	var pageSize = 20;
	
	$(document).ready(function(){
        loadPlanListFn();
        sellerPicBanner();
    });
    
    // 스크롤 이벤트
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			loadPlanListFn();
		}
		
	});
    
    // 리스트 호출
    loadPlanListFn = function(){
    	
    	if(isAjaxing || isLastData){ return; }
    	
    	isAjaxing = true;
    	
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/sellerpick/sellerPickListAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage , "pageSize" : pageSize},
    		success : function(data) {
    			
    			console.log('data', data)
    			
    			if(data.list.length < pageSize) isLastData = true;
    			
    			addSellerPickList(data.list);
    			
    			cPage += data.list.length;
    		}, error : function(err) {
    			//alert("요청 실패");
    		}, complete : function() {
    			isAjaxing = false;
    		}
    	});
    }
    loadPlanListFn();
    
    // 이미지 퍼블 확인용(임시)
	function getRandomArbitrary(min, max) {
		return Math.floor(Math.random()*(max-min+1)) + min;
	}
    
    // 데이터 렌더링
    addSellerPickList = function(list){
    	
		if(list == null){ return; }
		
		for(var idx =0; idx < list.length; idx++){

			var html = "";
				html += "<div class='grid_item'>";
				html += "	<a href=\"javascript:goPage("+list[idx].CNT_MST_IDX+")\">";
				html += "		<div class=\"thum_img\">";
				

				html += "<img src=\"<c:out value="${cdnDomain}"/>"+list[idx].CMM_FLE_ATT_PATH+list[idx].CMM_FLE_SYS_NM +"\" alt=\""+list[idx].CMN_FLE_ALT_TXT+"\">";
				
				html += "		</div>";
				html += "		<div class=\"seller_info_wrap clearboth\">";
				html += "			<div class=\"seller_info_thum\">";
				html += "<img src=\"<c:out value="${cdnDomain}"/>"+list[idx].SELLER_IMG+"\" alt=\""+list[idx].CMN_FLE_ALT_TXT+"\">";

				html += "			</div>"; 
		
				html += "			<span class=\"seller_name\">"+list[idx].BND_MST_SEL_NM+"</span>";
				html += "		</div>";
				html += "		<p class=\"subject\">"+list[idx].CNT_MST_TITLE+"</p>";
				html += "		<span class=\"txt\">"+(list[idx].CNT_MST_DESC.length < 45 ? list[idx].CNT_MST_DESC : list[idx].CNT_MST_DESC.substring(0, 45)+"...")+"<br>";
				html +=      list[idx].TAG_MST_TITLE +"</span>";
				
				html += "	</a>";
				html += "	<div class=\"btn_area clearboth\">";
				html += "		<div class=\"btn_like_sellerhome_area clearboth\">";
				html += "			<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].CNT_MST_IDX+"','TYPE_SELLER_PICK')\" class=\"btn-like"+(list[idx].MY_LIKE == 'Y' ? " on" : "")+"\" title=\"좋아요\"><span>"+list[idx].LIKE_COUNTS+"</span></button>";
			
	 			html += "			<a href=\"javascript:goSellerRoomPage("+list[idx].CNT_MST_IDX+")\">셀러홈으로 이동하기</a>";
				html += "		</div>";
				html += "		<button type=\"button\"\" onclick=\"showModal("+list[idx].CNT_MST_IDX+",'"+list[idx].CNT_MST_TITLE+"' )\" class=\"btn_social_sharing\">공유하기</button>";;
				html += "	</div>";
				html += "</div>";
                
			$("#sellerListContannier").append(html);
		}
		
		setTimeout(function(){
	        $('#sellerListContannier').masonry({
	    	    itemSelector: '.grid_item',
	    	    columnWidth: '.grid_sizer',
	    	    percentPosition: true,
	    	    transitionDuration: '0.3s'
	    	});				
		},200)

    }
    
    // 상세 페이지 이동
    goPage = function(idx){
    	var pageForm = $("#pageForm");
    	pageForm.find("input[name='CNT_MST_IDX']").val(idx);
    	pageForm.attr({"action":"/pc/sellerpick/sellerpickView.do", "target":"_self", "method":"post"}).submit();
    }
    
    //모달 팝업
    showModal = function( param  , title){
    	//return;
    	$("#shareParam").val( param );
    	$("#shareName").val( title );
		var propertyValueObj = {"top" : "50%" ,"left" : "50%" ,"margin" : "-260px 0 0 -260px"};
		$("#layer_benefit").css(propertyValueObj);
		$("#layer_benefit").show();
    }
    
 	// 셀러룸 이동
	goSellerRoomPage = function(idx){
		var pageForm = $("#pageForm");
    	pageForm.find("input[name='CNT_MST_IDX']").val(idx);
    	pageForm.attr({"action":"/pc/sellerroom/sellerroomHome.do", "target":"_self", "method":"post"}).submit();
	}
    
    // TODO URL 복사 구현중
	goProductCopyClipBoard = function () {
		
		  var t = document.createElement("textarea");
		  document.body.appendChild(t);
		  t.value = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do" + "?CNT_MST_IDX="  +  $("#shareParam").val() ;
		  t.select();
		  document.execCommand('copy');
		  document.body.removeChild(t);    	
		  alert("링크 복사가 완료되었습니다."); 		
		
	};
	
	// TODO sns kakostory 구현중
	goSellerPickKakaoStory = function(){
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do" + "?CNT_MST_IDX="  +  $("#shareParam").val()   ;
		var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 
	    window.open(url,'kakoStory','toolbar=0,status=0,width=1024,height=665'); 
	};
	
	// TODO sns Twitter 구현중
	goSellerPickTwitter = function(){
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do" + "?CNT_MST_IDX="  +  $("#shareParam").val()   ;
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent($("#shareName").val());
		window.open("https://twitter.com/share?url="+url+"&text="+text, "twitter", "width=650, height=400");
	};
	
	// TODO sns facebook 구현중
	goSellerPickFacebook = function() {
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do" + "?CNT_MST_IDX="  +  $("#shareParam").val()   ;
		var text = encodeURIComponent($("#shareName").val());
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    window.open(url,'faceBook','toolbar=0,status=0,width=1024,height=665'); 
	};
	
	goSellerPickBand= function() {
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/sellerpick/sellerpickView.do" + "?CNT_MST_IDX="  +  $("#shareParam").val()   ;
		var text = encodeURIComponent($("#shareName").val());	    
	    var url = 'http://band.us/plugin/share?body=' +encodeURIComponent(paramUrl)+'\\n' + text +'&route=www.shinwonmall.com' ;
	    window.open(url,'band','toolbar=0,status=0,width=1024,height=665');

	    
	};	
	
	
	// 셀러픽 - 테마전시배너
	sellerPicBanner = function(){
        $('.seller_recom_goood_area').find('li:odd').find('dl').removeClass('pos_top');
        $('.seller_recom_goood_area').find('li:odd').find('dl').addClass('pos_bottom');
	};
</script>
