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

				<h3 class="title"><span>태그설정</span></h3>

					<!-- 탭부분 -->
					<p>
					   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
					</p>
					<form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
							<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
					</form>
					<form name="frm" id="frm" enctype="multipart/form-data">
					<div class="section-form"><!-- section-form-a -->
						<input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />
						<table cellspacing="0" class="table-row table-a"><!-- table -->
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th><label class="label">태그그룹<i class="require"><em>필수입력</em></i></label></th>
									<td>
										<select class="select xlarge" id="GrpName" onchange="addTagList()">
											<option value="" selected="selected">선택</option>
												<c:forEach var="row" items="${TAG_GROUP_LIST }" varStatus="i">
													<option value="<c:out value="${row.TAG_GRP_TITLE }"/>">
														<c:out value="${row.TAG_GRP_TITLE }"/>
													</option>
												</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th><label class="label">태그 그룹 설명</label></th>
									<td id="TagGrpDesc">태그 그룹을 선택해 주세요.</td>
								</tr>
								<tr>
									<th><span>등록태그 <em id="sel_tag_num">(104)</em><i class="require"><em>필수입력</em></i></span></th>
									<td>
										<div class="tag_cloud_wrap">
											<p class="info_txt">태그 그룹을 선택해 주세요.</p>
											<ul class="tag_cloud_list">
												
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table><!-- // table -->
					</div>
					</form>

					<div class="section-button-popup text-center"><!-- section button -->
						<a href="#none" onclick="submitTag()" class="button button-b primary"><span>선택</span></a>
						<a href="#none" onclick="self.close()" id="closePopup" class="button button-b"><span>취소</span></a>
					</div>

			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->
	<jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>
	<input type="hidden" id="tagGrpListData" value='${JsonUtil.getJsonArrayFromList(TAG_GROUP_LIST)}'>
	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		var tagGrpListData = JSON.parse($('#tagGrpListData').val());
		var tagList = new Array();
		function addTagList(){
			$('.tag_cloud_wrap .info_txt').remove();
			
			tagList = new Array();
			$(".btn_del").parent().remove();
			var selectedGroup = $("#GrpName option:selected").val();
			if(selectedGroup==""){
				$("#TagGrpDesc").text('태그 그룹을 선택해 주세요.');
				$(".tag_cloud_wrap").html('<p class="info_txt">태그 그룹을 선택해 주세요.</p><ul class="tag_cloud_list"></ul>');
				return;
			}
			for(var i=0;i<tagGrpListData.length;i++){
				if(tagGrpListData[i].TAG_GRP_TITLE==selectedGroup){
					$("#TagGrpDesc").text(tagGrpListData[i].TAG_GRP_DES)
					for(var j=0;j<tagGrpListData[i].TAG_LIST.length;j++){
						var map = {TAG_MST_ID:tagGrpListData[i].TAG_LIST[j].TAG_MST_ID, value:tagGrpListData[i].TAG_LIST[j].TAG_MST_TITLE}
						$(".tag_cloud_list").append('<li><span class="txt">' + tagGrpListData[i].TAG_LIST[j].TAG_MST_TITLE +'</span>\n<button type="button" class="btn_del">X</button></li>');
						tagList.push(map);
					}
					break;
				}
				
			} 
			$('#sel_tag_num').html("("+$(".tag_cloud_list li").length+")");
		}
		
		 $(document).on("click", ".btn_del", function() {
			for(var i=0;i<tagList.length;i++){
				if(tagList[i].value==$(this).parent().children('span').text()){
					tagList.splice(i,1);
					break;
				}
			}
			$(this).parent().remove();
			$('#sel_tag_num').html("("+$(".tag_cloud_list li").length+")");
		 });
		 
		 function submitTag(){
			if(tagList.length<=0){
				alert('선택된 태그가 없습니다');
				return;
			}
			window.opener.fnResultTag(tagList);   	
			self.close();
		 }
		 
		 
	</script>
</body>
</html>
