<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!-->
<html lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<title>쑈윈도 | OOTD 메인</title>
<link rel='shortcut icon' href="<c:out value="${frontDomain }"/>/nas/cdn/PW/images/ico/favicon.ico" type="image/x-ico">
<link rel='icon' href="<c:out value="${frontDomain }"/>/nas/cdn/PW/images/ico/favicon.ico" type="image/x-ico">
<link type="text/css" rel="stylesheet" href="/nas/cdn/CC/css/plyr.css">
<link type="text/css" rel="stylesheet" href="/nas/cdn/PW/css/style.css">
<link type="text/css" rel="stylesheet" href="/nas/cdn/PW/css/mCustomScrollbar.css">
<link type="text/css" rel="stylesheet" href="/nas/cdn/PW/css/swiper.min.css">
<link type="text/css" rel="stylesheet" href="/nas/cdn/PW/css/neo.css">
<link type="text/css" rel="stylesheet" href="/nas/cdn/PW/css/slick.css">
<link type="text/css" rel="stylesheet" href="/nas/cdn/PW/css/jquery-ui.css">
<script type="text/javascript" src="/nas/cdn/PW/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/nas/cdn/PW/js/ui.common.js"></script>
<script type="text/javascript" src="/nas/cdn/PW/js/swiper.js"></script>
<script src="/nas/cdn/PW/js/imagesloaded.pkgd.min.js"></script>
<script src="/nas/cdn/PW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/nas/cdn/PW/js/jquery.dotdotdot.min.js"></script>
<script src="/nas/cdn/PW/js/slick.js"></script>
<script src="/nas/cdn/PW/js/masonry.pkgd.js"></script>
<script src="/nas/cdn/CC/js/plyr.polyfilled.min.js"></script>
<script src="/nas/cdn/PW/common.js"></script>
<script src="/nas/cdn/pc/js/jquery.validate.js"></script>
<script type="text/javascript" src="/nas/cdn/PW/js/jquery-ui.js"></script>
<script type="text/javascript" src="/nas/cdn/PW/js/jquery.easing.1.3.js"></script>

<script>
	$(function() {
		// 동영상 플레이어
		var players = Plyr.setup('.js-player');

		$(".option_list").mCustomScrollbar({
			axis : 'y',
			theme : 'minimal'
		});
		$('.fbx > a').on('click', function() {
			if (!$(this).siblings('.option_list').is(':visible')) {
				$(this).siblings('.option_list').fadeIn(300);
			}
		});
		$('.option_list li button').on(
				'click',
				function() {
					var _this = $(this);
					if (_this.parents('.option_list').siblings('a').hasClass(
							'color')) {
						if (_this.hasClass('total')) {
							_this.parents('.option_list').siblings('.lk')
									.addClass('total').removeAttr('style');
						} else {
							_this.parents('.option_list').siblings('.lk')
									.removeClass('total');
						}
						_this.parents('.option_list').siblings('.lk').text(
								_this.text())
								.attr('style', _this.attr('style'));
						_this.parents('.option_list').fadeOut(300);
					} else {
						_this.parents('.option_list').siblings('.lk').text(
								_this.text());
						_this.parents('.option_list').fadeOut(300);
					}
				});
		$('.option_list').on('mouseleave', function() {
			$(this).fadeOut(300);
		});
	});
</script>
</head>

