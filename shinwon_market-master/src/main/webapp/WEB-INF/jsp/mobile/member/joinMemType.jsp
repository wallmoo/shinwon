<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

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
		
		<form id="dataForm" name="dataForm" method="post">
		<input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value=""/>
		<input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value=""/>
		<input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value=""/>
		<input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value=""/>
		</form>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
            	<form name="memberForm" id="memberForm"> 
                <input type="hidden" name="pageType" id="pageType" value="main"/>  <!-- 메인로그인창 -->
                <input type="hidden" name="ROLE_USER" value="user" />
                <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
                
                <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />
            
                <div class="cp01">
                    <div class="join_info_bx">
                        <p class="tit">
                            <img src="/nas/cdn/MW/images/content/member/img_logo.png" alt="SHINWONMALL" class="logo"><span>회원가입</span>
                        </p>
                        <p class="txt">쑈윈도 회원가입시 즉시 사용할 수 있는<br>4가지의 혜택을 드립니다.</p>
                        <ul class="benefit_list">
                            <li class="b01">
                                <div>
                                    <strong>10% 할인쿠폰</strong>
                                    <span>전 상품 사용 가능한 할인쿠폰 지급</span>
                                </div>
                            </li>
                            <li class="b02">
                                <div>
                                    <strong>3,000원 할인쿠폰</strong>
                                    <span>3,000원 이상 구매시 할인쿠폰 즉시 지급</span>
                                </div>
                            </li>
                            <li class="b03">
                                <div>
                                    <strong>3,000 포인트</strong>
                                    <span>가입 즉시 사용 가능한 포인트 지급</span>
                                </div>
                            </li>
                            <li class="b04">
                                <div>
                                    <strong>멤버십 포인트 적립</strong>
                                    <span>구매 금액의 등급별 포인트 적립 </span>
                                </div>
                            </li>
                        </ul>
                        <div class="btn_area">
                            <button type="button" class="btn ok" id="joinBtn">회원가입</button>
                        </div>
                    </div>
                </div>
                <div class="sns_member_wp">
                    <div class="sns_mb">
                        <p class="title">SNS간편회원가입</p>
                        <div class="btn_sns">
                            <a href="javascript:loginKakao();" 	  class="kakao" 		id="custom-login-btn">카카오톡</a>
                            <a href="javascript:loginNaver();" 	  class="naver" 		id="naver_id_login">네이버</a>
                            <a href="javascript:loginFacebook();" class="facebook"  	id="facebook_login">페이스북</a>
                        </div>
                    </div>
                    <!-- <div class="offline_mb">
                        <p class="t_tit">신원 오프라인 매장의 회원이세요? </p>
                        <p class="t_txt">등급별 멤버십 혜택<br>신원 통합회원 전환시 5,000 포인트 즉시 증정</p>
                        <div class="btn_area">
                            <button type="button" class="btn black" id="joinConvertBtn">통합회원전환</button>
                        </div>
                    </div> -->
                </div>
				</form>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
        
<script src="<c:out value="${mobileSslDomain}" />/nas/cdn/mobile/js/common.js"></script>
<script src="<c:out value="${mobileSslDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>      
<script src="<c:out value="${mobileSslDomain}" />/nas/cdn/mobile/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script src="<c:out value="${mobileSslDomain}" />/nas/cdn/mobile/js/kakao.min.js" charset="utf-8"></script>                   <!-- kakao 자바스크립트 SDK -->
<script src="<c:out value="${mobileSslDomain}" />/nas/cdn/mobile/js/snsSDK.js" charset="utf-8"></script>
<script>
	$(function () {
		$("#joinBtn").on("click", function () {
			location.href = "<c:out value="${mobileDomain}"/>/mobile/member/joinMemBasicStep2.do"
		});
	})
	
</script> 
<script>
	function fnSnsLogin(data){
		if(data){
			$("#MEM_SNS_TYPE").val(getSnsCode(data.sns));
			$("#MEM_SNS_ID").val(data.id);
			$("#MEM_SNS_NM").val(data.name);
			$("#MEM_SNS_EMAIL").val(data.email);
			$("#dataForm").attr({"action":"/mobile/member/joinMemSnsStep2.do", "target":"_self", "method":"post"}).submit();
		}
	}
	function getSnsCode(snsName){
		var selector = "";
		if(snsName == "kakaotalk"){
			selector = "#SNS_KAKAO_CODE";
		}
		else if(snsName == "facebook"){
			selector = "#SNS_FACEBOOK_CODE";
		}
		else if(snsName == "naver"){
			selector = "#SNS_NAVER_CODE";
		}
		return $(selector).val();
	}
	$("#joinConvertBtn").on("click", function(){
		location.href = "<c:out value="${mobileDomain}"/>/mobile/member/offlineMemStep1.do";
	})
</script>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
