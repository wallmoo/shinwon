<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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

				<h2 class="title"><span>입점신청서 관리</span></h2>

				<h3 class="title"><span>상세</span></h3>
	  
				<p>
					<i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
				</p>
				
				<form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                    
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					<input type="hidden" name="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>"/>
					<input type="hidden" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>"/>
					<input type="hidden" name="searchCeoNm" value="<c:out value="${commandMap.searchCeoNm }"/>"/>
					<input type="hidden" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>"/>
				</form>
				<form id="frm" name="frm">
					<input type="hidden" name="VDR_REQ_IDX" id="VDR_REQ_IDX" value="<c:out value="${row.VDR_REQ_IDX }"/>"/>
					<input type="hidden" name="mngMailYn" id="mngMailYn" value=""/>
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>                    
					<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
					<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
					<input type="hidden" name="searchBusiNo" value="<c:out value="${commandMap.searchBusiNo }"/>"/>
					<input type="hidden" name="searchVendorNm" value="<c:out value="${commandMap.searchVendorNm }"/>"/>
					<input type="hidden" name="searchCeoNm" value="<c:out value="${commandMap.searchCeoNm }"/>"/>
					<input type="hidden" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>"/>
						
					<table class="table-row table-a"><!-- table -->
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody> 
							<tr>
								<th><label for="VDR_REQ_GBN">상태</label></th>
								<td colspan="3">
									<select class="select" name="VDR_REQ_GBN" id="VDR_REQ_GBN">
										<option value="N" <c:if test="${row.VDR_REQ_GBN eq 'N' }">selected="selected"</c:if>>접수중</option>
										<option value="Y" <c:if test="${row.VDR_REQ_GBN eq 'Y' }">selected="selected"</c:if>>확인</option>
									</select>
								</td>
							</tr>
							<%--                            
							<tr>
								<th>기간계코드</th>
								<td>
									<input type="text" class="text" name="VDR_REQ_ERP_ID" id="VDR_REQ_ERP_ID" value="<c:out value="${row.VDR_REQ_ERP_ID }"/>" maxlength="50"/>
								</td>
								<th>거래처코드</th>
								<td>
									<input type="text" class="text" name="VDR_REQ_CST_CD" id="VDR_REQ_CST_CD" value="<c:out value="${row.VDR_REQ_CST_CD }"/>" maxlength="20"/>
								</td>
							</tr> 
							--%>  
							<tr>
								<th><label for="VDR_REQ_NM">업체명<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<input type="text" class="text" name="VDR_REQ_NM" id="VDR_REQ_NM" value="<c:out value="${row.VDR_REQ_NM }"/>" maxlength="20"/>
								</td>
								<th><label for="VDR_REQ_CEO_NM">대표자명<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<input type="text" class="text" name="VDR_REQ_CEO_NM" id="VDR_REQ_CEO_NM" value="<c:out value="${row.VDR_REQ_CEO_NM }"/>" maxlength="10"/>
								</td>
							</tr>

							<tr>
								<th><span>사업자등록번호<i class="require"><em>필수입력</em></i><br/>(사업자등록증)</span></th>
								<td colspan="3">
									<div class="tbl_line">
										<input id="VDR_REQ_BUSI1" name="VDR_REQ_BUSI1" type="text" class="text onlyNumber" value="<c:out value="${row.VDR_REQ_BUSI1 }"/>" maxlength="3"> - 
										<input id="VDR_REQ_BUSI2" name="VDR_REQ_BUSI2" type="text" class="text onlyNumber" value="<c:out value="${row.VDR_REQ_BUSI2 }"/>" maxlength="2"> -
										<input id="VDR_REQ_BUSI3" name="VDR_REQ_BUSI3" type="text" class="text onlyNumber" value="<c:out value="${row.VDR_REQ_BUSI3 }"/>" maxlength="5">
										<input type="checkbox" class="checkbox" id="VDR_REQ_SUB_BUSI_CHK"
											<c:if test="${!empty row.VDR_REQ_SUB_BUSI }"> checked</c:if>>
										<label for="checkbox">종사업자번호입력</label>
										<input id="VDR_REQ_SUB_BUSI" name="VDR_REQ_SUB_BUSI" type="text" maxlength="4" class="text onlyNumber" <c:if test="${empty row.VDR_REQ_SUB_BUSI }"> disabled</c:if> value="<c:out value="${row.VDR_REQ_SUB_BUSI }"/>" >
									</div>
									<c:if test="${not empty file}">
										<div class="tbl_line">
											<a href="javascript:;" class="file-list-title" id="fileIdx_<c:out value="${file.CMM_FLE_IDX }"/>" data-url="<c:out value="${cdnDomain }${file.CMM_FLE_ATT_PATH}${file.CMM_FLE_SYS_NM }"/>" data-name="<c:out value="${file.CMM_FLE_ORG_NM }"/>" data-cmm_fle_idx="<c:out value="${file.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${file.CMM_FLE_SAVE_PATH }"/>"> 
	                                              <c:out value="${file.CMM_FLE_ORG_NM }"/> 
	                                              (<c:out value="${file.CMM_FLE_ATT_SIZE / 1000.0 }"/>KB)
	                                           </a> 
										</div>
									</c:if>
									
								</td>
							</tr>
							
							<tr>
								<th><span>사업장주소 <i class="require"><em>필수입력</em></i></span></th>
								<td colspan="3">
									<div class="tbl_line">
										<input type="text" name="VDR_REQ_POST5" id="VDR_REQ_POST5" class="text onlyNumber" maxlength="5" value="<c:out value="${row.VDR_REQ_POST5 }"/>" readonly> 
										<a href="javascript:;" id="zipCheck" class="button button-a small"><span>우편번호 찾기</span></a>
									</div>
									<div class="tbl_line">
										<input type="text" name="VDR_REQ_DR_ADDR1" id="VDR_REQ_DR_ADDR1" class="text half" maxlength="60" value="<c:out value="${row.VDR_REQ_DR_ADDR1 }"/>" readonly>
										<input type="text" name="VDR_REQ_DR_ADDR2" id="VDR_REQ_DR_ADDR2" class="text large" maxlength="60" value="<c:out value="${row.VDR_REQ_DR_ADDR2 }"/>" >
										<input type="hidden" name="VDR_REQ_JB_ADDR1" id="VDR_REQ_JB_ADDR1" maxlength="60" value="<c:out value="${row.VDR_REQ_JB_ADDR1 }"/>" readonly>
										<input type="hidden" name="VDR_REQ_JB_ADDR2" id="VDR_REQ_JB_ADDR2" maxlength="60" value="<c:out value="${row.VDR_REQ_JB_ADDR2 }"/>" readonly>
									</div>
								</td>
							</tr> 
							<tr>
								<th><span>세금계산서 이메일</span></th>
								<td colspan="3">
									<c:set var="email_addr" value="${fn:substringBefore(row.VDR_REQ_TAX_MAIL,'@') }" />
									<c:set var="email_domain" value="${fn:substringAfter(row.VDR_REQ_TAX_MAIL,'@') }" />
									<input type="hidden" id="VDR_REQ_TAX_MAIL" name="VDR_REQ_TAX_MAIL" value="${row.VDR_REQ_TAX_MAIL}"/>
									<input id="VDR_REQ_TAX_MAIL_ADDR" type="text" class="text" value="<c:out value="${email_addr }"/>">
									<span>@</span>
									<input id="VDR_REQ_TAX_MAIL_DOMAIN" type="text" class="text" value="<c:out value="${email_domain }"/>">
									<select id="email_list_sel" class="select">
										<option  value="">직접입력</option>
										<c:forEach var="email_row" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
											 <option value="<c:out value="${email_row.CMN_COM_NM }"/>" <c:if test="${email_row.CMN_COM_NM eq email_domain }">selected="selected"</c:if>><c:out value="${email_row.CMN_COM_NM }"/></option>
										</c:forEach>
								   </select>
									<!-- <input type="text" class="text" name="VDR_REQ_MAIL" id="VDR_REQ_MAIL" value="<c:out value="${row.VDR_REQ_MAIL }"/>" maxlength="50"/> -->
								</td>
							</tr>
							<tr>
								<th><span>업태/업종(종목)<i class="require"><em>필수입력</em></i></span></th>                                        
								<td colspan="3">
									<input type="text" class="text" name="VDR_REQ_BUSI_CDT" id="VDR_REQ_BUSI_CDT" value="<c:out value="${row.VDR_REQ_BUSI_CDT }"/>" maxlength="10"/>                                        
									/
									<input type="text" class="text" name="VDR_REQ_BUSI_TYPE" id="VDR_REQ_BUSI_TYPE" value="<c:out value="${row.VDR_REQ_BUSI_TYPE }"/>" maxlength="10"/>
								</td>
							</tr>
							<tr>
								<th><span>연락처<i class="require"><em>필수입력</em></i></span></th>                                       
								<td>
									<select class="select" name="VDR_REQ_REF_TEL1" id="VDR_REQ_REF_TEL1">
										<c:if test="${not empty codes.TEL_CODE }">  
											<c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
												<option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${row.VDR_REQ_REF_TEL1 eq telRow.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
											</c:forEach>
										</c:if>
									</select>
									<input type="text" name="VDR_REQ_REF_TEL2" id="VDR_REQ_REF_TEL2" class="text short number" maxlength="4" value="<c:out value="${row.VDR_REQ_REF_TEL2 }"/>"/> - 
									<input type="text" name="VDR_REQ_REF_TEL3" id="VDR_REQ_REF_TEL3" class="text short number" maxlength="4" value="<c:out value="${row.VDR_REQ_REF_TEL3 }"/>"/>
								</td>
								<th><span>팩스 </span></th>                                    
								<td>
									<select class="select" name="VDR_REQ_FAX1" id="VDR_REQ_FAX1">
										<c:if test="${not empty codes.TEL_CODE }">
											<c:forEach var="faxRow" items="${codes.TEL_CODE }" varStatus="i">
												<option value="<c:out value="${faxRow.CMN_COM_NM }"/>" <c:if test="${row.VDR_REQ_FAX1 eq faxRow.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${faxRow.CMN_COM_NM }"/></option>
											</c:forEach>
										</c:if>
									</select>
									<input type="text" name="VDR_REQ_FAX2" id="VDR_REQ_FAX2" class="text short number" maxlength="4" value="<c:out value="${row.VDR_REQ_FAX2 }"/>"/> - 
									<input type="text" name="VDR_REQ_FAX3" id="VDR_REQ_FAX3" class="text short number" maxlength="4" value="<c:out value="${row.VDR_REQ_FAX3 }"/>"/>
								</td>
							</tr>
							<tr>
								<th><span>은행명<i class="require"><em>필수입력</em></i></span></th>                                      
								<td>
									<select class="select" name="VDR_REQ_BANK_CD" id="VDR_REQ_BANK_CD">
										<c:if test="${not empty codes.KICC_BANK_CD }">
											<c:forEach var="bankRow" items="${codes.KICC_BANK_CD }" varStatus="i">
												<option value="<c:out value="${bankRow.CMN_COM_ETC1 }"/>" <c:if test="${row.VDR_REQ_BANK_CD eq bankRow.CMN_COM_ETC1 }">selected="selected"</c:if>><c:out value="${bankRow.CMN_COM_NM }"/></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
								<th><span>계좌번호<i class="require"><em>필수입력</em></i></span></th>
								<td>
									<input type="text" class="text onlyNumber" name="VDR_REQ_ACT_NO" id="VDR_REQ_ACT_NO" value="<c:out value="${row.VDR_REQ_ACT_NO }"/>" maxlength="40"/>
								</td>
							</tr>
							<tr>
								<th><span>예금주<i class="require"><em>필수입력</em></i><span></th>
								<td colspan="3">
									<input type="text" class="text" name="VDR_REQ_ACT_HDR" id="VDR_REQ_ACT_HDR" value="<c:out value="${row.VDR_REQ_ACT_HDR }"/>" maxlength="10"/>
								</td>
							</tr>
							<tr>
								<th><span>쇼핑몰명<i class="require"><em>필수입력</em></i></span></th>                                        
								<td colspan="3">
									<input type="text" class="text" name=VDR_REQ_SHP_NM id="VDR_REQ_SHP_NM" value="<c:out value="${row.VDR_REQ_SHP_NM }"/>" >
								</td>
							</tr>
							<tr>
								<th><span>사이트URL</span></th>                                        
								<td colspan="3">
									<input type="text" class="text" name="VDR_REQ_URL" id="VDR_REQ_URL" value="<c:out value="${row.VDR_REQ_URL }"/>" maxlength="256">
								</td>
							</tr>
							<tr>
								<th><span>쇼핑물 분류</span></th>                                        
								<td colspan="3">
									<c:out value="${row.VDR_REQ_SHP_GUBUN}"/>
								</td>
							</tr>
							<tr>
								<th><span>외부채널</span></th>                                        
								<td colspan="3">
								
								  <c:forEach var="channel_list" items="${vendorRouteChannel }" varStatus="status">
									<c:out value="${channel_list.VDR_REQ_CHN_TYPE}"/>
									<c:if test="${status.last ne true}">
									&nbsp;,	
									</c:if>
									  
								  </c:forEach>
								
								</td>
							</tr>
							<tr>
								<th><span>담당자명</span></th>                                        
								<td>
									 <input type="text" class="text" name="VDR_REQ_MNG_NM" id="VDR_REQ_MNG_NM" value="<c:out value="${row.VDR_REQ_MNG_NM }"/>">
								</td>
								<th><span>담당자 연락처<i class="require"><em>필수입력</em></i></span></th>                                        
								<td>
									<select class="select" name="VDR_REQ_TEL1" id="VDR_REQ_TEL1">
										<c:if test="${not empty codes.TEL_CODE }">  
											<c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
												<option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${row.VDR_REQ_TEL1 eq telRow.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
											</c:forEach>
										</c:if>
									</select> -
									 <input type="text" class="text onlyNumber" name="VDR_REQ_TEL2" maxlength="4" id="VDR_REQ_TEL2" value="<c:out value="${row.VDR_REQ_TEL2 }"/>"> -
									 <input type="text" class="text onlyNumber" name="VDR_REQ_TEL3" maxlength="4" id="VDR_REQ_TEL3" value="<c:out value="${row.VDR_REQ_TEL3 }"/>">
								</td>
							</tr>
							<tr>
								<th><span>담당자 휴대폰<i class="require"><em>필수입력</em></i></span></th>                                        
								<td colspan="3">
									<select class="select" name="VDR_REQ_HP1" id="VDR_REQ_HP1">
										<c:if test="${not empty codes.HP_CODE }">  
											<c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
												<option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq memberInfo.MEM_MST_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
											</c:forEach>
										</c:if>
									</select> -
									 <input type="text" class="text onlyNumber" name="VDR_REQ_HP2" maxlength="4" id="VDR_REQ_HP2" value="<c:out value="${row.VDR_REQ_HP2 }"/>"> -
									 <input type="text" class="text onlyNumber" name="VDR_REQ_HP3" maxlength="4" id="VDR_REQ_HP3" value="<c:out value="${row.VDR_REQ_HP3 }"/>">
								</td>
							</tr>
							<tr>
								<th><span>입점경로</span></th>                                        
								<td colspan="3">
									<c:out value="${row.VDR_REQ_PATH }"/>
								</td>
							</tr>
							<tr>
								<th><span>신청일</span></th>                                        
								<td colspan="3" >
									<ui:formatDate  value="${row.VDR_REQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<th><span>수정일</span></th>                                        
								<td colspan="3">
									<ui:formatDate  value="${row.VDR_REQ_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
								</td>
							</tr>
							<tr>
								<th><span>요청사항</span></th>                                        
								<td colspan="3">
									<c:out value="${row.VDR_REQ_CNT }"/>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->

				</form>

				<!-- 우편번호 검색 레이어팝업 -->
				<div id="popAddrSearch" class="pop-address-search-wrapper" style="display:none;top:0px;right:71px">
					<form name="formAPIDiv" id="formAPIDiv" method="post" onsubmit="return false;">
						<input type="hidden" id="confmKey" name="confmKey" value="TESTJUSOGOKR" style="width:400px"/>
						<input type="hidden" id="currentPage" name="currentPage"  value="1" style="width:100px"/>
						<input type="hidden" id="countPerPage" name="countPerPage" value="5" style="width:100px"/>
						<input type="hidden" name="countPageTot" value=""/> 
						<div class="pop-address-search-form pop-address-search-layer3">
							<div class="pop-address-header">
								<a class="close" style="text-align:right;" href="#" onClick="document.getElementById('popAddrSearch').style.display='none'; return false;">x   </a>
								<h1 style="text-align:center; font-size:20px">우편번호 검색</h1>
							</div>
							<div class="pop-address-body">      
								<fieldset class="pop-address-field">
									<legend>도로명주소 검색</legend>       
									<span class="pop-addr-wrap">  
										<div class="pop-keyword">                    
											<input type="text" id="keyword" align="center" name="keyword" onkeypress="enterSearchDiv();" style="width:70%" title="검색어 입력" placeholder= "도로명주소, 건물명 또는 지번 입력">
										   <%--   <a href="javascript:searchDivButton();" title="검색"><span class="blind"><img src="<c:out value="${cdnDomain}" />/pc/img/lay/ico_sh.gif" alt=""></span></a>  --%>
											 <!-- <a href="javascript:searchDivButton();" class="button button-b"><span>검색</span></a> -->
											<input type="button" style='cursor:pointer;'   onclick="javascript:searchDivButton();" value="검색"> 
										</div>   
									</span> 
								</fieldset>
								<p class="text-guide"> * 해당되는 주소를 선택해주세요.</p>
								<table class="data-col" align="center">
									<caption>검색 결과</caption>
									<colgroup>
										<col style="width:90px">
										<col style="width: 380px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">우편번호</th>
											<th scope="col">도로명주소</th>
										</tr>
									</thead>
									<tbody  id="listDiv"></tbody> <!-- 주소검색한 목록 출력 -->
								</table>
								<div class="paginate" id="pageApiDiv"></div>    <!-- 주소 검색한 목록 페이지 -->        
								<div id="totalCntDiv"></div>
							</div>
						</div>
					</form> 
				</div><!-- //우편번호 검색 레이어팝업 -->
				
				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
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
<link rel="stylesheet" type="text/css" href="<c:out value="${serverDomain}" />/am/css/postAddr.css">
<script src="<c:out value="${serverDomain}" />/am/js/postAddr.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>    
$(function(){  
		
var $frm = $("#frm");
	
	$('#VDR_REQ_SUB_BUSI_CHK').on('change', function(){
		if($(this).is(':checked'))
			$('#VDR_REQ_SUB_BUSI').prop('disabled', false);
		else
			$('#VDR_REQ_SUB_BUSI').prop('disabled', true);
	});
	
	// 폼체크
	$frm.validate({
		rules: {
			VDR_REQ_NM:{required:true}, // 입점업체명
			VDR_REQ_BUSI1:{required:true, maxlength:3},
			VDR_REQ_BUSI2:{required:true},
			VDR_REQ_BUSI3:{required:true},
			VDR_REQ_CEO_NM:{required:true}, // 대표자명
			VDR_REQ_POST5:{required:true, number:true, maxlength:5}, // 신 우편번호 5자리
			VDR_REQ_DR_ADDR1:{required:true}, // 도로명 기본 주소
			VDR_REQ_DR_ADDR2:{required:true}, // 도로명 상세 주소
			VDR_REQ_BUSI_CDT:{required:true}, // 업태
			VDR_REQ_BUSI_TYPE:{required:true}, // 업종
			VDR_REQ_REF_TEL1:{required:true},   // 전화앞자리
			VDR_REQ_REF_TEL2:{required:true, minlength:3, maxlength:4}, // 전화중간자리
			VDR_REQ_REF_TEL3:{required:true, minlength:4, maxlength:4}, // 전화뒷자리
			VDR_REQ_BANK_CD:{required:true},    // 은행명
			VDR_REQ_ACT_NO:{required:true}, // 계좌번호
			VDR_REQ_ACT_HDR:{required:true},    // 예금주
			VDR_REQ_SHP_NM:{required:true},    // 쇼핑몰
			VDR_REQ_TEL1:{required:true},   // 전화앞자리
			VDR_REQ_TEL2:{required:true, minlength:3, maxlength:4}, // 전화중간자리
			VDR_REQ_TEL3:{required:true, minlength:4, maxlength:4}, // 전화뒷자리
			VDR_REQ_HP1 : {required:true},
			VDR_REQ_HP2 : {required:true, number:true, minlength:3, maxlength:4},
			VDR_REQ_HP3 : {required:true, number:true, minlength:3, maxlength:4}
		},
		messages :{
			VDR_REQ_NM:{required:"[업체명]은 필수 입력사항입니다."},
			VDR_REQ_BUSI1:{required:"[사업자등록번호]는 필수 입력사항입니다.", maxlength:"최대 3자리까지 입력가능합니다."},
			VDR_REQ_BUSI2:{required:"[사업자등록번호]는 필수 입력사항입니다."},
			VDR_REQ_BUSI3:{required:"[사업자등록번호]는 필수 입력사항입니다."},
			VDR_REQ_CEO_NM:{required:"[대표자명]은 필수 입력사항입니다."},
			VDR_REQ_POST5:{required:"[우편번호]를 검색해주세요."},
			VDR_REQ_DR_ADDR1:{required:"[도로명주소 앞자리]는 필수 입력사항입니다."},
			VDR_REQ_DR_ADDR2:{required:"[도로명주소 뒷자리]는 필수 입력사항입니다."},
			VDR_REQ_BUSI_CDT:{required:"[업태]는 필수 입력사항입니다."},
			VDR_REQ_BUSI_TYPE:{required:"[업종]은 필수 입력사항입니다."},
			VDR_REQ_REF_TEL1:{required:"[전화번호 앞자리]는 필수 선택사항입니다."},
			VDR_REQ_REF_TEL2:{required:"[전화번호 중간자리]는 필수 입력사항입니다."},
			VDR_REQ_REF_TEL3:{required:"[전화번호 뒷자리]는 필수 입력사항입니다."},
			VDR_REQ_BANK_CD:{required:"[은행명]은 필수 선택사항입니다."},
			VDR_REQ_ACT_NO:{required:"[계좌번호]는 필수 입력사항입니다."},
			VDR_REQ_ACT_HDR:{required:"[예금주]는 필수 입력사항입니다."},
			VDR_REQ_SHP_NM:{required:"[쇼핑몰명]은 필수 입력사항입니다."},
			VDR_REQ_TEL1:{required:"[전화번호 앞자리]는 필수 선택사항입니다."},
			VDR_REQ_TEL2:{required:"[전화번호 중간자리]는 필수 입력사항입니다."},
			VDR_REQ_TEL3:{required:"[전화번호 뒷자리]는 필수 입력사항입니다."},
			VDR_REQ_HP1 : {required:"[담당자 휴대폰 앞자리]는 필수 선택사항입니다."},
			VDR_REQ_HP2 : {required:"[담당자 휴대폰 중간자리]는 필수 입력사항입니다."},
			VDR_REQ_HP3 : {required:"[담당자 휴대폰 뒷자리]는 필수 입력사항입니다."}
		}
	});
	
	// 목록 버튼 클릭 이벤트 
	$(document).on("click", "#goList", function () {
	   $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorReqList.do", "target":"_self", "method":"post"}).submit(); 
	});
	
	// 수정 이벤트
	$(document).on("click", "#goRegist", function () {    	
		if($frm.valid()){
			if($('#VDR_REQ_SUB_BUSI_CHK').is(':checked')){
				console.log($('#VDR_REQ_SUB_BUSI').val().length + "::");
				if($('#VDR_REQ_SUB_BUSI').val().length <= 0) {
					alert('종사업자번호를 입력해주세요.');
					return false;
				}
			}
			
			var curEmail = $('#VDR_REQ_TAX_MAIL_ADDR').val();
			if($('#email_list_sel option:selected').val().length <= 0) {
				curEmail += "@" + $('#VDR_REQ_TAX_MAIL_DOMAIN').val();
			} else {
				curEmail += "@" + $('#email_list_sel option:selected').val();
			}
			
			$('#VDR_REQ_TAX_MAIL').val(curEmail);

			if (confirm( "저장 하시겠습니까?")) {
				$frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorReqModify.do", "target":"_self", "method":"post"}).submit();
			}           
		}
	});
	
	 // 파일 다운로드
	$(document).on("click", ".file-list-title", function () {
		var $fileForm = $("#fileForm");
		var $this = $(this);
		$fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
		$fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
		$fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.data("name"));
		$fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
	});

//    // 담당자에게 메일보내기, 실제 운용시 controller, impl, sql 다 확인 수정해야 함
//    $(document).on("click","#goMngEmail",function(){
//      if($frm.valid()){  
//          if (confirm( "담당자에게 메일 보내시겠습니까?")) {     
//              $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorReqSendEmail.do", "target":"_self", "method":"post"}).submit();
//          }           
//      }
//    });

	 // 우편번호 찾기 클릭 이벤트
    $(document).on("click","#zipCheck",function(){
    	daumPost();
    });
	
});

/*우편번호찾기 > 선택한 주소의 데이터 콜백 */
function openApiDivCallBack(roadFullAddr,roadAddrPart1,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList){
	document.frm.VDR_REQ_POST5.value = zipNo ;
	document.frm.VDR_REQ_DR_ADDR1.value = roadAddrPart1 + roadAddrPart2 ;
	document.frm.VDR_REQ_DR_ADDR2.value = "" ;
	document.frm.VDR_REQ_JB_ADDR1.value = jibunAddr;
	document.frm.VDR_REQ_JB_ADDR2.value = "";
	document.getElementById('popAddrSearch').style.display='none';  //div 닫기
	//검색 후 해당 주소를 선택 -> div 닫음
}

function daumPost() {
	new daum.Postcode({
		oncomplete : function(data) {
            document.getElementById('VDR_REQ_POST5').value = data.zonecode;
            document.getElementById("VDR_REQ_DR_ADDR1").value = data.roadAddress;
		}
	}).open();
}

</script>

</body>
</html>
