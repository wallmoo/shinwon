<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-weather">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>이런날엔 이런상품</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .weather_hd S -->
		<section class="weather_hd">
			<span class="blind">현제 위치 및 날씨</span>
			<p class="do">
				<i class="ico_<c:out value="${areaResultMap.WTH_MST_ICO_NO }" />">
				<strong><c:out value="${areaResultMap.CTY_WTH_CTM }" />°</strong></i>
			</p>
			&nbsp;&nbsp;<p class="tx"><span class="date"><c:out value="${areaResultMap.TODAY }" /></span>
			<span class="add"><c:out value="${areaResultMap.CTY_GGU_NM }" />에 계시는군요?</span>
			</p>
		</section>
		<hr class="hr_4px_st0" />
		<!--// .weather_hd E -->

		<!-- .weather_list S -->
		<section class="weather_list" id="recommendList">
			<h3>제습기</h3>
			<ul class="ui-grid-a">
				<li class="ui-block-a">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">
							329,000<span>원</span>
							<em class="discount">
								<span class="blind">할인률</span>
								<strong class="tx_num">51</strong>%
							</em>
						</strong>
					</a>
				</li>
				<li class="ui-block-b">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">329,000<span>원</span></strong>
					</a>
				</li>
				<li class="ui-block-a">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">
							329,000<span>원</span>
						</strong>
					</a>
				</li>
				<li class="ui-block-b">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">329,000<span>원</span></strong>
					</a>
				</li>
			</ul>
			<h3>이미용기기</h3>
			<ul class="ui-grid-a">
				<li class="ui-block-a">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">
							329,000<span>원</span>
							<em class="discount">
								<span class="blind">할인률</span>
								<strong class="tx_num">51</strong>%
							</em>
						</strong>
					</a>
				</li>
				<li class="ui-block-b">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">329,000<span>원</span></strong>
					</a>
				</li>
				<li class="ui-block-a">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">
							329,000<span>원</span>
						</strong>
					</a>
				</li>
				<li class="ui-block-b">
					<a href="b0102.스마트필터.html" class="_pg_link">
						<span class="tx_img"><img data-original="http://www.etland.co.kr/etlandbo/product/images/1092975_M1.jpg" src="../nas/cdn/mobile/img/lay/grey.gif" alt="상품 사진" /></span>
						<span class="tx_ti">유난히 짧은 겨울<br/>즐기는 최고의 방법!</span>
						<strong class="tx_price">329,000<span>원</span></strong>
					</a>
				</li>
			</ul>
		</section>
		<!--// .weather_list E -->
			
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
$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
	*/
	
	if(_reNum <= 2){
		var _list_html = _idx.html();
		//리스트 추가!
		_idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
		//console.log('_reNum = '+_reNum);
	}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
}
</script>