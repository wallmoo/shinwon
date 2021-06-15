<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<script src="http://maps.googleapis.com/maps/api/js?AIzaSyCGYENlkXWUE5dh5IlzT6hZhPtlMu98mlI&signed_in=true"async defer></script>
<script>
var	_pickup, _step1, _step2, map, markers = [];
_get = {				
	step_h : function(){//step높이
		$('.step1, .step2').removeAttr('height');
		var _step1_h = _step1.outerHeight(true),
			_step2_h = _step2.outerHeight(true);

		if(_step1_h > _step2_h) _step2.height(_step1_h);
		else _step1.height(_step2_h);
	},//step_h : function(){
	resetMap : function(_xy){
		mapOpt = {
			zoom: 15,
			center: {lat: _xy.lat, lng: _xy.lng},//처음좌표
			mapTypeId: 'roadmap',
			scrollwheel: false
		},
		geocoder = new google.maps.Geocoder();
		map = new google.maps.Map($('#map')[0], mapOpt);

	},//resetMap : function(_xy){
	addMarker :	function (position, title, content){
		var marker = new google.maps.Marker({
			position: position,
			map: map,
			animation: google.maps.Animation.DROP,
			title: '마켓플랜트 '+title
		});
		map.setCenter(position);
		markers.push(marker);			
	}//addMarker :	function (position, title, content){
};//_get
$(document).ready(function(){
	_pickup = $('.pickup_pop'),
	_step1 = $('.step1'),
	_step2 = $('.step2');	

	//체크박스
	/*$('.chk_label').on('click', function(){
		var _this = $(this);
        if(_this.hasClass('on')) _this.removeClass('on').children('input').prop('checked', false);
        else _this.addClass('on').children('input').prop('checked', true).trigger("change");
        
        return false
	});*/

	//픽업가능매장정보 기능
	var _shop_list = $('.shop_list'),
		_list_tr = _shop_list.find('tbody tr');
	
	$.each(_list_tr, function(){
		var _this = $(this),
			_name = _this.children('.td_name'),
			_visitDate = _this.children('.tx_visitDate');
		
		//매장찾기open
		_name.find('a').on('click', function(){
			var _this = $(this),
				_prev = _this.prev(),
				_xy = {lat: _prev.data('lat'), lng: _prev.data('lng')},//_xy
				_name = _prev.text();//지점 이름
			if(!_pickup.hasClass('open')){
				_pickup.addClass('open');
				_step2.show();//step2높이

				re_size();
				_get.resetMap(_xy);
			}
			_get.step_h();//step2개 높이맞추기
			_get.addMarker(_xy, _name, '내용');
			
			//매장별 정보
			$("#storeWekTime").html($(this).data('tab_wektiem')+"<br>"+$(this).data('tab_wekendtime'));//업업시간
			$("#storeHpNo").html($(this).data('tab_hpno'));//매장연락처
			$("#storeTrs").html($(this).data('tab_trs'));//대중교통
			$("#storeNm").html($(this).data('tab_nm'));//매장명
		});

		//방문 예정일
		_visitDate.find('>.f .btn_calendar').on('click', function(){
			$(this).datePickr();//달력
			return false;
		});

	});

	$(".btn_calendar").trigger("click");
	re_size();
});

function re_size(){//이거가 팝업 사이즈
	var _con_w = 0, _con_h = 0;
	$('.contents').removeAttr('style');
	$.each($('.contents').children(), function(){
		var _this = $(this);
		if(_this.css('display') != 'block') return;

		_con_w += _this.outerWidth(true);
		if(_con_h <= _this.outerHeight(true)) _con_h = _this.outerHeight(true)+40; 
	});
	$('.contents').css({width:_con_w,height:_con_h});
	com.pop_chk(false);
}

