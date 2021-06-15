<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title"><c:out value="${row.BRD_INQ_REG_ID }" />(<c:out value="${row.BRD_INQ_REG_NM }" />)님의 정보</h1>
    <a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

    <div id="contents"><!-- contents -->

        <div class="tab-a justified"><!-- tab -->
            <ul class="tab">
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">회원정보</a></li>
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">주문내역</a></li>
            	<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">쿠폰내역</a></li>
<%-- 				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponPopup.do?MEM_MST_MEM_ID=<c:out value="${commandMap.MEM_MST_MEM_ID}" />">쿠폰보유내역</a></li> --%>
<%-- 				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberCouponUsePopup.do?MEM_MST_MEM_ID=<c:out value="${commandMap.MEM_MST_MEM_ID}" />">쿠폰사용내역</a></li> --%>
				<li><a href="<c:out value="${serverDomain}" />/am/member/infoMemberPointPopup.do?CUST_ID=<c:out value="${memberInfo.CUST_ID}"/>&COMP_CD=<c:out value="${commandMap.COMP_CD}"/>">포인트내역</a></li>
				<li class="active"><a href="#none">문의내역</a></li>
            </ul>
        </div><!-- // tab -->

        <h3 class="semantic">문의내역</h3>

        <h4 class="title">문의내역</h4>

        <div class="table-a table-row"><!-- row list -->
            <table class="core">
                <colgroup>
                    <col style="width: 20%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th>등록일</th>
                        <td><ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                    </tr>
                    <tr>
                        <th>문의유형</th>
                        <td><c:out value="${row.CMN_COM_NM }"/></td>
                    </tr>
                    
                    <c:if test="${not empty row.BRD_PRD_MST_CD }">
	                    <tr>
	                        <th>상품</th>
	                        <td>
	                        	<a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.BRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
	                                <span class="thumb" data-thumb="50/50">
	                                   <img src="<c:out value="${cdnDomain }${row.PRD_MST_IMG_URL_PATH}"/>" onerror="this.src='<c:out value="${img_domain }"/>/pc/img/common/noimage_64.gif'" alt="" />
	                                </span>
	                                <strong class="subject" style="display: table-row" ><c:out value="${row.BRD_PRD_MST_NM }"/></strong>
	                            </a>
	                        </td>
	                    </tr>
                    </c:if>
                    <c:if test="${not empty row.BRD_ORD_MST_CD }">
	                    <tr>
	                        <th>주문번호</th>
	                        <td>
	                            <a href="<c:out value="${serverDomain}"/>/am/order/orderPopup.do?ORD_MST_CD=<c:out value="${row.BRD_ORD_MST_CD}"/>">
	                               <c:out value="${row.BRD_ORD_MST_CD }"/>
	                            </a>
	                        </td>
	                    </tr>
                    </c:if>
                    <c:if test="${not empty row.BRD_DLV_CPN_IDX and not empty row.BRD_INVOICE_NO}">
	                    <tr>
	                        <th>송장번호</th>
	                        <td><c:out value="${row.BRD_DLV_CPN_NM }, ${row.BRD_INVOICE_NO }"/></td>
	                    </tr>
                    </c:if>
                    <tr>
                        <th>제목</th>
                        <td><c:out value="${row.BRD_INQ_TITLE }"/></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td style="white-space: pre-line;"><c:out value="${row.BRD_INQ_CONTENTS }" escapeXml="false" />
