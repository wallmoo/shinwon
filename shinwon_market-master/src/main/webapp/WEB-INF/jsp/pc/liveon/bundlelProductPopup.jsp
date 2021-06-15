<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="layer full" style="display:block;">
    <div class="layer_header">
        <h2>옵션선택</h2>
    </div>
    <div class="layer_content">
        <div class="good_info_wrap clearboth">
            <div class="thum_img_area">
                <img src="../../images/@temp/img_liveon_thum.jpg" alt="">
            </div>
            <div class="txt_area">
                <div class="sort_tag_area clearboth">
                    <span class="sort">SIEG</span>
                    <span class="tag">#묶음상품</span>
                </div>
                <p class="goods_title">언발 셔링 잔체크 레이스 물결 스커트</p>
                <!-- .price_list -->
                <ul class="price_list">
                    <li class="clearboth">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                    <li class="clearboth">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                            <span>(임직원 할인 제외상품)</span>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                    <li class="clearboth">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                            <span>(제휴사 할인 제외상품)</span>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                    <li class="clearboth only">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                    <li class="clearboth manager">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <em>임직원 할인가</em>
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                    <li class="clearboth only">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                    <li class="clearboth manager">
                        <div class="fl">
                            <div class="dc clearboth">
                                <em>￦9,900,000</em>
                                <strong>70%</strong>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="price clearboth">
                                <em>제휴사 할인가</em>
                                <strong>￦1,000,900</strong>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- // .price_list -->
                <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${productInfo.PRD_MST_CD }" class="btn_detail_view">상세보기</a>
            </div>
        </div>
        <div class="table_wrap mt30">
            <table class="tb_row" id="bundlelPopupContainner">
                <caption>옵션 선택 : 상품, 색상, 사이즈, 옵션 입력 표입니다.</caption>
                <colgroup>
                    <col style="width:20%">
                    <col style="width:auto">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">상품</th>
                        <td>
                            <span class="select w100p">
                                <select id="select1">
                                    <option selected>상품 선택</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">색상</th>
                        <td>
                            <ul class="option_color_list clearboth">
                                <li><input type="radio" name="option_color_list" id="option_color_01"><label for="option_color_01" style="background-color:#f75f5f;">option_color_01</label></li>
                                <li><input type="radio" name="option_color_list" id="option_color_02"><label for="option_color_02" style="background-color:#febf4e;">option_color_02</label></li>
                                <li><input type="radio" name="option_color_list" id="option_color_03"><label for="option_color_03" style="background-color:#fee24e;">option_color_03</label></li>
                                <li><input type="radio" name="option_color_list" id="option_color_04" class="invert"><label for="option_color_04" style="background-color:#fff5c7;">option_color_04</label></li>
                                <li><input type="radio" name="option_color_list" id="option_color_05"><label for="option_color_05" style="background-color:#40ba87;">option_color_05</label></li>
                                <li><input type="radio" name="option_color_list" id="option_color_06"><label for="option_color_06" style="background-color:#5ff2f7;">option_color_06</label></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">사이즈</th>
                        <td>
                            <input type="radio" id="option_size_01" name="option_size"><label for="option_size_01" class="mr40"><span class="icon"></span>95</label>
                            <input type="radio" id="option_size_02" name="option_size"><label for="option_size_02" class="mr40"><span class="icon"></span>100</label>
                            <input type="radio" id="option_size_03" name="option_size"><label for="option_size_03"><span class="icon"></span>105</label>
                            <button class="btn_small">재입고 알림</button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">옵션</th>
                        <td>
                            <span class="select w100p">
                                <select id="select2">
                                    <option selected>옵션 선택</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="quantity">
            <ul>
                <li>
                    <p class="tit">Champion - 액션 스타일 빅 로고 기모 후드 (PXEAD4073) / NAVY / XS / 02. 안감 기모 추가</p>
                    <div class="b_slct_wrap clearboth">
                        <div class="b_slct">
                            <button type="button" class="minus">-</button>
                            <input type="text" value="1">
                            <button type="button" class="plus">+</button>
                        </div>
                        <div class="p_b_area clearboth">
                            <strong>￦10,000</strong>
                            <button type="button" class="btn_good_del">삭제</button>
                        </div>
                    </div>
                </li>
                <li>
                    <p class="tit">Champion - 액션 스타일 빅 로고 기모 후드 (PXEAD4073) / NAVY / XS / 02. 안감 기모 추가</p>
                    <div class="b_slct_wrap clearboth">
                        <div class="b_slct">
                            <button type="button" class="minus">-</button>
                            <input type="text" value="1">
                            <button type="button" class="plus">+</button>
                        </div>
                        <div class="p_b_area clearboth">
                            <strong>￦10,000</strong>
                            <button type="button" class="btn_good_del">삭제</button>
                        </div>
                    </div>
                </li>
                <li>
                    <p class="tit">Champion - 액션 스타일 빅 로고 기모 후드 (PXEAD4073) / NAVY / XS / 02. 안감 기모 추가</p>
                    <div class="b_slct_wrap clearboth">
                        <div class="b_slct">
                            <button type="button" class="minus">-</button>
                            <input type="text" value="1">
                            <button type="button" class="plus">+</button>
                        </div>
                        <div class="p_b_area clearboth">
                            <strong>￦10,000</strong>
                            <button type="button" class="btn_good_del">삭제</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <dl class="total_price clearboth mt30">
            <dt>총 합계</dt>
            <dd>348,300 원</dd>
        </dl>
    </div>
    <!-- //layer_content -->

    <div class="layer_footer">
        <div class="btn_wrap">
            <button type="button" class="btn_large under_close">장바구니</button>
            <button type="button" class="btn_large purple">바로 구매</button>
            <button type="button" class="btn_large btn_black">제휴사 구매</button>
            <!-- <button type="button" class="btn_large btn_black">임직원 구매</button> -->
        </div>
    </div>
    <a href="#none" class="btn_layer_close">
        <em class="blind">레이어 닫기</em>
    </a>
