<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- #header S -->
<header id="header" class="header" data-role="header">
	<div class="btn_l">
		<a href="#left_mn" id="btn_mn_open" class="btn_mn_open"  data-theme="d" data-iconpos="notext" data-shadow="false" data-iconshadow="false">
			<i></i><span class="blind">메뉴</span>
		</a>
	</div>
	
	<h1 class="logo"><a href="<c:out value="${mobileDomain }"/>/mobile/main/index.do"><span class="ir">마켓플랜트</span></a></h1>
	
	<div class="btn_r">
		<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/search/search.do','_self');" class="btn_sh"><span class="blind">검색</span></a>
		<a href="javascript:callJavascriptNextPage('<c:out value="${mobileSslDomain}"/>/mobile/cart/cartlist.do','_self');" class="btn_cart"><i id="topCartCnt">${cartCnt }</i><span class="blind">장바구니</span></a>
	</div>
	
</header>
<!--// #header E -->