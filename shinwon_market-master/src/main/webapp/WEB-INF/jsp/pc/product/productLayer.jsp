<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- #laypop S -->
<div id="laypopCart" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopCart')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box">
			선택하신 상품이<br/>
			<strong class="co_red">장바구니</strong>에 담겼습니다.
		</li>
		<li class="btn_box">
			<a href="javascript:goCartList();" class="btn_bl_777"><span>장바구니 보기</span></a>
			<a href="javascript:com.laypop('hide',0,'laypopCart');" class="btn_w"><span>계속쇼핑</span></a>
		</li>
	</ul>
</div>
<div id="laypopNotCart" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopNotCart')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box">
			선택하신 상품중 구매불가 상품이 있습니다.<br />
			해당 상품을 제외 하고<br/>
			<strong class="co_red">장바구니</strong>에 담겼습니다.
		</li>
		<li class="btn_box">
			<a href="javascript:goCartList();" class="btn_bl_777"><span>장바구니 보기</span></a>
			<a href="javascript:com.laypop('hide',0,'laypopNotCart');" class="btn_w"><span>계속쇼핑</span></a>
		</li>
	</ul>
</div>
<div id="laypopAllEstCart" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopAllEstCart')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box">
			선택하신 상품 모두 필수 옵션이 있는 상품입니다.<br />
			상품별 <strong>'장바구니 담기'</strong>를 이용해주세요.
		</li>
		<li class="btn_box">			
			<a href="javascript:com.laypop('hide',0,'laypopAllEstCart');" class="btn_w"><span>계속쇼핑</span></a>
		</li>
	</ul>
</div>
<div id="laypopKeeping" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopKeeping')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box">
			선택하신 상품이<br/>
			<strong class="co_red">MY 키핑상품</strong>에 담겼습니다.
		</li>
		<li class="btn_box">
			<a href="javascript:goMyKeeping();" class="btn_bl_777"><span>MY키핑상품보기</span></a>
			<a href="javascript:com.laypop('hide',0,'laypopKeeping');" class="btn_w"><span>계속쇼핑</span></a>
		</li>
	</ul>
</div>
<div id="laypopCleanKing" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopCleanKing')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box">
			선택하신 상품이<br/>
			<strong class="co_red">클린킹 장바구니</strong>에 담겼습니다.
		</li>
		<li class="btn_box">
			<a href="javascript:goCartList();" class="btn_bl_777"><span>장바구니 보기</span></a>
			<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_SERVICE_CD }" />');" class="btn_w"><span>상담예약</span></a>
		</li>
	</ul>
</div>
<div id="laypopGO2O" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopGO2O')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box" id="G020_text">

		</li>
		<li class="btn_box">
			<a href="javascript:goCartList();" class="btn_bl_777"><span>장바구니 보기</span></a>
			<a href="javascript:com.laypop('hide',0,'laypopGO2O');" class="btn_w"><span>계속쇼핑</span></a>
		</li>
	</ul>
</div>
<div id="laypopMnt" class="laypop">
	<ul class="laypop_con msg_pop"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
		<li class="close">
			<a href="javascript:com.laypop('hide',0,'laypopMnt')"><span class="blind">메시지 팝업 닫기</span></a>
		</li>
		<li class="tx_box" id="G020_text">
			선택하신 상품이<br/>
			<strong class="co_red"><span id="mntText"></span>개월 장기할부 장바구니</strong>에 <br/>
			담겼습니다.
		</li>
		<li class="btn_box">
			<a href="javascript:goCartList();" class="btn_bl_777"><span>장바구니 보기</span></a>
			<a href="javascript:setPaymentData('<c:out value="${Code.CART_DLV_GBN_LONG_INS_CD }" />');" class="btn_w"><span>바로구매</span></a>
		</li>
	</ul>
</div>
<!--// #laypop E -->