<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<style>
	.price-after .discount {
		position: fixed!important;
	    top: -1000em !important;
	    left: 0;
	    display: block;
	    overflow: hidden;
	}
</style>
</head>
<body class="page-estimate">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>대량구매 견적 상품 선택</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="estimate-guide accordion" data-role="collapsible-set"><!-- estimate-guide -->
            <div class="section" data-role="collapsible" data-collapsed="true">
                <h3>
                    <strong>대량구매 견적 신청 방법</strong>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <table class="table-b table-row" border="0" cellpadding="0" cellspacing="0"><!-- table-b -->
                    <caption>단계 별로 구성된 나만의 맞춤견적 신청 방법 안내 테이블입니다.</caption>
                    <colgroup>
                        <col style="width: 27%;">
                        <col style="width: auto;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">STEP01<br />대량구매<br />견적 상품 검색</th>
                            <td>
                                카테고리 검색으로 원하는 상품을 찾아서 선택해주세요.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">STEP02<br />대량구매<br />견적 상품 담기</th>
                            <td>
                                선택하신 상품을 견적서에 담아주세요.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">STEP03<br />희망금액 입력</th>
                            <td>
                                구매 원하는 희망금액과 연락처를 입력해주세요.
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">STEP04<br />대량구매<br />견적 신청하기</th>
                            <td>
                                선택하신 상품과 가격, 구매 희망금액을 확인하신 후에 &lsquo;견적요청&rsquo;을 선택해 주세요.
                            </td>
                        </tr>
                    </tbody>
                    </table><!-- // table-b -->

                    <div class="section-button text-right mt15"><!-- section-button -->
                        <a href="javascript:$.com.util.layPop('open', $('#estimateGuide'));" class="button primary small"><span>나만의 맞춤견적이란?</span></a>
                    </div><!-- // section-button -->

                    <section id="estimateGuide" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #estimateGuide -->
                        <dl class="ui-content">
                            <dt>
                                <h2>대량구매 견적이란?</h2>
                                <a href="javascript:$.com.util.layPop('close', $('#estimateGuide'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
                            </dt>
                            <dd class="tx_msg">
                                <p>
                                    마켓플랜트가 판매하는 다양한 상품을 대량으로 구매원하시거나, 견적의뢰가 필요하실 경우 신청주시면 견적 희망금액을 확인하여 상품 구매를 도와드리는 서비스입니다.
                                </p>

                                <hr>

                                <strong>대량구매 견적 유의사항</strong>

                                <p class="warning gray mt15">
                                    대량구매 견적 서비스 신청은 요청하신 희망금액을 확인하여 견적 결과를 확인하신 후 주문이 가능합니다.<br />
                                    견적 신청 결과는 <a href="javascript:;" class="primary">마이페이지&gt;쇼핑활동&gt;MY견적</a>에서 확인 가능합니다. 
                                </p>

                                <p class="warning gray mt10">
                                    구매금액 50만원 이하는 견적에서 제외될 수 있으니 일반 구매를 이용해주시기 바랍니다.
                                </p>

                                <p class="warning gray mt10">
                                    총 구매수량이 5개 이상이어야 구매가 가능합니다.
                                </p>

                                <p class="warning gray mt10">
                                    대량구매를 통해 할인된 금액으로 구매 시 쿠폰할인은 적용되지 않습니다.  서비스 이용에 참고하시기 바랍니다. 
                                </p>
                            </dd>
                        </dl>
                    </section><!-- // #estimateGuide -->
                </div>
            </div>
        </div><!-- // estimate-guide -->
        
        <h3 class="title-estimate-item"><span class="large">나만의 맞춤견적 상품 선택</span></h3>
		<form name="frm" id="frm" method="post">
		<input type="hidden" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="" />
		<input type="hidden" id="_parent_idx" value="" />
		<input type="hidden" id="_totalPageCount" value="" />
       
        <div class="estimate-item pr_info_d" ><!-- estimate-guide -->
            <div class="padder">
            	<div class="search-form mt15"><!-- search-form -->
	               	<h5>카테고리 선택</h5>
	                <p>
	                    <label for="depth1" class="sel_box_st0">
	                        <select id="category1" name="category1" class="select">
	                            <option value="">대카테고리</option>
	                            <c:forEach var="row" items="${categoryList }">
	                            	<option value="<c:out value="${row.PRD_CTG_IDX }" />"><c:out value="${row.PRD_CTG_NM }" /></option>
	                            </c:forEach>
	                        </select>
	                    </label>
	                </p>
	                <p>
	                    <label for="depth2" class="sel_box_st0">
	                        <select id="category2" name="category2" class="select">
	                            <option value="">중카테고리</option>
	                        </select>
	                    </label>
	                </p>
	                <p>
	                    <label for="depth3" class="sel_box_st0">
	                        <select id="category3" name="category3" class="select">
	                            <option value="">소카테고리</option>
	                        </select>
	                    </label>
	                </p>
	                <p>
	                    <label for="itemName" class="tit">상품명 검색</label>
	                    <input type="text" id="productName" class="text">
	                </p>
	                <p>
	                    <label for="itemNumber" class="tit">상품번호 검색</label>
	                    <input type="text" id="productNumber" class="text">
	                </p>
	                <div class="action mt20">
						<a href="javascript:;" class="button primary full" id="searchBtn"><span>검색하기</span></a>
					</div>
				</div><!-- // search-form -->

	           <div class="product-list-wrap"><!-- product-list-wrap -->
	               <ul class="product-list _scroll_list_ck" id="cateList">
	                   
	               </ul>
	           </div><!-- // product-list-wrap -->
			</div>            
		</div><!-- // estimate-guide -->
		            
		</form>	
		<div id="optlayer"></div>
		<div class="fixed_btnBox_b" style="display:none;"><!-- fixed_btnBox_b-->
			<a href="javascript:goEstimate();" class="button warning full"><span>대량견적서 가기 (총 <c:out value="${totalCount }" />개 )</span></a>
		</div><!-- // fixed_btnBox_b-->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->

