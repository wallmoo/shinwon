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

				<h2 class="title"><span>전시GNB관리</span></h2>

				<h3 class="title"><span>목록</span></h3>
				
				<!--table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>구분</span></th>
							<td>
								<input type="radio" id="stateB" onclick="gnbDisplayEnv('${Code.Gnb_TYPE_PC }');" name="searchGubun" class="radio" <c:if test="${empty commandMap.DSP_GNB_ENV or commandMap.DSP_GNB_ENV eq 'P' }">checked="checked"</c:if> value="P"/>
								<label for="stateB">PC</label>
								<input type="radio" id="stateC" onclick="gnbDisplayEnv('${Code.Gnb_TYPE_MOBILE }');" name="searchGubun" class="radio" <c:if test="${commandMap.DSP_GNB_ENV eq 'M' }">checked="checked"</c:if> value="M"/>
								<label for="stateC">MOBILE</label>
							</td>
						</tr>
					</tbody>
				</table-->
				<input type="hidden" name="DSP_GNB_ENV" id="DSP_GNB_ENV" value="${commandMap.DSP_GNB_ENV }" />
				<!-- https://github.com/jzaefferer/jquery-treeview -->
				<!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->
				<div>
					<a href="javascript:;" id="rootGnb" class="button"><span>GNB관리</span></a>
				</div>
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

<script src="/am/js/plugins/jquery.cookie.js"></script> <!-- treeview -->
<script src="/am/js/plugins/jquery.treeview.js"></script> <!-- treeview -->
<script src="/am/js/common/jquery.ajax.js"></script>

<script>
$(document).ready(function(){

	// GNB 구분 pc, mobile
	var DSP_GNB_ENV = "<c:out value="${commandMap.DSP_GNB_ENV}" />";
	
	if(DSP_GNB_ENV == ""){
		DSP_GNB_ENV = "<c:out value="${Code.Gnb_TYPE_PC}" />";
	}

	// 상품 GNB 조회
	gnbDisplayList(DSP_GNB_ENV);
	
	// 상품GNB 상세정보 노출 이벤트
	goForm = function(id){
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : '<c:out value="${serverDomain}"/>/am/display/gnbDisplayEdit.do',
			data : {
				   'DSP_GNB_IDX' : id
				   },
			success : function(data){
				$('#main_con').html(data);
			}
		});
	};
	
	// GNB 상세 저장 후 GNB 목록과 해당 페이지 유지
	var PRD_CTB_IDX = "<c:out value="${commandMap.DSP_GNB_IDX}"/>";
	if(PRD_CTB_IDX!=""){
		$(".folder").each(function () {
			if($(this).data("idx")==PRD_CTB_IDX){
				$(this).parents("ul").show();
				$(this).parents("li").children("div").removeClass("expandable-hitarea");
				$(this).parents("li").children("div").addClass("collapsable-hitarea");
				
				if($(this).closest("li").attr("class")!="closed last" && $(this).closest("li").attr("class")!="closed expandable"){
					$(this).parents("li").removeClass("expandable lastExpandable");
					$(this).parents("li").addClass("collapsable lastCollapsable");
					$(this).closest("li").removeClass("collapsable lastCollapsable");
					$(this).closest("li").addClass("expandable lastExpandable");
				}else if( $(this).closest("li").attr("class")=="closed expandable"){
					$(this).closest("li").children("div").removeClass("collapsable-hitarea");
					$(this).closest("li").children("div").addClass("expandable-hitarea");	
				}else{
					$(this).parents("li").removeClass("expandable lastExpandable");
					$(this).parents("li").addClass("collapsable lastCollapsable");
					$(this).closest("li").attr("class", "closed last");
				}
				goForm(PRD_CTB_IDX);
			}
		});
	}

	// GNB추가 버튼 상태 변경 이벤트, 5레벨은 수정안됨
	setButtonGnbRegist = function(level){     
		if( level==1 || level==2 || level==3){
			$("#GnbAdd").attr("class","button primary");
			$("#GnbAdd").attr("href","javascript:registPopup();");
		}
		else{
			$("#GnbAdd").attr("class","button");
			$("#GnbAdd").attr("href","javascript:alert('3레벨 이상 추가가 불가능합니다.');");
		}
	};
	
	// 상품GNB 등록 팝업창 호출
	registPopup = function(){
		popup('',"500","400","no","_registPopup");
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/gnbDisplayFormPopup.do", "target":"popup_registPopup", "method":"post"}).submit();
	};
	
	// rootGNB관리 생성 버튼 클릭 이벤트
	$(document).on("click", "#rootGnb", function () {
		$.ajax({
		   type : "POST",
		   async:true,
		   dataType :"html",
		   url : '<c:out value="${serverDomain}"/>/am/display/gnbDisplayRootEdit.do',
		   data : {
				   'DSP_GNB_IDX': -1,
				   'DSP_GNB_ENV': $("#DSP_GNB_ENV").val()
				  },
		   success : function(data){
			   $('#main_con').html(data);
		   }
	   });
	});  

	// PC / MOBILE 라디오박스 선택 변경 이벤트
	gnbDisplayEnv = function(env)
	{
		$("#DSP_GNB_ENV").val(env);
		
		gnbDisplayList(env); 
	};
	
	//상품GNB 저장 처리
	goRegist = function(params){
			$("#CHILD_CODENAME").val(params.CHILD_CODENAME);
			$("#DSP_GNB_LEVEL").val(params.DSP_GNB_LEVEL);
			$("#DSP_GNB_IDX").val(params.DSP_GNB_IDX);
			$("#DSP_GNB_TOP_IDX").val(params.DSP_GNB_TOP_IDX);
			$("#DSP_GNB_USE_YN").val("Y");
			$("#DSP_GNB_DSP_YN").val("Y"); 
			 
			$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/display/gnbDisplayRegist.do", "target":"_self", "method":"post"}).submit();
			
	 };
 
});
function gnbDisplayList(DSP_GNB_ENV){  
	$.postSyncJsonAjax("/am/display/gnbDisplayAjax.do", { DSP_GNB_ENV : DSP_GNB_ENV }, function(data){
		$("#browser").html(data.gnbList);
		  
		$("#browser").treeview({
			toggle: function(){
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
		
		$(".folder").on("click",function(){
			var $this = $(this);
			// GNB 버튼 상태 변경 이벤트 호출
			setButtonGnbRegist($(this).data("level"));
			// 상품GNB 상세정보 노출 이벤트
			goForm($this.data("idx"));
		});

	});
}
</script>

</body>
</html>
