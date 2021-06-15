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

				<h2 class="title"><span>광고관리</span></h2>

				<h3 class="title"><span>등록</span></h3>
				<p>
				   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
				</p>
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="searchAdMstViewEnv" value="<c:out value="${commandMap.searchAdMstViewEnv }"/>"/>
					<input type="hidden" name="searchAdMstTitle" value="<c:out value="${commandMap.searchAdMstTitle }"/>" />
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					<input type="hidden" name="searchAdMstDplYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
					<input type="hidden" name="AD_MST_VIEW_ENV" value="M" />                    
					<input type="hidden" name="searchPopMstTopYn" value="<c:out value="${commandMap.searchPopMstTopYn }"/>"/>
				
				</form>
				
				<form id="frm" name="frm" enctype="multipart/form-data"> 
					<input type="hidden" name="AD_MST_VIEW_ENV" value="M" />
					<table cellspacing="0" class="table-row table-a"><!-- table -->
						<colgroup>
							<col style="width: auto;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th><label class="label"><span>전시채널</span></label></th>
								<td>
									MOBILE
								</td>
							
							</tr>
							<tr>
								<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="text" class="text" id="AD_MST_TITLE" name="AD_MST_TITLE" style="width:80%;"/>
									(<span id="msgbyte1">0</span><span id="trMsgMaxByte">/100</span>&nbsp;byte)
								</td>
							</tr>
					   
							<tr>
								<th><label class="label"><span>노출기간<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="AD_MST_ST_DT" name="AD_MST_ST_DT" readonly="readonly" data-target-end="#AD_MST_ED_DT"/>
									<select id="AD_MST_ST_HH" name="AD_MST_ST_HH" class="select small">
										<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
											<fmt:formatNumber pattern="00" value="${i }" var="hour" />
											<option value="${hour }">${hour }</option>
										</c:forEach>
									</select> 시
									<select id="AD_MST_ST_MM" name="AD_MST_ST_MM" class="select small">
										<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
											<fmt:formatNumber pattern="00" value="${i }" var="minute" />
											<option value="${minute }">${minute }</option>
										</c:forEach>
									</select> 분 ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="AD_MST_ED_DT" name="AD_MST_ED_DT"  readonly="readonly" data-target-start="#AD_MST_ST_DT"/>
									<select id="AD_MST_ED_HH" name="AD_MST_ED_HH" class="select small">
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <c:if test="${status.last}">selected</c:if>>${hour }</option>
									</c:forEach>
									</select> 시
									<select id="AD_MST_ED_MM" name="AD_MST_ED_MM" class="select small">
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <c:if test="${status.last}">selected</c:if>>${minute }</option>
									</c:forEach>
									</select> 분
									<a href="javascript:fnDateSet('AD_MST_ST_DT', 'AD_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('AD_MST_ST_DT', 'AD_MST_ED_DT', 0, 0, 1, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('AD_MST_ST_DT', 'AD_MST_ED_DT', 0, 0, 1, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('AD_MST_ST_DT', 'AD_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
								
								</td>
							</tr>
							<tr>
								<th><label class="label"><span>사용상태<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="radio" id="AD_MST_DPL_YN1" class="radio" name="AD_MST_DPL_YN" value="Y" checked="checked" />
									<label for="AD_MST_DPL_YN1">전시</label>
									<input type="radio" id="AD_MST_DPL_YN2" class="radio" name="AD_MST_DPL_YN" value="N" />
									<label for="AD_MST_DPL_YN2">미전시</label>
								</td>
							</tr>
							
							<tr>
								<th><label class="label"><span>광고위치<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<select id="AD_MST_WCH" name="AD_MST_WCH" class="select" title="광고위치">
										<option value="">선택</option>
										<c:forEach items="${wchList}" var="data">
											<option value="<c:out value="${data.CMN_COM_IDX}"/>">
												<c:out value="${data.CMN_COM_NM}"/>
											</option> 
										</c:forEach> 
									</select>
								</td>
							</tr>
							
							<tr>
								<th><label class="label"><span>배너 <i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="file" name="file" id="file" class="file" data-accept="img" />
									<small class="desc">(배너사이즈:000x000)</small>
								</td>
							</tr>
						   
							<tr>
								<th><label class="label"><span>링크경로<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<div class="tbl_line">
										<input type="radio" name="AD_MST_LNK_GBN" id="AD_MST_LNK_GBN1" class="AD_MST_LNK_GBN" value=""><label for="AD_MST_LNK_GBN1">링크없음</label>
										<input type="radio" name="AD_MST_LNK_GBN" id="AD_MST_LNK_GBN2" class="AD_MST_LNK_GBN" value="P"><label for="AD_MST_LNK_GBN2">부모창</label>
										<input type="radio" name="AD_MST_LNK_GBN" id="AD_MST_LNK_GBN3" class="AD_MST_LNK_GBN" value="N" checked="checked"><label for="AD_MST_LNK_GBN3">새창열림</label>
									</div>
									<div class="tbl_line">
										<input type="text" name="AD_MST_LNK_URL" id="AD_MST_LNK_URL" class="text xlarge" />
									</div>
								</td>
							</tr>

							<tr>
								<th><label class="label"><span>대체텍스트</span></label></th>
								<td>
									<input type="text" class="text xlarge" id="AD_MST_IMG_TXT" name="AD_MST_IMG_TXT"/>
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

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	$(document).on("keyup","#AD_MST_TITLE",function(){
		getStrByte(this,'#msgbyte1', 100, 2);
	});
	
	// 폼체크
	$("#frm").validate({
		rules: {
			AD_MST_TITLE : { required:true },
			AD_MST_ST_DT : { required:true },
			AD_MST_ED_DT : { required:true }
		}
	});

	// 저장 이벤트
	$(document).on("click", "#goRegist", function () 
	{
		var $frm = $("#frm"); 
		if($frm.valid()){
			var $stime = parseInt($("#AD_MST_ST_HH").val()+$("#AD_MST_ST_MM").val());
			var $etime = parseInt($("#AD_MST_ED_HH").val()+$("#AD_MST_ED_MM").val());
			
			if($("#AD_MST_ST_DT").val() == $("#AD_MST_ED_DT").val())
			{
				if($stime > $etime)
				{
					alert("[노출기간]이 잘못 입력되었습니다. \n 다시 입력해 주십시오.");
					$("#AD_MST_ST_HH").focus();
					return false;
				}        		
			}
			var file = $("input[name='file']").val();
			if(file == ""){
				alert("배너를 등록해 주십시오.");
				return;
			}

			if($.trim($("#AD_MST_WCH").val()) =="")
			{
				alert("광고위치를 등록해 주십시오.");
				$("#AD_MST_WCH").focus();
				return;
			}
			if($("#AD_MST_LNK_GBN1").is(":checked") == false &&  $.trim($("#AD_MST_LNK_URL").val()) =="")
			{
				alert("링크경로를 등록해 주십시오.");
				$("#AD_MST_LNK_URL").focus();
				return;
			}
		 
			if (confirm( "저장 하시겠습니까?")) {              	 
				$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/adRegist.do", "target":"_self", "method":"post"}).submit();
			}
		}
	});
	
	$(document).on("click", ".AD_MST_LNK_GBN", function () {
		var $this = $(this);
		
		if($("#AD_MST_LNK_GBN1").is(":checked"))
		{
			$("#AD_MST_LNK_URL").val("");
			$("#AD_MST_LNK_URL").prop("disabled", true);
		}
		else
		{
			$("#AD_MST_LNK_URL").prop("disabled", false);
		}
	}); 
	
	// 목록 이벤트
	$(document).on("click", "#goList", function () 
	{
		var $frm = $("#searchForm"); 
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/adList.do", "target":"_self", "method":"post"}).submit();
	});
});
//-->
</script>

</body>
</html>
