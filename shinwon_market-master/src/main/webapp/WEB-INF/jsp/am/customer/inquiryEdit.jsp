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

                <h2 class="title"><span>1:1문의</span></h2>

                <h3 class="title"><span>상세</span></h3>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><label class="label"><span>문의 유형</span></label></th>
							<td>
								<c:out value="${row.MEM_ADV_QST_TYPE_UP_NM }" /> > <c:out value="${row.MEM_ADV_QST_TYPE_NM }" />
							</td>
						</tr>
						<c:if test="${row.MEM_ADV_TYPE ne '2238'}">
							<tr>
								<th><label class="label"><span>CS구분</span></label></th>
								<td>
									<span>판매처 : </span><c:out value="${row.MEM_ADV_CS_STR_NM }" /> <span>/ 품목 : </span> <c:out value="${row.MEM_ADV_CS_ITM_NM }" />
								</td>
							</tr>
						</c:if>
						<tr>
							<th><label class="label"><span>고객명</span></label></th>
							<td>
								<c:if test="${not empty row.MEM_MST_MEM_ID}">
		                            <a href="javascript:goView('<c:out value="${row.MEM_MST_MEM_ID }" />');">
		                                <c:out value="${row.MEM_MST_MEM_NM }" />(<c:out value="${row.MEM_MST_MEM_ID }"/>)
		                            </a>
	                            </c:if>
	                            <c:if test="${empty row.MEM_MST_MEM_ID}">
		                        	<c:out value="${row.MEM_MST_MEM_NM }" />
	                            </c:if>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>휴대폰번호 </span></label></th>
							<td>
								<c:out value="${row.MEM_TEL_NO }" />
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>이메일</span></label></th>
							<td>
								<c:if test="${not empty row.MEM_ADV_EMAIL}">
	                   				<c:out value="${row.MEM_ADV_EMAIL }"/>
	                   			</c:if>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>제목</span></label></th>
							<td>
								<c:if test="${row.MEM_ADV_MBL_YN eq 'Y'}">
	        						<img alt="모바일작성" src="../img/image_phone.png"/>
	    						</c:if>
	                            <c:out value="${row.MEM_ADV_TITLE }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>내용</span></label></th>
							<td>
								<ui:replaceLineBreak content="${row.MEM_ADV_CONTENTS }"/>
							</td>
						</tr>
						<c:if test="${row.MEM_ADV_TYPE eq '2238'}">
							<tr>
								<th><label class="label"><span>첨부파일</span></label></th>
								<td>
									<form name="fileForm" id="fileForm">
							            <input type="hidden" name="CMM_FLE_IDX" value=""/>
							            <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
							            <input type="hidden" name="CMM_FLE_ORG_NM" value="" />                    
					                   	
			                    		<c:if test="${not empty fileList }">    
											<c:forEach var="fileRow" items="${fileList }" varStatus="i">
			                              		<i class="icon-file"></i>
			                              		<a href="#none" class="file-ilst-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
			                                  		<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
			                              		</a>
			                           		</c:forEach>	
			                    		</c:if>
				                    </form> 
	                            </td>
							</tr>
						</c:if>
						<tr>
							<th><label class="label"><span>등록일</span></label></th>
							<td>
								<c:out value="${row.MEM_ADV_REG_NM }"/>(<c:out value="${row.MEM_ADV_REG_ID }"/>) / <ui:formatDate value="${row.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->     
				
				<h3 class="title"><span>답변하기</span></h3>
                <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                <form id="searchForm" name="searchForm">
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
                
                <form id="frm" name="frm"> 
                	<input type="hidden" name="MEM_ADV_IDX" value="<c:out value="${row.MEM_ADV_IDX }"/>"/>
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
                    
                    <!-- 메일/SMS전송을 위한 정보 -->
                    <input type="hidden" name="MEM_ADV_TYPE" value="<c:out value="${row.MEM_ADV_TYPE}"/>"/><!-- 문의유형 -->
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${row.MEM_MST_MEM_ID}"/>"/><!-- 문의자 이름 -->
                    <input type="hidden" name="MEM_MST_MEM_NM" value="<c:out value="${row.MEM_MST_MEM_NM}"/>"/><!-- 문의자 ID -->
                    <input type="hidden" name="MEM_ADV_EMAIL" value="<c:out value="${row.MEM_ADV_EMAIL}"/>"/><!-- 메일 주소 -->
                    <input type="hidden" name="MEM_ADV_MAIL_YN" value="<c:out value="${row.MEM_ADV_MAIL_YN}"/>"/><!-- 메일 수신 여부 -->
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>답변상태</span></label></th>
	                    		<td>
	                    			<c:if test="${row.MEM_ADV_RPL_YN eq 'Y' }">답변완료</c:if>
	                            	<c:if test="${row.MEM_ADV_RPL_YN eq 'N' }">답변대기</c:if>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>답변내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea class="textarea xlarge" name="MEM_ADV_RPL_CONTENTS" id="MEM_ADV_RPL_CONTENTS" style="height: 500px; width:80%;"><c:out value="${row.MEM_ADV_RPL_CONTENTS }"/></textarea>
	                    		</td>
	                        </tr>
	                        <c:if test="${row.MEM_ADV_RPL_YN eq 'Y' }">
		                        <tr>
		                    		<th><label class="label"><span>답변일</span></label></th>
		                    		<td>
		                    			${row.MEM_ADV_UPD_NM }(${row.MEM_ADV_UPD_ID }) / <ui:formatDate value="${row.MEM_ADV_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
		                    		</td>
		                        </tr>
	                        </c:if>
	                    </tbody>
                	</table><!-- // table -->
                </form>
               	<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button --> 

            </div>

        </div><!-- // contents -->
		<!-- 파일 다운로드용 폼 -->
        <form name="fileForm" id="fileForm">
             <input type="hidden" name="CMM_FLE_IDX" value=""/>
             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>
    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<ui:editor objId="#MEM_ADV_RPL_CONTENTS"/>
<script>
$(function(){

    // 답변 처리 요청 validation rules 적용
    $("#smsForm").validate({
        rules: 
        { 
            SMS_HP1:{required:true, number:true},
            SMS_HP2:{required:true, number:true},
            SMS_HP3:{required:true, number:true}
        },
        messages :{
            SMS_HP1:{required:"핸드폰번호 첫 자리를 선택해 주십시오"},
            SMS_HP2:{required:"핸드폰번호 중간 자리를 선택해 주십시오"},
            SMS_HP3:{required:"핸드폰번호 끝 자리를 선택해 주십시오"}
        }
    });
    
    // 저장 버튼 클릭 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        
        if($frm.valid())
        {
        	try { oEditors.getById["MEM_ADV_RPL_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#MEM_ADV_RPL_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#MEM_ADV_REPLY_CONTENTS").focus();
                return;
            }
            if($("input[name='MEM_ADV_MAIL_YN']").val() == "Y")
            {
            	if(confirm("저장된 답변은 질문자에게 메일로 발송됩니다.\n작성한 답변을 저장하시겠습니까?"))
                {
                    $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/inquiryModify.do", "target":"_self", "method":"post"}).submit();
                }	
            }
            else
            {
            	if(confirm("작성한 답변을 저장하시겠습니까?"))
            	{
            		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/inquiryModify.do", "target":"_self", "method":"post"}).submit();
            	}
            }
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/board/inquiryList.do", "target":"_self", "method":"post"}).submit();
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
    
    // 파일 다운로드
    $(document).on("click", "#fileForm .file-ilst-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($this.text().trim());
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
    
 	// 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };
});
//-->
</script>

</body>
</html>