<body>
	<!-- S : loader-wrapper -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- E : loader-wrapper -->
	
	<div id="wrap">

		<div id="header" class="header">

			<!-- .top_banner_zone -->
			<!-- TODO top 배너가 없는 페이지 때문에 임시 처리 -->
			<c:if test="${not empty MainReNewBannerList }">
				<div class="top_banner_zone">
					<a href="#"><img src="/nas/cdn/PW/images/@temp/top_banner.jpg"
						alt="80% SALE 오늘 밤 12시까지 최대 80% SALE"></a>
					<button type="button" class="btn_banner_off">오늘 그만보기</button>
				</div>
			</c:if>
			<!-- // .top_banner_zone -->		
			<!-- S : .header_top -->
			<div class="header_top clearboth">
				<h1 id="logo">
					<a href="<c:out value="${frontDomain }"/>/pc/main/index.do" style="background:url(<c:out value="${cdnDomain }"/><c:out value="${ logoUrl }"/>) important;">SHINWONMALL</a>
				</h1>
				<ul class="main_list clearboth">
					<li class="active"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do">#OOTD</a></li>
					<li><a href="<c:out value="${frontDomain }"/>/pc/store/storeList.do">#STORE</a></li>
				</ul>
				<script>
				$(function(){
					$('.main_list.clearboth a').filter(function(){return this.href==location.href}).parent().addClass('active').siblings().removeClass('active')
					$('.main_list.clearboth a').click(function(){$(this).parent().addClass('active').siblings().removeClass('active')	
					})
				})
					
				</script>
				<div class="util_menu">
					<form id="" name="">
						<fieldset>
							<legend>통합검색</legend>
							<ul class="util_list clearboth">
								<li>
									<a href="#" class="search" id="t_search">SEARCH</a>
									<div class="t_search_wrap">
										<div class="input_area clearboth">
											<label for="search_word" class="blind">검색어</label>
											<input type="text" id="search_word" name="query" class="search_word" placeholder="검색어 입력">
											<input type="submit" value="" class="btn_search_submit">
										</div>
										<div class="t_search_list_box clearboth">
											<div class="newest_word_area">
												<dl>
													<dt>최근 검색어</dt>
													<dd>
														<ul>
															<li class="clearboth"><a href="#">원피스</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">가디건</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">에코팩</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">엔더슨별</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">자켓</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">귀걸이</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">블라우스</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
															<li class="clearboth"><a href="#">반바지</a>
															<button type="button" class="btn_newest_word_del">삭제</button></li>
														</ul>
														<p class="data_none">최근 검색어가 없습니다.</p>
													</dd>
												</dl>
												<button type="button" class="btn_newest_word__all_del">전체삭제</button>
											</div>
											<div class="popular_word_area">
												<dl>
													<dt>인기 검색어</dt>
													<dd>
														<c:choose>
															<c:when test="${not empty popSearchWord }">
																<ol>
																	<c:forEach var="row" items="${popSearchWord }">
																		<li><a href="javascript:goPopSearchWord('<c:out value="${row.PPL_WRD_IDX }"/>');"><c:out value="${row.PPL_WRD_TEXT }"/></a></li>
																	</c:forEach>
																</ol>
															</c:when>
															<c:otherwise>
																<p class="data_none">인기 검색어가 없습니다.</p>
															</c:otherwise>
														</c:choose>
													</dd>
												</dl>
											</div>
											<button type="button" class="btn_t_search_close">통합검색 닫기</button>
										</div>
									</div>
								</li>
								<c:choose>
									<c:when test="${not empty sessionUser.MEM_MST_MEM_ID }">
								<li><a href="/pc/manager/logout.do">LOGOUT</a><input id="session_login_status" type="hidden" value="Y"></li>
								<li><a href="/pc/mypage/myPageMain.do">MY</a></li>
									</c:when>
									<c:otherwise>
								<li><a href="/pc/manager/login.do">LOGIN</a></li>
								<li><a href="/pc/member/joinMemType.do">JOIN</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do" class="cart"><em>장바구니</em></a></li>
							</ul>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- E : .header_top -->
			<!-- .header_bottom -->
			<div class="header_bottom">
				<div class="header_bottom_inner clearboth">
					<div class="gnb_b_cate_list_wrap">
	                    <ul class="gnb_b_cate_list clearboth">
							<c:forEach var="listGnbMenu" items="${listGnbMenu}" varStatus="i">
								<li>
                            		<a href="<c:out value="${frontDomain }"/>/pc/product/productMain.do?idx=<c:out value="${listGnbMenu.PRD_CTG_IDX }" />"><c:out value="${listGnbMenu.PRD_CTG_NM}"/></a>
                            		<c:if test="${not empty listGnbMenu.child }">
                            			<div class="depth_02_wrap">
			                                <div class="depth_02_wrap_inner clearboth">
			                                    <ul class="depth_02_list clearboth">
                            		</c:if>
                           			<c:forEach var="secondDepthCategroy" items="${listGnbMenu.child }" varStatus="j">
										<li>
                                           <dl>
                                               <dt><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${secondDepthCategroy.PRD_CTG_IDX }" />"><c:out value="${secondDepthCategroy.PRD_CTG_NM}"/></a></dt>
                                               <dd>
                                                   <ul>
                                                   <c:forEach var="thirdDepthCategory" items="${secondDepthCategroy.child}" varStatus="i">
                                                       <li><a href="<c:out value="${frontDomain }"/>/pc/product/productList.do?idx=<c:out value="${thirdDepthCategory.PRD_CTG_IDX }" />"><c:out value="${thirdDepthCategory.PRD_CTG_NM}"/></a></li>
                                                    </c:forEach>
                                                   </ul>
                                               </dd>
                                           </dl>
                                           <span class="line"></span>
                                       </li>
									</c:forEach>
									
                                    <c:if test="${not empty listGnbMenu.child }">
                           					</ul>
                           					<!-- 
			                            		<div class="myfavorite_area">
			                                        <dl>
			                                            <dt>즐겨찾기<button type="button" class="btn_myfavorite_setting">즐겨찾기 설정</button></dt>
			                                            <dd>
			                                                <ul class="myfavorite_list">
			                                                    <li>
			                                                        <a href="#">
			                                                            <div class="thum"><img src="/nas/cdn/PW/images/@temp/img_favirite.png" alt=""></div>
			                                                            <span>TOP</span>
			                                                        </a>
			                                                    </li>
			                                                    <li>
			                                                        <a href="#">
			                                                            <div class="thum"><img src="/nas/cdn/PW/images/@temp/img_favirite.png" alt=""></div>
			                                                            <span>PANTS</span>
			                                                        </a>
			                                                    </li>
			                                                    <li>
			                                                        <a href="#">
			                                                            <div class="thum"><img src="/nas/cdn/PW/images/@temp/img_favirite.png" alt=""></div>
			                                                            <span>SHIRTS</span>
			                                                        </a>
			                                                    </li>
			                                                    <li>
			                                                        <a href="#">
			                                                            <div class="thum"><img src="/nas/cdn/PW/images/@temp/img_favirite.png" alt=""></div>
			                                                            <span>JEWELRY</span>
			                                                        </a>
			                                                    </li>
			                                                </ul>
			                                            </dd>
			                                             -->
			                                            <!-- 이건 원래 주석임
			                                     	       <dd>
                                                			<div class="myfavorite_txt">
                                                    			<div class="myfavorite_txt_inner">
                                                        			<p>로그인 후 상품 카테고리를<br>등록하실 수 있습니다.</p>
                                                        			<p>등록된 상품 카테고리가 없습니다.</p>
                                                    			</div>
                                                			</div>
                                            			</dd>
                                            			 -->
                                            			 <!-- 
			                                        </dl>
			                                    </div>
			                                     -->
                                            </div>
                                        </div>        
                            		</c:if>
								</li>
							</c:forEach>
						</ul>
					</div>
					<span class="bar"></span>
					<div class="gnb_s_cate_list_wrap">
						<ul class="gnb_s_cate_list clearboth">
							 <c:forEach var="gnbSubMenu" items="${listGnbSubMenu}" varStatus="i">
								<li><a href="<c:out value="${frontDomain }"/><c:out value="${gnbSubMenu.DPS_GNB_DSP_URL}"/>">${gnbSubMenu.DSP_GNB_NM}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- // .header_bottom -->
		</div>
		
		<form id="frmExec" name="frmExec">
		</form>
		
		<c:if test="${not empty sessionUser}">
			<script type="text/javascript">

					var passwordChangeDate = '<c:out value="${sessionUser.MEM_MST_MEM_PW_CHG_DT}"/>';
					var target = '<c:out value="${frontDomain }"/>/pc/manager/pwChangeForm.do';
					console.log(passwordChangeDate);
					console.log(target);
					
			</script>
			<script>
				$(function(){
					if(window.location.href.indexOf(target)>=0){return;}
					if(changePasswordPeriod()){
						$("#frmExec").attr({"action":"<c:out value="${frontDomain}" />/pc/manager/pwChangeForm.do", "target":"_self", "method":"post"}).submit();
					}
				})
				
				changePasswordPeriod = function(){
					
					if(passwordChangeDate == ""){return false;}
					
					var today = new Date()
					var parse = (function(){
						var str = passwordChangeDate;
						var year = str.substr(0, 4);
						var month = str.substr(4, 2);
						var day = str.substr(6, 2);
					
						return new Date(year, month-1, day);
					});
					
					var dateObj = parse();
					
					var betweenDay = parseInt((today.getTime() - dateObj.getTime()) / (1000*60*60*24));
					
					if(betweenDay >= 60){
						return true;
					}else{
						return false;
					};
				}	
			</script>
		</c:if>
		
