<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body>
	<!-- E : loader-wrapper -->
	<div id="header">
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
	</div>
	<!-- #container -->
	<div id="container">
		<!-- #aside -->
		<div id="aside" class="aside left">
			<%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</div>
		<!-- // #aside -->
		<!-- #wrapper -->
		<div id="wrapper">
            <div id="breadcrumb"></div><!-- breadcrumb -->
			<!-- #contents -->
			<div id="contents">
				<!-- .container -->
				<div class="container">
					<!-- ##############################################################################

						S : 컨텐츠 삽입

					############################################################################### -->
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
					<form id="frm" name="frm">
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
												<input type="radio" name="BND_MST_LAY_TPY" value="A"  data-type="type_a"
												<c:if test="${layoutInfo.BND_MST_LAY_TPY eq 'A' or empty layoutInfo.BND_MST_LAY_TPY}"> checked </c:if>>
												<label for="">A타입</label>
											</li>
											<li>
												<input type="radio" name="BND_MST_LAY_TPY" value="B"  data-type="type_b"
												<c:if test="${layoutInfo.BND_MST_LAY_TPY eq 'B'}"> checked </c:if>>
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
										<select name="BND_MST_LAY_DSP_YN" id="" class="select">
											<option value="Y" <c:if test="${layoutInfo.BND_MST_LAY_DSP_YN eq 'Y'}"> selected </c:if>>Y</option>
											<option value="N" <c:if test="${layoutInfo.BND_MST_LAY_DSP_YN eq 'N'}"> selected </c:if>>N</option>
										</select>
										<a href="#none" id="previewPopup" class="button small"><span>미리보기</span></a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="seller_room_save" class="button primary"><span>저장</span></a>
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
            <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
		</div>
		<!-- // #quickmenu -->
	
	<!-- // #container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script>
$( document ).ready(function() {
	var renderTypeUI = function(pType) {
		$('.ui_img_view_wrap').hide();
		$('.' + pType).show();
		
		console.log($('.' + pType));
		
	}
    $('input:radio').on('change', function(){
    	
    	//console.log($(this))
    	var curType = $(this).data('type');
    	renderTypeUI(curType);
    });
    
    var $initElem = $('input:radio[name="BND_MST_LAY_TPY"]:checked')
    var curType = 'type_a';
    if($initElem.length > 0) {
    	var curType = $initElem.data('type');
    } 

    renderTypeUI(curType);
    
    $('#seller_room_save').on('click', function(){
    	if(confirm('저장하시겠습니까?')) {
    		var $frm = $("#frm");
    		$frm
    		.attr(
    				{
    					"action" : "<c:out value="${serverDomain}" />/am/display/sellerRoomLayoutRegist.do",
    					"target" : "_self",
    					"method" : "post"
    				}).submit();
    	}    	

    });
    
    $('#previewPopup').on('click', function(){
    	var curType = $('input:radio[name="BND_MST_LAY_TPY"]:checked').val();
    	popup(
    			"<c:out value="${serverDomain}" />/am/display/sellerRoomPreviewPopup.do?BND_MST_LAY_TPY="+curType,
    			"900", "500", "yes", "searchProduct");
    	return false;
    });

});
</script>

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