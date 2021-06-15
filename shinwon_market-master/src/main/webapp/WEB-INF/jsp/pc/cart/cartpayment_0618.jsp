<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<link href="https://pg.cnspay.co.kr:443/dlp/css/kakaopayDlp.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/nas/cdn/pc/js/SessionStorage.js"></script>
	<!-- Content -->
	<form name="LGD_PAYINFO" id="LGD_PAYINFO" method="post" data-use-autosave="true" action="<c:out value="${serverDomain}" />/pc/cart/payment.do"> </form>
	<div id="container">
		<div id="content" class="content">
			
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">주문/결제</h2>
			</div>
			<!--// Title -->
			<div class="sub_content">

				<div class="join_step w3">
					<ol>
						<li><span>STEP 01 <strong>장바구니</strong></span></li>
						<li class="on"><span>STEP 02 <strong>주문/결제</strong></span></li>
						<li><span>STEP 03 <strong>주문완료</strong></span></li>
					</ol>
				</div>

				
				<div class="con_tit_wrap">
					<h3 class="con_tit">주문상품 정보</h3>
				</div>
				<div class="table_wrap">
					<table class="tb_col">
						<caption>주문상품 정보 : 상품정보, 상품금액, 적립혜택, 상품쿠폰, 배송비, 판매자명, 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">상품금액</th>
								<th scope="col">적립혜택</th>
								<th scope="col">상품쿠폰</th>
								<th scope="col">배송비<br>매장정보 / 수령일</th>
								<th scope="col">판매자명</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="amt_prd_tot_prc" value="0"></c:set>
							<c:set var="amt_prd_dis_prc" value="0"></c:set>
							<c:set var="amt_prd_dis_coupon" value="0"></c:set>
							<c:set var="amt_prd_dlv_prc" value="0"></c:set>
							<c:set var="amt_prd_fi_prc" value="0"></c:set>
							<c:set var="amt_prd_rev_prc" value="0"></c:set>
							
							<c:set var="prevPrdMstVdrIdx" value=""/>
							<c:forEach var="cart" items="${cartlist }" varStatus="status">
							    

							    <c:if test="${status.index eq 0}">
							    	<!-- TODO : 총상품금액, 총즉시할인, 총상품할인쿠폰 필요함 -->
							    	<c:set var="amt_prd_tot_prc" value="${cart.PRODUCT_ORDER_PRICE }"></c:set>
							    	<c:set var="amt_prd_dis_prc" value="${cart.INSTANT_CPN_ORDER_PRICE }"></c:set>  
									<c:set var="amt_prd_dis_coupon" value="${cart.TOT_PRD_DC_CPN }"></c:set>
									
									
									<c:set var="amt_prd_dlv_prc" value="${cart.SUM_FIN_DLV_CHARGE }"></c:set>
									<c:set var="amt_prd_fi_prc" value="${cart.SUM_TOT_ORDER_PRICE }"></c:set>
									<c:set var="amt_prd_rev_prc" value="${cart.SUM_RESERVE_POINT }"></c:set>
							    </c:if>
							    
							    <tr>
							    	
							        <td>
							        	<input type="hidden" value="${cart.MEM_CRT_IDX}" class="cart_crt_idx_cls" />
							            <div class="product_info clearboth">
							                <div class="img">
							                    <a href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }"/>')" class="product_thumb">
							                        <img src="<c:out value="${cdnDomain }"/><c:out value="${cart.PRODUCT_THUM_IMG }"/>" alt="제품 이미지">
							                    </a>
							                </div>
							                <div class="txt">
							               		
							                    <!-- <span class="brand">[<c:out value="${cart.BND_MST_SEL_NM }"/>]<c:out value="${cart.BND_MST_BRAND_NM }"/></span>  -->
							                    <a href="javascript:goProductView('<c:out value="${cart.PRD_MST_CD }"/>')" class="item_name"><c:out value="${cart.PRD_MST_NM }"/> (<c:out value="${cart.PRD_MST_CD }"/>)</a>
							                    <span class="item_info dot"><c:out value="${cart.PRD_TMP_COLOR_TITLE }"/> / <c:out value="${cart.PRD_TMP_SIZE_NM }"/> / <c:out value="${cart.PRD_OPT_NM }"/> / <c:out value="${cart.PRD_TMP_CNT }"/>개</span>
							                </div>
							            </div>
							        </td>
							        <td>
							           <span class="r_price "><fmt:formatNumber value="${cart.PRODUCT_ORDER_PRICE }"/></span>
							           <strong class="s_price purple"><fmt:formatNumber value="${cart.CUSTOMER_ORDER_PRICE }"/></strong>
							        </td>
							        <td><c:out value="${cart.RESERVE_POINT }"/><span class="s_gray">(3%)</span></td>
							        <!-- TODO 할인쿠폰 버튼 수정 -->
							        <td class="pr15 pl15">
							            <a href="#" class="btn order view mb10">할인쿠폰</a>
							            <span>-2,500원</span>
							        </td>
							        
							       	<c:if test="${prevPrdMstVdrIdx ne cart.PRD_MST_VDR_IDX }">
						            	<td rowspan="${cart.VDR_IDX_CNT }">
							                <c:choose>
							                    <c:when test="${cart.FREE_DLV_CHARGE_YN eq 'Y'}">
							        		                무료배송
							                    </c:when>
							                    <c:otherwise>
							                        <c:out value="${cart.SUM_FIN_DLV_ADD_CHARGE }"/>원
							                    </c:otherwise>
							                </c:choose>
							            </td>
							            <td rowspan="${cart.VDR_IDX_CNT }"><c:out value="${cart.VDR_MST_NM }"/></td>
							            
							            <c:set var="prevPrdMstVdrIdx" value="${cart.PRD_MST_VDR_IDX }"/>
							    	</c:if>
							    
							    </tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
									
				<div class="calculation_wp w5 mt40">
					<div class="cbx">
						<span class="tit">총 상품금액</span><span class="price"><strong ><fmt:formatNumber value="${amt_prd_fi_prc }" type="number" /></strong> 원</span>
					</div>
					<div class="cbx">
						<span class="cal minus">-</span>
						<span class="tit">총 즉시할인</span><span class="price"><strong ><fmt:formatNumber value="${amt_prd_dis_prc }" type="number" /></strong> 원</span>
					</div>
					<div class="cbx">
						<span class="cal minus">-</span>
						<span class="tit red">상품할인쿠폰</span><span class="price red"><strong><fmt:formatNumber value="${amt_prd_dis_coupon }" type="number" /></strong> 원</span>
					</div>
					<div class="cbx">
						<span class="cal plus">+</span>
						<span class="tit">배송비</span><span class="price"><strong><fmt:formatNumber value="${amt_prd_dlv_prc }" type="number" /></strong> 원</span>
					</div>
					<div class="cbx last">
						<span class="cal equal">=</span>
						<div class="row total clearboth">
							<span class="tit">총 주문금액</span><span class="price"><strong><fmt:formatNumber value="${amt_prd_fi_prc }" type="number" /></strong> 원</span>
						</div>
						<div class="row point clearboth">
							<span class="tit">적립 예정 통합포인트</span><span class="price"><strong ><fmt:formatNumber value="${amt_prd_rev_prc }" type="number" /></strong> P</span>
						</div>
					</div>
				</div>

				<div class="payment_info_wp clearboth">
					<div class="pbx write_area">
						<c:if test="${not empty giftList }">
							<div class="con_tit_wrap">
								<h3 class="con_tit">사은품 정보</h3>
								<p class="con_tit_decs type03">제공되는 사은품 중 1가지를 선택해주세요.</p>
							</div>
							<div class="table_wrap mb95">
								<table class="tb_col">
									<caption>사은품 정보 출력 표입니다.</caption>
									<colgroup>
										<col style="width:100%;">
									</colgroup>
									<tbody>
										<c:forEach var="gift" items="${giftList }" varStatus="i">
											<tr>
												<td class="pro_chk">
													<div class="chkbx ">
														<input type="radio" id="gifts-1" name="GFT_MST_IDX" value="<c:out value="${gift.GFT_MST_IDX }"/>">
														<label for="gifts-1" class="mr15"><span class="icon"></span><span class="blind">선택</span></label>
													</div>
													<div class="product_info clearboth">
														<div class="img">
															<a href="#" class="product_thumb">
																<img class="data-img" src="<c:out value="${cdnDomain }"/><c:out value="${gift.PRODUCT_THUM_IMG }"/>" alt="제품 이미지">
															</a>
														</div>
														<div class="txt">
															<!-- <span class="brand data-brand"></span>-->
															<a href="#" class="item_name data-name"><c:out value="${gift.GFT_MST_NAME }"/></a>
															<span class="item_info dot data-info"><c:out value="${gift.GFT_MST_OPTION }"/></span>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
						<div class="con_tit_wrap">
							<h3 class="con_tit">배송지 정보</h3>
						</div>

                        <div id="divDelivery" class="stab_wrap delivery_wp mb95">
                            <ul class="stab delivery">
                                <li class="on"><a href="#stab1">주문자 정보와 동일</a></li>
                                <li><a href="#stab2">최근 배송지</a></li>
                                <li><a href="#stab3">나의 주소록</a></li>
                                <li><a href="#stab4">새로운 주소</a></li>
                            </ul>
                 
                            <div class="tab_cont addr_sel_wrapper" id="stab1">
                                <div class="table_wrap">
                                    <p class="required_txt"><span>필수입력사항</span></p>
                                    <table class="tb_row">
                                        <caption>배송지 등록 : 받으시는 분, 휴대폰, 전화번호, 주소 입력 표입니다.</caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 받으시는 분
                                                </th>
                                                <td>
                                                    <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_MEM_NM }"/>" placeholder="이름 입력" class="w100p addr_sel_nm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 휴대폰 번호
                                                </th>
                                                <td>
                                                
                                                    <span class="select">
                                                        <select class="w164 addr_sel_hp1">
	                                                        <c:forEach var="hp_item" items="${hpCodeList}" varStatus="i">
	                                                        	<option value="${hp_item.CMN_COM_NM}"
	                                                        	<c:if test="${hp_item.CMN_COM_NM eq userInfo.MEM_MST_HP1}"> selected </c:if>
	                                                        	>
	                                                        		${hp_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" value="${userInfo.MEM_MST_HP2}" name="" placeholder="번호 입력" class="w164 addr_sel_hp2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" value="${userInfo.MEM_MST_HP3}" name="" placeholder="번호 입력" class="w164 addr_sel_hp3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">전화번호</th>
                                                <td>
                                                    <span class="select">
                                                        <select class="w164 addr_sel_tel1">
                                                            <option value="">선택</option>
	                                                        <c:forEach var="tel_item" items="${telCodeList}" varStatus="i">
	                                                        	<option value="${tel_item.CMN_COM_NM}">
	                                                        		${tel_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_TEL2 }"/>" placeholder="번호 입력" class="w164 addr_sel_tel2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_TEL3 }"/>" placeholder="번호 입력" class="w164 addr_sel_tel3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 주소
                                                </th>
                                                <td class="address_info_wrapper">
                                                    <span class="block">
                                                        <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_ZIP_CDE5 }"/>" placeholder="우편번호 입력" class="w405 postcode">
                                                        <button class="btn_large type03 ml8 address_info">우편번호 찾기</button>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_DRO_ADR1 }"/>" placeholder="도로명 주소 입력" class="w100p road_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_JBN_ADR1 }"/>" placeholder="지번 입력" class="w100p jibun_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" value="<c:out value="${userInfo.MEM_MST_DRO_ADR2 }"/>" placeholder="이하 입력" class="w100p etc_addr">
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">배송 유의사항 1</th>
                                                <td class="message_wrapper">
                                             
                                                    <span class="block">
                                                        <span class="select w100p">
                                                            <select  title="배송 유의사항" class="message_sel">
	                                                            
	                                                            <option selected="selected" value="">메시지 직접입력</option>
		                                                        <c:forEach var="msg_item" items="${codes.DLV_MESSAGE_CD}" varStatus="i">
		                                                        	<option value="${msg_item.CMN_COM_IDX}">${msg_item.CMN_COM_NM}</option>
		                                                        </c:forEach>
                                                            </select>
                                                        </span>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="최대 60자 이내 입력가능" class="w100p message_field" title="배송 유의사항 메세지 입력">
                                                    </span>
                                                    <p class="txt_guide">택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다.</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab_cont addr_sel_wrapper" id="stab2">
                                <ul class="ul_dot">
                                    <li>최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요 (최대 5개까지 제공)</li>
                                </ul>
                                <div class="table_wrap inr_table">
                                    <table class="tb_col">
                                        <caption>최근 배송지 정보 : 받으시는 분, 주소, 휴대폰 /전화번호, 판매자명 출력 표입니다.</caption>
                                        <colgroup>
                                            <col style="width:120px;">
                                            <col>
                                            <col style="width:135px;">
                                            <col style="width:75px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">받으시는 분</th>
                                                <th scope="col">주소</th>
                                                <th scope="col">휴대폰<br>/전화번호</th>
                                                <th scope="col">선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
											<c:when test="${ !empty recentDlvList }">
									    	<c:forEach var="item" items="${recentDlvList }" varStatus="status">
									    		<tr>
	                                                <td><c:out value="${item.ORD_DLV_NM }"/></td>
	                                                <td class="left">
	                                                    <ul class="txt_list">
	                                                        <li><c:out value="${item.ORD_DLV_ZIP_CDE5 }"/></li>
	                                                        <li><c:out value="${item.ORD_DLV_DRO_ADR1 }"/> <c:out value="${item.ORD_DLV_DRO_ADR2 }"/></li>
	                                                    </ul>
	                                                </td>
	                                                <td class="left"><c:out value="${item.ORD_DLV_HP1 }"/>-<c:out value="${item.ORD_DLV_HP2 }"/>-<c:out value="${item.ORD_DLV_HP3 }"/></td>
	                                                <td>
	                                                    <input type="radio" id="add2-2" name="add2">
	                                                    <label for="add2-2" class="only"><span class="icon"></span><span class="blind">선택</span></label>
	                                                </td>
	                                            </tr>
									    	</c:forEach>
									    </c:when>
										    <c:otherwise>
												<td colspan="4">최근 배송지가 존재하지 않습니다.</td>            
										    </c:otherwise>
										</c:choose>	
                                        </tbody>
                                    </table>
                                </div>
                                <div class="btn_wrap inr_btn">
                                    <button class="btn_large ok addr_sel_btn">선택 주소 사용</button>
                                </div>
                                
                                <div class="table_wrap mt40">
                                    <p class="required_txt"><span>필수입력사항</span></p>
                                    <table class="tb_row">
                                        <caption>배송지 등록 : 받으시는 분, 휴대폰, 전화번호, 주소 입력 표입니다.</caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                        
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 받으시는 분
                                                </th>
                                                <td>
                                                    <input type="text" name="" placeholder="이름 입력" class="w100p addr_sel_nm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 휴대폰 번호
                                                </th>
                                                <td>
                                                    <span class="select">
                                                        
    													<select  class="w164 addr_sel_hp1">
	                                                        <c:forEach var="hp_item" items="${hpCodeList}" varStatus="i">
	                                                        	<option value="${hp_item.CMN_COM_NM}">
	                                                        		${hp_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_hp2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_hp3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">전화번호</th>
                                                <td>
                                                    <span class="select">
                                                        <select class="w164 addr_sel_tel1">
	                                                        <c:forEach var="tel_item" items="${telCodeList}" varStatus="i">
	                                                        	<option value="${tel_item.CMN_COM_NM}">
	                                                        		${tel_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_tel2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_tel3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 주소
                                                </th>
                                                <td class="address_info_wrapper">
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="우편번호 입력" class="w405 postcode">
                                                        <button class="btn_large type03 ml8 address_info">우편번호 찾기</button>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="도로명 주소 입력" class="w100p road_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="지번 입력" class="w100p jibun_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="이하 입력" class="w100p etc_addr">
                                                    </span>
                                                </td>              
                                                
                                            </tr>
                                            <tr>
                                                <th scope="row">배송 유의사항2 </th>
                                                <td class="message_wrapper">
                                                    <span class="block">
                                                        <span class="select w100p">
                                                            <select id="" title="배송 유의사항" class="message_sel">
	                                                            <option selected="selected" value="">메시지 직접입력</option>
		                                                        <c:forEach var="msg_item" items="${codes.DLV_MESSAGE_CD}" varStatus="i">
		                                                        	<option value="${msg_item.CMN_COM_IDX}">
		                                                        		${msg_item.CMN_COM_NM}
		                                                        	</option>
		                                                        </c:forEach>
                                                            </select>
                                                        </span>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="최대 60자 이내 입력가능" class="w100p message_field" title="배송 유의사항 메세지 입력">
                                                    </span>
                                                    <p class="txt_guide">
                                                        	택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다.
                                                    </p>
                                                </td>
                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab_cont addr_sel_wrapper" id="stab3">
                                <ul class="ul_dot">
                                    <li>배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.</li>
                                    <li>나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, <strong class="black">마이페이지 > 배송지관리</strong>에서<br>등록/수정 가능합니다.</li>
                                </ul>
                                <div class="table_wrap inr_table">
                                    <table class="tb_col">
                                        <caption>주소 정보 : 받으시는 분, 주소, 휴대폰 /전화번호, 판매자명 출력 표입니다.</caption>
                                        <colgroup>
                                            <col style="width:120px;">
                                            <col>
                                            <col style="width:135px;">
                                            <col style="width:75px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">받으시는 분</th>
                                                <th scope="col">주소</th>
                                                <th scope="col">휴대폰<br>/전화번호</th>
                                                <th scope="col">선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:if test="${!empty myDlvList  }">
	                                          <c:forEach var="my_list" items="${myDlvList}" varStatus="i">
		                                            <tr>
		                                                <td class="addr_tmp_name">${my_list.MEM_DLV_RCV_NM}</td>
		                                                <td class="left">
		                                                    <ul class="txt_list">
		                                                        <li class="addr_tmp_postcode">${my_list.MEM_DLV_ZIP_CDE5}</li>
		                                                        <li><span class="addr_tmp_road1">${my_list.MEM_DLV_DRO_ADR1}</span> <span class="addr_tmp_road2">${my_list.MEM_DLV_DRO_ADR2}</span></li>
		                                                        <li><span class="addr_tmp_jibun1">${my_list.MEM_DLV_JBN_ADR1}</span> <span class="addr_tmp_jibun2">${my_list.MEM_DLV_JBN_ADR2}</span></li>
		                                                    </ul>
		                                                </td>
		                                                <td class="left">
		                                                	<span class="addr_tmp_h1">${my_list.MEM_DLV_HP1}</span>-
		                                                	<span class="addr_tmp_h2">${my_list.MEM_DLV_HP2}</span>-
		                                                	<span class="addr_tmp_h3">${my_list.MEM_DLV_HP3}</span>
		                                                </td>
		                                                <td>
		                                                    <input type="radio" id="my_addr_${my_list.MEM_DLV_IDX}" name="my_addr_list" value="${my_list.MEM_DLV_IDX}">
		                                                    <label for="my_addr_${my_list.MEM_DLV_IDX}" class="only"><span class="icon"></span><span class="blind">선택</span></label>
		                                                </td>
		                                            </tr>
	                                           </c:forEach>
                                           </c:if>
                                           <c:if test="${empty myDlvList  }">
                                           		<td colspan="4">나의 주소록에 배송지가 존재하지 않습니다.</td>
                                           </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="btn_wrap inr_btn">
                                    <button class="btn_large" id="addDelivery">추가 배송지 등록</button>
                                    <button class="btn_large ok addr_sel_btn">선택 주소 사용</button>
                                </div>
                                <div class="table_wrap mt40">
                                    <p class="required_txt"><span>필수입력사항</span></p>
                                    <table class="tb_row">
                                        <caption>배송지 등록 : 받으시는 분, 휴대폰, 전화번호, 주소 입력 표입니다.</caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 받으시는 분
                                                </th>
                                                <td>
                                                    <input type="text" name="" placeholder="이름 입력" class="w100p addr_sel_nm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 휴대폰 번호
                                                </th>
                                                <td>
                                                    <span class="select">
                                                        <select class="w164 addr_sel_hp1">
	                                                        <c:forEach var="hp_item" items="${hpCodeList}" varStatus="i">
	                                                        	<option value="${hp_item.CMN_COM_NM}">
	                                                        		${hp_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_hp2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_hp3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">전화번호</th>
                                                <td>
                                                    <span class="select">
                                                        <select id="" class="w164 addr_sel_tel1">
	                                                        <c:forEach var="tel_item" items="${telCodeList}" varStatus="i">
	                                                        	<option value="${tel_item.CMN_COM_NM}">
	                                                        		${tel_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_tel2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_tel3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 주소
                                                </th>
                                                <td class="address_info_wrapper">
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="우편번호 입력" class="w405 postcode">
                                                        <button class="btn_large type03 ml8 address_info">우편번호 찾기</button>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="도로명 주소 입력" class="w100p road_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="지번 입력" class="w100p jibun_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="이하 입력" class="w100p etc_addr">
                                                    </span>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <th scope="row">배송 유의사항 </th>
                                                <td class="message_wrapper">
                                                    <span class="block">
                                                        <span class="select w100p">
                                                            <select id="" title="배송 유의사항" class="message_sel">
	                                                            <option selected="selected" value="">메시지 직접입력</option>
		                                                        <c:forEach var="msg_item" items="${codes.DLV_MESSAGE_CD}" varStatus="i">
		                                                        	<option value="${msg_item.CMN_COM_IDX}">
		                                                        		${msg_item.CMN_COM_NM}
		                                                        	</option>
		                                                        </c:forEach>
                                                            </select>
                                                        </span>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="최대 60자 이내 입력가능" class="w100p message_field" title="배송 유의사항 메세지 입력">
                                                    </span>
                                                    <p class="txt_guide">
                                                        택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다.
                                                    </p>
                                                </td>
                                                
                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab_cont addr_sel_wrapper" id="stab4">
                                <div class="table_wrap">
                                    <p class="required_txt"><span>필수입력사항</span></p>
                                    <table class="tb_row">
                                        <caption>배송지 등록 : 받으시는 분, 휴대폰, 전화번호, 주소 입력 표입니다.</caption>
                                        <colgroup>
                                            <col style="width:180px">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 받으시는 분
                                                </th>
                                                <td>
                                                    <input type="text" name="" placeholder="이름 입력" class="w100p addr_sel_nm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 휴대폰 번호
                                                </th>
                                                <td>
                                                    <span class="select">
                                                        <select class="w164 addr_sel_hp1">
	                                                        <c:forEach var="hp_item" items="${hpCodeList}" varStatus="i">
	                                                        	<option value="${hp_item.CMN_COM_NM}">
	                                                        		${hp_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_hp2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_hp3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">전화번호</th>
                                                <td>
                                                    <span class="select">
                                                        <select class="w164 addr_sel_tel1">
	                                                        <c:forEach var="tel_item" items="${telCodeList}" varStatus="i">
	                                                        	<option value="${tel_item.CMN_COM_NM}">
	                                                        		${tel_item.CMN_COM_NM}
	                                                        	</option>
	                                                        </c:forEach>
                                                        </select>
                                                    </span>
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_tel2">
                                                    <span class="hyphen">-</span>
                                                    <input type="text" name="" placeholder="번호 입력" class="w164 addr_sel_tel3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="required">
                                                        <em class="blind">필수 정보</em>
                                                    </span> 주소
                                                </th>
                                                <td class="address_info_wrapper">
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="우편번호 입력" class="w405 postcode">
                                                        <button class="btn_large type03 ml8 address_info">우편번호 찾기</button>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="도로명 주소 입력" class="w100p road_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="지번 입력" class="w100p jibun_addr">
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="이하 입력" class="w100p etc_addr">
                                                    </span>
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <th scope="row">배송 유의사항 </th>
                                                <td class="message_wrapper">
                                                    <span class="block">
                                                        <span class="select w100p">
                                                            <select id="" title="배송 유의사항" class="message_sel">
	                                                            <option selected="selected" value="">메시지 직접입력</option>
		                                                        <c:forEach var="msg_item" items="${codes.DLV_MESSAGE_CD}" varStatus="i">
		                                                        	<option value="${msg_item.CMN_COM_IDX}">
		                                                        		${msg_item.CMN_COM_NM}
		                                                        	</option>
		                                                        </c:forEach>
                                                            </select>
                                                        </span>
                                                    </span>
                                                    <span class="block">
                                                        <input type="text" name="" placeholder="최대 60자 이내 입력가능" class="w100p message_field" title="배송 유의사항 메세지 입력">
                                                    </span>
                                                    <p class="txt_guide">
                                                        택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다.
                                                    </p>
                                                </td>
                                                
                                                
                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
						<!-- 
						<div class="con_tit_wrap">
							<h3 class="con_tit">할인쿠폰 및 포인트</h3>
						</div>
						 -->
						<!-- 회원일 경우 -->
						<!-- 
						<c:if test="${!empty user }">
						<div class="table_wrap mb35">
							<table class="tb_row">
								<caption>할인쿠폰 및 포인트 등록 : 배송비 쿠폰, 통합포인트 사용, E포인트 사용, 임직원 포인트 입력 표입니다.</caption>
								<colgroup>
									<col style="width:180px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">배송비 쿠폰</th>
										<td>
											<div class="block">
												<span class="t_price mr30">2,500 원</span>
												<button class="btn_small mr20">쿠폰 사용</button>
												<span>(사용 가능한 쿠폰 : 1장)</span>
											</div>
											<div class="table_wrap inr_table st2">
												<table class="tb_col">
													<caption>배송비 쿠폰 정보 : 상품/옵션 정보, 배송비 쿠폰 출력 표입니다.</caption>
													<colgroup>
														<col style="width:50%;">
														<col style="width:50%;">
													</colgroup>
													<thead>
														<tr>
															<th scope="col">상품/옵션 정보</th>
															<th scope="col">배송비 쿠폰</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<div class="product_info clearboth">
																	<div class="txt">
																		<span class="brand">[신원] VIKI</span>
																		<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297) </a>
																		<span class="item_info dot mt15">블랙 / 90 / 1개</span>
																		<p class="s_price purple mt15">95,000 원</p>
																	</div>
																</div>
															</td>
															<td>
																<span class="select w100p">
																	<select id="" title="배송비 쿠폰">
																		<option>무료배송</option>
																	</select>
																</span>
															</td>
														</tr>
														<tr>
															<td>
																<div class="product_info clearboth">
																	<div class="txt">
																		<span class="brand">[신원] VIKI</span>
																		<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297) </a>
																		<span class="item_info dot mt15">블랙 / 90 / 1개</span>
																		<p class="s_price purple mt15">95,000 원</p>
																	</div>
																</div>
															</td>
															<td>
																<span class="select w100p">
																	<select id="" title="배송비 쿠폰">
																		<option>무료배송</option>
																	</select>
																</span>
															</td>
														</tr>
														<tr>
															<td>
																<div class="product_info clearboth">
																	<div class="txt">
																		<span class="brand">[신원] VIKI</span>
																		<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297) </a>
																		<span class="item_info dot mt15">블랙 / 90 / 1개</span>
																		<p class="s_price purple mt15">95,000 원</p>
																	</div>
																</div>
															</td>
															<td>적용 가능한 쿠폰이 없습니다.</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="btn_wrap inr_btn">
												<button class="btn_large">취소</button>
												<button class="btn_large ok">적용</button>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">통합포인트 <br />사용</th>
										<td>
											<input type="text" name="" title="통합포인트 사용" class="w150">
											<strong class="unit_point">P</strong>
											<input type="checkbox" id="point_use1">
											<label for="point_use1" class="mr15"><span class="icon"></span>모두사용</label>
											<span class="vam">(사용가능 통합포인트 : <strong>5,000</strong> P)</span>
										</td>
									</tr>
									<tr>
										<th scope="row">E포인트 사용</th>
										<td>
											<input type="text" name="" title="E포인트 사용" class="w150">
											<strong class="unit_point">P</strong>
											<input type="checkbox" id="point_use1">
											<label for="point_use1" class="mr15"><span class="icon"></span>모두사용</label>
											<span class="vam">(사용가능 E포인트 : <strong>5,000</strong> P)</span>
										</td>
									</tr>
									<tr>
										<th scope="row">임직원 포인트</th>
										<td>
											<span class="t_price mr30">69,300 P</span>
											<span class="vam">(보유 포인트 : <strong>615,000</strong> P)</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<ul class="ul_dot mb95">
							<li>포인트 사용 시 전체 상품에 분배되어 적용되며 부분 취소 시 개별 상품에 적용된 포인트만 환불됩니다.</li>
							<li>E포인트는 10만원 이상 구매 시 사용 가능/ 통합 포인트는 20,000P 이상 적립 시 사용 가능</li>
						</ul>
						 -->
						<!-- //회원일 경우-->
						<!--</c:if> -->
						<!--
						<c:if test="${empty user}">
						-->
						<!-- 비회원일 경우 -->
						<!--
						<div class="table_wrap mb35">
							<table class="tb_row">
								<caption>할인쿠폰 및 포인트 등록 : 배송비 쿠폰, 통합포인트 사용, E포인트 사용, 임직원 포인트 입력 표입니다.</caption>
								<colgroup>
									<col style="width:180px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">배송비 쿠폰</th>
										<td rowspan="4">회원 전용 혜택입니다.<br />회원가입 후 구매하시면 더 많은 혜택을 받으실 수 있습니다.</td>
									</tr>
									<tr>
										<th scope="row">통합포인트 <br />사용</th>
									</tr>
									<tr>
										<th scope="row">E포인트 사용</th>
									</tr>
								</tbody>
							</table>
						</div>
						</c:if>
						-->
						<!-- //비회원일 경우 -->
						<!--
						<div class="con_tit_wrap">
							<h3 class="con_tit">프로모션 할인</h3>
						</div>
						<div class="promotion_sale clearboth">
							<input type="text" name="" title="프로모션 할인쿠폰 입력" value="XXXXXXXXX">
							<button class="btn_input">확인</button>
						</div>
						<p class="mt15 mb95">2,000원 특별 프로모션 할인</p>
						-->
						<!-- 
						<div class="con_tit_wrap">
							<h3 class="con_tit">결제 정보</h3>
						</div>
						<div class="table_wrap mb20">
							<table class="tb_row">
								<caption>결제 정보 : 결제 수단 입력 표입니다.</caption>
								<colgroup>
									<col style="width:180px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">결제 수단</th>
										<td>
											<div class="payment_way_wp">
												<div class="payment_way_change">
													<input type="radio" id="credit_card" name="delivery_payment">
													<label for="credit_card" class="mr30"><span class="icon"></span>신용카드</label>
													<input type="radio" id="virtual_account" name="delivery_payment">
													<label for="virtual_account" class="mr30"><span class="icon"></span>가상계좌(무통장입금)</label>
													<input type="radio" id="account_transfer" name="delivery_payment">
													<label for="account_transfer" class="mr30"><span class="icon"></span>실시간계좌이체</label>
													<input type="radio" id="phone_banking" name="delivery_payment">
													<label for="phone_banking" class="mr30"><span class="icon"></span>휴대폰결제</label>
													<input type="radio" id="simple_payment" name="delivery_payment">
													<label for="simple_payment" class="mr30"><span class="icon"></span>간편결제</label>
												</div>
												<div class="payment_type">
													<div class="pbx p0">
														<ul class="ul_dot mb40">
															<li>신용카드 결제시 '카드사혜택’ 버튼을 클릭하시면 무이자할부/청구할인/즉시할인에 대한 정보를 보실 수 있습니다.</li>
															<li>체크카드, 법인카드의 경우 무이자 할부행사에서 제외됩니다.</li>
															<li>신용카드로 결제하시는 최종 결제 금액이 기준금액 미만이거나, 그 외 무이자 할부가 되지 않는 기타 신용카드를 사용하시는 경우는 유이자 할부로 결제되오니 반드시 참고하시기 바랍니다.</li>
														</ul>

														<span class="select">
															<select id="" class="w275" title="카드">
																<option selected="selected">카드 선택</option>
															</select>
														</span>
														<span class="select">
															<select id="" class="w275" title="할부">
																<option selected="selected">할부 선택</option>
															</select>
														</span>
													</div>
													<div class="pbx p1">
														<ul class="ul_dot mb40">
															<li>가상계좌(무통장) 이용 시 포인트, 쿠폰을 사용했을 경우, 유효기간이 지나기 전에 입금해 주셔야 하며, 유효기간 이후 입금할 경우 주문이 취소됩니다. 가상계좌(무통장) 입금의 경우 입금 확인 후부터 배송이 진행됩니다.</li>
															<li>가상계좌(무통장) 결제 시 주문일로 부터 익일 이내 입금을 하지 않을 경우 자동 취소됩니다.</li>
															<li>금 시 주문자 성함과 동일하게 기재해 주시기 바랍니다. 다를 경우 고객센터 (1661-2585)로 연락 주시기 바랍니다.</li>
															<li>결제 금액과 계좌번호를 SMS로 발송하므로 휴대폰 번호를 정확히 입력해 주시기 바랍니다.</li>
														</ul>
														<ul class="pbx_list">
															<li>
																<div class="tit clearboth">
																	<strong>현금영수증</strong>
																	<div class="cash_receipt_rdo">
																		<input type="radio" id="individual" name="cash_receipt">
																		<label for="individual" class="mr15"><span class="icon"></span>개인 소득공제용</label>
																		<input type="radio" id="business" name="cash_receipt">
																		<label for="business" class="mr15"><span class="icon"></span>사업자 지출증빙용</label>
																		<input type="radio" id="unissued" name="cash_receipt">
																		<label for="unissued" class="mr15"><span class="icon"></span>미발행</label>
																	</div>
																</div>
																<div class="tit clearboth">
																	<strong>현금영수증</strong>
																	<div class="cash_receipt_rdo">
																		<span><span class="t_price">개인소득공제용</span> (휴대폰번호 : 010-1234-5678) </span>
																		<button class="btn_small">변경</button>
																	</div>
																</div>
																<div class="cash_receipt_view">
																	
																	<div class="cbx cash_receipt">
																		<span class="select">
																			<select id="" class="w164">
																				<option value="1" selected="selected">휴대폰번호</option>
																				<option value="2">현금영수증카드번호</option>
																			</select>
																		</span>
																		<div class="receipt_type on">
																			<span class="select">
																				<select id="" class="w115" title="첫번째자리 번호">
							                                                        <c:forEach var="hp_item" items="${hpCodeList}" varStatus="i">
							                                                        	<option value="${hp_item.CMN_COM_IDX}">
							                                                        		${hp_item.CMN_COM_NM}
							                                                        	</option>
							                                                        </c:forEach>
																				</select>
																			</span>
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w115">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w115">
																		</div>
																		<div class="receipt_type">
																			<input type="text" name="" placeholder="입력" title="첫번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="두번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="세번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="네번째자리 번호 입력" class="w82">
																		</div>
																	</div>
																	
																	<div class="cbx cash_receipt">
																		<span class="select">
																			<select id="" class="w164">
																				<option value="1"  selected="selected">사업자번호</option>
																				<option value="2">현금영수증카드번호</option>
																			</select>
																		</span>
																		<div class="receipt_type on">
																			<input type="text" name="" placeholder="번호 입력" title="첫번째자리 번호 입력" class="w115">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w115">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w115">
																		</div>
																		<div class="receipt_type">
																			<input type="text" name="" placeholder="입력" title="첫번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="두번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="세번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="네번째자리 번호 입력" class="w82">
																		</div>
																	</div>
																	
																	<div class="cbx"><p class="t_dot">미발행을 선택하신 경우에도 현금영수증이 자진 발급됩니다.</p></div>
																</div>
																<div class="mt20">
																	<input type="checkbox" id="save_cash_receipt1" name="save_cash_receipt1">
																	<label for="save_cash_receipt1"><span class="icon"></span>현금영수증 정보 저장하기</label>
																</div>
															</li>
															<li>
																<div class="tit clearboth"><strong>환불계좌정보</strong></div>
																<div class="tit clearboth">
																	<strong>환불계좌정보</strong>
																	<div class="cash_receipt_rdo">
																		<span>국민은행 / 123456789012 / 홍길동</span>
																		<button class="btn_small">변경</button>
																	</div>
																</div> 
																<div class="form virtual_account_form clearboth">
																	<div class="block clearboth">
																		<span class="select">
																			<select id="" class="w200" title="은행 선택">
																			
																				<c:forEach var="bank_item" items="${depositBankList}" varStatus="i">
						                                                        	<option value="${bank_item.CMN_COM_IDX}">
						                                                        		${bank_item.CMN_COM_NM}
						                                                        	</option>
						                                                        </c:forEach>

																				<option>은행 선택</option>
																			</select>
																		</span>
																		<input type="number" name="" class="inp_acc w350" title="계좌번호 입력" placeholder="하이픈(-)없이 계좌번호 숫자만 입력">
																	</div>
																	<div class="block clearboth">
																		<input type="text" name="" class="inp_name w420" title="예금주명 입력" placeholder="예금주명 입력">
																		<button class="btn order view">계좌 확인</button>
																	</div>
																</div>
																<div class="mt20">
																	<input type="checkbox" id="save_account_info" name="save_account_info">
																	<label for="save_account_info"><span class="icon"></span>환불계좌정보 저장하기</label>
																</div>
															</li>
														</ul>
													</div>
													<div class="pbx p2">
														<ul class="ul_dot mb40">
															<li>결제와 동시에 ㈜쑈윈도에 입금 처리되며, 10분 이내에 입금확인이 가능합니다.</li>
														</ul>
														<ul class="pbx_list">
															<li>
																<div class="tit clearboth">
																	<strong>현금영수증</strong>
																	<div class="cash_receipt_rdo">
																		<input type="radio" id="individual2" name="cash_receipt">
																		<label for="individual2" class="mr15"><span class="icon"></span>개인 소득공제용</label>
																		<input type="radio" id="business2" name="cash_receipt">
																		<label for="business2" class="mr15"><span class="icon"></span>사업자 지출증빙용</label>
																		<input type="radio" id="unissued3" name="cash_receipt">
																		<label for="unissued3" class="mr15"><span class="icon"></span>미발행</label>
																	</div>
																</div>
																<div class="tit clearboth">
																	<strong>현금영수증</strong>
																	<div class="cash_receipt_rdo">
																		<span><span class="t_price">개인소득공제용</span> (휴대폰번호 : 010-1234-5678) </span>
																		<button class="btn_small">변경</button>
																	</div>
																</div> 
																<div class="cash_receipt_view">
																	<div class="cbx cash_receipt">
																		<span class="select">
																			<select id="" class="w164">
																				<option value="1" selected="selected">휴대폰번호</option>
																				<option value="2">현금영수증카드번호</option>
																			</select>
																		</span>
																		<div class="receipt_type on">
																			<span class="select">
																				<select id="" class="w115" title="첫번째자리 번호">
							                                                        <c:forEach var="hp_item" items="${hpCodeList}" varStatus="i">
							                                                        	<option value="${hp_item.CMN_COM_IDX}">
							                                                        		${hp_item.CMN_COM_NM}
							                                                        	</option>
							                                                        </c:forEach>
																				</select>
																			</span>
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w115">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w115">
																		</div>
																		<div class="receipt_type">
																			<input type="text" name="" placeholder="입력" title="첫번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="두번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="세번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="네번째자리 번호 입력" class="w82">
																		</div>
																	</div>
																	<div class="cbx cash_receipt">
																		<span class="select">
																			<select id="" class="w164">
																				<option value="1"  selected="selected">사업자번호</option>
																				<option value="2">현금영수증카드번호</option>
																			</select>
																		</span>
																		<div class="receipt_type on">
																			<input type="text" name="" placeholder="번호 입력" title="첫번째자리 번호 입력" class="w115">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="두번째자리 번호 입력" class="w115">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="번호 입력" title="세번째자리 번호 입력" class="w115">
																		</div>
																		<div class="receipt_type">
																			<input type="text" name="" placeholder="입력" title="첫번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="두번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="세번째자리 번호 입력" class="w82">
																			<span class="hyphen">-</span>
																			<input type="text" name="" placeholder="입력" title="네번째자리 번호 입력" class="w82">
																		</div>
																	</div>
																	<div class="cbx"><p class="t_dot">미발행을 선택하신 경우에도 현금영수증이 자진 발급됩니다.</p></div>
																</div>
															</li>
														</ul>
														<div class="mt20">
															<input type="checkbox" id="save_cash_receipt2" name="save_cash_receipt2">
															<label for="save_cash_receipt2"><span class="icon"></span>현금영수증 정보 저장하기</label>
														</div>
													</div>
													<div class="pbx p3">
														<ul class="ul_dot">
															<li>쑈윈도에서 휴대폰으로 결제 가능한 최대 금액은 월 30만원이나, 개인별 한도금액은 통신사 및 개인 설정에 따라 다를 수 있습니다.</li>
															<li>휴대폰으로 결제하신 금액은 익월 휴대폰 요금에 함께 청구되며 별도의 수수료는 부과되지 않습니다.</li>
															<li>휴대폰 소액결제로 구매하실 경우 현금영수증이 발급되지 않습니다.</li>
															<li>휴대폰 결제로 구매하신 상품의 취소/반품은 처리완료 시점에 따라 다음과 같이 이루어집니다.<br>
																- 결제하신 당월에 취소/반품 처리가 완료되는 경우 휴대폰 이용요금에 부과예정이던 금액이 취소됩니다.<br>
															    - 결제하신 당월이 지난 후 취소/반품처리가 완료되는 경우, 환불액이 고객님의 계좌로 현금 입금해 드립니다.</li>

															<li>휴대폰결제관련 문의사항은 U+전자결제 고객센터 1544-7772  또는 쑈윈도 고객센터 1661-2585으로 연락주시기 바랍니다.</li>
														</ul>
													</div>
													<div class="pbx p4">
														<ul class="ul_dot mb40">
															<li>간편결제는 쑈윈도이 제공하는 무이자 할부와 무관하며, 서비스사의 별도 기준이 적용되니 자세한 내용은 해당 서비스사를 확인해 주세요.</li>
														</ul>
														<input type="radio" id="rdo_simple1" name="rdo_simple">
														<label for="rdo_simple1"><span class="icon"></span><span class="simple sp1">Paynow</span></label>
														<input type="radio" id="rdo_simple2" name="rdo_simple">
														<label for="rdo_simple2"><span class="icon"></span><span class="simple sp2">LG페이</span></label>
														<input type="radio" id="rdo_simple3" name="rdo_simple">
														<label for="rdo_simple3"><span class="icon"></span><span class="simple sp3">SAMSUNG PAY</span></label>
														<input type="radio" id="rdo_simple4" name="rdo_simple">
														<label for="rdo_simple4"><span class="icon"></span><span class="simple sp4">PAYCO</span></label>
														<input type="radio" id="rdo_simple5" name="rdo_simple">
														<label for="rdo_simple5"><span class="icon"></span><span class="simple sp5">SSGPAY</span></label>
														<input type="radio" id="rdo_simple6" name="rdo_simple">
														<label for="rdo_simple6"><span class="icon"></span><span class="simple sp6">L.pay</span></label>
														<input type="radio" id="rdo_simple7" name="rdo_simple">
														<label for="rdo_simple7"><span class="icon"></span><span class="simple sp7">KAKAO PAY</span></label>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					
						<div class="mb95">
							<input type="checkbox" id="save_payment" name="save_payment">
							<label for="save_payment"><span class="icon"></span>지금 선택하신 결제수단을 다음에도 사용</label>
						</div>
						 -->

						<div class="con_tit_wrap">
							<h3 class="con_tit">배송 포장 옵션</h3>
						</div>
						<div class="desc_wp packing">
							<div class="mb20">
								<input type="checkbox" id="packing" name="packing_chk">
								<label for="packing"><span class="icon"></span>선물포장 요청(무료)</label>
							</div>
							<ul class="txt">
								<li>신원 상품 구매 시 선물용이나 이동 시, 편리하게 사용할 수 있는 쇼핑백을 포장해드립니다. <br>(*신원 외 판매자는 배송되지 않습니다) </li>
								<li>브랜드 쇼핑백 또는 신원 전용 쇼핑백 중 1개로 무작위 발송되며, 고객님의 요청사항이 반영되지 않습니다.</li>
							</ul>
						</div>

					</div><!-- //write_area -->
					<div class="pbx final_area">
						<div class="table_wrap">
							<table class="tb_col">
								<caption>최종결제 정보 표입니다.</caption>
								<colgroup>
									<col style="width:100%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">최종결제 정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<dl>
												<dt>총 상품금액</dt><dd><fmt:formatNumber value="${amt_prd_tot_prc }"/> 원</dd>
											</dl>
											<!--<dl>-->
												<!-- <dt>배송비</dt><dd>+2500 원</dd>-->
												<!-- <dt>- 도서산간 배송비</dt><dd>+0 원</dd> -->
											<!--</dl>-->
											<dl>
												<dt>할인금액</dt><dd class="red">-<fmt:formatNumber value="${amt_prd_dis_prc }"/> 원</dd>
												<!-- <dt>- 즉시할인</dt><dd>-0 원</dd> -->
												<!-- <dt>- 상품할인쿠폰</dt><dd>-0 원</dd> -->
												<!-- <dt>- 배송비쿠폰</dt><dd>-0 원</dd> -->
												<!-- <dt>- 프로모션 할인</dt><dd>-0 원</dd> -->
											</dl>
											<!--<dl> -->
												<!-- <dt>포인트 사용</dt><dd>-0 P</dd> -->
												<!-- <dt>- 통합포인트 사용</dt><dd>-0 P</dd> -->
												<!-- <dt>- E포인트 사용</dt><dd>-0 P</dd> -->
											<!--</dl> -->
										</td>
									</tr>
									<tr>
										<td>
											<dl class="total">
												<dt>총 주문금액</dt><dd><fmt:formatNumber value="${amt_prd_fi_prc }"/> 원</dd>
											</dl>
											<dl>
												<dt>적립 예정 통합포인트</dt><dd><fmt:formatNumber value="${amt_prd_rev_prc }"/> P</dd>
											</dl>
											<div class="btn_wrap">
												<button id="payment_submit" class="btn_large ok w100p">결제하기</button>
											</div>
										</td>
									</tr>
									<tr>
										<td class="left">
											<ul class="agree_list">
												<li>
													<input type="checkbox" id="all_agree" name="all_agree">
													<label for="all_agree"><span class="icon"></span>동의 합니다. (전사상거래법 제 8조 2항)</label>
												</li>
											</ul>
                                            <p class="txt">주문하실 상품, 가격, 배송정보, 할인내역 등을 최종 확인하였으며, 구매에 동의하시겠습니까?</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div><!-- //final_area -->
				</div>

			</div>
		</div>
	</div>
	<!--// Content -->
	
<div id="myDelivePopup"></div>
<%-- <script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/epass.datepickr-0.4.js"></script><!-- 달력 --> --%>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script>
var isSubmit = false;

$(function(){
    //달력
    //epass.datepickr-0.4.js 이거불러와서 써주세요.
    if($('.btn_calendar').length > 0){
    	$('.btn_calendar').datePickr();
    }

    // 쿠폰/포인트 조회
    $('.discount-info .my-check').on('click', function(e) {
        e.preventDefault();

        var $this = $(this),
            field = $this.parents('.article').find('.field');

        field.slideToggle('400');
        if ($this.hasClass('in')){
            $this.removeClass('in').find('.blind em').html('열기');
        }else {
            $this.addClass('in').find('.blind em').html('닫기');
        }
    });

    // 신용카드 혜택
    $('.payment-way .benefit-wrap .tab-nav').on('mouseover', function(e) {
        e.preventDefault();

        var $this = $(this);
            $this.addClass('active').siblings('.tab-nav').removeClass('active');
            $this.next().addClass('in').siblings('.benefit').removeClass('in');

    });

});
</script>

<script type="text/javascript">

    /**
    cnspay  를 통해 결제를 시작합니다.
    */
    function cnspay() {
    	
    	var radioPayment = "";
    	$("input[name=radioPayment]").each(function(){
            if($(this).attr("checked")){
                radioPayment = $(this).val();
            }
        });
        
        if(radioPayment == "${Code.PAY_KAKAOPAY}"){
            // 00(=정상)
            if(document.LGD_PAYINFO.resultCode.value == '00') {
            	//결제 시  euc-kr로 해야한다.
	            /* document.LGD_PAYINFO.acceptCharset = "euc-kr";
	            if (LGD_PAYINFO.canHaveHTML) { // detect IE
	            document.charset = LGD_PAYINFO.acceptCharset;
	            } */
	            
                // TO-DO : 가맹점에서 해줘야할 부분(TXN_ID)과 KaKaoPay DLP 호출 API
                kakaopayDlp.setTxnId(document.LGD_PAYINFO.txnId.value);
                kakaopayDlp.setChannelType('WPM', 'TMS'); // PC결제
                //kakaopayDlp.setChannelType('MPM', 'WEB'); // 모바일 웹(브라우저)결제
                //kakaopayDlp.addRequestParams({ MOBILE_NUM : '010-1234-5678'}); // 초기값 세팅
                kakaopayDlp.callDlp('kakaopay_layer', document.LGD_PAYINFO, submitFunc);
            } else {
            	//결제 취소시 utf-8로 리셋
	            /* document.LGD_PAYINFO.acceptCharset = "utf-8";
	            if (LGD_PAYINFO.canHaveHTML) { // detect IE
	            document.charset = LGD_PAYINFO.acceptCharset;
	            } */
	            
                alert(document.LGD_PAYINFO.resultMsg.value);
            }
            
        }
        
    }
    
    function getTxnId(){
       /* 무이자할부는 없으므로 주석처리
        var maxInt = document.getElementById('maxInt').value;
        var fixedInt = document.getElementById('fixedInt').value;
        
        if( maxInt != '' && fixedInt != '' && fixedInt > maxInt ) {
            alert('가맹점에서 설정한 최대 할부 개월수를 초과하여 결제요청되었습니다.');
        } else { */
        	
            $.ajax({
				type : "post",
				url : "<c:out value="${serverDomain}" />/pc/cart/getTxnId.do",
				data : $("#LGD_PAYINFO").serialize(),
				dataType : "json",
				async : false,
				success : function(data){
		            // 가져온 결과를 LGD_PAYINFO에 세팅
		            $("#resultCode").val(data.resultCode);
		            $("#resultMsg").val(data.resultMsg);
		            $("#txnId").val(data.txnId);
		            //$("#merchantTxnNum").val(data.merchantTxnNum);
		            $("#prDt").val(data.prDt);
		            
			        cnspay();
				},
				error : function(err){
					alert("오류가 발생하였습니다.\n[" + err.status + "]");
				}
			});
            
            // 이후의 과정은 getTxnId.jsp 부터 진행
       /*  } */
    }
    
    var submitFunc = function cnspaySubmit(data){

				// 매뉴얼 참조하여 부인방지코드값 관리
				
        if(data.RESULT_CODE === '00') {
        	isSubmit = true;
        	$("#LGD_PAYINFO").attr({"action":"<c:out value="${serverDomain}" />/pc/cart/payment.do", "method":"post", "target":"_self"}).submit();
            //document.LGD_PAYINFO.submit();
        } else if(data.RESULT_CODE === 'KKP_SER_002') {
            // X버튼 눌렀을때의 이벤트 처리 코드 등록
            alert(data.RESULT_MSG);
        } else {
            alert(data.RESULT_MSG);
        }
        
    };

    function installmentOnChange(){
        var paymentMethod = "CC";
        var possiCardNum = document.getElementById('possiCard').value;
        var fixedIntNum = document.getElementById('fixedInt').value;
        
        if( possiCardNum == '' || fixedIntNum == '' ){
            document.getElementById('noIntOpt').value = "";
            
        } else {
            // 무이자 할부를 선택함에 따라 넘겨줘야 하는 값(pdf 참조)
            document.getElementById('noIntOpt').value = paymentMethod + possiCardNum + fixedIntNum;
            
        }
    }
    
    function noIntYNonChange(){
        var noIntYN = document.getElementById('noIntYN').value;
        var paymentMethod = "CC";
        var possiCardNum = document.getElementById('possiCard').value;
        var fixedIntNum = document.getElementById('fixedInt').value;
        
        if( noIntYN == 'N' ){
            document.getElementById('noIntOpt').value = "";
            
        } else if( possiCardNum == '' || fixedIntNum == '' ){
            document.getElementById('noIntOpt').value = "";
            
        } else {
            // 무이자 할부를 선택함에 따라 넘겨줘야 하는 값(pdf 참조)
            document.getElementById('noIntOpt').value = paymentMethod + possiCardNum + fixedIntNum;
            
        }
    }
    
    function maxIntChange(){
        //최대할부개월에 따라서 고정할부개월의 선택 가능 범위 조정
        
    }
    
</script>
<%-- kakaoPay script 끝--%>

<%-- kicc isp script 시작--%>
<c:if test="${CST_PLATFORM eq 'test'}">
<script type="text/javascript" src="http://testpg.easypay.co.kr/webpay/EasypayCard_Web.js" charset=UTF-8></script><!--test -->
<script language=javascript src="http://www.bankpay.or.kr/BankPayEFT_UTF8.js"></script>
</c:if>
<c:if test="${CST_PLATFORM ne 'test'}">
<script type="text/javascript" src="https://pg.easypay.co.kr/webpay/EasypayCard_Web.js" charset=UTF-8></script><!-- real-->
<script language=javascript src="https://www.bankpay.or.kr/BankPayEFT_UTF8_SSL.js"></script>
</c:if>

<script src="<c:out value="${cdnDomain}"/>/pc/js/jquery.validate.js"></script>

<script type="text/javascript">
var frm_pay = document.LGD_PAYINFO;

function f_card() 
{
    if( frm_pay.EP_product_amt.value < 50000 ) 
    {
        frm_pay.EP_install_period.value = "00";
        frm_pay.EP_noint_yn.value = "N";
    }
    else 
    {
        frm_pay.EP_install_period.value = frm_pay.install_period.value;
    }

    /* UTF-8 사용가맹점의 경우 EP_charset 값 셋팅 필수 */
    if( frm_pay.EP_charset.value == "UTF-8" ) 
    {
        // 한글이 들어가는 값은 모두 encoding 필수.
        frm_pay.EP_mall_nm.value      = encodeURIComponent( frm_pay.EP_mall_nm.value );
        frm_pay.EP_product_nm.value   = encodeURIComponent( frm_pay.EP_product_nm.value );
    }

    /* 가맹점에서 원하는 인증창 호출 방법을 선택 */
    /* iframe */
    easypay_card_webpay(frm_pay,"<c:out value="${serverDomain}"/>/pc/cart/v3d_req.do","hiddenifr","0","0","iframe",30);
    /* popup  */
    //easypay_card_webpay(frm_pay,"./card_req_popup.jsp","hiddenifr","","","popup",30);
    /* submit */
    //easypay_card_webpay(frm_pay,"./card_req.jsp","hiddenifr","0","0","submit",30);
}

function f_submit()
{
    // 정상("0000") 일 때 승인요청페이지로 이동.
    if( frm_pay.EP_res_cd.value == "0000" )
    {
        if( frm_pay.EP_charset.value == "UTF-8" )
        {
            // 한글이 들어가는 값은 모두 encoding 필수.
            frm_pay.EP_mall_nm.value      = decodeURIComponent( frm_pay.EP_mall_nm.value );
            frm_pay.EP_product_nm.value   = decodeURIComponent( frm_pay.EP_product_nm.value );
        }
        
        frm_pay.target = "_self";
        frm_pay.action = "<c:out value="${serverDomain}"/>/pc/cart/payment.do";
        isSubmit = true;
        frm_pay.submit();
    }
}

// 계좌이체
function f_account_submit() {
    /* 금결원 전자지갑 플러그인 설치 확인 */
    if( document.BankPayEFT == null || document.BankPayEFT.object == null )
    {
    	alert("금결원 전자지갑 플러그인이 설치되지 않았습니다." );
        return false;
    }
    
    frm_pay.target = "_self";
    frm_pay.action = "<c:out value="${serverDomain}"/>/pc/cart/payment.do";
    
    //bankpay 결제모듈 닫으면 selectbox, radio, checkbox 초기화되는 버그 막기 위한 스크립트..
    /* $("input[type=radio]:checked").each(function(){
    	$(this).parent().parent().find("input[type=radio]").removeAttr("checked");
    	$(this).prop("checked",true);
    	$(this).attr("checked","checked");
    });
    $("input[type=checkbox]:checked").each(function(){
    	$(this).prop("checked",true);
    	$(this).attr("checked","checked");
    });
    $("input[type=checkbox]:unchecked").each(function(){
    	$(this).prop("checked",false);
    	$(this).removeAttr("checked");
    });
    $("select option:selected").each(function(){
    	var value = $(this).val();
    	if(value != ""){
    		$(this).siblings().removeAttr("selected");
    		$(this).prop("selected",true);
        	$(this).attr("selected","selected");
    	}
    }); */
    
    payRequestLink( frm_pay );
}


</script>
<%-- kicc isp script 끝--%>

<%-- LGU+ xpay script 시작- --%>
<!--  UTF-8 인코딩 사용 시는 xpay.js 대신 xpay_utf-8.js 을  호출하시기 바랍니다.-->
<c:if test="${CST_PLATFORM eq 'test'}">
<script type="text/javascript" src="https://pretest.uplus.co.kr:9443/xpay/js/xpay_crossplatform.js"></script>
</c:if>
<c:if test="${CST_PLATFORM ne 'test'}">
<script type="text/javascript" src="https://xpayvvip.uplus.co.kr/xpay/js/xpay_crossplatform.js"></script>
</c:if>
<%-- LGU+ xpay script 끝--%>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode($pTargetElem) {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            $('.postcode', $pTargetElem).val(data.zonecode);
	            $('.road_addr', $pTargetElem).val(fullRoadAddr);
	            $('.jibun_addr', $pTargetElem).val(data.jibunAddress);
	            $('.etc_addr', $pTargetElem).val('');
	        
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById('MEM_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
	            //document.getElementById('MEM_DLV_DRO_ADR1').value = fullRoadAddr;
	            //document.getElementById('MEM_DLV_JBN_ADR1').value = data.jibunAddress;
				
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            /*
	            if(data.autoRoadAddress) {
	                //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = ;
	                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')
	
	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	            */
	        }
	    }).open();
	}
