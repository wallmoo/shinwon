<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- #footer S -->
	<footer id="footer" class="footer" data-role="footer" role="contentinfo">
		<!-- #footer_nav S -->
		<nav id="footer_nav" class="ct ft_nav">
			<a href="<c:out value="${mobileDomain }"/>/mobile/main/index.do" target="_self" class="ico_home web"><strong>홈</strong></a>
			<a href="javascript:callJavascriptHome();" target="_self" class="ico_home app"><strong>홈</strong></a>
			<a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myKeepProductList.do" target="_self" class="ico_keeping web"><strong>키핑백</strong></a>
			<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myKeepProductList.do','_self');" target="_self" class="ico_keeping app"><strong>키핑백</strong></a>
			<a href="<c:out value="${mobileSslDomain }"/>/mobile/mypage/myShoppingList.do" target="_self" class="ico_order web"><strong>주문배송</strong></a>
			<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myShoppingList.do','_self');" target="_self" class="ico_order app"><strong>주문배송</strong></a>
			<a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do" target="_self" class="ico_myland web"><strong>MYLAND</strong></a>
			<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain }"/>/mobile/mypage/myPageMain.do','_self');" target="_self" class="ico_myland app"><strong>MYLAND</strong></a>
			<a href="javascript:;" class="ico_more"><strong>더보기</strong></a>
			<dl id="laymore" class="laymore">
				<dt class="blind">더보기 서브메뉴 레이어</dt>
				<dd>
					<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myGetItNowOrderList.do','_self');" class="ico_coupon app" target="_self"><strong>교환권</strong></a>
					<a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myGetItNowOrderList.do" class="ico_coupon web" target="_self"><strong>교환권</strong></a>
					<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/recentProductList.do','_self');" class="ico_wish _pg_link" ><strong>최근 본 상품</strong></a>
					<a href="javascript:callJavascriptOutlinkPage('<c:out value="${mobileDomain }"/>/info/mobile/branch/branchList.do','_self');" class="ico_store" ><strong>지점안내</strong></a>
					<a href="javascript:callJavascriptSetting();" class="ico_set app"><strong>설정</strong></a>
				</dd>
			</dl>
		</nav>
		<!--// #footer_nav E -->
		<a href="javascript:window.scrollTo(0,0)" class="btn_top"><i></i><span class="blind">맨위로</span></a>
		<a href="javascript:showProductDetail('contents');" class="btn_zoom"><i></i><span class="blind">확대보기</span></a>
		<a href="javascript:window.scrollTo(0,0)" class="btn_top"><i></i><span>TOP</span><span class="blind">맨위로 가기</span></a>
		<ul class="ft_mn1 web">
			<li class="f">
				<c:choose>
					<c:when test="${not empty sessionUser.MEM_MST_MEM_ID }">
						<a href="<c:out value="${mobileDomain }"/>/mobile/manager/logout.do" class="_pg_link" target="_self"><strong>로그아웃</strong></a>
					</c:when>
					<c:otherwise>
						<a href="<c:out value="${mobileDomain }"/>/mobile/manager/login.do" class="_pg_link" target="_self"><strong>로그인</strong></a>
					</c:otherwise>
				</c:choose>
			</li>
			<li><a href="javascript:goAppStore();" class="_pg_link"><strong>APP 다운로드</strong></a></li>
			<li><a href="<c:out value="${mobileBrandDomain }"/>/info/mobile/branch/branchList.do" class="_pg_link" target="_blank"><strong>지점안내</strong></a></li>
		</ul>
		
		<ul class="ft_mn1 app">
			<li class="f">
				<c:choose>
					<c:when test="${not empty sessionUser.MEM_MST_MEM_ID }">
						<a href="<c:out value="${mobileDomain }"/>/mobile/manager/logout.do" class="_pg_link" target="_self"><strong>로그아웃</strong></a>
					</c:when>
					<c:otherwise>
						<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/manager/login.do','_self');" class="_pg_link" target="_self"><strong>로그인</strong></a>
					</c:otherwise>
				</c:choose>
			</li>
			<li><a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/customer/customerMain.do','_self');" class="_pg_link"><strong>고객센터</strong></a></li>
			<li><a href="javascript:callJavascriptOutlinkPage('<c:out value="${mobileBrandDomain }"/>/info/mobile/branch/branchList.do');" class="_pg_link"><strong>지점안내</strong></a></li>
		</ul>
		
		<ul class="ft_mn2 web">
			<li class="f"><a href="<c:out value="${mobileDomain }"/>/mobile/member/onlineAgreement.do" class="_pg_link" target="_self"><strong>이용약관</strong></a></li>
			<li><a href="<c:out value="${mobileDomain }"/>/mobile/member/basicMemInfoPolicy.do" class="_pg_link" target="_self"><strong>개인정보취급방침</strong></a></li>
			<li class="l"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="_pg_link" target="_blank"><strong>PC버전</strong></a></li>
		</ul>
		
		<ul class="ft_mn2 app">
			<li class="f"><a href="<c:out value="${mobileDomain }"/>/mobile/member/onlineAgreement.do" class="_pg_link" target="_self"><strong>이용약관</strong></a></li>
			<li><a href="<c:out value="${mobileDomain }"/>/mobile/member/basicMemInfoPolicy.do" class="_pg_link" target="_self"><strong>개인정보취급방침</strong></a></li>
			<li><a href="javascript:callJavascriptNextPage('http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2004302009530200064&area1=&area2=&currpage=1&searchKey=04&searchVal=1068101704&stdate=&enddate=','_blank');" class="_pg_link"><strong>사업자정보확인</strong></a></li>
			<li class="l"><a href="javascript:callJavascriptOutlinkPage('<c:out value="${frontDomain }"/>/pc/main/index.do');" class="_pg_link" target="_blank"><strong>PC버전</strong></a></li>
		</ul>

		<address>
			<strong class="ti_name">(주)이패스씨앤아이 / 마켓플랜트</strong>
			<p class="tx_info">
				개인정보관리 책임자 : 아모개<br/>
				고객센터 : <a href="tel:02-6925-1160" class="link_tel"><strong>02-6925-1160</strong></a>   <a href="javascript:void(0)" class="link_em">marketplant@epasscni.com</a>
			</p>
		</address>
		
		<div class="ft_sns web">
			<a href="https://www.facebook.com/etlandpriceking" class="btn_f _pg_link"  target="_blank"><span class="blind">페이스북 바로가기</span></a>
			<!-- <a href="http://blog.naver.com/etland21th" class="btn_b" target="_blank"><span class="blind _pg_link">블로그 바로가기</span></a> -->
			<a href="javascript:alert('준비중입니다.');" class="btn_b" ><span class="blind _pg_link">블로그 바로가기</span></a>
		</div>
		
		<div class="ft_sns app">
			<a href="javascript:callJavascriptOutlinkPage('https://www.facebook.com/etlandpriceking');" class="btn_f _pg_link" target="_blank"><span class="blind">페이스북 바로가기</span></a>
			<a href="javascript:callJavascriptOutlinkPage('http://blog.naver.com/etland21th');" class="btn_b" target="_blank"><span class="blind _pg_link">블로그 바로가기</span></a>
		</div>
		
		<small>MarketPlant ⓒ All Rights Reserved.</small>
	</footer>
	<!--// #footer E -->		

