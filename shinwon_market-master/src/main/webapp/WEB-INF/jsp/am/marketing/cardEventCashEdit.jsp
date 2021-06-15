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

                <h2 class="title"><span>카드행사관리</span></h2>

                <h3 class="title"><span>
                	<c:if test="${commandMap.COPY_YN eq 'N'}">상세/수정</c:if>
                   	<c:if test="${commandMap.COPY_YN eq 'Y'}">복사등록</c:if>
                </span></h3>
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
                
                <form name="frm" id="frm"> 
			  		<input type="hidden" name="CRD_PMT_IDX"  value="<c:out value="${row.CRD_PMT_IDX }"/>" />
                	<input type="hidden" name="COPY_YN"  id="COPY_YN" value="<c:out value="${commandMap.COPY_YN }"/>" />
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
                    				현금캐시백
                        	 		<input type="hidden" name="CRD_PMT_GBN" id="CRD_PMT_GBN"  value="<c:out value="${row.CRD_PMT_GBN }"/>"/>
	                    		</td>
	                        
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>프로모션명 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			 <input type="text" name="CRD_PMT_NM" id="CRD_PMT_NM" class="text xlarge" value="<c:out value="${row.CRD_PMT_NM }"/>"/>
	                    		</td>
	                        </tr>
	                   
	                        <tr><!-- row -->
	                            <th><label class="label"><span>프로모션기간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                            	<input type="text" class="text" id="CRD_PMT_ST_DT" name="CRD_PMT_ST_DT"  readonly="readonly" data-target-end="#CRD_PMT_ED_DT" value="<ui:formatDate value="${row.CRD_PMT_ST_DT }" pattern="yyyy-MM-dd"/>"/>
	                               	<select id="CRD_PMT_ST_HH" name="CRD_PMT_ST_HH" class="CRD_PMT_ST_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                        		<c:set var="hh" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="hh" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${hh eq row.CRD_PMT_ST_HH}">selected="selected"</c:if>>${hh}</option>
		                        	</c:forEach>
                        			</select>시
                        			 
			                        <select id="CRD_PMT_ST_MM" name="CRD_PMT_ST_MM" class="CRD_PMT_ST_MM">
			                        	<option value="">분</option>
			                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                        		<c:set var="mm" value="${i.index}"/>
			                        		<c:if test="${i.index < 10}">
			                        			<c:set var="mm" value="0${i.index}"/>
			                        		</c:if>
			                        		<option value="${mm}" <c:if test="${mm eq row.CRD_PMT_ST_MM}">selected="selected"</c:if>>${mm}</option>
			                        	</c:forEach>
			                         </select>분 
		                            ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="CRD_PMT_ED_DT" name="CRD_PMT_ED_DT"  readonly="readonly" data-target-start="#CRD_PMT_ST_DT" value="<ui:formatDate value="${row.CRD_PMT_ED_DT }" pattern="yyyy-MM-dd"/>"/>
									<select id="CRD_PMT_ED_HH" name="CRD_PMT_ED_HH" class="CRD_PMT_ED_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                        		<c:set var="hh" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="hh" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${hh eq row.CRD_PMT_ED_HH}">selected="selected"</c:if>>${hh}</option>
		                        	</c:forEach>
                        			</select>
                        			 
			                        <select id="CRD_PMT_ED_MM" name="CRD_PMT_ED_MM" class="CRD_PMT_ED_MM">
			                        	<option value="">분</option>
			                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                        		<c:set var="mm" value="${i.index}"/>
			                        		<c:if test="${i.index < 10}">
			                        			<c:set var="mm" value="0${i.index}"/>
			                        		</c:if>
			                        		<option value="${mm}" <c:if test="${mm eq row.CRD_PMT_ED_MM}">selected="selected"</c:if>>${mm}</option>
			                        	</c:forEach>
			                         </select>
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" name="CRD_PMT_USE_YN" id="stateA" class="radio" value="Y" <c:if test="${row.CRD_PMT_USE_YN eq 'Y'}"> checked="checked" </c:if> />
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="CRD_PMT_USE_YN" id="stateB" class="radio" value="N" <c:if test="${row.CRD_PMT_USE_YN eq 'N'}"> checked="checked" </c:if> />
		                            <label for="stateB">중지</label>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                	<h3 class="title"><span>카드사선택</span></h3>
                	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                		<c:if test="${commandMap.COPY_YN eq 'Y'}">
		                    <div class="text-right">
		                        <a href="#none" id="addCardEvent" class="button small primary addCardEvent"><span>추가</span></a>
		                        <a href="#none" id="delCardEvent" class="button small delCardEvent"><span>삭제</span></a>
		                    </div>
	                    </c:if>
                	</div><!-- // 목록 상단 버튼 -->
                	
               
                	<div id="cardTable">
	                	<table cellspacing="0" class="table-row table-a"><!-- table -->
		                    <colgroup>
		                        <col style="width: 5%;" />
								<col style="width: auto;" />
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
									<th>최소구매금액</th>
									<th>최소할인금액</th>
									<th>최대할인금액</th>
									<th>비고</th>
									<th>노출여부</th>
								</tr>
							</thead>
		                    <tbody class="applyCardList">
								<c:choose>
			                       	<c:when test="${not empty detailList }">
										<c:forEach var="rowDetail" items="${detailList }" varStatus="i">
											<tr>
												<td><input type="checkbox" class="checkbox checkRow" name="CRD_PMT_IDXs" value=""/></td>
												<td><select class="selectCard" name="PMT_CRD_IDX" id="PMT_CRD_IDX<c:out value="${i.index }"/>">
											           	<option value="">선택</option>
											           	<c:if test="${not empty cardCodeList }">
															<c:forEach var="gbRow" items="${cardCodeList }" varStatus="i">
												       			<option value="<c:out value="${gbRow.CMN_COM_IDX }"/>" <c:if test="${rowDetail.PMT_CRD_IDX eq gbRow.CMN_COM_IDX}"> selected="selected" </c:if> >
												   					<c:out value="${gbRow.CMN_COM_NM }"/>
												        		</option>	      
														    </c:forEach>
													    </c:if>
											        </select>
											        <input type="hidden" name="PMT_CRD_SAL_GBN" value="<c:out value="${rowDetail.PMT_CRD_SAL_GBN }"/>"/>
												</td>
											 	<td><input type="number" class="text number right" name="PMT_CRD_SAL_PRC" id="PMT_CRD_SAL_PRC<c:out value="${i.index }"/>" value="<fmt:formatNumber value="${rowDetail.PMT_CRD_SAL_PRC }" groupingUsed="true" />"/> 만원 </td>
												<td><input type="number" class="text number right" name="PMT_CRD_SML_PRC" id="PMT_CRD_SML_PRC<c:out value="${i.index }"/>" value="<fmt:formatNumber value="${rowDetail.PMT_CRD_SML_PRC }" groupingUsed="true" />"/> 만원</td>
												<td><input type="number" class="text number right" name="PMT_CRD_MXM_PRC" id="PMT_CRD_MXM_PRC<c:out value="${i.index }"/>" value="<fmt:formatNumber value="${rowDetail.PMT_CRD_MXM_PRC }" groupingUsed="true" />"/> 만원</td>
												<td><input type="text" class="text" name="PMT_CRD_ETC" id="PMT_CRD_ETC<c:out value="${i.index }"/>" value="<c:out value="${rowDetail.PMT_CRD_ETC }"/>" maxlength="20" style="width:80%;"/></td>
												<td>
													<select class="select" name="PMT_CRD_DPL_YN">
														<option value="Y" <c:if test="${rowDetail.PMT_CRD_DPL_YN eq 'Y'}"> selected="selected" </c:if>>&nbsp;&nbsp;Y&nbsp;&nbsp;</option>
														<option value="N" <c:if test="${rowDetail.PMT_CRD_DPL_YN eq 'N'}"> selected="selected" </c:if>>&nbsp;&nbsp;N&nbsp;&nbsp;</option>	
													</select>
												</td>
											</tr>
										</c:forEach>
			                         </c:when>
			                         <c:otherwise>
							          	<tr class="cardNodata"><!-- row -->
							               	<td colspan="6">행사 카드를 추가해 주세요.</td>
							            </tr>
							         </c:otherwise>
                        		</c:choose>
							</tbody>
	                	</table><!-- // table -->
                	</div>
                	
                	<h3 class="title"><span>적용대상</span></h3>
                	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                		<c:if test="${commandMap.COPY_YN eq 'Y'}">
		                    <div class="text-right">
		                        <a href="#none" id="addProduct" class="button small primary addProduct"><span>추가</span></a>
		                        <a href="#none" id="delProduct" class="button small delProduct"><span>삭제</span></a>
		                    </div>
	                    </c:if>
                	</div><!-- // 목록 상단 버튼 -->
                	
               
                	<div id="productTable">
	                	<table cellspacing="0" class="table-row table-a"><!-- table -->
		                    <colgroup>
								<col style="width: auto;" />
								<col style="width: auto;" />
								<col style="width: auto;" />
								<col style="width: auto;" />
		                    </colgroup>
		                    <thead>
								<tr>
									<th><input type="checkbox" class="checkbox checkAll" /></th>
									<th>상품코드</th>
									<th>상품명</th>
									<th>판매가</th>
								</tr>
							</thead>
		                    <tbody class="applyProductList">
								<c:choose>
			                       	<c:when test="${not empty productList }">
										<c:forEach var="rowProduct" items="${productList }" varStatus="i">
											<tr>
												<td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${CRD_PMT_IDX}"/></td>
												<td><c:out value="${rowProduct.PMT_PRD_MST_CD }"/><input type="hidden" class="PRD_MST_CD" id="PRD_MST_CD" name="PRD_MST_CD"  value="<c:out value="${rowProduct.PMT_PRD_MST_CD }"/>"/></td>
												<td><c:out value="${rowProduct.PRD_MST_NM }"/></td>
												<td><fmt:formatNumber value="${rowProduct.PRD_MST_PRC }" groupingUsed="true" /></td>
											</tr>
										</c:forEach>
			                        </c:when>
			                 		<c:otherwise>
								       	<tr class="productNodata"><!-- row -->
								           	<td colspan="4">상품을 추가해 주세요.</td>
								       	</tr>
							       	</c:otherwise>
                        		</c:choose>
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
		<input type="hidden" name="PMT_CRD_SAL_GBN" id="PMT_CRD_SAL_GBN\${NUM}" value="M"/>
	</td>
	<td><input type="number" class="text number right" name="PMT_CRD_SAL_PRC" id="PMT_CRD_SAL_PRC\${NUM}" /> 만원</td>
	<td><input type="number" class="text number right" name="PMT_CRD_SML_PRC" id="PMT_CRD_SML_PRC\${NUM}" /> 만원</td>
	<td><input type="number" class="text number right" name="PMT_CRD_MXM_PRC" id="PMT_CRD_MXM_PRC\${NUM}" /> 만원</td>
	<td><input type="text" class="text" name="PMT_CRD_ETC" id="PMT_CRD_ETC\${NUM}" maxlength="20" style="width:80%;" /></td>
	<td>
		<select class="select" name="PMT_CRD_DPL_YN" id="PMT_CRD_DPL_YN\${NUM}">
			<option value="Y" selected="selected">&nbsp;&nbsp;Y&nbsp;&nbsp;</option>
			<option value="N">&nbsp;&nbsp;N&nbsp;&nbsp;</option>	
		</select>
	</td>
