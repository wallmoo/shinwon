<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
	<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
	<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
	<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta property="og:title" content="DINGDONG">
	<meta property="og:url" content="">
	<meta property="og:image" content="">
	<meta property="og:description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="content-language" content="kr">
	<meta http-equiv="imagetoolbar" content="no">
	<title>MarketPlant</title>
	<meta name="title" content="MarketPlant">
	<meta name="description" content="MarketPlant">
	<meta name="copyright" content="MarketPlant">
	<link rel="author" href="http://epasscni.com">
	<link rel="publisher" href="http://epasscni.com">
	<link rel="apple-touch-icon" href="/am/img/apple-touch-icon.png">
	<link rel="stylesheet" href="/am/css/normalize-3.0.2.css">
	<link rel="stylesheet" href="/am/css/fontium.css">
	<!--<link rel="stylesheet" href="/am/css/epass.base-0.1.css" />-->
	<link rel="stylesheet" href="/am/css/style.css"><!-- less compiled css -->
	<link rel="stylesheet" href="/am/css/neo.css">
	<script>document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/,'js');</script>
	<script src="/am/js/vendor/modernizr.custom.2.8.3.min.js"></script>
	<!--[if (gte IE 6)&(lte IE 8)]><script src="/am/js/vendor/jquery-1.11.2.min.js"></script><![endif]-->
	<!--[if (gt IE 8)|!(IE)]><!--> <script src="/am/js/vendor/jquery-2.1.3.min.js"></script><!--<![endif]-->
	<script>window.jQuery || document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"><\/script>')</script>
	</head>
   <body class="page-popup">

	   <div class="modal"><!-- modal -->

		   <div class="modal-wrapper"><!-- modal-wrapper -->

			   <div class="modal-inner"><!-- modal-inner -->

			   <h2 class="title"><span>???????????????</span></h2>

				   <!-- ????????? -->

				   <h3 class="title"><span>??????</span></h3>

				   <form id="searchForm" name="searchForm" method="post" action="/am/member/affiliateListPopup.do">
					   <input type="hidden" name="pageSize" value="" />
					   <input type="hidden" name="COC_SEARCH_TYPE" value="NAME">
					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
						   <colgroup>
							   <col style="width: 10%;" />
							   <col style="width: auto;" />
						   </colgroup>
						   <tbody>
							   <tr>
								   <th><span>????????????</span></th>
								   <td>
								   	   <input type="hidden" name="searchCocMstSearchType" value="NAME" t="NAME" v="${commandMap.searchCocMstSearchType}"/>
									   <input type="text" name="searchCocMstTitle" value="${commandMap.searchCocMstTitle }" class="text" placeholder="????????? ??????">
								   </td>
							   </tr>
							   <tr>
								   <th><span>?????????</span></th>
								   <td>
									   <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>????????????</em></span></a>
									   <input type="text" class="text" name="searchCocMstStDt" id="searchCocMstStDt" value="<c:out value ="${commandMap.searchCocMstStDt }"/>" readonly="readonly" data-target-end="searchCocMstEdDt"> ~
									   <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>????????????</em></span></a>
									   <input type="text" class="text" name="searchCocMstEdDt" id="searchCocMstEdDt" value="<c:out value="${commandMap.searchCocMstEdDt }"/>" readonly="readonly" data-target-start="searchCocMstStDt">
									   <a href="javascript:fnDateSet('searchCocMstEdDt', 'searchCocMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>??????</span></a>
									   <a href="javascript:fnDateSet('searchCocMstEdDt', 'searchCocMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>?????????</span></a>
									   <a href="javascript:fnDateSet('searchCocMstEdDt', 'searchCocMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15???</span></a>
									   <a href="javascript:fnDateSet('searchCocMstEdDt', 'searchCocMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>??????</span></a>
								   </td>
							   </tr>
						   </tbody>
					</table><!-- // table -->
				   </form>

				   <div class="grid section-button-search"><!-- ?????? ?????? ?????? -->
					   <a href="javascript:searchClear('searchForm');" class="button small"><span>?????????</span></a>
					   <a href="javascript:;" id="search" class="button small primary"><span>??????</span></a>
				   </div>

				   <form id="frm" name="frm">
				   <input type="hidden" name="COC_IDX" value="" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
					<input type="hidden" name="searchCocMstSearchType" value="<c:out value="${commandMap.searchCocMstSearchType }"/>" />
					<input type="hidden" name="searchCocMstTitle" value="<c:out value="${commandMap.searchCocMstTitle }"/>" />
					<input type="hidden" name="searchCocSpcCD" value="<c:out value="${commandMap.searchCocSpcCD }"/>" />
					<input type="hidden" name="searchCocMstStDt" value="<c:out value="${commandMap.searchCocMstStDt }"/>" />
					<input type="hidden" name="searchCocMstEdDt" value="<c:out value="${commandMap.searchCocMstEdDt }"/>" />

					<div class="grid section-button-list"><!-- ?????? ?????? ?????? -->
							<div class="col-1-2 text-left">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							   <span class="pages">
								(??? <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>???, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>
					</div><!-- // ?????? ?????? ?????? -->

					<table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							   <col style="width: 5%;" />
							<col style="width: auto;" />
							   <col style="width: auto;" />
						</colgroup>
						<thead>
							<tr>
								   <th><input type="checkbox" class="checkbox checkAll" id="allCheck"></th>
								<th>????????????</th>
								<th>?????????</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="listNum" value="${paging.listNum}" />
							<c:forEach var="item" items="${list}" varStatus="i">
								<tr>
								  <td>
								  	<input type="checkbox" class="checkbox" id="COC_IDX_${item.COC_IDX}" name="checked" data-coc_idx="<c:out value="${item.COC_IDX}"/><c:out value="${item.COC_NM}"/>" value="<c:out value="${item.COC_IDX}"/><c:out value="${item.COC_NM}"/>">
								  	<input type="hidden" name="checked" value="${item.COC_IDX}" />
								  </td>
								  <td>
								  	<%-- <a href="javascript:sendParent('<c:out value="${item.COC_IDX}"/>')"><c:out value="${item.COC_NM}"/></a> --%>
								  	<a href="#none" class="list-title" data-coc_idx="${item.COC_IDX}"><c:out value="${item.COC_NM}"/></a>
								  </td>
								  <td>
								  	<ui:formatDate value="${item.COC_REG_DT }" pattern="yyyy.MM.dd"/>
								  </td> 
								</tr>
								<c:set var="listNum" value="${listNum-1}" />        	
							</c:forEach>
						</tbody>
					</table>

					<div class="section-pagination"><!-- section pagination -->
						<h4 class="sr-only">?????? ?????????</h4>
						<div class="wrap"><!-- ?????? ??? wrap ?????? ?????? ?????? -->
							<!-- <a class="nav first" href="javascript:;" ><i><em>??? ?????????</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>?????? ?????????</em></i></a> <strong><em>?????? ????????? -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>?????? ?????????</em></i></a> <a class="nav last" href="javascript:;" ><i><em>????????? ?????????</em></i></a> -->
							<ui:paging paging="${paging }" jsFunction="goPage" />
						 </div>
					</div><!-- // section pagination -->

				</form>

				   <!-- section-button -->
				   <!-- <div class="section-button">
					   <div class="wrap text-center">
						   <a href="javascript:;" onclick="window.close();" id="goList" class="button large"><span>??????</span></a>
					   </div>
				   </div> -->
				   <div class="section-button">
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goList" onclick="window.close();" class="button"><span>??????</span></a>
                        <a href="javascript:sendParent('<c:out value="${item.COC_IDX}"/><c:out value="${item.COC_NM}"/>') " id="goRegist" class="button primary" > <span>??????</span></a>
                        
                    </div>
                </div>
				   <!-- // section-button -->

			   </div><!-- //modal-inner -->

		   </div><!-- //modal-wrapper -->

	   </div><!-- //modal -->


	<footer><!-- footer -->
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->


<script src="/am/js/plugins.js" /></script>
<script src="/am/js/vendor/jquery-2.1.3.min.js" /></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
	function sendParent(idx){
		var $frm = $("#frm");
		var $idx = $(".checkbox:checked").val("")
		
		if( $(".checkbox:checked").length == 0 ){
			alert("????????? ???????????? ????????????.");
			return;
		}if (confirm("?????? ???????????????????")){
			$("#COC_IDX").val($(".checkRow:checked").val());
			
			window.opener.callParentEx(idx);
			self.opener = self;
			window.close();
		}
	};



/* $(document).on("click", "#goRegist", function () {
	var $checkObj = $.find("input[name='COC_IDXs']:checked");
	if( $checkObj.length == 0 ){
		alert("????????? ???????????? ????????????.");
		return;
	}
}) */


function goDetail(idx){
	var input = document.createElement("input");
	$(input).attr('name','COC_IDX');
	$(input).attr('type','hidden');
	$(input).val(idx);
	var form = document.createElement("form");
	$(form).attr('method','post');
	$(form).attr('action','/am/member/affiliateDetail.do');
	$(form).append($(input));
	$('body').append($(form));
	$(form).submit();
}

function goMemberList(idx){
	var input = document.createElement("input");
	$(input).attr('type','hidden');
	$(input).val(idx);
	var form = document.createElement("form");
	$(form).attr('method','post');
	$(form).attr('action','/am/member/affiliateDetail.do');
	$(form).append($(input));
	$('body').append($(form));
	$(form).submit();
}
/* $(document).ready(function () {
	$('#search').click(function(){
		$('#searchForm').submit();
	});
	
}); */

	//?????? a Tag ?????? ?????????
	$(document).on("click",".list-title",function() {
		var $frm = $("#frm");
		$frm.find("input[name='COC_IDX']").val($(this).data("coc_idx"));
		$frm.attr(
		{
			"action" : "<c:out value="${serverDomain}" />/am/member/affiliateDetail.do",
			"target" : "_blank",
			"method" : "post"
		}).submit();
	});

	//?????? ?????? ?????? ?????????
	$(document).on("click", "#search", function () {
	    var $searchForm = $("#searchForm"); 
	    $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	    $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/affiliateListPopup.do", "target":"_self", "method":"post"}).submit(); 
	});
	
	//?????? ?????? ????????? 
	$("#searchForm").on("keydown", function(e){
		if(e.keyCode == 13){
			$("#search").trigger("click");
			return false;
		}
	});

// ????????? ??????
	goPage = function(cPage) {
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({	"action" : "<c:out value="${serverDomain}" />/am/member/affiliateListPopup.do", "target" : "_self", "method" : "post" }).submit();
	};
	
	//???????????? ?????? ??????
	$(function () {
		$("#allCheck").click(function () {
			if($("#allCheck").prop("checked")){
				$("input[type=checkbox]").prop("checked", true);
			}else{
				$("input[type=checkbox]").prop("checked", false);
			}
			
		});
	});
</script>
</body>
</html>
