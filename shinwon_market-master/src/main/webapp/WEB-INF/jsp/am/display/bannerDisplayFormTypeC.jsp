<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3 class="title">상품상세 공지 배너 등록</h3>

<p>
	<i class="require"><em>필수입력</em></i> 배너사이즈 : ${bnrCatList[0].CMN_COM_ETC3 }
</p>
<p>
	<i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
</p>

<form name="frm" id="frm" enctype="multipart/form-data">
	<input type="hidden" name="CMN_COM_IDX" id="CMN_COM_IDX" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" />
	<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${commandMap.BNR_MST_GBN }"/>" />
	<table cellspacing="0" class="table-row table-a"><!-- table -->
		<colgroup>
			<col style="width: auto;" />
			<col style="width: auto;" />
		</colgroup>
		<tbody>
			<tr>
				<th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" class="radio" value="Y" checked=true/>
					<label for="BNR_MST_USE_YN1">사용</label>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" class="radio" value="N"/>
					<label for="BNR_MST_USE_YN1">미사용</label>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" style="width: 80%;" maxlength="150"/>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>서브 타이틀</span></label></th>
				<td>
					<input type="text" name="BNR_MST_SUB_TITLE" id="BNR_MST_SUB_TITLE" class="text xlarge" style="width: 80%;" maxlength="150"/>
				</td>
			</tr>
	   
			<tr>
				<th><label class="label"><span>전시기간<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<div class="tbl_line">
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT"/>
						<select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH">
							<option value="">선택</option>
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.first}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }" /><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM">
							<option value="">선택</option>
							<c:forEach begin="0" end="59" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.first}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 분 ~
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text" id="BNR_MST_ED_DT" name="BNR_MST_ED_DT"  readonly="readonly" data-target-start="#BNR_MST_ST_DT"/>
						<select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH">
							<option value="">선택</option>
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.last}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM">
							<option value="">선택</option>
							<c:forEach begin="0" end="59" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.last}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 분
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
						<a href="javascript:fnDateSet('BNR_MST_ST_DT', 'BNR_MST_ED_DT', 0, 0, 1, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
					</div>
					<div class="tbl_line">
						(날짜형식: YYYY-MM-DD) <small class="desc">전시기간은 ‘Today+1일’부터 설정 가능합니다.</small>
					</div>
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>배너 <i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="file" name="file" id="file" class="file"/>
					<input type="hidden" name="CMM_FLE_TB_TYPE" value="I" />
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>배너<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="file" name="file" id="file2" class="file"/>
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>BG COLOR</span></label></th>
				<td>
					#<input type="text" name="BNR_MST_HEX_CD" id="BNR_MST_HEX_CD" class="text" maxlength="6"/> (예시. 155766)
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>URL</span></label></th>
				<td>
					<div class="tbl_line">
						<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT1" value="D" checked="checked"><label for="BNR_MST_TGT1">링크없음</label>
						<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT2" value="S"><label for="BNR_MST_TGT2">현재창</label>
						<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT3" value="N"><label for="BNR_MST_TGT3">새창열림</label>
					</div>
					<div class="tbl_line">
						<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text" style="width: 80%;" maxlength="200"/>
					</div>
					<div class="tbl_line">
						<small class="desc" style="color:red;">* 팝업에 등록되는 배너는 현재창으로 링크가 안됩니다.</small>
					</div>
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>대체 텍스트<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<textarea  name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="textarea xlarge" style="width: 80%;" maxlength="300"></textarea>
				</td>
			</tr>
			
		</tbody>
	</table><!-- // table -->
			
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
		<%-- <a href="javascript:goList('${codeRow.CMN_COM_IDX}');" class="button large"><span>목록</span></a> --%>
	</div>
</div><!-- // section-button --> 

<%-- <ui:editor objId="#BNR_MST_CONTENTS" /> --%>

<script type="text/javascript">
$(function () {
	var fileFlag = true;
	
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
	
	/*
	// 목록 이동 함수
	goList = function () 
	{
		var $searchForm = $("#searchForm");
		var url = "<c:out value="${serverDomain}"/>/am/display/bannerDisplayList.do";
		var param = $searchForm.serialize();
		callPageLoad(url, param);
		
	};
	*/
	// submit 
	goRegist = function () {
		var $frm = $("#frm");
		var url = "<c:out value="${serverDomain}"/>/am/display/bannerDisplayRegist.do";
		if($frm.valid())
		{
			
			if (confirm( "저장 하시겠습니까?")) 
			{
				$frm.attr({"action":url, "target":"_self", "method":"post"}).submit();
			}
		}
	};
	
	 // 페이지 로드
	callPageLoad = function (url, param) 
	{
		$("#main_con").empty();
		$("#main_con").load(url, param, function () {
			treePageSetting();
		});
	};
});

</script>
</body>
</html>