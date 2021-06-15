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

                <h2 class="title"><span>입점사정보  등록</span></h2>
				
				<div class="push-guide instant"><!-- push-guide -->
                    <i class="icon"><!-- icon --></i>
                    <h3 class="title"><span>기본정보 (<i class="require"><em>필수입력</em></i> 필수항목)</span></h3>
                </div><!-- // push-guide -->
                
                <form id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchVdrMstUseYn" value="<c:out value="${commandMap.searchVdrMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
 
                <form id="frm" name="frm">
                    <input type="hidden" name="vdrMstCheckYn" id="vdrMstCheckYn"/>
                  	<input type="hidden" name="VDR_MST_ERP_ID" id="VDR_MST_ERP_ID"/>
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>입점업체명 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan=3>
                                    <input type="text" name="VDR_MST_NM" id="VDR_MST_NM" class="text" maxlength="15" readonly="readonly" placeholder="입점업체명 검색후 선택"/>
		                            <a href="javascript:vendorSearch();" class="button button-b small"><span>검색</span></a>
                                </td>
                            </tr>
                            <tr>
                            	<th><span>브랜드명</span></th>
                            	<td colspan=3>“브랜드관리에서 등록 된 브랜드명이 표시됩니다.”</td>
                            </tr>
                            <tr>
                                <th><span>사업자번호 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan=3>
                                    <input type="text" name="VDR_MST_BUSI1" id="VDR_MST_BUSI1" class="text short number" maxlength="3" placeholder="입력"/> - 
		                            <input type="text" name="VDR_MST_BUSI2" id="VDR_MST_BUSI2" class="text short number" maxlength="2" placeholder="입력"/> -
		                            <input type="text" name="VDR_MST_BUSI3" id="VDR_MST_BUSI3" class="text short number" maxlength="5" placeholder="입력"/>
		                            <input type="checkbox" class="checkbox" id="vdrSubBusi"><label>종사업자번호 입력</label>
		                            <input type="text" name="VDR_MST_SUB_BUSI" id="VDR_MST_SUB_BUSI" class="text short number" readonly="readonly"/>
                                </td>
                            </tr>
                            <tr>
                            	<th><span>대표자명 <i class="require"><em>필수입력</em></i></span></th>
                            	<td colspan=3>
                            		<input type="text" name="VDR_MST_CEO_NM" id="VDR_MST_CEO_NM" class="text" maxlength="10" placeholder="대표자명"/>	
                            	</td>
                            </tr>
                            <tr>	
                            	<th><span>업종/업태 <i class="require"><em>필수입력</em></i></span></th>
                            	<td colspan=3>
                            		<input type="text" name="VDR_MST_BUSI_CDT" id="VDR_MST_BUSI_CDT" class="text" maxlength="15" placeholder="업종입력"/> / 
	                                <input type="text" name="VDR_MST_BUSI_TYPE" id="VDR_MST_BUSI_TYPE" class="text" maxlength="15" placeholder="업태입력"/>
                            	</td>
                            </tr>
                            <tr>
                            	<th><span>사업장주소 <i class="require"><em>필수입력</em></i></span></th>
                            	<td colspan=3>
                            		<input type="text" name="VDR_MST_POST5" id="VDR_MST_POST5" class="text number" maxlength="5" readonly="readonly" />
		                            <a href="javascript:jusoPopUp();" id="searchPostBtn" class="button button-a small"><span>우편번호 찾기</span></a>
		                            <span><br/></span>
		                            <input type="text" name="VDR_MST_DR_ADDR1" id="VDR_MST_DR_ADDR1" class="text large" maxlength="60" readonly="readonly" style="margin-top:5px;"/>
		                            <input type="text" name="VDR_MST_DR_ADDR2" id="VDR_MST_DR_ADDR2" class="text large" maxlength="60" style="margin-top:5px;" placeholder="나머지 주소 입력"/>
		                            <input type="hidden" name="VDR_MST_JB_ADDR1" id="VDR_MST_JB_ADDR1"/>
		                            <input type="hidden" name="VDR_MST_JB_ADDR2" id="VDR_MST_JB_ADDR2"/>
                            	</td>
                            </tr>
                            <tr>
                            	<th><span>사업장 전화번호/팩스</span></th>
                            	<td colspan=3>
                            		<select class="select" name="VDR_MST_TEL1" id="VDR_MST_TEL1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
		                                    <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
		                                        <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" name="VDR_MST_TEL2" id="VDR_MST_TEL2" class="text short number" maxlength="4"/ placeholder="번호입력"> - 
		                            <input type="text" name="VDR_MST_TEL3" id="VDR_MST_TEL3" class="text short number" maxlength="4" placeholder="번호입력"/>
									<span style="margin-top:5px;"><br/></span>
		                            <select class="select" name="VDR_MST_FAX1" id="VDR_MST_FAX1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
		                                    <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
		                                        <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" name="VDR_MST_FAX2" id="VDR_MST_FAX2" class="text short number" maxlength="4" placeholder="번호입력"/> - 
		                            <input type="text" name="VDR_MST_FAX3" id="VDR_MST_FAX3" class="text short number" maxlength="4" placeholder="번호입력"/>
                            	</td>
                            </tr>
                            <tr>
                            	<th><span>대표이메일</span></th>
                            	<td colspan=3>
                            		<input type="text" name="VDR_MST_EMAIL_ID" id="VDR_MST_EMAIL_ID" class="text" maxlength="20" placeholder="이메일 입력"/> @
		                            <input type="text" name="VDR_MST_EMAIL_DOMAIN" id="VDR_MST_EMAIL_DOMAIN" class="text" maxlength="20" placeholder="직접입력"/>
		                            <input type="hidden" name="VDR_MST_MAIL" id="VDR_MST_MAIL"/>
		                            <select class="select" name="emailDomain" id="emailDomain">
		                                <option value="">직접입력</option>
		                                <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
		                                    <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
		                                        <option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select>
                            	</td>
                            </tr>
                            <tr>
                            	<th><span>담당MD <i class="require"><em>필수입력</em></i></span></th>
                            	<td colspan=3>
                            		<select class="select" name="VDR_MST_MD_ID" id="VDR_MST_MD_ID">
	                                   <option value="">선택</option>
	                                   <c:if test="${not empty managerMDList }">
	                                       <c:forEach var="managerMDRow" items="${managerMDList }" varStatus="i">
	                                           <option value="<c:out value="${managerMDRow.ADM_MST_ID }"/>"><c:out value="${managerMDRow.ADM_MST_NM }"/></option>
	                                       </c:forEach>
	                                   </c:if>
	                               </select>
                            	</td>
                            </tr>
                            <tr>	
                            	<th><span>상태 <i class="require"><em>필수입력</em></i></span></th>
                            	<td colspan=3>
                            		<input type="radio" id="stateA" name="VDR_MST_USE_YN" value="Y" class="radio" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" id="stateB" name="VDR_MST_USE_YN" value="N" class="radio" />
		                            <label for="stateB">미사용</label>
                            	</td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                    
                    <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>정산/계약 정보</h3>
	                </div><!-- // push-guide -->
	                
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><span>정산주기 <i class="require"><em>필수입력</em></i></span></th>
	                    		<td>
	                    			<select class="select" name="VDR_MST_BAL_ACT" id="VDR_MST_BAL_ACT">
	                                   <option value="">선택</option>
	                                   <option value="10">10일</option>
	                                   <option value="15">15일</option>
	                                   <option value="30">30일</option>
	                                </select>	
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>은행/계좌번호/예금주 <i class="require"><em>필수입력</em></i></span></th>
	                    		<td>
	                    			<select class="select" name="VDR_MST_BANK_CD" id="VDR_MST_BANK_CD">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.KICC_BANK_CD }">
		                                    <c:forEach var="bankRow" items="${codes.KICC_BANK_CD }" varStatus="i">
		                                        <option value="<c:out value="${bankRow.CMN_COM_ETC1 }"/>"><c:out value="${bankRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select>
		                            <input type="text" name="VDR_MST_ACT_NO" id="VDR_MST_ACT_NO" class="text number large" maxlength="16" placeholder="계좌번호 입력"/>
		                            <input type="text" name="VDR_MST_ACT_HDR" id="VDR_MST_ACT_HDR" class="text small" maxlength="10" placeholder="예금주명 입력"/>
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>계약기간</span></th>
	                    		<td>
	                    			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                    			<input type="text" name="VDR_MST_CTR_ST_DT" id="VDR_MST_CTR_ST_DT" class="text date" data-target-end="#VDR_MST_CTR_ED_DT"/> ~
	                    			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                	<input type="text" name="VDR_MST_CTR_ED_DT" id="VDR_MST_CTR_ED_DT" class="text date" data-target-start="#VDR_MST_CTR_ST_DT"/>	
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>계약일</span></th>
	                    		<td>
	                    			<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                    			<input type="text" name="VDR_MST_CTR_DT" id="VDR_MST_CTR_DT" class="text date" />	
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>수수료</span></th>
	                    		<td>
	                    			<input type="text" name="VDR_MST_FEE" id="VDR_MST_FEE" class="text number" maxlength="2" placeholder="수수료입력"/> %
	                    		</td>
	                    	</tr>
	                    </tbody>
                    </table>
                    
                    <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>배송비정보</h3>
	                </div><!-- // push-guide -->
	                
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><span>배송비무료조건 <i class="require"><em>필수입력</em></i></span></th>
	                    		<td>
	                    			주문금액 <input type="text" name="VDR_MST_DLV_PRICE" id="VDR_MST_DLV_PRICE" class="text number large" maxlength="8" placeholder="금액입력"/> 원 이상	
	                    		</td>
	                    	</tr>
	                    </tbody>
	                </table>
	                
	                <div class="push-guide instant"><!-- push-guide -->
	                    <i class="icon"><!-- icon --></i>
	                    <h3 class="title"><span>업체 담당자정보</h3>
	                </div><!-- // push-guide -->
	                
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><span>담당자명 <i class="require"><em>필수입력</em></i></span></th>
	                    		<td>
	                    			<input type="text" name="VDR_MST_MNG_NM" id="VDR_MST_MNG_NM" class="text" maxlength="10" placeholder="담당자명 입력"/>	
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>휴대폰<i class="require"><em>필수입력</em></i></span></th>
	                    		<td>
	                    			<select class="select" name="VDR_MST_MNG_HP1" id="VDR_MST_MNG_HP1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.HP_CODE }">
		                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
		                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select>
		                            <input type="text" name="VDR_MST_MNG_HP2" id="VDR_MST_MNG_HP2" class="text short number" maxlength="4" placeholder="번호입력"/> - 
		                            <input type="text" name="VDR_MST_MNG_HP3" id="VDR_MST_MNG_HP3" class="text short number" maxlength="4" placeholder="번호입력"/>
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>연락처</span></th>
	                    		<td>
	                    			<select class="select" name="VDR_MST_MNG_TEL1" id="VDR_MST_MNG_TEL1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
		                                    <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
		                                        <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select>
		                            <input type="text" name="VDR_MST_MNG_TEL2" id="VDR_MST_MNG_TEL2" class="text short number" maxlength="4" placeholder="번호입력"/> - 
		                            <input type="text" name="VDR_MST_MNG_TEL3" id="VDR_MST_MNG_TEL3" class="text short number" maxlength="4" placeholder="번호입력"/>
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>이메일</span></th>
	                    		<td>
	                    			<input type="text" name="VDR_MST_MNG_EMAIL_ID" id="VDR_MST_MNG_EMAIL_ID" class="text" maxlength="15" placeholder="이메일 입력"/> @
		                            <input type="text" name="VDR_MST_MNG_EMAIL_DOMAIN" id="VDR_MST_MNG_EMAIL_DOMAIN" class="text" maxlength="15" placeholder="직접 입력"/>
		                            <input type="hidden" name="VDR_MST_MNG_MAIL" id="VDR_MST_MNG_MAIL"/>
		                            <select class="select" name="emailDomain" id="emailDomainMng">
		                                <option value="">직접입력</option>
		                                <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
		                                    <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
		                                        <option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select>
	                    		</td>
	                    	</tr>
	                    	<tr>
	                    		<th><span>업무구분</span></th>
	                    		<td>
	                    			<select class="select" name="VDR_MST_MNG_TYPE" id="VDR_MST_MNG_TYPE">
	                                    <option value="">선택</option>
	                                    <c:if test="${not empty codes.WORK_DIVISION_CODE }">
	                                        <c:forEach var="workRow" items="${codes.WORK_DIVISION_CODE }" varStatus="i">
	                                            <option value="<c:out value="${workRow.CMN_COM_IDX }"/>"><c:out value="${workRow.CMN_COM_NM }"/></option>
	                                        </c:forEach>
	                                    </c:if>
	                                </select>
	                    		</td>
	                    	</tr>
	                    </tbody>
	                </table>
                </form>
                
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
	                                        <input type="button" style='cursor:pointer;' id=""  onclick="javascript:searchDivButton();" value="검색"> 
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
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
            </div><!-- // container -->

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
<link rel="stylesheet" type="text/css" href="<c:out value="${serverDomain}" />/am/css/postAddr.css">
<script src="<c:out value="${serverDomain}" />/am/js/postAddr.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 폼체크
    $("#frm").validate({
        rules: {
        	VDR_MST_NM:{required:true}, // 입점업체명
        	VDR_MST_BUSI1:{required:true, number:true, minlength:3, maxlength:3}, // 사업자번호 앞 자리
        	VDR_MST_BUSI2:{required:true, number:true, minlength:2, maxlength:2}, // 사업자번호 중간 자리
        	VDR_MST_BUSI3:{required:true, number:true, minlength:5, maxlength:5}, // 사업자번호 끝 자리
        	VDR_MST_CEO_NM:{required:true}, // 대표자명
        	VDR_MST_BUSI_CDT:{required:true}, // 업태
        	VDR_MST_BUSI_TYPE:{required:true}, // 업종
        	VDR_MST_POST5:{required:true, number:true, maxlength:5}, // 신 우편번호 5자리
        	VDR_MST_DR_ADDR1:{required:true}, // 기본 주소
        	VDR_MST_DR_ADDR2:{required:true}, // 상세 주소
        	VDR_MST_MD_ID:{required:true},		// 담당MD
        	VDR_MST_BAL_ACT:{required:true}, // 정산주기
        	VDR_MST_BANK_CD:{required:true}, // 은행명
        	VDR_MST_ACT_NO:{required:true, number:true}, // 계좌번호
        	VDR_MST_ACT_HDR:{required:true}, // 예금주
        	VDR_MST_FEE:{required:false},	// 수수료
        	VDR_MST_DLV_PRICE:{required:true, number:true, maxlength:8}, // 배송비 무료조건
        	VDR_MST_MNG_NM:{required:true}, // 담당자명
        	VDR_MST_EMAIL_ID:{required:false , emailId:true, maxlength:20}, // 이메일 아이디(대표)
            VDR_MST_EMAIL_DOMAIN:{required:false, emailDomain:true, maxlength:20}, // 이메일 도메인(대표)
            VDR_MST_MNG_EMAIL_ID:{required:false, emailId:true, maxlength:20}, // 이메일 아이디(담당자)
            VDR_MST_MNG_EMAIL_DOMAIN:{required:false, emailDomain:true, maxlength:20} // 이메일 도메인(담당자)
        },
        messages :{
        	VDR_MST_NM : {required:"검색해 주십시오."},
        	VDR_MST_BUSI1 : {required:"첫 자리는 필수입력 사항입니다.", number:"첫 자리는 숫자만 입력해 주십시오."},
        	VDR_MST_BUSI2 : {required:"중간 자리는 필수입력 사항입니다.", number:"중간 자리는 숫자만 입력해 주십시오."},
        	VDR_MST_BUSI3 : {required:"끝 자리는 필수입력 사항입니다.", number:"끝 자리는 숫자만 입력해 주십시오."},   
        	VDR_MST_EMAIL_ID : {emailId:"아이디의 형식에 맞게 입력해 주십시오."},
        	VDR_MST_EMAIL_DOMAIN : {emailDomain:"도메인의 형식에 맞게 입력해 주십시오."},
        	VDR_MST_MNG_EMAIL_ID : {emailId:"아이디의 형식에 맞게 입력해 주십시오."},
        	VDR_MST_MNG_EMAIL_DOMAIN : {emailDomain:"도메인의 형식에 맞게 입력해 주십시오."}
        }
    });
    
 	// 입점업체 검색 팝업
    vendorSearch = function(){
    	window.open("<c:out value="${serverDomain}"/>/am/site/searchVendorPopup.do","searchVendorPopup","width=800,height=700,scrollbars=yes,target=_blank");	
    };
    
    // 입점업체 callback 함수
    fnResultErpVendor = function(vdrNm,vdrErpId,vdrBusi1,vdrBusi2,vdrBusi3,vdrCeoNm,vdrBusiCdt,vdrBusiType,vdrPost5,vdrDrAddr1,vdrDrAddr2,vdrJbAddr1,vdrJbAddr2,vdrTel1,vdrTel2,vdrTel3,vdrFax1,vdrFax2,vdrFax3,vdrBankCd,vdrActNo,vdrActHdr,vdrCstCd, vdrReqSubBusi, vdrReqHp1, vdrReqHp2, vdrReqHp3, vdrReqRefTel1 , vdrReqRefTel2, vdrReqRefTel3, vdrReqRefMngNm, vdrReqMail ){
    	$("#VDR_MST_NM").val(vdrNm);
    	$("#VDR_MST_ERP_ID").val(vdrErpId);
    	$("#VDR_MST_CST_CD").val(vdrCstCd);
    	$("#VDR_MST_BUSI1").val(vdrBusi1);
    	$("#VDR_MST_BUSI2").val(vdrBusi2);
    	$("#VDR_MST_BUSI3").val(vdrBusi3);
    	$("#VDR_MST_CEO_NM").val(vdrCeoNm);
    	$("#VDR_MST_BUSI_CDT").val(vdrBusiCdt);
    	$("#VDR_MST_BUSI_TYPE").val(vdrBusiType);
    	$("#VDR_MST_POST5").val(vdrPost5);
    	$("#VDR_MST_DR_ADDR1").val(vdrDrAddr1);
    	$("#VDR_MST_DR_ADDR2").val(vdrDrAddr2);
    	$("#VDR_MST_JB_ADDR1").val(vdrJbAddr1);
    	$("#VDR_MST_JB_ADDR2").val(vdrJbAddr2);
    	$("#VDR_MST_TEL1").val(vdrReqRefTel1);
    	$("#VDR_MST_TEL2").val(vdrReqRefTel2);
    	$("#VDR_MST_TEL3").val(vdrReqRefTel3);
    	$("#VDR_MST_FAX1").val(vdrFax1);
    	$("#VDR_MST_FAX2").val(vdrFax2);
    	$("#VDR_MST_FAX3").val(vdrFax3);
    	$("#VDR_MST_BANK_CD").val(vdrBankCd);
    	$("#VDR_MST_ACT_NO").val(vdrActNo);
    	$("#VDR_MST_ACT_HDR").val(vdrActHdr);
    	$("#VDR_MST_SUB_BUSI").val(vdrReqSubBusi);
    	$("#VDR_MST_MNG_HP1").val(vdrReqHp1);
    	$("#VDR_MST_MNG_HP2").val(vdrReqHp2);
    	$("#VDR_MST_MNG_HP3").val(vdrReqHp3);
    	$("#VDR_MST_MNG_TEL1").val(vdrTel1);
    	$("#VDR_MST_MNG_TEL2").val(vdrTel2);
    	$("#VDR_MST_MNG_TEL3").val(vdrTel3);
    	$("#VDR_MST_MNG_NM").val(vdrReqRefMngNm);
    	if(vdrReqSubBusi){
    		$("input:checkbox[id='vdrSubBusi']").prop("checked", true);
    	}
    };
    
    // 도메인 변경 이벤트(입점업체)
    $(document).on("change", "#emailDomain", function () {
        var $obj = $("#VDR_MST_EMAIL_DOMAIN");
        var value = $(this).val();
        if(value == "") 
        {
            $obj.removeAttr("readonly");    
        }
        else
        {
            $obj.attr("readonly", "readonly");
        }
        
        $obj.val($(this).val());
        
    });
    
    // 도메인 변경 이벤트(담당자)
    $(document).on("change", "#emailDomainMng", function () {
        var $obj = $("#VDR_MST_MNG_EMAIL_DOMAIN");
        var value = $(this).val();
        if(value == "") 
        {
            $obj.removeAttr("readonly");    
        }
        else
        {
            $obj.attr("readonly", "readonly");
        }
        
        $obj.val($(this).val());
        
    });

    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/vendorManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 입점업체 중복 체크
    vdrMstCheck = function(){
    	var VDR_MST_NM = $("#VDR_MST_NM").val();        // 해당 업체명
    	var VDR_MST_BUSI1 = $("#VDR_MST_BUSI1").val();  // 사업자 번호1
    	var VDR_MST_BUSI2 = $("#VDR_MST_BUSI2").val();  // 사업자 번호2
    	var VDR_MST_BUSI3 = $("#VDR_MST_BUSI3").val();  // 사업자 번호3
    	
    	// 필수 값 확인
    	if(VDR_MST_NM != "" && VDR_MST_BUSI1 != "" && VDR_MST_BUSI2 != "" && VDR_MST_BUSI3 != ""){
		    $.ajax({
	            async : false,
	            type : "POST",
	            data : { 
	                   "VDR_MST_NM": VDR_MST_NM,        
	                   "VDR_MST_BUSI1": VDR_MST_BUSI1, 
	                   "VDR_MST_BUSI2": VDR_MST_BUSI2,  
	                   "VDR_MST_BUSI3": VDR_MST_BUSI3   
	                   },
	            url : "<c:out value="${serverDomain}" />/am/site/vendorManagerNmCheckAjax.do",
	            success : function (data) {
	                if(data.successYn == "Y")
	                {
	                    $("#vdrMstCheckYn").val(data.resultYn);
	                }
	                else
	                {
	                    alert("데이터 전송중 데이터가 누락 되었습니다./n다시 시도해 주십시오.");
	                    return;
	                }
	            },
	            error : function () {
	                alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
	            }
	        });
    	}
    	else
    	{ 
    		 alert("데이터가 누락 되었습니다./n다시 시도해 주십시오.");
             return;
    	}
    };
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
    	
        var $frm = $("#frm"); 
        
        if($("#VDR_MST_EMAIL_ID").val() != "" && $("#VDR_MST_EMAIL_DOMAIN").val() != ""){
        	$("#VDR_MST_MAIL").val($("#VDR_MST_EMAIL_ID").val() + "@" + $("#VDR_MST_EMAIL_DOMAIN").val());	// 대표_이메일
        }
        
        if($("#VDR_MST_MNG_EMAIL_ID").val() != "" && $("#VDR_MST_MNG_EMAIL_DOMAIN").val() != ""){
        	$("#VDR_MST_MNG_MAIL").val($("#VDR_MST_MNG_EMAIL_ID").val() + "@" + $("#VDR_MST_MNG_EMAIL_DOMAIN").val());	// 담당자_이메일
        }
        
       	$("#VDR_MST_JB_ADDR2").val($("#VDR_MST_DR_ADDR2").val());	// 도로명 상세주소 값을 지번 상세주소 값에 저장
       	
        if($frm.valid()){
        	
        	// 입점업체명 중복체크
           	vdrMstCheck();
        	
        	if($("#VDR_MST_FEE").val() == 0){
        		alert("수수료는 0보다 커야합니다.");
        		$("#VDR_MST_FEE").focus();
        		return;
        	}
        	
        	if($("#vdrMstCheckYn").val() == "Y"){
        		if (confirm( "저장 하시겠습니까?")) {
        			$("#VDR_MST_ERP_ID").attr("disabled",false);
        			$("#VDR_MST_CST_CD").attr("disabled",false);
            		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/vendorManagerRegist.do", "target":"_self", "method":"post"}).submit();
                }        		
        	}
        	else if($("#vdrMstCheckYn").val() == "N"){
        		alert("이미 등록된 입점업체입니다.");
        		return;
        	}
        	else{
        		alert("데이터 오류 입니다. 다시 시도 해 주십시오.");	
        	}
        }
    });
    
});

/*우편번호찾기 > 주소 선택 후 콜백 */
function openApiDivCallBack(roadFullAddr,roadAddrPart1,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList){
    document.frm.VDR_MST_POST5.value = zipNo ;
    document.frm.VDR_MST_DR_ADDR1.value = roadAddrPart1 + roadAddrPart2 ;
    document.frm.VDR_MST_DR_ADDR2.value = "";
    document.getElementById('popAddrSearch').style.display='none';  //div 닫기
    //검색 후 해당 주소를 선택 -> div 닫음
       
}
</script>

</body>
</html>
