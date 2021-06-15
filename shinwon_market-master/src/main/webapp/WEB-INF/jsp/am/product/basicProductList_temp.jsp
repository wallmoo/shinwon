<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta property="og:title" content="DINGDONG">
	<meta property="og:url" content="">
	<meta property="og:image" content="">
	<meta property="og:description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="content-language" content="kr">
	<meta http-equiv="imagetoolbar" content="no">
	<meta name="title" content="MarketPlant">
	<meta name="description" content="MarketPlant">
	<meta name="copyright" content="MarketPlant">
	<title>MarketPlant</title>
	<link rel="stylesheet" href="/am/css/normalize-3.0.2.css">
	<link rel="stylesheet" href="/am/css/fontium.css">
	<link rel="stylesheet" href="/am/css/style.css">
	<link rel="stylesheet" href="/am/css/neo.css">
	<script>document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/,'js');</script>
	<script src="/am/js/vendor/modernizr.custom.2.8.3.min.js"></script>
	<!--[if (gte IE 6)&(lte IE 8)]><script src="/am/js/vendor/jquery-1.11.2.min.js"></script><![endif]-->
	<!--[if (gt IE 8)|!(IE)]><!--> <script src="/am/js/vendor/jquery-2.1.3.min.js"></script><!--<![endif]-->
