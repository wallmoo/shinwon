<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->
			
			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title">
					<span>태그일괄수정</span>
				</h2>
				
				<table class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width:15%;">
						<col style="width:85%;">
					</colgroup>
					<tbody>
						<tr><!-- row -->
							<th><span>태그 그룹명 <i class="require"><em>필수입력</em></i></span></th>
							<td>
								<select class="select" id="GrpName" onchange="addTagList()" >
									<option>선택</option>
									<c:forEach var="row" items="${TAG_GROUP_LIST }" varStatus="i">
									<option value="<c:out value="${row.TAG_GRP_TITLE }"/>">
										<c:out value="${row.TAG_GRP_TITLE }"/>
									</option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>태그 그룹 설명</span></th>
							<td>
								<span id="TagGrpDesc">태그 그룹을 선택해 주세요.</span>
							</td>
						</tr>
						<tr>
							<th><span>일반 태그<i class="require"><em>필수입력</em></i> <br /><span id="sel_tag_count">(0)</span></span></th>
							<td>
								<span class="info_txt">태그 그룹을 선택해 주세요.</span>
								<ul class="tag_list">	
										
								</ul>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>대표태그<i class="require"><em>필수입력</em></i></span></th>
							<td>
								<select class="select" id="representTag">
									<option>선택</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->
				<form id="frm" name="frm">
					<div class="section-button">
						<div class="wrap text-center">
							<a href="javascript:;" id="closePopup" class="button"><span>취소</span></a>
							<a href="javascript:;" id="goRegist" class="button primary"><span>선택</span></a>
						</div>
					</div>
				</form>
			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->
<jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>
	<input type="hidden" id="tagGrpListData" value='${JsonUtil.getJsonArrayFromList(TAG_GROUP_LIST)}'>
<%-- 	<input type="hidden" id="PRD_MST_CD" value='${JsonUtil.getJsonArrayFromList(commandMap.productData)}'> --%>
	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		//<![CDATA[
			
			var selectedProductList;
			var tagGrpListData = JSON.parse($('#tagGrpListData').val());
			var tagList = new Array();
			$(document).ready(function(){
				selectedProductList = window.opener.getSelectedProductList();
			})
			function addTagList(){
				$('.info_txt').remove();
				tagList = new Array();
				$(".btn_del").parent().remove();
				for(var i=0;tagGrpListData.length;i++){
					if(tagGrpListData[i].TAG_GRP_TITLE==$("#GrpName option:selected").val()){
						$("#TagGrpDesc").text(tagGrpListData[i].TAG_GRP_DES);
						$("#representTag").find("option").remove();
						for(var j=0;j<tagGrpListData[i].TAG_LIST.length;j++){
							var map = {TAG_MST_ID:tagGrpListData[i].TAG_LIST[j].TAG_MST_ID, value:tagGrpListData[i].TAG_LIST[j].TAG_MST_TITLE}
							$(".tag_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + tagGrpListData[i].TAG_LIST[j].TAG_MST_ID +'">'+ tagGrpListData[i].TAG_LIST[j].TAG_MST_TITLE +'<button type="button" class="btn_del">X</button></li>');
							
							$("#representTag").append('<option value="' + tagGrpListData[i].TAG_LIST[j].TAG_MST_ID + '">' + tagGrpListData[i].TAG_LIST[j].TAG_MST_TITLE + '</option>')
							tagList.push(map);
						}
						break;
					}
				} 
				$('#sel_tag_count').html("("+$(".tag_list li").length+")");
			}
			 $(document).on("click", ".btn_del", function() {
				var value = $(this).parent().attr("value");
				$("#representTag option[value="+value+"]").remove();
				$(this).parent().remove();
				$('#sel_tag_count').html("("+$(".tag_list li").length+")");
			 });
			 
			 $("#closePopup").on("click",function(){
				 self.close();
			 })
			fnGetSelectedTagList = function(){
				var arrayObj = new Array();
				
				selectedProductList.each(function(){
					
					var PRD_MST_CD = $(this).parent().parent().find("input[name=PRD_MST_CDs]").val();
					$(".sel_tag_list").each(function(){
						var obj= new Object();
						obj.PRD_MST_CD = PRD_MST_CD;
						obj.TAG_MST_ID = $(this).attr("value");
						obj.TAG_BND_STATUS = "USE";
						if($("#representTag :selected").val() == obj.TAG_MST_ID)
							obj.TAG_BND_REP = "Y";
						else
							obj.TAG_BND_REP = "N";
						arrayObj.push(obj);
					});   
				})
				return JSON.stringify(arrayObj);
			};
			$("#goRegist").on("click",function(){
				window.opener.fnSelectTagPopupResult(fnGetSelectedTagList());
				self.close();
				//$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/product/tagBatchModify.do", "target" : "_self","method" : "post"}).submit(); 
			});
			
		//]]>
	</script>
</body>
</html>
