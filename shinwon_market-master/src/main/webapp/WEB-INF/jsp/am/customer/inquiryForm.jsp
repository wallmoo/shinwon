<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">고객센터</a>
                &gt;
                <span>1:1문의</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">1:1문의</h3>

                <h4 class="title">등록</h4>
				<form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchMemAdvRegNm" value="<c:out value="${commandMap.searchMemAdvRegNm }"/>"/>
                    <input type="hidden" name="searchMemAdvRegId" value="<c:out value="${commandMap.searchMemAdvRegId }"/>"/>
                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/>
                    <input type="hidden" name="searchMemMstMemTel" value="<c:out value="${commandMap.searchMemMstMemTel }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchMemAdvType" value="<c:out value="${commandMap.searchMemAdvType }"/>"/>
                    <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>"/>
                    <input type="hidden" name="searchMemAdvQstTypeUp" value="<c:out value="${commandMap.searchMemAdvQstTypeUp }"/>"/>
                    <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                </form>
                
                    <form name="frm" id="frm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchMemAdvRegNm" value="<c:out value="${commandMap.searchMemAdvRegNm }"/>"/>
	                    <input type="hidden" name="searchMemAdvRegId" value="<c:out value="${commandMap.searchMemAdvRegId }"/>"/>
	                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>"/>
	                    <input type="hidden" name="searchMemMstMemTel" value="<c:out value="${commandMap.searchMemMstMemTel }"/>"/>
	                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
	                    <input type="hidden" name="searchMemAdvType" value="<c:out value="${commandMap.searchMemAdvType }"/>"/>
	                    <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>"/>
	                    <input type="hidden" name="searchMemAdvQstTypeUp" value="<c:out value="${commandMap.searchMemAdvQstTypeUp }"/>"/>
	                    <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
	                    
		                <div class="section-form"><!-- section-form-a -->
						    <div class="form-group">
		                        <label class="label"><span>구분<em class="strong">*</em></span></label>
		                       	<select class="select" name="MEM_ADV_TYPE" id="MEM_ADV_TYPE">
									<option value="">선택</option>
									<c:if test="${not empty advTypeCodeList }">
									    <c:forEach var="advTypeCodeRow" items="${advTypeCodeList }" varStatus="i" >
									    	<c:if test="${advTypeCodeRow.CMN_COM_IDX ne '2238'}">
										        <option value="<c:out value="${advTypeCodeRow.CMN_COM_IDX }"/>" >
										            <c:out value="${advTypeCodeRow.CMN_COM_NM }"/>
										        </option>
									        </c:if>
									    </c:forEach>
									</c:if>
								</select>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>문의유형<em class="strong">*</em></span></label>
		                        <select class="select" name="MEM_ADV_QST_TYPE_UP" id="MEM_ADV_QST_TYPE_UP">
									<option value="">선택</option>
									<c:if test="${not empty inqTypeCodeList }">
									    <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
									        <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>">
									            <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
									        </option>
									    </c:forEach>
									</c:if>
								</select>
<!-- 								<select class="select" name="MEM_ADV_QST_TYPE" id="MEM_ADV_QST_TYPE"> -->
<!-- 									<option value="">전체</option> -->
<!-- 								</select> -->
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>CS구분<em class="strong">*</em></span></label>
		                        <span>판매처 </span>
		                       	<select class="select" name="MEM_ADV_CS_STR" id="MEM_ADV_CS_STR">
									<option value="">선택</option>
									<c:if test="${not empty strTypeCodeList }">
									    <c:forEach var="strTypeCodeRow" items="${strTypeCodeList }" varStatus="i" >
									        <option value="<c:out value="${strTypeCodeRow.CMN_COM_IDX }"/>" >
									            <c:out value="${strTypeCodeRow.CMN_COM_NM }"/>
									        </option>
									    </c:forEach>
									</c:if>
								</select>
								<span>품목 </span>
								<select class="select" name="MEM_ADV_CS_ITM" id="MEM_ADV_CS_ITM">
									<option value="">선택</option>
									<c:if test="${not empty itmTypeCodeList }">
									    <c:forEach var="itmTypeCodeRow" items="${itmTypeCodeList }" varStatus="i" >
									        <option value="<c:out value="${itmTypeCodeRow.CMN_COM_IDX }"/>" >
									            <c:out value="${itmTypeCodeRow.CMN_COM_NM }"/>
									        </option>
									    </c:forEach>
									</c:if>
								</select>
		                    </div>
		                    
		                    <div class="form-group">
			                	<label class="label"><span>고객명</span></label>
		                   		<div class="field">
		                    		<input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" class="text" maxlength="15"/>
		                    		<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID"/>
		                    		<a href="#none" id="goMemberAdd" class="button button-b small js-modal" title="새 창 으로 열립니다."><span>회원검색</span></a>
		                   		</div>
		                    </div>
		                    <div class="form-group">
			                	<label class="label"><span>주문번호</span></label>
		                   		<div class="field">
		                    		<input type="text" name="ORD_MST_CD" id="ORD_MST_CD" class="text" maxlength="13"/>
		                    		<a href="#none" id="goOrder" class="button button-b small js-modal" title="새 창 으로 열립니다."><span>주문검색</span></a>
		                   		</div>
		                    </div>
		                    
		                    <div class="form-group">
			                	<label class="label"><span>상품코드</span></label>
		                   		<div class="field">
		                    		<input type="text" name="MEM_ADV_MDL_NO" id="MEM_ADV_MDL_NO" class="text" maxlength="50"/>
		                    		<a href="#none" class="button button-b small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
		                   		</div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>제목<em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="MEM_ADV_TITLE" id="MEM_ADV_TITLE" class="text long" maxlength="250"/>
		                        </div>
		                    </div>
		
		                    <div class="form-group">
		                        <label class="label"><span>내용<em class="strong">*</em></span></label>
		                        <div class="field">  
		                            <textarea class="textarea" name="MEM_ADV_CONTENTS" id="MEM_ADV_CONTENTS" style="height: 100px;"></textarea>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>답변 희망형태 </span></label>
		                        <div class="field">  
		                            <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN1" value="Y" class="radio" />
			                        <label for="MEM_ADV_MAIL_YN1">이메일</label>
			                        <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN2" value="T" class="radio" />
			                        <label for="MEM_ADV_MAIL_YN2">전화상담</label>
			                        <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN3" value="N" class="radio" checked="checked"/>
			                        <label for="MEM_ADV_MAIL_YN3">받지않음(마이페이지에서 확인)</label>
		                        </div>
		                    </div>
		                           
		                </div><!-- // section-form-a -->


		                <h4 class="title">답변하기</h4>
		
		                <p>
		                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
		                </p>
		                
		                    
		            	<div class="section-form"><!-- section-form-a -->
		                    <div class="form-group">
		                        <label class="label"><span>답변내용 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <textarea class="textarea" name="MEM_ADV_RPL_CONTENTS" id="MEM_ADV_RPL_CONTENTS" style="height: 500px;"></textarea>
		                        </div>
		                    </div>
		                     
	                        
	                   
	                	</div><!-- // section-form-a -->
	 				</form>
	                <div class="section-button"><!-- section button -->
	                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
	                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
	                </div><!-- // section button -->

            	</div><!-- // contents-inner -->

        	</section><!-- // contents -->

   		</div><!-- // body -->
	    <footer><!-- footer -->
	        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	    </footer><!-- // footer -->
	</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>