</head>
<body>
	<!-- S : loader-wrapper -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- E : loader-wrapper -->
	<div id="header">
		<div id="top" class="container" style="background:#414547 url('/am/img/bg_head.png') no-repeat center top;">
			<div class="wrap">
				<div class="menu">
					<div id="togglerAside" class="toggler left">
						<a href="#!" class="js-toggle-nav" data-class="is-aside-in" data-lg-class="is-aside-out">
							<i class="fonti um-fog on"><em>메뉴 펼치기</em></i>
							<i class="fonti um-fog off"><em>메뉴 접기</em></i>
						</a>
					</div>
				</div>
				<h1 class="logo">
				</h1>
				<div class="util">
					<div class="col">
						<a href="javascript:;"><i class="fonti um-gears"><em>환경설정</em></i></a>
					</div>
					<div class="col">
						<a href="http://bo.marketplanta.epasscni.com/am/manager/logout.do"><i class="fonti um-sign-out"><em>로그아웃</em></i></a>
					</div>
					<div class="col">
						<div id="togglerQuick" class="toggler left">
							<a href="#!" class="js-toggle-nav" data-class="is-quick-in" data-lg-class="is-quick-out">
								<i class="fonti um-ellipsis-h on"><em>사용자 메뉴 펼치기</em></i>
								<i class="fonti um-ellipsis-v off"><em>사용자 메뉴 접기</em></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="gnb" class="container">
			<div class="wrap core">
				<ul class="nav" menu="menu">
					<li menu="menu-0" class="d1 menu-0" data-submenu-id="gnbmenu-0"><a href="http://bo.marketplanta.epasscni.com/am/main/dashboardMain.do" menu="menu-0" class="d1 menu-0"><span>대시보드</span></a></li>
					<li menu="menu-1" class="d1 menu-1" data-submenu-id="gnbmenu-1">
						<a href="http://bo.marketplanta.epasscni.com/am/member/infoMemberList.do" menu="menu-1" class="d1 menu-1"><span>회원관리</span></a>
						<div menu="menu-1" class="d2 menu-1" id="gnbmenu-1">
							<ul menu="menu-1" class="d2 menu-1">
								<li menu="menu-1-0" class="d2 menu-1-0" data-submenu-id="gnbmenu-1-0"><a href="http://bo.marketplanta.epasscni.com/am/member/infoMemberList.do" menu="menu-1-0" class="d2 menu-1-0"><span>회원관리</span></a></li>
								<li menu="menu-1-1" class="d2 menu-1-1" data-submenu-id="gnbmenu-1-1"><a href="http://bo.marketplanta.epasscni.com/am/member/restMemberList.do" menu="menu-1-1" class="d2 menu-1-1"><span>휴면회원관리</span></a></li>
								<li menu="menu-1-2" class="d2 menu-1-2" data-submenu-id="gnbmenu-1-2"><a href="http://bo.marketplanta.epasscni.com/am/member/secessionMemberList.do" menu="menu-1-2" class="d2 menu-1-2"><span>탈퇴회원관리</span></a></li>
								<li menu="menu-1-3" class="d2 menu-1-3" data-submenu-id="gnbmenu-1-3"><a href="http://bo.marketplanta.epasscni.com/am/member/lmsHistoryList.do" menu="menu-1-3" class="d2 menu-1-3"><span>LMS이력</span></a></li>
								<li menu="menu-1-4" class="d2 menu-1-4" data-submenu-id="gnbmenu-1-4"><a href="http://bo.marketplanta.epasscni.com/am/member/ootdList.do" menu="menu-1-4" class="d2 menu-1-4"><span>OOTD 관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-2" class="d1 menu-2 active" data-submenu-id="gnbmenu-2">
						<a href="http://bo.marketplanta.epasscni.com/am/product/categoryProductList.do" menu="menu-2" class="d1 menu-2"><span>상품관리</span></a>
						<div menu="menu-2" class="d2 menu-2" id="gnbmenu-2">
							<ul menu="menu-2" class="d2 menu-2">
								<li menu="menu-2-0" class="d2 menu-2-0" data-submenu-id="gnbmenu-2-0"><a href="http://bo.marketplanta.epasscni.com/am/product/categoryProductList.do" menu="menu-2-0" class="d2 menu-2-0"><span>전시카테고리관리</span></a></li>
								<li menu="menu-2-1" class="d2 menu-2-1 active" data-submenu-id="gnbmenu-2-1"><a href="http://bo.marketplanta.epasscni.com/am/product/basicProductList.do" menu="menu-2-1" class="d2 menu-2-1"><span>상품관리</span></a></li>
								<li menu="menu-2-2" class="d2 menu-2-2" data-submenu-id="gnbmenu-2-2"><a href="http://bo.marketplanta.epasscni.com/am/product/productNotificationInfoList.do" menu="menu-2-2" class="d2 menu-2-2"><span>상품고시관리</span></a></li>
								<li menu="menu-2-3" class="d2 menu-2-3" data-submenu-id="gnbmenu-2-3"><a href="http://bo.marketplanta.epasscni.com/am/product/vendorApprovalList.do" menu="menu-2-3" class="d2 menu-2-3"><span>입점업체 승인요청</span></a></li>
								<li menu="menu-2-4" class="d2 menu-2-4" data-submenu-id="gnbmenu-2-4"><a href="http://bo.marketplanta.epasscni.com/am/product/vendorProductChangeList.do" menu="menu-2-4" class="d2 menu-2-4"><span>입점업체 상품변경요청</span></a></li>
								<li menu="menu-2-5" class="d2 menu-2-5" data-submenu-id="gnbmenu-2-5"><a href="http://bo.marketplanta.epasscni.com/am/product/productUploadList.do" menu="menu-2-5" class="d2 menu-2-5"><span>일괄업로드</span></a></li>
								<li menu="menu-2-6" class="d2 menu-2-6" data-submenu-id="gnbmenu-2-6"><a href="http://bo.marketplanta.epasscni.com/am/product/giftList.do" menu="menu-2-6" class="d2 menu-2-6"><span>사은품관리</span></a></li>
								<li menu="menu-2-7" class="d2 menu-2-7" data-submenu-id="gnbmenu-2-7"><a href="http://bo.marketplanta.epasscni.com/am/product/estimateManagementList.do" menu="menu-2-7" class="d2 menu-2-7"><span>견적관리</span></a></li>
								<li menu="menu-2-8" class="d2 menu-2-8" data-submenu-id="gnbmenu-2-8"><a href="http://bo.marketplanta.epasscni.com/am/product/specManagementList.do" menu="menu-2-8" class="d2 menu-2-8"><span>스펙관리</span></a></li>
								<li menu="menu-2-9" class="d2 menu-2-9" data-submenu-id="gnbmenu-2-9"><a href="http://bo.marketplanta.epasscni.com/am/product/vendorProductList.do" menu="menu-2-9" class="d2 menu-2-9"><span>입점업체상품</span></a></li>
								<li menu="menu-2-10" class="d2 menu-2-10" data-submenu-id="gnbmenu-2-10"><a href="http://bo.marketplanta.epasscni.com/am/product/empDiscountList.do" menu="menu-2-10" class="d2 menu-2-10"><span>임직원 할인관리</span></a></li>
								<li menu="menu-2-11" class="d2 menu-2-11" data-submenu-id="gnbmenu-2-11"><a href="http://bo.marketplanta.epasscni.com/am/product/partnerDiscountList.do" menu="menu-2-11" class="d2 menu-2-11"><span>제휴사 할인관리</span></a></li>
								<li menu="menu-2-12" class="d2 menu-2-12" data-submenu-id="gnbmenu-2-12"><a href="http://bo.marketplanta.epasscni.com/am/product/brandPointList.do" menu="menu-2-12" class="d2 menu-2-12"><span>통합포인트 적립률관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-3" class="d1 menu-3" data-submenu-id="gnbmenu-3">
						<a href="http://bo.marketplanta.epasscni.com/am/order/orderList.do" menu="menu-3" class="d1 menu-3"><span>주문관리</span></a>
						<div menu="menu-3" class="d2 menu-3" id="gnbmenu-3">
							<ul menu="menu-3" class="d2 menu-3">
								<li menu="menu-3-0" class="d2 menu-3-0" data-submenu-id="gnbmenu-3-0"><a href="http://bo.marketplanta.epasscni.com/am/order/orderList.do?searchYn=Y" menu="menu-3-0" class="d2 menu-3-0"><span>전체주문</span></a></li>
								<li menu="menu-3-1" class="d2 menu-3-1" data-submenu-id="gnbmenu-3-1"><a href="http://bo.marketplanta.epasscni.com/am/order/orderPayReadyList.do?searchYn=Y" menu="menu-3-1" class="d2 menu-3-1"><span>입금대기</span></a></li>
								<li menu="menu-3-2" class="d2 menu-3-2" data-submenu-id="gnbmenu-3-2"><a href="http://bo.marketplanta.epasscni.com/am/order/orderPayList.do?searchYn=Y" menu="menu-3-2" class="d2 menu-3-2"><span>결제완료</span></a></li>
								<li menu="menu-3-3" class="d2 menu-3-3" data-submenu-id="gnbmenu-3-3"><a href="http://bo.marketplanta.epasscni.com/am/order/orderSendList.do?searchYn=Y" menu="menu-3-3" class="d2 menu-3-3"><span>배송관리</span></a></li>
								<li menu="menu-3-4" class="d2 menu-3-4" data-submenu-id="gnbmenu-3-4"><a href="http://bo.marketplanta.epasscni.com/am/order/orderFixList.do?searchYn=Y" menu="menu-3-4" class="d2 menu-3-4"><span>구매확정</span></a></li>
								<li menu="menu-3-5" class="d2 menu-3-5" data-submenu-id="gnbmenu-3-5"><a href="http://bo.marketplanta.epasscni.com/am/order/orderCancelList.do?searchYn=Y" menu="menu-3-5" class="d2 menu-3-5"><span>취소관리</span></a></li>
								<li menu="menu-3-6" class="d2 menu-3-6" data-submenu-id="gnbmenu-3-6"><a href="http://bo.marketplanta.epasscni.com/am/order/orderSwapList.do?searchYn=Y" menu="menu-3-6" class="d2 menu-3-6"><span>교환관리</span></a></li>
								<li menu="menu-3-7" class="d2 menu-3-7" data-submenu-id="gnbmenu-3-7"><a href="http://bo.marketplanta.epasscni.com/am/order/orderBackList.do?searchYn=Y" menu="menu-3-7" class="d2 menu-3-7"><span>반품관리</span></a></li>
								<li menu="menu-3-8" class="d2 menu-3-8" data-submenu-id="gnbmenu-3-8"><a href="http://bo.marketplanta.epasscni.com/am/order/orderRefundList.do?searchYn=Y" menu="menu-3-8" class="d2 menu-3-8"><span>환불관리</span></a></li>
								<li menu="menu-3-9" class="d2 menu-3-9" data-submenu-id="gnbmenu-3-9"><a href="http://bo.marketplanta.epasscni.com/am/order/taxIvc/taxIvcList.do" menu="menu-3-9" class="d2 menu-3-9"><span>세금계산서 신청관리</span></a></li>
								<li menu="menu-3-10" class="d2 menu-3-10" data-submenu-id="gnbmenu-3-10"><a href="http://bo.marketplanta.epasscni.com/am/order/orderScmCancelList.do?searchYn=Y" menu="menu-3-10" class="d2 menu-3-10"><span>입점업체취소요청</span></a></li>
								<li menu="menu-3-11" class="d2 menu-3-11" data-submenu-id="gnbmenu-3-11"><a href="http://bo.marketplanta.epasscni.com/am/order/orderOpenMarketList.do?searchYn=Y" menu="menu-3-11" class="d2 menu-3-11"><span>오픈마켓 주문조회</span></a></li>
								<li menu="menu-3-12" class="d2 menu-3-12" data-submenu-id="gnbmenu-3-12"><a href="http://bo.marketplanta.epasscni.com/am/order/orderScmOrderList.do?searchYn=Y" menu="menu-3-12" class="d2 menu-3-12"><span>입점업체 주문조회(통합)</span></a></li>
								<li menu="menu-3-13" class="d2 menu-3-13" data-submenu-id="gnbmenu-3-13"><a href="http://bo.marketplanta.epasscni.com/am/order/orderError/orderErrorList.do" menu="menu-3-13" class="d2 menu-3-13"><span>결제오류조회</span></a></li>
								<li menu="menu-3-14" class="d2 menu-3-14" data-submenu-id="gnbmenu-3-14"><a href="http://bo.marketplanta.epasscni.com/am/order/orderDeliveryList.do" menu="menu-3-14" class="d2 menu-3-14"><span>출고관리</span></a></li>
								<li menu="menu-3-15" class="d2 menu-3-15" data-submenu-id="gnbmenu-3-15"><a href="http://bo.marketplanta.epasscni.com/am/order/orderCleanKingList.do" menu="menu-3-15" class="d2 menu-3-15"><span>O2O 주문조회</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-4" class="d1 menu-4" data-submenu-id="gnbmenu-4">
						<a href="http://bo.marketplanta.epasscni.com/am/display/bannerDisplayView.do" menu="menu-4" class="d1 menu-4"><span>전시관리</span></a>
						<div menu="menu-4" class="d2 menu-4" id="gnbmenu-4">
							<ul menu="menu-4" class="d2 menu-4">
								<li menu="menu-4-0" class="d2 menu-4-0" data-submenu-id="gnbmenu-4-0"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerDisplayView.do" menu="menu-4-0" class="d2 menu-4-0"><span>전시배너관리</span></a></li>
								<li menu="menu-4-1" class="d2 menu-4-1" data-submenu-id="gnbmenu-4-1"><a href="http://bo.marketplanta.epasscni.com/am/display/productDisplayView.do" menu="menu-4-1" class="d2 menu-4-1"><span>전시상품관리</span></a></li>
								<li menu="menu-4-2" class="d2 menu-4-2" data-submenu-id="gnbmenu-4-2"><a href="http://bo.marketplanta.epasscni.com/am/display/popupList.do" menu="menu-4-2" class="d2 menu-4-2"><span>팝업관리</span></a></li>
								<li menu="menu-4-3" class="d2 menu-4-3" data-submenu-id="gnbmenu-4-3"><a href="http://bo.marketplanta.epasscni.com/am/display/vendorDisplayView.do" menu="menu-4-3" class="d2 menu-4-3"><span>공통전시</span></a></li>
								<li menu="menu-4-4" class="d2 menu-4-4" data-submenu-id="gnbmenu-4-4"><a href="http://bo.marketplanta.epasscni.com/am/display/themeBannerView.do" menu="menu-4-4" class="d2 menu-4-4"><span>테마전시배너관리</span></a></li>
								<li menu="menu-4-5" class="d2 menu-4-5" data-submenu-id="gnbmenu-4-5"><a href="http://bo.marketplanta.epasscni.com/am/display/themeProductView.do" menu="menu-4-5" class="d2 menu-4-5"><span>테마전시상품관리</span></a></li>
								<li menu="menu-4-6" class="d2 menu-4-6" data-submenu-id="gnbmenu-4-6"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerProductBrandNoticeList.do" menu="menu-4-6" class="d2 menu-4-6"><span>브랜드공지관리</span></a></li>
								<li menu="menu-4-7" class="d2 menu-4-7" data-submenu-id="gnbmenu-4-7"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerProductMdNoticeList.do" menu="menu-4-7" class="d2 menu-4-7"><span>MD공지관리</span></a></li>
								<li menu="menu-4-8" class="d2 menu-4-8" data-submenu-id="gnbmenu-4-8"><a href="http://bo.marketplanta.epasscni.com/am/display/adList.do" menu="menu-4-8" class="d2 menu-4-8"><span>광고관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-5" class="d1 menu-5" data-submenu-id="gnbmenu-5">
						<a href="http://bo.marketplanta.epasscni.com/am/marketing/planList.do" menu="menu-5" class="d1 menu-5"><span>프로모션관리</span></a>
						<div menu="menu-5" class="d2 menu-5" id="gnbmenu-5">
							<ul menu="menu-5" class="d2 menu-5">
								<li menu="menu-5-0" class="d2 menu-5-0" data-submenu-id="gnbmenu-5-0"><a href="http://bo.marketplanta.epasscni.com/am/marketing/planList.do" menu="menu-5-0" class="d2 menu-5-0"><span>기획전관리</span></a></li>
								<li menu="menu-5-1" class="d2 menu-5-1" data-submenu-id="gnbmenu-5-1"><a href="http://bo.marketplanta.epasscni.com/am/marketing/eventList.do" menu="menu-5-1" class="d2 menu-5-1"><span>이벤트관리</span></a></li>
								<li menu="menu-5-2" class="d2 menu-5-2" data-submenu-id="gnbmenu-5-2"><a href="http://bo.marketplanta.epasscni.com/am/marketing/kingerList.do" menu="menu-5-2" class="d2 menu-5-2"><span>고객체험단</span></a></li>
								<li menu="menu-5-3" class="d2 menu-5-3" data-submenu-id="gnbmenu-5-3"><a href="http://bo.marketplanta.epasscni.com/am/marketing/oneDayList.do" menu="menu-5-3" class="d2 menu-5-3"><span>원데이특가</span></a></li>
								<li menu="menu-5-4" class="d2 menu-5-4" data-submenu-id="gnbmenu-5-4"><a href="http://bo.marketplanta.epasscni.com/am/marketing/timeSaleList.do" menu="menu-5-4" class="d2 menu-5-4"><span>게릴라 세일</span></a></li>
								<li menu="menu-5-5" class="d2 menu-5-5" data-submenu-id="gnbmenu-5-5">
									<a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponList.do" menu="menu-5-5" class="d2 menu-5-5"><span>쿠폰</span></a>
									<div menu="menu-5-5" class="d3 menu-5-5" id="gnbmenu-5-5">
										<ul menu="menu-5-5" class="d3 menu-5-5">
											<li menu="menu-5-5-0" class="d3 menu-5-5-0" data-submenu-id="gnbmenu-5-5-0"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponList.do" menu="menu-5-5-0" class="d3 menu-5-5-0"><span>쿠폰목록</span></a></li>
											<li menu="menu-5-5-1" class="d3 menu-5-5-1" data-submenu-id="gnbmenu-5-5-1"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponForm.do" menu="menu-5-5-1" class="d3 menu-5-5-1"><span>쿠폰생성</span></a></li>
											<li menu="menu-5-5-2" class="d3 menu-5-5-2" data-submenu-id="gnbmenu-5-5-2"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponIssueList.do" menu="menu-5-5-2" class="d3 menu-5-5-2"><span>쿠폰발행내역</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-5-6" class="d2 menu-5-6" data-submenu-id="gnbmenu-5-6">
									<a href="http://bo.marketplanta.epasscni.com/am/marketing/pointDetail.do" menu="menu-5-6" class="d2 menu-5-6"><span>포인트</span></a>
									<div menu="menu-5-6" class="d3 menu-5-6" id="gnbmenu-5-6">
										<ul menu="menu-5-6" class="d3 menu-5-6">
											<li menu="menu-5-6-0" class="d3 menu-5-6-0" data-submenu-id="gnbmenu-5-6-0"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointDetail.do" menu="menu-5-6-0" class="d3 menu-5-6-0"><span>포인트 내역조회</span></a></li>
											<li menu="menu-5-6-1" class="d3 menu-5-6-1" data-submenu-id="gnbmenu-5-6-1"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointList.do" menu="menu-5-6-1" class="d3 menu-5-6-1"><span>포인트 목록</span></a></li>
											<li menu="menu-5-6-2" class="d3 menu-5-6-2" data-submenu-id="gnbmenu-5-6-2"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointForm.do" menu="menu-5-6-2" class="d3 menu-5-6-2"><span>포인트 적립/차감</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-5-7" class="d2 menu-5-7" data-submenu-id="gnbmenu-5-7"><a href="http://bo.marketplanta.epasscni.com/am/marketing/cardEventList.do" menu="menu-5-7" class="d2 menu-5-7"><span>카드행사관리</span></a></li>
								<li menu="menu-5-8" class="d2 menu-5-8" data-submenu-id="gnbmenu-5-8"><a href="http://bo.marketplanta.epasscni.com/am/marketing/cardDivList.do" menu="menu-5-8" class="d2 menu-5-8"><span>카드할부관리</span></a></li>
								<li menu="menu-5-9" class="d2 menu-5-9" data-submenu-id="gnbmenu-5-9"><a href="http://bo.marketplanta.epasscni.com/am/marketing/channelOnList.do" menu="menu-5-9" class="d2 menu-5-9"><span>채널ON</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-6" class="d1 menu-6" data-submenu-id="gnbmenu-6">
						<a href="http://bo.marketplanta.epasscni.com/am/createboard/createBoardList.do" menu="menu-6" class="d1 menu-6"><span>게시판 관리</span></a>
						<div menu="menu-6" class="d2 menu-6" id="gnbmenu-6">
							<ul menu="menu-6" class="d2 menu-6">
								<li menu="menu-6-0" class="d2 menu-6-0" data-submenu-id="gnbmenu-6-0"><a href="http://bo.marketplanta.epasscni.com/am/createboard/createBoardList.do" menu="menu-6-0" class="d2 menu-6-0"><span>게시판 생성</span></a></li>
								<li menu="menu-6-1" class="d2 menu-6-1" data-submenu-id="gnbmenu-6-1"><a href="http://bo.marketplanta.epasscni.com/am/createboard/create62BoardCommonList.do" menu="menu-6-1" class="d2 menu-6-1"><span>자유게시판</span></a></li>
								<li menu="menu-6-2" class="d2 menu-6-2" data-submenu-id="gnbmenu-6-2"><a href="http://bo.marketplanta.epasscni.com/am/createboard/create63BoardCommonList.do" menu="menu-6-2" class="d2 menu-6-2"><span>자유게시판_이미지</span></a></li>
								<li menu="menu-6-3" class="d2 menu-6-3" data-submenu-id="gnbmenu-6-3"><a href="http://bo.marketplanta.epasscni.com/am/createboard/create64BoardCommonList.do" menu="menu-6-3" class="d2 menu-6-3"><span>일반게시판_1</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-7" class="d1 menu-7" data-submenu-id="gnbmenu-7">
						<a href="http://bo.marketplanta.epasscni.com/am/board/noticeBoardList.do" menu="menu-7" class="d1 menu-7"><span>고객센터</span></a>
						<div menu="menu-7" class="d2 menu-7" id="gnbmenu-7">
							<ul menu="menu-7" class="d2 menu-7">
								<li menu="menu-7-0" class="d2 menu-7-0" data-submenu-id="gnbmenu-7-0"><a href="http://bo.marketplanta.epasscni.com/am/board/noticeBoardList.do" menu="menu-7-0" class="d2 menu-7-0"><span>공지사항</span></a></li>
								<li menu="menu-7-1" class="d2 menu-7-1" data-submenu-id="gnbmenu-7-1"><a href="http://bo.marketplanta.epasscni.com/am/board/faqBoardList.do" menu="menu-7-1" class="d2 menu-7-1"><span>FAQ</span></a></li>
								<li menu="menu-7-2" class="d2 menu-7-2" data-submenu-id="gnbmenu-7-2"><a href="http://bo.marketplanta.epasscni.com/am/board/commentBoardList.do" menu="menu-7-2" class="d2 menu-7-2"><span>상품후기</span></a></li>
								<li menu="menu-7-3" class="d2 menu-7-3" data-submenu-id="gnbmenu-7-3"><a href="http://bo.marketplanta.epasscni.com/am/board/productInquiryList.do" menu="menu-7-3" class="d2 menu-7-3"><span>상품Q&amp;A</span></a></li>
								<li menu="menu-7-4" class="d2 menu-7-4" data-submenu-id="gnbmenu-7-4"><a href="http://bo.marketplanta.epasscni.com/am/board/inquiryList.do" menu="menu-7-4" class="d2 menu-7-4"><span>1:1 문의</span></a></li>
								<li menu="menu-7-5" class="d2 menu-7-5" data-submenu-id="gnbmenu-7-5"><a href="http://bo.marketplanta.epasscni.com/am/board/agreementBoardList.do" menu="menu-7-5" class="d2 menu-7-5"><span>약관관리</span></a></li>
								<li menu="menu-7-6" class="d2 menu-7-6" data-submenu-id="gnbmenu-7-6"><a href="http://bo.marketplanta.epasscni.com/am/board/ootdList.do" menu="menu-7-6" class="d2 menu-7-6"><span>OOTD 관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-8" class="d1 menu-8" data-submenu-id="gnbmenu-8">
						<a href="http://bo.marketplanta.epasscni.com/am/logo/logoList.do" menu="menu-8" class="d1 menu-8"><span>로고관리</span></a>
						<div menu="menu-8" class="d2 menu-8" id="gnbmenu-8">
							<ul menu="menu-8" class="d2 menu-8">
								<li menu="menu-8-0" class="d2 menu-8-0" data-submenu-id="gnbmenu-8-0"><a href="http://bo.marketplanta.epasscni.com/am/logo/logoList.do" menu="menu-8-0" class="d2 menu-8-0"><span>로고목록</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-9" class="d1 menu-9" data-submenu-id="gnbmenu-9">
						<a href="http://bo.marketplanta.epasscni.com/am/sns/snsManagerList.do" menu="menu-9" class="d1 menu-9"><span>SNS관리</span></a>
						<div menu="menu-9" class="d2 menu-9" id="gnbmenu-9">
							<ul menu="menu-9" class="d2 menu-9">
								<li menu="menu-9-0" class="d2 menu-9-0" data-submenu-id="gnbmenu-9-0"><a href="http://bo.marketplanta.epasscni.com/am/sns/snsManagerList.do" menu="menu-9-0" class="d2 menu-9-0"><span>SNS관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-10" class="d1 menu-10" data-submenu-id="gnbmenu-10">
						<a href="http://bo.marketplanta.epasscni.com/am/stats/memberJoinDateList.do" menu="menu-10" class="d1 menu-10"><span>통계</span></a>
						<div menu="menu-10" class="d2 menu-10" id="gnbmenu-10">
							<ul menu="menu-10" class="d2 menu-10">
								<li menu="menu-10-0" class="d2 menu-10-0" data-submenu-id="gnbmenu-10-0"><a href="http://bo.marketplanta.epasscni.com/am/stats/memberJoinDateList.do" menu="menu-10-0" class="d2 menu-10-0"><span>회원통계</span></a></li>
								<li menu="menu-10-1" class="d2 menu-10-1" data-submenu-id="gnbmenu-10-1"><a href="http://bo.marketplanta.epasscni.com/am/stats/orderStatsSalesList.do" menu="menu-10-1" class="d2 menu-10-1"><span>매출통계</span></a></li>
								<li menu="menu-10-2" class="d2 menu-10-2" data-submenu-id="gnbmenu-10-2"><a href="http://bo.marketplanta.epasscni.com/am/stats/orderMallStatsShopList.do" menu="menu-10-2" class="d2 menu-10-2"><span>매장별통계</span></a></li>
								<li menu="menu-10-3" class="d2 menu-10-3" data-submenu-id="gnbmenu-10-3"><a href="http://bo.marketplanta.epasscni.com/am/stats/orderChannelList.do" menu="menu-10-3" class="d2 menu-10-3"><span>채널별매출</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-11" class="d1 menu-11" data-submenu-id="gnbmenu-11">
						<a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorNoticeList.do" menu="menu-11" class="d1 menu-11"><span>입점업체관리</span></a>
						<div menu="menu-11" class="d2 menu-11" id="gnbmenu-11">
							<ul menu="menu-11" class="d2 menu-11">
								<li menu="menu-11-0" class="d2 menu-11-0" data-submenu-id="gnbmenu-11-0"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorNoticeList.do" menu="menu-11-0" class="d2 menu-11-0"><span>입점업체공지사항</span></a></li>
								<li menu="menu-11-1" class="d2 menu-11-1" data-submenu-id="gnbmenu-11-1"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorInqList.do" menu="menu-11-1" class="d2 menu-11-1"><span>입점업체문의사항</span></a></li>
								<li menu="menu-11-2" class="d2 menu-11-2" data-submenu-id="gnbmenu-11-2"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorLoginManagerList.do" menu="menu-11-2" class="d2 menu-11-2"><span>입점상담 업체관리</span></a></li>
								<li menu="menu-11-3" class="d2 menu-11-3" data-submenu-id="gnbmenu-11-3"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorCounselList.do" menu="menu-11-3" class="d2 menu-11-3"><span>입점상담 관리</span></a></li>
								<li menu="menu-11-4" class="d2 menu-11-4" data-submenu-id="gnbmenu-11-4"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorReqList.do" menu="menu-11-4" class="d2 menu-11-4"><span>입점신청서 관리</span></a></li>
								<li menu="menu-11-5" class="d2 menu-11-5" data-submenu-id="gnbmenu-11-5"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorSellerPickList.do" menu="menu-11-5" class="d2 menu-11-5"><span>셀러픽관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-12" class="d1 menu-12" data-submenu-id="gnbmenu-12">
						<a href="http://bo.marketplanta.epasscni.com/am/site/basicManagerList.do" menu="menu-12" class="d1 menu-12"><span>시스템 관리</span></a>
						<div menu="menu-12" class="d2 menu-12" id="gnbmenu-12">
							<ul menu="menu-12" class="d2 menu-12">
								<li menu="menu-12-0" class="d2 menu-12-0" data-submenu-id="gnbmenu-12-0"><a href="http://bo.marketplanta.epasscni.com/am/site/basicManagerList.do" menu="menu-12-0" class="d2 menu-12-0"><span>관리자 관리</span></a></li>
								<li menu="menu-12-1" class="d2 menu-12-1" data-submenu-id="gnbmenu-12-1"><a href="http://bo.marketplanta.epasscni.com/am/site/authManagerList.do" menu="menu-12-1" class="d2 menu-12-1"><span>권한 관리</span></a></li>
								<li menu="menu-12-2" class="d2 menu-12-2" data-submenu-id="gnbmenu-12-2"><a href="http://bo.marketplanta.epasscni.com/am/site/menuManagerList.do" menu="menu-12-2" class="d2 menu-12-2"><span>메뉴 관리</span></a></li>
								<li menu="menu-12-3" class="d2 menu-12-3" data-submenu-id="gnbmenu-12-3"><a href="http://bo.marketplanta.epasscni.com/am/site/vendorManagerList.do" menu="menu-12-3" class="d2 menu-12-3"><span>입점업체정보 관리</span></a></li>
								<li menu="menu-12-4" class="d2 menu-12-4" data-submenu-id="gnbmenu-12-4"><a href="http://bo.marketplanta.epasscni.com/am/site/brandManagerList.do" menu="menu-12-4" class="d2 menu-12-4"><span>브랜드 관리</span></a></li>
								<li menu="menu-12-5" class="d2 menu-12-5" data-submenu-id="gnbmenu-12-5"><a href="http://bo.marketplanta.epasscni.com/am/site/makerManagerList.do" menu="menu-12-5" class="d2 menu-12-5"><span>제조사 관리</span></a></li>
								<li menu="menu-12-6" class="d2 menu-12-6" data-submenu-id="gnbmenu-12-6"><a href="http://bo.marketplanta.epasscni.com/am/site/delivCompanyList.do" menu="menu-12-6" class="d2 menu-12-6"><span>배송업체 관리</span></a></li>
								<li menu="menu-12-7" class="d2 menu-12-7" data-submenu-id="gnbmenu-12-7"><a href="http://bo.marketplanta.epasscni.com/am/site/banWordManagerList.do" menu="menu-12-7" class="d2 menu-12-7"><span>차단단어 관리</span></a></li>
								<li menu="menu-12-8" class="d2 menu-12-8" data-submenu-id="gnbmenu-12-8"><a href="http://bo.marketplanta.epasscni.com/am/site/commonCodeManagerList.do" menu="menu-12-8" class="d2 menu-12-8"><span>공통코드관리</span></a></li>
								<li menu="menu-12-9" class="d2 menu-12-9" data-submenu-id="gnbmenu-12-9"><a href="http://bo.marketplanta.epasscni.com/am/site/popularSearchWordList.do" menu="menu-12-9" class="d2 menu-12-9"><span>인기 검색어 관리</span></a></li>
								<li menu="menu-12-10" class="d2 menu-12-10" data-submenu-id="gnbmenu-12-10"><a href="http://bo.marketplanta.epasscni.com/am/site/benefitManagerList.do" menu="menu-12-10" class="d2 menu-12-10"><span>추가혜택관리</span></a></li>
								<li menu="menu-12-11" class="d2 menu-12-11" data-submenu-id="gnbmenu-12-11"><a href="http://bo.marketplanta.epasscni.com/am/site/myFitManagerList.do" menu="menu-12-11" class="d2 menu-12-11"><span>마이핏관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-13" class="d1 menu-13" data-submenu-id="gnbmenu-13">
						<a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingList.do" menu="menu-13" class="d1 menu-13"><span>정산</span></a>
						<div menu="menu-13" class="d2 menu-13" id="gnbmenu-13">
							<ul menu="menu-13" class="d2 menu-13">
								<li menu="menu-13-0" class="d2 menu-13-0" data-submenu-id="gnbmenu-13-0">
									<a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingList.do" menu="menu-13-0" class="d2 menu-13-0"><span>업체정산</span></a>
									<div menu="menu-13-0" class="d3 menu-13-0" id="gnbmenu-13-0">
										<ul menu="menu-13-0" class="d3 menu-13-0">
											<li menu="menu-13-0-0" class="d3 menu-13-0-0" data-submenu-id="gnbmenu-13-0-0"><a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingList.do" menu="menu-13-0-0" class="d3 menu-13-0-0"><span>정산목록</span></a></li>
											<li menu="menu-13-0-1" class="d3 menu-13-0-1" data-submenu-id="gnbmenu-13-0-1"><a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingDetail.do" menu="menu-13-0-1" class="d3 menu-13-0-1"><span>업체별상세</span></a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li menu="menu-14" class="d1 menu-14" data-submenu-id="gnbmenu-14">
						<a href="http://bo.marketplanta.epasscni.com/am/app/appPushManageList.do" menu="menu-14" class="d1 menu-14"><span>APP 관리</span></a>
						<div menu="menu-14" class="d2 menu-14" id="gnbmenu-14">
							<ul menu="menu-14" class="d2 menu-14">
								<li menu="menu-14-0" class="d2 menu-14-0" data-submenu-id="gnbmenu-14-0"><a href="http://bo.marketplanta.epasscni.com/am/app/appPushManageList.do" menu="menu-14-0" class="d2 menu-14-0"><span>APP 푸시관리</span></a></li>
								<li menu="menu-14-1" class="d2 menu-14-1" data-submenu-id="gnbmenu-14-1"><a href="http://bo.marketplanta.epasscni.com/am/app/appVersionManageList.do" menu="menu-14-1" class="d2 menu-14-1"><span>APP 버전관리</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-15" class="d1 menu-15" data-submenu-id="gnbmenu-15"><a href="http://bo.marketplanta.epasscni.com/am/target/targetList.do" menu="menu-15" class="d1 menu-15"><span>타겟관리</span></a>
						<div menu="menu-15" class="d2 menu-15" id="gnbmenu-15">
							<ul menu="menu-15" class="d2 menu-15">
								<li menu="menu-15-0" class="d2 menu-15-0" data-submenu-id="gnbmenu-15-0"><a href="http://bo.marketplanta.epasscni.com/am/target/targetList.do" menu="menu-15-0" class="d2 menu-15-0"><span>타겟목록</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-16" class="d1 menu-16" data-submenu-id="gnbmenu-16"><a href="http://bo.marketplanta.epasscni.com/am/info/managerInfoEdit.do" menu="menu-16" class="d1 menu-16"><span>관리자정보수정</span></a>
						<div menu="menu-16" class="d2 menu-16" id="gnbmenu-16">
							<ul menu="menu-16" class="d2 menu-16">
								<li menu="menu-16-0" class="d2 menu-16-0" data-submenu-id="gnbmenu-16-0"><a href="http://bo.marketplanta.epasscni.com/am/info/managerInfoEdit.do" menu="menu-16-0" class="d2 menu-16-0"><span>정보수정</span></a></li>
							</ul>
						</div>
					</li>
					<li menu="menu-17" class="d1 menu-17" data-submenu-id="gnbmenu-17">
						<a href="http://bo.marketplanta.epasscni.com/am/tag/list.do" menu="menu-17" class="d1 menu-17"><span>태그관리</span></a>
						<div menu="menu-17" class="d2 menu-17" id="gnbmenu-17">
							<ul menu="menu-17" class="d2 menu-17">
								<li menu="menu-17-0" class="d2 menu-17-0" data-submenu-id="gnbmenu-17-0"><a href="http://bo.marketplanta.epasscni.com/am/tag/tagGroupList.do" menu="menu-17-0" class="d2 menu-17-0"><span>태그그룹관리</span></a></li>
								<li menu="menu-17-1" class="d2 menu-17-1" data-submenu-id="gnbmenu-17-1"><a href="http://bo.marketplanta.epasscni.com/am/tag/adminTagForm.do" menu="menu-17-1" class="d2 menu-17-1"><span>태그관리</span></a></li>
								<li menu="menu-17-2" class="d2 menu-17-2" data-submenu-id="gnbmenu-17-2"><a href="http://bo.marketplanta.epasscni.com/am/tag/wishTagList.do" menu="menu-17-2" class="d2 menu-17-2"><span>희망태그관리</span></a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div class="spacer"></div>
		</div>
	</div>
	<!-- #container -->
	<div id="container">
		<!-- #aside -->
		<div id="aside" class="aside left">
			<div class="holder">
				<div id="lnb" class="container">
					<div class="wrap modules">
						<div class="title">
							상품관리
						</div>
						<div class="core">
							<ul class="nav" menu="menu">
								<li menu="menu-0" class="d1 menu-0" data-submenu-id="lnbmenu-0"><a href="http://bo.marketplanta.epasscni.com/am/main/dashboardMain.do" menu="menu-0" class="d1 menu-0"><span>대시보드</span></a></li>
								<li menu="menu-1" class="d1 menu-1" data-submenu-id="lnbmenu-1"><a href="http://bo.marketplanta.epasscni.com/am/member/infoMemberList.do" menu="menu-1" class="d1 menu-1"><span>회원관리</span></a>
									<div menu="menu-1" class="d2 menu-1" id="lnbmenu-1">
										<ul menu="menu-1" class="d2 menu-1">
											<li menu="menu-1-0" class="d2 menu-1-0" data-submenu-id="lnbmenu-1-0"><a href="http://bo.marketplanta.epasscni.com/am/member/infoMemberList.do" menu="menu-1-0" class="d2 menu-1-0"><span>회원관리</span></a></li>
											<li menu="menu-1-1" class="d2 menu-1-1" data-submenu-id="lnbmenu-1-1"><a href="http://bo.marketplanta.epasscni.com/am/member/restMemberList.do" menu="menu-1-1" class="d2 menu-1-1"><span>휴면회원관리</span></a></li>
											<li menu="menu-1-2" class="d2 menu-1-2" data-submenu-id="lnbmenu-1-2"><a href="http://bo.marketplanta.epasscni.com/am/member/secessionMemberList.do" menu="menu-1-2" class="d2 menu-1-2"><span>탈퇴회원관리</span></a></li>
											<li menu="menu-1-3" class="d2 menu-1-3" data-submenu-id="lnbmenu-1-3"><a href="http://bo.marketplanta.epasscni.com/am/member/lmsHistoryList.do" menu="menu-1-3" class="d2 menu-1-3"><span>LMS이력</span></a></li>
											<li menu="menu-1-4" class="d2 menu-1-4" data-submenu-id="lnbmenu-1-4"><a href="http://bo.marketplanta.epasscni.com/am/member/ootdList.do" menu="menu-1-4" class="d2 menu-1-4"><span>OOTD 관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-2" class="d1 menu-2 active" data-submenu-id="lnbmenu-2"><a href="http://bo.marketplanta.epasscni.com/am/product/categoryProductList.do" menu="menu-2" class="d1 menu-2"><span>상품관리</span></a>
									<div menu="menu-2" class="d2 menu-2" id="lnbmenu-2">
										<ul menu="menu-2" class="d2 menu-2">
											<li menu="menu-2-0" class="d2 menu-2-0" data-submenu-id="lnbmenu-2-0"><a href="http://bo.marketplanta.epasscni.com/am/product/categoryProductList.do" menu="menu-2-0" class="d2 menu-2-0"><span>전시카테고리관리</span></a></li>
											<li menu="menu-2-1" class="d2 menu-2-1 active" data-submenu-id="lnbmenu-2-1"><a href="http://bo.marketplanta.epasscni.com/am/product/basicProductList.do" menu="menu-2-1" class="d2 menu-2-1"><span>상품관리</span></a></li>
											<li menu="menu-2-2" class="d2 menu-2-2" data-submenu-id="lnbmenu-2-2"><a href="http://bo.marketplanta.epasscni.com/am/product/productNotificationInfoList.do" menu="menu-2-2" class="d2 menu-2-2"><span>상품고시관리</span></a></li>
											<li menu="menu-2-3" class="d2 menu-2-3" data-submenu-id="lnbmenu-2-3"><a href="http://bo.marketplanta.epasscni.com/am/product/vendorApprovalList.do" menu="menu-2-3" class="d2 menu-2-3"><span>입점업체 승인요청</span></a></li>
											<li menu="menu-2-4" class="d2 menu-2-4" data-submenu-id="lnbmenu-2-4"><a href="http://bo.marketplanta.epasscni.com/am/product/vendorProductChangeList.do" menu="menu-2-4" class="d2 menu-2-4"><span>입점업체 상품변경요청</span></a></li>
											<li menu="menu-2-5" class="d2 menu-2-5" data-submenu-id="lnbmenu-2-5"><a href="http://bo.marketplanta.epasscni.com/am/product/productUploadList.do" menu="menu-2-5" class="d2 menu-2-5"><span>일괄업로드</span></a></li>
											<li menu="menu-2-6" class="d2 menu-2-6" data-submenu-id="lnbmenu-2-6"><a href="http://bo.marketplanta.epasscni.com/am/product/giftList.do" menu="menu-2-6" class="d2 menu-2-6"><span>사은품관리</span></a></li>
											<li menu="menu-2-7" class="d2 menu-2-7" data-submenu-id="lnbmenu-2-7"><a href="http://bo.marketplanta.epasscni.com/am/product/estimateManagementList.do" menu="menu-2-7" class="d2 menu-2-7"><span>견적관리</span></a></li>
											<li menu="menu-2-8" class="d2 menu-2-8" data-submenu-id="lnbmenu-2-8"><a href="http://bo.marketplanta.epasscni.com/am/product/specManagementList.do" menu="menu-2-8" class="d2 menu-2-8"><span>스펙관리</span></a></li>
											<li menu="menu-2-9" class="d2 menu-2-9" data-submenu-id="lnbmenu-2-9"><a href="http://bo.marketplanta.epasscni.com/am/product/vendorProductList.do" menu="menu-2-9" class="d2 menu-2-9"><span>입점업체상품</span></a></li>
											<li menu="menu-2-10" class="d2 menu-2-10" data-submenu-id="lnbmenu-2-10"><a href="http://bo.marketplanta.epasscni.com/am/product/empDiscountList.do" menu="menu-2-10" class="d2 menu-2-10"><span>임직원 할인관리</span></a></li>
											<li menu="menu-2-11" class="d2 menu-2-11" data-submenu-id="lnbmenu-2-11"><a href="http://bo.marketplanta.epasscni.com/am/product/partnerDiscountList.do" menu="menu-2-11" class="d2 menu-2-11"><span>제휴사 할인관리</span></a></li>
											<li menu="menu-2-12" class="d2 menu-2-12" data-submenu-id="lnbmenu-2-12"><a href="http://bo.marketplanta.epasscni.com/am/product/brandPointList.do" menu="menu-2-12" class="d2 menu-2-12"><span>통합포인트 적립률관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-3" class="d1 menu-3" data-submenu-id="lnbmenu-3"><a href="http://bo.marketplanta.epasscni.com/am/order/orderList.do" menu="menu-3" class="d1 menu-3"><span>주문관리</span></a>
									<div menu="menu-3" class="d2 menu-3" id="lnbmenu-3">
										<ul menu="menu-3" class="d2 menu-3">
											<li menu="menu-3-0" class="d2 menu-3-0" data-submenu-id="lnbmenu-3-0"><a href="http://bo.marketplanta.epasscni.com/am/order/orderList.do?searchYn=Y" menu="menu-3-0" class="d2 menu-3-0"><span>전체주문</span></a></li>
											<li menu="menu-3-1" class="d2 menu-3-1" data-submenu-id="lnbmenu-3-1"><a href="http://bo.marketplanta.epasscni.com/am/order/orderPayReadyList.do?searchYn=Y" menu="menu-3-1" class="d2 menu-3-1"><span>입금대기</span></a></li>
											<li menu="menu-3-2" class="d2 menu-3-2" data-submenu-id="lnbmenu-3-2"><a href="http://bo.marketplanta.epasscni.com/am/order/orderPayList.do?searchYn=Y" menu="menu-3-2" class="d2 menu-3-2"><span>결제완료</span></a></li>
											<li menu="menu-3-3" class="d2 menu-3-3" data-submenu-id="lnbmenu-3-3"><a href="http://bo.marketplanta.epasscni.com/am/order/orderSendList.do?searchYn=Y" menu="menu-3-3" class="d2 menu-3-3"><span>배송관리</span></a></li>
											<li menu="menu-3-4" class="d2 menu-3-4" data-submenu-id="lnbmenu-3-4"><a href="http://bo.marketplanta.epasscni.com/am/order/orderFixList.do?searchYn=Y" menu="menu-3-4" class="d2 menu-3-4"><span>구매확정</span></a></li>
											<li menu="menu-3-5" class="d2 menu-3-5" data-submenu-id="lnbmenu-3-5"><a href="http://bo.marketplanta.epasscni.com/am/order/orderCancelList.do?searchYn=Y" menu="menu-3-5" class="d2 menu-3-5"><span>취소관리</span></a></li>
											<li menu="menu-3-6" class="d2 menu-3-6" data-submenu-id="lnbmenu-3-6"><a href="http://bo.marketplanta.epasscni.com/am/order/orderSwapList.do?searchYn=Y" menu="menu-3-6" class="d2 menu-3-6"><span>교환관리</span></a></li>
											<li menu="menu-3-7" class="d2 menu-3-7" data-submenu-id="lnbmenu-3-7"><a href="http://bo.marketplanta.epasscni.com/am/order/orderBackList.do?searchYn=Y" menu="menu-3-7" class="d2 menu-3-7"><span>반품관리</span></a></li>
											<li menu="menu-3-8" class="d2 menu-3-8" data-submenu-id="lnbmenu-3-8"><a href="http://bo.marketplanta.epasscni.com/am/order/orderRefundList.do?searchYn=Y" menu="menu-3-8" class="d2 menu-3-8"><span>환불관리</span></a></li>
											<li menu="menu-3-9" class="d2 menu-3-9" data-submenu-id="lnbmenu-3-9"><a href="http://bo.marketplanta.epasscni.com/am/order/taxIvc/taxIvcList.do" menu="menu-3-9" class="d2 menu-3-9"><span>세금계산서 신청관리</span></a></li>
											<li menu="menu-3-10" class="d2 menu-3-10" data-submenu-id="lnbmenu-3-10"><a href="http://bo.marketplanta.epasscni.com/am/order/orderScmCancelList.do?searchYn=Y" menu="menu-3-10" class="d2 menu-3-10"><span>입점업체취소요청</span></a></li>
											<li menu="menu-3-11" class="d2 menu-3-11" data-submenu-id="lnbmenu-3-11"><a href="http://bo.marketplanta.epasscni.com/am/order/orderOpenMarketList.do?searchYn=Y" menu="menu-3-11" class="d2 menu-3-11"><span>오픈마켓 주문조회</span></a></li>
											<li menu="menu-3-12" class="d2 menu-3-12" data-submenu-id="lnbmenu-3-12"><a href="http://bo.marketplanta.epasscni.com/am/order/orderScmOrderList.do?searchYn=Y" menu="menu-3-12" class="d2 menu-3-12"><span>입점업체 주문조회(통합)</span></a></li>
											<li menu="menu-3-13" class="d2 menu-3-13" data-submenu-id="lnbmenu-3-13"><a href="http://bo.marketplanta.epasscni.com/am/order/orderError/orderErrorList.do" menu="menu-3-13" class="d2 menu-3-13"><span>결제오류조회</span></a></li>
											<li menu="menu-3-14" class="d2 menu-3-14" data-submenu-id="lnbmenu-3-14"><a href="http://bo.marketplanta.epasscni.com/am/order/orderDeliveryList.do" menu="menu-3-14" class="d2 menu-3-14"><span>출고관리</span></a></li>
											<li menu="menu-3-15" class="d2 menu-3-15" data-submenu-id="lnbmenu-3-15"><a href="http://bo.marketplanta.epasscni.com/am/order/orderCleanKingList.do" menu="menu-3-15" class="d2 menu-3-15"><span>O2O 주문조회</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-4" class="d1 menu-4" data-submenu-id="lnbmenu-4"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerDisplayView.do" menu="menu-4" class="d1 menu-4"><span>전시관리</span></a>
									<div menu="menu-4" class="d2 menu-4" id="lnbmenu-4">
										<ul menu="menu-4" class="d2 menu-4">
											<li menu="menu-4-0" class="d2 menu-4-0" data-submenu-id="lnbmenu-4-0"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerDisplayView.do" menu="menu-4-0" class="d2 menu-4-0"><span>전시배너관리</span></a></li>
											<li menu="menu-4-1" class="d2 menu-4-1" data-submenu-id="lnbmenu-4-1"><a href="http://bo.marketplanta.epasscni.com/am/display/productDisplayView.do" menu="menu-4-1" class="d2 menu-4-1"><span>전시상품관리</span></a></li>
											<li menu="menu-4-2" class="d2 menu-4-2" data-submenu-id="lnbmenu-4-2"><a href="http://bo.marketplanta.epasscni.com/am/display/popupList.do" menu="menu-4-2" class="d2 menu-4-2"><span>팝업관리</span></a></li>
											<li menu="menu-4-3" class="d2 menu-4-3" data-submenu-id="lnbmenu-4-3"><a href="http://bo.marketplanta.epasscni.com/am/display/vendorDisplayView.do" menu="menu-4-3" class="d2 menu-4-3"><span>공통전시</span></a></li>
											<li menu="menu-4-4" class="d2 menu-4-4" data-submenu-id="lnbmenu-4-4"><a href="http://bo.marketplanta.epasscni.com/am/display/themeBannerView.do" menu="menu-4-4" class="d2 menu-4-4"><span>테마전시배너관리</span></a></li>
											<li menu="menu-4-5" class="d2 menu-4-5" data-submenu-id="lnbmenu-4-5"><a href="http://bo.marketplanta.epasscni.com/am/display/themeProductView.do" menu="menu-4-5" class="d2 menu-4-5"><span>테마전시상품관리</span></a></li>
											<li menu="menu-4-6" class="d2 menu-4-6" data-submenu-id="lnbmenu-4-6"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerProductBrandNoticeList.do" menu="menu-4-6" class="d2 menu-4-6"><span>브랜드공지관리</span></a></li>
											<li menu="menu-4-7" class="d2 menu-4-7" data-submenu-id="lnbmenu-4-7"><a href="http://bo.marketplanta.epasscni.com/am/display/bannerProductMdNoticeList.do" menu="menu-4-7" class="d2 menu-4-7"><span>MD공지관리</span></a></li>
											<li menu="menu-4-8" class="d2 menu-4-8" data-submenu-id="lnbmenu-4-8"><a href="http://bo.marketplanta.epasscni.com/am/display/adList.do" menu="menu-4-8" class="d2 menu-4-8"><span>광고관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-5" class="d1 menu-5" data-submenu-id="lnbmenu-5"><a href="http://bo.marketplanta.epasscni.com/am/marketing/planList.do" menu="menu-5" class="d1 menu-5"><span>프로모션관리</span></a>
									<div menu="menu-5" class="d2 menu-5" id="lnbmenu-5">
										<ul menu="menu-5" class="d2 menu-5">
											<li menu="menu-5-0" class="d2 menu-5-0" data-submenu-id="lnbmenu-5-0"><a href="http://bo.marketplanta.epasscni.com/am/marketing/planList.do" menu="menu-5-0" class="d2 menu-5-0"><span>기획전관리</span></a></li>
											<li menu="menu-5-1" class="d2 menu-5-1" data-submenu-id="lnbmenu-5-1"><a href="http://bo.marketplanta.epasscni.com/am/marketing/eventList.do" menu="menu-5-1" class="d2 menu-5-1"><span>이벤트관리</span></a></li>
											<li menu="menu-5-2" class="d2 menu-5-2" data-submenu-id="lnbmenu-5-2"><a href="http://bo.marketplanta.epasscni.com/am/marketing/kingerList.do" menu="menu-5-2" class="d2 menu-5-2"><span>고객체험단</span></a></li>
											<li menu="menu-5-3" class="d2 menu-5-3" data-submenu-id="lnbmenu-5-3"><a href="http://bo.marketplanta.epasscni.com/am/marketing/oneDayList.do" menu="menu-5-3" class="d2 menu-5-3"><span>원데이특가</span></a></li>
											<li menu="menu-5-4" class="d2 menu-5-4" data-submenu-id="lnbmenu-5-4"><a href="http://bo.marketplanta.epasscni.com/am/marketing/timeSaleList.do" menu="menu-5-4" class="d2 menu-5-4"><span>게릴라 세일</span></a></li>
											<li menu="menu-5-5" class="d2 menu-5-5" data-submenu-id="lnbmenu-5-5"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponList.do" menu="menu-5-5" class="d2 menu-5-5"><span>쿠폰</span></a>
												<div menu="menu-5-5" class="d3 menu-5-5" id="lnbmenu-5-5">
													<ul menu="menu-5-5" class="d3 menu-5-5">
														<li menu="menu-5-5-0" class="d3 menu-5-5-0" data-submenu-id="lnbmenu-5-5-0"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponList.do" menu="menu-5-5-0" class="d3 menu-5-5-0"><span>쿠폰목록</span></a></li>
														<li menu="menu-5-5-1" class="d3 menu-5-5-1" data-submenu-id="lnbmenu-5-5-1"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponForm.do" menu="menu-5-5-1" class="d3 menu-5-5-1"><span>쿠폰생성</span></a></li>
														<li menu="menu-5-5-2" class="d3 menu-5-5-2" data-submenu-id="lnbmenu-5-5-2"><a href="http://bo.marketplanta.epasscni.com/am/marketing/onlineCouponIssueList.do" menu="menu-5-5-2" class="d3 menu-5-5-2"><span>쿠폰발행내역</span></a></li>
													</ul>
												</div>
											</li>
											<li menu="menu-5-6" class="d2 menu-5-6" data-submenu-id="lnbmenu-5-6"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointDetail.do" menu="menu-5-6" class="d2 menu-5-6"><span>포인트</span></a>
												<div menu="menu-5-6" class="d3 menu-5-6" id="lnbmenu-5-6">
													<ul menu="menu-5-6" class="d3 menu-5-6">
														<li menu="menu-5-6-0" class="d3 menu-5-6-0" data-submenu-id="lnbmenu-5-6-0"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointDetail.do" menu="menu-5-6-0" class="d3 menu-5-6-0"><span>포인트 내역조회</span></a></li>
														<li menu="menu-5-6-1" class="d3 menu-5-6-1" data-submenu-id="lnbmenu-5-6-1"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointList.do" menu="menu-5-6-1" class="d3 menu-5-6-1"><span>포인트 목록</span></a></li>
														<li menu="menu-5-6-2" class="d3 menu-5-6-2" data-submenu-id="lnbmenu-5-6-2"><a href="http://bo.marketplanta.epasscni.com/am/marketing/pointForm.do" menu="menu-5-6-2" class="d3 menu-5-6-2"><span>포인트 적립/차감</span></a></li>
													</ul>
												</div>
											</li>
											<li menu="menu-5-7" class="d2 menu-5-7" data-submenu-id="lnbmenu-5-7"><a href="http://bo.marketplanta.epasscni.com/am/marketing/cardEventList.do" menu="menu-5-7" class="d2 menu-5-7"><span>카드행사관리</span></a></li>
											<li menu="menu-5-8" class="d2 menu-5-8" data-submenu-id="lnbmenu-5-8"><a href="http://bo.marketplanta.epasscni.com/am/marketing/cardDivList.do" menu="menu-5-8" class="d2 menu-5-8"><span>카드할부관리</span></a></li>
											<li menu="menu-5-9" class="d2 menu-5-9" data-submenu-id="lnbmenu-5-9"><a href="http://bo.marketplanta.epasscni.com/am/marketing/channelOnList.do" menu="menu-5-9" class="d2 menu-5-9"><span>채널ON</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-6" class="d1 menu-6" data-submenu-id="lnbmenu-6"><a href="http://bo.marketplanta.epasscni.com/am/createboard/createBoardList.do" menu="menu-6" class="d1 menu-6"><span>게시판 관리</span></a>
									<div menu="menu-6" class="d2 menu-6" id="lnbmenu-6">
										<ul menu="menu-6" class="d2 menu-6">
											<li menu="menu-6-0" class="d2 menu-6-0" data-submenu-id="lnbmenu-6-0"><a href="http://bo.marketplanta.epasscni.com/am/createboard/createBoardList.do" menu="menu-6-0" class="d2 menu-6-0"><span>게시판 생성</span></a></li>
											<li menu="menu-6-1" class="d2 menu-6-1" data-submenu-id="lnbmenu-6-1"><a href="http://bo.marketplanta.epasscni.com/am/createboard/create62BoardCommonList.do" menu="menu-6-1" class="d2 menu-6-1"><span>자유게시판</span></a></li>
											<li menu="menu-6-2" class="d2 menu-6-2" data-submenu-id="lnbmenu-6-2"><a href="http://bo.marketplanta.epasscni.com/am/createboard/create63BoardCommonList.do" menu="menu-6-2" class="d2 menu-6-2"><span>자유게시판_이미지</span></a></li>
											<li menu="menu-6-3" class="d2 menu-6-3" data-submenu-id="lnbmenu-6-3"><a href="http://bo.marketplanta.epasscni.com/am/createboard/create64BoardCommonList.do" menu="menu-6-3" class="d2 menu-6-3"><span>일반게시판_1</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-7" class="d1 menu-7" data-submenu-id="lnbmenu-7"><a href="http://bo.marketplanta.epasscni.com/am/board/noticeBoardList.do" menu="menu-7" class="d1 menu-7"><span>고객센터</span></a>
									<div menu="menu-7" class="d2 menu-7" id="lnbmenu-7">
										<ul menu="menu-7" class="d2 menu-7">
											<li menu="menu-7-0" class="d2 menu-7-0" data-submenu-id="lnbmenu-7-0"><a href="http://bo.marketplanta.epasscni.com/am/board/noticeBoardList.do" menu="menu-7-0" class="d2 menu-7-0"><span>공지사항</span></a></li>
											<li menu="menu-7-1" class="d2 menu-7-1" data-submenu-id="lnbmenu-7-1"><a href="http://bo.marketplanta.epasscni.com/am/board/faqBoardList.do" menu="menu-7-1" class="d2 menu-7-1"><span>FAQ</span></a></li>
											<li menu="menu-7-2" class="d2 menu-7-2" data-submenu-id="lnbmenu-7-2"><a href="http://bo.marketplanta.epasscni.com/am/board/commentBoardList.do" menu="menu-7-2" class="d2 menu-7-2"><span>상품후기</span></a></li>
											<li menu="menu-7-3" class="d2 menu-7-3" data-submenu-id="lnbmenu-7-3"><a href="http://bo.marketplanta.epasscni.com/am/board/productInquiryList.do" menu="menu-7-3" class="d2 menu-7-3"><span>상품Q&amp;A</span></a></li>
											<li menu="menu-7-4" class="d2 menu-7-4" data-submenu-id="lnbmenu-7-4"><a href="http://bo.marketplanta.epasscni.com/am/board/inquiryList.do" menu="menu-7-4" class="d2 menu-7-4"><span>1:1 문의</span></a></li>
											<li menu="menu-7-5" class="d2 menu-7-5" data-submenu-id="lnbmenu-7-5"><a href="http://bo.marketplanta.epasscni.com/am/board/agreementBoardList.do" menu="menu-7-5" class="d2 menu-7-5"><span>약관관리</span></a></li>
											<li menu="menu-7-6" class="d2 menu-7-6" data-submenu-id="lnbmenu-7-6"><a href="http://bo.marketplanta.epasscni.com/am/board/ootdList.do" menu="menu-7-6" class="d2 menu-7-6"><span>OOTD 관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-8" class="d1 menu-8" data-submenu-id="lnbmenu-8"><a href="http://bo.marketplanta.epasscni.com/am/logo/logoList.do" menu="menu-8" class="d1 menu-8"><span>로고관리</span></a>
									<div menu="menu-8" class="d2 menu-8" id="lnbmenu-8">
										<ul menu="menu-8" class="d2 menu-8">
											<li menu="menu-8-0" class="d2 menu-8-0" data-submenu-id="lnbmenu-8-0"><a href="http://bo.marketplanta.epasscni.com/am/logo/logoList.do" menu="menu-8-0" class="d2 menu-8-0"><span>로고목록</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-9" class="d1 menu-9" data-submenu-id="lnbmenu-9"><a href="http://bo.marketplanta.epasscni.com/am/sns/snsManagerList.do" menu="menu-9" class="d1 menu-9"><span>SNS관리</span></a>
									<div menu="menu-9" class="d2 menu-9" id="lnbmenu-9">
										<ul menu="menu-9" class="d2 menu-9">
											<li menu="menu-9-0" class="d2 menu-9-0" data-submenu-id="lnbmenu-9-0"><a href="http://bo.marketplanta.epasscni.com/am/sns/snsManagerList.do" menu="menu-9-0" class="d2 menu-9-0"><span>SNS관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-10" class="d1 menu-10" data-submenu-id="lnbmenu-10"><a href="http://bo.marketplanta.epasscni.com/am/stats/memberJoinDateList.do" menu="menu-10" class="d1 menu-10"><span>통계</span></a>
									<div menu="menu-10" class="d2 menu-10" id="lnbmenu-10">
										<ul menu="menu-10" class="d2 menu-10">
											<li menu="menu-10-0" class="d2 menu-10-0" data-submenu-id="lnbmenu-10-0"><a href="http://bo.marketplanta.epasscni.com/am/stats/memberJoinDateList.do" menu="menu-10-0" class="d2 menu-10-0"><span>회원통계</span></a></li>
											<li menu="menu-10-1" class="d2 menu-10-1" data-submenu-id="lnbmenu-10-1"><a href="http://bo.marketplanta.epasscni.com/am/stats/orderStatsSalesList.do" menu="menu-10-1" class="d2 menu-10-1"><span>매출통계</span></a></li>
											<li menu="menu-10-2" class="d2 menu-10-2" data-submenu-id="lnbmenu-10-2"><a href="http://bo.marketplanta.epasscni.com/am/stats/orderMallStatsShopList.do" menu="menu-10-2" class="d2 menu-10-2"><span>매장별통계</span></a></li>
											<li menu="menu-10-3" class="d2 menu-10-3" data-submenu-id="lnbmenu-10-3"><a href="http://bo.marketplanta.epasscni.com/am/stats/orderChannelList.do" menu="menu-10-3" class="d2 menu-10-3"><span>채널별매출</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-11" class="d1 menu-11" data-submenu-id="lnbmenu-11"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorNoticeList.do" menu="menu-11" class="d1 menu-11"><span>입점업체관리</span></a>
									<div menu="menu-11" class="d2 menu-11" id="lnbmenu-11">
										<ul menu="menu-11" class="d2 menu-11">
											<li menu="menu-11-0" class="d2 menu-11-0" data-submenu-id="lnbmenu-11-0"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorNoticeList.do" menu="menu-11-0" class="d2 menu-11-0"><span>입점업체공지사항</span></a></li>
											<li menu="menu-11-1" class="d2 menu-11-1" data-submenu-id="lnbmenu-11-1"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorInqList.do" menu="menu-11-1" class="d2 menu-11-1"><span>입점업체문의사항</span></a></li>
											<li menu="menu-11-2" class="d2 menu-11-2" data-submenu-id="lnbmenu-11-2"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorLoginManagerList.do" menu="menu-11-2" class="d2 menu-11-2"><span>입점상담 업체관리</span></a></li>
											<li menu="menu-11-3" class="d2 menu-11-3" data-submenu-id="lnbmenu-11-3"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorCounselList.do" menu="menu-11-3" class="d2 menu-11-3"><span>입점상담 관리</span></a></li>
											<li menu="menu-11-4" class="d2 menu-11-4" data-submenu-id="lnbmenu-11-4"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorReqList.do" menu="menu-11-4" class="d2 menu-11-4"><span>입점신청서 관리</span></a></li>
											<li menu="menu-11-5" class="d2 menu-11-5" data-submenu-id="lnbmenu-11-5"><a href="http://bo.marketplanta.epasscni.com/am/vendor/vendorSellerPickList.do" menu="menu-11-5" class="d2 menu-11-5"><span>셀러픽관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-12" class="d1 menu-12" data-submenu-id="lnbmenu-12"><a href="http://bo.marketplanta.epasscni.com/am/site/basicManagerList.do" menu="menu-12" class="d1 menu-12"><span>시스템 관리</span></a>
									<div menu="menu-12" class="d2 menu-12" id="lnbmenu-12">
										<ul menu="menu-12" class="d2 menu-12">
											<li menu="menu-12-0" class="d2 menu-12-0" data-submenu-id="lnbmenu-12-0"><a href="http://bo.marketplanta.epasscni.com/am/site/basicManagerList.do" menu="menu-12-0" class="d2 menu-12-0"><span>관리자 관리</span></a></li>
											<li menu="menu-12-1" class="d2 menu-12-1" data-submenu-id="lnbmenu-12-1"><a href="http://bo.marketplanta.epasscni.com/am/site/authManagerList.do" menu="menu-12-1" class="d2 menu-12-1"><span>권한 관리</span></a></li>
											<li menu="menu-12-2" class="d2 menu-12-2" data-submenu-id="lnbmenu-12-2"><a href="http://bo.marketplanta.epasscni.com/am/site/menuManagerList.do" menu="menu-12-2" class="d2 menu-12-2"><span>메뉴 관리</span></a></li>
											<li menu="menu-12-3" class="d2 menu-12-3" data-submenu-id="lnbmenu-12-3"><a href="http://bo.marketplanta.epasscni.com/am/site/vendorManagerList.do" menu="menu-12-3" class="d2 menu-12-3"><span>입점업체정보 관리</span></a></li>
											<li menu="menu-12-4" class="d2 menu-12-4" data-submenu-id="lnbmenu-12-4"><a href="http://bo.marketplanta.epasscni.com/am/site/brandManagerList.do" menu="menu-12-4" class="d2 menu-12-4"><span>브랜드 관리</span></a></li>
											<li menu="menu-12-5" class="d2 menu-12-5" data-submenu-id="lnbmenu-12-5"><a href="http://bo.marketplanta.epasscni.com/am/site/makerManagerList.do" menu="menu-12-5" class="d2 menu-12-5"><span>제조사 관리</span></a></li>
											<li menu="menu-12-6" class="d2 menu-12-6" data-submenu-id="lnbmenu-12-6"><a href="http://bo.marketplanta.epasscni.com/am/site/delivCompanyList.do" menu="menu-12-6" class="d2 menu-12-6"><span>배송업체 관리</span></a></li>
											<li menu="menu-12-7" class="d2 menu-12-7" data-submenu-id="lnbmenu-12-7"><a href="http://bo.marketplanta.epasscni.com/am/site/banWordManagerList.do" menu="menu-12-7" class="d2 menu-12-7"><span>차단단어 관리</span></a></li>
											<li menu="menu-12-8" class="d2 menu-12-8" data-submenu-id="lnbmenu-12-8"><a href="http://bo.marketplanta.epasscni.com/am/site/commonCodeManagerList.do" menu="menu-12-8" class="d2 menu-12-8"><span>공통코드관리</span></a></li>
											<li menu="menu-12-9" class="d2 menu-12-9" data-submenu-id="lnbmenu-12-9"><a href="http://bo.marketplanta.epasscni.com/am/site/popularSearchWordList.do" menu="menu-12-9" class="d2 menu-12-9"><span>인기 검색어 관리</span></a></li>
											<li menu="menu-12-10" class="d2 menu-12-10" data-submenu-id="lnbmenu-12-10"><a href="http://bo.marketplanta.epasscni.com/am/site/benefitManagerList.do" menu="menu-12-10" class="d2 menu-12-10"><span>추가혜택관리</span></a></li>
											<li menu="menu-12-11" class="d2 menu-12-11" data-submenu-id="lnbmenu-12-11"><a href="http://bo.marketplanta.epasscni.com/am/site/myFitManagerList.do" menu="menu-12-11" class="d2 menu-12-11"><span>마이핏관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-13" class="d1 menu-13" data-submenu-id="lnbmenu-13"><a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingList.do" menu="menu-13" class="d1 menu-13"><span>정산</span></a>
									<div menu="menu-13" class="d2 menu-13" id="lnbmenu-13">
										<ul menu="menu-13" class="d2 menu-13">
											<li menu="menu-13-0" class="d2 menu-13-0" data-submenu-id="lnbmenu-13-0"><a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingList.do" menu="menu-13-0" class="d2 menu-13-0"><span>업체정산</span></a>
												<div menu="menu-13-0" class="d3 menu-13-0" id="lnbmenu-13-0">
													<ul menu="menu-13-0" class="d3 menu-13-0">
														<li menu="menu-13-0-0" class="d3 menu-13-0-0" data-submenu-id="lnbmenu-13-0-0"><a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingList.do" menu="menu-13-0-0" class="d3 menu-13-0-0"><span>정산목록</span></a></li>
														<li menu="menu-13-0-1" class="d3 menu-13-0-1" data-submenu-id="lnbmenu-13-0-1"><a href="http://bo.marketplanta.epasscni.com/am/accounting/companyAccountingDetail.do" menu="menu-13-0-1" class="d3 menu-13-0-1"><span>업체별상세</span></a></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li menu="menu-14" class="d1 menu-14" data-submenu-id="lnbmenu-14"><a href="http://bo.marketplanta.epasscni.com/am/app/appPushManageList.do" menu="menu-14" class="d1 menu-14"><span>APP 관리</span></a>
									<div menu="menu-14" class="d2 menu-14" id="lnbmenu-14">
										<ul menu="menu-14" class="d2 menu-14">
											<li menu="menu-14-0" class="d2 menu-14-0" data-submenu-id="lnbmenu-14-0"><a href="http://bo.marketplanta.epasscni.com/am/app/appPushManageList.do" menu="menu-14-0" class="d2 menu-14-0"><span>APP 푸시관리</span></a></li>
											<li menu="menu-14-1" class="d2 menu-14-1" data-submenu-id="lnbmenu-14-1"><a href="http://bo.marketplanta.epasscni.com/am/app/appVersionManageList.do" menu="menu-14-1" class="d2 menu-14-1"><span>APP 버전관리</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-15" class="d1 menu-15" data-submenu-id="lnbmenu-15"><a href="http://bo.marketplanta.epasscni.com/am/target/targetList.do" menu="menu-15" class="d1 menu-15"><span>타겟관리</span></a>
									<div menu="menu-15" class="d2 menu-15" id="lnbmenu-15">
										<ul menu="menu-15" class="d2 menu-15">
											<li menu="menu-15-0" class="d2 menu-15-0" data-submenu-id="lnbmenu-15-0"><a href="http://bo.marketplanta.epasscni.com/am/target/targetList.do" menu="menu-15-0" class="d2 menu-15-0"><span>타겟목록</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-16" class="d1 menu-16" data-submenu-id="lnbmenu-16"><a href="http://bo.marketplanta.epasscni.com/am/info/managerInfoEdit.do" menu="menu-16" class="d1 menu-16"><span>관리자정보수정</span></a>
									<div menu="menu-16" class="d2 menu-16" id="lnbmenu-16">
										<ul menu="menu-16" class="d2 menu-16">
											<li menu="menu-16-0" class="d2 menu-16-0" data-submenu-id="lnbmenu-16-0"><a href="http://bo.marketplanta.epasscni.com/am/info/managerInfoEdit.do" menu="menu-16-0" class="d2 menu-16-0"><span>정보수정</span></a></li>
										</ul>
									</div>
								</li>
								<li menu="menu-17" class="d1 menu-17" data-submenu-id="lnbmenu-17"><a href="http://bo.marketplanta.epasscni.com/am/tag/list.do" menu="menu-17" class="d1 menu-17"><span>태그관리</span></a>
									<div menu="menu-17" class="d2 menu-17" id="lnbmenu-17">
										<ul menu="menu-17" class="d2 menu-17">
											<li menu="menu-17-0" class="d2 menu-17-0" data-submenu-id="lnbmenu-17-0"><a href="http://bo.marketplanta.epasscni.com/am/tag/tagGroupList.do" menu="menu-17-0" class="d2 menu-17-0"><span>태그그룹관리</span></a></li>
											<li menu="menu-17-1" class="d2 menu-17-1" data-submenu-id="lnbmenu-17-1"><a href="http://bo.marketplanta.epasscni.com/am/tag/adminTagForm.do" menu="menu-17-1" class="d2 menu-17-1"><span>태그관리</span></a></li>
											<li menu="menu-17-2" class="d2 menu-17-2" data-submenu-id="lnbmenu-17-2"><a href="http://bo.marketplanta.epasscni.com/am/tag/wishTagList.do" menu="menu-17-2" class="d2 menu-17-2"><span>희망태그관리</span></a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- // #aside -->
		<!-- #wrapper -->
		<div id="wrapper">
			<!-- #contents -->
			<div id="contents">
				<!-- .container -->
				<div class="container">
					<!-- ##############################################################################

						S : 컨텐츠 삽입

					############################################################################### -->
					<h2 class="title"><span>상품등록</span></h2>
					<h3 class="title"><span>기본정보</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>입점업체/브랜드<i class="require"><em>필수입력</em></i></span></th>
								<td colspan="3">
									<input type="text" name="" id="" class="text" readonly="">
									<span> / </span>
									<input type="text" name="" id="" class="text" readonly="">
									<a href="javascript:;" id="" class="button button-a"><span>조회</span></a>
									<span class="txt_warnning">(상품 등록 후에 수정 불가 항목)</span>
								</td>
							</tr>
							<tr>
								<th><label for="PRD_MST_NM">상품명<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="text" id="PRD_MST_NM" name="PRD_MST_NM" class="text xlarge" value="" maxlength="150">
									</div>
									<p class="txt_warnning">(공백포함 최대 100자이내로 입력해주세요.)</p>
								</td>
								<th><label for="PRD_MST_SEL_CNT">판매가능수량<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line G">
										<input type="text" id="PRD_MST_SEL_CNT" name="PRD_MST_SEL_CNT" class="number text short" value="" maxlength="9"> 개
									</div>
									<p class="txt_warnning">(777 입력 시 수량 제한없음 처리)</p>
									<div class="B" id="BCntList" style="display: none;">
									</div>
									<div class="S" style="display: none;">
										<div class="tbl_line">
											<label for="">세트상품-1</label>
											<input type="text" name="" id="" class="text small">
											<span> 개</span>
										</div>
										<div class="tbl_line">
											<label for="">세트상품-2</label>
											<input type="text" name="" id="" class="text small">
											<span> 개</span>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>입점업체 상품변경요청</span></h2>
					<div class="grid cf">
						<div class="col-1-2">
							<h3 class="title"><span>기존정보</span></h3>
							<table class="table-row table-a">
								<caption>기존정보의 상품코드, 상품명, 판매가, 판매가능수량, 할인율, 판매여부를 알 수 있는 표 입니다.</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									<tr>
										<th><span>상품코드</span></th>
										<td>GYOAX2504</td>
									</tr>
									<tr>
										<th><span>상품명</span></th>
										<td>거위털 캡짱많아 완전 빠방빠방 롱패딩</td>
									</tr>
									<tr>
										<th><span>판매가</span></th>
										<td>990,000원</td>
									</tr>
									<tr>
										<th><span>판매가능수량</span></th>
										<td>1,000개</td>
									</tr>
									<tr>
										<th><span>할인율</span></th>
										<td>
											<div class="tbl_line">PC : 정율(%) / 4</div>
											<div class="tbl_line">MOBILE : 정율(%) / 4</div>
										</td>
									</tr>
									<tr>
										<th><span>판매여부</span></th>
										<td>판매중</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-1-2">
							<h3 class="title"><span>변경정보</span></h3>
							<table class="table-row table-a">
								<caption>기존정보의 상품코드, 상품명, 판매가, 판매가능수량, 할인율, 판매여부를 알 수 있는 표 입니다.</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									<tr>
										<th><span>상품코드</span></th>
										<td>GYOAX2504</td>
									</tr>
									<tr>
										<th><span>상품명</span></th>
										<td>거위털 캡짱많아 완전 빠방빠방 롱패딩</td>
									</tr>
									<tr>
										<th><span>판매가</span></th>
										<td>990,000원</td>
									</tr>
									<tr>
										<th><span>판매가능수량</span></th>
										<td>1,000개</td>
									</tr>
									<tr>
										<th><span>할인율</span></th>
										<td>
											<div class="tbl_line">PC : 정율(%) / 4</div>
											<div class="tbl_line">MOBILE : 정율(%) / 4</div>
										</td>
									</tr>
									<tr>
										<th><span>판매여부</span></th>
										<td>판매중</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<h3 class="title"><span>보류사유</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>승인여부<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<div class="grid section-button-search">
										<a href="javascript:;" id="" class="button button-a"><span>보류내역보기</span></a>
									</div>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="" class="label">승인</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="" class="label">보류</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<h3 class="title"><span>보류사유</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>승인여부<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<div class="grid section-button-search">
										<a href="javascript:;" id="" class="button button-a"><span>보류내역보기</span></a>
									</div>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="" class="label">승인</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="" class="label">보류</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>보류사유<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="checkbox" name="" id="" class="checkbox">
											<label for="" class="label">판매가</label>
										</li>
										<li>
											<input type="checkbox" name="" id="" class="checkbox">
											<label for="" class="label">상품명</label>
										</li>
										<li>
											<input type="checkbox" name="" id="" class="checkbox">
											<label for="" class="label">카테고리</label>
										</li>
										<li>
											<input type="checkbox" name="" id="" class="checkbox">
											<label for="" class="label">영상/이미지</label>
										</li>
										<li>
											<input type="checkbox" name="" id="" class="checkbox">
											<label for="" class="label">고시정보</label>
										</li>
										<li>
											<input type="checkbox" name="" id="" class="checkbox">
											<label for="" class="label">기타</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>상세사유<i class="require"><em>필수입력</em></i></span></th>
								<td><textarea name="" id="" class="textarea"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
							<a href="javascript:;" id="" class="button"><span>목록</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>상품관리</span></h2>
					<div class="tab-list">
						<ul>
							<li class="in"><a href="#"><span>전체상품<small>(80)</small></span></a></li>
							<li><a href="#"><span>판매중<small>(78)</small></span></a></li>
							<li><a href="#"><span>미판매<small>(0)</small></span></a></li>
							<li><a href="#"><span>품절상품<small>(1)</small></span></a></li>
							<li><a href="#"><span>일부품절상품<small>(1)</small></span></a></li>
						</ul>
					</div>
					<div class="section-title">
						<h3 class="title"><span>목록</span></h3>
					</div>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 24%;">
							<col style="width: 10%;">
							<col style="width: 23%;">
							<col style="width: 10%;">
							<col style="width: 23%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>상품코드</span></th>
								<td><input type="text" class="text" id="" name="" value=""></td>
								<th><span>상품명</span></th>
								<td colspan="3"><input type="text" class="text xlarge" id="" name="" value=""></td>
							</tr>
							<tr>
								<th><span>등록일</span></th>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="" id="" class="text small" value="" readonly data-target-end="#">
									~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" name="" id="" class="text small" value="" readonly data-target-start="#">
								</td>
								<th><span>상태</span></th>
								<td>
									<select class="select small" name="" id="">
										<option value="">전체</option>
										<option value="I">판매중</option>
										<option value="O">일시품절</option>
										<option value="T">품절상품</option>
										<option value="S">미판매</option>
									</select>
								</td>
								<th><span>진열</span></th>
								<td>
									<select class="select small" name="" id="">
										<option value="">전체</option>
										<option value="Y">YES</option>
										<option value="N">NO</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>승인</span></th>
								<td>
									<select class="select" name="" id="">
										<option value="">전체</option>
										<option value="D">대기</option>
										<option value="A">승인</option>
										<option value="C">거절</option>
									</select>
								</td>
								<th><span>시즌</span></th>
								<td colspan="3">
									<select class="select" name="" id="">
										<option value="">전체</option>
										<option value="3006">전체</option>
										<option value="3007">F/W</option>
										<option value="3008">S/S</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>상품유형</span></th>
								<td colspan="5">
									<select class="select" name="">
										<option value="">전체</option>
										<option value="G">일반상품</option>
										<option value="B">묶음상품</option>
										<option value="S">세트상품</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>카테고리</span></th>
								<td colspan="5">
									<select class="select" id="searchPrdCtgEnv" name="searchPrdCtgEnv">
										<option value="">미선택</option>
										<option value="P">PC</option>
										<option value="M">MOBILE</option>
									</select>
									<select class="select" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1">
										<option value="">1차카테고리</option>
									</select>
									<select class="select" id="searchPrdCtgDepth2" name="searchPrdCtgDepth2">
										<option value="">2차카테고리</option>
									</select>
									<select class="select" id="searchPrdCtgDepth3" name="searchPrdCtgDepth3">
										<option value="">3차카테고리</option>
									</select>
									<small class="desc"> * 카테고리 검색은 업체구분를 먼저 선택해주세요.</small>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>검색 조건 초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
							<a href="#none" id="" class="button small"><span>복사</span></a>
							<a href="#none" id="" class="button small"><span>수정</span></a>
							<a href="#none" id="" class="button small"><span>삭제</span></a>
							<a href="#none" id="" class="button small"><span>엑셀 다운로드</span></a>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small primary"><span>태그 일괄수정</span></a>
							<a href="#" class="button small primary"><span>상품 일괄수정</span></a>
							<a href="#" class="button small primary"><span>상품 일괄등록</span></a>
							<a href="#" class="button small primary"><span>상품등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:40px;">
							<col style="width:50px;">
							<col style="width:80px;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:80px;">
							<col style="width:100px;">
							<col style="width:110px;">
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2"><input type="checkbox" class="checkbox checkAll"></th>
								<th rowspan="2">NO</th>
								<th rowspan="2">이미지</th>
								<th rowspan="2">상품명<br>(상품코드)</th>
								<th colspan="2">판매가</th>
								<th colspan="2">배송비</th>
								<th>네이버쇼핑</th>
								<th rowspan="2">할인율</th>
								<th rowspan="2">상품유형</th>
								<th rowspan="2">등록일</th>
								<th rowspan="2">보류사유</th>
							</tr>
							<tr>
								<th>진열</th>
								<th>판매</th>
								<th>승인</th>
								<th>판매가능수량</th>
								<th>다음 쇼핑노하우</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="13">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="13">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td rowspan="2"><input type="checkbox" name="" id="" class="checkbox"></td>
								<td rowspan="2">47<br><a href="#">[수정]</a></td>
								<td rowspan="2"><img src="" alt=""></td>
								<td rowspan="2"><input type="text" name="" id="" class="text xlarge"><br><a href="#">(S0011956)</a></td>
								<td colspan="2"><input type="text" name="" id="" class="text"></td>
								<td colspan="2">
									<select name="" id="" class="select">
										<option value="" selected>2,500</option>
									</select>
								</td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>YES</option>
									</select>
								</td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>정율(%)</option>
									</select>
								</td>
								<td rowspan="2">일반상품</td>
								<td rowspan="2">2019-12-16</td>
								<td rowspan="2"><a href="#none" id="" class="button small"><span>보류내역보기</span></a></td>
							</tr>
							<tr>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>YES</option>
									</select>
								</td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>미판매</option>
									</select>
								</td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>보류</option>
									</select>
								</td>
								<td><input type="text" name="" id="" class="text"></td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>YES</option>
									</select>
								</td>
								<td><input type="text" name="" id="" class="text"></td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<a href="#none" id="" class="button small changeStatus"><span>진열 ON</span></a>
							<a href="#none" id="" class="button small changeStatus"><span>진열 OFF</span></a>
						</div>
					</div>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>매장관리</span></h2>
					<div class="section-title">
						<h3 class="title"><span>검색</span></h3>
					</div>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
							<col style="width: 40%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>키워드 검색</span></th>
								<td colspan="3">
									<select name="" id="" class="select">
										<option value="" selected>전체</option>
									</select>
									<input type="text" name="" id="" class="text large">
								</td>
							</tr>
							<tr>
								<th><span>지역</span></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>전체</option>
									</select>
								</td>
								<th><span>사용설정</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">젠체</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">사용</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small"><span>삭제</span></a>
							<a href="#" class="button small primary"><span>등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:40px;">
							<col style="width:50px;">
							<col style="width:100px;">
							<col style="width:auto;">
							<col style="width:150px;">
							<col style="width:auto;">
							<col style="width:auto;">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" class="checkbox checkAll"></th>
								<th>번호</th>
								<th>지역</th>
								<th>매장명</th>
								<th>매장 운영시간</th>
								<th>전화번호</th>
								<th>사용설정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="7">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="7">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="" id="" class="checkbox"></td>
								<td>47</td>
								<td>광주</td>
								<td class="al"><a href="#">엔터식스 동탄</a></td>
								<td>11:00 ~ 20:00</td>
								<td>031-123-5678</td>
								<td>사용</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>상품등록</span></h2>
					<h3 class="title"><span>기본정보</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="">상품유형<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<select name="" id="" class="select">
											<option selected>일반</option>
											<option>묶음</option>
											<option>세트</option>
										</select>
									</div>
									<p class="txt_warnning">(상품 등록 후에 수정이 불가능한 항목입니다.)</p>
								</td>
								<th><span>온라인상품코드</span></th>
								<td>시스템 자동생성</td>
							</tr>
							<tr>
								<th><label for="">상품명<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="text" id="" name="" class="text xlarge" maxlength="150">
									</div>
									<p class="txt_warnning">(공백포함 최대 100자이내로 입력해주세요.)</p>
								</td>
								<th><label for="">판매가능수량<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="text" name="" class="number text" maxlength="9"> 개
									</div>
									<p class="txt_warnning">(777 입력 시 수량 제한없음 처리)</p>
								</td>
							</tr>
							<tr>
								<th><label for="">쿠폰적용여부</label></th>
								<td>
									<select name="" id="" class="select">
										<option value="N">NO</option>
										<option value="Y">YES</option>
									</select>
								</td>
								<th><label for="">O2O 여부<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="N">NO</option>
										<option value="Y">YES</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="">네이버 쇼핑<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select class="select" name="" id="">
										<option value="Y">연동함</option>
										<option value="N">연동안함</option>
									</select>
								</td>
								<th><label for="">다음 쇼핑하우<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select class="select" name="" id="">
										<option value="Y">연동함</option>
										<option value="N">연동안함</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="">임직원 할인<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="N">NO</option>
										<option value="Y">YES</option>
									</select>
								</td>
								<th><label for="">제휴사 할인<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="N">NO</option>
										<option value="Y">YES</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>시즌정보<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<div class="tbl_line">
										<label for="">연도</label>
										<select class="select" name="">
											<option value="" selected>선택</option>
											<option>2020</option>
											<option>2021</option>
										</select>
									</div>
									<div class="tbl_line">
										<label for="">시즌</label>
										<select class="select" name="">
											<option value="">선택</option>
											<option value="3006">전체</option>
											<option value="3007">F/W</option>
											<option value="3008">S/S</option>
										</select>
									</div>
								</td>
								<th><label for="">성별<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select class="select" name="" id="">
										<option value="">선택</option>
										<option value="363">남성</option>
										<option value="364">여성</option>
										<option value="3633">유니섹스</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="">포장<i class="require"><em>필수입력</em></i></label></th>
								<td colspan="3">
									<select class="select">
										<option value="N">NO</option>
										<option value="Y">YES</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>셀러룸관리</span></h2>
					<dl class="ui_box_list">
						<dt>셀러룸이란?</dt>
						<dd>
							<ul>
								<li>셀러룸은 입점사 브랜드의 독립적인 공간이며, 입점사의 상품과 콘텐츠를 활용하여 전시할 수 있습니다.</li>
								<li>셀러룸 A와 B의 메뉴 구성은 동일하며 서로 다른 레이아웃으로 구성되어 있습니다.</li>
								<li>최초 설정은 A타입으로 자동 선택되어 있으며, ‘노출여부’를 ‘Y’로 변경하시면 프론트 홈페이지에 자동 노출됩니다.</li>
							</ul>
						</dd>
					</dl>
					<div class="div_area ui cf">
						<div class="div_area_left">
							<h3 class="title"><span>기본정보</span></h3>
						</div>
						<div class="div_area_right">
							<a href="#" class="button small btn_menual_down"><span>메뉴얼 다운로드</span></a>
						</div>
					</div>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>레이아웃<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="">
											<label for="">A타입</label>
										</li>
										<li>
											<input type="radio" name="" id="">
											<label for="">B타입</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>미리보기 이미지</span></th>
								<td>
									<div class="ui_img_view_wrap type_a">
										<ul class="ui_img_view_list">
											<li><img src="/am/img/admin/A_PC.png" alt="A타입 PC 셀러룸 이미지"></li>
											<li><img src="/am/img/admin/A_MO.png" alt="A타입 MOBILE 셀러룸 이미지"></li>
										</ul>
									</div>
									<div class="ui_img_view_wrap type_b">
										<ul class="ui_img_view_list">
											<li><img src="/am/img/admin/B_PC.png" alt="B타입 PC 셀러룸 이미지"></li>
											<li><img src="/am/img/admin/B_MO.png" alt="B타입 MOBILE 셀러룸 이미지"></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>노출여부<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>N</option>
									</select>
									<a href="#none" id="" class="button small"><span>미리보기</span></a>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>전시배너관리A</span></h2>
					<h3 class="title"><span>목록</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:10%;">
							<col style="width:90%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>구분</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" id="" name="" class="radio" checked>
											<label for="" class="label">PC</label>
										</li>
										<li>
											<input type="radio" id="" name="" class="radio">
											<label for="" class="label">MOBILE</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="tree_side_layout">
						<!-- .tree_wrap -->
						<div class="tree_wrap cf">
							<ul id="browser" class="filetree treeview-famfamfam treeview">
								<li class="collapsable lastCollapsable">
									<div class="hitarea collapsable-hitarea lastCollapsable-hitarea"></div>
									<ul>
										<li class="closed collapsable">
											<div class="hitarea closed-hitarea collapsable-hitarea"></div>
											<span class="folder" data-idx="3657" data-level="2">WOMEN</span>
											<ul style="display: block;">
												<li class="closed"><span class="folder" data-idx="3661" data-level="3">상단배너</span></li>
												<li class="closed"><span class="folder" data-idx="3662" data-level="3">2Depth 카테고리</span></li>
												<li class="closed"><span class="folder" data-idx="3663" data-level="3">이벤트/기획전 영상</span></li>
												<li class="closed"><span class="folder" data-idx="3664" data-level="3">이벤트/기획전 배너</span></li>
												<li class="closed last"><span class="folder" data-idx="3665" data-level="3">#  by women</span></li>
											</ul>
										</li>
										<li class="closed collapsable">
											<div class="hitarea closed-hitarea collapsable-hitarea"></div>
											<span class="folder" data-idx="3658" data-level="2">MEN</span>
											<ul style="display: block;">
												<li class="closed"><span class="folder" data-idx="3666" data-level="3">상단배너</span></li>
												<li class="closed"><span class="folder" data-idx="3667" data-level="3">2Depth 카테고리</span></li>
												<li class="closed"><span class="folder" data-idx="3668" data-level="3">이벤트/기획전 영상</span></li>
												<li class="closed"><span class="folder" data-idx="3669" data-level="3">이벤트/기획전 배너</span></li>
												<li class="closed last"><span class="folder" data-idx="3670" data-level="3">#  by women</span></li>
											</ul>
										</li>
										<li class="closed expandable">
											<div class="hitarea closed-hitarea expandable-hitarea"></div>
											<span class="folder" data-idx="3659" data-level="2">LIFE</span>
											<ul style="display: none;"><li class="closed"><span class="folder" data-idx="3671" data-level="3">상단배너</span></li>
												<li class="closed"><span class="folder" data-idx="3672" data-level="3">2Depth 카테고리</span></li>
												<li class="closed"><span class="folder" data-idx="3673" data-level="3">이벤트/기획전 영상</span></li>
												<li class="closed"><span class="folder" data-idx="3674" data-level="3">이벤트/기획전 배너</span></li>
												<li class="closed last"><span class="folder" data-idx="3675" data-level="3">#  by women</span></li>
											</ul>
										</li>
										<li class="closed expandable lastExpandable">
											<div class="hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"></div>
											<span class="folder" data-idx="3660" data-level="2">BEAUTY</span>
											<ul style="display: none;">
												<li class="closed"><span class="folder" data-idx="3676" data-level="3">상단배너</span></li>
												<li class="closed"><span class="folder" data-idx="3677" data-level="3">2Depth 카테고리</span></li>
												<li class="closed"><span class="folder" data-idx="3678" data-level="3">이벤트/기획전 영상</span></li>
												<li class="closed"><span class="folder" data-idx="3679" data-level="3">이벤트/기획전 배너</span></li>
												<li class="closed last"><span class="folder" data-idx="3680" data-level="3">#  by women</span></li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
							<div id="main_con">
								<h3 class="title"><span>셀러룸A 메인 - 상단배너</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">상단배너 : 123*123 (필수1개, 최대1개)</div>
									<div class="text-right">
										<a href="#" class="button small"><span>선택삭제</span></a>
										<a href="#" class="button small primary"><span>등록</span></a>
									</div>
								</div>
								<table class="table-col table-b">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" name="" id="" class="checkbox"></th>
											<th>제목</th>
											<th>전시기간</th>
											<th>잔여기간</th>
											<th>등록일</th>
											<th>사용여부</th>
											<th>보기</th>
											<th>전시순서</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="" id="" class="checkbox"></td>
											<td class="al"><a href="#">가을에는 트렌치코트</a></td>
											<td>2019-10-10 ~ 2019-10-31</td>
											<td>12</td>
											<td>2019-10-05</td>
											<td>
												<select name="" id="" class="select">
													<option value="" selected>사용</option>
													<option value="">미사용</option>
												</select>
											</td>
											<td>
												<a href="#" class="button button-a"><span>배너보기</span></a>
											</td>
											<td>
												<a href="#">△</a>
												<a href="#">▽</a>
											</td>
										</tr>
										<tr>
											<td colspan="8">조회된 데이터가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<h3 class="title"><span>셀러룸A 메인 - #by tag 상품</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">상품 최대 8개</div>
									<div class="text-right">
										<a href="#" class="button small"><span>선택삭제</span></a>
										<a href="#" class="button small primary"><span>상품등록</span></a>
									</div>
								</div>
								<table class="table-col table-b">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" name="" id="" class="checkbox"></th>
											<th>상품코드</th>
											<th>이미지</th>
											<th>상품명</th>
											<th>판매상태</th>
											<th>노출순위</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="" id="" class="checkbox"></td>
											<td>GYOAX2504</td>
											<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
											<td class="al">폭스 퍼 히든 버튼 덕다운 패딩 점퍼</td>
											<td>판매중</td>
											<td>
												<a href="#">△</a>
												<a href="#">▽</a>
											</td>
										</tr>
										<tr>
											<td colspan="6">조회된 데이터가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<h3 class="title"><span>셀러룸B 메인 - 셀러픽</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">배너사이즈 : 123*123 (최대4개)</div>
									<div class="text-right">
										<a href="#" class="button small"><span>선택삭제</span></a>
										<a href="#" class="button small primary"><span>등록</span></a>
									</div>
								</div>
								<table class="table-col table-b">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox" name="" id="" class="checkbox"></th>
											<th>제목</th>
											<th>등록일</th>
											<th>사용여부</th>
											<th>전시순서</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="" id="" class="checkbox"></td>
											<td class="al"><a href="#">가을에는 트렌치코트</a></td>
											<td>2019-10-05</td>
											<td>
												<select name="" id="" class="select">
													<option value="" selected>사용</option>
													<option value="">미사용</option>
												</select>
											</td>
											<td>
												<a href="#">△</a>
												<a href="#">▽</a>
											</td>
										</tr>
										<tr>
											<td colspan="5">조회된 데이터가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<h3 class="title"><span>배너등록</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">상단배너 : 123*123</div>
								</div>
								<table class="table-row table-a">
									<colgroup>
										<col style="width:20%;">
										<col style="width:80%;">
									</colgroup>
									<tbody>
										<tr>
											<th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<ul class="form_radio_check_list">
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">사용</label>
													</li>
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">미사용</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th><label for="">제목<i class="require"><em>필수입력</em></i></label></th>
											<td><input type="text" name="" id="" class="text xlarge"></td>
										</tr>
										<tr>
											<th><span>셀러픽<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="grid section-button-search">
													<a href="#" id="" class="button button-a"><span>선택삭제</span></a>
													<a href="#" id="" class="button button-a primary"><span>셀러픽등록</span></a>
												</div>
												<table class="table-a table-col">
													<colgroup>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th scope="col"><input type="checkbox" name="" id="" class="checkbox"></th>
															<th scope="col">셀러픽명</th>
															<th scope="col">등록일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td colspan="3">셀러픽 콘텐츠를 등록해 주세요.</td>
														</tr>
														<tr>
															<td><input type="checkbox" name="" id="" class="checkbox"></td>
															<td class="al">2020 S/S 신규 아이템 입고!</td>
															<td>2019-10-05</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<th><span>전시기간<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="tbl_line">
													<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
													<input type="text" class="text" id="" name="" readonly data-target-end="">
													<span>~</span>
													<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
													<input type="text" class="text" id="" name="" readonly data-target-start="">
													<a href="#" class="button button-a xsmall"><span>내일</span></a>
													<a href="#" class="button button-a xsmall"><span>일주일</span></a>
													<a href="#" class="button button-a xsmall"><span>15일</span></a>
													<a href="#" class="button button-a xsmall"><span>한달</span></a>
												</div>
												<p class="txt_warnning">(날짜형식: YYYY-MM-DD) <small class="desc">전시기간은 ‘Today+1일’부터 설정 가능합니다.</small></p>
											</td>
										</tr>
										<tr>
											<th><label for="">배너<i class="require"><em>필수입력</em></i></label></th>
											<td>
												<div class="tbl_line">
													<input type="file" name="" id="" class="file">
												</div>
												<div class="tbl_line">
													<a href="#" class="file_link">WF7A1018.jpg</a>
													<input type="checkbox" name="" id="" class="checkbox">
													<label for="">삭제</label>													
												</div>
											</td>
										</tr>
										<tr>
											<th><span>상품<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="grid section-button-search">
													<a href="#" id="" class="button button-a"><span>선택삭제</span></a>
													<a href="#" id="" class="button button-a primary"><span>상품등록</span></a>
												</div>
												<table class="table-a table-col">
													<colgroup>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th scope="col"><input type="checkbox" name="" id="" class="checkbox"></th>
															<th scope="col">상품코드</th>
															<th scope="col">이미지</th>
															<th scope="col">상품명</th>
															<th scope="col">판매상태</th>
															<th scope="col">등록일</th>
															<th scope="col">전시순서</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td colspan="7">배너 이미지 등록 후 상품을 등록해 주세요.</td>
														</tr>
														<tr>
															<td><input type="checkbox" name="" id="" class="checkbox"></td>
															<td>GYOAX2504</td>
															<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt="" alt=""></td>
															<td class="al">폭스 퍼 히든 버튼 덕다운 폭스 퍼 히든 버튼 덕다운 폭스 퍼 히든 버튼 덕다운</td>
															<td>판매중</td>
															<td>2019-10-05</td>
															<td>
																<a href="#">△</a>
																<a href="#">▽</a>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<th><span>URL</span></th>
											<td>
												<ul class="form_radio_check_list">
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">링크없음</label>
													</li>
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">현재창</label>
													</li>
													<li>
														<input type="radio" name="" id="" class="radio">
														<label for="">새창열림</label>
													</li>
												</ul>
												<div class="tbl_line">
													<input type="text" name="" id="" class="text xlarge">
												</div>
												<p class="txt_warnning">* 팝업에 등록되는 배너는 현재창으로 링크가 안됩니다.</p>
											</td>
										</tr>
										<tr>
											<th><span>대체 텍스트</span></th>
											<td><textarea name="" id="" class="textarea"></textarea></td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<h3 class="title"><span>셀러룸 메인 – #by tag</span></h3>
								<div class="grid section-button-list">
									<div class="text-left">(태그 최대 20개)</div>
								</div>
								<table class="table-row table-a">
									<colgroup>
										<col style="width:20%;">
										<col style="width:80%;">
									</colgroup>
									<tbody>
										<tr>
											<th><span>TAG<i class="require"><em>필수입력</em></i></span></th>
											<td>
												<div class="tag_cloud_wrap_side cf">
													<div class="tag_cloud_wrap">
														<ul class="tag_cloud_list">
															<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
															<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
														</ul>
													</div>
													<button type="button" class="btn_tag_select">TAG 선택</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="section-button">
									<div class="wrap text-center">
										<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
									</div>
								</div>
							</div>
						</div>
						<!-- // .tree_wrap -->
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h3 class="title"><span>셀러픽검색</span></h3>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages">(총 <strong class="em">5</strong>건, 1 of 1 page)</span>
						</div>
					</div>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:50px;">
							<col style="width:auto;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" id="" class="checkbox"></th>
								<th>제목</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="" id="" class="checkbox"></td>
								<td class="al"><a href="#">2020 S/S 신규 아이템 입고!</a></td>
								<td>2020-01-07 22:22:22</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>취소</span></a>
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>매장등록</span></h2>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="">매장명<i class="require"><em>필수입력</em></i></label></th>
								<td><input type="text" name="" id="" class="text large"></td>
							</tr>
							<tr>
								<th><label for="">지역<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>선택</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>전화번호<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<select name="" id="" class="select">
										<option value="N">NO</option>
										<option value="Y">YES</option>
									</select>
									<span>-</span>
									<input type="text" name="" id="" class="text">
									<span>-</span>
									<input type="text" name="" id="" class="text">
								</td>
							</tr>
							<tr>
								<th><span>매장주소<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<div class="tbl_line">
										<input type="text" name="" id="" class="text">
										<a href="#" class="button button-a"><span>우편번호 찾기</span></a>
									</div>
									<div class="tbl_line">
										<input type="text" name="" id="" class="text half">
										<input type="text" name="" id="" class="text large" placeholder="나머지 주소 입력">
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">매장 운영시간<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>선택</option>
									</select>
									<span>~</span>
									<select name="" id="" class="select">
										<option value="" selected>선택</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>사용설정<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">사용</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>목록</span></a>
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>미디어관리</span></h2>
					<div class="section-title">
						<h3 class="title"><span>검색</span></h3>
					</div>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
							<col style="width: 40%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>등록일</span></th>
								<td colspan="3">
									<div class="tbl_line">
										<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text" id="" name="" readonly="" data-target-end="">
										<span>~</span>
										<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text" id="" name="" readonly="" data-target-start="">
										<a href="#" class="button button-a xsmall"><span>오늘</span></a>
										<a href="#" class="button button-a xsmall"><span>일주일</span></a>
										<a href="#" class="button button-a xsmall"><span>15일</span></a>
										<a href="#" class="button button-a xsmall"><span>한달</span></a>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>제목</span></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
								<th><span>전시상태</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">젠체</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">전시</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미전시</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small primary"><span>등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:40px;">
							<col style="width:auto;">
							<col style="width:150px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>영상제먹</th>
								<th>등록일</th>
								<th>전시여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="4">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="4">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="al"><a href="#">가을을 열어보다.</a></td>
								<td>2019-01-02 09:23:12</td>
								<td>전시</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>미디어관리</span></h2>
					<h3 class="title"><span>등록</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>매장명<i class="require"><em>필수입력</em></i></span></th>
								<td>admin(관리자)</td>
							</tr>
							<tr>
								<th><span>전시여부<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">전시</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미전시</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><label for="">영상 제목<i class="require"><em>필수입력</em></i></label></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
							</tr>
							<tr>
								<th><label for="">유투브URL<i class="require"><em>필수입력</em></i></label></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
							</tr>
							<tr>
								<th><label for="">PC 목록 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line">
										이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
									</div>
									<div class="tbl_line">
										<span>대체텍스트</span>
										<input type="text" name="" id="" class="text half">
										<span>(0/20자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line">
										이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
									</div>
									<div class="tbl_line">
										<span>대체텍스트</span>
										<input type="text" name="" id="" class="text half">
										<span>(0/20자)</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>목록</span></a>
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>룩북관리</span></h2>
					<div class="section-title">
						<h3 class="title"><span>검색</span></h3>
					</div>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
							<col style="width: 40%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>등록일</span></th>
								<td colspan="3">
									<div class="tbl_line">
										<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text" id="" name="" readonly="" data-target-end="">
										<span>~</span>
										<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text" id="" name="" readonly="" data-target-start="">
										<a href="#" class="button button-a xsmall"><span>오늘</span></a>
										<a href="#" class="button button-a xsmall"><span>일주일</span></a>
										<a href="#" class="button button-a xsmall"><span>15일</span></a>
										<a href="#" class="button button-a xsmall"><span>한달</span></a>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>제목</span></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
								<th><span>전시상태</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">젠체</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">전시</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미전시</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>시즌정보</span></th>
								<td colspan="3">
									<select name="" id="" class="select">
										<option value="" selected>전체</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small primary"><span>등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:30px;">
							<col style="width:50px;">
							<col style="width:100px;">
							<col style="width:80px;">
							<col style="width:auto;">
							<col style="width:150px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" id="" class="checkbox"></th>
								<th>번호</th>
								<th>시즌정보</th>
								<th>이미지</th>
								<th>제목</th>
								<th>등록일</th>
								<th>전시여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="7">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="7">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="" id="" class="checkbox"></td>
								<td>3</td>
								<td>2020S/S</td>
								<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
								<td class="al"><a href="#">가을을 열어보다.</a></td>
								<td>2019-01-02 09:23:12</td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>전시</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>룩북관리</span></h2>
					<h3 class="title"><span>등록</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>작성자</span></th>
								<td>admin(관리자)</td>
							</tr>
							<tr>
								<th><span>전시여부</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">전시</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미전시</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><label for="">시즌정보<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>선택</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>이미지 제목<i class="require"><em>필수입력</em></i></span></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
							</tr>
							<tr>
								<th><label for="">PC 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="file" name="" id="" multiple class="file">
									</div>
									<div class="tbl_line">
										이미지 파일은 최대 10개까지 등록하실 수 있습니다.
									</div>
									<ul class="ui_attatch_file_list cf">
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><label for="">MOBILE 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<input type="file" name="" id="" multiple class="file">
									</div>
									<div class="tbl_line">
										이미지 파일은 최대 10개까지 등록하실 수 있습니다.
									</div>
									<ul class="ui_attatch_file_list cf">
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
										<li>
											<img src="https://via.placeholder.com/438x657.png?text=thum" alt="">
											<button type="button" class="button">X</button>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>등록일</span></th>
								<td>2018-12-02 09:23:12 </td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>목록</span></a>
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
							<a href="javascript:;" id="" class="button warning"><span>삭제</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>셀러픽관리</span></h2>
					<div class="section-title">
						<h3 class="title"><span>검색</span></h3>
					</div>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 90%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>등록일</span></th>
								<td>
									<div class="tbl_line">
										<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text" id="" name="" readonly="" data-target-end="">
										<span>~</span>
										<a href="#" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" class="text" id="" name="" readonly="" data-target-start="">
										<a href="#" class="button button-a xsmall"><span>오늘</span></a>
										<a href="#" class="button button-a xsmall"><span>일주일</span></a>
										<a href="#" class="button button-a xsmall"><span>15일</span></a>
										<a href="#" class="button button-a xsmall"><span>한달</span></a>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>상태</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">젠체</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">사용</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>키워드</span></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small primary"><span>등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:40px;">
							<col style="width:auto;">
							<col style="width:150px;">
							<col style="width:100px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>좋아요수</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="5">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="5">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="al"><a href="#">오랜만에 PICK!(feat. 여행가는 날)</a></td>
								<td>2019-01-02 09:23:12</td>
								<td>208</td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>사용</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>셀러픽관리</span></h2>
					<h3 class="title"><span>등록</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>작성자</span></th>
								<td>admin(관리자)</td>
							</tr>
							<tr>
								<th><label for="">제목<i class="require"><em>필수입력</em></i></label></th>
								<td><input type="text" name="" id="" class="text xlarge"></td>
							</tr>
							<tr>
								<th><label for="">설명<i class="require"><em>필수입력</em></i></label></th>
								<td><textarea name="" id="" class="textarea"></textarea></td>
							</tr>
							<tr>
								<th><span>일반 TAG<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<div class="tag_cloud_wrap_side cf">
										<div class="tag_cloud_wrap">
											<ul class="tag_cloud_list">
												<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#힙<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#청<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#흐그극<button type="button" class="btn_del">X</button></li>
												<li class="sel_tag_list txt">#포도<button type="button" class="btn_del">X</button></li>
											</ul>
										</div>
										<button type="button" class="btn_tag_select">TAG 선택</button>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">대표 TAG<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>선택</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="">PC 목록 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<a href="#" class="file_link">WF7A1018.jpg</a>
										<input type="checkbox" name="" id="" class="checkbox">
										<label for="">삭제</label>
									</div>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line">
										이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
									</div>
									<div class="tbl_line">
										<span>대체텍스트</span>
										<input type="text" name="" id="" class="text half">
										<span>(0/20자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<a href="#" class="file_link">WF7A1018.jpg</a>
										<input type="checkbox" name="" id="" class="checkbox">
										<label for="">삭제</label>
									</div>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line">
										이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB
									</div>
									<div class="tbl_line">
										<span>대체텍스트</span>
										<input type="text" name="" id="" class="text half">
										<span>(0/20자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>상세 타입<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">이미지</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">에디터</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">스크립트</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><label for="">PC 상세 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<a href="#" class="file_link">WF7A1018.jpg</a>
										<input type="checkbox" name="" id="" class="checkbox">
										<label for="">삭제</label>
									</div>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line">
										이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB / 이미지 최대 10개 등록
									</div>
									<div class="tbl_line">
										<span>대체텍스트</span>
										<input type="text" name="" id="" class="text half">
										<span>(0/20자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<a href="#" class="file_link">WF7A1018.jpg</a>
										<input type="checkbox" name="" id="" class="checkbox">
										<label for="">삭제</label>
									</div>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line">
										이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB / 이미지 최대 10개 등록
									</div>
									<div class="tbl_line">
										<span>대체텍스트</span>
										<input type="text" name="" id="" class="text half">
										<span>(0/20자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>전시여부</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">전시</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미전시</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<h3 class="title"><span>상품구성</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>관련상품</span></th>
								<td>
									<div class="grid section-button-search">
										<a href="#" id="" class="button button-a"><span>선택삭제</span></a>
										<a href="#" id="" class="button button-a primary"><span>상품검색</span></a>
									</div>
									<table class="table-row table-a">
										<colgroup>
											<col style="width:40px;">
											<col style="width:100px;">
											<col style="width:100px;">
											<col style="width:auto">
											<col style="width:100px;">
											<col style="width:100px;">
											<col style="width:100px;">
											<col style="width:100px;">
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="" id="" class="checkbox"></th>
												<th>상품코드</th>
												<th>이미지</th>
												<th>상품명</th>
												<th>브랜드</th>
												<th>판매가</th>
												<th>판매상태</th>
												<th>전시순서</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="td_no_result ac" colspan="8">조회된 데이터가 없습니다.</td>
											</tr>
											<tr>
												<td class="ac"><input type="checkbox" name="" id="" class="checkbox"></td>
												<td class="ac"><a href="#">PYFAI4229</a></td>
												<td class="ac"><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
												<td class="al"><a href="#">[SIEG◆1212][30%쿠폰]브라운</a></td>
												<td class="ac">SIEG</td>
												<td class="ac">4,999,999</td>
												<td class="ac">판매중</td>
												<td class="ac">
													<a href="#">△</a>
													<a href="#">▽</a>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>목록</span></a>
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>상품일괄업로드</span></h2>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>파일첨부</span></th>
								<td>
									<div class="tbl_line cf">
										<input type="file" name="" id="" class="file fl">
										<a href="#" id="" class="button button-a fr"><span>샘플 다운로드</span></a>
									</div>
									<div class="tbl_line cf">
										<p class="txt_warnning fl">* xls 파일만 첨부 할 수 있습니다.</p>
										<a href="#" id="" class="button button-a primary fr"><span>적용</span></a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
							</colgroup>
						<tbody>
							<tr>
								<th><span>처리결과</span></th>
								<td>
									<div class="tbl_line cf">
										<span class="fl">전체 업로드 상품수 : 581개</span>
										<a href="#" class="button button-a fr"><span>결과 다운로드</span></a>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>성공개수</span></th>
								<td>578개</td>
							</tr>
							<tr>
								<th><span>실패개수</span></th>
								<td>
									<p>3개</p>
									<div>
										<p>■ 실패상세내역</p>
										<table class="table-col table-a">
											<colgroup>
												<col />
												<col />
											</colgroup>
											<thead>
												<tr>
													<th>NO</th>
													<th>엑셀 행번호</th>
													<th>상품명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>3</td>
													<td>81</td>
													<td>사선 디테일 하이넥 후드 오리털 패딩 점퍼</td>
												</tr>
												<tr>
													<td>2</td>
													<td>109</td>
													<td>영문 레터링 체크 패턴 투 버튼 코트</td>
												</tr>
												<tr>
													<td>1</td>
													<td>572</td>
													<td>다운 모피 퍼 럭셔리 워밍 점퍼</td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>닫기</span></a>
						</div>
					</div>
					<div class="popup_info">
						<dl>
							<dt>유의사항</dt>
							<dd>
								· CSV 파일 등록 시 샘플 엑셀 파일의 '쇼핑몰상품명/세트상품여부/set_product1/set_product2/네이버지식쇼핑/컬러관리/성별' 을 입력 후 [파일등록] 버튼 클릭 시 선택된 세트상품이 일괄 등록됩니다.
								<ol>
									<li>세트 상품 ERP 코드 : 자동 생성되므로 등록시에는 값을 넣지 마세요.</li>
									<li>쇼핑몰상품명 : 상품의 기본 상품명을 설정할 수 있습니다.</li>
									<li>세트상품여부 : 상품의 세트여부를 설정할 수 있습니다. (Y : 기본값)</li>
									<li>set_product1* : 숫자 9자리의 1번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
									<li>set_product2* : 숫자 9자리의 2번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
									<li>네이버지식쇼핑 : 네이버쇼핑 노출여부를 설정할 수 있습니다. (Y : 노출, N : 노출안함)</li>
									<li>컬러관리 : 상품의 컬러옵션을 설정할 수 있습니다.</li>
									<li>성별 : 상품의 주요 사용 성별을 설정할 수 있습니다. (M : 남성, W : 여성, F : 유니섹스)</li>
								</ol>
							</dd>
						</dl>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>상품일괄수정</span></h2>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>파일첨부</span></th>
								<td>
									<div class="tbl_line">
										<input type="file" name="" id="" class="file">
									</div>
									<div class="tbl_line cf">
										<p class="txt_warnning fl">* xls 파일만 첨부 할 수 있습니다.</p>
										<a href="#" id="" class="button button-a primary fr"><span>적용</span></a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
							</colgroup>
						<tbody>
							<tr>
								<th><span>처리결과</span></th>
								<td>
									<div class="tbl_line cf">
										<span class="fl">전체 업로드 상품수 : 581개</span>
										<a href="#" class="button button-a fr"><span>결과 다운로드</span></a>
									</div>
								</td>
							</tr>
							<tr>
								<th><span>성공개수</span></th>
								<td>578개</td>
							</tr>
							<tr>
								<th><span>실패개수</span></th>
								<td>
									<p>3개</p>
									<div>
										<p>■ 실패상세내역</p>
										<table class="table-col table-a">
											<colgroup>
												<col />
												<col />
											</colgroup>
											<thead>
												<tr>
													<th>NO</th>
													<th>엑셀 행번호</th>
													<th>상품명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>3</td>
													<td>81</td>
													<td>사선 디테일 하이넥 후드 오리털 패딩 점퍼</td>
												</tr>
												<tr>
													<td>2</td>
													<td>109</td>
													<td>영문 레터링 체크 패턴 투 버튼 코트</td>
												</tr>
												<tr>
													<td>1</td>
													<td>572</td>
													<td>다운 모피 퍼 럭셔리 워밍 점퍼</td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>닫기</span></a>
						</div>
					</div>
					<div class="popup_info">
						<dl>
							<dt>유의사항</dt>
							<dd>
								· CSV 파일 등록 시 샘플 엑셀 파일의 '쇼핑몰상품명/세트상품여부/set_product1/set_product2/네이버지식쇼핑/컬러관리/성별' 을 입력 후 [파일등록] 버튼 클릭 시 선택된 세트상품이 일괄 등록됩니다.
								<ol>
									<li>세트 상품 ERP 코드 : 자동 생성되므로 등록시에는 값을 넣지 마세요.</li>
									<li>쇼핑몰상품명 : 상품의 기본 상품명을 설정할 수 있습니다.</li>
									<li>세트상품여부 : 상품의 세트여부를 설정할 수 있습니다. (Y : 기본값)</li>
									<li>set_product1* : 숫자 9자리의 1번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
									<li>set_product2* : 숫자 9자리의 2번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
									<li>네이버지식쇼핑 : 네이버쇼핑 노출여부를 설정할 수 있습니다. (Y : 노출, N : 노출안함)</li>
									<li>컬러관리 : 상품의 컬러옵션을 설정할 수 있습니다.</li>
									<li>성별 : 상품의 주요 사용 성별을 설정할 수 있습니다. (M : 남성, W : 여성, F : 유니섹스)</li>
								</ol>
							</dd>
						</dl>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>배송/교환/반품정보 관리</span></h2>
					<div class="section-title">
						<h3 class="title"><span>검색</span></h3>
					</div>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 90%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>입점사 검색</span></th>
								<td><input type="text" class="text xlarge" id="" name=""></td>
							</tr>
							<tr>
								<th><span>사용여부</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">젠체</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">사용</label>
										</li>
										<li>
											<input type="radio" name="" id="" class="radio">
											<label for="">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small primary"><span>등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:70px;">
							<col style="width:auto;">
							<col style="width:250px;">
							<col style="width:150px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>입점사명</th>
								<th>전시기간</th>
								<th>등록일자</th>
								<th>사용여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="5">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="5">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="al"><a href="#">입점사 A</a></td>
								<td>2019-12-25 21:11 ~ 2019-12-25 21:11</td>
								<td>2019-12-25 21:11:11</td>
								<td>사용</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>배송/교환/반품정보 상세</span></h2>
					<h3 class="title"><span>배송/교환/반품정보</span></h3>
					<div class="grid section-button-search">
						<a href="#" class="button small primary"><span>추가</span></a>
						<a href="#" class="button small"><span>삭제</span></a>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col style="width:40px;">
							<col style="width:auto;">
							<col style="width:400px;">
							<col style="width:100px;">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" id="" class="checkbox"></th>
								<th>제목</th>
								<th>내용</th>
								<th>노출여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="" id="" class="checkbox"></td>
								<td><input type="text" name="" id="" class="text large"></td>
								<td><textarea name="" id="" class="textarea">블랴 블랴</textarea></td>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>Y</option>
										<option value="" selected>N</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button primary"><span>저장</span></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>매장선택</span></h2>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>매장선택</span></a>
					</div>
					<div class="tbl_scroll">
						<table class="table-col table-b">
							<colgroup>
								<col style="width:40px;">
								<col style="width:auto;">
								<col style="width:100px;">
							</colgroup>
							<thead>
								<tr>
									<th>선택</th>
									<th>매장명</th>
									<th>재고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">현대(아)가산</label>
											<span>거절</span>
										</div>
									</td>
									<td>3</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">롯데포항</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">현대신촌</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">AK분당</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">롯데김포공항</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">롯데(아)고양(SG)</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">롯데(아)기흥(SG)</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">롯데본점</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">롯데울산</label>
										</div>
									</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="radio" name="" id="" class="radio"></td>
									<td>
										<div class="shop_select_wrap">
											<label for="">현대COEX</label>
										</div>
									</td>
									<td>2</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>쿠폰발행내역</span></h2>
					<h3 class="title"><span>목록</span></h3>
					<table cellspacing="0" class="table-row table-a" style="margin-bottom:0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 24%;">
							<col style="width: 10%;">
							<col style="width: 23%;">
							<col style="width: 10%;">
							<col style="width: 23%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>쿠폰종류</span></th>
								<td>
									<select id="searchCpnMstGbn" name="searchCpnMstGbn" class="select xlarge" title="쿠폰종류">
										<option value="">전체</option>
										<option value="A">일반</option>
										<option value="B">생일</option>
										<option value="C">첫구매</option>
										<option value="D">회원등급</option>
										<option value="E">회원가입</option>
										<option value="F">배송비무료</option>
										<option value="G">제휴</option>
									</select>
								</td>
								<th><span>쿠폰명</span></th>
								<td>
									<input type="text" name="searchCpnMstTitle" id="searchCpnMstTitle" class="text xlarge" value="">
								</td>
								<th><span>쿠폰번호</span></th>
								<td>
									<input type="text" name="searchCpnMstIdx" id="searchCpnMstIdx" class="text xlarge" value="">
								</td>
							</tr>
							<tr>
								<th><span>발급방식</span></th>
								<td>
									<select id="searchCpnMstIsuGbn" name="searchCpnMstIsuGbn" class="select xlarge" title="발급방식">
										<option value="">전체</option>
										<option value="A">자동발급</option>
										<option value="B">운영자수동발급</option>
										<option value="C">다운로드발급</option>
									</select>
								</td>
								<th><span>대상채널</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" id="shoppingChannerA" name="searchCpnMstShopType" class="radio" checked="checked" value="">
											<label for="shoppingChannerA">전체</label>
										</li>
										<li>
											<input type="radio" id="shoppingChannerB" name="searchCpnMstShopType" class="radio" value="PC">
											<label for="shoppingChannerB">PC</label>
										</li>
										<li>
											<input type="radio" id="shoppingChannerC" name="searchCpnMstShopType" class="radio" value="MOBILE">
											<label for="shoppingChannerC">MOBILE</label>
										</li>
									</ul>        
								</td>
								<th><span>상태</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" id="stateA" name="searchCpnMstUseYn" class="radio" checked="checked" value="">
											<label for="stateA">전체</label>
										</li>
										<li>
											<input type="radio" id="stateB" name="searchCpnMstUseYn" class="radio" value="Y">
											<label for="stateB">사용</label>
										</li>
										<li>
											<input type="radio" id="stateC" name="searchCpnMstUseYn" class="radio" value="N">
											<label for="stateC">중지</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><span>기간검색</span></th>
								<td colspan="5">
									<select id="searchCpnMstSeDt" name="searchCpnMstSeDt" class="select" title="기간검색">
										<option value="A">등록일</option>
										<option value="B">발급기간</option>
									</select>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchCpnMstStDt" name="searchCpnMstStDt" value="" readonly="readonly" data-target-end="#searchCpnMstEdDt"> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchCpnMstEdDt" name="searchCpnMstEdDt" value="" readonly="readonly" data-target-start="#searchCpnMstStDt">
									<a href="javascript:fnDateReset('searchCpnMstEdDt', 'searchCpnMstStDt');" class="button button-a xsmall"><span>전체</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
						<a href="#none" id="search" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list">
						<div class="col-1-2 text-left">
							<select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수">
								<option value="20">20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages">(총 <strong class="em"></strong>건,  of  page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#none" id="" class="button small"><span>엑셀 내려받기</span></a>
						</div>		
					</div>
					<table cellspacing="0" class="table-col table-b">
						<colgroup>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" id="" class="checkbox"></th>
								<th>쿠폰번호</th>
								<th>쿠폰종류</th>
								<th>쿠폰명</th>
								<th>할인금액/율<br>최대할인금액</th>
								<th>발급(등록)기간</th>
								<th>사용기간</th>
								<th>발급수량</th>
								<th>사용수량</th>                                
								<th>상태</th>
								<th>적용채널</th>
								<th>등록자</th>
								<th>등록일</th>
								<th>발행</th>
							</tr>
						</thead>
						<tbody id="list-field">
							<tr>
								<td class="td_no_result" colspan="14">조건을 선택하신 후, 검색해 주세요</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="" id="" class="checkbox"></td>
								<td>ETLDIU834</td>
								<td>일반</td>
								<td class="al"><a href="#">APP전용 10% 쿠폰</a></td>
								<td>10%<br>(10,000)</td>
								<td>2019-12-01 ~ 2019-12-30</td>
								<td>발급일로부터 10일</td>
								<td>8,000</td>
								<td>1,500</td>
								<td>사용</td>
								<td>MOBILE</td>
								<td>슈퍼관리자</td>
								<td>2019-12-01</td>
								<td><a href="#" class="button">발행</a></td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a>
							<a class="ir prev" href="javascript:;"><em>이전 페이지</em></a>
							<strong>1<span class="semantic">&nbsp;페이지 - 현재 위치</span></strong>
							<a href="javascript:;" onclick="goPage(2); return false;">2</a>
							<a href="javascript:;" onclick="goPage(3); return false;">3</a>
							<a href="javascript:;" onclick="goPage(4); return false;">4</a>
							<a href="javascript:;" onclick="goPage(5); return false;">5</a>
							<a href="javascript:;" onclick="goPage(6); return false;">6</a>
							<a href="javascript:;" onclick="goPage(7); return false;">7</a>
							<a href="javascript:;" onclick="goPage(8); return false;">8</a>
							<a href="javascript:;" onclick="goPage(9); return false;">9</a>
							<a href="javascript:;" onclick="goPage(10); return false;">10</a>
							<a class="ir next" href="javascript:;" onclick="goPage(11); return false;"><em>다음 페이지</em></a>
							<a class="ir last" href="javascript:;" onclick="goPage(110); return false;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>쿠폰발행내역</span></h2>
					<div class="tab-list">
						<ul>
							<li class="in"><a href="#"><span>발행내역</span></a></li>
							<li><a href="#"><span>관리자발급</span></a></li>
						</ul>
					</div>
					<h3 class="title"><span>온라인쿠폰발행내역</span></h3>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 90%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>쿠폰번호</span></th>
								<td>ETLDIU834</td>
							</tr>
							<tr>
								<th><span>쿠폰종류</span></th>
								<td>일반</td>
							</tr>
							<tr>
								<th><span>쿠폰명</span></th>
								<td>APP전용 10% 쿠폰</td>
							</tr>
						</tbody>
					</table>
					<h3 class="title"><span>쿠폰발급 받은 회원 목록</span></h3>
					<div class="grid section-button-list">
						<div class="col-1-2 text-left">
							<select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수">
								<option value="20">20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages">(총 <strong class="em"></strong>건,  of  page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#none" id="goForm" class="button small"><span>엑셀 내려받기</span></a>
						</div>		
					</div>
					<table cellspacing="0" class="table-col table-b">
						<colgroup>
							<col style="width:70px;">
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>발급일</th>
								<th>사용일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="5">조건을 선택하신 후, 검색해 주세요</td>
							</tr>
							<tr>
								<td>1</td>
								<td>오수*</td>
								<td><a href="#">dhtndud</a></td>
								<td>2019-12-25 11:20:15</td>
								<td>2019-12-27 11:20:15</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a>
							<a class="ir prev" href="javascript:;"><em>이전 페이지</em></a>
							<strong>1<span class="semantic">&nbsp;페이지 - 현재 위치</span></strong>
							<a href="javascript:;" onclick="goPage(2); return false;">2</a>
							<a href="javascript:;" onclick="goPage(3); return false;">3</a>
							<a href="javascript:;" onclick="goPage(4); return false;">4</a>
							<a href="javascript:;" onclick="goPage(5); return false;">5</a>
							<a href="javascript:;" onclick="goPage(6); return false;">6</a>
							<a href="javascript:;" onclick="goPage(7); return false;">7</a>
							<a href="javascript:;" onclick="goPage(8); return false;">8</a>
							<a href="javascript:;" onclick="goPage(9); return false;">9</a>
							<a href="javascript:;" onclick="goPage(10); return false;">10</a>
							<a class="ir next" href="javascript:;" onclick="goPage(11); return false;"><em>다음 페이지</em></a>
							<a class="ir last" href="javascript:;" onclick="goPage(110); return false;"><em>끝 페이지</em></a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>쿠폰발행내역</span></h2>
					<div class="tab-list">
						<ul>
							<li><a href="#"><span>발행내역</span></a></li>
							<li class="in"><a href="#"><span>관리자발급</span></a></li>
						</ul>
					</div>
					<h3 class="title"><span>온라인쿠폰발행내역</span></h3>
					<table class="table-row table-a" style="margin-bottom: 0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 90%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>쿠폰번호</span></th>
								<td>ETLDIU834</td>
							</tr>
							<tr>
								<th><span>쿠폰종류</span></th>
								<td>일반</td>
							</tr>
							<tr>
								<th><span>쿠폰명</span></th>
								<td>APP전용 10% 쿠폰</td>
							</tr>
						</tbody>
					</table>
					<h3 class="title"><span>관리자발급</span></h3>
					<div class="grid section-button-list">
						<div class="text-right">
							<a href="#none" id="" class="button small"><span>회원검색</span></a>
							<a href="#none" id="" class="button small"><span>파일선택</span></a>
						</div>		
					</div>
					<table cellspacing="0" class="table-col table-b">
						<colgroup>
							<col style="width:70px;">
							<col style="width:70px;">
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" id="" class="checkbox"></th>
								<th>번호</th>
								<th>고객명</th>
								<th>아이디</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="4">조건을 선택하신 후, 검색해 주세요</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="" id="" class="checkbox"></td>
								<td>1</td>
								<td>오수*</td>
								<td>dhtndud</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-list">
						<div class="text-right">
							<a href="#none" id="" class="button small"><span>쿠폰발급</span></a>
							<a href="#none" id="" class="button small"><span>목록</span></a>
						</div>		
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<h2 class="title"><span>주문번호검색</span></h2>
					<h3 class="title"><span>목록</span></h3>
					<table cellspacing="0" class="table-row table-a" style="margin-bottom:0;">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
							<col style="width: 40%;">
						</colgroup>
						<tbody>
							<tr>
								<th><span>주문통합검색</span></th>
								<td colspan="3">
									<select name="" id="" class="select">
										<option value="" selected>주문상태 선택</option>
									</select>
									<select name="" id="" class="select">
										<option value="" selected>배송구분 선택</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span>주문일자</span></th>
								<td colspan="3">
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchCpnMstStDt" name="searchCpnMstStDt" value="" readonly="readonly" data-target-end="#searchCpnMstEdDt"> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchCpnMstEdDt" name="searchCpnMstEdDt" value="" readonly="readonly" data-target-start="#searchCpnMstStDt">
									<a href="javascript:fnDateReset('searchCpnMstEdDt', 'searchCpnMstStDt');" class="button button-a xsmall"><span>전체</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('searchCpnMstEdDt', 'searchCpnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
								</td>
							</tr>
							<tr>
								<th><span>주문자</span></th>
								<td>
									<input type="text" name="" id="" class="text xlarge">
								</td>
								<th><span>수령인명</span></th>
								<td>
									<input type="text" name="" id="" class="text xlarge">    
								</td>
							</tr>
							<tr>
								<th><span>상품품번</span></th>
								<td>
									<input type="text" name="" id="" class="text xlarge">
								</td>
								<th><span>주문번호</span></th>
								<td>
									<input type="text" name="" id="" class="text xlarge">    
								</td>
							</tr>
							<tr>
								<th><span>상품명</span></th>
								<td colspan="3">
									<input type="text" name="" id="" class="text xlarge">  
								</td>
							</tr>
							<tr>
								<th><span>아이디</span></th>
								<td>
									<input type="text" name="" id="" class="text xlarge">
								</td>
								<th><span>연락처</span></th>
								<td>
									<input type="text" name="" id="" class="text xlarge">    
								</td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary"><span>검색</span></a>
					</div>
					<div class="grid section-button-list btn_many">
						<div class="col-1-2 text-left">
							<select class="select" id="" name="" title="상품 보기 개수">
								<option value="20" selected="">20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages"> (총 <strong class="em">0</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="#" class="button small primary"><span>등록</span></a>
						</div>
					</div>
					<table class="table-col table-b">
						<colgroup>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="" id="" class="checkbox"></th>
								<th>주문일시<br>(주문번호)</th>
								<th>주문자</th>
								<th>수령인</th>
								<th>이미지</th>
								<th>상품/옵션정보</th>
								<th>상품가격</th>
								<th>수량</th>
								<th>결제금액</th>
								<th>결제수단</th>
								<th>배송구분</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td_no_result" colspan="12">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td class="td_no_result" colspan="12">조회된 데이터가 없습니다.</td>
							</tr>
							<tr>
								<td rowspan="2"><input type="checkbox" name="" id="" class="checkbox"></td>
								<td rowspan="2">2019-11-25 16:56:00<br><a href="#">(201911260A)</a></td>
								<td rowspan="2">소지섭 (ididid) 회원</td>
								<td rowspan="2">소지섭</td>
								<td><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
								<td><a href="#">이태리 블루 라운드 니트 (PWUCI8009)</a><br>COLOR : BL / SIZE : 100</td>
								<td>185,700</td>
								<td>1</td>
								<td>185,700</td>
								<td>계좌이체</td>
								<td>일반택배</td>
								<td>결제완료</td>
							</tr>
							<tr>
								<td class="border-left"><img src="https://via.placeholder.com/70x70.png?text=thum" alt=""></td>
								<td><a href="#">이태리 블루 라운드 니트 (PWUCI8009)</a><br>COLOR : BL / SIZE : 100</td>
								<td>185,700</td>
								<td>1</td>
								<td>185,700</td>
								<td>계좌이체</td>
								<td>일반택배</td>
								<td>결제완료</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a> <a class="ir prev" href="javascript:;"><em>이전 페이지</em></a> <strong>1 <span class="semantic">&nbsp;페이지 - 현재 위치</span></strong> <a class="ir next" href="javascript:;"><em>다음 페이지</em></a> <a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="" class="button"><span>취소</span></a>
							<a href="javascript:;" id="" class="button primary"><span>선택</span></a>
						</div>
					</div>
					<!-- ##############################################################################

						E : 컨텐츠 삽입

					############################################################################### -->
				</div>
				<!-- // .container -->
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #wrapper -->
		<!-- #quickmenu -->
		<div id="quickmenu" class="aside right">
			<div class="holder">
				<div id="quick" class="container">
					<div class="wrap modules">
						<ul class="core">
							<li class="d2 active">
								<a href="javascript:;" class="d2"><span>admin 님</span></a>
								<div class="d3 show">
									<ul class="d3">
										<li class="d3">
											<a href="http://bo.marketplanta.epasscni.com/am/manager/logout.do" class="d3"><span>로그아웃</span></a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- // #quickmenu -->
	</div>
	<!-- // #container -->
	<!-- #footer -->
	<div id="footer">
		<div id="copyrights">
			<div class="container">
				<p>Copyrights © MarketPlant, co.ltd. All rights Reserved.</p>
			</div>
		</div>
	</div>
	<!-- // #footer -->
	<div id="overlay" class="md-overlay"></div>
	<div id="indicator" class="md-indicator">
		<div class="bounce1"></div>
		<div class="bounce2"></div>
		<div class="bounce3"></div>
	</div>
	<!-- <script>
	$.ajax({
		type : 'POST',
		url: '서버주소',
		data:"파라미터",
		success:function(res){
			//조회성공일 때 처리
		},
		beforeSend:function(){
			$('body').removeClass('p_loaded');
			$('#loader-wrapper').addClass('ajax_loading');
		},
		complete:function(){
			$('body').addClass('p_loaded');
		},
		error:function(e){
			//조회 실패일 때 처리
		},
		timeout:100000
	});
	</script> -->
</body>
</html>