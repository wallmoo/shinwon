<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
    <h1 class="title">교환권 발송</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<form id="frm" name="frm" method="post">
	    <input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/>
		<input type="hidden" name="ORD_MST_ORD_DT" value="<c:out value="${orderInfo.ORD_MST_ORD_DT}"/>"/>
		<input type="hidden" name="SHP_MST_NM" value="<c:out value="${orderInfo.SHP_MST_NM}"/>"/>
		<input type="hidden" name="SHP_MST_TEL" value="<c:out value="${orderInfo.SHP_MST_TEL}"/>"/>
		<input type="hidden" name="ORD_GET_TIK" value="<c:out value="${orderInfo.ORD_GET_TIK}"/>"/>
		
	    <p>
	    	* 교환권은 최대3회까지만 발송할 수 있습니다.<br/>
	    	* 문자메시지에 상품가격은 노출되지 않습니다.
	    </p>
	    
	    남은 발송 횟수 ${orderInfo.ORD_GET_SMS_CNT}/2회(관리자 발송횟수 ${orderInfo.ORD_GET_ADM_SMS_CNT }회)
	    
	    <div class="right">
			<a href="javascript:preview();" class="button button-a small"><span>미리보기</span></a>
		</div>
	    
	    <div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>보내시는 분</th>
						<td style="text-align:left;">
							<input type="hidden" id="ORD_MST_ORD_NM" name="ORD_MST_ORD_NM" value="<c:out value="${orderInfo.ORD_MST_ORD_NM}"/>" maxlength="15"/>
							<c:out value="${orderInfo.ORD_MST_ORD_NM}"/>
							<br/>
							<input type="hidden" id="ORD_MST_HP1" value="<c:out value="${orderInfo.ORD_MST_HP1}"/>">
							<input type="hidden" id="ORD_MST_HP2" value="<c:out value="${orderInfo.ORD_MST_HP2}"/>" maxlength="4"/>
							<input type="hidden" id="ORD_MST_HP3" value="<c:out value="${orderInfo.ORD_MST_HP3}"/>" maxlength="4"/>
							<c:out value="${orderInfo.ORD_MST_HP1}"/>-<c:out value="${orderInfo.ORD_MST_HP2}"/>-<c:out value="${orderInfo.ORD_MST_HP3}"/>
						</td>
					</tr>
					<tr>
						<th>받으시는 분</th>
						<td style="text-align:left;">
							<a href="javascript:copyMyInfo();" class="button button-a small"><span>본인수령</span></a>
							<a href="javascript:copyReceiverInfo();" class="button button-a small"><span>타인수령</span></a>
							<p>
							<input type="text" class="text" id="ORD_GET_NM" name="ORD_GET_NM" value="<c:out value="${orderInfo.ORD_GET_NM}"/>" maxlength="15"/>
							</p>
							<p>
							<select id="ORD_GET_TEL1" name="ORD_GET_TEL1" class="select">
                            	<option value="">선택</option>
			                    <c:if test="${not empty codes.HP_CODE }">
			                         <c:forEach var="row" items="${codes.HP_CODE }">
			                             <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${orderInfo.ORD_GET_TEL1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
			                         </c:forEach>
			                    </c:if>
			                </select>
			                -
							<input type="text" class="text short number" id="ORD_GET_TEL2" name="ORD_GET_TEL2" value="<c:out value="${orderInfo.ORD_GET_TEL2}"/>" maxlength="4"/>
							-
							<input type="text" class="text short number" id="ORD_GET_TEL3" name="ORD_GET_TEL3" value="<c:out value="${orderInfo.ORD_GET_TEL3}"/>" maxlength="4"/>
							</p>
							<p>
							<select id="ORD_GET_RLT" name="ORD_GET_RLT" class="select">
                            	<option value="">주문자와의 관계</option>
			                    <c:if test="${not empty codes.GET_IT_NOW_RECEIVER_CD }">
			                         <c:forEach var="row" items="${codes.GET_IT_NOW_RECEIVER_CD }">
			                             <option value="<c:out value="${row.CMN_COM_ETC1 }"/>" <c:if test="${orderInfo.ORD_GET_RLT eq row.CMN_COM_ETC1 }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
			                         </c:forEach>
			                    </c:if>
			                </select>
			                </p>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<h4 class="title">주문상품</h4>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: auto;" />
					<col style="width: 20%;" />
				</colgroup>
				<tbody>
					<tr>
						<th>상품/옵션정보</th>
						<th>수량</th>
					</tr>
					<%-- 대표 상품명 설정 --%>
		            <c:if test="${ fn:length(orderProductList) gt 1 }">
		            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM} 외 ${ fn:length(orderProductList) - 1 }건"/>
		            </c:if>
		            <c:if test="${ fn:length(orderProductList) eq 1 }">
		            	<input type="hidden" name="PRD_NM" value="${orderProductList[0].PRD_MST_NM}"/>
		            </c:if>	
					<c:forEach items="${orderProductList}" var="data" varStatus="i">
						<tr>
		                    <td class="subject" style="text-align:left;">
		                        <p style="margin-left: 10px;">
	                                <span class="block name"><c:out value="${data.ORD_PRD_MST_CD }" /></span>
	                                <span class="block desc"><c:out value="${data.PRD_MST_NM }" /></span>
	                                <c:if test="${data.ORD_PRD_OPT_DTL_IDX gt 0}" >
										<span class="block size"><c:out value="${data.OPT_DTL_NM }" /></span>
									</c:if>
		                        </p>
		                    </td>
							<td><fmt:formatNumber value="${data.ORD_PRD_ORD_CNT}" type="number"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		</form>
			
		<div class="section-button search"><!-- section-button -->
			<a href="javascript:save();" class="button button-b"><span>교환권 발송하기</span></a>
		</div><!-- // section-button -->

	</div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script type="text/javascript">
