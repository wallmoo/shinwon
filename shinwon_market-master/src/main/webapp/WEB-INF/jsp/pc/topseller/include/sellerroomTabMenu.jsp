<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        
        <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         	<div class="topseller_left">
        </c:if>
        
        <div class="topseller_hd">
               <div class="seller">
                   <span class="sl_img"><img src="${cdnDomain }${sellerInfo.PROFILE_IMG }" alt="셀러 이미지"></span>
                   <a href="#"  onclick="goSellerInfo()" class="sl_name">${sellerInfo.BND_MST_SEL_NM }</a>
                   <!-- <a href="/pc/topseller/sellerroom/sellerroomInfo.do?VDR_MST_IDX=${commandMap.VDR_MST_IDX }" class="sl_name">${sellerInfo.BND_MST_SEL_NM }</a> -->
               </div>
               <div class="sl_activity">
                   <a href="javascript:void(0);" class="like ${sellerInfo.LIKE_CLS }" onclick="javascript:likeBtnEvent($(this), ${sellerInfo.VDR_MST_IDX }, 'TYPE_TOP_SELLER')">
                   		<span class="blind">좋아요</span>${sellerInfo.LIKE_COUNTS }
                   </a>
                   <a href="javascript:void(0);" class="shop">${sellerInfo.PRDUCT_CNT } </a>
                   <a href="#n" class="share" onclick='javascript:showModal()' >공유하기</a>
                   
                   <c:if test="${not empty sellerInfo.BND_MST_INST_URL}">
                   		<a href="${sellerInfo.BND_MST_INST_URL }" target="_blank" class="instagram">인스타그램 바로가기</a>
                   </c:if>
                   
                   
               </div>
        </div>

		<div class="topseller_nav">
			<ul>
				<li id="sellerroomHomeElem" onclick="goTopMenuPage('sellerroomHome')" ><a href="javascript:void(0)">HOME</a></li>
				<li id="sellerroomShopElem" onclick="goTopMenuPage('sellerroomShop')"><a href="javascript:void(0)">SHOP</a></li>
				<li id="sellerroomSellerPickListElem" onclick="goTopMenuPage('sellerroomSellerPickList')"><a href="javascript:void(0)">셀러픽</a></li>
				<li id="sellerroomLookBookElem" onclick="goTopMenuPage('sellerroomLookBook')"><a href="javascript:void(0)">LOOKBOOK</a></li>
				<li id="sellerroomMediaElem" onclick="goTopMenuPage('sellerroomMedia')"><a href="javascript:void(0)">MEDIA</a></li>
				<li id="sellerroomBrandInfoElem" onclick="goTopMenuPage('sellerroomBrandInfo')"><a href="javascript:void(0)">매장안내</a></li>
				<li id="sellerroomQnaElem" onclick="goTopMenuPage('sellerroomQna')"><a href="javascript:void(0)">Q&A</a></li>
			</ul>
		</div>
   
		<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         	</div>
        </c:if>
    
    <form id="pageForm" name="pageForm">
		<input type="hidden" id="VDR_MST_IDX" name="VDR_MST_IDX" value="${commandMap.VDR_MST_IDX }">
	</form>
	
	
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
                                <li><button type="button" onclick="goSellerPickBand()"       class="btn_socialshare_band">밴드</button></li>
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

<script>

	$(document).ready(function(){
		setActiveUI();
		$("#layer_benefit").hide();
	});
	
	
	
	setActiveUI = function(){
		var id = location.href;
		
		if(id.indexOf("sellerroomHome") > -1){
			$("#sellerroomHomeElem").addClass("active");
		}else if(id.indexOf("sellerroomShop") > -1){
			$("#sellerroomShopElem").addClass("active");
		}else if(id.indexOf("sellerroomSellerPickList") > -1){
			$("#sellerroomSellerPickListElem").addClass("active");
		}else if(id.indexOf("sellerroomLookBook") > -1){
			$("#sellerroomLookBookElem").addClass("active");
		}else if(id.indexOf("sellerroomMedia") > -1){
			$("#sellerroomMediaElem").addClass("active");
		}else if(id.indexOf("sellerroomBrandInfo") > -1){
			$("#sellerroomBrandInfoElem").addClass("active");
		}else if(id.indexOf("sellerroomQna") > -1){
			$("#sellerroomQnaElem").addClass("active");
		}
	}
	
	goTopMenuPage = function(url, idx){
		var pageForm = $("#pageForm");
    	//pageForm.find("input[name='CNT_MST_IDX']").val(idx);
    	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/"+url+".do", "target":"_self", "method":"post"}).submit();
    	
	}
	
	
	goSellerInfo = function () {
		
		var pageForm = $("#pageForm");
    	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/sellerroomInfo.do", "target":"_self", "method":"post"}).submit();		
		
	}
	
	
    //모달 팝업
    showModal = function(){
    	
    	/*
    	$("#shareParam").val();
    	$("#shareName").val();
    	*/
		var propertyValueObj = {"top" : "50%" ,"left" : "50%" ,"margin" : "-260px 0 0 -260px"};
		$("#layer_benefit").css(propertyValueObj);
		$("#layer_benefit").show();
    }	
    
    
    
    // TODO URL 복사 구현중
	goProductCopyClipBoard = function () {
		
		  var t = document.createElement("textarea");
		  document.body.appendChild(t);
		  t.value = "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomHome.do" + "?VDR_MST_IDX=${commandMap.VDR_MST_IDX }" ;
		  t.select();
		  document.execCommand('copy');
		  document.body.removeChild(t);    	
		  alert("링크 복사가 완료되었습니다."); 		
		
	};
	
	// TODO sns kakostory 구현중
	goSellerPickKakaoStory = function(){
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomHome.do" + "?VDR_MST_IDX=${commandMap.VDR_MST_IDX }" ;
		var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 
	    window.open(url,'kakoStory','toolbar=0,status=0,width=1024,height=665'); 
	};
	
	// TODO sns Twitter 구현중
	goSellerPickTwitter = function(){
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomHome.do" + "?VDR_MST_IDX=${commandMap.VDR_MST_IDX }" ;
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent($("#shareName").val());
		window.open("https://twitter.com/share?url="+url+"&text="+text, "twitter", "width=650, height=400");
	};
	
	// TODO sns facebook 구현중
	goSellerPickFacebook = function() {
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomHome.do" + "?VDR_MST_IDX=${commandMap.VDR_MST_IDX }" ;
		var text = encodeURIComponent($("#shareName").val());
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    window.open(url,'faceBook','toolbar=0,status=0,width=1024,height=665'); 
	};
	
	goSellerPickBand= function() {
		var paramUrl = "<c:out value="${frontDomain}"/>/pc/topseller/sellerroom/sellerroomHome.do" + "?VDR_MST_IDX=${commandMap.VDR_MST_IDX }" ;
		var text = encodeURIComponent($("#shareName").val());	    
	    var url = 'http://band.us/plugin/share?body=' +encodeURIComponent(paramUrl)+'\\n' + text +'&route=www.shinwonmall.com' ;
	    window.open(url,'band','toolbar=0,status=0,width=1024,height=665');

	    
	};	
	    
    
	
</script>