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

                <h2 class="title"><span>로고목록</span></h2>

                <h3 class="title"><span>목록</span></h3>
 
                 <form id="dataForm" name="dataForm" method="post" enctype="multipart/form-data">
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <c:forEach items="${logoList}" var="data">
                                <tr>
                                    <th><span><c:out value="${data.CMN_COM_NM}" /></span></th>
                                    <td>
                                    	<c:if test="${!empty data.WEB_PATH}">
                                    		<img src="<c:out value="${cdnDomain}" /><c:out value="${data.WEB_PATH}" />" />
                                    	</c:if>
                                    	<p style="margin-top:20px;"></p>
                                        <input type="file" name="file" value="" class="file" />
                                        <input type="button" value="선택된 파일 삭제" class="delFileData" />
                                        <input type="hidden" name="LGO_MST_IDX" value="<c:out value="${data.LGO_MST_IDX}" />" />
                                        <input type="hidden" name="LGO_MST_TYPE" value="<c:out value="${data.CMN_COM_IDX}" />" />
                                        <input type="hidden" name="LGO_MST_SYS_NM" value="<c:out value="${data.LGO_MST_SYS_NM}" />" />
                                        <p><small>* 업로드 가능 파일 : jpg, png</small></p>
                                        <p><small>* 업로드 용량 : 1MB</small></p>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table><!-- // table -->
                </form>
                    
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-right">
                        <a href="javascript:goRegist();" class="button button-b"><span>저장</span></a>
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

<script>    
$(function(){
    // 선택한 파일 삭제
    $(".delFileData").on("click", function(e){
        e.preventDefault();
        $(this).parent().parent().find("input[name=file]").val("");
    });

    // 등록
    goRegist = function(){
        // 파일 확장자 체크
        var filePath = "";
        var fileExt = "";
        var blnFileExt = true;
        
        var uploadTargetFileCnt = 0;

        $.each($("input[name=file]"), function(idx, obj){
            filePath = $(obj).val();
            
            if(filePath != ""){
                fileExt = filePath.substring(filePath.lastIndexOf(".") + 1, filePath.length);
                if(fileExt.toLowerCase() != "jpg" && fileExt.toLowerCase() != "png"){
                    alert("jpg, png 파일만 업로드 가능합니다.");
                    $(obj).focus();
                    blnFileExt = false;
                }

                uploadTargetFileCnt = uploadTargetFileCnt + 1;
            }
            
            if(!blnFileExt){
                return false;
            }
        });

        if(uploadTargetFileCnt == 0){
            alert("등록할 로고파일이 없습니다.");
            return;
        }

        // 등록처리
        if(blnFileExt){
            if(confirm("등록하시겠습니까?")){
                $("#dataForm").attr({"action" : "<c:out value="${serverDomain}" />/am/logo/logoRegist.do", "target" : "_self", "method" : "post"}).submit();
            }
        }
    };
});
</script>

</body>
</html>
