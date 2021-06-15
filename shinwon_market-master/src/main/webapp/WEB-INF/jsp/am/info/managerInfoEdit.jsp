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

            <div class="container"><!-- container -->

                <h2 class="title"><span>관리자 정보 수정</span></h2>

                <h3 class="title"><span>수정</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchAuthority" value="<c:out value="${commandMap.searchAuthority }"/>"/>
                    <input type="hidden" name="searchAdmMstState" value="<c:out value="${commandMap.searchAdmMstState }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
 
                <form id="frm" name="frm">
                    <input type="hidden" name="ADM_MST_ID" id="ADM_MST_ID" value="<c:out value="${row.ADM_MST_ID }"/>" /> 
                    <input type="hidden" name="ADM_MST_ERP_NO" id="ADM_MST_ERP_NO" value="<c:out value="${row.ADM_MST_ERP_NO }"/>"/>
                    <input type="hidden" name="ADM_MST_STATE" value="${row.ADM_MST_STATE}"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchAuthority" value="<c:out value="${commandMap.searchAuthority }"/>"/>
                    <input type="hidden" name="searchAdmMstState" value="<c:out value="${commandMap.searchAdmMstState }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>아이디 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <c:out value="${row.ADM_MST_ID }" />
                                </td>
                            </tr>
                            <tr>
                                <th><span>이름 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="ADM_MST_NM" id="ADM_MST_NM" readonly="readonly" value="<c:out value="${row.ADM_MST_NM }" />" class="test" maxlength="6" />
                                </td>
                            </tr>
                            <tr>
                                <th><span>비밀번호 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                <input type="password" id="passOrg" class="text" maxlength="15" style="display:none;">
                                    <input type="checkbox" id="pwdChange" class="checkbox" />
                                    <label for="pwdChange">비밀번호 변경시 체크</label>                                    
                                </td>
                            </tr>  
                            <tr class="pwDiv">
                                <th><span>비밀번호 확인 <i class="require"><em>필수입력</em></i></span></th>
                                <td class="pwInputDiv">
                                    <input type="password" name="ADM_MST_PWD" id="ADM_MST_PWD" class="text" maxlength="15"/>
                                    <small style="margin-left:10px;">영문, 숫자, 특수문자 포함 8~15자 입력</small>                                
                                </td>
                            </tr>
                            <tr>
                                <th><span>관리자권한 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <c:if test="${not empty authList }">
                                        <c:forEach var="authRow" items="${authList }" varStatus="i">
                                            <c:if test="${authRow.AUT_MST_IDX eq row.AUT_MST_IDX }">
                                                <input type="hidden" name="AUT_MST_IDX" id="AUT_MST_IDX" value="${authRow.AUT_MST_IDX }">
                                                <c:out value="${authRow.AUT_MST_NM }"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty vendorList }">
                                        <c:forEach var="vendorRow" items="${vendorList }" varStatus="i">
                                            <c:if test="${vendorRow.VDR_MST_IDX eq row.ADM_MST_SUB_IDX }">
                                                <input type="hidden" name="ADM_MST_SUB_IDX" id="ADM_MST_SUB_IDX" value="${vendorRow.VDR_MST_IDX }">
                                                / <c:out value="${vendorRow.VDR_MST_NM }"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>사원번호</span></th>
                                <td>
                                    <c:out value="${row.AUT_MST_ERP_NO }" />                             
                                </td>
                            </tr>
                            <tr>
                                <th><span>휴대폰 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="ADM_MST_HP1" id="ADM_MST_HP1">
                                        <option value="" <c:if test="${empty row.ADM_MST_HP1 }">selected="selected"</c:if>>선택</option>
                                        <c:if test="${not empty codes.HP_CODE }">
                                            <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
                                                <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${row.ADM_MST_HP1 eq hpRow.CMN_COM_NM }">selected="selected"</c:if>>
                                                    <c:out value="${hpRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select> -
                                    <input type="text" name="ADM_MST_HP2" id="ADM_MST_HP2" value="<c:out value="${row.ADM_MST_HP2 }"/>" class="text number" maxlength="4"/> - 
                                    <input type="text" name="ADM_MST_HP3" id="ADM_MST_HP3" value="<c:out value="${row.ADM_MST_HP3 }"/>" class="text number" maxlength="4"/>                       
                                </td>
                            </tr>
                            <tr>
                                <th><span>전화번호 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="ADM_MST_TEL1" id="ADM_MST_TEL1">
                                        <option value="" <c:if test="${empty ADM_MST_TEL1 }">selected="selected"</c:if>>선택</option>
                                        <c:if test="${not empty codes.TEL_CODE }">
                                            <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
                                                <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${row.ADM_MST_TEL1 eq telRow.CMN_COM_NM}">selected="selected"</c:if>>
                                                    <c:out value="${telRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select> -
                                    <input type="text" name="ADM_MST_TEL2" id="ADM_MST_TEL2" value="<c:out value="${row.ADM_MST_TEL2 }"/>" class="text number" maxlength="4"/> - 
                                    <input type="text" name="ADM_MST_TEL3" id="ADM_MST_TEL3" value="<c:out value="${row.ADM_MST_TEL3 }"/>" class="text number" maxlength="4"/>                         
                                </td>
                            </tr>
                            <tr>
                                <th><span>이메일 </span></th>
                                <td>
                                    <input type="text" name="ADM_MST_EMAIL_ID" id="ADM_MST_EMAIL_ID" value="<c:out value="${row.ADM_MST_EMAIL_ID }"/>" class="text" maxlength="15"/> @
                                    <input type="text" name="ADM_MST_EMAIL_DOMAIN" id="ADM_MST_EMAIL_DOMAIN" value="<c:out value="${row.ADM_MST_EMAIL_DOMAIN }"/>" class="text" maxlength="15"/>
                                    <select class="select" name="emailDomain" id="emailDomain">
                                        <option value="">직접입력</option>
                                        <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
                                                <option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${row.ADM_MST_EMAIL_DOMAIN eq emailRow.CMN_COM_NM}">selected="selected"</c:if>>
                                                    <c:out value="${emailRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>업무구분 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="ADM_MST_TYPE" id="ADM_MST_TYPE">
                                        <c:if test="${not empty codes.WORK_DIVISION_CODE }">
                                            <c:forEach var="workRow" items="${codes.WORK_DIVISION_CODE }" varStatus="i">
                                                <option value="<c:out value="${workRow.CMN_COM_IDX }"/>" <c:if test="${workRow.CMN_COM_IDX eq row.ADM_MST_TYPE }">selected="selected"</c:if>>
                                                    <c:out value="${workRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>  
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    </div>
                </div><!-- // section-button -->
                
            </div><!-- // container -->

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
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 비밀번호 확인 숨김
    $(".pwDiv").hide();
    
    if("${row.AUT_MST_IDX}" == "${Code.VENDOR_ADMINISTRATOR_IDX}"){
        $(".erpNo").hide();
    }
    var pwChecked = $('#pwdChange').is(':checked');
    // 폼체크
    $("#frm").validate({
    	rules: {
            ADM_MST_NM:{required:true}, // 관리자 명
            AUT_MST_IDX:{required:true}, // 권한 Index
            ADM_MST_HP1:{required:true, number:true}, // 핸드폰 번호 앞 자리
            ADM_MST_HP2:{required:true, number:true, minlength:3, maxlength:4}, // 핸드폰 번호 중간 자리
            ADM_MST_HP3:{required:true, number:true, minlength:4, maxlength:4}, // 핸드폰 번호 끝 자리
            ADM_MST_TEL1:{required:false}, // 전화번호 앞 자리
            ADM_MST_TEL2:{required:false, number:true, minlength:3, maxlength:4}, // 전화번호 중간 자리
            ADM_MST_TEL3:{required:false, number:true, minlength:4, maxlength:4}, // 전화번호 끝 자리
            ADM_MST_EMAIL_ID:{required:false , emailId:true, maxlength:20}, // 이메일 아이디
            ADM_MST_EMAIL_DOMAIN:{required:false, emailDomain:true, maxlength:20} // 이메일 도메인
        },
        messages :{
            ADM_MST_HP1 : {required:"첫 자리는 필수선택 사항입니다."},
            ADM_MST_HP2 : {required:"중간 자리는 필수입력 사항입니다.", number:"중간 자리는 숫자만 입력해 주십시오."},
            ADM_MST_HP3 : {required:"끝 자리는 필수입력 사항입니다.", number:"끝 자리는 숫자만 입력해 주십시오."},
            ADM_MST_TEL2 : {number:"중간 자리는 숫자만 입력해 주십시오."},
            ADM_MST_TEL3 : {number:"끝 자리는 숫자만 입력해 주십시오."},
            ADM_MST_EMAIL_ID : {required:"아이디는 필수입력 사항입니다.", emailId:"아이디의 형식에 맞게 입력해 주십시오."},
            ADM_MST_EMAIL_DOMAIN : {required:"도메인은 필수입력 사항입니다.", emailDomain:"도메인의 형식에 맞게 입력해 주십시오."}
        }
    });

  
    	
    // 로딩 후 이메일 도메인이 직접입력이 아니면, readonly true
    if($("#emailDomain").val() != "")
    {
        $("#ADM_MST_EMAIL_DOMAIN").attr("readonly", "readonly");
    }
    
    // 비밀번호 변경 클릭
    $(document).on("click", "#pwdChange", function () {
        delPwTxt(); // 비밀번호 확인 초기화
        if($("#pwdChange").is(":checked")){
        	$("#passOrg").show();
            $(".pwDiv").show(); 
        }else{
        	$("#passOrg").hide();
            $(".pwDiv").hide();
        }           
    });
    
    // 비밀번호 확인 초기화
    delPwTxt = function(){
        $(".pwInputDiv").children().remove();
        $(".pwInputDiv").append('<input type="password" name="ADM_MST_PWD" id="ADM_MST_PWD" class="text" maxlength="15"/> <small style="margin-left:10px;">영문, 숫자, 특수문자 포함 8~15자 입력만 가능합니다.</small>');
    };
    
    // 도메인 변경 이벤트
    $(document).on("change", "#emailDomain", function () {
        var $obj = $("#ADM_MST_EMAIL_DOMAIN");
        var value = $(this).val();
        if(value == "") 
        {
            $obj.removeAttr("readonly");    
        }
        else
        {
            $obj.attr("readonly", "readonly");
        }
        $obj.val($(this).val());
        
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if($("#passOrg").val() != $("#ADM_MST_PWD").val()){
        	alert("비밀번호가 일치하지 않습니다.");
        	$("#ADM_MST_PWD").focus();
        	return;
        }
        if($("#pwdChange").is(":checked")){
        	if(!validatePassword($("#ADM_MST_PWD").val())){
            	alert("영문, 숫자, 특수문자 포함 8~15자 입력만 가능합니다.");
            	$("#ADM_MST_PWD").focus();
            	return;
            }	
        }
        if($frm.valid()){
            //업무구분 
            if($("#ADM_MST_TYPE").val() == ""){
                alert("[업무구분]은 필수선택 사항입니다.");
                $("#ADM_MST_TYPE").focus();
                return;
            }
            
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/info/managerInfoModify.do", "target":"_self", "method":"post"}).submit();
            }  
        }
    });
    
    function validatePassword(character) {
    	return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&~*()`+=-])(?=.*[0-9]).{8,15}$/.test(character);
    }
    
});
</script>

</body>
</html>
