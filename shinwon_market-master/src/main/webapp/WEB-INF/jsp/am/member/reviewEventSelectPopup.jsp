<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<script src="<c:out value="${serverDomain}" />/am/js/admin/common.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

     <input type="hidden" id="id_caller" name="id_caller" value="<c:out value="${commandMap.caller }"/>" />
     <input type="hidden" id="id_EXP_MST_CD" name="id_EXP_MST_CD" value="<c:out value="${commandMap.searchExpMstCd }"/>" />

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title">
					<span>리뷰이벤트 선택</span>
				</h2>

				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 15%;">
						<col style="width: auto;">
						</colgroup>
					<tbody>
						<tr>
							<th><span>리뷰이벤트</span></th>
							<td>
								<select class="select xlarge" id="selReview">
									<option value='' >선택</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="grid section-button-search"><!-- section button -->
					<button type="button" id="productApply" class="button small primary"><span>선택</span></button>
					<button type="button" id="closePopup" class="button small" onclick="self.close()"><span>취소</span></button>
				</div>


			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->
	
	

<!--   <script src="<c:out value="${serverDomain}" />/am/js/admin.js"></script> -->
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>

<script>

window.onload = function () {
	  opener.popupEvt = this;  
}

$(function(){
	

	// 선택 클릭 이벤트
	$(document).on("click", "#productApply", function () 
	{
		
		var caller = $('#id_caller').val();
		var varSelReview = $('#selReview').val() ;

		
		if (  varSelReview == '' ) {
			alert("리뷰 이벤트를 선택하여 주십시오.");
			return;
		}else {
			
			var ReviewArray  = varSelReview.split('^^');
			
			if ( ReviewArray.length == 4) {

				console.log ( 'EXP_MST_CD ' + ReviewArray[0] );
				console.log ( 'PRD_MST_CD ' + ReviewArray[1] );
				console.log ( 'PRD_MST_NM ' + ReviewArray[2] );
				console.log ( 'EXP_MST_NM ' + ReviewArray[3] );
				
				var obj = new Object(); 
				obj.EXP_MST_CD = ReviewArray[0];
				obj.PRD_MST_CD = ReviewArray[1];
				obj.PRD_MST_NM = ReviewArray[2];
				obj.EXP_MST_NM = ReviewArray[3];
				
				window.opener.fnResultReviewEvent(obj,caller);   	
				self.close();				
				
			}
			
		}

	});
	
	
	alertMsg = function (msg){
		alert(msg);
	}
		
});

$(document).ready(function () {
	var targetSelectId = 'selReview';
	var selExpMstCd = $('#id_EXP_MST_CD').val();

	$.ajax({
		type:"post",
		url : "<c:out value="${serverDomain}" />/am/member/getreviewEventListAjax.do",
		//data : {"MEM_MST_MEM_GBN": memberType},
		dataType : "json",
		async : false,
		success : function(data){
			var selectedIdx = "${commandMap.searchMemGrade}";
			$("#"+targetSelectId).html("<option value=\"\">전체</option>");
			if(data.reviewEventList.length > 0){
				$.each(data.reviewEventList, function(idx, item){
					var selected = item.EXP_MST_CD == selExpMstCd ? "selected" : ""; //기존 선택된 회원구분이 있는 경우 selected
					//var selected = '' ;
					var objvalue = item.EXP_MST_CD + '^^' + item.PRD_MST_CD + '^^' +item.PRD_MST_NM + '^^' +item.EXP_MST_NM ;
					
					$("#"+targetSelectId).append("<option value=\""+ objvalue +"\" "+ selected +">"+ item.EXP_MST_NM +"</option>");					

				});
			}
		},
		error : function(err){
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
		}
	});
    
    
	    
});




</script>
</body>
</html>