<ui:editor objId="#MEM_ADV_RPL_CONTENTS"/>
<script type="text/javascript">
$(document).ready(function () {
    
    // 답변 달기 vaildation rules 적용
    /* $("#frm").validate({
        rules: 
        {
            MEM_ADV_RPL_CONTENTS:{required:true} 
        }
    }); */
    
	$(document).on("click", ".search-product-popup", function () {
	    popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
	
    fnResultProduct = function(params){
    	$.each(params, function(index,item){
    		$("#MEM_ADV_MDL_NO").val(item.PRD_MST_CD);
    	//	$("#PRD_MST_ERP_CD").val(item.PRD_MST_ERP_CD);
        	 
        });
    	
    	return true;
    };
    
    $(document).on("click", "#goMemberAdd", function () 
    {	
    	window.open("<c:out value="${serverDomain}"/>/am/member/searchMemberPopup.do","searchMemberPopup","width=900,height=700,scrollbars=yes,target=_blank");
    });	
    
    fnResultMember = function(params){
    	$.each(params, function(index,item){
    		$("#MEM_MST_MEM_NM").val(item.MEM_MST_MEM_NM);
    		$("#MEM_MST_MEM_ID").val(item.MEM_MST_MEM_ID);
    	
        });
    	
    	return true;
    };
    
    $(document).on("click", "#goOrder", function () 
   	{	
      	window.open("<c:out value="${serverDomain}"/>/am/order/searchOrderPopup.do","searchOrderPopup","width=900,height=700,scrollbars=yes,target=_blank");
    });	    
    
    fnResultOrder = function(params){
    	$.each(params, function(index,item){
    		$("#ORD_MST_CD").val(item.ORD_MST_CD);
    		
        });
    	
    	return true;
    };
    
  
    // 저장 버튼 클릭 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        if($frm.valid())
        {
        	
        	if($.trim($("#MEM_ADV_TYPE").val()) == ""){
    			alert("구분을 입력해 주십시오.");
    			$("#MEM_ADV_TYPE").focus();
    			return;
    		}
        	
        	if($.trim($("#MEM_ADV_QST_TYPE").val()) == ""){
    			alert("문의유형을 입력해 주십시오.");
    			$("#MEM_ADV_QST_TYPE").focus();
    			return;
    		}
        	
        	if($.trim($("#MEM_ADV_CS_STR").val()) == ""){
    			alert("판매처를 입력해 주십시오.");
    			$("#MEM_ADV_CS_STR").focus();
    			return;
    		}
        	
        	if($.trim($("#MEM_ADV_CS_ITM").val()) == ""){
    			alert("품목을 입력해 주십시오.");
    			$("#MEM_ADV_CS_ITM").focus();
    			return;
    		}
        	
        	/*if($.trim($("#MEM_MST_MEM_NM").val()) == ""){
    			alert("고객명을 입력해 주십시오.");
    			$("#MEM_MST_MEM_NM").focus();
    			return;
    		}*/
        	
        	
        	
        	if($.trim($("#MEM_ADV_TITLE").val()) == ""){
    			alert("제목을 입력해 주십시오.");
    			$("#MEM_ADV_TITLE").focus();
    			return;
    		}
        	
        	if($.trim($("#MEM_ADV_CONTENTS").val()) == ""){
    			alert("내용을 입력해 주십시오.");
    			$("#MEM_ADV_CONTENTS").focus();
    			return;
    		}
        	
        	try { oEditors.getById["MEM_ADV_RPL_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#MEM_ADV_RPL_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[답변내용]반드시 입력해주십시오.");
                $("#MEM_ADV_RPL_CONTENTS").focus();
                return;
            }
            
           	if(confirm("등록 하시겠습니까?"))
           	{
           		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/inquiryRegist.do", "target":"_self", "method":"post"}).submit();
           	}
         
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/board/inquiryList.do", "target":"_self", "method":"post"}).submit();
    });
    
  
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
});
</script>
</body>
</html>