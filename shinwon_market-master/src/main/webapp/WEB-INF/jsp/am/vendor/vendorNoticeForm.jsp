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

                <h3 class="title"><span>등록</span></h3>
                
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
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>상태</span></th>
                                <td>
                                    <input type="radio" name="SCM_NTS_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
                                    <label for="stateA">사용</label>
                                    <input type="radio" name="SCM_NTS_USE_YN" id="stateB" value="N" class="radio" />
                                    <label for="stateB">미사용</label>
                                </td>
                            </tr>
                            <tr>
                                <th><span>상단공지여부</span></th>
                                <td>
                                    <input type="checkbox" name="SCM_NTS_TOP_YN" id="stateTopA" value="Y" class="checkbox"/>
                                    <label for="stateTopA">상단공지</label>
                                    <!-- <input type="radio" name="BRD_NTS_TOP_YN" id="stateTopA" value="Y" class="radio" checked="checked"/>
                                    <label for="stateTopA">사용</label>
                                    <input type="radio" name="BRD_NTS_TOP_YN" id="stateTopB" value="N" class="radio" />
                                    <label for="stateTopB">미사용</label> -->
                                </td>
                            </tr>
                            <tr>
                                <th><span>유형 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="SCM_CMN_COM_IDX" id="SCM_CMN_COM_IDX">
                                        <option value="">선택</option>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                                <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
                                                    <c:out value="${codeRow.CMN_COM_NM }"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>제목 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="SCM_NTS_TITLE" id="SCM_NTS_TITLE" class="text" placeholder="최대 40자까지 입력하실 수 있습니다." style="width:70%;" maxlength="40"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>내용 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <textarea name="SCM_NTS_CONTENTS" id="SCM_NTS_CONTENTS" style="height: 500px;width:80%;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>첨부파일</span></th>
                                <td>
                                    <table id="fileView" style="width:50%;">
                                    <tr>                                        
                                        <td id="defaultFile">                                           
                                            <input type="file" name="file" id="files[0]" class="file" value="" />                                                                                                                                                                   
                                        </td>   
                                        <td>
                                            <input type="button" name="addFile" id="addFile" value="+"/>
                                            <input type="button" id="delFileData" value="파일 지우기"/>
                                        </td>
                                    </tr>                                                                                                                                                                               
                                    </table>                                                                                                    
                                    <small class="desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf</small>
                                    <small class="desc">* 업로드 용량 : 20MB</small>   
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>
                
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
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
<ui:editor objId="#SCM_NTS_CONTENTS"/>

<%-- <script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script> --%>

<script>    
$(function(){  
        
    var SCM_NTS_GUBUN_CD = "";   
    
    // 업체 선택
    $(document).on("change", "select[name='SCM_NTS_GUBUN_CD']", function () 
    {
        SCM_NTS_GUBUN_CD = $(this).val();
        $("#frm input[name='SCM_NTS_TOP_YN']").prop("checked", false);
    });
    
    // 상단공지 클릭 이벤트
    $(document).on("click", "#frm input[name='SCM_NTS_TOP_YN']", function () 
    {  
        if(this.id == "stateTopA")
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
    
    // 파일 행 추가 클릭 이벤트
    $("#addFile").click(function(){
        var fileNum = $("#fileView tr").children().length;
        
        $("#fileView").append('<tr><td>' + '<input type="file" class="file" name="file" id="files['+ fileNum +']"/>' + '</td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>');
        // 고정 첨부파일 행 파일지우기 비활성화
        $("#delFileData").prop("disabled", true);
        
    });
    
    // 고정 첨부 행 파일 지우기
    $("#delFileData").click(function(e){
        e.preventDefault();     
        $("#defaultFile").find("input").remove();
        $("#defaultFile").append('<input type="file" name="file" id="files[0]" class="file" value="" />');
    });

    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorNoticeList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        //var $frm = $("#frm"); 
        //if($frm.valid()){ file input disabled 풀려서 같이 사용 못함.. 그냥 체크하는 걸로.
            
            if($("#SCM_CMN_COM_IDX").val() == "")
            {
                alert("[구분]반드시 선택해 주십시오.");
                $("#SCM_CMN_COM_IDX").focus();
                return;
            }
            
            if($.trim($("#SCM_NTS_TITLE").val()) == "")
            {
                alert("[제목]반드시 입력해 주십시오.");
                $("#SCM_NTS_TITLE").focus();
                return;
            }
            
            try { oEditors.getById["SCM_NTS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);    } catch(e){ } //editor 내용을 BRD_NTS_CONTENTS TEXTAREA의 VALUE 값으로 만든다.
            var CONTENTS = stringUtil.getString($.trim($("#SCM_NTS_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
                 alert("[내용]반드시 입력해주십시오.");
                $("#SCM_NTS_CONTENTS").focus();
                return;
            }
        
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorNoticeRegist.do", "target":"_self", "method":"post"}).submit();
            }
        //}
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
