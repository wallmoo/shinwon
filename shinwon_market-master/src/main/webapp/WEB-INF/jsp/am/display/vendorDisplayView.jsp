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

				<h2 class="title"><span>공통전시</span></h2>

				<h3 class="title"><span>등록</span></h3>
				<p>
				   <span><i class="require"><em>필수입력</em></span></i> 표시된 항목은 필수 입력 사항입니다.
				</p>
				<form id="frm" name="frm">
					<table cellspacing="0" class="table-row table-a"><!-- table -->
						<colgroup>
							<col style="width: 15%; min-width: 180px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr><!-- row -->
								<th><label class="label"><span>전시기간<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="VDR_DSP_ST_DT" name="VDR_DSP_ST_DT" value="<ui:formatDate value="${vendorInfo.VDR_DSP_ST_DT }" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-end="#VDR_DSP_ED_DT"/>
									<select id="VDR_DSP_ST_HH" name="VDR_DSP_ST_HH" class="auctionEventTime select small">
										<option value="">선택</option>
										<c:forEach begin="0" end="23" step="1" varStatus="i">
											<c:set var="hh" value="${i.index}"/>
											<c:if test="${i.index < 10}">
												<c:set var="hh" value="0${i.index}"/>
											</c:if>
											<option value="${hh}" <ui:select v="${vendorInfo.VDR_DSP_ST_HH}" t="${hh}" g="selected"/>>${hh}</option>
										</c:forEach>
									</select>
									<select id="VDR_DSP_ST_MM" name="VDR_DSP_ST_MM" class="auctionEventTime select small">
										<option value="">선택</option>
										<c:forEach begin="0" end="59" step="1" varStatus="i">
											<c:set var="mm" value="${i.index}"/>
											<c:if test="${i.index < 10}">
												<c:set var="mm" value="0${i.index}"/>
											</c:if>
											<option value="${mm}" <ui:select v="${vendorInfo.VDR_DSP_ST_MM}" t="${mm}" g="selected"/>>${mm}</option>
										</c:forEach>
									</select>
									<span class="auctionEventTime">
									 ~
									</span> 
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="VDR_DSP_ED_DT" name="VDR_DSP_ED_DT" value="<ui:formatDate value="${vendorInfo.VDR_DSP_ED_DT }" pattern="yyyy-MM-dd"/>" readonly="readonly" data-target-start="#VDR_DSP_ST_DT" />
									
									<select id="VDR_DSP_ED_HH" name="VDR_DSP_ED_HH" class="auctionEventTime select small">
										<option value="">선택</option>
										<c:forEach begin="0" end="23" step="1" varStatus="i">
											<c:set var="hh" value="${i.index}"/>
											<c:if test="${i.index < 10}">
												<c:set var="hh" value="0${i.index}"/>
											</c:if>
											<option value="${hh}" <ui:select v="${vendorInfo.VDR_DSP_ED_HH}" t="${hh}" g="selected"/>>${hh}</option>
										</c:forEach>
									</select>
									
									<select id="VDR_DSP_ED_MM" name="VDR_DSP_ED_MM" class="auctionEventTime select small">
										<option value="">선택</option>
										<c:forEach begin="0" end="59" step="1" varStatus="i">
											<c:set var="mm" value="${i.index}"/>
											<c:if test="${i.index < 10}">
												<c:set var="mm" value="0${i.index}"/>
											</c:if>
											<option value="${mm}" <ui:select v="${vendorInfo.VDR_DSP_ED_MM}" t="${mm}" g="selected"/>>${mm}</option>
										</c:forEach>
									</select>
									
									 <span id="offLine2">
										<a href="javascript:fnDateSet('VDR_DSP_ST_DT', 'VDR_DSP_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
										<a href="javascript:fnDateSet('VDR_DSP_ST_DT', 'VDR_DSP_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
										<a href="javascript:fnDateSet('VDR_DSP_ST_DT', 'VDR_DSP_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
										<a href="javascript:fnDateSet('VDR_DSP_ST_DT', 'VDR_DSP_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
										<a href="javascript:fnDateSet('VDR_DSP_ST_DT', 'VDR_DSP_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
									</span>
								
								</td>
							</tr>
							
							<tr>
								<th><label class="label"><span>텍스트<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<div class="tbl_line">
										<i class="require"><em>필수입력</em></i>입력된 텍스트는 모든 상품 상세페이지에 노출됩니다.설 연휴 배송 공지, 추석 연휴 배송 공지 등에 사용하세요.
									</div>
									<div class="tbl_line">
									  <textarea name="VDR_DSP_CTS" id="VDR_DSP_CTS" cols="30" rows="10" class="textarea xlarge" maxlength=500 ><c:out value="${vendorInfo.VDR_DSP_CTS }" /></textarea>
									</div>
									<div class="tbl_line">
									  (최대 500자 이내 입력가능합니다.)
									</div>
								</td>
							
							</tr>
						</tbody>
					</table><!-- // table -->
				</form>
				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
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
	 // 등록 이벤트
	$(document).on("click", "#goRegist", function () {
		var $frm = $("#frm"); 
		if($("#VDR_DSP_ST_DT").val() == "")
		{
			alert("[전시기간 시작일]을 입력해 주십시오.");
			$("#VDR_DSP_ST_DT").focus();
			return;
		}
		
		if($("#VDR_DSP_ST_HH").val() == "" )
		{
			alert("[전시기간 시작 시간]을 입력해 주십시오.");
			$("#VDR_DSP_ST_HH").focus();
			return;
		}
		
		if($("#VDR_DSP_ST_MM").val() == "")
		{
			alert("[전시기간 시작 분]을 입력해 주십시오.");
			$("#VDR_DSP_ST_MM").focus();
			return;
		}
		
		if($("#VDR_DSP_ED_DT").val() == "")
		{
			alert("[전시기간 종료일]을 입력해 주십시오.");
			$("#VDR_DSP_ED_DT").focus();
			return;
		}
		
		if($("#VDR_DSP_ED_HH").val() == "")
		{
			alert("[전시기간 종료 시간]을 입력해 주십시오.");
			$("#VDR_DSP_ED_HH").focus();
			return;
		} 
		
		if($("#VDR_DSP_ED_MM").val() == "")
		{
			alert("[전시기간 종료 분]을 입력해 주십시오.");
			$("#VDR_DSP_ED_MM").focus();
			return;
		} 
		
		if($.trim($("#VDR_DSP_ST_DT").val()) == $.trim($("#VDR_DSP_ED_DT").val()))
		{
			var $stime = parseInt($("#VDR_DSP_ST_HH").val()+$("#VDR_DSP_ST_MM").val());
			var $etime = parseInt($("#VDR_DSP_ED_HH").val()+$("#VDR_DSP_ED_MM").val());
			if($stime > $etime)
			{
				alert("[전시기간]이 잘못 입력되었습니다. \n 다시 입력해 주십시오.");
				$("#VDR_DSP_ST_DT").focus();
				return;
			}	
		} 
		if($("#VDR_DSP_CTS").val() == ""){
			alert("[전시내용]은 필수입력 사항입니다.");
			$("#VDR_DSP_CTS").focus();
			return;
		}
		
		if (confirm( "저장 하시겠습니까?")) {
			$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/vendorDisplayModify.do", "target":"_self", "method":"post"}).submit();
		}
	});
});
//-->
</script>

</body>
</html>