$(function(){
	
	goProduct = function(prdMstCd){
		window.open("<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd="+prdMstCd);
		self.close();
	};
	
	goPage = function (cPage) 
    {
		var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductStorePopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    //지역별 검색
    $(document).on("click", "#searchShpMstArea", function ()
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='cPage']").val(1);
        $frm.find("input[name='searchYn']").val("Y");
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductStorePopup.do", "target":"_self", "method":"post"}).submit();
    });
    //당일수령가능 매장 검색
    $(document).on("change", "#searchShpMstNow", function ()
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='cPage']").val(1);
        $frm.find("input[name='searchYn']").val("Y");
        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/searchProductStorePopup.do", "target":"_self", "method":"post"}).submit();
    });
    
 	// 장바구니 담기
	inertCart = function(sortNum,shpMstIdx,shpMstPiup){
		var openerType = $("#openerType").val();
		var now = new Date();
		var year= now.getFullYear();
		var hours = now.getHours();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var nowDate = year +"-"+ mon +"-"+ day;
		
 		if(shpMstIdx == ""){
 			alert("필수값이 없습니다.\n다시 시도해주세요.");
 			return;
 		}
 		//방문예정일 및 받는 시간 선택
 		if($("input[name=shpMstPkuDt]").eq(sortNum).val() == ""){
 			alert("받는날짜를 선택해주세요.");
 			$("input[name=shpMstPkuDt]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupDate = $("input[name=shpMstPkuDt]").eq(sortNum).val();
 		
 		if($("select[name=shpMstPkuHh]").eq(sortNum).val() == ""){
 			alert("받는시간을 선택해주세요.");
 			$("select[name=shpMstPkuHh]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupStTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[0];
 		var piupEdTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[1];
 		piupStTm = piupStTm.split(":")[0];
 		piupEdTm = piupEdTm.split(":")[0];
 		
 		//구매가능한 시간 체크
 		if(shpMstPiup == "NOW" && (piupDate == nowDate)){
 			
 			if((hours + 2) >= parseInt(piupStTm)){
 				alert("주문할 수 없는 시간입니다.");
 				return;
 			}
 		}
 		
 		$("#MEM_CRT_GET_PKU_DT").val($("input[name=shpMstPkuDt]").eq(sortNum).val().replace(/\-/g,""));
 		$("#MEM_CRT_GET_PKU_HH").val($("select[name=shpMstPkuHh]").eq(sortNum).val());
 		$("#MEM_CRT_SHP_MST_IDX").val(shpMstIdx);
 		
 		$.ajax
        ({
            async : false,
            type : "POST",
            data : $("#frm").serialize(),
            url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		if(openerType == "list"){
            			opener.opener.$("#topCartCnt").html(data.cartCnt);
            		}else{
            			opener.$("#topCartCnt").html(data.cartCnt);
            		}            			
            		com.laypop('show',0,'laypopCart');//팝업 show
            		break;
            	case -2:
            		$("#G020_text").html("기존에 담긴 겟잇나우 상품과 방문일자가 달라<br/> 장바구니에 담을 수 없습니다.");
            		com.laypop('show',0,'laypopGO2O');//팝업 show
            		break;
            	case -3:
            		$("#G020_text").html("겟잇나우 장바구니는 <br/><strong class=\"co_sky\">매장별 3개</strong>까지 생성 가능합니다.<br/>현재 장바구니에 담긴 상품을 <br/>먼저 주문해주시기 바랍니다.");
            		com.laypop('show',0,'laypopGO2O');//팝업 show
            		break;
            	default :
            		alert(data.resultMsg);
            		break;
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
		});
	};
	
	// 바로구매
	directPurchase = function(sortNum,shpMstIdx,shpMstPiup){
		var openerType = $("#openerType").val();
		var now = new Date();
		var year= now.getFullYear();
		var hours = now.getHours();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var nowDate = year +"-"+ mon +"-"+ day;
		
		if(shpMstIdx == ""){
 			alert("필수값이 없습니다.\n다시 시도해주세요.");
 			return;
 		}
 		//방문예정일 및 받는 시간 선택
 		if($("input[name=shpMstPkuDt]").eq(sortNum).val() == ""){
 			alert("받는날짜를 선택해주세요.");
 			$("input[name=shpMstPkuDt]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupDate = $("input[name=shpMstPkuDt]").eq(sortNum).val();
 		
 		if($("select[name=shpMstPkuHh]").eq(sortNum).val() == ""){
 			alert("받는시간을 선택해주세요.");
 			$("select[name=shpMstPkuHh]").eq(sortNum).focus();
 			return;
 		}
 		
 		var piupStTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[0];
 		var piupEdTm = $("select[name=shpMstPkuHh]").eq(sortNum).val().split("~")[1];
 		piupStTm = piupStTm.split(":")[0];
 		piupEdTm = piupEdTm.split(":")[0];
 		
 		//구매가능한 시간 체크
 		if(shpMstPiup == "NOW" && (piupDate == nowDate)){
 			
 			if((hours + 2) >= parseInt(piupStTm)){
 				alert("주문할 수 없는 시간입니다.");
 				return;
 			}
 		}
 		
 		$("#MEM_CRT_GET_PKU_DT").val($("input[name=shpMstPkuDt]").eq(sortNum).val().replace(/\-/g,""));
 		$("#MEM_CRT_GET_PKU_HH").val($("select[name=shpMstPkuHh]").eq(sortNum).val());
 		$("#MEM_CRT_SHP_MST_IDX").val(shpMstIdx);
 		
		$.ajax
        ({
            async : false,
            type : "POST",
            data : $("#frm").serialize(),
            url : "<c:out value="${frontDomain}" />/pc/cart/insertDirectPurchaseAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		if(openerType == "list"){
	            		opener.opener.$('#_blank_form').html("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
	            		opener.opener.$('#_blank_form').attr("method","post");	
	            		<c:choose>
	                    <%-- 1. 비회원 --%>
	                    <c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
			        	//$('#_blank_form').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartLogin.do').submit();
			        	var url = opener.opener.location.href;
			        	url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&ORD_MST_CD=" + data.ORD_MST_CD,"loginPopup","width=620,height=540,scrollbars=no,target=_blank");
	                    </c:when>
	                    <%-- 2. 회원 --%>
	                    <c:when test="${sessionUser.ROLE_USER eq 'user'}">
	                    opener.opener.$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do'}).submit();
	                    </c:when>
	                    </c:choose>
	                    opener.self.close();
	                    self.close();
            		}else{
            			opener.$('#_blank_form').html("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
	            		opener.$('#_blank_form').attr("method","post");	
	            		<c:choose>
	                    <%-- 1. 비회원 --%>
	                    <c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
			        	//$('#_blank_form').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartLogin.do').submit();
			        	var url = opener.location.href;
			        	url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&ORD_MST_CD=" + data.ORD_MST_CD,"loginPopup","width=620,height=540,scrollbars=no,target=_blank");
	                    </c:when>
	                    <%-- 2. 회원 --%>
	                    <c:when test="${sessionUser.ROLE_USER eq 'user'}">
	            		opener.$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do'}).submit();
	                    </c:when>
	                    </c:choose>
	                    self.close();
            		}
	                    
            		break;
            	default :
            		alert(data.resultMsg);
            		break;	
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
		});
		
		$(".selectedPrdOpt_0").prop("disabled", false);
	};
	
	//장바구니 이동
	goCartList = function(){
		var openerType = $("#openerType").val();
		if(openerType == "list"){
			opener.goCartList();	
		}else{
			opener.$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();
		}
		self.close();
	};
	
	
}); //function
</script>
</head>

<body class="page-popup"><!-- page-list -->
<!-- #wrap S -->
<section id="wrap">	
	<!-- #container S -->
	<article id="container" class="container pickup_pop">
		<form id="frm" name="frm">
		<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }" />" />
		<input type="hidden" name="MEM_CRT_DLV_GBN" id="MEM_CRT_DLV_GBN" value="2097" /><!-- 상품유형(겟잇나우) -->
		<input type="hidden" name="searchYn" value="N"/>
		<input type="hidden" id="MEM_CRT_GET_PKU_DT" name="MEM_CRT_GET_PKU_DT" />
		<input type="hidden" id="MEM_CRT_GET_PKU_HH" name="MEM_CRT_GET_PKU_HH" />
		<input type="hidden" id="MEM_CRT_SHP_MST_IDX" name="MEM_CRT_SHP_MST_IDX" />
		<input type="hidden" id="TOT_PRD_MST_PRC" name="TOT_PRD_MST_PRC" value="<c:out value="${commandMap.TOT_PRD_MST_PRC }" />" />
		<input type="hidden" id="openerType" name="openerType" value="<c:out value="${commandMap.openerType }" />" />
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		<div class="contents ct"><!-- .contents S -->
			
			<!-- .step1 S -->
			<article class="step1">
				<h1>픽업 매장 선택</h1>
				<hr class="bg_line_7px" />
				<dl class="pr_info">
					<dt>
						<strong class="blind">선택한 상품 정보</strong>
						<img src="<c:out value="${cdnDomain }"/><c:out value="${productInfo.PRD_IMAGE }" />" class="thumb198" alt="<c:out value="${productInfo.PRD_IMAGE_ALT }" />" />
					</dt>
					<dd>
						<span class="ti"><c:out value="${productInfo.PRD_MST_NM }" /></span>
						<c:choose>
							<c:when test="${not empty addOptDtlList }">
								<c:forEach var="addOptDtlList" items="${addOptDtlList }" varStatus="status">
									<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" />
									<input type="hidden" name="REQUEST_CNT_<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" id="REQUEST_CNT_<c:out value="${addOptDtlList.OPT_DTL_IDX }" />" value="<c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />" />
									<span class="tx_opt"><c:out value="${addOptDtlList.OPT_DTL_ADD_PRC_NM }" /> / 수량 : <c:out value="${addOptDtlList.OPT_DTL_REQ_CNT }" />개</span>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value="0" />
							</c:otherwise>
						</c:choose>
						<strong class="tx_price"><fmt:formatNumber value="${commandMap.TOT_PRD_MST_PRC }" groupingUsed="true" /><span>원</span></strong>
					</dd>
				</dl>
				<hr class="bg_line_7px" />
				
				<dl class="shop_info">
					<dt>
						<strong>픽업가능한  매장정보</strong>

						<div class="type_box">
							<label for="" class="chk_label js-checkbox <c:if test="${commandMap.searchShpMstNow eq 'Y' }" >on</c:if>">
								<input type="checkbox" name="searchShpMstNow" id="searchShpMstNow" value="Y"  />
								<span>당일수령 가능한 매장만 보기</span>
							</label>

							<label for="" class="sel_label">
								<select name="searchShpMstArea" id="searchShpMstArea" class="sel_chg">
									<option value="">전체</option>
						           <c:if test="${not empty areaCodeList }">
						               <c:forEach var="codeRow" items="${areaCodeList }" varStatus="i">
						                   <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${commandMap.searchShpMstArea eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
						                       <c:out value="${codeRow.CMN_COM_NM }"/>
						                   </option>
						               </c:forEach>
						           </c:if>
								</select>
							</label>
						</div>
					</dt>
					<dd class="shop_list">
						<table>
							<caption>픽업가능한 매장정보에 매장명, 픽업 가능일, 방문 예정일, 선택으로 구성된 표</caption>
							<colgroup>
								<col />
								<col style="width:146px" />
								<col style="width:163px" />
								<col style="width:102px" />
							</colgroup>
							<thead>
								<tr>
									<th><strong>매장명</strong></th>
									<th><strong>픽업 가능일</strong></th>
									<th><strong>방문 예정일</strong></th>
									<th><strong>선택</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
					        		<c:when test="${not empty StoreList }">
					        			<c:set var="sortNum" value="0" />
					        			<c:forEach var="StoreList" items="${StoreList }" varStatus="status">
					        				<tr>
								                <td class="f td_name">
								                	<div>
									                	<strong data-lat="<c:out value="${StoreList.SHP_MST_LTTD}" />" data-lng="<c:out value="${StoreList.SHP_MST_LGTD}" />"><c:out value="${StoreList.SHP_MST_NM}" /></strong>
									                	<a href="javascript:void(0)" data-tab_nm="<c:out value="${StoreList.SHP_MST_NM}" />" data-tab_hpno="<c:out value="${StoreList.SHP_MST_TEL}" />" data-tab_trs="<c:out value="${StoreList.SHP_MST_MAS_TRS}" />" data-tab_wektiem="<c:out value="${StoreList.SHP_WEK_TIME}" />" data-tab_wekendtime="<c:out value="${StoreList.SHP_MST_WEK_END_TIME}" />" ><span>매장위치 및 영업시간</span><i class="ico_ar"></i></a>
								                	</div>
								                </td>
								                <td class="tx_pikupDate">
								                	<c:choose>
								                		<c:when test="${StoreList.SHP_MST_PIUP eq 'NOW' }">
								                			<strong><c:out value="${StoreList.SHP_MST_PIUP_DAY}" /></strong>
								                			<span>당일수령가능<br/>(<c:out value="${StoreList.SHP_MST_PIUP_TIME}" /> 주문까지)</span>
								                		</c:when>
								                		<c:otherwise>
								                			<strong><c:out value="${StoreList.SHP_MST_PIUP_DAY}" /></strong>
								                			<span><c:out value="${StoreList.SHP_MST_PIUP_NEXT_DAY}" />부터 수령가능</span>
								                		</c:otherwise>
								                	</c:choose>
								                </td>
								                <td class="tx_visitDate">
													<label for="" class="f">
														<c:choose>
									                		<c:when test="${StoreList.SHP_MST_PIUP eq 'NOW' }">
									                			<input type="text" name="shpMstPkuDt" id="shpMstPkuDt" data-min="<c:out value="${StoreList.ST_CAL_NOW_ST_DAY }" />" data-max="<c:out value="${StoreList.ST_CAL_NOW_ED_DAY }" />" value="" placeholder="받는날짜선택" readonly=true/>
									                		</c:when>
									                		<c:otherwise>
									                			<input type="text" name="shpMstPkuDt" id="shpMstPkuDt" data-min="<c:out value="${StoreList.ST_CAL_NEXT_ST_DAY }" />" data-max="<c:out value="${StoreList.ST_CAL_NEXT_ED_DAY }" />" value="" placeholder="받는날짜선택" readonly=true/>
									                		</c:otherwise>
									                	</c:choose>
														<a href="javascript:;" class="btn_calendar"><span class="ir">달력</span></a>
													</label>
													<label for="" class="l">
														<select name="shpMstPkuHh" id="shpMstPkuHh" class="sel_chg">
															<option value="">받는시간선택</option>
															<c:forEach var="TIMESTR" items="${StoreList.TIMESTR }" varStatus="status">
																<option value="<c:out value="${TIMESTR }" />"><c:out value="${TIMESTR }" /></option>
															</c:forEach>
														</select>
													</label>
								                </td>
								                <td class="l td_btn">
													<a href="javascript:directPurchase('<c:out value="${sortNum }" />','<c:out value="${StoreList.SHP_MST_IDX }" />','<c:out value="${StoreList.SHP_MST_PIUP }" />')" class="btn_rd"><span>바로구매</span></a>
													<a href="javascript:inertCart('<c:out value="${sortNum }" />','<c:out value="${StoreList.SHP_MST_IDX }" />','<c:out value="${StoreList.SHP_MST_PIUP }" />');" class="btn_bl_777"><span>장바구니</span></a>
												</td>
								            </tr>
								            <c:set var="sortNum" value="${sortNum + 1 }" />
					        			</c:forEach>
					        		</c:when>
					        		<c:otherwise>
					        			<tr><td colspan=4 align=center>선택 가능한 매장이 없습니다.</td></tr>
					        		</c:otherwise>
					        	</c:choose>
							</tbody>
						</table>
						</from>
				    	
				         <div class="section-pagination"><!-- section pagination -->
				             <ui:frontpaging paging="${paging }" jsFunction="goPage" />
				         </div><!-- // section pagination -->
					</dd>
				</dl>
			</article>
			<!--// .step1 E -->

			<!-- .step2 S -->
			<article class="step2">
				<dl>
					<dt class="shop_name">
						<span>매장위치 및 영업시간</span>
						<strong id="storeNm">용산점</strong>
					</dt>
					<dd class="shop_info_tx">
						<div id="map" class="map"></div>
						<div id="right-panel"></div>

						<strong class="tx_ti">매장안내</strong>
						<table>
							<caption>선택한 매장에 대한 영업시간, 연락처, 대중교통으로 구성된 표</caption>
							<colgroup>
								<col style="width:102px" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th><strong>영업시간</strong></th>
									<td>
										<span id="storeWekTime"></span>
									</td>
								</tr>
								<tr>
									<th><strong>연락처</strong></th>
									<td>
										<span id="storeHpNo"></span>
									</td>
								</tr>
								<tr>
									<th><strong>대중교통</strong></th>
									<td>
										<span id="storeTrs"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</article>
			<!--// .step2 E -->
			<!-- #laypop S -->
			<%@ include file="/WEB-INF/jsp/pc/product/productLayer.jsp" %>
			<!--// #laypop E -->
		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

</section>
<!--// #wrap E -->
</body>

</html>