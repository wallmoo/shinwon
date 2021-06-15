<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-main"><%-- page class : main, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<h1>장바구니 테스트</h1>

<h1>사용자 상태 :
<c:if test="${ empty __MALL_USER_SESSION_INFO__ }"> 비회원 </c:if>
<c:if test="${ not empty __MALL_USER_SESSION_INFO__ }">
	회원
</c:if>
</h1><br/>

<form name="cartForm" id="cartForm">
<input type="text" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD}"/><br/>
상품코드 : ${commandMap.PRD_MST_CD}<br/>
상품가격 : ${productInfo.PRD_MST_PRC}<br/>
기업회원가1 : ${productInfo.PRD_MST_CPR_PRC1}<br/>
기업회원가2 : ${productInfo.PRD_MST_CPR_PRC2}<br/>

pc즉시쿠폰타입(R정율 S정액) : ${productInfo.PRD_MST_PC_CPN_UNT}<br/>
pc즉시쿠폰금액 : ${productInfo.PRD_MST_PC_CPN_PRC}<br/>
mb즉시쿠폰타입(R정율 S정액) : ${productInfo.PRD_MST_MB_CPN_UNT}<br/>
mb즉시쿠폰금액 : ${productInfo.PRD_MST_MB_CPN_PRC}<br/>

즉시할인 적용가(회원만 적용!) : ${productInfo.CUSTOMER_PRICE}<br/>

[옵션]<br/> 

<c:choose>
	<c:when test="${not empty optionList}">
		<c:forEach var="option" items="${optionList}">
			<input type="hidden" name="PRD_OPT_IDX" value="${option.PRD_OPT_IDX}"/>
			${option.PRD_OPT_EST_YN eq 'Y' ? '필수' : '선택' }${option.PRD_OPT_NM} : 
			<select class="optionDetailList">
				<option value="">선택</option>
				<c:forEach var="optionDetail" items="${optionDetailList}">
					<c:if test="${option.PRD_OPT_IDX eq optionDetail.PRD_OPT_IDX}">
						<option 
							value="${optionDetail.OPT_DTL_IDX }"
							data-name=${optionDetail.OPT_DTL_NM }
							data-add_prc="${optionDetail.OPT_DTL_ADD_PRC}"
							data-est_yn="${option.PRD_OPT_EST_YN }"
							data-cnt_yn="${option.PRD_OPT_CNT_YN }"
						>
							${optionDetail.OPT_DTL_NM} 
							<c:if test="${not empty optionDetail.OPT_DTL_ADD_PRC}">
								추가금 : ${optionDetail.OPT_DTL_ADD_PRC}
							</c:if>
						</option>
					</c:if>
				</c:forEach>
			</select>
			<br/>
		</c:forEach>
	</c:when>
	<c:otherwise>
		옵션 없음!
	</c:otherwise>
</c:choose>

<%-- 필수옵션 존재 여부 --%>
<c:set var="C_EST_YN" value="N"/> 
<c:choose>
	<c:when test="${empty optionDetailList}">
	<%-- 옵션 없는 경우 --%>
	<c:set var="C_EST_YN" value="N"/> 
	</c:when>
	<c:when test="${optionDetailList[0].EST_Y_CNT gt 0}">
	<%-- 필수 옵션 있는 경우 --%>
	<c:set var="C_EST_YN" value="Y"/> 
	</c:when>
	<c:when test="${optionDetailList[0].EST_Y_CNT eq 0}">
	<%-- 필수 옵션 없는 경우 --%>
	<c:set var="C_EST_YN" value="N"/> 
	</c:when>
</c:choose>

<c:if test="${C_EST_YN eq 'N'}">
	<div class="selectedPrdOpt_0">
	<input type="hidden" class="selectedPrdOpt_0" name="OPT_DTL_IDXs" value="0"/>
	[필수 옵션 없는 경우에만 나오는 마스터 수량!] : <select class="selectedPrdOpt_0" name="REQUEST_CNT_0"><c:forEach begin="1" end="99" var="i"><option value="<c:out value="${i}"/>"><c:out value="${i}"/></option></c:forEach></select>
	</div>
</c:if>

<p>
	겟잇나우 매장
	<select id="MEM_CRT_SHP_MST_IDX" name="MEM_CRT_SHP_MST_IDX">
		<option value="">선택</option>
		<c:forEach var="row" items="${getItNowShopList}">
			<option value="${row.SHP_MST_IDX}">${row.SHP_MST_NM}</option>
		</c:forEach>
	</select>
	
	날짜 : <input type="text" id="MEM_CRT_GET_PKU_DT" name="MEM_CRT_GET_PKU_DT" value="20151214"/>
	
	시간 :
	<select id="MEM_CRT_GET_PKU_HH" name="MEM_CRT_GET_PKU_HH">
		<option value="">매장 선택하세요</option>
	</select>
