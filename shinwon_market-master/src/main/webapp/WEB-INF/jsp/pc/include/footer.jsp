<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="footer" class="footer clearboth">
        <div class="f_left">
            <dl>
                <dt class="blind">신월몰 정보</dt>
                <dd>
                    <ul class="clearboth">
                        <li><a href="http://www.sw.co.kr/" target="blank">회사소개</a></li>
                        <li><a href="<c:out value="${frontDomain}"/>/pc/business/businessMain.do" target="_blank">입점안내</a></li>
                        <li><a href="<c:out value="${frontDomain}"/>/pc/customer/faqBoardList.do">고객센터</a></li>
                        <li><a href="javascript:privacyPolicy();">개인정보취급방침</a></li>
                        <li><a href="javascript:utilAgree();">이용약관</a></li>
                        <li><a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058111908&apv_perm_no=" class="box" target="blank">사업자정보확인</a></li>
                        <li><a href="#" onclick="javascript:window.open('http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=shinwon1','Escro','width=460,height=540,scrollbars=auto,resizable=yes');" style="cursor:pointer" class="box">에스크로 서비스 가입확인</a></li>
                    </ul>
                </dd>
            </dl>
            <address>(주)신원 대표자(성명) : 박정주 사업장 소재지 : 서울 마포구 독막로 328(도화동) 대표번호 : 1661-2585<br>사업자 등록번호 안내 : 105-81-11908 개인정보관리책임자 : 송대섭 통신판매업 신고 : 2016-서울마포-0401</address>
            <p class="copy">COPYRIGHT &copy; 2016 (주) 신원. ALL RIGHTS RESERVED.</p>
        </div>
        <div class="f_right">
            <dl>
                <dt>SHARE YOUR STYLE</dt>
                <dd>
                    <ul class="clearboth">
                        <li><a href="https://www.instagram.com/shinwonmall/" class="btn_share_insta" target="_blank" title="새창으로 쑈윈도 인스타그램 바로가기">쑈윈도 인스타그램</a></li>
                        <li><a href="https://www.facebook.com/mall.shinwon.9" class="btn_share_fackbook" target="_blank" title="새창으로 쑈윈도 페이스북 바로가기">쑈윈도 페이스북</a></li>
                        <li><a href="https://www.youtube.com/" class="btn_share_youtube" target="_blank" title="새창으로 쑈윈도 유투브 바로가기">쑈윈도 유투브</a></li>
                    </ul>
                </dd>
            </dl>
        </div>
        
    </div>
    <!-- popUp -->
    		<!-- <div class="sub_content" id="pop">
                <div class="dim"></div>

                <div id="layer_benefit" class="layer type03 is_btn">
                    <div class="layer_header">
                        <h2>약관명 노출 영역</h2>
                    </div>
                    <div class="layer_content">
                        <div class="agree_box">
                            	약관 내용 출력 영역
                        </div>
                    </div>
                    <div class="layer_footer">
                        <div class="btn_wrap">
                            <button type="button" class="btn_large purple">확인</button>
                        </div>
                    </div>
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
            </div> -->
			<!-- leyerPopup -->
	
				<div id="privacyPolicyPop" >
				</div>
				<div id="utilAgreePop">
				</div>
				<!-- //leyerPopup -->
				
</div>
</body>
</html>
<script>
	
	privacyPolicy = function(){
    	
    	$("#privacyPolicyPop").load("<c:out value="${frontDomain}"/>/pc/customer/privacyPolicy.do");
    	$("#privacyPolicyPop").show();
    	$(".dim").show();
    }
	
	utilAgree = function(){
    	
    	$("#utilAgreePop").load("<c:out value="${frontDomain}"/>/pc/customer/utilAgree.do");
    	$("#utilAgreePop").show();
    	$(".dim").show();
    }
 
	
	
</script>