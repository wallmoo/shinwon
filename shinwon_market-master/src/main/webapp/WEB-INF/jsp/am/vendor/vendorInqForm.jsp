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

			<div class="container"><!-- container -->

				<h2 class="title"><span>입점사문의</span></h2>
				<h3 class="title"><span>문의내용</span></h3>

				<form name="searchForm" id="searchForm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
					<input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
					<input type="hidden" name="searchScmInqReplyCd" value="<c:out value="${commandMap.searchScmInqReplyCd }"/>"/>                    
					<input type="hidden" name="searchScmInqRegId" value="<c:out value="${commandMap.searchScmInqRegId }"/>"/>
					<input type="hidden" name="searchScmInqRegNm" value="<c:out value="${commandMap.searchScmInqRegNm }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
				</form>

				<form id="frm" name="frm" enctype="multipart/form-data">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="SCM_INQ_IDX" value="<c:out value="${commandMap.SCM_INQ_IDX }"/>"/>
					<input type="hidden" name="SCM_VDR_MST_IDX" value="<c:out value="${commandMap.VDR_MST_IDX }"/>"/><!-- 입점업체 IDX -->
					<input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>"/>
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
					<input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
					<input type="hidden" name="searchScmInqReplyCd" value="<c:out value="${commandMap.searchScmInqReplyCd }"/>"/>                    
					<input type="hidden" name="searchScmInqRegId" value="<c:out value="${commandMap.searchScmInqRegId }"/>"/>
					<input type="hidden" name="searchScmInqRegNm" value="<c:out value="${commandMap.searchScmInqRegNm }"/>"/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
					<input type="hidden" name="SCM_INQ_REG_NM" value="<c:out value="${row.SCM_INQ_REG_NM}"/>"/><!-- 문의자 이름 -->
					<input type="hidden" name="SCM_INQ_REG_ID" value="<c:out value="${row.SCM_INQ_REG_ID}"/>"/><!-- 문의자 ID -->
						
					<table cellspacing="0" class="table-row table-a">
						<caption>입점사문의내용의 입점사, 작성자, 문의유형, 제목, 내용, 첨부파일을 알 수 있는 표 입니다.</caption>
						<colgroup>
							<col style="width:15%">
							<col style="width:85%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span>입점사</span></th>
								<td>
									<a href="javascript:goViewVendor('<c:out value="${row.SCM_VDR_MST_IDX }"/>');">
										<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
											<c:out value="${row.VDR_MST_NM }" />
										</c:if>
										<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
											<c:out value="${vendorManagerInfo.VDR_MST_NM }" />
										</c:if>
									</a>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>작성자</span></th>
								<td>
									<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
										<c:out value="${row.SCM_INQ_REG_NM }" />(<c:out value="${row.SCM_INQ_REG_ID }"/>)
									</c:if>
									<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
										<c:out value="${sessionAdmin.ADM_MST_ID }"/>(<c:out value="${sessionAdmin.ADM_MST_NM }"/>)
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="">문의유형<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tbl_line">
										<select name="SCM_CMN_COM_IDX" id="SCM_CMN_COM_IDX" class="select">
											<option value="">선택</option>
											   <c:if test="${not empty inqTypeCodeList }">
												   <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
													   <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>" <c:if test="${inqTypeCodeRow.CMN_COM_IDX eq row.SCM_CMN_COM_IDX }">selected="selected"</c:if>>
														   <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
													   </option>
												   </c:forEach>
											   </c:if>
										</select>
									</div>
									<div class="tbl_line" id="orderBox">
										<input type="text" name="SCM_ORD_MST_CD" id="SCM_ORD_MST_CD" class="text" readonly>
										<button type="button" id="searchOrder" class="button small">조회</button>
									</div>
								</td>

							</tr>
							<tr>
								<th><span>등록일</span></th>
								<td>
									<c:choose>
										<c:when test="${not empty row.SCM_INQ_REG_DT}">
											<ui:formatDate value="${row.SCM_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
										</c:when>
										<c:otherwise>
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate var="reg_date" value="${now}" pattern="yyyy-MM-dd HH:mm:ss " />
												${reg_date}
										</c:otherwise>
									</c:choose>
								</td>
							</tr> 
							<!-- <tr>
								<th><span>구분</span></th>
								<td>
									<c:out value="${row.CMN_COM_NM }"/>
								</td>
							</tr> -->
							<tr>
								<th><span>주문번호</span></th>
								<td id="ordMstCd">
									<c:if test="${not empty row.SCM_ORD_MST_CD }">
										<a href="javascript:goOrderView('<c:out value="${row.SCM_ORD_MST_CD }" />');" title="새 창 으로 열립니다.">
											<c:out value="${row.SCM_ORD_MST_CD }"/>
										</a>
									</c:if>
								</td>
							</tr>
							<tr>
								<th><label for="">제목<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<c:choose>
										<c:when test="${not empty row.SCM_INQ_TITLE}">
											<c:out value="${row.SCM_INQ_TITLE }"/>
										</c:when>
										<c:otherwise>
											<input type="text" name="SCM_INQ_TITLE" id="SCM_INQ_TITLE" class="text xlarge"/>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><label for="">내용<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<c:choose>
										<c:when test="${not empty row.SCM_INQ_TITLE}">
											<ui:replaceLineBreak content="${row.SCM_INQ_CONTENTS }"/>
										</c:when>
										<c:otherwise>
											<textarea class="textarea" name="SCM_INQ_CONTENTS" id="SCM_INQ_CONTENTS" style="height: 100px;"></textarea>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><span>첨부파일</span></th>
								<td>
									<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
										<div id="fileView" class="tbl_line cf">
											<ul class="attach_file_add">
												<li class="cf">
													<input type="file" name="file" id="files[0]" class="file" value="">
													<button type="button" name="addFile" id="addFile" class="btn_file_add">+</button>
													<button type="button" id="delFileData" class="btn_file_del">파일지우기</button>
												</li>
											</ul>
										</div>
										<div class="tbl_line">
											* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf * 업로드 용량 : 20MB
										</div>
									</c:if>
								
									<c:if test="${not empty fileList }">    
										<c:forEach var="fileRow" items="${fileList }" varStatus="i">
											<i class="icon-file"></i>
											<a href="#none" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH}"/>">
												<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
											</a>
										</c:forEach>    
									</c:if>
									
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->
				
				
				<c:if test="${row.SCM_INQ_REPLY_CD eq 'N'}">
					<h3 class="title"><span>답변정보</span></h3>	
					<table cellspacing="0" class="table-row table-a">
						<caption>입점사문의내용의 답변상태, 답변내용, 딥변자를 알 수 있는 표 입니다.</caption>
						<colgroup>
							<col style="width:15%">
							<col style="width:85%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span>답변상태</span></th>
								<td><c:out value="${row.SCM_INQ_REPLY_CD eq 'Y' ? '답변완료':'답변미완료' }"/></td>
							</tr>
							<tr>
								<th scope="row"><span>답변내용</span></th>
								<td>
									<div class="bbs_content_wrap">
										<textarea name="SCM_INQ_REPLY_CONTENTS" id="SCM_INQ_REPLY_CONTENTS" class="textarea"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>답변자</span></th>
								<td><c:out value="${sessionAdmin.ADM_MST_ID }"/>(<c:out value="${sessionAdmin.ADM_MST_NM }"/>)</td>
							</tr>
						</tbody>
					</table><!-- // table -->
				</c:if>
				</form>
				
				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SCM_ADMINISTRATOR_IDX}">
							<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
						</c:if>
						<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
							<a href="javascript:;" id="goModify" class="button large primary"><span>저장</span></a>
						</c:if>
						<a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
					</div>
				</div><!-- // section-button -->
				
			</div><!-- // container -->

		</div><!-- // contents -->

	</div><!-- // wrapper -->  

	<div id="quickmenu" class="aside right"><!-- quickmenu-->
		<%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
	</div><!-- // quickmenu -->

