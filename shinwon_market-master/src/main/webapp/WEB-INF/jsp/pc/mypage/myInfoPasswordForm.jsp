<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">회원정보수정</h2>
			</div>
			<!--// Title -->
	

			<div class="sub_content">
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
			</div>
			
			<%@ include file="/WEB-INF/jsp/pc/mypage/include/certUserPhone.jsp"%>
				
		</div>
		<!-- //sub_content -->

	</div>		

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>


<script type="text/javascript">
	function certCallback (data){
		var formId = guid();
		$("body").append('<form id="'+formId+'"></form>');
		var $frm = $('#'+formId);			
		for(item in data) {
		    $frm.append('<input type="hidden" name="'+item+'" value="'+data[item]+'"/>');
		}
		$frm.attr({"action":"<c:out value="${serverSslDomain}${commandMap.returnUrl}" />", "target":"_self", "method":"post"}).submit();
	}
	
</script>