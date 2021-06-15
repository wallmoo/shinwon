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

                <h2 class="title"><span>관리자계정관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                
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
 
                <form id="frm" name="frm" >
                    <input type="hidden" id="idCheckYn" value="" /> 
                    <input type="hidden" id="checkId" value="" />
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>아이디 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="ADM_MST_ID" id="ADM_MST_ID" class="text" maxlength="10" placeholder="아이디 입력"/>
                                    <a href="#none" id="idCheck" class="button button-c small"><span>중복확인</span></a>
                                   <!-- <small style="margin-left:10px;">4~10자의 영문, 숫자 사용</small> --> 
                                </td>
                            </tr>  
                            <tr>
                                <th><span>이름 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="ADM_MST_NM" id="AMD_MST_NM" class="text" maxlength="6" placeholder="이름입력"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>비밀번호 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="password" id="fakePw" class="text"/>
                                    <input type="password" name="ADM_MST_PWD" id="ADM_MST_PWD" class="text" maxlength="15" placeholder="비밀번호 입력"/>
                                    <small style="margin-left:10px;">영문, 숫자, 특수문자 포함 8~15자 입력</small> 
                                </td>
                            </tr>
                            <tr>
                                <th><span>관리자권한 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="AUT_MST_IDX" id="AUT_MST_IDX">
                                        <option value="">선택</option>
                                        <c:if test="${not empty authList }">
                                            <c:forEach var="authRow" items="${authList }" varStatus="i">
                                                <option value="<c:out value="${authRow.AUT_MST_IDX }"/>"><c:out value="${authRow.AUT_MST_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <select class="select" name="ADM_MST_SUB_IDX" id="ADM_MST_SUB_IDX">
                                        <option value="">입점업체선택</option>
                                        <c:if test="${not empty vendorList }">
                                            <c:forEach var="vendorRow" items="${vendorList }" varStatus="i">
                                                <option value="<c:out value="${vendorRow.VDR_MST_IDX }"/>"><c:out value="${vendorRow.VDR_MST_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <select class="select" name="ADM_MST_D_SUB_IDX"  id="ADM_MST_D_SUB_IDX">
                                    	<option value="">매장선택</option>
                                    </select>
                                </td>  
                            </tr>
                            <tr class="erpNo">
                                <th><span>사원번호 </span></th>
                                <td>
                                    <input type="text" name="ADM_MST_ERP_NO" id="ADM_MST_ERP_NO" class="text large number" maxlength="8" placeholder="사원번호 입력"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>휴대폰 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="ADM_MST_HP1" id="ADM_MST_HP1">
                                        <option value="">선택</option>
                                        <c:if test="${not empty codes.HP_CODE }">
                                            <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
                                                <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <input type="text" name="ADM_MST_HP2" id="ADM_MST_HP2" class="text number" maxlength="4" placeholder="번호입력"/> - 
                                    <input type="text" name="ADM_MST_HP3" id="ADM_MST_HP3" class="text number" maxlength="4" placeholder="번호입력"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>전화번호 </span></th>
                                <td>
                                    <select class="select" name="ADM_MST_TEL1" id="ADM_MST_TEL1">
                                        <option value="">선택</option>
                                        <c:if test="${not empty codes.TEL_CODE }">
                                            <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
                                                <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <input type="text" name="ADM_MST_TEL2" id="ADM_MST_TEL2" class="text number" maxlength="4" placeholder=번호입력"/> - 
                                    <input type="text" name="ADM_MST_TEL3" id="ADM_MST_TEL3" class="text number" maxlength="4" placeholder="번호입력"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>이메일</span></th>
                                <td>
                                    <input type="text" name="ADM_MST_EMAIL_ID" id="ADM_MST_EMAIL_ID" class="text" maxlength="15"/ placeholder="이메일 입력"> @
                                    <input type="text" name="ADM_MST_EMAIL_DOMAIN" id="ADM_MST_EMAIL_DOMAIN" class="text" maxlength="15" placeholder="직접입력"/>
                                    <select class="select" name="emailDomain" id="emailDomain">
                                        <option value="">직접입력</option>
                                        <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
                                                <option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>  
                            </tr>
                            <tr>
                                <th><span>업무구분 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="ADM_MST_TYPE" id="ADM_MST_TYPE">
                                        <option value="">선택</option>
                                        <c:if test="${not empty codes.WORK_DIVISION_CODE }">
                                            <c:forEach var="workRow" items="${codes.WORK_DIVISION_CODE }" varStatus="i">
                                                <option value="<c:out value="${workRow.CMN_COM_IDX }"/>"><c:out value="${workRow.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>  
                                <th><span>사용설정<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" id="stateA" name="ADM_MST_STATE" value="Y" class="radio" checked="checked"/>
                                    <label for="stateA">사용</label>
                                    <input type="radio" id="stateB" name="ADM_MST_STATE" value="N" class="radio" />
                                    <label for="stateB">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
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
        
	setTimeout(function(){
        $("#fakePw").hide();
    },100);
    
    // 입점업체 리스트 숨김
    $("#ADM_MST_SUB_IDX").hide();
    $('#ADM_MST_D_SUB_IDX').hide();
    
    // 권한 변경시
    $(document).on("change", "select[name=AUT_MST_IDX]", function(){
    	var curVal = $(this).val(); 
        if(curVal == "${Code.VENDOR_ADMINISTRATOR_IDX}"){    // 입점업체관리자인 경우 입점업체 선택 있음
            $("#ADM_MST_SUB_IDX").show();
            $('#ADM_MST_D_SUB_IDX').hide();
            $(".erpNo").hide(); // 사번 숨김
        } else if (curVal == "${Code.VENDOR_STORE_ADMINISTRATOR_IDX}") {
        	$("#ADM_MST_SUB_IDX").show();
        	$('#ADM_MST_D_SUB_IDX').show();
        	$(".erpNo").hide(); // 사번 숨김
        }
        else{
            $("#ADM_MST_SUB_IDX").hide();
            $('#ADM_MST_D_SUB_IDX').hide();
            $(".erpNo").show();
        }
    });
    
    // 폼체크
    $("#frm").validate({
        rules: {
            ADM_MST_ID:{required:true, engOrNum:true, minlength:4, maxlength:10 }, // 관리자 아이디
            ADM_MST_NM:{required:true}, // 관리자 명
            AUT_MST_IDX:{required:true}, // 권한 Index
            ADM_MST_HP1:{required:true, number:true}, // 핸드폰 번호 앞 자리
            ADM_MST_HP2:{required:true, number:true, minlength:3, maxlength:4}, // 핸드폰 번호 중간 자리
            ADM_MST_HP3:{required:true, number:true, minlength:4, maxlength:4}, // 핸드폰 번호 끝 자리
            ADM_MST_TEL1:{required:false}, // 전화번호 앞 자리
            ADM_MST_TEL2:{required:false, number:true, minlength:3, maxlength:4}, // 전화번호 중간 자리
            ADM_MST_TEL3:{required:false, number:true, minlength:4, maxlength:4}, // 전화번호 끝 자리
            ADM_MST_EMAIL_ID:{required:false , emailId:true, maxlength:20}, // 이메일 아이디
            ADM_MST_EMAIL_DOMAIN:{required:false, emailDomain:true, maxlength:20}, // 이메일 도메인
            ADM_MST_ERP_NO:{required:false}  // 사번
        },
        messages :{
            ADM_MST_ID : {engOrNum : "4~10자의 영문, 숫자만 사용할 수 있습니다."},
            ADM_MST_HP1 : {required:"첫 자리는 필수선택 사항입니다."},
            ADM_MST_HP2 : {required:"중간 자리는 필수입력 사항입니다.", number:"중간 자리는 숫자만 입력해 주십시오."},
            ADM_MST_HP3 : {required:"끝 자리는 필수입력 사항입니다.", number:"끝 자리는 숫자만 입력해 주십시오."},
            ADM_MST_TEL2 : {number:"중간 자리는 숫자만 입력해 주십시오."},
            ADM_MST_TEL3 : {number:"끝 자리는 숫자만 입력해 주십시오."},
            ADM_MST_EMAIL_ID : {required:"아이디는 필수입력 사항입니다.", emailId:"아이디의 형식에 맞게 입력해 주십시오."},
            ADM_MST_EMAIL_DOMAIN : {required:"도메인은 필수입력 사항입니다.", emailDomain:"도메인의 형식에 맞게 입력해 주십시오."},
            ADM_MST_ERP_NO:{required:"필수입력 사항입니다."}
        }
    });
    
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
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 아이디 중복 체크
    $(document).on("click", "#idCheck", function () {
        var $obj = $("#ADM_MST_ID");
        var value = $obj.val();
        
        $("#checkId").val($obj.val());  // 중복체크한 id 
        
        if(value == "")
        {
            alert("[아이디]는 필수입력 사항입니다.");
            $obj.focus();
            return;
        }
        else
        {
            var pattern = /^[0-9a-zA-Z]{4,10}$/;
            if(!pattern.test(value))
            {
                alert("4~10자의 영문, 숫자만 사용할 수 있습니다.");
                $obj.focus();
                return;
            }
            else
            {
                $.ajax({
                    async : false,
                    type : "POST",
                    data : {"ADM_MST_ID":$("#ADM_MST_ID").val()},
                    url : "<c:out value="${serverDomain}" />/am/site/basicManagerIdCheckAjax.do",
                    success : function (data) {
                        if(data.successYn == "Y")
                        {
                            if(data.resultYn == "N")
                            {
                                alert("이미 사용중인 아이디 입니다.");
                            }
                            else
                            {
                                alert("사용가능한 아이디 입니다.");
                            }
                            
                            $obj.focus();
                            $("#idCheckYn").val(data.resultYn);
                            return;
                        }
                        else
                        {
                            alert("데이터 전송중 데이터가 누락 되었습니다./n다시 시도해 주십시오.");
                            return;
                        }
                    },
                    error : function () {
                        alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                    }
                });
            }
        }
    });
    
    function validatePassword(character) {
    	return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&~*()`+=-])(?=.*[0-9]).{8,15}$/.test(character);
    }
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if($frm.valid()){
            
        	if(!validatePassword($("#ADM_MST_PWD").val())){
            	alert("영문, 숫자, 특수문자 포함 8~15자 입력만 가능합니다.");
            	$("#ADM_MST_PWD").focus();
            	return;
            }
        	
            // 권한이 입점업체일 경우 상호/법인명을 선택하지 않은 경우
            if($("#AUT_MST_IDX").val() == "${Code.VENDOR_ADMINISTRATOR_IDX}"){
                if($("#ADM_MST_SUB_IDX").val() == ""){
                    alert("[입점업체]를 선택해 주십시오.");
                    $("#ADM_MST_SUB_IDX").focus();
                    return;
                }
            }
            //업무구분 
            if($("#ADM_MST_TYPE").val() == ""){
                alert("[업무구분]은 필수선택 사항입니다.");
                $("#ADM_MST_TYPE").focus();
                return;
            }
            
            var $chkObj = $("#idCheckYn");
            var $obj = $("#idCheck");
            if($chkObj.val() == "Y")
            {
                if($("#checkId").val() == $("#ADM_MST_ID").val()){
                    if (confirm( "저장 하시겠습니까?")) {
                        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/basicManagerRegist.do", "target":"_self", "method":"post"}).submit();
                    }                   
                }   
                else{
                    alert("아이디 중복을 확인해 주십시오.");
                    $obj.focus();
                    return;
                }
            }
            else if($chkObj.val() == "N")
            {
                if($("#checkId").val() == $("#ADM_MST_ID").val()){
                alert("이미 사용중인 아이디 입니다.");
                $obj.focus();
                return;
                }
                else{
                    alert("아이디 중복을 확인해 주십시오.");
                    $obj.focus();
                    return; 
                }
            }
            else
            {
                alert("아이디 중복을 확인해 주십시오.");
                $obj.focus();
                return;
            }
        }
    });
    
});
</script>

</body>
</html>
