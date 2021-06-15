<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <div class="dim bg_layer" style="width: 100%; height: 2356px; display: none;"></div>
<div id="layer_myfit" class="layer type03 is_btn" style="top:50%;left:50%;display:block;margin:-320px 0 0 -455px; display:none;"> -->
<style>
.dim{display:block}
.layer{display:block;top:50%;left:50%;margin:-320px 0 0 -455px}
</style>
			<div class="sub_content">

				<div class="dim"></div>

				<div id="layer_option_change" class="layer type01 is_btn">
					<div class="layer_header">
						<h2>옵션변경</h2>
					</div>
					<div class="layer_content scroll">
						<div class="option_change">
							<div class="product_info clearboth">
								<div class="img">
									<a href="#" class="product_thumb">
										<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
									</a>
								</div>
								<div class="txt">
									<span class="brand">[신원] VIKI</span>
									<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)
									<span class="item_info">블랙 / 90</span>
								</div>
							</div>
						</div>
						<div class="option_edit_wp">
							<span class="select">
									<select id="" title="옵션 추가">
											<option selected="selected">옵션 추가</option>
									</select>
							</span>
							<ul class="option_list">
								<li class="clearboth">
									<span class="txt">블랙/85</span>
									<div class="op_right">
										<div class="quantity_slct">
											<button type="button" class="minus">-</button>
											<input type="text" value="1">
											<button type="button" class="plus">+</button>
										</div>
										<button class="b_del">삭제</button>
									</div>
								</li>
								<li class="clearboth">
									<span class="txt">블랙/90</span>
									<div class="op_right">
										<div class="quantity_slct">
											<button type="button" class="minus">-</button>
											<input type="text" value="1">
											<button type="button" class="plus">+</button>
										</div>
										<button class="b_del">삭제</button>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="layer_footer">
						<button class="btn_large gray" onclick="hideModalFn();">취소</button>
						<button class="btn_large ok" onclick="hideModalFn();">적용</button>
					</div>
					<a href="#none" class="btn_layer_close" onclick="hideModalFn()">레이어 닫기</a>
				</div>

			</div>
		</div>
	</div>
	<!--// Content -->
<script>
function hideModalFn(){
	$("#optinPopup").hide();
	$(".dim").hide();				
}
</script>		