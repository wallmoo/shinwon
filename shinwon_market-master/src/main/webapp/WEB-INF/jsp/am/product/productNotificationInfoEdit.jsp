<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form id="frm" name="frm" method="post" >
	<input type="hidden" id="WRITE_MODE"    name="WRITE_MODE"    value="${commandMap.WRITE_MODE}" />
	<input type="hidden" id="PRD_NFI_IDX" name="PRD_NFI_IDX" value="${commandMap.PRD_NFI_IDX}" />
	
	<div class="section-title" style="margin: 0 0 20px;"><!-- section-title -->
		<h3 class="title"><span>품목정보 (<i class="require"><em>필수입력</em></i> 필수항목)</span></h3>
	</div><!-- // section-title -->

	<c:choose>
		<c:when test="${commandMap.WRITE_MODE eq 'D'}">
			<table class="core">
				<colgroup>
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<td style="height:100px;">왼쪽 품목명을 클릭하시면 상세내용을 확인하실 수 있습니다.</td>
					</tr>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<table cellspacing="0" class="table-row table-a"><!-- table -->
				<colgroup>
					<col style="width: 15%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th><span>품목명 <i class="require"><em>필수입력</em></i></span></th>
						<td><input type="text" name="PRD_NFI_NM" id="PRD_NFI_NM" class="text small" value="<c:out value='${row.PRD_NFI_NM }' />" maxlength="100"/></td>
					</tr>
					<tr>
						<th><span>품목 사용여부</span></th>
						<td>
							<div class="tbl_line">
								<input type="radio" class="radio" name="PRD_NFI_USE_YN" id="PRD_NFI_USE_YN1" value="Y" <c:if test="${row.PRD_NFI_USE_YN eq 'Y' || commandMap.WRITE_MODE eq 'W' }">checked=true</c:if> />
								<label for="PRD_NFI_USE_YN1">사용</label>
								<input type="radio" class="radio" name="PRD_NFI_USE_YN" id="PRD_NFI_USE_YN2" value="N" <c:if test="${row.PRD_NFI_USE_YN eq 'N' }">checked=true</c:if> />
								<label for="PRD_NFI_USE_YN2">미사용</label>
							</div>
							<div class="tbl_line">
								<span>※ 미사용으로 체크하면 상품관리에서 표시되지 않습니다.</span>
							</div>
						</td>
					</tr>
					<c:choose>
						<c:when test="${commandMap.WRITE_MODE eq 'M' }">
							<c:set var="num" value="1" />
							<c:choose>
								<c:when test="${not empty rowSub}">
									<c:forEach var="rowSub" items="${rowSub}" varStatus="status">
										<tr>
											<th><span>카테고리<c:out value="${num}" /></span></th>
											<td>
												<select name="PRD_NFI_INFO_YN" id="PRD_NFI_INFO_YN_<c:out value="${num}" />" class="select" onchange="setProductItem('<c:out value="${num}" />');">
													<c:choose>
														<c:when test="${not empty codeList}">
															<option value="N">직접입력</option>
															<c:forEach var="gubun" items="${codeList}" varStatus="status">
																<option value="<c:out value="${gubun.CMN_COM_IDX}" />" <c:if test="${rowSub.PRD_NFI_INFO_CODE eq gubun.CMN_COM_IDX }" >selected=selected</c:if> ><c:out value="${gubun.CMN_COM_NM}" /></option>
															</c:forEach>
														</c:when>
													</c:choose>
												</select>
												<input type="text" name="PRD_NFI_INFO" id="PRD_NFI_INFO_<c:out value="${num}" />" class="text small" maxlength="100" value="<c:out value='${rowSub.PRD_NFI_INFO }' />" <c:if test="${rowSub.PRD_NFI_INFO_YN eq 'Y'}">disabled=true</c:if> />
												<input type="hidden" name="PRD_NFI_INFO_CODE" id="PRD_NFI_INFO_CODE_<c:out value="${num}" />" value="<c:out value='${rowSub.PRD_NFI_INFO_CODE }' />" />
												<span id="PRD_NFI_AUTO_TXT_<c:out value="${num}" />"><c:if test="${rowSub.PRD_NFI_INFO_YN eq 'Y'}">[자동입력 항목]</c:if></span>
												<input type="text" name="PRD_NFI_INFO_EXE" id="PRD_NFI_INFO_EXE_<c:out value="${i}" />" value="<c:out value='${rowSub.PRD_NFI_INFO_EXE }' />" class="text" maxlength="100" style="width:40%"  /> [항목 예시]
											</td>
										</tr>
										<c:set var="num" value="${num + 1 }" />
									</c:forEach>
								</c:when>
							</c:choose>
							<c:forEach var="i" begin="${num}" end="14" step="1">
								<tr>
									<th><span>카테고리<c:out value="${i}" /></span></th>
									<td>
										<select name="PRD_NFI_INFO_YN" id="PRD_NFI_INFO_YN_<c:out value="${i}" />" class="select" onchange="setProductItem('<c:out value="${i}" />');">
											<c:choose>
												<c:when test="${not empty codeList}">
													<option value="N">직접입력</option>
													<c:forEach var="gubun" items="${codeList}" varStatus="status">
														<option value="<c:out value="${gubun.CMN_COM_IDX}" />"><c:out value="${gubun.CMN_COM_NM}" /></option>
													</c:forEach>
												</c:when>
											</c:choose>
										</select>
										<input type="text" name="PRD_NFI_INFO" id="PRD_NFI_INFO_<c:out value="${i}" />" class="text small" maxlength="100"  />
										<input type="hidden" name="PRD_NFI_INFO_CODE" id="PRD_NFI_INFO_CODE_<c:out value="${i}" />" />
										<span id="PRD_NFI_AUTO_TXT_<c:out value="${i}" />"></span>
										<input type="text" name="PRD_NFI_INFO_EXE" id="PRD_NFI_INFO_EXE_<c:out value="${i}" />" class="text" maxlength="100" style="width:40%"  /> [항목 예시]
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="1" end="14" step="1">
								<tr>
									<th><span>카테고리<c:out value="${i}" /></span></th>
									<td>
										<select name="PRD_NFI_INFO_YN" id="PRD_NFI_INFO_YN_<c:out value="${i}" />" class="select" onchange="setProductItem('<c:out value="${i}" />');">
											<c:choose>
												<c:when test="${not empty codeList}">
													<option value="N">직접입력</option>
													<c:forEach var="gubun" items="${codeList}" varStatus="status">
														<option value="<c:out value="${gubun.CMN_COM_IDX}" />"><c:out value="${gubun.CMN_COM_NM}" /></option>
													</c:forEach>
												</c:when>
											</c:choose>
										</select>
										<input type="text" name="PRD_NFI_INFO" id="PRD_NFI_INFO_<c:out value="${i}" />" class="text small" maxlength="100"  />
										<input type="hidden" name="PRD_NFI_INFO_CODE" id="PRD_NFI_INFO_CODE_<c:out value="${i}" />" />
										<span id="PRD_NFI_AUTO_TXT_<c:out value="${i}" />"></span>
										<input type="text" name="PRD_NFI_INFO_EXE" id="PRD_NFI_INFO_EXE_<c:out value="${i}" />" class="text" maxlength="100" style="width:40%"  /> [항목 예시]
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table><!-- // table -->
		</c:otherwise>
	</c:choose>
	<c:if test="${commandMap.WRITE_MODE ne 'D' }">
		<div class="text-right">
			<a href="javascript:goProc();" class="button small primary"><span>저장</span></a>	    
		</div>	
	</c:if>
