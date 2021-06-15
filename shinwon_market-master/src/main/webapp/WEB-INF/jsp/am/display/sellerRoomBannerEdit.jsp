<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.market.mall.common.constants.DSP_BAN_CODE"%>
<c:set var="CONST_MOV" value="<%= DSP_BAN_CODE.DSP_BAN_EVENT_MOV %>"/>

<h3 class="title"><span>배너 수정</span></h3>

<p>
	<i class="require"><em>필수입력</em></i> ${bnrCatList[0].CMN_COM_ETC3 }
</p>
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
	<input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${commandMap.BNR_MST_GBN }"/>" />
	<input type="hidden" name="CMM_FLE_TB_TYPE" value="I" />
	<input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
	<input type="hidden" name="BNR_DTL_IDX" id="BNR_DTL_IDX" value="<c:out value="${row.BNR_DTL_IDX }"/>" />
	<table cellspacing="0" class="table-row table-a"><!-- table -->
		<colgroup>
			<col style="width: auto;" />
			<col style="width: auto;" />
		</colgroup>
		<tbody>
			<tr>
				<th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" class="radio" value="Y" <ui:select v="${row.BNR_MST_USE_YN }" t="Y" g="checked"/> />
					<label for="BNR_MST_USE_YN1">사용</label>
					<input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN2" class="radio" value="N" <ui:select v="${row.BNR_MST_USE_YN }" t="N" g="checked"/> />
					<label for="BNR_MST_USE_YN1">미사용</label>
				</td>
			</tr>
			<tr>
				<th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" style="width: 80%;" maxlength="150" value="<c:out value="${row.BNR_MST_TITLE }"/>"/>
				</td>
			</tr>
			
			
			<tr  id='tr_BNR_MST_SUB_TITLE'  >
				<th><label class="label"><span>서브 타이틀</span></label></th>
				<td>
					<input type="text" name="BNR_MST_SUB_TITLE" id="BNR_MST_SUB_TITLE" class="text xlarge" style="width: 80%;" maxlength="150" value="<c:out value="${row.BNR_MST_SUB_TITLE }"/>"/>
				</td>
			</tr>
			
			<tr  id='tr_BNR_MST_DESC' >
				<th><label class="label"><span>상세내용</span></label></th>
				<td>
					<input type="text" name="BNR_MST_DESC" id="BNR_MST_DESC" class="text xlarge" style="width: 80%;" maxlength="250" value="<c:out value="${row.BNR_MST_DESC }"/>"/>
				</td>
			</tr>			
			
			
			<!-- 
			<tr>
				<th><label class="label"><span>서브 타이틀</span></label></th>
				<td>
					<input type="text" name="BNR_MST_SUB_TITLE" id="BNR_MST_SUB_TITLE" class="text xlarge" style="width: 80%;" maxlength="150" value="<c:out value="${row.BNR_MST_SUB_TITLE }"/>"/>
				</td>
			</tr>
	    	-->
			<tr>
				<th><label class="label"><span>전시기간<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<div class="tbl_line">
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT" value="<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
						<select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH">
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM">
							<c:forEach begin="0" end="59" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ST_MM }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 분 ~
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
						<input type="text" class="text" id="BNR_MST_ED_DT" name="BNR_MST_ED_DT"  readonly="readonly" data-target-start="#BNR_MST_ST_DT" value="<ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy-MM-dd"/>"/>
						<select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH">
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>" <ui:select v="${row.BNR_MST_ED_HH }" t="${i.index < 10?'0':'' }${i.index }" g="selected"/>>
									<c:out value="${i.index < 10?'0':'' }"/><c:out value="${i.index }"/>
								</option>
							</c:forEach>
						</select> 시
						<select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM">
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
					</div>
					<div class="tbl_line">
						(날짜형식: YYYY-MM-DD) <small class="desc">전시기간은 ‘Today+1일’부터 설정 가능합니다.</small>
					</div>
				</td>
			</tr>

		     <c:choose>
		         <c:when test = "${bnrCatList[0].CMN_COM_ETC1 eq CONST_MOV}">
		         
					<tr>
						<th><label class="label"><span>URL<i class="require"><em>필수입력</em></i></span></label></th>
						<td>
							<div class="tbl_line">
								<input type="hidden" id="required_url" value="Y"/>
								<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text" value="<c:out value="${row.BNR_MST_URL }"/>" style="width: 80%;" maxlength="200" />
							</div>
						</td>
					</tr>
		         </c:when>
		         <c:otherwise>
					<c:if test="${not empty fileList }">
						<c:forEach var="row" items="${fileList }" varStatus="i">
							<c:set var="CMN_FLE_ALT_TXT" value="${row.CMN_FLE_ALT_TXT }" />
							<c:set var="CMM_FLE_IDX" value="${row.CMM_FLE_IDX }" />
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
								    	<input type="hidden" id="required_file" value="N"/>
								    	<input type="file" name="file" id="file" class="file" disabled="disabled"/>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</c:otherwise>
				</c:choose>
					<!-- 
					<tr>
						<th><label class="label"><span>BG COLOR</span></label></th>
						<td>
							#<input type="text" name="BNR_MST_HEX_CD" id="BNR_MST_HEX_CD" class="text" maxlength="6" value="<c:out value="${row.BNR_MST_HEX_CD }"/>"/> (예시. 155766)
						</td>
					</tr>
					 -->
					<c:choose>
					 <c:when test = "${bnrCatList[0].CMN_COM_ETC1 eq RESELLER_BAN_CODE.DSP_BAN_PLAN}">
					 <tr>
                           <th><label class="label"><span>상품<i class="require"><em>필수입력</em></i></span></label></th>
                           <td>
                               <div id="productBox">
                					<div class="section-form addFormCon productSelectform" data-type="basic">
                    					<input type="hidden" name="groupNum" class="groupNum" value="0"/>
					                    <table cellspacing="0" class="table-row table-a"><!-- table -->
					                        <tbody>
					                            <tr>
					                                <td>
					                                    <div class="grid section-button-search left"><!-- section button -->
					                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small goProductDelete"><span>선택삭제</span></a>
					                                        <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
					                                    </div><!-- // section button -->
					                                    <table class="table-row table-a">
					                                        <colgroup>
					                                            <col style="width: 10%;" />
					                                            <col style="width: 8%;" />
					                                            <col style="width: auto;" />
					                                            <col style="width: 10%;" />
					                                            <col style="width: 15%;" />
					                                            <col style="width: 10%;" />
					                                            <col style="width: 8%;" />
					                                        </colgroup>
					                                        <thead>
					                                            <tr>
					                                                <th><input type="checkbox" class="checkbox checkAll" /></th>
					                                                <th>상품코드</th>
					                                                <th>이미지</th>
					                                                <th>상품명</th>
					                                                <th>판매상태</th>
					                                                <th>등록일</th>
					                                                <th>전시순서</th>
					                                            </tr>
					                                        </thead>
					                                        <tbody class="applyProductList">
					                                        <c:if test="${not empty bnrProList }">
						                                        <c:forEach var="bnr" items="${bnrProList }" varStatus="i">
						                                        
																<tr>
																    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="${bnr.PRD_MST_CD }"/></td>
																    <td><a href="${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD="${bnr.PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">${bnr.PRD_MST_CD}</a><input type="hidden" class="CNT_PRD_MST_CD" name="CNT_PRD_MST_CD${bnr.NUM}" value="${bnr.PRD_MST_CD}"/><input type="hidden" name="PRD_MST_CD_LIST" value="${bnr.PRD_MST_CD}"/></td>
																	<td><span class="thumbnail_img"><img src=" ${cdnDomain}${bnr.PRD_IMAGE}"></span></td>
																    <td class="left"> <a href="${FRONT_URL}/pc/product/product.do?prdMstCd=${bnr.PRD_MST_CD}&ADMIN=Y" target="_blank">${bnr.PRD_MST_NM}</a></td>
																    <td>${bnr.PRD_MST_SEL_STATE}</td>
																	<td>${bnr.PRD_MST_REG_DT}</td>
																    <td>
																        <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
																 		<a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
																		<input type="hidden" name="CNT_DTL_ORDER_${bnr.NUM}_${bnr.PRD_MST_CD}" value="${bnr.CNT_DTL_ORDER}"></input>
																    </td>
																</tr>
					                                            
					                                            						                                        
						                                        </c:forEach>
					                                        </c:if>
					                                        <c:if test="${empty bnrProList }">
					                                            <tr class="productNodata">
					                                            </tr>					                                        
					                                        </c:if>					                                        
					                                        
					                                        <!-- bnrProductList 내용을 뿌려준다.  -->

					                                            
					                                            
					                                        </tbody>
					                                    </table>
					                                </td>
					                            </tr>
					                        </tbody>
					                    </table>
				                    </div><!-- //section-form addFormCon -->
				                </div><!-- //id="product" -->
                           </td>
                       </tr>
		         </c:when>
		         <c:otherwise>
					<tr>
						<th><label class="label"><span>URL<i class="require"><em>필수입력</em></i></span></label></th>
						<td>
							<div class="tbl_line">
								<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT1" value="D" <ui:select v="${row.BNR_MST_TGT }" t="D" g="checked"/>><label for="BNR_MST_TGT1">링크없음</label>
								<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT2" value="S" <ui:select v="${row.BNR_MST_TGT }" t="S" g="checked"/>><label for="BNR_MST_TGT2">현재창</label>
								<input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT3" value="N" <ui:select v="${row.BNR_MST_TGT }" t="N" g="checked"/>><label for="BNR_MST_TGT3">새창열림</label>
								<br />
								<input type="text" name="BNR_MST_URL" id="BNR_MST_URL" class="text" value="<c:out value="${row.BNR_MST_URL }"/>" style="width: 80%;" maxlength="200" />
							</div>
							<div class="tbl_line">
								<small class="desc" style="color:red;">* 팝업에 등록되는 배너는 현재창으로 링크가 안됩니다.</small>
							</div>
						</td>
					</tr>
				</c:otherwise>
				
	      </c:choose>
			<tr>
				<th><label class="label"><span>대체 텍스트<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<textarea  name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="textarea xlarge" style="width: 80%;" maxlength="300">${CMN_FLE_ALT_TXT }</textarea>
					<input type="hidden" name="CMN_FLE_ALT_TXT_IDX" value="<c:out value="${CMM_FLE_IDX }"/>"/>
				</td>
			</tr>
			
		</tbody>
	</table><!-- // table -->
			
</form>
<div class="section-button"><!-- section-button -->
	<div class="wrap text-center">
		<a href="javascript:goModify();" class="button large primary"><span>저장</span></a>
		<a href="javascript:goList('${codeRow.CMN_COM_IDX}');" class="button large"><span>목록</span></a>
		<a href="javascript:goDelete();" class="button large"><span>삭제</span></a>
	</div>
</div><!-- // section-button --> 
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<%-- <ui:editor objId="#BNR_MST_CONTENTS" /> --%>
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
    <td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="CNT_PRD_MST_CD" name="CNT_PRD_MST_CD\${NUM}" value="\${PRD_MST_CD}"/><input type="hidden" name="PRD_MST_CD_LIST" value="\${PRD_MST_CD}"/></td>
	<td><span class="thumbnail_img"><img src="\${PRD_IMAGE}"></span></td>
    <td class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
    <td>\${PRD_MST_SEL_STATE}</td>
	<td>\${PRD_MST_REG_DT}</td>
    <td>
		<c:if test="${row.CNT_DTL_ORDER ne 1 }">
        <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.CNT_DTL_ORDER ne fn:length(list) }">
 		<a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="CNT_DTL_ORDER_\${NUM}_\${PRD_MST_CD}" value="\${CNT_DTL_ORDER}"></input>
    </td>
