<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>사진상세</h2>
            <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .event_photo_vw S -->
		<section class="event_photo_vw">
			
			<dl class="vw_con">
				<dt>
					<!--  i class="ico_best5"><span class="blind">best5</span></i>-->
					<img src="<c:out value="${cdnDomain }${info.FILE_NM }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT }" />" />
				</dt>
				<dd class="dd_tx">
					<span class="tx_dateNid"><ui:formatDate value="${info.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
					<strong class="tx_ti"><c:out value="${info.EVT_IMG_NM }" /></strong>
					<p class="tx_con">
						<c:out value="${info.EVT_IMG_CTS }" escapeXml="false" />
					</p>										
				</dd>
				<dd class="dd_btn">
					<a href="javascript:goRecomm('<c:out value="${info.EVT_IMG_IDX }" />');" class="btn_gre">
						<i class="ico_good"><span class="blind">추천</span></i>
						<strong><c:out value="${info.EVT_IMG_RCM_CNT }" /></strong>
					</a>
				</dd>
			</dl>
		</section>
		<!--// .event_photo_vw E -->
		<script type="text/javascript">
			goRecomm 		= function(evt_img_idx){ 		
				if(confirm("추천하시겠습니까?")){
					
					//var evt_img_idx	= $(this).data("evt_img_idx");
					
					$.ajax({
						type	: "POST",
						url		: "/mobile/event/eventImageRecommAjax.do",
						dataType: "json",
						data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
									, "EVT_IMG_IDX" : evt_img_idx },
						success : function(data) {
							alert(data.resultMsg);
							if(data.succss){
								location.reload();
							}
						}, error : function(err) {
							window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
						}
					});
				}
			}
		</script>
			
	</article>
	<!--// #container E -->

</section>
<!--// #wrap E -->
</body>
</html>