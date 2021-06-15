<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-exhibit">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
			<section class="secret_d">
				<h2 class="blind">Secret Sale</h2>
				<p>					
					<strong class="blind">특별한 고객님께 드리는 <br/>프라이스킹 혜택을 경험해 보세요</strong>
					<span>받으신 입장권 번호를 입력해주세요</span>
				</p>
				<label for="inp_secret">
					<input type="text" name="inp_secret" id="inp_secret" />
					<a href="javascript:void(0)" class="btn_enter"><img src="<c:out value="${cdnDomain }" />/pc/img/lay/btn_secret.png" alt="ENTER" /></a>
				</label>
			</section>
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	$('#inp_secret').focus();
});

$(document).on("click", ".btn_enter", function(){
	
	if($("#inp_secret").val() == ""){
		alert("입장권 번호를 입력하세요.");
		return;
	}else{
		$.ajax({
			async : false,
			type : "POST",
			
			data : {
				"PLN_MST_IDX" : '<c:out value="${commandMap.PLN_MST_IDX}" />'
				,"PLN_MST_SECRET" : $("#inp_secret").val()
			},
			url : "<c:out value="${frontDomain}" />/pc/event/planSecretSaleCheck.do",
			success : function(data) {
				var result = data.result; //0:로그인 필요 1:성공 -1:실패
				if(result == 0){
					if(confirm(data.resultMsg)){
						var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
					}
				}else if(result == 1){
					location.href = data.url;
				}else{
					alert(data.resultMsg);
				}
			},error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}
	
	
});
</script>