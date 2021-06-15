<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<script type="text/javascript" src="/nas/cdn/pc/js/common.js"></script>
	
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">취소 신청</h2>
			</div>
			<!--// Title -->

			 <div class="sub_content">
<%-- 
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/mypageTopMemu.jsp"%> --%>
				
				  <%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="table_wrap mb95">
					<table class="tb_row">
						<caption>주문/배송 상세조회 : 주문번호, 주문일 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%;">
							<col>
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td><c:out value="${orderCancelInfo.ORD_MST_CD }" /></td>
								<th scope="row">주문일</th>
								<td><ui:formatDate value="${orderCancelInfo.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd"/></td>
								
							</tr>
						</tbody>
					</table>
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">주문상품 정보</h3>
					<div class="top_btn">
					</div>
				</div>
				<!-- S:배송상품 일때 -->
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>주문상품 정보 : 상품정보, 상품금액, 배송비, 판매자명, 진행상태 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:10%;">
							<col style="width:16%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">상품금액</th>
								<th scope="col">배송비</th>
								<th scope="col">판매자명</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${orderProductList }" varStatus="i">
								<tr>
									<td class="pro_chk">
										<div class="chkbx">
											<%-- <c:set var="basic_chk" value="" /> --%>
											<%-- <c:if test="${commandMap.ORD_PRD_IDX eq row.ORD_PRD_IDX}"><c:set var="basic_chk" value="checked" /></c:if> --%>
											<input type="checkbox" id="pro-${i.index + 1 }" name="pro_chk" ${basic_chk } value = "${row.ORD_PRD_IDX }">
											
											<label for="pro-${i.index + 1}"><span class="icon"></span><span class="blind">선택</span></label>
										</div>
										<div class="product_info clearboth">
											<div class="img">
												<a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');" class="product_thumb">
													<img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" alt="${row.PRD_IMAGE_ALT}">
												</a>
											</div>
											<div class="txt">
												<span class="brand">[신원] ${row.VDR_MST_NM }</span>
												<a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');" class="item_name"><c:out value="${row.PRD_MST_NM}" /></a>
												<span class="item_info">${row.ORD_PRD_COLOR } / ${row.ORD_PRD_SIZE } / ${row.ORD_PRD_ORD_CNT }개</span>
											</div>
										</div>
									</td>
									<td>
										<c:set var="o_price" value="${row.ORD_PRD_PRD_PRC * row.ORD_PRD_ORD_CNT + row.SUM_SUB_OPTION_ADD_PRC}"/>
										<c:set var="d_price" value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}"/>
										<c:if test="${o_price != d_price}">
											<span class="r_price"><fmt:formatNumber value="${o_price}" type="number" />원</span>
										</c:if>
										<span class="s_price"><fmt:formatNumber value="${d_price}" type="number" />원</span>
									</td>
									<td>
										<c:if test="${not empty row.ORD_MST_PAY_PRC or 0 < row.ORD_MST_PAY_PRC }">
											<c:out value="${row.ORD_MST_PAY_PRC }" />
										</c:if>
										<c:if test="${empty row.ORD_MST_PAY_PRC or 0 == row.ORD_MST_PAY_PRC }">무료배송
										</c:if>
									</td>
									<td>신원</td>
									<td>
										<span class="order_state"><c:out value="${row.ORD_PRD_ORD_STATE_NM }" /></span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--//E:배송상품 일때 -->

				<div class="con_tit_wrap mt95">
					<h3 class="con_tit">사은품 정보</h3>
				</div>
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>사은품 정보 출력 표입니다.</caption>
						<colgroup>
							<col style="width:100%;">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<div class="product_info clearboth">
										<div class="img">
											<a href="#" class="product_thumb">
												<img src="../../images/@temp/img_temp_product_thumb.jpg" alt="제품 이미지">
											</a>
										</div>
										<div class="txt">
											<span class="brand">[신원] VIKI</span>
											<a href="#" class="item_name">플리츠 배색 니트 스커트(TYSCI297)</a>
											<span class="item_info">블랙 / 85 / 1개</span>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<form id="applFrm" name="applFrm">
					<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
	        		<input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="${commandMap.ORD_PRD_ORD_STATE }" />
	        		<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }" />
	        		<input type="hidden" id="ORD_PRD_IDXs" name="ORD_PRD_IDXs" value="" />
	        		<input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value="" />
	        		
					<div class="con_tit_wrap">
						<h3 class="con_tit">취소사유</h3>
					</div>
					<div class="table_wrap mb95">
						<table class="tb_row">
							<caption>취소사유 : 사유, 상세사유 출력 표입니다.</caption>
							<colgroup>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span class="required"><em class="blind">필수 정보</em></span>사유</th>
									<td>
										<span class="select">
											<select id="SELECT_REASON" name="SELECT_REASON" class="w310" title="사유">
												<option selected="selected" value="">취소 사유 선택</option>
												<%-- <c:if test="${not empty codes.ORDER_CANCEL_RETURN_REASON }">
													<c:forEach var="row" items="${codes.ORDER_CANCEL_RETURN_REASON }"> --%>
													<!-- 2020.06.15 취소관련 code 값으로 수정  -->
													<c:if test="${not empty codes.ORDER_CANCEL_REASON }">
													<c:forEach var="row" items="${codes.ORDER_CANCEL_REASON }">
														<option value="<c:out value="${row.CMN_COM_IDX }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
													</c:forEach>
												</c:if>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row">상세사유</th>
									<td>
										<textarea id="ORD_PRD_DSC" name="ORD_PRD_DSC" onkeyup="getStrByte(this,'#byte', 200, 2);" class="text_area h140" placeholder="200자 이내로 입력하세요."></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
	
				<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' and (orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW)}">
						<div class="con_tit_wrap">
							<h3 class="con_tit">환불 정보</h3>
						</div>
						<div class="table_wrap payment mb95">
							<table class="tb_col">
								<caption>환불 정보 : 취소 주문금액, 차감금액, 환불금액, 환불포인트 출력 표입니다.</caption>
								<colgroup>
									<col style="width:290px;">
									<col style="width:290px;">
									<col style="width:310px;">
									<col style="width:*;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<p class="tit">취소 주문금액</p>											
											<p class="price"><strong><fmt:formatNumber value="${orderCancelInfo.ORD_PRD_ORD_PRC }" type="number"/></strong> 원</p>
										</th>
										<th scope="col">
											<span class="minus">-</span>
											<p class="tit">차감금액</p>
											<p class="price"><strong>22,500</strong> 원</p>
										</th>
										<th scope="col" class="total">
											<span class="equal">=</span>
											<p class="tit">환불금액</p>
											<p class="price"><strong>63,000</strong> 원</p>
										</th>
										<th scope="col" class="total">
											<span class="plus">+</span>
											<p class="tit">환불포인트</p>
											<p class="price"><strong>17,000</strong> p</p>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<ul class="pay_detail">
												<li><span class="tit">취소 상품금액</span><span class="price">97,500 원</span></li>
												<li><span class="tit">취소 배송비</span><span class="price">2,500 원</span></li>
												<li><span class="tit">취소 도서산간 배송비</span><span class="price">2,500 원</span></li>
											</ul>
										</td>
										<td>
											<ul class="pay_detail">
												<li><span class="tit">즉시할인</span><span class="price">13,000 원</span></li>
												<li><span class="tit">제휴사할인</span><span class="price">2,500 원</span></li>
												<li><span class="tit">상품할인쿠폰</span><span class="price">2,500 원</span></li>
												<li><span class="tit">배송비쿠폰</span><span class="price">2,500 원</span></li>
												<li><span class="tit">프로모션 할인</span><span class="price">2,000 원</span></li>
											</ul>
										</td>
										<td>
											<ul class="pay_detail">
												<li><span class="tit">신용카드</span><span class="price">2,000 원</span></li>
											</ul>
										</td>
										<td>
											<ul class="pay_detail">
												<li><span class="tit">통합포인트</span><span class="price">2,000 p</span></li>
												<li><span class="tit">E포인트</span><span class="price">10,000 p</span></li>
												<li><span class="tit">임직원포인트</span><span class="price">5,000 p</span></li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
							
					<form id="dataFrm" name="dataFrm">
						<div class="con_tit_wrap">
							<h3 class="con_tit">환불 계좌 정보</h3>
						</div>
						<div class="table_wrap mb95">
							<table class="tb_row">
								<caption>환불 계좌 정보 : 은행명, 계좌번호, 예금주 입력 표입니다.</caption>
								<colgroup>
									<col style="width:20%">
									<col style="width:30%">
									<col style="width:20%">
									<col style="width:30%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 은행명 
										</th>
										<td>
											<span class="select">
												<select id="ORD_MST_RFD_CD" name="ORD_MST_RFD_CD" class="w300">
													<option selected="selected" value="">은행명 선택</option>
													<c:forEach var="item" items="${depositBankList }">
														<option value="${item.CMN_COM_ETC1 }" <c:if test="${item.CMN_COM_ETC1 eq orderPayInfo.ORD_MST_RFD_CD}">selected="selected"</c:if>>${item.CMN_COM_NM }</option>
													</c:forEach>
												</select>
											</span>
										</td>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 계좌번호 
										</th>
										<td>
											<input type="text" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" maxlength="20" placeholder="하이픈(-)없이 입력" class="w100p" value="<c:out value="${orderPayInfo.ORD_MST_RFD_ACT }"/>">
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="required">
												<em class="blind">필수 정보</em>
											</span> 예금주
										</th>
										<td colspan="3">
											<input type="text" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" placeholder="이름 입력" class="w400" value="<c:out value="${orderPayInfo.ORD_MST_ORD_NM }"/>">
											<button id="account" type="button" style="display:none;" class="btn_large type03">계좌 확인</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</c:if>


				<div class="btn_wrap mb95">
					<button type="button" onclick="goList()" class="btn_large">취소</button>
					<button type="button" onclick="goOrderCancel()" class="btn_large ok">주문취소</button>
				</div>

				<h4 class="tit_small">환불안내</h4>
				<div class="table_wrap small mb95">
					<table class="tb_row">
						<caption>환불안내 : 신용카드, 실시간계좌이체, 가상계좌(무통장입금), 할인쿠폰, 포인트 입력 표입니다.</caption>
						<colgroup>
							<col style="width:280px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">신용카드</th>
								<td>
									<ul class="ul_dot">
										<li>승인취소 : 신용카드 승인취소는 매입(카드사로 결제정보가 넘어가기 전)인 경우에는 취소 승인한 당일 취소됩니다.</li>
										<li>매입취소 : 카드사로 결제정보가 넘어간 후에는 카드사에서 취소처리를 하는데 1~2주 정도 소요 됩니다.<br>(카드사별 취소 반영이 차이가 있습니다. 각 카드사 홈페이지에서 확인 가능합니다.)</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">실시간계좌이체</th>
								<td>
									<ul class="ul_dot">
										<li>취소 완료일 기준 익일에 실시간 계좌이체가 진행된 고객님의 계좌로 직접 환불됩니다.</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가상계좌(무통장입금)</th>
								<td>
									<ul class="ul_dot">
										<li>취소 완료일 기준 익일에 환불 계좌로 입금됩니다.</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">할인쿠폰</th>
								<td>
									<ul class="ul_dot">
										<li>사용한 쿠폰은 환불(복구) 되지 않습니다.</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">포인트</th>
								<td>
									<ul class="ul_dot">
										<li>포인트 환불은 취소 완료일 기준 익일에 재적립됩니다.</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //sub_content -->
		</div>
	</div>
	
