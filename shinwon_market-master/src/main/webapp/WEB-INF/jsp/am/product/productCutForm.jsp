<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">상품전시기준(품절)관리</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
		<form id="frm" name="frm"> 
    	<input type="hidden" id="PRD_CUT_BRAND_CD" name="PRD_CUT_BRAND_CD" value="${commandMap.PRD_CUT_BRAND_CD }"/>
    
		<div class="title-box">
			<h4 class="title">[ ${productCut.BRD_NM} ] 상품전시(품절) 기준 설정</h4>
		</div>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">&nbsp;</th>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
							<th>${prdGdsSctnItem.CMN_COM_NM }</th>
						</c:forEach>
						</c:when>
						</c:choose>
						</tr>
						<tr>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
							<th>수량(개) / 매장(%)</th>
						</c:forEach>
						</c:when>
						</c:choose>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>현재기준</td>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
						<c:set var="cnt" value="${prdGdsSctnItem.CMN_COM_ETC1}_CNT" />
						<c:set var="rate" value="${prdGdsSctnItem.CMN_COM_ETC1}_RATE" />
						<td>${productCut[cnt] } / ${productCut[rate] }</td>
						</c:forEach>
						</c:when>
						</c:choose>
					</tr>
					<tr>
						<td>변경기준</td>
						<c:choose>
						<c:when test="${not empty prdGdsSctnList}">
						<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
						<c:set var="cnt" value="${prdGdsSctnItem.CMN_COM_ETC1}_CNT" />
						<c:set var="rate" value="${prdGdsSctnItem.CMN_COM_ETC1}_RATE" />
						<td><input type="text" class="text number right" style="width:30px" id="CNT_${prdGdsSctnItem.CMN_COM_ETC1}" maxlength="4" name="CNT_${prdGdsSctnItem.CMN_COM_ETC1}" value="${productCut[cnt] }" /> 
						/ <input type="text" class="text number right" style="width:30px" id="RATE_${prdGdsSctnItem.CMN_COM_ETC1}" maxlength="3" name="RATE_${prdGdsSctnItem.CMN_COM_ETC1}" value="${productCut[rate] }" /></td>
						</c:forEach>
						</c:when>
						</c:choose>
					</tr>
				</tbody>
			</table>
		</div>
			
		<div class="title-box">
			<h4 class="title">상품전시(품절) 기준 설정 수정 사유를 반드시 입력해 주세요.</h4>
		</div>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
				<tbody>
					<tr>
						<td>
							<textarea class="textarea" name="PRD_CUT_REG_NOTE" id="PRD_CUT_REG_NOTE" style="height:50px"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // col list -->
		</form>

		
		<c:choose>
		<c:when test="${not empty prdGdsSctnList}">
		<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
		<c:set var="cnt" value="${prdGdsSctnItem.CMN_COM_ETC1}_CNT" />
		<c:set var="rate" value="${prdGdsSctnItem.CMN_COM_ETC1}_RATE" />
		<input type="hidden" id="OLD_CNT_${prdGdsSctnItem.CMN_COM_ETC1}"  value="${productCut[cnt] }" /> 
		<input type="hidden" id="OLD_RATE_${prdGdsSctnItem.CMN_COM_ETC1}" value="${productCut[rate] }" />
		</c:forEach>
		</c:when>
		</c:choose>
					
		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
			<a href="#none" id="closePopup" class="button button-b"><span>취소</span></a>
		</div>
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.form.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {

    // 폼체크
    $("#frm").validate({
        rules: {
			<c:choose>
			<c:when test="${not empty prdGdsSctnList}">
			<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
			CNT_${prdGdsSctnItem.CMN_COM_ETC1} : { required:true, number:true, min:0 },
			RATE_${prdGdsSctnItem.CMN_COM_ETC1} : { required:true, number:true, max:100  },
			</c:forEach>
			</c:when>
			</c:choose>
        	PRD_CUT_REG_NOTE : { required:true }               // 판매상태
        },
        messages: {
        	<c:choose>
			<c:when test="${not empty prdGdsSctnList}">
			<c:forEach var="prdGdsSctnItem" items="${prdGdsSctnList}">
			CNT_${prdGdsSctnItem.CMN_COM_ETC1} : {required:"${prdGdsSctnItem.CMN_COM_NM} 최소판매가능수량을 반드시 입력해 주십시오", number:"${prdGdsSctnItem.CMN_COM_NM}의 최소판매가능수량은 숫자만 입력해 주십시오."},
			RATE_${prdGdsSctnItem.CMN_COM_ETC1} : {required:"${prdGdsSctnItem.CMN_COM_NM} 최소판매가능매장비를 반드시 입력해 주십시오", number:"${prdGdsSctnItem.CMN_COM_NM}의 최소판매가능매장비는 숫자만 입력해 주십시오."},
			</c:forEach>
			</c:when>
			</c:choose>
			PRD_CUT_REG_NOTE : { required: "기준변경 사유를 반드시 입력해 주세요." }
        }
    });
    
	// 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	
        	// 변경여부 확인.
        	if( false == dataValidate()){
        		alert("변경된 기준이 없습니다.\r\n변경한 기준이 있을 경우 저장됩니다.");
        		return ;
        	}
        	
            if (confirm( "수정 하시겠습니까?")) 
            {
//            	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productCutRegist.do", "target":"_self", "method":"post"}).submit();
                var params = {"PRD_CUT_REG_NOTE" : $("#PRD_CUT_REG_NOTE").val()};
                $("#frm input").each(function(index,item){
                	params[$(this).attr('id')] = $(this).val();
            	});
        		
                window.opener.goRegist(params);
		        self.close();
            }
        }
    });    
	
    

 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});
});

dataValidate = function (){
	
	var result = false;
	
	$("#frm input[name^=CNT_]").each(function(index,item){
		if( $(this).val() != $("#OLD_"+$(this).attr('id') ).val() ){
			result = true;
			return true;
		}
	});
	
	if( result == false ){
		$("#frm input[name^=RATE_]").each(function(index,item){
			if( $(this).val() != $("#OLD_"+$(this).attr('id') ).val() ){
				result = true;
				return true;
			}
		});
	}
	
	return result;
};
//]]>
</script>
</body>
</html>
