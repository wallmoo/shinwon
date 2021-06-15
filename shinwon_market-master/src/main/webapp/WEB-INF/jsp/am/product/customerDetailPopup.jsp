<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">거래처 정보 수정</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		<div class="title-box">
			<h4 class="title">기본정보</h4>
		</div>
		<form id="frm" name="frm">
		<div class="table-a">
			<!-- col list -->
			<input type="hidden" class="hidden" name="CTM_MST_CD" id="CTM_MST_CD" value="<c:out value="${StockInfo.IBVEND }" />" />
			<table class="core tdleft">
				<colgroup>
					<col style="width: 15%;" />
					<col style="width: 35%;" />
					<col style="width: 15%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody id="erpProductInfo">
					<tr>
						<th><span>거래처 코드 </span></th>
						<td><c:out value="${StockInfo.IBVEND }" /></td>
						<th><span>거래처명</span></th>
						<td><input type="text" class="text" name="ABALPH" id="ABALPH" value="<c:out value="${StockInfo.ABALPH }" />" /></td>
					</tr>
					<tr>
						<th><span>담당자명</span></th>
						<td><input type="text" class="text" name="ACT_DTL_MNG_NM" id="ACT_DTL_MNG_NM" value="<c:out value="${StockInfo.ACT_DTL_MNG_NM }" />" /></td>
						<th><span>배송정보</span></th>
						<td><input type="text" class="text" name="ACT_DTL_DLV" id="ACT_DTL_DLV" value="<c:out value="${StockInfo.ACT_DTL_DLV }" />" /></td>
					</tr>
					<tr>
					
						<th><span>전화번호 </span></th>
						<td><input type="text" class="text" name="ACT_DTL_TEL" id="ACT_DTL_TEL" value="<c:out value="${StockInfo.ACT_DTL_TEL }" />" /></td>
						<th><span>핸드폰 </span></th>
						<td><input type="text" class="text" name="ACT_DTL_HP" id="ACT_DTL_HP" value="<c:out value="${StockInfo.ACT_DTL_HP }" />" /></td>
					</tr>
					<tr>
						<th><span>팩스 </span></th>
						<td><input type="text" class="text" name="ACT_DTL_FAX" id="ACT_DTL_FAX" value="<c:out value="${StockInfo.ACT_DTL_FAX }" />" /></td>
						<th><span>이메일 </span></th>
						<td><input type="text" class="text" name="ACT_DTL_MAIL" id="ACT_DTL_MAIL" value="<c:out value="${StockInfo.ACT_DTL_MAIL }" />" /></td>
					</tr>
					<tr>
						<th><span>비고</span></th>
						<td colspan=3><textarea name="ACT_DTL_ADD" id="ACT_DTL_ADD" class="textarea"><c:out value="${StockInfo.ACT_DTL_ADD }" /></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		<div class="section-button-popup"><!-- section button -->
			<a href="#none" class="button button-b" id="goRegist" ><span>수정</span></a>
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->



<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
 	
 	// 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
    	var $frm = $("#frm"); 
    	
    	if($("#ABALPH").val() == ""){
    		alert("거래처명을 입력해 주세요.");
    		return;
    	}
    	
    	if (confirm( "수정 하시겠습니까?")) 
        {
    		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/customerDetailModifyPopup.do", "target":"_self", "method":"post"}).submit();
        }
    });
 	
 	
});
</script>
</body>
</html>
