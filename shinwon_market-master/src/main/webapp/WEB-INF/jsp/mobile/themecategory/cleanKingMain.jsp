<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-thema">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>클린킹</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .clean_main S -->
		<section class="clean_main">
			<h2><img src="<c:out value="${cdnDomain}" />/mobile/img/thema/img_clean_title.jpg" alt="홈클리닝의 모든 것!  프리미엄 홈 클리닝 서비스 홈케어서비스 " /></h2>
			
			<nav class="ui-grid-b thema_nav _hd_fix">
				<a href="#clean_info" class="ui-block-a on"><strong>클린킹이란?</strong></a>
				<a href="#clean_guide" class="ui-block-b"><strong>홈클린 가이드북</strong></a>
				<a href="#package_d" class="ui-block-c"><strong>클린킹 서비스</strong></a>
			</nav>

			<!-- .clean_info S -->
			<dl id="clean_info" class="clean_info">
				<dt>
					<h3>						
						<strong>클린킹이란?</strong>
						<span>ABOUT CleanKing</span>
					</h3>
				</dt>
				<dd>
					<c:forEach var="row" items="${movieList }" >
					<a href="javascript:void(0)" class="_pg_link">
						<img src="<c:out value="${cdnDomain }${row.CMM_FLE_SAVE_PATH }" />" alt="" />
						<span><c:out value="${row.MGZ_MST_TITLE }" /></span>
					</a>
					</c:forEach>
					<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }" />/mobile/contents/emagazineMain.do?MGZ_MST_CTG=2279&MGZ_MST_THM_CTG1=2253', '_self');" class="btn_movie_more">더 많은 동영상 컨텑츠 보러가기</a>
				</dd>
			</dl>
			<!--// .clean_info E -->
			
			<!-- .clean_guide S -->
			<dl id="clean_guide" class="clean_guide">
				<dt>
					<h3>
						<strong>홈클린 가이드북</strong>
						<span>HOME CLEAN GUIDEBOOK</span>
					</h3>
				</dt>
				<dd>					
					<div data-role="collapsible-set">
						<c:forEach items="${guide2DepList}" var="grow" varStatus="gsta">
						<c:set var="cnt" value="0" />
						
						<div data-role="collapsible">
							<h4 id="h4Id<c:out value="${gsta.count }" />"><c:out value="${grow.CMN_COM_NM }" /><i></i></h4>
							<ul>
								<c:forEach items="${guide3DepList }" var="row" varStatus="sta">
								<c:if test="${grow.CMN_COM_IDX eq row.CMN_COM_UP_IDX }">
								<li><a href="javascript:void(0);" onclick="goDetail('<c:out value="${grow.CMN_COM_UP_IDX }" />', '<c:out value="${grow.CMN_COM_IDX }" />', '<c:out value="${row.CMN_COM_IDX }" />'); return false;" class="_pg_link" ><c:out value="${row.CMN_COM_NM }" /></a></li>
								
								<c:set var="cnt" value="${cnt + 1 }" />
								</c:if>
								</c:forEach>
								<c:if test="${cnt eq 0}">
								<script type="text/javascript">
									$("#h4Id<c:out value="${gsta.count }" />").html('<c:out value="${grow.CMN_COM_NM }" />');
								</script>
								</c:if>
							</ul>
						</div>
						</c:forEach>
					</div>
				</dd>
			</dl>
			<!--// .clean_guide E -->

			<!-- .clean_issue S -->
			<dl class="clean_issue">
				<dt>
					<h3>
						<strong>뉴스로 보는 오늘의 공기</strong>
						<span>CLEAN KING ISSUE</span>
					</h3>
				</dt>
				<dd>
					<c:forEach var="row" items="${issueList}">
					<a href="javascript:void(0)" onclick="goDetail('<c:out value="${grow.CMN_COM_UP_IDX }" />', '<c:out value="${grow.CMN_COM_IDX }" />', '<c:out value="${row.CMN_COM_IDX }" />'); return false;" class="_pg_link">
						<i><span>관련뉴스</span></i>
						<strong><c:out value="${row.MGZ_MST_TITLE }" /></strong>
					</a>
					</c:forEach>
				</dd>
			</dl>
			<!--// .clean_issue E -->

			<!-- .package_d S -->
			<dl id="package_d" class="package_d">
				<dt>
					<a href="javascript:void(0)">
						<h3>클린킹 서비스</h3>
						<i></i>
					</a>
				</dt>
				<form method="post" name="frm" id="frm">
				<input type="hidden" name="tabIdx" id="tabIdx" value="product" />
				<input type="hidden" name="PRD_MST_CDs" id="PRD_MST_CDs" value="" />
				<dd class="pr_list" id="product">					
					<ul class="ui-grid-a">
					<c:set var="classNm" value="" />
					<c:set var="totPrice" value="0" />
					<c:set var="realTotPrice" value="0" />
					<c:forEach items="${productList }" var="row" varStatus="sta">
						<c:choose>
							<c:when test="${sta.count mod 2 eq 1 }">
								<c:set var="classNm" value="a" />			
							</c:when>
							<c:otherwise>
								<c:set var="classNm" value="b" />
							</c:otherwise>
						</c:choose>
						<li class="ui-block-<c:out value="${classNm }" />">
							<label for="chk_pr_<c:out value="${sta.count}" />" id="chk_pr_<c:out value="${sta.count}" />" style="display:none;" >
								<input type="checkbox" name="chk_prs" id="chk_pr_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_ERP_DSP_PRC }" />" data-prc="<c:out value="${row.PRD_MST_DSP_PRC }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> style="display:none;" />
							</label>
							<c:if test="${row.PRD_MST_OPT_EST_CNT ne 0}">
							<i class="ico_pot_tx" id="pot_<c:out value="${row.PRD_MST_CD }" />" style="display:none;">옵션필수선택상품</i>
							</c:if>
							<a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');" class="_pg_link" target="_blank">
								<span class="tx_img"><img data-original="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" src="<c:out value="${cdnDomain}" />/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
								<span class="tx_ti"><c:out value="${row.DSP_MST_TXT}" /></span>
								<strong class="tx_org" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>>
									<fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /><span>원</span>
								</strong>
								<c:choose>
									<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
										<strong class="tx_price">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:when>
									<c:otherwise>
										<strong class="tx_price co_red">
											<fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /><span>원</span>
										</strong>
									</c:otherwise>
								</c:choose>
							</a>
							<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_DSP_PRC }"/>" style="display:none;">
								<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
								<a href="javascript:optlayer('<c:out value="${row.PRD_MST_CD }" />', '<c:out value="${row.PRD_MST_DSP_PRC }"/>');" class="btn_opt">
									<span>옵션선택</span>
								</a>
								</c:if>
							</div>
						</li>
						
						<c:set var="totPrice" value="${totPrice + row.PRD_MST_PRC }" />
						<c:set var="realTotPrice" value="${realTotPrice + row.PRD_MST_PRICE }" />
						
						</c:forEach>
					</ul>

				</dd>
				</form>
				
				<div id="optlayer"></div>
				
				<dd class="total_prc">
					<dl>
						<dt class="blind">선택한 상품 가격비교</dt>
						<dd class="org_prc">
							<strong class="ti">프라이스킹 상품금액</strong>
							<strong class="tx_price"><strong><fmt:formatNumber value="${totPrice }" groupingUsed="true" /></strong><span class="tx_won">원</span></strong>
						</dd>
						<dd class="pkg_prc">
							<strong class="ti">클린킹 패키지금액</strong>
							<strong class="tx_price"><strong><fmt:formatNumber value="${realTotPrice }" groupingUsed="true" /></strong><span class="tx_won">원</span></strong>
							<strong class="tx_save">절약된 금액 : <strong><fmt:formatNumber value="${totPrice - realTotPrice }" groupingUsed="true" /></strong>원</strong>
						</dd>
					</dl>
				</dd>

				<dd class="btn_box" style="display:none;">
					<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_red btn_purch">
						<strong>상담예약</strong>
					</a>
					<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_red_l btn_cart">
						<strong>장바구니</strong>
					</a>
				</dd>
			</dl>
			<!--// .package_d E -->
		</section>
		<!--// .clean_main E -->
		
		<%@ include file="/WEB-INF/jsp/mobile/product/productLayer.jsp" %>
		
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script>
$.com.thema = $.com.thema || {
	tab: function(){
		//테마 nav
		var _nav = $('.thema_nav'),
			_nav_a = _nav.children('a');
		_nav_a.on('click', function(e){
			e.preventDefault();
			var _this = $(this),
				_id = _this.attr('href'),
				_top = $(_id).offset().top,
				_nav_h = _nav.outerHeight(true)

			_this.addClass('on').siblings().removeClass('on');
			$('body').scrollTop(_top-_nav_h);
		});

		//클린킹서비스
		$('.package_d dt a').on('click', function(){
			var _this = $(this),
				_this_h = _this.parent().height(),
				_d = _this.parents('.package_d');

			if(_this.hasClass('on')){
				_this.removeClass('on');
				_d.removeAttr('style');
			}else{
				_this.addClass('on');
				_d.css({overflow:'hidden'}).animate({height:_this_h}, 200);
			}
		});
		$.com.thema.total_prc();
	},
	total_prc: function(){
		//돈계산 해줄게
		var _list = $('.pr_list ul li'),
			_total = $('.package_d'),
			_org_prc = _total.find('.org_prc .tx_price strong'),
			_pkg_prc = _total.find('.pkg_prc .tx_price strong'),
			_save_prc = _total.find('.pkg_prc .tx_save strong'),
			_tt_org = 0,
			_tt_prc = 0;
		
		_list.find('input[type="checkbox"]').off('click').on('click', function(){
			var _this = $(this),
			_prent = _this.parent(),
			_idx = _prent.index();

			var sell_state 	= _this.data("sell_state");
			var opt_est_cnt = _this.data("opt_est_cnt");
			
			//if(this.checked){
			
			if(sell_state == "O"){
				alert("품절 상품입니다.");
				return false;
			}
			
			if(opt_est_cnt > 0){
				alert("필수 옵션 상풉입니다.");
				return false;
			}
			
			$.com.thema.total_prc();
		});

		$.each(_list, function(i){
			var _this = $(this),
				_chk = _this.find('input[type="checkbox"]');

			if(!_chk.is(':checked')) return;
			
			var	_pr_org = _chk.data('org'),
				_pr_prc = _chk.data('prc');
			
			_tt_org += _pr_org;
			_tt_prc += _pr_prc;
		});
		
		String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
		_org_prc.text(String(_tt_org).number_format());
		_pkg_prc.text(String(_tt_prc).number_format());
		_save_prc.text(String((_tt_org-_tt_prc)).number_format());
	},
	pr_list_h: function(){
		var _li = $('#package_d .pr_list .ui-grid-a > li'),
			_h = 0;
		_li.height('');
		$.each(_li, function(){
			var _this_h = $(this).height();
			if(_h < _this_h) _h = _this_h;
		});
		_li.height(_h);
	}//pr_list_h: function(){
};

