<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">옵션변경</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		
		<h2 class="semantic">옵션변경</h2>
		
		<form name="frm" id="frm">
		<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderProductInfo.ORD_ORD_MST_CD}"/>"/><!-- 주문번호 -->
		<input type="hidden" name="ORD_PRD_MST_CD" value="<c:out value="${orderProductInfo.ORD_PRD_MST_CD}"/>"/><!-- 주문상품코드 -->
		<input type="hidden" name="ORD_PRD_IDX" value="<c:out value="${commandMap.ORD_PRD_IDX}"/>"/><!-- 주문상품번호 -->
		
		<div class="table-a"><!-- row list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: auto;" />
					<col style="width: 30%;" />					
				</colgroup>
				<thead>
					<tr>
						<th>상품유형</th>
						<th>상품/옵션정보</th>
						<th>상품가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:out value="${orderProductInfo.PRD_MST_TYPE eq 'G' ? '일반' : '패키지'}" /></td>
						<td style="text-align:left;">
								<a href="javascript:goProductView('<c:out value="${orderProductInfo.ORD_PRD_MST_CD }" />');" class="underline"  title="새 창 으로 열립니다.">
								
									<c:choose>
										<c:when test="${orderProductInfo.ORD_PRD_OPT_DTL_IDX gt 0}">
											<c:if test="${not empty orderProductInfo.OPT_DTL_ERP_CD}">
												<span class="name"><c:out value="${orderProductInfo.OPT_DTL_ERP_CD}"/></span><br/>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${not empty orderProductInfo.PRD_MST_ERP_CD}">
												<span class="name"><c:out value="${orderProductInfo.PRD_MST_ERP_CD}"/></span><br/>
											</c:if>
										</c:otherwise>
									</c:choose>
									
                                	<span class="block desc"><c:out value="${orderProductInfo.PRD_MST_NM }" /></span>
                                </a>  	
									<span class="size"><c:out value="${orderProductInfo.OPT_DTL_NM }" /></span>
						</td>
						<td>
							<c:choose>
				    			<c:when test="${orderProductInfo.ORD_PRD_SLT_YN eq 'N' }"><%-- 마스터 or 필수옵션인 경우 --%>
				    				<fmt:formatNumber value="${orderProductInfo.ORD_PRD_PRD_PRC}" type="number"/>
				    				<c:if test="${not empty orderProductInfo.ORD_PRD_OPT_ADD_PRC and orderProductInfo.ORD_PRD_OPT_ADD_PRC ne 0}"><%-- 옵션 추가금이 있는 경우 --%>
										<br/>(${orderProductInfo.ORD_PRD_OPT_ADD_PRC gt 0 ? '+' : ''}<fmt:formatNumber value="${orderProductInfo.ORD_PRD_OPT_ADD_PRC}" type="number"/>)
									</c:if>
				    			</c:when>
				    			<c:otherwise>
				    				(옵션)<fmt:formatNumber value="${orderProductInfo.ORD_PRD_PRD_PRC}" type="number"/>
				    			</c:otherwise>
				    		</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // row list -->
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 15%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>
							옵션
						</th>
						<td style="text-align:left;">
							<c:choose>
								<c:when test="${not empty optionDetailList}">
									<select class="select" id="optionDetailList" name="ORD_PRD_OPT_DTL_IDX">
										<option value="">선택</option>
											<c:forEach var="optionDetail" items="${optionDetailList}">
												<option 
													value="${optionDetail.OPT_DTL_IDX }"
													data-name=${optionDetail.OPT_DTL_NM }
													data-add_prc="${optionDetail.OPT_DTL_ADD_PRC}"
												>
													${optionDetail.OPT_DTL_NM} 
													[재고 : <fmt:formatNumber value="${optionDetail.OPT_DTL_STK_CNT}" type="number"/>]
													<c:if test="${not empty optionDetail.OPT_DTL_ADD_PRC}">
														[추가금액 : ${optionDetail.OPT_DTL_ADD_PRC gt 0 ? '+' : ''}<fmt:formatNumber value="${optionDetail.OPT_DTL_ADD_PRC}" type="number"/>]
													</c:if>
												</option>
											</c:forEach>
									</select>
								</c:when>		
								<c:otherwise>
									변경 가능 옵션 없음
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		</form>
		
		<div class="section-button"><!-- section button -->
            <a href="#none" id="goRegist" class="button button-b"><span>확인</span></a>
            <a href="javascript:self.close();" id="goList" class="button button-a"><span>취소</span></a>
        </div><!-- // section button -->

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
	 
	 // 상품 상세페이지 이동
    goProductView = function (prdMstCd)
    {
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD="+prdMstCd, "target":"_blank", "method":"post"}).submit();
    };
	 
	// 등록 이벤트
    $(document).on("click", "#goRegist", function () {
    	
    	var selectedOptDtl = $("#optionDetailList option:selected");
    	
    	if($("#optionDetailList").val() == ""){
    		alert("옵션을 선택해주십시오.");
    		return;
    	}
    	
    	// 기존 옵션
    	var orgOrdPrdOptIdx = "${orderProductInfo.ORD_PRD_OPT_DTL_IDX}";
    	var newOrdPrdOptIdx = selectedOptDtl.val();
    	
    	if(orgOrdPrdOptIdx == newOrdPrdOptIdx){
    		alert("기존 옵션과 동일한 옵션입니다.");
    		return;
    	}
    	
    	// 기존 옵션 추가금액
    	var orgOrdPrdOptAddPrc = "${orderProductInfo.OPT_DTL_ADD_PRC}";
    	var newOrdPrdOpAddPrc = selectedOptDtl.data("add_prc");
    	
    	if(orgOrdPrdOptAddPrc != newOrdPrdOpAddPrc){
    		alert("옵션 추가금액이 달라 변경이 불가능합니다.");
    		return;
    	}
    	
    	//옵션 중복 체크
    	if(confirm("변경하시겠습니까?")){
    		$.ajax({
    			type:"post",
    			url : "<c:out value="${serverDomain}" />/am/order/orderList/changeProductOptionProcAjax.do",
    			data : $frm.serialize(),
    			dataType : "json",
    			async : false,
    			success : function(data){
    				//result 0 이상 성공
    				alert(data.resultMsg);
    				
    				if(data.result > 0){
    					opener.location.reload();
    					self.close();
    				}
    			},
    			error : function(err){
    				alert("오류가 발생하였습니다.\n[" + err.status + "]");
    			}
    		});
    	}
    });
	
});
</script>
</body>
</html>