</script>
<script type="text/javascript">

var ORD_MST_CD = "${ORD_MST_CD}";
var ORD_NAME = "${sessionUser.MEM_MST_MEM_NM}";
var ORD_EMAIL_ID = "${fn:substringBefore(sessionUser.MEM_MST_MAIL, '@')}";
var ORD_EMAIL_DOMAIN = "${fn:substringAfter(sessionUser.MEM_MST_MAIL, '@')}";

<%-- 재주문인 경우 마일리지 재계산 필요
<c:if test="${not empty cartlist[0].ORD_TMP_PRE_CD}">
	<c:if test="${not empty PRE_USED_MLG && PRE_USED_MLG gt 0}">
		mileageDiscountAjax("${PRE_USED_MLG}");
	</c:if>
</c:if>
 --%>
 
// 주문 실행
function paymentPrepare(){
	

	var $targetElem = $($('.delivery li.on a').attr('href')); 

	var ordDlvMsg = "";
	var slcDlvMsg = $targetElem.find('.message_sel option:selected').val();
	
	if("" == slcDlvMsg){
		ordDlvMsg += $targetElem.find('.message_field').val();
	}else{
		ordDlvMsg += $targetElem.find('.message_sel option:selected').text();
	}
	
	var aParams = {
        "ORD_MST_CD" : ORD_MST_CD,
        "ORD_MST_ORD_NM" : ORD_NAME,
        "EMAIL_ID":ORD_EMAIL_ID,
        "EMAIL_DOMAIN":ORD_EMAIL_DOMAIN,
        "ORD_DLV_TEL1":$targetElem.find('.addr_sel_tel1').val(),
        "ORD_DLV_TEL2":$targetElem.find('.addr_sel_tel2').val(),
        "ORD_DLV_TEL3":$targetElem.find('.addr_sel_tel3').val(),
       	"ORD_MST_HP1":$targetElem.find('.addr_sel_hp1').val(),
       	"ORD_MST_HP2":$targetElem.find('.addr_sel_hp2').val(),
       	"ORD_MST_HP3":$targetElem.find('.addr_sel_hp3').val(),
		"ORD_DLV_ZIP_CDE6":$targetElem.find('.postcode').val(),
        "ORD_DLV_JBN_ADR1":$targetElem.find('.jibun_addr').val(),
        "ORD_DLV_JBN_ADR2":'',
        "ORD_DLV_ZIP_CDE5":$targetElem.find('.postcode').val(),
        "ORD_DLV_DRO_ADR1":$targetElem.find('.road_addr').val(),
        "ORD_DLV_DRO_ADR2":$targetElem.find('.etc_addr').val(),
    	"ORD_DLV_NM": $targetElem.find('.addr_sel_nm').val(),
    	"ORD_DLV_MSG":ordDlvMsg,
    	"ORD_MST_PCK_YN":$('#packing').is(':checked') ? "Y" : "N"
	}
	
	if(aParams.ORD_DLV_ZIP_CDE5.length <= 0 ||
			(aParams.ORD_DLV_JBN_ADR1.length <= 0 && aParams.ORD_DLV_DRO_ADR1.length <= 0)
	) {
		alert('배송주소지를 입력하셔야 합니다.');
		return;
	}
	
	if(aParams.ORD_DLV_NM.length <= 0)
	{
		alert('받으시는 분을 입력하셔야 합니다.');
		return;
	}
	
	if($("input[name=all_agree]").is(":checked")){
		
	}else{
		alert('필수 약관에 동의하셔야 합니다.');
		return false;
	}	

	aParams.ORD_DLV_MSG = $.trim(aParams.ORD_DLV_MSG);
	if(aParams.ORD_MST_ORD_NM.length <= 0) aParams.ORD_MST_ORD_NM = aParams.ORD_DLV_NM;

	$.ajax
    ({
        async : false,
        type : "POST",
        data : aParams,
        url : "<c:out value="${serverDomain}" />/pc/cart/paymentPrepare.do",
        success : function (data) 
        { 
        	$('#LGD_PAYINFO').html(data.setValue);
        	launchCrossPlatform();
        },
        error : function (err)
        {
            alert("오류가 발생하였습니다.\n[" + err.status + "]");
            window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
        }
    });
	
}

