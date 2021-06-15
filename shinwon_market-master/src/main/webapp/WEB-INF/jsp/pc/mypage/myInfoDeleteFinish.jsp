<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">회원탈퇴 완료</h2>
			</div>
			<!--// Title -->

			<div class="cont_center mp">
				<div class="info_box txt_center">
					<p>‘<strong class="tit">쑈윈도 회원탈퇴</strong>가 완료되었습니다.’</p>
					<ul class="info_txt">
						<li>보다 나은 서비스로 다시 찾아 뵙겠습니다. 감사합니다.</li>
					</ul>
				</div>
				<div class="btn_wrap">
					<button onclick="goMain()" class="btn_large ok">쑈윈도 홈 바로가기</button>
				</div>
			</div>

			</div>
			<!-- //sub_content -->

</div>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	goMain = function(){
		location.href = "<c:out value="${frontDomain}" />/pc/manager/logout.do";
	}
})
</script>