$(document).on('scroll', function(){
	var	_aaa = $('#clean_guide').offset().top, 
		_bbb = $('#package_d').offset().top,
		_ccc = $('.thema_nav');

	if($.com.scroll_num <= _aaa) {
		_ccc.children().first().addClass('on').siblings().removeClass('on');
	}else{
		if($.com.scroll_num  <= _bbb){
			_ccc.children().siblings().removeClass('on');
			$('.ui-block-b').addClass('on');
		}else{
			_ccc.children().last().addClass('on').siblings().removeClass('on');
		}
	}
});

$(document).ready(function(){
	$.com.thema.tab();
	$.com.thema.total_prc();
	$.com.thema.pr_list_h();
	
	goDetail		= function(a,b,c){
		location.href = "<c:out value="${mobileDomain}" />/mobile/themecategory/cleanKingConList.do?MGZ_MST_THM_CTG1=" + a + "&MGZ_MST_THM_CTG2=" + b + "&MGZ_MST_THM_CTG3="+ c; 
	};
	
	// 결제 페이지로 이동 
	setPaymentData = function(crtMemCrtDlvGbn){
	
	<c:choose>
		<c:when test="${commandMap.MEM_LOGIN_YN eq 'N'}">
		
		var url = location.href;
		url = encodeURIComponent(url);
		
		if(appType){
			callJavascriptLoginUrl(url); //app 로그인 연동
		}else{
			url = encodeURIComponent(url);
        	location.target = "_self";
        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
		}
    	
    	</c:when>
 		<c:otherwise>
 		
		var _list 	= $('.pr_list ul li');
		var chk		= [];
		var _len	= 0;
		
		if(_list.length > 0){

			$.each(_list, function(i){
				var _this = $(this),
				_chk = _this.find('input[type="checkbox"]');
				
				if(!_chk.is(':checked')) return;
				
				var _span			= _chk.parents('li').find('.opt > span'),
					_prd_dtl_price	= 0,
					_opt_idx		= 0,
					_prd_mst_cd		= '',
					_prd_opt_cnt	= 1,
					_opt_est_yn		= 'N';
						
				if(_span.length > 0){
					
					$.each(_span, function(){
						
						var _this = $(this),
						_prd_dtl_price	= _this.data('prd_dtl_price'),
						_opt_idx		= _this.data('opt_idx'),
						_prd_opt_cnt	= _this.data('opt_cnt'),
						_opt_est_yn		= _this.data('opt_est_yn');
						chk.push(_chk.val() + '^' + _prd_dtl_price + '^' + _opt_idx + '^' + _prd_opt_cnt + '^' + _opt_est_yn);
					});
				}else{
					chk.push(_chk.val() + '^' + _prd_dtl_price + '^' + _opt_idx + '^' + _prd_opt_cnt + '^' + _opt_est_yn);
				}
				
				_len++;
			});
			
			if(_len > 0){
				if(confirm(_len + "개의 제품이 선택되었습니다.\nMD 추가 혜택 상담을 받으시겠습니까?")){
					$("#PRD_MST_CDs").val(chk);
					//$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/directPurchaseProcess.do").submit();
					$.ajax({
			            async : false,
			            type : "POST",
			            data : $("#frm").serialize(),
			            url : "<c:out value="${mobileDomain}" />/mobile/themecategory/directPurchaseProcess.do",
			            success : function (data){ 
							switch (data.result) {
							case 1:
								$('#frm').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
								$('#frm').attr("method","post");
								$('#frm').attr('action','<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do').submit();
								break;
							default :
								alert(data.resultMsg);
								break;
							}
			            },error : function (err){
			                alert("오류가 발생하였습니다.\n[" + err.status + "]");
			                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
			            }
					});
				}
			}else{
				alert("선택된 상품이 없습니다.");
				return;
			}
			
		}else{
			alert("상품이 없습니다.");
			return;
		}
		</c:otherwise>
	</c:choose>	
	};	// setPaymentData end 
	
	// 장바구니 담기
	inertCart = function(memCrtDlvGbn){
	<c:choose>
		<c:when test="${commandMap.MEM_LOGIN_YN eq 'N'}">
		var url = location.href;
		url = encodeURIComponent(url);
		
		if(appType){
			callJavascriptLoginUrl(url); //app 로그인 연동
		}else{
			url = encodeURIComponent(url);
        	location.target = "_self";
        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
		}
		</c:when>
		<c:otherwise>
	
		var _list 	= $('.pr_list ul li');
		var chk		= [];
		var _len	= 0;
		
		if(_list.length > 0){
	
			$.each(_list, function(i){
				var _this = $(this),
				_chk = _this.find('input[type="checkbox"]');
				
				if(!_chk.is(':checked')) return;
				
				var _span			= _chk.parents('li').find('.opt > span'),
					_prd_dtl_price	= 0,
					_opt_idx		= 0,
					_prd_mst_cd		= '',
					_prd_opt_cnt	= 1,
					_opt_est_yn		= 'N';
						
				if(_span.length > 0){
					
					$.each(_span, function(){
						
						var _this = $(this),
						_prd_dtl_price	= _this.data('prd_dtl_price'),
						_opt_idx		= _this.data('opt_idx'),
						_prd_opt_cnt	= _this.data('opt_cnt'),
						_opt_est_yn		= _this.data('opt_est_yn');
						chk.push(_chk.val() + '^' + _prd_dtl_price + '^' + _opt_idx + '^' + _prd_opt_cnt + '^' + _opt_est_yn);
					});
				}else{
					chk.push(_chk.val() + '^' + _prd_dtl_price + '^' + _opt_idx + '^' + _prd_opt_cnt + '^' + _opt_est_yn);
				}
				
				_len++;
			});
			
			if(_len > 0){
				if(confirm(_len + "개의 제품이 선택되었습니다.\nMD 추가 혜택 상담을 받으시겠습니까?")){
					$("#PRD_MST_CDs").val(chk);
					//$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/directPurchaseProcess.do").submit();
					$.ajax({
			            async : false,
			            type : "POST",
			            data : $("#frm").serialize(),
			            url : "<c:out value="${mobileDomain}" />/mobile/themecategory/insertCartAjax.do",
			            success : function (data){ 
							switch (data.result) {
							case 1:
								$("#topCartCnt").html(data.cartCnt);
								$.com.util.layPop('open', $('#layCart'));
								break;
							default :
								alert(data.resultMsg);
								break;
							}
			            },error : function (err){
			                alert("오류가 발생하였습니다.\n[" + err.status + "]");
			                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
			            }
					});
				}
			}else{
				alert("선택된 상품이 없습니다.");
				return;
			}
			
		}else{
			alert("상품이 없습니다.");
			return;
		}
		</c:otherwise>
	</c:choose>
	};			// inertCart end
	
	//optDel		= function(){
	$(document).on("click", "#optDel", function(){		
		var chk = false,
			_this = $(this),
			_opt = _this.parents('.opt'),
			_li	= _this.parents('li');
	
		
		var _span			= _this.parent('span'),
			_opt_est_yn		= _span.data('opt_est_yn'),
			_prd_dtl_price	= _span.data('prd_dtl_price');
		
		var prdMstCd		= _opt.data('prd_mst_cd');
		var prdPrice		= _opt.data('prd_mst_price');

		var mPrice			= 0;
		
		if(_opt_est_yn == 'Y'){
			mPrice			= _prd_dtl_price - prdPrice;
		}else{
			mPrice			= _prd_dtl_price;
		}
		
		var price			= _li.find('.pr_m strong').text().replace(/,/gi,'');
		var sellPrice		= _li.find(".sel_m strong").text().replace(/,/gi,'');
		
		_li.find('.pr_m strong').text(setComma(price - mPrice));
		_li.find(".sel_m strong").text(setComma(sellPrice - mPrice));
		_span.remove();
		
		$.each(_opt.find('span'), function(i){
			if( $(this).data('opt_est_yn') == 'Y') chk = true;  
		});
		
		if(!chk){
			_opt.html('<a href="javascript:optlayer(\'' + prdMstCd + '\', \'' + prdPrice + '\')"  class="btn_opt"><span>옵션선택</span></a>');
			_li.find('.ui-checkbox').after('<i class="ico_pot_tx" id="pot_'+prdMstCd+'">옵션필수선택상품</i>');
			$("#chk_pr_"+ prdMstCd).attr("checked", false);
			price	= $("#chk_pr_"+ prdMstCd).data("org");
			sellPrice = $("#chk_pr_"+ prdMstCd).data("prc");
			
			_li.find('.pr_m strong').text(setComma(price));
			_li.find(".sel_m strong").text(setComma(sellPrice));
		}
		
		$.com.thema.total_prc();
	});
	
});
</script>