</div>
<div class="dim" style="width: 1920px; height: 2107px; display: block;"></div>

<script>

	$(document).ready(function(){
		reqProductListAjax();
	});
	
// 리스트 호출
	
 	reqProductListAjax = function(){
    	
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/liveon/liveonListAjax.do",
    		dataType: "json",
    		data	: {	"cPage" : cPage },
    		success : function(data) {
    			
    			renderBundlelPopup(data.liveonProductList);
    			
    		}, error : function(err) {
    			alert("요청 실패");
   			
    		}
    	});
    }
    
    
 // 데이터 렌더링
    function renderBundlelPopup(list){
     	
     	if(list == null){ return; }
     	
     	for(var idx =0; idx < list.length; idx++){
     		
     		var html = "";
     			html += "<tr>";
     			html += "	<th scope=\"row\">상품</th>";		    			
     			html += "	<td>";	
     			html += "		<span class=\"select w100p\">";	
     			html += "			<select id=\"select1\">";
 		        html += "				<option selected>상품 선택</option>";
 				html += "				<option>1</option>";
 				html += "			</select>";			
 				html += "		</span>";
 				html += "	</td>";	
 				html += "</tr>";
  				html += "<tr>";				
 		        html += "	<th scope=\"row\">색상</th>";
 				html += "	<td>";
 				html += "		<ul class=\"option_color_list clearboth\">";
 				html += "			<li><input type=\"radio\" name=\"option_color_list\" id=\"option_color_01\"><label for=\"option_color_01\" style=\"background-color:#f75f5f;\">option_color_01</label></li>";
 				html += "		</ul>";
 				html += "	</td>";
 				html += "</tr>";
 				html += "<tr>";
 				html += "	<th scope=\"row\">사이즈</th>";
				html += "	<td>";
				html += "		<input type=\"radio\" id=\"option_size_01\" name=\"option_size\"><label for=\"option_size_01\" class=\"mr40\"><span class=\"icon\"></span>95</label>";
				html += "		<button class=\"btn_small\">재입고 알림</button>";
				html += "	</td>";
				html += "</tr>";
				html += "<tr>";
				html += "	<th scope=\"row\">옵션</th>";
				html += "	<td>";
				html += "		<span class=\"select w100p\">";
				html += "			<select id=\"select2\">";
				html += "				<option selected>옵션 선택</option>";
				html += "				<option>1</option>";
				html += "			</select>";
				html += "		</span>";
				html += "	</td>";
				html += "</tr>";
				
 		   		$("#bundlelPopupContainner").append(html);    		
 		}
     }

</script> 