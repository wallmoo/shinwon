<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-exhibi"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
			<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>쇼핑기획전</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
			<div class="btn_r">
				<a href="javascript:$.com.util.layPop('open', $('#layShare'))" class="btn_share"><em class="blind">쇼핑기획전 공유하기</em></a>
				<a href="javascript:insertKeepingContents(<c:out value="${planInfo.PLN_MST_IDX}" />);" class="btn_hart"><em class="blind">쇼핑기획전 찜하기</em></a>
			</div>
        </div>
		<!--// .section-title E -->
		
		<!-- .exhibi_vw S -->
		<section class="exhibi_vw">
			<h2><c:out value="${planInfo.PLN_MST_TITLE}" /></h2>
			<span class="tx_date"><ui:formatDate value="${planInfo.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${planInfo.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
			<div class="img_con">
				 ${planInfo.PLN_MST_MOBILE_BANNER }
			</div>
			<c:forEach var="row" items="${detailGroupList }" varStatus="i">
				<c:if test="${row.PLN_GRP_TYPE eq 'T'}">
					<p class="tx_mas"><c:out value="${row.PLN_GRP_TITLE}" /></p>
				</c:if>
				<c:if test="${row.PLN_GRP_TYPE eq 'I'}">
					<a href="javascript:void(0);" class="banner_img"><img src="<c:out value="${cdnDomain}" /><c:out value="${row.CMM_FLE_ATT_PATH}" /><c:out value="${row.CMM_FLE_SYS_NM}" />" alt="배너" /></a>
				</c:if>
				<ul class="ui-grid-a pr_list">
					<c:forEach var="rowProduct" items="${detailList }" varStatus="i">
						<c:if test="${row.PLN_GRP_IDX eq rowProduct.PLN_GRP_IDX }">
							<li class="ui-block-<c:out value="${rowProduct.RNK_GB}" />">
								<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${rowProduct.PLN_PRD_MST_CD }" />', '_self');" class="_pg_link">
									<span class="tx_img"><img data-original="<c:out value="${cdnDomain}" /><c:out value="${rowProduct.IMG_THUMBNAIL}" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
									<span class="tx_ti"><ui:shortTitle title="${rowProduct.PRD_MST_NM_SUB}" length="35"/></span>
									<strong class="tx_price">
										<fmt:formatNumber value="${rowProduct.PLN_PRD_PRICE }" groupingUsed="true" /><span>원</span>
										<c:if test="${rowProduct.PRD_SALE_RATE > 0 }">
										<em class="discount">
											<span class="blind">할인률</span>
											<strong class="tx_num"><fmt:formatNumber value="${rowProduct.PRD_SALE_RATE }" groupingUsed="true" /></strong>%
										</em>
										</c:if>
									</strong>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</c:forEach>
		</section>
		<!--// .exhibi_vw E -->
		
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

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	// 쿠키에 저장된 관리자 아이디
// 	cookie();

//     // 로그인 폼 탭 조작 처리
// //     $('#tabLogin li a').on('click', function(e){
// //         e.preventDefault();

// //         // 탭 전환
// //         var $target = (this.hash) ? $(this.hash) : null;
// //         $target.activeCurrent({
// //             classDeactive: 'hide'
// //         });

// //         // 전환 후 폼 초기화
// //         var $siblings = $target.siblings();
// //         $siblings.find('input.text').val('');
// // //        $siblings.find('input[type="checkbox"]').removeAttr('checked');
        
// //         cookie();
// //     });

//     // 폼체크
//     $("#memberForm").validate({
//         rules: {
//             MEM_MST_MEM_ID:{required:true}, // 아이디
//             MEM_MST_WEB_PWD:{required:true} // 비밀번호
//         },
//         messages :{
//         	MEM_MST_MEM_ID : {required:"아이디를 입력해주세요."},
//         	MEM_MST_WEB_PWD : {required:"비밀번호를 입력해주세요."}
//         }
//         ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
//         ,onkeyup:false
// 	    ,onclick:false
// 	    ,onfocusout:false
//         ,showErrors:function(errorMap, errorList){
//  	       if(this.numberOfInvalids()) { 
// 	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
// 	    	   //alert('[' + caption + '] ' + errorList[0].message);
// 	    	   var errorOobjId = $(errorList[0].element).attr('id');
// 	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
// 	    	   caption = caption.replace('*','').replace(/\s/gi,'');
// 	    	   if(caption != null && caption != "") 
// 	    	   {
// 	    	       alert('[' + caption + '] ' + errorList[0].message);
// 	    	   }
// 	    	   else
// 	    	   {
// 	    	       alert(errorList[0].message);
// 	    	   }
// 	    	   $(errorList[0].element).focus();
// 	       }
// 	   }
//     });
    