//-- PG 관련, 끝
 	function delivePop(pageStatus, memDlvIdx){
		if(pageStatus == "N" && "${totalCount}" == 10){
			alert("배송지 등록은 10개까지 가능합니다.");
			return;
		}
		
		$("#myDelivePopup").load("<c:out value="${frontDomain}"/>/pc/mypage/myDelivePopup.do", {"MEM_DLV_IDX": memDlvIdx, "pageStatus": pageStatus})
		//window.open("<c:out value="${frontDomain}"/>/pc/mypage/myDelivePopup.do?MEM_DLV_IDX="+ memDlvIdx +'&pageStatus='+ pageStatus,"delivePopup","width=600,height=550,scrollbars=yes,target=_blank");
	};
$(function() {
	controlPaymentInfo();
	
	//무이자/일반할부 처음에 안보여준다.
	$("#freeInterestListLabel").next().next().hide();    
	$("#freeInterestListLabel").hide();
	$("#noFreeInterestListLabel").next().next().hide();   
	$("#noFreeInterestListLabel").hide();
	
	$(function(){
		//현금영수증 발급용도 변경시
		$(document).on("click", ".cashReceiptLabel", function(){
			$(".cashR").val("");
			$(".cashR").prop("disabled", true);
			
			//var $idx = $(this).val();
			var $idx = $(this).data("input_val");
			$("input:radio[name='cashReceipt']:radio[value="+$idx+"]").attr('checked', true); 
			if($idx == "3"){//개인소득공제
				$(".cashR"+$idx).prop("disabled", false);
				$(".private-cash-receipt").show();
				$(".company-cash-receipt").hide();
			}else if($idx == "4"){//사업자지출증빙
				$(".cashR"+$idx).prop("disabled", false);
				$(".private-cash-receipt").hide();
				$(".company-cash-receipt").show();
			}else{
				$(".private-cash-receipt").hide();
				$(".company-cash-receipt").hide();
			}
			
			com.sel_chg($("#cash_hp_"+"${c_cash_receipt_no }"), 'chg');
		});
	});
	
	// 무이자할부/일반할부 셀렉트 박스 선택시 라디오버튼 자동 체크
	$(document).on("click","#freeInterestList",function(){
		$("#monthly2").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
	});
	$(document).on("click","#noFreeInterestList",function(){
		$("#monthly3").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
	});
	
	// 일시불/무이자/일반할부 선택시 일반할부 추가설명 show/hide
	$(document).on("click",".epNointLabel",function(){
		if($(this).data("desc_yn") == "N"){
			//부분무이자 설명 remove
			$("#noFreeDesc").hide();
		}else{
			$("#noFreeDesc").show();
		}
	});
	
	// 결제인증결과
    payment_return = function(LGD_RESPCODE, LGD_RESPMSG, LGD_PAYKEY)
    {
        if (LGD_RESPCODE == "0000") 
        {
        	var $targetElem = $($('.delivery li.on a').attr('href')); 
        	
        	var ordDlvMsg = "";
        	var slcDlvMsg = $targetElem.find('.message_sel option:selected').val();
        	
        	if("" == slcDlvMsg){
        		ordDlvMsg += $targetElem.find('.message_field').val();
        	}else{
        		ordDlvMsg += $targetElem.find('.message_sel option:selected').text();
        	}
        	
        	var data = { 
       			"ORD_MST_CD" : ORD_MST_CD,
       	        "ORD_MST_ORD_NM" : ORD_NAME,
       	        "EMAIL_ID":ORD_EMAIL_ID,
       	        "EMAIL_DOMAIN":ORD_EMAIL_DOMAIN,
	        	"ORD_DLV_TEL1":$('.addr_sel_tel1', $targetElem).val(),
	            "ORD_DLV_TEL2":$('.addr_sel_tel2', $targetElem).val(),
	            "ORD_DLV_TEL3":$('.addr_sel_tel3', $targetElem).val(),
	           	"ORD_MST_HP1":$('.addr_sel_hp1', $targetElem).val(),
	           	"ORD_MST_HP2":$('.addr_sel_hp2', $targetElem).val(),
	           	"ORD_MST_HP3":$('.addr_sel_hp3', $targetElem).val(),
	    		"ORD_DLV_ZIP_CDE6":$('.postcode', $targetElem).val(),
	            "ORD_DLV_JBN_ADR1":$('.jibun_addr', $targetElem).val(),
	            "ORD_DLV_JBN_ADR2":'',
	            "ORD_DLV_ZIP_CDE5":$('.postcode', $targetElem).val(),
	            "ORD_DLV_DRO_ADR1":$('.road_addr', $targetElem).val(),
	            "ORD_DLV_DRO_ADR2":$('.etc_addr', $targetElem).val(),
	        	"ORD_DLV_NM": $('.addr_sel_nm', $targetElem).val(),
	        	"ORD_DLV_MSG":ordDlvMsg,
	        	"ORD_MST_PCK_YN":$('#packing').is(':checked') ? "Y" : "N"
        	}
        	for( var key in data ) {
        		$("#LGD_PAYINFO").append('<input type="hidden" name="'+key+'" value="'+data[key]+'"/>');
       		}
            document.getElementById("LGD_PAYKEY").value = LGD_PAYKEY;
            $("#LGD_PAYINFO").attr({"action":"<c:out value="${serverDomain}" />/pc/cart/payment.do", "method":"post", "target":"_self"}).submit();
            //document.getElementById('LGD_PAYINFO').submit();
       } 
       else 
       {
    	   alert(LGD_RESPMSG);
           closeIframe();
       }
    };
	
	// 결제수단별 안내 event 설정
	$(document).on("change",":radio[name='radioPayment']",function(){
		controlPaymentInfo();
	});
	
	// 현금영수증 신청/미신청
	$(document).on("change","input[name=cashreceiptUseYn]",function(){
		var cashreceiptUseYn = this.value;
		if(cashreceiptUseYn == "Y"){
			$("#cashreceiptTr").show();
			$("#cashreceiptTr input").prop("disabled",false);
		}else{
			$("#cashreceiptTr").hide();
			$("#cashreceiptTr input").prop("disabled",true);
		}
	});
	
	// [쿠폰] 전체 적용가능 쿠폰 선택시
	$(document).on("click",".dupCouponLabel",function(){
		var thisValue = $(this).data("input_val");
		$("input:radio[name=dupCoupon]:radio[value="+thisValue+"]").attr('checked', true); 
		$(".select_prd_cpn").each(function(){
			$(this).val(thisValue);
			com.sel_chg($(this), 'chg');
		});
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 상품 쿠폰 선택시
	$(document).on("click",".select_prd_cpn",function(){
		var $this = $(this);
		var isPass = true;
		/* $(".select_prd_cpn").each(function(){
			if($(this).val() != "" && $this.val() != ""){
				if($this.val() != $(this).val()){
					//기존 선택 쿠폰과 다른 경우에는 선택할 수 없다.
					isPass = false;
					return;
				}
			}
		});
		
		if(!isPass){
			alert("한 주문에는 하나의 쿠폰만 사용 가능합니다.");
			$this.val("");
			com.sel_chg($this, 'reset');
		} */
		
		//할인금액 계산
		calculateCoupon();
	});
	
	// [쿠폰] 배송비 쿠폰 선택시
	$(document).on("click",".select_dlv_cpn",function(){
		var $this = $(this);
		var isPass = true;
		
		var selectedCnt = 0;
		$(".select_dlv_cpn").each(function(){
			if($(this).val() != ""){
				selectedCnt++;
			}
			
			if(selectedCnt > 1){
				isPass = false;
				return;
			}
		});
		
		if(!isPass){
			alert("배송비 쿠폰은 주문당 하나만 사용 가능합니다.");
			$this.val("");
			com.sel_chg($this, 'reset');
		}
	});
	
	// [포인트] blur 시 금액 계산
	$(document).on("blur","#toUseMileage",function(){
		var toUseMileage = $("#toUseMileage").val() =="" ? 0 : parseInt($("#toUseMileage").val());
		mileageDiscountAjax(toUseMileage);
	});
	
	// [포인트] 모두사용 체크시
	$(document).on("change","#allMileageUseChk",function(){
		if($(this).is(":checked")){
			if("${SOLUBLE_MILEAGE}" > 0){
				var toUseMileage = 999999999;
				mileageDiscountAjax(toUseMileage);
			}else{
				$(this).prop("checked",false);
			}
		}else{
			var toUseMileage = 0;
			mileageDiscountAjax(toUseMileage);
		}
	});
	
	// [OK캐쉬백] blur 시 금액 계산
	$(document).on("blur","#toUseCashbag",function(){
		var toUseCashbag = $("#toUseCashbag").val() =="" ? 0 : parseInt($("#toUseCashbag").val());
		cashbagDiscountAjax(toUseCashbag);
	});
	
	// [OK캐쉬백] 모두사용 체크시
	$(document).on("change","#allCashbagUseChk",function(){
		if($(this).is(":checked")){
			var toUseCashbag = 999999999;
			cashbagDiscountAjax(toUseCashbag);
		}else{
			var toUseCashbag = 0;
			cashbagDiscountAjax(toUseCashbag);
		}
	});
	
	// 이메일 도메인 select box 변경 이벤트
    $(document).on("click", "#emailDomainSelectbox", function () {
        var $obj = $("#EMAIL_DOMAIN");
        if($(this).val() == "")
        {
            $obj.prop("readonly", false);
            $obj.val("");
        }
        else
        {
            $obj.prop("readonly", true);
            $obj.val($(this).val());
        }
    });
	
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}"><%-- 장기할부가 아닌 경우에만! --%>
	// 신용카드 변경시 할부 목록 가져오기
    $(document).on("click", "#EP_card_cd1", function () {
        var crd_inf_idx = $(this).find("option:selected").data("crd_inf_idx");
        
        $(".interestList").html("<option value=\"\">선택</option>");
        com.sel_chg($("#freeInterestList"), 'chg');
        com.sel_chg($("#noFreeInterestList"), 'chg');
        
        //일시불로 리셋
		$("#EP_noint1").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
		var freeCnt = 0;
		var noFreeCnt = 0;
		//부분무이자 설명 remove
		$("#noFreeDesc").remove();
        
        if(crd_inf_idx != undefined){
        	
        	//삼성카드인 경우 카드사 포인트 사용 여부 SHOW
        	var CRD_INF_CD_NO = $(this).find("option:selected").val();
        	if(CRD_INF_CD_NO == "031"){
        		$("#li_samsung_pnt").show();
        	}else{
        		$("#EP_point_useyn").prop("checked",true).parent().addClass("on");
            	$("#EP_point_useyn1").prop("checked",false).parent().removeClass("on");
        		$("#li_samsung_pnt").hide();
        	}
        	
        	$.ajax({
        		type:"post",
        		url : "<c:out value="${serverDomain}" />/pc/cart/getCardInstallmentListAjax.do",
        		data : {"CRD_INF_IDX": crd_inf_idx
        				, "cart_total": $("#CART_TOTAL").val()
        				},
        		dataType : "json",
        		async : false,
        		success : function(data){
        			var list = data.list;
        			if(list != null){
        				$.each(list, function(i, item){
        					var interestListId = "noFreeInterestList";
        					if(item.DIV_INF_GBN == "${Code.CARD_DIV_TYPE_FREE_INTEREST}"){//무이자인 경우
        						interestListId = "freeInterestList";
        						freeCnt++;
        					}else{
        						noFreeCnt++;
        					}
        					
        					var html = "<option value=\""+ item.DIV_INF_MNT +"\" data-desc=\""+ item.DIV_INF_NTC +"\">"+ item.DIV_INF_MNT +"개월</option>";
        					$("#"+interestListId).append(html);
        					com.sel_chg($("#"+interestListId), 'chg');
        				});
        			}
        		},
        		error : function(err){
        			alert("오류가 발생하였습니다.\n[" + err.status + "]");
        		}
        	});
        }
        
        //무이자/일반할부 없으면 삭제한다.
		if(freeCnt === 0){
			$("#freeInterestListLabel").next().next().hide();    
			$("#freeInterestListLabel").hide();
		}else{
			$("#freeInterestListLabel").next().next().show();
			$("#freeInterestListLabel").show();
		}
		
		if(noFreeCnt === 0){
			$("#noFreeInterestListLabel").next().next().hide();   
			$("#noFreeInterestListLabel").hide();
		}else{
			$("#noFreeInterestListLabel").next().next().show();
			$("#noFreeInterestListLabel").show();
		}
    });
	</c:if>
	
	// 일반할부 선택시 해당 상세 보여주기
	$(document).on("click" ,"#noFreeInterestList", function(){
		var descHtml = "";
		if($(this).val() != ""){
			var desc = $(this).find("option:selected").data("desc");
			if(desc != null){
				descHtml = "<p class=\"message notice-c dotum desc\" id=\"noFreeDesc\">"+ desc +"</p>";
			}
		}
		$("#noFreeDesc").remove();
		$("#divInterest").append(descHtml);
	});
	
	SessionStorage.getSessionStorage("<c:out value="${ORD_MST_CD}"/>","<c:out value="${StorageKey}"/>");//결제 임시저장 데이터 노출
});

//LG UPLUS iframe
function launchCrossPlatform(){
	lgdwin = openXpay(document.getElementById('LGD_PAYINFO'), '${CST_PLATFORM}', 'iframe', null, "", "");
}

//결제수단별 안내
function controlPaymentInfo(){
	var thisValue = "";
	$('.pay-way').hide();
	$("input[name=radioPayment]").each(function(){
		if($(this).attr("checked")){
			thisValue = $(this).val();
		}
	});
	$('.pay-way_'+thisValue).show();
}

// 상품상세 호출
function goProductView(prdCd){
	window.open("<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd="+prdCd, "_blank");
}

//결제수단 선택 disable 
function disableRadioPayment(){
	$(".radioPayment").prop("disabled", true);
	$(".radioPayment").prop("checked", false);
	$(".noPointDiv").hide();
	$(".pointDiv").show();
	//$('.pay-way').hide();
}

//결제수단 선택 enable
function enableRadioPayment(){
	if($("#radioPayment1").prop("disabled")){
		$(".radioPayment").prop("disabled", false);
		$("#radioPayment1").prop("checked", true);
		$(".noPointDiv").show();
		controlPaymentInfo();
	}
}

//쿠폰선택 초기화
function couponReset(){
	$("input:radio[name='dupCoupon']").removeAttr("checked");
	$("input[name=dupCoupon]").parent().removeClass("on");
	$(".select_prd_cpn").each(function(){
		$(this).val("");
		//com.sel_chg($(this), 'reset');
	});
	calculateCoupon();
	prdCpnDiscountAjax();
}

//쿠폰할인금액 계산
function calculateCoupon(){
	var cpn_tot_dc_amt = 0;
	$(".select_prd_cpn").each(function(){
		var thisValue = $(this).val();
		var prd_tmp_idx = $(this).data("prd_tmp_idx");
		if(thisValue == ""){
			$("#span_cpn_dc_price_"+prd_tmp_idx).html("0");
			$("#PRD_CPN_PRC_"+prd_tmp_idx).val(0);
		}else{
			var cpn_dc_price = $(this).find("option:selected").data("cpn_dc_price");
			$("#span_cpn_dc_price_"+prd_tmp_idx).html(setComma(cpn_dc_price));
			$("#PRD_CPN_PRC_"+prd_tmp_idx).val(cpn_dc_price);
			cpn_tot_dc_amt += parseInt(cpn_dc_price);
		}
	});
	//쿠폰총 할인금액
	$("#span_prd_cpn_tot_dc_amt").html(setComma(cpn_tot_dc_amt));
}

//캐쉬백 조회하기
function checkCashBagPoint(){
	var pnt = $("#CART_TOTAL").val();
	var cashbagCardNo = $("#cashbag1").val() + $("#cashbag2").val() + $("#cashbag3").val() + $("#cashbag4").val();
	var cashbagPw = $("#cashbagPw").val();
	$.ajax({
		type: "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/checkCashBagPointAjax.do",
		data : {
			EP_pnt_idno : cashbagCardNo
			, EP_pnt_pwd : cashbagPw
			, EP_order_no : ORD_MST_CD
			, ORD_MST_CD : ORD_MST_CD
			, EP_product_amt : pnt
			, EP_tot_amt : pnt
			, EP_pnt_amt : pnt
		},
		dataType : "json",
		async : false,
		success : function(data){
			var resultCd = data.PAY_MST_RESPCODE;
			var resultMsg = data.PAY_MST_RESPMSG;
			if(resultCd != "0000"){
				alert(resultMsg);
				$("#CASHBAG_PW").val("");//비밀번호 초기화
			}else{
				$("#CASHBAG_PW").val(cashbagPw);//캐쉬백 사용 위한 비밀번호 저장
			}
			$("#cashbagRemainPoint").val(data.cashbagRemainPoint);
			$("#span_cashbagRemainPoint").html(setComma(data.cashbagRemainPoint));
			$("#toUseCashbag").val(0);
		},
		error : function(error){
			alert("통신 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
		}
	});
	
	cashbagDiscountAjax(0);//사용 캐쉬백 포인트 초기화
}

//상품 쿠폰 사용시 금액 계산
function prdCpnDiscountAjax(){
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/prdCpnDiscountAjax.do",
		data : $("#LGD_PAYINFO").serialize(),
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "Y"){
				$("#span_prd_cpn_tot_dc_amt_real").html(setComma(data.prd_cpn_tot_dc_amt_real));//상품 쿠폰 총 할인금액
				$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
				$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
				
				if(data.prd_cpn_tot_dc_amt_real > 0){//쿠폰할인 선택 일 때 포인트 사용 못하도록
					$("#allMileageUseChk").prop("disabled",true);
					$("#toUseMileage").prop("disabled",true);
				}else{
					$("#allMileageUseChk").prop("disabled",false);
                    $("#toUseMileage").prop("disabled",false);
				}
				
				//적립예정 마일리지/캐쉬백 추가
				$("#span_saveMlg").html(setComma(data.saveMlg));
				$("#span_saveCashbag").html(setComma(data.saveCashbag));
				
				// 포인트/캐쉬백 초기화
				cashbagDiscountAjax(0);
				mileageDiscountAjax(0);
			}else{
				alert(data.resultMsg);
			}
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
	$("#div_prd_cpn").slideUp("400");
}

//배송비 쿠폰 사용시 금액 계산
function dlvCpnDiscountAjax(){
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/dlvCpnDiscountAjax.do",
		data : $("#LGD_PAYINFO").serialize(),
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "Y"){
				$("#span_dlv_cpn_tot_dc_amt_real").html(setComma(data.dlv_cpn_tot_dc_amt_real));//배송비 쿠폰 총 할인금액
				$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
				$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
				
				//적립예정 마일리지/캐쉬백 추가
				$("#span_saveMlg").html(setComma(data.saveMlg));
				$("#span_saveCashbag").html(setComma(data.saveCashbag));
				
				// 포인트/캐쉬백 초기화
				//cashbagDiscountAjax(0);
				//mileageDiscountAjax(0);
			}else{
				alert(data.resultMsg);
			}
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
	$("#div_dlv_cpn").slideUp("400");
}

