<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 매장선택 레이어팝업 -->
<div id="layer_store" class="layer type03">
	<div class="layer_header">
		<h2>매장선택</h2>
	</div>
	<div class="layer_content">
		<div class="shop_cont">
			<div class="select_shop">
				<div class="select_item">
					<span class="select">
						<select id="select1">
							<option selected="selected">서울</option>
							<option>경기도</option>
							<option>인천</option>
							<option>강원도</option>
							<option>충청남도</option>
							<option>대전</option>
							<option>충청북도</option>
							<option>부산</option>
							<option>울산</option>
							<option>대구</option>
							<option>경상북도</option>
							<option>경상남도</option>
							<option>전라남도</option>
							<option>광주</option>
							<option>전라북도</option>
							<option>제주</option>
							<option>세종</option>
						</select>
					</span>
					<span class="select">
						<select id="select2">
							<option selected="selected">수령일선택</option>
							<option>2019-09-02</option>
							<option>2019-09-03</option>
							<option>2019-09-04</option>
							<option>2019-09-05</option>
							<option>2019-09-06</option>
						</select>
					</span>
					<span class="select">
						<select id="select3">
							<option selected="selected">방문시간선택</option>
							<option>11:00 ~ 12:00</option>
							<option>12:00 ~ 13:00</option>
							<option>13:00 ~ 14:00</option>
							<option>14:00 ~ 15:00</option>
							<option>15:00 ~ 16:00</option>
							<option>16:00 ~ 17:00</option>
							<option>17:00 ~ 18:00</option>
							<option>18:00 ~ 19:00</option>
							<option>19:00 ~ 20:00</option>
						</select>
					</span>
				</div>
				<div class="select_point">
					<ul>
						<li>
							<input type="radio" id="shop1" name="shop">
							<label for="shop1"><span class="icon"></span>세이브존부천상동(SGF)</label>
							<span class="stock on">재고있음</span>
						</li>
						<li>
							<input type="radio" id="shop2" name="shop">
							<label for="shop2"><span class="icon"></span>엔터식스동탄(SGF)</label>
							<span class="stock">재고없음</span>
						</li>
						<li>
							<input type="radio" id="shop3" name="shop">
							<label for="shop3"><span class="icon"></span>엔터식스상봉(SGF)</label>
							<span class="stock">재고없음</span>
						</li>
						<li>
							<input type="radio" id="shop4" name="shop">
							<label for="shop4"><span class="icon"></span>현대(아)송파(SGF)</label>
							<span class="stock">재고없음</span>
						</li>
						<li>
							<input type="radio" id="shop5" name="shop">
							<label for="shop5"><span class="icon"></span>현대(백)센트럴시티(SGF)</label>
							<span class="stock on">재고있음</span>
						</li>
						<li>
							<input type="radio" id="shop6" name="shop">
							<label for="shop6"><span class="icon"></span>롯데(아)가산(SGF)</label>
							<span class="stock">재고없음</span>
						</li>
						<li>
							<input type="radio" id="shop7" name="shop">
							<label for="shop7"><span class="icon"></span>롯대(백)을지로(SGF)</label>
							<span class="stock">재고없음</span>
						</li>
						<li>
							<input type="radio" id="shop8" name="shop">
							<label for="shop8"><span class="icon"></span>마리오(아)가산(SGF)</label>
							<span class="stock">재고없음</span>
						</li>
						<li>
							<input type="radio" id="shop9" name="shop">
							<label for="shop9"><span class="icon"></span>세이브존경기성남(SGF)</label>
							<span class="stock on">재고있음</span>
						</li>
						<li>
							<input type="radio" id="shop10" name="shop">
							<label for="shop10"><span class="icon"></span>엔터식스인천(SGF)</label>
							<span class="stock on">재고있음</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- 
			<div class="branch_addr">
				<h3>세이브존부천상동(SGF)</h3>
				<p>
					<span>경기도 부천시 원미구 상동 535-5 4층</span>
					<span>TEL : 032-324-9723</span>
				</p>
				<div class="map">
					<img src="/nas/cdn/PW/images/product/img_map.gif" alt="">
				</div>
			</div>
			 -->
			
			<div class="branch_addr default">
				<p class="txt">
					<span>매장위치를 선택해주세요.</span>
				</p>
			</div>
		</div>
	</div>
	<div class="layer_footer">
		<button class="btn_large gray store-popup-close">취소</button>
		<button class="btn_large ok">확인</button>
	</div>
	<a href="#none" class="btn_layer_close">레이어 닫기</a>
</div>
<!-- 매장선택 레이어팝업 -->
				

<script>
$( document ).ready(function() {
	var openStorePopup = function(pIsOpen) {
		if(pIsOpen) {
			$('#layer_store').show();
			$('.bg_layer').show();
		} else {
			$('#layer_store').hide();
			$('.bg_layer').hide();
		}
	}
	$('.store-popup').on('click', function(){
		openStorePopup(true);
	});
	
	$('.store-popup-close').on('click', function(){
		openStorePopup(false);
	});
});

</script>
		