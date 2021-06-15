<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- #header S -->
	<header id="header" class="header">
		
		<div class="minW lnb"><!-- .lnb S -->
			<h1><a href="<c:out value="${frontDomain }"/>/pc/business/businessMain.do"><span class="ir">마켓플랜트 입점센터</span></a></h1>

			<div class="gnb"><!-- .gnb S -->
				<h2 class="blind">상단메뉴</h2>

				<c:choose>
					<c:when test="${empty sessionBusiness.VDR_LGN_BUSINESSID }">
						<ul class="ul_btn">
							<li class="btn"><a href="<c:out value="${serverSslDomain }"/>/pc/business/login.do">로그인</a></li>
							<li class="btn"><a href="<c:out value="${serverSslDomain }"/>/pc/business/joinVdrAgree.do">신규등록</a></li>
						</ul>
						<ul class="ul_mn">
							<li class="f"><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselForm.do"><span>입점 상담신청</span></a></li>
							<li class="l"><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselList.do"><span>입점 상담신청 조회</span></a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="ul_btn">
							<li class="tx_id">
								<span><c:out value="${sessionBusiness.VDR_LGN_NM }"/>님 반갑습니다.</span>
							</li>
							<li class="btn"><a href="<c:out value="${frontDomain }"/>/pc/business/logout.do">로그아웃</a></li>
							<li class="btn"><a href="<c:out value="${frontDomain }"/>/pc/business/businessInfoEditForm.do">정보수정</a></li>
						</ul>
						
						<ul class="ul_mn">
							<li class="f"><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselForm.do"><span>입점 상담신청</span></a></li>
							<li><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselList.do"><span>입점 상담신청 조회</span></a></li>
							<c:if test="${VDR_LGN_APPLICATION_AUTH eq 'Y' }">
								<c:choose>
									<c:when test="${VDR_LGN_REQUEST_STATE eq 'N' }">
										<li class="l"><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointApplication.do"><span>입점 신청서 작성</span></a></li>
									</c:when>
									<c:when test="${VDR_LGN_REQUEST_STATE eq 'M' }">
										<li class="l"><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointApplication.do"><span>입점 신청서 수정</span></a></li>
									</c:when>
									<c:when test="${VDR_LGN_REQUEST_STATE eq 'V' }">
										<li class="l"><a href="<c:out value="${frontDomain }"/>/pc/business/standingPointApplication.do"><span>입점 신청서 확인</span></a></li>
									</c:when>
								</c:choose>
							</c:if>
						</ul>
					</c:otherwise>
				</c:choose>
			</div><!--// .gnb E -->

		</div><!--// .lnb E -->
	</header>
	<!--// #header S -->
