<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-theme"><a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->

			<!-- .clean_d S -->
			<section class="clean_d">
				
				<!-- .search S -->
				<div class="search">
					<dl>
						<dt>
							<div class="blind">
								<span>For my advanced lifestyle</span>
								<h2>홈케어의 모든 것!</h2>
								<h3>전문가라서 다른  프리미엄 홈케어 서비스</h3>
								<p>내가 숨쉬는 공간, 내가 관리한다.<br/>건강한 라이프의 첫걸음, 마켓플랜트 클린킹에서 케어해 드립니다.</p>
							</div>
						</dt>
						<form method="post" name="sFrm" id="sFrm">
						<input type="hidden" name="cPage" id="cPage" value="" />
						<input type="hidden" name="searchMgzMstThmCtg1" value="2253" />
						<input type="hidden" name="CMN_COM_IDX" id="CMN_COM_IDX" value= "" />
						<input type="hidden" name="searchMgzMstThmCtg2" id="searchMgzMstThmCtg2" value="" />
						<input type="hidden" name="searchMgzMstThmCtg3" id="searchMgzMstThmCtg3" value="" />
						<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" value="" />
						<input type="hidden" name="startCount"value="0">
						<input type="hidden" name="collection" value="thema">
						<dd>
							<label for="inp_search">
								<input type="text" id="inp_search" name="searchKeyword" placeholder="home cleaning의 모든 것!  키워드로 검색하세요" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
						</form>
					</dl>
				</div>
			
				<!-- .clean_movie S -->
				<dl class="clean_movie">
					<dt class="minW dt_tab">
						<a href="javascript:void(0)" class="on"><span>클린킹이란?</span></a>
						<a href="javascript:void(0)"><span>홈클린 가이드북</span></a>
						<a href="javascript:void(0)"><span>클린킹 서비스</span></a>
					</dt>
					
					<dd class="mv_con">						
						<div class="mv_slider">
							<ul></ul>
							<strong class="mv_ti"></strong>
						</div>
						<div id="mv_pager" class="mv_pager">
							<div>
							<c:forEach var="row" items="${movieList }" varStatus="sta">
						  		<a data-slide-index="<c:out value="${sta.index }" />" data-src="<c:out value="${row.MGZ_MST_CTS}" />" href="javascript:void(0)">
						  			<img src="<c:out value="${cdnDomain }${row.CMM_FLE_SAVE_PATH }" />" alt="" />
						  			<span><c:out value="${row.MGZ_MST_TITLE }" /></span>
						  		</a>
						  	</c:forEach>
						  	</div>
						</div>
					</dd>
				</dl>
				<!-- .clean_movie E -->

				<!-- .clean_guide S -->
				<dl class="clean_guide">
					<dt class="minW dt_tab">
						<a href="javascript:void(0)"><span>클린킹이란?</span></a>
						<a href="javascript:void(0)" class="on"><span>홈클린 가이드북</span></a>
						<a href="javascript:void(0)"><span>클린킹 서비스</span></a>
					</dt>
					<dd class="minW guide_con">
						<div class="nav">
						<c:forEach items="${guide2DepList}" var="grow" varStatus="gsta">
							<dl class="mn_<fmt:formatNumber minIntegerDigits="2" value="${gsta.count}" /> <c:if test="${gsta.count <= 3 }" > point_r</c:if><c:if test="${gsta.count > 3 }" > point_l </c:if>">
								<dt>
									<a href="javascript:void(0)" data-mgz_mst_thm_ctg2="<c:out value="${grow.CMN_COM_IDX }"/>"  id="2depth"><strong><c:out value="${grow.CMN_COM_NM }" /></strong></a>
									<i class="ico_l"><i class="ico_w"></i></i>
								</dt>								
								<dd class="list">
									<c:forEach var="rows" items="${guide3DepList }">
									<c:if test="${grow.CMN_COM_IDX eq rows.CMN_COM_UP_IDX}">
									<a href="javascript:void(0)" data-mgz_mst_thm_ctg3="<c:out value="${rows.CMN_COM_IDX }"/>"  data-mgz_mst_thm_ctg2="<c:out value="${grow.CMN_COM_IDX }" />" data-cmn_com_idx="<c:out value="${CMN_COM_IDX}" />" id="3depth" ><i class="ico_w"></i><c:out value="${rows.CMN_COM_NM }" /></a>
									</c:if>
									</c:forEach>
								</dd>
							</dl>
						</c:forEach>
						</div>
						<img src="<c:out value="${cdnDomain }" />/pc/img/cleanking/bg_clean_guide.png" alt="집 구조 사진" />
					</dd>
					
					<dd class="minW guide_list">
						<h3>뉴스로 보는 오늘의 공기</h3>
						<c:forEach var="row" items="${issueList}" varStatus="sta">
						<c:set var="clasNm" value="" />
						<c:if test="${sta.first }">
							<c:set var="clasNm" value="f" />
						</c:if>
						<c:if test="${sta.last }">
							<c:set var="clasNm" value="l" />
						</c:if>
						<a href="javascript:void(0)" onclick="goDetail( '<c:out value="${row.MGZ_MST_IDX }" />', '<c:out value="${row.MGZ_MST_THM_CTG2 }" />', '<c:out value="${row.MGZ_MST_THM_CTG3 }" />'); return false;" class="<c:out value="${clasNm }"/>" >
							<img src="<c:out value="${cdnDomain }${row.CMM_FLE_SAVE_PATH }" />" alt="" />
							<strong><ui:shortTitle title="${row.MGZ_MST_TITLE }" length="11" /></strong>
							<span><ui:shortTitle title="${row.MGZ_MST_CPY }" length="18" /></span>
						</a>
						</c:forEach>
					</dd>
				</dl>
				<!-- .clean_guide E -->
				<!-- .clean_service S -->
				<form method="post" name="frm" id="frm">
				<input type="hidden" name="tabIdx" id="tabIdx" value="0" />
				<input type="hidden" name="PRD_MST_CDs" id="PRD_MST_CDs" value="" />
				<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="0" />
				
				<dl class="minW clean_service">
					<dt class="dt_tab">
						<a href="javascript:void(0)"><span>클린킹이란?</span></a>
						<a href="javascript:void(0)"><span>홈클린 가이드북</span></a>
						<a href="javascript:void(0)" class="on"><span>클린킹 서비스</span></a>
					</dt>
					<dd class="service_con">
						<p class="ti">땀 흘리며 청소하는 고생은 그만!<br/><strong>어떤 청소를 해야하나 고민도 그만!</strong></p>
						<p class="tx">“ 내 집처럼 청결하게, 내 몸처럼 소중하게,<br/>지금 딱! 필요한 바로 그 청소! 마켓플랜트 클린킹이 추천해 드립니다.”</p>
						<img src="<c:out value="${cdnDomain }" />/pc/img/cleanking/bg_service.jpg" alt="" />
					</dd>
					<c:set var="prListNum" value="0" />
					<dd class="pr_list" id="pr_list">
						<ol>
							<c:forEach items="${productList }" var="row" varStatus="sta">
							<c:set var="classNm" value="" />
							<c:if test="${sta.count mod 4  == 0 || sta.last}">
								<c:set var="classNm" value="l" />
							</c:if>
							<c:if test="${sta.count mod 4  == 1 || sta.first}">
								<c:set var="classNm" value="f" />
							</c:if>
							<li class="<c:out value="${classNm }" />" id="li_<c:out value="${row.PRD_MST_CD }" />" >
								<label for="inp_ck_<c:out value="${sta.count }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">class="on"</c:if> ><input type="checkbox" name="inp_ck_<c:out value="${sta.count }" />" id="inp_ck_<c:out value="${row.PRD_MST_CD }" />" data-org="<c:out value="${row.PRD_MST_PRC }" />" data-prc="<c:out value="${row.PRD_MST_PRICE }" />" data-sell_state="<c:out value="${row.PRD_MST_SEL_STATE }" />" data-opt_est_cnt="<c:out value="${row.PRD_MST_OPT_EST_CNT }" />" value="<c:out value="${row.PRD_MST_CD }" />" <c:if test="${row.PRD_MST_OPT_EST_CNT eq 0 && row.PRD_MST_SEL_STATE ne 'O'}">checked data-opt_idx="0"</c:if> ></label>
								<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />" target="_blank">
									<img src="<c:out value="${cdnDomain }${row.PRD_IMAGE }" />" alt="상품사진">
									<span class="ti"><c:out value="${row.PRD_MST_NM}" /></span>
									<strong class="pr_m" <c:if test="${row.PRD_MST_ERP_DSP_PRC <= row.PRD_MST_DSP_PRC }">style="display:none;"</c:if>><strong><fmt:formatNumber value="${row.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
									<c:choose>
										<c:when test="${row.PRD_MST_PRC eq  row.PRD_MST_DSP_PRC}">
											<strong class="sel_m"><strong><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
										</c:when>
										<c:otherwise>
											<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
										</c:otherwise>
									</c:choose>										
								</a>
								<div class="opt" id="opt_<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" data-prd_mst_price="<c:out value="${row.PRD_MST_PRICE }"/>" >
									<c:if test="${row.PRD_MST_OPT_EST_CNT > 0 }">
										<span><a href="javascript:void(0)" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }" />" id="putBtn" class="btn_opt">옵션선택</a></span>
									</c:if>
								</div>
							</li>
							<c:set var="prListNum" value="${sta.count }" />
							</c:forEach>
							
							<c:if test="${prListNum mod 4 != 0 }">
							<c:forEach begin="1" end="${4 - (prListNum mod 4 ) }" varStatus="sta">
								<li <c:if test="${sta.last }">class="l"</c:if> ></li>
							</c:forEach>
							</c:if>
						</ol>
						
						<dl class="total_price">
							<dt class="blind">
								<i class="ico_ar_b"></i>
								<strong>패키지 주문 금액</strong>
							</dt>
							<dd class="prc">
								<div class="all">
									<span class="ti">프라이스킹 상품 금액</span>
									<strong class="money"><strong>0</strong><span class="tx_won">원</span></strong>
										
								</div>
								<div class="pk">
									<span class="ti">선택한 홈케어 상품 금액</span>
									<strong class="money"><strong>0</strong><span class="tx_won">원</span></strong>
									
								</div>
								<div class="save">
									<strong>0</strong>
									<span>원을 절약 하셨습니다.</span>
								</div>
							</dd>
							<dd class="btn_box">
								<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_st2 btn_rd"><span>상담예약</span></a>
								<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_st2 btn_blk555"><span>장바구니</span></a>
							</dd>
						</dl>

					</dd>
				</dl>
				</form>
				<!-- .clean_service E -->
				
			</section>
			<!-- .clean_d E -->
		<!-- #laypop S -->
		<%@ include file="/WEB-INF/jsp/pc/product/productLayer.jsp" %>
		<!--// #laypop E -->
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>