$(function() {
	var $frm = $("#frm");
	// 내게보내기
	copyMyInfo = function(){
		$("#ORD_GET_NM").val($("#ORD_MST_ORD_NM").val());
		$("#ORD_GET_TEL1").val($("#ORD_MST_HP1").val());
		$("#ORD_GET_TEL2").val($("#ORD_MST_HP2").val());
		$("#ORD_GET_TEL3").val($("#ORD_MST_HP3").val());
		$("#ORD_GET_RLT").val("");
	}
	
	// 방문하시는분
	copyReceiverInfo = function(){
		$("#ORD_GET_NM").val("${orderInfo.ORD_GET_NM}");
		$("#ORD_GET_TEL1").val("${orderInfo.ORD_GET_TEL1}");
		$("#ORD_GET_TEL2").val("${orderInfo.ORD_GET_TEL2}");
		$("#ORD_GET_TEL3").val("${orderInfo.ORD_GET_TEL3}");
		$("#ORD_GET_RLT").val("${orderInfo.ORD_GET_RLT}");
	}
	
	// 폼체크
    $frm.validate({
        rules: {
        	ORD_GET_NM:{required:true}, // 받는사람 이름
        	ORD_GET_TEL1:{required:true, number:true}, // 받는사람 전화번호1
        	ORD_GET_TEL2:{required:true, number:true, minlength:3, maxlength:4}, // 받는사람 전화번호2
        	ORD_GET_TEL3:{required:true, number:true, minlength:4, maxlength:4} // 받는사람 전화번호3
        },
        messages :{
        	ORD_GET_NM : {required:"받으시는 분 이름을 입력해주십시오."},
        	ORD_GET_TEL1 : {required:"첫 자리는 필수입력 사항입니다.", number:"첫 자리는 숫자만 입력해 주십시오."},
        	ORD_GET_TEL2 : {required:"중간 자리는 필수입력 사항입니다.", number:"중간 자리는 숫자만 입력해 주십시오."},
        	ORD_GET_TEL3 : {required:"끝 자리는 필수입력 사항입니다.", number:"끝 자리는 숫자만 입력해 주십시오."}   
        }
    });
	
	// 미리보기
	preview = function()
	{
		window.open("","exchangeTicketPreviewPop", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=350,height=400,scrollbars=yes');
		document.frm.action = "<c:out value="${serverDomain}"/>/am/order/exchangeTicketPreviewPopup.do";
		document.frm.target = "exchangeTicketPreviewPop";
		document.frm.submit();
	}
	
    // 저장
    save = function()
    {
    	if($frm.valid()){
    		if(confirm("발송 하시겠습니까?"))
            {
                $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderList/sendExchangeTicketProc.do", "target":"_self", "method":"post"}).submit();
                $.blockUI({ 
              		message: "처리중입니다...",   
              		css: {            		
                       border: 'none', 
                       padding: '15px', 
                       backgroundColor: '#000', 
                       '-webkit-border-radius': '10px', 
                       '-moz-border-radius': '10px', 
                       opacity: .5, 
                       color: '#fff' 
                  	} 
              	});
            }
    	}	
    };
});
</script>
</body>
</html>