<script>

function ShowLoading (pIsShow) {
	if(pIsShow) {
		$('body').removeClass('p_loaded');
		 $('#loader-wrapper').addClass('ajax_loading');
	} else {
		 $('body').addClass('p_loaded');
	}
}
function GetIsLogin () {
	if($('#session_login_status').length > 0 && 
			$('#session_login_status').val() == 'Y') return true;
	else return false;
}
function GetNumberFormat(pVal) {
	var curVal = $.trim(pVal + '');
	return curVal.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function ResetCurrencyNumberFormat() {
	$('.cur-number-format').each(function(){
		var curVal = $(this).text();
		
		if(curVal && curVal.indexOf(',') < 0) {
			 
			curVal = $.trim(curVal);
		
			if(!isNaN(curVal)) {
				$(this).text('￦' + GetNumberFormat(curVal) );
			}
		}

	})
}
$(function(){

	goPopSearchWord = function(pplWrdIdx){

		var popWord;
        $.ajax
        ({
            type:"POST",
            async:false,
            url:"<c:out value="${frontDomain}"/>/pc/search/popularSearchWordAjax.do",
            data:{"PPL_WRD_IDX": pplWrdIdx},
            success:function(data)
            {
                if(data.resultYn == "Y"){
                    popWord = data.popWord;
                }else{
                    popWord = data.popWord;
                }
            },
            error:function(err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }    
        }); 
        $("#search_word").val(popWord);
        
	}
});
</script>