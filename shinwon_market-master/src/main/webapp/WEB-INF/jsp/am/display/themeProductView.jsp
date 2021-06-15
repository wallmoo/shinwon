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

				<h2 class="title"><span>테마전시상품관리</span></h2>

				<h3 class="title"><span>목록</span></h3>
				
				<form id="searchForm" name="searchForm">
					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr><!-- row -->
								<th><span>구분</span></th>
								<td>
									<input type="radio" id="stateB" name="searchGubun" class="radio" <c:if test="${empty commandMap.seachGubun or commandMap.searchGubun eq 'P' }">checked="checked"</c:if> value="P"/>
									<label for="stateB">PC</label>
									<input type="radio" id="stateC" name="searchGubun" class="radio" <c:if test="${commandMap.searchGubun eq 'M' }">checked="checked"</c:if> value="M"/>
									<label for="stateC">MOBILE</label>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->
					<input type="hidden" name="PRD_CTG_ENV" id="PRD_CTG_ENV" value="<c:out value="${searchGubun}" />" />
				</form>
				<input type="hidden" id="CRT_IDX"/>
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
$(document).ready(function () {

	// 카테고리 구분 pc, mobile
	var PRD_CTG_ENV = "<c:out value="${commandMap.PRD_CTG_ENV}" />";
	var CMN_COM_IDX = "<c:out value="${commandMap.CMN_COM_IDX}"/>";
	
   /*  if(PRD_CTG_ENV == ""){
		PRD_CTG_ENV = "<c:out value="${Code.CATEGORY_TYPE_PC}" />";
	} */
	
	if("<c:out value="${commandMap.CMN_COM_IDX}"/>" != "" ){
		//goList("<c:out value="${commandMap.CMN_COM_IDX}"/>");
	}
		
	
	search = function(){
		var $searchForm = $("#searchForm"); 
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/themeProductView.do", "target":"_self", "method":"post"}).submit(); 
	};
	
	// 상품 카테고리 조회
	categoryProductList(CMN_COM_IDX);
   
	
	$(document).on("click", ".folder", function(){
		if($(this).data("level")<3){
			return;
		}
		var idx = $(this).data("idx");
		goList(idx);
		
	});
	
	$(document).on("change", ".radio", function(){
		
		if($("#CRT_IDX").val() == ""){
			return;
		}
		goList($("#CRT_IDX").val());
		
	});
   
});

function categoryProductList(CMN_COM_IDX){
	
	$.postSyncJsonAjax("/am/display/themeProductAjax.do", { PRODUCT_DISPLAY_ENV : CMN_COM_IDX }, function(data){
		$("#browser").html(data.themeProductList);
		$("#browser").treeview({
			toggle: function(){
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
	});
};

goList = function(idx){
	
	var searchGubun = $('input:radio[name=searchGubun]:checked').val();
	
	$.ajax({
		type : "POST",
		async:true,
		dataType :"html",
		url : '<c:out value="${serverDomain}"/>/am/display/themeProductList.do',
		data : {
			   'CMN_COM_IDX' : idx,
			   'DSP_MST_ENV' : searchGubun
			   },  
		success : function(data){
			$("#CRT_IDX").val(idx);
			$('#main_con').html(data);  
		}
	});
	
};



//-->
</script>

</body>
</html>