<script>
$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
    
    /*
        _idx = 리스트감싸고있는 객체
        _reNum = 리턴 몇번째넘어왔는지
    */
    
    var _parent_idx		= $("#_parent_idx").val();
    var total			= 0;
    
    if(_parent_idx != 0){
        
    	var url			= "";
    	
    	url		= "<c:out value="${mobileDomain}" />/mobile/product/myEstimateCateSearchAjax.do";
    	total	= $("#_totalPageCount").val();
    	
    	if(total == ""){
    		total	= 0;
    	}
    	
	    if(total > 0){
		    if(_reNum <= total){
		        var _list_html = "";
		        //리스트 추가!
		        //_idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
		        //console.log('_reNum = '+_reNum);
		        $.ajax({
	    			type	: "POST",
					url		:  url,
					dataType: "json",
					data	: {"cPage" : _reNum + 2
								, "category1" : $("#category1").val()
								, "category2" : $("#category2").val()
								, "category3" : $("#category3").val()
								, "productName" : $("#productName").val()
								, "productNumber": $("#productNumber").val()
								},
					success : function(data) {
						if(data.MEM_LOGIN_YN == 'Y'){
							$.each(data.list, function(i,item){
								
								_list_html		+= '<li>';
								_list_html		+= '<div class="module">';
								_list_html		+= '<a href="javascript:;">';
								_list_html		+= '<span class="thumb"><img data-original="<c:out value="${cdnDomain}" />'+ item.IMG_THUMBNAIL +'" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="" /></span>';
		                        _list_html		+= '<span class="subject">' + item.PRD_MST_NM + '</span>';
		                        _list_html		+= '</a>';
		                        _list_html		+= '<p class="price-after">';
		                        _list_html		+= '<span class="blind">판매가</span><strong class="large">'+ comma(item.PRD_MST_ERP_PRC) +' </strong>원';
								_list_html		+= '<em class="discount">';
								_list_html		+= '<span class="blind">할인률</span>';
								_list_html		+= '<strong class="tx_num">' + item.SALE +'</strong>%';
								_list_html		+= '</em>';
								_list_html		+= '</p>';
								_list_html		+= '</div>';
								_list_html		+= '<div class="action">';
								_list_html		+= '<a href="javascript:void(0)" data-prd_mst_cd="'+ item.PRD_MST_CD + '" data-prd_mst_opt_est_cnt="' + item.PRD_MST_OPT_EST_CNT + '" data-prd_mst_price="'+ item.PRD_MST_ERP_DSP_PRC+'" class="button primary" id="putBtn"><span>담기</span></a>';
								_list_html		+= '</div>';
								_list_html		+= '</li>';
							});
							
							$("#cateList").append(_list_html);
							$("#cateList").find('img').lazyload();
						}else{
							// 로그인 팝업 
						}
					}, error : function(err) {
						window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
					}
		        });
		    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
	    }
    }
}