<form id="frm" name="frm">
	<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="">
</form>


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>


<script>
$(function(){
	// 폼체크
	var $dataFrm = $("#dataFrm");
	var $applFrm = $("#applFrm");
	
    $dataFrm.validate({
        rules: {
        	ORD_MST_RFD_CD:{required:true},
        	ORD_MST_RFD_ACT:{required:true, number:true, maxlength:20},
        	ORD_MST_RFD_HDR:{required:true}
        },
        messages :{
        	ORD_MST_RFD_CD:{required:"[은행명]은 필수 정보입니다."},
        	ORD_MST_RFD_ACT:{required:"[계좌번호]는 필수 정보입니다.",number:"[계좌번호]는 숫자만 입력해주세요", maxlength:"[계좌번호]는 최대 20글자압니다."},
        	ORD_MST_RFD_HDR:{required:"[예금주]는 필수 정보입니다."}
        }
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   alert(errorList[0].message);
	    	   $(errorList[0].element).focus();
	       }
	   }
    });
	
	var $frm = $("#frm");
	//상세페이지 이동
	goProductView = function(prdCd){
		$frm.find("input[name='PRD_MST_CD']").val(prdCd);
	    $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/product.do?prdMstCd="+prdCd, "target":"_self", "method":"get"}).submit();
	};
	
	$("#ORD_MST_RFD_CD").on("change", function(){
		$("#account").css("display", "inline");
	})
	
	$("#ORD_MST_RFD_ACT").on("keypress", function(){
		$("#account").css("display", "inline");
	});
	
	$("#ORD_MST_RFD_HDR").on("keypress", function(){
		$("#account").css("display", "inline");
	});
	
	$("#account").on("click", function(){
		if($dataFrm.valid()){
			$("#account").css("display", "none");
		}
	});
	
	// 취소(목록)
	goList = function(){
		$applFrm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myShoppingList.do", "target":"_self", "method":"post"}).submit();
	}
	
	// 주문취소
 	goOrderCancel = function(){
		
		// 2020.06.15 벨리데이션 위치수정
 		var prdCds = [];
		$("input[name='pro_chk']").each(function(){
			if(this.checked){
				prdCds.push(this.value);
			}
		});
		var value = prdCds.join(",");
		
		if(value == 'undefined' || value == null || value == '') {
			alert("주문취소 상품을 선택하세요.");				
			return;
		}
		// END 2020.06.15 벨리데이션 위치수정
		
		if($("#SELECT_REASON").val() == ''){
			alert("[사유]는 필수정보 입니다.");
			$("#SELECT_REASON").focus();
			return;
		}
		
		//2020.06.15 환불계좌정보 벨리데이션 추가
		var selectVal = $('#ORD_MST_RFD_CD option:selected').val();
		var rfdNo = $('#ORD_MST_RFD_ACT').val();
		var rfdName = $('#ORD_MST_RFD_HDR').val();
		if(selectVal == 'undefined' || selectVal == null || selectVal == '') {
			alert("환불계좌 은행을 선택하세요.");
			$("#ORD_MST_RFD_CD").focus();
			return;
		}else if(rfdNo == 'undefined' || rfdNo == null || rfdNo == '') {
			alert("계좌번호를 입력하세요.");
			$("#ORD_MST_RFD_ACT").focus();
			return;
		}else if(rfdName == 'undefined' || rfdName == null || rfdName == '') {
			alert("예금주를 입력하세요.");
			$("#ORD_MST_RFD_HDR").focus();
			return;
		}
		//END 2020.06.15 환불계좌정보 벨리데이션 추가
		
		if(confirm("주문 취소하시겠습니까?")){
			
			$applFrm.find("#ORD_PRD_IDXs").val(value);
			$applFrm.find("#ORD_PRD_IDX_ARR").val(value);			
    		$applFrm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/orderStateProc.do", "target":"_self", "method":"post"}).submit();
    	}
	}
})
</script>