<%--                         	<c:if test="${not empty fileList }"> --%>
<!-- 		                         <br/><br/> -->
<%-- 		                    	<c:forEach var="fileRow" items="${fileList }" varStatus="i"> --%>
<%-- 		                           <img src="${img_domain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }"/> --%>
<%-- 		                        </c:forEach>		                        		                         --%>
<%-- 		                    </c:if> --%>
                        </td>
                    </tr>
                    <tr>	                    
	                  	<th>첨부파일</th>
	                   	<td>
	                       <c:forEach var="fileRow" items="${fileList }" varStatus="i">
	                          <i class="icon-file"></i>
	                          <a href="javascript:;" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
	                              <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
	                          </a>
	                       </c:forEach>
	                   	</td>
                    </tr>
                </tbody>
            </table>
        </div><!-- // row list -->
		
		<!-- 파일 다운로드 폼 -->
		<form name="fileForm" id="fileForm">
	        <input type="hidden" name="CMM_FLE_IDX" value=""/>
	        <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	        <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>
        
        <h4 class="title">답변</h4>
        
        <div class="section-form"><!-- section-form-a -->
            <form name="frm" id="frm">
            	<input type="hidden" name="CUST_ID" value="<c:out value="${commandMap.CUST_ID }"/>" />
                <input type="hidden" name="BRD_INQ_IDX" value="<c:out value="${row.BRD_INQ_IDX }"/>"/>
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>
                <input type="hidden" name="searchBrdInqType" value="<c:out value="${commandMap.searchBrdInqType }"/>"/>
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                <input type="hidden" name="COMP_CD" value="<c:out value="${commandMap.COMP_CD }"/>"/>
	                    
                <!-- 메일/SMS전송을 위한 정보 -->
                <input type="hidden" name="BRD_INQ_TYPE" value="<c:out value="${row.BRD_INQ_TYPE}"/>"/><!-- 문의유형 -->
                <input type="hidden" name="BRD_INQ_REG_NM" value="<c:out value="${row.BRD_INQ_REG_NM}"/>"/><!-- 문의자 이름 -->
                <input type="hidden" name="BRD_INQ_REG_ID" value="<c:out value="${row.BRD_INQ_REG_ID}"/>"/><!-- 문의자 ID -->
                <%-- <input type="hidden" name="BRD_INQ_ALARM_EMAIL" value="<c:out value="${row.BRD_INQ_ALARM_EMAIL}"/>"/><!-- 메일 수신 여부 --> --%>
                <%-- <input type="hidden" name="BRD_INQ_ALARM_HP" value="<c:out value="${row.BRD_INQ_ALARM_HP}"/>"/><!-- SMS 수신 여부 --> --%>
               	<input type="hidden" name="BRD_INQ_EMAIL" value="<c:out value="${row.BRD_INQ_EMAIL}"/>"/><!-- 메일 주소 --> 
	            <input type="hidden" name="BRD_INQ_RET_YN" value="<c:out value="${row.BRD_INQ_RET_YN}"/>"/><!-- 메일 수신 여부 -->
                <%-- <input type="hidden" name="BRD_INQ_HP" value="<c:out value="${row.BRD_INQ_HP1}${row.BRD_INQ_HP2}${row.BRD_INQ_HP3}"/>"/><!-- 핸드폰 번호 --> --%>
                
                <div class="form-group">
                    <label class="label"><span>답변상태 <em class="strong">*</em></span></label>
                    <div class="field">
                        <span class="label label-<c:out value="${row.BRD_INQ_REPLY_CD eq 'Y'?'b':'a' }"/>"><c:out value="${row.BRD_INQ_REPLY_CD eq 'Y'?'답변완료':'문의접수' }"/></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="label"><span>답변내용 <em class="strong">*</em></span></label>
                    <div class="field">
                        <textarea class="textarea" name="BRD_INQ_REPLY_CONTENTS" id="BRD_INQ_REPLY_CONTENTS" style="height: 500px;"><c:out value="${row.BRD_INQ_REPLY_CONTENTS }"/></textarea>
                    </div>
                </div>
                <c:if test="${row.BRD_INQ_REPLY_CD eq 'Y'}">
                <div class="form-group">
                       <label class="label"><span>답변자</span></label>
                       <div class="field">
                       	${row.BRD_INQ_REPLY_ID }(${row.BRD_INQ_REPLY_NM })
                            / <ui:formatDate value="${row.BRD_INQ_REPLY_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                       </div>
                </div>
                </c:if>
            </form>
        </div><!-- // section-form-a -->

        <div class="section-button"><!-- section button -->
            <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
            <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
        </div><!-- // section button -->
   
        
        
        <form name="searchForm" id="searchForm">
            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
            <input type="hidden" name="CUST_ID" value="<c:out value="${commandMap.CUST_ID }"/>" />
            <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
            <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
            <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
            <input type="hidden" name="COMP_CD" value="<c:out value="${commandMap.COMP_CD }"/>"/>
        </form>
        
    </div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<ui:editor objId="#BRD_INQ_REPLY_CONTENTS"/>
<script>
$(document).ready(function () {
   
	// 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberInquiryListPopup.do", "target":"_self", "method":"post"}).submit();
    });
    
 // 저장 버튼 클릭 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        if($frm.valid())
        {
        	try { oEditors.getById["BRD_INQ_REPLY_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_INQ_REPLY_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_INQ_REPLY_CONTENTS").focus();
                return;
            }
            if($("input[name='BRD_INQ_RET_YN']").val() == "Y")
            {
            	if(confirm("저장된 답변은 질문자에게 메일로 발송됩니다.\n작성한 답변을 저장하시겠습니까?"))
                {
                    $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberInquiryModify.do", "target":"_self", "method":"post"}).submit();
                }	
            }
            else
            {
            	if(confirm("작성한 답변을 저장하시겠습니까?"))
            	{
            		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberInquiryModify.do", "target":"_self", "method":"post"}).submit();
            	}
            }
        }
    });
 
    // sns 발송 버튼 클릭 이벤트
    $(document).on("click", "#goSendSms", function () {
        var $smsForm = $("#smsForm");
        if($smsForm.valid())
        {
            var data = {"SMS_HP1":$smsForm.find("#SMS_HP1").val(), "SMS_HP2":$smsForm.find("#SMS_HP2").val(), "SMS_HP3":$smsForm.find("#SMS_HP3").val()};
            $.ajax
            ({
                async : false,
                type : "POST",
                data : data,
                url : "<c:out value="${serverDomain}" />/am/board/inquirySendSmsAjax.do",
                success : function (data) 
                { 
                    alert(data.message);
                },
                error : function (err)
                {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
                }
            });
        } 
    });
});
</script>
</body>
</html>