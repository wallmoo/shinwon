<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- #laypop S -->
<section id="layCart" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#layCart'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p>선택하신 상품이<br/> <strong class="co_red">장바구니</strong>에 담겼습니다.</p>
			<p>장바구니으로 이동하시겠습니까?</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:$.com.util.layPop('close', $('#layCart'));" class="btn_wht"><strong>취소</strong></a>
			<a href="javascript:goCartList();" class="btn_gre"><strong>확인</strong></a>
		</dd>
	</dl>
</section>
<section id="layCart24" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#layCart24'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p>선택하신 상품이<br/> <em class="co_red"><span id="mntText"></span>개월</em><em class="co_blu">장기할부 장바구니</em>에 담겼습니다.</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:goCartList();" class="btn_wht"><strong>장바구니 보기</strong></a>
			<a href="javascript:inertCart('<c:out value="${Code.CART_DLV_GBN_LONG_INS_CD }" />');" class="btn_gre"><strong>바로구매</strong></a>
		</dd>
	</dl>
</section>
<section id="laypopNotCart" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#laypopNotCart'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p>선택하신 상품중 구매불가 상품이 있습니다.<br/>해당 상품을 제외 하고<br/> <strong class="co_red">장바구니</strong>에 담겼습니다.</p>
			<p>장바구니으로 이동하시겠습니까?</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:$.com.util.layPop('close', $('#laypopNotCart'));" class="btn_wht"><strong>취소</strong></a>
			<a href="javascript:goCartList();" class="btn_gre"><strong>확인</strong></a>
		</dd>
	</dl>
</section>
<section id="laypopAllEstCart" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#laypopAllEstCart'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p>선택하신 상품 모두 필수 옵션이 있는 상품입니다.</p>
			<p>상품별 <strong>'장바구니 담기'</strong>를 이용해주세요.</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:$.com.util.layPop('close', $('#laypopAllEstCart'));" class="btn_gre"><strong>확인</strong></a>		
		</dd>
	</dl>
</section>
<section id="layKeep" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#layKeep'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p>선택하신 상품이<br/> <strong class="co_red">MY 키핑상품</strong>에 담겼습니다.</p>
			<p>MY 키핑상품으로 이동하시겠습니까?</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:$.com.util.layPop('close', $('#layKeep'));" class="btn_wht"><strong>취소</strong></a>
			<a href="javascript:goMyKeeping();" class="btn_gre"><strong>확인</strong></a>
		</dd>
	</dl>
</section>
<section id="layPurc" data-role="popup" data-overlay-theme="a" class="popup_st0">
	<dl class="ui-content">
		<dt>
			<h2>Alert</h2>
			<a href="javascript:$.com.util.layPop('close', $('#layPurc'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p id="alterMsg"></p>
		</dd>
		<dd class="btn_box">
			<!-- <a href="javascript:void(0)" class="btn_wht"><strong>취소</strong></a> -->
			<a href="javascript:$.com.util.layPop('close', $('#layPurc'));" class="btn_gre"><strong>확인</strong></a>
		</dd>
	</dl>
</section>
<section id="layCartGet" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#layCartGet'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p>선택하신 상품이<br/> <span class="co_blu">겟잇나우(<span id="shpMstNmText"></span>)장바구니</span>에<br/> 담겼습니다.</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:goCartList();" class="btn_wht"><strong>장바구니 보기</strong></a>
			<a href="javascript:$.com.util.layPop('close', $('#layCartGet'));" class="btn_gre"><strong>계속쇼핑</strong></a>
		</dd>
	</dl>
</section>
<section id="layCartGet2" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#layCartGet2'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			<p id="G020_text">
				
			</p>
		</dd>
		<dd class="btn_box">
			<a href="javascript:goCartList();" class="btn_wht"><strong>장바구니 보기</strong></a>
			<a href="javascript:$.com.util.layPop('close', $('#layCartGet2'));" class="btn_gre"><strong>계속쇼핑</strong></a>
		</dd>
	</dl>
</section>
<section id="laypopCleanKing" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title">
	<dl class="ui-content">
		<dt>
			<h2>메세지 팝업</h2>
			<a href="javascript:$.com.util.layPop('close', $('#laypopCleanKing'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
		</dt>
		<dd class="tx_msg">
			선택하신 상품이<br/>
			<strong class="co_red">클린킹 장바구니</strong>에 담겼습니다.
		</dd>
		<dd class="btn_box">
			<a href="javascript:goCartList();" class="btn_wht"><strong>장바구니 보기</strong></a>
			<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_gre"><strong>상담예약</strong></a>
		</dd>
	</dl>
</section>
<!--// #laypop E -->