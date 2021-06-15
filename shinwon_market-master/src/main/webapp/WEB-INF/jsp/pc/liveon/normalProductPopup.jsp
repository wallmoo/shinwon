<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="contents" class="layer full" style="display:block;">
    <div class="layer_header">
        <h2>옵션선택</h2>
    </div>
    <div class="layer_content">
 
	        <div class="good_info_wrap clearboth">
	            <div class="thum_img_area">
	                <img src="<c:out value="${cdnDomain}" />${productInfo.PRD_IMAGE }" alt="<c:out value='${productInfo.PRD_IMAGE_ALT }'/>">
	            </div>
	            <div class="txt_area">
	                <div class="sort_tag_area clearboth">
	                    <span class="sort"><c:out value="${productInfo.PRD_MST_BRAND_NM }" /></span>
	                    <span class="tag"><c:out value="${productInfo.TAG_MST_TITLE }" /></span>
	                </div>
	                <p class="goods_title"><c:out value="${productInfo.PRD_MST_NM }" /></p>
	                
	                
	                <!-- .price_list -->
	                <ul class="price_list">
	                
	                    <li class="clearboth"> <!-- 일반판매가 -->
	                        <div class="fl">
	                            <div class="dc clearboth"> <!-- 즉시할인가 -->
	                                <em><fmt:formatNumber value="${productInfo.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></em>
	                                <strong><fmt:formatNumber value="${productInfo.PRD_MST_DISCOUNT }" type="percent" groupingUsed="false" /></strong>
	                            </div>
	                            
	                            <c:choose>
	                            	<c:when test = "${productInfo.PRD_MST_EMP_USE_YN eq 'N'}">
	                            		 <span>(임직원 할인 제외상품)</span>
	                            	</c:when>
	                            	<c:when test = "${productInfo.PRD_MST_PRT_USE_YN eq 'N'}">
	                            		 <span>(제휴사 할인 제외상품)</span>
	                            	</c:when>
	                            </c:choose>
	                        </div>
	                        <div class="fr"> <!-- 판매가 -->
	                            <div class="price clearboth">
		                            <c:choose>
		                            	<c:when test = "${productInfo.PRD_MST_EMP_USE_YN eq 'Y'}">
		                            		 <em>임직원 할인가</em>
		                            	</c:when>
		                            	<c:when test = "${productInfo.PRD_MST_PRT_USE_YN eq 'Y'}">
		                            		 <em>제휴사 할인가</em>
		                            	</c:when>
		                            </c:choose>
	                                <strong><fmt:formatNumber value="${productInfo.PRD_NOW_DST_PRICE }" type="currency" currencySymbol="￦" groupingUsed="true" /></strong>
	                            </div>
	                        </div>
	                    </li>
	                </ul>
	                <!-- // .price_list -->
	
	                <a href="<c:out value="${frontDomain }"/>/pc/product/productView.do?PRD_MST_CD=${productInfo.PRD_MST_CD }" class="btn_detail_view">상세보기</a>
	            </div>
	        </div>

		<c:choose>
			<c:when test = "${productInfo.PRD_MST_TYPE eq 'S'}">
				<c:set var="g_color_index" value="0"/>
				<c:set var="g_size_index" value="0"/>
				
				<c:forEach var="productgroup" items="${productGroupInfoList}" varStatus="status">
				       <div class="table_wrap mt30 option_wrapper" data-seq="${status.count}">
				       		<input type="hidden" class="product_code" value="${productgroup.productGroupInfo.PRD_MST_CD}">
							<input type="hidden" class="product_name" value="${productgroup.productGroupInfo.PRD_MST_NM}">
				            <input type="hidden" class="product_price" value="${productgroup.productGroupInfo.PRD_NOW_DST_PRICE}">
			            <table class="tb_row">
			                <caption>옵션 선택 : 상품, 색상, 사이즈, 옵션 입력 표입니다.</caption>
			                <colgroup>
			                    <col style="width:20%">
			                    <col style="width:auto">
			                </colgroup>
			                <tbody>
			                    <tr>
			                        <th scope="row">상품</th>
			                        <td>${productgroup.productGroupInfo.PRD_MST_NM}(${productgroup.productGroupInfo.PRD_MST_CD})</td>
			                    </tr>
			                    <tr>
			                        <th scope="row">색상</th>
			                        <td>
			                            <ul class="option_color_list clearboth">
			                            	<c:if test="${not empty productgroup.mustOptionList}">
			                            		<c:set var="prev_color" value=""/>
				                    			<c:set var="color_index" value="0"/>
				                    			<c:forEach var="iteminfo" items="${productgroup.mustOptionList }" varStatus="instatus">
					                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'C'}">
					                    			
						                    			<c:set var="cur_color" value="${','}${iteminfo.COLOR_IDX}"/>
						                    			<c:if test="${fn:contains(prev_color, cur_color) eq false}">
						                    				<c:set var="prev_color" value="${prev_color}${cur_color}"/>
						                    				<c:set var="color_index" value="${color_index + 1 }"/>
						                    				<c:set var="g_color_index" value="${g_color_index + 1 }"/>
						                    				
									                     	<li class="${color_index eq 1 ? 'atv' : ''}">
									                        <input type="radio" id="color-${g_color_index}" name="color${status.count}">
									                        <label for="color-${g_color_index}" data-color="${iteminfo.COLOR_IDX}" style="background-color:<c:out value='${iteminfo.COLOR_VALUE }' />">
									                          	<c:out value="${iteminfo.COLOR_CODE }" />
									                        </label>
								                      		</li>
								                      	</c:if>
							                      	
					                    			</c:if>
					                      		</c:forEach>
			                            	</c:if>
			                            	
			                             </ul>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">사이즈</th>
			                        <td>
			                   		<c:if test="${not empty productgroup.mustOptionList}">
			                    		<c:set var="prev_size" value=""/>
			                    		<c:set var="size_index" value="-1"/>
			                    		<c:forEach var="iteminfo" items="${productgroup.mustOptionList }" varStatus="instatus">

			                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'S'}">
	
				                    			<c:set var="cur_size" value="${','}${iteminfo.SIZE_IDX}"/>
				                    			<c:if test="${fn:contains(prev_size, cur_size) eq false}">
				                    				
				                    				<c:set var="size_index" value="${size_index + 1 }"/>
				                    				<c:set var="g_size_index" value="${g_size_index + 1 }"/>
				                    				
				                    				<c:set var="prev_size" value="${prev_size}${cur_size}"/>
				                    				
				                    				<input type="radio" value="${iteminfo.SIZE_IDX}" id="size-${g_size_index}" name="size${status.count}" ${size_index eq 0 ? 'checked' : ''}>
				                    				<label for="size-${g_size_index}" class="mr40"><span class="icon"></span>${iteminfo.SIZE_NM}</label>
				                    					
						                      	</c:if>
			                    			</c:if>
	
			                      		</c:forEach>
				                   	
			                   		</c:if>
			                   		
			                       	<button class="btn_small">재입고 알림</button>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="row">옵션</th>
			                        <td>
			                            <span class="select w100p">
					                      <select class="sel_option" title="옵션선택">
					                      		<option value="">옵션선택</option>
							                  	<c:choose>
								                  	<c:when test = "${fn:length(productgroup.addOptionList) eq 0}">
								                  		<option value="">선택안함</option>
								                  	</c:when>
								                  	<c:otherwise>
								                  		<c:forEach var="iteminfo" items="${productgroup.addOptionList }" varStatus="status">
							                      			<option value="${iteminfo.PRD_OPT_IDX }">${iteminfo.PRD_OPT_NM }</option>
							                        	</c:forEach>
								                  	</c:otherwise>
							                  	</c:choose>
					                      </select>
			                            </span>
			                        </td>
			                    </tr>
			                </tbody>
			            </table>
			        </div>
				</c:forEach>
			</c:when>
			
			<c:when test = "${productInfo.PRD_MST_TYPE eq 'B'}">
		       <div class="table_wrap mt30 option_wrapper" data-seq="1">
				 <input type="hidden" class="product_code" value="${productgroup.productGroupInfo.PRD_MST_CD}">
				 <input type="hidden" class="product_name" value="${productgroup.productGroupInfo.PRD_MST_NM}">
				 <input type="hidden" class="product_price" value="${productgroup.productGroupInfo.PRD_NOW_DST_PRICE}">
	            <table class="tb_row">
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
									<select id="bundle_prd_sel" title="상품선택">
			                      		<option selected="selected" value="">상품선택</option>
			                      		
			                      		<c:forEach var="productgroup" items="${productGroupInfoList}" varStatus="status">
			                      			<option value="${status.count}"
			                      				data-code="${productgroup.productGroupInfo.PRD_MST_CD}"
			                      				data-name="${productgroup.productGroupInfo.PRD_MST_NM}"
			                      				data-price="${productgroup.productGroupInfo.PRD_NOW_DST_PRICE}"
			                      			>${productgroup.productGroupInfo.PRD_MST_NM}</option>
			                      		</c:forEach>
									</select>
	                            </span>
	                        </td>
	                    </tr>
                  		
                  		<c:forEach var="productgroup" items="${productGroupInfoList}" varStatus="status">
                  			<c:set var="g_color_index" value="0"/>
							<c:set var="g_size_index" value="0"/>
				
					       <tr class="B_option_${status.count} B_option_cls">
	                        <th scope="row">색상</th>
	                        <td>
	                            <ul class="option_color_list clearboth">
	                            	<c:if test="${not empty productgroup.mustOptionList}">
	                            		<c:set var="prev_color" value=""/>
		                    			<c:set var="color_index" value="0"/>
		                    			<c:forEach var="iteminfo" items="${productgroup.mustOptionList }" varStatus="instatus">
			                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'C'}">
			                    			
				                    			<c:set var="cur_color" value="${','}${iteminfo.COLOR_IDX}"/>
				                    			<c:if test="${fn:contains(prev_color, cur_color) eq false}">
				                    				<c:set var="prev_color" value="${prev_color}${cur_color}"/>
				                    				<c:set var="color_index" value="${color_index + 1 }"/>
				                    				<c:set var="g_color_index" value="${g_color_index + 1 }"/>
				                    				
							                     	<li class="${color_index eq 1 ? 'atv' : ''}">
							                        <input type="radio" id="color-${g_color_index}" name="color${status.count}">
							                        <label for="color-${g_color_index}" data-color="${iteminfo.COLOR_IDX}" style="background-color:<c:out value='${iteminfo.COLOR_VALUE }' />">
							                          	<c:out value="${iteminfo.COLOR_CODE }" />
							                        </label>
						                      		</li>
						                      	</c:if>
					                      	
			                    			</c:if>
			                      		</c:forEach>
	                            	</c:if>
	                            	
	                             </ul>
	                        </td>
	                    </tr>
	                    <tr class="B_option_${status.count} B_option_cls">
	                        <th scope="row">사이즈</th>
	                        <td>
	                   		<c:if test="${not empty productgroup.mustOptionList}">
	                    		<c:set var="prev_size" value=""/>
	                    		<c:set var="size_index" value="-1"/>
	                    		<c:forEach var="iteminfo" items="${productgroup.mustOptionList }" varStatus="instatus">

	                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'S'}">

		                    			<c:set var="cur_size" value="${','}${iteminfo.SIZE_IDX}"/>
		                    			<c:if test="${fn:contains(prev_size, cur_size) eq false}">
		                    				
		                    				<c:set var="size_index" value="${size_index + 1 }"/>
		                    				<c:set var="g_size_index" value="${g_size_index + 1 }"/>
		                    				
		                    				<c:set var="prev_size" value="${prev_size}${cur_size}"/>
		                    				
		                    				<input type="radio" value="${iteminfo.SIZE_IDX}" id="size-${g_size_index}" name="size${status.count}" ${size_index eq 0 ? 'checked' : ''}>
		                    				<label for="size-${g_size_index}" class="mr40"><span class="icon"></span>${iteminfo.SIZE_NM}</label>
		                    					
				                      	</c:if>
	                    			</c:if>

	                      		</c:forEach>
		                   	
	                   		</c:if>
	                   		
	                       	<button class="btn_small">재입고 알림</button>
	                        </td>
	                    </tr>
	                    <tr class="B_option_${status.count} B_option_cls">
	                        <th scope="row">옵션</th>
	                        <td>
	                            <span class="select w100p">
			                      <select class="sel_option" title="옵션선택">
			                      		<option value="">옵션선택</option>
					                  	<c:choose>
						                  	<c:when test = "${fn:length(productgroup.addOptionList) eq 0}">
						                  		<option value="">선택안함</option>
						                  	</c:when>
						                  	<c:otherwise>
						                  		<c:forEach var="iteminfo" items="${productgroup.addOptionList }" varStatus="status">
					                      			<option value="${iteminfo.PRD_OPT_IDX }">${iteminfo.PRD_OPT_NM }</option>
					                        	</c:forEach>
						                  	</c:otherwise>
					                  	</c:choose>
			                      </select>
	                            </span>
	                        </td>
	                    </tr>
	                    
                  		</c:forEach>

	                </tbody>
	            </table>
	        </div>
			</c:when>
			<c:otherwise>
		       <div class="table_wrap mt30 option_wrapper" data-seq="1">
                <input type="hidden" class="product_code" value="${productInfo.PRD_MST_CD}">
              	<input type="hidden" class="product_name" value="${productInfo.PRD_MST_NM}">
              	<input type="hidden" class="product_price" value="${productInfo.PRD_NOW_DST_PRICE}">
	            <table class="tb_row">
	                <caption>옵션 선택 : 상품, 색상, 사이즈, 옵션 입력 표입니다.</caption>
	                <colgroup>
	                    <col style="width:20%">
	                    <col style="width:auto">
	                </colgroup>
	                <tbody>

					   	<tr>
	                        <th scope="row">색상</th>
	                        <td>
	                            <ul class="option_color_list clearboth">
	                            	<c:if test="${not empty defalutOptionList}">
	                            		<c:set var="prev_color" value=""/>
		                    			<c:set var="color_index" value="0"/>
		                    			<c:forEach var="iteminfo" items="${defalutOptionList }" varStatus="status">
			                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'C'}">
			                    			
				                    			<c:set var="cur_color" value="${','}${iteminfo.COLOR_IDX}"/>
				                    			<c:if test="${fn:contains(prev_color, cur_color) eq false}">
			                    					<c:set var="prev_color" value="${prev_color}${cur_color}"/>
				                    				<c:set var="color_index" value="${color_index + 1 }"/>
				                    				
							                     	<li class="${color_index eq 1 ? 'atv' : ''}">
							                        <input type="radio" id="color-${color_index}" name="color">
							                        <label for="color-${color_index}" data-color="${iteminfo.COLOR_IDX}" style="background-color:<c:out value='${iteminfo.COLOR_VALUE }' />">
							                          	<c:out value="${iteminfo.COLOR_CODE }" />
							                        </label>
						                      		</li>
						                      	</c:if>
					                      	
			                    			</c:if>
			                      		</c:forEach>
	                            	</c:if>
	                            	
	                             </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">사이즈</th>
	                        <td>
	                   		<c:if test="${not empty defalutOptionList}">
	                    		<c:set var="prev_size" value=""/>
	                    		<c:set var="size_index" value="-1"/>
	                    		<c:forEach var="iteminfo" items="${productgroup.mustOptionList }" varStatus="status">

	                    			<c:if test="${iteminfo.PRD_CMM_TYPE eq 'S'}">

		                    			<c:set var="cur_size" value="${','}${iteminfo.SIZE_IDX}"/>
		                    			<c:if test="${fn:contains(prev_size, cur_size) eq false}">
		                    				
		                    				<c:set var="size_index" value="${size_index + 1 }"/>
		                    				<c:set var="prev_size" value="${prev_size}${cur_size}"/>
		                    				
		                    				<input type="radio" value="${iteminfo.SIZE_IDX}" id="size-${size_index}" name="size" ${size_index eq 0 ? 'checked' : ''}>
		                    				<label for="size-${size_index}" class="mr40"><span class="icon"></span>${iteminfo.SIZE_NM}</label>
		                    					
				                      	</c:if>
	                    			</c:if>

	                      		</c:forEach>
		                   	
	                   		</c:if>
	                   		
	                       	<button class="btn_small">재입고 알림</button>
	                        </td>
	                    </tr>
	                    <tr class="B_option_${status.count}">
	                        <th scope="row">옵션</th>
	                        <td>
	                            <span class="select w100p">
			                      <select class="sel_option" title="옵션선택">
			                      		<option value="">옵션선택</option>
					                  	<c:choose>
						                  	<c:when test = "${fn:length(addOptionList) eq 0}">
						                  		<option value="">선택안함</option>
						                  	</c:when>
						                  	<c:otherwise>
						                  		<c:forEach var="iteminfo" items="${addOptionList }" varStatus="status">
					                      			<option value="${iteminfo.PRD_OPT_IDX }">${iteminfo.PRD_OPT_NM }</option>
					                        	</c:forEach>
						                  	</c:otherwise>
					                  	</c:choose>
			                      </select>
	                            </span>
	                        </td>
	                    </tr>

	                </tbody>
	            </table>
	        </div>
			</c:otherwise>
		</c:choose>
        
        <div class="quantity quantity-wrapper"> <!-- 구매수량 -->
            <ul>
            </ul>
        </div>
        <div class="pick_set">
            <div class="pickup_btn">
                <ul>
                    <li id="pickupBtnDelivery">
                    	<a href="#pickupTypeBtn" onclick="pickupTypeBtn('delivery');">택배</a>
                    </li>
                    <li id="pickupBtnPicUp" class="on">
                    	<a href="#pickupTypeBtn"  onclick="pickupBtnPicUp('pickUp');" >매장픽업</a>
                    </li>
                </ul>
            </div>
            <div class="pickup_info_wp">
                <div class="pickup_info">
                    <p class="txt">픽업하실 매장과 일정을 선택하세요.</p>
                    <button class="btn_small" onclick="">매장선택</button>
                </div>
                <div class="pickup_info_list">
                    <dl>
                        <dt>픽업매장</dt>
                        <dd>VIKI 봉담점<br>경기도 화성시 봉담읍 삼천병마로 1047-2</dd>
                    </dl>
                    <dl>
                        <dt>연락처</dt>
                        <dd>023-143-1580</dd>
                    </dl>
                    <dl>
                        <dt>영업시간</dt>
                        <dd>12:00 ~ 21:30</dd>
                    </dl>
                    <dl>
                        <dt>픽업예정일</dt>
                        <dd>2019-08-26, 13:00 ~ 13:30</dd>
                    </dl>
                    <a href="#n" class="btn_pick_change">픽업정보변경</a>
                </div>
            </div>
        </div>
        <dl class="total_price clearboth">
            <dt>총 합계</dt>
            <dd class="price">￦0</dd>
        </dl>
    </div>
    <!-- //layer_content -->

    <div class="layer_footer">
        <div class="btn_wrap">
            <button type="button" class="btn_large under_close">장바구니</button>
            <button type="button" class="btn_large purple">바로 구매</button>
            <button type="button" class="btn_large btn_black">제휴사 구매</button>
            <!-- <button type="button" class="btn_large purple">임직원 구매</button> -->
        </div>
    </div>
    <a href="javascript:void(0)"  class="btn_layer_close"	onclick="hideModalFn();">
        <em class="blind">레이어 닫기</em>
    </a>