</tr>
</script>
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${CRD_PMT_IDX}"/></td>
	<td >\${PRD_MST_CD}<input type="hidden" class="PRD_MST_CD" id="PRD_MST_CD" name="PRD_MST_CD"  value="\${PRD_MST_CD}"/></td>
	<td>\${PRD_MST_NM}</td>
	<td>\${PRD_MST_SELL_PRICE}</td>
</tr>
</script>
<script>
$(document).ready(function() {
	var copy_yn = $("#COPY_YN").val();
	// 상품 검색 버튼 클릭 이벤트
    var $productBox = null;
    $(document).on("click", "#addProduct", function () {
        // 해당 그룹의 최 상위 부모 Node
         
        //$productBox = $(this).parents(".section-form");
       
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
    
    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $(".PRD_MST_CD");
        
         $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
    
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
 // 상품구성 체크박스 클릭 이벤트
    $(document).on("change", "#productTable  .checkAll", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyProductList");
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
	            $cardList.append('<tr class="cardNodata"><td colspan="6">행사 카드를 추가해 주세요.</td></tr>');
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
    		alert("최대할인율/원을 입력해 주십시오.");
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
    		alert("최대할인금액을 입력해 주십시오.");
			$("#PMT_CRD_MXM_PRC"+noVal).focus();
			return;
    	}
     
        if (confirm("저장 하시겠습니까?")) 
        {
        	if(copy_yn=="Y")
        	{
        		$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/cardEventRegist.do", "target" : "_self", "method" : "post"}).submit();
        	}else
        	{	
        		$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/cardEventMod.do", "target" : "_self", "method" : "post"}).submit();	
        	}
        	
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
        
        var $obj = $cardList.find(".selectCard");
   		var len = $obj.length;
   		 
        //alert("$cardList.length : "+$cardList.length);
        var arrayObj = new Array();
        
        $cardList.find(".cardNodata").remove();
        
        for(var i = 0 ; i < addLength ; i++)
        {
            var obj = new Object();
            obj.NUM = len + i;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
            arrayObj.push(obj);    
        }
        $("#cardTemplate").tmpl(arrayObj).appendTo($cardList);
    }
	 
    fnResultProduct = function(params){
    	 
		var bCheck = true;
		var $productBox = $("#productTable");
		//상품중복체크
		$.each( params, function( index, el ){
			if( !fnDuplicationChk( el.PRD_MST_CD )){
				alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
				bCheck = false;
				return false;
			}
		});
	 
		if( bCheck ){
			//기본TR삭제
			$productBox.find(".productNodata").remove();
			//배열재정의
			var arrayObj = new Array();
			var obj;
			$.each(params, function(index,item){
				obj = new Object();
				obj.PRD_MST_CD 				= item.PRD_MST_CD;
				obj.PRD_MST_ERP_CD 				= item.PRD_MST_ERP_CD;
				obj.PRD_MST_NM 			= item.PRD_MST_NM;
				obj.PRD_MST_SELL_PRICE 	= setComma(item.PRD_MST_PRC);
				obj.NUM = $productBox.find(".groupNum").val();
			 	
				obj.FRONT_URL = '<c:out value="${frontDomain}" />';
				obj.serverDomain 			= '<c:out value="${serverDomain}" />';
				
				obj.imgpath 		= item.PRD_IMG_THUM_URL;
				
				arrayObj.push(obj); //만들어진  object를 배열에 추가
			});
			$( "#productTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));
		}
	};
	
	 // 사용상품 상품 선택삭제 이벤트
	$(document).on("click", "#delProduct", function () {
		
		var $topParent = $("#productTable");

		if($topParent.find(".checkRow:checked").length == 0)
		{
			alert("삭제할 상품을 선택하여 주십시오.");
			return;
		}
		if (confirm("삭제 하시겠습니까?")) 
        {
			$topParent.find(".applyProductList").children("tr").each(function() {
				
				if($(this).find(".checkRow").is(":checked"))
				{
					$(this).remove();
				}
			});
			
			if($topParent.find(".applyProductList").children("tr").length == 0)
			{
				$topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="6">상품을 검색해 주세요.</td></tr>');
			}
			//체크박스 전체 선택
			$topParent.find(".checkAll").prop("checked", false);
		}
		
	});
	 

	 
});
//-->
</script>

</body>
</html>
