<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<!-- 자동 수거 : S -->
				<div class="con_sstit_wrap mb10 autoDelivery" style="display:none;">
					<h4 class="con_sstit">반품 수거지</h4>
					<div class="top_btn">
						<a href="javascript:void(0)" class="btn order view address_info2">수거지 정보 변경</a>
					</div>
				</div>
				<div class="table_wrap mb50">
					<table class="tb_row tb_small autoDelivery" style="display:none;">
						<caption>반품 수거지 : 받으시는 분, 휴대폰, 전화번호, 주소, 배송 유의사항 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:30%">
							<col style="width:20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">받으시는 분</th>
								<td colspan="3"><input type="text" name="P_ORD_DLV_NM" value="${orderDeliveryInfo.ORD_DLV_NM}" placeholder="수령인 입력" style="width:150px;"></td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td>
									<input type="text" name="P_ORD_DLV_HP1" value="${orderDeliveryInfo.ORD_DLV_HP1}" maxlength=3 style="width:80px;"> -
		                        	<input type="text" name="P_ORD_DLV_HP2" value="${orderDeliveryInfo.ORD_DLV_HP2}" maxlength=4 style="width:80px;"> -
		                        	<input type="text" name="P_ORD_DLV_HP3" value="${orderDeliveryInfo.ORD_DLV_HP3}" maxlength=4 style="width:80px;">
							
								</td>
								<th scope="row">전화번호</th>
								<td>
									<input type="text" name="P_ORD_DLV_TEL1" value="${orderDeliveryInfo.ORD_DLV_TEL1}" maxlength=3 style="width:80px;"> -
		                        	<input type="text" name="P_ORD_DLV_TEL2" value="${orderDeliveryInfo.ORD_DLV_TEL2}" maxlength=4 style="width:80px;"> -
		                        	<input type="text" name="P_ORD_DLV_TEL3" value="${orderDeliveryInfo.ORD_DLV_TEL3}" maxlength=4 style="width:80px;">
							
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="3" class="address_info_wrapper2">
									<span class="block">
									<input type="text" name="P_ORD_DLV_ZIP_CDE5" value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5}" placeholder="우편번호 입력" class="postcode2" style="width:150px;">
									</span>
									<span class="block">
									<input type="text" name="P_ORD_DLV_DRO_ADR1" value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1}" placeholder="도로명 주소 입력" class="road_addr2" style="width:600px;">
									</span>
									<span class="block">
									<input type="text" name="P_ORD_DLV_JBN_ADR1" value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1}" placeholder="지번 입력" class="jibun_addr2" style="width:600px;">
									</span>
									<span class="block">
									<input type="text" name="P_ORD_DLV_DRO_ADR2" value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2}" placeholder="이하 입력" class="etc_addr2" style="width:600px;">
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">배송 유의사항</th>
								<td colspan="3">
									<input type="text" name="P_ORD_DLV_MSG" value="${orderDeliveryInfo.ORD_DLV_MSG}" placeholder="배송메모 입력" style="width:600px;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //자동 수거 : E -->
				<!-- 직접 발송 : S -->
				<div class="con_sstit_wrap mb10">
					<h4 class="con_sstit deliveryTit" style="display:none;">반품지 정보</h4>
				</div>
				<div class="table_wrap mb50">
					<table class="tb_row tb_small deliveryTbl" style="margin-bottom: 0; display:none;">
						<caption>반품지 정보 : 판매자 정보, 택배사, 송장번호 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:30%">
							<col style="width:20%">
							<col>
						</colgroup>
						<tbody>
							<tr class="selfDelivery">
								<th scope="row">판매자 정보</th>
								<td colspan="3">신원 / 서울 마포구 독막로 328(도화동) / 1661-2585 </td>
							</tr>
							<tr>
								<th scope="row">택배사</th>
								<td>
									<span class="select">
										<select id="" class="w284" title="택배사" name="ORD_PKU_DLV_CPN_IDX">
											<option selected="selected" value="">택배사 선택</option>
											<c:forEach var="data" items="${dlvCpnList}">
												<option value="<c:out value="${data.DLV_CPN_IDX }" />"><c:out value="${data.DLV_CPN_NM }" /></option>
											</c:forEach>
										</select>
									</span>
								</td>
								<th scope="row">송장번호</th>
								<td><input type="text" name="ORD_PRD_PKU_IVC_NO" title="송장번호"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //직접 발송 : E -->
				<script type="text/javascript">
					$(function() {
						// 교환/반품 방법 선택 이벤트
						$(document).on("click", "input[name=changeProduct]", function () {
							// 반품 수거 방법 구분(A:자동수거, B:직접발송, C:이미 발송)
					        $('#DLV_PAY_WAY').val($(this).val());
							
					        if($(this).val() == "A"){
					           $(".deliveryTbl").hide();
					           $(".deliveryTit").hide();
					           $(".autoDelivery").show();
					       }else if($(this).val() == "B"){
					           $(".deliveryTbl").show();
					           $(".deliveryTit").show();
					           $(".selfDelivery").show();
					           $(".autoDelivery").hide();
					           $(".deliveryTit").text('반품지 정보');
					        }
					        else{
					            $(".deliveryTbl").show();
					            $(".deliveryTit").show();
					            $(".autoDelivery").hide();
					            $(".selfDelivery").hide();
					            $(".deliveryTit").text('발송정보');
					        }
					     });
					})
				
				</script>