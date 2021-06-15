<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">배송지 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
				<div class="table_wrap mb95">
					<div class="top_btn clearboth">
						<a href="javascript:addDefaultDelivery()" class="btn_inq white fl">기본 배송지로 설정</a>
						<a href="javascript:delivePop('N', '')"  class="btn_inq">배송지 등록</a>
					</div>
					<table class="tb_col">
						<caption>배송지 관리 : 배송지명, 받는 사람, 주소, 연락처, 수정/삭제 출력 표입니다.</caption>
						<colgroup>
							<col style="width:80px;">
							<col style="width:13%;">
							<col style="width:13%;">
							<col>
							<col style="width:16%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">배송지명</th>
								<th scope="col">받는 사람</th>
								<th scope="col">주소</th>
								<th scope="col">연락처</th>
								<th scope="col">수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list }">
									<c:forEach var="deliveRow" items="${list }" varStatus="i">
										<tr>
											<td>
												<input type="radio" id="rdo${i.count }" name="MEM_DLV_BSC_YN" value="${deliveRow.MEM_DLV_IDX }" <c:if test="${deliveRow.MEM_DLV_BSC_YN eq 'Y' }">checked="checked"</c:if>>
												<label for="rdo${i.count }" class="only"><span class="icon"></span><span class="blind">선택</span></label>
											</td>
											<td id="defaultDeliveryContainner_rdo${i.count }">
												<c:if test="${deliveRow.MEM_DLV_BSC_YN eq 'Y' }">
													<span id="defaultDelivery" class="block base_shipping">[기본 배송지]</span>
												</c:if>
												<span class="block target_place"><c:out value="${deliveRow.MEM_DLV_NM }"/></span>
											</td>
											<td><c:out value="${deliveRow.MEM_DLV_RCV_NM }"/></td>
											<td class="left">
												<span class="block zipcode"><c:out value="${deliveRow.MEM_DLV_ZIP_CDE5 } (${deliveRow.MEM_DLV_ZIP_CDE5 })"/></span>
												<span class="block land_lot_based"><c:out value="${deliveRow.MEM_DLV_DRO_ADR1 } ${deliveRow.MEM_DLV_DRO_ADR2 }"/></span>
												<span class="block road_name"><c:out value="${deliveRow.MEM_DLV_JBN_ADR1 } ${deliveRow.MEM_DLV_JBN_ADR2 }"/></span>
											</td>
											<td>
												<span class="block cel_num"><c:out value="${deliveRow.MEM_DLV_HP1 }-${deliveRow.MEM_DLV_HP2 }-${deliveRow.MEM_DLV_HP3 }"/></span>
												<span class="block tel_num" id="tel_num"><c:out value="${deliveRow.MEM_DLV_TEL1 }-${deliveRow.MEM_DLV_TEL2 }-${deliveRow.MEM_DLV_TEL3 }"/></span>
											</td>
											<td>
												<div class="btn_box">
												<button onclick="delivePop('M', '${deliveRow.MEM_DLV_IDX }')" type="button" class="btn_modify">수정</button>
												<button onclick="removeDeliv('${deliveRow.MEM_DLV_IDX }')"type="button" class="btn_delete">삭제</button>
											</div>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="no_data">
										<td colspan="6">
											<div class="box">
												<span class="txt">등록된 배송지가 없습니다.</span>
											</div>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<!-- <tr>
								<td>
									<input type="radio" id="rdo1" name="MEM_DLV_BSC_YN" value="Y">
									<label for="rdo1" class="only"><span class="icon"></span><span class="blind">선택</span></label>
								</td>
								<td id="defaultDeliveryContainner_rdo1">
									<span id="defaultDelivery" class="block base_shipping">[기본 배송지]</span>
									<span class="block target_place">사무실</span>
								</td>
								<td>홍길동</td>
								<td class="left">
									<span class="block zipcode">05043 (143-826)</span>
									<span class="block land_lot_based">서울 광진구 구의동 252-11 4444</span>
									<span class="block road_name">서울 광진구 아차산로 49길 41-7 4444</span>
								</td>
								<td>
									<span class="block cel_num">010-1234-56786</span>
									<span class="block tel_num">02-555-5555</span>
								</td>
								<td>
									<div class="btn_box">
									<button type="button" class="btn_modify">수정</button>
									<button type="button" class="btn_delete">삭제</button>
								</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="radio" id="rdo2" name="MEM_DLV_BSC_YN" value="Y">
									<label for="rdo2" class="only"><span class="icon"></span><span class="blind">선택</span></label>
								</td>
								<td id="defaultDeliveryContainner_rdo2">
									<span class="block base_shipping">[기본 배송지]</span>
									<span class="block target_place">사무실</span>
								</td>
								<td>홍길동</td>
								<td class="left">
									<span class="block zipcode">05043 (143-826)</span>
									<span class="block land_lot_based">서울 광진구 구의동 252-11 4444</span>
									<span class="block road_name">서울 광진구 아차산로 49길 41-7 4444</span>
								</td>
								<td>
									<span class="block cel_num">010-1234-56786</span>
									<span class="block tel_num">02-555-5555</span>
								</td>
								<td>
									<div class="btn_box">
									<button type="button" class="btn_modify">수정</button>
									<button type="button" class="btn_delete">삭제</button>
								</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="radio" id="rdo3" name="MEM_DLV_BSC_YN" value="Y">
									<label for="rdo3" class="only"><span class="icon"></span><span class="blind">선택</span></label>
								</td>
								<td id="defaultDeliveryContainner_rdo3">
									<span class="block base_shipping">[기본 배송지]</span>
									<span class="block target_place">사무실</span>
								</td>
								<td>홍길동</td>
								<td class="left">
									<span class="block zipcode">05043 (143-826)</span>
									<span class="block land_lot_based">서울 광진구 구의동 252-11 4444</span>
									<span class="block road_name">서울 광진구 아차산로 49길 41-7 4444</span>
								</td>
								<td>
									<span class="block cel_num">010-1234-56786</span>
									<span class="block tel_num">02-555-5555</span>
								</td>
								<td>
									<div class="btn_box">
									<button type="button" class="btn_modify">수정</button>
									<button type="button" class="btn_delete">삭제</button>
								</div>
								</td>
							</tr> -->
						</tbody>
					</table>
				</div>

				<div class="attention_list_wrap">
					<ul>
						<li>자주 사용하시는 배송지를 등록해 두시면 더욱 더 편리하게 이용하실 수 있습니다.</li>
						<li>배송 주소록에는 최대 10개 까지 주소등록이 가능합니다.</li>
					</ul>
				</div>

			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
	<div id="myDelivePopup">
	</div>
	

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<form id="frm" name="frm">
	<input type="hidden" id="MEM_DLV_IDX" name="MEM_DLV_IDX" value="">
	<input type="hidden" id="chkMemDlvIdx" name="chkMemDlvIdx" value="">
