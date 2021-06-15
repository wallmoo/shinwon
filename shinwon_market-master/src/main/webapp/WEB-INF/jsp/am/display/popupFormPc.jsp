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

				<h2 class="title"><span>팝업관리</span></h2>

				<h3 class="title"><span>등록</span></h3>
				<p>
				   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
				</p>
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="searchPopMstViewEnv" value="<c:out value="${commandMap.searchPopMstViewEnv }"/>"/>
					<input type="hidden" name="searchViewLocation" value="<c:out value="${commandMap.searchViewLocation }"/>"/>
					<input type="hidden" name="searchTxt" value="<c:out value="${commandMap.searchTxt }"/>" />
					<input type="hidden" name="searchPopMstOpenType" value="<c:out value="${commandMap.searchPopMstOpenType }"/>" />
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					<input type="hidden" name="searchPopMstUseYn" value="<c:out value="${commandMap.searchPopMstUseYn }"/>"/>
					<input type="hidden" name="searchPopMstTyp" value="<c:out value="${commandMap.searchPopMstTyp }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
					<input type="hidden" name="POP_MST_VIEW_ENV" value="P" />
					<input type="hidden" name="searchPopMstTopYn" value="<c:out value="${commandMap.searchPopMstTopYn }"/>"/>
				</form>

				<form id="frm" name="frm" enctype="multipart/form-data">
					<input type="hidden" name="POP_MST_CHN_GBN" value="P" />
					<table cellspacing="0" class="table-row table-a"><!-- table -->
						<colgroup>
							<col style="width: auto;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th><label class="label"><span>전시채널</span></label></th>
								<td>
									PC
								</td>

							</tr>
							<tr>
								<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="text" class="text xlarge POP_MST_TITLE" id="POP_MST_TITLE" name="POP_MST_TITLE" style="width:80%;" />
									(<span id="msgbyte1">0</span><span id="trMsgMaxByte">/150</span>&nbsp;byte)
								</td>
							</tr>

							<tr><!-- row -->
								<th><label class="label"><span>전시기간<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="POP_MST_ST_DT" name="POP_MST_ST_DT" readonly="readonly" data-target-end="#POP_MST_ED_DT"/>
									<select id="POP_MST_ST_HH" name="POP_MST_ST_HH" class="select small">
										<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
											<fmt:formatNumber pattern="00" value="${i }" var="hour" />
											<option value="${hour }">${hour }</option>
										</c:forEach>
									</select> 시
									<select id="POP_MST_ST_MI" name="POP_MST_ST_MI" class="select small">
										<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
											<fmt:formatNumber pattern="00" value="${i }" var="minute" />
											<option value="${minute }">${minute }</option>
										</c:forEach>
									</select> 분 ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="POP_MST_ED_DT" name="POP_MST_ED_DT"  readonly="readonly" data-target-start="#POP_MST_ST_DT"/>
									<select id="POP_MST_ED_HH" name="POP_MST_ED_HH" class="select small">
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <c:if test="${status.last}">selected</c:if>>${hour }</option>
									</c:forEach>
									</select> 시
									<select id="POP_MST_ED_MI" name="POP_MST_ED_MI" class="select small">
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <c:if test="${status.last}">selected</c:if>>${minute }</option>
									</c:forEach>
									</select> 분
									<a href="javascript:fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>종류<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="radio" id="POP_MST_TYP1" class="radio" name="POP_MST_TYP" value="P" checked="checked" />
									<label for="POP_MST_TYP1">팝업</label>
									<input type="radio" id="POP_MST_TYP2" class="radio" name="POP_MST_TYP" value="L" />
									<label for="POP_MST_TYP2">레이어</label>
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>사용상태<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="radio" id="POP_MST_USE_YN1" class="radio" name="POP_MST_USE_YN" value="Y" checked="checked" />
									<label for="POP_MST_USE_YN1">전시</label>
									<input type="radio" id="POP_MST_USE_YN2" class="radio" name="POP_MST_USE_YN" value="N" />
									<label for="POP_MST_USE_YN2">미전시</label>
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>하루열기옵션<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="radio" id="POP_MST_DAY_YN1" class="radio" name="POP_MST_DAY_YN" value="Y" checked="checked" />
									<label for="POP_MST_DAY_YN1">사용</label>
									<input type="radio" id="POP_MST_DAY_YN2" class="radio" name="POP_MST_DAY_YN" value="N" />
									<label for="POP_MST_DAY_YN2">미사용</label>
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>팝업창 크기<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<span>넓이값 :</span>
									<input type="text" class="text short number" id="POP_MST_W" name="POP_MST_W" /> px
									<span style="margin-left: 20px;">높이값 :</span>
									<input type="text" class="text short number" id="POP_MST_H" name="POP_MST_H" /> px
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>팝업창 위치<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<span>X값 :</span>
									<input type="text" class="text short number" id="POP_MST_X" name="POP_MST_X" /> px
									<span style="margin-left: 20px;">Y값 :</span>
									<input type="text" class="text short number" id="POP_MST_Y" name="POP_MST_Y" /> px
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>배너 <i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<textarea class="textarea xlarge" name="POP_MST_CNT" id="POP_MST_CNT" style="width: 95%; height: 500px;"></textarea>
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>링크경로<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<div class="tbl_line">
										<input type="radio" name="POP_MST_MDE" id="POP_MST_MDE1" class="POP_MST_MDE" value="" checked="checked"><label for="POP_MST_MDE1">링크없음</label>
										<input type="radio" name="POP_MST_MDE" id="POP_MST_MDE2" class="POP_MST_MDE" value="P"><label for="POP_MST_MDE2">부모창</label>
										<input type="radio" name="POP_MST_MDE" id="POP_MST_MDE3" class="POP_MST_MDE" value="N"><label for="POP_MST_MDE3">새창열림</label>
									</div>
									<div class="tbl_line">
										<input type="text" name="POP_MST_LNK" id="POP_MST_LNK" class="text xlarge"  style="width:80%;"/>
									</div>
								</td>
							</tr>
							<tr>
								<th><label class="label"><span>대체텍스트</span></label></th>
								<td>
									<input type="text" class="text xlarge POP_MST_IMG_TXT" id="POP_MST_IMG_TXT" name="POP_MST_IMG_TXT" style="width:80%;" />
									(<span id="msgbyte2">0</span><span id="trMsgMaxByte">/150</span>&nbsp;byte)
								</td>
							</tr>							

						</tbody>
					</table><!-- // table -->
				</form>
				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
					</div>
				</div><!-- // section-button -->

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
<ui:editor objId="#POP_MST_CNT" num="1"/>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script>
$(function(){
	
	 // 등록 이벤트
	$(document).on("keyup",".POP_MST_TITLE",function(){
		getStrByte(this,'#msgbyte1', 150, 2);
	});
	 
	$(document).on("keyup",".POP_MST_IMG_TXT",function(){
		getStrByte(this,'#msgbyte2', 150, 2);
	});	 

	// 폼체크
	$("#frm").validate({
		rules: {
			POP_MST_TITLE : { required:true },
			POP_MST_ST_DT : { required:true },
			POP_MST_ED_DT : { required:true },
			POP_MST_X     : { required:true },
			POP_MST_Y     : { required:true },
			POP_MST_W     : { required:true },
			POP_MST_H     : { required:true }
			<%--
			POP_MST_TARGET:{required:{depends:function(){
				if($("#POP_MST_URL").val() != "" ) return true;
				else return false;
			  }}}, // 링크 주소 open 방식
			POP_MST_URL:{required:{depends:function(){
				  if($(':radio[name="POP_MST_TARGET"]:checked').val() != "" ) return true;
				  else return false;
			  }}, url:true} // 링크 주소
			  --%>
		}
	});

	// 저장 이벤트
	$(document).on("click", "#goRegist", function ()
	{
		try { oEditors1.getById["POP_MST_CNT"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ }
		
		var $frm = $("#frm");
		if($frm.valid()){
			var $stime = parseInt($("#POP_MST_ST_HH").val()+$("#POP_MST_ST_MI").val());
			var $etime = parseInt($("#POP_MST_ED_HH").val()+$("#POP_MST_ED_MI").val());

			if($("#POP_MST_ST_DT").val() == $("#POP_MST_ED_DT").val())
			{
				if($stime > $etime)
				{
					alert("[노출기간]이 잘못 입력되었습니다. \n 다시 입력해 주십시오.");
					$("#POP_MST_ST_HH").focus();
					return false;
				}
			}
			if($("#POP_MST_CNT").val() == "" || $("#POP_MST_CNT").val() == "&nbsp;" || $("#POP_MST_CNT").val() == "<p>&nbsp;</p>"){
				alert("배너를 등록해 주십시오.");
				$("#PC_BANNER").focus();
				return
			}
			if($("#POP_MST_MDE1").is(":checked") == false &&  $.trim($("#POP_MST_LNK").val()) =="")
			{
				alert("링크경로를 등록해 주십시오.");
				$("#POP_MST_LNK").focus();
				return;
			}
			
			if (confirm( "저장 하시겠습니까?")) {
				$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/popupRegist.do", "target":"_self", "method":"post"}).submit();
			}
		}
	});

	// 목록 이벤트
	$(document).on("click", "#goList", function ()
	{
		var $frm = $("#searchForm");
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/popupList.do", "target":"_self", "method":"post"}).submit();
	});

	$(document).on("click", ".POP_MST_MDE", function () {
		var $this = $(this);

		if($("#POP_MST_MDE1").is(":checked"))
		{
			$("#POP_MST_LNK").val("");
			$("#POP_MST_LNK").prop("disabled", true);
		}
		else
		{
			$("#POP_MST_LNK").prop("disabled", false);
		}
	});
});
//-->
</script>

</body>
</html>
