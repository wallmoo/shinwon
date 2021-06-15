<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
		<%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
	</div><!-- // aside -->
	
	 <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

        <div class="container">
        
        <h2 class="title"><span>배송/교환/반품정보 상세</span></h2>
					<h3 class="title"><span>배송/교환/반품정보</span></h3>
					<div class="grid section-button-search">
						<a href="#" id="addDlvRow" class="button small primary"><span>추가</span></a>
						<a href="#" id="delDlvRow"class="button small"><span>삭제</span></a>
					</div>
					
					<form id="searchForm">
	                  	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	               		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						<input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
	              		<input type="hidden" name="searchDLVStateUseYN" value="<c:out value="${commandMap.searchDLVStateUseYN }"/>"/>
              		</form>
              		
              		<form id="frm" name="frm">
              			<input type="hidden" name="DLV_INF_IDX" value="<c:out value="${DLV_INF_IDX }"/>" />
              			<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						<input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
	              		<input type="hidden" name="searchDLVStateUseYN" value="<c:out value="${commandMap.searchDLVStateUseYN }"/>"/>
	              		<input type="hidden" id="jsonData" name="jsonData" />
	              		
						<table class="table-col table-b">
							<colgroup>
								<col style="width:40px;">
								<col style="width:auto;">
								<col style="width:400px;">
								<col style="width:100px;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="" id="" class="checkbox"></th>
									<th>제목</th>
									<th>내용</th>
									<th>노출여부</th>
								</tr>
							</thead>
							<tbody id="dlvList">
								<c:choose>
									<c:when test="${not empty detailList }">
										<c:forEach var="item" items="${detailList }" varStatus="i">
											<tr>
												<td><input type="checkbox" name="checkbox" class="checkbox"></td>
												<td><input type="text" name="DLV_INF_DTL_TITLE" value="<c:out value="${item.DLV_INF_DTL_TITLE }"/>" class="text large" maxlength="20"></td>
												<td>
													<textarea id="DLV_INF_DTL_DESC" name="DLV_INF_DTL_DESC" class="textarea"><c:out value="${item.DLV_INF_DTL_DESC }"/></textarea>
												</td>
												<td>
													<select name="DLV_INF_DTL_DPL_YN" class="select">
														<option value="Y" <c:if test="${item.DLV_INF_DTL_DPL_YN eq 'Y'}">selected</c:if>>Y</option>
														<option value="N" <c:if test="${item.DLV_INF_DTL_DPL_YN eq 'N'}">selected</c:if>>N</option>
													</select>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									
									<c:otherwise>
										<tr>
											<td><input type="checkbox" name="checkbox" class="checkbox"></td>
											<td><input type="text" name="DLV_INF_DTL_TITLE" class="text large" maxlength="20"></td>
											<td><textarea id="DLV_INF_DTL_DESC" name="DLV_INF_DTL_DESC" class="textarea"></textarea></td>
											<td>
												<select name="DLV_INF_DTL_DPL_YN" class="select">
													<option value="Y">Y</option>
													<option value="N" selected>N</option>
												</select>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
							</tbody>
						</table>
					</form>
					
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="goModify" class="button primary"><span>저장</span></a>
							<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
								<a href="#none" id="goList" class="button primary"><span>목록</span></a>
							</c:if>
						</div>
					</div>
					</div>

        </div><!-- // contents -->
        

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="dlvTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" name="checkbox" class="checkbox"></td>
	<td><input type="text" name="DLV_INF_DTL_TITLE" class="text large" maxlength="20"></td>
	<td><textarea name="DLV_INF_DTL_DESC" id="DLV_INF_DTL_DESC" class="textarea"></textarea></td>
	<td>
	<select name="DLV_INF_DTL_DPL_YN" class="select">
		<option value="Y">Y</option>
		<option value="N" selected>N</option>
	</select>
	</td>
</tr>
</script>
<script>
$(function(){
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/deliveryStateList.do", "target":"_self", "method":"post"}).submit(); 
    });
	
	//row 추가이벤트
	$(document).on("click",	"#addDlvRow", function() {
		var $dlvBox = $("#dlvList");

        var arrayObj = new Array();
        var object = new Object();
        arrayObj.push(object);
        
        $("#dlvTemplate").tmpl(arrayObj).appendTo($("#dlvList"));
	});
	
	//row 삭제이벤트
	$(document).on("click",	"#delDlvRow", function() {
		if(confirm("선택한 항목을 삭제하겠습니까? ")){
			$('input[name=checkbox]:checked').each(function() {
	    		$(this).parent().parent().remove();
	    	});	
		}
	});
	
	$(document).on("click", "#goModify", function () {
		var $frm = $("#frm");
		var dblCheckCnt = 0;
		var dbl_N_Val = 0;
		
		//validation
		$('#dlvList tr').each(function(){
			if($(this).find("input[name=DLV_INF_DTL_TITLE]").val() == ""){
				alert("제목을 입력해주세요.");
				return;
			}
			if($(this).find("input[name=DLV_INF_DTL_DESC]").val() == ""){
				alert("내용을 입력해주세요.");
				return;
			}
			if($(this).find("select :selected").val() == "N"){
				dbl_N_Val++;
			}
			dblCheckCnt++;
		});
		
		if(dblCheckCnt == dbl_N_Val){
			alert("1개이상 노출여부 설정을 Y로 해주세요");
			return;
		}
			
		var data = new Array();
		$('#dlvList tr').each(function(){
			var obj = new Object();
			obj["DLV_INF_DTL_TITLE"] = $(this).find("input[name=DLV_INF_DTL_TITLE]").val();
			obj["DLV_INF_DTL_DESC"] = $(this).find("#DLV_INF_DTL_DESC").val();
			obj["DLV_INF_DTL_DPL_YN"] = $(this).find("select :selected").val();
			data.push(obj);
		});
		var jsonData = JSON.stringify(data);
		$("#jsonData").val(jsonData);
		if (confirm( "저장 하시겠습니까?")) {
        	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/deliveryStateModify.do", "target":"_self", "method":"post"}).submit();
        } 
	});
})
</script>