</form>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
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
<script>
$(function(){
	
	// 기본 배송지로 설정 체크
	addDefaultDelivery = function(){
		var inputSelectDelivery = $("input[name='MEM_DLV_BSC_YN']:checked");
		if(inputSelectDelivery.length == 0){
			alert("배송지를 선택해 주세요");
			return;
		}
		$("#defaultDelivery").remove();
		addDeliveryUi(inputSelectDelivery.attr("id"), inputSelectDelivery.attr("value"));
		
	}
	
	// 기본배송지로 추가 UI
	addDeliveryUi = function(id, idx){
		//$("#defaultDeliveryContainner_"+id).children().before("<span id=\"defaultDelivery\" class=\"block base_shipping\">[기본 배송지]</span>");
		$("#chkMemDlvIdx").val(idx);
		$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myDeliveBaseAddrProc.do", "target":"_self", "method":"post"}).submit();
	}
	
	// 배송지 추가/수정 팝업
	delivePop = function(pageStatus, memDlvIdx){
		if(pageStatus == "N" && "${totalCount}" == 10){
			alert("배송지 등록은 10개까지 가능합니다.");
			return;
		}
		
		$("#myDelivePopup").load("<c:out value="${frontDomain}"/>/pc/mypage/myDelivePopup.do", {"MEM_DLV_IDX": memDlvIdx, "pageStatus": pageStatus})
		//window.open("<c:out value="${frontDomain}"/>/pc/mypage/myDelivePopup.do?MEM_DLV_IDX="+ memDlvIdx +'&pageStatus='+ pageStatus,"delivePopup","width=600,height=550,scrollbars=yes,target=_blank");
	};
	
	// 배송지 삭제
	removeDeliv = function(memDlvIdx){
		if(confirm("삭제하시겠습니까?")){
			$("#MEM_DLV_IDX").val(memDlvIdx);
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myDeliveRemove.do", "target":"_self", "method":"post"}).submit();
		}
	};

    $(document).on("click","#zipCheck",execDaumPostcode);
    
})
</script>
<script>

</script>