//캐쉬백 사용시 금액 계산
function cashbagDiscountAjax(toUseCashbag){
	var cashbagRemainPoint = $("#cashbagRemainPoint").val();
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/cashbagDiscountAjax.do",
		data : {"toUseCashbag" : toUseCashbag, "cashbagRemainPoint" : cashbagRemainPoint, "ORD_MST_CD" : ORD_MST_CD},
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "N"){
				alert(data.resultMsg);
			}
			
			$("#toUseCashbag").val(data.toUseCashbag);//사용캐쉬백포인트
			$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
			$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
			
			//적립예정 마일리지/캐쉬백 추가
			$("#span_saveMlg").html(setComma(data.saveMlg));
			$("#span_saveCashbag").html(setComma(data.saveCashbag));
			
			//최종결제금액은 카드 할부 목록 가져올때 필요하므로 저장해둔다.
			$("#CART_TOTAL").val(data.cart_total);
			
			if(data.allCashbagUseYn == "Y"){
				$("#allCashbagUseChk").prop("checked", true);
			}else{
				$("#allCashbagUseChk").prop("checked", false);
			}
			
			//장기할부인 경우 월 청구금액 보여준다
			<c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
				var lng_div = parseInt("${cartlist[0].ORD_TMP_LNG_DIV}");
				$("#span_expected_lng_prc").html(setComma(parseInt(data.cart_total/lng_div)));
			</c:if>
			
			//카드 리셋
			cardListReset();
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}

