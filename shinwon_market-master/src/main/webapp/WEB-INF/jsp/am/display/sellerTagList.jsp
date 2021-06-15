<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
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

				<h2 class="title"><span>전시태그관리</span></h2>
				<h3 class="title"><span>목록</span></h3>
				
				<div class="tree_side_layout">
					<!-- .tree_wrap -->
					<div class="tree_wrap cf">
						<ul id="browser" class="filetree treeview-famfamfam">
						</ul>
						<div id="main_con">
						</div>
					</div>
					<!-- // .tree_wrap -->
				</div>
				
			</div><!-- // container -->

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

<script src="/am/js/plugins/jquery.cookie.js"></script> <!-- treeview -->
<script src="/am/js/plugins/jquery.treeview.js"></script> <!-- treeview -->
<script src="/am/js/common/jquery.ajax.js"></script>
<script>
$(document).ready(function () {

	var CMN_COM_IDX = "<c:out value="${commandMap.CMN_COM_IDX}"/>";
	var listIdx = "<c:out value="${commandMap.SUB_CMN_COM_IDX}"/>";
	renderCategoryList(CMN_COM_IDX);
	
	function renderCategoryList(CMN_COM_IDX){
		$.postSyncJsonAjax("/am/display/sellerTagCategoryAjax.do", { CMN_COM_IDX : CMN_COM_IDX }, function(data){
			$("#browser").html(data.tagCategoryList);
			
			reqTagDisplayList();
			
			$("#browser").treeview({
				toggle: function(){
					console.log("%s was toggled.", $(this).find(">span").text());
				}
			});
		});
	};
	
	reqTagDisplayList(listIdx);
	function reqTagDisplayList(idx){
		if(idx == null || idx ==""){
			return;
		}
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : '<c:out value="${serverDomain}"/>/am/display/sellerTagDisplayList.do',
			data : {
				   'CMN_COM_IDX' : idx
				   },  
			success : function(data){
				$('#main_con').html(data);  
			}
		});
	}
	
	$(document).on("click", ".folder", function(){
		if($(this).data("level") < 3){
			return;
		};
		var idx = $(this).data("idx");
		reqTagDisplayList(idx);
	});
   
});



//-->
</script>

</body>
</html>