//     // 아이디 form 엔터 이벤트
//     $(document).on("keydown", "#MEM_MST_MEM_ID", function (e){
//         if(e.keyCode == 13){
//             login();
//         }
//     });
    
//     // 비밀번호 form 엔터 이벤트
//     $(document).on("keydown", "#MEM_MST_WEB_PWD", function (e) {
//         if(e.keyCode == 13){
//             login();
//         }
//     });
    
//     // 로그인 버튼 클릭
//     $(document).on("click", ".btn_login", function () {
//         login();
//     });
    
//   	//비회원 구매/주문조회 클릭 이벤트
// 	nonMemberLogin = function(){
// 		if("${commandMap.ORD_MST_CD}" != ""){
// 			location.href = "<c:out value="${mobileSslDomain}"/>/pc/manager/nonMemberLogin.do?ORD_MST_CD=${commandMap.ORD_MST_CD}";
// 		}else{
// 			location.href = "<c:out value="${mobileSslDomain}"/>/pc/manager/nonMemberLogin.do";	    		
// 		}
// 	};
// });

// // 쿠키에 저장된 관리자 아이디
// function cookie()
// {
// 	var cookieEtlandUserId = $.cookie("cookieEtlandUserId");

// 	if(cookieEtlandUserId != null && cookieEtlandUserId != "") // 쿠키가  존재 할경우
// 	{
// 	    $("#saveId").attr("checked", "checked");
// 	    $("#MEM_MST_MEM_ID").val(cookieEtlandUserId);
// 	    //$("#MEM_MST_WEB_PWD").focus();
// 	}
// 	else // 쿠키가 존재하지 않을경우
// 	{
// 	    //$("#MEM_MST_MEM_ID").focus();
// 	}
// }

// //회원 로그인
// function login () 
// {
//     var $memberForm = $("#memberForm");

//     if($memberForm.valid())
//     {
//     	$("input[name=url]").val(encodeURIComponent(decodeURIComponent($("input[name=url]").val())));
    	
//         $memberForm.attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/manager/loginProc.do", "target":"_self", "method":"post"}).submit();
//         return false;
//     }
	
	// sns kakostory
	goProductKakaoStory = function(){
		
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value='${commandMap.PLN_MST_IDX}' />";
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
		
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value='${commandMap.PLN_MST_IDX}' />";
		var url = encodeURIComponent(paramUrl);
		var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE}" />");

		if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
			callJavascriptOutlinkPage(url+"&text="+text);
	    }else{
	    	var twitter = window.open("about:blank");
	    	twitter.location.href="https://twitter.com/share?url="+url+"&text="+text;
	    }
	};
	
	// sns facebook
	goProductFacebook = function(){ 
		var paramUrl = "<c:out value="${mobileDomain}"/>/mobile/event/planProductList.do?PLN_MST_IDX=<c:out value='${commandMap.PLN_MST_IDX}' />"; 
	    var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE}" />");
	    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
	    
	    if(navigator.userAgent.indexOf("MobileApp") > -1 ){	
	    	callJavascriptOutlinkPage(url);
	    }else{
	    	var faceBook = window.open("about:blank");
	    	faceBook.location.href=url;
	    }
	}; 
	
	// 관심등록
	insertKeepingContents = function(MEM_CTS_GBN_IDX){
		$.ajax({
			async : false,
			type : "POST",
			data : {
				"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
				,"MEM_CTS_GBN" : "P" //기획전:P, 이벤트:E, 매거진:M
			},
			url : "<c:out value="${mobileDomain}" />/mobile/contents/insertInterestContentsAjax.do",
			success : function(data) {
				var result = data.result;//0:로그인 필요 1:성공 -1:실패
				if(result == 0){
					if(confirm(data.resultMsg)){
						var url = location.href;
						url = encodeURIComponent(url);
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
 });

//]]>
</script>
</body>
</html>