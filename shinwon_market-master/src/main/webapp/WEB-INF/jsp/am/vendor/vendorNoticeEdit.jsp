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

                <h2 class="title"><span>입점사공지사항</span></h2>

                <h3 class="title"><span>상세/수정</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchScmNtsTitle" value="<c:out value="${commandMap.searchScmNtsTitle }"/>"/>
                    <input type="hidden" name="searchScmNtsContents" value="<c:out value="${commandMap.searchScmNtsContents }"/>"/>
                    <input type="hidden" name="searchScmNtsTitleAndContents" value="<c:out value="${commandMap.searchScmNtsTitleAndContents }"/>"/>
                    <input type="hidden" name="searchScmNtsUseYn" value="<c:out value="${commandMap.searchScmNtsUseYn }"/>"/>
                    <input type="hidden" name="searchScmNtsTopYn" value="<c:out value="${commandMap.searchScmNtsTopYn }"/>"/>   
                    <input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/> 
                </form>
 
                <form id="frm" name="frm" enctype="multipart/form-data">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="SCM_NTS_IDX" id="SCM_NTS_IDX" value="<c:out value="${row.SCM_NTS_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchScmNtsTitle" value="<c:out value="${commandMap.searchScmNtsTitle }"/>"/>
                    <input type="hidden" name="searchScmNtsContents" value="<c:out value="${commandMap.searchScmNtsContents }"/>"/>
                    <input type="hidden" name="searchScmNtsTitleAndContents" value="<c:out value="${commandMap.searchScmNtsTitleAndContents }"/>"/>
                    <input type="hidden" name="searchScmNtsUseYn" value="<c:out value="${commandMap.searchScmNtsUseYn }"/>"/>
                    <input type="hidden" name="searchScmNtsTopYn" value="<c:out value="${commandMap.searchScmNtsTopYn }"/>"/>   
                    <input type="hidden" name="searchScmCmnComIdx" value="<c:out value="${commandMap.searchScmCmnComIdx }"/>"/>                     
                    <input type="hidden" name="cmmFleIdx" value=""/>
                    <input type="hidden" name="SCM_NTS_GUBUN_CD" value="<c:out value="${row.SCM_NTS_GUBUN_CD }"/>"/>
                    <input type="hidden" id="SCM_NTS_TOP_YN_DB" value="<c:out value="${row.SCM_NTS_TOP_YN }"/>" />
                    <input type="hidden" id="SCM_NTS_USE_YN_DB" value="<c:out value="${row.SCM_NTS_USE_YN }"/>" />
                    <input type="hidden" id="ScmNtsTopYnCnt" value="<c:out value="${commandMap.result }"/>"/>
                    <!-- <input type="hidden" id="removeFiles" name="removeFiles" value="" />파일삭제관련변수 -->
                        
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>상태</span></th>
                                <td>
                                	<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
                                		<input type="radio" name="SCM_NTS_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.SCM_NTS_USE_YN eq 'Y' }">checked="checked"</c:if>/>
	                                    <label for="stateA">사용</label>
	                                    <input type="radio" name="SCM_NTS_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.SCM_NTS_USE_YN eq 'N' }">checked="checked"</c:if>/>
	                                    <label for="stateB">미사용</label>
                                	</c:if>
                                	<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.VENDOR_ADMINISTRATOR_IDX}">
                                		<c:out value="${row.SCM_NTS_USE_YN eq 'Y' ? '사용':'미사용' }"/>
                                	</c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>작성자</span></th>
                                <td>
                                    <c:out value="${row.SCM_NTS_REG_ID }"/>(<c:out value="${row.ADM_MST_NM }"/>)                                
                                </td>
                            </tr>
                            <tr>
                                <th><span>상단공지여부</span></th>
                                <td>
	                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
	                                	<input type="checkbox" name="SCM_NTS_TOP_YN" id="stateTopA" value="Y" class="checkbox" <c:if test="${row.SCM_NTS_TOP_YN eq 'Y' }">checked="checked"</c:if>/>
                                    	<label for="stateTopA">상단공지</label>
	                                </c:if>
	                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.VENDOR_ADMINISTRATOR_IDX}">
	                                	<c:out value="${row.SCM_NTS_TOP_YN eq 'Y' ? '상단공지' : '-' }"/>
	                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>유형 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
		                            	<select class="select" name="SCM_CMN_COM_IDX" id="SCM_CMN_COM_IDX">
		                                	<option value="">선택</option>
		                                    <c:if test="${not empty codeList }">
		                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
		                                            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${row.SCM_CMN_COM_IDX eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
		                                                <c:out value="${codeRow.CMN_COM_NM }"/>
		                                            </option>
		                                        </c:forEach>
		                                    </c:if>
		                                </select>
	                                </c:if>
	                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.VENDOR_ADMINISTRATOR_IDX}">
										<c:if test="${not empty codeList }">
	                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
	                                            <c:if test="${row.SCM_CMN_COM_IDX eq codeRow.CMN_COM_IDX}">
	                                            	<c:out value="${codeRow.CMN_COM_NM }"/>
	                                            </c:if>
	                                        </c:forEach>
										</c:if>
	                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>게시판 url </span></th>
                                <td>
                                    <c:out value="${frontDomain }"/>/pc/customer/noticeBoardView.do?SCM_NTS_IDX=<c:out value="${row.SCM_NTS_IDX}"/>&SCM_NTS_TOP_YN=<c:out value="${row.SCM_NTS_TOP_YN}"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>제목 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                	<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
										<input type="text" name="SCM_NTS_TITLE" id="SCM_NTS_TITLE" class="text" value="<c:out value="${row.SCM_NTS_TITLE }"/>" style="width:70%;" maxlength="40"/>
	                                </c:if>
	                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.VENDOR_ADMINISTRATOR_IDX}">
	                                	<c:out value="${row.SCM_NTS_TITLE }"/>
	                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>내용 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
									<!-- 슈퍼관리자만 수정 가능 -->
									<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
	                                	<textarea name="SCM_NTS_CONTENTS" id="SCM_NTS_CONTENTS" style="height: 500px;width:80%;"><c:out value="${row.SCM_NTS_CONTENTS }"/></textarea>
	                                </c:if>		
	                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.VENDOR_ADMINISTRATOR_IDX}">
	                                	<textarea name="SCM_NTS_CONTENTS" id="SCM_NTS_CONTENTS" style="height: 500px;width:80%;" disabled><c:out value="${row.SCM_NTS_CONTENTS }"/></textarea>
	                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th><span>첨부파일</span></th>
                                <td>
                                    <table id="fileView" style="width:50%;">    
                                        <c:choose>
                                            <c:when test="${not empty fileList }">                                                                                              
                                                <c:forEach items="${fileList }" var="fileRow" varStatus="i">                                                    
                                                    <tr>
                                                        <td>
                                                            <i class="icon-file"></i>
                                                            <a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
                                                                <c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
                                                            </a>
                                                            <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
                                                            	<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_<c:out value="${i.index}"/>" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
                                                            	<label for="CMM_FLE_IDX_<c:out value="${i.index}"/>">삭제</label>
                                                            </c:if>                                                                   
                                                        </td>                                                           
                                                    </tr>                                                                                                               
                                                </c:forEach>
                                                <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MD_ADMINISTRATOR_IDX || __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.MKT_ADMINISTRATOR_IDX|| __MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq '35'}">
	                                                <tr>
		                                                <td id="defaultFile">
		                                                    <input type="file" name="file" id="files[0]" class="file" />
		                                                </td>
		                                                <td>
		                                                    <input type="button" name="addFile" id="addFile" value="+"/>
		                                                    <input type="button" id="delFileData" value="파일 지우기"/>  
		                                                </td>
		                                            </tr>
	                                            </c:if>                                                  
                                            </c:when>   
                                            <c:otherwise>
                                                <tr>
                                                    <td id="defaultFile">
                                                        <input type="file" name="file" id="files[0]" class="file" />
                                                    </td>
                                                    <td>
                                                        <input type="button" name="addFile" id="addFile" value="+"/>
                                                        <input type="button" id="delFileData" value="파일 지우기"/>  
                                                    </td>
                                                </tr>                                                                                               
                                            </c:otherwise>                                                                                  
                                        </c:choose>  
                                    </table>
                                                                                                        
                                </td>
                            </tr>
                          <!--<tr>
                                <th><span>등록일</span></th>
                                <td>
                                    <c:out value="${row.ADM_MST_NM }"/>(<c:out value="${row.SCM_NTS_REG_ID }"/>), <ui:formatDate value="${row.SCM_NTS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>                                
                                </td>
                            </tr>
                            <tr>
                                <th><span>수정일</span></th>
                                <td>
                                    <c:if test="${not empty row.ADM_MST_NM_UPD }">
                                        <c:out value="${row.ADM_MST_NM_UPD }"/>(<c:out value="${row.SCM_NTS_UPD_ID }"/>), <ui:formatDate value="${row.SCM_NTS_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                                    </c:if>
                                </td>
                            </tr>-->
                            
                        </tbody>
                    </table><!-- // table -->
                </form>
                
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                    	<c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX ne Code.VENDOR_ADMINISTRATOR_IDX}">
                    	<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                    	</c:if>
                    	
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
                <!-- 파일 다운로드용 폼 -->
                <form name="fileForm" id="fileForm">
                     <input type="hidden" name="CMM_FLE_IDX" value=""/>
                     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
                     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
                </form>
                
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
<ui:editor objId="#SCM_NTS_CONTENTS"/>

