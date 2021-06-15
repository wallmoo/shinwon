<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3 class="title">상세1</h3>
<p>
	<i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
</p>

<form name="frm" id="frm" enctype="multipart/form-data">
	<input type="hidden" name="BNR_MST_IDX" value="<c:out value="${row.BNR_MST_IDX }"/>"/>
	<input type="hidden" name="CMN_COM_IDX" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" />
	<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
	<input type="hidden" name="searchBnrMstTitle" value="<c:out value="${commandMap.searchBnrMstTitle }"/>"/>
	<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	<input type="hidden" name="searchBnrMstUseYn" value="<c:out value="${commandMap.searchBnrMstUseYn }"/>"/>
	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
	
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" name="BNR_DTL_IDX" id="BNR_DTL_IDX" value="<c:out value="${row.BNR_DTL_IDX }"/>" />
	<input type="hidden" id="useListNum" name="useListNum" value="<c:out value="${commandMap.useListNum}"/>"/>
	<input type="hidden" id="unUseListNum" name="unUseListNum" value="<c:out value="${commandMap.unUseListNum}"/>"/>
	<input type="hidden" id="minListLimit" name="minListLimit" value="<c:out value="${commandMap.minListLimit}"/>"/>
	<input type="hidden" id="maxListLimit" name="maxListLimit" value="<c:out value="${commandMap.maxListLimit}"/>"/>
    <input type="hidden" id="initState" name="initState" value="<c:out value="${row.BNR_MST_USE_YN }"/>" />
	<table cellspacing="0" class="table-row table-a"><!-- table -->
		<colgroup>
			<col style="width: auto;" />
			<col style="width: auto;" />
		</colgroup>
		<tbody>
			<tr>
				<th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" value="Y" <ui:select v="${row.BNR_MST_USE_YN }" t="Y" g="checked"/>><label for="BNR_MST_USE_YN1">사용</label>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" value="N" <ui:select v="${row.BNR_MST_USE_YN }" t="N" g="checked"/>><label for="BNR_MST_USE_YN2">미사용</label>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" style="width: 80%;" maxlength="150" value="<c:out value="${row.BNR_MST_TITLE }"/>"/>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>전시기간<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
					<input type="text" class="text" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT" value="<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
					<select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH" class="select small">
						<c:forEach begin="0" end="23" varStatus="i">
							<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
								<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
							</option>
						</c:forEach>
					</select> 시
					<select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM" class="select small">
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
					<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
					<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
					<br/>
					<small class="desc">전시기간은 ‘Today+1일’부터 설정 가능합니다.</small>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>이미지 <i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<div class="tbl_line">
						<a href="<c:out value="${img_domain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
							<c:out value="${row.CMM_FLE_ORG_NM }"/>
						</a>
						<input type="checkbox" class="checkbox" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="file"  value="<c:out value="${row.CMM_FLE_IDX }"/>" />
						<label for="CMM_FLE_IDX">삭제</label>
					</div>
					<div class="tbl_line">
					   <input type="file" name="file" id="file" class="file" disabled="disabled" accept=".png, .jpg"/>
					</div>
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>URL</span></label></th>
				<td>
					<div class="tbl_line">
						<input type="radio" name="BNR_MST_URL_POP" id="BNR_MST_URL_POP1" value="N" <ui:select v="${row.BNR_MST_URL_POP }" t="N" g="checked"/>><label for="BNR_MST_URL_POP1">링크없음</label>
						<input type="radio" name="BNR_MST_URL_POP" id="BNR_MST_URL_POP2" value="P" <ui:select v="${row.BNR_MST_URL_POP }" t="P" g="checked"/>><label for="BNR_MST_URL_POP2">현재창</label>
						<input type="radio" name="BNR_MST_URL_POP" id="BNR_MST_URL_POP3" value="O" <ui:select v="${row.BNR_MST_URL_POP }" t="O" g="checked"/>><label for="BNR_MST_URL_POP3">새창열림</label>
					</div>
					<div class="tbl_line">
						<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text" style="width: 80%;" maxlength="250"  value="<c:out value="${row.BNR_MST_URL }"/>" />
					</div>
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>대체 텍스트<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<textarea  name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="textarea xlarge" style="width: 80%;" maxlength="300">${row.CMN_FLE_ALT_TXT }</textarea>
					<input type="hidden" name="CMN_FLE_ALT_TXT_IDX" value="<c:out value="${row.CMM_FLE_IDX }"/>"/>
				</td>
			</tr>
			
		</tbody>
	</table><!-- // table -->
			
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:goModify();" class="button large primary"><span>저장</span></a>
		<a href="javascript:goList('${codeRow.CMN_COM_IDX}');" class="button large"><span>목록</span></a>
	</div>
</div><!-- // section-button --> 

<%-- <ui:editor objId="#BNR_MST_CONTENTS" /> --%>

<script type="text/javascript">
$(function () {
	var fileFlag = true;
	<%--
	var editorBannerFlag = false;
	<c:if test="${codeRow.CMN_COM_IDX eq Code.MAIN_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_P_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_S_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_M_B_A_CODE or codeRow.CMN_COM_IDX eq Code.BRAND_J_B_A_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_W_B_E_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_M_B_E_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_K_B_E_CODE or codeRow.CMN_COM_IDX eq Code.CATEGORY_A_B_E_CODE	or codeRow.CMN_COM_IDX eq Code.CATEGORY_B_B_E_CODE}" >
		fileFlag = false;
		editorBannerFlag = true;
	</c:if>
	--%>
	
 // 폼체크
    $("#frm").validate({
        rules: 
        {
            BNR_MST_TITLE:{required:true}, // 제목
            BNR_MST_ST_DT:{required:true, date:true}, // 전시기간 시작일
            BNR_MST_ST_HH:{required:true, number:true}, // 전시기간 시작 시
            BNR_MST_ST_MM:{required:true, number:true}, // 전시기간 시작 분
            BNR_MST_ED_DT:{required:true, date:true}, // 전시기간 종료일
            BNR_MST_ED_HH:{required:true, number:true}, // 전시기간 종료 시
            BNR_MST_ED_MM:{required:true, number:true}, // 전시기간 종료 분
            BNR_MST_USE_YN:{required:true}, // 상태
        	file:{required:fileFlag}, // 배너
            CMN_FLE_ALT_TXT:{required:fileFlag}, // 대체텍스트
            BNR_DTL_TARGET:{required:{depends:function(){
              if($("#BNR_DTL_URL").val() != "") return true;
              else return false;
            }}}, // 링크 주소 open 방식
            BNR_MST_URL:{required:{depends:function(){
				if($(':radio[name="BNR_MST_URL_POP"]:checked').val() != "N" ) return true;
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
	$(document).on("change", "#CMM_FLE_IDX", function () {
		/* var $this = $(this);
		var $file = $this.parents(".img-upload").next();
		var $altBox = $file.next();
		debugger;
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
		} */
		
		if(this.checked){
			$("input[name='file']").prop("disabled", false);
		}
		else {
			$("input[name='file']").prop("disabled", true);
			$("input[name='file']").val("");
		}
	});
	
	// submit
	goModify = function () {
		var $frm = $("#frm");
		var url = "<c:out value="${serverDomain}"/>/am/display/themeBannerModify.do";
		if($frm.valid()){
			if($("#initState").val() == 'N' && $("input:radio[name='BNR_MST_USE_YN']:checked").val() == 'Y' && $("#maxListLimit").val() == $("#useListNum").val() ){
				alert("최대 " + $("#maxListLimit").val() +  + "개의 배너를 노출 할 수 있습니다.");
        		return;
			}else if($("#initState").val() == 'Y' && $("input:radio[name='BNR_MST_USE_YN']:checked").val() == 'N' && $("#minListLimit").val() == $("#useListNum").val() ){
				alert($("#minListLimit").val() + "개의 배너를 필수로 등록해야합니다.");
        		return;
			}
			debugger;
			if (confirm( "저장 하시겠습니까?")) {
				$("#frm").attr({"action":url, "target":"_self", "method":"post"}).submit();
			}
		}
	};

	
	 // 목록 이동 함수
	goList = function (idx) 
	{
		var searchGubun = $('input:radio[name=searchGubun]:checked').val();
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : '<c:out value="${serverDomain}"/>/am/display/themeBannerList.do',
			data : {
				   'CMN_COM_IDX' : idx,
				   'searchGubun' : searchGubun
				   },  
			success : function(data){
				$('#main_con').html(data);  
			}
		}); 
		
	}; 
});

</script>
</body>
</html>