$(document).ready(function(){
	$.each($('.accordion'), function(i){
		$(this).attr('data-idx', i);
	});

	$( ".section" ).collapsible({
		expand: function( e, ui ) {//열림
			var _this = $(this),
				_parent_idx = _this.parent().data('idx'),
				_parnet_acc = _this.parents('.accordion').siblings('.accordion');
		
			//나머지거닫아
			$.each(_parnet_acc, function(i){
				if($(this).find('.ui-collapsible-content').attr('aria-hidden') == 'false'){
					$(this).find('.ui-collapsible-heading').trigger('click');
				}
			});
			
			$.com.win_scrollList = true;//스크롤 할거야~
			_scroll_list = _this.find('.ui-collapsible-content');
			$.com.util.scrollList(_scroll_list);

			$("#_parent_idx").val(_parent_idx);
		},
		collapse: function( e, ui ) {//닫힘
			var _this = $(this),
				_parent_idx = _this.parent().data('idx');

			$.com.win_scrollList = false;//스크롤 안할거야
		}
	});
	
	$(document).on("change", "#category1", function(){
    	var val	= this.value;
    	
    	$.ajax({
			type	: "POST",
			url		: "<c:out value="${mobileDomain}" />/mobile/product/myEstimateCateAjax.do",
			dataType: "json",
			data	: {"PRD_CTG_IDX" : val , "PRD_CTG_ENV":"M"},
			success : function(data) {
				if(data.MEM_LOGIN_YN == 'Y'){
					var innerHtml	= '<option value="">중카테고리</option>';
					
	    		 	$.each(data.categoryList, function(i,item){
	    		 		innerHtml += '<option value="' + item.PRD_CTG_IDX + '">' + item.PRD_CTG_NM + '</option>'
	    		 	});
	    		 	
         			$("#category2").html(innerHtml).change();
         			$("#category3").html('<option value="">소카테고리</option>').change();
	         			
				}else{
					//로그인 팝업
					var url = location.href;
					if(appType){
						callJavascriptLoginUrl(url); //app 로그인 연동
					}else{
						url = encodeURIComponent(url);
			        	location.target = "_self";
			        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
					}
				}
			}, error : function(err) {
				window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
    });
	    
	$(document).on("change", "#category2", function(){
		var val	= this.value;
    	$.ajax({
			type	: "POST",
			url		: "<c:out value="${mobileDomain}" />/mobile/product/myEstimateCateAjax.do",
			dataType: "json",
			data	: {"PRD_CTG_IDX" : val , "PRD_CTG_ENV":"M"},
			success : function(data) {
				if(data.MEM_LOGIN_YN == 'Y'){
					var innerHtml	= '<option value="">소카테고리</option>';
					
	    		 	$.each(data.categoryList, function(i,item){
	    		 		innerHtml += '<option value="' + item.PRD_CTG_IDX + '">' + item.PRD_CTG_NM + '</option>'
	    		 	});
	                	
         			$("#category3").html(innerHtml).change();
				}else{
					//로그인 팝업
					var url = location.href;
					if(appType){
						callJavascriptLoginUrl(url); //app 로그인 연동
					}else{
						url = encodeURIComponent(url);
			        	location.target = "_self";
			        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
					}
				}
			}, error : function(err) {
				window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
    });
	
	$(document).on("click", "#searchBtn", function(){
		goCatePage(1);
	});
	
	goCatePage			= function(cPage){
		
		$.ajax({
    		type	: "POST",
			url		: "<c:out value="${mobileDomain}" />/mobile/product/myEstimateCateSearchAjax.do",
			dataType: "json",
			data	: {"category1" : $("#category1").val()
						, "category2" : $("#category2").val()
						, "category3" : $("#category3").val()
						, "productName" : $("#productName").val()
						, "productNumber": $("#productNumber").val()
						},
			success : function(data) {
				if(data.MEM_LOGIN_YN == 'Y'){
					var innerHtml		= "";
					var pageInnerHtml	= "";
					var _list_html 		= "";
					
					if(data.totalCount > 0){
						
						$.each(data.list, function(i,item){
							
							_list_html		+= '<li>';
							_list_html		+= '<div class="module">';
							_list_html		+= '<a href="javascript:;">';
							_list_html		+= '<span class="thumb"><img data-original="<c:out value="${cdnDomain}" />'+ item.IMG_THUMBNAIL +'" src="<c:out value="${cdnDomain}"/>/mobile/img/lay/grey.gif" alt="" /></span>';
	                        _list_html		+= '<span class="subject">' + item.PRD_MST_NM + '</span>';
	                        _list_html		+= '</a>';
	                        _list_html		+= '<p class="price-after">';
	                        _list_html		+= '<span class="blind">판매가</span><strong class="large">'+ comma(item.PRD_MST_DSP_PRC) +' </strong>원';
							_list_html		+= '<em class="discount">';
							_list_html		+= '<span class="blind">할인률</span>';
							_list_html		+= '<strong class="tx_num">' + item.SALE +'</strong>%';
							_list_html		+= '</em>';
							_list_html		+= '</p>';
							_list_html		+= '</div>';
							_list_html		+= '<div class="action">';
							_list_html		+= '<a href="javascript:void(0)" data-prd_mst_cd="'+ item.PRD_MST_CD + '" data-prd_mst_opt_est_cnt="' + item.PRD_MST_OPT_EST_CNT + '" data-prd_mst_price="'+ item.PRD_MST_ERP_DSP_PRC+'" class="button primary" id="putBtn"><span>담기</span></a>';
							_list_html		+= '</div>';
							_list_html		+= '</li>';
						});
						
						$("#_totalPageCount").val(data.totalPageCount);
						$("#cateList").html(_list_html);
						$("#cateList").find('img').lazyload();
						$("#cateList").data('returnNum', 0);
					}
					
				}else{
					//로그인 팝업
					var url = location.href;
					if(appType){
						callJavascriptLoginUrl(url); //app 로그인 연동
					}else{
						url = encodeURIComponent(url);
			        	location.target = "_self";
			        	location.href = "<c:out value="${mobileSslDomain}"/>/mobile/manager/login.do?url=" + url;
					}
				}
			}, error : function(err) {
				window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
			}
    	});
	};			// goCatePage
	
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	goEstimate			= function(){
		location.href = "<c:out value="${serverDoamin}" />/mobile/product/estimateList.do";
	};
});

//goEstimate			= function(){
$(document).on("click", "#putBtn", function(){	
	var prd_mst_idx 		= $(this).data("prd_mst_cd");
	var prd_mst_opt_est_cnt = $(this).data("prd_mst_opt_est_cnt");
	var prd_mst_price		= $(this).data("prd_mst_price");
	
	if(prd_mst_opt_est_cnt > 0){
		if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
				optlayer2(prd_mst_idx, prd_mst_price);
				return;
			}else{
				return;
			}
	}else{
		$.ajax({
			async : false,
            type : "POST",
            data : {
            			"PRD_MST_CD" : prd_mst_idx
            			,"OPT_DTL_IDXs" : 0
            			,"REQUEST_CNT_0" : 1
            			,"MEM_CRT_DLV_GBN" : 2096
            		},
            url : "<c:out value="${frontDomain}" />/mobile/product/insertEsmCartAjax.do",
            success : function (data){
            	// 1 : 장바구니 등록 성공
            	alert("성공했습니다.");
            	goMyEsmList();
            }, error : function (err){
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
    	});	
	}
});

</script>
</body>
</html>
<%@ include file="/WEB-INF/jsp/mobile/include/productOptPop.jsp" %>