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

            <h2 class="title"><span>셀러문의</span></h2>

            <h3 class="title"><span>문의내용</span></h3>
            <table cellspacing="0" class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 20%;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><label class="label"><span>작성자</span></label></th>
                        <td>
                        	<c:out value="${row.BRD_INQ_REG_NM }" />(<c:out value="${row.BRD_INQ_REG_ID }"/>)
                        </td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>등록일</span></label></th>
                        <td><ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>제목</span></label></th>
                        <td><c:out value="${row.BRD_INQ_TITLE }"/></td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>내용</span></label></th>
                        <td><ui:replaceLineBreak content="${row.BRD_INQ_CONTENTS}"/></td>
                    </tr>
                    <tr>
                        <th><label class="label"><span>공개여부</span></label></th>
                    	<td><c:out value="${row.BRD_INQ_PUB_YN =='Y' ? '공개' : '비공개' }"/></td>
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
	            <input type="hidden" name="BRD_INQ_REG_NM" value="<c:out value="${row.BRD_INQ_REG_NM}"/>"/><!-- 문의자 이름 -->
	            <input type="hidden" name="BRD_INQ_REG_ID" value="<c:out value="${row.BRD_INQ_REG_ID}"/>"/><!-- 문의자 ID -->
	            <%-- <input type="hidden" name="BRD_INQ_ALARM_EMAIL" value="<c:out value="${row.BRD_INQ_ALARM_EMAIL}"/>"/><!-- 메일 수신 여부 -->
	            <input type="hidden" name="BRD_INQ_ALARM_HP" value="<c:out value="${row.BRD_INQ_ALARM_HP}"/>"/><!-- SMS 수신 여부 --> --%>
	            <input type="hidden" name="BRD_INQ_EMAIL" value="<c:out value="${row.BRD_INQ_EMAIL_ID}@${row.BRD_INQ_EMAIL_DOMAIN}"/>"/><!-- 메일 주소 -->
	            <%--<input type="hidden" name="BRD_INQ_HP" value="<c:out value="${row.BRD_INQ_HP1}${row.BRD_INQ_HP2}${row.BRD_INQ_HP3}"/>"/><!-- 핸드폰 번호 --> --%>
	            <table cellspacing="0" class="table-row table-a"><!-- table -->
	                <colgroup>
	                    <col style="width: 20%;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th><label class="label"><span>사용여부<i class="require"><em>필수입력</em></i></span></label></th>
	                        <td>
	                            <input type="radio" id="BRD_INQ_USE_YN_A" name="BRD_INQ_USE_YN" class="radio"  value="Y" <c:if test="${row.BRD_INQ_USE_YN eq 'Y'}">checked="checked"</c:if>/>
	                            <label for="BRD_INQ_USE_YN_A">사용</label>
	                            <input type="radio" id="BRD_INQ_USE_YN_B" name="BRD_INQ_USE_YN"class="radio"  value="N" <c:if test="${row.BRD_INQ_USE_YN ne 'Y'}">checked="checked"</c:if>/>
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
	                    <c:if test="${row.BRD_INQ_REPLY_CD =='Y' }"><%-- 답변완료일경우 --%>
		                    <tr>
		                        <th><label class="label"><span>답변일</span></label></th>
		                        <td>
		                            ${row.BRD_INQ_REPLY_ID }(${row.BRD_INQ_REPLY_NM }) / <ui:formatDate value="${row.BRD_INQ_REPLY_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
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

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>
<ui:editor objId="#BRD_INQ_REPLY_CONTENTS"/>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
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
            try { oEditors.getById["BRD_INQ_REPLY_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);  } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_INQ_REPLY_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
                 alert("[답변내용] 입력해주세요.");
                $("#BRD_INQ_REPLY_CONTENTS").focus();
                return;
            }
            if(confirm("사용자에게 답변이 발송됩니다. 저장하시겠습니까?"))
            {
                $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/sellerInquiryRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/board/sellerInquiryList.do", "target":"_self", "method":"post"}).submit();
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
                url : "<c:out value="${serverDomain}" />/am/board/sellerInquirySendSmsAjax.do",
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
