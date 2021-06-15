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

				<h2 class="title"><span>전시상품관리</span></h2>

				<h3 class="title"><span>목록</span></h3>
				
				
				<!-- https://github.com/jzaefferer/jquery-treeview -->
				<!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->
				<!-- .tree_side_layout -->
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
				<!-- // .tree_side_layout -->

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
$(function() {

	// 카테고리 구분 pc, mobile
	var PRD_CTG_ENV = "<c:out value="${commandMap.PRD_CTG_ENV}" />";
	
   /*  if(PRD_CTG_ENV == ""){
		PRD_CTG_ENV = "<c:out value="${Code.CATEGORY_TYPE_PC}" />";
	} */
	
	if("<c:out value="${commandMap.CMN_COM_IDX}"/>" != "" ){
		categoryProductList(PRD_CTG_ENV);
		 var idx = $(this).data("idx");
	}
		
	
	search = function(){
		var $searchForm = $("#searchForm"); 
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/productDisplayView.do", "target":"_self", "method":"post"}).submit(); 
	};
	
	// 상품 카테고리 조회
	categoryProductList(PRD_CTG_ENV);
	$(document).on("click", ".folder", function(){
		var idx = $(this).data("idx");
		var level = $(this).data("level");
		var url;
		var data;
		
		if(level == 1){
			url = '<c:out value="${serverDomain}"/>/am/display/productDisplayCatTabList.do';
		}else{
			url = '<c:out value="${serverDomain}"/>/am/display/productDisplayList.do';	
		}
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : url,
			data : {
				"CMN_COM_IDX" : idx,
				"PRD_CTG_IDX" : idx
				   },  
			success : function(data){
				/* if(data.resultCode != "200"){
					alert("실패했습니다"); 
					return;
				} */
				$('#main_con').html(data);  
			}
		});
		
	});
});
function categoryProductList(PRD_CTG_ENV){
	$.postSyncJsonAjax("/am/product/categoryProductAjax.do", { PRD_CTG_ENV : 'P' }, function(data){
		$("#browser").html(data.categoryList);
		$("#browser").treeview({
			toggle: function(){
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
		
		// 2depth 이하 카테고리 제거함
		$('#browser').find('[data-level=2]').next().remove();
	});
}
//-->
</script>

</body>
</html>
