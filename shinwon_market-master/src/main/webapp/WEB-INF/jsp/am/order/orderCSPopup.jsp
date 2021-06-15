<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title">상담내용</h1>
	<a href="javascript:self.close(); pass_alert = true;" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->
	
		<div class="tab-a justified"><!-- tab -->
			<ul class="tab">
				<li><a href="<c:out value="${serverDomain}" />/am/order/orderPopup.do?ORD_MST_CD=<c:out value="${commandMap.ORD_MST_CD }" />">주문상세내역</a></li>
				<li class="active"><a href="#none">상담내용<c:if test="${paging.totalRecordCount gt 0}">(<c:out value="${paging.totalRecordCount}"/>)</c:if></a></li>
			</ul>
		</div><!-- // tab -->
	
		<h2 class="semantic">상담내용</h2>
		
		<div class="table-a table-row"><!-- row list -->
		<form id="writeForm" name="writeForm">
		<input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
			<table class="core">
				<colgroup>
					<col style="width: 15%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>상담원</th>
						<td><c:out value="${sessionAdmin.ADM_MST_NM }"/></td>
					</tr>
					<tr>
						<th><span>상담유형<em class="strong">*</em></span></th>
						<td>
							<select class="select" id="ORD_CST_GBN_IDX" name="ORD_CST_GBN_IDX">
								<option value="">유형을 선택해 주세요</option>
 								<c:forEach items="${codes.ORDER_CS_TYPE_IDX}" var="cd">
 									<option value="<c:out value="${cd.CMN_COM_IDX}"/>">
 									    <c:out value="${cd.CMN_COM_NM}"/>
 									</option> 
 								</c:forEach> 
							</select>
						</td>
					</tr>
					<tr>
						<th><span>상담내용<em class="strong">*</em></span></th>
						<td>
							<textarea class="textarea" id="ORD_CST_CTS" name="ORD_CST_CTS"  ></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;">
							<a href="#none" class="button button-b" id="goRegist" style="margin-right: 10px;"><span>저장</span></a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div><!-- // row list -->

		<div class="title-box">
			<h4 class="title">해당 주문 상담이력</h4>
		</div>

		<div class="table-a"><!-- col list -->
			<table class="core">
				<colgroup>
					<col style="width: 15%;" />
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
				</colgroup>
				<thead>
					<tr>
						<th>상담유형</th>
						<th>상담내용</th>
						<th>상담원</th>
						<th>상담일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty cstList}">
				<c:forEach items="${cstList}" var="item" varStatus="i">
					<tr>
						<td>${item.ORD_CS_TYPE_NM }</td>
						<td class="left title" style="cursor:pointer">
						<c:choose>
						<%-- 50글자 안에 줄넘김이 있으면 첫번째줄만 표시 --%>
				        <c:when test="${fn:indexOf(item.ORD_CST_CTS,newLineChar) > 0  && fn:indexOf(item.ORD_CST_CTS,newLineChar) < 50 }" > 
			        		<c:out value="${fn:substringBefore(item.ORD_CST_CTS, newLineChar)}"/>...
				        </c:when>
					    <%-- 전체 50글자가 넘으면 50글자만 표시 --%>
					    <c:when test="${fn:length(item.ORD_CST_CTS) > 50}">
				        	<c:out value="${fn:substring(item.ORD_CST_CTS,0,50)}"/>...
				        </c:when>
				        <c:otherwise>
				          	<c:out value="${item.ORD_CST_CTS }"/>
				        </c:otherwise>
				        </c:choose>                 
	                    </td>
						<td>${item.ORD_CST_REG_NAME }</td>
						<td><ui:formatDate value="${item.ORD_CST_REG_DT }" pattern="yyyy.MM.dd" />&nbsp;<ui:formatDate value="${item.ORD_CST_REG_DT }" pattern="HH:mm" /></td>
					</tr>	
					<tr class="content" style="display:none">
						<td colspan="4" class="left" style="padding-left:20px;white-space: pre-line">${item.ORD_CST_CTS }</td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
                    <td colspan="4">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                </tr>
                </c:otherwise>
                </c:choose>
				</tbody>
			</table>
		</div><!-- // col list -->
		
		<form id="frm" name="frm">
		<input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
		<input type="hidden" name="ORD_CST_GBN_IDX" value="<c:out value="${commandMap.ORD_CST_GBN_IDX }"/>"/>
		
		<div class="pagination"><!-- pagination -->
			<ui:paging paging="${paging }" jsFunction="goPage" />
		</div><!-- // pagination -->

		<div class="bbs-status"><!-- bbs status -->
			<div class="page">
				Page : <strong class="em"><c:out value="${paging.cPage }" /></strong> / <c:out value="${paging.totalPageCount }" /> page
			</div>
			<div class="sort">
				 Total : <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>
			</div>
		</div><!-- // bbs status -->

        </form>

		<div class="section-button-popup"><!-- section button -->
			<a href="#none" id="closePopup" class="button button-b"><span>닫기</span></a>
		</div>
		
	</div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	// 폼체크
    $("#writeForm").validate({
        rules: {
        	ORD_CST_GBN_IDX : { required:true },		// 상담유형
        	ORD_CST_CTS : { required:true }               // 상담내용
        },
        messages: {
        	ORD_CST_GBN_IDX : {required:"상담유형을 선택해주십시오."},
        	ORD_CST_CTS : { required:"상담내용을 입력해주십시오." } 
        }
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#writeForm"); 
        if($frm.valid()){
            if (confirm( "작성된 상담 내용을 저장 하시겠습니까?")) {
            	pass_alert = true;
                $("#writeForm").attr({"action":"<c:out value="${serverDomain}" />/am/order/orderList/orderCSRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    

    // 페이지 이동
    goPage = function (cPage) 
    {
    	pass_alert = true;
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/orderCSPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
 	$(document).on("click","#closePopup",function(){
 		self.close();
 	});  
 		    
 	$(document).on("click",".title",function(){
 		if( $(this).parent().next().css("display") != "none" ){
			$(this).parent().next().css("display","none");
 		}else{
			$(".content").css("display","none");
			$(this).parent().next().css("display","");
 		}
	});
 	
 	var pass_alert = false;
 	window.onbeforeunload = function() {
 		
 		var $frm = $("#writeForm");
 		if ( pass_alert==false && $("#ORD_CST_CTS").text().length > 0 && confirm( "작성된 상담 내용을 저장 하시겠습니까?")) {
	        if($frm.valid()){                    	
	        	pass_alert=true;
                $("#writeForm").attr({"action":"<c:out value="${serverDomain}" />/am/order/orderList/orderCSRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
	};
	
	// 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
 		
});
</script>
</body>
</html>