</form>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	// 폼체크
	$("#frm").validate({
		rules: {
			PRD_NFI_NM:{required:true} // 품목명
		}
	});
	
	//상품고시 자동입력
	setProductItem = function(idx){

		var codeKey = "";
		var codeNm = "";
		var productNmId = eval($("#PRD_NFI_INFO_"+idx));
		var productNmCode = eval($("#PRD_NFI_INFO_CODE_"+idx));
		var productSelect = eval($("#PRD_NFI_INFO_YN_"+idx));
		var productAutoTxt = eval($("#PRD_NFI_AUTO_TXT_"+idx));
		var selectCode = false;
	
		$("select[name=PRD_NFI_INFO_YN]").each(function(index,item){
			if((idx -1) == index){
				codeKey = $(this).val();
				codeNm = $(this).children("option:selected").text();
			}
		});
		
		$("input[name=PRD_NFI_INFO_CODE]").each(function(){
			if($(this).val() != ""){
				if($(this).val() == codeKey){
					selectCode = true;
				}
			}
		});

		if(!selectCode){
			if(codeKey != "N"){
				productNmId.val(codeNm);
				productNmCode.val(codeKey);
				productNmId.attr("disabled",true);
				productAutoTxt.html("[자동입력 항목]");
			}else{
				productNmId.val("");
				productNmCode.val("");
				productNmId.attr("disabled",false);
				productAutoTxt.html("");
			}
		}else{
			alert(codeNm+"항목은 이미 추가 되있습니다.");
			productSelect.children("option:eq(0)").attr("selected", "selected");
			productNmId.val("");
			productNmCode.val("");
			productNmId.attr("disabled",false);
			productAutoTxt.html("");
			return;
		}
	};

	
	// 등록 버튼 클릭 이벤트
	goProc = function () {
		var $frm = $("#frm"); 
		var writeMode = $("#WRITE_MODE").val();
		
		if($frm.valid()){
			
			//항목명 등록 전 텍스트박스 활성화
			$("input[name=PRD_NFI_INFO]").each(function(){
				if($(this).attr("disabled")){
					$(this).attr("disabled",false);
				}
			});
			if (confirm( "저장 하시겠습니까?"))
			{
				if(writeMode == "W"){
					$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productNotificationInfoRegist.do", "target":"_self", "method":"post"}).submit();
				}else{
					$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productNotificationInfoModify.do", "target":"_self", "method":"post"}).submit();
				}
			}
		}
	};
});
//-->
</script>

