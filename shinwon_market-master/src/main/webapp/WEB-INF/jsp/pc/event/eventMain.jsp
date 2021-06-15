<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->

			<!-- .section S -->
			<section class="event_zone">

				<%@ include file="/WEB-INF/jsp/pc/event/eventMenuInclude.jsp" %>
				
				<!-- .ev_con S -->
				<div class="ev_con ev_cons"> <!-- 이벤트: ev_cons / 회원혜택: ev_member / 쿠폰혜택: ev_coupon / 카드혜택: ev_card -->
					<ul class="ev_main">
						<li class="li_1">
							<div class="slider">
								<c:if test="${not empty top }">
									<c:forEach var="row" items="${top }" varStatus="topSta">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'S' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />  width="679" height="380" /></a>							
											</c:when>
											<c:when test="${row.BNR_MST_TGT eq 'N' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"   width="679" height="380"/></a>							
											</c:when>
											<c:otherwise>
										<img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"   width="679" height="380" />							
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
							</div>
							<a href="<c:out value="${frontDomain }" />/pc/customer/eventWinList.do" class="banner_l"><img src="<c:out value="${cdnDomain}" />/pc/img/event/img_event_02.jpg" alt="당첨자 발표 응모한 이벤트 당첨자 확인하세요" /></a>
						</li>
						<li class="li_2">
							<dl class="f">
								<dt><strong>이달의 카드 혜택</strong></dt>
								<dd>
								<c:if test="${not empty month }">
									<c:forEach var="row" items="${month }" >
									<c:choose>
										<c:when test="${row.BNR_MST_TGT eq 'S' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:when test="${row.BNR_MST_TGT eq 'N' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:otherwise>
											<img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"    />							
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</c:if>									
								</dd>
							</dl>
							<dl class="l">
								<dt><strong>신규 가입 혜택</strong></dt>
								<dd>
									<c:if test="${not empty mileage }">
									<c:forEach var="row" items="${mileage }" >
									<c:choose>
										<c:when test="${row.BNR_MST_TGT eq 'S' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" class="banner_f"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:when test="${row.BNR_MST_TGT eq 'N' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank" class="banner_f"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0)" class="banner_f"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"/></a>							
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</c:if>		
								<%--		
								<c:if test="${not empty benefit1 }">
									<c:forEach var="row" items="${benefit1 }" >
									<c:choose>
										<c:when test="${row.BNR_MST_TGT eq 'S' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" class="banner_c"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:when test="${row.BNR_MST_TGT eq 'N' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank" class="banner_c"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0)" class="banner_c"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"    /></a>							
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</c:if>				
								<c:if test="${not empty benefit2 }">
									<c:forEach var="row" items="${benefit2 }" >
									<c:choose>
										<c:when test="${row.BNR_MST_TGT eq 'S' }">
											<a href="<c:out value="${row.BNR_MST_URL }"  />" class="banner_l"  ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:when test="${row.BNR_MST_TGT eq 'N' }">
											<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank" class="banner_l"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0)" class="banner_l"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"    /></a>							
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</c:if>				
								--%>
								</dd>
							</dl>
						</li>
						<%--
						<c:if test="${lateSize eq 2 }">
						<li class="li_3">
							<dl>
								<dt><strong>이벤트 참여하고 다양한 혜택을 받아보세요</strong></dt>
								<c:if test="${not empty late }">
								<c:set var="eveClsNm" value="" />
								<c:forEach var="row" items="${late }" varStatus="sta">
								<c:if test="${sta.last }">
									<c:set var="eveClsNm" value="l" />
								</c:if>
								<c:if test="${sta.first}">
									<c:set var="eveClsNm" value="f" />
								</c:if>
								<dd class="<c:out value="${eveClsNm }" />">
								<c:choose>
									<c:when test="${row.BNR_MST_TGT eq 'S' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
									</c:when>
									<c:when test="${row.BNR_MST_TGT eq 'N' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0)" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"    /></a>							
									</c:otherwise>
								</c:choose>
									<strong><c:out value="${row.BNR_MST_TITLE }"/></strong>
								</dd>
								</c:forEach>
								</c:if>
							</dl>
						</li>
						</c:if>
						 --%>
						<li class="li_4">
							<dl>
								<dt class="blind"><strong>이벤트 배너</strong></dt>
								<dd>
									<c:if test="${not empty left }">
									<c:forEach var="row" items="${left }" varStatus="topSta">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'S' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" class="f" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"  /></a>							
											</c:when>
											<c:when test="${row.BNR_MST_TGT eq 'N' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank" class="f" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"   /></a>							
											</c:when>
											<c:otherwise>
										<span class="f"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"  /></span>							
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</c:if>
									<c:if test="${not empty mid }" >
									<c:forEach var="row" items="${mid }" varStatus="topSta">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'S' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"  /></a>							
											</c:when>
											<c:when test="${row.BNR_MST_TGT eq 'N' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
											</c:when>
											<c:otherwise>
										<span><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"  /></span>							
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</c:if>
									<c:if test="${not empty right }" >
									<c:forEach var="row" items="${right }" varStatus="topSta">
										<c:choose>
											<c:when test="${row.BNR_MST_TGT eq 'S' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />"  class="l" ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
											</c:when>
											<c:when test="${row.BNR_MST_TGT eq 'N' }">
										<a href="<c:out value="${row.BNR_MST_URL }" />" class="l"  target="_blank"><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></a>							
											</c:when>
											<c:otherwise>
										<span class="l"  ><img src="<c:out value="${cdnDomain }${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />" /></span> 							
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</c:if>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
				<!--// .ev_con E -->
			</section>
			<!--// .section E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
		$(document).ready(function(){ 
			$('.ev_main .li_1 .slider').bxSlider({ 
				mode: 'fade'    	//사라지는 모냥 
				,speen:3000    		// 이미지변환 속도 기본 500 
				,pager: true    	//하단 페이지 
				,auto: true    		//자동시작 
				,captions: true  	//캡션 
	  			,controls:false		//전 후 콘트롤 보이기 안보이기
	  			//,slideWidth : 679	//
			}); 
		});
		
	</script>
</section>
<!--// #wrap E -->
</body>
</html>