<script>

$(document).ready(function(){
	clean.clean_w();
	clean.guideBook();
	clean.packages();	
	$('#inp_search').focus();//검색input focus
});

var clean = (function(){
	return{
		
		//클린킹이란?
		clean_w : function(){
			var mv_slider = $('.mv_slider'),
				mv_pager = $('#mv_pager > div'),
				youtube_url = 'https://www.youtube.com/embed/',
				youtube_opt = '?vq=hd1080&showinfo=0&rel=0&modestbranding=1&wmode=opaque',
				_list_html ='';

			$.each(mv_pager.children(), function(){
				_list_html += '<li><iframe height="480" src="" frameborder="0" allowfullscreen></iframe></li>';
			});
			mv_slider.find('ul').html(_list_html);
			mv_slider.find('ul').bxSlider({
				preloadImages: 'visible',
				controls:true,
				captions: true,
				auto: false,
				infiniteLoop: false,
				hideControlOnEnd: true,
				nextText:'<span class="blind">이전 동영상</span>',
				prevText:'<span class="blind">다음 동영상</span>',
				pagerCustom: '#mv_pager',
				onSliderLoad:function(){//start
					var _f = mv_pager.children().first(),
						_f_src = _f.data('src'),
						_f_ti = _f.find('span').text();

					mv_slider.find('ul li').eq(0).find('iframe').attr('src', (youtube_url+_f_src+youtube_opt));
					mv_slider.children('.mv_ti').text(_f_ti);
				}, 
				onSlideBefore:function($slideElement, oldIndex, newIndex){//play idx
					var _f = mv_pager.children().eq(newIndex),
						_f_src = _f.data('src'),
						_f_ti = _f.find('span').text(),
						_this_li = mv_slider.find('li').eq(newIndex);

					mv_slider.children('.mv_ti').text(_f_ti);
					_this_li.find('iframe').attr('src', (youtube_url+_f_src+youtube_opt));
					_this_li.siblings().find('iframe').attr('src', '');
				}
			});
			
			//if(mv_pager.children('a').length > 4){
			mv_pager.bxSlider({
				preloadImages: 'visible',
				controls:true,
				captions: true,
				pager: false,
				auto: false,
				infiniteLoop: false,
				hideControlOnEnd: true,
				minSlides: 4,
				maxSlides: 4,
				slideWidth: 170,
				slideMargin: 6,
				nextText:'<span class="blind">이전 항목</span>',
				prevText:'<span class="blind">다음 항목</span>'
			});
			//}
		},//guideBook = function(){			
			
		//가이드북
		guideBook : function(){
			var guideBook = $('.guide_con .nav'),
				_dt_a = guideBook.find('dl dt a');

			_dt_a.on('click', function(){
				$(this).parents('dl').addClass('open').siblings('.open').removeClass('open').children('dd').slideUp(200);
				$(this).parent('dt').next('dd').slideDown(200);
			});

		},//guideBook = function(){
		
		//맞춤 패키지
		packages : function(){
			$.pkg_price_ck = function(){//계산
					var _list_d = $('.pr_list'),
						_label = _list_d.find('label');					

					_label.off('click').on('click', function(e){
						var _this = $(this),
							_prent = _this.parent(),
							_idx = _prent.index();

						if(_this.hasClass('on')) _this.removeClass('on').children('input').attr('checked', false);
						else _this.addClass('on').children('input').attr('checked', true);
						pr_ck();
						return false;
					});
					function pr_ck(){
						var all_pr = 0,
							pk_pr = 0,
							_pr_d = $('.clean_service .total_price .prc')
							tx_all_pr = _pr_d.find('.all .money'),//프라이스킹 상품 금액
							tx_pk_pr = _pr_d.find('.pk .money'),//웨딩킹 패키지 금액
							tx_save_pr = _pr_d.find('.save strong');//절약

						$.each(_label, function(){
							var _this = $(this);
							if( _this.hasClass('on') ){
								var _next = _this.next();
								all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
								pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
							}
						});
						String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
						tx_all_pr.text(String(all_pr).number_format());
						tx_pk_pr.text(String(pk_pr).number_format());
						tx_save_pr.text(String(all_pr-pk_pr).number_format());
					}//function pr_ck(){					
					pr_ck();
				};//$.pkg_price_ck = function(){
			$.pkg_price_ck();
			clean.pkg_list_h();

			//클린킹이란?, 홈클린 가이드 북, 클린킹 서비스 탭
			$('.clean_movie, .clean_guide, .clean_service').find('.dt_tab a').on('click', function(){
				var _this = $(this),
					_idx = _this.index(),
					_offTop = function(_idx){
						var _re = 0;
						if(_idx == 0) _re = $('.clean_movie').offset().top;
						else if(_idx == 1) _re = $('.clean_guide').offset().top;
						else _re = $('.clean_service').offset().top;

						return _re;
					};
				
				 $('html,body').animate({
					scrollTop: _offTop(_idx)
				}, 200);
			});
		},//packages : function(){	
		pkg_list_h :function(){
			/*
				옵션 추가되면 리스트 높이 맞쳐줘요
			*/
			var _pr_list = $('.pr_list');
			$.each(_pr_list, function(){
				var _this = $(this),
					_h = 0;
				if(_this.css('display') == 'block'){
					$.each(_this.find('li'), function(){
						var _this = $(this);
						_this.css('height', '');
						var _this_h = _this.height();
						if(_h < _this_h) _h = _this_h;
					});
					_this.find('li').height(_h);
				}
			});

		}//pkg_list_h : function(){
	}//return{
})();//var clean = (function(){

	
	$(document).ready(function(){
		
		goDetail	= function(idx, ctg2, ctg3){
			$("#MGZ_MST_IDX").val(idx);
			$("#searchMgzMstThmCtg2").val(ctg2);
			$("#searchMgzMstThmCtg3").val(ctg3);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/cleanKingConView.do").submit();
		};
		    
		$(document).on("click", ".ico_search", function(){
			if($("#inp_search").val == ""){
				alert("검색어를 입력하세요.");
				$('#inp_search').focus();
				return;
			}else{
				//goSearch(1);
				$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/cleanKingSearch.do").submit();
			}
		});
		
		goSearch = function(cPage){
			$("#cPage").val(cPage);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/cleanKingConList.do").submit();
		};
		
		$(document).on("keydown", "#inp_search", function (e) {
	        if(e.keyCode == 13){
	            $(".ico_search").trigger("click");
	            return false;
	        }
	    });
		
		$(document).on("click", ".btn_white", function(e){
			$("#inp_search").val("");
			$(".search_list").html("");
			
		});
		
	    goView = function(idx){
	    	$("#MGZ_MST_IDX").val(idx);
	    	$("#gfrm").attr("action", "/pc/themecategory/cleanKingConView.do").submit();
	    };
	    
	    $(document).on("click", "#3depth", function(){
	    	var cmn_com_idx = $(this).data("cmn_com_idx");
	    	var mgz_mst_thm_ctg2 = $(this).data("mgz_mst_thm_ctg2");
	    	var mgz_mst_thm_ctg3 = $(this).data("mgz_mst_thm_ctg3");
	    	
	    	$("#cPage").val(1);
	    	$("#inp_search").val("");
	    	$("#CMN_COM_IDX").val(cmn_com_idx);
	    	$("#searchMgzMstThmCtg2").val(mgz_mst_thm_ctg2);
	    	$("#searchMgzMstThmCtg3").val(mgz_mst_thm_ctg3);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/cleanKingConList.do");
			$("#sFrm").submit();
		});
	    
	    $(document).on("click", "#2depth", function(){
	    	var mgz_mst_thm_ctg2 = $(this).data("mgz_mst_thm_ctg2");
	    	var cmn_com_idx = $(this).data("cmn_com_idx");
	    	
	    	$("#cPage").val(1);
	    	$("#inp_search").val("");
	    	$("#CMN_COM_IDX").val(cmn_com_idx);
	    	$("#searchMgzMstThmCtg2").val(mgz_mst_thm_ctg2);
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/cleanKingConList.do");
			//$("#sFrm").submit();
		});
	    
	    $(document).on("click", "#goEstimateBtn", function(){
			var _list 	= $('#pr_list ol li');
			var chk		= [];
			
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
				});
				$("#PRD_MST_CDs").val(chk);
				$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/estimateProcess.do").submit();
			}else{
				alert("체크된 상품이 없습니다.");
				return;
			}
			
		});
	    
	    $(document).on("click", "#putBtn", function(){
	    	var prd_mst_idx = $(this).data("prd_mst_cd");

	   		if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
				goProductView(prd_mst_idx);
				return;
			}else{
				return;
			}
	    	
	    });
	    
	    goProductView = function(prdMstCd){
			if(prdMstCd != ""){
				popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd + '&esmCart=theme',"1030","900","no","productViewPopup");
			}else{
				alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
				return;
			}
		};
	    
		//optDel		= function(){
		$(document).on("click", "#optDel", function(){		
			var chk = false,
				_this = $(this),
				_opt = _this.parents('.opt'),
				_li	= _this.parents('li');
			
			var _span			= _this.parent('span'),
				_opt_est_yn		= _span.data('opt_est_yn'),
				_prd_dtl_pirce	= _span.data('prd_dtl_pirce');
			
			var prdMstCd		= _opt.data('prd_mst_cd');
			var prdPrice		= _opt.data('prd_mst_price');

			var mPrice			= 0;
			
			if(_opt_est_yn == 'Y'){
				mPrice			= _prd_dtl_pirce - prdPrice;
			}else{
				mPrice			= _prd_dtl_pirce;
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
				_opt.html('<span><a href="javascript:void(0)" data-prd_mst_cd="'+ prdMstCd +'" id="putBtn">옵션선택</a></span>');
				_li.find("label").removeClass("on");
				$("#inp_ck_"+ prdMstCd).attr("checked", false);
				price	= $("#inp_ck_"+ prdMstCd).data("org");
				sellPrice = $("#inp_ck_"+ prdMstCd).data("prc");
				
				_li.find('.pr_m strong').text(setComma(price));
				_li.find(".sel_m strong").text(setComma(sellPrice));
			}

			pr_ck();
		});
		
		// 결제 페이지로 이동 
		setPaymentData = function(crtMemCrtDlvGbn){		
	 		
			var _list 	= $('#pr_list ol li');
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
				            url : "<c:out value="${frontDomain}" />/pc/themecategory/directPurchaseProcess.do",
				            success : function (data){ 
								switch (data.result) {
								case 1:
									$('#frm').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
									$('#frm').attr("method","post");
									<c:choose>
									<%-- 1. 비회원 --%>
									<c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
									//$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartLogin.do').submit();
									var url = "<c:out value="${serverSslDomain}"/>/pc/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD;
									url = encodeURIComponent(url);
						        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=<c:out value="${locationProtocol}"/>","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
									</c:when>
									<%-- 2. 회원 --%>
									<c:when test="${sessionUser.ROLE_USER eq 'user'}">
									$('#frm').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
									</c:when>
									</c:choose>
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
			
		};	// setPaymentData end 
		
		// 장바구니 담기
		inertCart = function(memCrtDlvGbn){
	
			var _list 	= $('#pr_list ol li');
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
				            url : "<c:out value="${frontDomain}" />/pc/themecategory/insertCartAjax.do",
				            success : function (data){ 
								switch (data.result) {
								case 1:
									$("#topCartCnt").html(data.cartCnt);
				            		com.laypop('show',0,'laypopCart');//팝업 show
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
		};			// inertCart end
		
		goCartList = function(){
			$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();	
		};
	});	

var theme = {
	pkg_list_h :function(){
		/*
			옵션 추가되면 리스트 높이 맞쳐줘요
		*/
		var _pr_list = $('.package_con .pr_list');
		$.each(_pr_list, function(){
			var _this = $(this),
				_h = 0;
			if(_this.css('display') == 'block'){
				$.each(_this.find('li'), function(){
					var _this = $(this);
					_this.css('height', '');
					var _this_h = _this.height();
					if(_h < _this_h) _h = _this_h;
				});
				_this.find('li').height(_h);
			}
		});

	},//pkg_list_h : function(){	
	pr_ck: function(_label){
		var all_pr = 0,
			pk_pr = 0,
			_pr_d = $('.wedding_d .package_con .total_price .prc')
			tx_all_pr = _pr_d.find('.all .money'),
			tx_pk_pr = _pr_d.find('.pk .money'),
			tx_save_pr = _pr_d.find('.save strong');
		
		$.each(_label, function(i){
			var _this = $(this);
			if( _this.hasClass('on') ){
				
				var _next = _this.next();
				all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
				pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
			}
		});
		String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
		tx_all_pr.text(String(all_pr).number_format());
		tx_pk_pr.text(String(pk_pr).number_format());
		tx_save_pr.text(String(all_pr-pk_pr).number_format());
	},//pr_ck: function(_label){
	
	pr_ck2: function(_label){
		var _label = $(_label);
		var all_pr = 0,
			pk_pr = 0,
			_pr_d = $('.wedding_d .package_con .total_price .prc')
			tx_all_pr = _pr_d.find('.all .money'),
			tx_pk_pr = _pr_d.find('.pk .money'),
			tx_save_pr = _pr_d.find('.save strong');
		
		$.each(_label, function(i){
			var _this = $(this);
			if( _this.hasClass('on') ){
									
				var _next = _this.next();
				all_pr += parseInt(_next.find('.pr_m strong').text().replace(/,/gi,'')),
				pk_pr += parseInt(_next.find('.sel_m strong').text().replace(/,/gi,''));
			}
		});
		String.prototype.number_format = function() { return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); }; 
		tx_all_pr.text(String(all_pr).number_format());
		tx_pk_pr.text(String(pk_pr).number_format());
		tx_save_pr.text(String(all_pr-pk_pr).number_format());
	}//pr_ck2: function(_label){
}
			
</script>