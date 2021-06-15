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

                <h2 class="title"><span>카드행사</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form name="searchForm" id="searchForm">
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    	<input type="hidden" name="searchCrdPmtGbn" value="<c:out value="${commandMap.searchCrdPmtGbn }"/>"/>
                    	<input type="hidden" name="searchCrdPmtNm" value="<c:out value="${commandMap.searchCrdPmtNm }"/>"/>
                    	<input type="hidden" name="searchCrdPmtUseYn" value="<c:out value="${commandMap.searchCrdPmtUseYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="rownum" value="0"/>
                </form>
                
                <form name="frm" id="frm" enctype="multipart/form-data"> 
			  		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                   	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                   	<input type="hidden" name="searchCrdPmtGbn" value="<c:out value="${commandMap.searchCrdPmtGbn }"/>"/>
                   	<input type="hidden" name="searchCrdPmtNm" value="<c:out value="${commandMap.searchCrdPmtNm }"/>"/>
                   	<input type="hidden" name="searchCrdPmtUseYn" value="<c:out value="${commandMap.searchCrdPmtUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="rownum" value="0"/>
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>프로모션 종류<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<c:if test="${not empty cardEventCodeList }">
		 	                    		<c:forEach var="gbRow" items="${cardEventCodeList }" varStatus="i">
				                            <input type="radio" name="CRD_PMT_GBN" id="state<c:out value="${i.index}" />" class="radio" value="<c:out value="${gbRow.CMN_COM_IDX }"/>" <c:if test="${i.index eq 2 }">checked="checked"</c:if>/>
				                            <label for="state<c:out value="${i.index }"/>"><c:out value="${gbRow.CMN_COM_NM }"/></label>
		                            	</c:forEach>
		                            </c:if>
	                    		</td>
	                        
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>프로모션명 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			 <input type="text" name="CRD_PMT_NM" id="CRD_PMT_NM" class="text xlarge"/>
	                    		</td>
	                        </tr>
	                   
	                        <tr><!-- row -->
	                            <th><label class="label"><span>프로모션기간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                            	<input type="text" class="text" id="CRD_PMT_ST_DT" name="CRD_PMT_ST_DT"  readonly="readonly" data-target-end="#CRD_PMT_ED_DT"/>
	                               	<select id="CRD_PMT_ST_HH" name="CRD_PMT_ST_HH" class="CRD_PMT_ST_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                        		<c:set var="hh" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="hh" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${i.index eq 0}">selected="selected"</c:if>>${hh}</option>
		                        	</c:forEach>
                        			</select>시
                        			 
			                        <select id="CRD_PMT_ST_MM" name="CRD_PMT_ST_MM" class="CRD_PMT_ST_MM">
			                        	<option value="">분</option>
			                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                        		<c:set var="mm" value="${i.index}"/>
			                        		<c:if test="${i.index < 10}">
			                        			<c:set var="mm" value="0${i.index}"/>
			                        		</c:if>
			                        		<option value="${mm}" <c:if test="${i.index eq 0}">selected="selected"</c:if>>${mm}</option>
			                        	</c:forEach>
			                         </select>분
		                            ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="CRD_PMT_ED_DT" name="CRD_PMT_ED_DT"  readonly="readonly" data-target-start="#CRD_PMT_ST_DT"/>
									<select id="CRD_PMT_ED_HH" name="CRD_PMT_ED_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <c:if test="${status.last}">selected</c:if>>${hour }</option>
									</c:forEach>
									</select> 시
									<select id="CRD_PMT_ED_MM" name="CRD_PMT_ED_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <c:if test="${status.last}">selected</c:if>>${minute }</option>
									</c:forEach>
									</select> 분
	                            
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" name="CRD_PMT_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="CRD_PMT_USE_YN" id="stateB" class="radio" value="N" />
		                            <label for="stateB">중지</label>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                	
                	<h3 class="title"><span>카드사선택</span></h3>
                	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="text-right">
	                        <a href="#none" id="addCardEvent" class="button small primary addCardEvent"><span>추가</span></a>
	                        <a href="#none" id="delCardEvent" class="button small delCardEvent"><span>삭제</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
                	
               
                	<div id="cardTable">
	                	<table cellspacing="0" class="table-row table-a"><!-- table -->
		                    <colgroup>
		                        <col style="width: 5%;" />
								<col style="width: auto;" />
								<col style="width: 10%;" />
								<col style="width: 15%;" />
								<col style="width: 15%;" />
								<col style="width: 15%;" />
								<col style="width: 20%;" />
								<col style="width: 10%;" />
		                    </colgroup>
		                    <thead>
								<tr>
									<th><input type="checkbox" class="checkbox checkAll" /></th>
									<th>카드명</th>
									<th>적립구분</th>
									<th>최대적립율/원</th>
									<th>최소구매금액</th>
									<th>최대적립금액</th>
									<th>비고</th>
									<th>노출여부</th>
								</tr>
							</thead>
		                    <tbody class="applyCardList">
                                <tr class="cardNodata"><!-- row -->
                                    <td colspan="8" align="center">행사 카드를 추가해 주세요.</td>
                                </tr>
							</tbody>
	                	</table><!-- // table -->
                	</div>
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

<ui:editor objId="#CRD_PMT_PC_BANNER" num="1"/>
<ui:editor objId="#CRD_PMT_MOBILE_BANNER" num="2"/>	
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<!-- template -->
<script id="cardTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="CRD_PMT_IDXs" value="\${CRD_PMT_IDX}"/></td>
	<td><select class="selectCard" name="PMT_CRD_IDX" id="PMT_CRD_IDX\${NUM}">
           	<c:if test="${not empty cardCodeList }">
				<option value="" selected="selected">선택</option>
	      		<c:forEach var="gbRow" items="${cardCodeList }" varStatus="i">
	       			<option value="<c:out value="${gbRow.CMN_COM_IDX }"/>">
	   					<c:out value="${gbRow.CMN_COM_NM }"/>
	        		</option>	      
			    </c:forEach>
		    </c:if>
        </select>
	</td>
	<td>
		<select class="select" name="PMT_CRD_SAL_GBN" id="PMT_CRD_SAL_GBN\${NUM}">
			<option value="R" selected="selected">정율</option>
			<option value="M">정액</option>	
		</select>
	</td>
	<td><input type="number" class="text number right" name="PMT_CRD_SAL_PRC" id="PMT_CRD_SAL_PRC\${NUM}" /> 만원 / %</td>
	<td><input type="number" class="text number right" name="PMT_CRD_SML_PRC" id="PMT_CRD_SML_PRC\${NUM}" /> 만원</td>
	<td><input type="number" class="text number right" name="PMT_CRD_MXM_PRC" id="PMT_CRD_MXM_PRC\${NUM}" /> 만원</td>
	<td><input type="text" class="text" name="PMT_CRD_ETC" id="PMT_CRD_ETC\${NUM}" maxlength="20" style="width:80%;"/></td>
	<td>
		<select class="select" name="PMT_CRD_DPL_YN" id="PMT_CRD_DPL_YN\${NUM}">
			<option value="Y" selected="selected">&nbsp;&nbsp;Y&nbsp;&nbsp;</option>
			<option value="N">&nbsp;&nbsp;N&nbsp;&nbsp;</option>	
		</select>
	</td>
</tr>
</script>
<script id="productGroupTemplate" type="text/x-jquery-tmpl">
<div class="section-form" data-type="basic">
<input type="hidden" name="groupNum" class="groupNum" value="\${NUM}"/>
<div class="form-group">                
	<label class="label"><span>그룹명<em class="strong">*</em></span></label>
	<div class="field">
		<input type="radio" class="select CRD_GRP_TYPE" name="CRD_GRP_TYPE\${NUM}" id="stateGroupA" class="radio" value="T" checked="checked"/>
		<label for="stateGroupA">Text등록</label>
	    <input type="text" name="CRD_GRP_TITLE\${NUM}" class="text long CRD_GRP_TITLE" maxlength="66"/>
	</div>
</div>
 
<div class="planGroupColArea">
	<div class="form-group">                
	<label class="label"><span></span></label>
	<div class="field">
	 	<input type="radio" class="select CRD_GRP_TYPE" name="CRD_GRP_TYPE\${NUM}" id="stateGroupB" class="radio" value="I"/>
		<label for="stateGroupB">이미지등록</label>
		<input type="file" name="fileGroup\${NUM}" id="multiFileGroup\${NUM}" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
	</div>
	<div class="form-group">                
	<label class="label"><span>진열개수</span></label>
		<div class="field">
	    	<input type="radio" class="select CRD_GRP_COL" name="CRD_GRP_COL\${NUM}" id="stateA" class="radio" value="4" checked="checked"/>
		    <label for="stateA">4열</label>
		    <input type="radio" class="select CRD_GRP_COL" name="CRD_GRP_COL\${NUM}" id="stateB" class="radio" value="3" />
		    <label for="stateB">3열</label>
		    <input type="radio" class="select CRD_GRP_COL" name="CRD_GRP_COL\${NUM}" id="stateC" class="radio" value="2" />
		    <label for="stateC">2열</label>
	    </div>
	</div>
	<div class="form-group">                
		<label class="label"><span>전시순서</span></label>
		<div class="field">
		 	<input type="text" name="CRD_GRP_SORT\${NUM}" class="text short CRD_GRP_SORT" value="0" maxlength="10" />
		</div>
	</div>
</div>

 
<div class="form-group">
    <label class="label"><span>사용상품</span></label>
    <div class="field">
        <div class="section-button">
            <a href="#none" class="button button-a small goProductDelete"><span>선택삭제</span></a>
            <a href="#none" class="button button-b small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
        </div>
        <div class="table-a">
            <table class="core">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 15%;" />
					<col style="width: auto;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
				</colgroup>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkbox checkAll" /></th>
                        <th>상품코드</th>
						<th>상품명</th>
						<th>입점업체</th>
						<th>판매가</th>
						<th>검색가</th>
						<th>배송비</th>
						<th>판매여부</th>
						<th>쇼핑채널</th>
                    </tr>
                </thead>
                <tbody class="applyProductList">
                    <tr class="productNodata">
                        <td colspan="8">상품을 검색해 주세요.</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="form-group">                
    <label class="label"><span>관리</span></label>
    <div class="field">
        <a href="#none" class="button button-b small product-group-delete"><span>상품그룹 삭제</span></a>
        <a href="#none" class="button button-b small addProductGroup"><span>상품그룹추가</span></a>
    </div>
</div>
</div>
</script>
<script>
$(function(){
	//멀티업로드 셋팅
	//$("#multiFile1").multiUploadSet();
	//$("#multiFile2").multiUploadSet();
	//$("#multiFile3").multiUploadSet();
	//$("#multiFile4").multiUploadSet();
	
	fnDateSet('CRD_PMT_ST_DT', 'CRD_PMT_ED_DT', 0, 0, 0, 0, 0, 0,  '-');
	
	$(document).on("click", "#state0", function () {
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventForm.do", "target":"_self", "method":"post"}).submit();
	});
	$(document).on("click", "#state1", function () {
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventDcForm.do", "target":"_self", "method":"post"}).submit();
	});
	$(document).on("click", "#state2", function () {
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventSaveForm.do", "target":"_self", "method":"post"}).submit();
	});
	$(document).on("click", "#state3", function () {
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/cardEventCashForm.do", "target":"_self", "method":"post"}).submit();
	});
	
	$(document).on("change", ".applyCardList  .selectCard", function () {
   	 
		 
    	//if(!fnCardDupChkfnCardDupChk())alert("dup");
    	 var $obj = $("#cardTable").find(".applyCardList .selectCard");
    	 var len = $obj.length;
    	 
    	 var selectVal = $(this).val();
    	 var dupCnt = 0;
    	 for(i=0;i<len;i++)
    	 {
    		if(selectVal==$("#PMT_CRD_IDX"+i).val())
    		{
    			if(selectVal != "")dupCnt++;
    		}
    	 }
    	 if(dupCnt>1)
    	 {
    		 alert("동일한 카드사는 선택하실 수 없습니다.");
    		 $(this).val("");
    	  }
    	 
    });
	
	fnCardCodeChk = function(){
    	var $obj = $("#cardTable").find(".applyCardList .selectCard");
	   	var len = $obj.length;
	   	var bReturn = -1;
	   	
	   	for(i=0;i<len;i++)
	   	{
	   		var temp = $("#PMT_CRD_IDX"+i).val();
	   		if(temp == "")bReturn=i;
	   	}
	   	
        return bReturn;
    };
    fnCardChk1 = function(){
    	var $obj = $("#cardTable").find(".applyCardList .selectCard");
	   	var len = $obj.length;
	   	var bReturn = -1;
	   	
	   	for(i=0;i<len;i++)
	   	{
	   		var temp = $("#PMT_CRD_SAL_PRC"+i).val();
	   		if(temp == "")bReturn=i;
	   	}
	   	
        return bReturn;
    };
    fnCardChk2 = function(){
    	var $obj = $("#cardTable").find(".applyCardList .selectCard");
	   	var len = $obj.length;
	   	var bReturn = -1;
	   	
	   	for(i=0;i<len;i++)
	   	{
	   		var temp = $("#PMT_CRD_SML_PRC"+i).val();
	   		if(temp == "")bReturn=i;
	   	}
	   	
        return bReturn;
    };
    fnCardChk3 = function(){
    	var $obj = $("#cardTable").find(".applyCardList .selectCard");
	   	var len = $obj.length;
	   	var bReturn = -1;
	   	
	   	for(i=0;i<len;i++)
	   	{
	   		var temp = $("#PMT_CRD_MXM_PRC"+i).val();
	   		if(temp == "")bReturn=i;
	   	}
	   	
        return bReturn;
    };
	
	// 상품 검색 버튼 클릭 이벤트
    var $productBox = null;
    $(document).on("click", "#productBox .search-product-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".section-form");
       
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
    
    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .CRD_PRD_PMT_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
 	// 상품구성 체크박스 클릭 이벤트
    $(document).on("change", "#cardTable  .checkAll", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyCardList");
        var $checkbox = $tbody.find(".checkRow");
        if($checkbox.length == 0)
        {
            $this.prop("checked", false);
        }
        else
        {
            if($this.is(":checked"))
            {
                $checkbox.prop("checked", true);
            }
            else
            {
                $checkbox.prop("checked", false);    
            }
        }
    });
   
    
     // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".delCardEvent", function () {
        
       //var $topParent = $(this).parents(".section-form");
        
        var $cardBox = $("#cardTable");
        var $cardList = $cardBox.find(".applyCardList");
        
        if($cardList.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 카드를 선택하여 주십시오.");
            return;
        }
        if (confirm("삭제 하시겠습니까?")) 
        {
	        $cardList.children("tr").each(function() {
	            
	            if($(this).find(".checkRow").is(":checked"))
	            {
	                $(this).remove();
	            }
	        });
	        
	        if($cardList.children("tr").length == 0)
	        {
	            $cardList.append('<tr class="cardNodata"><td colspan="7">행사 카드를 추가해 주세요.</td></tr>');
	        }
	        //체크박스 전체 선택
	        $cardList.find(".checkAll").prop("checked", false);
        }
        
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/cardEventList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	var $obj = $("#cardTable").find(".applyCardList .selectCard");
	 	var len = $obj.length;
	 	if(len==0)
	 	{
	 		alert("카드를 등록해 주십시오.");
			return;
	 	}
     
    	if($.trim($("#CRD_PMT_ST_DT").val()) == ""){
			alert("프로모션 시작일을 입력해 주십시오.");
			$("#CRD_PMT_ST_DT").focus();
			return;
		}
    	if($.trim($("#CRD_PMT_ED_DT").val()) == ""){
			alert("프로모션 종료일을 입력해 주십시오.");
			$("#CRD_PMT_ED_DT").focus();
			return;
		}
    	if($.trim($("#CRD_PMT_NM").val()) == ""){
			alert("프로모션명을 입력해 주십시오.");
			$("#CRD_PMT_NM").focus();
			return;
		}
    	
    	var noVal = fnCardCodeChk();
    	if(noVal > -1){
    		alert("카드명을 입력해 주십시오.");
			$("#PMT_CRD_IDX"+noVal).focus();
			return;
    	}
    	
    	noVal = fnCardChk1();
    	if(noVal > -1){
    		alert("최대적립율/원을 입력해 주십시오.");
			$("#PMT_CRD_SAL_PRC"+noVal).focus();
			return;
    	}
    	
    	noVal = fnCardChk2();
    	if(noVal > -1){
    		alert("최소구매금액을 입력해 주십시오.");
			$("#PMT_CRD_SML_PRC"+noVal).focus();
			return;
    	}
    	
    	noVal = fnCardChk3();
    	if(noVal > -1){
    		alert("최대적립금액을 입력해 주십시오.");
			$("#PMT_CRD_MXM_PRC"+noVal).focus();
			return;
    	}
   
        if (confirm("저장 하시겠습니까?")) 
        {
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/cardEventRegist.do", "target" : "_self", "method" : "post"}).submit();
        }    
         
    });
    
    
 	// 카드 추가 버튼 클릭 이벤트
    $(document).on("click", ".addCardEvent", function () {
    	addCardEvent(); // 카드 추가
    });
 	
	 //  카드 추가 추가
    function addCardEvent()
    {
        var $cardBox = $("#cardTable");
        var $cardList = $cardBox.find(".applyCardList");
        var addLength = 1;
        //alert("$cardList.length : "+$cardList.length);
        var arrayObj = new Array();
        var $obj = $cardList.find(".selectCard");
   		var len = $obj.length;
   		
        $cardList.find(".cardNodata").remove();
        
        for(var i = 0 ; i < addLength ; i++)
        {
            var obj = new Object();
            obj.NUM = len+ i;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
            arrayObj.push(obj);    
        }
        $("#cardTemplate").tmpl(arrayObj).appendTo($cardList);
    }
	 
});
//-->
</script>

</body>
</html>
