<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	
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
	<div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->
			<form name="memberForm" id="memberForm"> 
                <input type="hidden" name="pageType" id="pageType" value="main"/>  <!-- 메인로그인창 -->
                <input type="hidden" name="ROLE_USER" value="user" />
                <input type="hidden" name="url" value="<c:out value="${empty commandMap.url ? header.referer : commandMap.url}"/>"/>
                
                <input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="" />
            <!-- Title -->
	            <div class="pg_tit_wrap">
	                <h2 class="pg_tit">회원가입 안내</h2>
	            </div>
	            <!--// Title -->
	            <div class="sub_content">
	                <ul class="member_info">
                    <li>
                        <div class="coupon">
                            <strong>10%</strong>
                            <em>COUPON</em>
                        </div>
                        <dl>
                            <dt>10% 할인쿠폰</dt>
                            <dd>전 상품 사용 가능한<br> 할인쿠폰 지급</dd>
                        </dl>
                    </li>
                    <li>
                        <div class="coupon">
                            <strong>3,000</strong>
                            <em>COUPON</em>
                        </div>
                        <dl>
                            <dt>3,000원 할인쿠폰</dt>
                            <dd>3,000원 이상 구매시<br> 할인쿠폰 즉시 지급</dd>
                        </dl>
                    </li>
                    <li>
                        <div class="point">
                            <strong>3,000<span>P</span></strong>
                        </div>
                        <dl>
                            <dt>3,000 포인트</dt>
                            <dd>가입 즉시 사용 가능한<br> 포인트 지급</dd>
                        </dl>
                    </li>
                    <li>
                        <div class="point">
                            <strong class="txt_big">P</strong>
                        </div>
                        <dl>
                            <dt>멤버십 포인트 적립</dt>
                            <dd>구매 금액의<br> 등급별 포인트 적립</dd>
                        </dl>
                    </li>
                </ul>
	                <div class="btn_wrap">
	                    <button class="btn_large ok wide" type="button" id="joinBtn">회원가입</button>
	                </div>
	                <div class="join_type">
	                    <ul class="login_sns">
	                        <li><a href="javascript:loginKakao();" id="custom-login-btn" class="btn_sns kakao">카카오톡 회원가입</a></li>
	                        <li><a href="javascript:loginNaver();" id="naver_id_login" class="btn_sns naver">네이버 회원가입</a></li>
	                        <li><a href="javascript:loginFacebook();" id="facebook_login" class="btn_sns facebook">페이스북 회원가입</a></li>
	                    </ul>
	                    <!-- <div class="info_box">
	                        <strong class="tit">신원 오프라인 매장의 회원이세요?</strong>
	                        <ul class="ul_dash">
	                            <li>등급별 멤버십 혜택</li>
	                            <li>신원 통합회원 전환시 5,000 포인트 즉시 증정</li>
	                        </ul>
	                        <button type="button" class="btn_medium" id="joinConvertBtn">통합회원 전환</button>
	                    </div> -->
	                </div>
	            </div>
            </form>
        </div>
    </div>
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/jquery.validate.js"></script>      
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>   <!-- naver 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/kakao.min.js" charset="utf-8"></script>                   <!-- kakao 자바스크립트 SDK -->
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/snsSDK.js" charset="utf-8"></script> 
<script>
	$("#joinBtn").on("click",function(){
		location.href = "/pc/member/joinMemBasicStep2.do"
	});
</script>
<script>
	function fnSnsLogin(data){
		if(data){
			$("#MEM_SNS_TYPE").val(getSnsCode(data.sns));
			$("#MEM_SNS_ID").val(data.id);
			$("#MEM_SNS_NM").val(data.name);
			$("#MEM_SNS_EMAIL").val(data.email);
			$("#dataForm").attr({"action":"/pc/member/joinMemSnsStep2.do", "target":"_self", "method":"post"}).submit();
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
		location.href = "<c:out value="${frontDomain}"/>/pc/member/offlineMemStep1.do";
	})
</script>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