// 포인트 사용시 금액 계산
function mileageDiscountAjax(toUseMileage){
	$.ajax({
		type : "post",
		url : "<c:out value="${serverDomain}" />/pc/cart/mileageDiscountAjax.do",
		data : {"toUseMileage" : toUseMileage, "ORD_MST_CD" : ORD_MST_CD},
		dataType : "json",
		async : false,
		success : function(data){
			if(data.isSuccessYn == "N"){
				alert(data.resultMsg);
			}
			
			$("#toUseMileage").val(data.toUseMileage);//사용포인트
			$(".span_cart_add_disc_prc").html(setComma(data.cart_add_disc_prc));//추가할인금액
			$("#span_cart_total").html(setComma(data.cart_total));//최종결제금액
			
			//적립예정 마일리지/캐쉬백 추가
			$("#span_saveMlg").html(setComma(data.saveMlg));
			$("#span_saveCashbag").html(setComma(data.saveCashbag));
			
			//최종결제금액은 카드 할부 목록 가져올때 필요하므로 저장해둔다.
			$("#CART_TOTAL").val(data.cart_total);
			
			if(data.allMileageUseYn == "Y"){
				$("#allMileageUseChk").prop("checked", true);
			}else{
				$("#allMileageUseChk").prop("checked", false);
			}
			
			//장기할부인 경우 월 청구금액 보여준다
			<c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
				var lng_div = parseInt("${cartlist[0].ORD_TMP_LNG_DIV}");
				$("#span_expected_lng_prc").html(setComma(parseInt(data.cart_total/lng_div)));
			</c:if>
			
			//카드 리셋
			cardListReset();
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
}

//추가배송비 계산
function getAddDlvCharge(){
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_SERVICE_CD and cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD }"><%-- 클린킹/장기할부는 추가배송비 없음 --%>
	$.ajax({
		type:"post",
		url : "<c:out value="${serverDomain}" />/pc/cart/addDlvChargeAjax.do",
		data : {"ORD_MST_CD" : ORD_MST_CD, "ORD_DLV_ZIP_CDE5" : $("#ORD_DLV_ZIP_CDE5").val(), "ORD_DLV_ZIP_CDE6_1" : $("#ORD_DLV_ZIP_CDE6_1").val()},
		dataType : "json",
		async : false,
		success : function(data){
			
			//적립예정 마일리지/캐쉬백 추가
			$("#span_saveMlg").html(setComma(data.saveMlg));
			$("#span_saveCashbag").html(setComma(data.saveCashbag));
			
			$.each(data, function(key, item){
				var $targetSpan = $("#span_"+key);
				
				if($targetSpan.length > 0){
					//console.log(key);
					//console.log(item);
					//console.log(document.getElementById("span_"+key));
					//document.getElementById("span_"+key).innerHTML = setComma(item);
					
					$targetSpan.html(setComma(item));
					
					//추가배송비 있는 경우에만 show
					if(key == "cart_add_delivery"){
						if(item != "0"){
							$("#li_cart_add_delivery").show();
						}else{
							$("#li_cart_add_delivery").hide();
						}
					}
				}
				
				//최종결제금액은 카드 할부 목록 가져올때 필요하므로 저장해둔다.
				if(key == "cart_total"){
					$("#CART_TOTAL").val(item);
				}
				
				//카드 리셋
				cardListReset();
			});
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
	</c:if>
}

//결제방법 선택시
function changePayWay(pay_idx){
	$("input:radio[name='radioPayment']").removeAttr("checked");
    $("input:radio[name='radioPayment']:radio[value="+pay_idx+"]").attr("checked",true)
	$("#radioPayment_"+pay_idx).trigger("change");
	$("#paymentBtn_"+pay_idx).siblings().removeClass("btn_blk777");
	$("#paymentBtn_"+pay_idx).siblings().addClass("btn_white");
	$("#paymentBtn_"+pay_idx).removeClass("btn_white");
	$("#paymentBtn_"+pay_idx).addClass("btn_blk777");
}

//카드사 리셋(금액에 따라 할부 가능 개월수가 달라지기 때문에 결제금액 변동시마다 호출한다.)
function cardListReset(){
	//카드종류 리셋
	$("#EP_card_cd1").val("");
	com.sel_chg($("#EP_card_cd1"), 'reset');
	
	<%-- 장기할부 아닌 경우 --%>
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
		//일시불로 리셋
		$("#EP_noint1").prop("checked",true).parent().addClass("on").siblings().removeClass("on");
		//무이자할부/일반할부 목록 리셋
		$(".interestList").html("<option value=\"\">선택</option>");
	    com.sel_chg($("#freeInterestList"), 'reset');
	    com.sel_chg($("#noFreeInterestList"), 'reset');
    </c:if>
    
    <%-- 장기할부인 경우 --%>
    <c:if test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_LONG_INS_CD}">
   	 	//장기할부인 경우 카드 목록 가져오기
   	 	$.ajax({
			type:"post",
			url : "<c:out value="${serverDomain}" />/pc/cart/getCardListAjax.do",
			data : {"ORD_TMP_LNG_DIV" : "${cartlist[0].ORD_TMP_LNG_DIV}", "cart_total" : $("#CART_TOTAL").val()},
			dataType : "json",
			async : false,
			success : function(data){
				$("#EP_card_cd1").html("<option value=\"\">선택</option>");
		        com.sel_chg($("#EP_card_cd1"), 'reset');
		        
				if(data.result > 0){
					$.each(data.cardList, function(key, item){
						var htmlStr = "";
						htmlStr += "<option value=\""+ item.CRD_INF_CD_NO +"\" ";
						htmlStr += "data-req_type=\""+ item.CRD_INF_PAY +"\" ";
						htmlStr += "data-crd_inf_idx=\""+ item.CRD_INF_IDX +"\" >";
						htmlStr += item.CRD_INF_NM;
						htmlStr += "</option>";
						
						$("#EP_card_cd1").append(htmlStr);
						com.sel_chg($("#EP_card_cd1"), 'chg');
					});
				}else{
					alert(data.resultMsg);
				}
			},
			error : function(err){
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});
    </c:if>
}

function execDaumPostcodeMyDelivery() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('MEM_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('MEM_DLV_DRO_ADR1').value = fullRoadAddr;
            document.getElementById('MEM_DLV_JBN_ADR1').value = data.jibunAddress;
			
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            /*
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = ;
                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')

            } else {
                document.getElementById('guide').innerHTML = '';
            }
            */
        }
    }).open();
}
</script>
<script type="text/javascript">
	$(function(){
		function payment_scroll(){
			var tg = $(".final_area");
			var hH = $('#header').outerHeight() + $('.location').outerHeight();
			var xg = tg.offset().top - hH;
			var paymentTop = $('.payment_info_wp').offset().top;
			var paymentTop2 = paymentTop - hH;

			$(window).scroll(function(){
                   var dH = $(document).height() - (tg.outerHeight() * 1.8);
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop - paymentTop + hH - 143 + "px";
				if (scrollTop > paymentTop2) {
					if(scrollTop <  dH){
						$(".final_area").stop().animate({
							"top" : newPosition
						}, 0);
					}
				}else{
					tg.css({"top" : 0});
				}
			})
		}payment_scroll();

		// 배송비결제 타입별
		$('.payment_way_change input').on('click',function(){
			var idx = $(this).index();
			if(!(idx == 0)){
				idx = idx/2;
			}
			$('.payment_type .pbx.p'+idx).show().siblings().hide();

			// 현금영수증 선택 해제
			$('input[name="cash_receipt"]').removeAttr('checked','checked');
			$('.cash_receipt_view').hide().find('.cbx').hide();
		})

		// 현금영수증
		$('.cash_receipt_rdo input').on('click',function(){
			var idx = $(this).index();
			if(!(idx == 0)){
				idx = idx/2;
			}
			var c_view = $(this).parents('li').find('.cash_receipt_view');
			c_view.show();
			c_view.find('.cbx').eq(idx).show().siblings().hide();
		})

		// 현금영수증 휴대폰번호/사업자번호/카드번호
		$('.cash_receipt .select:first-child select').on('change',function(){
			var val = $(this).val();
			var cash_receipt = $(this).parents('.cash_receipt');

			cash_receipt.find('.receipt_type').eq(val - 1).addClass('on').siblings('.receipt_type').removeClass('on')
		})
	})
	
	
	
	/******************** GIFT CHOOSE PROCESS ************************/
	
	var GIFT_TR_HTML = '';
	GIFT_TR_HTML += '<tr>';
	GIFT_TR_HTML += '	<td class="pro_chk pl20">';
	GIFT_TR_HTML += '		<div class="product_info clearboth">';
	GIFT_TR_HTML += '			<div class="img">';
	GIFT_TR_HTML += '				<a href="#" class="product_thumb">';
	GIFT_TR_HTML += '					<img src="{image}" alt="제품 이미지">';
	GIFT_TR_HTML += '				</a>';
	GIFT_TR_HTML += '			</div>';
	GIFT_TR_HTML += '			<div class="txt">';
	GIFT_TR_HTML += '				<span class="brand">{brand}</span>';
	GIFT_TR_HTML += '				<a href="#" class="item_name">{name}</a>';
	GIFT_TR_HTML += '				<span class="item_info dot">{info}</span>';
	GIFT_TR_HTML += '			</div>';
	GIFT_TR_HTML += '		</div>';
	GIFT_TR_HTML += '	</td>';
	GIFT_TR_HTML += '</tr>';
									
	$('input:radio[name="gifts"]').change(function(){
		var selGiftVal = $("input[name='gifts']:checked").val();
		var $selRowElem = $("input[name='gifts']:checked").closest('tr');
		
		var curImage = $('.data-image', $selRowElem).attr('src');
		var curBrand = $('.data-brand', $selRowElem).text();
		var curName = $('.data-name', $selRowElem).text();
		var curInfo = $('.data-info', $selRowElem).text();
		
		var curHTML = GIFT_TR_HTML.replace('{image}', curImage)
					.replace('{brand}', curBrand)
					.replace('{name}', curName)
					.replace('{info}', curInfo);
		
		
		$('#gift_choose_wrapper').empty();
		$('#gift_choose_wrapper').append(curHTML);
		
	});
	
	$('.message_sel').on('change', function(){		
		var $curWrapperElem = $(this).closest('.message_wrapper');
		
		var curVal = $('.message_sel option:selected', $curWrapperElem).val();
		
		if(curVal.length <= 0) {
			$('.message_field',$curWrapperElem).val('');
			$('.message_field',$curWrapperElem).prop('disabled', false);
		} else {
			$('.message_field',$curWrapperElem).prop('disabled', true);
		}
	});
	
	$('.address_info').on('click', function(){
		var $targetElem = $(this).closest('.address_info_wrapper');
		execDaumPostcode($targetElem);
	});
	
	/* $('#all_agree').on('change', function(){
		$('input[name="agree"]').prop('checked', $(this).is(":checked"));
	}); */
	
	
	/* $('#payment_submit').on('click', function(){
		var allChecked = true;
		$('input[name=all_agree]').each(function(){
			if($(this).data('required') && !$(this).is(":checked")) allChecked = false;
		});
		
		if(!allChecked) {
			alert('필수 약관에 동의하셔야 합니다.');
		} else {
			paymentPrepare();
		}
	}); */
	
	$("#payment_submit").on("click", function () {
		if(!paymentPrepare()){
			return; 	
		}
	});	
	
	
	
	/////////  ADDRESS SELECTION EVENT HANDLER /////////////
	$('.addr_sel_btn').on('click', function(){
		var $targetWrapper = $(this).closest('.addr_sel_wrapper');
		
		var $chooseElem = $('input:radio[name=my_addr_list]:checked', $targetWrapper);
		//console.log($chooseElem);
		
		if($chooseElem.length <= 0) {
			alert('주소를 선택하셔야 합니다.');
			return;
		}
		$chooseElem = $chooseElem.closest('tr');
		
		console.log($('.addr_tmp_name', $chooseElem).text());
		
		$('.addr_sel_nm', $targetWrapper).val($('.addr_tmp_name', $chooseElem).text());
		$('.addr_sel_hp1', $targetWrapper).val($('.addr_tmp_h1', $chooseElem).text());
		$('.addr_sel_hp2', $targetWrapper).val($('.addr_tmp_h2', $chooseElem).text());
		$('.addr_sel_hp3', $targetWrapper).val($('.addr_tmp_h3', $chooseElem).text());
		
		$('.postcode', $targetWrapper).val($('.addr_tmp_postcode', $chooseElem).text());
		$('.road_addr', $targetWrapper).val($('.addr_tmp_road1', $chooseElem).text());
		$('.jibun_addr', $targetWrapper).val($('.addr_tmp_jibun1', $chooseElem).text() + ' ' + $('.addr_tmp_jibun2', $chooseElem).text());
		$('.etc_addr', $targetWrapper).val($('.addr_tmp_road2', $chooseElem).text());
	});
	
	$('#addDelivery').on('click', function(){
		delivePop('N', '');
	});
	
	$(document).on("click","#zipCheck",execDaumPostcodeMyDelivery);
</script>