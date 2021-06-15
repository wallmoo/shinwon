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

			<h2 class="title"><span>태그그룹 상세 | 수정</span></h2>

			<form id="frm" name="frm">
				<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword}"/>"/>
				<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType}"/>"/>
				<input type="hidden" name="searchUseYN" value="<c:out value="${commandMap.searchUseYN}"/>"/>
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage}"/>"/>
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize}"/>"/>
				<input type="hidden" name="TAG_GRP_ID"  id = "TAG_GRP_ID" value='${TAG_GROUP_DATA.TAG_GRP_ID}' /> 
				<table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 15%; min-width: 180px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr><!-- row -->
							<th><span>태그 그룹명 <i class="require"><em>필수입력</em></i></span></th>
							<td>
								<input type="text" id="tag_group_title" name="TAG_GRP_TITLE" class="text" placeholder="태그 그룹명" value="<c:out value="${TAG_GROUP_DATA.TAG_GRP_TITLE}"/>"/>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>태그 그룹 설명</span></th>
							<td>
								<input type="text" id="tag_group_desc" name="TAG_GRP_DES" class="text xlarge" placeholder="태그 그룹 설명" value="<c:out value="${TAG_GROUP_DATA.TAG_GRP_DES}"/>"/>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>사용설정 <i class="require"><em>필수입력</em></i></span></th>
							<td>
								<input type="radio" class="radio" name="TAG_GRP_STATUS" id="stateA" value="Y" <c:if test="${TAG_GROUP_DATA.TAG_GRP_STATUS eq 'Y' }">checked="checked"</c:if> />
								<label for="stateA">사용</label>
								<input type="radio" class="radio" name="TAG_GRP_STATUS" id="stateB" value="N" <c:if test="${TAG_GROUP_DATA.TAG_GRP_STATUS eq 'N' }">checked="checked"</c:if> />
								<label for="stateB">미사용</label>
							</td>
						</tr>
						<tr>
							<th><span>등록태그<i class="require"><em>필수입력</em></i><br/><span id="tagListSize">(<c:out value="${TAG_LIST.size() }"/>)</span></span></th>
							<td>
								<ul class="tag_list">
									<c:forEach var="row" items="${TAG_LIST}" varStatus="i">
										<li class="tagItem" data-tagmstid="<c:out value="${row.TAG_MST_ID}"/>"><c:out value="${row.TAG_MST_TITLE}"/>
											<button class="btn_del">X</button>
											<input type="hidden" name="TAG_MST_ID" value="<c:out value="${row.TAG_MST_ID}"/>"/>
										</li>
									</c:forEach>
								</ul>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>태그선택</span><a href="#none" id="chkReset" class="button button-a small chk_reset">초기화</a></th>
							<td>
								<div class="field tag_chk_con">
									<ul class="form_radio_check_list">
									<c:forEach var="row" items="${AVAILABLE_TAG_LIST}" varStatus="i">
										<li>
											<input type="checkbox" class="tagCheckBox" data-tagmstid="<c:out value="${row.TAG_MST_ID}"/>" value="<c:out value="${row.TAG_MST_TITLE}"/>"/>
											<label for="tag_chk<c:out value="${i.index}"/>"><c:out value="${row.TAG_MST_TITLE}"/></label>
										</li>
									</c:forEach>
									</ul>
								</div>
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->

			<div class="section-button">
				<div class="wrap text-center">
					<a href="javascript:;" id="goRegist" class="button primary"><span>저장</span></a>
					<a href="javascript:;" id="goList" class="button"><span>목록</span></a>
				</div>
			</div>
			</form>
			<form id="searchForm">
				<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword}"/>"/>
				<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType}"/>"/>
				<input type="hidden" name="searchUseYN" value="<c:out value="${commandMap.searchUseYN}"/>"/>
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage}"/>"/>
				<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize}"/>"/>
			</form>
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
<script src="<c:out value="${cdnDomain}"/>/pc/js/vendor/jquery.tmpl.min.js"></script>

<script id="tagItemTemplate" type="text/x-jquery-tmpl">
	<li class="tagItem" data-tagmstid="\${TAG_MST_ID}">\${TAG_MST_TITLE}
		<button class="btn_del">X</button>
		<input type="hidden" name="TAG_MST_ID" value="\${TAG_MST_ID}"/>
	</li>
</script>

<script>
syncToTagListCheckBox = function(){
	$(".tagCheckBox").prop("checked", false);
	$(".tag_list li").each(function(){
		var TAG_MST_ID = $(this).data("tagmstid");
		$(".tag_chk_con input[data-tagmstid="+TAG_MST_ID+"]").prop("checked", true);
	});
	
	$("#tagListSize").text("("+$(".tag_list li").size()+")");
	
}
syncToTagListCheckBox();

syncToSelectedTagList = function(){
	$(".tag_list").empty();
	var tagList = new Array();
	$(".tag_chk_con .tagCheckBox").each(function(){
		if($(this).is(":checked")){
			tagList.push({TAG_MST_ID:$(this).data("tagmstid"), TAG_MST_TITLE:$(this).val()});	
		}
	});
	if(tagList.length>0){
		$("#tagItemTemplate").tmpl( tagList ).appendTo(".tag_list");	
	}
	$("#tagListSize").text("("+tagList.length+")");
}

$(function(){
	$(document).on("click", "#chkReset",function(){
		$(".tag_list").empty();
		syncToTagListCheckBox();
	});
	
	$(document).on("click", ".btn_del", function(){
		$(this).parent().remove();		
		syncToTagListCheckBox();
	});
	
	$(document).on("change", ".tagCheckBox", function(){
		syncToSelectedTagList();
	});
	
	$(document).on("click", "#goList",function(){
		$("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/tag/tagGroupList.do", "target":"_self", "method":"post"}).submit();
	});
	
	$(document).on("click", "#goRegist",function(){
		if($(".tag_list li").size()<1){
			alert("태그를 입력해야합니다.");
			return;
		}
		
		if($.trim($("#tag_group_title").val()) == ""){
			alert("태그명을 입력해야합니다.");
			$(".tag_group_title").focus();
			return;
		}
		
		if(!confirm("저장 하시겠습니까?")){
			return;
		}
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/tag/tagGroupModify.do", "target":"_self", "method":"post"}).submit();
	});	
});
//-->
</script>

</body>
</html>