<%-- <script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script> --%>

<script>    
$(function(){  
        
var SCM_NTS_GUBUN_CD = $("#frm select[name='SCM_NTS_GUBUN_CD']").val(); 
    
    // 상단공지 클릭 이벤트
    $(document).on("click", "#frm input[name='SCM_NTS_TOP_YN']", function () {
        if($(this).is(":checked"))
        {
             $.ajax({
                 async : false,
                 type : "POST",
                 data : { "SCM_NTS_GUBUN_CD": SCM_NTS_GUBUN_CD },
                 url : "<c:out value="${serverDomain}" />/am/vendor/vendorNoticeTopCountAjax.do",
                 success : function (data) 
                 {                       
                     if(data.resultYn == "N" || data.resultYn == "F")   
                     {
                         alert("상단공지 5개 모두 등록되었습니다.");
                         $("#stateTopA").prop("checked", false);
                         return;
                     }                      
                 },
                 error : function (err)
                 {
                     alert("오류가 발생하였습니다.\n[" + err.status + "]");
                 }
             });
        }
    });
    
    // 상태(미사용 → 사용) 변경 시 상단공지 사용가능 유무
    $(document).on("change", "#frm input[name='SCM_NTS_USE_YN']", function () {
        if($("#SCM_NTS_USE_YN_DB").val() == "N")
        {
            // 상태가 미사용이고, 상단공지가 체크되어 있을 때
            if($("input:checkbox[name='SCM_NTS_TOP_YN']:checked").val() == "Y")
            {
                $.ajax({
                    async : false,
                    type : "POST",
                    data : { "SCM_NTS_GUBUN_CD": SCM_NTS_GUBUN_CD },
                    url : "<c:out value="${serverDomain}" />/am/vendor/vendorNoticeTopCountAjax.do",
                    success : function (data) 
                    {
                        if(data.resultYn == "N" || data.resultYn == "F")
                        {
                            alert("상단공지 5개 모두 등록되었습니다.");
                            $("#stateB").prop("checked", true);
                            return;
                        }
                    },
                    error : function (err)
                    {
                        alert("오류가 발생하였습니다.\n[" + err.status + "]");
                    }
                });
            }            
        }
    });
    
    // 파일 행 추가 클릭 이벤트
    $("#addFile").click(function(){
        var fileNum = $("#fileView tr").children().length;
        
        $("#fileView").append('<tr><td>' + '<input type="file" class="file" name="file" id="files['+ fileNum +']"/>' + '</td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>');  
        //고정 첨부파일 행 파일지우기 비활성화
        $("#delFileData").prop("disabled", true);
        
    });
  
    // 고정 첨부 행 파일 지우기
    $("#delFileData").click(function(e){
        e.preventDefault();
        $("#defaultFile").find("input").remove();
        $("#defaultFile").append('<input type="file" name="file" id="files[0]" class="file" value="" />');
    });
    
    //파일 삭제를 위한 체크박스 클릭 이벤트
    $(".cmmFleIdx").click(function(){
        var cmmFleIdx = "";
        $("input[name='CMM_FLE_IDX']:checked").each(function(){
            cmmFleIdx = cmmFleIdx + $(this).val() + ",";
        });
        $("input[name='cmmFleIdx']").val(cmmFleIdx);        
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorNoticeList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        //var $frm = $("#frm"); 
       // if($frm.valid()){        
           
           if($("#SCM_CMN_COM_IDX").val() == "")
            {
                alert("[유형]반드시 선택해 주십시오.");
                $("#SCM_CMN_COM_IDX").focus();
                return;
            }
            
            if($.trim($("#SCM_NTS_TITLE").val()) == "")
            {
                alert("[제목]반드시 입력해 주십시오.");
                $("#SCM_NTS_TITLE").focus();
                return;
            }
            
            try { oEditors.getById["SCM_NTS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);    } catch(e){ } //editor 내용을 SCMs_NTS_CONTENTS TEXTAREA의 VALUE 값으로 만든다.
            var CONTENTS = stringUtil.getString($.trim($("#SCM_NTS_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
                 alert("[내용]반드시 입력해주십시오.");
                $("#SCM_NTS_CONTENTS").focus();
                return;
            }
            
            // 상단공지는 체크, 상태는 사용 - 상단공지 사용가능 여부 체크
            if($("inputcheckbox[name='SCM_NTS_TOP_YN']").is(":checked"))
            { 
                var flag = 0;               
                
                $.ajax({
                        async : false,
                        type : "POST",
                        data : { "SCM_NTS_GUBUN_CD": SCM_NTS_GUBUN_CD },
                        url : "<c:out value="${serverDomain}" />/am/vendor/vendorNoticeTopCountAjax.do", 
                        success : function (data) 
                        {                               
                            if(data.resultYn == "N")
                            {                               
                                alert("상단공지 5개 모두 등록되었습니다.");       
                                flag = 1;
                            }                                              
                        },
                        error : function (err)
                        {
                            alert("오류가 발생하였습니다.\n[" + err.status + "]");
                        }
                    });             
                if(flag == 1)
                {                   
                    return; 
                }   
            }
            
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorNoticeModify.do", "target":"_self", "method":"post"}).submit();
            }
        //}
    });
    
    // 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});

// 현재 행 삭제
function rowDelete(row)
{
    $(row).parent().parent().remove();
    
    // 고정 첨부파일 행 파일지우기 활성화
    if($("input[name='file']").length == 1)
    {
        $("#delFileData").prop("disabled", false);
    }
}
    
</script>

</body>
</html>
