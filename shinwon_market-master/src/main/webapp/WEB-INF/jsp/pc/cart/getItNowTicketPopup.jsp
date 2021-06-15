<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-popup">

<div id="popContainer"><!-- popContainer -->

    <h1 class="title">교환권 발송하기</h1>

    <div id="popWrapper" class="coupon-post"><!-- popWrapper -->
		
		<form id="frm" name="frm" method="post">
		<input type="hidden" name="ORD_MST_CD" value="<c:out value="${getItNowShopInfo.ORD_MST_CD}"/>"/>
		<input type="hidden" name="ORD_MST_ORD_NM" value="<c:out value="${getItNowShopInfo.ORD_MST_ORD_NM}"/>"/>
		<input type="hidden" name="ORD_MST_ORD_DT" value="<c:out value="${getItNowShopInfo.ORD_MST_ORD_DT}"/>"/>
		<input type="hidden" name="SHP_MST_NM" value="<c:out value="${getItNowShopInfo.SHP_MST_NM}"/>"/>
		<input type="hidden" name="SHP_MST_TEL" value="<c:out value="${getItNowShopInfo.SHP_MST_TEL}"/>"/>
		<input type="hidden" name="ORD_GET_TIK" value="<c:out value="${getItNowShopInfo.ORD_GET_TIK}"/>"/>
		
        <p class="message notice-c">
            교환권은 최대 2회까지만 발송할 수 있습니다.
        </p>

        <p class="message notice-c">
            문자메시지에 상품가격은 노출되지 않습니다.
        </p>

        <p class="ct count">
            <span class="warning fl mt10">남은 발송 횟수 <c:out value="${getItNowShopInfo.ORD_GET_SMS_CNT}"/>/2회</span>
            <a href="javascript:goGetItNowTicketPreview();" class="btn_st0 btn_blk777 small fr"><span>미리보기</span></a>
        </p>

        <table class="table-a table-col mt10"><!-- table-a -->
        <caption>받으시는 분, 휴대폰 번호, 전화번호, 주소, 배송유의사항으로 구성된 배송지 정보 입력 테이블입니다.</caption>
        <colgroup>
            <col style="width: 120px;" />
            <col style="width: auto;" />
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><label for="toName">보내시는 분</label></th>
                <td>
                    <p>
                        <c:out value="${getItNowShopInfo.ORD_MST_ORD_NM }"/>  
                    </p>
                    <p>
                    	<c:out value="${getItNowShopInfo.ORD_MST_HP1 }"/>-<c:out value="${getItNowShopInfo.ORD_MST_HP2 }"/>-<c:out value="${getItNowShopInfo.ORD_MST_HP3 }"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="dearName">받으시는 분</label></th>
                <td>
                	<input id="ORD_GET_GBN_0" class="radio" type="radio" name="ORD_GET_GBN" value="0" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '0'}">checked="checked"</c:if> style="display: none;"/><%-- 본인수령 --%>
                    <input id="ORD_GET_GBN_1" class="radio" type="radio" name="ORD_GET_GBN" value="1" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '1'}">checked="checked"</c:if> style="display: none;"/><%-- 타인수령 --%>
                    <a href="javascript:chageGetGbn('0');" id="ORD_GET_GBN_BTN_0" class="btn_st2 ${getItNowShopInfo.ORD_GET_GBN eq '0' ? 'btn_rd' : 'btn_white'} large"><span>본인수령</span></a>
                    <a href="javascript:chageGetGbn('1');" id="ORD_GET_GBN_BTN_1" class="btn_st2 ${getItNowShopInfo.ORD_GET_GBN eq '1' ? 'btn_rd' : 'btn_white'} large"><span>타인수령</span></a>
                    <p>
                    	<input type="text" id="ORD_GET_NM" name="ORD_GET_NM" class="text" maxlength="15" value="${getItNowShopInfo.ORD_GET_NM }"/>
                    </p>
                    <p>
                    	<select id="ORD_GET_TEL1" name="ORD_GET_TEL1" class="sel_chg" title="휴대폰 번호 앞자리">
						    <option value="">선택</option>
								    <c:if test="${not empty hpCodeList }">
									 <c:forEach var="hpRow" items="${hpCodeList }">
									     <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${getItNowShopInfo.ORD_GET_TEL1 eq hpRow.CMN_COM_NM}">selected="selected"</c:if> ><c:out value="${hpRow.CMN_COM_NM }"/></option>
									 </c:forEach>
								     </c:if>
						</select> - 
						<input type="text" class="text small" maxlength="4" id="ORD_GET_TEL2" name="ORD_GET_TEL2" title="휴대폰 번호 중간자리" value="${getItNowShopInfo.ORD_GET_TEL2 }"/> -
						<input type="text" class="text small" maxlength="4" id="ORD_GET_TEL3" name="ORD_GET_TEL3" title="휴대폰 번호 끝자리" value="${getItNowShopInfo.ORD_GET_TEL3 }"/>
                    </p>
                    <p id="p_ordGetRlt" <c:if test="${getItNowShopInfo.ORD_GET_GBN eq '0'}">style="display: none;"</c:if>>
                    	<select id="ORD_GET_RLT" name="ORD_GET_RLT" class="sel_chg" title="주문자와의 관계">
                             <option value="">주문자와의 관계</option>
                             <c:if test="${not empty getItNowReceiverList }">
                              <c:forEach var="row" items="${getItNowReceiverList }">
                                  <option value="<c:out value="${row.CMN_COM_ETC1 }"/>" <c:if test="${getItNowShopInfo.ORD_GET_RLT eq row.CMN_COM_ETC1}">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
                              </c:forEach>
                          </c:if>
                         </select>
                    </p>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-a -->

        <h2 class="title">주문상품</h2>

        <table class="table-product"><!-- table-product -->
        <caption>상품정보, 수량으로 구성된 주문상품 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;" />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>상품정보</span></th>
                <th scope="col"><span>수량</span></th>
            </tr>
        </thead>
        <tbody>
        	<%-- 대표 상품명 설정 --%>
            <c:if test="${ fn:length(orderProductList) gt 1 }">
            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM} 외 ${ fn:length(orderProductList) - 1 }건"/>
            </c:if>
            <c:if test="${ fn:length(orderProductList) eq 1 }">
            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM}"/>
            </c:if>
        	<c:forEach var="row" items="${orderProductList}" varStatus="i">
        		<tr>
	                <td class="product">
	                    <div class="item">
	                        <div class="thumb">
	                            <a
									href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
									<img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>"
									class="thumb84" alt="${row.PRD_IMAGE_ALT}" />
								</a>
	                        </div>
	                        <div class="core">
	                            <p class="subject">
	                                <a
										href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
										<c:out value="${row.PRD_MST_NM}" />
									</a>
	                            </p>
	                            <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
									<div class="option dotum">
										옵션 :
										<c:if test="${not empty row.optionList}">
											<c:out value="${row.OPT_DTL_NM}" />
											<c:if test="${not empty row.subPrdList}">
												&nbsp;/&nbsp;
											</c:if>
										</c:if>
										
										<%-- 선택옵션 상품 리스트 --%>
										<c:if test="${not empty row.subPrdList}">
											<c:forEach var="subPrd" items="${row.subPrdList}" varStatus="i">
												${subPrd.OPT_DTL_NM}
												(
													<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
														+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
													</c:if>
												<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
												${i.last ? '' : '/&nbsp;'}	
											</c:forEach>
										</c:if>
									</div>
								</c:if>
	                        </div>
	                    </div>
	                </td>
	                <td class="amount">
	                	<fmt:formatNumber value="${row.ORD_PRD_ORD_CNT}" type="number" />
	                </td>
	            </tr>
        	</c:forEach>
        </tbody>
        </table><!-- // table-product -->

        <div class="section-button"><!-- section-button -->
            <a href="javascript:sendGetItNowTicket();" class="btn_st1 btn_blk large"><span>교환권 발송하기</span></a>
        </div><!-- // section-button -->
        
        </form>	

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

<script>
//수령정보 선택시
function chageGetGbn(idx){
	$("#ORD_GET_GBN_"+idx).prop("checked",true);
	$("#ORD_GET_GBN_"+idx).trigger("change");
	$("#ORD_GET_GBN_BTN_"+idx).siblings().removeClass("btn_rd");
	$("#ORD_GET_GBN_BTN_"+idx).siblings().addClass("btn_white");
	$("#ORD_GET_GBN_BTN_"+idx).removeClass("btn_white");
	$("#ORD_GET_GBN_BTN_"+idx).addClass("btn_rd");
	
	if(idx == '0'){
		$("#ORD_GET_NM").val("${getItNowShopInfo.ORD_MST_ORD_NM}");
		$("#ORD_GET_TEL1").val("${getItNowShopInfo.ORD_MST_HP1}");
		com.sel_chg($("#ORD_GET_TEL1"), 'chg');
		$("#ORD_GET_TEL2").val("${getItNowShopInfo.ORD_MST_HP2}");
		$("#ORD_GET_TEL3").val("${getItNowShopInfo.ORD_MST_HP3}");
		
		$("#ORD_GET_RLT").val("");
		com.sel_chg($("#ORD_GET_RLT"), 'reset');
		$("#p_ordGetRlt").hide();
	}else{
		$("#ORD_GET_NM").val("${getItNowShopInfo.ORD_GET_NM}");
		$("#ORD_GET_TEL1").val("${getItNowShopInfo.ORD_GET_TEL1}");
		com.sel_chg($("#ORD_GET_TEL1"), 'chg');
		$("#ORD_GET_TEL2").val("${getItNowShopInfo.ORD_GET_TEL2}");
		$("#ORD_GET_TEL3").val("${getItNowShopInfo.ORD_GET_TEL3}");
		
		$("#ORD_GET_RLT").val("${getItNowShopInfo.ORD_GET_RLT}");
		com.sel_chg($("#ORD_GET_RLT"), 'chg');
		$("#p_ordGetRlt").show();
	}
}

//겟잇나우 교환권 미리보기 팝업
function goGetItNowTicketPreview(){
	window.open("","getItNowTicketPreviewPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=600,height=700,scrollbars=yes');
	document.frm.action = "<c:out value="${serverSslDomain}"/>/pc/cart/getItNowTicketPreviewPopup.do";
	document.frm.target = "getItNowTicketPreviewPop";
	document.frm.submit();
}

//교환권 발송하기
function sendGetItNowTicket(){
	
	if($("#ORD_GET_NM").val() == ""){
   		alert("인수자명을 입력하세요.");
   		$("#ORD_GET_NM").focus();
   		return;
   	}
	
	if($("#ORD_GET_TEL1").val() == ""){
   		alert("인수자 휴대폰 번호 첫째자리를 입력하세요.");
   		$("#ORD_GET_TEL1").focus();
   		return;
   	}
	
	if($("#ORD_GET_TEL2").val() == ""){
   		alert("인수자 휴대폰 번호 둘째자리를 입력하세요.");
   		$("#ORD_GET_TEL1").focus();
   		return;
   	}
	
	if($("#ORD_GET_TEL3").val() == ""){
   		alert("인수자 휴대폰 번호 셋째자리를 입력하세요.");
   		$("#ORD_GET_TEL3").focus();
   		return;
   	}
	
	if($("input[name=ORD_GET_GBN]:checked").val() == "1"){
		if($("#ORD_GET_RLT").val() == ""){
	   		alert("주문자와의 관계를 선택해주세요.");
	   		$("#ORD_GET_RLT").focus();
	   		return;
	   	}
	}
	
	if(confirm("발송하시겠습니까?")){
		var ORD_GET_NM = $("#ORD_GET_NM").val();
		var ORD_GET_TEL = $("#ORD_GET_TEL1").val() +"-"+ $("#ORD_GET_TEL2").val() +"-"+ $("#ORD_GET_TEL3").val();
		
		$.ajax({
			async : false,
			type : "POST",
			data : $("#frm").serialize(),
			url : "<c:out value="${serverSslDomain}" />/pc/cart/sendGetItNowTicketAjax.do",
			success : function(data) {
				//result 1 성공 그외 실패
				alert(data.resultMsg);
				
				if(data.result > 0){
					$("#spanOrdGetNm",opener.document).html(ORD_GET_NM);
					$("#spanOrdGetTel",opener.document).html(ORD_GET_TEL);
					
					self.close();
				}
			},
			error : function(err) {
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}
}
</script>
</body>
</html>