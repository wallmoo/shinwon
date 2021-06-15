<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<c:set var="c_state_text" value=""/> 
<c:choose>
	<c:when test="${commandMap.ORD_PRD_SCM_CNL_YN eq 'Y'}"><%-- 취소 --%>
		<c:set var="c_state_text" value="취소요청"/> 
	</c:when>
	<c:when test="${commandMap.ORD_PRD_SCM_CNL_YN eq 'D'}"><%-- 반품확인요청 --%>
		<c:set var="c_state_text" value="반품확인요청"/> 
	</c:when>
	<c:when test="${commandMap.ORD_PRD_SCM_CNL_YN eq 'C'}"><%-- 교환확인요청 --%>
		<c:set var="c_state_text" value="교환확인요청"/> 
	</c:when>
</c:choose>

<header><!-- header -->
    <h1 class="title">SCM <c:out value="${c_state_text }"/></h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<form id="frm" name="frm">
	    <input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD}"/>"/>
	    <input type="hidden" name="ORD_PRD_SCM_CNL_YN" value="<c:out value="${commandMap.ORD_PRD_SCM_CNL_YN}"/>"/> <!-- Y는 취소 요청 D 반품확인요청 C 교환확인요청 -->
	    <input type="hidden" name="ORD_PRD_IDX" value="<c:out value="${commandMap.ORD_PRD_IDX}"/>"/>
	    
	    <div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 20%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>사유</th>
						<td style="text-align:left;">
							<input type="text" class="text long" id="ORD_PRD_SCM_CNL_DESC" name="ORD_PRD_SCM_CNL_DESC" value="" maxlength="25"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		</form>
			
		<div class="section-button search"><!-- section-button -->
			<a href="javascript:save();" class="button button-b"><span><c:out value="${c_state_text }"/></span></a>
		</div><!-- // section-button -->

	</div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script type="text/javascript">
$(function() {
	var $frm = $("#frm");
	// 폼체크
  	$frm.validate({
        rules: {
        	ORD_PRD_SCM_CNL_DESC:{required:true} // 취소사유
        },
        messages :{
        	ORD_PRD_SCM_CNL_DESC : {required:"취소사유를 입력해주십시오."}
        }
    });
	
    // 저장
    save = function()
    {
    	if($frm.valid()){
    		if(confirm("취소요청 하시겠습니까?"))
            {
                $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderList/scmOrderCancelProc.do", "target":"_self", "method":"post"}).submit();
                $.blockUI({ 
              		message: "처리중입니다...",   
              		css: {            		
                       border: 'none', 
                       padding: '15px', 
                       backgroundColor: '#000', 
                       '-webkit-border-radius': '10px', 
                       '-moz-border-radius': '10px', 
                       opacity: .5, 
                       color: '#fff' 
                  	} 
              	});
            }
    	}	
    };
});
</script>
</body>
</html>