<!-- referrer 가 필요한 화면 이동시 사용할 blank form -->
<form name="_blank_form" id="_blank_form"></form>

<script>
$(function(){

	// 뒤로가기
	$(".back").on("click",function(){
		if(navigator.userAgent.indexOf("MobileApp") > -1 ){
			window.location="appcall:prevpage$";
		}
		else{
			history.back(-1);
			return false;			
		}
	});
	
	// 모바일 app으로 실행했을 경우
	if(navigator.userAgent.indexOf("MobileApp") > -1 ){
		$(".web").remove();
	}
	else{
		$(".app").remove();
	}
});

function callJavascriptLogin(){
    //로그인 페이지 호출
    window.location="appcall:loginpage$";
}
//return url 추가 된 페이지 (url 암호화 하지 않음)
function callJavascriptLoginUrl(url,target){
	var ordMstCd = "";
	if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
		//로그인 페이지 호출
	    if(url == ""){
	    	url = location.href;	
	    }else{
	    	if(url.indexOf("ORD_MST_CD") > -1){
	    		ordMstCd = url.substring(url.indexOf("ORD_MST_CD=")+11,url.indexOf("ORD_MST_CD=")+11+13);
	    	}
	    }
		
	    <c:choose>
			<c:when test="${empty sessionUser.MEM_MST_MEM_ID }">
				if(ordMstCd != ""){
					window.location="appcall:loginpage$"+url+"$"+ordMstCd;
				}else{
					window.location="appcall:loginpage$"+url;
				}
			</c:when>
			<c:otherwise>
				if(url.indexOf("myPageMain.do") > -1 || url.indexOf("myShoppingList.do") > -1 || url.indexOf("myShoppingInfo.do") > -1 || url.indexOf("myCouponUsableList.do") > -1
						|| url.indexOf("myMileageList.do") > -1 || url.indexOf("myKeepProductList.do") > -1 || url.indexOf("myWritableProductCommentList.do") > -1 || 
						url.indexOf("myProductInquiryList.do") > -1 || url.indexOf("myInquiryList.do") > -1 || url.indexOf("myBuyShoppingList.do") > -1 || url.indexOf("myEventList.do") > -1
						|| url.indexOf("myEstimate.do")> -1){
					
					window.location="appcall:nextpage$"+url;
				}				
				else{
					window.location=url;					
				}
			</c:otherwise>
		</c:choose>
	}
	else{
		if(target == "_blank"){
			var blank = window.open("about:blank");
			blank.location.href=url;
		}
		else{
			location.href=url;
			location.target=target;
		}
	}
}

