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

                <h2 class="title"><span>상품문의</span></h2>

                <h3 class="title"><span>문의내용</span></h3>
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <c:if test="${not empty row.BRD_PRD_MST_CD }">
                            <tr>
                                <th><label class="label"><span>상품코드</span></label></th>
                                <td>
                                    <a href="<c:out value="${serverDomain}" />/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.BRD_PRD_MST_CD }" />" target="_blank" title="새 창 으로 열립니다.">
                                        <c:out value="${row.BRD_PRD_MST_CD}"/>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty row.BRD_PRD_MST_NM }">
                            <tr>
                                <th><label class="label"><span>상품명</span></label></th>
                                <td>
                                    <a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${row.BRD_PRD_MST_CD}&ADMIN=Y" target="_blank">
                                    <c:out value="${row.BRD_PRD_MST_NM }"/>
                                </a>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <th><label class="label"><span>작성자</span></label></th>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
                                        <c:out value="${row.BRD_INQ_REG_NM }" />(<c:out value="${row.BRD_INQ_REG_ID }"/>)
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goView('<c:out value="${row.BRD_INQ_REG_ID }" />');">
                                            <c:out value="${row.BRD_INQ_REG_NM }" />(<c:out value="${row.BRD_INQ_REG_ID }"/>)
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록일</span></label></th>
                            <td>
                                <ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목</span></label></th>
                            <td>
                                <c:out value="${row.BRD_INQ_TITLE }"/>
                            </td>
                        </tr>
                        
                        <tr>
                            <th><label class="label"><span>내용</span></label></th>
                            <td>
                                <ui:replaceLineBreak content="${row.BRD_INQ_CONTENTS}"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>공개여부</span></label></th>
                            <td>
                       		 	<c:out value="${row.BRD_INQ_PUB_YN eq 'Y' ? '공개':'비공개' }"/>
                            </td>
                        </tr>
                        
                    </tbody>
                </table><!-- // table -->
                
                <h3 class="title"><span>답변하기</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchRegNm" value="<c:out value="${commandMap.searchRegNm }"/>"/>
                    <input type="hidden" name="searchRegId" value="<c:out value="${commandMap.searchRegId }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>                    
                    <input type="hidden" name="searchBrdInqUseYn" value="<c:out value="${commandMap.searchBrdInqUseYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                </form>
                
                <form id="frm" name="frm" > 
                    <input type="hidden" name="BRD_INQ_IDX" value="<c:out value="${row.BRD_INQ_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchRegNm" value="<c:out value="${commandMap.searchRegNm }"/>"/>
                    <input type="hidden" name="searchRegId" value="<c:out value="${commandMap.searchRegId }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>                    
                    <input type="hidden" name="searchBrdInqUseYn" value="<c:out value="${commandMap.searchBrdInqUseYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="" />
                     
                    <!-- 메일/SMS전송을 위한 정보 -->
                    <input type="hidden" name="BRD_INQ_TYPE" value="<c:out value="${row.BRD_INQ_TYPE}"/>"/><!-- 문의유형 -->
                    <input type="hidden" name="BRD_INQ_TYPE_NM" value="상품문의"/><!-- 문의유형 -->
                    <input type="hidden" name="BRD_INQ_REG_NM" value="<c:out value="${row.BRD_INQ_REG_NM}"/>"/><!-- 문의자 이름 -->
                    <input type="hidden" name="BRD_INQ_REG_ID" value="<c:out value="${row.BRD_INQ_REG_ID}"/>"/><!-- 문의자 ID -->
                    <%-- <input type="hidden" name="BRD_INQ_ALARM_EMAIL" value="<c:out value="${row.BRD_INQ_ALARM_EMAIL}"/>"/><!-- 메일 수신 여부 -->
                    <input type="hidden" name="BRD_INQ_ALARM_HP" value="<c:out value="${row.BRD_INQ_ALARM_HP}"/>"/><!-- SMS 수신 여부 --> --%>
                    <input type="hidden" name="BRD_INQ_EMAIL" value="<c:out value="${row.BRD_INQ_EMAIL_ID}@${row.BRD_INQ_EMAIL_DOMAIN}"/>"/><!-- 메일 주소 -->
                    <%--<input type="hidden" name="BRD_INQ_HP" value="<c:out value="${row.BRD_INQ_HP1}${row.BRD_INQ_HP2}${row.BRD_INQ_HP3}"/>"/><!-- 핸드폰 번호 --> --%>
                    <input type="hidden" name="BRD_INQ_TITLE" value="<c:out value="${row.BRD_INQ_TITLE}"/>"/>
					<input type="hidden" name="BRD_INQ_REG_DT" value="<c:out value="${row.BRD_INQ_REG_DT}"/>"/>
					<input type="hidden" name="BRD_INQ_REG_NM" value="<c:out value="${row.BRD_INQ_REG_NM}"/>"/>
					<input type="hidden" name="MEM_MST_MAIL" value="<c:out value="${row.MEM_MST_MAIL}"/>"/><!-- 메일 주소 -->
					<input type="hidden" name="MEM_MST_MEM_NM" value="<c:out value="${row.BRD_INQ_REG_NM}"/>"/><!-- 문의자 이름 -->
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${row.BRD_INQ_REG_ID}"/>"/><!-- 문의자 ID -->
                    <input type="hidden" name="PRD_MST_NM" value="<c:out value="${row.BRD_PRD_MST_NM}"/>"/><!-- 문의자 ID -->
                    <input type="hidden" name="BRD_INQ_CONTENTS" value="<c:out value="${row.BRD_INQ_CONTENTS}"/>"/><!-- 문의자 ID -->

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="radio" id="BRD_INQ_USE_YN_A" name="BRD_INQ_USE_YN" class="radio" value="Y" <c:if test="${row.BRD_INQ_USE_YN eq 'Y' or empty row.BRD_INQ_USE_YN}">checked="checked"</c:if> />
                                    <label for="BRD_INQ_USE_YN_A">사용</label>
                                    <input type="radio" id="BRD_INQ_USE_YN_B" name="BRD_INQ_USE_YN"class="radio"  value="N" <c:if test="${row.BRD_INQ_USE_YN eq 'N'}">checked="checked"</c:if> />
                                    <label for="BRD_INQ_USE_YN_B">미사용</label>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>답변상태</span></label></th>
                                <td>
                                    <c:out value="${row.BRD_INQ_REPLY_CD =='Y' ? '답변완료' : '답변대기' }"/>		
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>답변내용<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea class="textarea xlarge" name="BRD_INQ_REPLY_CONTENTS" id="BRD_INQ_REPLY_CONTENTS" style="height: 500px; width:80%;"></textarea>
                                </td>
                            </tr>
                            <c:if test="${empty commandMap.searchVdrMstIdx }"><%-- SB일 경우 노출--%>
                            <tr>
                            	<c:if test="${pushAlarmYN eq 'Y' }">
	                                <th><label class="label"><span>답변 요청일</span></label></th>
	                                <td>
	                               		<a href="#none" id="goRequest" class="button button-a small mt10"  >답변 요청</a> <ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
	                                </td>
                                </c:if>
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
    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<ui:editor objId="#BRD_INQ_REPLY_CONTENTS"/>
<script>
$(function(){
	
	
	
    // 답변 달기 vaildation rules 적용
    /* $("#frm").validate({
        rules: 
        {
            BRD_INQ_REPLY_CONTENTS:{required:true} 
        }
    }); */
    
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
    
    //SCM->입점사 답변요청 클릭 이벤트
    $("#goRequest").on("click", function () {
		if(confirm("담당자에게 답변 요청하시겠습니까?") == true){
			alert("처리되었습니다.")
			
		}else{
			return;
		}
	});
    
    
    // 저장 버튼 클릭 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        if($frm.valid())
        {
            try { oEditors.getById["BRD_INQ_REPLY_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);  } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_INQ_REPLY_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
                 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_INQ_REPLY_CONTENTS").focus();
                return;
            }
            if(confirm("작성한 답변을 저장하시겠습니까?"))
            {
                $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/productInquiryRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/board/productInquiryList.do", "target":"_self", "method":"post"}).submit();
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
                url : "<c:out value="${serverDomain}" />/am/board/productInquirySendSmsAjax.do",
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
    
    goErpPrdDetail = function (erpMstCd){
        var $frm = $("#frm");
        $frm.find("input[name=searchPrdMstErpCd]").val(erpMstCd);
        popup('',"1100","800","no","_ErpMstPrdDetailPopup");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/legacyErpProductDetailPopup.do", "target":"popup_ErpMstPrdDetailPopup", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
