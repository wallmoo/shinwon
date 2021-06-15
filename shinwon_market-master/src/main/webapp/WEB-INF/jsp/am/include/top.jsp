<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="top" class="container" style="background: #414547 url('/am/img/bg_head.png') no-repeat center top;"><!-- top -->
		<div class="wrap">
			<div class="menu"><!-- menu -->
				<div id="togglerAside" class="toggler left">
					<a href="#!" class="js-toggle-nav" data-class="is-aside-in" data-lg-class="is-aside-out">
						<i class="fonti um-fog on"><em>메뉴 펼치기</em></i>
						<i class="fonti um-fog off"><em>메뉴 접기</em></i>
					</a>
				</div>
			</div><!-- // menu -->
			<h1 class="logo">
			   <!-- <a href="<c:out value="${serverDomain}" />"><img src="<c:out value="${cdnDomain}" /><c:out value="${logoUrl}" />" alt="HOME" /></a> --> 
			</h1>
			<div class="util"><!-- util -->
				<div class="col">
					<a href="javascript:;"><i class="fonti um-gears"><em>환경설정</em></i></a>
				</div>
				<div class="col">
					<a href="<c:out value="${serverDomain}" />/am/manager/logout.do"><i class="fonti um-sign-out"><em>로그아웃</em></i></a>
				</div>
				<div class="col">
					<div id="togglerQuick" class="toggler left">
						<a href="#!" class="js-toggle-nav" data-class="is-quick-in" data-lg-class="is-quick-out">
							<i class="fonti um-ellipsis-h on"><em>사용자 메뉴 펼치기</em></i>
							<i class="fonti um-ellipsis-v off"><em>사용자 메뉴 접기</em></i>
						</a>
					</div>
				</div>
			</div><!-- // util -->
		</div>
	</div><!-- // top -->

	<div id="gnb" class="container">
		<div class="wrap core"></div><!-- // gnb -->
		<div class="spacer"></div>
	</div>