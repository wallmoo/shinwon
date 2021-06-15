<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

	<div class="modal"><!-- modal -->
	
		<div class="modal-wrapper"><!-- modal-wrapper -->
		
			<div class="modal-inner"><!-- modal-inner -->
			
				<h3 class="title"><span>상품옵션 선택</span></h3>
				
				<form id="frm" name="frm">
			        <input type="hidden" name="optSearchTextNum" id="optSearchTextNum" value="<c:out value="${commandMap.optSearchTextNum }" />" />
        			<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="<c:out value="${commandMap.PRD_MST_CD }" />" /> 
		          	
					<table cellspacing="0" class="table-col table-b">
						<colgroup>
							<col style="width: 160px" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
						<tr>
							<th>상품명</th>
							<td><c:out value="${productInfo.PRD_MST_NM }"/></td>
						</tr>
						<tr>
							<th>옵션(택1)</th>
							<td>
								<c:choose>
									<c:when test="${not empty optionList }">
										<c:forEach var="optionList" items="${optionList }" varStatus="status">
											<table class="core">
											<colgroup>
												<col style="width: 120px" />
												<col style="width: auto;" />
												<col style="width: 150px" />
											</colgroup>
											<tbody>
												<tr>
												<c:set var="subcnt" value="1" />
												<th>
													<c:choose>
														<c:when test="${optionList.PRD_OPT_EST_YN eq 'Y' }">
															[필수]
														</c:when>
														<c:otherwise>
															[선택]
														</c:otherwise>
													</c:choose>
													<c:out value="${optionList.PRD_OPT_NM }" />
												</th>
												<c:if test="${not empty optionDetailList }">
													<td class=left>
														<select id="OPT_DTL_IDXs" name="OPT_DTL_IDXs" class="select">
														<c:forEach var="optionDetailList" items="${optionDetailList }" varStatus="status">
															<c:if test="${optionList.PRD_OPT_IDX eq optionDetailList.PRD_OPT_IDX }">
																<c:if test="${subcnt eq 1 }">
																	<option value=""><c:out value="${optionList.PRD_OPT_NM }" /> 선택</option>
																</c:if>
																<option value="<c:out value="${optionList.PRD_OPT_NM }" />^<c:out value="${optionDetailList.OPT_DTL_IDX }" />^<c:out value="${optionDetailList.OPT_DTL_NM }" />^<c:out value="${optionDetailList.OPT_DTL_ADD_PRC }" />^<c:out value="${optionList.PRD_OPT_EST_YN }" />^<c:out value="${optionDetailList.OPT_DTL_STK_CNT}" />"><c:out value="${optionDetailList.OPT_DTL_NM }" />[추가가격:<fmt:formatNumber value="${optionDetailList.OPT_DTL_ADD_PRC }" groupingUsed="true" />(<c:out value="${optionDetailList.OPT_DTL_STK_CNT}" />개)]</option>
																<c:set var="subcnt" value="${subcnt + 1 }" />
															</c:if>
														</c:forEach>
														</select>
													</td>
												</c:if>
													<td>수량 : <input type="text" class="number text" name="EMS_PRD_CNTs" id="EMS_PRD_CNTs" maxlength=9 /></td>
												</tr>
											</tbody>
											</table>	
											<input type="hidden" name="PRD_OPT_EST_YNs" id="PRD_OPT_EST_YNs" value = "<c:out value="${optionList.PRD_OPT_EST_YN}" />" />
										</c:forEach>
									</c:when>
									<c:otherwise>등록된 옵션이 없습니다.</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</tbody>
					</table>
					
					<div class="grid section-button-search"><!-- section button -->
						<a href="#none" id="productApply" class="button small primary"><span>선택</span></a>
						<a href="#none" id="closePopup" class="button small"><span>취소</span></a>
					</div>
					
		        </form>
	        
	        </div><!-- // modal-inner -->
	        
		</div><!-- // modal-wrapper -->
		
	</div><!-- // modal -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
	
	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	}); 
	
	$(document).on("click","#productApply",function(){
		var optDtlIdx = "";
		var optResults = 0;
		var optCntResults = 0;
		
		//필수 옵션 유무 체크
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YNs]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		var optEstYns = 0;
		$("select[id=OPT_DTL_IDXs]").each(function(idx){
			if($(this).val() != ""){
				optEstYns = $(this).val().split('^');
				if(optEstYns[4] == "Y"){//필수 옵션 확인
					prdOptEstYns ++;
				}
				optResults ++;
			}
		});
		
		if(prdOptEstCnt > 0 && prdOptEstYns < 1){
			alert("필수옵션을 선택해 주세요.");
			return;
		}
		
		if(optResults < 1){
			alert("옵션을 선택해 주세요.");
			return;
		}
		
		$("select[id=OPT_DTL_IDXs]").each(function(idx){
 			if($(this).val() != ""){
 				if($("input[id=EMS_PRD_CNTs]").eq(idx).val() < 1 || $("input[id=EMS_PRD_CNTs]").eq(idx).val() == ""){
					optCntResults ++;
				}
			}
		});
		
		if(optCntResults > 0){
			alert("해당 상품 속한 옵션의 수량을 입력해주세요.");
			return;
		}
		
		//옵션 수량 확인
		var cntFocus = "";
		$("select[id=OPT_DTL_IDXs]").each(function(idx){
			if($(this).val() != ""){
				optEstYns = $(this).val().split('^');
				if(parseInt(optEstYns[5]) < parseInt($("input[id=EMS_PRD_CNTs]").eq(idx).val()) ){//필수 옵션 확인
					prdOptEstYns ++;
					cntFocus = $("input[id=EMS_PRD_CNTs]").eq(idx);
					return;
				}
			}
		});
		
		if(cntFocus != ""){
			alert("해당 옵션 수량을 확인해주세요");
			cntFocus.focus();
			return;
		}
		var params = new Array();
    	var obj;
    	var myArray;
    	
    	$("select[id=OPT_DTL_IDXs]").each(function(index){
		   	if($(this).val() != ""){
    			myArray = $(this).val().split('^');
		   		obj = new Object();
		   		obj.PRD_OPT_NM 				= myArray[0];	//옵션명
		   		obj.OPT_DTL_IDX 			= myArray[1];		//옵션 상세 IDX
		   		obj.OPT_DTL_NM 				= myArray[2];	//옵션 상세명
		   		obj.EMS_PRD_CNT 			= $("input[id=EMS_PRD_CNTs]").eq(index).val();	//옵션 상세에 대한 수량
		   		obj.LIST_NUM				= $("#optSearchTextNum").val();	//상품상세의 옵션선택 idx
		   		obj.PRD_MST_CD				= $("#PRD_MST_CD").val();	//상품코드
		   		obj.OPT_DTL_ADD_PRC 		= myArray[3];	//옵션 추가가격
		   		obj.PRD_OPT_EST_YN 			= myArray[4];	//필수 옵션 여부
		   		obj.OPT_DTL_STK_CNT 		= myArray[5];	//옵션 수량
		   		
		   		params.push(obj); //만들어진  object를 배열에 추가
		   	}
    	});
	   		
    	window.opener.fnResultProductOption(params);  	
    	self.close();
	});
 	
});
//]]>
</script>
</body>
</html>
