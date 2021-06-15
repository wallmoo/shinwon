<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<h3 class="title"><span>배너 등록</span></h3>
	<div class="grid section-button-list">
		<div class="col-1-2 text-left">콘텐츠명 : 이미지 사이즈 (콘텐츠 정의)</div>		
	</div>
	<form name="frm" id="frm" enctype="multipart/form-data">
	<input type="hidden" name="CMN_COM_IDX" value="<c:out value="${codeRow.CMN_COM_IDX }"/>" />
	<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="BNR_MST_ENV" name="BNR_MST_ENV" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" id="useListNum" name="useListNum" value="<c:out value="${commandMap.useListNum}"/>"/>
	<input type="hidden" id="unUseListNum" name="unUseListNum" value="<c:out value="${commandMap.unUseListNum}"/>"/>
	<input type="hidden" id="minListLimit" name="minListLimit" value="<c:out value="${commandMap.minListLimit}"/>"/>
	<input type="hidden" id="maxListLimit" name="maxListLimit" value="<c:out value="${commandMap.maxListLimit}"/>"/>
	<table cellspacing="0" class="table-row table-a">
		<colgroup>
			<col style="width:15%">
			<col style="width:85%">
		</colgroup>
		<tbody>
			<tr>
				<th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" value="Y" checked="checked"><label for="BNR_MST_USE_YN1">사용</label>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" value="N"><label for="BNR_MST_USE_YN2">미사용</label>
				</td>
			</tr>
 			<tr>
				<th><label class="BNR_MST_TITLE">제목<i class="require"><em>필수입력</em></i></label></th>
				<td>
					<input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" maxlength="150"/>
				</td>
			</tr>
			<tr>
				<th><span>전시기간<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<div class="tbl_line">
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text small" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT"/>
						<select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.first}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }" /><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="59" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.first}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 분 ~
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text small" id="BNR_MST_ED_DT" name="BNR_MST_ED_DT"  readonly="readonly" data-target-start="#BNR_MST_ST_DT"/>
						<select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH" class="select small">
							<option value="">선택</option>
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <c:if test="${i.last}">selected</c:if>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM" class="select small">
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
						* 전시기간은 ‘Today+1일’부터 설정 가능합니다.
					</div>
				</td>
			</tr>
			
			<tr>
				<th><label class="">이미지 <i class="require"><em>필수입력</em></i></label></th>
				<td>
					<input type="file" name="file" id="" class="file" accept=".jpg, .png">
				</td>
			</tr>

            <!-- <tr>
                <th><span>이미지 <i class="require"><em>필수입력</em></i></span></th>
                <td>
                    <div id="divCategory">
                        <div class="text-right">
                            <a href="#" id="" class="button button-a small"><span>선택삭제</span></a>
                            <a id="" href="" class="button button-b small primary" title="새 창 으로 열립니다."><span>카테고리 추가</span></a>
                        </div>
                        <table class="table-row table-a mt10" id="tableCategory">
                            <colgroup>
                                <col style="width:33px;">
                                <col style="width:auto;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th class="ac"><input type="checkbox" class="checkbox checkAll_P"></th>
                                    <th class="ac">카테고리 경로</th>
                                </tr>
                            </thead>
                            <tbody id="applyCategoryList_P">
                                <tr>
                                    <th><input type="checkbox" class="checkbox" name="" value=""></th>
                                    <td class="left">여성 &gt; TOP &gt; 티셔츠<input type="hidden" name="" value=""></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr> -->
    

			<tr>
				<th><span>URL<i class="require"><em>필수입력</em></i></span></th>
				<td>
					<div class="tbl_line">
						<input type="radio" name="BNR_MST_URL_POP" id="BNR_MST_URL_POP1" value="N" checked="checked"><label for="BNR_MST_URL_POP1">링크없음</label>
						<input type="radio" name="BNR_MST_URL_POP" id="BNR_MST_URL_POP2" value="P"><label for="BNR_MST_URL_POP2">현재창</label>
						<input type="radio" name="BNR_MST_URL_POP" id="BNR_MST_URL_POP3" value="O"><label for="BNR_MST_URL_POP3">새창열림</label>
					</div>
					<div class="tbl_line">
						<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text xlarge" maxlength="250"/>
					</div>
					<div class="tbl_line">
						* 팝업에 등록되는 배너는 현재창으로 링크가 안됩니다.
					</div>
				</td>
			</tr>

			<tr>
				<th><label class="CMN_FLE_ALT_TXT">대체 텍스트<i class="require"><em>필수입력</em></i></label></th>
				<td>
                    <div class="tbl_line">
					   <textarea  name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="textarea xlarge" maxlength="300"></textarea>
                    </div>
                    <div class="tbl_line">
                        * 브랜드 메뉴는 대체 텍스트를 입력해주세요.
                    </div>
				</td>
			</tr>
			
		</tbody>
	</table><!-- // table -->
			
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
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
			BNR_MST_TGT:{required:{depends:function(){
			  if($("#BNR_MST_URL").val() != "" ) return true;
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
	

	var searchGubun = $('input:radio[name=searchGubun]:checked').val();


	
    /* $.ajax({
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
    });  */
    
     // 목록 이동 함수
    goList = function (idx){
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
    
    // submit 
    goRegist = function () {
        var $frm = $("#frm");
        var url = "<c:out value="${serverDomain}"/>/am/display/themeBannerRegist.do";
        if($frm.valid())
        {
        	if($("#useListNum").val()==$("#maxListLimit").val() && $("input:radio[name='BNR_MST_USE_YN']:checked").val() == 'Y'){
				alert("최대 " + $("#maxListLimit").val() + "개의 배너를 노출 할 수 있습니다.");
        		return;
        	}
        	
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