</tr>
</script>

<script type="text/javascript">
$(function () {
	
	
	var fileFlag = false;
	var urlFlag = false;
	
	if($('#required_file').val() == 'Y') fileFlag = true;
	if($('#required_url').val() == 'Y') urlFlag = true;
	
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
			BNR_MST_ED_MI:{required:true, number:true}, // 전시기간 종료 분
			BNR_MST_USE_YN:{required:true}, // 상태
			file:{required:fileFlag}, // 배너
			CMN_FLE_ALT_TXT:{required:fileFlag}, // 대체텍스트
			BNR_MST_TGT:{required:{depends:function(){
				if(urlFlag == true) return false;
				else if($("#BNR_MST_URL").val() != "") return true;
			  	else return false;
			}}}, // 링크 주소 open 방식
			BNR_DTL_URL:{required:{depends:function(){
				if(urlFlag == true) return true;
				else if( $(':radio[name="BNR_MST_TGT"]:checked').val() != "D" ) return true;
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
			BNR_MST_ED_MI:{required:"종료분은 필수 선택사항입니다.", number:"종료분은 숫자만 입력해 주십시오."}
		}
	});
 

	// 파일 삭제 check box 변경 이벤트
	$(document).on("change", "input[name=CMM_FLE_IDX]", function () {
		var $this = $(this);
		var $file = $this.parents(".tbl_line").next().find('input');
		//var $altBox = $file.next();
		
		//var str = "";
		//str += "<span>대체텍스트</span>";
		//$altBox.empty();
		
		console.log($file);
		if($this.is(":checked"))
		{
			$file.prop("disabled", false);   
			$('#required_file').val('Y');
		}
		else
		{
			//$("#CMN_FLE_ALT_TXT").reset();
			$file.val("");
			$file.prop("disabled", true);
			$('#required_file').val('N');
		}
	});
	
	function hasExtension(inputID, exts) {
	    var fileName = document.getElementById(inputID).value;
	    return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
	}
	
	// submit
	goModify = function () {
		
		if($('#required_file').val() == 'Y' && !hasExtension('file', ['.jpg', '.gif', '.png'])) {
			alert('이미지만 업로드 가능합니다.');
		} else {
			var $frm = $("#frm");
			var url = "<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerModify.do";
			if($frm.valid()){
				
				if (confirm( "저장 하시겠습니까?")) {
					$("#frm").attr({"action":url, "target":"_self", "method":"post"}).submit();
				}
			}
			
		}
	};
	
	// submit
	goDelete = function () {
		var $frm = $("#frm");
		var url = "<c:out value="${serverDomain}"/>/am/display/bannerDisplayDelete.do";
		if($frm.valid()){
			console.log(url);
			if (confirm( "삭제 하시겠습니까?")) {
				$("#frm").attr({"action":url, "target":"_self", "method":"post"}).submit();
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
	
	// 목록 이동 함수
	goList = function (idx) 
	{
		//var searchGubun = $('input:radio[name=searchGubun]:checked').val();
		$.ajax({
			type : "POST",
			async:true,
			dataType :"html",
			url : '<c:out value="${serverDomain}"/>/am/display/sellerRoomBannerList.do',
			data : {
				   'CMN_COM_IDX' : idx,
				   'searchGubun' : $("#searchGubun").val()
				   },  
			success : function(data){
				$('#main_con').html(data);  
			}
		}); 
		
	}; 
	
	var $productBox = null;
    $(document).on("click", "#productBox .search-product-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".productSelectform");

        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });	
    
    
    

	//상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
        var bCheck = true;
        //상품중복체크
        $.each( params, function( index, el ){
            if( !fnDuplicationChk( el.PRD_MST_CD )){
                alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
                bCheck = false;
                return false;
            }
        });

        //기본TR삭제
        $productBox.find(".productNodata").remove();
        //배열재정의
        var arrayObj = new Array();
        var len = $productBox.find(".applyProductList .CNT_PRD_MST_CD").length;

        var obj;
        if( bCheck ){

            $.each(params, function(index,item){
            	debugger;
                len++;
                obj = new Object();
                obj.PRD_MST_CD              = item.PRD_MST_CD;
                obj.PRD_MST_NM          = item.PRD_MST_NM;
                obj.PRD_MST_PRC         = setComma(item.PRD_MST_PRC);
                obj.PRD_MST_DLV_FEE     = setComma(item.PRD_MST_DLV_FEE);
                obj.PRD_MST_SEL_STATE       = item.PRD_MST_SEL_STATE;
                obj.VDR_MST_NM            = item.VDR_MST_NM;
                obj.CNT_DTL_ORDER            = len;
                obj.NUM = $productBox.find(".groupNum").val();
                if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
                {
                    obj.PRD_MST_SEL_STATE_CLASS = "b";
                }
                else
                {
                    obj.PRD_MST_SEL_STATE_CLASS = "a";
                }

                if ( item.PRD_MST_CNL_PC_YN == 'Y' && item.PRD_MST_CNL_MB_YN == 'Y' )
                {
                    obj.PRD_MST_CHANNEL_TYPE = "전체";
                }
                else if ( item.PRD_MST_CNL_PC_YN == 'Y' )
                {
                    obj.PRD_MST_CHANNEL_TYPE = "PC";
                }
                else if ( item.PRD_MST_CNL_MB_YN == 'Y' )
                {
                    obj.PRD_MST_CHANNEL_TYPE = "MOBILE";
                }

                obj.FRONT_URL = '<c:out value="${frontDomain}" />';

                obj.serverDomain            = '<c:out value="${serverDomain}" />';

				obj.PRD_MST_REG_DT = item.PRD_MST_REG_DT;
                obj.PRD_IMAGE = item.PRD_IMAGE;
                arrayObj.push(obj); //만들어진  object를 배열에 추가
            });
            

            $( "#productTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));
        }
        return true;
    };    
    
    
    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .CNT_PRD_MST_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };    
    

    $(document).on("click", ".goProductDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 상품을 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyProductList").children("tr").each(function() {

            if($(this).find(".checkRow").is(":checked"))
            {
                $(this).remove();
            }
        });
        
        //사용상품 삭제시 순서 재배치
        var index = 1;
        $topParent.find(".applyProductList").children("tr").each(function() {
        	$(this).children()[9].children[2].value = index++;
        });

        if($topParent.find(".applyProductList").children("tr").length == 0)
        {
            $topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAll").prop("checked", false);

    });
        
    
});



$(document).ready(function(){
    
	if ( '<c:out value="${commandMap.CMN_COM_IDX }"/>'  == '3617' ){
		$('#tr_BNR_MST_SUB_TITLE').show();
		$('#tr_BNR_MST_DESC').show();
		
	}else {
		$('#tr_BNR_MST_SUB_TITLE').hide();
		$('#tr_BNR_MST_DESC').hide();
		
	}

});


</script>
</body>
</html>