function callJavascriptHome(){
    //메인 페이지 호출
    window.location="appcall:homepage$";
}

function callJavascriptSetting(){
    //설정 페이지 호출
    var url = location.href;
    window.location="appcall:settingpage$"+url;
}

function callJavascriptNextPage(url,target){
	if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
		//새로운 페이지 호출 appcall:nextpage$요청url
	    window.location="appcall:nextpage$"+url;
	}else{
		if(target == "_blank"){
			var blank = window.open("about:blank");
			blank.location.href=url;
		}
		else{
			location.href=url;
			location.target=target;
		}
	}
}

function callJavascriptOutlinkPage(url){
    //outlink 페이지 호출 appcall:outlinkpage$요청url
    window.location="appcall:outlinkpage$"+url;
}
	// app 설치 
	function goAppStore()
	{	
// 		var strUserAgent = navigator.userAgent;
// 		var market_url = "market://details?id=com.blackyak.app";
// 		var appstore_url = ""; /* ios 앱 주소나오시면 여기에 붙여넣으시면 됩니다. */
// 		strUserAgent = strUserAgent.toLowerCase();
// 		if(/android/.test(strUserAgent))
// 		{
// 			if(confirm("구글 플레이스토어로 이동합니다."))
// 			{
// 				location.href = market_url;	
// 			}
// 		}
// 		else if(/iphone|ipad/.test(strUserAgent))
// 		{
			alert("서비스 준비중입니다.");
			/*  ios 앱 주소나오시면 주석을 풀어주세요.
			
			if(confirm("앱스토어로 이동합니다."))
			{
				location.href = appstore_url;	
			}  
			*/
// 		}
		
	}
	
</script>
<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script>
 $.cookie("UID", "${sessionUser.MEM_MST_MEM_ID}", { path: '/', expires: 1 }  );
</script> 
<%
	//String user_id = request.getParameter("user_id"); // 사용자 ID를 웹폼에서 받아온다
	//String user_password = request.getParameter("user_password"); // 사용자 PASSWORD를 웹폼에서 받아온다
	//Cookie cookie = new Cookie("UID", "${sessionUser.MEM_MST_MEM_ID}"); // 쿠키를 세팅한다
	//cookie.setPath("/");
	//response.addCookie(cookie);
%>
