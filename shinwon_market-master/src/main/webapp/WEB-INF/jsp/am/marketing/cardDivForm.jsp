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

                <h2 class="title"><span>카드할부관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                   	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                   	<input type="hidden" name="searchCrdDivNm" value="<c:out value="${commandMap.searchCrdDivNm }"/>"/>
                   	<input type="hidden" name="searchCrdDivUseYn" value="<c:out value="${commandMap.searchCrdDivUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="rownum" value="0"/>
				</form>
                
                <form id="frm" name="frm"> 
			  		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                   	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                   	<input type="hidden" name="searchCrdDivNm" value="<c:out value="${commandMap.searchCrdDivNm }"/>"/>
                   	<input type="hidden" name="searchCrdDivUseYn" value="<c:out value="${commandMap.searchCrdDivUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="rownum" value="0"/>
                    
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>프로모션명<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			 <input type="text" name="CRD_DIV_NM" id="CRD_DIV_NM" class="text xlarge"/>
	                    		</td>
	                        
	                        </tr>
	                        <tr><!-- row -->
	                            <th><label class="label"><span>프로모션기간 <i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="CRD_DIV_ST_DT" name="CRD_DIV_ST_DT" readonly="readonly" data-target-end="#CRD_DIV_ED_DT"/>
	                               	<select id="CRD_DIV_ST_HH" name="CRD_DIV_ST_HH" class="CRD_DIV_ST_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                        		<c:set var="hh" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="hh" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${i.index eq 0}">selected="selected"</c:if>>${hh}</option>
		                        	</c:forEach>
                        			</select>시
                        			 
			                        <select id="CRD_DIV_ST_MM" name="CRD_DIV_ST_MM" class="CRD_DIV_ST_MM">
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
	                               	<input type="text" class="text" id="CRD_DIV_ED_DT" name="CRD_DIV_ED_DT" readonly="readonly" data-target-start="#CRD_DIV_ST_DT"/>
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<select id="CRD_DIV_ED_HH" name="CRD_DIV_ED_HH" class="CRD_DIV_ED_HH">
                       	  			<option value="">시</option>
		                        	<c:forEach begin="0" end="23" step="1" varStatus="i">
		                        		<c:set var="hh" value="${i.index}"/>
		                        		<c:if test="${i.index < 10}">
		                        			<c:set var="hh" value="0${i.index}"/>
		                        		</c:if>
		                        		<option value="${hh}" <c:if test="${i.index eq 23}">selected="selected"</c:if>>${hh}</option>
		                        	</c:forEach>
                        			</select>시
                        			 
			                   		<select id="CRD_DIV_ED_MM" name="CRD_DIV_ED_MM" class="CRD_DIV_ED_MM">
			                        	<option value="">분</option>
			                        	<c:forEach begin="0" end="59" step="1" varStatus="i">
			                        		<c:set var="mm" value="${i.index}"/>
			                        		<c:if test="${i.index < 10}">
			                        			<c:set var="mm" value="0${i.index}"/>
			                        		</c:if>
			                        		<option value="${mm}" <c:if test="${i.index eq 59}">selected="selected"</c:if>>${mm}</option>
			                      		</c:forEach>
	                         		</select>분
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" name="CRD_DIV_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" name="CRD_DIV_USE_YN" id="stateB" class="radio" value="N" />
		                            <label for="stateB">중지</label>
	                    		</td>
	                        </tr>
	                        
	                    </tbody>
                	</table><!-- // table -->
                	
                	<h3 class="title"><span>카드사선택</span></h3>
                	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                    <div class="text-right">
	                        <a href="#none" id="addCardDiv" class="button small primary addCardDiv"><span>추가</span></a>
	                        <a href="#none" id="delCardDiv" class="button small delCardDiv"><span>삭제</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
                	
                	<div id="cardTable">
                		<input type="hidden" name="MAX_NUM" id="MAX_NUM" value="0"/>
	                	<table cellspacing="0" class="table-row table-a"><!-- table -->
		                    <colgroup>
		                        <col style="width: 5%;" />
								<col style="width: 10%;" />
								<col style="width: 15%;" />
								<col style="width: 25%;" />
								<col style="width: auto;" />
								<col style="width: 10%;" />
		                    </colgroup>
		                    <thead>
								<tr>
									<th><input type="checkbox" class="checkbox checkAll" /></th>
									<th>카드명</th>
									<th>기준금액</th>
									<th>할부개월수/이자구분</th>
									<th>안내</th>
									<th>적용여부</th>
								</tr>
							</thead>
		                    <tbody class="applyCardList">
								<tr class="cardNodata"><!-- row -->
					        		<td colspan="6">행사 카드를 추가해 주세요.</td>
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

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<!-- template -->
<script id="cardTemplate" type="text/x-jquery-tmpl">
<tr>
	<td><input type="checkbox" class="checkbox checkRow" name="DIV_DTL_CDs" value="\${DIV_DTL_CD}"/><input type="hidden" name="NUM" value="\${NUM}"/></td>
	<td><select class="select selectCard" name="DIV_DTL_CD" id="DIV_DTL_CD\${NUM}">
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
	<td><input type="number" class="text number right short" name="DIV_DTL_PRC" id="DIV_DTL_PRC\${NUM}" /> 만원</td>
	<td>
<div>
		<select name="DIV_INF_MNT\${NUM}" id="DIV_INF_MNT\${NUM}">
			<option value="2" selected="selected">&nbsp;&nbsp;2&nbsp;&nbsp;</option>
			<option value="3">&nbsp;&nbsp;3&nbsp;&nbsp;</option>
			<option value="4">&nbsp;&nbsp;4&nbsp;&nbsp;</option>
			<option value="5">&nbsp;&nbsp;5&nbsp;&nbsp;</option>
			<option value="6">&nbsp;&nbsp;6&nbsp;&nbsp;</option>
			<option value="7">&nbsp;&nbsp;7&nbsp;&nbsp;</option>
			<option value="8">&nbsp;&nbsp;8&nbsp;&nbsp;</option>
			<option value="9">&nbsp;&nbsp;9&nbsp;&nbsp;</option>
			<option value="10">&nbsp;&nbsp;10&nbsp;&nbsp;</option>
			<option value="11">&nbsp;&nbsp;11&nbsp;&nbsp;</option>
			<option value="12">&nbsp;&nbsp;12&nbsp;&nbsp;</option>
			<option value="24">&nbsp;&nbsp;24&nbsp;&nbsp;</option>
			<option value="36">&nbsp;&nbsp;36&nbsp;&nbsp;</option>
		</select>
		<select name="DIV_INF_GBN\${NUM}" id="DIV_INF_GBN\${NUM}_0">
           	<c:if test="${not empty cardDivCodeList }">
				<option value="" selected="selected">선택</option>
	      		<c:forEach var="gbRow" items="${cardDivCodeList }" varStatus="i">
	       			<option value="<c:out value="${gbRow.CMN_COM_IDX }"/>">
	   					<c:out value="${gbRow.CMN_COM_NM }"/>
	        		</option>	      
			    </c:forEach>
		    </c:if>
        </select>
		<a href="javascript:addCardDiv2('\${NUM}')"class="button button-a small"><span>+</span></a>
		<div class="card1Add\${NUM}"></div>
</div>
	</td>
	<td>
		<input type="text" class="text large" name="DIV_INF_NTC\${NUM}" id="DIV_CRD_DIV_PRC\${NUM}" placeholder="(한글 20자, 영문숫자 50자)" maxlength="50"/>
		<div class="card2Add\${NUM}"></div>
	</td>
	<td>
		<select name="DIV_INF_USE_YN\${NUM}" id="DIV_INF_USE_YN\${NUM}">
			<option value="Y" selected="selected">&nbsp;&nbsp;Y&nbsp;&nbsp;</option>
			<option value="N">&nbsp;&nbsp;N&nbsp;&nbsp;</option>	
		</select>
		<div class="card3Add\${NUM}"></div>
	</td>
</tr>
</script>
<script id="card1Template" type="text/x-jquery-tmpl">

	<div class="card1\${NUM}" id="card1\${NUM}_\${RNUM}">
	<br/>
		<select name="DIV_INF_MNT\${NUM}" id="DIV_INF_MNT\${NUM}_\${RNUM}">
			<option value="2" selected="selected">&nbsp;&nbsp;2&nbsp;&nbsp;</option>
			<option value="3">&nbsp;&nbsp;3&nbsp;&nbsp;</option>
			<option value="4">&nbsp;&nbsp;4&nbsp;&nbsp;</option>
			<option value="5">&nbsp;&nbsp;5&nbsp;&nbsp;</option>
			<option value="6">&nbsp;&nbsp;6&nbsp;&nbsp;</option>
			<option value="7">&nbsp;&nbsp;7&nbsp;&nbsp;</option>
			<option value="8">&nbsp;&nbsp;8&nbsp;&nbsp;</option>
			<option value="9">&nbsp;&nbsp;9&nbsp;&nbsp;</option>
			<option value="10">&nbsp;&nbsp;10&nbsp;&nbsp;</option>
			<option value="11">&nbsp;&nbsp;11&nbsp;&nbsp;</option>
			<option value="12">&nbsp;&nbsp;12&nbsp;&nbsp;</option>
			<option value="24">&nbsp;&nbsp;24&nbsp;&nbsp;</option>
			<option value="36">&nbsp;&nbsp;36&nbsp;&nbsp;</option>
		</select>
		<select name="DIV_INF_GBN\${NUM}" id="DIV_INF_GBN\${NUM}_\${RNUM}">
           	<c:if test="${not empty cardDivCodeList }">
				<option value="" selected="selected">선택</option>
	      		<c:forEach var="gbRow" items="${cardDivCodeList }" varStatus="i">
	       			<option value="<c:out value="${gbRow.CMN_COM_IDX }"/>">
	   					<c:out value="${gbRow.CMN_COM_NM }"/>
	        		</option>	      
			    </c:forEach>
		    </c:if>
        </select>
		<a href="javascript:rowDelete('\${NUM}_\${RNUM}')"class="button button-a small"><span>-</span></a>
	</div>
</script>

<script id="card2Template" type="text/x-jquery-tmpl">

<div class="card2\${NUM}" id="card2\${NUM}_\${RNUM}">
	<br/>
	<input type="text" class="text large" name="DIV_INF_NTC\${NUM}" id="DIV_INF_NTC\${NUM}" placeholder="(한글 20자, 영문숫자 50자)" maxlength="50"/>
</div>
</script>

<script id="card3Template" type="text/x-jquery-tmpl">

<div class="card3\${NUM}" id="card3\${NUM}_\${RNUM}">
	<br/>
	<select name="DIV_INF_USE_YN\${NUM}" id="DIV_INF_USE_YN\${NUM}">
		<option value="Y" selected="selected">&nbsp;&nbsp;Y&nbsp;&nbsp;</option>
		<option value="N">&nbsp;&nbsp;N&nbsp;&nbsp;</option>	
	</select>
</div>
</script>

<script>
$(function(){
	//멀티업로드 셋팅
	//$("#multiFile1").multiUploadSet();
	//$("#multiFile2").multiUploadSet();
	//$("#multiFile3").multiUploadSet();
	//$("#multiFile4").multiUploadSet();
	
	fnDateSet('CRD_DIV_ST_DT', 'CRD_DIV_ED_DT', 0, 0, 0, 0, 0, 0,  '-');
 
	$(document).on("change", ".applyCardList  .selectCard", function () {
   	 
		 
    	//if(!fnCardDupChkfnCardDupChk())alert("dup");
    	 var $obj = $("#cardTable").find(".applyCardList .selectCard");
    	 var len = $obj.length;
    	 
    	 var selectVal = $(this).val();
    	 var dupCnt = 0;
    	 for(i=0;i<len;i++)
    	 {
    		if(selectVal==$("#DIV_DTL_CD"+i).val())
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
	   		var temp = $("#DIV_DTL_CD"+i).val();
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
	   		var temp = $("#DIV_DTL_PRC"+i).val();
	   		if(temp == "")bReturn=i;
	   	}
	   	
        return bReturn;
    };
    fnCardChk2 = function(){
    	var $obj = $("#cardTable").find(".applyCardList .selectCard");
	   	var len = $obj.length;
	   	var bReturn = "";
	    
	   	for(i=0;i<len;i++)
	   	{
	   		var $objDtl = $("#cardTable").find(".applyCardList .card1"+i);
	   		
	   		var lenDtl = $objDtl.length + 1;
	   		
	   		for(j=0;j<lenDtl;j++)
		   	{
		   		var temp = $("#DIV_INF_GBN"+i+"_"+j).val();
		   		//alert(i+"/"+j+" : "+temp);
		   		if(temp == "")bReturn=i+"_"+j;
		   	}
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
   
    
     // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".delCardDiv", function () {
        
       //var $topParent = $(this).parents(".section-form");
        
        var $cardBox = $("#cardTable");
        var $cardList = $cardBox.find(".applyCardList");
        
        if($cardList.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 카드를 선택하여 주십시오.");
            return;
        }
        
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
        
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/cardDivList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	 
     
    	if($.trim($("#CRD_DIV_ST_DT").val()) == ""){
			alert("프로모션 시작일을 입력해 주십시오.");
			$("#CRD_DIV_ST_DT").focus();
			return;
		}
    	if($.trim($("#CRD_DIV_ED_DT").val()) == ""){
			alert("프로모션 종료일을 입력해 주십시오.");
			$("#CRD_DIV_ED_DT").focus();
			return;
		}
    	if($.trim($("#CRD_DIV_NM").val()) == ""){
			alert("프로모션명을 입력해 주십시오.");
			$("#CRD_DIV_NM").focus();
			return;
		}
    	
    	var noVal = fnCardCodeChk();
    	if(noVal > -1){
    		alert("카드명을 입력해 주십시오.");
			$("#DIV_DTL_CD"+noVal).focus();
			return;
    	}
    	
    	noVal = fnCardChk1();
    	if(noVal > -1){
    		alert("기준금액을 입력해 주십시오.");
			$("#DIV_DTL_PRC"+noVal).focus();
			return;
    	}
    	
    	noVal = fnCardChk2();
    	if(noVal != ""){
    		alert("무이자구분을 입력해 주십시오.");
			$("#DIV_INF_GBN"+noVal).focus();
			return;
    	}
    	
        if (confirm("저장 하시겠습니까?")) 
        {
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/cardDivRegist.do", "target" : "_self", "method" : "post"}).submit();
        }    
         
    });
    
    
 	// 카드 추가 버튼 클릭 이벤트
    $(document).on("click", ".addCardDiv", function () {
    	addCardDiv(); // 카드 추가
    });
 	
	 //  카드 추가 추가
    function addCardDiv()
    {
        var $cardBox = $("#cardTable");
        var $cardList = $cardBox.find(".applyCardList");
        var addLength = 1;
        //alert("$cardList.length : "+$cardList.length);
        var arrayObj = new Array();
        var $obj = $cardList.find(".selectCard");
   		var len = $obj.length;
   		var lenM = parseInt(len) - 1 ;
   		
   		var maxnum = $("#MAX_NUM").val();
   		if(maxnum == "0")
   		{
   			$("#MAX_NUM").val(lenM);
   			maxnum = lenM;
   		}
   		
   		 
        $cardList.find(".cardNodata").remove();
        
        for(var i = 0 ; i < addLength ; i++)
        {
            var obj = new Object();
            obj.NUM = parseInt(maxnum) + 1 + i;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
            $("#MAX_NUM").val(parseInt(maxnum) + 1 + i);
            arrayObj.push(obj);    
        }
        $("#cardTemplate").tmpl(arrayObj).appendTo($cardList);
    }
	 
});

function addCardDiv2(rnum)
{
    var $cardBox = $("#cardTable");
    var $cardList1 = $cardBox.find(".card1Add"+rnum);
    var $cardList2 = $cardBox.find(".card2Add"+rnum);
    var $cardList3 = $cardBox.find(".card3Add"+rnum);
    
    var $card1 = $cardList1.find(".card1"+rnum);
    
    var len = $card1.length;
    
    var addLength = 1;
    //alert("$cardList.length : "+$cardList.length);
    var arrayObj = new Array();
    
    for(var i = 0 ; i < addLength ; i++)
    {
        var obj = new Object();
        obj.NUM = rnum;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
        obj.RNUM = len+i+1;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
        arrayObj.push(obj);    
    }
    
    $("#card1Template").tmpl(arrayObj).appendTo($cardList1);
    $("#card2Template").tmpl(arrayObj).appendTo($cardList2);
    $("#card3Template").tmpl(arrayObj).appendTo($cardList3);
    
}
// 현재 행 삭제
function rowDelete(rnum)
{	
	
	$("#card1"+rnum).remove();
	$("#card2"+rnum).remove();
	$("#card3"+rnum).remove();
	
}
//-->
</script>

</body>
</html>