</div><!-- // container -->
	<!-- 파일 다운로드용 폼 -->
	<form name="fileForm" id="fileForm">
		 <input type="hidden" name="CMM_FLE_IDX" value=""/>
		 <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
		 <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	</form> 
<div id="footer">
	<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>  

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="fileItemTemplate" type="text/x-jquery-tmpl">
<li class="cf">
	<input type="file" name="file" class="file" value="">
	<button type="button" name="addFile" class="btn_file_add">+</button>
	<button type="button" class="btn_file_del">파일지우기</button>
</li>
</script>
<script id="orderTemplate" type="text/x-jquery-tmpl">
<a href="javascript:goOrderView('\${ORD_MST_CD}');" title="새 창 으로 열립니다.">
	\${ORD_MST_CD}
</a>
</script>
<script>    
$(function(){  
	$('#orderBox').hide();
    
	// 권한 변경시
    $(document).on("change", "select[name=SCM_CMN_COM_IDX]", function(){
    	var curVal = $(this).val(); 
        if(curVal == "${Code.VENDOR_INQUIRY_TYPE_ORDER}"){    // 주문/결제유형인 경우 주문조회있음.
            $("#orderBox").show();
        }else{
        	$("#orderBox").hide();
        }
    });
    
    $(document).on("click", "#searchOrder", function () {
        popup("<c:out value="${serverDomain}" />/am/order/searchVendorOrderPopup.do", "900", "700", "yes", "searchVendorOrder");
    });
	
	// 파일 행 추가 클릭 이벤트
	$(document).on("click", ".btn_file_add", function(){
		// 고정 첨부파일 행 파일지우기 비활성화
		$("#fileItemTemplate").tmpl().appendTo(".attach_file_add");
	});
	
	// 고정 첨부 행 파일 지우기
	$(document).on("click", ".btn_file_del", function(){
		$(this).parent().remove();
	});
	
	//현재 행 삭제
	function rowDelete(row)
	{
		$(row).parent().parent().remove();
		
		// 고정 첨부파일 행 파일지우기 활성화
		if($("input[name='file']").length == 1)
		{
			$("#delFileData").prop("disabled", false);
		}
	}
	
	$("#frm").validate({
		rules: {
			SCM_CMN_COM_IDX:{required:true}, // 제목
			SCM_INQ_TITLE:{required:true}, // 구분
			SCM_INQ_CONTENTS:{required:true}
		},
		messages :
		{	
			SCM_CMN_COM_IDX: {required:"[문의유형]은 필수 정보입니다."},
			SCM_INQ_TITLE: {required:"[제목]은 필수 정보입니다."},
			SCM_INQ_CONTENTS: {required:"[내용]은 필수 정보입니다."}
			
		},
		showErrors:
			function(errorMap, errorList){
			   if(this.numberOfInvalids()) { 
				   var errorOobjId = $(errorList[0].element).attr('id');
				   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
				   caption = caption.replace('*','').replace(/\s/gi,'');
				   if(caption != null && caption != "") 
				   {
					   alert('[' + caption + '] ' + errorList[0].message);
				   }
				   else
				   {
					   alert(errorList[0].message);
				   }
				   $(errorList[0].element).focus();
		   }
		}
	});
	
	// 저장 버튼 클릭 이벤트 (답변 저장)
	$(document).on("click", "#goModify", function () {
		var $frm = $("#frm");
		
		if($frm.valid())
		{
			try { oEditors.getById["SCM_INQ_REPLY_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);  } catch(e){ }
			
			if(confirm("작성한 답변을 저장하시겠습니까?"))
			{
				$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/vendor/vendorInqModify.do", "target":"_self", "method":"post"}).submit();
			}
		}
	});
	
	// 입점업체 문의 등록
	$(document).on("click", "#goRegist", function () {
		var $frm = $("#frm");
		if($frm.valid())
		{
			try { oEditors.getById["SCM_INQ_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);  } catch(e){ }
						 
			if(confirm("저장하시겠습니까?"))
			{
				$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/vendor/vendorInqRegist.do", "target":"_self", "method":"post"}).submit();
			}
		}
	});
	  
	// 목록 버튼 클릭 이벤트
	$(document).on("click", "#goList", function () {
		$("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/vendor/vendorInqList.do", "target":"_self", "method":"post"}).submit();
	});
 
	// 파일 다운로드
	$(document).on("click", "#fileForm .file-list-title", function () {
		var $fileForm = $("#fileForm");
		var $this = $(this);
		$fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
		$fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
		$fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.text().trim());
		$fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
	});
	
	// 입점업체 상세정보 팝업창 호출
	goViewVendor = function (vdrMstIdx) {
		popup("<c:out value="${serverDomain}" />/am/site/vendorManagerPopup.do?VDR_MST_IDX=" + vdrMstIdx, "1200", "700", "yes", "goVendorManagerPopup");
	};
	
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
	
});

fnResultVendorOrder = function(params){
	var arrayObj = new Array();
	$.each(params, function(index,item){
		var obj = new Object();
		obj.serverDomain = '<c:out value="${serverDomain}" />';
		obj.ORD_MST_CD = item.ORD_MST_CD;
		
		arrayObj.push(obj);
	});
	$("#SCM_ORD_MST_CD").val(arrayObj[0].ORD_MST_CD);
	$( "#orderTemplate" ).tmpl( arrayObj ).appendTo("#ordMstCd");
};

</script>

</body>
</html>
