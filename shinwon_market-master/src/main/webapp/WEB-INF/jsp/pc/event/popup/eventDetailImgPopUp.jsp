<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">
<!-- #wrap S -->
	
	<!-- #container S -->
	<article id="container" class="container event_detail_pop">
		<header>			<a href="javascript:self.close();" class="btn_close"><span class="blind">사진 상세보기 팝업 닫기</span></a>
			<h1>사진 상세보기</h1>
		</header>
		<div class="contents"><!-- .contents S -->


			<c:if test="${info.rk <= 5 }" ><i class="ico_best best_<c:out value="${info.rk }" />"><span class="blind">BEST4</span></i></c:if>
			<img src="<c:out value="${cdnDomain }${info.FILE_NM }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT }" />">
			<strong class="tx_dateNid"><ui:formatDate value="${info.EVT_IMG_REG_DT }" pattern="yyyy.MM.dd"/> / <c:out value="${info.HID_EVT_IMG_REG_ID }" /></strong>
			<hr class="bg_line_3px" />
			<span class="ti"><c:out value="${info.EVT_IMG_NM }" /></span>
			<p class="tx">
				<c:out value="${info.EVT_IMG_CTS }" escapeXml="false"/>
			</p>
			<a href="javascript:void(0)" class="btn_recom" data-evt_img_idx="<c:out value="${info.EVT_IMG_IDX }" />"><i class="ico_recom"></i><span><c:out value="${info.EVT_IMG_RCM_CNT }" /></span></a>


		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<script type="text/javascript">
		$(document).on("click", ".btn_recom", function(){
			
			if(confirm("추천하시겠습니까?")){
				
				var evt_img_idx	= $(this).data("evt_img_idx");
				
				$.ajax({
					type	: "POST",
					url		: "/pc/event/eventImageRecommAjax.do",
					dataType: "json",
					data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
								, "EVT_IMG_IDX" : evt_img_idx },
					success : function(data) {
						if(data.loginChk == 'N'){
							if(confirm(data.resultMsg)){
	    						var url = location.href;
	    						url = encodeURIComponent(url);
	    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	    					}
						}else{
							alert(data.resultMsg);
							if(data.succss){
								location.reload();
							}
						}
					}, error : function(err) {
						window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}
		});
	</script>

<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	com.pop_chk();
});

</script>