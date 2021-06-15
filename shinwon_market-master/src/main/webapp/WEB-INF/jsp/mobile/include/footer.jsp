<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 레이어팝업 -->
	    <div id="menuSlide">
	    	<%@ include file="/WEB-INF/jsp/mobile/include/menuSlide.jsp" %>
	    </div>
	    <div id="privacyPolicyPop" ">
			<%@ include file="/WEB-INF/jsp/mobile/customer/privacyPolicy.jsp" %>
		</div>
		<!-- //레이어팝업 -->
				<div id="utilAgreePop">
				</div>	
			<footer id="footer">
				<dl class="f_menu">
				    <dt class="hidden">쑈윈도 정책소개</dt>
				    <dd>
				        <ul class="cf">
				            <li><a href="http://www.sw.co.kr/" target="blank"">회사소개</a></li>
				            <li><a href="#n">매장안내</a></li>
				            <li><a href="/pc/business/businessMain.do" target="blank">입정안내</a></li>
				            <li><a href="/mobile/customer/faqBoardList.do">고객센터</a></li>
				            <li id="privacyPolicy"><a href="javascript:privacyPolicy()"><strong>개인정보 취급방침</strong></a></li>
				            <li><a href="javascript:utilAgree();">이용약관</a></li>
				        </ul>
				    </dd>
				</dl>
				<dl class="sw_tel">
				    <dt>대표전화</dt>
				    <dd><a href="tel:1661 - 2585" title="대표번호로 전화하기">1661 - 2585</a></dd>
				</dl>
				<address>(주) 신원<br>대표자(성명) : 박정주<br>사업장 소재지 : 서울 마포구 독막로 328(도화동)<br>사업자 등록번호 안내 : 105-81-11908 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058111908&apv_perm_no=" target="_blank">사업자 정보 확인</a><br>통신판매업 신고 : 2016-서울마포-0401<br>개인정보관리책임자 : 송대섭  <a href="http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=shinwon1','Escro','width=460,height=540,scrollbars=auto,resizable=yes" target="_blank">에스크로 서비스 가입확인</a></address>
				<p class="copy">COPYRIGHT © 2016 (주) 신원. ALL RIGHTS RESERVED.</p>
				<!-- .f_social -->
				<div class="f_social">
				    <ul class="social_list cf">
				        <li><a href="http://pf.kakao.com/_FfDbu" target="_blank" title="새창으로 쑈윈도 YOUTUBE 바로가기" class="btn_youtube">YOUTUBE</a></li>
				        <li><a href="https://www.instagram.com/shinwonmall/" target="_blank" title="새창으로 쑈윈도 인스타그램 바로가기" class="btn_insta">인스타그램</a></li>
				        <li><a href="https://www.facebook.com/mall.shinwon.9" target="_blank" title="새창으로 쑈윈도 페이스북 바로가기" class="btn_facebook">페이스북</a></li>
				        <li><a href="#" target="_blank" title="새창으로 에스크로서비스가입확인 바로가기" class="btn_escrow">에스크로서비스가입확인</a></li>
				    </ul>
				</div>
				<!-- // .f_social -->
			</footer>
	
	        <div class="bottom_btn_area">
            <div class="bottom_btn_area_inner">
                <button type="button" class="bottom_btn_ootd_add">OOTD 등록</button>
                <ul class="cf">
                    <li class="bottom_btn_menu"><a href="#" >MENU</a></li>
                    <li class="bottom_btn_ootd"><a href="/mobile/main/index.do">OOTD</a></li>
                    <li class="bottom_btn_store"><a href="/mobile/store/storeList.do">STORE</a></li>
                    <li class="bottom_btn_brand"><a href="/mobile/brand/brandMain.do">BRAND</a></li>
                    <li class="bottom_btn_my"><a href="/mobile/mypage/myPageMain.do">MY</a></li>
                </ul>
            </div>
        </div>
        <!-- // .bottom_btn_area -->
        <!-- bottom_write_layer -->
        <div class="bottom_write_layer">
            <div class="bottom_write_layer_inner">
                <div class="bottom_banner"><img src="/nas/cdn/MW/images/_temp/bottom_banner.png" alt="배너배너"></div>
                <ul class="board_link">
                    <li><a href="/mobile/ootd/ootdRegistForm.do">OOTD 등록하기</a></li>
                    <li><a href="#n">상품리뷰 등록하기</a></li>
                </ul>
            </div>
        </div>
        
        <div class="bottom_write_dim"></div>
        
        <!-- // bottom_write_layer -->
        
        
    <!-- // #wrap -->

<!-- <script src="/nas/cd/MW/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
    <script type="text/javascript">
      var swiper = new Swiper('.funding_slide .swiper-container', {
        slidesPerView: 1.1,
        spaceBetween: 5,
        initialSlide: 0,
        roundLengths: true,
        pagination: {
          el: '.swiper-pagination',
        }
      });
      
    //메뉴슬라이드
  	$(document).ready(function () {
		$(".menuSlide").hide();
		$(".bottom_btn_menu").click(function () {
			$(".menuSlide").toggle();
			//$("#footer").toggle();
			$("#content_area").toggle();
			$("#header").toggle();
			
		});
	});
	
    
    //개인정보 제공 동의 레이어팝업
    $(document).ready(function () {
    	$("#privacyPolicyPop").hide();
    	$("#privacyPolicy").click(function () {
		//$("#privacyPolicyPop").load("<c:out value="${serverDomain}"/>/mobile/customer/privacyPolicy.do");
		$("#privacyPolicyPop").toggle();
		$("#container").toggle();
		$("#header").toggle();
		$("#footer").toggle();
		$(".bottom_btn_area").toggle();
		});
	});
    
	  
 	 utilAgree = function(){
    	
    	$("#utilAgreePop").load("<c:out value="${frontDomain}"/>/mobile/customer/utilAgree.do");
    	$("#utilAgreePop").show();
    	
    };
    
   /*  $(document).on("click","privacyPolicy", function () {
		$("#privacyPolicyPop")
	})
     */
    
	
      
  </script>

	