</p>

<p>
<input type="radio" id="MEM_CRT_DLV_GBN1" name="MEM_CRT_DLV_GBN" value="${Code.CART_DLV_GBN_NORMAL_CD }" checked="checked"/><label for="MEM_CRT_DLV_GBN1">일반</label>
<input type="radio" id="MEM_CRT_DLV_GBN2" name="MEM_CRT_DLV_GBN" value="${Code.CART_DLV_GBN_GET_IT_NOW_CD }" /><label for="MEM_CRT_DLV_GBN2">겟잇나우</label>
<input type="radio" id="MEM_CRT_DLV_GBN3" name="MEM_CRT_DLV_GBN" value="${Code.CART_DLV_GBN_SERVICE_CD }" /><label for="MEM_CRT_DLV_GBN3">무형배송</label>
<input type="radio" id="MEM_CRT_DLV_GBN4" name="MEM_CRT_DLV_GBN" value="${Code.CART_DLV_GBN_LONG_INS_CD }" /><label for="MEM_CRT_DLV_GBN4">장기할부</label>
</p>

<p>
	<input type="radio" id="MEM_CRT_LNG_DIV1" name="MEM_CRT_LNG_DIV" value="24"/>24개월
	<input type="radio" id="MEM_CRT_LNG_DIV2" name="MEM_CRT_LNG_DIV" value="36"/>36개월
</p>
<!-- <p>
<input type="radio" id="pickupYn1" name="GET_IT_NOW_YN" value="N" checked="checked"/><label for="pickupYn1">택배배송</label>
<input type="radio" id="pickupYn2" name="GET_IT_NOW_YN" value="Y"/><label for="pickupYn2">픽업수령</label>
</p> -->

<%--필수옵션리스트 --%>
<p style="margin-top:30px;" id="selectedEstYProductDiv">
</p>

<%-- 선택옵션리스트 --%>
<p id="selectedEstNProductDiv">
</p>

<p>
	합계금액 : <span id="totPrc">0</span>원
</p>

<p style="margin-top:30px;">

<!-- <input type="button" value="선택" class="selectProduct"/> -->

<a href="javascript:inertCart();">장바구니 담기</a>
<a href="javascript:directPurchase();">바로구매</a>

</p>

</form>


