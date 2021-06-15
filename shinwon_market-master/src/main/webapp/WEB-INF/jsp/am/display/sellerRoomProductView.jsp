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
				
				<table class="table-row table-a">
					<colgroup>
						<col style="width:10%;">
						<col style="width:90%;">
					</colgroup>
					<tbody>
						<tr><!-- row -->
							<th><span>구분</span></th>
							<td>
								<input type="radio" id="stateB" onclick="search();" name="searchGubun" class="radio" <c:if test="${empty commandMap.seachGubun or commandMap.searchGubun eq 'P' }">checked="checked"</c:if> value="P"/>
								<label for="stateB">PC</label>
								<input type="radio" id="stateC" onclick="search();" name="searchGubun" class="radio" <c:if test="${commandMap.searchGubun eq 'M' }">checked="checked"</c:if> value="M"/>
								<label for="stateC">MOBILE</label>
							</td>
						</tr>
					</tbody>
				</table>
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="searchGubun" id="searchGubun" value="<c:out value="${searchGubun}" />" />
					<input type="hidden" name="BND_MST_LAY_TPY" id="BND_MST_LAY_TPY" value="<c:out value="${layoutInfo.BND_MST_LAY_TPY}" />" />
				</form>				
				
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

	// 카테고리 구분 pc, mobile
	var USER_ENV_TYPE = "<c:out value="${commandMap.seachGubun}" />";
	
	if(USER_ENV_TYPE == ""){
		USER_ENV_TYPE = "<c:out value="${Code.USER_ENV_TYPE_PC}" />";
	}
	
	
	search = function(){
		var $searchForm = $("#searchForm");
		$("input[name=searchGubun]", $searchForm).val($("input[name=searchGubun]:checked").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/sellerRoomProductView.do", "target":"_self", "method":"post"}).submit(); 
	};	
	
	
	// 상품 카테고리 조회
	sellerBannerCategoryList(USER_ENV_TYPE);
	
	$(document).on("click", ".folder[data-level='3']", function(){
		var idx = $(this).data("idx");
		
		//alert('클릭!' +idx );
		reqProductDisplayList(idx);
	});	
	
	function reqProductDisplayList(CMN_COM_IDX){
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : '<c:out value="${serverDomain}"/>/am/display/sellerRoomProductDisplayList.do',
			data : {
				   'CMN_COM_IDX' : CMN_COM_IDX,
				   'BND_MST_LAY_TPY' : $('#BND_MST_LAY_TPY').val(),
				   'searchGubun' : $('input[name=searchGubun]:checked').val()
				   },  
			    success : function(data){
				console.log(data);
				$('#main_con').html(data);  
			}
		});
	}	

		
	function sellerBannerCategoryList(USER_ENV_TYPE){
		$.postSyncJsonAjax("/am/display/sellerRoomProdAjax.do", { searchGubun : USER_ENV_TYPE }, function(data){
			$("#browser").html(data.bannerList);
			$("#browser").treeview({
				toggle: function(){
					//console.log("%s was toggled.", $(this).find(">span").text());
				}
			});
			
			if($("input[name=searchGubun]:checked").val() == "M"){
				$('#browser').find('[data-idx=3614]').parent().addClass('hide');
			} else {
				$('#browser').find('[data-idx=3614]').parent().removeClass('hide');
			};
			
		});
	}
	
	
	
   
});



//-->
</script>

</body>
</html>