</div>
<div class="dim" style="width: 1920px; height: 2107px; display: block;"></div>

<script>

$( document ).ready(function() {
	
	var setPaymentData = function()
	{
		var data = setCartData();
		
		if(data){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : data,
	            url : "/pc/cart/insertDirectPurchaseAjax.do",
	            success : function (data) 
	            { 
	            	switch (data.result) {
	  					case 1:
	  						var f = document.createElement("form"); // form 엘리멘트 생성 
	  						f.setAttribute("method","post"); // method 속성을 post로 설정
	  						f.setAttribute("action","/pc/cart/cartpayment.do"); // submit했을 때 무슨 동작을 할 것인지 설정
	  						document.body.appendChild(f); // 현재 페이지에 form 엘리멘트 추가 

	  						var i = document.createElement("input"); // input 엘리멘트 생성 
	  						i.setAttribute("type","hidden"); // type 속성을 hidden으로 설정
	  						i.setAttribute("name","ORD_MST_CD"); // name 속성을 'm_nickname'으로 설정 
	  						i.setAttribute("value",data.ORD_MST_CD); // value 속성을 neilong에 담겨있는 값으로 설정 
	  						f.appendChild(i); // form 엘리멘트에 input 엘리멘트 추가 

	  						f.submit(); // form 태그 서브밋 실행

	  						
	  						//var url = "http://pc.marketplanta.epasscni.com/pc/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD;
	  						//var url = "/pc/cart/cartpayment.do?ORD_MST_CD=" + data.ORD_MST_CD;
	  						//url = encodeURIComponent(url);
	  			        	//window.open("http://pc.marketplanta.epasscni.com/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=http","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	  			        	//window.open("/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=http","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	  						
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
		}
	};
	
	/************** 장바구니 추가 *********************/
	var AddCartProcess = function(dataParam, pSuccessCB) {
       	$.ajax({
       		type	: "POST",
       		url		: "/pc/cart/insertCartAjax.do",
       		dataType: "json",
       		data	: dataParam,
       		success : function(data) {
       			console.log(data);
       			if(data.result == 1) {
       				pSuccessCB();
       			} else {
       				alert(data.resultMsg);
       			}
       		}, error : function(err) {
      			alert('something wrong');
       			console.log(err);
       		}
       	});
	}
	$('#instantBuyItem').on('click',setPaymentData);
	$('#add_bucket_btn').on('click', function(){
		AddCartProcess(setCartData(), function(){
			if (window.confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) { 
				location.href = "<c:out value="${frontDomain}"/>/pc/cart/cartlist.do";
			} else {
				alert('상품을 장바구니에 담았습니다.');
			}
			
		});
		
	});

	var setCartData = function(){
		
		var selParam = [];
		for(var i=0;i<SELECTED_PRD.length;i++){
			var obj = {};
			for (var prop in SELECTED_PRD[i]) {
				 obj[prop] = SELECTED_PRD[i][prop];
			}
			selParam.push(obj);
		}
		
		
		if(selParam.add_option_idx <= 0) {
			alert('옵션을 선택해주십시요.');
			return;
		}
		//if(!selParam){
		//	alert('선택한 상품이 없습니다.');
		//	return;
		//}
		
		var dataParam = { 
				MEM_CRT_DLV_GBN : 2096, 
				PRD_MST_O2O_YN : 'N',
				MEM_CRT_SLT_YN : 'N',
				PRODUCT : JSON.stringify(adaptParam(selParam)),
				PRD_MST_CD : $('#target_prd_code').val()
		};
		/*MEM_PRD_MST_CD : selParam.product_code,
				MEM_CRT_COLOR : selParam.color_code, 
				MEM_PRD_OPT_DTL_IDX : selParam.add_option,
				MEM_CRT_SIZE : selParam.size_code,
				MEM_CRT_CNT : selParam.product_count,
				*/
		return dataParam;
	}
	
	var adaptParam = function(selParam){
		var result = [];
		for(var index in selParam){
			var product = {};
			product.MEM_PRD_MST_CD = selParam[index].product_code;
			product.MEM_CRT_COLOR = selParam[index].color_code;
			product.MEM_PRD_OPT_DTL_IDX = selParam[index].add_option;
			product.MEM_CRT_SIZE = selParam[index].size_code;
			product.MEM_CRT_CNT = selParam[index].product_count;
			product.PRD_MST_TYPE = $(target_prd_type).val();
			product.PRD_MST_CD = '<c:out value="${productInfo.PRD_MST_CD }"/>';
			result.push(product);
		}
		return result;
	}
	
	
	var getSelectedOptionData = function($pTargetElem){
		
		var selOptionData = {}
		
		var $selColElem= $('.color_pick .atv', $pTargetElem);
		if($selColElem.length > 0) {
			var $targetElem = $('span.color', $selColElem);
			var curColorInfo = $targetElem.attr('data-color');
			var curColorLabel = $targetElem.text();
			
			selOptionData['color_code'] = curColorInfo;
			selOptionData['color_label'] = curColorLabel;
		}
		var $selSizeElem= $('.size input:checked', $pTargetElem);
		if($selSizeElem.length > 0) {
			var curSizeInfo = $selSizeElem.val();
			var curSizeLabel = $selSizeElem.parent().find('label').text().trim()

			selOptionData['size_code'] = curSizeInfo;
			selOptionData['size_label'] = curSizeLabel;
		}
		
		return selOptionData;
	};
	
	var GetNumberFormat = function(pData){
	    if(pData==0) return 0;
  		 
   	    var reg = /(^[+-]?\d+)(\d{3})/;
   	    var n = (pData + '');
   	 
   	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
   	 
   	    return n;		
	}

	
	var SelItemHTML = '';
	SelItemHTML +='<li id="{id}">';
	SelItemHTML +='	<p class="tit">{title}</p>';
	SelItemHTML +='	<div class="b_slct_wrap clearboth"><div class="b_slct">';
	SelItemHTML +='  	<button type="button" class="minus">-</button>';
	SelItemHTML +='  	<input type="text" value="1">';
	SelItemHTML +='  	<button type="button" class="plus">+</button>';
	SelItemHTML +='	</div></div>';
	SelItemHTML +='</li>';
	
	var TMP_ID_PREFIX = "SEL_TMP_";
	var TMP_ID_IDX = 0;
	var SELECTED_PRD = [];
	
	var CalculateAmount = function(){
		var curAmount = 0;
		for(var i=0;i<SELECTED_PRD.length;i++){
			curAmount += SELECTED_PRD[i].product_price * SELECTED_PRD[i].product_count;
		}
		
		
		$('.total_price .price').text('￦' + GetNumberFormat(curAmount * 1));
	}
	
	
    var RenderQuantityUI = function(pIndex){

    	var $pTargetElem = $('.option_wrapper[data-seq=' + pIndex + ']');
    	
    	if($pTargetElem.length > 0) {
    		var $curOptElem = $('.sel_option option:selected', $pTargetElem);
    		var curOptVal = $curOptElem.val();
    		var curSelectedIdx = $('.sel_option', $pTargetElem).prop('selectedIndex');
    		
    		var curOptTxt = curSelectedIdx <= 0 ? "" : $curOptElem.text();
    		var curInfo = getSelectedOptionData($pTargetElem);
    		var curPrdName = $('.product_name', $pTargetElem).val();
    		var curPrdCode = $('.product_code', $pTargetElem).val();
    		var curPrdPrice = $('.product_price', $pTargetElem).val();
    		//var curTmpID = TMP_ID_PREFIX + (++TMP_ID_IDX);
    		var curTmpID = TMP_ID_PREFIX + (pIndex);
    		var curTitle = curPrdName + "(" + curPrdCode + ")";
    		
    		if(curInfo.color_code) curTitle += " / " + curInfo.color_label;
    		if(curInfo.size_code) curTitle += " / " + curInfo.size_label;
    		
    		curTitle += " / " + curOptTxt;
    		
    		curInfo['product_code'] = curPrdCode;
    		curInfo['product_price'] = curPrdPrice;
    		curInfo['product_count'] = 1;
    		curInfo['add_option'] = curOptVal;
    		curInfo['add_option_idx'] = curSelectedIdx;
    		curInfo['id'] = curTmpID;
    		
    		
    		var filterData = SELECTED_PRD.filter(function(item){
    			return item.id == curTmpID;
    		});
    		if(filterData.length==0){
    			SELECTED_PRD.push(curInfo);
    		}
    		else{
    			SELECTED_PRD[SELECTED_PRD.indexOf(filterData[0])] = curInfo;
    		}
    		
    		var curHTML = SelItemHTML.replace('{id}', curTmpID)
    		.replace('{title}', curTitle);
    		
    		var $prevElem = $('.quantity-wrapper .quantity ul li[id="' + curTmpID + '"]');
    		
    		if($prevElem.length > 0) $prevElem.replaceWith(curHTML); 
    		else $('.quantity-wrapper ul').append(curHTML);
    		
    		CalculateAmount();
    		
    		$('.quantity-wrapper ul .b_slct button').off('click').on('click', function(){
    			var curID = $(this).closest('li').attr('id');
    			var $targetElem = $('input', $(this).closest('.b_slct'));
    			var product = SELECTED_PRD.filter(function(item){return item.id == curID})[0];
    			var curQuantity = product.product_count;
    			if($(this).hasClass('plus')) {
    				curQuantity++;
    			} else {
    				curQuantity--;
    				if(curQuantity < 0) curQuantity = 0;
    			}
    			product.product_count = curQuantity;
    			$targetElem.val(curQuantity);
    			
    			CalculateAmount();
    		});
     
    		//resetOptionUI();
    	}

    }
    
	$('.option_wrapper .sel_option').on('change', function(){
		var $wrapperElem = $(this).closest('.option_wrapper');
		RenderQuantityUI($wrapperElem.data('seq'));
	});
	
	$("input:radio[name=size]").change(function() {
		var $wrapperElem = $(this).closest('.option_wrapper');
		RenderQuantityUI($wrapperElem.data('seq'));
	});
	
	$("input:radio[name=color]").change(function() {
		var $wrapperElem = $(this).closest('.option_wrapper');
		RenderQuantityUI($wrapperElem.data('seq'));
	});
	
	
	if($('#target_prd_type').val() != 'B'){ //일반과 세트는 정해진 제품 무조건 구매해야함
		RenderQuantityUI(1);
		RenderQuantityUI(2);
	} else { //묶은은 원하는 상품 구매 가능
		$('.B_option_cls').hide();
		$('#bundle_prd_sel').on('change', function(){
			var selValue = $('#bundle_prd_sel option:selected').val();
			var curCode = $(this).data('code');
			var curName =  $(this).data('name');
			var curPrice =  $(this).data('price');
			
			var $targetElem = $('.option_wrapper');
			$targetElem.attr('data-seq', selValue);
			
			$('.product_code', $targetElem).val(curCode);
			$('.product_name', $targetElem).val(curName);
			$('.product_price', $targetElem).val(curPrice);
			
			$('.B_option_cls').hide();
			
			if(selValue.length > 0) {
				$('.B_option_'+ selValue).show();
				RenderQuantityUI(selValue);
			}
		});
	}
	
});

	// 구매금액계산
	setTotalPrice = function () {
		var totPrdPrice = 0;
		var addPrdPrc = 0;
		var optPrdPrc = 0;	//옵션 가격
		var optSelCnt = 0; //옵션수량
		var prdMstPrc = $("#PRD_MST_PRICE").val();
		var prdOptEstCnt = 0; //필수옵션여부
		var prdOptEstYns = 0; //필수옵션여부
		var buyPrdCnt = $("#REQUEST_CNT_0").val() == undefined ? 0 : $("#REQUEST_CNT_0").val();	//구매 상품수량
	} 
	
	// 상품수량 증가
	$(document).on("click","#upPrdMstCnt",function(){
		var prdMstSelCnt = $("#PRD_MST_SEL_CNT").val();	//상품재고
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
	
		if(parseInt(prdMstSelCnt) < parseInt(buyPrdCnt) + 1){
			alert("해당 상품 재고["+prdMstSelCnt+"] 입니다.");
		}else{
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) + 1);	//수량 증가
		}
		
		setTotalPrice();
	});
	

	// 상품수량 감소
	$(document).on("click","#dnPrdMstCnt",function(){
		var buyPrdCnt = $("#REQUEST_CNT_0").val();	//구매 상품수량
	
		if(parseInt(buyPrdCnt) - 1 < 1){
			alert("상품의 최하 수량은 1 입니다.");
			$("#REQUEST_CNT_0").val(1);
		}else{
			$("#REQUEST_CNT_0").val(parseInt(buyPrdCnt) - 1);	//수량 감소
		}
		
		setTotalPrice();
	});
	
	//필수옵션 여부
	/* $("input[name=PRD_OPT_EST_YN]").each(function() {
		if($(this).val() == "Y"){
			prdOptEstCnt ++;
		}
	});
		if(prdOptEstCnt > 0){
			($(this).val() == "Y"){
				prdOptEstYns ++;
			}
		});
		if(prdOptEstYns < 1){
			alert("필수 옵션을 선택해 주세요.");
			return;
		} */
	

	//구매금액계산
	setTotalPrice = function () {
		var totPrdPrice = 0;
	}
	
	
	//옵션에 가격 총 계산
	/* $("input[name=PRD_DTL_PRCs]").each(function(){
		totPrdPrice = parseInt(totPrdPrice) + parseInt($(this).val());
	});

	if(totPrdPrice == 0){
		totPrdPrice = prdMstPrc;
	}else{
		if(prdOptEstCnt < 1 && buyPrdCnt < 1){//선택한 옵션의 필수 옵션 여부
			totPrdPrice = parseInt(prdMstPrc) + parseInt(totPrdPrice);
		}
	} */
	
	//장바구니 이동
	goCartList = function(){
		$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();	
	};
		
	function hideModalFn(){
		$("#productOptionPopup").hide();
		$(".dim").hide();				
	}
	
	/* var type;
	pickupBtnDelivery = function(type){
		if(type == "delivery"){
			$("#pickupBtnPicUp").show("on");
			$("#pickupBtnDelivery").hide("on");
			
			
		}else{
			$("#pickupBtnDelivery").show("on");
			$("#pickupBtnPicUp").hide("on");
			
		}
	} */
	 $(function () {
		$("#pickupBtnPicUp").click(function(){
			  alert("픽업")
			});
	});
	
	
	
</script>

    