<textarea style="margin-top:30px;width:600px;height:250px;">로그인 정보 : <c:out value="${__MALL_USER_SESSION_INFO__}"/></textarea>
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<!-- 장바구니 관련 스크립트 -->
<script type="text/javascript">
function deleteSeelctedProduct(optDtlIdx){
	var $selectedDiv = $(".selectedPrdOpt_"+optDtlIdx);
	if($selectedDiv.hasClass("selectedEst_Y")){//필수인 경우
		$selectedDiv.remove();
		if($(".selectedEst_Y").length == 0){//필수옵션이 하나도 없는 경우 선택 옵션도 삭제
			$(".selectedEst_N").remove();
		}
	}else{//선택인 경우 
		$selectedDiv.remove();
	}
}
//<![CDATA[
$(function() {
	
	// 겟잇나우 매장 변경시 방문시간 가져오기
	$(document).on("change","#MEM_CRT_SHP_MST_IDX", function(){
		var shopCd = $(this).val();
		if(shopCd != ""){
			$.ajax
	        ({
	            async : false,
	            type : "POST",
	            data : {SHP_MST_IDX : shopCd},
	            url : "<c:out value="${frontDomain}" />/pc/cart/selectGetItNowShopTimeAjax.do",
	            success : function (data) 
	            { 
	            	var timeList = data.timeList;
	            	
	            	var $visitTimeList = $("#MEM_CRT_GET_PKU_HH");
	            	$visitTimeList.html("<option value=\"\">시간선택</option>")
	            	$.each(timeList, function(i, item){
	            		$visitTimeList.append("<option value=\""+ item +"\">"+ item +"</option>");
	            	});
	            },
	            error : function (err)
	            {
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	            }
			});
		}
	});
	
	
	
	$(document).on("change",".optionDetailList", function(){
		var optDtlIdx = $(this).val();
		if(optDtlIdx != ""){
			if($(".selectedPrdOpt_"+optDtlIdx).length == 0){
				var estYn = $(this).find('option:selected').data("est_yn");//필수여부
				var cntYn = $(this).find('option:selected').data("cnt_yn");//수량선택여부
				var customerPrice = parseInt("${productInfo.CUSTOMER_PRICE}");//즉시할인가
				var addPrc = parseInt($("option:selected", this).data("add_prc"));//추가금
				var calculatedPrice = customerPrice + addPrc;//즉시할인가 + 추가금
				
				//필수 선택 여부 체크
				if(estYn != "Y"){//선택옵션인 경우 
					//필수옵션이 있는 경우 필수옵션 선택후 선택 가능합니다.
					if("${C_EST_YN}" == "Y" && $(".selectedEst_Y").length == 0){
						alert("필수 옵션을 선택해주십시오.");
						$(this).val("");
						return;
					}
				
					//선택옵션은 추가금이 상품금액이 된다..
					calculatedPrice = addPrc;
				}
				
				var html = "<div class=\"selectedPrdOpt_" + optDtlIdx + "  selectedEst_"+ estYn +"  \">";
				html += estYn == 'Y' ? "필수 " : "선택 ";
				html += "idx : <input type=\"text\" name=\"OPT_DTL_IDXs\" value=\"" + optDtlIdx + "\" />name : " + $("option:selected", this).data("name");
				if(cntYn == "Y"){//수량선택 가능
					html += " 개수 <input type=\"text\" class=\"REQUEST_CNT\" name=\"REQUEST_CNT_"+ optDtlIdx +"\" value=\"1\" data-opt_dtl_idx=\""+ optDtlIdx +"\" />";
				}else{//수량선택 불가
					html += " 개수 <input type=\"hidden\" class=\"REQUEST_CNT\" name=\"REQUEST_CNT_"+ optDtlIdx +"\" value=\"1\" data-opt_dtl_idx=\""+ optDtlIdx +"\" />1개고정!";
				}
				html += "판매금액 <input type=\"text\" id=\"customerPrice_"+ optDtlIdx +"\" value=\"" + calculatedPrice + "\" />";
				html += "계산된금액 <input type=\"text\" class=\"prdPrice\" id=\"customerPrice2_"+ optDtlIdx +"\" value=\"" + calculatedPrice + "\" />";
				html += " <a href=\"javascript:deleteSeelctedProduct('"+ optDtlIdx +"');\">X</a>";
				html += "</div>";
				
				$("#selectedEst"+ estYn +"ProductDiv").append(html);
				
				calculateTotPrc();
			}
		}
	});
	
	//수량 변경시
	$(document).on("keyup",".REQUEST_CNT",function(){
		var optDtlIdx = $(this).data("opt_dtl_idx");
		var value = $(this).val();
		
		if(isNaN(value)){
			alert("숫자를 입력해주세요.");
			value = 1;
			$(this).val(1);
		}
		
		$("#customerPrice2_"+optDtlIdx).val($("#customerPrice_"+optDtlIdx).val() * value);
		
		calculateTotPrc();
	});
	
	//합계금액 계산
	calculateTotPrc = function(){
		var totPrc = 0;
		$(".prdPrice").each(function(){
			totPrc += parseInt($(this).val());
		});
		$("#totPrc").html(setComma(totPrc));
	};
	
	//택배/픽업 선택시
	$(document).on("change","input[name='GET_IT_NOW_YN']",function(){
		if($(".selectedPrdOpt").length > 0){
			if(confirm("선택한 상품이 초기화됩니다.\n배송형태를 변경하시겠습니까?")){		
				$(".selectedPrdOpt").remove();
			}else{
				$(this).siblings().prop("checked", true);
			}	
		}
	});
	
	// 장바구니 담기
	inertCart = function(){
		$.ajax
        ({
            async : false,
            type : "POST",
            data : $("#cartForm").serialize(),
            url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		$("#topCartCnt").html(data.cartCnt);
            		if(confirm('해당 상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?')){
            			$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();
            		}
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
		
		$(".selectedPrdOpt_0").prop("disabled", false);
	};
	
	// 바로구매
	directPurchase = function(){
		$.ajax
        ({
            async : false,
            type : "POST",
            data : $("#cartForm").serialize(),
            url : "<c:out value="${frontDomain}" />/pc/cart/insertDirectPurchaseAjax.do",
            success : function (data) 
            { 
            	// 1 : 장바구니 등록 성공
            	switch(data.result){
            	case 1:
            		$('#_blank_form').html("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
            		$('#_blank_form').attr("method","post");	
            		<c:choose>
                    <%-- 1. 비회원 --%>
                    <c:when test="${sessionUser.ROLE_USER eq 'guest' or sessionUser.ROLE_USER eq 'order_guest'}">
		        	//$('#_blank_form').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartLogin.do').submit();
		        	var url = location.href;
		        	url = encodeURIComponent(url);
		        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&ORD_MST_CD=" + data.ORD_MST_CD,"loginPopup","width=620,height=540,scrollbars=no,target=_blank");
                    </c:when>
                    <%-- 2. 회원 --%>
                    <c:when test="${sessionUser.ROLE_USER eq 'user'}">
            		$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do'}).submit();
                    </c:when>
                    </c:choose>
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
		
		$(".selectedPrdOpt_0").prop("disabled", false);
	};
	
});
//]]>
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>