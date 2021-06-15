<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-kinger">
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->


			<!-- .king_sub S -->
			<section class="king_sub king_dang">
				<!-- .king_hd S -->
				<div class="king_hd">
					<h2 class="logo_kinger"><a href="<c:out value="${frontDomain }" />/pc/marketing/kingerMain.do"><img src="<c:out value="${cdnDomain }" />/pc/img/kinger/logo_kinger.png" alt="KINGER 마켓플랜트 프리미엄 1% 고객 체험단. 킹저" /></a></h2>
				</div>
				<!--// .king_hd E -->
				
				<!-- .king_con S -->
				<div class="king_con">
					<h2 class="con_ti"><strong>당첨자 발표</strong></h2/>
					
					<dl class="dang_list">
						<dt>
							<a href="<c:out value="${frontDomain }" />/pc/marketing/kingerWinList.do?cPage=<c:out value="${commandMap.cPage }" />" class="btn_list"><span class="ir">목록으로 가기</span></a>
							<h3><c:out value="${info.EXP_WIN_NM }" escapeXml="false"/></h3>
						</dt>
						<dd class="msg">
							<span><ui:replaceLineBreak content="${info.EXP_WIN_MAN_CPY }"  /></span>
						</dd>
						<dd class="list">
							<table>
								<caption></caption>
								<colgroup>
								<col style="width:33.333%" />
								<col style="width:33.333%" />
								<col style="width:33.333%" />
								</colgroup>
								<tbody>
									<c:forEach items="${list }" var="win" varStatus="sta">
										<c:if test="${sta.first || sta.count mod 3 == 1 }">
											<tr>
										</c:if>	
										<td><c:out value="${win.HID_MEM_MST_MEM_ID }"/>(<c:out value="${win.HID_MEM_MST_MEM_NM }" />)</td>
										<c:if test="${sta.last || sta.count mod 3 == 0 }">
											</tr>
										</c:if>	
									</c:forEach>
								</tbody>
							</table>
						</dd>
						<dd class="sh_d">
							<div class="sh">
								<span class="tx_ex">* 아이디를  검색하여 당첨을 확인하세요.</span>
								<label for="inp_shId">
									<input type="text" name="inp_shId" id="inp_shId" />
								</label>
								<a href="javascript:void(0)" class="btn_sh"><span>검색</span></a>
							</div>
							<p class="tx_sub"><ui:replaceLineBreak content="${info.EXP_WIN_SUB_CPY }"  /></p>
							<p class="tx_prec">
								<ui:replaceLineBreak content="${info.EXP_WIN_ATN}" />
							</p>
						</dd>
						<dd class="btn_box">
							<a href="javascript:void(0)" class="btn_bl_k"><strong>KINGER 미션 보기</strong></a>
						</dd>
					</dl>

				</div>
				<!-- .king_con E -->

			</section>
			<!--// .king_sub E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
		$(document).on("click", ".btn_sh", function(){
			if($("#inp_shId").val() == ""){
				alert("아이디를  입력하세요");
				$("#inp_shId").focus();
				return;
			}else{
				goSearch();
			}
		});
		
		goSearch		= function(){
			var	searchKey		= $("#inp_shId").val();
			$.ajax({
				async : false,
				type : "POST",
				data : {
					"EXP_MST_CD" : "<c:out value="${info.EXP_MST_CD}"/>"
					, "SEARCHKEY": searchKey
				},
				url  : "<c:out value="${frontDomain}" />/pc/marketing/kingerWinerSearchAjax.do",
				success : function(data) {
					alert(data.strResultMsg);
				},
				error : function(err) {
					//alert("오류가 발생하였습니다.\n[" + err.status + "]");
					window.jquery
							|| console
									.log('오류가 발생하였습니다: ' + err.status);
				}
			});
		};
		
		$(document).on("click", ".btn_bl_k", function(){
			location.href="/pc/marketing/kingerMissionInfo.do?EXP_MST_CD=<c:out value="${info.EXP_MST_CD}" />";	
		});
		
	</script>
</section>
<!--// #wrap E -->
</body>
</html>