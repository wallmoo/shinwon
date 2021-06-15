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

				<h2 class="title"><span><c:out value="${noticeStateNm }" /></span></h2>

				<h3 class="title"><span>수정</span></h3>
				<p>
				   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
				</p>
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>"/>       
				</form>
				
				<form name="frm" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="BNR_MST_IDX" value="<c:out value="${row.BNR_MST_IDX }"/>"/>
					<input type="hidden" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
					<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
					<input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${commandMap.BNR_MST_GBN }"/>" />
					<input type="hidden" id="path" name="path" value="<c:out value="${commandMap.path }"/>" />
					<input type="hidden" name="BNR_DTL_IDX" id="BNR_DTL_IDX" value="<c:out value="${row.BNR_DTL_IDX }"/>" />
					<table cellspacing="0" class="table-row table-a"><!-- table -->
						<colgroup>
							<col style="width: auto;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th><label class="label"><span>구분<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									 <c:out value="${row.BNR_MST_ENV eq 'P' ? 'PC' : 'MOBILE' }"/>
								</td>
							
							</tr>
							<tr>
								<th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" class="radio" value="Y" <ui:select v="${row.BNR_MST_USE_YN }" t="Y" g="checked"/> />
									<label for="BNR_MST_USE_YN1">사용</label>
									<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" class="radio" value="N" <ui:select v="${row.BNR_MST_USE_YN }" t="N" g="checked"/> />
									<label for="BNR_MST_USE_YN2">미사용</label>
								</td>
							</tr>
							
							<tr>
								<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" value="<c:out value="${row.BNR_MST_TITLE }"/>" style="width:80%;"/>
								</td>
							</tr>
					   
							<tr>
								<th><label class="label"><span>전시기간<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT" value="<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy-MM-dd"/>" />
									<select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH" class="select small">
										<c:forEach begin="0" end="23" varStatus="i">
											<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
												<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
											</option>
										</c:forEach>
									</select> 시
									<select  name="BNR_MST_ST_MM" id="BNR_MST_ST_MM" class="select small">
										<c:forEach begin="0" end="59" varStatus="i">
											<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_MM }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
												<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
											</option>
										</c:forEach>
									</select> 분 ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="BNR_MST_ED_DT" name="BNR_MST_ED_DT"  readonly="readonly" data-target-start="#BNR_MST_ST_DT" value="<ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy-MM-dd"/>"/>
									<select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH" class="select small">
										<c:forEach begin="0" end="23" varStatus="i">
											<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ED_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
												<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
											</option>
										</c:forEach>
									</select> 시
									<select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM" class="select small">
										<c:forEach begin="0" end="59" varStatus="i">
											<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ED_MM }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
												<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
											</option>
										</c:forEach>
									</select> 분
									<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
									<br/>
									<small class="desc">전시기간은 ‘Today+1일’부터 설정 가능합니다.</small>
								</td>
							</tr>
							
							<c:choose>
								<c:when test="${commandMap.BNR_MST_GBN eq 'D' }">
								
							
									<tr>
										<th><label class="label"><span>브랜드선택<i class="require"><em>필수입력</em></i></span></label></th>
										<td>
											<c:out value="${row.BND_MST_NM }" />
										</td>
									</tr>
								</c:when>
								<c:otherwise>
								
									<tr>
										<th><label class="label"><span>MD선택<i class="require"><em>필수입력</em></i></span></label></th>
										<td>
											<c:out value="${row.ADM_MST_NM }" />
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
						   
							
							<c:if test="${not empty fileList }">
							<c:forEach var="row" items="${fileList }" varStatus="i">
								<c:set var="CMN_FLE_ALT_TXT" value="${row.CMN_FLE_ALT_TXT }" />
								<tr>
									<th><label class="label"><span>배너 <i class="require"><em>필수입력</em></i></span></label></th>
									<td>
										<div class="tbl_line">
											<ul class="img-upload">
												<li>
													<i class="icon-file"></i>
													<a href="<c:out value="${img_domain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
													<c:out value="${row.CMM_FLE_ORG_NM }"/>
													</a>
													<input type="checkbox" class="checkbox" id="CMM_FLE_IDX${row.CMM_FLE_IDX }" name="CMM_FLE_IDX" value="<c:out value="${row.CMM_FLE_IDX }"/>" />
													<label for="CMM_FLE_IDX${row.CMM_FLE_IDX }">삭제</label>
												 </li>
											</ul>
										</div>
										<div class="tbl_line">
									    	<input type="file" name="file" id="file" class="file" disabled="disabled"/>
									    </div>
									</td>
								</tr>
							</c:forEach>
							</c:if>
							
							<tr>
								<th><label class="label"><span>URL<br/></span></label></th>
								<td>
									<div class="tbl_line">
										<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT1" value="D" <ui:select v="${row.BNR_MST_TGT }" t="D" g="checked"/>><label for="BNR_MST_TGT1">링크없음</label>
										<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT2" value="C" <ui:select v="${row.BNR_MST_TGT }" t="C" g="checked"/>><label for="BNR_MST_TGT2">현재창</label>
										<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT3" value="N" <ui:select v="${row.BNR_MST_TGT }" t="N" g="checked"/>><label for="BNR_MST_TGT3">새창열림</label>
									</div>
									<div class="tbl_line">
								   		<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text xlarge" value="<c:out value="${row.BNR_MST_URL }"/>" maxlength="250" style="width:80%;"/>
								   </div>
								</td>
							</tr>
							
							<tr>
								<th><label class="label"><span>대체텍스트<i class="require"><em>필수입력</em></i></span></label></th>
								<td>
									<textarea  name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="textarea xlarge" maxlength="300" style="width:80%;">${CMN_FLE_ALT_TXT }</textarea>
									<input type="hidden" name="CMN_FLE_ALT_TXT_IDX" value="<c:out value="${row.CMM_FLE_IDX }"/>"/>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->
				</form>
				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="javascript:goDelete();" class="button large"><span>삭제</span></a>
						<a href="javascript:goModify();" class="button large primary"><span>저장</span></a>
						<a href="javascript:goList();" id="goList" class="button large"><span>목록</span></a>
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
var fileFlag = true;
	
	var $frm = $("#frm");
	
	// 폼체크
	$frm.validate({
		rules: 
		{
			BNR_MST_TITLE:{required:true}, // 제목
			BNR_MST_ST_DT:{required:true, date:true}, // 전시기간 시작일
			BNR_MST_ST_HH:{required:true, number:true}, // 전시기간 시작 시
			BNR_MST_ST_MM:{required:true, number:true}, // 전시기간 시작 분
			BNR_MST_ED_DT:{required:true, date:true}, // 전시기간 종료일
			BNR_MST_ED_HH:{required:true, number:true}, // 전시기간 종료 시
			BNR_MST_ED_MM:{required:true, number:true}, // 전시기간 종료 분
			BND_MST_IDX:{required:{depends:function(){
				if($("#BNR_MST_GBN").val() == "D") return true;
				else return false;
			}}},
			ADM_MST_ID:{required:{depends:function(){
				if($("#BNR_MST_GBN").val() != "D") return true;
				else return false;
			}}},
			BNR_MST_USE_YN:{required:true}, // 상태
			file:{required:fileFlag}, // 배너
			CMN_FLE_ALT_TXT:{required:fileFlag}, // 대체텍스트
			BNR_MST_TGT:{required:{depends:function(){
			  if($("#BNR_MST_URL").val() != "" ) return true;
			  else return false;
			}}}, // 링크 주소 open 방식
			BNR_MST_URL:{required:{depends:function(){
				if($(':radio[name="BNR_MST_TGT"]:checked').val() != "D" ) return true;
				else return false;
			}}, url:true} // 링크 주소
		},
		messages:
		{
			BNR_MST_ST_DT:{required:"시작일은 필수 선택사항입니다.", date:"시작일 날짜가 잘못 입력되었습니다."},
			BNR_MST_ST_HH:{required:"시작시는 필수 선택사항입니다.", number:"시작시는 숫자만 입력해 주십시오."},
			BNR_MST_ST_MM:{required:"시작분은 필수 선택사항입니다.", number:"시작분은 숫자만 입력해 주십시오."},
			BNR_MST_ED_DT:{required:"종료일은 필수 선택사항입니다.", date:"종료일 날짜가 잘못 입력되었습니다."},
			BNR_MST_ED_HH:{required:"종료시는 필수 선택사항입니다.", number:"종료시는 숫자만 입력해 주십시오."},
			BNR_MST_ED_MM:{required:"종료분은 필수 선택사항입니다.", number:"종료분은 숫자만 입력해 주십시오."}
		}
	});
	
	// 파일 삭제 check box 변경 이벤트
	$(document).on("change", "input[name=CMM_FLE_IDX]", function () {
		var $this = $(this);
		var $file = $this.parents(".img-upload").next();
		var $altBox = $file.next();
		
		var str = "";
		str += "<span>대체텍스트</span>";
		$altBox.empty();
		
		if($this.is(":checked"))
		{
			$file.prop("disabled", false);    
		}
		else
		{
			//$("#CMN_FLE_ALT_TXT").reset();
			$file.val("");
			$file.prop("disabled", true);
		}
	});
	
	// 목록 이동 함수
	goList = function () 
	{
		var $searchForm = $("#searchForm");
		var path = $("#path").val();
		var url = "<c:out value="${serverDomain}"/>/am/display/bannerProduct"+path+"NoticeList.do";
		$searchForm.attr({"action":url, "target":"_self", "method":"post"}).submit();
	};

	// submit 
	goModify = function () {
		var path = $("#path").val();
		var url = "<c:out value="${serverDomain}"/>/am/display/bannerProduct"+path+"NoticeModify.do";
		
		if($frm.valid())
		{
			if (confirm( "저장 하시겠습니까?")) 
			{
				$frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
			}
		}
	};
	
	// submit
	goDelete = function () {
		var path = $("#path").val();
		var url = "<c:out value="${serverDomain}"/>/am/display/bannerProduct"+path+"NoticeDelete.do";
		if (confirm( "삭제 하시겠습니까?")) {
			$frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
		}
	};
});
//-->
</script>

</body>
</html>
