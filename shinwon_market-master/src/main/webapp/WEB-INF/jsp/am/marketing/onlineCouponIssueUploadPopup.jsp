<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

	<div class="modal"><!-- modal -->
    
        <div class="modal-wrapper"><!-- modal-wrapper -->
        
            <div class="modal-inner"><!-- modal-inner -->
            
            <h3 class="title"><span>파일 등록</span></h3>
            
            <p><span><i class="require"><em>필수입력</em></i>업로드할 파일을 등록해 주세요.</span></p>
            
                <form name="excelForm" id="excelForm" enctype="multipart/form-data">
	                <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
	                <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                        	<col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th>파일</th>
                                <td><input type="file" name="file" id="file" class="file" /></td>
                            </tr>                            
                        </tbody>
                    </table><!-- // table -->

                    <div class="text-right">
                    	<a href="javascript:;" class="sampleDownload button button-b" data-file_name="onlineCoupon.xls">샘플파일 다운로드</a>
                        <a href="#none" id="goEdit" class="button button-b"><span>등록</span></a>
                    </div>
                </form>
                
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>

<!-- 파일 다운로드용 폼 -->
<form name="fileForm" id="fileForm">
     <input type="hidden" name="fileName" value="" />
</form>

<script type="text/javascript">
$(document).ready(function () {
    $("#excelForm").validate({
        rules : {
            file:{required:true}
        }
    });
    
    $(document).on("click", "#goEdit", function () {
        var $frm = $("#excelForm");
        if($frm.valid())
        {
            var value = $frm.find("#file").val();
            var ext = value.slice(value.indexOf(".") + 1).toLowerCase();
            if("xls" != ext)
            {
                alert(".xls 파일만 업로드 가능합니다.\n파일확장자를 확인해 주십시오.");
                return;
            }
            else
            {
            	
            	var data = new FormData();
                $.each($('#file')[0].files, function(i, file) {          
                    data.append('file', file);
                });
				$.ajax
                ({
                    async : false,
                    type : "POST",
                    data : data,
                    processData: false,
                    contentType: false,
                    url : "<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueUploadPopupAjax.do",
                    success : function (data) 
                    { 
                        alert("업로드 되었습니다.");
                        var params = new Array();
                        var obj;
                        if(data.list.length > 0){
                        	
                        	$.each(data.list, function(index,item)
                    		{
                            	
                                var name = item.MEMBER_NAME;
                                var id = item.MEMBER_ID;
                                
                                obj = new Object();
                         		obj.MEM_MST_MEM_NM = name;
                         		obj.MEM_MST_MEM_ID = id;    
                                 
                         		params.push(obj);
                            });
                        	
                        	if(	window.opener.fnResultMember(params) )    	
                        		self.close();
                        }
                        
                    },
                    error : function (err)
                    {
                        alert("오류가 발생하였습니다.\n[" + err.status + "]");
                    }
                });
            	
            	
                //$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointMemberUpload.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 파일 다운로드
    $(document).on("click", ".sampleDownload", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='fileName']").val($this.data("file_name"));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/sampleFileDownload.do", "target":"_self", "method":"post"}).submit();
    });    
});
</script>
</body>
</html>