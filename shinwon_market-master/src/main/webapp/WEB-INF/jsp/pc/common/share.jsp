<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<div class="sub_content">
                <div class="dim"></div>

                <div id="pop_share" class="layer type01">
                    <div class="layer_header">
                        <h2>공유하기</h2>
                    </div>
                    <div class="layer_content">
                        <!-- .socialshare -->
                        <div class="socialshare">
                            <ul class="socialshare_list clearboth">
                                <li><button type="button" id="facebook" class="btn_socialshare_facebook">페이스북</button></li>
                                <li><button type="button" id="twitter" class="btn_socialshare_twitter">트위터</button></li>
                                <li><button type="button" id="naverBand" class="btn_socialshare_band">밴드</button></li>
                                <li><button type="button" id="kakaoStory" class="btn_socialshare_kakaostory">카카오스토리</button></li>
                                <li><button type="button" id="kakaoTalk" class="btn_socialshare_kakao">카카오톡</button></li>
                            </ul>
                            <div class="btn_wrap">
                                <button class="btn_small" id="urlCopy">URL 복사</button>
                            </div>
                        </div>
                        <!-- // .socialshare -->
                    </div>
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
            </div>

	<form name="snsInitForm" id="snsInitForm">
		<input type="hidden" name="FRONT_DOMAIN" id="FRONT_DOMAIN" value="<c:out value="${frontDomain}" />" />
<%-- 		<input type="hidden" name="url" value="<c:out value="${commandMap.url}"/>"/> --%>
        <input type="hidden" name="locationProtocol" value="<c:out value="${commandMap.locationProtocol }"/>"/>
		 <c:if test="${not empty snsUseList }">
             <c:forEach var="snsUseRow" items="${snsUseList }" varStatus="i">  
                 <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '네이버' }">
                     <input type="hidden" name="SNS_NAVER_API_KEY" id="SNS_NAVER_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />
                     <input type="hidden" name="SNS_NAVER_CODE" id="SNS_NAVER_CODE" value="${snsUseRow.SNS_MST_TYPE }" />      
                 </c:if>   
                 <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '카카오' }">  
                     <input type="hidden" name="SNS_KAKAO_API_KEY" id="SNS_KAKAO_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />
                     <input type="hidden" name="SNS_KAKAO_CODE" id="SNS_KAKAO_CODE" value="${snsUseRow.SNS_MST_TYPE }" />  
                 </c:if>  
                 <c:if test="${snsUseRow.SNS_MST_TYPE_NM eq '페이스북' }">        
                     <input type="hidden" name="SNS_FACEBOOK_API_KEY" id="SNS_FACEBOOK_API_KEY" value="${snsUseRow.SNS_MST_API_KEY }" />
                     <input type="hidden" name="SNS_FACEBOOK_CODE" id="SNS_FACEBOOK_CODE" value="${snsUseRow.SNS_MST_TYPE }" />  
                 </c:if>      
             </c:forEach>       
         </c:if>    
	</form>
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/kakao.min.js" charset="utf-8"></script>                   <!-- kakao 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/snsSDK.js" charset="utf-8"></script> 
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/naver_band_08062020.js" charset="utf-8"></script> 
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/clipboard.js"></script> 
<script type="text/javascript">
var prdMstCd = '<c:out value="${productInfo.PRD_MST_CD}" />';
var prdNm = '<c:out value="${productInfo.PRD_MST_NM}" />';
$(document).ready(function(){
	var clipboard = new ClipboardJS('#urlCopy', {
	    text: function() {
	    	alert('클립보드에 복사하였습니다');
	        return document.URL;
	    }
	});
	
});

/* 
SNS 공유하기 	
 */
 var setKakaoData = function(title,description,image){
	var kakaoKey = $('#SNS_KAKAO_API_KEY').val();
	if(!title){title='SHOWINDOW';}
	if(!image){image='<c:out value="${cdnDomain }"/><c:out value="${ logoUrl }"/>';}
	if(!description){title='믿음을 으뜸으로 하는 기업';}
	if(!Kakao.isInitialized()){Kakao.init(kakaoKey)};
	var link = window.location.href;
	var mobileUrl = link.replace(/pc./g,"mobile.");
	var pcUrl = link.replace(/mobile./g,"pc.");	
    Kakao.Link.createDefaultButton({
      container: '#kakaoTalk',
      objectType: 'feed',
      content: {
        title: title,
        description: description,
        imageUrl: image,
        link: {
          mobileWebUrl: mobileUrl,
          webUrl: pcUrl
        }
      },
      buttons: [
        {
          title: 'SHOWINDOW 이동',
          link: {
            mobileWebUrl: mobileUrl,
            webUrl: pcUrl
          }
        }
      ]
    });
 }
//sns band
 goProductBand = function(prdMstCd) 
 { 
	 var encodeBody = encodeURIComponent( String.format('{0}\n{1}', content, url) );
	 var encodeRoute = encodeURIComponent( window.location.href );
	 var link = String.format( 'http://band.us/plugin/share?body={0}&route={1}', encodeBody, encodeRoute ); 
	 window.open( link, 'share', 'width=500, height=500' );
 };    
 
	// sns kakostory
goProductKakaoStory = function(prdMstCd)
{
	var paramUrl = "<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD="+prdMstCd;
	var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 
    window.open(url,'kakoStory','toolbar=0,status=0,width=1024,height=665'); 
};
// sns Twitter
goProductTwitter = function(prdMstCd)
{
	var paramUrl = "<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD="+prdMstCd;
	var url = encodeURIComponent(paramUrl);
	var text = encodeURIComponent("");
	window.open("https://twitter.com/share?url="+url+"&text="+text, "twitter", "width=650, height=400");
};

// sns facebook
goProductFacebook = function(prdMstCd) 
{ 
    var paramUrl = "<c:out value="${frontDomain}"/>/pc/product/productView.do?PRD_MST_CD="+prdMstCd; 
    var text = encodeURIComponent(prdNm);
    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
    window.open(url,'faceBook','toolbar=0,status=0,width=1024,height=665'); 
};    
String.format = function() { let args = arguments; return args[0].replace(/{(\d+)}/g, function(match, num) { num = Number(num) + 1; return typeof(args[num]) != undefined ? args[num] : match; }); }


$(document).on('click','#kakaoStory',goProductKakaoStory);
$(document).on('click','#twitter',goProductTwitter);
$(document).on('click','#facebook',goProductFacebook);
$(document).on('click','#naverBand',goProductBand);
</script>
